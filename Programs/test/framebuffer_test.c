//
// Created by Mark Verbeek on 14.10.25.
//

#include "framebuffer_test.h"
#include <stdint.h>
#include "util.h"
#include <stdio.h>

#define VRAM_BASE 0x10000000

volatile uint32_t *framebuffer = (volatile uint32_t *)VRAM_BASE;

int display_width;
int display_height;

void set_pixel(const int x, const int y, const uint32_t color) {
    uint32_t width = display_width;
    framebuffer[y * width + x] = color;
}

void clear_screen(const uint32_t color) {
    uint32_t width = display_width;
    uint32_t height = display_height;
    uint32_t total = width * height;

    for (uint32_t i = 0; i < total; i++) {
        framebuffer[i] = color;
    }
}

// Simple sine approximation (if you don't have math.h)
float fast_sin(float x) {
    // Normalize to -PI to PI
    while (x > 3.14159f) x -= 6.28318f;
    while (x < -3.14159f) x += 6.28318f;

    // Taylor series approximation
    float x2 = x * x;
    return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
}

float fast_cos(float x) {
    return fast_sin(x + 1.5708f);  // cos(x) = sin(x + PI/2)
}

// Simple abs for floats
float absf(float x) {
    return x < 0 ? -x : x;
}

// Fast inverse square root (Quake III algorithm)
float inv_sqrt(float x) {
    float xhalf = 0.5f * x;
    int i = *(int*)&x;
    i = 0x5f3759df - (i >> 1);
    x = *(float*)&i;
    x = x * (1.5f - xhalf * x * x);
    return x;
}

// Simple sqrt approximation
float sqrt_approx(float x) {
    if (x <= 0.0f) return 0.0f;
    return x * inv_sqrt(x);
}


// Simple fmod replacement
float fmod_simple(float x, float y) {
    return x - (int)(x / y) * y;
}

// Simple atan2 approximation
float atan2_approx(float y, float x) {
    float abs_y = absf(y) + 1e-10f;  // Prevent division by zero
    float angle;

    if (x >= 0) {
        float r = (x - abs_y) / (x + abs_y);
        angle = 0.785398f - 0.785398f * r;  // PI/4
    } else {
        float r = (x + abs_y) / (abs_y - x);
        angle = 2.356194f - 0.785398f * r;  // 3*PI/4
    }

    return y < 0 ? -angle : angle;
}

// Create HSV to RGB color (for rainbow effects)
uint32_t hsv_to_rgb(float h, float s, float v) {
    float c = v * s;
    float h_prime = h / 60.0f;
    float x_val = fmod_simple(h_prime, 2.0f);
    float x = c * (1.0f - absf(x_val - 1.0f));
    float m = v - c;

    float r, g, b;

    if (h < 60) { r = c; g = x; b = 0; }
    else if (h < 120) { r = x; g = c; b = 0; }
    else if (h < 180) { r = 0; g = c; b = x; }
    else if (h < 240) { r = 0; g = x; b = c; }
    else if (h < 300) { r = x; g = 0; b = c; }
    else { r = c; g = 0; b = x; }

    uint8_t ri = (uint8_t)((r + m) * 255);
    uint8_t gi = (uint8_t)((g + m) * 255);
    uint8_t bi = (uint8_t)((b + m) * 255);

    return (ri << 16) | (gi << 8) | bi;
}

// Initialize display (query capabilities and enable)
void init_display(void) {
    printf("Initializing display...\n");

    uint32_t status = get_display_status();
    if (!(status & 0x2)) {
        printf("Warning: Display not ready.\n");
        return;
    }

    display_width = (int)get_display_width();
    display_height = (int)get_display_height();

    // Query display capabilities
    uint32_t width = display_width;
    uint32_t height = display_height;

    printf("Display resolution: %lux%lu\n", width, height);

    set_display_enable(0x1);
    status = get_display_status();
    if (status & 0x1) {
        printf("Display enabled successfully\n");
    }
    else {
        printf("Warning: Display not ready\n");
    }
}

// Test pattern with fixed logic (fast, for testing framebuffer)
void run_frame_buffer_test(void) {
    clear_screen(0x000000);

    printf("Running framebuffer test...\n");

    uint32_t width = display_width;
    uint32_t height = display_height;

    uint32_t section_height = height / 4;

    // Test 1: Horizontal gradient (Red)
    printf("Test 1: Red gradient\n");
    for (uint32_t y = 0; y < section_height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            uint8_t intensity = (x * 255) / width;
            set_pixel(x, y, intensity << 16);
        }
    }

    // Test 2: Vertical gradient (Green)
    printf("Test 2: Green gradient\n");
    for (uint32_t y = section_height; y < section_height * 2; y++) {
        for (uint32_t x = 0; x < width; x++) {
            uint8_t intensity = ((y - section_height) * 255) / section_height;
            set_pixel(x, y, intensity << 8);
        }
    }

    // Test 3: Diagonal gradient (Blue)
    printf("Test 3: Blue gradient\n");
    for (uint32_t y = section_height * 2; y < section_height * 3; y++) {
        for (uint32_t x = 0; x < width; x++) {
            uint8_t intensity = ((x + y) * 255) / (width + section_height * 3);
            set_pixel(x, y, intensity);
        }
    }

    // Test 4: Checkerboard pattern
    printf("Test 4: Checkerboard\n");
    uint32_t checker_size = width / 16;  // Scale with resolution
    for (uint32_t y = section_height * 3; y < height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            int checker = ((x / checker_size) + (y / checker_size)) & 1;
            uint32_t color = checker ? 0xFFFFFF : 0x000000;
            set_pixel(x, y, color);
        }
    }

    printf("Framebuffer test complete!\n");
}

// Cool pattern with integer math (optimized)
void draw_cool_pattern(void) {
    clear_screen(0x000000);

    printf("Rendering cool pattern...\n");

    uint32_t width = display_width;
    uint32_t height = display_height;

    int cx = width / 2;
    int cy = height / 2;

    uint32_t total_pixels = width * height;
    uint32_t pixels_done = 0;
    int last_percent = -1;

    for (uint32_t y = 0; y < height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            int dx = x - cx;
            int dy = y - cy;

            // Simple distance approximation (no sqrt!)
            int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);

            // Simple patterns using integer math
            int pattern1 = (x + y) & 0xFF;
            int pattern2 = (x * y) >> 4;
            int pattern3 = dist & 0xFF;

            // Combine patterns
            int combined = (pattern1 + pattern2 + pattern3) / 3;

            // Create gradient effect
            int r = (combined + x) & 0xFF;
            int g = (combined + y) & 0xFF;
            int b = (combined + dist) & 0xFF;

            uint32_t color = (r << 16) | (g << 8) | b;
            set_pixel(x, y, color);

            pixels_done++;

            // Update every 10%
            int percent = (pixels_done * 10) / total_pixels;
            if (percent != last_percent) {
                printf("Progress: %d0%%\n", percent);
                last_percent = percent;
            }
        }
    }

    printf("Rendering complete!\n");
}