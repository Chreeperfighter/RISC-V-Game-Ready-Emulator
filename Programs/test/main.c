#include "display.h"
#include "keyboard.h"
#include "timer.h"
#include <stdint.h>
#include <stdlib.h>

#define TARGET_FPS 60
#define FRAME_TIME_US (1000000 / TARGET_FPS)  // 16666 microseconds per frame

// Colors (assuming 32-bit RGBA or similar)
#define COLOR_BLACK   0x00000000
#define COLOR_WHITE   0xFFFFFFFF
#define COLOR_PADDLE  0xFF00FF00  // Green
#define COLOR_BALL    0xFFFF0000  // Red
#define COLOR_DEBUG   0xFFFFFF00  // Yellow

// Game constants
#define PADDLE_WIDTH  8
#define PADDLE_HEIGHT 80
#define BALL_SIZE     6
#define PADDLE_SPEED  20
#define BALL_SPEED_X  3
#define BALL_SPEED_Y  2

typedef struct {
    int x, y;
    int vx, vy;
} Ball;

typedef struct {
    int y;
} Paddle;

// Ultra-fast memset for clearing (word-aligned)
static inline void fast_clear(uint32_t *fb, uint32_t count) {
    uint32_t *end = fb + count;
    while (fb < end) {
        *fb++ = COLOR_BLACK;
    }
}

// Optimized rectangle fill with bounds checking once
static inline void fill_rect(uint32_t *fb, int width, int height,
                             int x, int y, int w, int h, uint32_t color) {
    // Clip rectangle to screen bounds
    if (x < 0) { w += x; x = 0; }
    if (y < 0) { h += y; y = 0; }
    if (x + w > width) w = width - x;
    if (y + h > height) h = height - y;
    if (w <= 0 || h <= 0) return;

    // Draw optimized scanlines
    uint32_t *row = fb + y * width + x;
    for (int j = 0; j < h; j++) {
        uint32_t *pixel = row;
        for (int i = 0; i < w; i++) {
            *pixel++ = color;
        }
        row += width;
    }
}

// Simple number drawing (using rectangles for digits)
static void draw_digit(uint32_t *fb, int width, int height, int x, int y, int digit) {
    // 3x5 pixel font representation
    const uint8_t font[10][5] = {
        {0x7, 0x5, 0x5, 0x5, 0x7}, // 0
        {0x2, 0x6, 0x2, 0x2, 0x7}, // 1
        {0x7, 0x1, 0x7, 0x4, 0x7}, // 2
        {0x7, 0x1, 0x7, 0x1, 0x7}, // 3
        {0x5, 0x5, 0x7, 0x1, 0x1}, // 4
        {0x7, 0x4, 0x7, 0x1, 0x7}, // 5
        {0x7, 0x4, 0x7, 0x5, 0x7}, // 6
        {0x7, 0x1, 0x1, 0x1, 0x1}, // 7
        {0x7, 0x5, 0x7, 0x5, 0x7}, // 8
        {0x7, 0x5, 0x7, 0x1, 0x7}, // 9
    };

    if (digit < 0 || digit > 9) return;

    for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 3; col++) {
            if (font[digit][row] & (1 << (2 - col))) {
                fill_rect(fb, width, height, x + col * 3, y + row * 3, 2, 2, COLOR_WHITE);
            }
        }
    }
}

static void draw_number(uint32_t *fb, int width, int height, int x, int y, int num) {
    if (num == 0) {
        draw_digit(fb, width, height, x, y, 0);
        return;
    }

    int digits[10];
    int count = 0;
    while (num > 0) {
        digits[count++] = num % 10;
        num /= 10;
    }

    // Draw in reverse order
    for (int i = count - 1; i >= 0; i--) {
        draw_digit(fb, width, height, x, y, digits[i]);
        x += 12;
    }
}

int main(void) {
    fb_info_t fb_info;
    if (get_framebuffer_info(&fb_info) != 0) {
        return -1;
    }

    int width = fb_info.width;
    int height = fb_info.height;
    int total_pixels = width * height;

    // Allocate framebuffer
    uint32_t *framebuffer = (uint32_t*)malloc(total_pixels * sizeof(uint32_t));
    if (!framebuffer) return -1;

    // Debug: Draw initial screen
    fast_clear(framebuffer, total_pixels);
    draw_number(framebuffer, width, height, 10, 10, width);
    draw_number(framebuffer, width, height, 10, 30, height);
    show_buffer((uint32_t)framebuffer);

    // Wait for keypress to start
    while (!key_available()) {
        sleep_us(FRAME_TIME_US);
    }
    get_key();

    // Game state
    Paddle left_paddle = {height / 2 - PADDLE_HEIGHT / 2};
    Paddle right_paddle = {height / 2 - PADDLE_HEIGHT / 2};
    Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};

    int left_score = 0;
    int right_score = 0;
    int frame_count = 0;

    // FPS tracking
    uint32_t last_fps_time = get_us();
    uint32_t fps_counter = 0;
    uint32_t current_fps = 60;

    while (1) {
        uint32_t frame_start = get_us();
        frame_count++;
        fps_counter++;

        // Process all available keys this frame
        while (key_available()) {
            unsigned char key = get_key();

            // Left paddle: W/S
            if (key == 'w' || key == 'W') {
                left_paddle.y -= PADDLE_SPEED;
                if (left_paddle.y < 0) left_paddle.y = 0;
            }
            else if (key == 's' || key == 'S') {
                left_paddle.y += PADDLE_SPEED;
                if (left_paddle.y + PADDLE_HEIGHT > height)
                    left_paddle.y = height - PADDLE_HEIGHT;
            }

            // Right paddle: I/K
            else if (key == 'i' || key == 'I') {
                right_paddle.y -= PADDLE_SPEED;
                if (right_paddle.y < 0) right_paddle.y = 0;
            }
            else if (key == 'k' || key == 'K') {
                right_paddle.y += PADDLE_SPEED;
                if (right_paddle.y + PADDLE_HEIGHT > height)
                    right_paddle.y = height - PADDLE_HEIGHT;
            }

            // ESC to quit
            else if (key == 27) {
                free(framebuffer);
                return 0;
            }
        }

        // Update ball position
        ball.x += ball.vx;
        ball.y += ball.vy;

        // Ball collision with top/bottom
        if (ball.y <= 0) {
            ball.y = 0;
            ball.vy = BALL_SPEED_Y;
        }
        if (ball.y >= height - BALL_SIZE) {
            ball.y = height - BALL_SIZE;
            ball.vy = -BALL_SPEED_Y;
        }

        // Ball collision with left paddle
        if (ball.vx < 0 && ball.x <= PADDLE_WIDTH) {
            if (ball.y + BALL_SIZE >= left_paddle.y &&
                ball.y <= left_paddle.y + PADDLE_HEIGHT) {
                ball.vx = BALL_SPEED_X;
                ball.x = PADDLE_WIDTH;
                // Add spin based on where it hit
                int hit_pos = (ball.y + BALL_SIZE/2) - (left_paddle.y + PADDLE_HEIGHT/2);
                ball.vy = hit_pos / 8;
            }
        }

        // Ball collision with right paddle
        if (ball.vx > 0 && ball.x >= width - PADDLE_WIDTH - BALL_SIZE) {
            if (ball.y + BALL_SIZE >= right_paddle.y &&
                ball.y <= right_paddle.y + PADDLE_HEIGHT) {
                ball.vx = -BALL_SPEED_X;
                ball.x = width - PADDLE_WIDTH - BALL_SIZE;
                // Add spin based on where it hit
                int hit_pos = (ball.y + BALL_SIZE/2) - (right_paddle.y + PADDLE_HEIGHT/2);
                ball.vy = hit_pos / 8;
            }
        }

        // Clamp ball Y velocity
        if (ball.vy > 4) ball.vy = 4;
        if (ball.vy < -4) ball.vy = -4;

        // Score and reset
        if (ball.x < -BALL_SIZE) {
            right_score++;
            ball.x = width / 2;
            ball.y = height / 2;
            ball.vx = BALL_SPEED_X;
            ball.vy = BALL_SPEED_Y;
        }
        if (ball.x > width) {
            left_score++;
            ball.x = width / 2;
            ball.y = height / 2;
            ball.vx = -BALL_SPEED_X;
            ball.vy = BALL_SPEED_Y;
        }

        // Render - single clear operation
        fast_clear(framebuffer, total_pixels);

        // Draw paddles
        fill_rect(framebuffer, width, height, 0, left_paddle.y,
                  PADDLE_WIDTH, PADDLE_HEIGHT, COLOR_PADDLE);
        fill_rect(framebuffer, width, height, width - PADDLE_WIDTH, right_paddle.y,
                  PADDLE_WIDTH, PADDLE_HEIGHT, COLOR_PADDLE);

        // Draw ball
        fill_rect(framebuffer, width, height, ball.x, ball.y,
                  BALL_SIZE, BALL_SIZE, COLOR_BALL);

        // Draw center line (dashed) - only every 4th frame for efficiency
        for (int y = 0; y < height; y += 20) {
            fill_rect(framebuffer, width, height, width / 2 - 1, y, 2, 10, COLOR_WHITE);
        }

        // Draw scores using digit rendering
        draw_number(framebuffer, width, height, width / 4, 20, left_score);
        draw_number(framebuffer, width, height, 3 * width / 4, 20, right_score);

        // Debug info (top right) - FPS and frame count
        draw_number(framebuffer, width, height, width - 100, 10, current_fps);

        // Show buffer (single syscall per frame)
        show_buffer((uint32_t)framebuffer);

        // Calculate FPS every second
        uint32_t current_time = get_us();
        if (current_time - last_fps_time >= 1000000) {  // 1 second
            current_fps = fps_counter;
            fps_counter = 0;
            last_fps_time = current_time;
        }

        // Frame limiting - sleep to maintain 60 FPS
        uint32_t frame_end = get_us();
        uint32_t frame_duration = frame_end - frame_start;

        if (frame_duration < FRAME_TIME_US) {
            sleep_us(FRAME_TIME_US - frame_duration);
        }
    }

    free(framebuffer);
    return 0;
}