//
// Created by Mark Verbeek on 11.03.26.
//

#include "rv32_display.h"

struct DisplayInfo get_display_info(bool *ok) {
    struct DisplayInfo display_info;
    int32_t err = sys_display_info(&display_info);
    if (err == -1) {
        *ok = false;
    }
    else {
        *ok = true;
    }
    return display_info;
}

void show_framebuffer(void* framebuffer) {
    sys_show_framebuffer(framebuffer);
}