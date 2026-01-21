//
// Created by Mark Verbeek on 21.01.26.
//

#ifndef GRAPHICS_H
#define GRAPHICS_H

#include <stdbool.h>

struct FB_INFO {
    uint32_t width;
    uint32_t height;
    uint32_t bpp;
};

void clear_framebuffer(uint32_t* fb, struct FB_INFO* fb_info) {
    memset(fb, 0, fb_info->width * fb_info->height * sizeof(uint32_t));
}

void draw_rectangle(uint32_t* fb, struct FB_INFO* fb_info,
                   uint32_t x1, uint32_t y1, uint32_t x2, uint32_t y2,
                   uint32_t color, bool filled) {
    // Bounds check - clamp coordinates to screen
    if (x1 >= fb_info->width || y1 >= fb_info->height) return;
    if (x2 >= fb_info->width) x2 = fb_info->width - 1;
    if (y2 >= fb_info->height) y2 = fb_info->height - 1;

    // Ensure x1 < x2 and y1 < y2
    if (x1 > x2 || y1 > y2) return;

    // Your existing drawing code here...
    for (uint32_t y = y1; y <= y2; y++) {
        for (uint32_t x = x1; x <= x2; x++) {
            fb[y * fb_info->width + x] = color;
        }
    }
}


#endif //GRAPHICS_H
