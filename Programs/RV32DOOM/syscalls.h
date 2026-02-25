//
// Created by Mark Verbeek on 11.12.25.
//

#ifndef SYSCALLS_H
#define SYSCALLS_H

#include <stdbool.h>
#include <stdint.h>

#define SYS_GET_FRAMEBUFFER_INFO 0x100
#define SYS_SHOW_FRAMEBUFFER  0x101
#define SYS_GET_MOUSE_POS 0x107
#define SYS_IS_MOUSE_BUTTON_DOWN 0x108
#define SYS_GET_US 0x102
#define SYS_SLEEP_US 0x103
#define SYS_KEY_AVAILABLE 0x104
#define SYS_GET_KEY 0x105
#define SYS_IS_KEY_DOWN 0x106

static inline int sys_get_framebuffer_info(void *address) {
    register uint32_t a0 asm("a0");
    register void* a1 asm("a1") = address;

    asm volatile(
        "li a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "i"(SYS_GET_FRAMEBUFFER_INFO)
        : "memory"
    );

    return a0;
}

static inline void sys_get_mouse_pos(void *address) {
    register void* a1 asm("a1") = address;

    asm volatile(
        "li a0, %1\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        :
        : "r"(a1), "i"(SYS_GET_MOUSE_POS)
        : "a0", "memory"
    );
}

static inline uint32_t sys_is_mouse_button_down(void *address) {
    register uint32_t a0 asm("a0");
    register void* a1 asm("a1") = address;

    asm volatile(
        "li a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "i"(SYS_IS_MOUSE_BUTTON_DOWN)
        : "memory"
    );

    return a0;
}

static inline uint32_t sys_get_us(void *address) {
    register uint32_t a0 asm("a0");
    register void* a1 asm("a1") = address;

    asm volatile(
        "li a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "i"(SYS_GET_US)
        : "memory"
    );

    return a0;
}

static inline uint32_t sys_sleep_us(uint32_t us) {
    register uint32_t a0 asm("a0");
    register uint32_t* a1 asm("a1") = &us;

    asm volatile(
        "li a0, %2\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "r"(a1), "i"(SYS_SLEEP_US)
        : "memory"
    );

    return a0;
}

static inline bool key_available(void) {
    register uint32_t a0 asm("a0");

    asm volatile(
        "li a0, %1\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "i"(SYS_KEY_AVAILABLE)
        : "memory"
    );

    return (bool)a0;
}

static inline uint32_t get_key(void) {
    register uint32_t a0 asm("a0");

    asm volatile(
        "li a0, %1\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        : "=r"(a0)
        : "i"(SYS_GET_KEY)
        : "memory"
    );

    return a0;
}

static inline uint32_t is_key_down(uint32_t key) {
    register uint32_t a0 asm("a0") = SYS_IS_KEY_DOWN; // syscall number
    register uint32_t a1 asm("a1") = key;             // argument: key

    asm volatile(
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"          // trigger syscall
        : "+r"(a0)         // a0 = return value
        : "r"(a1)          // a1 = input key
        : "memory"
    );

    return (int32_t)a0;     // 1 if down, 0 if up, -1 on error
}


static inline int sys_show_framebuffer(void *address) {
    register void* a1 asm("a1") = address;

    asm volatile(
        "li a0, %1\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        :
        : "r"(a1), "i"(SYS_SHOW_FRAMEBUFFER)
        : "a0", "memory"
    );

    return 0;
}

static inline void syscall_breakpoint(void) {
    asm volatile("ebreak");
}

#endif //SYSCALLS_H
