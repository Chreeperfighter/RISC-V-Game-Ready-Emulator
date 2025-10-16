	.file	"util.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	get_display_width
	.type	get_display_width, @function
get_display_width:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a7,200
 #APP
# 10 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a0
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_display_width, .-get_display_width
	.align	1
	.globl	get_display_height
	.type	get_display_height, @function
get_display_height:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a7,201
 #APP
# 18 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a0
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_display_height, .-get_display_height
	.align	1
	.globl	set_display_enable
	.type	set_display_enable, @function
set_display_enable:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	li	a7,202
 #APP
# 26 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	set_display_enable, .-set_display_enable
	.align	1
	.globl	get_display_status
	.type	get_display_status, @function
get_display_status:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a7,203
 #APP
# 32 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a0
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_display_status, .-get_display_status
	.align	1
	.globl	get_cycles
	.type	get_cycles, @function
get_cycles:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a7,100
 #APP
# 41 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a1
	slli	a5,a5,32
	sext.w	a4,a0
	or	a5,a5,a4
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_cycles, .-get_cycles
	.align	1
	.globl	breakpoint
	.type	breakpoint, @function
breakpoint:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
 #APP
# 47 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ebreak
# 0 "" 2
 #NO_APP
	nop
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	breakpoint, .-breakpoint
	.align	1
	.globl	read
	.type	read, @function
read:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sd	a1,-32(s0)
	mv	a4,a2
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	a5,-32(s0)
	mv	a1,a5
	lw	a5,-24(s0)
	mv	a2,a5
	li	a7,63
 #APP
# 56 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	read, .-read
	.align	1
	.globl	write
	.type	write, @function
write:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sd	a1,-32(s0)
	mv	a4,a2
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	a5,-32(s0)
	mv	a1,a5
	lw	a5,-24(s0)
	mv	a2,a5
	li	a7,64
 #APP
# 70 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall
# 0 "" 2
 #NO_APP
	sext.w	a5,a0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	write, .-write
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
