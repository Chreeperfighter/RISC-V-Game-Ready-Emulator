
# Custom _exit with SYS_EXIT_EXTENDED support
# Preserves exit code from a0

    .section .text
    .globl _exit
    .type _exit, @function
    
_exit:
    # Save exit code and create parameter block
    addi sp, sp, -8        # Allocate 8 bytes on stack
    lui  t0, 0x20
    addi t0, t0, 0x26      # t0 = 0x20026
    sw   t0, 0(sp)         # reason field
    sw   a0, 4(sp)         # exit_code field (from parameter)
    
    # Call SYS_EXIT_EXTENDED
    li   a0, 0x20          # Operation 0x20
    mv   a1, sp            # Pointer to block
    
    # Semihosting call sequence
    .option push
    .option norvc          # Disable compressed instructions
    nop
    slli zero, zero, 0x1f
    ebreak
    srai zero, zero, 0x7
    .option pop
    
    # Cleanup and hang
    addi sp, sp, 8
1:  j 1b
