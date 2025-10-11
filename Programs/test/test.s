.section .text
.globl _start

_start:
    li t0, 0          # t0 = 0
    li t1, 5          # t1 = 5

loop:
    addi t0, t0, 1    # t0 += 1
    bne t0, t1, loop  # if t0 != t1, jump back to loop

    li a0, 42         # a0 = 42 (just a marker)
    jal x0, done      # unconditional jump to 'done'

skip:
    li a0, 99         # this line is skipped

done:
    li a7, 10         # syscall ID for exit
    ecall             # exit
