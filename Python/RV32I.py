import random

# Opcodes
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

# funct3
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

# funct7
# OP_IMM
SRLI =  0b0000000
SRAI =  0b0100000

# OP
ADD =   0b0000000
SUB =   0b0100000
SRL =   0b0000000
SRA =   0b0100000

# MISC
# MISC_MEM
# TODO: Figure this shit out

# SYSTEM
# TODO: Figure this shit out

class CPU:
    def __init__(self):
        self.reg: list[int] = [0]
        for _ in range(31):
            self.reg.append(random.getrandbits(32))
        self.pc: int = random.getrandbits(32)

    @staticmethod
    def _extract_bytes(data: int, lower: int, upper: int) -> int:
        mask = (1 << (upper - lower + 1)) - 1
        return (data >> lower) & mask

    @staticmethod
    def _sign_extend(data: int, length: int) -> int:
        if data >> (length - 1) == 0:
            return data
        upper_bits = ((1 << (32 - length)) - 1) << length
        return data | upper_bits

    @staticmethod
    def _to_signed(data: int) -> int:
        if data >> 31:
            data -= 0x100000000
        return data

    def _decode_r_type(self, data: int):
        opcode = self._extract_bytes(data, 0, 6)
        rd = self._extract_bytes(data, 7, 11)
        funct3 = self._extract_bytes(data, 12, 14)
        rs1 = self._extract_bytes(data, 15, 19)
        rs2 = self._extract_bytes(data, 20, 24)
        funct7 = self._extract_bytes(data, 25, 31)

    def _decode_i_type(self, data: int):
        opcode = self._extract_bytes(data, 0, 6)
        rd = self._extract_bytes(data, 7, 11)
        funct3 = self._extract_bytes(data, 12, 14)
        rs1 = self._extract_bytes(data, 15, 19)
        imm_11_0 = self._extract_bytes(data, 20, 31)

        immediate = self._sign_extend(imm_11_0, 12)

        # Page 48
        # 2.4.1. Integer Register-Immediate Instructions
        if opcode == ADDI:
            self.reg[rd] = (self.reg[rs1] + immediate) & 0xFFFFFFFF
        elif opcode == SLTI:
            if self.reg[rs1] < self._to_signed(immediate):
                self.reg[rd] = 1
            else:
                self.reg[rd] = 0
        elif opcode == SLTIU:
            if self.reg[rs1] < immediate:
                self.reg[rd] = 1
            else:
                self.reg[rd] = 0
        elif opcode == ANDI:
            self.reg[rd] = (self.reg[rs1] & immediate) & 0xFFFFFFFF
        elif opcode == ORI:
            self.reg[rd] = (self.reg[rs1] | immediate) & 0xFFFFFFFF
        elif opcode == XORI:
            self.reg[rd] = (self.reg[rs1] ^ immediate) & 0xFFFFFFFF