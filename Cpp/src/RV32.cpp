//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "ISA.hpp"
#include "Syscall.hpp"
#include "Devices.hpp"

#include <cstdint>
#include <random>
#include <iostream>
#include <mutex>

RV32::RV32(const bool randomizeRegs, const bool randomizeMemory) : rng(std::random_device{}()), pc(0),
                                                                   update_pc(true),
                                                                   ram(Config::RAM_SIZE, 0),
                                                                   vram(Config::VRAM_SIZE, 0),
                                                                   heap_start(0),
                                                                   heap_end(0) {
    front_buffer = &vram[Config::FB_A_OFFSET];
    back_buffer  = &vram[Config::FB_B_OFFSET];
    init_regs(randomizeRegs);
    if (randomizeMemory) {
        for (auto &byte: ram) {
            byte = static_cast<uint8_t>(rng());
        }
    }
}

void RV32::print_inst(DecodedInstruction inst) const {
    std::cerr << std::hex << std::showbase << pc << ": " << std::dec << "opcode=" << static_cast<int>(inst.opcode)
            << " funct3=" << static_cast<int>(inst.funct3)
            << " funct7=" << static_cast<int>(inst.funct7) << std::endl;
}

void RV32::load_bin(const uint8_t *bin, const size_t size, const uint32_t start_address) {
    std::memcpy(&ram[start_address], bin, size);
    heap_start = start_address + size;
    heap_end = heap_start;
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
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const auto rs2_value = static_cast<int32_t>(regs.read(inst.rs2));

            switch (inst.funct3) {
                case Funct3::ADD_SUB: {
                    switch (inst.funct7) {
                        case Funct7::ADD:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value + rs2_value));
                            break;
                        case Funct7::SUB:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value - rs2_value));
                            break;
                        default:
                            print_inst(inst);
                            running = false;
                            break;
                    }
                    break;
                }
                case Funct3::SLT: {
                    regs.write(inst.rd, (rs1_value < rs2_value) ? 1 : 0);
                    break;
                }
                case Funct3::SLTU: {
                    regs.write(inst.rd, (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(rs2_value)) ? 1 : 0);
                    break;
                }
                case Funct3::AND: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value & rs2_value));
                    break;
                }
                case Funct3::OR: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value | rs2_value));
                    break;
                }
                case Funct3::XOR: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value ^ rs2_value));
                    break;
                }
                case Funct3::SLL: {
                    const auto amount = static_cast<uint8_t>(rs2_value & 0x1F);
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value << amount));
                    break;
                }
                case Funct3::SRL_SRA: {
                    const auto amount = static_cast<uint8_t>(rs2_value & 0x1F);
                    switch (inst.funct7) {
                        case Funct7::SRL:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value) >> amount);
                            break;
                        case Funct7::SRA:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value >> amount));
                            break;
                        default:
                            print_inst(inst);
                            running = false;
                            break;
                    }
                    break;
                }
                default:
                    print_inst(inst);
                    running = false;
                    break;
            }
            break;
        }

        // I-Type
        case Opcode::OP_IMM: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));

            switch (inst.funct3) {
                case Funct3::ADDI: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value + inst.imm));
                    break;
                }
                case Funct3::SLTI: {
                    regs.write(inst.rd, (rs1_value < inst.imm) ? 1 : 0);
                    break;
                }
                case Funct3::SLTIU: {
                    regs.write(inst.rd, (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(inst.imm)) ? 1 : 0);
                    break;
                }
                case Funct3::ANDI: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value & inst.imm));
                    break;
                }
                case Funct3::ORI: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value | inst.imm));
                    break;
                }
                case Funct3::XORI: {
                    regs.write(inst.rd, static_cast<uint32_t>(rs1_value ^ inst.imm));
                    break;
                }
                case Funct3::SLLI: {
                    const auto amount = static_cast<uint8_t>(inst.imm & 0x1F);
                    if (inst.funct7 == Funct7::SLLI) {
                        regs.write(inst.rd, static_cast<uint32_t>(rs1_value << amount));
                    } else {
                        print_inst(inst);
                        running = false;
                    }
                    break;
                }
                case Funct3::SRLI_SRAI: {
                    const auto amount = static_cast<uint8_t>(inst.imm & 0x1F);
                    switch (inst.funct7) {
                        case Funct7::SRLI:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value) >> amount);
                            break;
                        case Funct7::SRAI:
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value >> amount));
                            break;
                        default:
                            print_inst(inst);
                            running = false;
                            break;
                    }
                    break;
                }
                default:
                    print_inst(inst);
                    running = false;
                    break;
            }
            break;
        }

        case Opcode::JALR: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const uint32_t address = static_cast<uint32_t>(rs1_value + inst.imm) & 0xFFFFFFFE;
            regs.write(inst.rd, pc + 4);
            pc = address;
            update_pc = false;
            break;
        }

        case Opcode::LOAD: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const auto address = static_cast<uint32_t>(rs1_value + inst.imm);
            switch (inst.funct3) {
                case Funct3::LW: {
                    regs.write(inst.rd, read_u32(address));
                    break;
                }
                case Funct3::LH: {
                    const uint16_t value = read_u16(address);
                    regs.write(inst.rd, static_cast<uint32_t>(sign_extend(value, 16)));
                    break;
                }
                case Funct3::LHU: {
                    regs.write(inst.rd, static_cast<uint32_t>(read_u16(address)));
                    break;
                }
                case Funct3::LB: {
                    const uint8_t value = read_u8(address);
                    regs.write(inst.rd, static_cast<uint32_t>(sign_extend(value, 8)));
                    break;
                }
                case Funct3::LBU: {
                    regs.write(inst.rd, static_cast<uint32_t>(read_u8(address)));
                    break;
                }
                default:
                    print_inst(inst);
                    running = false;
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
            const uint16_t func12 = inst.imm & 0xFFF;
            // ECALL
            if (func12 == 0x0) {
                const auto syscall_id = static_cast<Syscall>(regs.read(Register::a7));
                switch (syscall_id) {
                    case Syscall::EXIT: {
                        const auto exit_code = static_cast<int32_t>(regs.read(Register::a0));
                        std::cout << "Process finished with exit code " << exit_code << std::endl;
                        running = false;
                        break;
                    }
                    case Syscall::WRITE: {
                        const uint32_t fd = regs.read(Register::a0);
                        const uint32_t buffer_address = regs.read(Register::a1);
                        const uint32_t buffer_size = regs.read(Register::a2);

                        if (fd == 0x1 | fd == 0x2) {
                            const unsigned char *buffer = read_bytes(buffer_address, buffer_size);
                            for (size_t i = 0; i < buffer_size; i++) {
                                std::cout << buffer[i];
                            }
                            regs.write(Register::a0, buffer_size);
                        } else {
                            regs.write(Register::a0, -1);
                        }
                        break;
                    }
                    case Syscall::FSTAT: {
                        const uint32_t fd = regs.read(Register::a0);
                        const uint32_t stat_buf = regs.read(Register::a1);
                        if (fd == 0x1 | fd == 0x2) {
                            // Write dummy stat structure
                            // For stdout (fd=1), pretend it's a character device
                            write_u64(stat_buf + 0, 0); // st_dev
                            write_u64(stat_buf + 8, 0); // st_ino
                            write_u32(stat_buf + 16, 0x2000); // st_mode (S_IFCHR - char device)
                            write_u32(stat_buf + 20, 1); // st_nlink
                            write_u32(stat_buf + 24, 0); // st_uid
                            write_u32(stat_buf + 28, 0); // st_gid
                            write_u64(stat_buf + 32, 0); // st_rdev
                            write_u64(stat_buf + 40, 0); // st_size
                            write_u64(stat_buf + 48, 4096); // st_blksize
                            write_u64(stat_buf + 56, 0); // st_blocks
                            regs.write(Register::a0, 0); // success
                        } else {
                            regs.write(Register::a0, -1); // error
                        }
                        break;
                    }
                    case Syscall::BRK: {
                        const uint32_t new_break_address = regs.read(Register::a0);
                        if (new_break_address != 0) {
                            if (new_break_address < heap_start || new_break_address > Config::RAM_END -
                                Config::STACK_MARGIN) {
                                regs.write(Register::a0, heap_end); // fail
                                break;
                            }
                            heap_end = new_break_address;
                        }
                        regs.write(Register::a0, heap_end);
                        break;
                    }
                    default:
                        std::cerr << "Unknown syscall ID: " << static_cast<uint32_t>(syscall_id)
                                << std::endl;
                    // running = false;
                        break;
                }
            }
            break;
        }

        // S-Type
        case Opcode::STORE: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const auto rs2_value = static_cast<int32_t>(regs.read(inst.rs2));
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
                    running = false;
                    break;
            }
            break;
        }

        // B-Type
        case Opcode::BRANCH: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const auto rs2_value = static_cast<int32_t>(regs.read(inst.rs2));
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
                    running = false;
                    break;
            }
            break;
        }

        // U-Type
        case Opcode::LUI: {
            regs.write(inst.rd, static_cast<uint32_t>(inst.imm));
            break;
        }
        case Opcode::AUIPC: {
            regs.write(inst.rd, inst.imm + pc);
            break;
        }

        // J-Type
        case Opcode::JAL: {
            regs.write(inst.rd, pc + 4);
            pc += inst.imm;
            update_pc = false;
            break;
        }

        default:
            print_inst(inst);
            running = false;
            break;
    }
}


inline int32_t RV32::sign_extend(const uint32_t value, const unsigned int fromBits) {
    return static_cast<int32_t>(value << (32 - fromBits)) >> (32 - fromBits);
}

inline uint32_t RV32::get_bits(uint32_t data, unsigned start, unsigned end) {
    return (data >> start) & ((1u << (end - start + 1)) - 1);
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
    const uint32_t imm_10_1 = get_bits(data, 21, 30);
    const uint32_t imm_20 = get_bits(data, 31, 31);
    const uint32_t imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);
    inst.imm = sign_extend(imm, 21);
}

uint64_t RV32::read_u64(const uint32_t address) const {
    return read_value<uint32_t>(address);
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

const uint8_t *RV32::read_bytes(uint32_t address, const size_t size) const {
    const uint32_t upper_address = address + size;
    if (Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END) {
        address -= Config::RAM_ORIGIN;
        return &ram[address - Config::RAM_ORIGIN];
    }
    std::cerr << std::hex << std::showbase
            << "RV32::read_bytes(): address " << address << " out of range"
            << std::dec << std::endl;
    return nullptr;
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
    if (Config::MMIO_ORIGIN <= address && upper_address <= Config::MMIO_END) {
        address -= Config::MMIO_ORIGIN;
        uint8_t buffer[12];
        display->get(buffer, 12);

        std::memcpy(&value, buffer + address, sizeof(value));
        return value;
    }
    std::cerr << std::hex << std::showbase
            << "RV32::read_value(): address " << address << " out of range"
            << std::dec << std::endl;
    return 0;
}

void RV32::write_u64(const uint32_t address, const uint64_t value) {
    write_value<uint64_t>(address, value);
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
        if (address < 0x3000) {
            std::cout << std::hex << std::showbase << pc << ": " << address << std::dec << std::endl;
        }
        address -= Config::RAM_ORIGIN;
        std::memcpy(&ram[address], &value, sizeof(value));
    } else if (Config::MMIO_ORIGIN <= address && upper_address <= Config::MMIO_END) {
        address -= Config::MMIO_ORIGIN;

        uint8_t buffer[sizeof(T)];
        std::memcpy(buffer, &value, sizeof(value));
        // TODO: Handle MMIOs in the CPU
        // swap should happen before telling main thread
        display->set(address, buffer, sizeof(T));
        if (display->new_frame) {
            swap_framebuffers();
        }
    } else if (Config::VRAM_ORIGIN <= address && upper_address <= Config::VRAM_END) {
        address -= Config::VRAM_ORIGIN;
        std::memcpy(&vram[address], &value, sizeof(value));
    } else {
        std::cerr << std::hex << std::showbase
                << pc << ": " << "RV32::write_value(): address " << address << " out of range"
                << std::dec << std::endl;
    }
}

void inline RV32::init_regs(const bool initRandom) {
    regs.write(0, 0); // Ensure x0 is zero
    if (initRandom) {
        for (int i = 1; i < 32; i++) {
            regs.write(i, rng());
        }
    } else {
        for (int i = 1; i < 32; i++) {
            regs.write(i, 0);
        }
    }
}
