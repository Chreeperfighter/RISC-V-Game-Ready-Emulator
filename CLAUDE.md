# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A RV32I emulator capable of running games (DOOM, Quake, WireWorld, retro-go), implemented in two flavors:
- **C++ emulator** (`Cpp/`) — primary, multithreaded, SDL2-based, with display, audio, and input
- **Python emulator** (`Python/`) — older reference implementation, useful for debugging individual instructions

## Building the C++ Emulator

```bash
cd Cpp
cmake -B cmake-build-debug -G Ninja    # or cmake-build-release / cmake-build-relwithdebinfo
cmake --build cmake-build-debug
```

Requires: SDL2, libdwarf, a C++17 compiler, CMake ≥ 3.30. On Apple Silicon, Homebrew libraries at `/opt/homebrew` are found automatically.

The config file path is **hardcoded** in `src/main.cpp` — update it before running:
```cpp
g_config = Config::load("/absolute/path/to/Cpp/config/config.toml");
```

## Building Guest Programs (RV32 target)

Guest programs are cross-compiled with `riscv64-unknown-elf-gcc` targeting `rv32i`:

```bash
cd Programs/RV32DOOM
cmake -B cmake-build-release-rv32i \
      -DCMAKE_TOOLCHAIN_FILE=../../Toolchain/rv32-semihosting-toolchain.cmake \
      -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-rv32i
```

`STARTUP_FILES` (from the toolchain cmake) must be included in each guest program's `add_executable`. The startup sequence is: `start.S` → `init_semihosting` → `__libc_init_array` → `main`.

## Configuration (`Cpp/config/config.toml`)

The global `Config` struct (`Cpp/inc/Config.hpp`) is loaded at startup from a TOML file. Key fields:

| Section | Key | Purpose |
|---|---|---|
| `[binary]` | `path` | Absolute path to guest ELF |
| `[storage]` | `path` | Root of the sandboxed filesystem visible to guest |
| `[ram]` | `ram_origin`, `ram_size_mb`, `stack_margin_mb` | RAM layout |
| `[framebuffer]` | `width`, `height`, `format` | Display config (`ARGB8888`, `RGBA8888`, `RGB888`, `RGB565`) |
| `[debug]` | `enabled` | Print ELF section info on load |
| `[debug]` | `perf_monitor` | Show instructions/second counter |
| `[debug]` | `fps` | Target display FPS (vsync now controls actual rate) |
| `[[debug.breakpoint]]` | `address` | Break at hex address |
| `[[debug.breakpoint]]` | `file` + `line` | Break at source file/line (DWARF lookup) |
| `[init]` | `randomize_registers`, `randomize_ram`, `zero_bss` | Emulator init behavior |

## Architecture

### C++ Emulator Threading Model

**Main thread**: SDL event loop → `Input::process_event()` → updates state in `RV32`. Drives display via `Display::update_display()` which blocks on vsync (`SDL_RENDERER_PRESENTVSYNC`). Events are drained before and after `SDL_RenderPresent` to minimize input latency.

**CPU thread**: runs `RV32::step()` in a tight loop of 1000 steps, checking for traps/breakpoints.

```
main.cpp
  ├── SDL hints (HIDAPI/MFi for controllers) — set before any SDL_Init
  ├── Config::load()      → g_config (global)
  ├── RV32 cpu            → emulated CPU
  ├── Display             → SDL2 window + texture, reads cpu.transfer_buffer
  ├── Audio               → SDL2 audio device, called from CPU thread via semihosting
  ├── Input               → SDL events → cpu state (keys, mouse, controllers)
  ├── ELFLoader           → parses ELF, feeds sections to cpu.load_section()
  └── RV32Debugger        → breakpoint handling (debug builds only)
```

### Thread Safety in RV32

Three mutexes protect shared state between CPU thread (writer for framebuffer, reader for input) and main thread (reader for framebuffer, writer for input):

| Mutex | Protects |
|---|---|
| `transfer_buffer_mtx` | `transfer_buffer` — guest framebuffer copied to display |
| `queue_mtx` | `key_queue` — keyboard event queue |
| `input_state_mtx` | `key_state[]`, `controller_button_state[][]`, `controller_axes[][]` |

### Semihosting

Triggered by the 3-instruction sequence `slli zero,zero,0x1f` / `ebreak` / `srai zero,zero,0x7`. Syscall number in `a0`, parameter pointer (to a struct in guest RAM) in `a1`. Custom syscalls are in range `0x100–0x1FF`; ARM semihosting syscalls (`0x01–0x20`) are used for file I/O.

Multi-field syscalls pass a struct pointer in `a1`. The host reads it with `get_args<T>(address, args)` (zero-copy via `read_raw`). To write back into the struct (e.g. axis value), use `write_u32(parameter + offsetof(StructType, field), value)`.

Full syscall table in `Cpp/inc/Syscall.hpp`:

| Code | Name | Description |
|---|---|---|
| `0x100` | `SYS_GET_DISPLAY_INFO` | Query framebuffer width/height/format |
| `0x101` | `SYS_SHOW_FRAMEBUFFER` | Flip guest buffer → `transfer_buffer` |
| `0x102` | `SYS_GET_US` | Get host time in microseconds |
| `0x103` | `SYS_SLEEP_US` | Sleep the CPU thread |
| `0x104` | `SYS_KEY_AVAILABLE` | Check if key event queue is non-empty |
| `0x105` | `SYS_GET_KEY` | Pop key from queue |
| `0x106` | `SYS_IS_KEY_DOWN` | Query real-time key state (SDL_Scancode) |
| `0x107` | `SYS_GET_MOUSE_POS` | Get mouse x/y (scaled to framebuffer coords) |
| `0x108` | `SYS_IS_MOUSE_BUTTON_DOWN` | Get mouse button state |
| `0x109–0x10D` | `SYS_OPENDIR/READDIR/CLOSEDIR/MKDIR/REWINDDIR` | Directory I/O |
| `0x10E` | `SYS_AUDIO_INIT` | Open SDL2 audio device (sample_rate, channels, bits) |
| `0x10F` | `SYS_AUDIO_SUBMIT` | Submit PCM buffer; host blocks if queue is too full |
| `0x110` | `SYS_AUDIO_GET_QUEUED_BYTES` | Query SDL audio queue size |
| `0x111` | `SYS_IS_CONTROLLER_BUTTON_DOWN` | Query button state (`{id, button}` → 0/1/-1) |
| `0x112` | `SYS_GET_CONTROLLER_AXIS` | Query axis value (`{id, axis, value(out)}` → 0/-1) |

### Controller Support

Up to `MAX_CONTROLLERS` (4) controllers supported. `Input` maintains two maps keyed on `SDL_JoystickID`:
- `controllers` — `SDL_JoystickID → SDL_GameController*`
- `controller_slots` — `SDL_JoystickID → int slot (0..3)`

State is stored in `RV32` as `controller_button_state[MAX_CONTROLLERS][SDL_CONTROLLER_BUTTON_MAX]` and `controller_axes[MAX_CONTROLLERS][SDL_CONTROLLER_AXIS_MAX]`. Slots are stable across connect/disconnect. `clear_controller_slot()` is called on disconnect.

On macOS, Xbox controllers via Bluetooth use Apple's GCController framework; wired USB-C requires batteries to be present. HIDAPI and MFi hints are set in `main.cpp` before any `SDL_Init` call.

### Audio

`Audio` (`Cpp/inc/Audio.hpp`, `Cpp/src/Audio.cpp`): SDL2 audio device wrapper. `submit()` does host-side pacing — calculates how long to `SDL_Delay` based on queue depth before queuing new audio, keeping the guest from getting too far ahead. Guest uses `rv32_audio.h` / `rv32_audio.c` from `Programs/common/`.

### File I/O (Semihosting)

`FileHandleTable` (`inc/FileHandle.hpp`, `src/FileHandle.cpp`): Sandboxed file I/O. All guest paths resolved relative to `storage_path` from config. `isPathSafe()` prevents path traversal. Handles 0/1/2 map to stdin/stdout/stderr.

### Debugger (`RV32Debugger` + `DWARFReader`)

Only active in `EMULATOR_DEBUG` builds. `DWARFReader` parses DWARF5 debug info (libdwarf), populates sorted vectors for PC → source line and PC → function/locals lookups. `RV32Debugger` draws a terminal box UI on breakpoint, supports `c`, `si`, `so`, `print(<reg|var|0xaddr>)` commands.

### Guest Library (`Programs/common/`)

Shared C library linked by all guest programs. Key headers:

| File | Purpose |
|---|---|
| `rv32_syscalls.h` | Raw `semihost()` inline-asm wrapper + all syscall wrappers |
| `rv32_display.h/c` | `get_display_info()`, `show_framebuffer()` |
| `rv32_input.h/c` | Keyboard, mouse, controller polling functions |
| `rv32_audio.h/c` | `init_audio()`, `submit_audio()`, `get_queued_bytes()` |
| `rv32_time.h/c` | `get_us()`, `sleep_us()` |
| `rv32_file.h/c` | `fopen`/`fread`/etc wrappers over semihosting file syscalls |
| `rv32_dirent.h/c` | `opendir`/`readdir`/etc wrappers |

### Guest Linker / Memory Layout

`Toolchain/linker.ld`: RAM starts at `0x00000000`, size 32 MB. Stack top at `RAM_END`, heap end at `RAM_END - 2MB`. `.text`, `.rodata`, `.data`, `.bss` placed sequentially from address 0.

## Key Files

| File | Role |
|---|---|
| `Cpp/inc/Syscall.hpp` | Authoritative list of semihosting syscall codes |
| `Cpp/inc/Config.hpp` / `src/Config.cpp` | Config struct + TOML loader |
| `Cpp/config/config.toml` | Runtime config (paths, RAM, framebuffer) |
| `Cpp/inc/Input.hpp` / `src/Input.cpp` | SDL event handling, controller slot management |
| `Cpp/inc/Audio.hpp` / `src/Audio.cpp` | SDL2 audio backend |
| `Toolchain/rv32-semihosting-toolchain.cmake` | Cross-compilation toolchain for guest programs |
| `Toolchain/linker.ld` | Guest memory map |
| `Programs/common/rv32_syscalls.h` | Guest-side semihosting wrappers (canonical reference) |
| `doc/semihosting_doc.md` | Semihosting extension specification |
| `Cpp/inc/DWARFReader.hpp` / `src/DWARFReader.cpp` | DWARF5 parser |
| `Cpp/inc/RV32Debugger.hpp` / `src/RV32Debugger.cpp` | Source-level debugger |