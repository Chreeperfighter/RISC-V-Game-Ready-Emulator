//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CONFIG_HPP
#define CONFIG_HPP
#include <cstdint>

namespace Config {
    constexpr uint32_t RAM_ORIGIN = 0x00000000;
    constexpr uint32_t RAM_SIZE = 512 * 1024;
    constexpr uint32_t RAM_END = RAM_ORIGIN + RAM_SIZE;
}

#endif //CONFIG_HPP
