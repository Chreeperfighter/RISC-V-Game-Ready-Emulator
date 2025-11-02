//
// Created by Mark Verbeek on 23.10.25.
//

#ifndef TIMER_H
#define TIMER_H

#define GET_US 11
#define SLEEP_US 12
#define GET_CYCLES 100
#include <stdint.h>

static inline uint32_t get_us(void) {
    register long a0 __asm__("a0");
    register long a7 __asm__("a7") = GET_US;

    __asm__ volatile ("ecall" : "=r"(a0) : "r"(a7) : "memory");
    return a0;  // Returns 0 on success, -1 on error
}

static inline void sleep_us(const uint32_t us) {
    register long a0 __asm__("a0") = us;
    register long a7 __asm__("a7") = SLEEP_US;

    __asm__ volatile ("ecall" :: "r"(a0), "r"(a7) : "memory");
}

static inline uint64_t get_cycles(void) {
    register uint64_t a0 __asm__("a0");
    register long a7 __asm__("a7") = GET_CYCLES;

    __asm__ volatile ("ecall" : "=r"(a0) : "r"(a7) : "memory");
    return a0;
}

#endif //TIMER_H
