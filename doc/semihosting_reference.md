# Semihosting Reference

Complete reference for all semihosting syscalls implemented by the RV32 emulator.

---

## Calling Convention

Semihosting is triggered by the following 3-instruction sequence:

```asm
slli zero, zero, 0x1f
ebreak
srai zero, zero, 0x7
```

| Register | Direction | Role |
|----------|-----------|------|
| `a0` | In | Syscall number |
| `a1` | In | Parameter — pointer to a data block in guest RAM, or a direct scalar |
| `a0` | Out | Return value |

**Parameter blocks** are packed structs of `uint32_t` fields in guest RAM, in declaration order, 4 bytes each, little-endian. The C wrapper in `rv32_syscalls.h` casts the struct pointer to `uint32_t`:

```c
// Pointer to parameter block
static int32_t semihost(uint32_t nr, uint32_t param) {
    register int32_t  a0 asm("a0");
    register uint32_t a1 asm("a1") = param;
    asm volatile(
        "mv   a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "r"(nr)
        : "memory"
    );
    return a0;
}
```

**Return value convention** (unless stated otherwise):
- `0` — success
- `-1` — failure; call `SYS_ERRNO` (0x13) to retrieve the error code

---

## Custom Syscalls — Range `0x100`–`0x112`

### `SYS_DISPLAY_INFO` — `0x100`

Query display configuration. Call once at startup before allocating the framebuffer.

**a1** → pointer to output struct (written by host):

```c
struct DisplayInfo {
    uint32_t width;   // framebuffer width in pixels
    uint32_t height;  // framebuffer height in pixels
    uint32_t format;  // see table below
    uint32_t bpp;     // bits per pixel
};
```

| `format` | Name | Description |
|----------|------|-------------|
| `0` | `ARGB8888` | 32 bpp — `[A][R][G][B]` byte order |
| `1` | `RGB565` | 16 bpp — `RRRRRGGGGGGBBBBB` little-endian |
| `2` | `RGB888` | 24 bpp — `[R][G][B]` byte order, no alpha |
| `3` | `RGBA8888` | 32 bpp — `[R][G][B][A]` byte order |

**a0** ← `0` on success, `-1` if `a1` is outside guest RAM.

---

### `SYS_SHOW_FRAMEBUFFER` — `0x101`

Flip the completed framebuffer to the host display. Call once per rendered frame.

**a1** = start address (in guest RAM) of pixel data. Buffer must be exactly `width × height × bpp/8` bytes.

**a0** ← not meaningful.

---

### `SYS_GET_US` — `0x102`

Get host time in microseconds since emulator start. Wraps after ~71 minutes (32-bit counter).

**a1** → pointer to output struct:

```c
struct {
    uint32_t time_us;
};
```

**a0** ← `0` on success, `-1` if address is outside guest RAM.

---

### `SYS_SLEEP_US` — `0x103`

Sleep the CPU thread for the given duration. Returns after at least `duration_us` microseconds.

**a1** → pointer to input struct:

```c
struct {
    uint32_t duration_us;
};
```

**a0** ← `0` on success, `-1` if address is outside guest RAM.

---

### `SYS_KEY_AVAILABLE` — `0x104`

Check if a key event is waiting in the queue without consuming it.

**a1** = `0` (unused).

**a0** ← `1` if queue is non-empty, `0` if empty.

---

### `SYS_GET_KEY` — `0x105`

Pop one key event from the queue. Check `SYS_KEY_AVAILABLE` first; behaviour is undefined on an empty queue.

**a1** = `0` (unused).

**a0** ← SDL scancode of the dequeued key event. Bit 15 set = key-up event; bit 15 clear = key-down event.

```c
uint16_t raw = (uint16_t)semihost(SYS_GET_KEY, 0);
bool key_up = (raw & 0x8000) != 0;
SDL_Scancode sc = (SDL_Scancode)(raw & 0x7FFF);
```

---

### `SYS_IS_KEY_DOWN` — `0x106`

Query real-time key state (not queue-based). Useful for held keys in game loops.

**a1** = SDL scancode directly (scalar, not a pointer).

**a0** ← `1` if key is currently held, `0` if not.

---

### `SYS_GET_MOUSE_POS` — `0x107`

Get the current cursor position, scaled to framebuffer coordinates.

**a1** → pointer to output struct:

```c
struct MousePos {
    uint32_t x;   // 0 .. width-1
    uint32_t y;   // 0 .. height-1
};
```

**a0** ← not set.

---

### `SYS_IS_MOUSE_BUTTON_DOWN` — `0x108`

Query whether a mouse button is currently pressed.

**a1** → pointer to input struct:

```c
struct {
    uint32_t button;   // 0 = left, 1 = middle, 2 = right
};
```

**a0** ← `1` if pressed, `0` if not, `-1` if button index is out of range.

---

### `SYS_OPENDIR` — `0x109`

Open a directory for iteration. Path is resolved relative to `[storage].path`.

**a1** → pointer to input struct:

```c
struct {
    uint32_t path_ptr;      // pointer to null-terminated path string in guest RAM
    uint32_t path_length;   // length of path, excluding null terminator
};
```

**a0** ← nonzero directory handle on success, `-1` on failure. Sets `errno` to `ENOENT` or `ENOTDIR` on failure.

---

### `SYS_READDIR` — `0x10A`

Read the next entry from an open directory.

**a1** → pointer to input/output struct:

```c
struct {
    uint32_t handle;       // directory handle from SYS_OPENDIR
    uint32_t name_ptr;     // pointer to guest buffer for entry name (256 bytes)
    uint32_t d_type_ptr;   // pointer to uint32_t for entry type
};
```

`d_type` values: `4` = directory (`DT_DIR`), `8` = regular file (`DT_REG`).

**a0** ← `0` on success (entry written), `1` at end of directory, `-1` on error.

---

### `SYS_CLOSEDIR` — `0x10B`

Close a directory handle.

**a1** → `{ uint32_t handle; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_MKDIR` — `0x10C`

Create a directory. Path resolved relative to `[storage].path`.

**a1** → pointer to input struct:

```c
struct {
    uint32_t path_ptr;
    uint32_t path_length;
};
```

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_REWINDDIR` — `0x10D`

Reset a directory stream to the beginning.

**a1** → `{ uint32_t handle; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_AUDIO_INIT` — `0x10E`

Open the SDL2 audio device. Call once before submitting audio.

**a1** → pointer to input struct:

```c
struct {
    uint32_t sample_rate;      // e.g. 44100, 48000
    uint32_t channels;         // 1 = mono, 2 = stereo
    uint32_t bits_per_sample;  // 8 or 16
};
```

**a0** ← `0` on success, `-1` if audio device failed to open.

---

### `SYS_AUDIO_SUBMIT` — `0x10F`

Submit a PCM audio buffer to the host audio queue. Applies backpressure: blocks briefly if the queue is too full.

**a1** → pointer to input struct:

```c
struct {
    uint32_t buffer_ptr;   // pointer to PCM data in guest RAM
    uint32_t length;       // number of bytes
};
```

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_AUDIO_GET_QUEUED_BYTES` — `0x110`

Query how many bytes are currently queued in the SDL audio device.

**a1** = `0` (unused).

**a0** ← number of bytes queued (unsigned).

---

### `SYS_IS_CONTROLLER_BUTTON_DOWN` — `0x111`

Query a gamepad button state. Up to 4 controllers supported (slots 0–3).

**a1** → pointer to input struct:

```c
struct {
    uint32_t id;      // controller slot: 0–3
    uint32_t button;  // SDL_GameControllerButton value
};
```

**a0** ← `1` if pressed, `0` if not, `-1` if controller slot is invalid / not connected.

Common `SDL_GameControllerButton` values:

| Value | Button |
|-------|--------|
| 0 | A |
| 1 | B |
| 2 | X |
| 3 | Y |
| 4 | Back |
| 6 | Start |
| 11 | D-Pad Up |
| 12 | D-Pad Down |
| 13 | D-Pad Left |
| 14 | D-Pad Right |

---

### `SYS_GET_CONTROLLER_AXIS` — `0x112`

Query a gamepad analog axis. Up to 4 controllers supported (slots 0–3).

**a1** → pointer to input/output struct:

```c
struct {
    uint32_t id;     // controller slot: 0–3
    uint32_t axis;   // SDL_GameControllerAxis value
    int32_t  value;  // OUT: axis value, range -32768..32767
};
```

The host writes the result into the `value` field in the struct.

**a0** ← `0` on success, `-1` if controller slot is invalid / not connected.

`SDL_GameControllerAxis` values: `0` = left stick X, `1` = left stick Y, `2` = right stick X, `3` = right stick Y, `4` = left trigger, `5` = right trigger.

---

## ARM Semihosting — File I/O (`0x01`–`0x20`)

Standard ARM semihosting codes used by Newlib for C stdio and file operations. All guest paths are resolved relative to `[storage].path` in `config.toml`. Path traversal (`../`) is rejected. Handles 0/1/2 map to stdin/stdout/stderr.

---

### `SYS_OPEN` — `0x01`

**a1** → pointer to:

```c
struct {
    uint32_t path_ptr;      // pointer to null-terminated path in guest RAM
    uint32_t mode;          // open mode (see table)
    uint32_t path_length;   // length of path, excluding null terminator
};
```

| Mode | C equivalent | | Mode | C equivalent |
|------|--------------|-|------|--------------|
| 0 | `"r"` | | 6 | `"w+"` |
| 1 | `"rb"` | | 7 | `"w+b"` |
| 2 | `"r+"` | | 8 | `"a"` |
| 3 | `"r+b"` | | 9 | `"ab"` |
| 4 | `"w"` | | 10 | `"a+"` |
| 5 | `"wb"` | | 11 | `"a+b"` |

Special path `:tt` opens stdout (write modes) or stdin (read modes).

**a0** ← nonzero file handle on success, `-1` on failure.

---

### `SYS_CLOSE` — `0x02`

**a1** → `{ uint32_t handle; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_WRITE0` — `0x04`

Write a null-terminated string to host stdout. No length needed.

**a1** = pointer to null-terminated string in guest RAM.

**a0** ← not meaningful.

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

**a0** ← `0` on complete write, number of bytes NOT written on partial failure.

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

**a0** ← bytes not filled (`count − bytes_read`). `0` = full read. Equal to `count` = EOF or error.

---

### `SYS_ISTTY` — `0x09`

**a1** → `{ uint32_t handle; }`

**a0** ← `1` if interactive device (stdin/stdout/stderr), `0` if regular file.

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

### `SYS_REMOVE` — `0x0E`

Delete a file. Path resolved relative to `[storage].path`.

**a1** → `{ uint32_t path_ptr; uint32_t path_length; }`

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_RENAME` — `0x0F`

Rename or move a file. Both paths resolved relative to `[storage].path`.

**a1** → pointer to:

```c
struct {
    uint32_t old_path_ptr;
    uint32_t old_path_length;
    uint32_t new_path_ptr;
    uint32_t new_path_length;
};
```

**a0** ← `0` on success, `-1` on failure.

---

### `SYS_ERRNO` — `0x13`

Read the host-side `errno` value. Newlib calls this after any failing file syscall to retrieve the error code and map it to the guest C library's `errno`.

**a1** = `0` (unused).

**a0** ← current host `errno`.

---

### `SYS_EXIT` — `0x18`

Terminate the emulator with exit code from `a1`.

**a1** = exit code (direct scalar).

Does not return.

---

### `SYS_EXIT_EXTENDED` — `0x20`

Terminate with a structured exit code.

**a1** → pointer to:

```c
struct {
    uint32_t reason_code;  // 0x20026 = normal application exit (ADP_Stopped_ApplicationExit)
    uint32_t subcode;      // value passed to exit()
};
```

Does not return.

---

## errno Behaviour

Every semihosting handler that can fail must set `errno` before returning `-1`. Newlib calls `SYS_ERRNO` after each failing syscall to retrieve the error. Failure to set `errno` causes the guest C library to report the wrong error code (or zero) to guest code.

Sources:
- **Parameter validation failure** (address out of RAM, misaligned): sets `errno = EINVAL`
- **OS/filesystem errors**: `errno` is set automatically by the underlying OS call; do not overwrite it
- **Directory errors**: `ENOENT` if path does not exist, `ENOTDIR` if path exists but is not a directory