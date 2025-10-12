from cpu import CPU
import time

def main():
    rom_file = "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i/test.bin"
    with open(rom_file, "rb") as f:
        rv32i = CPU(f.read())

    steps = 0
    start_time = 0

    while rv32i.running:
        try:
            #print(f"{hex(rv32i.pc)}: {rv32i.reg._values}")
            rv32i.step()
            steps += 1
            if time.perf_counter() - start_time > .1:
                print("Instructions per second:", steps * 10)
                steps = 0
                start_time = time.perf_counter()
        except Exception as e:
            raise Exception(f"{e} at {hex(rv32i.pc)}")

if __name__ == "__main__":
    main()