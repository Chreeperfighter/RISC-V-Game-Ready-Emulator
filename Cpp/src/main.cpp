//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"
#include "Config.hpp"

#include <fstream>
#include <vector>
#include <cstdint>
#include <iostream>
#include <chrono>
#include <thread>
#include <atomic>
#include <SDL2/SDL.h>

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
        SDL_WINDOW_SHOWN
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
    SDL_RenderPresent(ctx.renderer);
}

void cleanup_display(const DisplayContext& ctx) {
    SDL_DestroyTexture(ctx.texture);
    SDL_DestroyRenderer(ctx.renderer);
    SDL_DestroyWindow(ctx.window);
    SDL_Quit();
}

bool handle_events() {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            return false;
        }
        if (event.type == SDL_KEYDOWN && event.key.keysym.scancode == SDLK_ESCAPE) {
            return false;
        }
    }
    return true;
}

void load_bin_into_cpu(RV32& cpu, const std::string& path, const uint32_t start_address) {
    std::ifstream file(path, std::ios::binary | std::ios::ate);
    if (!file) {
        std::cerr << "Failed to open file: " << path << std::endl;
        return;
    }

    const size_t size = file.tellg();
    file.seekg(0, std::ios::beg);

    std::vector<uint8_t> buffer(size);
    if (!file.read(reinterpret_cast<char*>(buffer.data()), static_cast<long>(size))) {
        std::cerr << "Failed to read file: " << path << std::endl;
        return;
    }

    cpu.load_bin(buffer.data(), size, start_address);
}


int main() {
    std::atomic<bool> running(true);
    std::atomic<long long> cycles(0);

    RV32 rv32i(true, true);
    load_bin_into_cpu(rv32i, "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.bin", 0);
    const DisplayContext display = init_display();

    // CPU worker thread
    std::thread cpu_thread([&]() {
        while (running && rv32i.running) {
            rv32i.step();
            ++cycles;
        }
        running = false;
    });

    // Main thread handles display and events
    auto start = std::chrono::steady_clock::now();
    auto last_display = start;
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) running = false;
            if (event.type == SDL_KEYDOWN && event.key.keysym.scancode == SDLK_ESCAPE)
                running = false;
        }

        auto now = std::chrono::steady_clock::now();
        const auto elapsed_display = std::chrono::duration_cast<std::chrono::milliseconds>(now - last_display).count();
        if (elapsed_display >= 1000/60) {
            update_display(display, rv32i.get_vram());
            last_display = now;
        }

        const auto elapsed_sec = std::chrono::duration_cast<std::chrono::milliseconds>(now - start).count();
        if (elapsed_sec >= 1000) {
            std::cout << "Cycles/s: " << cycles << std::endl;
            start = now;
            cycles = 0;
        }
    }
    cpu_thread.join();
    cleanup_display(display);

}