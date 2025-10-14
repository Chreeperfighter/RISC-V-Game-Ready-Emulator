from typing import Union

from params import RAM_ORIGIN, RAM_LENGTH, RAM_END, FB_ORIGIN, FB_LENGTH, FB_END
from flags import DEBUG_MODE

#define DISPLAY_CTRL_BASE 0x20000000

#define DISPLAY_WIDTH   ((volatile uint32_t*)(DISPLAY_CTRL_BASE + 0x00))
#define DISPLAY_HEIGHT  ((volatile uint32_t*)(DISPLAY_CTRL_BASE + 0x04))
#define DISPLAY_ENABLE  ((volatile uint32_t*)(DISPLAY_CTRL_BASE + 0x08))
#define DISPLAY_STATUS  ((volatile uint32_t*)(DISPLAY_CTRL_BASE + 0x0C))

display = {
    "DISPLAY_WIDTH": 160,
    "DISPLAY_HEIGHT": 120,
    "DISPLAY_ENABLED": 0x0,
    "DISPLAY_STATUS": 0x1
}

class MCU:
    def __init__(self, rom: bytes):
        self._ram = bytearray(RAM_LENGTH)
        self._framebuffer = bytearray(FB_LENGTH)
        self.load_rom(rom)

    def load_rom(self, rom: bytes):
        self._ram[:len(rom)] = rom

    def get_framebuffer(self):
        return self._framebuffer

    def read(self, address: int, length: int, read_bytes: bool = False) -> Union[bytes, int]:
        address = address & 0xFFFFFFFF
        if RAM_ORIGIN <= address < RAM_END:
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
        elif 0x20000000 <= address <= 0x2000000C:
            if address == 0x20000000:
                return display["DISPLAY_WIDTH"]
            elif address == 0x20000004:
                return display["DISPLAY_HEIGHT"]
            elif address == 0x20000008:
                return display["DISPLAY_ENABLED"]
            elif address == 0x2000000C:
                return 1 if display["DISPLAY_ENABLED"] else 0
        else:
            raise IndexError(f"Invalid read address: {hex(address)}")

    def write(self, address: int, value: int, length: int):
        address = address & 0xFFFFFFFF
        if RAM_ORIGIN <= address < RAM_END:
            offset = address - RAM_ORIGIN
            self._ram[offset:offset + length] = value.to_bytes(length, "little")
        elif FB_ORIGIN <= address < FB_END:
            offset = address - FB_ORIGIN
            self._framebuffer[offset:offset + length] = value.to_bytes(length, "little")
        elif 0x20000000 <= address <= 0x2000000C:
            if address == 0x20000000:
                pass
            elif address == 0x20000004:
                pass
            elif address == 0x20000008:
                display["DISPLAY_ENABLED"] = value
                if DEBUG_MODE: print(f"Display {'ENABLED' if display['DISPLAY_ENABLED'] else 'DISABLED'}: {hex(value)}", end="")
            elif address == 0x2000000C:
                pass
        else:
            raise IndexError(f"Invalid write address: {hex(address)}")