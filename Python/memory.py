import random
from typing import Union

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

reg_map_flipped = {v: k for k, v in reg_map.items()}

def get_reg_name(reg):
    return reg_map_flipped[reg]

class REG:
    def __init__(self):
        self._values: list[int] = [0]
        for _ in range(31):
            self._values.append(random.getrandbits(32))

    def __getitem__(self, index: Union[int, str]) -> int:
        if isinstance(index, str):
            try:
                index = reg_map[index]
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

    def dump(self):
        string = []
        for i, value in enumerate(self._values):
            name = get_reg_name(i)
            string.append(f"{name} [{hex(i)}]: {hex(value)}[{value}]")
        return "\n".join(string)

class PC:
    def __init__(self):
        self._value = 0

    def get(self) -> int:
        return self._value & 0xFFFFFFFF

    def set(self, value: int):
        self._value = value & 0xFFFFFFFF