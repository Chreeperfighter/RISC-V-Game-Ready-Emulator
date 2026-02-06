    .section .text.init
    .globl _start
    .globl _stack_top
    .globl __global_pointer$
    .extern main
    .extern __libc_init_array
    .extern exit

_start:
    # --- Initialize stack pointer ---
    la sp, _stack_top

    # --- Initialize global pointer ---
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Initialize semihosting BEFORE __libc_init_array
    # call init_semihosting

    # --- Call global constructors ---
    call __libc_init_array

    # --- Call main ---
    call main

    # --- Call exit for cleanup ---
    call exit

    # --- Loop forever just in case ---
1:  j 1b
