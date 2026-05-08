# RISC-V Game-Ready Emulator

A RV32IM interpreter emulator capable of running real-world games and applications: DOOM, SNES (snes9x2002), NES/Game Boy/GBC (retro-go), Commodore 64 (Frodo), WireWorld, and more.

The emulator provides a hardware abstraction layer (display, audio, keyboard, mouse, controllers, file I/O) via a custom semihosting interface. Guest programs are cross-compiled with a standard `riscv64-unknown-elf-gcc` toolchain and run unmodified on the emulated CPU.

---

## Table of Contents

1. [Architecture](#1-architecture)
2. [Tools & Dependencies](#2-tools--dependencies)
3. [Building the Emulator](#3-building-the-emulator)
4. [Configuration](#4-configuration)
5. [Building Included Guest Programs](#5-building-included-guest-programs)
6. [Writing a New Guest Application](#6-writing-a-new-guest-application)
7. [Guest Program API Reference](#7-guest-program-api-reference)
8. [Included Programs](#8-included-programs)
9. [Documentation](#9-documentation)

---

## 1. Architecture

```
┌──────────────────────────────────────────────────┐
│                 Host (C++, SDL2)                 │
│                                                  │
│  Main thread: SDL event loop, vsync display      │
│  CPU  thread: RV32IM fetch/decode/execute loop   │
│                                                  │
│  ┌────────┐  ┌─────────┐  ┌───────┐  ┌───────┐  │
│  │ RV32   │  │ Display │  │ Audio │  │ Input │  │
│  │ CPU    │  │ SDL2    │  │ SDL2  │  │ SDL2  │  │
│  └───┬────┘  └─────────┘  └───────┘  └───────┘  │
│      │  semihosting (custom syscalls)            │
└──────┼───────────────────────────────────────────┘
       │
┌──────┴──────────────────────────────────────────┐
│           Guest ELF (RV32IM binary)             │
│   DOOM / retro-go / snes9x2002 / Frodo / …     │
└─────────────────────────────────────────────────┘
```

**CPU:** Flat 32-bit address space, 32 MB RAM by default. No MMU, no OS. The entire guest program lives in a single flat array. All hardware access goes through semihosting calls.

**Semihosting:** Guest triggers a 3-instruction magic sequence (`slli zero,zero,0x1f` / `ebreak` / `srai zero,zero,0x7`). The emulator intercepts this, reads the syscall number from `a0` and a parameter pointer from `a1`, executes the host-side handler, and writes the return value back to `a0`.

**Threading:** The CPU runs on a dedicated thread. The main thread drives SDL at vsync rate (typically 60 Hz). Three mutexes protect the framebuffer, key queue, and input state shared between threads.

---

## 2. Tools & Dependencies

### Host (emulator)

| Tool | Purpose |
|------|---------|
| C++17 compiler (clang++ / g++) | Host emulator build |
| CMake ≥ 3.30 | Build system |
| Ninja | Recommended generator |
| SDL2 | Window, renderer, audio, input |
| libdwarf | DWARF5 debug info parsing (debugger only) |

On macOS with Homebrew:
```bash
brew install cmake ninja sdl2 libdwarf
```

### Guest (cross-compilation)

| Tool | Purpose |
|------|---------|
| `riscv64-unknown-elf-gcc` / `g++` | Cross-compiler targeting RV32IM |
| `riscv64-unknown-elf-objdump` | Disassembly in debugger |

Install via [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain) or a prebuilt package:
```bash
brew tap riscv-software-src/riscv
brew install riscv-tools
```

---

## 3. Building the Emulator

```bash
cd Cpp
cmake -B cmake-build-release -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release
```

For a debug build (enables DWARF debugger, breakpoints):
```bash
cmake -B cmake-build-debug -G Ninja -DCMAKE_BUILD_TYPE=Debug
cmake --build cmake-build-debug
```

**Before running**, update the hardcoded config path in `Cpp/src/main.cpp:44`:
```cpp
g_config = Config::load("/absolute/path/to/Cpp/config/config.toml");
```

---

## 4. Configuration

The emulator reads `Cpp/config/config.toml` at startup. Key settings:

```toml
[binary]
path = "/path/to/guest/ELF"          # guest program to run

[storage]
path = "/path/to/rootfs"             # sandbox root for guest filesystem access

[ram]
ram_origin = 0x00000000
ram_size_mb = 64
stack_margin_mb = 4

[framebuffer]
width  = 320
height = 240
format = "RGB565"                    # ARGB8888 | RGB565 | RGB888 | RGBA8888

[debug]
perf_monitor = false                 # print MIPS counter once per second

# Optional breakpoints (debug builds only):
[[debug.breakpoint]]
file = "/absolute/path/to/source.c"
line = 42

[[debug.breakpoint]]
address = 0x1234

[init]
randomize_registers = true
randomize_ram       = true
zero_bss            = true
```

The guest queries width, height, and format at runtime via `SYS_DISPLAY_INFO` — never hardcode these in guest programs.

---

## 5. Building Included Guest Programs

All guest programs use the same cross-compilation toolchain:

```bash
cd Programs/<program>
cmake -B cmake-build-release-rv32im \
      -DCMAKE_TOOLCHAIN_FILE=../../Toolchain/rv32-semihosting-toolchain.cmake \
      -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-rv32im
```

Then set `[binary].path` in `config.toml` to the resulting ELF.

---

## 6. Writing a New Guest Application

### Step 1 — Create CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.16)
project(MyProgram C ASM)          # add CXX if you use C++

set(CMAKE_C_STANDARD 11)

# Include the shared guest library
add_subdirectory(../common common)

# STARTUP_FILES is set by the toolchain cmake — must be first in add_executable
add_executable(MyProgram
    ${STARTUP_FILES}
    main.c
)

target_link_libraries(MyProgram rv32_common m)
```

For C++ programs:
```cmake
project(MyProgram C CXX ASM)
set(CMAKE_CXX_STANDARD 20)
add_executable(MyProgram ${STARTUP_FILES} main.cpp)
target_link_libraries(MyProgram rv32_common m)
```

### Step 2 — Write main.c

```c
#include "rv32_display.h"
#include "rv32_input.h"
#include "rv32_time.h"
#include <stdlib.h>
#include <stdio.h>

int main(void) {
    // Query display config — never hardcode resolution or format
    bool ok;
    struct DisplayInfo info = get_display_info(&ok);
    if (!ok) {
        fprintf(stderr, "failed to get display info\n");
        return 1;
    }

    // Allocate framebuffer
    size_t bpp = info.bpp / 8;
    uint8_t *fb = malloc(info.width * info.height * bpp);

    while (1) {
        // Handle input
        while (key_available()) {
            SDL_Scancode key = pop_key();
            if (key == SDL_SCANCODE_ESCAPE) return 0;
        }

        // Render a frame into fb ...

        // Flip to screen
        show_framebuffer(fb);
    }
}
```

### Step 3 — Build

```bash
cmake -B cmake-build-release-rv32im \
      -DCMAKE_TOOLCHAIN_FILE=../../Toolchain/rv32-semihosting-toolchain.cmake \
      -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-rv32im
```

### Step 4 — Configure and run

In `Cpp/config/config.toml`:
```toml
[binary]
path = "/absolute/path/to/cmake-build-release-rv32im/MyProgram"

[storage]
path = "/absolute/path/to/your/rootfs"

[framebuffer]
width  = 320
height = 240
format = "RGB565"
```

### Constraints and pitfalls

| Constraint | Reason |
|-----------|--------|
| No LTO (`-flto`) | GCC LTO links prebuilt libgcc compiled for RV32IMC. The emulator only implements RV32IM — compressed (C-extension) instructions cause Illegal Instruction traps. |
| `init_semihosting()` must run before stdio | Done automatically by `start.S`. If you bypass startup, call it manually. Without it, Newlib silently ignores all filesystem calls and returns unset errno values. |
| No dynamic libraries | Newlib statically linked via `semihost.specs`. |
| No POSIX threads | Single emulated CPU core. |
| `${STARTUP_FILES}` must be first | The startup objects must appear before all other objects in `add_executable`. |

---

## 7. Guest Program API Reference

All APIs live in `Programs/common/`. Include paths are set automatically when you `add_subdirectory(../common common)`.

### Display — `rv32_display.h`

```c
struct DisplayInfo get_display_info(bool *ok);
void show_framebuffer(void *framebuffer);
```

| Function | Description |
|---------|-------------|
| `get_display_info` | Returns width, height, format, bpp. Call once at startup. |
| `show_framebuffer` | Copies `width × height × bpp/8` bytes to the host display. Call once per frame. |

### Input — `rv32_input.h`

```c
// Keyboard
bool         key_available();
SDL_Scancode pop_key();
bool         is_key_down(SDL_Scancode sc);

// Mouse
void get_mouse_pos(struct MousePos *pos);
bool is_mouse_button_down(MouseButton button, bool *ok);

// Controller (up to 4, zero-indexed id)
bool    is_controller_button_down(int32_t id, SDL_GameControllerButton btn, bool *ok);
int32_t get_controller_axis(int32_t id, SDL_GameControllerAxis axis, bool *ok);
```

Key events: `pop_key()` returns `SDL_Scancode`. Key-up events have bit 15 set (`value & 0x8000`).

### Audio — `rv32_audio.h`

```c
bool     init_audio(uint32_t sample_rate, uint8_t channels, uint8_t bits_per_sample);
bool     submit_audio(void *buffer, uint32_t len);
uint32_t get_queued_bytes();
```

`submit_audio` applies backpressure — it briefly blocks if the host audio queue is too full to prevent the guest from running too far ahead. Supported `bits_per_sample`: 8 or 16.

### Time — `rv32_time.h`

```c
uint32_t get_us(bool *ok);
bool     sleep_us(uint32_t duration_us);
```

`get_us` returns microseconds since emulator start. Wraps at ~71 minutes (32-bit).

### File I/O

Standard `fopen` / `fread` / `fwrite` / `fseek` / `fclose` work via Newlib backed by semihosting file handlers. All paths are resolved relative to `[storage].path` in `config.toml`. Path traversal (`../`) is rejected by the host.

Directory access via `rv32_dirent.h`: `opendir` / `readdir` / `closedir` / `rewinddir`.

Full syscall-level reference: [`doc/semihosting_reference.md`](doc/semihosting_reference.md)

---

## 8. Included Programs

| Program | Description |
|---------|-------------|
| `RV32DOOM` | DOOM via PureDOOM (header-only C port) |
| `RV32Quake` | Quake port |
| `WireWorld` | WireWorld cellular automaton |
| `retro-go` | Multi-system emulator: NES, Game Boy, GBC |
| `Peanut-GB-RV32` | Game Boy / GBC via Peanut-GB |
| `RV32_Retro` | SNES via snes9x2002 (libretro core) |
| `RV32_C64` | Commodore 64 via Frodo (C++) |
| `File` | File I/O test suite |
| `TestPrograms` | Timing and system tests |

---

## 9. Documentation

| Document | Contents |
|----------|----------|
| [`doc/semihosting_reference.md`](doc/semihosting_reference.md) | Full semihosting syscall reference — all custom (0x100–0x112) and ARM (0x01–0x20) syscalls with parameter structs, return values, and error behaviour |
| [`TECHNICAL_OVERVIEW.md`](TECHNICAL_OVERVIEW.md) | Deep-dive into emulator internals: CPU pipeline, threading model, ELF loader, DWARF5 debugger, memory layout |
| [`doc/riscv-unprivileged-1.pdf`](doc/riscv-unprivileged-1.pdf) | RISC-V unprivileged ISA specification |
| [`doc/riscv-privileged-2.pdf`](doc/riscv-privileged-2.pdf) | RISC-V privileged specification |
| [`doc/DWARF5.pdf`](doc/DWARF5.pdf) | DWARF5 debug information format specification |