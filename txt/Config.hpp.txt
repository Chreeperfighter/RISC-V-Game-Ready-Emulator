//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CONFIG_HPP
#define CONFIG_HPP
#include <cstdint>

namespace Config {
    constexpr uint32_t RAM_ORIGIN = 0x00000000;
    constexpr uint32_t RAM_SIZE = 32 * 1024 * 1024;
    constexpr uint32_t RAM_END = RAM_ORIGIN + RAM_SIZE;

    constexpr uint32_t STACK_MARGIN = 16 * 1024;

    constexpr uint32_t FB_WIDTH = 1920;
    constexpr uint32_t FB_HEIGHT = 1080;
    constexpr uint32_t FB_BPP = 4; // Bytes per pixel
    constexpr uint32_t FB_SIZE = FB_WIDTH * FB_HEIGHT * FB_BPP;
}

#endif //CONFIG_HPP
