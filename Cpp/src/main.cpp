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
        SDL_RENDERER_ACCELERATED
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
    void* pixels;
    int pitch;

    // Lock the texture to get direct access to pixel memory
    if (SDL_LockTexture(ctx.texture, nullptr, &pixels, &pitch) == 0) {
        // Copy framebuffer data to texture
        // If pitch matches your framebuffer width, you can do a single memcpy
        if (pitch == Config::FB_WIDTH * 4) {
            memcpy(pixels, framebuffer, Config::FB_SIZE);
        } else {
            // If pitch differs, copy row by row
            for (int y = 0; y < Config::FB_HEIGHT; y++) {
                memcpy(
                    static_cast<uint8_t*>(pixels) + y * pitch,
                    framebuffer + y * Config::FB_WIDTH * 4,
                    Config::FB_WIDTH * 4
                );
            }
        }

        SDL_UnlockTexture(ctx.texture);
    }

    SDL_RenderClear(ctx.renderer);
    SDL_RenderCopy(ctx.renderer, ctx.texture, nullptr, nullptr);
    SDL_RenderPresent(ctx.renderer);
}

void cleanup_display(const DisplayContext &ctx) {
    SDL_DestroyTexture(ctx.texture);
    SDL_DestroyRenderer(ctx.renderer);
    SDL_DestroyWindow(ctx.window);
    SDL_Quit();
}

int main() {
    std::vector<uint8_t> buffer(Config::FB_SIZE);
    std::atomic<bool> running(true);

    RV32 rv32i(true, true);
    std::vector<uint8_t> elf = read_file(
        "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.elf");
    const uint32_t entry_point = get_entry_point(elf);
    const uint32_t bss_end = get_bss_end(elf);
    rv32i.set_heap(bss_end);
    const uint32_t text_start = get_text_start(elf);
    const uint32_t text_end = get_text_end(elf);
    rv32i.set_text_range(text_start, text_end);
    const std::vector<uint8_t> code = get_binary(elf);
    rv32i.load_bin(code, code.size(), entry_point);
    const DisplayContext display = init_display();
    int window_w, window_h;
    SDL_GetWindowSize(display.window, &window_w, &window_h);

    // CPU worker thread - move emulation off main thread
    std::thread cpu_thread([&]() {
        while (running && rv32i.running) {
            rv32i.step();
        }
        running = false;
    });

    // Frame timing for 60 FPS display updates
    const std::chrono::microseconds frame_duration(16667); // ~60 FPS (1000000/60)
    auto last_display_time = std::chrono::steady_clock::now();

    // Main thread handles SDL events and display
    SDL_Event event;
    while (running) {
        // Poll events at full speed (required on macOS main thread)
        SDL_GetWindowSize(display.window, &window_w, &window_h);

        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            }
            if (event.type == SDL_MOUSEMOTION) {
                const int32_t mouse_x = event.motion.x;
                const int32_t mouse_y = event.motion.y;
                const int32_t scaled_x = (mouse_x * Config::FB_WIDTH) / window_w;
                const int32_t scaled_y = (mouse_y * Config::FB_HEIGHT) / window_h;
                rv32i.set_mouse_pos(scaled_x, scaled_y);
            } else if (event.type == SDL_MOUSEBUTTONDOWN) {
                const uint32_t button = event.button.button;
                rv32i.add_mouse_button_state(button - 1);
            } else if (event.type == SDL_MOUSEBUTTONUP) {
                const uint32_t button = event.button.button;
                rv32i.remove_mouse_button_state(button - 1);
            } else if (event.type == SDL_KEYDOWN) {
                SDL_Scancode scancode = event.key.keysym.scancode;
                rv32i.add_key_to_queue(scancode);
                rv32i.add_key_state(scancode);
            } else if (event.type == SDL_KEYUP) {
                SDL_Scancode scancode = event.key.keysym.scancode;
                rv32i.add_key_to_queue(scancode | 0x8000);
                rv32i.remove_key_state(scancode);
            }

            if (event.type == SDL_KEYDOWN && event.key.keysym.scancode == SDL_SCANCODE_ESCAPE) {
                running = false;
            }
        }

        // Update display only at 60 FPS
        auto now = std::chrono::steady_clock::now();
        auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(now - last_display_time);

        if (elapsed >= frame_duration) {
            rv32i.get_transfer_buffer(buffer);
            update_display(display, buffer.data());
            last_display_time = now;
        }
        SDL_Delay(1);
    }

    cpu_thread.join();
    cleanup_display(display);
}