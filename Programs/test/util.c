//
// Created by Mark Verbeek on 14.10.25.
//

#include "util.h"

unsigned int get_display_width(void) {
    register int a0 asm("a0");
    register int a7 asm("a7") = 200; // GET_SCREEN_WIDTH
    asm volatile ("ecall" : "=r"(a0) :"r"(a7) : "memory");

    return a0;
}

unsigned int get_display_height(void) {
    register int a0 asm("a0");
    register int a7 asm("a7") = 201; // GET_SCREEN_HEIGHT
    asm volatile ("ecall" : "=r"(a0) :"r"(a7) : "memory");

    return a0;
}

void set_display_enable(int enable) {
    register int a0 asm("a0") = enable;
    register int a7 asm("a7") = 202; // DISPLAY_ENABLE
    asm volatile ("ecall" :: "r"(a0), "r"(a7) : "memory");
}

unsigned int get_display_status(void) {
    register int a0 asm("a0");
    register int a7 asm("a7") = 203; // DISPLAY_STATUS
    asm volatile ("ecall" : "=r"(a0) :"r"(a7) : "memory");

    return a0;
}

void update_display() {
    register int a7 asm("a7") = 204; // DISPLAY_UPDATE
    asm volatile ("ecall" :: "r"(a7) : "memory");
}

unsigned long long get_cycles(void) {
    register int a0 asm("a0");
    register int a1 asm("a1");
    register int a7 asm("a7") = 100; // GET_CYCLES
    asm volatile ("ecall" : "=r"(a0), "=r"(a1) :"r"(a7) : "memory");

    return (unsigned long long)a1 << 32 | a0;
}

void breakpoint(void) {
    asm volatile ("ebreak" ::: "memory");
}

int read(uint32_t fd, const char *buffer, uint32_t max_bytes) {
    register uint32_t a0 asm("a0") = fd;
    register uintptr_t a1 asm("a1") = (uintptr_t)buffer;
    register uint32_t a2 asm("a2") = max_bytes;
    register uint32_t a7 asm("a7") = 63; // READ

    asm volatile ("ecall"
                  : "+r"(a0)                // a0 = return value
                  : "r"(a1), "r"(a2), "r"(a7)
                  : "memory");

    return (int)a0;
}

int write(uint32_t fd, const char *buffer, uint32_t num_bytes) {
    register uint32_t a0 asm("a0") = fd;
    register uintptr_t a1 asm("a1") = (uintptr_t)buffer;
    register uint32_t a2 asm("a2") = num_bytes;
    register uint32_t a7 asm("a7") = 64; // WRITE

    asm volatile ("ecall"
                  : "+r"(a0)                // a0 = return value
                  : "r"(a1), "r"(a2), "r"(a7)
                  : "memory");

    return (int)a0;
}