//
// Created by Mark Verbeek on 28.10.25.
//

#ifndef ASCII_H
#define ASCII_H

#include <unordered_map>
#include <SDL2/SDL.h>

std::unordered_map<SDL_Keycode, uint8_t> keycode_map = {
    {SDLK_LSHIFT, 128},
    {SDLK_RSHIFT, 129},
    {SDLK_LCTRL, 130},
    {SDLK_RCTRL, 131},
    {SDLK_LALT, 132},
    {SDLK_RALT, 133},
    {SDLK_UP, 134},
    {SDLK_DOWN, 135},
    {SDLK_LEFT, 136},
    {SDLK_RIGHT, 137},
};

inline uint8_t map_keycode(const SDL_Keycode keycode) {
    if (keycode < 256) return keycode;  // ASCII passthrough

    const auto it = keycode_map.find(keycode);
    if (it != keycode_map.end()) {
        return it->second;
    }
    return 0;  // Unknown key
}

#endif //ASCII_H
