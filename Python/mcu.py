from typing import Union

from params import RAM_ORIGIN, RAM_LENGTH, RAM_END, FB_ORIGIN, FB_LENGTH, FB_END

class MCU:
    def __init__(self):
        self._ram = bytearray(RAM_LENGTH)
        self._framebuffer = bytearray(FB_LENGTH)

    def get_framebuffer(self):
        return self._framebuffer

    @staticmethod
    def _check_range(addr, length, start, end):
        return start <= addr and (addr + length) <= end

    def read(self, address: int, length: int, read_bytes: bool = False) -> Union[bytes, int]:
        address = address & 0xFFFFFFFF
        if self._check_range(address, length, RAM_ORIGIN, RAM_END):
            offset = address - RAM_ORIGIN
            data = self._ram[offset:offset + length]
            if read_bytes:
                return data
            return int.from_bytes(data, "little")
        elif self._check_range(address, length, FB_ORIGIN, FB_END):
            offset = address - FB_ORIGIN
            data = self._framebuffer[offset:offset + length]
            if read_bytes:
                return data
            return int.from_bytes(data, "little")
        else:
            raise IndexError(f"Invalid read address: {hex(address)}")

    def write(self, address: int, value: int, length: int, write_bytes: bool = False):
        address = address & 0xFFFFFFFF
        if not write_bytes:
            value = value.to_bytes(length, "little")
        if self._check_range(address, length, RAM_ORIGIN, RAM_END):
            offset = address - RAM_ORIGIN
            self._ram[offset:offset + length] = value
        elif self._check_range(address, length, FB_ORIGIN, FB_END):
            offset = address - FB_ORIGIN
            self._framebuffer[offset:offset + length] = value
        else:
            raise IndexError(f"Invalid write address: {hex(address)}")