#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // for usleep
#include "display.h"

// Bigger paddles and ball
#define PADDLE_HEIGHT 80
#define PADDLE_WIDTH 10
#define BALL_SIZE 10
#define SPEED 20

volatile uint32_t *framebuffer = (volatile uint32_t *)VRAM_BASE;

// Draw a filled rectangle
void draw_rect(int x, int y, int w, int h, uint32_t color, uint32_t width, uint32_t height) {
    for (int j = 0; j < h; j++) {
        int yy = y + j;
        if (yy < 0 || yy >= (int)height) continue;
        for (int i = 0; i < w; i++) {
            int xx = x + i;
            if (xx < 0 || xx >= (int)width) continue;
            framebuffer[yy * width + xx] = color;
        }
    }
}

// Clear the screen
void clear_screen(uint32_t color, uint32_t width, uint32_t height) {
    for (uint32_t i = 0; i < width * height; i++) {
        framebuffer[i] = color;
    }
}

int main(void) {
    uint32_t width = display_get_width();
    uint32_t height = display_get_height();
    display_enable();
    display_auto_refresh_on();
    uint32_t ready = display_is_ready();
    printf("Display width = %lu, height = %lu, ready = %lu\n", width, height, ready);

    // Paddle positions
    int paddle1_y = height / 2 - PADDLE_HEIGHT / 2;
    int paddle2_y = height / 2 - PADDLE_HEIGHT / 2;
    int paddle1_x = 10;
    int paddle2_x = width - 10 - PADDLE_WIDTH;

    // Ball position and velocity
    float ball_x = width / 2;
    float ball_y = height / 2;
    float ball_dx = SPEED;
    float ball_dy = SPEED;

    while (1) {
        clear_screen(0x000000, width, height); // black background

        // Move paddles toward the ball
        if (ball_dx < 0) {
            if (paddle1_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle1_y += SPEED;
            if (paddle1_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle1_y -= SPEED;
        }
        else {
            if (paddle2_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle2_y += SPEED;
            if (paddle2_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle2_y -= SPEED;
        }

        // Keep paddles on screen
        if (paddle1_y < 0) paddle1_y = 0;
        if (paddle1_y > (int)height - PADDLE_HEIGHT) paddle1_y = height - PADDLE_HEIGHT;
        if (paddle2_y < 0) paddle2_y = 0;
        if (paddle2_y > (int)height - PADDLE_HEIGHT) paddle2_y = height - PADDLE_HEIGHT;

        // Move ball
        ball_x += ball_dx;
        ball_y += ball_dy;

        // Collision with top/bottom
        if (ball_y < 0) { ball_y = 0; ball_dy = -ball_dy; }
        if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }

        // Collision with paddles
        if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
            ball_x = paddle1_x + PADDLE_WIDTH;
            ball_dx = -ball_dx;
        }
        if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
            ball_x = paddle2_x - BALL_SIZE;
            ball_dx = -ball_dx;
        }

        // Draw paddles
        draw_rect(paddle1_x, paddle1_y, PADDLE_WIDTH, PADDLE_HEIGHT, 0xFFFFFF, width, height);
        draw_rect(paddle2_x, paddle2_y, PADDLE_WIDTH, PADDLE_HEIGHT, 0xFFFFFF, width, height);

        // Draw ball
        draw_rect((int)ball_x, (int)ball_y, BALL_SIZE, BALL_SIZE, 0xFFFFFF, width, height);

        //if (display_is_ready()) {
        //    display_trigger_frame();
        //}
    }

    return 0;
}
