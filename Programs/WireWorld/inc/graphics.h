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
                   uint32_t color) {
    // Bounds check - clamp coordinates to screen
    if (x1 >= fb_info->width || y1 >= fb_info->height) return;
    if (x2 >= fb_info->width) x2 = fb_info->width - 1;
    if (y2 >= fb_info->height) y2 = fb_info->height - 1;

    // Ensure x1 < x2 and y1 < y2
    if (x1 > x2 || y1 > y2) return;

    uint32_t width = x2 - x1 + 1;

    // Fill first scanline
    uint32_t* start = &fb[y1 * fb_info->width + x1];
    for (uint32_t i = 0; i < width; i++) {
        start[i] = color;
    }

    // Copy first scanline to remaining scanlines
    for (uint32_t y = y1 + 1; y <= y2; y++) {
        memcpy(&fb[y * fb_info->width + x1], start, width * sizeof(uint32_t));
    }
}

void draw_line(uint32_t* fb, struct FB_INFO* fb_info, uint32_t x1, uint32_t y1, uint32_t x2, uint32_t y2, uint32_t color) {
    // Bounds check - clamp coordinates to screen
    if (x1 >= fb_info->width || y1 >= fb_info->height) return;
    if (x2 >= fb_info->width) x2 = fb_info->width - 1;
    if (y2 >= fb_info->height) y2 = fb_info->height - 1;

    int dx = abs((int)x2 - (int)x1);
    int dy = abs((int)y2 - (int)y1);

    int sx = x1 < x2 ? 1 : -1;  // Step direction for x
    int sy = y1 < y2 ? 1 : -1;  // Step direction for y

    int err = dx - dy;  // Error accumulator
    int e2;

    int x = x1;
    int y = y1;

    while (1) {
        // Plot current pixel
        fb[y * fb_info->width + x] = color;

        // Check if we've reached endpoint
        if (x == x2 && y == y2) break;

        e2 = err * 2;  // Avoid division by using 2*err

        // Step in x direction
        if (e2 > -dy) {
            err -= dy;
            x += sx;
        }

        // Step in y direction
        if (e2 < dx) {
            err += dx;
            y += sy;
        }
    }
}

#endif //GRAPHICS_H
