//
// Created by Mark Verbeek on 08.11.25.
//

#include "RV32Debugger.hpp"

#include <iostream>

void RV32Debugger::on_breakpoint() {
    std::cout << "Breakpoint" << std::endl;
}