from memory import REG, PC
from mcu import MCU
from instruction import Instruction, IInstruction, BInstruction, RInstruction, JInstruction, SInstruction, UInstruction
from opcode import Opcode

class CPU:
    def __init__(self, rom_data: bytes):
        self.reg = REG()
        self._pc = PC()
        self.mcu = MCU(rom_data)
        self.update_pc = None
        self.running = True

    @property
    def pc(self):
        return self._pc.get()

    @pc.setter
    def pc(self, value):
        self._pc.set(value)

    def step(self):
        self.update_pc = True
        data = self.fetch()
        instruction: Instruction = self.decode(data)
        instruction.execute(self)
        if self.update_pc:
            self.pc = self.pc + 4

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