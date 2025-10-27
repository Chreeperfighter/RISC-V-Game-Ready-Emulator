//
// Created by Mark Verbeek on 26.10.25.
//

#ifndef KEYBOARD_H
#define KEYBOARD_H

#include <stdbool.h>

#define KEY_AVAILABLE 13
#define GET_KEY 14

static inline bool key_available() {
    register long a0 __asm__("a0");
    register long a7 __asm__("a7") = KEY_AVAILABLE;

    __asm__ volatile ("ecall" : "=r"(a0) : "r"(a7) : "memory");
    return a0;
}

static inline int get_key() {
    register long a0 __asm__("a0");
    register long a7 __asm__("a7") = GET_KEY;

    __asm__ volatile ("ecall" : "=r"(a0) : "r"(a7) : "memory");
    return a0;
}

#endif //KEYBOARD_H
