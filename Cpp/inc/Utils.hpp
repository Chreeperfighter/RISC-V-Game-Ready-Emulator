//
// Created by Mark Verbeek on 10.03.26.
//

#ifndef UTILS_HPP
#define UTILS_HPP

#include <iostream>
#include <string>
#include <cstdlib>

[[noreturn]] inline void emulator_error(const std::string& msg) {
    std::cerr << "[EMULATOR] error: " << msg << "\n";
    std::exit(1);
}

inline void emulator_warn(const std::string& msg) {
    std::cerr << "[EMULATOR] warning: " << msg << "\n";
}


#endif //UTILS_HPP
