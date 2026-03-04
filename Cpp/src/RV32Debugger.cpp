//
// Created by Mark Verbeek on 08.11.25.
//

#include "RV32Debugger.hpp"
#include "Config.hpp"

#include <fstream>
#include <iostream>

RV32Debugger::RV32Debugger(RV32 &rv32_obj, ELFLoader &elf_obj) : rv32(rv32_obj), elf_loader(elf_obj) {
    dwarf.parse(elf_loader.get_debug_sections());
    for (const auto& bp : g_config.breakpoints) {
        if (bp.address.has_value())
            breakpoint_addresses.insert(*bp.address);
        else if (bp.line.has_value() && bp.file.has_value()) {
            std::optional<uint32_t> address = dwarf.lookup_address(bp.file.value(), bp.line.value());
            if (address.has_value()) {
                breakpoint_addresses.insert(address.value());
            }
        }
    }
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
    std::optional<LineEntry> entry = dwarf.lookup_line(rv32.get_pc());
    if (entry.has_value()) {
        std::cout << entry->file << ":" << entry->line;
        if (entry->column > 0)
            std::cout << ":" << entry->column;
        std::cout << std::endl;

        std::ifstream f(entry->file);
        if (f) {
            std::string line;
            for (uint32_t i = 1; i <= entry->line; ++i)
                std::getline(f, line);
            std::cout << entry->line << " | " << line << std::endl;
            if (entry->column > 0)
                std::cout << std::string(std::to_string(entry->line).size() + 3 + entry->column - 1, ' ') << "^" << std::endl;
        }
    }

    std::cout << "> ";
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