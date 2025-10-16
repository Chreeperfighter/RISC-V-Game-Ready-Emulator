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
    # OP_IMM
    SLLI =  0b0000000
    SRLI =  0b0000000
    SRAI =  0b0100000

    # OP
    ADD =   0b0000000
    SUB =   0b0100000
    SRL =   0b0000000
    SRA =   0b0100000

class Syscall(IntEnum):
    PUT_CHAR = 1
    # a0 -> char to print
    GET_CHAR = 2
    # a0 <- char
    READ = 63
    # a0 -> fd (0 = stdin)
    # a1 -> buffer address
    # a2 -> max length
    # a0 <- bytes read
    WRITE = 64
    # a0 -> fd (0 = stdin)
    # a1 -> buffer address
    # a2 -> number of bytes
    # a0 <- bytes written
    GET_SCREEN_WIDTH = 200
    # a0 <- screen width
    GET_SCREEN_HEIGHT = 201
    # a0 <- screen height
    DISPLAY_ENABLE = 202
    # a0 -> display enable
    DISPLAY_STATUS = 203
    # a0 <- display status
    GET_CYCLES = 100
    # a0 <- lower 32 bit
    # a1 <- upper 32 bit
    EXIT =  10
    # a0 -> exit code