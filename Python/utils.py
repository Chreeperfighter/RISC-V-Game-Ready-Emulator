def sign_extend(value: int, length: int) -> int:
    if value >> (length - 1) == 0:
        return value
    upper_bits = ((1 << (32 - length)) - 1) << length
    return value | upper_bits

def to_signed(data: int) -> int:
    if data >> 31:
        data -= 0x100000000
    return data