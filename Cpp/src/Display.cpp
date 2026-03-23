//
// Created by Mark Verbeek on 08.11.25.
//

#include "Display.hpp"
#include "Config.hpp"
#include "Utils.hpp"

void Display::init_display() {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Rect usable{};
    SDL_GetDisplayUsableBounds(0, &usable);
    int scale = std::min(usable.w / g_config.framebuffer_width,
                         usable.h / g_config.framebuffer_height);
    if (scale < 1) scale = 1;

    context.window = SDL_CreateWindow(
        "RISC-V Emulator",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        g_config.framebuffer_width * scale,
        g_config.framebuffer_height * scale,
        SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI
    );
    context.renderer = SDL_CreateRenderer(
        context.window, -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC
    );

    SDL_PixelFormatEnum sdl_format;
    if (g_config.framebuffer_format == "ARGB8888") sdl_format = SDL_PIXELFORMAT_BGRA8888;
    else if (g_config.framebuffer_format == "RGBA8888") sdl_format = SDL_PIXELFORMAT_ABGR8888;
    else if (g_config.framebuffer_format == "RGB888") sdl_format = SDL_PIXELFORMAT_RGB24;
    else if (g_config.framebuffer_format == "RGB565") sdl_format = SDL_PIXELFORMAT_RGB565;
    else emulator_error("Display::init_display() --> Unsupported framebuffer format: " + g_config.framebuffer_format);

    context.texture = SDL_CreateTexture(
        context.renderer,
        sdl_format,
        SDL_TEXTUREACCESS_STREAMING,
        g_config.framebuffer_width, g_config.framebuffer_height
    );

    framebuffer.resize(g_config.framebuffer_size_bytes);
}

void Display::update_display() {
    rv32.get_transfer_buffer(framebuffer);
    const uint8_t *framebuffer_addr = framebuffer.data();
    void *pixels;
    int pitch;

    // Lock the texture to get direct access to pixel memory
    if (SDL_LockTexture(context.texture, nullptr, &pixels, &pitch) == 0) {
        // Copy framebuffer data to texture
        // If pitch matches your framebuffer width, you can do a single memcpy
        const int row_bytes = g_config.framebuffer_width * (g_config.framebuffer_bpp / 8);
        if (pitch == row_bytes) {
            memcpy(pixels, framebuffer_addr, g_config.framebuffer_size_bytes);
        } else {
            for (int y = 0; y < g_config.framebuffer_height; y++) {
                memcpy(
                    static_cast<uint8_t *>(pixels) + y * pitch,
                    framebuffer_addr + y * row_bytes,
                    row_bytes
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

DisplayContext &Display::get_context() {
    return context;
}