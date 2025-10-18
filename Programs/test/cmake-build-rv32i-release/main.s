	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"x is zero"
	.align	3
.LC1:
	.string	"x is one"
	.align	3
.LC2:
	.string	"x is two"
	.align	3
.LC3:
	.string	"x is another"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	beq	a4,a5,.L2
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	bgt	a4,a5,.L3
	lw	a5,-20(s0)
	sext.w	a5,a5
	beq	a5,zero,.L4
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L5
	j	.L3
.L4:
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	j	.L6
.L5:
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L6
.L2:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	j	.L6
.L3:
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	nop
.L6:
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
