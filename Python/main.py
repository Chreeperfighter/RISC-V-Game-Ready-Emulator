from RV32I import CPU

def main():
    rom_file = "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/test.bin"
    with open(rom_file, "rb") as f:
        rv32i = CPU(f.read())

    while rv32i.running:
        try:
            # print(f"{hex(rv32i.pc)}: {hex(rv32i.reg['ra'])}")
            rv32i.step()
        except Exception as e:
            print(hex(rv32i.reg["s0"] - 20))
            raise Exception(f"{e} at {hex(rv32i.pc)}")
    print(rv32i.reg._values)

if __name__ == "__main__":
    main()