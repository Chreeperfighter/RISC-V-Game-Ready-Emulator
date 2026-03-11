#ifndef RV32_DISPLAY_H
#define RV32_DISPLAY_H

#include "rv32_syscalls.h"

struct DisplayInfo {
    uint32_t width;   // pixels
    uint32_t height;  // pixels
    uint32_t format;  // see format table below
    uint32_t bpp;     // bits per pixel (e.g. 32 for ARGB8888, 16 for RGB565)
};

enum DisplayFormat {
    FORMAT_ARGB8888 = 0,
    FORMAT_RGB565 = 1,
    FORMAT_RGB888 = 2,
    FORMAT_RGBA8888 = 3,
};

struct DisplayInfo get_display_info(bool *ok);
void show_framebuffer(void *framebuffer);

#endif //RV32_DISPLAY_H