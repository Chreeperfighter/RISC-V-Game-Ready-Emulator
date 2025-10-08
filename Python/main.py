import random
from RV32I import CPU

def main():
    rv32i = CPU()
    print(rv32i.reg)
    print("Hello World")

if __name__ == "__main__":
    main()