	.file	"framebuffer_test.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	framebuffer
	.section	.sdata,"aw"
	.align	3
	.type	framebuffer, @object
	.size	framebuffer, 8
framebuffer:
	.dword	268435456
	.globl	display_width
	.section	.sbss,"aw",@nobits
	.align	2
	.type	display_width, @object
	.size	display_width, 4
display_width:
	.zero	4
	.globl	display_height
	.align	2
	.type	display_height, @object
	.size	display_height, 4
display_height:
	.zero	4
	.text
	.align	1
	.globl	set_pixel
	.type	set_pixel, @function
set_pixel:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a3,a1
	mv	a4,a2
	sw	a5,-36(s0)
	mv	a5,a3
	sw	a5,-40(s0)
	mv	a5,a4
	sw	a5,-44(s0)
	lui	a5,%hi(display_width)
	lw	a5,%lo(display_width)(a5)
	sw	a5,-20(s0)
	lui	a5,%hi(framebuffer)
	ld	a4,%lo(framebuffer)(a5)
	lw	a5,-40(s0)
	lw	a3,-20(s0)
	mulw	a5,a3,a5
	sext.w	a3,a5
	lw	a5,-36(s0)
	addw	a5,a3,a5
	sext.w	a5,a5
	slli	a5,a5,32
	srli	a5,a5,32
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-44(s0)
	sw	a4,0(a5)
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_pixel, .-set_pixel
	.align	1
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lui	a5,%hi(display_width)
	lw	a5,%lo(display_width)(a5)
	sw	a5,-24(s0)
	lui	a5,%hi(display_height)
	lw	a5,%lo(display_height)(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	mulw	a5,a4,a5
	sw	a5,-32(s0)
	sw	zero,-20(s0)
	j	.L3
.L4:
	lui	a5,%hi(framebuffer)
	ld	a4,%lo(framebuffer)(a5)
	lwu	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-36(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L3:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-32(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L4
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	clear_screen, .-clear_screen
	.align	1
	.globl	fast_sin
	.type	fast_sin, @function
fast_sin:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	fsw	fa0,-36(s0)
	j	.L6
.L7:
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
.L6:
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fgt.s	a5,fa4,fa5
	bne	a5,zero,.L7
	j	.L8
.L9:
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
.L8:
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L9
	flw	fa5,-36(s0)
	fmul.s	fa5,fa5,fa5
	fsw	fa5,-20(s0)
	flw	fa4,-20(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fdiv.s	fa4,fa4,fa5
	flw	fa3,-20(s0)
	lui	a5,%hi(.LC4)
	flw	fa5,%lo(.LC4)(a5)
	fdiv.s	fa5,fa3,fa5
	lui	a5,%hi(.LC5)
	flw	fa3,%lo(.LC5)(a5)
	fsub.s	fa5,fa3,fa5
	fmul.s	fa5,fa4,fa5
	lui	a5,%hi(.LC5)
	flw	fa4,%lo(.LC5)(a5)
	fsub.s	fa4,fa4,fa5
	flw	fa5,-36(s0)
	fmul.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	fast_sin, .-fast_sin
	.align	1
	.globl	fast_cos
	.type	fast_cos, @function
fast_cos:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	flw	fa4,-20(s0)
	lui	a5,%hi(.LC6)
	flw	fa5,%lo(.LC6)(a5)
	fadd.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	call	fast_sin
	fmv.s	fa5,fa0
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	fast_cos, .-fast_cos
	.align	1
	.globl	absf
	.type	absf, @function
absf:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	flw	fa5,-20(s0)
	fmv.s.x	fa4,zero
	flt.s	a5,fa5,fa4
	bne	a5,zero,.L18
	j	.L19
.L18:
	flw	fa5,-20(s0)
	fneg.s	fa5,fa5
	j	.L17
.L19:
	flw	fa5,-20(s0)
.L17:
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	absf, .-absf
	.align	1
	.globl	inv_sqrt
	.type	inv_sqrt, @function
inv_sqrt:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	fsw	fa0,-36(s0)
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC7)
	flw	fa5,%lo(.LC7)(a5)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	addi	a5,s0,-36
	lw	a5,0(a5)
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	sraiw	a5,a5,1
	sext.w	a5,a5
	li	a4,1597464576
	addiw	a4,a4,-1569
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-24(s0)
	addi	a5,s0,-24
	flw	fa5,0(a5)
	fsw	fa5,-36(s0)
	flw	fa4,-36(s0)
	flw	fa5,-20(s0)
	fmul.s	fa4,fa4,fa5
	flw	fa5,-36(s0)
	fmul.s	fa5,fa4,fa5
	lui	a5,%hi(.LC8)
	flw	fa4,%lo(.LC8)(a5)
	fsub.s	fa4,fa4,fa5
	flw	fa5,-36(s0)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
	flw	fa5,-36(s0)
	fmv.s	fa0,fa5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	inv_sqrt, .-inv_sqrt
	.align	1
	.globl	sqrt_approx
	.type	sqrt_approx, @function
sqrt_approx:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	flw	fa5,-20(s0)
	fmv.s.x	fa4,zero
	fle.s	a5,fa5,fa4
	bne	a5,zero,.L26
	j	.L27
.L26:
	fmv.s.x	fa5,zero
	j	.L25
.L27:
	flw	fa0,-20(s0)
	call	inv_sqrt
	fmv.s	fa4,fa0
	flw	fa5,-20(s0)
	fmul.s	fa5,fa4,fa5
.L25:
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	sqrt_approx, .-sqrt_approx
	.align	1
	.globl	fmod_simple
	.type	fmod_simple, @function
fmod_simple:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	fsw	fa0,-20(s0)
	fsw	fa1,-24(s0)
	flw	fa4,-20(s0)
	flw	fa5,-24(s0)
	fdiv.s	fa5,fa4,fa5
	fcvt.w.s a5,fa5,rtz
	sext.w	a5,a5
	fcvt.s.w	fa4,a5
	flw	fa5,-24(s0)
	fmul.s	fa5,fa4,fa5
	flw	fa4,-20(s0)
	fsub.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	fmod_simple, .-fmod_simple
	.align	1
	.globl	atan2_approx
	.type	atan2_approx, @function
atan2_approx:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	fsw	fa0,-36(s0)
	fsw	fa1,-40(s0)
	flw	fa0,-36(s0)
	call	absf
	fmv.s	fa4,fa0
	lui	a5,%hi(.LC9)
	flw	fa5,%lo(.LC9)(a5)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-24(s0)
	flw	fa5,-40(s0)
	fmv.s.x	fa4,zero
	fge.s	a5,fa5,fa4
	bne	a5,zero,.L38
	j	.L40
.L38:
	flw	fa4,-40(s0)
	flw	fa5,-24(s0)
	fsub.s	fa4,fa4,fa5
	flw	fa3,-40(s0)
	flw	fa5,-24(s0)
	fadd.s	fa5,fa3,fa5
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-32(s0)
	flw	fa4,-32(s0)
	lui	a5,%hi(.LC10)
	flw	fa5,%lo(.LC10)(a5)
	fmul.s	fa5,fa4,fa5
	lui	a5,%hi(.LC10)
	flw	fa4,%lo(.LC10)(a5)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	j	.L33
.L40:
	flw	fa4,-40(s0)
	flw	fa5,-24(s0)
	fadd.s	fa4,fa4,fa5
	flw	fa3,-24(s0)
	flw	fa5,-40(s0)
	fsub.s	fa5,fa3,fa5
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-28(s0)
	flw	fa4,-28(s0)
	lui	a5,%hi(.LC10)
	flw	fa5,%lo(.LC10)(a5)
	fmul.s	fa5,fa4,fa5
	lui	a5,%hi(.LC11)
	flw	fa4,%lo(.LC11)(a5)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
.L33:
	flw	fa5,-36(s0)
	fmv.s.x	fa4,zero
	flt.s	a5,fa5,fa4
	bne	a5,zero,.L39
	j	.L41
.L39:
	flw	fa5,-20(s0)
	fneg.s	fa5,fa5
	j	.L37
.L41:
	flw	fa5,-20(s0)
.L37:
	fmv.s	fa0,fa5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	atan2_approx, .-atan2_approx
	.align	1
	.globl	hsv_to_rgb
	.type	hsv_to_rgb, @function
hsv_to_rgb:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	fsw	fa0,-68(s0)
	fsw	fa1,-72(s0)
	fsw	fa2,-76(s0)
	flw	fa4,-76(s0)
	flw	fa5,-72(s0)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-32(s0)
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC12)
	flw	fa5,%lo(.LC12)(a5)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
	lui	a5,%hi(.LC13)
	flw	fa5,%lo(.LC13)(a5)
	fmv.s	fa1,fa5
	flw	fa0,-36(s0)
	call	fmod_simple
	fsw	fa0,-40(s0)
	flw	fa4,-40(s0)
	lui	a5,%hi(.LC5)
	flw	fa5,%lo(.LC5)(a5)
	fsub.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	call	absf
	fmv.s	fa4,fa0
	lui	a5,%hi(.LC5)
	flw	fa5,%lo(.LC5)(a5)
	fsub.s	fa5,fa5,fa4
	flw	fa4,-32(s0)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-44(s0)
	flw	fa4,-76(s0)
	flw	fa5,-32(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-48(s0)
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC12)
	flw	fa5,%lo(.LC12)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L55
	j	.L60
.L55:
	flw	fa5,-32(s0)
	fsw	fa5,-20(s0)
	flw	fa5,-44(s0)
	fsw	fa5,-24(s0)
	sw	zero,-28(s0)
	j	.L45
.L60:
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC14)
	flw	fa5,%lo(.LC14)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L56
	j	.L61
.L56:
	flw	fa5,-44(s0)
	fsw	fa5,-20(s0)
	flw	fa5,-32(s0)
	fsw	fa5,-24(s0)
	sw	zero,-28(s0)
	j	.L45
.L61:
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC15)
	flw	fa5,%lo(.LC15)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L57
	j	.L62
.L57:
	sw	zero,-20(s0)
	flw	fa5,-32(s0)
	fsw	fa5,-24(s0)
	flw	fa5,-44(s0)
	fsw	fa5,-28(s0)
	j	.L45
.L62:
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC16)
	flw	fa5,%lo(.LC16)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L58
	j	.L63
.L58:
	sw	zero,-20(s0)
	flw	fa5,-44(s0)
	fsw	fa5,-24(s0)
	flw	fa5,-32(s0)
	fsw	fa5,-28(s0)
	j	.L45
.L63:
	flw	fa4,-68(s0)
	lui	a5,%hi(.LC17)
	flw	fa5,%lo(.LC17)(a5)
	flt.s	a5,fa4,fa5
	bne	a5,zero,.L59
	j	.L64
.L59:
	flw	fa5,-44(s0)
	fsw	fa5,-20(s0)
	sw	zero,-24(s0)
	flw	fa5,-32(s0)
	fsw	fa5,-28(s0)
	j	.L45
.L64:
	flw	fa5,-32(s0)
	fsw	fa5,-20(s0)
	sw	zero,-24(s0)
	flw	fa5,-44(s0)
	fsw	fa5,-28(s0)
.L45:
	flw	fa4,-20(s0)
	flw	fa5,-48(s0)
	fadd.s	fa4,fa4,fa5
	lui	a5,%hi(.LC18)
	flw	fa5,%lo(.LC18)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	sb	a5,-49(s0)
	flw	fa4,-24(s0)
	flw	fa5,-48(s0)
	fadd.s	fa4,fa4,fa5
	lui	a5,%hi(.LC18)
	flw	fa5,%lo(.LC18)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	sb	a5,-50(s0)
	flw	fa4,-28(s0)
	flw	fa5,-48(s0)
	fadd.s	fa4,fa4,fa5
	lui	a5,%hi(.LC18)
	flw	fa5,%lo(.LC18)(a5)
	fmul.s	fa5,fa4,fa5
	fcvt.wu.s a5,fa5,rtz
	sb	a5,-51(s0)
	lbu	a5,-49(s0)
	sext.w	a5,a5
	slliw	a5,a5,16
	sext.w	a4,a5
	lbu	a5,-50(s0)
	sext.w	a5,a5
	slliw	a5,a5,8
	sext.w	a5,a5
	or	a5,a4,a5
	sext.w	a4,a5
	lbu	a5,-51(s0)
	sext.w	a5,a5
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	hsv_to_rgb, .-hsv_to_rgb
	.section	.rodata
	.align	3
.LC19:
	.string	"Initializing display..."
	.align	3
.LC20:
	.string	"Warning: Display not ready."
	.align	3
.LC21:
	.string	"Display resolution: %lux%lu\n"
	.align	3
.LC22:
	.string	"Display enabled successfully"
	.align	3
.LC23:
	.string	"Warning: Display not ready"
	.text
	.align	1
	.globl	init_display
	.type	init_display, @function
init_display:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	puts
	call	get_display_status
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L66
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	puts
	j	.L65
.L66:
	call	get_display_width
	mv	a5,a0
	mv	a4,a5
	lui	a5,%hi(display_width)
	sw	a4,%lo(display_width)(a5)
	call	get_display_height
	mv	a5,a0
	mv	a4,a5
	lui	a5,%hi(display_height)
	sw	a4,%lo(display_height)(a5)
	lui	a5,%hi(display_width)
	lw	a5,%lo(display_width)(a5)
	sw	a5,-24(s0)
	lui	a5,%hi(display_height)
	lw	a5,%lo(display_height)(a5)
	sw	a5,-28(s0)
	lw	a4,-28(s0)
	lw	a5,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	printf
	li	a0,1
	call	set_display_enable
	call	get_display_status
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L68
	lui	a5,%hi(.LC22)
	addi	a0,a5,%lo(.LC22)
	call	puts
	j	.L65
.L68:
	lui	a5,%hi(.LC23)
	addi	a0,a5,%lo(.LC23)
	call	puts
.L65:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_display, .-init_display
	.section	.rodata
	.align	3
.LC24:
	.string	"Running framebuffer test..."
	.align	3
.LC25:
	.string	"Test 1: Red gradient"
	.align	3
.LC26:
	.string	"Test 2: Green gradient"
	.align	3
.LC27:
	.string	"Test 3: Blue gradient"
	.align	3
.LC28:
	.string	"Test 4: Checkerboard"
	.align	3
.LC29:
	.string	"Framebuffer test complete!"
	.text
	.align	1
	.globl	run_frame_buffer_test
	.type	run_frame_buffer_test, @function
run_frame_buffer_test:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	li	a0,0
	call	clear_screen
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	puts
	lui	a5,%hi(display_width)
	lw	a5,%lo(display_width)(a5)
	sw	a5,-52(s0)
	lui	a5,%hi(display_height)
	lw	a5,%lo(display_height)(a5)
	sw	a5,-56(s0)
	lw	a5,-56(s0)
	srliw	a5,a5,2
	sw	a5,-60(s0)
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	puts
	sw	zero,-20(s0)
	j	.L70
.L73:
	sw	zero,-24(s0)
	j	.L71
.L72:
	lw	a5,-24(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,8
	subw	a5,a5,a4
	sext.w	a5,a5
	lw	a4,-52(s0)
	divuw	a5,a5,a4
	sext.w	a5,a5
	sb	a5,-75(s0)
	lw	a4,-24(s0)
	lw	a3,-20(s0)
	lbu	a5,-75(s0)
	sext.w	a5,a5
	slliw	a5,a5,16
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	set_pixel
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L71:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L72
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L70:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L73
	lui	a5,%hi(.LC26)
	addi	a0,a5,%lo(.LC26)
	call	puts
	lw	a5,-60(s0)
	sw	a5,-28(s0)
	j	.L74
.L77:
	sw	zero,-32(s0)
	j	.L75
.L76:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-60(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,8
	subw	a5,a5,a4
	sext.w	a5,a5
	lw	a4,-60(s0)
	divuw	a5,a5,a4
	sext.w	a5,a5
	sb	a5,-74(s0)
	lw	a4,-32(s0)
	lw	a3,-28(s0)
	lbu	a5,-74(s0)
	sext.w	a5,a5
	slliw	a5,a5,8
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	set_pixel
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
.L75:
	lw	a5,-32(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L76
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L74:
	lw	a5,-60(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-28(s0)
	sext.w	a4,a4
	bltu	a4,a5,.L77
	lui	a5,%hi(.LC27)
	addi	a0,a5,%lo(.LC27)
	call	puts
	lw	a5,-60(s0)
	slliw	a5,a5,1
	sw	a5,-36(s0)
	j	.L78
.L81:
	sw	zero,-40(s0)
	j	.L79
.L80:
	lw	a5,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,8
	subw	a5,a5,a4
	sext.w	a4,a5
	lw	a5,-60(s0)
	mv	a3,a5
	mv	a5,a3
	slliw	a5,a5,1
	addw	a5,a5,a3
	sext.w	a5,a5
	lw	a3,-52(s0)
	addw	a5,a3,a5
	sext.w	a5,a5
	divuw	a5,a4,a5
	sext.w	a5,a5
	sb	a5,-73(s0)
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	lbu	a3,-73(s0)
	sext.w	a3,a3
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	set_pixel
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L79:
	lw	a5,-40(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L80
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L78:
	lw	a5,-60(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,1
	addw	a5,a5,a4
	sext.w	a5,a5
	lw	a4,-36(s0)
	sext.w	a4,a4
	bltu	a4,a5,.L81
	lui	a5,%hi(.LC28)
	addi	a0,a5,%lo(.LC28)
	call	puts
	lw	a5,-52(s0)
	srliw	a5,a5,4
	sw	a5,-64(s0)
	lw	a5,-60(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,1
	addw	a5,a5,a4
	sw	a5,-44(s0)
	j	.L82
.L87:
	sw	zero,-48(s0)
	j	.L83
.L86:
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-64(s0)
	divuw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-44(s0)
	mv	a3,a5
	lw	a5,-64(s0)
	divuw	a5,a3,a5
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,1
	sw	a5,-68(s0)
	lw	a5,-68(s0)
	sext.w	a5,a5
	beq	a5,zero,.L84
	li	a5,16777216
	addi	a5,a5,-1
	j	.L85
.L84:
	li	a5,0
.L85:
	sw	a5,-72(s0)
	lw	a5,-48(s0)
	lw	a4,-44(s0)
	lw	a3,-72(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	set_pixel
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
.L83:
	lw	a5,-48(s0)
	mv	a4,a5
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L86
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L82:
	lw	a5,-44(s0)
	mv	a4,a5
	lw	a5,-56(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L87
	lui	a5,%hi(.LC29)
	addi	a0,a5,%lo(.LC29)
	call	puts
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	run_frame_buffer_test, .-run_frame_buffer_test
	.section	.rodata
	.align	3
.LC30:
	.string	"Rendering cool pattern..."
	.align	3
.LC31:
	.string	"Progress: %d0%%\n"
	.align	3
.LC32:
	.string	"Rendering complete!"
	.text
	.align	1
	.globl	draw_cool_pattern
	.type	draw_cool_pattern, @function
draw_cool_pattern:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	addi	s0,sp,112
	li	a0,0
	call	clear_screen
	lui	a5,%hi(.LC30)
	addi	a0,a5,%lo(.LC30)
	call	puts
	lui	a5,%hi(display_width)
	lw	a5,%lo(display_width)(a5)
	sw	a5,-36(s0)
	lui	a5,%hi(display_height)
	lw	a5,%lo(display_height)(a5)
	sw	a5,-40(s0)
	lw	a5,-36(s0)
	srliw	a5,a5,1
	sext.w	a5,a5
	sw	a5,-44(s0)
	lw	a5,-40(s0)
	srliw	a5,a5,1
	sext.w	a5,a5
	sw	a5,-48(s0)
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	mulw	a5,a4,a5
	sw	a5,-52(s0)
	sw	zero,-20(s0)
	li	a5,-1
	sw	a5,-24(s0)
	sw	zero,-28(s0)
	j	.L89
.L93:
	sw	zero,-32(s0)
	j	.L90
.L92:
	lw	a5,-44(s0)
	lw	a4,-32(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-56(s0)
	lw	a5,-48(s0)
	lw	a4,-28(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-60(s0)
	lw	a5,-56(s0)
	sraiw	a5,a5,31
	lw	a4,-56(s0)
	xor	a4,a5,a4
	subw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-60(s0)
	sraiw	a5,a5,31
	lw	a3,-60(s0)
	xor	a3,a5,a3
	subw	a5,a3,a5
	sext.w	a5,a5
	addw	a5,a4,a5
	sw	a5,-64(s0)
	lw	a5,-32(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,255
	sw	a5,-68(s0)
	lw	a5,-32(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	srliw	a5,a5,4
	sext.w	a5,a5
	sw	a5,-72(s0)
	lw	a5,-64(s0)
	andi	a5,a5,255
	sw	a5,-76(s0)
	lw	a5,-68(s0)
	mv	a4,a5
	lw	a5,-72(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-76(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a3,a5
	sext.w	a4,a3
	li	a5,1431654400
	addi	a5,a5,1366
	mul	a5,a4,a5
	srli	a5,a5,32
	sraiw	a4,a3,31
	subw	a5,a5,a4
	sw	a5,-80(s0)
	lw	a5,-80(s0)
	lw	a4,-32(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,255
	sw	a5,-84(s0)
	lw	a5,-80(s0)
	lw	a4,-28(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,255
	sw	a5,-88(s0)
	lw	a5,-80(s0)
	mv	a4,a5
	lw	a5,-64(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,255
	sw	a5,-92(s0)
	lw	a5,-84(s0)
	slliw	a5,a5,16
	sext.w	a4,a5
	lw	a5,-88(s0)
	slliw	a5,a5,8
	sext.w	a5,a5
	or	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-92(s0)
	or	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-96(s0)
	lw	a5,-32(s0)
	lw	a4,-28(s0)
	lw	a3,-96(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	set_pixel
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-52(s0)
	divuw	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-100(s0)
	lw	a5,-100(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	beq	a4,a5,.L91
	lw	a5,-100(s0)
	mv	a1,a5
	lui	a5,%hi(.LC31)
	addi	a0,a5,%lo(.LC31)
	call	printf
	lw	a5,-100(s0)
	sw	a5,-24(s0)
.L91:
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
.L90:
	lw	a5,-32(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L92
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L89:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L93
	lui	a5,%hi(.LC32)
	addi	a0,a5,%lo(.LC32)
	call	puts
	nop
	ld	ra,104(sp)
	ld	s0,96(sp)
	addi	sp,sp,112
	jr	ra
	.size	draw_cool_pattern, .-draw_cool_pattern
	.section	.rodata
	.align	2
.LC0:
	.word	1086918608
	.align	2
.LC1:
	.word	1078530000
	.align	2
.LC2:
	.word	-1068953648
	.align	2
.LC3:
	.word	1086324736
	.align	2
.LC4:
	.word	1101004800
	.align	2
.LC5:
	.word	1065353216
	.align	2
.LC6:
	.word	1070141433
	.align	2
.LC7:
	.word	1056964608
	.align	2
.LC8:
	.word	1069547520
	.align	2
.LC9:
	.word	786163455
	.align	2
.LC10:
	.word	1061752792
	.align	2
.LC11:
	.word	1075235810
	.align	2
.LC12:
	.word	1114636288
	.align	2
.LC13:
	.word	1073741824
	.align	2
.LC14:
	.word	1123024896
	.align	2
.LC15:
	.word	1127481344
	.align	2
.LC16:
	.word	1131413504
	.align	2
.LC17:
	.word	1133903872
	.align	2
.LC18:
	.word	1132396544
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
