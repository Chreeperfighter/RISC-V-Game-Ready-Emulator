//
// Created by Mark Verbeek on 11.03.26.
//

#include "rv32_input.h"
#include "rv32_syscalls.h"

// Keyboard
bool key_available() {
    return (bool)sys_key_available();
}
SDL_Scancode pop_key() {
    return (SDL_Scancode)sys_get_key();
}
bool is_key_down(SDL_Scancode scancode) {
    return (bool)sys_is_key_down(scancode);
}

// Mouse
void get_mouse_pos(struct MousePos* mouse_pos) {
    if (mouse_pos) sys_get_mouse_pos(mouse_pos);
}

bool is_mouse_button_down(MouseButton button, bool* ok) {
    int32_t ret = sys_is_mouse_button_down(&button);
    bool valid = (ret == 0 || ret == 1);
    if (ok) *ok = valid;
    return ret == 1;
}

bool is_controller_button_down(SDL_GameControllerButton button, bool *ok) {
    int32_t ret = sys_is_controller_button_down(button);
    bool valid = (ret == 0 || ret == 1);
    if (ok) *ok = valid;
    return ret == 1;
}

int32_t get_controller_axis(SDL_GameControllerAxis axis) {
    return sys_get_controller_axis(axis);
}
