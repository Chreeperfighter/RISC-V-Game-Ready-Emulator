//
// Created by Mark Verbeek on 11.03.26.
//

#include "rv32_display.h"

struct DisplayInfo get_display_info(bool *ok) {
    struct DisplayInfo display_info;
    int32_t err = sys_display_info(&display_info);
    if (ok) *ok = (err != -1);
    return display_info;
}

void show_framebuffer(void* framebuffer) {
    sys_show_framebuffer(framebuffer);
}