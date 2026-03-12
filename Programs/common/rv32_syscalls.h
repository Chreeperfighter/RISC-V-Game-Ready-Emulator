#ifndef RV32_SYSCALLS_H
#define RV32_SYSCALLS_H

#include <stdbool.h>
#include <stdint.h>

#define SYS_DISPLAY_INFO         0x100
#define SYS_SHOW_FRAMEBUFFER     0x101
#define SYS_GET_US               0x102
#define SYS_SLEEP_US             0x103
#define SYS_KEY_AVAILABLE        0x104
#define SYS_GET_KEY              0x105
#define SYS_IS_KEY_DOWN          0x106
#define SYS_GET_MOUSE_POS        0x107
#define SYS_IS_MOUSE_BUTTON_DOWN 0x108

static int32_t semihost(uint32_t nr, uint32_t param) {
    register int32_t  a0 asm("a0");
    register uint32_t a1 asm("a1") = param;
    asm volatile(
        "mv   a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "r"(nr)
        : "memory"
    );
    return a0;
}

static int32_t sys_display_info(void* buf) {
    return semihost(SYS_DISPLAY_INFO, (uint32_t)buf);
}

static void sys_show_framebuffer(void* buf) {
    semihost(SYS_SHOW_FRAMEBUFFER, (uint32_t)buf);
}

static int32_t sys_get_us(void* buf) {
    return semihost(SYS_GET_US, (uint32_t)buf);
}

static int32_t sys_sleep_us(void* buf) {
    return semihost(SYS_SLEEP_US, (uint32_t)buf);
}

static int32_t sys_key_available() {
    return semihost(SYS_KEY_AVAILABLE, 0);
}

static int32_t sys_get_key() {
    return semihost(SYS_GET_KEY, 0);
}

static int32_t sys_is_key_down(uint32_t key) {
    return semihost(SYS_IS_KEY_DOWN, key);
}

static void sys_get_mouse_pos(void* buf) {
    semihost(SYS_GET_MOUSE_POS, (uint32_t)buf);
}

static int32_t sys_is_mouse_button_down(void* buf) {
    return semihost(SYS_IS_MOUSE_BUTTON_DOWN, (uint32_t)buf);
}

#endif // RV32_SYSCALLS_H