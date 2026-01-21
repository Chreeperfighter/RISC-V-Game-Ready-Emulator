#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "syscalls.h"
#include "graphics.h"

struct MOUSE_POS {
    uint32_t x;
    uint32_t y;
};

int main(void) {
    struct FB_INFO fb_info;
    sys_get_framebuffer_info((int)&fb_info);
    printf("Framebuffer info: Width: %d, Height: %d, BPP: %d\n", fb_info.width, fb_info.height, fb_info.bpp);
    if (fb_info.bpp != 4) {
        printf("Framebuffer info: BPP must be 4\n");
        return 1;
    }
    uint32_t* framebuffer = calloc(fb_info.width * fb_info.height, sizeof(uint32_t));
    struct MOUSE_POS mouse_pos;
    while (1) {
        sys_get_mouse_pos((int)&mouse_pos);
        draw_rectangle(framebuffer, &fb_info, mouse_pos.x - 20, mouse_pos.y - 20, mouse_pos.x + 20, mouse_pos.y + 20, 0xFFFFFFFF, false);
        sys_show_framebuffer((int)framebuffer);
        draw_rectangle(framebuffer, &fb_info, mouse_pos.x - 20, mouse_pos.y - 20, mouse_pos.x + 20, mouse_pos.y + 20, 0x0, false);
    }
    free(framebuffer);
    return 0;
}