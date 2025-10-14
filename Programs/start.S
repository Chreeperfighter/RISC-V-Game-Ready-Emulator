    .globl _start

_start:
    la sp, _end
    
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Zero .bss
    la t0, __bss_start
    la t1, __bss_end
1:
    beq t0, t1, 2f
    sw x0, 0(t0)
    addi t0, t0, 4
    j 1b
2:
    call main
    # Exit via ecall
    li a7, 10
    ecall
