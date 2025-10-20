//
// Created by Mark Verbeek on 20.10.25.
//

//
// Created by Mark Verbeek on 20.10.25.
//
//
// display.h - MMIO Display Controller Interface
//

#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>

#define VRAM_BASE 0x11000000

// MMIO register addresses (relative to display base address)
// You'll need to add your actual MMIO base address
#define DISPLAY_MMIO_BASE  0x10000000  // Replace with your actual MMIO_ORIGIN

#define DISPLAY_CONTROL    (DISPLAY_MMIO_BASE + 0x0)
#define DISPLAY_WIDTH      (DISPLAY_MMIO_BASE + 0x4)
#define DISPLAY_HEIGHT     (DISPLAY_MMIO_BASE + 0x8)

// Control register bit flags
#define DISPLAY_ENABLE       0x1
#define DISPLAY_NEW_FRAME    0x2
#define DISPLAY_READY        0x4  // Read-only
#define DISPLAY_AUTO_REFRESH 0x8

// Volatile pointers to MMIO registers
#define DISPLAY_CTRL_REG   (*(volatile uint32_t*)DISPLAY_CONTROL)
#define DISPLAY_WIDTH_REG  (*(volatile uint32_t*)DISPLAY_WIDTH)
#define DISPLAY_HEIGHT_REG (*(volatile uint32_t*)DISPLAY_HEIGHT)

// Helper macros for 8-bit access if needed
#define DISPLAY_CTRL_REG8  (*(volatile uint8_t*)DISPLAY_CONTROL)

// Initialize display with given dimensions
static inline void display_init(uint32_t width, uint32_t height) {
    DISPLAY_WIDTH_REG = width;
    DISPLAY_HEIGHT_REG = height;
    DISPLAY_CTRL_REG = DISPLAY_ENABLE;
}

// Enable display
static inline void display_enable(void) {
    DISPLAY_CTRL_REG |= DISPLAY_ENABLE;
}

// Disable display
static inline void display_disable(void) {
    DISPLAY_CTRL_REG &= ~DISPLAY_ENABLE;
}

// Enable auto-refresh mode
static inline void display_auto_refresh_on(void) {
    DISPLAY_CTRL_REG |= DISPLAY_AUTO_REFRESH;
}

// Disable auto-refresh mode
static inline void display_auto_refresh_off(void) {
    DISPLAY_CTRL_REG &= ~DISPLAY_AUTO_REFRESH;
}

// Trigger a frame update (manual refresh mode)
static inline void display_trigger_frame(void) {
    DISPLAY_CTRL_REG |= DISPLAY_NEW_FRAME;
}

// Check if display is ready
static inline int display_is_ready(void) {
    return (DISPLAY_CTRL_REG & DISPLAY_READY) != 0;
}

// Wait for display to be ready
static inline void display_wait_ready(void) {
    while (!(DISPLAY_CTRL_REG & DISPLAY_READY)) {
        // Busy wait
    }
}

// Get current control register value
static inline uint32_t display_get_control(void) {
    return DISPLAY_CTRL_REG;
}

// Get display dimensions
static inline uint32_t display_get_width(void) {
    return DISPLAY_WIDTH_REG;
}

static inline uint32_t display_get_height(void) {
    return DISPLAY_HEIGHT_REG;
}

// Set display dimensions
static inline void display_set_size(uint32_t width, uint32_t height) {
    DISPLAY_WIDTH_REG = width;
    DISPLAY_HEIGHT_REG = height;
}

#endif // DISPLAY_H
