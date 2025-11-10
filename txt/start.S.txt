    .section .text.init
    .globl _start
    .globl _stack_top
    .globl __global_pointer$
    .extern main
    .extern __libc_init_array
    .extern _sdata
    .extern _edata
    .extern _sidata
    .extern _sbss
    .extern _ebss
    .extern exit

_start:
    # --- Initialize stack pointer ---
    la sp, _stack_top

    # --- Initialize global pointer ---
    la gp, __global_pointer$

    # --- Copy .data from flash to RAM ---
    la a0, _sidata      # source (flash)
    la a1, _sdata       # destination (RAM)
    la t1, _edata       # end of .data
1:  bge a1, t1, 2f
    lw t0, 0(a0)
    sw t0, 0(a1)
    addi a0, a0, 4
    addi a1, a1, 4
    j 1b
2:

    # --- Zero .bss ---
    la a0, _sbss        # start of .bss
    la t1, _ebss        # end of .bss
    li t0, 0
3:  bge a0, t1, 4f
    sw t0, 0(a0)
    addi a0, a0, 4
    j 3b
4:

    # --- Call global constructors ---
    call __libc_init_array

    # --- Call main ---
    call main

    # --- Call exit for semihosting ---
    call exit

    # --- Loop forever just in case ---
5:  j 5b
