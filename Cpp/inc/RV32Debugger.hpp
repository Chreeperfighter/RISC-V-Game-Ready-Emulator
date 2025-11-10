//
// Created by Mark Verbeek on 08.11.25.
//

#ifndef RV32DEBUGGER_HPP
#define RV32DEBUGGER_HPP

#include "RV32.hpp"

#include <atomic>

class RV32Debugger {
public:
    explicit RV32Debugger(RV32 &obj) : rv32(obj), running(true) {}
private:
    RV32 &rv32;
    std::atomic<bool> running;
};



#endif //RV32DEBUGGER_HPP
