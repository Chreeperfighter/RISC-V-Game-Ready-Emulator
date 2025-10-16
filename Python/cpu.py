from elf_loader import load_elf
from memory import REG, PC
from mcu import MCU
from instruction import Instruction, IInstruction, BInstruction, RInstruction, JInstruction, SInstruction, UInstruction
from isa import Opcode

class CPU:
    def __init__(self):
        self.reg = REG()
        self._pc = PC()
        self.mcu = MCU()
        self.update_pc = None
        self.running = True
        self.on_break = None
        self.step_once = False
        self.cycles = 0
        self.breakpoints = []

    def add_breakpoint(self, addr):
        self.breakpoints.append(addr)

    def load_elf(self, filename):
        return load_elf(filename, self)

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
        if self.step_once:
            self.step_once = False
            if self.on_break:
                self.on_break(self)
        elif self.pc in self.breakpoints:
            if self.on_break:
                self.on_break(self)
        instruction.execute(self)
        if self.update_pc:
            self.pc = self.pc + 4
        self.cycles += 1

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