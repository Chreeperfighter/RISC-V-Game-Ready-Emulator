//
// Created by Mark Verbeek on 10.03.26.
//

#ifndef UTILS_HPP
#define UTILS_HPP

#include <iostream>
#include <string>
#include <cstdlib>

#include "Config.hpp"

[[noreturn]] inline void emulator_error(const std::string& msg) {
    std::cerr << "[EMULATOR] error: " << msg << "\n";
    std::exit(1);
}

inline void emulator_warn(const std::string& msg) {
    std::cerr << "[EMULATOR] warning: " << msg << "\n";
}

[[gnu::always_inline]] static inline bool is_in_ram(uint32_t address, uint32_t size = 1) {
    return address >= g_config.ram_origin && address + size <= g_config.ram_end;
}

#endif //UTILS_HPP
