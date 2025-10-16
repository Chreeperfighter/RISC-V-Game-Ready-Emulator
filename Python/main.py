from cpu import CPU
from elf_loader import get_location
import time
from PIL import Image
from params import Display
from pathlib import Path
from debugger import Debugger

def print_framebuffer(data: bytes, width: int, height: int):
    """Display framebuffer as image."""
    # Convert from 32-bit 0x00RRGGBB to 24-bit RGB
    rgb_data = bytearray()
    for i in range(0, len(data), 4):
        rgb_data.append(data[i + 2])  # R
        rgb_data.append(data[i + 1])  # G
        rgb_data.append(data[i + 0])  # B

    img = Image.frombytes("RGB", (width, height), bytes(rgb_data))
    img.show()


def main():
    # Configuration
    elf_path = Path(
        "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.elf")

    if not elf_path.exists():
        print(f"Error: ELF file not found: {elf_path}")
        return 1

    # Initialize CPU and load program
    print(f"Loading {elf_path.name}...")
    cpu = CPU()
    debug_info = cpu.load_elf(str(elf_path))

    # Show debug info summary
    print(f"Loaded {len(debug_info['functions'])} functions")
    print(f"Debug info: {len(debug_info['addr_to_line'])} line mappings")
    print(f"Entry point: 0x{cpu.pc:08x}\n")

    # Set up debugger
    debugger = Debugger(debug_info)
    cpu.on_break = debugger.on_breakpoint

    # Optional: Set initial breakpoints
    debugger.set_breakpoint_at_line(cpu, "main.c", 14)

    # Run program
    print("Starting execution...")
    start_time = time.perf_counter()

    try:
        while cpu.running:
            cpu.step()
    except KeyboardInterrupt:
        print("\nExecution interrupted by user")
    except Exception as e:
        print(f"\nError: {e} at PC=0x{cpu.pc:08x}")

        # Show location of crash
        location = get_location(debug_info, cpu.pc)
        if location:
            filename, line = location
            print(f"Location: {filename}:{line}")
            debugger.show_source_context(filename, line)

        # Enter debugger on crash
        debugger.interactive(cpu)
        return 1

    end_time = time.perf_counter()

    # Print results
    print(f"\nExecution completed in {(end_time - start_time) * 1000:.2f} ms")

    if Display.ENABLED:
        print("Displaying framebuffer...")
        fb_data = cpu.mcu.get_framebuffer()
        print_framebuffer(fb_data, Display.WIDTH, Display.HEIGHT)

    return 0


if __name__ == "__main__":
    exit(main())