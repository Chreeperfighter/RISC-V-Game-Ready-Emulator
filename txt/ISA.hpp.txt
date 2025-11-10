//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef ISA_HPP
#define ISA_HPP
#include <cstdint>

enum class Opcode : uint8_t {
    LOAD        = 0b0000011,
    LOAD_FP     = 0b0000111,
    CUSTOM0     = 0b0001011,
    MISC_MEM    = 0b0001111,
    OP_IMM      = 0b0010011,
    AUIPC       = 0b0010111,
    OP_IMM_32   = 0b0011011,
    RESERVED0   = 0b0011111,

    STORE       = 0b0100011,
    STORE_FP    = 0b0100111,
    CUSTOM1     = 0b0101011,
    AMO         = 0b0101111,
    OP          = 0b0110011,
    LUI         = 0b0110111,
    OP_32       = 0b0111011,
    RESERVED1   = 0b0111111,

    MADD        = 0b1000011,
    MSUB        = 0b1000111,
    NMSUB       = 0b1001011,
    NMADD       = 0b1001111,
    OP_FP       = 0b1010011,
    OP_V        = 0b1010111,
    CUSTOM_2    = 0b1011011,
    RESERVED_2  = 0b1011111,

    BRANCH      = 0b1100011,
    JALR        = 0b1100111,
    RESERVED_3  = 0b1101011,
    JAL         = 0b1101111,
    SYSTEM      = 0b1110011,
    OP_VE       = 0b1110111,
    CUSTOM_3    = 0b1111011,
    RESERVED_4  = 0b1111111
};

enum class Funct3 : uint8_t {
    // BRANCH
    BEQ =   0b000,
    BNE =   0b001,
    BLT =   0b100,
    BGE =   0b101,
    BLTU =  0b110,
    BGEU =  0b111,

    // LOAD
    LB =    0b000,
    LH =    0b001,
    LW =    0b010,
    LBU =   0b100,
    LHU =   0b101,

    // STORE
    SB =    0b000,
    SH =    0b001,
    SW =    0b010,

    // OP_IMM
    ADDI =      0b000,
    SLTI =      0b010,
    SLTIU =     0b011,
    XORI =      0b100,
    ORI =       0b110,
    ANDI =      0b111,
    SLLI =      0b001,
    SRLI_SRAI = 0b101,

    // OP
    ADD_SUB =   0b000,
    SLL =       0b001,
    SLT =       0b010,
    SLTU =      0b011,
    XOR =       0b100,
    SRL_SRA =   0b101,
    OR =        0b110,
    AND =       0b111
};

enum class Funct7 : uint8_t {
    // OP_IMM
    SLLI =  0b0000000,
    SRLI =  0b0000000,
    SRAI =  0b0100000,

    // OP
    ADD =   0b0000000,
    SUB =   0b0100000,
    SRL =   0b0000000,
    SRA =   0b0100000
};

#endif //ISA_HPP
