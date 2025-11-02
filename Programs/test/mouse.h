//
// Created by Mark Verbeek on 30.10.25.
//

#ifndef MOUSE_H
#define MOUSE_H

#include <stdint.h>
#include <stdbool.h>

#define GET_MOUSE_POS 17
#define IS_MOUSE_BUTTON_DOWN 18

#define MOUSE_BUTTON_LEFT 1
#define MOUSE_BUTTON_RIGHT 3
#define MOUSE_BUTTON_MIDDLE 2

static inline void get_mouse_pos(int32_t *x, int32_t *y) {
    register int32_t a0 __asm__("a0");
    register int32_t a1 __asm__("a1");
    register long a7 __asm__("a7") = GET_MOUSE_POS;

    __asm__ volatile ("ecall" : "=r"(a0), "=r"(a1) : "r"(a7) : "memory");
    *x = a0;
    *y = a1;
}

static inline bool mouse_button_pressed(const uint32_t button) {
    register uint32_t a0 __asm__("a0") = button;
    register long a7 __asm__("a7") = IS_MOUSE_BUTTON_DOWN;

    __asm__ volatile ("ecall" : "+r"(a0) : "r"(a7) : "memory");
    return a0;
}

#endif //MOUSE_H
