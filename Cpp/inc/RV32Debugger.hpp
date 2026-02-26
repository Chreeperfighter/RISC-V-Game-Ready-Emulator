//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef RV32DEBUGGER_HPP
#define RV32DEBUGGER_HPP

#include "RV32.hpp"
#include "ELFLoader.hpp"
#include "Config.hpp"

#include <set>

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &rv32_obj, ELFLoader &elf_obj);
    void on_breakpoint();
    bool should_break();
private:
    RV32 &rv32;
    ELFLoader &elf_loader;
    std::set<uint32_t> breakpoint_addresses;
};

#endif //RV32DEBUGGER_HPP
