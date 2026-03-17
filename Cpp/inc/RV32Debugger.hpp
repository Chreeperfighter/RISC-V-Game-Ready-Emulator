//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef RV32DEBUGGER_HPP
#define RV32DEBUGGER_HPP

#ifdef EMULATOR_DEBUG

#include "RV32.hpp"
#include "DWARFReader.hpp"

#include <set>
#include <map>

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &rv32_obj);
    void on_trap();
    bool should_break();
private:
    bool handle_command(const std::string& cmd);
    bool parse_disassembly();

    enum class StepMode { None, Into, Over };

    RV32 &rv32;
    std::set<uint32_t> breakpoint_addresses;
    DWARFReader dwarf;

    StepMode step_mode = StepMode::None;
    uint32_t step_sp   = 0;
    uint32_t step_line = 0;
    std::map<uint32_t, std::string> assembly{};
    std::map<uint32_t, std::string> assembly_labels{};
};

#else

#include "RV32.hpp"

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &) {}
    static void on_trap() {}
    static bool should_break() { return false; }
};

#endif  // EMULATOR_DEBUG
#endif  // RV32DEBUGGER_HPP