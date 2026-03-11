//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef RV32DEBUGGER_HPP
#define RV32DEBUGGER_HPP

#include "RV32.hpp"
#include "ELFLoader.hpp"
#include "Config.hpp"
#include "DWARFReader.hpp"

#include <set>

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &rv32_obj);
    void on_breakpoint();
    bool should_break();
private:
    bool handle_command(const std::string& cmd, const SubProgram* sub);

    enum class StepMode { None, Into, Over };

    RV32 &rv32;
    std::set<uint32_t> breakpoint_addresses;
    DWARFReader dwarf;

    StepMode step_mode = StepMode::None;
    uint32_t step_sp   = 0;  // SP at the time step-over was issued
    uint32_t step_line = 0;  // source line we are stepping away from
};

#endif //RV32DEBUGGER_HPP
