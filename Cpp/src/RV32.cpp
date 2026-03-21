//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "ISA.hpp"
#include "Syscall.hpp"
#include "Utils.hpp"

#include <random>
#include <iostream>
#include <mutex>
#include <thread>
#include <fstream>

RV32::RV32(bool randomizeRegs, bool randomizeMemory)
    : ram(g_config.ram_size_bytes, 0),
      transfer_buffer(g_config.framebuffer_size_bytes) {
    fht = new FileHandleTable(g_config.storage_path);
    init_regs(randomizeRegs);
    if (randomizeMemory) {
        for (auto &byte: ram) {
            byte = static_cast<uint8_t>(rng());
        }
    }
}

void RV32::step() {
    const uint32_t data = fetch();
    const DecodedInstruction instruction = decode(data);

    execute(instruction);

    if (!semihosting_instruction && semihosting_step != 0) {
        semihosting_step = 0;
    }
    if (trap == TrapReason::None) {
        pc += 4;
    }
    cycles++;
}

void RV32::load_section(const ELFSection &section) {
    if (!is_in_ram(section.address, section.size)) {
        trigger_trap(TrapReason::MemFault, "RV32::load_section()",
            "Section: " + section.name + " doesn't fit in RAM");
        return;
    }

    if (section.flags & SHF_ALLOC) {
        if (!(section.flags & SHF_WRITE)) {
            ro_end = std::max(ro_end, section.address + section.size);
        }
        if (section.type == SHT_NOBITS) {
            // Zero-fill sections with no data in file (.bss)
            std::fill_n(
                ram.begin() + (section.address - g_config.ram_origin),
                section.size,
                0
            );
        } else if (!section.data.empty()) {
            // Copy any section with data into RAM
            // (handles .text, .rodata, .data, .init_array, etc.)
            std::copy_n(
                section.data.begin(),
                section.size,
                ram.begin() + (section.address - g_config.ram_origin)
            );
        }
    }
}

void RV32::set_entry(const uint32_t entry) {
    pc = entry;
}

uint32_t RV32::fetch() {
    return *reinterpret_cast<const uint32_t*>(ram.data() + (pc - g_config.ram_origin));
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
            trigger_trap(TrapReason::IllegalInst, "RV32::decode()",
                         "Unknown opcode: " + std::to_string(static_cast<int>(opcode)));
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

            if (static_cast<uint8_t>(inst.funct7) == static_cast<uint8_t>(Funct7::MULDIV)) [[unlikely]] {
                switch (inst.funct3) {
                    case Funct3::MUL: {
                        // Cast to uint32_t to avoid C++ Undefined Behavior on signed overflow
                        uint32_t result = static_cast<uint32_t>(rs1_value) * static_cast<uint32_t>(rs2_value);
                        regs.write(inst.rd, result);
                        break;
                    }
                    case Funct3::MULH: {
                        // Safe to cast directly to int64_t since they are already int32_t
                        int64_t result = static_cast<int64_t>(rs1_value) * static_cast<int64_t>(rs2_value);
                        regs.write(inst.rd, static_cast<uint32_t>(result >> 32));
                        break;
                    }
                    case Funct3::MULHSU: {
                        // rs1 is signed, rs2 must be zero-extended
                        int64_t result = static_cast<int64_t>(rs1_value) * static_cast<int64_t>(static_cast<uint32_t>(
                                             rs2_value));
                        regs.write(inst.rd, static_cast<uint32_t>(result >> 32));
                        break;
                    }
                    case Funct3::MULHU: {
                        // Strip the sign first, THEN extend to 64-bit
                        uint64_t result = static_cast<uint64_t>(static_cast<uint32_t>(rs1_value)) * static_cast<
                                              uint64_t>(static_cast<uint32_t>(rs2_value));
                        regs.write(inst.rd, static_cast<uint32_t>(result >> 32));
                        break;
                    }
                    case Funct3::DIV: {
                        if (rs2_value == 0) {
                            regs.write(inst.rd, static_cast<uint32_t>(-1));
                            break;
                        }
                        // Prevents hardware crash (SIGFPE) on the host machine
                        if (rs1_value == static_cast<int32_t>(0x80000000) && rs2_value == -1) {
                            regs.write(inst.rd, static_cast<uint32_t>(0x80000000));
                            break;
                        }
                        regs.write(inst.rd, static_cast<uint32_t>(rs1_value / rs2_value));
                        break;
                    }
                    case Funct3::DIVU: {
                        uint32_t u_rs1 = static_cast<uint32_t>(rs1_value);
                        uint32_t u_rs2 = static_cast<uint32_t>(rs2_value);

                        if (u_rs2 == 0) {
                            regs.write(inst.rd, static_cast<uint32_t>(-1));
                            break;
                        }
                        regs.write(inst.rd, u_rs1 / u_rs2);
                        break;
                    }
                    case Funct3::REM: {
                        if (rs2_value == 0) {
                            regs.write(inst.rd, static_cast<uint32_t>(rs1_value));
                            break;
                        }
                        // Prevents hardware crash (SIGFPE) on the host machine
                        if (rs1_value == static_cast<int32_t>(0x80000000) && rs2_value == -1) {
                            regs.write(inst.rd, 0);
                            break;
                        }
                        regs.write(inst.rd, static_cast<uint32_t>(rs1_value % rs2_value));
                        break;
                    }
                    case Funct3::REMU: {
                        uint32_t u_rs1 = static_cast<uint32_t>(rs1_value);
                        uint32_t u_rs2 = static_cast<uint32_t>(rs2_value);

                        if (u_rs2 == 0) {
                            regs.write(inst.rd, u_rs1);
                            break;
                        }
                        regs.write(inst.rd, u_rs1 % u_rs2);
                        break;
                    }
                    default:
                        trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                     "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
                        break;
                }
            }
            else {
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
                                trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                             "Unknown funct7: " + std::to_string(static_cast<int>(inst.funct7)));
                                break;
                        }
                        break;
                    }
                    case Funct3::SLT: {
                        regs.write(inst.rd, (rs1_value < rs2_value) ? 1 : 0);
                        break;
                    }
                    case Funct3::SLTU: {
                        regs.write(inst.rd, (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(rs2_value))
                                                ? 1
                                                : 0);
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
                                trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                             "Unknown funct7: " + std::to_string(static_cast<int>(inst.funct7)));
                                break;
                        }
                        break;
                    }
                    default:
                        trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                     "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
                        break;
                }
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
                        trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                     "Unknown funct7: " + std::to_string(static_cast<int>(inst.funct7)));
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
                            trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                         "Unknown funct7: " + std::to_string(static_cast<int>(inst.funct7)));
                            break;
                    }
                    break;
                }
                default:
                    trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                 "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
                    break;
            }
            break;
        }

        case Opcode::JALR: {
            const auto rs1_value = static_cast<int32_t>(regs.read(inst.rs1));
            const uint32_t address = static_cast<uint32_t>(rs1_value + inst.imm) & 0xFFFFFFFE;
            regs.write(inst.rd, pc + 4);
            pc = address - 4;
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
                    trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                 "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
                    break;
            }
            break;
        }

        case Opcode::MISC_MEM: {
            emulator_warn("RV32::execute() --> MISC_MEM not implemented");
            break;
        }

        case Opcode::SYSTEM: {
            const uint16_t func12 = inst.imm & 0xFFF;
            // EBREAK
            if (func12 == 0x1) {
                if (semihosting_instruction && semihosting_step == 1) {
                    semihosting_step = 2;
                    semihosting_instruction = true;
                } else {
                    trigger_trap(TrapReason::Breakpoint, "RV32::execute()", "BREAKPOINT");
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
                    trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                 "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
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
                        pc += inst.imm - 4;
                    }
                    break;
                }
                case Funct3::BNE: {
                    if (rs1_value != rs2_value) {
                        pc += inst.imm - 4;
                    }
                    break;
                }
                case Funct3::BLT: {
                    if (rs1_value < rs2_value) {
                        pc += inst.imm - 4;
                    }
                    break;
                }
                case Funct3::BLTU: {
                    if (static_cast<uint32_t>(rs1_value) < static_cast<uint32_t>(rs2_value)) {
                        pc += inst.imm - 4;
                    }
                    break;
                }
                case Funct3::BGE: {
                    if (rs1_value >= rs2_value) {
                        pc += inst.imm - 4;
                    }
                    break;
                }
                case Funct3::BGEU: {
                    if (static_cast<uint32_t>(rs1_value) >= static_cast<uint32_t>(rs2_value)) {
                        pc += inst.imm - 4;
                    }
                    break;
                }
                default:
                    trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                                 "Unknown funct3: " + std::to_string(static_cast<int>(inst.funct3)));
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
            pc += inst.imm - 4;
            break;
        }

        default:
            trigger_trap(TrapReason::IllegalInst, "RV32::execute()",
                         "Unknown Opcode: " + std::to_string(static_cast<int>(inst.opcode)));
            break;
    }
}

void RV32::trigger_trap(TrapReason trap_reason, const std::string &function_name, const std::string &message) {
    trap = trap_reason;
    trap_message = function_name + " --> " + message;
#ifndef EMULATOR_DEBUG
    running = false;
#endif
}

void RV32::handle_semihosting() {
    const auto operation_number = static_cast<Syscall>(regs.read(Register::a0));
    const uint32_t parameter = regs.read(Register::a1);

    switch (operation_number) {
        case Syscall::SYS_EXIT:
            handle_sys_exit(parameter);
            break;

        case Syscall::SYS_EXIT_EXTENDED:
            handle_sys_exit_extended(parameter);
            break;

        case Syscall::SYS_GET_DISPLAY_INFO:
            handle_sys_get_display_info(parameter);
            break;

        case Syscall::SYS_SHOW_FRAMEBUFFER:
            handle_sys_show_framebuffer(parameter);
            break;

        case Syscall::SYS_GET_MOUSE_POS:
            handle_sys_get_mouse_pos(parameter);
            break;

        case Syscall::SYS_IS_MOUSE_BUTTON_DOWN:
            handle_sys_is_mouse_button_down(parameter);
            break;

        case Syscall::SYS_GET_US:
            handle_sys_get_us(parameter);
            break;

        case Syscall::SYS_SLEEP_US:
            handle_sys_sleep_us(parameter);
            break;

        case Syscall::SYS_KEY_AVAILABLE:
            handle_sys_key_available(parameter);
            break;

        case Syscall::SYS_GET_KEY:
            handle_sys_get_key(parameter);
            break;

        case Syscall::SYS_IS_KEY_DOWN:
            handle_sys_is_key_down(parameter);
            break;

        case Syscall::SYS_OPENDIR:
            handle_sys_opendir(parameter);
            break;

        case Syscall::SYS_READDIR:
            handle_sys_readdir(parameter);
            break;

        case Syscall::SYS_CLOSEDIR:
            handle_sys_closedir(parameter);
            break;

        case Syscall::SYS_MKDIR:
            handle_sys_mkdir(parameter);
            break;

        case Syscall::SYS_REWINDDIR:
            handle_sys_rewinddir(parameter);
            break;

        case Syscall::SYS_AUDIO_INIT:
            handle_sys_audio_init(parameter);
            break;

        case Syscall::SYS_AUDIO_SUBMIT:
            handle_sys_audio_submit(parameter);
            break;

        case Syscall::SYS_AUDIO_GET_QUEUED_BYTES:
            handle_sys_audio_get_queued_bytes(parameter);
            break;

        case Syscall::SYS_FLEN:
            handle_sys_flen(parameter);
            break;

        case Syscall::SYS_ISTTY:
            handle_sys_istty(parameter);
            break;

        case Syscall::SYS_WRITE:
            handle_sys_write(parameter);
            break;

        case Syscall::SYS_OPEN:
            handle_sys_open(parameter);
            break;

        case Syscall::SYS_ERRNO:
            regs.write(Register::a0, errno);
            break;

        case Syscall::SYS_CLOSE:
            handle_sys_close(parameter);
            break;

        case Syscall::SYS_REMOVE:
            handle_sys_remove(parameter);
            break;

        case Syscall::SYS_RENAME:
            handle_sys_rename(parameter);
            break;

        case Syscall::SYS_SEEK:
            handle_sys_seek(parameter);
            break;

        case Syscall::SYS_READ:
            handle_sys_read(parameter);
            break;

        case Syscall::SYS_WRITE0:
            handle_sys_write0(parameter);
            break;

        default:
            trigger_trap(TrapReason::IllegalInst, "RV32::handle_semihosting()",
                         "Unknown Syscall: " + std::to_string(static_cast<int>(operation_number)));
            regs.write(Register::a0, -1);
            errno = ENOSYS;
            break;
    }
}

void RV32::handle_sys_exit(uint32_t exit_code) {
    std::cout << "Process exiting with code: " << exit_code << std::endl;
    running = false;
}

void RV32::handle_sys_get_display_info(uint32_t parameter) {
    struct DisplayInfo {
        uint32_t width;
        uint32_t height;
        uint32_t format;
        uint32_t bpp;
    } info{};
    uint32_t address = parameter;
    if (address < g_config.ram_origin || address > g_config.ram_end) {
        regs.write(Register::a0, -1); // Failure
        return;
    }
    info.width = g_config.framebuffer_width;
    info.height = g_config.framebuffer_height;
    info.bpp = g_config.framebuffer_bpp;
    if (g_config.framebuffer_format == "ARGB8888")
        info.format = 0;
    else if (g_config.framebuffer_format == "RGB565")
        info.format = 1;
    else if (g_config.framebuffer_format == "RGB888")
        info.format = 2;
    else if (g_config.framebuffer_format == "RGBA8888")
        info.format = 3;
    else
        emulator_error(
            "RV32::handle_sys_get_display_info() --> Unknown framebuffer format: " + g_config.framebuffer_format);
    std::vector<uint8_t> bytes(sizeof(info));
    memcpy(bytes.data(), &info, sizeof(info));
    write_bytes(address, bytes);
    regs.write(Register::a0, 0); // Success
}

void RV32::handle_sys_show_framebuffer(uint32_t parameter) {
    transfer_buffer_address = parameter;

    // Check if the address is valid
    if (!is_in_ram(parameter, g_config.framebuffer_size_bytes)) {
        trigger_trap(TrapReason::MemFault, "RV32::handle_sys_show_framebuffer()",
             "Invalid Framebuffer address: " + std::to_string(parameter));
        return;
    }

    std::lock_guard<std::mutex> lock(transfer_buffer_mtx);
    memcpy(transfer_buffer.data(), read_raw(parameter, g_config.framebuffer_size_bytes),
           g_config.framebuffer_size_bytes);
}

void RV32::handle_sys_get_mouse_pos(uint32_t parameter) {
    write_u32(parameter, mouse_pos_x);
    write_u32(parameter + 4, mouse_pos_y);
}

void RV32::handle_sys_is_mouse_button_down(uint32_t parameter) {
    uint32_t button = read_u32(parameter);
    if (button > 2) {
        emulator_warn("RV32::handle_sys_is_mouse_button_down() --> button " + std::to_string(button) + " out of range");
        regs.write(Register::a0, -1);
        return;
    }
    regs.write(Register::a0, mouse_button_state[button] ? 1 : 0);
}

void RV32::handle_sys_get_us(uint32_t parameter) {
    uint32_t address = parameter;
    if (!is_in_ram(address, sizeof(address))) {
        regs.write(Register::a0, -1); // Failure
        return;
    }
    static auto start_time = std::chrono::steady_clock::now();

    auto elapsed = std::chrono::steady_clock::now() - start_time;
    uint32_t time_us = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();
    write_u32(address, time_us);
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_sleep_us(uint32_t parameter) {
    uint32_t address = parameter;
    if (!is_in_ram(address, sizeof(address))) {
        regs.write(Register::a0, -1); // Failure
        return;
    }
    const uint32_t time_us = read_u32(parameter);
    std::this_thread::sleep_for(std::chrono::microseconds(time_us));
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_key_available(uint32_t parameter) {
    if (is_queue_empty()) {
        regs.write(Register::a0, 0);
    } else {
        regs.write(Register::a0, 1);
    }
}

void RV32::handle_sys_get_key(uint32_t parameter) {
    const uint32_t key = pop_from_queue();
    regs.write(Register::a0, key);
}

void RV32::handle_sys_is_key_down(uint32_t parameter) {
    uint32_t key = parameter;
    regs.write(Register::a0, key_state[key] ? 1 : 0);
}

void RV32::handle_sys_opendir(uint32_t parameter) {
    struct OpendirArgs {
        uint32_t path_ptr;
        uint32_t len;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(OpendirArgs));

    memcpy(&args, raw.data(), sizeof(OpendirArgs));
    const std::vector<uint8_t> path_buffer = read_bytes(args.path_ptr, args.len + 1);
    const std::string path(reinterpret_cast<const char*>(path_buffer.data()));

    int handle = fht->openDir(path);
    regs.write(Register::a0, handle);
}

void RV32::handle_sys_readdir(uint32_t parameter) {
    struct ReaddirArgs {
        uint32_t handle;
        uint32_t dirent_ptr;
    } args{};

    struct Dirent {
        char d_type;
        char d_name[256];
    } dirent{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(ReaddirArgs));
    memcpy(&args, raw.data(), sizeof(ReaddirArgs));
    const std::filesystem::directory_entry* entry = fht->dirReadNext(args.handle);
    if (entry == nullptr) {
        regs.write(Register::a0, -1);
        return;
    }
    std::string name = entry->path().filename().string();
    dirent.d_type = entry->is_directory() ? DT_DIR : DT_REG;
    memcpy(dirent.d_name, name.c_str(), name.length() + 1);
    dirent.d_name[255] = '\0';
    write_bytes(args.dirent_ptr, to_bytes(dirent));
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_closedir(uint32_t parameter) {
    struct ClosedirArgs {
        uint32_t handle;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(ClosedirArgs));
    memcpy(&args, raw.data(), sizeof(ClosedirArgs));

    regs.write(Register::a0, fht->closeDir(args.handle));
}

void RV32::handle_sys_mkdir(uint32_t parameter) {
    struct MkdirArgs {
        uint32_t path_ptr;
        uint32_t len;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(MkdirArgs));
    memcpy(&args, raw.data(), sizeof(MkdirArgs));

    const std::vector<uint8_t> path_buffer = read_bytes(args.path_ptr, args.len + 1);
    const std::string path(reinterpret_cast<const char*>(path_buffer.data()));

    regs.write(Register::a0, fht->makeDir(path));
}

void RV32::handle_sys_rewinddir(uint32_t parameter) {
    struct RewinddirArgs {
        uint32_t handle;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(RewinddirArgs));
    memcpy(&args, raw.data(), sizeof(RewinddirArgs));

    regs.write(Register::a0, fht->rewindDir(args.handle));
}

void RV32::handle_sys_audio_init(uint32_t parameter) {
    struct AudioInitArgs {
        uint32_t sample_rate;
        uint32_t channels;
        uint32_t bits_per_sample;
    } args{};
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(AudioInitArgs));
    memcpy(&args, raw.data(), sizeof(AudioInitArgs));
    if (!audio || !audio->init(args.sample_rate, args.channels, args.bits_per_sample)) {
        regs.write(Register::a0, -1);
        return;
    }
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_audio_submit(uint32_t parameter) {
    struct AudioSubmitArgs {
        uint32_t buffer_ptr;
        uint32_t len;
    } args{};
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(AudioSubmitArgs));
    memcpy(&args, raw.data(), sizeof(AudioSubmitArgs));
    if (args.len == 0) {
        regs.write(Register::a0, -1);
        return;
    }
    const uint8_t* buffer = read_raw(args.buffer_ptr, args.len);
    if (!audio || !buffer) {
        regs.write(Register::a0, -1);
        return;
    }
    audio->submit(buffer, args.len);
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_audio_get_queued_bytes(uint32_t parameter) {
    if (!audio) {
        regs.write(Register::a0, -1);
        return;
    }
    regs.write(Register::a0, audio->get_queued_bytes());
}

void RV32::handle_sys_exit_extended(const uint32_t parameter) {
    struct ExitArgs {
        uint32_t reason_code;
        uint32_t subcode;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(ExitArgs));

    memcpy(&args, raw.data(), sizeof(ExitArgs));

    if (args.reason_code == 0x20026) {
        std::cout << "Process finished with exit code "
                << static_cast<int32_t>(args.subcode) << std::endl;
    }

    running = false;
}

void RV32::handle_sys_flen(uint32_t parameter) {
    const uint32_t handle = read_u32(parameter);
    ssize_t length = fht->getFileLength(handle);
    regs.write(Register::a0, length);
}

void RV32::handle_sys_istty(uint32_t parameter) {
}

void RV32::handle_sys_write(uint32_t parameter) {
    struct WriteArgs {
        uint32_t handle;
        uint32_t buffer_ptr;
        uint32_t length;
    } args{};
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(WriteArgs));

    memcpy(&args, raw.data(), sizeof(WriteArgs));
    const std::vector<uint8_t> buffer = read_bytes(args.buffer_ptr, args.length);
    fht->writeFile(args.handle, reinterpret_cast<const char *>(buffer.data()), buffer.size());
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_open(uint32_t parameter) {
    struct OpenArgs {
        uint32_t filename_ptr;
        uint32_t mode;
        uint32_t filename_length;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(OpenArgs));

    memcpy(&args, raw.data(), sizeof(OpenArgs));
    const std::vector<uint8_t> filename_buffer = read_bytes(args.filename_ptr, args.filename_length + 1);
    const std::vector<uint8_t> path_buffer = read_bytes(args.filename_ptr, args.filename_length + 1);
    const std::string filename(reinterpret_cast<const char*>(path_buffer.data()));

    // Map semihosting mode to C++ fstream flags
    std::ios_base::openmode mode;
    switch (args.mode) {
        case 0: // "r"
            mode = std::ios::in;
            break;
        case 1: // "rb"
            mode = std::ios::in | std::ios::binary;
            break;
        case 2: // "r+"
            mode = std::ios::in | std::ios::out;
            break;
        case 3: // "r+b"
            mode = std::ios::in | std::ios::out | std::ios::binary;
            break;
        case 4: // "w"
            mode = std::ios::out | std::ios::trunc;
            break;
        case 5: // "wb"
            mode = std::ios::out | std::ios::trunc | std::ios::binary;
            break;
        case 6: // "w+"
            mode = std::ios::in | std::ios::out | std::ios::trunc;
            break;
        case 7: // "w+b"
            mode = std::ios::in | std::ios::out | std::ios::trunc | std::ios::binary;
            break;
        case 8: // "a"
            mode = std::ios::out | std::ios::app;
            break;
        case 9: // "ab"
            mode = std::ios::out | std::ios::app | std::ios::binary;
            break;
        case 10: // "a+"
            mode = std::ios::in | std::ios::out | std::ios::app;
            break;
        case 11: // "a+b"
            mode = std::ios::in | std::ios::out | std::ios::app | std::ios::binary;
            break;
        default:
            regs.write(Register::a0, static_cast<uint32_t>(-1));
            errno = EINVAL;
            return;
    }

    int handle = fht->openFile(filename, mode);

    regs.write(Register::a0, handle);
}

void RV32::handle_sys_close(uint32_t parameter) {
    const uint32_t handle = read_u32(parameter);
    fht->closeFile(handle);
    regs.write(Register::a0, 0);
}

void RV32::handle_sys_remove(uint32_t parameter) {
    struct RemoveArgs {
        uint32_t buffer_ptr;
        uint32_t length;
    } args{};

    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(RemoveArgs));
    memcpy(&args, raw.data(), sizeof(RemoveArgs));
    const std::vector<uint8_t> path_buffer = read_bytes(args.buffer_ptr, args.length + 1);
    const std::string path(reinterpret_cast<const char*>(path_buffer.data()));
    regs.write(Register::a0, fht->removeFile(path));
}

void RV32::handle_sys_rename(uint32_t parameter) {
    struct RenameArgs {
        uint32_t old_ptr;
        uint32_t old_length;
        uint32_t new_ptr;
        uint32_t new_length;
    } args{};
    
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(RenameArgs));
    memcpy(&args, raw.data(), sizeof(RenameArgs));
    const std::vector<uint8_t> old_path_buffer = read_bytes(args.old_ptr, args.old_length + 1);
    const std::string old_path(reinterpret_cast<const char*>(old_path_buffer.data()));
    const std::vector<uint8_t> new_path_buffer = read_bytes(args.new_ptr, args.new_length + 1);
    const std::string new_path(reinterpret_cast<const char*>(new_path_buffer.data()));
    regs.write(Register::a0, fht->renameFile(old_path, new_path));
    
}

void RV32::handle_sys_seek(uint32_t parameter) {
    struct SeekArgs {
        uint32_t handle;
        uint32_t abs_position;
    } args{};
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(SeekArgs));

    memcpy(&args, raw.data(), sizeof(SeekArgs));

    if (fht->seekFile(args.handle, args.abs_position) != -1) {
        regs.write(Register::a0, 0);
        return;
    }
    regs.write(Register::a0, -1);
}

void RV32::handle_sys_read(uint32_t parameter) {
    struct ReadArgs {
        uint32_t handle;
        uint32_t buffer_ptr;
        uint32_t count;
    } args{};
    const std::vector<uint8_t> raw = read_bytes(parameter, sizeof(ReadArgs));

    memcpy(&args, raw.data(), sizeof(ReadArgs));

    // Allocate a host buffer to read into
    std::vector<uint8_t> host_buffer(args.count);

    // Read into the host buffer
    ssize_t bytes_read = fht->readFile(args.handle, reinterpret_cast<char *>(host_buffer.data()), args.count);

    if (bytes_read == -1) {
        // Error occurred, errno is already set by fht->read()
        regs.write(Register::a0, -1);
        return;
    }

    // Write the data from host buffer to emulated memory
    write_bytes(args.buffer_ptr, host_buffer);

    uint32_t bytes_not_read = args.count - bytes_read;
    regs.write(Register::a0, bytes_not_read);
}

void RV32::handle_sys_write0(uint32_t parameter) {
    uint32_t ptr = parameter;

    while (true) {
        uint8_t c = read_u8(ptr);
        if (c == 0) break;
        std::cout.put(static_cast<char>(c));
        ptr++;
    }

    std::cout.flush(); // optional, depends on how "debug channel" is modeled
}


[[gnu::always_inline]] inline int32_t RV32::sign_extend(const uint32_t value, const unsigned int fromBits) {
    return static_cast<int32_t>(value << (32 - fromBits)) >> (32 - fromBits);
}

[[gnu::always_inline]] inline uint32_t RV32::get_bits(uint32_t data, unsigned start, unsigned end) {
    return (data >> start) & ((1u << (end - start + 1)) - 1);
}

[[gnu::always_inline]] void RV32::decode_r_type(DecodedInstruction &inst, const uint32_t data) {
    inst.rd = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    inst.rs2 = get_bits(data, 20, 24);
    inst.funct7 = static_cast<Funct7>(get_bits(data, 25, 31));
}

[[gnu::always_inline]] void RV32::decode_i_type(DecodedInstruction &inst, const uint32_t data) {
    inst.rd = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    const uint32_t imm_11_0 = get_bits(data, 20, 31);
    inst.funct7 = static_cast<Funct7>(imm_11_0 >> 5);
    inst.imm = sign_extend(imm_11_0, 12);
}

[[gnu::always_inline]] void RV32::decode_s_type(DecodedInstruction &inst, const uint32_t data) {
    const uint32_t imm_4_0 = get_bits(data, 7, 11);
    inst.funct3 = static_cast<Funct3>(get_bits(data, 12, 14));
    inst.rs1 = get_bits(data, 15, 19);
    inst.rs2 = get_bits(data, 20, 24);
    const uint32_t imm_11_5 = get_bits(data, 25, 31);
    const uint32_t imm = (imm_11_5 << 5) | imm_4_0;
    inst.imm = sign_extend(imm, 12);
}

[[gnu::always_inline]] void RV32::decode_b_type(DecodedInstruction &inst, const uint32_t data) {
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

[[gnu::always_inline]] void RV32::decode_u_type(DecodedInstruction &inst, const uint32_t data) {
    inst.rd = get_bits(data, 7, 11);
    const uint32_t imm_31_12 = get_bits(data, 12, 31);
    inst.imm = static_cast<int32_t>(imm_31_12 << 12);
}

[[gnu::always_inline]] void RV32::decode_j_type(DecodedInstruction &inst, const uint32_t data) {
    inst.rd = get_bits(data, 7, 11);
    const uint32_t imm_19_12 = get_bits(data, 12, 19);
    const uint32_t imm_11 = get_bits(data, 20, 20);
    const uint32_t imm_10_1 = get_bits(data, 21, 30);
    const uint32_t imm_20 = get_bits(data, 31, 31);
    const uint32_t imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);
    inst.imm = sign_extend(imm, 21);
}

uint64_t RV32::read_u64(const uint32_t address) {
    return read_value<uint32_t>(address);
}

uint32_t RV32::read_u32(const uint32_t address) {
    return read_value<uint32_t>(address);
}

uint16_t RV32::read_u16(const uint32_t address) {
    return read_value<uint16_t>(address);
}

uint8_t RV32::read_u8(const uint32_t address) {
    return read_value<uint8_t>(address);
}

const uint8_t * RV32::read_raw(uint32_t address, size_t size) {
    if (!is_in_ram(address, size)) {
        trigger_trap(TrapReason::MemFault, "RV32::read_raw()",
            "Address: " + std::to_string(address) + " not in RAM");
        return {};
    }

    address -= g_config.ram_origin;
    return ram.data() + address;
}

std::vector<uint8_t> RV32::read_bytes(uint32_t address, size_t size) {
    if (!is_in_ram(address, size)) {
        trigger_trap(TrapReason::MemFault, "RV32::read_bytes()",
            "Address: " + std::to_string(address) + " not in RAM");
        return {};
    }

    address -= g_config.ram_origin;
    return {ram.begin() + address, ram.begin() + address + static_cast<long>(size)};
}

template<typename T>
T RV32::read_value(uint32_t address) {
    if (!is_in_ram(address, sizeof(T))) {
        trigger_trap(TrapReason::MemFault, "RV32::read_value()",
            "Address: " + std::to_string(address) + " not in RAM");
        return {};
    }

    address -= g_config.ram_origin;
    T value;

    std::copy_n(
        ram.begin() + address,
        sizeof(T),
        reinterpret_cast<uint8_t *>(&value)
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
    if (!is_in_ram(address, value.size())) {
        trigger_trap(TrapReason::MemFault, "RV32::write_bytes()",
            "Address: " + std::to_string(address) + " not in RAM");
        return;
    }
    if (is_read_only(address)) {
        trigger_trap(TrapReason::MemFault, "RV32::write_bytes()",
                     "Address: " + std::to_string(address) + " is Read Only");
        return;
    }
    address -= g_config.ram_origin;
    std::copy(value.begin(), value.end(), ram.begin() + address);
}

template<typename T>
void RV32::write_value(uint32_t address, T value) {
    if (!is_in_ram(address, sizeof(T))) {
        trigger_trap(TrapReason::MemFault, "RV32::write_value()",
            "Address: " + std::to_string(address) + " not in RAM");
        return;
    }
    if (is_read_only(address)) {
        trigger_trap(TrapReason::MemFault, "RV32::write_value()",
                     "Address: " + std::to_string(address) + " is Read Only");
        return;
    }
    address -= g_config.ram_origin;
    std::copy(reinterpret_cast<const uint8_t *>(&value),
              reinterpret_cast<const uint8_t *>(&value) + sizeof(T),
              ram.begin() + address);
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
