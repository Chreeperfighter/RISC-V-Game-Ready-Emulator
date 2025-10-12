.globl _start
_start:
    li sp, 0x8000FFF0   # Set stack pointer
    li gp, 0x80000000   # Init global pointer
    call main           # Call C main()
    li a7, 10
    ecall               # Exit
