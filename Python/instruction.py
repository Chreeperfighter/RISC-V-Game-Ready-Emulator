from opcode import Opcode, Funct7, Funct3, Syscall
from utils import to_signed, sign_extend

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
            address = (self.immediate + rs1_value) & 0xFFFFFFFE
            cpu.reg[self.rd] = cpu.pc + 4
            cpu.pc = address
            cpu.update_pc = False
        elif self.opcode == Opcode.LOAD:
            address = (rs1_value + self.immediate) & 0xFFFFFFFF
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
                syscall_id = cpu.reg["a7"]
                if syscall_id == Syscall.EXIT:
                    exit_code = cpu.reg["a0"]
                    print(f"Process finished with exit code {to_signed(exit_code)}")
                    cpu.running = False
                elif syscall_id == Syscall.PRINT:
                    data = cpu.reg["a0"]
                    print(f"dec: {to_signed(data)}, hex: {hex(data)}")
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
                    cpu.update_pc = False
            elif self.funct3 == Funct3.BNE:
                if rs1_value != rs2_value:
                    cpu.pc = cpu.pc + self.immediate
                    cpu.update_pc = False
            elif self.funct3 == Funct3.BLT:
                rs1_value_signed = to_signed(rs1_value)
                rs2_value_signed = to_signed(rs2_value)
                if rs1_value_signed < rs2_value_signed:
                    cpu.pc = cpu.pc + self.immediate
                    cpu.update_pc = False
            elif self.funct3 == Funct3.BLTU:
                if rs1_value < rs2_value:
                    cpu.pc = cpu.pc + self.immediate
                    cpu.update_pc = False
            elif self.funct3 == Funct3.BGE:
                rs1_value_signed = to_signed(rs1_value)
                rs2_value_signed = to_signed(rs2_value)
                if rs1_value_signed >= rs2_value_signed:
                    cpu.pc = cpu.pc + self.immediate
                    cpu.update_pc = False
            elif self.funct3 == Funct3.BGEU:
                if rs1_value >= rs2_value:
                    cpu.pc = cpu.pc + self.immediate
                    cpu.update_pc = False

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
            cpu.reg[self.rd] = cpu.pc + 4
            cpu.pc = cpu.pc + self.immediate
            cpu.update_pc = False