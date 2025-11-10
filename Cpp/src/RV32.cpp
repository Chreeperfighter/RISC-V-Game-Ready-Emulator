//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "ISA.hpp"
#include "Syscall.hpp"

#include <cstdint>
#include <random>
#include <iostream>
#include <mutex>
#include <thread>
#include <stdio.h>

RV32::RV32(const bool randomizeRegs, const bool randomizeMemory) : rng(std::random_device{}()), pc(0),
                                                                   update_pc(true),
                                                                   ram(Config::RAM_SIZE, 0),
                                                                   transfer_buffer(Config::FB_SIZE) {
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
    running = false;
}

void RV32::step() {
    const uint32_t data = fetch();
    const DecodedInstruction instruction = decode(data);
    if (pc == 0)
        std::cout << std::hex
            << "PC: " << pc << ": "
            << "Opcode: 0x" << static_cast<int>(instruction.opcode) << ", "
            << "rd: 0x" << static_cast<int>(instruction.rd) << ", "
            << "rs1: 0x" << static_cast<int>(instruction.rs1) << ", "
            << "rs2: 0x" << static_cast<int>(instruction.rs2) << ", "
            << "imm: 0x" << static_cast<int>(instruction.imm) << ", "
            << "raw data: " << data
        << std::endl;
    update_pc = true;
    execute(instruction);
    if (!semihosting_instruction && semihosting_step != 0) {
        semihosting_step = 0;
    }
    if (update_pc) {
        pc += 4;
    }
    cycles++;
}

void RV32::load_section(const ELFSection &section) {
    if (section.address + section.size > Config::RAM_SIZE) {
        std::cerr <<
            "Section: '" << section.name << "' doesn't fit in RAM" <<
        std::endl;
        return;
    }
    if (section.name == ".text") {
        text_start = Config::RAM_ORIGIN + section.address;
        text_end = text_start + section.size;
    }
    else if (section.type == SHT_NOBITS) {
        heap_start = Config::RAM_ORIGIN + section.address + section.size;
        heap_end = heap_start;
        std::fill_n(ram.begin() + section.address, section.size, 0);
        return;
    }
    else {
        return;
    }
    std::copy_n(
        section.data.begin(),
        section.size,
        ram.begin() + section.address + Config::RAM_ORIGIN
        );
}

void RV32::set_entry(const uint32_t entry) {
    pc = entry;
}

uint32_t RV32::fetch() const {
    return read_u32(pc);
}

DecodedInstruction RV32::decode(const uint32_t data) const {
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
            running = false;
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
                        // possible semihosting EBREAK
                        if (inst.rd == 0x0 && inst.rs1 == 0x0 && inst.imm == 0x1F) {
                            semihosting_step = 1;
                            semihosting_instruction = true;
                        }
                        regs.write(inst.rd, static_cast<uint32_t>(rs1_value << amount));
                    } else {
                        print_inst(inst);
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
                            if (inst.rd == 0x0 && inst.rs1 == 0x0 && amount == 7) {
                                if (semihosting_instruction && semihosting_step == 2) {
                                    semihosting_step = 0;
                                    semihosting_instruction = false;
                                    handle_semihosting();
                                }
                            }
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value >> amount));
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
                    regs.write(inst.rd, read_u8(address));
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
            running = false;
            break;
        }

        case Opcode::SYSTEM: {
            const uint16_t func12 = inst.imm & 0xFFF;
            // ECALL (not used in semihosting)
            if (func12 == 0x0) {
                const auto syscall_id = static_cast<Syscall>(regs.read(Register::a7));
                switch (syscall_id) {
                    case Syscall::EXIT: {
                        const auto exit_code = static_cast<int32_t>(regs.read(Register::a0));
                        std::cout << "Process finished with exit code " << exit_code << std::endl;
                        running = false;
                        break;
                    }
                    case Syscall::READ: {
                        const uint32_t fd = regs.read(Register::a0);
                        const uint32_t buffer_address = regs.read(Register::a1);
                        const uint32_t max_size = regs.read(Register::a2);

                        if (fd == 0x0) { // stdin
                            std::string line;
                            if (std::getline(std::cin, line)) {
                                // add back the newline character that getline strips
                                line += '\n';

                                // truncate if longer than max_size
                                if (line.size() > max_size)
                                    line.resize(max_size);

                                // copy into emulated memory
                                std::vector<uint8_t> buffer(line.begin(), line.end());
                                write_bytes(buffer_address, buffer);

                                regs.write(Register::a0, buffer.size()); // bytes read
                            } else {
                                // EOF reached
                                regs.write(Register::a0, 0);
                            }
                        } else {
                            // non-stdin fds: return -1 (error) for unsupported fds
                            regs.write(Register::a0, static_cast<uint32_t>(-1));
                        }
                        break;
                    }
                    case Syscall::WRITE: {
                        const uint32_t fd = regs.read(Register::a0);
                        const uint32_t buffer_address = regs.read(Register::a1);
                        const uint32_t buffer_size = regs.read(Register::a2);

                        if (fd == 0x1 | fd == 0x2) {
                            const std::vector<unsigned char> buffer = read_bytes(buffer_address, buffer_size);

                            for (unsigned char c: buffer) {
                                std::cout << c;
                            }

                            regs.write(Register::a0, buffer.size());
                        } else {
                            regs.write(Register::a0, -1);
                        }
                        break;
                    }
                    case Syscall::FSTAT: {
                        const uint32_t fd = regs.read(Register::a0);
                        const uint32_t stat_buf = regs.read(Register::a1);
                        if (fd == 0x1 || fd == 0x2) {
                            // Write dummy stat structure
                            // For stdout (fd=1), pretend it's a character device
                            write_u32(stat_buf + 0, 0); // st_dev
                            write_u32(stat_buf + 4, 0); // st_ino
                            write_u32(stat_buf + 8, 0x2000); // st_mode (S_IFCHR)
                            write_u32(stat_buf + 12, 1); // st_nlink
                            write_u32(stat_buf + 16, 0); // st_uid
                            write_u32(stat_buf + 20, 0); // st_gid
                            write_u32(stat_buf + 24, 0); // st_rdev
                            write_u32(stat_buf + 28, 0); // st_size
                            write_u32(stat_buf + 32, 4096); // st_blksize
                            write_u32(stat_buf + 36, 0); // st_blocks
                            regs.write(Register::a0, 0); // success
                        } else {
                            regs.write(Register::a0, -1); // error
                        }
                        break;
                    }
                    case Syscall::BRK: {
                        const uint32_t new_break_address = regs.read(Register::a0);
                        if (new_break_address != 0) {
                            if (new_break_address >= heap_start && new_break_address <= Config::RAM_END -
                                Config::STACK_MARGIN) {
                                heap_end = new_break_address;
                            } else {
                                std::cerr << "[WARN] brk: address 0x" << std::hex << new_break_address
                                        << " out of range, ignoring" << std::dec << std::endl;
                            }
                        }
                        regs.write(Register::a0, heap_end);
                        break;
                    }
                    case Syscall::SHOW_BUFFER: {
                        transfer_buffer_address = regs.read(Register::a0);
                        std::lock_guard<std::mutex> lock(transfer_buffer_mtx);
                        transfer_buffer = read_bytes(transfer_buffer_address, Config::FB_SIZE);
                        break;
                    }
                    case Syscall::GET_FRAMEBUFFER_INFO: {
                        const uint32_t address = regs.read(Register::a0);
                        if (address < Config::RAM_ORIGIN || address > Config::RAM_END) {
                            regs.write(Register::a0, -1); // Failure
                            break;
                        }
                        write_u32(address, Config::FB_WIDTH);
                        write_u32(address + 4, Config::FB_HEIGHT);
                        write_u32(address + 8, Config::FB_BPP);
                        regs.write(Register::a0, 0); // Success
                        break;
                    }
                    case Syscall::GET_US: {
                        const uint32_t time_us = std::chrono::duration_cast<std::chrono::microseconds>(
                            std::chrono::steady_clock::now().time_since_epoch()
                        ).count();
                        regs.write(Register::a0, time_us);
                        break;
                    }
                    case Syscall::SLEEP_US: {
                        const uint32_t time_us = regs.read(Register::a0);
                        std::this_thread::sleep_for(std::chrono::microseconds(time_us));
                        break;
                    }
                    case Syscall::KEY_AVAILABLE: {
                        if (is_queue_empty()) {
                            regs.write(Register::a0, 0);
                        }
                        else {
                            regs.write(Register::a0, 1);
                        }
                        break;
                    }
                    case Syscall::GET_KEY: {
                        const uint32_t key = pop_from_queue();
                        regs.write(Register::a0, key);
                        break;
                    }
                    case Syscall::IS_KEY_DOWN: {
                        const uint8_t key = regs.read(Register::a0) & 0xFF;
                        regs.write(Register::a0, key_state[key] ? 1 : 0);
                        break;
                    }
                    case Syscall::CLEAR_KEY_QUEUE: {
                        while (!is_queue_empty()) {
                            pop_from_queue();
                        }
                        regs.write(Register::a0, 0);
                        break;
                    }
                    case Syscall::GET_MOUSE_POS: {
                        regs.write(Register::a0, mouse_pos_x);
                        regs.write(Register::a1, mouse_pos_y);
                        break;
                    }
                    case Syscall::IS_MOUSE_BUTTON_DOWN: {
                        const uint8_t mouse_button = regs.read(Register::a0);
                        if (mouse_button > 2) {
                            std::cerr << "[WARN] mouse_button: "<< mouse_button << " out of range!" << std::endl;
                            break;
                        }
                        regs.write(Register::a0, mouse_button_state[mouse_button] ? 1 : 0);
                        break;
                    }
                    case Syscall::GET_CYCLES: {
                        regs.write(Register::a0, cycles & 0xFFFFFFFF);
                        regs.write(Register::a1, cycles >> 32);
                        break;
                    }
                    default:
                        std::cerr << "Unknown syscall ID: " << static_cast<uint32_t>(syscall_id)
                                << std::endl;
                        running = false;
                        break;
                }
            }
            // EBREAK
            else if (func12 == 0x1) {
                if (semihosting_instruction && semihosting_step == 1) {
                    semihosting_step = 2;
                    semihosting_instruction = true;
                }
                else {

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
            break;
    }
}

void RV32::handle_semihosting() {
    const auto operation_number = static_cast<Syscall>(regs.read(Register::a0));
    const uint32_t parameter = regs.read(Register::a1);

    switch (operation_number) {
        case Syscall::SYS_EXIT: {
            running = false;
            break;
        }
        case Syscall::SYS_FLEN: {
            const uint32_t handle = read_u32(parameter);
            if (handle >= file_table.size()) {
                regs.write(Register::a0, -1);
                break;
            }

            // stdin/stdout/stderr don't support flen
            if (handle <= 2) {
                regs.write(Register::a0, -1);
                errno = EINVAL;
                break;
            }

            FILE* file = file_table[handle];
            long current = ftell(file);
            if (current == -1) {
                regs.write(Register::a0, -1);
                break;
            }

            fseek(file, 0, SEEK_END);
            long size = ftell(file);
            fseek(file, current, SEEK_SET);

            regs.write(Register::a0, size);
            break;
        }
        case Syscall::SYS_ISTTY: {
            const uint32_t handle = read_u32(parameter);
            if (handle >= file_table.size()) {
                regs.write(Register::a0, -1);
                break;
            }
            const bool is_tty = (handle <= 2);
            regs.write(Register::a0, is_tty ? 1 : 0);
            break;
        }
        case Syscall::SYS_WRITE: {
            struct WriteArgs {
                uint32_t handle;
                uint32_t buffer_ptr;
                uint32_t length;
            };
            std::vector<uint8_t> raw = read_bytes(parameter, sizeof(WriteArgs));
            const WriteArgs* args = reinterpret_cast<WriteArgs *>(raw.data());
            std::vector<uint8_t> buffer = read_bytes(args->buffer_ptr, args->length);
            const char* str = reinterpret_cast<char*>(buffer.data());

            if (args->handle >= file_table.size()) {
                regs.write(Register::a0, args->length); // number of bytes not written
                break;
            }

            FILE* file = file_table[args->handle];
            size_t written = fwrite(str, sizeof(char), args->length, file);

            regs.write(Register::a0, (written == args->length) ? 0 : (args->length - written));
            break;
        }
        case Syscall::SYS_OPEN: {
            struct OpenArgs {
                uint32_t string_ptr;
                uint32_t mode;
                uint32_t length;
            };
            std::vector<uint8_t> raw = read_bytes(parameter, sizeof(OpenArgs));
            const OpenArgs* args = reinterpret_cast<OpenArgs *>(raw.data());
            std::vector<uint8_t> buffer = read_bytes(args->string_ptr, args->length + 1);
            const char* name = reinterpret_cast<char*>(buffer.data());

            FILE* handle = nullptr;
            switch (args->mode) {
                case 0: handle = fopen(name, "r"); break;
                case 1: handle = fopen(name, "rb"); break;
                default:
                    std::cerr << "[DEBUG] SYS_WRITE: Unknown mode: " << args->mode << std::endl;
                    break;
            }

            if (!handle) {
                regs.write(Register::a0, -1);
                break;
            }

            file_table.push_back(handle);
            regs.write(Register::a0, file_table.size() - 1);
            break;
        }
        case Syscall::SYS_ERRNO: {
            const errno_t err = errno;
            regs.write(Register::a0, err);
            break;
        }
        default:
            std::cerr << "[DEBUG] Unknown Syscall: operation=0x"
                      << std::hex << static_cast<int>(operation_number)
                      << ", parameter=0x" << parameter << std::dec << std::endl;
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

std::vector<uint8_t> RV32::read_bytes(uint32_t address, size_t size) const {
    const uint32_t upper_address = address + size;
    if (!(Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END)) {
        std::cerr << std::hex << std::showbase
                  << "RV32::read_bytes(): address " << address << " out of range"
                  << std::dec << std::endl;
        running = false;
        return {};
    }

    address -= Config::RAM_ORIGIN;
    return {ram.begin() + address, ram.begin() + address + static_cast<long>(size)};
}

template<typename T>
T RV32::read_value(uint32_t address) const {
    const uint32_t upper_address = address + sizeof(T);
    if (!(Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END)) {
        std::cerr << std::hex << std::showbase
                  << pc << ": "
                  << "RV32::read_value(): address " << address << " out of range"
                  << std::dec << std::endl;
        running = false;
        return {};
    }

    address -= Config::RAM_ORIGIN;
    T value;

    std::copy_n(
        ram.begin() + address,
        sizeof(T),
        reinterpret_cast<uint8_t*>(&value)
        );
    return value;
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

void RV32::write_bytes(uint32_t address, const std::vector<uint8_t> &value) {
    const uint32_t upper_address = address + value.size();
    if (text_start <= address && upper_address < text_end) {
        std::cerr << std::hex << std::showbase << "[WRN] "
                  << pc << ": " << "RV32::write_value(): address " << address << " overwriting program code"
                  << std::endl;
    }
    if (!(Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END)) {
        std::cerr << std::hex << std::showbase
                  << "RV32::read_bytes(): address " << address << " out of range"
                  << std::dec << std::endl;
        running = false;
        return;
    }

    address -= Config::RAM_ORIGIN;
    std::copy(value.begin(), value.end(), ram.begin() + address);
}

template<typename T>
void RV32::write_value(uint32_t address, T value) {
    const uint32_t upper_address = address + sizeof(T);

    if (text_start <= address && upper_address < text_end) {
        std::cerr << std::hex << std::showbase << "[WRN] "
                  << pc << ": " << "RV32::write_value(): address " << address << " overwriting program code"
                  << std::endl;
    }

    if (Config::RAM_ORIGIN <= address && upper_address <= Config::RAM_END) {
        address -= Config::RAM_ORIGIN;
        std::copy(reinterpret_cast<const uint8_t*>(&value),
                  reinterpret_cast<const uint8_t*>(&value) + sizeof(T),
                  ram.begin() + address);
        return;
    }

    std::cerr << std::hex << std::showbase
              << pc << ": " << "RV32::write_value(): address " << address << " out of range"
              << std::dec << std::endl;
    running = false;
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
