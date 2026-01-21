//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef RV32DEBUGGER_HPP
#define RV32DEBUGGER_HPP

#include "RV32.hpp"
#include "ELFLoader.hpp"

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &rv32_obj, ELFLoader &elf_obj) : rv32(rv32_obj), elf_loader(elf_obj), running(true) {}
    void on_breakpoint();
private:
    RV32 &rv32;
    ELFLoader &elf_loader;
    bool running;
};



#endif //RV32DEBUGGER_HPP
