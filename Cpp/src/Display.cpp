//
// Created by Mark Verbeek on 08.11.25.
//

#include "Display.hpp"
#include "Config.hpp"

void Display::init_display() {
    SDL_Init(SDL_INIT_VIDEO);
    context.window = SDL_CreateWindow(
        "RISC-V Emulator",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        Config::FB_WIDTH, Config::FB_HEIGHT,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI
    );
    context.renderer = SDL_CreateRenderer(
        context.window, -1,
        SDL_RENDERER_ACCELERATED
    );

    context.texture = SDL_CreateTexture(
        context.renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        Config::FB_WIDTH, Config::FB_HEIGHT
    );
}

void Display::update_display() {
    std::vector<uint8_t> framebuffer(Config::FB_SIZE);
    rv32.get_transfer_buffer(framebuffer);
    const uint8_t* framebuffer_addr = framebuffer.data();
    void* pixels;
    int pitch;

    // Lock the texture to get direct access to pixel memory
    if (SDL_LockTexture(context.texture, nullptr, &pixels, &pitch) == 0) {
        // Copy framebuffer data to texture
        // If pitch matches your framebuffer width, you can do a single memcpy
        if (pitch == Config::FB_WIDTH * 4) {
            memcpy(pixels, framebuffer_addr, Config::FB_SIZE);
        } else {
            // If pitch differs, copy row by row
            for (int y = 0; y < Config::FB_HEIGHT; y++) {
                memcpy(
                    static_cast<uint8_t*>(pixels) + y * pitch,
                    framebuffer_addr + y * Config::FB_WIDTH * 4,
                    Config::FB_WIDTH * 4
                );
            }
        }

        SDL_UnlockTexture(context.texture);
    }

    SDL_RenderClear(context.renderer);
    SDL_RenderCopy(context.renderer, context.texture, nullptr, nullptr);
    SDL_RenderPresent(context.renderer);
}

void Display::cleanup_display() {
    SDL_DestroyTexture(context.texture);
    SDL_DestroyRenderer(context.renderer);
    SDL_DestroyWindow(context.window);
    SDL_Quit();
}