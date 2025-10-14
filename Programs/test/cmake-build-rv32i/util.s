	.file	"util.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	my_putchar
	.type	my_putchar, @function
my_putchar:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	li	a7,2
 #APP
# 10 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	my_putchar, .-my_putchar
	.align	1
	.globl	_putchar
	.type	_putchar, @function
_putchar:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	sext.w	a5,a5
	mv	a0,a5
	call	my_putchar
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	_putchar, .-_putchar
	.align	1
	.globl	breakpoint
	.type	breakpoint, @function
breakpoint:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
 #APP
# 20 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ebreak
# 0 "" 2
 #NO_APP
	nop
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	breakpoint, .-breakpoint
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
