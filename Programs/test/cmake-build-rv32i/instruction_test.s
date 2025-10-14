	.file	"instruction_test.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	PRINT_OUTPUT
	.section	.sbss,"aw",@nobits
	.align	2
	.type	PRINT_OUTPUT, @object
	.size	PRINT_OUTPUT, 4
PRINT_OUTPUT:
	.zero	4
	.text
	.align	1
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bgtu	a4,a5,.L2
	lw	a5,-36(s0)
	j	.L3
.L2:
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	li	a5,2
	sw	a5,-28(s0)
	j	.L4
.L5:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	addw	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	lw	a5,-32(s0)
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L4:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bleu	a4,a5,.L5
	lw	a5,-24(s0)
.L3:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	fibonacci, .-fibonacci
	.align	1
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L7
.L11:
	sw	zero,-24(s0)
	j	.L8
.L10:
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a3,-40(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	ble	a4,a5,.L9
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a3,-40(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,0(a5)
.L9:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L8:
	lw	a5,-44(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-24(s0)
	sext.w	a4,a4
	blt	a4,a5,.L10
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-20(s0)
	sext.w	a4,a4
	blt	a4,a5,.L11
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	bubble_sort, .-bubble_sort
	.align	1
	.globl	is_prime
	.type	is_prime, @function
is_prime:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bgt	a4,a5,.L13
	li	a5,0
	j	.L14
.L13:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,3
	bgt	a4,a5,.L15
	li	a5,1
	j	.L14
.L15:
	lw	a5,-36(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L16
	lw	a5,-36(s0)
	sext.w	a3,a5
	li	a4,1431654400
	addi	a4,a4,1366
	mul	a4,a3,a4
	srli	a4,a4,32
	sraiw	a3,a5,31
	subw	a4,a4,a3
	mv	a3,a4
	mv	a4,a3
	slliw	a4,a4,1
	addw	a4,a4,a3
	subw	a5,a5,a4
	sext.w	a5,a5
	bne	a5,zero,.L17
.L16:
	li	a5,0
	j	.L14
.L17:
	li	a5,5
	sw	a5,-20(s0)
	j	.L18
.L21:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	remw	a5,a4,a5
	sext.w	a5,a5
	beq	a5,zero,.L19
	lw	a5,-20(s0)
	addiw	a5,a5,2
	sext.w	a5,a5
	lw	a4,-36(s0)
	remw	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L20
.L19:
	li	a5,0
	j	.L14
.L20:
	lw	a5,-20(s0)
	addiw	a5,a5,6
	sw	a5,-20(s0)
.L18:
	lw	a5,-20(s0)
	mulw	a5,a5,a5
	sext.w	a5,a5
	lw	a4,-36(s0)
	sext.w	a4,a4
	bge	a4,a5,.L21
	li	a5,1
.L14:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	is_prime, .-is_prime
	.align	1
	.globl	circle_area
	.type	circle_area, @function
circle_area:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	flw	fa4,-20(s0)
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fmul.s	fa4,fa4,fa5
	flw	fa5,-20(s0)
	fmul.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	circle_area, .-circle_area
	.align	1
	.globl	rectangle_area
	.type	rectangle_area, @function
rectangle_area:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	fsw	fa1,-24(s0)
	flw	fa4,-20(s0)
	flw	fa5,-24(s0)
	fmul.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	rectangle_area, .-rectangle_area
	.align	1
	.globl	sqrt_approx
	.type	sqrt_approx, @function
sqrt_approx:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	fsw	fa0,-36(s0)
	flw	fa5,-36(s0)
	fmv.s.x	fa4,zero
	flt.s	a5,fa5,fa4
	bne	a5,zero,.L33
	j	.L34
.L33:
	fmv.s.x	fa5,zero
	j	.L29
.L34:
	flw	fa5,-36(s0)
	fmv.s.x	fa4,zero
	feq.s	a5,fa5,fa4
	beq	a5,zero,.L30
	fmv.s.x	fa5,zero
	j	.L29
.L30:
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	sw	zero,-24(s0)
	j	.L31
.L32:
	flw	fa4,-36(s0)
	flw	fa5,-20(s0)
	fdiv.s	fa4,fa4,fa5
	flw	fa5,-20(s0)
	fadd.s	fa4,fa4,fa5
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L31:
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L32
	flw	fa5,-20(s0)
.L29:
	fmv.s	fa0,fa5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	sqrt_approx, .-sqrt_approx
	.align	1
	.globl	celsius_to_fahrenheit
	.type	celsius_to_fahrenheit, @function
celsius_to_fahrenheit:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	flw	fa4,-20(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fmul.s	fa4,fa4,fa5
	lui	a5,%hi(.LC4)
	flw	fa5,%lo(.LC4)(a5)
	fdiv.s	fa4,fa4,fa5
	lui	a5,%hi(.LC5)
	flw	fa5,%lo(.LC5)(a5)
	fadd.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	celsius_to_fahrenheit, .-celsius_to_fahrenheit
	.section	.rodata
	.align	3
.LC6:
	.string	"\n=== ASCII Pattern ===\n"
	.align	3
.LC7:
	.string	"# "
	.align	3
.LC8:
	.string	"X "
	.align	3
.LC9:
	.string	". "
	.align	3
.LC10:
	.string	"\n"
	.text
	.align	1
	.globl	draw_pattern
	.type	draw_pattern, @function
draw_pattern:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L38
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf_
.L38:
	sw	zero,-20(s0)
	j	.L39
.L50:
	sw	zero,-24(s0)
	j	.L40
.L48:
	lw	a5,-20(s0)
	sext.w	a5,a5
	beq	a5,zero,.L41
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-20(s0)
	sext.w	a4,a4
	beq	a4,a5,.L41
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L41
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-24(s0)
	sext.w	a4,a4
	bne	a4,a5,.L42
.L41:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L44
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf_
	j	.L44
.L42:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	beq	a4,a5,.L45
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	bne	a4,a5,.L46
.L45:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L44
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf_
	j	.L44
.L46:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L44
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	printf_
.L44:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L40:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L48
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L49
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L49:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L39:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L50
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	draw_pattern, .-draw_pattern
	.section	.rodata
	.align	3
.LC11:
	.string	"========================================\n"
	.align	3
.LC12:
	.string	"   RISC-V RV32I CPU Emulator Demo\n"
	.align	3
.LC13:
	.string	"   Testing Instructions & Features\n"
	.align	3
.LC14:
	.string	"\n[1] Basic Arithmetic Test\n"
	.align	3
.LC15:
	.string	"-----------------------------\n"
	.align	3
.LC16:
	.string	"a = %d, b = %d\n"
	.align	3
.LC17:
	.string	"a + b = %d\n"
	.align	3
.LC18:
	.string	"a - b = %d\n"
	.align	3
.LC19:
	.string	"a * b = %d\n"
	.align	3
.LC20:
	.string	"a / b = %d\n"
	.align	3
.LC21:
	.string	"a %% b = %d\n"
	.align	3
.LC22:
	.string	"\n[2] Bitwise Operations\n"
	.align	3
.LC23:
	.string	"x = 0x%02X, y = 0x%02X\n"
	.align	3
.LC24:
	.string	"x & y  = 0x%02X\n"
	.align	3
.LC25:
	.string	"x | y  = 0x%02X\n"
	.align	3
.LC26:
	.string	"x ^ y  = 0x%02X\n"
	.align	3
.LC27:
	.string	"x << 2 = 0x%02X\n"
	.align	3
.LC28:
	.string	"x >> 2 = 0x%02X\n"
	.align	3
.LC29:
	.string	"\n[3] Software Floating-Point Test\n"
	.align	3
.LC30:
	.string	"PI = %.5f\n"
	.align	3
.LC31:
	.string	"Radius = %.2f\n"
	.align	3
.LC32:
	.string	"Circle area = %.2f\n"
	.align	3
.LC35:
	.string	"\nRectangle %0.1f x %0.1f\n"
	.align	3
.LC36:
	.string	"Area = %.2f\n"
	.align	3
.LC37:
	.string	"\nSquare root approximations:\n"
	.align	3
.LC39:
	.string	"sqrt(16) = %.4f\n"
	.align	3
.LC41:
	.string	"sqrt(25) = %.4f\n"
	.align	3
.LC42:
	.string	"sqrt(2)  = %.4f\n"
	.align	3
.LC43:
	.string	"\nTemperature conversions:\n"
	.align	3
.LC44:
	.string	"0C = %.1fF\n"
	.align	3
.LC46:
	.string	"100C = %.1fF\n"
	.align	3
.LC48:
	.string	"37C = %.1fF\n"
	.align	3
.LC49:
	.string	"\n[4] Double Precision Test\n"
	.align	3
.LC52:
	.string	"d1 = %.6f\n"
	.align	3
.LC53:
	.string	"d2 = %.6f\n"
	.align	3
.LC54:
	.string	"d1 + d2 = %.6f\n"
	.align	3
.LC55:
	.string	"d1 * d2 = %.2f\n"
	.align	3
.LC56:
	.string	"d1 / d2 = %.6f\n"
	.align	3
.LC57:
	.string	"\n[5] Fibonacci Sequence\n"
	.align	3
.LC58:
	.string	"First 10 Fibonacci numbers:\n"
	.align	3
.LC59:
	.string	"fib(%d) = %u\n"
	.align	3
.LC60:
	.string	"\n[6] Bubble Sort Test\n"
	.align	3
.LC61:
	.string	"Before: "
	.align	3
.LC62:
	.string	"%d "
	.align	3
.LC63:
	.string	"After:  "
	.align	3
.LC64:
	.string	"\n[7] Prime Number Detection\n"
	.align	3
.LC65:
	.string	"Prime numbers under 50:\n"
	.align	3
.LC66:
	.string	"\n[8] Pointer Operations\n"
	.align	3
.LC67:
	.string	"value = %d\n"
	.align	3
.LC68:
	.string	"&value = 0x%08X\n"
	.align	3
.LC69:
	.string	"ptr = 0x%08X\n"
	.align	3
.LC70:
	.string	"*ptr = %d\n"
	.align	3
.LC71:
	.string	"After *ptr=200, value = %d\n"
	.align	3
.LC72:
	.string	"\n[9] Stack & Memory Test\n"
	.align	3
.LC73:
	.string	"Buffer contents: "
	.align	3
.LC74:
	.string	"%c"
	.align	3
.LC75:
	.string	"\n========================================\n"
	.align	3
.LC76:
	.string	"        All Tests Completed!\n"
	.align	3
.LC77:
	.string	"\nCPU emulator is working correctly!\n\n"
	.align	3
.LC0:
	.word	64
	.word	34
	.word	25
	.word	12
	.word	22
	.word	11
	.word	90
	.word	88
	.text
	.align	1
	.globl	run_instruction_test
	.type	run_instruction_test, @function
run_instruction_test:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	addi	s0,sp,208
	mv	a5,a0
	sw	a5,-196(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a4,-196(s0)
	sw	a4,%lo(PRINT_OUTPUT)(a5)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L52
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L52:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L53
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf_
.L53:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L54
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf_
.L54:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L55
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	printf_
.L55:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L56
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf_
.L56:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L57
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	printf_
.L57:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L58
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L58:
	li	a5,42
	sw	a5,-48(s0)
	li	a5,17
	sw	a5,-52(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L59
	lw	a4,-52(s0)
	lw	a5,-48(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	printf_
.L59:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L60
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	printf_
.L60:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L61
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	printf_
.L61:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L62
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	printf_
.L62:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L63
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	divw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	printf_
.L63:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L64
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	remw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	printf_
.L64:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L65
	lui	a5,%hi(.LC22)
	addi	a0,a5,%lo(.LC22)
	call	printf_
.L65:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L66
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L66:
	li	a5,170
	sw	a5,-56(s0)
	li	a5,85
	sw	a5,-60(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L67
	lw	a4,-60(s0)
	lw	a5,-56(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC23)
	addi	a0,a5,%lo(.LC23)
	call	printf_
.L67:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L68
	lw	a5,-56(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	printf_
.L68:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L69
	lw	a5,-56(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	printf_
.L69:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L70
	lw	a5,-56(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	xor	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC26)
	addi	a0,a5,%lo(.LC26)
	call	printf_
.L70:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L71
	lw	a5,-56(s0)
	slliw	a5,a5,2
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC27)
	addi	a0,a5,%lo(.LC27)
	call	printf_
.L71:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L72
	lw	a5,-56(s0)
	srliw	a5,a5,2
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC28)
	addi	a0,a5,%lo(.LC28)
	call	printf_
.L72:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L73
	lui	a5,%hi(.LC29)
	addi	a0,a5,%lo(.LC29)
	call	printf_
.L73:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L74
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L74:
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fsw	fa5,-64(s0)
	lui	a5,%hi(.LC4)
	flw	fa5,%lo(.LC4)(a5)
	fsw	fa5,-68(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L75
	flw	fa5,-64(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC30)
	addi	a0,a5,%lo(.LC30)
	call	printf_
.L75:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L76
	flw	fa5,-68(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC31)
	addi	a0,a5,%lo(.LC31)
	call	printf_
.L76:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L77
	flw	fa0,-68(s0)
	call	circle_area
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC32)
	addi	a0,a5,%lo(.LC32)
	call	printf_
.L77:
	lui	a5,%hi(.LC33)
	flw	fa5,%lo(.LC33)(a5)
	fsw	fa5,-72(s0)
	lui	a5,%hi(.LC34)
	flw	fa5,%lo(.LC34)(a5)
	fsw	fa5,-76(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L78
	flw	fa5,-72(s0)
	fcvt.d.s	fa4,fa5
	flw	fa5,-76(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a2,fa5
	fmv.x.d	a1,fa4
	lui	a5,%hi(.LC35)
	addi	a0,a5,%lo(.LC35)
	call	printf_
.L78:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L79
	flw	fa1,-76(s0)
	flw	fa0,-72(s0)
	call	rectangle_area
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC36)
	addi	a0,a5,%lo(.LC36)
	call	printf_
.L79:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L80
	lui	a5,%hi(.LC37)
	addi	a0,a5,%lo(.LC37)
	call	printf_
.L80:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L81
	lui	a5,%hi(.LC38)
	flw	fa5,%lo(.LC38)(a5)
	fmv.s	fa0,fa5
	call	sqrt_approx
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC39)
	addi	a0,a5,%lo(.LC39)
	call	printf_
.L81:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L82
	lui	a5,%hi(.LC40)
	flw	fa5,%lo(.LC40)(a5)
	fmv.s	fa0,fa5
	call	sqrt_approx
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC41)
	addi	a0,a5,%lo(.LC41)
	call	printf_
.L82:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L83
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fmv.s	fa0,fa5
	call	sqrt_approx
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC42)
	addi	a0,a5,%lo(.LC42)
	call	printf_
.L83:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L84
	lui	a5,%hi(.LC43)
	addi	a0,a5,%lo(.LC43)
	call	printf_
.L84:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L85
	fmv.s.x	fa0,zero
	call	celsius_to_fahrenheit
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC44)
	addi	a0,a5,%lo(.LC44)
	call	printf_
.L85:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L86
	lui	a5,%hi(.LC45)
	flw	fa5,%lo(.LC45)(a5)
	fmv.s	fa0,fa5
	call	celsius_to_fahrenheit
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC46)
	addi	a0,a5,%lo(.LC46)
	call	printf_
.L86:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L87
	lui	a5,%hi(.LC47)
	flw	fa5,%lo(.LC47)(a5)
	fmv.s	fa0,fa5
	call	celsius_to_fahrenheit
	fmv.s	fa5,fa0
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC48)
	addi	a0,a5,%lo(.LC48)
	call	printf_
.L87:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L88
	lui	a5,%hi(.LC49)
	addi	a0,a5,%lo(.LC49)
	call	printf_
.L88:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L89
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L89:
	lui	a5,%hi(.LC50)
	fld	fa5,%lo(.LC50)(a5)
	fsd	fa5,-88(s0)
	lui	a5,%hi(.LC51)
	fld	fa5,%lo(.LC51)(a5)
	fsd	fa5,-96(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L90
	ld	a1,-88(s0)
	lui	a5,%hi(.LC52)
	addi	a0,a5,%lo(.LC52)
	call	printf_
.L90:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L91
	ld	a1,-96(s0)
	lui	a5,%hi(.LC53)
	addi	a0,a5,%lo(.LC53)
	call	printf_
.L91:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L92
	fld	fa4,-88(s0)
	fld	fa5,-96(s0)
	fadd.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC54)
	addi	a0,a5,%lo(.LC54)
	call	printf_
.L92:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L93
	fld	fa4,-88(s0)
	fld	fa5,-96(s0)
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC55)
	addi	a0,a5,%lo(.LC55)
	call	printf_
.L93:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L94
	fld	fa4,-88(s0)
	fld	fa5,-96(s0)
	fdiv.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC56)
	addi	a0,a5,%lo(.LC56)
	call	printf_
.L94:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L95
	lui	a5,%hi(.LC57)
	addi	a0,a5,%lo(.LC57)
	call	printf_
.L95:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L96
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L96:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L97
	lui	a5,%hi(.LC58)
	addi	a0,a5,%lo(.LC58)
	call	printf_
.L97:
	sw	zero,-20(s0)
	j	.L98
.L100:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L99
	lw	a5,-20(s0)
	mv	a0,a5
	call	fibonacci
	mv	a5,a0
	mv	a4,a5
	lw	a5,-20(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC59)
	addi	a0,a5,%lo(.LC59)
	call	printf_
.L99:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L98:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L100
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L101
	lui	a5,%hi(.LC60)
	addi	a0,a5,%lo(.LC60)
	call	printf_
.L101:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L102
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L102:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	ld	a5,24(a5)
	sd	a2,-144(s0)
	sd	a3,-136(s0)
	sd	a4,-128(s0)
	sd	a5,-120(s0)
	li	a5,8
	sw	a5,-100(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L103
	lui	a5,%hi(.LC61)
	addi	a0,a5,%lo(.LC61)
	call	printf_
.L103:
	sw	zero,-24(s0)
	j	.L104
.L106:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L105
	lw	a4,-24(s0)
	addi	a5,s0,-144
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC62)
	addi	a0,a5,%lo(.LC62)
	call	printf_
.L105:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L104:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-100(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L106
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L107
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L107:
	lw	a4,-100(s0)
	addi	a5,s0,-144
	mv	a1,a4
	mv	a0,a5
	call	bubble_sort
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L108
	lui	a5,%hi(.LC63)
	addi	a0,a5,%lo(.LC63)
	call	printf_
.L108:
	sw	zero,-28(s0)
	j	.L109
.L111:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L110
	lw	a4,-28(s0)
	addi	a5,s0,-144
	slli	a4,a4,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC62)
	addi	a0,a5,%lo(.LC62)
	call	printf_
.L110:
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L109:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-100(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L111
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L112
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L112:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L113
	lui	a5,%hi(.LC64)
	addi	a0,a5,%lo(.LC64)
	call	printf_
.L113:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L114
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L114:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L115
	lui	a5,%hi(.LC65)
	addi	a0,a5,%lo(.LC65)
	call	printf_
.L115:
	sw	zero,-32(s0)
	li	a5,2
	sw	a5,-36(s0)
	j	.L116
.L119:
	lw	a5,-36(s0)
	mv	a0,a5
	call	is_prime
	mv	a5,a0
	beq	a5,zero,.L117
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L118
	lw	a5,-36(s0)
	mv	a1,a5
	lui	a5,%hi(.LC62)
	addi	a0,a5,%lo(.LC62)
	call	printf_
.L118:
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	mv	a4,a5
	sext.w	a3,a4
	li	a5,1717985280
	addi	a5,a5,1639
	mul	a5,a3,a5
	srli	a5,a5,32
	sraiw	a5,a5,2
	mv	a3,a5
	sraiw	a5,a4,31
	subw	a5,a3,a5
	mv	a3,a5
	mv	a5,a3
	slliw	a5,a5,2
	addw	a5,a5,a3
	slliw	a5,a5,1
	subw	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L117
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L117
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L117:
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L116:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,49
	ble	a4,a5,.L119
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L120
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L120:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L121
	lui	a5,%hi(.LC66)
	addi	a0,a5,%lo(.LC66)
	call	printf_
.L121:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L122
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L122:
	li	a5,100
	sw	a5,-148(s0)
	addi	a5,s0,-148
	sd	a5,-112(s0)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L123
	lw	a5,-148(s0)
	mv	a1,a5
	lui	a5,%hi(.LC67)
	addi	a0,a5,%lo(.LC67)
	call	printf_
.L123:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L124
	addi	a5,s0,-148
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC68)
	addi	a0,a5,%lo(.LC68)
	call	printf_
.L124:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L125
	ld	a5,-112(s0)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC69)
	addi	a0,a5,%lo(.LC69)
	call	printf_
.L125:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L126
	ld	a5,-112(s0)
	lw	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC70)
	addi	a0,a5,%lo(.LC70)
	call	printf_
.L126:
	ld	a5,-112(s0)
	li	a4,200
	sw	a4,0(a5)
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L127
	lw	a5,-148(s0)
	mv	a1,a5
	lui	a5,%hi(.LC71)
	addi	a0,a5,%lo(.LC71)
	call	printf_
.L127:
	li	a0,9
	call	draw_pattern
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L128
	lui	a5,%hi(.LC72)
	addi	a0,a5,%lo(.LC72)
	call	printf_
.L128:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L129
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf_
.L129:
	sw	zero,-40(s0)
	j	.L130
.L131:
	lw	a5,-40(s0)
	sext.w	a3,a5
	li	a4,1321529344
	addi	a4,a4,-945
	mul	a4,a3,a4
	srli	a4,a4,32
	sraiw	a4,a4,3
	mv	a3,a4
	sraiw	a4,a5,31
	subw	a4,a3,a4
	mv	a3,a4
	li	a4,26
	mulw	a4,a3,a4
	subw	a5,a5,a4
	sext.w	a5,a5
	andi	a5,a5,0xff
	addiw	a5,a5,65
	andi	a4,a5,0xff
	lw	a5,-40(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-168(a5)
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L130:
	lw	a5,-40(s0)
	sext.w	a4,a5
	li	a5,31
	ble	a4,a5,.L131
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L132
	lui	a5,%hi(.LC73)
	addi	a0,a5,%lo(.LC73)
	call	printf_
.L132:
	sw	zero,-44(s0)
	j	.L133
.L135:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L134
	lw	a5,-44(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-168(a5)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC74)
	addi	a0,a5,%lo(.LC74)
	call	printf_
.L134:
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L133:
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,31
	ble	a4,a5,.L135
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L136
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf_
.L136:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L137
	lui	a5,%hi(.LC75)
	addi	a0,a5,%lo(.LC75)
	call	printf_
.L137:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L138
	lui	a5,%hi(.LC76)
	addi	a0,a5,%lo(.LC76)
	call	printf_
.L138:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L139
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf_
.L139:
	lui	a5,%hi(PRINT_OUTPUT)
	lw	a5,%lo(PRINT_OUTPUT)(a5)
	beq	a5,zero,.L140
	lui	a5,%hi(.LC77)
	addi	a0,a5,%lo(.LC77)
	call	printf_
.L140:
	li	a5,0
	mv	a0,a5
	ld	ra,200(sp)
	ld	s0,192(sp)
	addi	sp,sp,208
	jr	ra
	.size	run_instruction_test, .-run_instruction_test
	.section	.rodata
	.align	2
.LC1:
	.word	1078530000
	.align	2
.LC2:
	.word	1073741824
	.align	2
.LC3:
	.word	1091567616
	.align	2
.LC4:
	.word	1084227584
	.align	2
.LC5:
	.word	1107296256
	.align	2
.LC33:
	.word	1095237632
	.align	2
.LC34:
	.word	1090833613
	.align	2
.LC38:
	.word	1098907648
	.align	2
.LC40:
	.word	1103626240
	.align	2
.LC45:
	.word	1120403456
	.align	2
.LC47:
	.word	1108606976
	.align	3
.LC50:
	.word	133040907
	.word	1079958844
	.align	3
.LC51:
	.word	212205744
	.word	1083104572
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
