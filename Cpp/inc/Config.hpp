//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CONFIG_HPP
#define CONFIG_HPP
#include <cstdint>
#include <toml.hpp>
#include <string>

struct Config {
    // Binary
    std::string binary_path;

    // Storage
    std::string storage_path;

    // RAM
    uint32_t ram_origin;
    uint32_t ram_end;
    uint32_t ram_size_bytes;  // convert from MB
    uint32_t stack_margin_bytes;  // convert from MB

    // Framebuffer
    int framebuffer_width;
    int framebuffer_height;
    int framebuffer_bpp;
    int framebuffer_size_bytes;
    std::string framebuffer_format;

    // Debug
    bool debug_enabled;

    // Init
    bool randomize_registers;
    bool randomize_ram;
    bool zero_bss;

    // Load from TOML file
    static Config load(const std::string& path);

    // Get default config
    static Config defaults();
};

// Global instance (define in config.cpp)
extern Config g_config;

#endif //CONFIG_HPP
