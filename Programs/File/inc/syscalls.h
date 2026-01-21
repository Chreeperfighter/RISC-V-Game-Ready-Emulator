//
// Created by Mark Verbeek on 11.12.25.
//

#ifndef SYSCALLS_H
#define SYSCALLS_H

static inline void syscall_breakpoint(void) {
    asm("EBREAK");
}

#endif //SYSCALLS_H
