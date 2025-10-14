//
// Created by Mark Verbeek on 14.10.25.
//

#include "util.h"

int my_putchar(int c) {
    register int a0 asm("a0") = c;
    register int a7 asm("a7") = 2; // PRINT_CHAR
    asm volatile ("ecall" :: "r"(a0), "r"(a7) : "memory");
    return c;
}

void _putchar(char character)
{
    my_putchar(character);
}

void breakpoint(void) {
    asm volatile ("ebreak" ::: "memory");
}