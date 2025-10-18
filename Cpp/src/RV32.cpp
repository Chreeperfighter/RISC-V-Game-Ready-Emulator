//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "ISA.hpp"
#include <cstdint>
#include <random>
#include <iostream>

RV32::RV32(const bool randomizeRegs, const bool randomizeMemory) : rng(std::random_device{}()),
                                                                   pc(0),
                                                                   regs{},
                                                                   running(true),
                                                                    update_pc(true),
                                                                   ram(Config::RAM_SIZE, 0) {
    init_regs(randomizeRegs);
    if (randomizeMemory) {
        for (auto &byte: ram) {
            byte = static_cast<uint8_t>(rng());
        }
    }
}

void RV32::print_inst(DecodedInstruction inst) {
    std::cerr << "opcode=" << static_cast<int>(inst.opcode)
            << " funct3=" << static_cast<int>(inst.funct3)
            << " funct7=" << static_cast<int>(inst.funct7) << std::endl;
}

void RV32::load_bin(const uint8_t* bin, size_t size, uint32_t start_address) {
    memcpy(&ram[start_address], bin, size);
}

void RV32::step() {
    update_pc = true;
    const uint32_t data = fetch();
    const DecodedInstruction instruction = decode(data);
    execute(instruction);
    if (update_pc) {
        pc += 4;
    }
}

uint32_t RV32::fetch() const {
    return read_u32(pc);
}

DecodedInstruction RV32::decode(const uint32_t data) {
    const auto opcode = static_cast<Opcode>(data & 0x7F);
    DecodedInstruction instruction{};
    instruction.opcode = opcode;
    switch (opcode) {
        case Opcode::OP:
            decode_r_type(instruction, data);
            break;
        case Opcode::OP_IMM:
        case Opcode::JALR:
        case Opcode::LOAD:
        case Opcode::MISC_MEM:
        case Opcode::SYSTEM:
            decode_i_type(instruction, data);
            break;
        case Opcode::STORE:
            decode_s_type(instruction, data);
            break;
        case Opcode::BRANCH:
            decode_b_type(instruction, data);
            break;
        case Opcode::LUI:
        case Opcode::AUIPC:
            decode_u_type(instruction, data);
            break;
        case Opcode::JAL:
            decode_j_type(instruction, data);
            break;
        default:
            std::cerr << "Unknown opcode: " << static_cast<int>(opcode) << "\n";
            break;
    }
    return instruction;
}

void RV32::execute(const DecodedInstruction inst) {
    switch (inst.opcode) {

        // R-Type
        case Opcode::OP: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);
            const auto rs2_value = static_cast<int32_t>(regs[inst.rs2]);

            switch (inst.funct3) {
                case Funct3::ADD_SUB: {
                    switch (inst.funct7) {
                        case Funct7::ADD:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value + rs2_value);
                            break;
                        case Funct7::SUB:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value - rs2_value);
                            break;
                        default:
                            print_inst(inst);
                            break;
                    }
                    break;
                }
                case Funct3::SLT: {
                    regs[inst.rd] = (rs1_value < rs2_value) ? 1 : 0;
                    break;
                }
                case Funct3::SLTU: {
                    regs[inst.rd] = (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(rs2_value)) ? 1 : 0;
                    break;
                }
                case Funct3::AND: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value & rs2_value);
                    break;
                }
                case Funct3::OR: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value | rs2_value);
                    break;
                }
                case Funct3::XOR: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value ^ rs2_value);
                    break;
                }
                case Funct3::SLL: {
                    const auto amount = static_cast<uint8_t>(rs1_value & 0x1F);
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value << amount);
                    break;
                }
                case Funct3::SRL_SRA: {
                    const auto amount = static_cast<uint8_t>(rs1_value & 0x1F);
                    switch (inst.funct7) {
                        case Funct7::SRL:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value) >> amount;
                            break;
                        case Funct7::SRA:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value >> amount);
                            break;
                        default:
                            print_inst(inst);
                            break;
                    }
                    break;
                }
                default:
                    print_inst(inst);
                    break;
            }
            break;
        }

        // I-Type
        case Opcode::OP_IMM: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);

            switch (inst.funct3) {
                case Funct3::ADDI: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value + inst.imm);
                    break;
                }
                case Funct3::SLTI: {
                    regs[inst.rd] = (rs1_value < inst.imm) ? 1 : 0;
                    break;
                }
                case Funct3::SLTIU: {
                    regs[inst.rd] = (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(inst.imm)) ? 1 : 0;
                    break;
                }
                case Funct3::ANDI: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value & inst.imm);
                    break;
                }
                case Funct3::ORI: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value | inst.imm);
                    break;
                }
                case Funct3::XORI: {
                    regs[inst.rd] = static_cast<uint32_t>(rs1_value ^ inst.imm);
                    break;
                }
                case Funct3::SLLI: {
                    const auto amount = static_cast<uint8_t>(rs1_value & 0x1F);
                    if (inst.funct7 == Funct7::SLLI) {
                        regs[inst.rd] = static_cast<uint32_t>(rs1_value << amount);
                    } else {
                        print_inst(inst);
                    }
                    break;
                }
                case Funct3::SRLI_SRAI: {
                    const auto amount = static_cast<uint8_t>(rs1_value & 0x1F);
                    switch (inst.funct7) {
                        case Funct7::SRLI:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value) >> amount;
                            break;
                        case Funct7::SRAI:
                            regs[inst.rd] = static_cast<uint32_t>(rs1_value >> amount);
                            break;
                        default:
                            print_inst(inst);
                            break;
                    }
                    break;
                }
                default:
                    print_inst(inst);
                    break;
            }
            break;
        }

        case Opcode::JALR: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);
            const uint32_t address = static_cast<uint32_t>(rs1_value + inst.imm) & 0xFFFFFFFE;
            regs[inst.rd] = pc + 4;
            pc = address;
            update_pc = false;
            break;
        }

        case Opcode::LOAD: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);
            const auto address = static_cast<uint32_t>(rs1_value + inst.imm);
            switch (inst.funct3) {
                case Funct3::LW: {
                    regs[inst.rd] = read_u32(address);
                    break;
                }
                case Funct3::LH: {
                    const uint16_t value = read_u16(address);
                    regs[inst.rd] = static_cast<uint32_t>(sign_extend(value, 16));
                    break;
                }
                case Funct3::LHU: {
                    regs[inst.rd] = static_cast<uint32_t>(read_u16(address));
                    break;
                }
                case Funct3::LB: {
                    const uint8_t value = read_u8(address);
                    regs[inst.rd] = static_cast<uint32_t>(sign_extend(value, 8));
                    break;
                }
                case Funct3::LBU: {
                    regs[inst.rd] = static_cast<uint32_t>(read_u8(address));
                    break;
                }
                default:
                    print_inst(inst);
                    break;
            }
            break;
        }

        case Opcode::MISC_MEM: {
            // TODO: Implement MISC_MEM
            std::cerr << "MISC_MEM not implemented" << std::endl;
            break;
        }

        case Opcode::SYSTEM: {
            // TODO: Implement SYSTEM
            std::cerr << "SYSTEM not implemented" << std::endl;
            break;
        }

        // S-Type
        case Opcode::STORE: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);
            const auto rs2_value = static_cast<int32_t>(regs[inst.rs2]);
            const auto address = static_cast<uint32_t>(rs1_value + inst.imm);
            switch (inst.funct3) {
                case Funct3::SW: {
                    write_u32(address, rs2_value);
                    break;
                }
                case Funct3::SH: {
                    write_u16(address, rs2_value);
                    break;
                }
                case Funct3::SB: {
                    write_u8(address, rs2_value);
                    break;
                }
                default:
                    print_inst(inst);
                    break;
            }
            break;
        }

        // B-Type
        case Opcode::BRANCH: {
            const auto rs1_value = static_cast<int32_t>(regs[inst.rs1]);
            const auto rs2_value = static_cast<int32_t>(regs[inst.rs2]);
            switch (inst.funct3) {
                case Funct3::BEQ: {
                    if (rs1_value == rs2_value) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                case Funct3::BNE: {
                    if (rs1_value != rs2_value) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                case Funct3::BLT: {
                    if (rs1_value < rs2_value) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                case Funct3::BLTU: {
                    if (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(rs2_value)) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                case Funct3::BGE: {
                    if (rs1_value >= rs2_value) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                case Funct3::BGEU: {
                    if (static_cast<uint32_t>(rs1_value) >= static_cast<uint32_t>(rs2_value)) {
                        pc += inst.imm;
                        update_pc = false;
                    }
                    break;
                }
                default:
                    print_inst(inst);
                    break;
            }
            break;
        }

        // U-Type
        case Opcode::LUI: {
            regs[inst.rd] = static_cast<uint32_t>(inst.imm);
            break;
        }
        case Opcode::AUIPC: {
            regs[inst.rd] = inst.imm + pc;
            break;
        }

        // J-Type
        case Opcode::JAL: {
            regs[inst.rd] = pc + 4;
            pc += inst.imm;
            update_pc = false;
            break;
        }

        default:
            print_inst(inst);
            break;
    }
}


inline int32_t RV32::sign_extend(const uint32_t value, const unsigned int fromBits) {
    return static_cast<int32_t>(value << (32 - fromBits)) >> (32 - fromBits);
}

inline uint32_t RV32::get_bits(const uint32_t data, const unsigned int start, const unsigned int end) {
    return (data >> start) & ((1u << (end - start)) - 1);
}

void RV32::decode_r_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::R_TYPE;
    inst.rd = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    inst.rs2 = get_bits(data, 20, 24);
    inst.funct7 = static_cast<Funct7>(get_bits(data, 25, 31));
}

void RV32::decode_i_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::I_TYPE;
    inst.rd = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    const uint32_t imm_11_0 = get_bits(data, 20, 31);
    inst.funct7 = static_cast<Funct7>(imm_11_0 >> 5);
    inst.imm = sign_extend(imm_11_0, 12);
}

void RV32::decode_s_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::S_TYPE;
    const uint32_t imm_4_0 = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    inst.rs2 = get_bits(data, 20, 24);
    const uint32_t imm_11_5 = get_bits(data, 25, 31);
    const uint32_t imm = (imm_11_5 << 5) | imm_4_0;
    inst.imm = sign_extend(imm, 12);
}

void RV32::decode_b_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::B_TYPE;
    const uint32_t imm_11 = get_bits(data, 7, 7);
    const uint32_t imm_4_1 = get_bits(data, 8, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    inst.rs2 = get_bits(data, 20, 24);
    const uint32_t imm_10_5 = get_bits(data, 25, 30);
    const uint32_t imm_12 = get_bits(data, 31, 31);
    const uint32_t imm = (imm_12 << 12) | (imm_11 << 11) | (imm_10_5 << 5) | (imm_4_1 << 1);
    inst.imm = sign_extend(imm, 13);
}

void RV32::decode_u_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::U_TYPE;
    inst.rd = get_bits(data, 7, 11);
    const uint32_t imm_31_12 = get_bits(data, 12, 31);
    inst.imm = static_cast<int32_t>(imm_31_12 << 12);
}

void RV32::decode_j_type(DecodedInstruction &inst, const uint32_t data) {
    inst.format = DecodedInstruction::Format::J_TYPE;
    inst.rd = get_bits(data, 7, 11);
    const uint32_t imm_19_12 = get_bits(data, 12, 19);
    const uint32_t imm_11 = get_bits(data, 20, 20);
    const uint32_t imm_10_1 = get_bits(data, 20, 20);
    const uint32_t imm_20 = get_bits(data, 31, 31);
    const uint32_t imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);
    inst.imm = sign_extend(imm, 21);
}

uint32_t RV32::read_u32(const uint32_t address) const {
    return read_value<uint32_t>(address);
}

uint16_t RV32::read_u16(const uint32_t address) const {
    return read_value<uint16_t>(address);
}

uint8_t RV32::read_u8(const uint32_t address) const {
    return read_value<uint8_t>(address);
}

template<typename T>
T RV32::read_value(uint32_t address) const {
    const uint32_t upper_address = address + sizeof(T);
    T value;
    if (Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END) {
        address -= Config::RAM_ORIGIN;
        std::memcpy(&value, &ram[address], sizeof(value));
        return value;
    }
    std::cerr << std::hex << std::showbase
              << "RV32::read_value(): address " << address << " out of range"
              << std::dec << std::endl;
    return 0;
}


void RV32::write_u32(const uint32_t address, const uint32_t value) {
    write_value<uint32_t>(address, value);
}

void RV32::write_u16(const uint32_t address, const uint16_t value) {
    write_value<uint16_t>(address, value);
}

void RV32::write_u8(const uint32_t address, const uint8_t value) {
    write_value<uint8_t>(address, value);
}

template<typename T>
void RV32::write_value(uint32_t address, T value) {
    const uint32_t upper_address = address + sizeof(T);
    if (Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END) {
        address -= Config::RAM_ORIGIN;
        std::memcpy(&ram[address], &value, sizeof(value));
    }
    else {
        std::cerr << std::hex << std::showbase
                  << "RV32::read_value(): address " << address << " out of range"
                  << std::dec << std::endl;
    }
}

void inline RV32::init_regs(const bool initRandom) {
    regs[0] = 0;
    if (initRandom) {
        for (int i = 1; i < 32; i++) {
            regs[i] = rng();
        }
    } else {
        for (int i = 1; i < 32; i++) {
            regs[i] = 0;
        }
    }
}
