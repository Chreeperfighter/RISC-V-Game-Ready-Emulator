from typing import Union

from params import ROM_ORIGIN, ROM_LENGTH, ROM_END, RAM_ORIGIN, RAM_LENGTH, RAM_END, FB_ORIGIN, FB_LENGTH, FB_END

class MCU:
    def __init__(self, rom: bytes):
        self._rom = bytearray(ROM_LENGTH)
        self._ram = bytearray(RAM_LENGTH)
        self._framebuffer = bytearray(FB_LENGTH)
        self.load_rom(rom)

    def load_rom(self, rom: bytes):
        self._rom = rom

    def get_framebuffer(self):
        return self._framebuffer

    def read(self, address: int, length: int, read_bytes: bool = False) -> Union[bytes, int]:
        address = address & 0xFFFFFFFF
        if ROM_ORIGIN <= address < ROM_END:
            offset = address - ROM_ORIGIN
            data = self._rom[offset:offset + length]
            if read_bytes:
                return data
            return int.from_bytes(data, "little")
        elif RAM_ORIGIN <= address < RAM_END:
            offset = address - RAM_ORIGIN
            data = self._ram[offset:offset + length]
            if read_bytes:
                return data
            return int.from_bytes(data, "little")
        elif FB_ORIGIN <= address < FB_END:
            offset = address - FB_ORIGIN
            data = self._framebuffer[offset:offset + length]
            if read_bytes:
                return data
            return int.from_bytes(data, "little")
        else:
            raise IndexError(f"Invalid read address: {hex(address)}")

    def write(self, address: int, value: int, length: int):
        address = address & 0xFFFFFFFF
        if ROM_ORIGIN <= address < ROM_END:
            raise RuntimeError("Writing to ROM not supported")
        elif RAM_ORIGIN <= address < RAM_END:
            offset = address - RAM_ORIGIN
            self._ram[offset:offset + length] = value.to_bytes(length, "little")
        elif FB_ORIGIN <= address < FB_END:
            offset = address - FB_ORIGIN
            self._framebuffer[offset:offset + length] = value.to_bytes(length, "little")
        else:
            raise IndexError(f"Invalid write address: {hex(address)}")