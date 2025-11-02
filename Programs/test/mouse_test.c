#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdbool.h>

#include "display.h"
#include "mouse.h"
#include "timer.h"

int main1(void) {
    // Get framebuffer info
    fb_info_t fb_info;
    if (get_framebuffer_info(&fb_info) == -1) {
        return 1;
    }

    // Allocate framebuffer
    size_t fb_size = (size_t)fb_info.width * fb_info.height * fb_info.bpp;
    uint8_t* framebuffer = malloc(fb_size);
    if (framebuffer == NULL) {
        return 1;
    }
    memset(framebuffer, 0, fb_size);
    printf("Allocated framebuffer: %dx%d@%dbpp\n", fb_info.width, fb_info.height, fb_info.bpp);

    int32_t mouse_x, mouse_y;
    int32_t old_mouse_x = -1, old_mouse_y = -1;
    uint64_t last_frame_time = 0;

    while (1) {
        get_mouse_pos(&mouse_x, &mouse_y);
        
        // Only update if mouse moved or it's time for a frame
        uint64_t current_time = get_us();
        bool mouse_moved = (mouse_x != old_mouse_x || mouse_y != old_mouse_y);
        bool should_update = (current_time - last_frame_time >= 16666); // ~60 FPS

        if (mouse_moved) {

            // Draw new cursor position
            if (mouse_x >= 0 && mouse_x < fb_info.width &&
                mouse_y >= 0 && mouse_y < fb_info.height) {
                const uint32_t index = (mouse_x + mouse_y * fb_info.width) * fb_info.bpp;
                framebuffer[index] = 255;
                framebuffer[index + 1] = 255;
                framebuffer[index + 2] = 255;
                framebuffer[index + 3] = 255;
            }

            old_mouse_x = mouse_x;
            old_mouse_y = mouse_y;

            if (should_update) {
                show_buffer(framebuffer);
                last_frame_time = current_time;
            }
        }
    }

    free(framebuffer);
    return 0;
}