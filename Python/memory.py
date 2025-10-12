import random
from typing import Union

class REG:
    reg_map = {
        "zero": 0,
        "ra": 1,
        "sp": 2,
        "gp": 3,
        "tp": 4,
        "t0": 5,
        "t1": 6,
        "t2": 7,
        "s0": 8,
        "s1": 9,
        "a0": 10,
        "a1": 11,
        "a2": 12,
        "a3": 13,
        "a4": 14,
        "a5": 15,
        "a6": 16,
        "a7": 17,
        "s2": 18,
        "s3": 19,
        "s4": 20,
        "s5": 21,
        "s6": 22,
        "s7": 23,
        "s8": 24,
        "s9": 25,
        "s10": 26,
        "s11": 27,
        "t3": 28,
        "t4": 29,
        "t5": 30,
        "t6": 31
    }

    def __init__(self):
        self._values: list[int] = [0]
        for _ in range(31):
            self._values.append(random.getrandbits(32))

    def __getitem__(self, index: Union[int, str]) -> int:
        if isinstance(index, str):
            try:
                index = self.reg_map[index]
            except KeyError:
                raise IndexError(f"{index} is not a valid register.")
        if not 0 <= index < 32:
            raise IndexError(f"Register index: {index} out of range")
        if index == 0:
            return 0
        return self._values[index] & 0xFFFFFFFF

    def __setitem__(self, index: int, value):
        if not 0 <= index < 32:
            raise IndexError(f"Register index: {index} out of range")
        if index == 0:
            return
        self._values[index] = value & 0xFFFFFFFF

class PC:
    def __init__(self):
        self._value = 0

    def get(self) -> int:
        return self._value & 0xFFFFFFFF

    def set(self, value: int):
        self._value = value & 0xFFFFFFFF

class RAM:
    def __init__(self, size: int):
        self._size = size
        self._values = [random.getrandbits(32) for _ in range(size)]

    def read(self, address: int, length: int):
        value = 0
        for i in range(length, 0, -1):
            value = value << 8
            value |= self._values[address + (i - 1)]

        return value

    def write(self, address: int, value: int, length: int):
        for i in range(length):
            self._values[address + i] = value & 0xFF
            value = value >> 8

class ROM:
    def __init__(self, data: bytes, size: int):
        self._size = size
        self._values = list(data)
        self._values.extend([0] * (size - len(data)))

    def read(self, address: int, length: int):
        value = 0
        for i in range(length, 0, -1):
            value = value << 8
            value |= self._values[address + (i - 1)]

        return value