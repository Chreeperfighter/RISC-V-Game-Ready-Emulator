# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A RV32I emulator capable of running games (DOOM, Quake, WireWorld), implemented in two flavors:
- **C++ emulator** (`Cpp/`) — primary, multithreaded, SDL2-based, with display and input
- **Python emulator** (`Python/`) — older reference implementation, useful for debugging

## Building the C++ Emulator

```bash
cd Cpp
cmake -B cmake-build-debug -G Ninja    # or cmake-build-release
cmake --build cmake-build-debug
```

Requires: SDL2, a C++17 compiler, CMake ≥ 3.30. On Apple Silicon, Homebrew libraries at `/opt/homebrew` are found automatically.

The config file path is **hardcoded** in `src/main.cpp:44` — update it before running:
```cpp
g_config = Config::load("/absolute/path/to/Cpp/config/config.toml");
```

## Building Guest Programs (RV32 target)

Guest programs are cross-compiled with `riscv64-unknown-elf-gcc` targeting `rv32i`. Each program under `Programs/` uses the shared toolchain file:

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
| `[framebuffer]` | `width`, `height`, `format` | Display config (`ARGB`, `RGB`, `RGB565`) |
| `[debug]` | `enabled` | Print ELF section info on load |
| `[debug]` | `perf_monitor` | Show instructions/second counter |
| `[debug]` | `fps` | Target display FPS |
| `[[debug.breakpoint]]` | `address` | Break at hex address (e.g. `0x24`) |
| `[[debug.breakpoint]]` | `file` + `line` | Break at source file/line (DWARF lookup) |
| `[init]` | `randomize_registers`, `randomize_ram`, `zero_bss` | Emulator init behavior |

## Architecture

### C++ Emulator

**Main thread** handles SDL events and drives the display at 60 FPS. **CPU thread** runs `RV32::step()` in a tight loop.

```
main.cpp
  ├── Config::load()          → g_config (global)
  ├── RV32 cpu                → emulated CPU
  ├── Display                 → SDL2 window + texture, reads cpu.transfer_buffer
  ├── Input                   → SDL events → cpu key/mouse queues
  ├── ELFLoader               → parses ELF, feeds sections to cpu.load_section()
  └── RV32Debugger            → breakpoint handling
```

**`RV32`** (`src/RV32.cpp`, `inc/RV32.hpp`): Core CPU. Each `step()` does fetch → decode → execute. Memory is a flat `std::vector<uint8_t>` starting at `ram_origin`. Thread-safety between CPU and display is handled via `transfer_buffer_mtx` and `queue_mtx`.

**Semihosting** is how guest programs call into the host. Triggered by the 3-instruction sequence `slli zero,zero,0x1f` / `ebreak` / `srai zero,zero,0x7`. The syscall number is in `a0`, parameter pointer in `a1`. Custom syscalls are in range `0x100–0x1FF`; ARM semihosting syscalls (`0x01–0x20`) are used for file I/O.

**`FileHandleTable`** (`inc/FileHandle.hpp`, `src/FileHandle.cpp`): Sandboxed file I/O. All guest file paths are resolved relative to `storage_path` from config. `isPathSafe()` prevents path traversal.

**`ELFLoader`** (`inc/ELFLoader.hpp`, `src/ELFLoader.cpp`): Parses ELF32, returns `ELFSection` structs. `RV32::load_section()` copies them into the flat RAM array (zero-fills `.bss`, sets `heap_start` after `.bss`).

### Debugger (`RV32Debugger` + `DWARFReader`)

**`DWARFReader`** (`inc/DWARFReader.hpp`, `src/DWARFReader.cpp`): Parses DWARF5 debug info using libdwarf. During `parse()`, `m_dbg` is valid; it is cleared before `dwarf_finish()`. Populates two sorted vectors:
- `line_entries` (sorted by `address`) — maps PC → source file/line, queried via `lookup_line(pc)`
- `sub_programs` (sorted by `low_pc`) — maps PC → function + its local variables, queried via `lookup_subprogram(pc)`

Variable locations come from `DW_AT_location` expressions: `DW_OP_reg0..reg31` (register-resident) or `DW_OP_fbreg` + SLEB128 offset (frame-pointer-relative). Type info is resolved by following the `DW_AT_type` offset with `dwarf_offdie_b`.

**`RV32Debugger`** (`inc/RV32Debugger.hpp`, `src/RV32Debugger.cpp`): Called by the CPU when a breakpoint fires.
- `should_break()` — checked every instruction; handles address breakpoints and step modes
- `on_breakpoint()` — draws a terminal box UI (source context, CPU state, local variables), then enters a command loop
- Debugger commands: `c` (continue), `si` (step-into), `so` (step-over), `print(<reg|var|0xaddr>)`
- Step-over uses an SP-based trick: keep running while `sp < step_sp` (inside a called function), break when SP returns and source line changes
- Box-drawing uses `display_width()` (counts UTF-8 codepoints, not bytes) so multibyte chars like `→` and `─` pad correctly

Breakpoints in config support both raw address and file+line (resolved via DWARF at startup).

### Semihosting Syscall Table

Defined in `Cpp/inc/Syscall.hpp`. Custom extensions:

| Code | Name | Description |
|---|---|---|
| `0x100` | `SYS_GET_FRAMEBUFFER_INFO` | Query framebuffer width/height/format |
| `0x101` | `SYS_SHOW_FRAMEBUFFER` | Flip guest buffer → `transfer_buffer` |
| `0x102` | `SYS_GET_US` | Get host time in microseconds |
| `0x103` | `SYS_SLEEP_US` | Sleep the CPU thread |
| `0x104` | `SYS_KEY_AVAILABLE` | Check if key event queue is non-empty |
| `0x105` | `SYS_GET_KEY` | Pop key from queue |
| `0x106` | `SYS_IS_KEY_DOWN` | Query real-time key state |
| `0x107` | `SYS_GET_MOUSE_POS` | Get mouse x/y |
| `0x108` | `SYS_IS_MOUSE_BUTTON_DOWN` | Get mouse button state |

Guest programs call semihosting via inline assembly (see `Programs/RV32DOOM/syscalls.h` as a reference header).

### Guest Linker / Memory Layout

`Toolchain/linker.ld`: RAM starts at `0x00000000`, size 32 MB. Stack top at `RAM_END`, heap end at `RAM_END - 2MB`. `.text`, `.rodata`, `.data`, `.bss` placed sequentially from address 0.

### Python Emulator (`Python/`)

Older single-file emulator. Entry point is `Python/main.py`. Loads ELF via `elf_loader.py`, steps via `cpu.py`. Useful for debugging correctness of individual instructions; does not support SDL display.

## Key Files

| File | Role |
|---|---|
| `Cpp/inc/Syscall.hpp` | Authoritative list of semihosting syscall codes |
| `Cpp/inc/Config.hpp` / `src/Config.cpp` | Config struct + TOML loader |
| `Cpp/config/config.toml` | Runtime config (paths, RAM, framebuffer) |
| `Toolchain/rv32-semihosting-toolchain.cmake` | Cross-compilation toolchain for guest programs |
| `Toolchain/linker.ld` | Guest memory map |
| `Toolchain/start.S` / `_exit.S` | Guest startup/exit stubs |
| `Programs/RV32DOOM/syscalls.h` | Inline-assembly semihosting wrappers for C guest code |
| `doc/semihosting_doc.md` | Semihosting extension specification |
| `Cpp/inc/DWARFReader.hpp` / `src/DWARFReader.cpp` | DWARF5 parser: line table + subprogram/variable extraction |
| `Cpp/inc/RV32Debugger.hpp` / `src/RV32Debugger.cpp` | Source-level debugger: breakpoints, step, variable display |
| `Cpp/inc/Registers.hpp` | Register ABI name table (`register_names[32]`) used by debugger |
