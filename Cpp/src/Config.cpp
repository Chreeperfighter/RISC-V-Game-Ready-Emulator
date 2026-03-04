//
// Created by Mark Verbeek on 08.02.26.
//

// config.cpp
#include "config.hpp"
#include <toml.hpp>
#include <iostream>

Config g_config;

Config Config::defaults() {
    Config cfg;
    cfg.binary_path = "";
    cfg.storage_path = "./storage";
    cfg.ram_origin = 0x00000000;
    cfg.ram_size_bytes = 32 * 1024 * 1024;  // 32MB
    cfg.stack_margin_bytes = 2 * 1024 * 1024;  // 2MB
    cfg.ram_end = cfg.ram_origin + cfg.ram_size_bytes;
    cfg.framebuffer_width = 320;
    cfg.framebuffer_height = 200;
    cfg.framebuffer_bpp = 32;
    cfg.framebuffer_format = "ARGB";
    cfg.framebuffer_size_bytes = cfg.framebuffer_width * cfg.framebuffer_height * (cfg.framebuffer_bpp / 8);
    cfg.debug_enabled = false;
    cfg.perf_monitor = false;
    cfg.fps = 60;
    cfg.breakpoints = {};
    cfg.randomize_registers = true;
    cfg.randomize_ram = true;
    cfg.zero_bss = true;
    return cfg;
}

Config Config::load(const std::string& path) {
    Config cfg = defaults();  // Start with defaults

    try {
        const auto data = toml::parse(path);

        // Binary
        if (data.contains("binary")) {
            const auto& binary = toml::find(data, "binary");
            cfg.binary_path = toml::find<std::string>(binary, "path");
        }

        // Storage
        if (data.contains("storage")) {
            const auto& storage = toml::find(data, "storage");
            cfg.storage_path = toml::find<std::string>(storage, "path");
        }

        // RAM
        if (data.contains("ram")) {
            const auto& ram = toml::find(data, "ram");
            cfg.ram_origin = toml::find<uint32_t>(ram, "ram_origin");
            cfg.ram_size_bytes = toml::find<uint32_t>(ram, "ram_size_mb") * 1024 * 1024;
            cfg.ram_end = cfg.ram_origin + cfg.ram_size_bytes;
            cfg.stack_margin_bytes = toml::find<uint32_t>(ram, "stack_margin_mb") * 1024 * 1024;
        }

        // Framebuffer
        if (data.contains("framebuffer")) {
            const auto& fb = toml::find(data, "framebuffer");
            cfg.framebuffer_width = toml::find<int>(fb, "width");
            cfg.framebuffer_height = toml::find<int>(fb, "height");
            cfg.framebuffer_format = toml::find<std::string>(fb, "format");

            if (cfg.framebuffer_format == "ARGB") {
                cfg.framebuffer_bpp = 32;
            } else if (cfg.framebuffer_format == "RGB") {
                cfg.framebuffer_bpp = 24;
            } else if (cfg.framebuffer_format == "RGB565") {
                cfg.framebuffer_bpp = 16;
            } else {
                std::cerr << "[ERROR] Config::load(): Unknown framebuffer format: "
                          << cfg.framebuffer_format << std::endl;
                throw std::runtime_error("Invalid framebuffer format");
            }
            cfg.framebuffer_size_bytes = cfg.framebuffer_width * cfg.framebuffer_height * (cfg.framebuffer_bpp / 8);
        }

        // Debug
        if (data.contains("debug")) {
            const auto& debug = toml::find(data, "debug");
            cfg.debug_enabled = toml::find<bool>(debug, "enabled");
            if (debug.contains("perf_monitor"))
                cfg.perf_monitor = toml::find<bool>(debug, "perf_monitor");
            if (debug.contains("fps"))
                cfg.fps = toml::find<int>(debug, "fps");

            if (debug.contains("breakpoint")) {
                const auto& bps = toml::find(debug, "breakpoint");
                for (const auto& bp : bps.as_array()) {
                    BreakpointConfig bpc;
                    if (bp.contains("address")) {
                        bpc.address = toml::find<int>(bp, "address");
                    }
                    if (bp.contains("file"))
                        bpc.file = toml::find<std::string>(bp, "file");
                    if (bp.contains("line"))
                        bpc.line = toml::find<uint32_t>(bp, "line");
                    cfg.breakpoints.push_back(bpc);
                }
            }
        }

        // Init
        if (data.contains("init")) {
            const auto& init = toml::find(data, "init");
            cfg.randomize_registers = toml::find<bool>(init, "randomize_registers");
            cfg.randomize_ram = toml::find<bool>(init, "randomize_ram");
            cfg.zero_bss = toml::find<bool>(init, "zero_bss");
        }

        // Validate
        if (cfg.ram_size_bytes == 0) {
            throw std::runtime_error("RAM size must be > 0");
        }
        if (cfg.framebuffer_width <= 0 || cfg.framebuffer_height <= 0) {
            throw std::runtime_error("Framebuffer dimensions must be > 0");
        }

    } catch (const std::exception& e) {
        std::cerr << "Error loading config: " << e.what() << std::endl;
        throw;
    }

    return cfg;
}