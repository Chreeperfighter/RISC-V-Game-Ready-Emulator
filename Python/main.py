from cpu import CPU
import time
from PIL import Image
from mcu import display

def print_fb(data, w, h):
    # Your format is 0x00RRGGBB (4 bytes per pixel)
    # PIL expects RGB as 3 bytes per pixel

    # Convert from 32-bit XRGB to 24-bit RGB
    rgb_data = bytearray()
    for i in range(0, len(data), 4):
        # Skip first byte (0x00), take R, G, B
        rgb_data.append(data[i + 2])  # R
        rgb_data.append(data[i + 1])  # G
        rgb_data.append(data[i + 0])  # B

    img = Image.frombytes("RGB", (w, h), bytes(rgb_data))
    img.show()

def main():
    rom_file = "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i/test.bin"
    with open(rom_file, "rb") as f:
        rv32i = CPU(f.read())

    start = time.perf_counter()
    while rv32i.running:
        try:
            rv32i.step()
        except Exception as e:
            raise Exception(f"{e} at {hex(rv32i.pc)}")

    end = time.perf_counter()
    print(f"{(end - start) * 1000} ms")
    if display["DISPLAY_ENABLED"]:
        print_fb(rv32i.mcu.get_framebuffer(), display["DISPLAY_WIDTH"], display["DISPLAY_HEIGHT"])

if __name__ == "__main__":
    main()
