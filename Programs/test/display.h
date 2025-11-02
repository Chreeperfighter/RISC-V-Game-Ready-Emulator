//
// Created by Mark Verbeek on 20.10.25.
//

//
// Created by Mark Verbeek on 20.10.25.
//
//
// display.h - MMIO Display Controller Interface
//

#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>

#define SHOW_BUFFER 101
#define GET_FRAMEBUFFER_INFO 200

typedef struct {
    uint32_t width;
    uint32_t height;
    uint32_t bpp;  // byte per pixel
} fb_info_t;

static inline void show_buffer(uint8_t *buffer) {
    register int a0 asm("a0") = (uintptr_t)buffer;
    register int a7 asm("a7") = SHOW_BUFFER;
    asm volatile ("ecall" :: "r"(a0), "r"(a7) : "memory");
}

static inline int get_framebuffer_info(fb_info_t *info) {
    register long a0 __asm__("a0") = (long)info;
    register long a7 __asm__("a7") = GET_FRAMEBUFFER_INFO;

    __asm__ volatile ("ecall" : "+r"(a0) : "r"(a7) : "memory");
    return a0;  // Returns 0 on success, -1 on error
}

#endif // DISPLAY_H
