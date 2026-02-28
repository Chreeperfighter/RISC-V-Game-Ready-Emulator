//
// Created by Mark Verbeek on 08.11.25.
//

#include "RV32Debugger.hpp"
#include "Config.hpp"

#include <iostream>

RV32Debugger::RV32Debugger(RV32 &rv32_obj, ELFLoader &elf_obj) : rv32(rv32_obj), elf_loader(elf_obj) {
    for (const auto& bp : g_config.breakpoints) {
        if (bp.address)
            breakpoint_addresses.insert(*bp.address);
    }
    dwarf.parse(elf_loader.get_debug_sections());
}

void RV32Debugger::on_breakpoint() {
    switch (rv32.trap) {
        case TrapReason::Breakpoint:
            std::cout << "[EBREAK] at pc: 0x" << std::hex << rv32.get_pc() << " " << rv32.trap_message << std::endl;
            break;
        case TrapReason::IllegalInst:
            std::cout << "[FAULT] at pc: 0x" << std::hex << rv32.get_pc() << " " << rv32.trap_message << std::endl;
            rv32.running = false;
            break;
        case TrapReason::MemFault:
            std::cout << "[FAULT] at pc: 0x" << std::hex << rv32.get_pc() << " " << rv32.trap_message << std::endl;
            rv32.running = false;
            break;
        case TrapReason::None:
            std::cout << "[BREAKPOINT] at pc: 0x" << std::hex << rv32.get_pc() << " " << rv32.trap_message << std::endl;
            break;
    }

    std::string cmd;
    while (std::cin >> cmd) {
        if (cmd == "c") break;
        if (cmd == "r") {
            std::cout << "Regs: Not implemented" << std::endl;
        }
    }
}

bool RV32Debugger::should_break() {
    return breakpoint_addresses.count(rv32.get_pc()) > 0;
}