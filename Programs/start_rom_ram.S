    .globl _start

_start:
    la sp, _end
    la gp, __global_pointer$
    la  t0, __data_start
    la  t1, __data_end
    la  t2, __data_load
1:
    # Copy data from ROM to RAM
    beq t0, t1, 2f
    lw  t3, 0(t2)
    sw  t3, 0(t0)
    addi t0, t0, 4
    addi t2, t2, 4
    j 1b
2:
    # Zero .bss
    la t0, __bss_start
    la t1, __bss_end
3:
    beq t0, t1, 4f
    sw x0, 0(t0)
    addi t0, t0, 4
    j 3b
4:
    call main
    # Exit via ecall
    li a7, 10
    ecall
