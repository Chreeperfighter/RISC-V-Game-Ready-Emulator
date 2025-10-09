# TODO: Instruction Classes, REG Class, PC Class, separate DECODE and EXECUTE
import random
from enum import IntEnum

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

# OP_IMM
SRLI =  0b0
SRAI =  0b1

class CPU:
    def __init__(self):
        self.reg: list[int] = [0]
        for _ in range(31):
            self.reg.append(random.getrandbits(32))
        self.pc: int = random.getrandbits(32)

    @staticmethod
    def _extract_bits(data: int, lower: int, upper: int) -> int:
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

    def _set_pc(self, value: int) -> None:
        self.pc = value & 0xFFFFFFFF

    def _get_pc(self) -> int:
        return self.pc & 0xFFFFFFFF

    def _set_reg(self, reg_num: int, value: int) -> None:
        if reg_num == 0:
            return
        if not 0 <= reg_num < 32:
            # TODO: Raise Error
            ...
        self.reg[reg_num] = value & 0xFFFFFFFF

    def _get_reg(self, reg_num: int) -> int:
        if reg_num == 0:
            return 0
        if not 0 <= reg_num < 32:
            # TODO: Raise Error
            ...
        return self.reg[reg_num] & 0xFFFFFFFF

    def _extract_b_type(self, data: int):
        imm_11 = self._extract_bits(data, 7, 7)
        imm_4_1 = self._extract_bits(data, 8, 11)
        funct3 = self._extract_bits(data, 12, 14)
        rs1 = self._extract_bits(data, 15, 19)
        rs2 = self._extract_bits(data, 20, 24)
        imm_10_5 = self._extract_bits(data, 25, 30)
        imm_12 = self._extract_bits(data, 31, 31)

        immediate = (imm_4_1 << 1) | (imm_10_5 << 5) | (imm_11 << 11) | (imm_12 << 12)
        immediate = self._sign_extend(immediate, 13)

        return immediate, funct3, rs1, rs2

    def _extract_r_type(self, data: int):
        rd = self._extract_bits(data, 7, 11)
        funct3 = self._extract_bits(data, 12, 14)
        rs1 = self._extract_bits(data, 15, 19)
        rs2 = self._extract_bits(data, 20, 24)
        funct7 = self._extract_bits(data, 25, 31)

        return rd, funct3, rs1, rs2, funct7

    def _extract_u_type(self, data: int):
        rd = self._extract_bits(data, 7, 11)
        imm_31_12 = self._extract_bits(data, 12, 31)

        immediate = imm_31_12 << 12

        return rd, immediate

    def _extract_j_type(self, data: int):
        rd = self._extract_bits(data, 7, 11)
        imm_19_12 = self._extract_bits(data, 12, 19)
        imm_11 = self._extract_bits(data, 20, 20)
        imm_10_1 = self._extract_bits(data, 21, 30)
        imm_20 = self._extract_bits(data, 31, 31)

        immediate = (imm_10_1 << 1) | (imm_11 << 11) | (imm_19_12 << 12) | (imm_20 << 20)
        immediate = self._sign_extend(immediate, 21)
        return rd, immediate

    def _extract_i_type(self, data: int):
        rd = self._extract_bits(data, 7, 11)
        funct3 = self._extract_bits(data, 12, 14)
        rs1 = self._extract_bits(data, 15, 19)
        imm_11_0 = self._extract_bits(data, 20, 31)

        immediate = self._sign_extend(imm_11_0, 12)

        return rd, funct3, rs1, immediate

    def decode(self, data: int):
        update_pc = True

        opcode = self._extract_bits(data, 0, 6)
        # 2.4.1. Integer Register-Immediate Instructions
        # Page 48
        if opcode == Opcode.OP_IMM:
            rd, funct3, rs1, immediate = self._extract_i_type(data)

            if funct3 == Funct3.ADDI:
                self._set_reg(rd, self._get_reg(rs1) + immediate)
            elif funct3 == Funct3.SLTI:
                if self._to_signed(self._get_reg(rs1)) < self._to_signed(immediate):
                    self._set_reg(rd, 1)
                else:
                    self._set_reg(rd, 0)
            elif funct3 == Funct3.SLTIU:
                if self._get_reg(rs1) < immediate:
                    self._set_reg(rd, 1)
                else:
                    self._set_reg(rd, 0)
            elif funct3 == Funct3.ANDI:
                self._set_reg(rd, self._get_reg(rs1) & immediate)
            elif funct3 == Funct3.ORI:
                self._set_reg(rd, self._get_reg(rs1) | immediate)
            elif funct3 == Funct3.XORI:
                self._set_reg(rd, self._get_reg(rs1) ^ immediate)
            elif funct3 == Funct3.SLLI:
                shamt_4_0 = immediate & 0x1F
                self._set_reg(rd, self._get_reg(rs1) << shamt_4_0)
            elif funct3 == Funct3.SRLI_SRAI:
                shift_type = (data >> 30) & 0x1
                shamt_4_0 = immediate & 0x1F
                if shift_type == SRLI:
                    self._set_reg(rd, self._get_reg(rs1) >> shamt_4_0)
                elif shift_type == SRAI:
                    self._set_reg(rd, self._to_signed(self._get_reg(rs1)) >> shamt_4_0)
        elif opcode == Opcode.LUI:
            rd, immediate = self._extract_u_type(data)
            self._set_reg(rd, immediate)
        elif opcode == Opcode.AUIPC:
            rd, immediate = self._extract_u_type(data)
            self._set_reg(rd, self.pc + immediate)
        # 2.4.2. Integer Register-Register Operations
        # Page 49
        elif opcode == Opcode.OP:
            rd, funct3, rs1, rs2, funct7 = self._extract_r_type(data)
            if funct3 == Funct3.ADD_SUB:
                if funct7 == Funct7.ADD:
                    self._set_reg(rd, self._get_reg(rs1) + self._get_reg(rs2))
                elif funct7 == Funct7.SUB:
                    self._set_reg(rd, self._get_reg(rs1) - self._get_reg(rs2))
            elif funct3 == Funct3.SLT:
                if self._to_signed(self._get_reg(rs1)) < self._to_signed(self._get_reg(rs2)):
                    self._set_reg(rd, 1)
                else:
                    self._set_reg(rd, 0)
            elif funct3 == Funct3.SLTU:
                if self._get_reg(rs1) < self._get_reg(rs2):
                    self._set_reg(rd, 1)
                else:
                    self._set_reg(rd, 0)
            elif funct3 == Funct3.AND:
                self._set_reg(rd, self._get_reg(rs1) & self._get_reg(rs2))
            elif funct3 == Funct3.OR:
                self._set_reg(rd, self._get_reg(rs1) | self._get_reg(rs2))
            elif funct3 == Funct3.XOR:
                self._set_reg(rd, self._get_reg(rs1) ^ self._get_reg(rs2))
            elif funct3 == Funct3.SLL:
                shamt_4_0 = self._get_reg(rs2) & 0x1F
                self._set_reg(rd, self._get_reg(rs1) << shamt_4_0)
            elif funct3 == Funct3.SRL_SRA:
                if funct7 == Funct7.SRL:
                    shamt_4_0 = self._get_reg(rs2) & 0x1F
                    self._set_reg(rd, self._get_reg(rs1) >> shamt_4_0)
                elif funct7 == Funct7.SRA:
                    shamt_4_0 = self._get_reg(rs2) & 0x1F
                    self._set_reg(rd, self._to_signed(self._get_reg(rs1)) >> shamt_4_0)
        # 2.5.1. Unconditional Jumps
        # Page 50
        # TODO: The JAL and JALR instructions will generate an instruction-address-misaligned exception if the target
        #       address is not aligned to a four-byte boundary.
        elif opcode == Opcode.JAL:
            rd, immediate = self._extract_j_type(data)
            self._set_reg(rd, self._get_pc() + 4)
            self._set_pc(self._get_pc() + immediate)
            update_pc = False
        elif opcode == Opcode.JALR:
            rd, funct3, rs1, immediate = self._extract_i_type(data)
            self._set_reg(rd, self._get_pc() + 4)
            destination = (self._get_reg(rs1) + immediate) & ~1
            self._set_pc(destination)
            update_pc = False
        # 2.5.2. Conditional Branches
        # Page 52
        elif opcode == Opcode.BRANCH:
            immediate, funct3, rs1, rs2 = self._extract_b_type(data)
            destination = self._get_pc() + immediate
            if funct3 == Funct3.BEQ:
                if self._get_reg(rs1) == self._get_reg(rs2):
                    self._set_pc(destination)
                    update_pc = False
            elif funct3 == Funct3.BNE:
                if self._get_reg(rs1) != self._get_reg(rs2):
                    self._set_pc(destination)
                    update_pc = False
            elif funct3 == Funct3.BLT:
                if self._to_signed(self._get_reg(rs1)) < self._to_signed(self._get_reg(rs2)):
                    self._set_pc(destination)
                    update_pc = False
            elif funct3 == Funct3.BLTU:
                if self._get_reg(rs1) < self._get_reg(rs2):
                    self._set_pc(destination)
                    update_pc = False
            elif funct3 == Funct3.BGE:
                if self._to_signed(self._get_reg(rs1)) >= self._to_signed(self._get_reg(rs2)):
                    self._set_pc(destination)
                    update_pc = False
            elif funct3 == Funct3.BGEU:
                if self._get_reg(rs1) >= self._get_reg(rs2):
                    self._set_pc(destination)
                    update_pc = False
            return update_pc
        # 2.6. Load and Store Instructions
        # Page 54