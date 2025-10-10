# TODO: Instruction Classes, REG Class, PC Class, separate DECODE and EXECUTE
import random
from enum import IntEnum

def sign_extend(value: int, length: int) -> int:
    if value >> (length - 1) == 0:
        return value
    upper_bits = ((1 << (32 - length)) - 1) << length
    return value | upper_bits

def to_signed(data: int) -> int:
    if data >> 31:
        data -= 0x100000000
    return data

class Opcode(IntEnum):
    LOAD        = 0b00_000_11
    LOAD_FP     = 0b00_001_11
    CUSTOM_0    = 0b00_010_11
    MISC_MEM    = 0b00_011_11
    OP_IMM      = 0b00_100_11
    AUIPC       = 0b00_101_11
    OP_IMM_32   = 0b00_110_11
    RESERVED_0  = 0b00_111_11

    STORE       = 0b01_000_11
    STORE_FP    = 0b01_001_11
    CUSTOM_1    = 0b01_010_11
    AMO         = 0b01_011_11
    OP          = 0b01_100_11
    LUI         = 0b01_101_11
    OP_32       = 0b01_110_11
    RESERVED_1  = 0b01_111_11

    MADD        = 0b10_000_11
    MSUB        = 0b10_001_11
    NMSUB       = 0b10_010_11
    NMADD       = 0b10_011_11
    OP_FP       = 0b10_100_11
    OP_V        = 0b10_101_11
    CUSTOM_2    = 0b10_110_11
    RESERVED_2  = 0b10_111_11

    BRANCH      = 0b11_000_11
    JALR        = 0b11_001_11
    RESERVED_3  = 0b11_010_11
    JAL         = 0b11_011_11
    SYSTEM      = 0b11_100_11
    OP_VE       = 0b11_101_11
    CUSTOM_3    = 0b11_110_11
    RESERVED_4  = 0b11_111_11

class Funct3(IntEnum):
    # BRANCH
    BEQ =   0b000
    BNE =   0b001
    BLT =   0b100
    BGE =   0b101
    BLTU =  0b110
    BGEU =  0b111

    # LOAD
    LB =    0b000
    LH =    0b001
    LW =    0b010
    LBU =   0b100
    LHU =   0b101

    # STORE
    SB =    0b000
    SH =    0b001
    SW =    0b010

    # OP_IMM
    ADDI =      0b000
    SLTI =      0b010
    SLTIU =     0b011
    XORI =      0b100
    ORI =       0b110
    ANDI =      0b111
    SLLI =      0b001
    SRLI_SRAI = 0b101

    # OP
    ADD_SUB =   0b000
    SLL =       0b001
    SLT =       0b010
    SLTU =      0b011
    XOR =       0b100
    SRL_SRA =   0b101
    OR =        0b110
    AND =       0b111

class Funct7(IntEnum):
    # OP_IMM
    SLLI =  0b0000000
    SRLI =  0b0000000
    SRAI =  0b0100000

    # OP
    ADD =   0b0000000
    SUB =   0b0100000
    SRL =   0b0000000
    SRA =   0b0100000

class Instruction:
    def __init__(self, data):
        self.data = data
        self.opcode = data & 0x7F

    def _extract_bits(self, lower: int, upper: int) -> int:
        mask = (1 << (upper - lower + 1)) - 1
        return (self.data >> lower) & mask

    def execute(self, cpu):
        pass

class RInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        self.rd     = self._extract_bits(7, 11)
        self.funct3 = self._extract_bits(12, 14)
        self.rs1    = self._extract_bits(15, 19)
        self.rs2    = self._extract_bits(20, 24)
        self.funct7 = self._extract_bits(25, 31)

    def execute(self, cpu):
        rs1_value = cpu.reg[self.rs1]
        rs2_value = cpu.reg[self.rs2]
        if self.opcode == Opcode.OP:
            if self.funct3 == Funct3.ADD_SUB:
                if self.funct7 == Funct7.ADD:
                    cpu.reg[self.rd] = rs1_value + rs2_value
                elif self.funct7 == Funct7.SUB:
                    cpu.reg[self.rd] = rs1_value - rs2_value
            elif self.funct3 == Funct3.SLT:
                rs1_value_signed = to_signed(rs1_value)
                rs2_value_signed = to_signed(rs2_value)
                if rs1_value_signed < rs2_value_signed:
                    cpu.reg[self.rd] = 1
                else:
                    cpu.reg[self.rd] = 0
            elif self.funct3 == Funct3.SLTU:
                if rs1_value < rs2_value:
                    cpu.reg[self.rd] = 1
                else:
                    cpu.reg[self.rd] = 0
            elif self.funct3 == Funct3.AND:
                cpu.reg[self.rd] = rs1_value & rs2_value
            elif self.funct3 == Funct3.OR:
                cpu.reg[self.rd] = rs1_value | rs2_value
            elif self.funct3 == Funct3.XOR:
                cpu.reg[self.rd] = rs1_value ^ rs2_value
            elif self.funct3 == Funct3.SLL:
                shift_amount = rs2_value & 0x1F
                cpu.reg[self.rd] = rs1_value << shift_amount
            elif self.funct3 == Funct3.SRL_SRA:
                shift_amount = rs2_value & 0x1F
                if self.funct7 == Funct7.SRL:
                    cpu.reg[self.rd] = rs1_value>> shift_amount
                elif self.funct7 == Funct7.SRA:
                    rs1_value_signed = to_signed(rs1_value)
                    cpu.reg[self.rd] = rs1_value_signed >> shift_amount

class IInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        self.rd         = self._extract_bits(7, 11)
        self.funct3     = self._extract_bits(12, 14)
        self.rs1        = self._extract_bits(15, 19)
        imm_11_0        = self._extract_bits(20, 31)
        self.immediate  = sign_extend(imm_11_0, 12)

    def execute(self, cpu: "CPU"):
        rs1_value = cpu.reg[self.rs1]
        if self.opcode == Opcode.OP_IMM:
            if self.funct3 == Funct3.ADDI:
                cpu.reg[self.rd] = rs1_value + self.immediate
            elif self.funct3 == Funct3.SLTI:
                rs1_value_signed = to_signed(rs1_value)
                immediate_signed = to_signed(self.immediate)
                if rs1_value_signed < immediate_signed:
                    cpu.reg[self.rd] = 1
                else:
                    cpu.reg[self.rd] = 0
            elif self.funct3 == Funct3.SLTIU:
                if rs1_value < self.immediate:
                    cpu.reg[self.rd] = 1
                else:
                    cpu.reg[self.rd] = 0
            elif self.funct3 == Funct3.ANDI:
                cpu.reg[self.rd] = rs1_value & self.immediate
            elif self.funct3 == Funct3.ORI:
                cpu.reg[self.rd] = rs1_value | self.immediate
            elif self.funct3 == Funct3.XORI:
                cpu.reg[self.rd] = rs1_value ^ self.immediate
            elif self.funct3 == Funct3.SLLI:
                shift_amount = self.immediate & 0x1F
                funct7 = self._extract_bits(25, 31)
                if funct7 == Funct7.SLLI:
                    cpu.reg[self.rd] = rs1_value << shift_amount
            elif self.funct3 == Funct3.SRLI_SRAI:
                shift_amount = self.immediate & 0x1F
                funct7 = self._extract_bits(25, 31)
                if funct7 == Funct7.SRLI:
                    cpu.reg[self.rd] = rs1_value >> shift_amount
                elif funct7 == Funct7.SRAI:
                    rs1_value_signed = to_signed(rs1_value)
                    cpu.reg[self.rd] = rs1_value_signed >> shift_amount
        elif self.opcode == Opcode.JALR:
            offset = (self.immediate + rs1_value) & 0xFFFFFFFE
            cpu.reg[self.rd] = cpu.pc + 4
            cpu.pc = cpu.pc + offset
        elif self.opcode == Opcode.LOAD:
            address = rs1_value + self.immediate
            if self.funct3 == Funct3.LW:
                cpu.reg[self.rd] = cpu.mcu.read(address, 4)
            elif self.funct3 == Funct3.LH:
                value = cpu.mcu.read(address, 2)
                cpu.reg[self.rd] = sign_extend(value, 16)
            elif self.funct3 == Funct3.LHU:
                cpu.reg[self.rd] = cpu.mcu.read(address, 2)
            elif self.funct3 == Funct3.LB:
                value = cpu.mcu.read(address, 1)
                cpu.reg[self.rd] = sign_extend(value, 8)
            elif self.funct3 == Funct3.LBU:
                cpu.reg[self.rd] = cpu.mcu.read(address, 1)
        elif self.opcode == Opcode.MISC_MEM:
            if self.funct3 == 0b000:
                fm = (self.data >> 28) & 0xF
                # TODO: Understand ts
                # PAUSE / FENCE
                if fm == 0x0:
                    ...
                # FENCE.TSO
                elif fm == 0x8:
                    ...
            else:
                # TODO: Error
                ...
        elif self.opcode == Opcode.SYSTEM:
            priv = self.funct3
            func12 = self.immediate & 0xFFF
            # TODO: Implement ts
            # ECALL
            if func12 == 0x0:
                ...
            # EBREAK
            elif func12 == 0x1:
                ...

class SInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        imm_4_0     = self._extract_bits(7, 11)
        self.funct3 = self._extract_bits(12, 14)
        self.rs1    = self._extract_bits(15, 19)
        self.rs2    = self._extract_bits(20, 24)
        imm_11_5    = self._extract_bits(25, 31)
        imm = (imm_11_5 << 5) | imm_4_0
        self.immediate = sign_extend(imm, 12)

    def execute(self, cpu):
        rs1_value = cpu.reg[self.rs1]
        rs2_value = cpu.reg[self.rs2]
        if self.opcode == Opcode.STORE:
            address = rs1_value + self.immediate
            if self.funct3 == Funct3.SW:
                cpu.mcu.write(address, rs2_value, 4)
            elif self.funct3 == Funct3.SH:
                cpu.mcu.write(address, rs2_value, 2)
            elif self.funct3 == Funct3.SB:
                cpu.mcu.write(address, rs2_value, 1)

class BInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        imm_11      = self._extract_bits(7, 7)
        imm_4_1     = self._extract_bits(8, 11)
        self.funct3 = self._extract_bits(12, 14)
        self.rs1    = self._extract_bits(15, 19)
        self.rs2    = self._extract_bits(20, 24)
        imm_10_5    = self._extract_bits(25, 30)
        imm_12      = self._extract_bits(31, 31)
        imm = (imm_12 << 12) | (imm_11 << 11) | (imm_10_5 << 5) | (imm_4_1 << 1)
        self.immediate = sign_extend(imm, 13)

    def execute(self, cpu):
        rs1_value = cpu.reg[self.rs1]
        rs2_value = cpu.reg[self.rs2]
        if self.opcode == Opcode.BRANCH:
            if self.funct3 == Funct3.BEQ:
                if rs1_value == rs2_value:
                    cpu.pc = cpu.pc + self.immediate
            elif self.funct3 == Funct3.BNE:
                if rs1_value != rs2_value:
                    cpu.pc = cpu.pc + self.immediate
            elif self.funct3 == Funct3.BLT:
                rs1_value_signed = to_signed(rs1_value)
                rs2_value_signed = to_signed(rs2_value)
                if rs1_value_signed < rs2_value_signed:
                    cpu.pc = cpu.pc + self.immediate
            elif self.funct3 == Funct3.BLTU:
                if rs1_value < rs2_value:
                    cpu.pc = cpu.pc + self.immediate
            elif self.funct3 == Funct3.BGE:
                rs1_value_signed = to_signed(rs1_value)
                rs2_value_signed = to_signed(rs2_value)
                if rs1_value_signed >= rs2_value_signed:
                    cpu.pc = cpu.pc + self.immediate
            elif self.funct3 == Funct3.BGEU:
                if rs1_value >= rs2_value:
                    cpu.pc = cpu.pc + self.immediate

class UInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        self.rd     = self._extract_bits(7, 11)
        imm_31_12   = self._extract_bits(12, 31)
        self.immediate = imm_31_12 << 12

    def execute(self, cpu):
        if self.opcode == Opcode.LUI:
            cpu.reg[self.rd] = self.immediate
        elif self.opcode == Opcode.AUIPC:
            cpu.reg[self.rd] = self.immediate + cpu.pc

class JInstruction(Instruction):
    def __init__(self, data):
        super().__init__(data)
        self._decode()

    def _decode(self):
        self.rd     = self._extract_bits(7, 11)
        imm_19_12   = self._extract_bits(12, 19)
        imm_11      = self._extract_bits(20, 20)
        imm_10_1    = self._extract_bits(21, 30)
        imm_20      = self._extract_bits(31, 31)
        imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1)
        self.immediate = sign_extend(imm, 21)

    def execute(self, cpu):
        if self.opcode == Opcode.JAL:
            cpu.pc = cpu.pc + self.immediate
            cpu.reg[self.rd] = cpu.pc + 4

class REG:
    def __init__(self):
        self._values: list[int] = [0]
        for _ in range(31):
            self._values.append(random.getrandbits(32))

    def __getitem__(self, index: int):
        if 0 <= index < 32:
            # TODO: Raise Error
            ...
        if index == 0:
            return 0
        return self._values[index] & 0xFFFFFFFF

    def __setitem__(self, index: int, value):
        if 0 <= index < 32:
            # TODO: Raise Error
            ...
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


class MCU:
    def __init__(self):
        self._rom = ROM(b"", size= 0x10000)
        self._ram = RAM(size=0x20000)

    def read(self, address: int, length: int):
        if 0x00000000 <= address < 0x00010000:
            return self._rom.read(address, length)
        elif 0x80000000 <= address < 0x8020000:
            return self._ram.read(address, length)
        else:
            # TODO: Error
            ...

    def write(self, address: int, value: int, length: int):
        if 0x00000000 <= address < 0x00010000:
            # TODO: Error
            ...
        elif 0x80000000 <= address < 0x8020000:
            self._ram.write(address, value, length)
        else:
            # TODO: Error
            ...
# MISC
# MISC_MEM
# TODO: Figure this shit out

# SYSTEM
# TODO: Figure this shit out

# OP_IMM
SRLI =  0b0
SRAI =  0b1

class CPU:
    def __init__(self):
        self.reg = REG()
        self._pc = PC()
        self.mcu = MCU()

    @property
    def pc(self):
        return self._pc.get()

    @pc.setter
    def pc(self, value):
        self._pc.set(value)

    def step(self):
        data = self.fetch()
        instruction: Instruction = self.decode(data)
        instruction.execute(self)

    def fetch(self):
        return self.mcu.read(self.pc, 4)

    @staticmethod
    def decode(data: int) -> Instruction:
        opcode = data & 0x7F

        if opcode == Opcode.OP_IMM:
            return IInstruction(data)
        elif opcode == Opcode.LUI:
            return UInstruction(data)
        elif opcode == Opcode.AUIPC:
            return UInstruction(data)
        elif opcode == Opcode.OP:
            return RInstruction(data)
        elif opcode == Opcode.JAL:
            return JInstruction(data)
        elif opcode == Opcode.JALR:
            return IInstruction(data)
        elif opcode == Opcode.BRANCH:
            return BInstruction(data)
        elif opcode == Opcode.LOAD:
            return IInstruction(data)
        elif opcode == Opcode.STORE:
            return SInstruction(data)
        elif opcode == Opcode.MISC_MEM:
            return IInstruction(data)
        elif opcode == Opcode.SYSTEM:
            return IInstruction(data)

        return Instruction(data)