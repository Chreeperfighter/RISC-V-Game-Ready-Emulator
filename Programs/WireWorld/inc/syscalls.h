//
// Created by Mark Verbeek on 11.12.25.
//

#ifndef SYSCALLS_H
#define SYSCALLS_H

#define SYS_GET_FRAMEBUFFER_INFO 0x12
#define SYS_SHOW_FRAMEBUFFER  0x11
#define SYS_GET_MOUSE_POS 0x14
#define SYS_IS_MOUSE_BUTTON_DOWN 0x03
#define SYS_GET_US 0x04
#define SYS_SLEEP_US 0x06

static inline void trigger_syscall(int syscall_number) {
    asm volatile(
        "mv a0, %0\n\t"
        "slli zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai zero, zero, 0x7"
        :
        : "r"(syscall_number)
        : "a0"
        );
}

static inline int sys_get_framebuffer_info(void *address) {
    asm volatile(
        "mv a1, %0"
        :
        : "r"(address)
        : "a1"
        );
    trigger_syscall(SYS_GET_FRAMEBUFFER_INFO);
    int ret;
    asm volatile(
        "mv %0, a0"
        : "=r"(ret)
        :
        :
        );
    return ret;
}

static inline void sys_get_mouse_pos(void *address) {
    asm volatile(
        "mv a1, %0"
        :
        : "r"(address)
        : "a1"
        );
    trigger_syscall(SYS_GET_MOUSE_POS);
}

static inline uint32_t sys_is_mouse_button_down(void *address) {
    register uint32_t a0 asm("a0");
    register uint32_t a1 asm("a1") = (uintptr_t)address;

    asm volatile(
        ""
        : "=r"(a0)
        : "r"(a1)
        : "memory"
    );

    trigger_syscall(SYS_IS_MOUSE_BUTTON_DOWN);

    asm volatile(
        ""
        : "=r"(a0)
        :
        : "memory"
    );

    return a0;
}

static inline uint32_t sys_get_us(void *address) {
    register uint32_t a0 asm("a0");
    register uint32_t a1 asm("a1") = (uintptr_t)address;

    asm volatile(
        ""
        : "=r"(a0)
        : "r"(a1)
        : "memory"
    );

    trigger_syscall(SYS_GET_US);

    asm volatile(
        ""
        : "=r"(a0)
        :
        : "memory"
    );

    return a0;
}

static inline uint32_t sys_sleep_us(uint32_t us) {
    register uint32_t a0 asm("a0");
    register uint32_t a1 asm("a1") = (uintptr_t)&us;

    asm volatile(
        ""
        : "=r"(a0)
        : "r"(a1)
        : "memory"
    );

    trigger_syscall(SYS_SLEEP_US);

    asm volatile(
        ""
        : "=r"(a0)
        :
        : "memory"
    );

    return a0;
}

static inline int sys_show_framebuffer(void *address) {
    asm volatile(
    "mv a1, %0"
    :
    : "r"(address)
    : "a1"
    );
    trigger_syscall(SYS_SHOW_FRAMEBUFFER);
}

static inline void syscall_breakpoint(void) {
    asm volatile("ebreak");
}

#endif //SYSCALLS_H
