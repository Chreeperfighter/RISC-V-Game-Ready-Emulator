from memory import RAM, ROM

class MCU:
    def __init__(self, rom: bytes):
        self._rom = ROM(rom, size= 0x10000)
        self._ram = RAM(size=0x20000)

    def read(self, address: int, length: int):
        address = address & 0xFFFFFFFF
        if 0x00000000 <= address < 0x00010000:
            return self._rom.read(address, length)
        elif 0x80000000 <= address < 0x80020000:
            return self._ram.read(address - 0x80000000, length)
        else:
            raise IndexError(f"Invalid read address: {hex(address)}")

    def write(self, address: int, value: int, length: int):
        address = address & 0xFFFFFFFF
        if 0x00000000 <= address < 0x00010000:
            raise RuntimeError("Writing to ROM not supported")
        elif 0x80000000 <= address < 0x80020000:
            self._ram.write(address - 0x80000000, value, length)
        else:
            raise IndexError(f"Invalid write address: {hex(address)}")