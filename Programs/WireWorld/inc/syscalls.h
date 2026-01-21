//
// Created by Mark Verbeek on 11.12.25.
//

#ifndef SYSCALLS_H
#define SYSCALLS_H

#define SYS_GET_FRAMEBUFFER_INFO 0x12
#define SYS_SHOW_FRAMEBUFFER  0x11
#define SYS_GET_MOUSE_POS 0x14

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

static inline int sys_get_framebuffer_info(int address) {
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

static inline void sys_get_mouse_pos(int address) {
    asm volatile(
    "mv a1, %0"
    :
    : "r"(address)
    : "a1"
    );
    trigger_syscall(SYS_GET_MOUSE_POS);
}

static inline int sys_show_framebuffer(int address) {
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
