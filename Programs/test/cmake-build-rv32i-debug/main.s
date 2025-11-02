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
	.file 0 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug" "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.align	1
	.globl	draw_cube
	.type	draw_cube, @function
draw_cube:
.LFB11:
	.file 1 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 16 105
	.cfi_startproc
.LVL0:
	.loc 1 17 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:16: void draw_cube(uint8_t* framebuffer, const int x, const int y, const uint8_t color, fb_info_t* fb_info) {
	.loc 1 16 105 is_stmt 0
	addi	sp,sp,-80	#,,
	.cfi_def_cfa_offset 80
	sd	s4,32(sp)	#,
	sd	s5,24(sp)	#,
	sd	s7,8(sp)	#,
	sd	ra,72(sp)	#,
	sd	s1,56(sp)	#,
	sd	s2,48(sp)	#,
	sd	s3,40(sp)	#,
	sd	s6,16(sp)	#,
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 22, -64
	mv	s4,a0	# framebuffer, tmp227
	mv	s7,a4	# fb_info, tmp231
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     const int x_start = (x < 0) ? 0 : x;
	.loc 1 17 15
	li	s5,0		#,
	blt	a1,zero,.L2	#, x,,
	sext.w	s5,a1	#, x
.L2:
.LVL1:
	.loc 1 18 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:18:     const int y_start = (y < 0) ? 0 : y;
	.loc 1 18 15 is_stmt 0
	sext.w	s1,a2	#, y
	bge	a2,zero,.L3	#, y,,
	li	s1,0		#,
.L3:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 73
	lw	a5,0(s7)		# fb_info_28(D)->width, fb_info_28(D)->width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 26
	addiw	a1,a1,10	#, tmp169, x
.LVL2:
	.loc 1 19 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 73 is_stmt 0
	sext.w	s2,a1	#, tmp169
	bleu	a1,a5,.L4	#, tmp169, fb_info_28(D)->width,
	sext.w	s2,a5	#, fb_info_28(D)->width
.L4:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 75
	lw	a5,4(s7)		# fb_info_28(D)->height, fb_info_28(D)->height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 26
	addiw	a2,a2,10	#, tmp176, y
.LVL3:
	.loc 1 20 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 75 is_stmt 0
	sext.w	s6,a2	#, tmp176
	bleu	a2,a5,.L5	#, tmp176, fb_info_28(D)->height,
	sext.w	s6,a5	#, fb_info_28(D)->height
.L5:
.LVL4:
	.loc 1 23 5 is_stmt 1
.LBB30:
	.loc 1 23 10
	.loc 1 23 33 discriminator 1
.LBB31:
.LBB32:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13 is_stmt 0
	sext.w	s3,a3	# _54, color
.LBE32:
.LBE31:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:23:     for (int row = y_start; row < y_end; row++) {
	.loc 1 23 33 discriminator 1
	bge	s1,s6,.L1	#, y_start, y_end,
	sd	s0,64(sp)	#,
	.cfi_offset 8, -16
.LVL5:
.L6:
.LBB35:
	.loc 1 24 37 is_stmt 1 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 18 is_stmt 0
	mv	s0,s5	# col, x_start
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 37 discriminator 1
	bge	s5,s2,.L10	#, x_start, x_end,
.LVL6:
.L8:
.LBB33:
	.loc 1 25 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 49 is_stmt 0
	lw	a0,0(s7)		# fb_info_28(D)->width, fb_info_28(D)->width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 82
	lw	a5,8(s7)		# _14, fb_info_28(D)->bpp
.LVL7:
	.loc 1 26 13 is_stmt 1
	mv	a1,s3	#, _54
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 49 is_stmt 0
	mulw	a0,a0,s1	# tmp196, fb_info_28(D)->width, y_start
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13
	slli	a2,a5,32	#,, _14
	srli	a2,a2,32	#,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 66
	addw	a0,a0,s0	# col, tmp198, tmp196
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	mulw	a0,a0,a5	# tmp200, tmp198, _14
.LBE33:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 49 discriminator 3
	addiw	s0,s0,1	#, col, col
.LVL8:
.LBB34:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	slli	a0,a0,32	#, _16, tmp200
	srli	a0,a0,32	#, _16, _16
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13
	add	a0,s4,a0	# _16,, framebuffer
	call	memset		#
.LVL9:
.LBE34:
	.loc 1 24 49 is_stmt 1 discriminator 3
	.loc 1 24 37 discriminator 1
	bne	s2,s0,.L8	#, x_end, col,
.LVL10:
.L10:
.LBE35:
	.loc 1 23 45 discriminator 2
	addiw	s1,s1,1	#, y_start, y_start
.LVL11:
	.loc 1 23 33 discriminator 1
	bne	s6,s1,.L6	#, y_end, y_start,
	ld	s0,64(sp)		#,
	.cfi_restore 8
.LVL12:
.L1:
.LBE30:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:29: }
	.loc 1 29 1 is_stmt 0
	ld	ra,72(sp)		#,
	.cfi_restore 1
	ld	s1,56(sp)		#,
	.cfi_restore 9
	ld	s2,48(sp)		#,
	.cfi_restore 18
	ld	s3,40(sp)		#,
	.cfi_restore 19
	ld	s4,32(sp)		#,
	.cfi_restore 20
.LVL13:
	ld	s5,24(sp)		#,
	.cfi_restore 21
	ld	s6,16(sp)		#,
	.cfi_restore 22
	ld	s7,8(sp)		#,
	.cfi_restore 23
.LVL14:
	addi	sp,sp,80	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE11:
	.size	draw_cube, .-draw_cube
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Keyboard/Display test. Press 'q' to quit"
	.align	3
.LC1:
	.string	"Failed to get framebuffer info"
	.align	3
.LC2:
	.string	"Framebuffer info: %dx%d@%dbpp\n"
	.align	3
.LC3:
	.string	"Failed to allocate framebuffer"
	.align	3
.LC4:
	.string	"FPS: %d\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB12:
	.loc 1 31 16 is_stmt 1
	.cfi_startproc
	.loc 1 32 5
	lui	a0,%hi(.LC0)	# tmp218,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31: int main(void) {
	.loc 1 31 16 is_stmt 0
	addi	sp,sp,-144	#,,
	.cfi_def_cfa_offset 144
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:32:     printf("Keyboard/Display test. Press 'q' to quit\n");
	.loc 1 32 5
	addi	a0,a0,%lo(.LC0)	#, tmp218,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:31: int main(void) {
	.loc 1 31 16
	sd	ra,136(sp)	#,
	sd	s6,80(sp)	#,
	sd	s8,64(sp)	#,
	.cfi_offset 1, -8
	.cfi_offset 22, -64
	.cfi_offset 24, -80
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:32:     printf("Keyboard/Display test. Press 'q' to quit\n");
	.loc 1 32 5
	call	puts		#
.LVL15:
	.loc 1 33 5 is_stmt 1
.LBB71:
.LBB72:
	.file 2 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h"
	.loc 2 13 5
	.loc 2 14 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 2 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 2 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 2 17 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 2 17 12 is_stmt 0
 #NO_APP
	sext.w	s8,a0	# last_update_us, tmp394
.LVL16:
.LBE72:
.LBE71:
	.loc 1 34 5 is_stmt 1
.LBB73:
.LBB74:
	.loc 2 13 5
	.loc 2 14 5
	.loc 2 16 5
 #APP
# 16 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 2 17 5
 #NO_APP
.LBE74:
.LBE73:
.LBB76:
.LBB77:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:34:     register long a7 __asm__("a7") = GET_FRAMEBUFFER_INFO;
	.file 3 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h"
	.loc 3 34 19 is_stmt 0
	li	a7,200		# a7,
.LBE77:
.LBE76:
.LBB79:
.LBB75:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 2 17 12
	sext.w	s6,a0	# next_frame_us, tmp395
.LVL17:
.LBE75:
.LBE79:
	.loc 1 35 5 is_stmt 1
	.loc 1 37 5
	.loc 1 38 5
	.loc 1 39 5
	.loc 1 40 5
	.loc 1 42 5
	.loc 1 43 5
.LBB80:
.LBB78:
	.loc 3 33 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:33:     register long a0 __asm__("a0") = (long)info;
	.loc 3 33 38 is_stmt 0
	addi	a0,sp,16	#, a0,
.LVL18:
	.loc 3 34 5 is_stmt 1
	.loc 3 36 5
 #APP
# 36 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL19:
	.loc 3 37 5
 #NO_APP
.LBE78:
.LBE80:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:43:     if (get_framebuffer_info(&framebuffer_info) == -1) {
	.loc 1 43 8 is_stmt 0 discriminator 1
	li	a4,-1		# tmp220,
	sext.w	a5,a0	# a0.5_54, tmp396
	beq	a5,a4,.L69	#, a0.5_54, tmp220,
	.loc 1 47 5 is_stmt 1
	lw	a3,24(sp)		#, framebuffer_info.bpp
	lw	a2,20(sp)		#, framebuffer_info.height
	lw	a1,16(sp)		#, framebuffer_info.width
	lui	a0,%hi(.LC2)	# tmp225,
	addi	a0,a0,%lo(.LC2)	#, tmp225,
	sd	s0,128(sp)	#,
	.cfi_offset 8, -16
	call	printf		#
.LVL20:
	.loc 1 49 5
	.loc 1 50 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     const size_t fb_size = framebuffer_info.width * framebuffer_info.height * framebuffer_info.bpp;
	.loc 1 49 51 is_stmt 0
	lw	a4,16(sp)		# framebuffer_info.width, framebuffer_info.width
	lw	a5,20(sp)		# framebuffer_info.height, framebuffer_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     const size_t fb_size = framebuffer_info.width * framebuffer_info.height * framebuffer_info.bpp;
	.loc 1 49 77
	lw	a0,24(sp)		# framebuffer_info.bpp, framebuffer_info.bpp
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     uint8_t* framebuffer = malloc(fb_size);
	.loc 1 50 28
	li	a1,1		#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     const size_t fb_size = framebuffer_info.width * framebuffer_info.height * framebuffer_info.bpp;
	.loc 1 49 51
	mulw	a5,a5,a4	# tmp231, framebuffer_info.height, framebuffer_info.width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     const size_t fb_size = framebuffer_info.width * framebuffer_info.height * framebuffer_info.bpp;
	.loc 1 49 77
	mulw	a0,a0,a5	# tmp235, framebuffer_info.bpp, tmp231
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     uint8_t* framebuffer = malloc(fb_size);
	.loc 1 50 28
	slli	a0,a0,32	#,, tmp235
	srli	a0,a0,32	#,,
	call	calloc		#
.LVL21:
	mv	s0,a0	# framebuffer, tmp397
.LVL22:
	.loc 1 51 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:51:     if (!framebuffer) {
	.loc 1 51 8 is_stmt 0
	beq	a0,zero,.L70	#, framebuffer,,
	sd	s9,56(sp)	#,
	.cfi_offset 25, -88
.LBB81:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:73:         if (current_us - last_update_us >= 1000000) {
	.loc 1 73 12
	li	s9,999424		# tmp428,
	addi	a5,s9,575	#, tmp391, tmp428
.LBE81:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:38:     int last_y = 1;
	.loc 1 38 9
	li	a3,1		# last_y,
.LBB124:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:73:         if (current_us - last_update_us >= 1000000) {
	.loc 1 73 12
	sd	a5,8(sp)	# tmp391, %sfp
.LBB82:
.LBB83:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = buffer_address;
	.loc 3 27 18
	sext.w	a5,a0	# _202, framebuffer
	sd	s3,104(sp)	#,
	sd	s4,96(sp)	#,
	sd	s7,72(sp)	#,
	sd	s1,120(sp)	#,
	sd	s2,112(sp)	#,
	sd	s5,88(sp)	#,
	sd	s10,48(sp)	#,
	sd	s11,40(sp)	#,
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 23, -72
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 21, -56
	.cfi_offset 26, -96
	.cfi_offset 27, -104
.LBE83:
.LBE82:
.LBE124:
	.loc 1 56 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:37:     int last_x = 1;
	.loc 1 37 9 is_stmt 0
	mv	a4,a3	# last_x, last_y
.LBB125:
.LBB86:
.LBB84:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = buffer_address;
	.loc 3 27 18
	sd	a5,0(sp)	# _202, %sfp
.LBE84:
.LBE86:
.LBE125:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:40:     int cur_y = 0;
	.loc 1 40 9
	li	s4,0		# cur_y,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:39:     int cur_x = 0;
	.loc 1 39 9
	li	s3,0		# cur_x,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:35:     unsigned int frames = 0;
	.loc 1 35 18
	li	s7,0		# frames,
.LVL23:
.L50:
	.loc 1 58 5 is_stmt 1
.LBB126:
	.loc 1 59 9
.LBB87:
.LBB88:
	.loc 2 13 5
	.loc 2 14 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 2 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 2 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 2 17 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 2 17 12 is_stmt 0
 #NO_APP
	sext.w	s5,a0	# _61, tmp398
.LVL24:
.LBE88:
.LBE87:
	.loc 1 62 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:62:         if (cur_x != last_x || cur_y != last_y) {
	.loc 1 62 12 is_stmt 0
	bne	a4,s3,.L24	#, last_x, cur_x,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:62:         if (cur_x != last_x || cur_y != last_y) {
	.loc 1 62 29 discriminator 1
	beq	a3,s4,.L25	#, last_y, cur_y,
.L24:
	.loc 1 63 13 is_stmt 1
.LVL25:
.LBB89:
.LBB90:
	.loc 1 17 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     const int x_start = (x < 0) ? 0 : x;
	.loc 1 17 15 is_stmt 0
	sext.w	s10,a4	#, last_x
	bge	a4,zero,.L26	#, last_x,,
	li	s10,0		#,
.L26:
.LVL26:
	.loc 1 18 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:18:     const int y_start = (y < 0) ? 0 : y;
	.loc 1 18 15 is_stmt 0
	sext.w	s1,a3	#, last_y
	bge	a3,zero,.L27	#, last_y,,
	li	s1,0		#,
.L27:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 47
	lw	a5,16(sp)		# prephitmp_204, framebuffer_info.width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 26
	addiw	a4,a4,10	#, tmp245, last_x
.LVL27:
	.loc 1 19 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 73 is_stmt 0
	sext.w	s2,a4	#, tmp245
	bleu	a4,a5,.L28	#, tmp245, prephitmp_204,
	sext.w	s2,a5	#, prephitmp_204
.L28:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 75
	lw	a2,20(sp)		# framebuffer_info.height, framebuffer_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 26
	addiw	a3,a3,10	#, tmp251, last_y
.LVL28:
	.loc 1 20 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 75 is_stmt 0
	sext.w	s11,a3	#, tmp251
	bleu	a3,a2,.L29	#, tmp251, framebuffer_info.height,
	sext.w	s11,a2	#, framebuffer_info.height
.L29:
.LVL29:
	.loc 1 23 5 is_stmt 1
.LBB91:
	.loc 1 23 10
	.loc 1 23 33 discriminator 1
	bge	s1,s11,.L31	#, y_start, y_end,
.LVL30:
.L30:
.LBB92:
	.loc 1 24 37 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 18 is_stmt 0
	mv	s9,s10	# col, x_start
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 37 discriminator 1
	bge	s10,s2,.L34	#, x_start, x_end,
.LVL31:
.L32:
.LBB93:
	.loc 1 25 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 49 is_stmt 0
	mulw	a0,s1,a5	# tmp258, y_start, prephitmp_204
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 82
	lw	a5,24(sp)		# _150, framebuffer_info.bpp
.LVL32:
	.loc 1 26 13 is_stmt 1
	li	a1,0		#,
	slli	a2,a5,32	#,, _150
	srli	a2,a2,32	#,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 66 is_stmt 0
	addw	a0,a0,s9	# col, tmp260, tmp258
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	mulw	a0,a0,a5	# tmp262, tmp260, _150
.LBE93:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 49 discriminator 3
	addiw	s9,s9,1	#, col, col
.LVL33:
.LBB94:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	slli	a0,a0,32	#, _152, tmp262
	srli	a0,a0,32	#, _152, _152
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13
	add	a0,s0,a0	# _152,, framebuffer
	call	memset		#
.LVL34:
.LBE94:
	.loc 1 24 49 is_stmt 1 discriminator 3
	.loc 1 24 37 discriminator 1
.LBE92:
.LBE91:
.LBE90:
.LBE89:
.LBB98:
.LBB99:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 47 is_stmt 0
	lw	a5,16(sp)		# prephitmp_204, framebuffer_info.width
.LBE99:
.LBE98:
.LBB105:
.LBB97:
.LBB96:
.LBB95:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 37 discriminator 1
	bne	s2,s9,.L32	#, x_end, col,
.LVL35:
.L34:
.LBE95:
	.loc 1 23 45 is_stmt 1 discriminator 2
	addiw	s1,s1,1	#, y_start, y_start
.LVL36:
	.loc 1 23 33 discriminator 1
	bne	s11,s1,.L30	#, y_end, y_start,
	lw	a2,20(sp)		# framebuffer_info.height, framebuffer_info.height
.LVL37:
.L31:
.LBE96:
.LBE97:
.LBE105:
	.loc 1 64 13
.LBB106:
.LBB104:
	.loc 1 17 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     const int x_start = (x < 0) ? 0 : x;
	.loc 1 17 15 is_stmt 0
	sext.w	s10,s3	#, cur_x
	bge	s3,zero,.L35	#, cur_x,,
	li	s10,0		#,
.L35:
.LVL38:
	.loc 1 18 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:18:     const int y_start = (y < 0) ? 0 : y;
	.loc 1 18 15 is_stmt 0
	sext.w	s1,s4	#, cur_y
	bge	s4,zero,.L36	#, cur_y,,
	li	s1,0		#,
.L36:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 26
	addiw	a4,s3,10	#, tmp278, cur_x
.LVL39:
	.loc 1 19 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:19:     const int x_end = (x + CUBE_SIZE > fb_info->width) ? fb_info->width : x + CUBE_SIZE;
	.loc 1 19 73 is_stmt 0
	sext.w	s2,a4	#, tmp278
	bleu	a4,a5,.L37	#, tmp278, prephitmp_204,
	sext.w	s2,a5	#, prephitmp_204
.L37:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 26
	addiw	a5,s4,10	#, tmp284, cur_y
.LVL40:
	.loc 1 20 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     const int y_end = (y + CUBE_SIZE > fb_info->height) ? fb_info->height : y + CUBE_SIZE;
	.loc 1 20 75 is_stmt 0
	sext.w	s11,a5	#, tmp284
	bleu	a5,a2,.L38	#, tmp284, framebuffer_info.height,
	sext.w	s11,a2	#, framebuffer_info.height
.L38:
.LVL41:
	.loc 1 23 5 is_stmt 1
.LBB100:
	.loc 1 23 10
	.loc 1 23 33 discriminator 1
	bge	s1,s11,.L25	#, y_start, y_end,
.LVL42:
.L39:
.LBB101:
	.loc 1 24 37 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 18 is_stmt 0
	mv	s9,s10	# col, x_start
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 37 discriminator 1
	bge	s10,s2,.L42	#, x_start, x_end,
.LVL43:
.L40:
.LBB102:
	.loc 1 25 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 49 is_stmt 0
	lw	a0,16(sp)		# framebuffer_info.width, framebuffer_info.width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 82
	lw	a4,24(sp)		# _123, framebuffer_info.bpp
.LVL44:
	.loc 1 26 13 is_stmt 1
	li	a1,255		#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 49 is_stmt 0
	mulw	a0,a0,s1	# tmp304, framebuffer_info.width, y_start
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13
	slli	a2,a4,32	#,, _123
	srli	a2,a2,32	#,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 66
	addw	a0,a0,s9	# col, tmp306, tmp304
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	mulw	a0,a0,a4	# tmp308, tmp306, _123
.LBE102:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24:         for (int col = x_start; col < x_end; col++) {
	.loc 1 24 49 discriminator 3
	addiw	s9,s9,1	#, col, col
.LVL45:
.LBB103:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:25:             uint8_t* pixel = framebuffer + (row * fb_info->width + col) * fb_info->bpp;
	.loc 1 25 73
	slli	a0,a0,32	#, _125, tmp308
	srli	a0,a0,32	#, _125, _125
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:26:             memset(pixel, color, fb_info->bpp);
	.loc 1 26 13
	add	a0,s0,a0	# _125,, framebuffer
	call	memset		#
.LVL46:
.LBE103:
	.loc 1 24 49 is_stmt 1 discriminator 3
	.loc 1 24 37 discriminator 1
	bne	s2,s9,.L40	#, x_end, col,
.LVL47:
.L42:
.LBE101:
	.loc 1 23 45 discriminator 2
	addiw	s1,s1,1	#, y_start, y_start
.LVL48:
	.loc 1 23 33 discriminator 1
	bne	s11,s1,.L39	#, y_end, y_start,
.LVL49:
.L25:
.LBE100:
.LBE104:
.LBE106:
	.loc 1 70 9
.LBB107:
.LBB85:
	.loc 3 27 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = buffer_address;
	.loc 3 27 18 is_stmt 0
	lw	a0,0(sp)		#, %sfp
	.loc 3 28 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:28:     register int a7 asm("a7") = SHOW_BUFFER;
	.loc 3 28 18 is_stmt 0
	li	a7,101		# a7,
	.loc 3 29 5 is_stmt 1
 #APP
# 29 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL50:
 #NO_APP
.LBE85:
.LBE107:
	.loc 1 73 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:73:         if (current_us - last_update_us >= 1000000) {
	.loc 1 73 12 is_stmt 0
	ld	a4,8(sp)		# tmp391, %sfp
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:73:         if (current_us - last_update_us >= 1000000) {
	.loc 1 73 24
	subw	a5,s5,s8	# tmp316, _61, last_update_us
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:73:         if (current_us - last_update_us >= 1000000) {
	.loc 1 73 12
	bgtu	a5,a4,.L71	#, tmp316, tmp391,
	.loc 1 80 9 is_stmt 1
.LVL51:
.LBB108:
.LBB109:
	.file 4 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h"
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,113		# a0,
	.loc 4 33 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:33:     register long a7 __asm__("a7") = KEY_PRESSED;
	.loc 4 33 19 is_stmt 0
	li	a7,15		# a7,
	.loc 4 35 5 is_stmt 1
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL52:
 #NO_APP
.LBE109:
.LBE108:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (key_pressed('q')) {
	.loc 1 80 12 is_stmt 0 discriminator 1
	bne	a0,zero,.L44	#, tmp399,,
.L72:
	.loc 1 83 9 is_stmt 1
.LVL53:
.LBB111:
.LBB112:
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,119		# a0,
	.loc 4 33 5 is_stmt 1
	.loc 4 35 5
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL54:
 #NO_APP
.LBE112:
.LBE111:
	mv	a1,s4	# cur_y, cur_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (key_pressed('w')) {
	.loc 1 83 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L45	#, tmp400,,
	.loc 1 84 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:84:             cur_y -= SPEED;
	.loc 1 84 19 is_stmt 0
	addiw	a1,s4,-10	#, cur_y, cur_y
.L45:
.LVL55:
	.loc 1 86 9 is_stmt 1
.LBB113:
.LBB114:
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,115		# a0,
	.loc 4 33 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:33:     register long a7 __asm__("a7") = KEY_PRESSED;
	.loc 4 33 19 is_stmt 0
	li	a7,15		# a7,
	.loc 4 35 5 is_stmt 1
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL56:
 #NO_APP
.LBE114:
.LBE113:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:86:         if (key_pressed('s')) {
	.loc 1 86 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L46	#, tmp401,,
	.loc 1 87 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:             cur_y += SPEED;
	.loc 1 87 19 is_stmt 0
	addiw	a1,a1,10	#, cur_y, cur_y
.LVL57:
.L46:
	.loc 1 89 9 is_stmt 1
.LBB115:
.LBB116:
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,97		# a0,
	.loc 4 33 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:33:     register long a7 __asm__("a7") = KEY_PRESSED;
	.loc 4 33 19 is_stmt 0
	li	a7,15		# a7,
	.loc 4 35 5 is_stmt 1
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL58:
 #NO_APP
.LBE116:
.LBE115:
	mv	a2,s3	# cur_x, cur_x
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:         if (key_pressed('a')) {
	.loc 1 89 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L47	#, tmp402,,
	.loc 1 90 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:90:             cur_x -= SPEED;
	.loc 1 90 19 is_stmt 0
	addiw	a2,s3,-10	#, cur_x, cur_x
.L47:
.LVL59:
	.loc 1 92 9 is_stmt 1
.LBB117:
.LBB118:
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,100		# a0,
	.loc 4 33 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:33:     register long a7 __asm__("a7") = KEY_PRESSED;
	.loc 4 33 19 is_stmt 0
	li	a7,15		# a7,
	.loc 4 35 5 is_stmt 1
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL60:
 #NO_APP
.LBE118:
.LBE117:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:92:         if (key_pressed('d')) {
	.loc 1 92 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L48	#, tmp403,,
	.loc 1 93 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:93:             cur_x += SPEED;
	.loc 1 93 19 is_stmt 0
	addiw	a2,a2,10	#, cur_x, cur_x
.LVL61:
.L48:
	.loc 1 97 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:97:         next_frame_us += FRAME_TIME_US;
	.loc 1 97 23 is_stmt 0
	li	a5,16384		# tmp427,
	addiw	a5,a5,282	#, tmp332, tmp427
	addw	s6,s6,a5	# tmp332, next_frame_us, next_frame_us
.LVL62:
	.loc 1 98 9 is_stmt 1
.LBB119:
.LBB120:
	.loc 2 13 5
	.loc 2 14 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 2 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 2 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 2 17 5
 #NO_APP
.LBE120:
.LBE119:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:98:         const int sleep_time_us = next_frame_us - get_us();
	.loc 1 98 49 is_stmt 0 discriminator 1
	subw	a0,s6,a0	# tmp336, next_frame_us, tmp404
.LVL63:
	.loc 1 99 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         if (sleep_time_us > 0) {
	.loc 1 99 12 is_stmt 0
	ble	a0,zero,.L49	#, tmp336,,
	.loc 1 100 13 is_stmt 1
.LVL64:
.LBB121:
.LBB122:
	.loc 2 21 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:21:     register long a0 __asm__("a0") = us;
	.loc 2 21 19 is_stmt 0
	slli	a0,a0,32	#, a0, tmp336
.LVL65:
	srli	a0,a0,32	#, a0, a0
	.loc 2 22 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:22:     register long a7 __asm__("a7") = SLEEP_US;
	.loc 2 22 19 is_stmt 0
	li	a7,12		# a7,
	.loc 2 24 5 is_stmt 1
 #APP
# 24 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
.LVL66:
 #NO_APP
.L49:
.LBE122:
.LBE121:
	.loc 1 103 9
.LBE126:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:58:     while (1) {
	.loc 1 58 15 is_stmt 0
	mv	a3,s4	# last_y, cur_y
	mv	a4,s3	# last_x, cur_x
.LBB127:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:103:         frames++;
	.loc 1 103 15
	addiw	s7,s7,1	#, frames, frames
.LVL67:
.LBE127:
	.loc 1 58 11 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:58:     while (1) {
	.loc 1 58 15 is_stmt 0
	mv	s4,a1	# cur_y, cur_y
.LVL68:
	mv	s3,a2	# cur_x, cur_x
.LVL69:
	j	.L50		#
.LVL70:
.L71:
.LBB128:
	.loc 1 74 13 is_stmt 1
	lui	a5,%hi(.LC4)	# tmp435,
	mv	a1,s7	#, frames
	addi	a0,a5,%lo(.LC4)	#, tmp435,
	call	printf		#
.LVL71:
	.loc 1 75 13
	.loc 1 76 13
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:75:             last_update_us = current_us;
	.loc 1 75 28 is_stmt 0
	mv	s8,s5	# last_update_us, _61
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:76:             frames = 0;
	.loc 1 76 20
	li	s7,0		# frames,
.LVL72:
	.loc 1 80 9 is_stmt 1
.LBB123:
.LBB110:
	.loc 4 32 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:32:     register long a0 __asm__("a0") = key_code;
	.loc 4 32 19 is_stmt 0
	li	a0,113		# a0,
	.loc 4 33 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:33:     register long a7 __asm__("a7") = KEY_PRESSED;
	.loc 4 33 19 is_stmt 0
	li	a7,15		# a7,
	.loc 4 35 5 is_stmt 1
 #APP
# 35 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 4 36 5
.LVL73:
 #NO_APP
.LBE110:
.LBE123:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         if (key_pressed('q')) {
	.loc 1 80 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L72	#, tmp399,,
.L44:
.LBE128:
	.loc 1 106 5 is_stmt 1
	mv	a0,s0	#, framebuffer
	call	free		#
.LVL74:
	.loc 1 107 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:107:     return 0;
	.loc 1 107 12 is_stmt 0
	ld	s0,128(sp)		#,
	.cfi_restore 8
.LVL75:
	ld	s1,120(sp)		#,
	.cfi_restore 9
	ld	s2,112(sp)		#,
	.cfi_restore 18
	ld	s3,104(sp)		#,
	.cfi_restore 19
.LVL76:
	ld	s4,96(sp)		#,
	.cfi_restore 20
.LVL77:
	ld	s5,88(sp)		#,
	.cfi_restore 21
.LVL78:
	ld	s7,72(sp)		#,
	.cfi_restore 23
.LVL79:
	ld	s9,56(sp)		#,
	.cfi_restore 25
	ld	s10,48(sp)		#,
	.cfi_restore 26
	ld	s11,40(sp)		#,
	.cfi_restore 27
	li	a0,0		# <retval>,
.LVL80:
.L23:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:108: }
	.loc 1 108 1
	ld	ra,136(sp)		#,
	.cfi_remember_state
	.cfi_restore 1
	ld	s6,80(sp)		#,
	.cfi_restore 22
.LVL81:
	ld	s8,64(sp)		#,
	.cfi_restore 24
.LVL82:
	addi	sp,sp,144	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
.LVL83:
.L69:
	.cfi_restore_state
	.loc 1 44 9 is_stmt 1
	lui	a0,%hi(.LC1)	# tmp221,
	addi	a0,a0,%lo(.LC1)	#, tmp221,
	call	puts		#
.LVL84:
	.loc 1 45 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:45:         return 1;
	.loc 1 45 16 is_stmt 0
	li	a0,1		# <retval>,
	j	.L23		#
.LVL85:
.L70:
	.cfi_offset 8, -16
	.loc 1 52 9 is_stmt 1
	lui	a0,%hi(.LC3)	# tmp238,
	addi	a0,a0,%lo(.LC3)	#, tmp238,
	call	puts		#
.LVL86:
	.loc 1 53 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:45:         return 1;
	.loc 1 45 16 is_stmt 0
	li	a0,1		# <retval>,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:52:         printf("Failed to allocate framebuffer\n");
	.loc 1 52 9
	ld	s0,128(sp)		#,
	.cfi_restore 8
.LVL87:
	j	.L23		#
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.text
.Letext0:
	.file 5 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 6 "/usr/local/Cellar/riscv-gnu-toolchain/main/lib/gcc/riscv64-unknown-elf/14.2.0/include/stddef.h"
	.file 7 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 8 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdlib.h"
	.file 9 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdio.h"
	.file 10 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/string.h"
	.file 11 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x952
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1d
	.4byte	.LASF61
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL56
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0x5
	.byte	0x2b
	.byte	0x18
	.4byte	0x3d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x1e
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xb
	.4byte	0x52
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x5
	.byte	0x4f
	.byte	0x19
	.4byte	0x6a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0xb
	.4byte	0x6a
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x5
	.byte	0xe6
	.byte	0x19
	.4byte	0x76
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x6
	.byte	0xd6
	.byte	0x17
	.4byte	0x7d
	.uleb128 0xb
	.4byte	0x90
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.4byte	.LASF14
	.uleb128 0x1f
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xb
	.4byte	0xb1
	.uleb128 0x14
	.4byte	0xb8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x7
	.byte	0x18
	.byte	0x13
	.4byte	0x31
	.uleb128 0xb
	.4byte	0xc9
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x7
	.byte	0x30
	.byte	0x14
	.4byte	0x5e
	.uleb128 0xb
	.4byte	0xda
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x7
	.byte	0x4d
	.byte	0x14
	.4byte	0x84
	.uleb128 0x20
	.byte	0xc
	.byte	0x3
	.byte	0x14
	.byte	0x9
	.4byte	0x124
	.uleb128 0x1b
	.4byte	.LASF20
	.byte	0x15
	.4byte	0xda
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF21
	.byte	0x16
	.4byte	0xda
	.byte	0x4
	.uleb128 0x21
	.string	"bpp"
	.byte	0x3
	.byte	0x17
	.byte	0xe
	.4byte	0xda
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x3
	.byte	0x18
	.byte	0x3
	.4byte	0xf7
	.uleb128 0x22
	.4byte	.LASF38
	.byte	0x8
	.byte	0x5e
	.byte	0x6
	.4byte	0x142
	.uleb128 0xc
	.4byte	0xaf
	.byte	0
	.uleb128 0x15
	.4byte	.LASF23
	.byte	0x8
	.byte	0x6c
	.byte	0x7
	.4byte	0xaf
	.4byte	0x158
	.uleb128 0xc
	.4byte	0x7d
	.byte	0
	.uleb128 0x15
	.4byte	.LASF24
	.byte	0x9
	.byte	0xce
	.byte	0x5
	.4byte	0x52
	.4byte	0x16f
	.uleb128 0xc
	.4byte	0xbd
	.uleb128 0x23
	.byte	0
	.uleb128 0x15
	.4byte	.LASF25
	.byte	0xa
	.byte	0x21
	.byte	0x9
	.4byte	0xaf
	.4byte	0x18f
	.uleb128 0xc
	.4byte	0xaf
	.uleb128 0xc
	.4byte	0x52
	.uleb128 0xc
	.4byte	0x7d
	.byte	0
	.uleb128 0x24
	.4byte	.LASF62
	.byte	0x1
	.byte	0x1f
	.byte	0x5
	.4byte	0x52
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ec
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x21
	.byte	0x12
	.4byte	0x6a
	.4byte	.LLST11
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x22
	.byte	0x12
	.4byte	0x6a
	.4byte	.LLST12
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x23
	.byte	0x12
	.4byte	0x6a
	.4byte	.LLST13
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x25
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST14
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x26
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST15
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x27
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST16
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x28
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST17
	.uleb128 0x25
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2a
	.byte	0xf
	.4byte	0x124
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x31
	.byte	0x12
	.4byte	0x9c
	.4byte	.LLST18
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x32
	.byte	0xe
	.4byte	0x6ec
	.4byte	.LLST19
	.uleb128 0x26
	.4byte	.LLRL23
	.4byte	0x5b9
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x3b
	.byte	0x1c
	.4byte	0x71
	.4byte	.LLST24
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x62
	.byte	0x13
	.4byte	0x59
	.4byte	.LLST25
	.uleb128 0xd
	.4byte	0x7d8
	.8byte	.LBB82
	.4byte	.LLRL26
	.byte	0x46
	.byte	0x9
	.4byte	0x2a4
	.uleb128 0x2
	.4byte	0x7e3
	.4byte	.LLST27
	.uleb128 0xe
	.4byte	.LLRL26
	.uleb128 0x1
	.4byte	0x7ef
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x7fa
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x833
	.8byte	.LBB87
	.8byte	.LBE87-.LBB87
	.byte	0x3b
	.byte	0x29
	.4byte	0x2ce
	.uleb128 0x1
	.4byte	0x843
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x84e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xd
	.4byte	0x6f1
	.8byte	.LBB89
	.4byte	.LLRL28
	.byte	0x3f
	.byte	0xd
	.4byte	0x375
	.uleb128 0x2
	.4byte	0x6fe
	.4byte	.LLST29
	.uleb128 0x2
	.4byte	0x70a
	.4byte	.LLST30
	.uleb128 0x2
	.4byte	0x714
	.4byte	.LLST31
	.uleb128 0x2
	.4byte	0x71e
	.4byte	.LLST32
	.uleb128 0x2
	.4byte	0x72a
	.4byte	.LLST33
	.uleb128 0xe
	.4byte	.LLRL28
	.uleb128 0x4
	.4byte	0x736
	.uleb128 0x4
	.4byte	0x741
	.uleb128 0x4
	.4byte	0x74c
	.uleb128 0x4
	.4byte	0x757
	.uleb128 0xf
	.4byte	0x762
	.4byte	.LLRL34
	.uleb128 0x8
	.4byte	0x763
	.4byte	.LLST35
	.uleb128 0xf
	.4byte	0x76f
	.4byte	.LLRL36
	.uleb128 0x8
	.4byte	0x770
	.4byte	.LLST37
	.uleb128 0xf
	.4byte	0x77c
	.4byte	.LLRL38
	.uleb128 0x4
	.4byte	0x77d
	.uleb128 0x11
	.8byte	.LVL34
	.4byte	0x93a
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x6f1
	.8byte	.LBB98
	.4byte	.LLRL39
	.byte	0x40
	.byte	0xd
	.4byte	0x439
	.uleb128 0x2
	.4byte	0x6fe
	.4byte	.LLST40
	.uleb128 0x2
	.4byte	0x70a
	.4byte	.LLST41
	.uleb128 0x2
	.4byte	0x714
	.4byte	.LLST42
	.uleb128 0x2
	.4byte	0x71e
	.4byte	.LLST43
	.uleb128 0x2
	.4byte	0x72a
	.4byte	.LLST44
	.uleb128 0xe
	.4byte	.LLRL39
	.uleb128 0x4
	.4byte	0x736
	.uleb128 0x4
	.4byte	0x741
	.uleb128 0x4
	.4byte	0x74c
	.uleb128 0x4
	.4byte	0x757
	.uleb128 0x16
	.4byte	0x762
	.8byte	.LBB100
	.8byte	.LBE100-.LBB100
	.uleb128 0x8
	.4byte	0x763
	.4byte	.LLST45
	.uleb128 0x16
	.4byte	0x76f
	.8byte	.LBB101
	.8byte	.LBE101-.LBB101
	.uleb128 0x8
	.4byte	0x770
	.4byte	.LLST46
	.uleb128 0xf
	.4byte	0x77c
	.4byte	.LLRL47
	.uleb128 0x8
	.4byte	0x77d
	.4byte	.LLST48
	.uleb128 0x11
	.8byte	.LVL46
	.4byte	0x16f
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x8
	.byte	0xff
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x85a
	.8byte	.LBB108
	.4byte	.LLRL49
	.byte	0x50
	.byte	0xd
	.4byte	0x46e
	.uleb128 0x2
	.4byte	0x86a
	.4byte	.LLST50
	.uleb128 0xe
	.4byte	.LLRL49
	.uleb128 0x1
	.4byte	0x876
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x881
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x85a
	.8byte	.LBB111
	.8byte	.LBE111-.LBB111
	.byte	0x53
	.byte	0xd
	.4byte	0x4a1
	.uleb128 0x2
	.4byte	0x86a
	.4byte	.LLST51
	.uleb128 0x1
	.4byte	0x876
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x881
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.4byte	0x85a
	.8byte	.LBB113
	.8byte	.LBE113-.LBB113
	.byte	0x56
	.byte	0xd
	.4byte	0x4d4
	.uleb128 0x2
	.4byte	0x86a
	.4byte	.LLST52
	.uleb128 0x1
	.4byte	0x876
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x881
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.4byte	0x85a
	.8byte	.LBB115
	.8byte	.LBE115-.LBB115
	.byte	0x59
	.byte	0xd
	.4byte	0x507
	.uleb128 0x2
	.4byte	0x86a
	.4byte	.LLST53
	.uleb128 0x1
	.4byte	0x876
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x881
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.4byte	0x85a
	.8byte	.LBB117
	.8byte	.LBE117-.LBB117
	.byte	0x5c
	.byte	0xd
	.4byte	0x53a
	.uleb128 0x2
	.4byte	0x86a
	.4byte	.LLST54
	.uleb128 0x1
	.4byte	0x876
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x881
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.4byte	0x833
	.8byte	.LBB119
	.8byte	.LBE119-.LBB119
	.byte	0x62
	.byte	0x33
	.4byte	0x564
	.uleb128 0x1
	.4byte	0x843
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x84e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.4byte	0x806
	.8byte	.LBB121
	.8byte	.LBE121-.LBB121
	.byte	0x64
	.byte	0xd
	.4byte	0x597
	.uleb128 0x2
	.4byte	0x811
	.4byte	.LLST55
	.uleb128 0x1
	.4byte	0x81c
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x827
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x11
	.8byte	.LVL71
	.4byte	0x158
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC4
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x87
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x833
	.8byte	.LBB71
	.8byte	.LBE71-.LBB71
	.byte	0x21
	.byte	0x23
	.4byte	0x5e3
	.uleb128 0x1
	.4byte	0x843
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x84e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xd
	.4byte	0x833
	.8byte	.LBB73
	.4byte	.LLRL20
	.byte	0x22
	.byte	0x22
	.4byte	0x60f
	.uleb128 0xe
	.4byte	.LLRL20
	.uleb128 0x1
	.4byte	0x843
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x84e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x7a5
	.8byte	.LBB76
	.4byte	.LLRL21
	.byte	0x2b
	.byte	0x9
	.4byte	0x644
	.uleb128 0x2
	.4byte	0x7b5
	.4byte	.LLST22
	.uleb128 0xe
	.4byte	.LLRL21
	.uleb128 0x1
	.4byte	0x7c1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x7cc
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x12
	.8byte	.LVL15
	.4byte	0x943
	.4byte	0x663
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.uleb128 0x12
	.8byte	.LVL20
	.4byte	0x158
	.4byte	0x682
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.uleb128 0x12
	.8byte	.LVL21
	.4byte	0x94c
	.4byte	0x699
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x12
	.8byte	.LVL74
	.4byte	0x130
	.4byte	0x6b1
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.8byte	.LVL84
	.4byte	0x943
	.4byte	0x6d0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.uleb128 0x11
	.8byte	.LVL86
	.4byte	0x943
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xc9
	.uleb128 0x27
	.4byte	.LASF39
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0x1
	.4byte	0x7a0
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x10
	.byte	0x19
	.4byte	0x6ec
	.uleb128 0x17
	.string	"x"
	.byte	0x1
	.byte	0x10
	.byte	0x30
	.4byte	0x59
	.uleb128 0x17
	.string	"y"
	.byte	0x1
	.byte	0x10
	.byte	0x3d
	.4byte	0x59
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x1
	.byte	0x10
	.byte	0x4e
	.4byte	0xd5
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x1
	.byte	0x10
	.byte	0x60
	.4byte	0x7a0
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x11
	.byte	0xf
	.4byte	0x59
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x12
	.byte	0xf
	.4byte	0x59
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x13
	.byte	0xf
	.4byte	0x59
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x14
	.byte	0xf
	.4byte	0x59
	.uleb128 0x18
	.uleb128 0x5
	.string	"row"
	.byte	0x1
	.byte	0x17
	.byte	0xe
	.4byte	0x52
	.uleb128 0x18
	.uleb128 0x5
	.string	"col"
	.byte	0x1
	.byte	0x18
	.byte	0x12
	.4byte	0x52
	.uleb128 0x18
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x19
	.byte	0x16
	.4byte	0x6ec
	.uleb128 0x11
	.8byte	.LVL9
	.4byte	0x16f
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0x124
	.uleb128 0x19
	.4byte	.LASF51
	.byte	0x3
	.byte	0x20
	.byte	0x13
	.4byte	0x52
	.4byte	0x7d8
	.uleb128 0x10
	.4byte	.LASF47
	.byte	0x3
	.byte	0x20
	.byte	0x33
	.4byte	0x7a0
	.uleb128 0x5
	.string	"a0"
	.byte	0x3
	.byte	0x21
	.byte	0x13
	.4byte	0x76
	.uleb128 0x5
	.string	"a7"
	.byte	0x3
	.byte	0x22
	.byte	0x13
	.4byte	0x76
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF49
	.byte	0x3
	.byte	0x1a
	.4byte	0x806
	.uleb128 0x10
	.4byte	.LASF48
	.byte	0x3
	.byte	0x1a
	.byte	0x2f
	.4byte	0xe6
	.uleb128 0x5
	.string	"a0"
	.byte	0x3
	.byte	0x1b
	.byte	0x12
	.4byte	0x52
	.uleb128 0x5
	.string	"a7"
	.byte	0x3
	.byte	0x1c
	.byte	0x12
	.4byte	0x52
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF50
	.byte	0x2
	.byte	0x14
	.4byte	0x833
	.uleb128 0x17
	.string	"us"
	.byte	0x2
	.byte	0x14
	.byte	0x2c
	.4byte	0xe6
	.uleb128 0x5
	.string	"a0"
	.byte	0x2
	.byte	0x15
	.byte	0x13
	.4byte	0x76
	.uleb128 0x5
	.string	"a7"
	.byte	0x2
	.byte	0x16
	.byte	0x13
	.4byte	0x76
	.byte	0
	.uleb128 0x19
	.4byte	.LASF52
	.byte	0x2
	.byte	0xc
	.byte	0x18
	.4byte	0xda
	.4byte	0x85a
	.uleb128 0x5
	.string	"a0"
	.byte	0x2
	.byte	0xd
	.byte	0x13
	.4byte	0x76
	.uleb128 0x5
	.string	"a7"
	.byte	0x2
	.byte	0xe
	.byte	0x13
	.4byte	0x76
	.byte	0
	.uleb128 0x19
	.4byte	.LASF53
	.byte	0x4
	.byte	0x1f
	.byte	0x14
	.4byte	0x88d
	.4byte	0x88d
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x4
	.byte	0x1f
	.byte	0x2e
	.4byte	0xd5
	.uleb128 0x5
	.string	"a0"
	.byte	0x4
	.byte	0x20
	.byte	0x13
	.4byte	0x76
	.uleb128 0x5
	.string	"a7"
	.byte	0x4
	.byte	0x21
	.byte	0x13
	.4byte	0x76
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF55
	.uleb128 0x28
	.4byte	0x6f1
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x93a
	.uleb128 0x2
	.4byte	0x6fe
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	0x70a
	.4byte	.LLST1
	.uleb128 0x2
	.4byte	0x714
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	0x71e
	.4byte	.LLST3
	.uleb128 0x2
	.4byte	0x72a
	.4byte	.LLST4
	.uleb128 0x8
	.4byte	0x736
	.4byte	.LLST5
	.uleb128 0x4
	.4byte	0x741
	.uleb128 0x4
	.4byte	0x74c
	.uleb128 0x4
	.4byte	0x757
	.uleb128 0x16
	.4byte	0x762
	.8byte	.LBB30
	.8byte	.LBE30-.LBB30
	.uleb128 0x8
	.4byte	0x763
	.4byte	.LLST6
	.uleb128 0xf
	.4byte	0x76f
	.4byte	.LLRL7
	.uleb128 0x8
	.4byte	0x770
	.4byte	.LLST8
	.uleb128 0xf
	.4byte	0x77c
	.4byte	.LLRL9
	.uleb128 0x8
	.4byte	0x77d
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF25
	.4byte	.LASF57
	.uleb128 0x1a
	.4byte	.LASF56
	.4byte	.LASF58
	.uleb128 0x1a
	.4byte	.LASF59
	.4byte	.LASF60
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
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
	.uleb128 0x11
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST11:
	.byte	0x6
	.8byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL71-.LVL16
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL71-.LVL16
	.uleb128 .LVL72-.LVL16
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL72-.LVL16
	.uleb128 .LVL82-.LVL16
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL83-.LVL16
	.uleb128 .LFE12-.LVL16
	.uleb128 0x1
	.byte	0x68
	.byte	0
.LLST12:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL81-.LVL17
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x1
	.byte	0x66
	.byte	0
.LLST13:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL71-.LVL17
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL71-.LVL17
	.uleb128 .LVL72-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL17
	.uleb128 .LVL79-.LVL17
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL27-.LVL17
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL49-.LVL17
	.uleb128 .LVL69-.LVL17
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL70-.LVL17
	.uleb128 .LVL76-.LVL17
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL28-.LVL17
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL49-.LVL17
	.uleb128 .LVL68-.LVL17
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL70-.LVL17
	.uleb128 .LVL77-.LVL17
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL59-.LVL17
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL59-.LVL17
	.uleb128 .LVL70-.LVL17
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL70-.LVL17
	.uleb128 .LVL76-.LVL17
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL55-.LVL17
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL55-.LVL17
	.uleb128 .LVL70-.LVL17
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL70-.LVL17
	.uleb128 .LVL77-.LVL17
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL83-.LVL17
	.uleb128 .LFE12-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x8
	.8byte	.LVL20
	.uleb128 .LVL21-1-.LVL20
	.uleb128 0x18
	.byte	0x91
	.sleb128 -128
	.byte	0x94
	.byte	0x4
	.byte	0x91
	.sleb128 -124
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x91
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.8byte	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL75-.LVL22
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL85-.LVL22
	.uleb128 .LVL87-.LVL22
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST24:
	.byte	0x8
	.8byte	.LVL24
	.uleb128 .LVL78-.LVL24
	.uleb128 0x1
	.byte	0x65
	.byte	0
.LLST25:
	.byte	0x8
	.8byte	.LVL63
	.uleb128 .LVL65-.LVL63
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST27:
	.byte	0x8
	.8byte	.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST29:
	.byte	0x8
	.8byte	.LVL25
	.uleb128 .LVL37-.LVL25
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST30:
	.byte	0x8
	.8byte	.LVL25
	.uleb128 .LVL27-.LVL25
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST31:
	.byte	0x8
	.8byte	.LVL25
	.uleb128 .LVL28-.LVL25
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST32:
	.byte	0x8
	.8byte	.LVL25
	.uleb128 .LVL37-.LVL25
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST33:
	.byte	0x8
	.8byte	.LVL25
	.uleb128 .LVL37-.LVL25
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.byte	0
.LLST35:
	.byte	0x8
	.8byte	.LVL29
	.uleb128 .LVL37-.LVL29
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST37:
	.byte	0x6
	.8byte	.LVL30
	.byte	0x4
	.uleb128 .LVL30-.LVL30
	.uleb128 .LVL31-.LVL30
	.uleb128 0x1
	.byte	0x6a
	.byte	0x4
	.uleb128 .LVL31-.LVL30
	.uleb128 .LVL33-.LVL30
	.uleb128 0x1
	.byte	0x69
	.byte	0x4
	.uleb128 .LVL34-.LVL30
	.uleb128 .LVL35-.LVL30
	.uleb128 0x1
	.byte	0x69
	.byte	0
.LLST40:
	.byte	0x8
	.8byte	.LVL37
	.uleb128 .LVL49-.LVL37
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST41:
	.byte	0x8
	.8byte	.LVL37
	.uleb128 .LVL49-.LVL37
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST42:
	.byte	0x8
	.8byte	.LVL37
	.uleb128 .LVL49-.LVL37
	.uleb128 0x1
	.byte	0x64
	.byte	0
.LLST43:
	.byte	0x8
	.8byte	.LVL37
	.uleb128 .LVL49-.LVL37
	.uleb128 0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST44:
	.byte	0x8
	.8byte	.LVL37
	.uleb128 .LVL49-.LVL37
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.byte	0
.LLST45:
	.byte	0x8
	.8byte	.LVL41
	.uleb128 .LVL49-.LVL41
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST46:
	.byte	0x6
	.8byte	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0x1
	.byte	0x6a
	.byte	0x4
	.uleb128 .LVL43-.LVL42
	.uleb128 .LVL45-.LVL42
	.uleb128 0x1
	.byte	0x69
	.byte	0x4
	.uleb128 .LVL46-.LVL42
	.uleb128 .LVL47-.LVL42
	.uleb128 0x1
	.byte	0x69
	.byte	0
.LLST48:
	.byte	0x8
	.8byte	.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x18
	.byte	0x91
	.sleb128 -128
	.byte	0x94
	.byte	0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x89
	.sleb128 0
	.byte	0x22
	.byte	0x7e
	.sleb128 0
	.byte	0x1e
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0
.LLST50:
	.byte	0x6
	.8byte	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL52-.LVL51
	.uleb128 0x3
	.byte	0x8
	.byte	0x71
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL51
	.uleb128 .LVL73-.LVL51
	.uleb128 0x3
	.byte	0x8
	.byte	0x71
	.byte	0x9f
	.byte	0
.LLST51:
	.byte	0x8
	.8byte	.LVL53
	.uleb128 .LVL54-.LVL53
	.uleb128 0x3
	.byte	0x8
	.byte	0x77
	.byte	0x9f
	.byte	0
.LLST52:
	.byte	0x8
	.8byte	.LVL55
	.uleb128 .LVL56-.LVL55
	.uleb128 0x3
	.byte	0x8
	.byte	0x73
	.byte	0x9f
	.byte	0
.LLST53:
	.byte	0x8
	.8byte	.LVL57
	.uleb128 .LVL58-.LVL57
	.uleb128 0x3
	.byte	0x8
	.byte	0x61
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x8
	.8byte	.LVL59
	.uleb128 .LVL60-.LVL59
	.uleb128 0x3
	.byte	0x8
	.byte	0x64
	.byte	0x9f
	.byte	0
.LLST55:
	.byte	0x8
	.8byte	.LVL64
	.uleb128 .LVL65-.LVL64
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST22:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL19-.LVL17
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST0:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL13-.LVL0
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL13-.LVL0
	.uleb128 .LFE11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LFE11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL3-.LVL0
	.uleb128 .LFE11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LFE11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5d
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LFE11-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x6
	.8byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LFE11-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x8
	.8byte	.LVL4
	.uleb128 .LVL12-.LVL4
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST8:
	.byte	0x6
	.8byte	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL6-.LVL5
	.uleb128 .LVL8-.LVL5
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL9-.LVL5
	.uleb128 .LVL10-.LVL5
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST10:
	.byte	0x8
	.8byte	.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x17
	.byte	0x87
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x7f
	.sleb128 0
	.byte	0x1e
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x84
	.sleb128 0
	.byte	0x22
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
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
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
.LLRL7:
	.byte	0x5
	.8byte	.LBB31
	.byte	0x4
	.uleb128 .LBB31-.LBB31
	.uleb128 .LBE31-.LBB31
	.byte	0x4
	.uleb128 .LBB35-.LBB31
	.uleb128 .LBE35-.LBB31
	.byte	0
.LLRL9:
	.byte	0x5
	.8byte	.LBB32
	.byte	0x4
	.uleb128 .LBB32-.LBB32
	.uleb128 .LBE32-.LBB32
	.byte	0x4
	.uleb128 .LBB33-.LBB32
	.uleb128 .LBE33-.LBB32
	.byte	0x4
	.uleb128 .LBB34-.LBB32
	.uleb128 .LBE34-.LBB32
	.byte	0
.LLRL20:
	.byte	0x5
	.8byte	.LBB73
	.byte	0x4
	.uleb128 .LBB73-.LBB73
	.uleb128 .LBE73-.LBB73
	.byte	0x4
	.uleb128 .LBB79-.LBB73
	.uleb128 .LBE79-.LBB73
	.byte	0
.LLRL21:
	.byte	0x5
	.8byte	.LBB76
	.byte	0x4
	.uleb128 .LBB76-.LBB76
	.uleb128 .LBE76-.LBB76
	.byte	0x4
	.uleb128 .LBB80-.LBB76
	.uleb128 .LBE80-.LBB76
	.byte	0
.LLRL23:
	.byte	0x5
	.8byte	.LBB81
	.byte	0x4
	.uleb128 .LBB81-.LBB81
	.uleb128 .LBE81-.LBB81
	.byte	0x4
	.uleb128 .LBB124-.LBB81
	.uleb128 .LBE124-.LBB81
	.byte	0x4
	.uleb128 .LBB125-.LBB81
	.uleb128 .LBE125-.LBB81
	.byte	0x4
	.uleb128 .LBB126-.LBB81
	.uleb128 .LBE126-.LBB81
	.byte	0x4
	.uleb128 .LBB127-.LBB81
	.uleb128 .LBE127-.LBB81
	.byte	0x4
	.uleb128 .LBB128-.LBB81
	.uleb128 .LBE128-.LBB81
	.byte	0
.LLRL26:
	.byte	0x5
	.8byte	.LBB82
	.byte	0x4
	.uleb128 .LBB82-.LBB82
	.uleb128 .LBE82-.LBB82
	.byte	0x4
	.uleb128 .LBB86-.LBB82
	.uleb128 .LBE86-.LBB82
	.byte	0x4
	.uleb128 .LBB107-.LBB82
	.uleb128 .LBE107-.LBB82
	.byte	0
.LLRL28:
	.byte	0x5
	.8byte	.LBB89
	.byte	0x4
	.uleb128 .LBB89-.LBB89
	.uleb128 .LBE89-.LBB89
	.byte	0x4
	.uleb128 .LBB105-.LBB89
	.uleb128 .LBE105-.LBB89
	.byte	0
.LLRL34:
	.byte	0x5
	.8byte	.LBB91
	.byte	0x4
	.uleb128 .LBB91-.LBB91
	.uleb128 .LBE91-.LBB91
	.byte	0x4
	.uleb128 .LBB96-.LBB91
	.uleb128 .LBE96-.LBB91
	.byte	0
.LLRL36:
	.byte	0x5
	.8byte	.LBB92
	.byte	0x4
	.uleb128 .LBB92-.LBB92
	.uleb128 .LBE92-.LBB92
	.byte	0x4
	.uleb128 .LBB95-.LBB92
	.uleb128 .LBE95-.LBB92
	.byte	0
.LLRL38:
	.byte	0x5
	.8byte	.LBB93
	.byte	0x4
	.uleb128 .LBB93-.LBB93
	.uleb128 .LBE93-.LBB93
	.byte	0x4
	.uleb128 .LBB94-.LBB93
	.uleb128 .LBE94-.LBB93
	.byte	0
.LLRL39:
	.byte	0x5
	.8byte	.LBB98
	.byte	0x4
	.uleb128 .LBB98-.LBB98
	.uleb128 .LBE98-.LBB98
	.byte	0x4
	.uleb128 .LBB106-.LBB98
	.uleb128 .LBE106-.LBB98
	.byte	0
.LLRL47:
	.byte	0x5
	.8byte	.LBB102
	.byte	0x4
	.uleb128 .LBB102-.LBB102
	.uleb128 .LBE102-.LBB102
	.byte	0x4
	.uleb128 .LBB103-.LBB102
	.uleb128 .LBE103-.LBB102
	.byte	0
.LLRL49:
	.byte	0x5
	.8byte	.LBB108
	.byte	0x4
	.uleb128 .LBB108-.LBB108
	.uleb128 .LBE108-.LBB108
	.byte	0x4
	.uleb128 .LBB123-.LBB108
	.uleb128 .LBE123-.LBB108
	.byte	0
.LLRL56:
	.byte	0x7
	.8byte	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.8byte	.LFB12
	.uleb128 .LFE12-.LFB12
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF24:
	.string	"printf"
.LASF35:
	.string	"framebuffer"
.LASF23:
	.string	"malloc"
.LASF12:
	.string	"size_t"
.LASF6:
	.string	"__uint8_t"
.LASF43:
	.string	"y_start"
.LASF54:
	.string	"key_code"
.LASF57:
	.string	"__builtin_memset"
.LASF16:
	.string	"long long unsigned int"
.LASF46:
	.string	"pixel"
.LASF60:
	.string	"__builtin_calloc"
.LASF38:
	.string	"free"
.LASF44:
	.string	"x_end"
.LASF13:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF22:
	.string	"fb_info_t"
.LASF9:
	.string	"long int"
.LASF58:
	.string	"__builtin_puts"
.LASF7:
	.string	"__uint32_t"
.LASF11:
	.string	"__intptr_t"
.LASF48:
	.string	"buffer_address"
.LASF8:
	.string	"unsigned int"
.LASF26:
	.string	"last_update_us"
.LASF41:
	.string	"fb_info"
.LASF10:
	.string	"long unsigned int"
.LASF61:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF20:
	.string	"width"
.LASF5:
	.string	"short unsigned int"
.LASF19:
	.string	"intptr_t"
.LASF52:
	.string	"get_us"
.LASF56:
	.string	"puts"
.LASF50:
	.string	"sleep_us"
.LASF14:
	.string	"long double"
.LASF45:
	.string	"y_end"
.LASF33:
	.string	"framebuffer_info"
.LASF42:
	.string	"x_start"
.LASF49:
	.string	"show_buffer"
.LASF29:
	.string	"last_x"
.LASF30:
	.string	"last_y"
.LASF55:
	.string	"_Bool"
.LASF3:
	.string	"unsigned char"
.LASF39:
	.string	"draw_cube"
.LASF4:
	.string	"short int"
.LASF47:
	.string	"info"
.LASF59:
	.string	"calloc"
.LASF18:
	.string	"uint32_t"
.LASF40:
	.string	"color"
.LASF15:
	.string	"char"
.LASF34:
	.string	"fb_size"
.LASF25:
	.string	"memset"
.LASF53:
	.string	"key_pressed"
.LASF37:
	.string	"sleep_time_us"
.LASF17:
	.string	"uint8_t"
.LASF51:
	.string	"get_framebuffer_info"
.LASF27:
	.string	"next_frame_us"
.LASF31:
	.string	"cur_x"
.LASF32:
	.string	"cur_y"
.LASF36:
	.string	"current_us"
.LASF21:
	.string	"height"
.LASF62:
	.string	"main"
.LASF28:
	.string	"frames"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug"
.LASF0:
	.string	"/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
