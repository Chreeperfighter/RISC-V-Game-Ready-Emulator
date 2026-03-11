# Syscall Specification

Custom semihosting extensions for the RV32 emulator.

---

## Design Philosophy

The emulator owns all hardware configuration — display resolution, pixel format, timing. Guest programs must never hardcode these. Instead:

1. Guest queries the emulator on startup (`SYS_DISPLAY_INFO`, etc.)
2. Guest allocates buffers and adapts its rendering to the reported values
3. Guest drives the render loop by calling `SYS_SHOW_FRAMEBUFFER` to flip

This keeps guest programs portable across different emulator configurations.

---

## Calling Convention

Semihosting is triggered by the fixed 3-instruction sequence:

```asm
slli zero, zero, 0x1f
ebreak
srai zero, zero, 0x7
```

| Register | Role |
|----------|------|
| `a0` | **In:** syscall number &nbsp; **Out:** return value |
| `a1` | **In:** parameter — pointer to a data block, or a direct scalar value |

Multi-field parameters are a packed struct of `uint32_t` fields in guest RAM, in declaration order, 4 bytes each, little-endian.

### C wrapper

```c
// Use when a1 is a pointer to a data block
static inline int32_t semihost(uint32_t nr, void* param) {
    register int32_t a0 asm("a0");
    register void*   a1 asm("a1") = param;
    asm volatile(
        "li   a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0) : "r"(a1), "i"(nr) : "memory"
    );
    return a0;
}

// Use when a1 is a direct scalar (e.g. SYS_IS_KEY_DOWN)
static inline int32_t semihost_val(uint32_t nr, uint32_t val) {
    register int32_t  a0 asm("a0");
    register uint32_t a1 asm("a1") = val;
    asm volatile(
        "li   a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0) : "r"(a1), "i"(nr) : "memory"
    );
    return a0;
}
```

**Return values** follow a consistent convention unless noted:
- `0` — success
- `-1` — failure (check `SYS_ERRNO` for details)

---

## Custom Syscalls — Range `0x100`–`0x1FF`

### Display

#### `SYS_DISPLAY_INFO` — `0x100`

Query the display configuration. Call this once at startup. The guest must validate the reported format against the formats it supports — pixel format conversion in the guest is not feasible. If the format is unsupported, print an error and exit.

```c
// Recommended startup pattern
struct DisplayInfo info;
semihost(SYS_DISPLAY_INFO, &info);
if (info.format != FORMAT_ARGB8888) {
    fprintf(stderr, "fatal: unsupported display format %u, expected ARGB8888\n", info.format);
    exit(1);
}
```

**a1** → pointer to output struct (written by host):

```c
struct DisplayInfo {
    uint32_t width;   // pixels
    uint32_t height;  // pixels
    uint32_t format;  // see format table below
    uint32_t bpp;     // bits per pixel (e.g. 32 for ARGB8888, 16 for RGB565)
};
```

| `format` | Name | Description |
|----------|------|-------------|
| `0` | `ARGB8888` | 32 bpp — `[A][R][G][B]` in memory order |
| `1` | `RGB565`   | 16 bpp — `RRRRRGGGGGGBBBBB` little-endian |
| `2` | `RGB888`   | 24 bpp — `[R][G][B]` in memory order, no alpha, 3-byte stride |
| `3` | `RGBA8888` | 32 bpp — `[R][G][B][A]` in memory order |

**a0** ← `0` on success, `-1` if address is outside RAM.

---

#### `SYS_SHOW_FRAMEBUFFER` — `0x101`

Flip the guest's completed framebuffer to the host display. Call once per rendered frame.

**a1** = start address (in guest RAM) of the pixel data.
Buffer size must be exactly `width × height × bytes_per_px` bytes.

**a0** ← not meaningful; validate the address before calling.

---

### Time

#### `SYS_GET_US` — `0x102`

Get host time in microseconds since emulator start. Wraps after ~71 minutes (32-bit counter).

**a1** → pointer to output struct:

```c
struct {
    uint32_t time_us;
};
```

**a0** ← `0` on success, `-1` if address is outside RAM.

---

#### `SYS_SLEEP_US` — `0x103`

Sleep the CPU thread for the given duration.

**a1** → pointer to input struct:

```c
struct {
    uint32_t duration_us;
};
```

**a0** ← `0` on success, `-1` if address is outside RAM.

---

### Keyboard

#### `SYS_KEY_AVAILABLE` — `0x104`

Check if a key event is waiting in the queue without consuming it.

**a1** = `0` (unused).

**a0** ← `1` if queue is non-empty, `0` if empty.

---

#### `SYS_GET_KEY` — `0x105`

Pop one key event from the queue. Call `SYS_KEY_AVAILABLE` first; behaviour is undefined on an empty queue.

**a1** = `0` (unused).

**a0** ← SDL scancode of the dequeued key event.

---

#### `SYS_IS_KEY_DOWN` — `0x106`

Query real-time key state (not queue-based — useful for held keys in game loops).

**a1** = SDL scancode directly (not a pointer).

**a0** ← `1` if held, `0` if not.

---

### Mouse

#### `SYS_GET_MOUSE_POS` — `0x107`

Get the current cursor position in window pixels.

**a1** → pointer to output struct:

```c
struct {
    uint32_t x;
    uint32_t y;
};
```

**a0** ← not set.

---

#### `SYS_IS_MOUSE_BUTTON_DOWN` — `0x108`

Query whether a mouse button is currently pressed.

**a1** → pointer to input struct:

```c
struct {
    uint32_t button;    // 0 = left, 1 = middle, 2 = right
};
```

**a0** ← `1` if pressed, `0` if not, `-1` if button index > 2.

---

## ARM Semihosting — File I/O

Standard ARM semihosting codes for the C library. All guest file paths are resolved relative to `[storage].path` in `config.toml` (sandboxed — path traversal rejected).

### `SYS_OPEN` — `0x01`

**a1** → pointer to:

```c
struct {
    uint32_t path_ptr;      // pointer to null-terminated path
    uint32_t mode;          // see table below
    uint32_t path_length;   // length of path, excluding null terminator
};
```

| Mode | C equivalent |   | Mode | C equivalent |
|------|-------------|---|------|-------------|
| 0 | `"r"` | | 6 | `"w+"` |
| 1 | `"rb"` | | 7 | `"w+b"` |
| 2 | `"r+"` | | 8 | `"a"` |
| 3 | `"r+b"` | | 9 | `"ab"` |
| 4 | `"w"` | | 10 | `"a+"` |
| 5 | `"wb"` | | 11 | `"a+b"` |

**a0** ← nonzero file handle on success, `-1` on failure.

---

### `SYS_CLOSE` — `0x02`

**a1** → `{ uint32_t handle; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_WRITE0` — `0x04`

Write a null-terminated string to host stdout.

**a1** = pointer to the string.

---

### `SYS_WRITE` — `0x05`

**a1** → pointer to:

```c
struct {
    uint32_t handle;
    uint32_t buffer_ptr;
    uint32_t length;
};
```

**a0** ← `0` on success, number of bytes not written on failure.

---

### `SYS_READ` — `0x06`

**a1** → pointer to:

```c
struct {
    uint32_t handle;
    uint32_t buffer_ptr;
    uint32_t count;
};
```

**a0** ← bytes not filled (`count - bytes_read`). `0` = full read, equals `count` = EOF.

---

### `SYS_SEEK` — `0x0A`

Seek to absolute byte offset from start of file.

**a1** → `{ uint32_t handle; uint32_t abs_position; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_FLEN` — `0x0C`

**a1** → `{ uint32_t handle; }`

**a0** ← file length in bytes, or `-1` on failure.

---

### `SYS_ISTTY` — `0x09`

**a1** → `{ uint32_t handle; }`

**a0** ← `1` if interactive device, `0` if regular file.

---

### `SYS_ERRNO` — `0x13`

**a1** = `0`.

**a0** ← current host `errno`.

---

### `SYS_EXIT` — `0x18`

**a1** = exit code. Stops the emulator.

---

### `SYS_EXIT_EXTENDED` — `0x20`

**a1** → pointer to:

```c
struct {
    uint32_t reason_code;   // 0x20026 = normal application exit
    uint32_t subcode;       // value passed to exit()
};
```

Stops the emulator.