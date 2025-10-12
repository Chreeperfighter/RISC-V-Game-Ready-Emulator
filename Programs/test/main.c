#include <stdint.h>

#define WIDTH 80
#define HEIGHT 60
#define FRAMEBUFFER_SIZE (WIDTH * HEIGHT)
#define FRAMEBUFFER_ADDR 0x81000000

volatile uint32_t* framebuffer = (volatile uint32_t*)FRAMEBUFFER_ADDR;

void display_framebuffer(const uint32_t* fb, uint32_t width, uint32_t height) {
    register uint32_t a0 asm("a0") = (uint32_t)fb;
    register uint32_t a1 asm("a1") = width;
    register uint32_t a2 asm("a2") = height;
    register uint32_t a7 asm("a7") = 3; // PRINT_FB
    asm volatile("ecall"
                 : /* no outputs */
                 : "r"(a0), "r"(a1), "r"(a2), "r"(a7)
                 : "memory");
}

int main(void) {
    int ball_x = 10, ball_y = 5;
    int vel_x = 1, vel_y = 1;
    uint32_t ball_color = 0xFF00FFFF; // RGBA: magenta

    while (1) {
        for (int i = 0; i < FRAMEBUFFER_SIZE; i++) {
            ((volatile uint32_t*)FRAMEBUFFER_ADDR)[i] = 0; // clear screen
        }

        // Draw ball (single pixel for simplicity)
        ((volatile uint32_t*)FRAMEBUFFER_ADDR)[ball_x + ball_y * WIDTH] = ball_color;

        // Update ball position
        ball_x += vel_x;
        ball_y += vel_y;

        // Bounce off walls
        if (ball_x <= 0 || ball_x >= WIDTH - 1) vel_x = -vel_x;
        if (ball_y <= 0 || ball_y >= HEIGHT - 1) vel_y = -vel_y;

        display_framebuffer((const uint32_t*)FRAMEBUFFER_ADDR, WIDTH, HEIGHT);
    }

    return 0;
}