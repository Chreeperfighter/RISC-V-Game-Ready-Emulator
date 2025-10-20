	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
# GNU C17 (g04696df09) version 14.2.0 (riscv64-unknown-elf)
#	compiled by GNU C version Apple LLVM 15.0.0 (clang-1500.3.9.4), GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPFR header version 4.2.1 differs from library version 4.2.2.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release" "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.align	1
	.globl	draw_rect
	.type	draw_rect, @function
draw_rect:
.LFB15:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 16 93
	.cfi_startproc
.LVL0:
	.loc 1 17 5
.LBB19:
	.loc 1 17 10
	.loc 1 17 23 discriminator 1
	ble	a3,zero,.L1	#, h,,
	mulw	t1,a5,a1	# ivtmp.31, width, ivtmp.30
.LBB20:
.LBB21:
.LBB22:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 24 is_stmt 0
	lui	a7,%hi(framebuffer)	# tmp157,
	ld	t4,%lo(framebuffer)(a7)		# framebuffer.2_3, framebuffer
	addw	t6,a3,a1	# ivtmp.30, tmp161, h
	addw	t3,a2,a0	# x, tmp174, w
.LVL1:
.L6:
.LBE22:
.LBE21:
	.loc 1 18 9 is_stmt 1
	.loc 1 19 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 12 is_stmt 0
	blt	a1,zero,.L3	#, ivtmp.30,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 20 discriminator 2
	bgt	a6,a1,.L10	#, height, ivtmp.30,
.L3:
.LBE20:
	.loc 1 17 29 is_stmt 1 discriminator 2
.LVL2:
	.loc 1 17 23 discriminator 1
	addiw	a1,a1,1	#, ivtmp.30, ivtmp.30
.LVL3:
	addw	t1,a5,t1	# ivtmp.31, ivtmp.31, width
	bne	a1,t6,.L6	#, ivtmp.30, tmp161,
.LVL4:
.L1:
.LBE19:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26: }
	.loc 1 26 1 is_stmt 0
	ret	
.LVL5:
.L10:
.LBB27:
.LBB26:
.LBB25:
	.loc 1 20 27 is_stmt 1 discriminator 1
	ble	a2,zero,.L3	#, w,,
	mv	a3,a0	# ivtmp.24, x
.LVL6:
.L5:
.LBB23:
	.loc 1 21 13
	.loc 1 22 13
	.loc 1 23 13
.LBE23:
	.loc 1 20 33 discriminator 2
	.loc 1 20 27 discriminator 1
.LBB24:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 36 is_stmt 0
	addw	a7,a3,t1	# ivtmp.31, tmp165, ivtmp.24
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 24
	slli	t5,a7,32	#, tmp182, tmp165
	srli	a7,t5,30	#, _9, tmp182
	add	a7,t4,a7	# _9, _10, framebuffer.2_3
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 16
	blt	a3,zero,.L4	#, ivtmp.24,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 24 discriminator 2
	ble	a5,a3,.L4	#, width, ivtmp.24,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42
	sw	a4,0(a7)	# color, *_10
.L4:
.LBE24:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:         for (int i = 0; i < w; i++) {
	.loc 1 20 27 discriminator 1
	addiw	a3,a3,1	#, ivtmp.24, ivtmp.24
.LVL7:
	bne	t3,a3,.L5	#, tmp174, ivtmp.24,
	j	.L3		#
.LBE25:
.LBE26:
.LBE27:
	.cfi_endproc
.LFE15:
	.size	draw_rect, .-draw_rect
	.align	1
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
.LFB16:
	.loc 1 29 68 is_stmt 1
	.cfi_startproc
.LVL8:
	.loc 1 30 5
.LBB28:
	.loc 1 30 10
	.loc 1 30 28 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:30:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 30 36 is_stmt 0 discriminator 1
	mulw	a1,a1,a2	# tmp145, tmp150, tmp151
.LVL9:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:30:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 30 28 discriminator 1
	beq	a1,zero,.L11	#, tmp145,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31:         framebuffer[i] = color;
	.loc 1 31 20
	lui	a5,%hi(framebuffer)	# tmp146,
	ld	a5,%lo(framebuffer)(a5)		# ivtmp.39, framebuffer
	slli	a4,a1,32	#, tmp152, tmp145
	srli	a1,a4,30	#, _20, tmp152
	add	a4,a1,a5	# ivtmp.39, _22, _20
.LVL10:
.L13:
	.loc 1 31 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31:         framebuffer[i] = color;
	.loc 1 31 24 is_stmt 0
	sw	a0,0(a5)	# color, *_4
	.loc 1 30 47 is_stmt 1 discriminator 3
.LVL11:
	.loc 1 30 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.39, ivtmp.39
.LVL12:
	bne	a5,a4,.L13	#, ivtmp.39, _22,
.LVL13:
.L11:
.LBE28:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:33: }
	.loc 1 33 1 is_stmt 0
	ret	
	.cfi_endproc
.LFE16:
	.size	clear_screen, .-clear_screen
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"Display width = %lu, height = %lu, ready = %lu\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB17:
	.loc 1 35 16 is_stmt 1
	.cfi_startproc
	.loc 1 36 5
.LBB59:
.LBB60:
	.file 2 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h"
	.loc 2 92 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:92:     return DISPLAY_WIDTH_REG;
	.loc 2 92 12 is_stmt 0
	li	a3,268435456		# tmp464,
	lw	a1,4(a3)		# MEM[(volatile uint32_t *)268435460B], MEM[(volatile uint32_t *)268435460B]
.LBE60:
.LBE59:
.LBB62:
.LBB63:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:96:     return DISPLAY_HEIGHT_REG;
	.loc 2 96 12
	lw	a2,8(a3)		# MEM[(volatile uint32_t *)268435464B], MEM[(volatile uint32_t *)268435464B]
.LBE63:
.LBE62:
.LBB66:
.LBB67:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:50:     DISPLAY_CTRL_REG |= DISPLAY_ENABLE;
	.loc 2 50 5
	lw	a4,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE67:
.LBE66:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:35: int main(void) {
	.loc 1 35 16
	addi	sp,sp,-96	#,,
	.cfi_def_cfa_offset 96
	sd	s0,80(sp)	#,
	sd	s1,72(sp)	#,
	sd	s6,32(sp)	#,
	sd	ra,88(sp)	#,
	sd	s2,64(sp)	#,
	sd	s3,56(sp)	#,
	sd	s4,48(sp)	#,
	sd	s5,40(sp)	#,
	sd	s7,24(sp)	#,
	sd	s8,16(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 22, -64
	.cfi_offset 1, -8
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	.cfi_offset 24, -80
.LBB70:
.LBB68:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:50:     DISPLAY_CTRL_REG |= DISPLAY_ENABLE;
	.loc 2 50 22
	ori	a4,a4,1	#, _86, MEM[(volatile uint32_t *)268435456B]
	sw	a4,0(a3)	# _86, MEM[(volatile uint32_t *)268435456B]
.LBE68:
.LBE70:
.LBB71:
.LBB72:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:60:     DISPLAY_CTRL_REG |= DISPLAY_AUTO_REFRESH;
	.loc 2 60 5
	lw	a4,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE72:
.LBE71:
.LBB75:
.LBB64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:96:     return DISPLAY_HEIGHT_REG;
	.loc 2 96 12
	sext.w	a2,a2	# _87, MEM[(volatile uint32_t *)268435464B]
.LBE64:
.LBE75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:41:     printf("Display width = %lu, height = %lu, ready = %lu\n", width, height, ready);
	.loc 1 41 5
	sd	a2,8(sp)	# _87, %sfp
.LBB76:
.LBB73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:60:     DISPLAY_CTRL_REG |= DISPLAY_AUTO_REFRESH;
	.loc 2 60 22
	ori	a4,a4,8	#, _84, MEM[(volatile uint32_t *)268435456B]
	sw	a4,0(a3)	# _84, MEM[(volatile uint32_t *)268435456B]
.LBE73:
.LBE76:
.LBB77:
.LBB78:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:75:     return (DISPLAY_CTRL_REG & DISPLAY_READY) != 0;
	.loc 2 75 13
	lw	a5,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE78:
.LBE77:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:41:     printf("Display width = %lu, height = %lu, ready = %lu\n", width, height, ready);
	.loc 1 41 5
	lui	a0,%hi(.LC2)	# tmp258,
.LBB81:
.LBB61:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:92:     return DISPLAY_WIDTH_REG;
	.loc 2 92 12
	sext.w	a1,a1	# _88, MEM[(volatile uint32_t *)268435460B]
.LVL14:
.LBE61:
.LBE81:
	.loc 1 37 5 is_stmt 1
.LBB82:
.LBB65:
	.loc 2 96 5
.LBE65:
.LBE82:
	.loc 1 38 5
.LBB83:
.LBB69:
	.loc 2 50 5
.LBE69:
.LBE83:
	.loc 1 39 5
.LBB84:
.LBB74:
	.loc 2 60 5
.LBE74:
.LBE84:
	.loc 1 40 5
.LBB85:
.LBB79:
	.loc 2 75 5
.LBE79:
.LBE85:
	.loc 1 41 5
.LBB86:
.LBB80:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:75:     return (DISPLAY_CTRL_REG & DISPLAY_READY) != 0;
	.loc 2 75 47 is_stmt 0
	srli	a5,a5,2	#, tmp254, MEM[(volatile uint32_t *)268435456B]
.LVL15:
.LBE80:
.LBE86:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:41:     printf("Display width = %lu, height = %lu, ready = %lu\n", width, height, ready);
	.loc 1 41 5
	andi	a3,a5,1	#,, tmp254
	addi	a0,a0,%lo(.LC2)	#, tmp258,
	sd	a1,0(sp)	# _88, %sfp
	call	printf		#
.LVL16:
	.loc 1 44 5 is_stmt 1
.LBB87:
.LBB88:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:30:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 30 36 is_stmt 0 discriminator 1
	ld	a1,0(sp)		# _88, %sfp
	ld	a2,8(sp)		# _87, %sfp
.LBE88:
.LBE87:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     float ball_dy = SPEED;
	.loc 1 53 11
	lui	a5,%hi(.LC0)	# tmp400,
	flw	fa3,%lo(.LC0)(a5)	# ball_dy,
.LBB92:
.LBB89:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:30:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 30 36 discriminator 1
	mulw	t0,a2,a1	# tmp268, _87, _88
.LBE89:
.LBE92:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:44:     int paddle1_y = height / 2 - PADDLE_HEIGHT / 2;
	.loc 1 44 28
	srliw	t3,a2,1	# tmp260, _87,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:51:     float ball_y = height / 2;
	.loc 1 51 11
	fcvt.s.w	fa5,t3	# ball_y, tmp260
.LBB93:
.LBB90:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31:         framebuffer[i] = color;
	.loc 1 31 20
	lui	a5,%hi(framebuffer)	# tmp269,
	ld	a3,%lo(framebuffer)(a5)		# framebuffer.5_89, framebuffer
.LBE90:
.LBE93:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     int paddle2_x = width - 10 - PADDLE_WIDTH;
	.loc 1 47 32
	addiw	t5,a1,-20	#, tmp264, _88
	lui	a5,%hi(.LC1)	# tmp403,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }
	.loc 1 80 34
	addiw	s0,a2,-10	#, tmp405, _87
	lui	a4,%hi(.LC3)	# tmp404,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     float ball_x = width / 2;
	.loc 1 50 26
	srliw	a0,a1,1	# tmp266, _88,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:85:             ball_dx = -ball_dx;
	.loc 1 85 21
	flw	ft5,%lo(.LC1)(a5)	# _101,
	fcvt.w.s s6,fa5,rtz	# _156, ball_y
	slli	a5,t0,32	#, tmp466, tmp268
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 32
	fcvt.s.w	ft4,t5	# _79, tmp264
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }
	.loc 1 80 20
	fcvt.s.w	ft3,s0	# _169, tmp405
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:52:     float ball_dx = SPEED;
	.loc 1 52 11
	fmv.s	fa1,fa3	# ball_dx, ball_dy
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 12
	fmv.s	ft2,fa3	# tmp312, ball_dy
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 58 discriminator 1
	flw	fa0,%lo(.LC3)(a4)	# tmp447,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         if (ball_dx < 0) {
	.loc 1 59 12
	fmv.s.x	ft0,zero	# tmp277,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     float ball_x = width / 2;
	.loc 1 50 11
	fcvt.s.w	fa4,a0	# ball_x, tmp266
	srli	t4,a5,30	#, _230, tmp466
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:44:     int paddle1_y = height / 2 - PADDLE_HEIGHT / 2;
	.loc 1 44 32
	addiw	t3,t3,-40	#, paddle1_y, tmp260
.LVL17:
	.loc 1 45 5 is_stmt 1
	.loc 1 46 5
	.loc 1 47 5
	.loc 1 50 5
	.loc 1 51 5
	.loc 1 52 5
	.loc 1 53 5
.LBB94:
.LBB95:
.LBB96:
.LBB97:
.LBB98:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42 is_stmt 0
	li	a0,16777216		# tmp442,
	add	t4,t4,a3	# framebuffer.5_89, _232, _230
.LBE98:
.LBE97:
.LBE96:
.LBE95:
.LBE94:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:45:     int paddle2_y = height / 2 - PADDLE_HEIGHT / 2;
	.loc 1 45 9
	mv	t1,t3	# paddle2_y, paddle1_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:70:         if (paddle1_y > (int)height - PADDLE_HEIGHT) paddle1_y = height - PADDLE_HEIGHT;
	.loc 1 70 23
	addiw	t6,a2,-79	#, tmp271, _87
	addiw	t2,a2,-80	#, tmp397, _87
	addiw	s1,a1,-30	#, tmp401, _88
	addiw	a7,a1,-10	#, tmp406, _88
.LBB110:
.LBB107:
.LBB104:
.LBB102:
.LBB99:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42
	addi	a0,a0,-1	#, tmp443, tmp442
.LBE99:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:         for (int i = 0; i < w; i++) {
	.loc 1 20 27 discriminator 1
	li	a6,20		# tmp444,
.LVL18:
.L56:
.LBE102:
.LBE104:
.LBE107:
.LBE110:
	.loc 1 55 5 is_stmt 1
	.loc 1 56 9
.LBB111:
	.loc 1 30 5
.LBB91:
	.loc 1 30 10
	.loc 1 30 28 discriminator 1
	mv	a5,a3	# ivtmp.104, framebuffer.5_89
	beq	t0,zero,.L22	#, tmp268,,
.LVL19:
.L19:
	.loc 1 31 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31:         framebuffer[i] = color;
	.loc 1 31 24 is_stmt 0
	sw	zero,0(a5)	#, *_93
	.loc 1 30 47 is_stmt 1 discriminator 3
.LVL20:
	.loc 1 30 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.104, ivtmp.104
.LVL21:
	bne	a5,t4,.L19	#, ivtmp.104, _232,
.LVL22:
.L22:
.LBE91:
.LBE111:
	.loc 1 59 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         if (ball_dx < 0) {
	.loc 1 59 12 is_stmt 0
	flt.s	a5,fa1,ft0	#, tmp278, ball_dx, tmp277
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:60:             if (paddle1_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle1_y += SPEED;
	.loc 1 60 47
	sext.w	s6,s6	# _156, _156
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         if (ball_dx < 0) {
	.loc 1 59 12
	bne	a5,zero,.L20	#, tmp278,,
	.loc 1 64 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:64:             if (paddle2_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle2_y += SPEED;
	.loc 1 64 27 is_stmt 0
	addiw	a5,t1,40	#, tmp290, paddle2_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:64:             if (paddle2_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle2_y += SPEED;
	.loc 1 64 16
	bge	a5,s6,.L25	#, tmp290, _156,
	.loc 1 64 60 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:64:             if (paddle2_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle2_y += SPEED;
	.loc 1 64 70 is_stmt 0 discriminator 1
	addiw	t1,t1,20	#, paddle2_y, paddle2_y
.LVL23:
.L25:
	.loc 1 65 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:65:             if (paddle2_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle2_y -= SPEED;
	.loc 1 65 45 is_stmt 0
	addiw	a5,t1,39	#, tmp295, paddle2_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:65:             if (paddle2_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle2_y -= SPEED;
	.loc 1 65 16
	blt	a5,s6,.L24	#, tmp295, _156,
	.loc 1 65 60 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:65:             if (paddle2_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle2_y -= SPEED;
	.loc 1 65 70 is_stmt 0 discriminator 1
	addiw	t1,t1,-20	#, paddle2_y, paddle2_y
.LVL24:
.L24:
	.loc 1 69 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:69:         if (paddle1_y < 0) paddle1_y = 0;
	.loc 1 69 12 is_stmt 0
	mv	a5,t3	# _7, paddle1_y
	bge	t3,zero,.L26	#, paddle1_y,,
	li	a5,0		# _7,
.L26:
	sext.w	t3,a5	# paddle1_y, _7
.LVL25:
	.loc 1 70 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:70:         if (paddle1_y > (int)height - PADDLE_HEIGHT) paddle1_y = height - PADDLE_HEIGHT;
	.loc 1 70 12 is_stmt 0
	blt	t3,t6,.L27	#, paddle1_y, tmp271,
	.loc 1 70 54 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:70:         if (paddle1_y > (int)height - PADDLE_HEIGHT) paddle1_y = height - PADDLE_HEIGHT;
	.loc 1 70 64 is_stmt 0 discriminator 1
	mv	t3,t2	# paddle1_y, tmp397
.L27:
.LVL26:
	.loc 1 71 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:71:         if (paddle2_y < 0) paddle2_y = 0;
	.loc 1 71 12 is_stmt 0
	mv	a5,t1	# _3, paddle2_y
	bge	t1,zero,.L28	#, paddle2_y,,
	li	a5,0		# _3,
.L28:
	sext.w	t1,a5	# paddle2_y, _3
.LVL27:
	.loc 1 72 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:72:         if (paddle2_y > (int)height - PADDLE_HEIGHT) paddle2_y = height - PADDLE_HEIGHT;
	.loc 1 72 12 is_stmt 0
	blt	t1,t6,.L29	#, paddle2_y, tmp271,
	.loc 1 72 54 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:72:         if (paddle2_y > (int)height - PADDLE_HEIGHT) paddle2_y = height - PADDLE_HEIGHT;
	.loc 1 72 64 is_stmt 0 discriminator 1
	mv	t1,t2	# paddle2_y, tmp397
.L29:
.LVL28:
	.loc 1 75 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:76:         ball_y += ball_dy;
	.loc 1 76 16 is_stmt 0
	fadd.s	fa5,fa5,fa3	# ball_y, ball_y, ball_dy
.LVL29:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:75:         ball_x += ball_dx;
	.loc 1 75 16
	fadd.s	fa4,fa4,fa1	# ball_x, ball_x, ball_dx
.LVL30:
	.loc 1 76 9 is_stmt 1
	.loc 1 79 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:         if (ball_y < 0) { ball_y = 0; ball_dy = -ball_dy; }
	.loc 1 79 12 is_stmt 0
	flt.s	a5,fa5,ft0	#, tmp308, ball_y, tmp277
	beq	a5,zero,.L30	#, tmp308,,
	.loc 1 79 27 is_stmt 1 discriminator 1
.LVL31:
	.loc 1 79 39
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:         if (ball_y < 0) { ball_y = 0; ball_dy = -ball_dy; }
	.loc 1 79 47 is_stmt 0 discriminator 1
	fneg.s	fa3,fa3	# ball_dy, ball_dy
.LVL32:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:         if (ball_y < 0) { ball_y = 0; ball_dy = -ball_dy; }
	.loc 1 79 34 discriminator 1
	fmv.s.x	fa5,zero	# ball_y,
.LVL33:
.L30:
	.loc 1 80 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }
	.loc 1 80 12 is_stmt 0
	fgt.s	a5,fa5,ft3	#, tmp309, ball_y, _169
	beq	a5,zero,.L32	#, tmp309,,
	.loc 1 80 49 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }
	.loc 1 80 86 is_stmt 0 discriminator 1
	fneg.s	fa3,fa3	# ball_dy, ball_dy
.LVL34:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (ball_y > (int)height - BALL_SIZE) { ball_y = height - BALL_SIZE; ball_dy = -ball_dy; }
	.loc 1 80 56 discriminator 1
	fcvt.s.wu	fa5,s0	# ball_y, tmp405
.LVL35:
	.loc 1 80 78 is_stmt 1
.L32:
	.loc 1 83 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 12 is_stmt 0
	fle.s	a5,fa4,ft2	#, tmp314, ball_x, tmp312
	beq	a5,zero,.L78	#, tmp314,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 58 discriminator 1
	fadd.s	fa2,fa5,fa0	# _21, ball_y, tmp447
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 70 discriminator 1
	fcvt.s.w	ft1,t3	# _22, paddle1_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 48 discriminator 1
	fge.s	a5,fa2,ft1	#, tmp321, _21, _22
	beq	a5,zero,.L78	#, tmp321,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 106 discriminator 2
	addiw	s6,t3,80	#, tmp398, paddle1_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 93 discriminator 2
	fcvt.s.w	fa2,s6	# _24, tmp398
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (ball_x <= paddle1_x + PADDLE_WIDTH && ball_y + BALL_SIZE >= paddle1_y && ball_y <= paddle1_y + PADDLE_HEIGHT) {
	.loc 1 83 83 discriminator 2
	fge.s	a5,fa2,fa5	#, tmp327, _24, ball_y
	bne	a5,zero,.L37	#, tmp327,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 20
	fadd.s	fa2,fa4,fa0	# _101, ball_x, tmp447
.LVL36:
.L35:
	.loc 1 87 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 12 is_stmt 0
	fle.s	a5,ft4,fa2	#, tmp330, _79, _101
	addiw	s4,t1,80	#, tmp399, paddle2_y
	beq	a5,zero,.L38	#, tmp330,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 55 discriminator 1
	fadd.s	fa2,fa5,fa0	# _27, ball_y, tmp447
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 67 discriminator 1
	fcvt.s.w	ft1,t1	# _28, paddle2_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 103 discriminator 2
	addiw	s4,t1,80	#, tmp399, paddle2_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 45 discriminator 1
	fge.s	a5,fa2,ft1	#, tmp335, _27, _28
	beq	a5,zero,.L38	#, tmp335,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 90 discriminator 2
	fcvt.s.w	fa2,s4	# _30, tmp399
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 80 discriminator 2
	fge.s	a5,fa2,fa5	#, tmp339, _30, ball_y
	beq	a5,zero,.L38	#, tmp339,,
	.loc 1 88 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:             ball_dx = -ball_dx;
	.loc 1 89 21 is_stmt 0
	fneg.s	fa1,fa1	# ball_dx, ball_dx
.LVL37:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:88:             ball_x = paddle2_x - BALL_SIZE;
	.loc 1 88 20
	fcvt.s.w	fa4,s1	# ball_x, tmp401
.LVL38:
	.loc 1 89 13 is_stmt 1
.L38:
	.loc 1 93 9
.LBB112:
	.loc 1 17 5
.LBB108:
	.loc 1 17 10
	.loc 1 17 23 discriminator 1
	mulw	s3,a1,t3	# ivtmp.100, _88, paddle1_y
	mv	s2,t3	# ivtmp.99, paddle1_y
.LVL39:
.L43:
.LBB105:
	.loc 1 18 9
	.loc 1 19 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 12 is_stmt 0
	blt	s2,zero,.L45	#, ivtmp.99,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 20 discriminator 2
	bgt	a2,s2,.L79	#, _87, ivtmp.99,
.L45:
.LBE105:
	.loc 1 17 29 is_stmt 1 discriminator 2
.LVL40:
	.loc 1 17 23 discriminator 1
	addiw	s2,s2,1	#, ivtmp.99, ivtmp.99
.LVL41:
	addw	s3,a1,s3	# ivtmp.100, ivtmp.100, _88
	bne	s2,s6,.L43	#, ivtmp.99, tmp398,
	mv	s2,t1	# ivtmp.82, paddle2_y
	mulw	s3,a1,t1	# ivtmp.83, _88, paddle2_y
.LVL42:
.L49:
.LBE108:
.LBE112:
.LBB113:
.LBB114:
.LBB115:
	.loc 1 18 9
	.loc 1 19 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 12 is_stmt 0
	blt	s2,zero,.L51	#, ivtmp.82,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 20 discriminator 2
	bgt	a2,s2,.L80	#, _87, ivtmp.82,
.L51:
.LBE115:
	.loc 1 17 29 is_stmt 1 discriminator 2
.LVL43:
	.loc 1 17 23 discriminator 1
	addiw	s2,s2,1	#, ivtmp.82, ivtmp.82
.LVL44:
	addw	s3,a1,s3	# ivtmp.83, ivtmp.83, _88
	bne	s2,s4,.L49	#, ivtmp.82, tmp399,
.LVL45:
.LBE114:
.LBE113:
	.loc 1 97 9
	fcvt.w.s s6,fa5,rtz	# _156, ball_y
	fcvt.w.s s4,fa4,rtz	# _32, ball_x
	sext.w	s2,s6	# ivtmp.64, _156
	mulw	s3,s6,a1	# ivtmp.65, _156, _88
	sext.w	s8,s4	# _32, _32
.LVL46:
.LBB121:
	.loc 1 17 5
.LBB122:
	.loc 1 17 10
	.loc 1 17 23 discriminator 1
	addiw	s7,s6,10	#, tmp382, _156
	addiw	s4,s4,10	#, tmp429, _32
.LVL47:
.L55:
.LBB123:
	.loc 1 18 9
	.loc 1 19 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 12 is_stmt 0
	blt	s2,zero,.L57	#, ivtmp.64,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 20 discriminator 2
	blt	s2,a2,.L81	#, ivtmp.64, _87,
.L57:
.LBE123:
	.loc 1 17 29 is_stmt 1 discriminator 2
.LVL48:
	.loc 1 17 23 discriminator 1
	addiw	s2,s2,1	#, ivtmp.64, ivtmp.64
.LVL49:
	addw	s3,a1,s3	# ivtmp.65, ivtmp.65, _88
	bne	s7,s2,.L55	#, tmp382, ivtmp.64,
	j	.L56		#
.LVL50:
.L80:
.LBE122:
.LBE121:
.LBB129:
.LBB120:
.LBB119:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:         if (yy < 0 || yy >= (int)height) continue;
	.loc 1 19 20 is_stmt 0 discriminator 2
	mv	a5,t5	# ivtmp.72, tmp264
.L53:
.LVL51:
.LBB116:
.LBB117:
	.loc 1 21 13 is_stmt 1
	.loc 1 22 13
	.loc 1 23 13
.LBE117:
	.loc 1 20 33 discriminator 2
	.loc 1 20 27 discriminator 1
.LBB118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 36 is_stmt 0
	addw	a4,a5,s3	# ivtmp.83, tmp370, ivtmp.72
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 24
	slli	s5,a4,32	#, tmp468, tmp370
	srli	a4,s5,30	#, _129, tmp468
	add	a4,a3,a4	# _129, _130, framebuffer.5_89
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 16
	blt	a5,zero,.L52	#, ivtmp.72,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 24 discriminator 2
	ble	a1,a5,.L52	#, _88, ivtmp.72,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42
	sw	a0,0(a4)	# tmp443, *_130
.L52:
.LBE118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:         for (int i = 0; i < w; i++) {
	.loc 1 20 27 discriminator 1
	addiw	a5,a5,1	#, ivtmp.72, ivtmp.72
.LVL52:
	bne	a5,a7,.L53	#, ivtmp.72, tmp406,
	j	.L51		#
.LVL53:
.L81:
	mv	a5,s8	# ivtmp.56, _32
.L59:
.LVL54:
.LBE116:
.LBE119:
.LBE120:
.LBE129:
.LBB130:
.LBB128:
.LBB127:
.LBB124:
.LBB125:
	.loc 1 21 13 is_stmt 1
	.loc 1 22 13
	.loc 1 23 13
.LBE125:
	.loc 1 20 33 discriminator 2
	.loc 1 20 27 discriminator 1
.LBB126:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 36 is_stmt 0
	addw	a4,s3,a5	# ivtmp.56, tmp390, ivtmp.65
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 24
	slli	s5,a4,32	#, tmp469, tmp390
	srli	a4,s5,30	#, _113, tmp469
	add	a4,a3,a4	# _113, _114, framebuffer.5_89
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 16
	blt	a5,zero,.L58	#, ivtmp.56,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 24 discriminator 2
	ble	a1,a5,.L58	#, _88, ivtmp.56,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42
	sw	a0,0(a4)	# tmp443, *_114
.L58:
.LBE126:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:         for (int i = 0; i < w; i++) {
	.loc 1 20 27 discriminator 1
	addiw	a5,a5,1	#, ivtmp.56, ivtmp.56
.LVL55:
	bne	s4,a5,.L59	#, tmp429, ivtmp.56,
	j	.L57		#
.LVL56:
.L79:
.LBE124:
.LBE127:
.LBE128:
.LBE130:
.LBB131:
.LBB109:
.LBB106:
.LBB103:
.LBB100:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 33 discriminator 2
	li	a4,10		# ivtmp.90,
.L47:
.LVL57:
	.loc 1 21 13 is_stmt 1
	.loc 1 22 13
	.loc 1 23 13
.LBE100:
	.loc 1 20 33 discriminator 2
	.loc 1 20 27 discriminator 1
.LBB101:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 36 is_stmt 0
	addw	a5,a4,s3	# ivtmp.100, tmp351, ivtmp.90
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 24
	slli	s5,a5,32	#, tmp467, tmp351
	srli	a5,s5,30	#, _145, tmp467
	add	a5,a3,a5	# _145, _146, framebuffer.5_89
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22:             if (xx < 0 || xx >= (int)width) continue;
	.loc 1 22 24 discriminator 2
	ble	a1,a4,.L46	#, _88, ivtmp.90,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:             framebuffer[yy * width + xx] = color;
	.loc 1 23 42
	sw	a0,0(a5)	# tmp443, *_146
.L46:
.LBE101:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:         for (int i = 0; i < w; i++) {
	.loc 1 20 27 discriminator 1
	addiw	a4,a4,1	#, ivtmp.90, ivtmp.90
.LVL58:
	bne	a4,a6,.L47	#, ivtmp.90, tmp444,
	j	.L45		#
.LVL59:
.L78:
.LBE103:
.LBE106:
.LBE109:
.LBE131:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:         if (ball_x + BALL_SIZE >= paddle2_x && ball_y + BALL_SIZE >= paddle2_y && ball_y <= paddle2_y + PADDLE_HEIGHT) {
	.loc 1 87 20
	fadd.s	fa2,fa4,fa0	# _101, ball_x, tmp447
	addiw	s6,t3,80	#, tmp398, paddle1_y
	j	.L35		#
.L20:
	.loc 1 60 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:60:             if (paddle1_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle1_y += SPEED;
	.loc 1 60 27 is_stmt 0
	addiw	a5,t3,40	#, tmp280, paddle1_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:60:             if (paddle1_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle1_y += SPEED;
	.loc 1 60 16
	bge	a5,s6,.L23	#, tmp280, _156,
	.loc 1 60 60 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:60:             if (paddle1_y + PADDLE_HEIGHT/2 < (int)ball_y) paddle1_y += SPEED;
	.loc 1 60 70 is_stmt 0 discriminator 1
	addiw	t3,t3,20	#, paddle1_y, paddle1_y
.LVL60:
.L23:
	.loc 1 61 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:61:             if (paddle1_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle1_y -= SPEED;
	.loc 1 61 45 is_stmt 0
	addiw	a5,t3,39	#, tmp285, paddle1_y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:61:             if (paddle1_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle1_y -= SPEED;
	.loc 1 61 16
	blt	a5,s6,.L24	#, tmp285, _156,
	.loc 1 61 60 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:61:             if (paddle1_y + PADDLE_HEIGHT/2 > (int)ball_y) paddle1_y -= SPEED;
	.loc 1 61 70 is_stmt 0 discriminator 1
	addiw	t3,t3,-20	#, paddle1_y, paddle1_y
.LVL61:
	j	.L24		#
.L37:
	.loc 1 84 13 is_stmt 1
.LVL62:
	.loc 1 85 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:85:             ball_dx = -ball_dx;
	.loc 1 85 21 is_stmt 0
	fneg.s	fa1,fa1	# ball_dx, ball_dx
.LVL63:
	fmv.s	fa2,ft5	# _101, _101
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:84:             ball_x = paddle1_x + PADDLE_WIDTH;
	.loc 1 84 20
	fmv.s	fa4,ft2	# ball_x, tmp312
	j	.L35		#
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.globl	framebuffer
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1101004800
	.align	2
.LC1:
	.word	1106247680
	.align	2
.LC3:
	.word	1092616192
	.section	.sdata,"aw"
	.align	3
	.type	framebuffer, @object
	.size	framebuffer, 8
framebuffer:
	.dword	285212672
	.text
.Letext0:
	.file 3 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x617
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL66
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x16
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x11
	.4byte	.LASF9
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x59
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x11
	.4byte	.LASF10
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x4d
	.uleb128 0x17
	.4byte	0x6e
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x18
	.4byte	0x8d
	.uleb128 0x12
	.4byte	0x94
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x19
	.4byte	.LASF36
	.byte	0x1
	.byte	0xd
	.byte	0x14
	.4byte	0xbb
	.uleb128 0x9
	.byte	0x3
	.8byte	framebuffer
	.uleb128 0x12
	.4byte	0x7a
	.uleb128 0x1a
	.4byte	.LASF37
	.byte	0x5
	.byte	0xce
	.byte	0x5
	.4byte	0x46
	.4byte	0xd7
	.uleb128 0x1b
	.4byte	0x99
	.uleb128 0x1c
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF38
	.byte	0x1
	.byte	0x23
	.byte	0x5
	.4byte	0x46
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x44a
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x24
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST12
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x25
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST13
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x28
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST14
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x2c
	.byte	0x9
	.4byte	0x46
	.4byte	.LLST15
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x2d
	.byte	0x9
	.4byte	0x46
	.4byte	.LLST16
	.uleb128 0x1e
	.4byte	.LASF20
	.byte	0x1
	.byte	0x2e
	.byte	0x9
	.4byte	0x46
	.byte	0xa
	.uleb128 0x1f
	.4byte	.LASF21
	.byte	0x1
	.byte	0x2f
	.byte	0x9
	.4byte	0x46
	.uleb128 0x1
	.byte	0x6e
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x32
	.byte	0xb
	.4byte	0x44a
	.4byte	.LLST17
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x33
	.byte	0xb
	.4byte	0x44a
	.4byte	.LLST18
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x34
	.byte	0xb
	.4byte	0x44a
	.4byte	.LLST19
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x35
	.byte	0xb
	.4byte	0x44a
	.4byte	.LLST20
	.uleb128 0x9
	.4byte	0x50d
	.8byte	.LBB59
	.4byte	.LLRL21
	.byte	0x24
	.byte	0x16
	.uleb128 0x9
	.4byte	0x502
	.8byte	.LBB62
	.4byte	.LLRL22
	.byte	0x25
	.byte	0x17
	.uleb128 0x9
	.4byte	0x529
	.8byte	.LBB66
	.4byte	.LLRL23
	.byte	0x26
	.byte	0x5
	.uleb128 0x9
	.4byte	0x523
	.8byte	.LBB71
	.4byte	.LLRL24
	.byte	0x27
	.byte	0x5
	.uleb128 0x9
	.4byte	0x518
	.8byte	.LBB77
	.4byte	.LLRL25
	.byte	0x28
	.byte	0x16
	.uleb128 0xc
	.4byte	0x451
	.8byte	.LBB87
	.4byte	.LLRL26
	.byte	0x38
	.4byte	0x23f
	.uleb128 0x1
	.4byte	0x45b
	.4byte	.LLST27
	.uleb128 0x1
	.4byte	0x466
	.4byte	.LLST28
	.uleb128 0x1
	.4byte	0x471
	.4byte	.LLST29
	.uleb128 0x3
	.4byte	0x47c
	.4byte	.LLRL26
	.uleb128 0x2
	.4byte	0x47d
	.4byte	.LLST30
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x488
	.8byte	.LBB94
	.4byte	.LLRL31
	.byte	0x5d
	.4byte	0x2e1
	.uleb128 0x1
	.4byte	0x492
	.4byte	.LLST32
	.uleb128 0x1
	.4byte	0x49a
	.4byte	.LLST33
	.uleb128 0x1
	.4byte	0x4a2
	.4byte	.LLST32
	.uleb128 0x1
	.4byte	0x4aa
	.4byte	.LLST35
	.uleb128 0x1
	.4byte	0x4b2
	.4byte	.LLST36
	.uleb128 0x1
	.4byte	0x4bd
	.4byte	.LLST37
	.uleb128 0x1
	.4byte	0x4c8
	.4byte	.LLST38
	.uleb128 0x3
	.4byte	0x4d3
	.4byte	.LLRL31
	.uleb128 0x2
	.4byte	0x4d4
	.4byte	.LLST39
	.uleb128 0x3
	.4byte	0x4dd
	.4byte	.LLRL40
	.uleb128 0x2
	.4byte	0x4de
	.4byte	.LLST41
	.uleb128 0x3
	.4byte	0x4e8
	.4byte	.LLRL42
	.uleb128 0x2
	.4byte	0x4e9
	.4byte	.LLST43
	.uleb128 0x3
	.4byte	0x4f2
	.4byte	.LLRL44
	.uleb128 0x2
	.4byte	0x4f3
	.4byte	.LLST45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x488
	.8byte	.LBB113
	.4byte	.LLRL46
	.byte	0x5e
	.4byte	0x373
	.uleb128 0x6
	.4byte	0x492
	.uleb128 0x6
	.4byte	0x49a
	.uleb128 0x6
	.4byte	0x4a2
	.uleb128 0x6
	.4byte	0x4aa
	.uleb128 0x6
	.4byte	0x4b2
	.uleb128 0x6
	.4byte	0x4bd
	.uleb128 0x6
	.4byte	0x4c8
	.uleb128 0x3
	.4byte	0x4d3
	.4byte	.LLRL46
	.uleb128 0x2
	.4byte	0x4d4
	.4byte	.LLST47
	.uleb128 0x3
	.4byte	0x4dd
	.4byte	.LLRL48
	.uleb128 0x2
	.4byte	0x4de
	.4byte	.LLST49
	.uleb128 0xe
	.4byte	0x4e8
	.8byte	.LBB116
	.8byte	.LBE116-.LBB116
	.uleb128 0x2
	.4byte	0x4e9
	.4byte	.LLST50
	.uleb128 0x3
	.4byte	0x4f2
	.4byte	.LLRL51
	.uleb128 0x2
	.4byte	0x4f3
	.4byte	.LLST52
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x488
	.8byte	.LBB121
	.4byte	.LLRL53
	.byte	0x61
	.4byte	0x41d
	.uleb128 0x6
	.4byte	0x492
	.uleb128 0x1
	.4byte	0x49a
	.4byte	.LLST54
	.uleb128 0x1
	.4byte	0x4a2
	.4byte	.LLST55
	.uleb128 0x1
	.4byte	0x4aa
	.4byte	.LLST55
	.uleb128 0x1
	.4byte	0x4b2
	.4byte	.LLST57
	.uleb128 0x1
	.4byte	0x4bd
	.4byte	.LLST58
	.uleb128 0x1
	.4byte	0x4c8
	.4byte	.LLST59
	.uleb128 0x3
	.4byte	0x4d3
	.4byte	.LLRL53
	.uleb128 0x2
	.4byte	0x4d4
	.4byte	.LLST60
	.uleb128 0x3
	.4byte	0x4dd
	.4byte	.LLRL61
	.uleb128 0x2
	.4byte	0x4de
	.4byte	.LLST62
	.uleb128 0xe
	.4byte	0x4e8
	.8byte	.LBB124
	.8byte	.LBE124-.LBB124
	.uleb128 0x2
	.4byte	0x4e9
	.4byte	.LLST63
	.uleb128 0x3
	.4byte	0x4f2
	.4byte	.LLRL64
	.uleb128 0x2
	.4byte	0x4f3
	.4byte	.LLST65
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.8byte	.LVL16
	.4byte	0xc0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC2
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x4
	.byte	0x72
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0x91
	.sleb128 -88
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.4byte	.LASF26
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1d
	.4byte	0x488
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1d
	.byte	0x1c
	.4byte	0x6e
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x1d
	.byte	0x2c
	.4byte	0x6e
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1d
	.byte	0x3c
	.4byte	0x6e
	.uleb128 0xa
	.uleb128 0xb
	.string	"i"
	.byte	0x1e
	.byte	0x13
	.4byte	0x6e
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x10
	.4byte	0x502
	.uleb128 0xd
	.string	"x"
	.byte	0x14
	.4byte	0x46
	.uleb128 0xd
	.string	"y"
	.byte	0x1b
	.4byte	0x46
	.uleb128 0xd
	.string	"w"
	.byte	0x22
	.4byte	0x46
	.uleb128 0xd
	.string	"h"
	.byte	0x29
	.4byte	0x46
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x10
	.byte	0x35
	.4byte	0x6e
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x10
	.byte	0x45
	.4byte	0x6e
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x10
	.byte	0x55
	.4byte	0x6e
	.uleb128 0xa
	.uleb128 0xb
	.string	"j"
	.byte	0x11
	.byte	0xe
	.4byte	0x46
	.uleb128 0xa
	.uleb128 0xb
	.string	"yy"
	.byte	0x12
	.byte	0xd
	.4byte	0x46
	.uleb128 0xa
	.uleb128 0xb
	.string	"i"
	.byte	0x14
	.byte	0x12
	.4byte	0x46
	.uleb128 0xa
	.uleb128 0xb
	.string	"xx"
	.byte	0x15
	.byte	0x11
	.4byte	0x46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x5f
	.byte	0x18
	.4byte	0x6e
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0x5b
	.byte	0x18
	.4byte	0x6e
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x4a
	.byte	0x13
	.4byte	0x46
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x3b
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x31
	.uleb128 0x21
	.4byte	0x488
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5cc
	.uleb128 0x7
	.4byte	0x492
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x49a
	.4byte	.LLST0
	.uleb128 0x7
	.4byte	0x4a2
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x1
	.4byte	0x4aa
	.4byte	.LLST1
	.uleb128 0x7
	.4byte	0x4b2
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x7
	.4byte	0x4bd
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x7
	.4byte	0x4c8
	.uleb128 0x1
	.byte	0x60
	.uleb128 0x3
	.4byte	0x4d3
	.4byte	.LLRL2
	.uleb128 0x2
	.4byte	0x4d4
	.4byte	.LLST3
	.uleb128 0x3
	.4byte	0x4dd
	.4byte	.LLRL4
	.uleb128 0x2
	.4byte	0x4de
	.4byte	.LLST5
	.uleb128 0x3
	.4byte	0x4e8
	.4byte	.LLRL6
	.uleb128 0x2
	.4byte	0x4e9
	.4byte	.LLST7
	.uleb128 0x3
	.4byte	0x4f2
	.4byte	.LLRL8
	.uleb128 0x2
	.4byte	0x4f3
	.4byte	.LLST9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	0x451
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	0x45b
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x466
	.4byte	.LLST10
	.uleb128 0x7
	.4byte	0x471
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0xe
	.4byte	0x47c
	.8byte	.LBB28
	.8byte	.LBE28-.LBB28
	.uleb128 0x2
	.4byte	0x47d
	.4byte	.LLST11
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 20
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST12:
	.byte	0x6
	.8byte	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL16-1-.LVL14
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL16-1-.LVL14
	.uleb128 .LFE17-.LVL14
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0
.LLST13:
	.byte	0x6
	.8byte	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL16-1-.LVL14
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL16-1-.LVL14
	.uleb128 .LFE17-.LVL14
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
.LLST14:
	.byte	0x8
	.8byte	.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0xd
	.byte	0x7f
	.sleb128 0
	.byte	0x34
	.byte	0x1a
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL25-.LVL17
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL26-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x1
	.byte	0x6c
	.byte	0
.LLST16:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL27-.LVL17
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL28-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST17:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL62-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0x4
	.uleb128 .LVL62-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x41a00000
	.byte	0
.LLST18:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL29-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL30-.LVL17
	.uleb128 .LVL31-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL31-.LVL17
	.uleb128 .LVL33-.LVL17
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0
	.byte	0x4
	.uleb128 .LVL33-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0
.LLST19:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x41a00000
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL37-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL38-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
.LLST20:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x41a00000
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL34-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2d
	.byte	0x4
	.uleb128 .LVL35-.LVL17
	.uleb128 .LFE17-.LVL17
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2d
	.byte	0
.LLST27:
	.byte	0x8
	.8byte	.LVL18
	.uleb128 .LVL22-.LVL18
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST28:
	.byte	0x8
	.8byte	.LVL18
	.uleb128 .LVL22-.LVL18
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST29:
	.byte	0x8
	.8byte	.LVL18
	.uleb128 .LVL22-.LVL18
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST30:
	.byte	0x6
	.8byte	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LVL20-.LVL18
	.uleb128 0x8
	.byte	0x7f
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL18
	.uleb128 .LVL21-.LVL18
	.uleb128 0xa
	.byte	0x7f
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL21-.LVL18
	.uleb128 .LVL22-.LVL18
	.uleb128 0xc
	.byte	0x7f
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LLST32:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST33:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x1
	.byte	0x6c
	.byte	0
.LLST35:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x3
	.byte	0x8
	.byte	0x50
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x3
	.byte	0x8
	.byte	0x50
	.byte	0x9f
	.byte	0
.LLST36:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x6
	.byte	0xc
	.4byte	0xffffff
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x6
	.byte	0xc
	.4byte	0xffffff
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST38:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL42-.LVL38
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST39:
	.byte	0x6
	.8byte	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL39-.LVL38
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL38
	.uleb128 .LVL41-.LVL38
	.uleb128 0x8
	.byte	0x82
	.sleb128 0
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL56-.LVL38
	.uleb128 .LVL59-.LVL38
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x6
	.8byte	.LVL39
	.byte	0x4
	.uleb128 .LVL39-.LVL39
	.uleb128 .LVL41-.LVL39
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL56-.LVL39
	.uleb128 .LVL59-.LVL39
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LLST43:
	.byte	0x8
	.8byte	.LVL57
	.uleb128 .LVL58-.LVL57
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -9
	.byte	0x9f
	.byte	0
.LLST45:
	.byte	0x8
	.8byte	.LVL57
	.uleb128 .LVL58-.LVL57
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST47:
	.byte	0x6
	.8byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x8
	.byte	0x82
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL42
	.uleb128 .LVL53-.LVL42
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST49:
	.byte	0x6
	.8byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL50-.LVL42
	.uleb128 .LVL53-.LVL42
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LLST50:
	.byte	0x8
	.8byte	.LVL51
	.uleb128 .LVL52-.LVL51
	.uleb128 0x8
	.byte	0x7f
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x15
	.byte	0x9f
	.byte	0
.LLST52:
	.byte	0x8
	.8byte	.LVL51
	.uleb128 .LVL52-.LVL51
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST54:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x1
	.byte	0x66
	.byte	0
.LLST55:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST57:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x6
	.byte	0xc
	.4byte	0xffffff
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x6
	.byte	0xc
	.4byte	0xffffff
	.byte	0x9f
	.byte	0
.LLST58:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST59:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL50-.LVL46
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST60:
	.byte	0x6
	.8byte	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL47-.LVL46
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL47-.LVL46
	.uleb128 .LVL48-.LVL46
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x86
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL46
	.uleb128 .LVL49-.LVL46
	.uleb128 0x8
	.byte	0x82
	.sleb128 0
	.byte	0x86
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LVL56-.LVL46
	.uleb128 0x6
	.byte	0x82
	.sleb128 0
	.byte	0x86
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST62:
	.byte	0x6
	.8byte	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL49-.LVL47
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL53-.LVL47
	.uleb128 .LVL56-.LVL47
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LLST63:
	.byte	0x8
	.8byte	.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x8
	.byte	0x7f
	.sleb128 0
	.byte	0x88
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LLST65:
	.byte	0x8
	.8byte	.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST0:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LFE15-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LFE15-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5d
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x7
	.byte	0x7b
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x9
	.byte	0x7b
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LFE15-.LVL0
	.uleb128 0x7
	.byte	0x7b
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.8byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL5-.LVL1
	.uleb128 .LFE15-.LVL1
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST7:
	.byte	0x6
	.8byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL5
	.uleb128 .LVL7-.LVL5
	.uleb128 0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x8
	.8byte	.LVL6
	.uleb128 .LVL7-.LVL6
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST10:
	.byte	0x6
	.8byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL9-.LVL8
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL9-.LVL8
	.uleb128 .LFE16-.LVL8
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x6
	.8byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x10
	.byte	0x7f
	.sleb128 0
	.byte	0x3
	.8byte	framebuffer
	.byte	0x6
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL8
	.uleb128 .LVL12-.LVL8
	.uleb128 0x12
	.byte	0x7f
	.sleb128 0
	.byte	0x3
	.8byte	framebuffer
	.byte	0x6
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL12-.LVL8
	.uleb128 .LVL13-.LVL8
	.uleb128 0x14
	.byte	0x7f
	.sleb128 0
	.byte	0x3
	.8byte	framebuffer
	.byte	0x6
	.byte	0x1c
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.8byte	0
	.8byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.LLRL2:
	.byte	0x5
	.8byte	.LBB19
	.byte	0x4
	.uleb128 .LBB19-.LBB19
	.uleb128 .LBE19-.LBB19
	.byte	0x4
	.uleb128 .LBB27-.LBB19
	.uleb128 .LBE27-.LBB19
	.byte	0
.LLRL4:
	.byte	0x5
	.8byte	.LBB20
	.byte	0x4
	.uleb128 .LBB20-.LBB20
	.uleb128 .LBE20-.LBB20
	.byte	0x4
	.uleb128 .LBB26-.LBB20
	.uleb128 .LBE26-.LBB20
	.byte	0
.LLRL6:
	.byte	0x5
	.8byte	.LBB21
	.byte	0x4
	.uleb128 .LBB21-.LBB21
	.uleb128 .LBE21-.LBB21
	.byte	0x4
	.uleb128 .LBB25-.LBB21
	.uleb128 .LBE25-.LBB21
	.byte	0
.LLRL8:
	.byte	0x5
	.8byte	.LBB22
	.byte	0x4
	.uleb128 .LBB22-.LBB22
	.uleb128 .LBE22-.LBB22
	.byte	0x4
	.uleb128 .LBB23-.LBB22
	.uleb128 .LBE23-.LBB22
	.byte	0x4
	.uleb128 .LBB24-.LBB22
	.uleb128 .LBE24-.LBB22
	.byte	0
.LLRL21:
	.byte	0x5
	.8byte	.LBB59
	.byte	0x4
	.uleb128 .LBB59-.LBB59
	.uleb128 .LBE59-.LBB59
	.byte	0x4
	.uleb128 .LBB81-.LBB59
	.uleb128 .LBE81-.LBB59
	.byte	0
.LLRL22:
	.byte	0x5
	.8byte	.LBB62
	.byte	0x4
	.uleb128 .LBB62-.LBB62
	.uleb128 .LBE62-.LBB62
	.byte	0x4
	.uleb128 .LBB75-.LBB62
	.uleb128 .LBE75-.LBB62
	.byte	0x4
	.uleb128 .LBB82-.LBB62
	.uleb128 .LBE82-.LBB62
	.byte	0
.LLRL23:
	.byte	0x5
	.8byte	.LBB66
	.byte	0x4
	.uleb128 .LBB66-.LBB66
	.uleb128 .LBE66-.LBB66
	.byte	0x4
	.uleb128 .LBB70-.LBB66
	.uleb128 .LBE70-.LBB66
	.byte	0x4
	.uleb128 .LBB83-.LBB66
	.uleb128 .LBE83-.LBB66
	.byte	0
.LLRL24:
	.byte	0x5
	.8byte	.LBB71
	.byte	0x4
	.uleb128 .LBB71-.LBB71
	.uleb128 .LBE71-.LBB71
	.byte	0x4
	.uleb128 .LBB76-.LBB71
	.uleb128 .LBE76-.LBB71
	.byte	0x4
	.uleb128 .LBB84-.LBB71
	.uleb128 .LBE84-.LBB71
	.byte	0
.LLRL25:
	.byte	0x5
	.8byte	.LBB77
	.byte	0x4
	.uleb128 .LBB77-.LBB77
	.uleb128 .LBE77-.LBB77
	.byte	0x4
	.uleb128 .LBB85-.LBB77
	.uleb128 .LBE85-.LBB77
	.byte	0x4
	.uleb128 .LBB86-.LBB77
	.uleb128 .LBE86-.LBB77
	.byte	0
.LLRL26:
	.byte	0x5
	.8byte	.LBB87
	.byte	0x4
	.uleb128 .LBB87-.LBB87
	.uleb128 .LBE87-.LBB87
	.byte	0x4
	.uleb128 .LBB92-.LBB87
	.uleb128 .LBE92-.LBB87
	.byte	0x4
	.uleb128 .LBB93-.LBB87
	.uleb128 .LBE93-.LBB87
	.byte	0x4
	.uleb128 .LBB111-.LBB87
	.uleb128 .LBE111-.LBB87
	.byte	0
.LLRL31:
	.byte	0x5
	.8byte	.LBB94
	.byte	0x4
	.uleb128 .LBB94-.LBB94
	.uleb128 .LBE94-.LBB94
	.byte	0x4
	.uleb128 .LBB110-.LBB94
	.uleb128 .LBE110-.LBB94
	.byte	0x4
	.uleb128 .LBB112-.LBB94
	.uleb128 .LBE112-.LBB94
	.byte	0x4
	.uleb128 .LBB131-.LBB94
	.uleb128 .LBE131-.LBB94
	.byte	0
.LLRL40:
	.byte	0x5
	.8byte	.LBB96
	.byte	0x4
	.uleb128 .LBB96-.LBB96
	.uleb128 .LBE96-.LBB96
	.byte	0x4
	.uleb128 .LBB104-.LBB96
	.uleb128 .LBE104-.LBB96
	.byte	0x4
	.uleb128 .LBB105-.LBB96
	.uleb128 .LBE105-.LBB96
	.byte	0x4
	.uleb128 .LBB106-.LBB96
	.uleb128 .LBE106-.LBB96
	.byte	0
.LLRL42:
	.byte	0x5
	.8byte	.LBB97
	.byte	0x4
	.uleb128 .LBB97-.LBB97
	.uleb128 .LBE97-.LBB97
	.byte	0x4
	.uleb128 .LBB102-.LBB97
	.uleb128 .LBE102-.LBB97
	.byte	0x4
	.uleb128 .LBB103-.LBB97
	.uleb128 .LBE103-.LBB97
	.byte	0
.LLRL44:
	.byte	0x5
	.8byte	.LBB98
	.byte	0x4
	.uleb128 .LBB98-.LBB98
	.uleb128 .LBE98-.LBB98
	.byte	0x4
	.uleb128 .LBB99-.LBB98
	.uleb128 .LBE99-.LBB98
	.byte	0x4
	.uleb128 .LBB100-.LBB98
	.uleb128 .LBE100-.LBB98
	.byte	0x4
	.uleb128 .LBB101-.LBB98
	.uleb128 .LBE101-.LBB98
	.byte	0
.LLRL46:
	.byte	0x5
	.8byte	.LBB113
	.byte	0x4
	.uleb128 .LBB113-.LBB113
	.uleb128 .LBE113-.LBB113
	.byte	0x4
	.uleb128 .LBB129-.LBB113
	.uleb128 .LBE129-.LBB113
	.byte	0
.LLRL48:
	.byte	0x5
	.8byte	.LBB115
	.byte	0x4
	.uleb128 .LBB115-.LBB115
	.uleb128 .LBE115-.LBB115
	.byte	0x4
	.uleb128 .LBB119-.LBB115
	.uleb128 .LBE119-.LBB115
	.byte	0
.LLRL51:
	.byte	0x5
	.8byte	.LBB117
	.byte	0x4
	.uleb128 .LBB117-.LBB117
	.uleb128 .LBE117-.LBB117
	.byte	0x4
	.uleb128 .LBB118-.LBB117
	.uleb128 .LBE118-.LBB117
	.byte	0
.LLRL53:
	.byte	0x5
	.8byte	.LBB121
	.byte	0x4
	.uleb128 .LBB121-.LBB121
	.uleb128 .LBE121-.LBB121
	.byte	0x4
	.uleb128 .LBB130-.LBB121
	.uleb128 .LBE130-.LBB121
	.byte	0
.LLRL61:
	.byte	0x5
	.8byte	.LBB123
	.byte	0x4
	.uleb128 .LBB123-.LBB123
	.uleb128 .LBE123-.LBB123
	.byte	0x4
	.uleb128 .LBB127-.LBB123
	.uleb128 .LBE127-.LBB123
	.byte	0
.LLRL64:
	.byte	0x5
	.8byte	.LBB125
	.byte	0x4
	.uleb128 .LBB125-.LBB125
	.uleb128 .LBE125-.LBB125
	.byte	0x4
	.uleb128 .LBB126-.LBB125
	.uleb128 .LBE126-.LBB125
	.byte	0
.LLRL66:
	.byte	0x7
	.8byte	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.8byte	.LFB17
	.uleb128 .LFE17-.LFB17
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF30:
	.string	"display_get_height"
.LASF26:
	.string	"float"
.LASF28:
	.string	"clear_screen"
.LASF22:
	.string	"ball_x"
.LASF23:
	.string	"ball_y"
.LASF33:
	.string	"display_auto_refresh_on"
.LASF3:
	.string	"unsigned char"
.LASF24:
	.string	"ball_dx"
.LASF8:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF21:
	.string	"paddle2_x"
.LASF19:
	.string	"paddle2_y"
.LASF18:
	.string	"paddle1_y"
.LASF15:
	.string	"width"
.LASF31:
	.string	"display_get_width"
.LASF32:
	.string	"display_is_ready"
.LASF34:
	.string	"display_enable"
.LASF9:
	.string	"__uint32_t"
.LASF27:
	.string	"color"
.LASF35:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF16:
	.string	"height"
.LASF38:
	.string	"main"
.LASF6:
	.string	"unsigned int"
.LASF17:
	.string	"ready"
.LASF14:
	.string	"long long unsigned int"
.LASF36:
	.string	"framebuffer"
.LASF11:
	.string	"long long int"
.LASF29:
	.string	"draw_rect"
.LASF20:
	.string	"paddle1_x"
.LASF37:
	.string	"printf"
.LASF4:
	.string	"short int"
.LASF25:
	.string	"ball_dy"
.LASF10:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF13:
	.string	"char"
.LASF12:
	.string	"long double"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
