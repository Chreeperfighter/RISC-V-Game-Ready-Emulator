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

    constexpr uint32_t VRAM_ORIGIN = 0x10000000;
    constexpr uint32_t VRAM_SIZE = 8 * 1024 * 1024;
    constexpr uint32_t VRAM_END = VRAM_ORIGIN + VRAM_SIZE;

    constexpr uint32_t FB_WIDTH = 1920;
    constexpr uint32_t FB_HEIGHT = 1080;
    constexpr uint32_t FB_BPP = 4; // Bytes per pixel
    constexpr uint32_t FB_SIZE = FB_WIDTH * FB_HEIGHT * FB_BPP;

    static_assert(FB_SIZE <= VRAM_SIZE, "Framebuffer doesn't fit in VRAM");
}

#endif //CONFIG_HPP
