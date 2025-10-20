//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "Devices.hpp"
#include "Registers.hpp"

#include <fstream>
#include <vector>
#include <cstdint>
#include <iostream>
#include <chrono>
#include <thread>
#include <atomic>
#include <SDL2/SDL.h>

#define DEBUG 0

struct DisplayContext {
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
};

DisplayContext init_display() {
    SDL_Init(SDL_INIT_VIDEO);

    DisplayContext ctx{};
    ctx.window = SDL_CreateWindow(
        "RISC-V Emulator",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        Config::FB_WIDTH, Config::FB_HEIGHT,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI
    );

    ctx.renderer = SDL_CreateRenderer(
        ctx.window, -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC
    );

    ctx.texture = SDL_CreateTexture(
        ctx.renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        Config::FB_WIDTH, Config::FB_HEIGHT
    );

    return ctx;
}

void update_display(const DisplayContext &ctx, const uint8_t *framebuffer) {
    SDL_UpdateTexture(ctx.texture, nullptr, framebuffer, Config::FB_WIDTH * 4);
    SDL_RenderClear(ctx.renderer);
    SDL_RenderCopy(ctx.renderer, ctx.texture, nullptr, nullptr);
    // unlock
    SDL_RenderPresent(ctx.renderer);
}

void cleanup_display(const DisplayContext &ctx) {
    SDL_DestroyTexture(ctx.texture);
    SDL_DestroyRenderer(ctx.renderer);
    SDL_DestroyWindow(ctx.window);
    SDL_Quit();
}

void load_bin_into_cpu(RV32 &cpu, const std::string &path, const uint32_t start_address) {
    std::ifstream file(path, std::ios::binary | std::ios::ate);
    if (!file) {
        std::cerr << "Failed to open file: " << path << std::endl;
        return;
    }

    const size_t size = file.tellg();
    file.seekg(0, std::ios::beg);

    std::vector<uint8_t> buffer(size);
    if (!file.read(reinterpret_cast<char *>(buffer.data()), static_cast<long>(size))) {
        std::cerr << "Failed to read file: " << path << std::endl;
        return;
    }

    cpu.load_bin(buffer.data(), size, start_address);
}


int main() {
    std::atomic<bool> running(true);
#if !DEBUG
    std::atomic<long long> cycles(0);
#endif

    RV32 rv32i(true, true);
    Display display_ctrl{};
    rv32i.display = &display_ctrl;
    load_bin_into_cpu(
        rv32i,
        "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.bin",
        0);
    const DisplayContext display = init_display();
    display_ctrl.ready = true;
    display_ctrl.width = Config::FB_WIDTH;
    display_ctrl.height = Config::FB_HEIGHT;

    // CPU worker thread
    std::thread cpu_thread([&]() {
#if DEBUG
        uint32_t pc_break = 0;
        bool debug = false;
        while (running && rv32i.running) {
            if (rv32i.get_pc() == pc_break) {
                debug = true;
                while (debug) {
                    char c;
                    std::cout << std::hex << std::showbase << rv32i.get_pc() << ": > ";
                    std::cin >> c;
                    switch (c) {
                        case 'q':
                            running = false;
                            debug = false;
                            break;
                        case 's':
                            rv32i.step();
                            std::cout << "Stepped once" << std::endl;
                            pc_break = rv32i.get_pc();
                            break;
                        case 'r': {
                            Registers regs = rv32i.get_regs();
                            std::array<uint32_t, Registers::NUM_REGS> regs_values = regs.get_registers();
                            for (int reg = 0; reg < Registers::NUM_REGS; reg++) {
                                const uint32_t value = regs_values[reg];
                                const char *reg_name = register_names[reg];
                                std::cout
                                        << std::setw(8) << std::left << reg_name << ": "
                                        << std::hex << std::showbase << std::setw(10) << std::right << value
                                        << " (" << std::dec << std::setw(10) << value << ")" << std::endl;
                            }
                            break;
                        }
                        case 'b': {
                            uint32_t pc;
                            std::cout << "Enter PC to break on: ";
                            std::cin >> std::hex >> pc;
                            pc_break = pc;
                            break;
                        }
                        case 'c': {
                            debug = false;
                            break;
                        }
                        default:
                            break;
                    }
                }
            }
            if (running) {
                rv32i.step();
            }
        }
        running = false;
#else
        while (running && rv32i.running) {
            rv32i.step();
            ++cycles;
        }
        running = false;
#endif
    });

    // Main thread handles display and events
    auto start = std::chrono::steady_clock::now();
    auto last_display = start;
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) running = false;
            if (event.type == SDL_KEYDOWN && event.key.keysym.scancode == SDL_SCANCODE_ESCAPE)
                running = false;
        }

        auto now = std::chrono::steady_clock::now();
        if (display_ctrl.auto_refresh) {
            const auto elapsed_display = std::chrono::duration_cast<std::chrono::milliseconds>(now - last_display).
                    count();
            if (elapsed_display >= 1000 / 60) {
                update_display(display, rv32i.get_vram());
                last_display = now;
            }
        } else {
            if (display_ctrl.new_frame) {
                display_ctrl.new_frame = false;
                display_ctrl.ready = false;
                const uint8_t* framebuffer = rv32i.get_framebuffer();
                update_display(display, framebuffer);
                display_ctrl.ready = true;
            }
        }

        const auto elapsed_sec = std::chrono::duration_cast<std::chrono::milliseconds>(now - start).count();
        if (elapsed_sec >= 1000) {
#if !DEBUG
            std::cout << "Cycles/s: " << cycles << std::endl;
            start = now;
            cycles = 0;
#endif
        }
    }
    cpu_thread.join();
    cleanup_display(display);
}
