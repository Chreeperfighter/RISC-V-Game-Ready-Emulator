//
// Created by Mark Verbeek on 08.11.25.
//

#include "Input.hpp"

#include <iostream>

#include "Config.hpp"

bool Input::process_event(const SDL_Event &event) {
    int window_w, window_h;
    const DisplayContext context = display.get_context();
    SDL_GetWindowSize(context.window, &window_w, &window_h);
    if (event.type == SDL_QUIT) {
        return true;
    }
    if (event.type == SDL_MOUSEMOTION) {
        const int32_t mouse_x = event.motion.x;
        const int32_t mouse_y = event.motion.y;
        const int32_t scaled_x = (mouse_x * static_cast<int32_t>(Config::FB_WIDTH)) / window_w;
        const int32_t scaled_y = (mouse_y * static_cast<int32_t>(Config::FB_HEIGHT)) / window_h;
        rv32.set_mouse_pos(scaled_x, scaled_y);
    } else if (event.type == SDL_MOUSEBUTTONDOWN) {
        const uint32_t button = event.button.button;
        rv32.add_mouse_button_state(button - 1);
    } else if (event.type == SDL_MOUSEBUTTONUP) {
        const uint32_t button = event.button.button;
        rv32.remove_mouse_button_state(button - 1);
    } else if (event.type == SDL_KEYDOWN) {
        const SDL_Scancode scancode = event.key.keysym.scancode;
        rv32.add_key_to_queue(scancode);
        rv32.add_key_state(scancode);
    } else if (event.type == SDL_KEYUP) {
        const SDL_Scancode scancode = event.key.keysym.scancode;
        rv32.add_key_to_queue(scancode | 0x8000);
        rv32.remove_key_state(scancode);
    }
    return false;
}
