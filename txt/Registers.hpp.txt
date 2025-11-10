//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef REGISTERS_HPP
#define REGISTERS_HPP

#include <cstdint>
#include <array>

static const char* register_names[32] = {
    "x0/zero",  "x1/ra",  "x2/sp",  "x3/gp",
    "x4/tp",    "x5/t0",  "x6/t1",  "x7/t2",
    "x8/s0/fp", "x9/s1",  "x10/a0", "x11/a1",
    "x12/a2",   "x13/a3", "x14/a4", "x15/a5",
    "x16/a6",   "x17/a7", "x18/s2", "x19/s3",
    "x20/s4",   "x21/s5", "x22/s6", "x23/s7",
    "x24/s8",   "x25/s9", "x26/s10","x27/s11",
    "x28/t3",   "x29/t4", "x30/t5","x31/t6"
};

enum class Register : uint8_t {
    // Register numbers (x0-x31)
    x0  = 0,   // zero - hardwired zero
    x1  = 1,   // ra - return address
    x2  = 2,   // sp - stack pointer
    x3  = 3,   // gp - global pointer
    x4  = 4,   // tp - thread pointer
    x5  = 5,   // t0 - temporary
    x6  = 6,   // t1
    x7  = 7,   // t2
    x8  = 8,   // s0/fp - saved/frame pointer
    x9  = 9,   // s1 - saved
    x10 = 10,  // a0 - argument/return value
    x11 = 11,  // a1 - argument/return value
    x12 = 12,  // a2 - argument
    x13 = 13,  // a3
    x14 = 14,  // a4
    x15 = 15,  // a5
    x16 = 16,  // a6
    x17 = 17,  // a7
    x18 = 18,  // s2 - saved
    x19 = 19,  // s3
    x20 = 20,  // s4
    x21 = 21,  // s5
    x22 = 22,  // s6
    x23 = 23,  // s7
    x24 = 24,  // s8
    x25 = 25,  // s9
    x26 = 26,  // s10
    x27 = 27,  // s11
    x28 = 28,  // t3 - temporary
    x29 = 29,  // t4
    x30 = 30,  // t5
    x31 = 31,  // t6
    
    // ABI names (aliases)
    zero = 0,
    ra   = 1,
    sp   = 2,
    gp   = 3,
    tp   = 4,
    t0   = 5,
    t1   = 6,
    t2   = 7,
    s0   = 8,
    fp   = 8,  // s0 and fp are the same
    s1   = 9,
    a0   = 10,
    a1   = 11,
    a2   = 12,
    a3   = 13,
    a4   = 14,
    a5   = 15,
    a6   = 16,
    a7   = 17,
    s2   = 18,
    s3   = 19,
    s4   = 20,
    s5   = 21,
    s6   = 22,
    s7   = 23,
    s8   = 24,
    s9   = 25,
    s10  = 26,
    s11  = 27,
    t3   = 28,
    t4   = 29,
    t5   = 30,
    t6   = 31,
};

class Registers {
public:
    static constexpr size_t NUM_REGS = 32;

    uint32_t read(const uint8_t index) const noexcept {
        return regs[index];
    }

    uint32_t read(const Register index) const noexcept {
        return regs[static_cast<uint8_t>(index)];
    }

    void write(const uint8_t index, const uint32_t value) noexcept {
        if (index != 0) {
            regs[index] = value;
        }
    }

    void write(const Register index, const uint32_t value) noexcept {
        if (index != Register::zero) {
            regs[static_cast<uint8_t>(index)] = value;
        }
    }

    std::array<uint32_t, NUM_REGS> get_registers() const noexcept {
        return regs;
    }

private:
    std::array<uint32_t, NUM_REGS> regs{};
    uint32_t dummy = 0;
};




#endif //REGISTERS_HPP
