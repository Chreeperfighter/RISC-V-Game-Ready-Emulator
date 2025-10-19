//
// Created by Mark Verbeek on 14.10.25.
//

#ifndef FRAMEBUFFER_TEST_H
#define FRAMEBUFFER_TEST_H

#include <stdint.h>

void set_pixel(int x, int y, uint32_t color);
void clear_screen(uint32_t color);
void run_frame_buffer_test(void);
void draw_cool_pattern(void);
void init_display(void);
void run_bouncing_ball_demo_size(int ball_radius);

#endif //FRAMEBUFFER_TEST_H
