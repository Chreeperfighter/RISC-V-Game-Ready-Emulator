//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"
#include "SimpleELFLoader.hpp"
#include "elf.h"

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
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Texture* texture;
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

void update_display(const DisplayContext& ctx, const uint8_t* framebuffer) {
    SDL_UpdateTexture(ctx.texture, nullptr, framebuffer, Config::FB_WIDTH * 4);
    SDL_RenderClear(ctx.renderer);
    SDL_RenderCopy(ctx.renderer, ctx.texture, nullptr, nullptr);
    SDL_RenderPresent(ctx.renderer);
}

void cleanup_display(const DisplayContext& ctx) {
    SDL_DestroyTexture(ctx.texture);
    SDL_DestroyRenderer(ctx.renderer);
    SDL_DestroyWindow(ctx.window);
    SDL_Quit();
}

int main() {
    std::vector<uint8_t> buffer(Config::FB_SIZE);
    std::atomic<bool> running(true);

#if !DEBUG
    uint32_t frames = 0;
    std::atomic<long long> cycles(0);
#endif

    RV32 rv32i(true, true);
    std::vector<uint8_t> elf = read_file("/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.elf");
    const uint32_t entry_point = get_entry_point(elf);
    const uint32_t bss_end = get_bss_end(elf);
    rv32i.set_heap(bss_end);
    const uint32_t text_start = get_text_start(elf);
    const uint32_t text_end = get_text_end(elf);
    rv32i.set_text_range(text_start, text_end);
    const std::vector<uint8_t> code = get_binary(elf);
    rv32i.load_bin(code, code.size(), entry_point);

    const DisplayContext display = init_display();

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
                            auto regs_values = regs.get_registers();
                            for (int reg = 0; reg < Registers::NUM_REGS; reg++) {
                                const uint32_t value = regs_values[reg];
                                const char* reg_name = register_names[reg];
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
                        case 'c':
                            debug = false;
                            break;
                        default:
                            break;
                    }
                }
            }
            if (running) rv32i.step();
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
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) running = false;
            if (event.type == SDL_KEYDOWN) {
                SDL_Keycode keycode = event.key.keysym.sym;
                rv32i.add_key_to_queue(keycode);
            }
            if (event.type == SDL_KEYDOWN && event.key.keysym.scancode == SDL_SCANCODE_ESCAPE)
                running = false;
        }

        auto now = std::chrono::steady_clock::now();
        rv32i.get_transfer_buffer(buffer);
        update_display(display, buffer.data());
        frames++;

        const auto elapsed_ms = std::chrono::duration_cast<std::chrono::milliseconds>(now - start).count();
        if (elapsed_ms >= 1000) {
#if !DEBUG
            //std::cout << "Display FPS: " << frames << std::endl;
            frames = 0;
            std::cout << "Cycles/s: " << cycles << std::endl;
            start = now;
            cycles = 0;
#endif
        }
    }

    cpu_thread.join();
    cleanup_display(display);
}
