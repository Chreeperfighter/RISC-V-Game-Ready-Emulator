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
	.type	fill_rect, @function
fill_rect:
.LFB7:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 44 74
	.cfi_startproc
.LVL0:
	.loc 1 46 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:46:     if (x < 0) { w += x; x = 0; }
	.loc 1 46 20 is_stmt 0 discriminator 1
	addw	t3,a3,a5	# w, tmp160, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 20 discriminator 1
	addw	t1,a4,a6	# h, _22, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:46:     if (x < 0) { w += x; x = 0; }
	.loc 1 46 8
	blt	a3,zero,.L2	#, x,,
	.loc 1 47 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 8 is_stmt 0
	blt	a4,zero,.L3	#, y,,
	.loc 1 48 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ble	t3,a1,.L23	#, tmp160, width,
	.loc 1 48 24 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 is_stmt 0 discriminator 1
	subw	a5,a1,a3	# w, width, x
.LVL1:
.L11:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bge	a2,t1,.L12	#, height, _22,
.L5:
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	subw	a6,a2,a4	# h, height, y
.LVL2:
.L12:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	a5,zero,.L1	#, w,,
.LVL3:
.L6:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 16 discriminator 2
	ble	a6,zero,.L1	#, h,,
.L10:
	.loc 1 53 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 28 is_stmt 0
	mulw	a4,a1,a4	# tmp170, width, y
	slli	a5,a5,2	#, _18, w
.LBB41:
.LBB42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	slli	a2,a1,2	#, _9, width
.LVL4:
.LBE42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14
	li	a1,0		# j,
.LVL5:
.LBE41:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36
	add	a4,a4,a3	# x, _6, tmp170
	slli	a4,a4,2	#, _7, _6
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 15
	add	a3,a0,a4	# _7, row, fb
.LVL6:
	.loc 1 54 5 is_stmt 1
.LBB47:
	.loc 1 54 10
	.loc 1 54 23 discriminator 1
	add	a4,a3,a5	# _18, ivtmp.49, row
.LVL7:
.L13:
.LBB45:
.LBB43:
	.loc 1 56 27 discriminator 1
.LBE43:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:55:         uint32_t *pixel = row;
	.loc 1 55 19 is_stmt 0
	mv	a5,a3	# pixel, row
.LVL8:
.L14:
.LBB44:
	.loc 1 57 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 19 is_stmt 0
	addi	a5,a5,4	#, pixel, pixel
.LVL9:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22
	sw	a7,-4(a5)	# color, MEM[(uint32_t *)pixel_38 + -4B]
	.loc 1 56 33 is_stmt 1 discriminator 3
.LVL10:
	.loc 1 56 27 discriminator 1
	bne	a5,a4,.L14	#, pixel, ivtmp.49,
.LBE44:
	.loc 1 59 9
.LBE45:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 29 is_stmt 0 discriminator 2
	addiw	a1,a1,1	#, j, j
.LVL11:
.LBB46:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	add	a3,a3,a2	# _9, row, row
.LVL12:
.LBE46:
	.loc 1 54 29 is_stmt 1 discriminator 2
	.loc 1 54 23 discriminator 1
	add	a4,a4,a2	# _9, ivtmp.49, ivtmp.49
	bne	a1,a6,.L13	#, j, h,
.LVL13:
.L1:
.LBE47:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:61: }
	.loc 1 61 1 is_stmt 0
	ret	
.LVL14:
.L3:
	.loc 1 48 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	bgt	t3,a1,.L17	#, tmp160, width,
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bgt	t1,a2,.L18	#, _22, height,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 20 discriminator 1
	mv	a6,t1	# h, _22
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 28 discriminator 1
	li	a4,0		# y,
	j	.L6		#
.LVL15:
.L2:
	.loc 1 47 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 8 is_stmt 0
	blt	a4,zero,.L7	#, y,,
	.loc 1 48 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ble	t3,a1,.L24	#, tmp160, width,
	.loc 1 48 24 is_stmt 1 discriminator 1
.LVL16:
	.loc 1 49 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bgt	t1,a2,.L16	#, _22, height,
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	a1,zero,.L1	#, width,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 discriminator 1
	mv	a5,a1	# w, width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8
	li	a3,0		# x,
	j	.L10		#
.LVL17:
.L23:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	ble	t1,a2,.L6	#, _22, height,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	subw	a6,a2,a4	# h, height, y
.LVL18:
	j	.L12		#
.LVL19:
.L24:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bgt	t1,a2,.L15	#, _22, height,
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	t3,zero,.L1	#, tmp160,,
	mv	a5,t3	# w, tmp160
	li	a3,0		# x,
	j	.L10		#
.LVL20:
.L17:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 20 discriminator 1
	mv	a6,t1	# h, _22
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 28 discriminator 1
	li	a4,0		# y,
	.loc 1 48 24 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 is_stmt 0 discriminator 1
	subw	a5,a1,a3	# w, width, x
.LVL21:
	j	.L11		#
.LVL22:
.L7:
	.loc 1 48 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ble	t3,a1,.L19	#, tmp160, width,
	li	a3,0		# x,
	.loc 1 48 24 is_stmt 1 discriminator 1
	mv	a6,t1	# h, _22
	li	a4,0		# y,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 is_stmt 0 discriminator 1
	subw	a5,a1,a3	# w, width, x
.LVL23:
	j	.L11		#
.LVL24:
.L19:
	mv	a5,t3	# w, tmp160
	mv	a6,t1	# h, _22
	li	a4,0		# y,
	li	a3,0		# x,
.LVL25:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bge	a2,t1,.L12	#, height, _22,
	j	.L5		#
.LVL26:
.L15:
	mv	a5,t3	# w, tmp160
	li	a3,0		# x,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	subw	a6,a2,a4	# h, height, y
.LVL27:
	j	.L12		#
.LVL28:
.L16:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 discriminator 1
	mv	a5,a1	# w, width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8
	li	a3,0		# x,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	subw	a6,a2,a4	# h, height, y
.LVL29:
	j	.L12		#
.LVL30:
.L18:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:47:     if (y < 0) { h += y; y = 0; }
	.loc 1 47 28 discriminator 1
	li	a4,0		# y,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	subw	a6,a2,a4	# h, height, y
	j	.L12		#
	.cfi_endproc
.LFE7:
	.size	fill_rect, .-fill_rect
	.align	1
	.type	draw_digit, @function
draw_digit:
.LFB8:
	.loc 1 64 86 is_stmt 1
	.cfi_startproc
.LVL31:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:66:     const uint8_t font[10][5] = {
	.loc 1 66 19 is_stmt 0
	lui	a6,%hi(.LANCHOR0)	# tmp181,
	addi	a6,a6,%lo(.LANCHOR0)	# tmp180, tmp181,
	ld	t6,0(a6)		# tmp182,
	ld	t5,8(a6)		# tmp183,
	ld	t4,16(a6)		# tmp184,
	ld	t3,24(a6)		# tmp185,
	ld	t1,32(a6)		# tmp186,
	ld	a7,40(a6)		# tmp187,
	lhu	a6,48(a6)	# tmp188,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:64: static void draw_digit(uint32_t *fb, int width, int height, int x, int y, int digit) {
	.loc 1 64 86
	addi	sp,sp,-240	#,,
	.cfi_def_cfa_offset 240
	sd	ra,232(sp)	#,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:66:     const uint8_t font[10][5] = {
	.loc 1 66 19
	sh	a6,120(sp)	# tmp188, font
	sd	t6,72(sp)	# tmp182, font
	sd	t5,80(sp)	# tmp183, font
	sd	t4,88(sp)	# tmp184, font
	sd	t3,96(sp)	# tmp185, font
	sd	t1,104(sp)	# tmp186, font
	sd	a7,112(sp)	# tmp187, font
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:     if (digit < 0 || digit > 9) return;
	.loc 1 79 8
	li	a6,9		# tmp189,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:64: static void draw_digit(uint32_t *fb, int width, int height, int x, int y, int digit) {
	.loc 1 64 86
	sd	a0,56(sp)	# tmp240, %sfp
	sd	a1,8(sp)	# width, %sfp
	sd	a2,48(sp)	# height, %sfp
	sd	a3,16(sp)	# x, %sfp
	.loc 1 66 5 is_stmt 1
	.loc 1 79 5
	.cfi_offset 1, -8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:     if (digit < 0 || digit > 9) return;
	.loc 1 79 8 is_stmt 0
	bgtu	a5,a6,.L25	#, digit, tmp189,
	mv	a0,a3	# x, tmp243
.LVL32:
	slli	a3,a5,2	#, tmp192, digit
.LVL33:
	add	a3,a3,a5	# digit, _27, tmp192
	slliw	a5,a1,1	#, tmp199, width
.LVL34:
	addw	a5,a5,a1	# width, tmp201, tmp199
	sd	a5,24(sp)	# tmp201, %sfp
	mulw	a5,a4,a1	# ivtmp.81, y, width
	sd	s5,184(sp)	#,
	.cfi_offset 21, -56
	addi	s5,sp,72	#, tmp190,
	sd	s2,208(sp)	#,
	sd	s4,192(sp)	#,
	sd	s6,176(sp)	#,
	sd	s8,160(sp)	#,
	sd	s0,224(sp)	#,
	sd	s1,216(sp)	#,
	sd	s3,200(sp)	#,
	sd	a5,0(sp)	# ivtmp.81, %sfp
	addiw	a5,a4,17	#, tmp207, y
	sd	a5,32(sp)	# tmp207, %sfp
	addiw	a5,a0,2	#, tmp236, x
	sd	s7,168(sp)	#,
	sd	s9,152(sp)	#,
	sd	s10,144(sp)	#,
	sd	s11,136(sp)	#,
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 24, -80
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 19, -40
	.cfi_offset 23, -72
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	add	s5,s5,a3	# _27, ivtmp.79, tmp190
.LBB55:
.LBB56:
.LBB57:
.LBB58:
.LBB59:
.LBB60:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	slli	s2,a1,2	#, _53, width
	subw	s8,a2,a4	# ivtmp.80, height, y
	addiw	s4,a4,2	#, ivtmp.82, y
	sd	a5,40(sp)	# tmp236, %sfp
.LBE60:
.LBE59:
.LBE58:
.LBE57:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:82:         for (int col = 0; col < 3; col++) {
	.loc 1 82 31 discriminator 1
	li	s6,-1		# tmp226,
.LVL35:
.L27:
	.loc 1 82 31 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:             if (font[digit][row] & (1 << (2 - col))) {
	.loc 1 83 28 is_stmt 0
	lbu	s3,0(s5)	# _3, MEM[(unsigned char *)_104]
	ld	s7,16(sp)		# ivtmp.70, %sfp
	ld	s10,40(sp)		# ivtmp.69, %sfp
	li	s11,2		# ivtmp.66,
.LVL36:
.L37:
	.loc 1 83 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:             if (font[digit][row] & (1 << (2 - col))) {
	.loc 1 83 17 is_stmt 0
	sraw	a5,s3,s11	# ivtmp.66, tmp209, _3
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:             if (font[digit][row] & (1 << (2 - col))) {
	.loc 1 83 16
	andi	a5,a5,1	#, tmp212, tmp209
	bne	a5,zero,.L45	#, tmp212,,
.L28:
	.loc 1 82 39 is_stmt 1 discriminator 2
.LVL37:
	.loc 1 82 31 discriminator 1
	addiw	s11,s11,-1	#, ivtmp.66, ivtmp.66
.LVL38:
	addiw	s10,s10,3	#, ivtmp.69, ivtmp.69
	addiw	s7,s7,3	#, ivtmp.70, ivtmp.70
	bne	s11,s6,.L37	#, ivtmp.66, tmp226,
.LBE56:
	.loc 1 81 35 discriminator 2
.LVL39:
	.loc 1 81 27 discriminator 1
	ld	a5,0(sp)		# ivtmp.81, %sfp
	ld	a4,24(sp)		# tmp201, %sfp
	addiw	s4,s4,3	#, ivtmp.82, ivtmp.82
	addi	s5,s5,1	#, ivtmp.79, ivtmp.79
.LVL40:
	addw	a5,a5,a4	# tmp201, ivtmp.81, ivtmp.81
	sd	a5,0(sp)	# ivtmp.81, %sfp
	ld	a5,32(sp)		# tmp207, %sfp
	addiw	s8,s8,-3	#, ivtmp.80, ivtmp.80
	bne	s4,a5,.L27	#, ivtmp.82, tmp207,
	ld	s0,224(sp)		#,
	.cfi_restore 8
	ld	s1,216(sp)		#,
	.cfi_restore 9
	ld	s2,208(sp)		#,
	.cfi_restore 18
	ld	s3,200(sp)		#,
	.cfi_restore 19
	ld	s4,192(sp)		#,
	.cfi_restore 20
	ld	s5,184(sp)		#,
	.cfi_restore 21
.LVL41:
	ld	s6,176(sp)		#,
	.cfi_restore 22
	ld	s7,168(sp)		#,
	.cfi_restore 23
	ld	s8,160(sp)		#,
	.cfi_restore 24
	ld	s9,152(sp)		#,
	.cfi_restore 25
	ld	s10,144(sp)		#,
	.cfi_restore 26
	ld	s11,136(sp)		#,
	.cfi_restore 27
.LVL42:
.L25:
.LBE55:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:88: }
	.loc 1 88 1 is_stmt 0
	ld	ra,232(sp)		#,
	.cfi_restore 1
	addi	sp,sp,240	#,,
	.cfi_def_cfa_offset 0
.LVL43:
	jr	ra		#
.LVL44:
.L45:
	.cfi_def_cfa_offset 240
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
.LBB69:
.LBB68:
	.loc 1 84 17 is_stmt 1
	mv	a5,s7	# x, ivtmp.70
.LVL45:
.LBB67:
.LBB66:
	.loc 1 46 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 11 is_stmt 0
	mv	s0,s10	# w, ivtmp.69
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:46:     if (x < 0) { w += x; x = 0; }
	.loc 1 46 8
	blt	s7,zero,.L29	#, ivtmp.70,,
	.loc 1 47 5 is_stmt 1
	.loc 1 48 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ld	a4,8(sp)		# width, %sfp
	blt	a4,s10,.L30	#, width, ivtmp.69,
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	ld	a4,48(sp)		# height, %sfp
	bge	a4,s4,.L46	#, height, ivtmp.82,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	mv	s1,s8	# h, ivtmp.80
.LVL46:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	li	s0,2		# w,
.LVL47:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 16 discriminator 2
	ble	s8,zero,.L28	#, ivtmp.80,,
	j	.L32		#
.LVL48:
.L29:
	.loc 1 46 18 is_stmt 1 discriminator 1
	.loc 1 46 26
	.loc 1 47 5
	.loc 1 48 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ld	a5,8(sp)		# width, %sfp
.LVL49:
	blt	a5,s10,.L28	#, width, ivtmp.69,
.LVL50:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8
	ld	a4,48(sp)		# height, %sfp
	li	a5,0		# x,
.LVL51:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	blt	a4,s4,.L34	#, height, ivtmp.82,
.LVL52:
.L47:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	s0,zero,.L28	#, w,,
	li	s1,2		# h,
.LVL53:
.L32:
	.loc 1 53 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36 is_stmt 0
	ld	a4,0(sp)		# ivtmp.81, %sfp
.LBB64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14
	li	s9,0		# j,
.LBE64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36
	add	a5,a4,a5	# x, _45, ivtmp.81
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 15
	ld	a4,56(sp)		# fb, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36
	slli	a5,a5,2	#, _46, _45
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 15
	add	a5,a4,a5	# _46, row, fb
.LVL54:
	.loc 1 54 5 is_stmt 1
.LBB65:
	.loc 1 54 10
	.loc 1 54 23 discriminator 1
.LBB62:
.LBB61:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22 is_stmt 0
	slli	a4,s0,32	#, tmp246, w
	srli	s0,a4,30	#, _50, tmp246
.LVL55:
.L36:
	.loc 1 56 27 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22 is_stmt 0
	mv	a0,a5	#, row
	mv	a2,s0	#, _50
	li	a1,255		#,
	call	memset		#
.LVL56:
.LBE61:
	.loc 1 59 9 is_stmt 1
.LBE62:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 29 is_stmt 0 discriminator 2
	addiw	s9,s9,1	#, j, j
.LVL57:
.LBB63:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	add	a5,a0,s2	# _53, row, row
.LVL58:
.LBE63:
	.loc 1 54 29 is_stmt 1 discriminator 2
	.loc 1 54 23 discriminator 1
	bne	s9,s1,.L36	#, j, h,
	j	.L28		#
.LVL59:
.L30:
.LBE65:
	.loc 1 48 24 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 26 is_stmt 0 discriminator 1
	ld	a4,8(sp)		# width, %sfp
	subw	s0,a4,s7	# w, width, ivtmp.70
.LVL60:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	ld	a4,48(sp)		# height, %sfp
	bge	a4,s4,.L47	#, height, ivtmp.82,
.LVL61:
.L34:
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	mv	s1,s8	# h, ivtmp.80
.LVL62:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	s0,zero,.L28	#, w,,
.LVL63:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 16 discriminator 2
	ble	s8,zero,.L28	#, ivtmp.80,,
	j	.L32		#
.LVL64:
.L46:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8
	li	s1,2		# h,
	mv	s0,s1	# w, h
	j	.L32		#
.LBE66:
.LBE67:
.LBE68:
.LBE69:
	.cfi_endproc
.LFE8:
	.size	draw_digit, .-draw_digit
	.align	1
	.type	draw_number, @function
draw_number:
.LFB9:
	.loc 1 90 85 is_stmt 1
	.cfi_startproc
.LVL65:
	.loc 1 91 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:91:     if (num == 0) {
	.loc 1 91 8 is_stmt 0
	beq	a5,zero,.L49	#, num,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:90: static void draw_number(uint32_t *fb, int width, int height, int x, int y, int num) {
	.loc 1 90 85
	addi	sp,sp,-112	#,,
	.cfi_def_cfa_offset 112
	sd	s0,96(sp)	#,
	sd	s1,88(sp)	#,
	sd	s2,80(sp)	#,
	sd	s3,72(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s0,a0	# fb, tmp238
	sd	ra,104(sp)	#,
.LBB73:
.LBB74:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 31
	li	a0,1717985280		# tmp244,
.LVL66:
	mv	s2,a2	# height, tmp240
	mv	s3,a4	# y, tmp242
.LVL67:
	.loc 1 98 16 is_stmt 1
	mv	a7,a5	# num, tmp243
	mv	s1,a1	# width, tmp239
	mv	t1,a3	# x, tmp241
	addi	a2,sp,8	#, tmp246,
.LVL68:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 31 is_stmt 0
	addi	a0,a0,1639	#, tmp180, tmp244
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:97:     int count = 0;
	.loc 1 97 9
	li	a4,0		# count,
.LVL69:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:98:     while (num > 0) {
	.loc 1 98 16
	li	t3,9		# tmp218,
	.cfi_offset 1, -8
	ble	a5,zero,.L48	#, num,,
	sd	s4,64(sp)	#,
	sd	s5,56(sp)	#,
	sd	s6,48(sp)	#,
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
.LVL70:
.L52:
	.loc 1 99 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 31 is_stmt 0
	mul	a6,a7,a0	# tmp179, num, tmp180
	sraiw	a5,a7,31	#, tmp186, num
	mv	a3,a7	# num, num
	mv	a1,a4	# count, count
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:98:     while (num > 0) {
	.loc 1 98 16
	addi	a2,a2,4	#, ivtmp.105, ivtmp.105
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 21
	addiw	a4,a4,1	#, count, count
.LVL71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 31
	srai	a6,a6,34	#, tmp184, tmp179
	subw	a6,a6,a5	# tmp188, tmp184, tmp186
	slliw	a5,a6,2	#, tmp191, tmp188
	addw	a5,a5,a6	# tmp188, tmp193, tmp191
	slliw	a5,a5,1	#, tmp195, tmp193
	subw	a5,a7,a5	# tmp197, num, tmp195
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99:         digits[count++] = num % 10;
	.loc 1 99 25
	sw	a5,-4(a2)	# tmp197, MEM[(int *)_45]
	.loc 1 100 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:100:         num /= 10;
	.loc 1 100 13 is_stmt 0
	mv	a7,a6	# num, tmp188
.LVL72:
	.loc 1 98 16 is_stmt 1
	bgt	a3,t3,.L52	#, num, tmp218,
	slliw	s6,a1,1	#, tmp224, count
	addw	s6,s6,a1	# count, tmp226, tmp224
	slliw	s6,s6,2	#, tmp228, tmp226
	slli	a1,a1,2	#, _4, count
	addiw	s4,t1,12	#, tmp237, x
	addi	a5,sp,8	#, tmp247,
	add	s5,a5,a1	# _4, ivtmp.99, tmp247
	addw	s6,s4,s6	# tmp228, tmp232, tmp237
	j	.L55		#
.LVL73:
.L64:
	addiw	s4,s4,12	#, tmp237, tmp237
.LVL74:
.L55:
.LBB75:
	.loc 1 105 9
	lw	a5,0(s5)		#, MEM[(int *)_14]
	mv	a3,t1	#, x
	mv	a4,s3	#, y
	mv	a2,s2	#, height
	mv	a1,s1	#, width
	mv	a0,s0	#, fb
	call	draw_digit		#
.LVL75:
	.loc 1 106 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:104:     for (int i = count - 1; i >= 0; i--) {
	.loc 1 104 31 is_stmt 0 discriminator 1
	addi	s5,s5,-4	#, ivtmp.99, ivtmp.99
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:106:         x += 12;
	.loc 1 106 11
	mv	t1,s4	# x, tmp237
.LVL76:
	.loc 1 104 38 is_stmt 1 discriminator 3
	.loc 1 104 31 discriminator 1
	bne	s4,s6,.L64	#, tmp237, tmp232,
	ld	s4,64(sp)		#,
	.cfi_restore 20
	ld	s5,56(sp)		#,
	.cfi_restore 21
	ld	s6,48(sp)		#,
	.cfi_restore 22
.LVL77:
.L48:
.LBE75:
.LBE74:
.LBE73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:108: }
	.loc 1 108 1 is_stmt 0
	ld	ra,104(sp)		#,
	.cfi_restore 1
	ld	s0,96(sp)		#,
	.cfi_restore 8
.LVL78:
	ld	s1,88(sp)		#,
	.cfi_restore 9
.LVL79:
	ld	s2,80(sp)		#,
	.cfi_restore 18
.LVL80:
	ld	s3,72(sp)		#,
	.cfi_restore 19
.LVL81:
	addi	sp,sp,112	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
.LVL82:
.L49:
	.loc 1 92 9 is_stmt 1
	tail	draw_digit		#
.LVL83:
	.cfi_endproc
.LFE9:
	.size	draw_number, .-draw_number
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB10:
	.loc 1 110 16
	.cfi_startproc
	.loc 1 111 5
	.loc 1 112 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:110: int main(void) {
	.loc 1 110 16 is_stmt 0
	addi	sp,sp,-320	#,,
	.cfi_def_cfa_offset 320
.LVL84:
.LBB116:
.LBB117:
	.file 2 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h"
	.loc 2 33 5 is_stmt 1
.LBE117:
.LBE116:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:110: int main(void) {
	.loc 1 110 16 is_stmt 0
	sd	ra,312(sp)	#,
	sd	s0,304(sp)	#,
.LBB119:
.LBB118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:33:     register long a0 __asm__("a0") = (long)info;
	.loc 2 33 38
	addi	a0,sp,192	#, a0,
.LVL85:
	.loc 2 34 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:34:     register long a7 __asm__("a7") = GET_FRAMEBUFFER_INFO;
	.loc 2 34 19 is_stmt 0
	li	a7,200		# a7,
	.loc 2 36 5 is_stmt 1
 #APP
# 36 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL86:
	.loc 2 37 5
	.cfi_offset 1, -8
	.cfi_offset 8, -16
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:37:     return a0;  // Returns 0 on success, -1 on error
	.loc 2 37 12 is_stmt 0
 #NO_APP
	sext.w	s0,a0	# <retval>, tmp538
.LVL87:
.LBE118:
.LBE119:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:112:     if (get_framebuffer_info(&fb_info) != 0) {
	.loc 1 112 8 discriminator 1
	bne	s0,zero,.L66	#, <retval>,,
	.loc 1 116 5 is_stmt 1
	sd	s2,288(sp)	#,
	sd	s3,280(sp)	#,
	.cfi_offset 18, -32
	.cfi_offset 19, -40
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:117:     int height = fb_info.height;
	.loc 1 117 25 is_stmt 0
	lw	s2,196(sp)		# _3, fb_info.height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:116:     int width = fb_info.width;
	.loc 1 116 24
	lw	s3,192(sp)		# _2, fb_info.width
.LVL88:
	.loc 1 117 5 is_stmt 1
	.loc 1 118 5
	sd	s1,296(sp)	#,
	sd	s4,272(sp)	#,
	.cfi_offset 9, -24
	.cfi_offset 20, -48
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:118:     int total_pixels = width * height;
	.loc 1 118 9 is_stmt 0
	mulw	s1,s3,s2	# tmp257, _2, _3
.LVL89:
	.loc 1 121 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:121:     uint32_t *framebuffer = (uint32_t*)malloc(total_pixels * sizeof(uint32_t));
	.loc 1 121 40 is_stmt 0
	slli	a0,s1,2	#,, tmp257
	call	malloc		#
.LVL90:
	mv	s4,a0	# framebuffer, tmp539
.LVL91:
	.loc 1 122 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:122:     if (!framebuffer) return -1;
	.loc 1 122 8 is_stmt 0
	beq	a0,zero,.L154	#, framebuffer,,
	.loc 1 125 5 is_stmt 1
.LVL92:
.LBB120:
.LBB121:
	.loc 1 36 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:36:     uint32_t *end = fb + count;
	.loc 1 36 24 is_stmt 0
	slli	a5,s1,32	#, tmp570, tmp257
	srli	a4,a5,30	#, _111, tmp570
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:36:     uint32_t *end = fb + count;
	.loc 1 36 15
	add	a5,a0,a4	# _111, end, framebuffer
	sd	s5,264(sp)	#,
	sd	s6,256(sp)	#,
	sd	s7,248(sp)	#,
	sd	s8,240(sp)	#,
	sd	s9,232(sp)	#,
	sd	s10,224(sp)	#,
	sd	s11,216(sp)	#,
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:36:     uint32_t *end = fb + count;
	.loc 1 36 24
	sd	a4,48(sp)	# _111, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:36:     uint32_t *end = fb + count;
	.loc 1 36 15
	sd	a5,104(sp)	# end, %sfp
.LVL93:
	.loc 1 37 5 is_stmt 1
	.loc 1 37 15
	bgeu	a0,a5,.L70	#, framebuffer, end,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:38:         *fb++ = COLOR_BLACK;
	.loc 1 38 15 is_stmt 0
	ld	a2,48(sp)		#, %sfp
	li	a1,0		#,
	call	memset		#
.LVL94:
.L70:
.LBE121:
.LBE120:
	.loc 1 126 5 is_stmt 1
	li	a4,10		#,
	mv	a3,a4	#,
	mv	a5,s3	#, _2
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	call	draw_number		#
.LVL95:
	.loc 1 127 5
	mv	a5,s2	#, _3
	mv	a0,s4	#, framebuffer
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	li	a4,30		#,
	li	a3,10		#,
	call	draw_number		#
.LVL96:
	.loc 1 128 5
.LBB122:
.LBB123:
	.loc 2 27 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = buffer_address;
	.loc 2 27 18 is_stmt 0
	sext.w	a5,s4	# buffer_address.13_109, framebuffer
	mv	a0,a5	# a0, buffer_address.13_109
	.loc 2 28 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:28:     register int a7 asm("a7") = SHOW_BUFFER;
	.loc 2 28 18 is_stmt 0
	li	a7,101		# a7,
	.loc 2 29 5 is_stmt 1
 #APP
# 29 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL97:
 #NO_APP
.LBE123:
.LBE122:
	.loc 1 131 5
	.loc 1 131 12
.LBB124:
.LBB125:
	.file 3 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h"
	.loc 3 14 5
	.loc 3 15 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:15:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 3 15 19 is_stmt 0
	li	a7,13		# a7,
	.loc 3 17 5 is_stmt 1
 #APP
# 17 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE125:
.LBE124:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:131:     while (!key_available()) {
	.loc 1 131 12 is_stmt 0 discriminator 1
	bne	a0,zero,.L69	#, tmp540,,
.L68:
	.loc 1 132 9 is_stmt 1
.LVL98:
.LBB127:
.LBB128:
	.file 4 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h"
	.loc 4 21 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:21:     register long a0 __asm__("a0") = us;
	.loc 4 21 19 is_stmt 0
	li	a0,16384		# tmp569,
	addi	a0,a0,282	#, a0, tmp569
	.loc 4 22 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:22:     register long a7 __asm__("a7") = SLEEP_US;
	.loc 4 22 19 is_stmt 0
	li	a7,12		# a7,
	.loc 4 24 5 is_stmt 1
 #APP
# 24 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
.LVL99:
 #NO_APP
.LBE128:
.LBE127:
	.loc 1 131 12
.LBB129:
.LBB126:
	.loc 3 14 5
	.loc 3 15 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:15:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 3 15 19 is_stmt 0
	li	a7,13		# a7,
	.loc 3 17 5 is_stmt 1
 #APP
# 17 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE126:
.LBE129:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:131:     while (!key_available()) {
	.loc 1 131 12 is_stmt 0 discriminator 1
	beq	a0,zero,.L68	#, tmp542,,
.L69:
	.loc 1 134 5 is_stmt 1
.LBB130:
.LBB131:
	.loc 3 22 5
	.loc 3 23 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:23:     register long a7 __asm__("a7") = GET_KEY;
	.loc 3 23 19 is_stmt 0
	li	a7,14		# a7,
	.loc 3 25 5 is_stmt 1
 #APP
# 25 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 26 5
 #NO_APP
.LBE131:
.LBE130:
	.loc 1 137 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:137:     Paddle left_paddle = {height / 2 - PADDLE_HEIGHT / 2};
	.loc 1 137 34 is_stmt 0
	srliw	a1,s2,31	# tmp271, _3,
	addw	a1,a1,s2	# _3, tmp273, tmp271
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 24
	srliw	s10,s3,31	# tmp281, _2,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:137:     Paddle left_paddle = {height / 2 - PADDLE_HEIGHT / 2};
	.loc 1 137 34
	sraiw	a1,a1,1	#, tmp275, tmp273
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 24
	addw	s10,s10,s3	# _2, tmp283, tmp281
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:137:     Paddle left_paddle = {height / 2 - PADDLE_HEIGHT / 2};
	.loc 1 137 38
	addiw	s9,a1,-40	#, left_paddle$y, tmp275
.LVL100:
	.loc 1 138 5 is_stmt 1
	.loc 1 139 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 24 is_stmt 0
	sraiw	s10,s10,1	#, tmp285, tmp283
.LVL101:
	.loc 1 141 5 is_stmt 1
	.loc 1 142 5
	.loc 1 143 5
	.loc 1 146 5
.LBB132:
.LBB133:
	.loc 4 13 5
	.loc 4 14 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 4 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 4 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 4 17 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12 is_stmt 0
 #NO_APP
	sext.w	a4,a0	# last_fps_time, tmp541
.LBE133:
.LBE132:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 10
	li	t4,3		# ball$vx,
.LBB135:
.LBB134:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12
	sd	a4,72(sp)	# last_fps_time, %sfp
.LVL102:
.LBE134:
.LBE135:
	.loc 1 147 5 is_stmt 1
	.loc 1 148 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 10 is_stmt 0
	li	t5,2		# ball$vy,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:148:     uint32_t current_fps = 60;
	.loc 1 148 14
	li	a4,60		# current_fps,
	mv	t3,t4	# ball$vx, ball$vx
	mv	s8,s0	# <retval>, <retval>
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:139:     Ball ball = {width / 2, height / 2, BALL_SPEED_X, BALL_SPEED_Y};
	.loc 1 139 10
	mv	t1,a1	# ball$y, tmp275
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:138:     Paddle right_paddle = {height / 2 - PADDLE_HEIGHT / 2};
	.loc 1 138 12
	mv	s11,s9	# right_paddle$y, left_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:142:     int right_score = 0;
	.loc 1 142 9
	sd	zero,88(sp)	#, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:141:     int left_score = 0;
	.loc 1 141 9
	sd	zero,80(sp)	#, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:148:     uint32_t current_fps = 60;
	.loc 1 148 14
	sd	a4,56(sp)	# current_fps, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:147:     uint32_t fps_counter = 0;
	.loc 1 147 14
	li	t6,0		# fps_counter,
	li	s6,46		# tmp531,
	lui	s7,%hi(.L76)	# tmp532,
	mv	s5,t5	# ball$vy, ball$vy
	mv	t4,s10	# ball$x, ball$x
	mv	s0,a5	# buffer_address.13_109, buffer_address.13_109
	sd	a1,112(sp)	# tmp275, %sfp
.LVL103:
.L71:
	.loc 1 150 5 is_stmt 1
.LBB136:
	.loc 1 151 9
.LBB137:
.LBB138:
	.loc 4 13 5
	.loc 4 14 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 4 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 4 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 4 17 5
 #NO_APP
.LBE138:
.LBE137:
.LBB141:
.LBB142:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:15:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 3 15 19 is_stmt 0
	li	a7,13		# a7,
.LBE142:
.LBE141:
.LBB145:
.LBB139:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12
	sd	a0,64(sp)	# tmp543, %sfp
.LVL104:
.LBE139:
.LBE145:
	.loc 1 152 9 is_stmt 1
	.loc 1 153 9
	.loc 1 156 9
	.loc 1 156 16
.LBB146:
.LBB143:
	.loc 3 14 5
	.loc 3 15 5
	.loc 3 17 5
 #APP
# 17 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE143:
.LBE146:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:156:         while (key_available()) {
	.loc 1 156 16 is_stmt 0 discriminator 1
	beq	a0,zero,.L72	#, tmp544,,
	li	a5,27		# tmp288,
.L85:
.LBB147:
	.loc 1 157 13 is_stmt 1
.LBB148:
.LBB149:
	.loc 3 22 5
	.loc 3 23 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:23:     register long a7 __asm__("a7") = GET_KEY;
	.loc 3 23 19 is_stmt 0
	li	a7,14		# a7,
	.loc 3 25 5 is_stmt 1
 #APP
# 25 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 26 5
 #NO_APP
.LBE149:
.LBE148:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:157:             unsigned char key = get_key();
	.loc 1 157 27 is_stmt 0 discriminator 1
	andi	a0,a0,0xff	# key, tmp545
.LVL105:
	.loc 1 160 13 is_stmt 1
	beq	a0,a5,.L73	#, key, tmp288,
	addiw	a0,a0,-73	#, tmp290, key
.LVL106:
	andi	a0,a0,0xff	# tmp291, tmp290
	bgtu	a0,s6,.L74	#, tmp291, tmp531,
	addi	a4,s7,%lo(.L76)	# tmp300, tmp532,
	slli	a0,a0,2	#, tmp298, tmp291
	add	a0,a0,a4	# tmp300, tmp299, tmp298
	lw	a4,0(a0)		# tmp303,
	jr	a4		# tmp303
	.section	.rodata
	.align	2
	.align	2
.L76:
	.word	.L79
	.word	.L74
	.word	.L78
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L77
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L75
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L79
	.word	.L74
	.word	.L78
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L77
	.word	.L74
	.word	.L74
	.word	.L74
	.word	.L75
	.section	.text.startup
.L75:
	.loc 1 161 17
.LVL107:
	.loc 1 162 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:161:                 left_paddle.y -= PADDLE_SPEED;
	.loc 1 161 31 is_stmt 0
	addiw	a4,s9,-20	#, tmp305, left_paddle$y
	sext.w	s9,a4	#, tmp305
.LVL108:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:162:                 if (left_paddle.y < 0) left_paddle.y = 0;
	.loc 1 162 20
	blt	a4,zero,.L157	#, tmp305,,
.LVL109:
.L74:
.LBE147:
	.loc 1 156 16 is_stmt 1
.LBB150:
.LBB144:
	.loc 3 14 5
	.loc 3 15 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:15:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 3 15 19 is_stmt 0
	li	a7,13		# a7,
	.loc 3 17 5 is_stmt 1
 #APP
# 17 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE144:
.LBE150:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:156:         while (key_available()) {
	.loc 1 156 16 is_stmt 0 discriminator 1
	bne	a0,zero,.L85	#, tmp546,,
.LVL110:
.L72:
	.loc 1 189 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:190:         ball.y += ball.vy;
	.loc 1 190 16 is_stmt 0
	addw	a5,s5,t1	# ball$y, _22, ball$vy
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:189:         ball.x += ball.vx;
	.loc 1 189 16
	addw	t4,t4,t3	# ball$vx, ball$x, ball$x
.LVL111:
	.loc 1 190 9 is_stmt 1
	.loc 1 193 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:193:         if (ball.y <= 0) {
	.loc 1 193 12 is_stmt 0
	bgt	a5,zero,.L86	#, _22,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:194:             ball.y = 0;
	.loc 1 194 20
	li	a5,0		# _22,
.LVL112:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:195:             ball.vy = BALL_SPEED_Y;
	.loc 1 195 21
	li	s5,2		# ball$vy,
.LVL113:
.L86:
	.loc 1 197 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:197:         if (ball.y >= height - BALL_SIZE) {
	.loc 1 197 30 is_stmt 0
	addiw	t1,s2,-6	#, ball$y, _3
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:197:         if (ball.y >= height - BALL_SIZE) {
	.loc 1 197 12
	bgt	t1,a5,.L158	#, ball$y, _22,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:199:             ball.vy = -BALL_SPEED_Y;
	.loc 1 199 21
	li	s5,-2		# ball$vy,
.LVL114:
	.loc 1 203 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:203:         if (ball.vx < 0 && ball.x <= PADDLE_WIDTH) {
	.loc 1 203 12 is_stmt 0
	blt	t3,zero,.L159	#, ball$vx,,
.L88:
.LVL115:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:215:         if (ball.vx > 0 && ball.x >= width - PADDLE_WIDTH - BALL_SIZE) {
	.loc 1 215 59 discriminator 1
	addiw	a4,s3,-14	#, _210, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:215:         if (ball.vx > 0 && ball.x >= width - PADDLE_WIDTH - BALL_SIZE) {
	.loc 1 215 25 discriminator 1
	blt	t4,a4,.L127	#, ball$x, _210,
	.loc 1 216 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:216:             if (ball.y + BALL_SIZE >= right_paddle.y &&
	.loc 1 216 24 is_stmt 0
	addiw	a5,t1,6	#, tmp353, ball$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:216:             if (ball.y + BALL_SIZE >= right_paddle.y &&
	.loc 1 216 16
	bge	a5,s11,.L118	#, tmp353, right_paddle$y,
.L127:
	li	t3,3		# ball$vx,
.L90:
.LVL116:
	.loc 1 227 9 is_stmt 1
	.loc 1 228 9
	.loc 1 231 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:231:         if (ball.x < -BALL_SIZE) {
	.loc 1 231 12 is_stmt 0
	li	a5,-6		# tmp372,
	bge	t4,a5,.L119	#, ball$x, tmp372,
.LVL117:
.L93:
	.loc 1 232 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:232:             right_score++;
	.loc 1 232 24 is_stmt 0
	ld	a5,88(sp)		# right_score, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:234:             ball.y = height / 2;
	.loc 1 234 20
	ld	t1,112(sp)		# ball$y, %sfp
.LVL118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:233:             ball.x = width / 2;
	.loc 1 233 20
	mv	t4,s10	# ball$x, tmp285
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:232:             right_score++;
	.loc 1 232 24
	addiw	a5,a5,1	#, right_score, right_score
	sd	a5,88(sp)	# right_score, %sfp
.LVL119:
	.loc 1 233 13 is_stmt 1
	.loc 1 234 13
	.loc 1 235 13
	.loc 1 236 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:236:             ball.vy = BALL_SPEED_Y;
	.loc 1 236 21 is_stmt 0
	li	s5,2		# ball$vy,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:235:             ball.vx = BALL_SPEED_X;
	.loc 1 235 21
	li	t3,3		# ball$vx,
.LVL120:
.L89:
	.loc 1 238 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:238:         if (ball.x > width) {
	.loc 1 238 12 is_stmt 0
	bge	s3,t4,.L96	#, _2, ball$x,
	.loc 1 239 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:239:             left_score++;
	.loc 1 239 23 is_stmt 0
	ld	a5,80(sp)		# left_score, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:241:             ball.y = height / 2;
	.loc 1 241 20
	ld	t1,112(sp)		# ball$y, %sfp
.LVL121:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:240:             ball.x = width / 2;
	.loc 1 240 20
	mv	t4,s10	# ball$x, tmp285
.LVL122:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:239:             left_score++;
	.loc 1 239 23
	addiw	a5,a5,1	#, left_score, left_score
	sd	a5,80(sp)	# left_score, %sfp
.LVL123:
	.loc 1 240 13 is_stmt 1
	.loc 1 241 13
	.loc 1 242 13
	.loc 1 243 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:243:             ball.vy = BALL_SPEED_Y;
	.loc 1 243 21 is_stmt 0
	li	s5,2		# ball$vy,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:242:             ball.vx = -BALL_SPEED_X;
	.loc 1 242 21
	li	t3,-3		# ball$vx,
.LVL124:
.L96:
	.loc 1 247 9 is_stmt 1
.LBB151:
.LBB152:
	.loc 1 36 5
	.loc 1 37 5
	.loc 1 37 15
	ld	a5,104(sp)		# end, %sfp
	bgeu	s4,a5,.L102	#, framebuffer, end,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:38:         *fb++ = COLOR_BLACK;
	.loc 1 38 15 is_stmt 0
	ld	a2,48(sp)		#, %sfp
	li	a1,0		#,
	mv	a0,s4	#, framebuffer
	sd	t1,32(sp)	# ball$y, %sfp
	sd	t3,24(sp)	# ball$vx, %sfp
	sd	t6,16(sp)	# fps_counter, %sfp
	sd	t4,8(sp)	# ball$x, %sfp
	call	memset		#
.LVL125:
	ld	t4,8(sp)		# ball$x, %sfp
	ld	t6,16(sp)		# fps_counter, %sfp
	ld	t3,24(sp)		# ball$vx, %sfp
	ld	t1,32(sp)		# ball$y, %sfp
.LVL126:
.L102:
.LBE152:
.LBE151:
	.loc 1 250 9 is_stmt 1
	li	a7,-16711680		# tmp567,
	addi	a7,a7,-256	#,, tmp567
	li	a6,80		#,
	li	a5,8		#,
	mv	a4,s9	#, left_paddle$y
	li	a3,0		#,
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	sd	t3,32(sp)	# ball$vx, %sfp
	sd	t6,24(sp)	# fps_counter, %sfp
	sd	t1,16(sp)	# ball$y, %sfp
	sd	t4,8(sp)	# ball$x, %sfp
	call	fill_rect		#
.LVL127:
	.loc 1 252 9
	li	a7,-16711680		# tmp568,
	mv	a4,s11	#, right_paddle$y
	addiw	a3,s3,-8	#,, _2
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	addi	a7,a7,-256	#,, tmp568
	li	a6,80		#,
	li	a5,8		#,
	call	fill_rect		#
.LVL128:
	.loc 1 256 9
	ld	t1,16(sp)		# ball$y, %sfp
	ld	t4,8(sp)		# ball$x, %sfp
	li	a6,6		#,
	mv	a4,t1	#, ball$y
	mv	a3,t4	#, ball$x
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	mv	a5,a6	#,
	li	a7,-65536		#,
	call	fill_rect		#
.LVL129:
	.loc 1 260 9
.LBB153:
	.loc 1 260 14
	.loc 1 260 27 discriminator 1
	ld	t4,8(sp)		# ball$x, %sfp
	ld	t1,16(sp)		# ball$y, %sfp
	ld	t6,24(sp)		# fps_counter, %sfp
	ld	t3,32(sp)		# ball$vx, %sfp
	ble	s2,zero,.L101	#, _3,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:261:             fill_rect(framebuffer, width, height, width / 2 - 1, y, 2, 10, COLOR_WHITE);
	.loc 1 261 13 is_stmt 0
	addiw	a0,s10,-1	#, tmp421, tmp285
	srliw	a5,a0,31	# tmp431, tmp421
	subw	a1,s3,a0	#, _2, tmp421
.LBB154:
.LBB155:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:46:     if (x < 0) { w += x; x = 0; }
	.loc 1 46 20 discriminator 1
	addiw	a4,s10,1	#, tmp425, tmp285
	beq	a5,zero,.L105	#, tmp431,,
	sext.w	a1,a4	#, tmp425
.L105:
	sext.w	a5,a0	#, tmp421
	bge	a0,zero,.L106	#, tmp421,,
	li	a5,0		#,
.L106:
	li	a6,20		# tmp435,
	mulw	a6,s3,a6	# tmp436, _2, tmp435
.LBB156:
.LBB157:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	slli	s1,s3,2	#, _201, _2
	li	a3,0		# ivtmp.127,
	li	a4,10		# ivtmp.128,
	sd	s4,40(sp)	# framebuffer, %sfp
	sd	s5,136(sp)	# ball$vy, %sfp
	sd	s0,152(sp)	# buffer_address.13_109, %sfp
	sd	s11,168(sp)	# right_paddle$y, %sfp
	sd	s9,176(sp)	# left_paddle$y, %sfp
	sd	s8,184(sp)	# <retval>, %sfp
	mv	s9,a3	# ivtmp.127, ivtmp.127
.LVL130:
	mv	a2,s3	# _2, _2
	sd	a5,96(sp)	# _198, %sfp
	sd	t4,120(sp)	# ball$x, %sfp
	sd	t6,128(sp)	# fps_counter, %sfp
	sd	t3,144(sp)	# ball$vx, %sfp
	sd	t1,160(sp)	# ball$y, %sfp
	mv	s5,a1	# w, w
.LVL131:
	mv	s0,s1	# _201, _201
	mv	s11,a4	# ivtmp.128, ivtmp.128
.LVL132:
	mv	s8,s2	# ivtmp.126, ivtmp.126
	mv	s3,s2	# _3, _3
.LVL133:
	sd	s10,32(sp)	# tmp285, %sfp
	mv	s4,a0	# tmp421, tmp421
	mv	a3,a6	# tmp436, tmp436
.LVL134:
.L114:
.LBE157:
.LBE156:
.LBE155:
.LBE154:
	.loc 1 261 13 is_stmt 1
.LBB172:
.LBB168:
	.loc 1 46 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:46:     if (x < 0) { w += x; x = 0; }
	.loc 1 46 8 is_stmt 0
	blt	s4,zero,.L107	#, tmp421,,
	.loc 1 47 5 is_stmt 1
	.loc 1 48 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	ld	a5,32(sp)		# tmp285, %sfp
	bge	a5,a2,.L108	#, tmp285, _2,
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	bge	s3,s11,.L129	#, _3, ivtmp.128,
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	mv	s2,s8	# h, ivtmp.126
.LVL135:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	mv	t5,s11	# ivtmp.128, ivtmp.128
	mv	a5,s4	# x, tmp421
	li	s1,2		# w,
.LVL136:
.L109:
	.loc 1 53 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 15 is_stmt 0
	ld	a4,40(sp)		# framebuffer, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36
	add	a5,s9,a5	# x, _193, ivtmp.127
.LBB165:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14
	li	s10,0		# j,
.LBE165:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 36
	slli	a5,a5,2	#, _194, _193
.LBB166:
.LBB161:
.LBB158:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22
	slli	a7,s1,32	#, tmp571, w
.LBE158:
.LBE161:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14
	sd	s3,8(sp)	# _3, %sfp
.LBE166:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:53:     uint32_t *row = fb + y * width + x;
	.loc 1 53 15
	add	a5,a4,a5	# _194, row, framebuffer
.LVL137:
	.loc 1 54 5 is_stmt 1
.LBB167:
	.loc 1 54 10
	.loc 1 54 23 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14 is_stmt 0
	mv	s3,s10	# j, j
.LBB162:
.LBB159:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22
	srli	s1,a7,30	#, _45, tmp571
.LBE159:
.LBE162:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 14
	mv	s10,a2	# _2, _2
	sd	t5,16(sp)	# ivtmp.128, %sfp
	sd	a3,24(sp)	# tmp436, %sfp
.LVL138:
.L113:
.LBB163:
.LBB160:
	.loc 1 56 27 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:57:             *pixel++ = color;
	.loc 1 57 22 is_stmt 0
	mv	a0,a5	#, row
	mv	a2,s1	#, _45
	li	a1,255		#,
	call	memset		#
.LVL139:
.LBE160:
	.loc 1 59 9 is_stmt 1
.LBE163:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:54:     for (int j = 0; j < h; j++) {
	.loc 1 54 29 is_stmt 0 discriminator 2
	addiw	s3,s3,1	#, j, j
.LVL140:
.LBB164:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:59:         row += width;
	.loc 1 59 13
	add	a5,a0,s0	# _201, row, row
.LVL141:
.LBE164:
	.loc 1 54 29 is_stmt 1 discriminator 2
	.loc 1 54 23 discriminator 1
	bne	s3,s2,.L113	#, j, h,
	ld	s3,8(sp)		# _3, %sfp
.LVL142:
	ld	t5,16(sp)		# ivtmp.128, %sfp
	ld	a3,24(sp)		# tmp436, %sfp
	mv	a2,s10	# _2, _2
.LVL143:
.L112:
.LBE167:
.LBE168:
.LBE172:
	.loc 1 260 39 discriminator 3
	.loc 1 260 27 discriminator 1
	addiw	a5,t5,10	#, tmp458, ivtmp.128
	addiw	s8,s8,-20	#, ivtmp.126, ivtmp.126
	addw	s9,a3,s9	# ivtmp.127, ivtmp.127, tmp436
	addiw	s11,s11,20	#, ivtmp.128, ivtmp.128
.LVL144:
	blt	a5,s3,.L114	#, tmp458, _3,
.LVL145:
.L155:
	ld	t4,120(sp)		# ball$x, %sfp
	ld	t6,128(sp)		# fps_counter, %sfp
	ld	s4,40(sp)		# framebuffer, %sfp
	ld	s5,136(sp)		# ball$vy, %sfp
	ld	t3,144(sp)		# ball$vx, %sfp
	ld	s0,152(sp)		# buffer_address.13_109, %sfp
	ld	t1,160(sp)		# ball$y, %sfp
	ld	s11,168(sp)		# right_paddle$y, %sfp
	ld	s9,176(sp)		# left_paddle$y, %sfp
	ld	s8,184(sp)		# <retval>, %sfp
	ld	s10,32(sp)		# tmp285, %sfp
	mv	s2,s3	# _3, _3
	mv	s3,a2	# _2, _2
.LVL146:
.L101:
.LBE153:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:265:         draw_number(framebuffer, width, height, width / 4, 20, left_score);
	.loc 1 265 9 is_stmt 0
	li	a6,4		# tmp399,
	divw	a3,s3,a6	# tmp399,, _2
	ld	a5,80(sp)		#, %sfp
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	li	a4,20		#,
	sd	t1,24(sp)	# ball$y, %sfp
	sd	t3,16(sp)	# ball$vx, %sfp
	sd	t4,8(sp)	# ball$x, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:153:         fps_counter++;
	.loc 1 153 20
	addiw	s1,t6,1	#, current_fps, fps_counter
	.loc 1 265 9 is_stmt 1
	call	draw_number		#
.LVL147:
	.loc 1 266 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:266:         draw_number(framebuffer, width, height, 3 * width / 4, 20, right_score);
	.loc 1 266 51 is_stmt 0
	li	a3,3		# tmp403,
	mulw	a3,a3,s3	# tmp404, tmp403, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:266:         draw_number(framebuffer, width, height, 3 * width / 4, 20, right_score);
	.loc 1 266 9
	li	a6,4		# tmp399,
	ld	a5,88(sp)		#, %sfp
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	mv	a0,s4	#, framebuffer
	li	a4,20		#,
	divw	a3,a3,a6	# tmp399,, tmp404
	call	draw_number		#
.LVL148:
	.loc 1 269 9 is_stmt 1
	ld	a5,56(sp)		#, %sfp
	mv	a0,s4	#, framebuffer
	addiw	a3,s3,-100	#,, _2
	mv	a2,s2	#, _3
	mv	a1,s3	#, _2
	li	a4,10		#,
	call	draw_number		#
.LVL149:
	.loc 1 272 9
.LBB176:
.LBB177:
	.loc 2 27 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = buffer_address;
	.loc 2 27 18 is_stmt 0
	mv	a0,s0	# a0, buffer_address.13_109
	.loc 2 28 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:28:     register int a7 asm("a7") = SHOW_BUFFER;
	.loc 2 28 18 is_stmt 0
	li	a7,101		# a7,
	.loc 2 29 5 is_stmt 1
 #APP
# 29 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL150:
 #NO_APP
.LBE177:
.LBE176:
	.loc 1 275 9
.LBB178:
.LBB179:
	.loc 4 13 5
	.loc 4 14 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 4 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 4 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 4 17 5
 #NO_APP
.LBE179:
.LBE178:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 26 is_stmt 0
	ld	a2,72(sp)		# last_fps_time, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 12
	li	a4,999424		# tmp566,
	addi	a4,a4,575	#, tmp418, tmp566
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 26
	subw	a3,a0,a2	# tmp414, tmp547, last_fps_time
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 12
	ld	t4,8(sp)		# ball$x, %sfp
	ld	t3,16(sp)		# ball$vx, %sfp
	ld	t1,24(sp)		# ball$y, %sfp
.LBB181:
.LBB180:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12
	sext.w	a5,a0	# last_fps_time, tmp547
.LVL151:
.LBE180:
.LBE181:
	.loc 1 276 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:278:             fps_counter = 0;
	.loc 1 278 25 is_stmt 0
	li	t6,0		# fps_counter,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 12
	bgtu	a3,a4,.L103	#, tmp414, tmp418,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:153:         fps_counter++;
	.loc 1 153 20
	mv	t6,s1	# fps_counter, current_fps
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:         if (current_time - last_fps_time >= 1000000) {  // 1 second
	.loc 1 276 12
	ld	s1,56(sp)		# current_fps, %sfp
	mv	a5,a2	# last_fps_time, last_fps_time
.LVL152:
.L103:
.LBB182:
.LBB140:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12
	lw	a3,64(sp)		# _121, %sfp
.LVL153:
.LBE140:
.LBE182:
	.loc 1 283 9 is_stmt 1
.LBB183:
.LBB184:
	.loc 4 13 5
	.loc 4 14 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:14:     register long a7 __asm__("a7") = GET_US;
	.loc 4 14 19 is_stmt 0
	li	a7,11		# a7,
	.loc 4 16 5 is_stmt 1
 #APP
# 16 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
.LVL154:
	.loc 4 17 5
 #NO_APP
.LBE184:
.LBE183:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:286:         if (frame_duration < FRAME_TIME_US) {
	.loc 1 286 12 is_stmt 0
	li	a4,16384		# tmp565,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:284:         uint32_t frame_duration = frame_end - frame_start;
	.loc 1 284 18
	subw	a2,a0,a3	# tmp461, tmp548, _121
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:286:         if (frame_duration < FRAME_TIME_US) {
	.loc 1 286 12
	addi	a4,a4,281	#, tmp465, tmp565
.LBB186:
.LBB185:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:17:     return a0;  // Returns 0 on success, -1 on error
	.loc 4 17 12
	sext.w	a0,a0	# _131, tmp548
.LVL155:
.LBE185:
.LBE186:
	.loc 1 284 9 is_stmt 1
	.loc 1 286 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:286:         if (frame_duration < FRAME_TIME_US) {
	.loc 1 286 12 is_stmt 0
	bgtu	a2,a4,.L115	#, tmp461, tmp465,
	.loc 1 287 13 is_stmt 1
.LVL156:
.LBB187:
.LBB188:
	.loc 4 21 5
.LBE188:
.LBE187:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:287:             sleep_us(FRAME_TIME_US - frame_duration);
	.loc 1 287 13 is_stmt 0
	li	a4,16384		# tmp564,
	addiw	a4,a4,282	#, tmp468, tmp564
	addw	a3,a3,a4	# tmp468, tmp470, _121
.LVL157:
	subw	a0,a3,a0	# tmp472, tmp470, _131
.LVL158:
.LBB190:
.LBB189:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:21:     register long a0 __asm__("a0") = us;
	.loc 4 21 19
	slli	a0,a0,32	#, a0, tmp472
	srli	a0,a0,32	#, a0, a0
	.loc 4 22 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:22:     register long a7 __asm__("a7") = SLEEP_US;
	.loc 4 22 19 is_stmt 0
	li	a7,12		# a7,
	.loc 4 24 5 is_stmt 1
 #APP
# 24 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
.LVL159:
 #NO_APP
.L115:
.LBE189:
.LBE190:
.LBE136:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:110: int main(void) {
	.loc 1 110 16 is_stmt 0
	sd	s1,56(sp)	# current_fps, %sfp
	sd	a5,72(sp)	# last_fps_time, %sfp
	j	.L71		#
.LVL160:
.L77:
.LBB203:
.LBB191:
	.loc 1 165 17 is_stmt 1
	.loc 1 166 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:166:                 if (left_paddle.y + PADDLE_HEIGHT > height)
	.loc 1 166 51 is_stmt 0
	addiw	a4,s9,99	#, tmp308, left_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:166:                 if (left_paddle.y + PADDLE_HEIGHT > height)
	.loc 1 166 20
	blt	a4,s2,.L160	#, tmp308, _3,
	.loc 1 167 21 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:167:                     left_paddle.y = height - PADDLE_HEIGHT;
	.loc 1 167 44 is_stmt 0
	addiw	s9,s2,-80	#, left_paddle$y, _3
.LVL161:
	j	.L74		#
.L78:
	.loc 1 176 17 is_stmt 1
.LVL162:
	.loc 1 177 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:177:                 if (right_paddle.y + PADDLE_HEIGHT > height)
	.loc 1 177 52 is_stmt 0
	addiw	a4,s11,99	#, tmp318, right_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:177:                 if (right_paddle.y + PADDLE_HEIGHT > height)
	.loc 1 177 20
	blt	a4,s2,.L161	#, tmp318, _3,
	.loc 1 178 21 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:178:                     right_paddle.y = height - PADDLE_HEIGHT;
	.loc 1 178 45 is_stmt 0
	addiw	s11,s2,-80	#, right_paddle$y, _3
.LVL163:
	j	.L74		#
.L79:
	.loc 1 172 17 is_stmt 1
.LVL164:
	.loc 1 173 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:                 right_paddle.y -= PADDLE_SPEED;
	.loc 1 172 32 is_stmt 0
	addiw	a4,s11,-20	#, tmp315, right_paddle$y
	sext.w	s11,a4	#, tmp315
.LVL165:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:173:                 if (right_paddle.y < 0) right_paddle.y = 0;
	.loc 1 173 20
	bge	a4,zero,.L74	#, tmp315,,
	li	s11,0		#,
	j	.L74		#
.LVL166:
.L73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:183:                 free(framebuffer);
	.loc 1 183 17
	mv	a0,s4	#, framebuffer
.LVL167:
	call	free		#
.LVL168:
	mv	s0,s8	# <retval>, <retval>
	.loc 1 183 17 is_stmt 1
	.loc 1 184 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:184:                 return 0;
	.loc 1 184 24 is_stmt 0
	ld	s1,296(sp)		#,
	.cfi_restore 9
	ld	s2,288(sp)		#,
	.cfi_restore 18
	ld	s3,280(sp)		#,
	.cfi_restore 19
.LVL169:
	ld	s4,272(sp)		#,
	.cfi_restore 20
	ld	s5,264(sp)		#,
	.cfi_restore 21
.LVL170:
	ld	s6,256(sp)		#,
	.cfi_restore 22
	ld	s7,248(sp)		#,
	.cfi_restore 23
	ld	s8,240(sp)		#,
	.cfi_restore 24
	ld	s9,232(sp)		#,
	.cfi_restore 25
.LVL171:
	ld	s10,224(sp)		#,
	.cfi_restore 26
	ld	s11,216(sp)		#,
	.cfi_restore 27
.LVL172:
.L149:
.LBE191:
.LBE203:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:293: }
	.loc 1 293 1
	ld	ra,312(sp)		#,
	.cfi_restore 1
	mv	a0,s0	#, <retval>
	ld	s0,304(sp)		#,
	.cfi_restore 8
	addi	sp,sp,320	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
.LVL173:
.L161:
	.cfi_def_cfa_offset 320
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
.LBB204:
.LBB192:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:                 right_paddle.y += PADDLE_SPEED;
	.loc 1 176 32
	addiw	s11,s11,20	#, right_paddle$y, right_paddle$y
.LVL174:
	j	.L74		#
.LVL175:
.L160:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:165:                 left_paddle.y += PADDLE_SPEED;
	.loc 1 165 31
	addiw	s9,s9,20	#, left_paddle$y, left_paddle$y
.LVL176:
	j	.L74		#
.L157:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:162:                 if (left_paddle.y < 0) left_paddle.y = 0;
	.loc 1 162 20
	li	s9,0		#,
	j	.L74		#
.LVL177:
.L158:
.LBE192:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:197:         if (ball.y >= height - BALL_SIZE) {
	.loc 1 197 12
	mv	t1,a5	# ball$y, _22
.LVL178:
	.loc 1 203 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:203:         if (ball.vx < 0 && ball.x <= PADDLE_WIDTH) {
	.loc 1 203 12 is_stmt 0
	bge	t3,zero,.L88	#, ball$vx,,
.L159:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:203:         if (ball.vx < 0 && ball.x <= PADDLE_WIDTH) {
	.loc 1 203 25 discriminator 1
	li	a5,8		# tmp330,
	bgt	t4,a5,.L122	#, ball$x, tmp330,
	.loc 1 204 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:204:             if (ball.y + BALL_SIZE >= left_paddle.y &&
	.loc 1 204 24 is_stmt 0
	addiw	a3,t1,6	#, tmp332, ball$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:204:             if (ball.y + BALL_SIZE >= left_paddle.y &&
	.loc 1 204 16
	blt	a3,s9,.L124	#, tmp332, left_paddle$y,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:205:                 ball.y <= left_paddle.y + PADDLE_HEIGHT) {
	.loc 1 205 41
	addiw	a4,s9,80	#, tmp335, left_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:204:             if (ball.y + BALL_SIZE >= left_paddle.y &&
	.loc 1 204 53 discriminator 1
	blt	a4,t1,.L124	#, tmp335, ball$y,
.LBB193:
	.loc 1 206 17 is_stmt 1
.LVL179:
	.loc 1 207 17
	.loc 1 209 17
	.loc 1 210 17
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:209:                 int hit_pos = (ball.y + BALL_SIZE/2) - (left_paddle.y + PADDLE_HEIGHT/2);
	.loc 1 209 71 is_stmt 0
	subw	s5,t1,s9	# tmp340, ball$y, left_paddle$y
.LVL180:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:209:                 int hit_pos = (ball.y + BALL_SIZE/2) - (left_paddle.y + PADDLE_HEIGHT/2);
	.loc 1 209 21
	addiw	s5,s5,-37	#, tmp342, tmp340
.LBE193:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:215:         if (ball.vx > 0 && ball.x >= width - PADDLE_WIDTH - BALL_SIZE) {
	.loc 1 215 59 discriminator 1
	addiw	a4,s3,-14	#, _210, _2
.LBB194:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:210:                 ball.vy = hit_pos / 8;
	.loc 1 210 35
	divw	s5,s5,a5	# tmp330, ball$vy, tmp342
.LVL181:
.LBE194:
	.loc 1 215 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:215:         if (ball.vx > 0 && ball.x >= width - PADDLE_WIDTH - BALL_SIZE) {
	.loc 1 215 25 is_stmt 0 discriminator 1
	bgt	a4,a5,.L150	#, _210, tmp330,
	.loc 1 216 13 is_stmt 1
.LBB195:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:                 ball.x = PADDLE_WIDTH;
	.loc 1 207 24 is_stmt 0
	mv	t4,a5	# ball$x, tmp330
.LBE195:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:216:             if (ball.y + BALL_SIZE >= right_paddle.y &&
	.loc 1 216 16
	li	t3,3		# ball$vx,
	bge	a3,s11,.L118	#, tmp332, right_paddle$y,
.LVL182:
.L119:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:227:         if (ball.vy > 4) ball.vy = 4;
	.loc 1 227 12
	li	a4,4		# tmp375,
	sext.w	a5,s5	#, ball$vy
	bgt	s5,a4,.L162	#, ball$vy, tmp375,
.L97:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:228:         if (ball.vy < -4) ball.vy = -4;
	.loc 1 228 12
	li	a4,-4		# tmp377,
	blt	a5,a4,.L163	#, ball$vy, tmp377,
	mv	s5,a5	# ball$vy, ball$vy
.LVL183:
	j	.L89		#
.LVL184:
.L107:
.LBB196:
.LBB173:
.LBB169:
	.loc 1 46 18 is_stmt 1 discriminator 1
	.loc 1 46 26
	.loc 1 47 5
	.loc 1 48 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	bge	a2,s5,.L108	#, _2, w,
.LVL185:
.L110:
.LBE169:
.LBE173:
	.loc 1 260 39 is_stmt 1 discriminator 3
	.loc 1 260 27 discriminator 1
	addiw	a5,s11,10	#, tmp449, ivtmp.128
	addiw	s8,s8,-20	#, ivtmp.126, ivtmp.126
	addw	s9,a3,s9	# ivtmp.127, ivtmp.127, tmp436
	addiw	s11,s11,20	#, tmp447, ivtmp.128
.LVL186:
	bge	a5,s3,.L155	#, tmp449, _3,
.LVL187:
.LBB174:
.LBB170:
	.loc 1 46 18 discriminator 1
	.loc 1 46 26
	.loc 1 47 5
	.loc 1 48 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:48:     if (x + w > width) w = width - x;
	.loc 1 48 8 is_stmt 0
	blt	a2,s5,.L110	#, _2, w,
.LVL188:
.L108:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8 is_stmt 0
	blt	s3,s11,.L111	#, _3, ivtmp.128,
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	mv	t5,s11	# ivtmp.128, ivtmp.128
	ble	s5,zero,.L112	#, w,,
	ld	a5,96(sp)		# x, %sfp
	mv	s1,s5	# w, w
	li	s2,10		# h,
	j	.L109		#
.LVL189:
.L118:
.LBE170:
.LBE174:
.LBE196:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:217:                 ball.y <= right_paddle.y + PADDLE_HEIGHT) {
	.loc 1 217 42
	addiw	a5,s11,80	#, tmp356, right_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:216:             if (ball.y + BALL_SIZE >= right_paddle.y &&
	.loc 1 216 54 discriminator 1
	blt	a5,t1,.L127	#, tmp356, ball$y,
.LBB197:
	.loc 1 218 17 is_stmt 1
.LVL190:
	.loc 1 219 17
	.loc 1 221 17
	.loc 1 222 17
.LBE197:
	.loc 1 227 9
	.loc 1 228 9
	.loc 1 231 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:231:         if (ball.x < -BALL_SIZE) {
	.loc 1 231 12 is_stmt 0
	li	a5,-6		# tmp358,
	blt	a4,a5,.L93	#, _210, tmp358,
.LBB198:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:221:                 int hit_pos = (ball.y + BALL_SIZE/2) - (right_paddle.y + PADDLE_HEIGHT/2);
	.loc 1 221 72
	subw	a5,t1,s11	# tmp363, ball$y, right_paddle$y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:                 ball.vy = hit_pos / 8;
	.loc 1 222 35
	li	a3,8		# tmp366,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:221:                 int hit_pos = (ball.y + BALL_SIZE/2) - (right_paddle.y + PADDLE_HEIGHT/2);
	.loc 1 221 21
	addiw	a5,a5,-37	#, tmp365, tmp363
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:                 ball.vy = hit_pos / 8;
	.loc 1 222 35
	divw	a5,a5,a3	# tmp366, tmp367, tmp365
.LBE198:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:227:         if (ball.vy > 4) ball.vy = 4;
	.loc 1 227 12
	li	a3,4		# tmp369,
.LBB199:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:                 ball.vy = hit_pos / 8;
	.loc 1 222 35
	sext.w	s5,a5	#, tmp367
.LBE199:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:227:         if (ball.vy > 4) ball.vy = 4;
	.loc 1 227 12
	ble	a5,a3,.L94	#, tmp367, tmp369,
	sext.w	s5,a3	#, tmp369
.L94:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:228:         if (ball.vy < -4) ball.vy = -4;
	.loc 1 228 12
	li	a5,-4		# tmp371,
	bge	s5,a5,.L95	#, ball$vy, tmp371,
	mv	s5,a5	# ball$vy, tmp371
.L95:
.LBB200:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:219:                 ball.x = width - PADDLE_WIDTH - BALL_SIZE;
	.loc 1 219 24
	mv	t4,a4	# ball$x, _210
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:218:                 ball.vx = -BALL_SPEED_X;
	.loc 1 218 25
	li	t3,-3		# ball$vx,
	j	.L96		#
.LVL191:
.L111:
.LBE200:
.LBB201:
.LBB175:
.LBB171:
	.loc 1 49 25 is_stmt 1 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 27 is_stmt 0 discriminator 1
	mv	s2,s8	# h, ivtmp.126
.LVL192:
	.loc 1 50 5 is_stmt 1
	mv	t5,s11	# ivtmp.128, ivtmp.128
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:50:     if (w <= 0 || h <= 0) return;
	.loc 1 50 8 is_stmt 0
	ble	s5,zero,.L112	#, w,,
	ld	a5,96(sp)		# x, %sfp
	mv	s1,s5	# w, w
	j	.L109		#
.LVL193:
.L129:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:49:     if (y + h > height) h = height - y;
	.loc 1 49 8
	mv	t5,s11	# ivtmp.128, ivtmp.128
	mv	a5,s4	# x, tmp421
	li	s2,10		# h,
	li	s1,2		# w,
	j	.L109		#
.LVL194:
.L124:
.LBE171:
.LBE175:
.LBE201:
	li	t3,-3		# ball$vx,
.LVL195:
	j	.L90		#
.LVL196:
.L122:
	li	t3,-3		# ball$vx,
.LVL197:
	j	.L89		#
.LVL198:
.L163:
	mv	a5,a4	# ball$vy, tmp377
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:228:         if (ball.vy < -4) ball.vy = -4;
	.loc 1 228 12
	mv	s5,a5	# ball$vy, ball$vy
.LVL199:
	j	.L89		#
.LVL200:
.L162:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:227:         if (ball.vy > 4) ball.vy = 4;
	.loc 1 227 12
	sext.w	a5,a4	#, tmp375
	j	.L97		#
.LVL201:
.L154:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	ld	s1,296(sp)		#,
	.cfi_restore 9
.LVL202:
	ld	s2,288(sp)		#,
	.cfi_restore 18
.LVL203:
	ld	s3,280(sp)		#,
	.cfi_restore 19
.LVL204:
	ld	s4,272(sp)		#,
	.cfi_restore 20
.LVL205:
.L66:
.LBE204:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:113:         return -1;
	.loc 1 113 16
	li	s0,-1		# <retval>,
	j	.L149		#
.LVL206:
.L150:
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
.LBB205:
	.loc 1 227 9 is_stmt 1
	.loc 1 228 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:227:         if (ball.vy > 4) ball.vy = 4;
	.loc 1 227 12 is_stmt 0
	li	a4,4		# tmp476,
	sext.w	a5,s5	#, ball$vy
	ble	s5,a4,.L116	#, ball$vy, tmp476,
	sext.w	a5,a4	#, tmp476
.L116:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:228:         if (ball.vy < -4) ball.vy = -4;
	.loc 1 228 12
	li	a4,-4		# tmp478,
	bge	a5,a4,.L117	#, ball$vy, tmp478,
	mv	a5,a4	# ball$vy, tmp478
.L117:
	mv	s5,a5	# ball$vy, ball$vy
.LVL207:
	.loc 1 231 9 is_stmt 1
	.loc 1 238 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:228:         if (ball.vy < -4) ball.vy = -4;
	.loc 1 228 12 is_stmt 0
	li	t3,3		# ball$vx,
.LBB202:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:                 ball.x = PADDLE_WIDTH;
	.loc 1 207 24
	li	t4,8		# ball$x,
	j	.L96		#
.LBE202:
.LBE205:
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.ascii	"\007\005\005\005\007"
	.ascii	"\002\006\002\002\007"
	.ascii	"\007\001\007\004\007"
	.ascii	"\007\001\007\001\007"
	.ascii	"\005\005\007\001\001"
	.ascii	"\007\004\007\001\007"
	.ascii	"\007\004\007\005\007"
	.ascii	"\007\001\001\001\001"
	.ascii	"\007\005\007\005\007"
	.ascii	"\007\005\007\001\007"
	.text
.Letext0:
	.file 5 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 6 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 7 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdlib.h"
	.file 8 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe81
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x2a
	.4byte	.LASF57
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL101
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0xd
	.4byte	.LASF6
	.byte	0x5
	.byte	0x2b
	.byte	0x18
	.4byte	0x3d
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xd
	.4byte	.LASF7
	.byte	0x5
	.byte	0x4f
	.byte	0x19
	.4byte	0x65
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x6
	.byte	0x18
	.byte	0x13
	.4byte	0x31
	.uleb128 0x20
	.4byte	0x7a
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x6
	.byte	0x30
	.byte	0x14
	.4byte	0x59
	.uleb128 0x20
	.4byte	0x8b
	.uleb128 0x17
	.byte	0xc
	.byte	0x2
	.byte	0x14
	.4byte	0xc8
	.uleb128 0x21
	.4byte	.LASF13
	.byte	0x15
	.4byte	0x8b
	.byte	0
	.uleb128 0x21
	.4byte	.LASF14
	.byte	0x16
	.4byte	0x8b
	.byte	0x4
	.uleb128 0x10
	.string	"bpp"
	.byte	0x2
	.byte	0x17
	.byte	0xe
	.4byte	0x8b
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x2
	.byte	0x18
	.byte	0x3
	.4byte	0x9c
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF16
	.uleb128 0x7
	.byte	0x10
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x2c
	.byte	0x8
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x17
	.byte	0x10
	.byte	0x1
	.byte	0x19
	.4byte	0x129
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x1a
	.byte	0x9
	.4byte	0x52
	.byte	0
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x1a
	.byte	0xc
	.4byte	0x52
	.byte	0x4
	.uleb128 0x10
	.string	"vx"
	.byte	0x1
	.byte	0x1b
	.byte	0x9
	.4byte	0x52
	.byte	0x8
	.uleb128 0x10
	.string	"vy"
	.byte	0x1
	.byte	0x1b
	.byte	0xd
	.4byte	0x52
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x1c
	.byte	0x3
	.4byte	0xf2
	.uleb128 0x17
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.4byte	0x149
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x1f
	.byte	0x9
	.4byte	0x52
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x20
	.byte	0x3
	.4byte	0x135
	.uleb128 0x2d
	.4byte	.LASF58
	.byte	0x7
	.byte	0x5e
	.byte	0x6
	.4byte	0x167
	.uleb128 0x22
	.4byte	0xe2
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF59
	.byte	0x7
	.byte	0x6c
	.byte	0x7
	.4byte	0xe2
	.4byte	0x17d
	.uleb128 0x22
	.4byte	0x73
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF60
	.byte	0x1
	.byte	0x6e
	.byte	0x5
	.4byte	0x52
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f4
	.uleb128 0x23
	.4byte	.LASF22
	.byte	0x6f
	.byte	0xf
	.4byte	0xc8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x74
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST42
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x75
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST43
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x76
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST44
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x79
	.byte	0xf
	.4byte	0x8f4
	.4byte	.LLST45
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x89
	.byte	0xc
	.4byte	0x149
	.4byte	.LLST46
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x8a
	.byte	0xc
	.4byte	0x149
	.4byte	.LLST47
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x8b
	.byte	0xa
	.4byte	0x129
	.4byte	.LLST48
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x8d
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST49
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x8e
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST50
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0x8f
	.byte	0x9
	.4byte	0x52
	.4byte	.LLST51
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x92
	.byte	0xe
	.4byte	0x8b
	.4byte	.LLST52
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x93
	.byte	0xe
	.4byte	0x8b
	.4byte	.LLST53
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x94
	.byte	0xe
	.4byte	0x8b
	.4byte	.LLST54
	.uleb128 0x13
	.4byte	.LLRL64
	.4byte	0x700
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x97
	.byte	0x12
	.4byte	0x8b
	.4byte	.LLST65
	.uleb128 0x18
	.4byte	.LASF35
	.2byte	0x113
	.4byte	0x8b
	.4byte	.LLST66
	.uleb128 0x18
	.4byte	.LASF36
	.2byte	0x11b
	.4byte	0x8b
	.4byte	.LLST67
	.uleb128 0x18
	.4byte	.LASF37
	.2byte	0x11c
	.4byte	0x8b
	.4byte	.LLST68
	.uleb128 0x13
	.4byte	.LLRL71
	.4byte	0x30d
	.uleb128 0x19
	.string	"key"
	.byte	0x9d
	.byte	0x1b
	.4byte	0x3d
	.4byte	.LLST72
	.uleb128 0xe
	.4byte	0xc1e
	.8byte	.LBB148
	.8byte	.LBE148-.LBB148
	.byte	0x9d
	.byte	0x21
	.4byte	0x2f8
	.uleb128 0x3
	.4byte	0xc2d
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc38
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xa
	.8byte	.LVL168
	.4byte	0x155
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LLRL97
	.4byte	0x326
	.uleb128 0x5
	.4byte	.LASF38
	.byte	0xd1
	.byte	0x15
	.4byte	0x52
	.4byte	.LLST98
	.byte	0
	.uleb128 0x13
	.4byte	.LLRL99
	.4byte	0x33f
	.uleb128 0x5
	.4byte	.LASF38
	.byte	0xdd
	.byte	0x15
	.4byte	0x52
	.4byte	.LLST100
	.byte	0
	.uleb128 0x13
	.4byte	.LLRL75
	.4byte	0x418
	.uleb128 0x30
	.string	"y"
	.byte	0x1
	.2byte	0x104
	.byte	0x12
	.4byte	0x52
	.4byte	.LLST76
	.uleb128 0x31
	.4byte	0xb01
	.8byte	.LBB154
	.4byte	.LLRL77
	.byte	0x1
	.2byte	0x105
	.byte	0xd
	.uleb128 0x2
	.4byte	0xb0e
	.4byte	.LLST78
	.uleb128 0x2
	.4byte	0xb19
	.4byte	.LLST79
	.uleb128 0x2
	.4byte	0xb25
	.4byte	.LLST80
	.uleb128 0x2
	.4byte	0xb31
	.4byte	.LLST81
	.uleb128 0x2
	.4byte	0xb3b
	.4byte	.LLST82
	.uleb128 0x2
	.4byte	0xb45
	.4byte	.LLST83
	.uleb128 0x2
	.4byte	0xb4f
	.4byte	.LLST84
	.uleb128 0x2
	.4byte	0xb59
	.4byte	.LLST85
	.uleb128 0x8
	.4byte	.LLRL77
	.uleb128 0x6
	.4byte	0xb65
	.4byte	.LLST86
	.uleb128 0xb
	.4byte	0xb71
	.4byte	.LLRL87
	.uleb128 0x6
	.4byte	0xb72
	.4byte	.LLST88
	.uleb128 0xb
	.4byte	0xb7c
	.4byte	.LLRL89
	.uleb128 0x6
	.4byte	0xb7d
	.4byte	.LLST90
	.uleb128 0xb
	.4byte	0xb88
	.4byte	.LLRL91
	.uleb128 0x6
	.4byte	0xb89
	.4byte	.LLST92
	.uleb128 0xa
	.8byte	.LVL139
	.4byte	0xe79
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x8
	.byte	0xff
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xbf7
	.8byte	.LBB137
	.4byte	.LLRL69
	.byte	0x97
	.byte	0x20
	.4byte	0x444
	.uleb128 0x8
	.4byte	.LLRL69
	.uleb128 0x3
	.4byte	0xc07
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc12
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xc44
	.8byte	.LBB141
	.4byte	.LLRL70
	.byte	0x9c
	.byte	0x10
	.4byte	0x470
	.uleb128 0x8
	.4byte	.LLRL70
	.uleb128 0x3
	.4byte	0xc53
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc5e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0xb97
	.8byte	.LBB151
	.8byte	.LBE151-.LBB151
	.byte	0xf7
	.byte	0x9
	.4byte	0x4c4
	.uleb128 0x2
	.4byte	0xba4
	.4byte	.LLST73
	.uleb128 0x11
	.4byte	0xbaf
	.uleb128 0x6
	.4byte	0xbbb
	.4byte	.LLST74
	.uleb128 0xa
	.8byte	.LVL125
	.4byte	0xe79
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -272
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x32
	.4byte	0xca9
	.8byte	.LBB176
	.8byte	.LBE176-.LBB176
	.byte	0x1
	.2byte	0x110
	.byte	0x9
	.4byte	0x4f5
	.uleb128 0x11
	.4byte	0xcb6
	.uleb128 0x3
	.4byte	0xcc2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xccd
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x1a
	.4byte	0xbf7
	.8byte	.LBB178
	.4byte	.LLRL93
	.2byte	0x113
	.byte	0x21
	.4byte	0x522
	.uleb128 0x8
	.4byte	.LLRL93
	.uleb128 0x3
	.4byte	0xc07
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc12
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0xbf7
	.8byte	.LBB183
	.4byte	.LLRL94
	.2byte	0x11b
	.byte	0x1e
	.4byte	0x54f
	.uleb128 0x8
	.4byte	.LLRL94
	.uleb128 0x3
	.4byte	0xc07
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc12
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0xbc8
	.8byte	.LBB187
	.4byte	.LLRL95
	.2byte	0x11f
	.byte	0xd
	.4byte	0x585
	.uleb128 0x2
	.4byte	0xbd5
	.4byte	.LLST96
	.uleb128 0x8
	.4byte	.LLRL95
	.uleb128 0x3
	.4byte	0xbe0
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xbeb
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL127
	.4byte	0xb01
	.4byte	0x5c8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x2
	.byte	0x89
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x60
	.uleb128 0x2
	.byte	0x8
	.byte	0x50
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x5
	.byte	0x11
	.sleb128 -16711936
	.byte	0
	.uleb128 0xf
	.8byte	.LVL128
	.4byte	0xb01
	.4byte	0x60c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x2
	.byte	0x83
	.sleb128 -8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x2
	.byte	0x8b
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x60
	.uleb128 0x2
	.byte	0x8
	.byte	0x50
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x5
	.byte	0x11
	.sleb128 -16711936
	.byte	0
	.uleb128 0xf
	.8byte	.LVL129
	.4byte	0xb01
	.4byte	0x654
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x5
	.byte	0x91
	.sleb128 -312
	.byte	0x94
	.byte	0x4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x5
	.byte	0x91
	.sleb128 -304
	.byte	0x94
	.byte	0x4
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x60
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x4
	.byte	0x11
	.sleb128 -65536
	.byte	0
	.uleb128 0xf
	.8byte	.LVL147
	.4byte	0x8f9
	.4byte	0x68e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x4
	.byte	0x83
	.sleb128 0
	.byte	0x34
	.byte	0x1b
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x44
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -240
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.8byte	.LVL148
	.4byte	0x8f9
	.4byte	0x6ca
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x6
	.byte	0x83
	.sleb128 0
	.byte	0x33
	.byte	0x1e
	.byte	0x34
	.byte	0x1b
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x44
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -232
	.byte	0x94
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.8byte	.LVL149
	.4byte	0x8f9
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x3
	.byte	0x83
	.sleb128 -100
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -264
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xc71
	.8byte	.LBB116
	.4byte	.LLRL55
	.byte	0x70
	.byte	0x9
	.4byte	0x735
	.uleb128 0x2
	.4byte	0xc81
	.4byte	.LLST56
	.uleb128 0x8
	.4byte	.LLRL55
	.uleb128 0x3
	.4byte	0xc8d
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc98
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0xb97
	.8byte	.LBB120
	.8byte	.LBE120-.LBB120
	.byte	0x7d
	.byte	0x5
	.4byte	0x78d
	.uleb128 0x2
	.4byte	0xba4
	.4byte	.LLST57
	.uleb128 0x2
	.4byte	0xbaf
	.4byte	.LLST58
	.uleb128 0x6
	.4byte	0xbbb
	.4byte	.LLST59
	.uleb128 0xa
	.8byte	.LVL94
	.4byte	0xe79
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -272
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0xca9
	.8byte	.LBB122
	.8byte	.LBE122-.LBB122
	.byte	0x80
	.byte	0x5
	.4byte	0x7c0
	.uleb128 0x2
	.4byte	0xcb6
	.4byte	.LLST60
	.uleb128 0x3
	.4byte	0xcc2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xccd
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x14
	.4byte	0xc44
	.8byte	.LBB124
	.4byte	.LLRL61
	.byte	0x83
	.byte	0xd
	.4byte	0x7ec
	.uleb128 0x8
	.4byte	.LLRL61
	.uleb128 0x3
	.4byte	0xc53
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc5e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0xbc8
	.8byte	.LBB127
	.8byte	.LBE127-.LBB127
	.byte	0x84
	.byte	0x9
	.4byte	0x81f
	.uleb128 0x2
	.4byte	0xbd5
	.4byte	.LLST62
	.uleb128 0x3
	.4byte	0xbe0
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xbeb
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xe
	.4byte	0xc1e
	.8byte	.LBB130
	.8byte	.LBE130-.LBB130
	.byte	0x86
	.byte	0x5
	.4byte	0x849
	.uleb128 0x3
	.4byte	0xc2d
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc38
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x14
	.4byte	0xbf7
	.8byte	.LBB132
	.4byte	.LLRL63
	.byte	0x92
	.byte	0x1e
	.4byte	0x875
	.uleb128 0x8
	.4byte	.LLRL63
	.uleb128 0x3
	.4byte	0xc07
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.4byte	0xc12
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL90
	.4byte	0x167
	.4byte	0x88f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x4
	.byte	0x79
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.uleb128 0xf
	.8byte	.LVL95
	.4byte	0x8f9
	.4byte	0x8c3
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.uleb128 0xa
	.8byte	.LVL96
	.4byte	0x8f9
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x4e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	0x8b
	.uleb128 0x15
	.4byte	.LASF43
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.byte	0x1
	.4byte	0x96c
	.uleb128 0x9
	.string	"fb"
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.4byte	0x8f4
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x5a
	.byte	0x2b
	.4byte	0x52
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5a
	.byte	0x36
	.4byte	0x52
	.uleb128 0x9
	.string	"x"
	.byte	0x1
	.byte	0x5a
	.byte	0x42
	.4byte	0x52
	.uleb128 0x9
	.string	"y"
	.byte	0x1
	.byte	0x5a
	.byte	0x49
	.4byte	0x52
	.uleb128 0x9
	.string	"num"
	.byte	0x1
	.byte	0x5a
	.byte	0x50
	.4byte	0x52
	.uleb128 0x1b
	.4byte	.LASF39
	.byte	0x60
	.byte	0x9
	.4byte	0x96c
	.uleb128 0x1b
	.4byte	.LASF40
	.byte	0x61
	.byte	0x9
	.4byte	0x52
	.uleb128 0x16
	.uleb128 0x4
	.string	"i"
	.byte	0x1
	.byte	0x68
	.byte	0xe
	.4byte	0x52
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x52
	.4byte	0x97c
	.uleb128 0x1c
	.4byte	0x73
	.byte	0x9
	.byte	0
	.uleb128 0x33
	.4byte	.LASF61
	.byte	0x1
	.byte	0x40
	.byte	0xd
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaeb
	.uleb128 0x1d
	.string	"fb"
	.byte	0x22
	.4byte	0x8f4
	.4byte	.LLST13
	.uleb128 0x1e
	.4byte	.LASF13
	.byte	0x2a
	.4byte	0x52
	.4byte	.LLST14
	.uleb128 0x1e
	.4byte	.LASF14
	.byte	0x35
	.4byte	0x52
	.4byte	.LLST15
	.uleb128 0x1d
	.string	"x"
	.byte	0x41
	.4byte	0x52
	.4byte	.LLST16
	.uleb128 0x1d
	.string	"y"
	.byte	0x48
	.4byte	0x52
	.4byte	.LLST17
	.uleb128 0x1e
	.4byte	.LASF41
	.byte	0x4f
	.4byte	0x52
	.4byte	.LLST18
	.uleb128 0x23
	.4byte	.LASF42
	.byte	0x42
	.byte	0x13
	.4byte	0xaeb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x8
	.4byte	.LLRL19
	.uleb128 0x19
	.string	"row"
	.byte	0x51
	.byte	0xe
	.4byte	0x52
	.4byte	.LLST20
	.uleb128 0x8
	.4byte	.LLRL21
	.uleb128 0x19
	.string	"col"
	.byte	0x52
	.byte	0x12
	.4byte	0x52
	.4byte	.LLST22
	.uleb128 0x34
	.4byte	0xb01
	.8byte	.LBB57
	.4byte	.LLRL23
	.byte	0x1
	.byte	0x54
	.byte	0x11
	.uleb128 0x12
	.4byte	0xb0e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x12
	.4byte	0xb19
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x12
	.4byte	0xb25
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x2
	.4byte	0xb31
	.4byte	.LLST24
	.uleb128 0x12
	.4byte	0xb3b
	.uleb128 0x3
	.byte	0x84
	.sleb128 -2
	.byte	0x9f
	.uleb128 0x2
	.4byte	0xb45
	.4byte	.LLST25
	.uleb128 0x2
	.4byte	0xb4f
	.4byte	.LLST26
	.uleb128 0x35
	.4byte	0xb59
	.sleb128 -1
	.uleb128 0x8
	.4byte	.LLRL23
	.uleb128 0x6
	.4byte	0xb65
	.4byte	.LLST27
	.uleb128 0xb
	.4byte	0xb71
	.4byte	.LLRL28
	.uleb128 0x6
	.4byte	0xb72
	.4byte	.LLST29
	.uleb128 0xb
	.4byte	0xb7c
	.4byte	.LLRL30
	.uleb128 0x6
	.4byte	0xb7d
	.4byte	.LLST31
	.uleb128 0x26
	.4byte	0xb88
	.8byte	.LBB61
	.8byte	.LBE61-.LBB61
	.uleb128 0x6
	.4byte	0xb89
	.4byte	.LLST32
	.uleb128 0xa
	.8byte	.LVL56
	.4byte	0xe79
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x8
	.byte	0xff
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x86
	.4byte	0xb01
	.uleb128 0x1c
	.4byte	0x73
	.byte	0x9
	.uleb128 0x1c
	.4byte	0x73
	.byte	0x4
	.byte	0
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.byte	0x2b
	.byte	0x14
	.byte	0x3
	.4byte	0xb97
	.uleb128 0x9
	.string	"fb"
	.byte	0x1
	.byte	0x2b
	.byte	0x28
	.4byte	0x8f4
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x2b
	.byte	0x30
	.4byte	0x52
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2b
	.byte	0x3b
	.4byte	0x52
	.uleb128 0x9
	.string	"x"
	.byte	0x1
	.byte	0x2c
	.byte	0x22
	.4byte	0x52
	.uleb128 0x9
	.string	"y"
	.byte	0x1
	.byte	0x2c
	.byte	0x29
	.4byte	0x52
	.uleb128 0x9
	.string	"w"
	.byte	0x1
	.byte	0x2c
	.byte	0x30
	.4byte	0x52
	.uleb128 0x9
	.string	"h"
	.byte	0x1
	.byte	0x2c
	.byte	0x37
	.4byte	0x52
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x1
	.byte	0x2c
	.byte	0x43
	.4byte	0x8b
	.uleb128 0x4
	.string	"row"
	.byte	0x1
	.byte	0x35
	.byte	0xf
	.4byte	0x8f4
	.uleb128 0x16
	.uleb128 0x4
	.string	"j"
	.byte	0x1
	.byte	0x36
	.byte	0xe
	.4byte	0x52
	.uleb128 0x16
	.uleb128 0x1b
	.4byte	.LASF46
	.byte	0x37
	.byte	0x13
	.4byte	0x8f4
	.uleb128 0x16
	.uleb128 0x4
	.string	"i"
	.byte	0x1
	.byte	0x38
	.byte	0x12
	.4byte	0x52
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x1
	.byte	0x23
	.byte	0x14
	.byte	0x3
	.4byte	0xbc8
	.uleb128 0x9
	.string	"fb"
	.byte	0x1
	.byte	0x23
	.byte	0x29
	.4byte	0x8f4
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x1
	.byte	0x23
	.byte	0x36
	.4byte	0x8b
	.uleb128 0x4
	.string	"end"
	.byte	0x1
	.byte	0x24
	.byte	0xf
	.4byte	0x8f4
	.byte	0
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x4
	.byte	0x14
	.byte	0x14
	.byte	0x3
	.4byte	0xbf7
	.uleb128 0x9
	.string	"us"
	.byte	0x4
	.byte	0x14
	.byte	0x2c
	.4byte	0x97
	.uleb128 0x4
	.string	"a0"
	.byte	0x4
	.byte	0x15
	.byte	0x13
	.4byte	0x6c
	.uleb128 0x4
	.string	"a7"
	.byte	0x4
	.byte	0x16
	.byte	0x13
	.4byte	0x6c
	.byte	0
	.uleb128 0x27
	.4byte	.LASF52
	.byte	0x4
	.byte	0xc
	.byte	0x18
	.4byte	0x8b
	.4byte	0xc1e
	.uleb128 0x4
	.string	"a0"
	.byte	0x4
	.byte	0xd
	.byte	0x13
	.4byte	0x6c
	.uleb128 0x4
	.string	"a7"
	.byte	0x4
	.byte	0xe
	.byte	0x13
	.4byte	0x6c
	.byte	0
	.uleb128 0x28
	.4byte	.LASF49
	.byte	0x15
	.byte	0x13
	.4byte	0x52
	.4byte	0xc44
	.uleb128 0x4
	.string	"a0"
	.byte	0x3
	.byte	0x16
	.byte	0x13
	.4byte	0x6c
	.uleb128 0x4
	.string	"a7"
	.byte	0x3
	.byte	0x17
	.byte	0x13
	.4byte	0x6c
	.byte	0
	.uleb128 0x28
	.4byte	.LASF50
	.byte	0xd
	.byte	0x14
	.4byte	0xc6a
	.4byte	0xc6a
	.uleb128 0x4
	.string	"a0"
	.byte	0x3
	.byte	0xe
	.byte	0x13
	.4byte	0x6c
	.uleb128 0x4
	.string	"a7"
	.byte	0x3
	.byte	0xf
	.byte	0x13
	.4byte	0x6c
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.byte	0x2
	.4byte	.LASF51
	.uleb128 0x27
	.4byte	.LASF53
	.byte	0x2
	.byte	0x20
	.byte	0x13
	.4byte	0x52
	.4byte	0xca4
	.uleb128 0xc
	.4byte	.LASF54
	.byte	0x2
	.byte	0x20
	.byte	0x33
	.4byte	0xca4
	.uleb128 0x4
	.string	"a0"
	.byte	0x2
	.byte	0x21
	.byte	0x13
	.4byte	0x6c
	.uleb128 0x4
	.string	"a7"
	.byte	0x2
	.byte	0x22
	.byte	0x13
	.4byte	0x6c
	.byte	0
	.uleb128 0x24
	.4byte	0xc8
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x2
	.byte	0x1a
	.byte	0x14
	.byte	0x3
	.4byte	0xcd9
	.uleb128 0xc
	.4byte	.LASF56
	.byte	0x2
	.byte	0x1a
	.byte	0x2f
	.4byte	0x97
	.uleb128 0x4
	.string	"a0"
	.byte	0x2
	.byte	0x1b
	.byte	0x12
	.4byte	0x52
	.uleb128 0x4
	.string	"a7"
	.byte	0x2
	.byte	0x1c
	.byte	0x12
	.4byte	0x52
	.byte	0
	.uleb128 0x29
	.4byte	0xb01
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd7b
	.uleb128 0x12
	.4byte	0xb0e
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.4byte	0xb19
	.4byte	.LLST0
	.uleb128 0x2
	.4byte	0xb25
	.4byte	.LLST1
	.uleb128 0x2
	.4byte	0xb31
	.4byte	.LLST2
	.uleb128 0x2
	.4byte	0xb3b
	.4byte	.LLST3
	.uleb128 0x2
	.4byte	0xb45
	.4byte	.LLST4
	.uleb128 0x2
	.4byte	0xb4f
	.4byte	.LLST5
	.uleb128 0x12
	.4byte	0xb59
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x6
	.4byte	0xb65
	.4byte	.LLST6
	.uleb128 0xb
	.4byte	0xb71
	.4byte	.LLRL7
	.uleb128 0x6
	.4byte	0xb72
	.4byte	.LLST8
	.uleb128 0xb
	.4byte	0xb7c
	.4byte	.LLRL9
	.uleb128 0x6
	.4byte	0xb7d
	.4byte	.LLST10
	.uleb128 0xb
	.4byte	0xb88
	.4byte	.LLRL11
	.uleb128 0x6
	.4byte	0xb89
	.4byte	.LLST12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	0x8f9
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe79
	.uleb128 0x2
	.4byte	0x906
	.4byte	.LLST33
	.uleb128 0x2
	.4byte	0x911
	.4byte	.LLST34
	.uleb128 0x2
	.4byte	0x91d
	.4byte	.LLST35
	.uleb128 0x2
	.4byte	0x929
	.4byte	.LLST36
	.uleb128 0x2
	.4byte	0x933
	.4byte	.LLST37
	.uleb128 0x2
	.4byte	0x93d
	.4byte	.LLST38
	.uleb128 0x1f
	.4byte	0x949
	.uleb128 0x1f
	.4byte	0x954
	.uleb128 0xe
	.4byte	0x8f9
	.8byte	.LBB73
	.8byte	.LBE73-.LBB73
	.byte	0x5a
	.byte	0xd
	.4byte	0xe6b
	.uleb128 0x11
	.4byte	0x906
	.uleb128 0x11
	.4byte	0x911
	.uleb128 0x11
	.4byte	0x91d
	.uleb128 0x2
	.4byte	0x929
	.4byte	.LLST39
	.uleb128 0x11
	.4byte	0x933
	.uleb128 0x2
	.4byte	0x93d
	.4byte	.LLST40
	.uleb128 0x3
	.4byte	0x949
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x6
	.4byte	0x954
	.4byte	.LLST41
	.uleb128 0x26
	.4byte	0x95f
	.8byte	.LBB75
	.8byte	.LBE75-.LBB75
	.uleb128 0x1f
	.4byte	0x960
	.uleb128 0xa
	.8byte	.LVL75
	.4byte	0x97c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x36
	.8byte	.LVL83
	.4byte	0x97c
	.byte	0
	.uleb128 0x37
	.4byte	.LASF62
	.4byte	.LASF63
	.byte	0x8
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 64
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 64
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xd
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
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
.LLST42:
	.byte	0x6
	.8byte	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL133-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL133-.LVL88
	.uleb128 .LVL138-.LVL88
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL138-.LVL88
	.uleb128 .LVL143-.LVL88
	.uleb128 0x1
	.byte	0x6a
	.byte	0x4
	.uleb128 .LVL143-.LVL88
	.uleb128 .LVL146-.LVL88
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL146-.LVL88
	.uleb128 .LVL169-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL173-.LVL88
	.uleb128 .LVL184-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL184-.LVL88
	.uleb128 .LVL189-.LVL88
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL189-.LVL88
	.uleb128 .LVL191-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL191-.LVL88
	.uleb128 .LVL194-.LVL88
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL194-.LVL88
	.uleb128 .LVL204-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL206-.LVL88
	.uleb128 .LFE10-.LVL88
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST43:
	.byte	0x6
	.8byte	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL103-.LVL88
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL201-.LVL88
	.uleb128 .LVL203-.LVL88
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LLST44:
	.byte	0x6
	.8byte	.LVL89
	.byte	0x4
	.uleb128 .LVL89-.LVL89
	.uleb128 .LVL103-.LVL89
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL201-.LVL89
	.uleb128 .LVL202-.LVL89
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL202-.LVL89
	.uleb128 .LVL203-.LVL89
	.uleb128 0x6
	.byte	0x83
	.sleb128 0
	.byte	0x82
	.sleb128 0
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST45:
	.byte	0x6
	.8byte	.LVL91
	.byte	0x4
	.uleb128 .LVL91-.LVL91
	.uleb128 .LVL94-1-.LVL91
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL94-1-.LVL91
	.uleb128 .LVL103-.LVL91
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL201-.LVL91
	.uleb128 .LVL205-.LVL91
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST46:
	.byte	0x6
	.8byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL107-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL107-.LVL100
	.uleb128 .LVL108-.LVL100
	.uleb128 0x5
	.byte	0x89
	.sleb128 -20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL109-.LVL100
	.uleb128 .LVL130-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL160-.LVL100
	.uleb128 .LVL161-.LVL100
	.uleb128 0x5
	.byte	0x89
	.sleb128 20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL161-.LVL100
	.uleb128 .LVL171-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL173-.LVL100
	.uleb128 .LVL175-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL175-.LVL100
	.uleb128 .LVL176-.LVL100
	.uleb128 0x5
	.byte	0x89
	.sleb128 20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL177-.LVL100
	.uleb128 .LVL184-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL189-.LVL100
	.uleb128 .LVL191-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL194-.LVL100
	.uleb128 .LVL201-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL206-.LVL100
	.uleb128 .LFE10-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0
.LLST47:
	.byte	0x6
	.8byte	.LVL100
	.byte	0x4
	.uleb128 .LVL100-.LVL100
	.uleb128 .LVL103-.LVL100
	.uleb128 0x3
	.byte	0x69
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL103-.LVL100
	.uleb128 .LVL109-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL109-.LVL100
	.uleb128 .LVL132-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL160-.LVL100
	.uleb128 .LVL162-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL162-.LVL100
	.uleb128 .LVL163-.LVL100
	.uleb128 0x5
	.byte	0x8b
	.sleb128 20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL163-.LVL100
	.uleb128 .LVL164-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL164-.LVL100
	.uleb128 .LVL165-.LVL100
	.uleb128 0x5
	.byte	0x8b
	.sleb128 -20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL166-.LVL100
	.uleb128 .LVL172-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL173-.LVL100
	.uleb128 .LVL174-.LVL100
	.uleb128 0x5
	.byte	0x8b
	.sleb128 20
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL175-.LVL100
	.uleb128 .LVL184-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL189-.LVL100
	.uleb128 .LVL191-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL194-.LVL100
	.uleb128 .LVL201-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL206-.LVL100
	.uleb128 .LFE10-.LVL100
	.uleb128 0x3
	.byte	0x6b
	.byte	0x93
	.uleb128 0x4
	.byte	0
.LLST48:
	.byte	0x6
	.8byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL103-.LVL101
	.uleb128 0xe
	.byte	0x6a
	.byte	0x93
	.uleb128 0x4
	.byte	0x5b
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x32
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL103-.LVL101
	.uleb128 .LVL111-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL111-.LVL101
	.uleb128 .LVL112-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x5f
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL112-.LVL101
	.uleb128 .LVL113-.LVL101
	.uleb128 0x11
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL113-.LVL101
	.uleb128 .LVL114-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x5f
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL114-.LVL101
	.uleb128 .LVL115-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL115-.LVL101
	.uleb128 .LVL116-.LVL101
	.uleb128 0x7
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL116-.LVL101
	.uleb128 .LVL117-.LVL101
	.uleb128 0x2f
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL117-.LVL101
	.uleb128 .LVL118-.LVL101
	.uleb128 0x7
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL119-.LVL101
	.uleb128 .LVL120-.LVL101
	.uleb128 0x10
	.byte	0x6a
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x32
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL120-.LVL101
	.uleb128 .LVL121-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL121-.LVL101
	.uleb128 .LVL122-.LVL101
	.uleb128 0xb
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL122-.LVL101
	.uleb128 .LVL123-.LVL101
	.uleb128 0x8
	.byte	0x93
	.uleb128 0x8
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL123-.LVL101
	.uleb128 .LVL124-.LVL101
	.uleb128 0x11
	.byte	0x6a
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -208
	.byte	0x93
	.uleb128 0x4
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x32
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL124-.LVL101
	.uleb128 .LVL125-1-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL125-1-.LVL101
	.uleb128 .LVL126-.LVL101
	.uleb128 0x12
	.byte	0x91
	.sleb128 -312
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -288
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -296
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL126-.LVL101
	.uleb128 .LVL131-.LVL101
	.uleb128 0x5
	.byte	0x93
	.uleb128 0xc
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL160-.LVL101
	.uleb128 .LVL168-1-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL168-1-.LVL101
	.uleb128 .LVL170-.LVL101
	.uleb128 0x5
	.byte	0x93
	.uleb128 0xc
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL173-.LVL101
	.uleb128 .LVL177-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL177-.LVL101
	.uleb128 .LVL178-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x5f
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL178-.LVL101
	.uleb128 .LVL179-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL179-.LVL101
	.uleb128 .LVL180-.LVL101
	.uleb128 0xe
	.byte	0x38
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL180-.LVL101
	.uleb128 .LVL181-.LVL101
	.uleb128 0xd
	.byte	0x38
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL181-.LVL101
	.uleb128 .LVL182-.LVL101
	.uleb128 0x7
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL182-.LVL101
	.uleb128 .LVL183-.LVL101
	.uleb128 0x2f
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL183-.LVL101
	.uleb128 .LVL184-.LVL101
	.uleb128 0xb
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL189-.LVL101
	.uleb128 .LVL190-.LVL101
	.uleb128 0x7
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL190-.LVL101
	.uleb128 .LVL191-.LVL101
	.uleb128 0x39
	.byte	0x5e
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x76
	.sleb128 0
	.byte	0x8b
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0x25
	.byte	0x1c
	.byte	0x38
	.byte	0x1b
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL194-.LVL101
	.uleb128 .LVL195-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL195-.LVL101
	.uleb128 .LVL196-.LVL101
	.uleb128 0xb
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL196-.LVL101
	.uleb128 .LVL197-.LVL101
	.uleb128 0xc
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL197-.LVL101
	.uleb128 .LVL198-.LVL101
	.uleb128 0xb
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x65
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL198-.LVL101
	.uleb128 .LVL199-.LVL101
	.uleb128 0x2f
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL199-.LVL101
	.uleb128 .LVL200-.LVL101
	.uleb128 0xb
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL200-.LVL101
	.uleb128 .LVL201-.LVL101
	.uleb128 0x2f
	.byte	0x6d
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x6c
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x9
	.byte	0xfc
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2b
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL206-.LVL101
	.uleb128 .LVL207-.LVL101
	.uleb128 0x20
	.byte	0x38
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x85
	.sleb128 0
	.byte	0x12
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x34
	.byte	0x16
	.byte	0x14
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2d
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL207-.LVL101
	.uleb128 .LFE10-.LVL101
	.uleb128 0xd
	.byte	0x38
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x33
	.byte	0x9f
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.byte	0
.LLST49:
	.byte	0x6
	.8byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL103-.LVL101
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL101
	.uleb128 .LVL123-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x4
	.uleb128 .LVL123-.LVL101
	.uleb128 .LVL124-.LVL101
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL124-.LVL101
	.uleb128 .LVL172-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x4
	.uleb128 .LVL173-.LVL101
	.uleb128 .LVL201-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0x4
	.uleb128 .LVL206-.LVL101
	.uleb128 .LFE10-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0
.LLST50:
	.byte	0x6
	.8byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL103-.LVL101
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL101
	.uleb128 .LVL119-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL119-.LVL101
	.uleb128 .LVL120-.LVL101
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL120-.LVL101
	.uleb128 .LVL124-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL160-.LVL101
	.uleb128 .LVL172-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL173-.LVL101
	.uleb128 .LVL184-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL189-.LVL101
	.uleb128 .LVL191-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL194-.LVL101
	.uleb128 .LVL201-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL206-.LVL101
	.uleb128 .LFE10-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0
.LLST51:
	.byte	0x8
	.8byte	.LVL101
	.uleb128 .LVL103-.LVL101
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST52:
	.byte	0x6
	.8byte	.LVL102
	.byte	0x4
	.uleb128 .LVL102-.LVL102
	.uleb128 .LVL153-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0x4
	.uleb128 .LVL153-.LVL102
	.uleb128 .LVL160-.LVL102
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL160-.LVL102
	.uleb128 .LVL172-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0x4
	.uleb128 .LVL173-.LVL102
	.uleb128 .LVL201-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0x4
	.uleb128 .LVL206-.LVL102
	.uleb128 .LFE10-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0
.LLST53:
	.byte	0x6
	.8byte	.LVL102
	.byte	0x4
	.uleb128 .LVL102-.LVL102
	.uleb128 .LVL103-.LVL102
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL102
	.uleb128 .LVL104-.LVL102
	.uleb128 0x1
	.byte	0x6f
	.byte	0x4
	.uleb128 .LVL104-.LVL102
	.uleb128 .LVL125-1-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL153-.LVL102
	.uleb128 .LVL160-.LVL102
	.uleb128 0x1
	.byte	0x6f
	.byte	0x4
	.uleb128 .LVL160-.LVL102
	.uleb128 .LVL168-1-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.LVL102
	.uleb128 .LVL184-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL189-.LVL102
	.uleb128 .LVL191-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL194-.LVL102
	.uleb128 .LVL201-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL206-.LVL102
	.uleb128 .LFE10-.LVL102
	.uleb128 0x3
	.byte	0x8f
	.sleb128 1
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x6
	.8byte	.LVL102
	.byte	0x4
	.uleb128 .LVL102-.LVL102
	.uleb128 .LVL103-.LVL102
	.uleb128 0x3
	.byte	0x8
	.byte	0x3c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL103-.LVL102
	.uleb128 .LVL153-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0x4
	.uleb128 .LVL153-.LVL102
	.uleb128 .LVL160-.LVL102
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL160-.LVL102
	.uleb128 .LVL172-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0x4
	.uleb128 .LVL173-.LVL102
	.uleb128 .LVL201-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0x4
	.uleb128 .LVL206-.LVL102
	.uleb128 .LFE10-.LVL102
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0
.LLST65:
	.byte	0x6
	.8byte	.LVL104
	.byte	0x4
	.uleb128 .LVL104-.LVL104
	.uleb128 .LVL172-.LVL104
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x4
	.uleb128 .LVL173-.LVL104
	.uleb128 .LVL201-.LVL104
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0x4
	.uleb128 .LVL206-.LVL104
	.uleb128 .LFE10-.LVL104
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0
.LLST66:
	.byte	0x6
	.8byte	.LVL151
	.byte	0x4
	.uleb128 .LVL151-.LVL151
	.uleb128 .LVL152-.LVL151
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL152-.LVL151
	.uleb128 .LVL154-.LVL151
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST67:
	.byte	0x8
	.8byte	.LVL155
	.uleb128 .LVL158-.LVL155
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST68:
	.byte	0x6
	.8byte	.LVL155
	.byte	0x4
	.uleb128 .LVL155-.LVL155
	.uleb128 .LVL157-.LVL155
	.uleb128 0x6
	.byte	0x7a
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL157-.LVL155
	.uleb128 .LVL158-.LVL155
	.uleb128 0x9
	.byte	0x7a
	.sleb128 0
	.byte	0x91
	.sleb128 -256
	.byte	0x94
	.byte	0x4
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST72:
	.byte	0x6
	.8byte	.LVL105
	.byte	0x4
	.uleb128 .LVL105-.LVL105
	.uleb128 .LVL106-.LVL105
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL166-.LVL105
	.uleb128 .LVL167-.LVL105
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST98:
	.byte	0x6
	.8byte	.LVL179
	.byte	0x4
	.uleb128 .LVL179-.LVL179
	.uleb128 .LVL182-.LVL179
	.uleb128 0x9
	.byte	0x76
	.sleb128 0
	.byte	0x89
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL206-.LVL179
	.uleb128 .LFE10-.LVL179
	.uleb128 0x9
	.byte	0x76
	.sleb128 0
	.byte	0x89
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST100:
	.byte	0x8
	.8byte	.LVL190
	.uleb128 .LVL191-.LVL190
	.uleb128 0x9
	.byte	0x76
	.sleb128 0
	.byte	0x8b
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0x25
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST76:
	.byte	0x6
	.8byte	.LVL129
	.byte	0x4
	.uleb128 .LVL129-.LVL129
	.uleb128 .LVL134-.LVL129
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL129
	.uleb128 .LVL136-.LVL129
	.uleb128 0x3
	.byte	0x8b
	.sleb128 -10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL143-.LVL129
	.uleb128 .LVL144-.LVL129
	.uleb128 0x3
	.byte	0x8b
	.sleb128 10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL185-.LVL129
	.uleb128 .LVL186-.LVL129
	.uleb128 0x3
	.byte	0x8b
	.sleb128 10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.LVL129
	.uleb128 .LVL194-.LVL129
	.uleb128 0x3
	.byte	0x8b
	.sleb128 -10
	.byte	0x9f
	.byte	0
.LLST78:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.byte	0
.LLST79:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST80:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST81:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x8
	.byte	0x91
	.sleb128 -288
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL184-.LVL134
	.uleb128 .LVL185-.LVL134
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL187-.LVL134
	.uleb128 .LVL188-.LVL134
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x8
	.byte	0x91
	.sleb128 -288
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST82:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x3
	.byte	0x8b
	.sleb128 -10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL184-.LVL134
	.uleb128 .LVL185-.LVL134
	.uleb128 0x3
	.byte	0x8b
	.sleb128 -10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x3
	.byte	0x8b
	.sleb128 -10
	.byte	0x9f
	.byte	0
.LLST83:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL184-.LVL134
	.uleb128 .LVL185-.LVL134
	.uleb128 0x8
	.byte	0x91
	.sleb128 -288
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL187-.LVL134
	.uleb128 .LVL188-.LVL134
	.uleb128 0x8
	.byte	0x91
	.sleb128 -288
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL188-.LVL134
	.uleb128 .LVL189-.LVL134
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL191-.LVL134
	.uleb128 .LVL193-.LVL134
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0
.LLST84:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL135-.LVL134
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL135-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL184-.LVL134
	.uleb128 .LVL185-.LVL134
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL187-.LVL134
	.uleb128 .LVL189-.LVL134
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL191-.LVL134
	.uleb128 .LVL192-.LVL134
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL192-.LVL134
	.uleb128 .LVL193-.LVL134
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST85:
	.byte	0x6
	.8byte	.LVL134
	.byte	0x4
	.uleb128 .LVL134-.LVL134
	.uleb128 .LVL136-.LVL134
	.uleb128 0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.LVL134
	.uleb128 .LVL194-.LVL134
	.uleb128 0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST86:
	.byte	0x6
	.8byte	.LVL137
	.byte	0x4
	.uleb128 .LVL137-.LVL137
	.uleb128 .LVL139-1-.LVL137
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL141-.LVL137
	.uleb128 .LVL143-.LVL137
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST88:
	.byte	0x6
	.8byte	.LVL137
	.byte	0x4
	.uleb128 .LVL137-.LVL137
	.uleb128 .LVL138-.LVL137
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL138-.LVL137
	.uleb128 .LVL140-.LVL137
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL141-.LVL137
	.uleb128 .LVL142-.LVL137
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST90:
	.byte	0x8
	.8byte	.LVL138
	.uleb128 .LVL139-1-.LVL138
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST92:
	.byte	0x8
	.8byte	.LVL138
	.uleb128 .LVL139-.LVL138
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST73:
	.byte	0x8
	.8byte	.LVL124
	.uleb128 .LVL125-.LVL124
	.uleb128 0x1
	.byte	0x64
	.byte	0
.LLST74:
	.byte	0x8
	.8byte	.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.byte	0
.LLST96:
	.byte	0x6
	.8byte	.LVL156
	.byte	0x4
	.uleb128 .LVL156-.LVL156
	.uleb128 .LVL157-.LVL156
	.uleb128 0xa
	.byte	0x7d
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x411a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL157-.LVL156
	.uleb128 .LVL158-.LVL156
	.uleb128 0xd
	.byte	0x91
	.sleb128 -256
	.byte	0x94
	.byte	0x4
	.byte	0x7a
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x411a
	.byte	0x9f
	.byte	0
.LLST56:
	.byte	0x6
	.8byte	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL85-.LVL84
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL85-.LVL84
	.uleb128 .LVL86-.LVL84
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL86-.LVL84
	.uleb128 .LVL87-.LVL84
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.byte	0
.LLST57:
	.byte	0x6
	.8byte	.LVL92
	.byte	0x4
	.uleb128 .LVL92-.LVL92
	.uleb128 .LVL94-1-.LVL92
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL94-1-.LVL92
	.uleb128 .LVL94-.LVL92
	.uleb128 0x1
	.byte	0x64
	.byte	0
.LLST58:
	.byte	0x8
	.8byte	.LVL92
	.uleb128 .LVL94-.LVL92
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST59:
	.byte	0x6
	.8byte	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL94-1-.LVL93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL94-1-.LVL93
	.uleb128 .LVL94-.LVL93
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.byte	0
.LLST60:
	.byte	0x8
	.8byte	.LVL96
	.uleb128 .LVL97-.LVL96
	.uleb128 0x1
	.byte	0x64
	.byte	0
.LLST62:
	.byte	0x8
	.8byte	.LVL98
	.uleb128 .LVL99-.LVL98
	.uleb128 0x4
	.byte	0xa
	.2byte	0x411a
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL32-.LVL31
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL32-.LVL31
	.uleb128 .LVL43-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0x4
	.uleb128 .LVL43-.LVL31
	.uleb128 .LVL44-.LVL31
	.uleb128 0x3
	.byte	0x72
	.sleb128 -184
	.byte	0x4
	.uleb128 .LVL44-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
.LLST14:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL35-.LVL31
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL35-.LVL31
	.uleb128 .LVL43-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL43-.LVL31
	.uleb128 .LVL44-.LVL31
	.uleb128 0x3
	.byte	0x72
	.sleb128 -232
	.byte	0x4
	.uleb128 .LVL44-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0
.LLST15:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL35-.LVL31
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL35-.LVL31
	.uleb128 .LVL43-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x4
	.uleb128 .LVL43-.LVL31
	.uleb128 .LVL44-.LVL31
	.uleb128 0x3
	.byte	0x72
	.sleb128 -192
	.byte	0x4
	.uleb128 .LVL44-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.byte	0
.LLST16:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL33-.LVL31
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL33-.LVL31
	.uleb128 .LVL35-.LVL31
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL35-.LVL31
	.uleb128 .LVL43-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.byte	0x4
	.uleb128 .LVL43-.LVL31
	.uleb128 .LVL44-.LVL31
	.uleb128 0x3
	.byte	0x72
	.sleb128 -224
	.byte	0x4
	.uleb128 .LVL44-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.byte	0
.LLST17:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL35-.LVL31
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL35-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x9f
	.byte	0
.LLST18:
	.byte	0x6
	.8byte	.LVL31
	.byte	0x4
	.uleb128 .LVL31-.LVL31
	.uleb128 .LVL34-.LVL31
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL34-.LVL31
	.uleb128 .LFE8-.LVL31
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.8byte	.LVL35
	.byte	0x4
	.uleb128 .LVL35-.LVL35
	.uleb128 .LVL39-.LVL35
	.uleb128 0x15
	.byte	0x85
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x35
	.byte	0x1e
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xa8
	.byte	0x1c
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL35
	.uleb128 .LVL40-.LVL35
	.uleb128 0x17
	.byte	0x85
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x35
	.byte	0x1e
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xa8
	.byte	0x1c
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL35
	.uleb128 .LVL41-.LVL35
	.uleb128 0x17
	.byte	0x85
	.sleb128 -1
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x35
	.byte	0x1e
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xa8
	.byte	0x1c
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL35
	.uleb128 .LFE8-.LVL35
	.uleb128 0x15
	.byte	0x85
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x35
	.byte	0x1e
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xa8
	.byte	0x1c
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST22:
	.byte	0x6
	.8byte	.LVL35
	.byte	0x4
	.uleb128 .LVL35-.LVL35
	.uleb128 .LVL36-.LVL35
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL35
	.uleb128 .LVL37-.LVL35
	.uleb128 0x5
	.byte	0x32
	.byte	0x8b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL37-.LVL35
	.uleb128 .LVL38-.LVL35
	.uleb128 0x5
	.byte	0x33
	.byte	0x8b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL35
	.uleb128 .LFE8-.LVL35
	.uleb128 0x5
	.byte	0x32
	.byte	0x8b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x6
	.8byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL48-.LVL45
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL48-.LVL45
	.uleb128 .LVL52-.LVL45
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL45
	.uleb128 .LVL61-.LVL45
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL64-.LVL45
	.uleb128 .LFE8-.LVL45
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST25:
	.byte	0x6
	.8byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL48-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL48-.LVL45
	.uleb128 .LVL49-.LVL45
	.uleb128 0x3
	.byte	0x7f
	.sleb128 2
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL49-.LVL45
	.uleb128 .LVL50-.LVL45
	.uleb128 0x3
	.byte	0x87
	.sleb128 2
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.LVL45
	.uleb128 .LVL51-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL51-.LVL45
	.uleb128 .LVL53-.LVL45
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL59-.LVL45
	.uleb128 .LVL60-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL60-.LVL45
	.uleb128 .LVL64-.LVL45
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL64-.LVL45
	.uleb128 .LFE8-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0
.LLST26:
	.byte	0x6
	.8byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL46-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL46-.LVL45
	.uleb128 .LVL47-.LVL45
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL48-.LVL45
	.uleb128 .LVL53-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL59-.LVL45
	.uleb128 .LVL62-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL62-.LVL45
	.uleb128 .LVL63-.LVL45
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL64-.LVL45
	.uleb128 .LFE8-.LVL45
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x6
	.8byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL56-1-.LVL54
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL58-.LVL54
	.uleb128 .LVL59-.LVL54
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST29:
	.byte	0x6
	.8byte	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL55-.LVL54
	.uleb128 .LVL57-.LVL54
	.uleb128 0x1
	.byte	0x69
	.byte	0x4
	.uleb128 .LVL58-.LVL54
	.uleb128 .LVL59-.LVL54
	.uleb128 0x1
	.byte	0x69
	.byte	0
.LLST31:
	.byte	0x8
	.8byte	.LVL55
	.uleb128 .LVL56-1-.LVL55
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST32:
	.byte	0x8
	.8byte	.LVL55
	.uleb128 .LVL56-.LVL55
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL5-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST1:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL14-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST2:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL17-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL17-.LVL0
	.uleb128 .LVL19-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL19-.LVL0
	.uleb128 .LVL20-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL20-.LVL0
	.uleb128 .LVL22-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL22-.LVL0
	.uleb128 .LVL30-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST3:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL20-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL20-.LVL0
	.uleb128 .LVL26-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL0
	.uleb128 .LVL30-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL30-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL16-.LVL0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL16-.LVL0
	.uleb128 .LVL17-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL17-.LVL0
	.uleb128 .LVL19-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL19-.LVL0
	.uleb128 .LVL20-.LVL0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL20-.LVL0
	.uleb128 .LVL22-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL22-.LVL0
	.uleb128 .LVL23-.LVL0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL23-.LVL0
	.uleb128 .LVL24-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL24-.LVL0
	.uleb128 .LVL25-.LVL0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL25-.LVL0
	.uleb128 .LVL26-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL26-.LVL0
	.uleb128 .LVL28-.LVL0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL28-.LVL0
	.uleb128 .LVL30-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL30-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST5:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL14-.LVL0
	.uleb128 .LVL15-.LVL0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL15-.LVL0
	.uleb128 .LVL18-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL18-.LVL0
	.uleb128 .LVL19-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x60
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL0
	.uleb128 .LVL20-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL20-.LVL0
	.uleb128 .LVL26-.LVL0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL26-.LVL0
	.uleb128 .LVL27-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL27-.LVL0
	.uleb128 .LVL28-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x60
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL28-.LVL0
	.uleb128 .LVL29-.LVL0
	.uleb128 0x1
	.byte	0x60
	.byte	0x4
	.uleb128 .LVL29-.LVL0
	.uleb128 .LVL30-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x60
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL0
	.uleb128 .LFE7-.LVL0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST6:
	.byte	0x8
	.8byte	.LVL6
	.uleb128 .LVL13-.LVL6
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST8:
	.byte	0x6
	.8byte	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL7-.LVL6
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.LVL6
	.uleb128 .LVL11-.LVL6
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL12-.LVL6
	.uleb128 .LVL13-.LVL6
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST10:
	.byte	0x6
	.8byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL8-.LVL7
	.uleb128 .LVL13-.LVL7
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST12:
	.byte	0x6
	.8byte	.LVL7
	.byte	0x4
	.uleb128 .LVL7-.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL7
	.uleb128 .LVL9-.LVL7
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
	.uleb128 .LVL9-.LVL7
	.uleb128 .LVL10-.LVL7
	.uleb128 0xa
	.byte	0x7f
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL7
	.uleb128 .LVL12-.LVL7
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
.LLST33:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL66-.LVL65
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL66-.LVL65
	.uleb128 .LVL78-.LVL65
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL78-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL70-.LVL65
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL70-.LVL65
	.uleb128 .LVL79-.LVL65
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL79-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST35:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL68-.LVL65
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL68-.LVL65
	.uleb128 .LVL80-.LVL65
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL80-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.byte	0
.LLST36:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL70-.LVL65
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL70-.LVL65
	.uleb128 .LVL73-.LVL65
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL73-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5d
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5d
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL69-.LVL65
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL69-.LVL65
	.uleb128 .LVL81-.LVL65
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL81-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x9f
	.byte	0
.LLST38:
	.byte	0x6
	.8byte	.LVL65
	.byte	0x4
	.uleb128 .LVL65-.LVL65
	.uleb128 .LVL70-.LVL65
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL70-.LVL65
	.uleb128 .LVL82-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL82-.LVL65
	.uleb128 .LVL83-1-.LVL65
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL83-1-.LVL65
	.uleb128 .LFE9-.LVL65
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5f
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x6
	.8byte	.LVL73
	.byte	0x4
	.uleb128 .LVL73-.LVL73
	.uleb128 .LVL75-1-.LVL73
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL76-.LVL73
	.uleb128 .LVL77-.LVL73
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST40:
	.byte	0x6
	.8byte	.LVL67
	.byte	0x4
	.uleb128 .LVL67-.LVL67
	.uleb128 .LVL70-.LVL67
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL70-.LVL67
	.uleb128 .LVL72-.LVL67
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL72-.LVL67
	.uleb128 .LVL73-.LVL67
	.uleb128 0x1
	.byte	0x60
	.byte	0
.LLST41:
	.byte	0x6
	.8byte	.LVL67
	.byte	0x4
	.uleb128 .LVL67-.LVL67
	.uleb128 .LVL70-.LVL67
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL70-.LVL67
	.uleb128 .LVL73-.LVL67
	.uleb128 0x1
	.byte	0x5e
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
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
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
	.8byte	.LBB41
	.byte	0x4
	.uleb128 .LBB41-.LBB41
	.uleb128 .LBE41-.LBB41
	.byte	0x4
	.uleb128 .LBB47-.LBB41
	.uleb128 .LBE47-.LBB41
	.byte	0
.LLRL9:
	.byte	0x5
	.8byte	.LBB42
	.byte	0x4
	.uleb128 .LBB42-.LBB42
	.uleb128 .LBE42-.LBB42
	.byte	0x4
	.uleb128 .LBB45-.LBB42
	.uleb128 .LBE45-.LBB42
	.byte	0x4
	.uleb128 .LBB46-.LBB42
	.uleb128 .LBE46-.LBB42
	.byte	0
.LLRL11:
	.byte	0x5
	.8byte	.LBB43
	.byte	0x4
	.uleb128 .LBB43-.LBB43
	.uleb128 .LBE43-.LBB43
	.byte	0x4
	.uleb128 .LBB44-.LBB43
	.uleb128 .LBE44-.LBB43
	.byte	0
.LLRL19:
	.byte	0x5
	.8byte	.LBB55
	.byte	0x4
	.uleb128 .LBB55-.LBB55
	.uleb128 .LBE55-.LBB55
	.byte	0x4
	.uleb128 .LBB69-.LBB55
	.uleb128 .LBE69-.LBB55
	.byte	0
.LLRL21:
	.byte	0x5
	.8byte	.LBB56
	.byte	0x4
	.uleb128 .LBB56-.LBB56
	.uleb128 .LBE56-.LBB56
	.byte	0x4
	.uleb128 .LBB68-.LBB56
	.uleb128 .LBE68-.LBB56
	.byte	0
.LLRL23:
	.byte	0x5
	.8byte	.LBB57
	.byte	0x4
	.uleb128 .LBB57-.LBB57
	.uleb128 .LBE57-.LBB57
	.byte	0x4
	.uleb128 .LBB67-.LBB57
	.uleb128 .LBE67-.LBB57
	.byte	0
.LLRL28:
	.byte	0x5
	.8byte	.LBB59
	.byte	0x4
	.uleb128 .LBB59-.LBB59
	.uleb128 .LBE59-.LBB59
	.byte	0x4
	.uleb128 .LBB64-.LBB59
	.uleb128 .LBE64-.LBB59
	.byte	0x4
	.uleb128 .LBB65-.LBB59
	.uleb128 .LBE65-.LBB59
	.byte	0
.LLRL30:
	.byte	0x5
	.8byte	.LBB60
	.byte	0x4
	.uleb128 .LBB60-.LBB60
	.uleb128 .LBE60-.LBB60
	.byte	0x4
	.uleb128 .LBB62-.LBB60
	.uleb128 .LBE62-.LBB60
	.byte	0x4
	.uleb128 .LBB63-.LBB60
	.uleb128 .LBE63-.LBB60
	.byte	0
.LLRL55:
	.byte	0x5
	.8byte	.LBB116
	.byte	0x4
	.uleb128 .LBB116-.LBB116
	.uleb128 .LBE116-.LBB116
	.byte	0x4
	.uleb128 .LBB119-.LBB116
	.uleb128 .LBE119-.LBB116
	.byte	0
.LLRL61:
	.byte	0x5
	.8byte	.LBB124
	.byte	0x4
	.uleb128 .LBB124-.LBB124
	.uleb128 .LBE124-.LBB124
	.byte	0x4
	.uleb128 .LBB129-.LBB124
	.uleb128 .LBE129-.LBB124
	.byte	0
.LLRL63:
	.byte	0x5
	.8byte	.LBB132
	.byte	0x4
	.uleb128 .LBB132-.LBB132
	.uleb128 .LBE132-.LBB132
	.byte	0x4
	.uleb128 .LBB135-.LBB132
	.uleb128 .LBE135-.LBB132
	.byte	0
.LLRL64:
	.byte	0x5
	.8byte	.LBB136
	.byte	0x4
	.uleb128 .LBB136-.LBB136
	.uleb128 .LBE136-.LBB136
	.byte	0x4
	.uleb128 .LBB203-.LBB136
	.uleb128 .LBE203-.LBB136
	.byte	0x4
	.uleb128 .LBB204-.LBB136
	.uleb128 .LBE204-.LBB136
	.byte	0x4
	.uleb128 .LBB205-.LBB136
	.uleb128 .LBE205-.LBB136
	.byte	0
.LLRL69:
	.byte	0x5
	.8byte	.LBB137
	.byte	0x4
	.uleb128 .LBB137-.LBB137
	.uleb128 .LBE137-.LBB137
	.byte	0x4
	.uleb128 .LBB145-.LBB137
	.uleb128 .LBE145-.LBB137
	.byte	0x4
	.uleb128 .LBB182-.LBB137
	.uleb128 .LBE182-.LBB137
	.byte	0
.LLRL70:
	.byte	0x5
	.8byte	.LBB141
	.byte	0x4
	.uleb128 .LBB141-.LBB141
	.uleb128 .LBE141-.LBB141
	.byte	0x4
	.uleb128 .LBB146-.LBB141
	.uleb128 .LBE146-.LBB141
	.byte	0x4
	.uleb128 .LBB150-.LBB141
	.uleb128 .LBE150-.LBB141
	.byte	0
.LLRL71:
	.byte	0x5
	.8byte	.LBB147
	.byte	0x4
	.uleb128 .LBB147-.LBB147
	.uleb128 .LBE147-.LBB147
	.byte	0x4
	.uleb128 .LBB191-.LBB147
	.uleb128 .LBE191-.LBB147
	.byte	0x4
	.uleb128 .LBB192-.LBB147
	.uleb128 .LBE192-.LBB147
	.byte	0
.LLRL75:
	.byte	0x5
	.8byte	.LBB153
	.byte	0x4
	.uleb128 .LBB153-.LBB153
	.uleb128 .LBE153-.LBB153
	.byte	0x4
	.uleb128 .LBB196-.LBB153
	.uleb128 .LBE196-.LBB153
	.byte	0x4
	.uleb128 .LBB201-.LBB153
	.uleb128 .LBE201-.LBB153
	.byte	0
.LLRL77:
	.byte	0x5
	.8byte	.LBB154
	.byte	0x4
	.uleb128 .LBB154-.LBB154
	.uleb128 .LBE154-.LBB154
	.byte	0x4
	.uleb128 .LBB172-.LBB154
	.uleb128 .LBE172-.LBB154
	.byte	0x4
	.uleb128 .LBB173-.LBB154
	.uleb128 .LBE173-.LBB154
	.byte	0x4
	.uleb128 .LBB174-.LBB154
	.uleb128 .LBE174-.LBB154
	.byte	0x4
	.uleb128 .LBB175-.LBB154
	.uleb128 .LBE175-.LBB154
	.byte	0
.LLRL87:
	.byte	0x5
	.8byte	.LBB156
	.byte	0x4
	.uleb128 .LBB156-.LBB156
	.uleb128 .LBE156-.LBB156
	.byte	0x4
	.uleb128 .LBB165-.LBB156
	.uleb128 .LBE165-.LBB156
	.byte	0x4
	.uleb128 .LBB166-.LBB156
	.uleb128 .LBE166-.LBB156
	.byte	0x4
	.uleb128 .LBB167-.LBB156
	.uleb128 .LBE167-.LBB156
	.byte	0
.LLRL89:
	.byte	0x5
	.8byte	.LBB157
	.byte	0x4
	.uleb128 .LBB157-.LBB157
	.uleb128 .LBE157-.LBB157
	.byte	0x4
	.uleb128 .LBB161-.LBB157
	.uleb128 .LBE161-.LBB157
	.byte	0x4
	.uleb128 .LBB162-.LBB157
	.uleb128 .LBE162-.LBB157
	.byte	0x4
	.uleb128 .LBB163-.LBB157
	.uleb128 .LBE163-.LBB157
	.byte	0x4
	.uleb128 .LBB164-.LBB157
	.uleb128 .LBE164-.LBB157
	.byte	0
.LLRL91:
	.byte	0x5
	.8byte	.LBB158
	.byte	0x4
	.uleb128 .LBB158-.LBB158
	.uleb128 .LBE158-.LBB158
	.byte	0x4
	.uleb128 .LBB159-.LBB158
	.uleb128 .LBE159-.LBB158
	.byte	0x4
	.uleb128 .LBB160-.LBB158
	.uleb128 .LBE160-.LBB158
	.byte	0
.LLRL93:
	.byte	0x5
	.8byte	.LBB178
	.byte	0x4
	.uleb128 .LBB178-.LBB178
	.uleb128 .LBE178-.LBB178
	.byte	0x4
	.uleb128 .LBB181-.LBB178
	.uleb128 .LBE181-.LBB178
	.byte	0
.LLRL94:
	.byte	0x5
	.8byte	.LBB183
	.byte	0x4
	.uleb128 .LBB183-.LBB183
	.uleb128 .LBE183-.LBB183
	.byte	0x4
	.uleb128 .LBB186-.LBB183
	.uleb128 .LBE186-.LBB183
	.byte	0
.LLRL95:
	.byte	0x5
	.8byte	.LBB187
	.byte	0x4
	.uleb128 .LBB187-.LBB187
	.uleb128 .LBE187-.LBB187
	.byte	0x4
	.uleb128 .LBB190-.LBB187
	.uleb128 .LBE190-.LBB187
	.byte	0
.LLRL97:
	.byte	0x5
	.8byte	.LBB193
	.byte	0x4
	.uleb128 .LBB193-.LBB193
	.uleb128 .LBE193-.LBB193
	.byte	0x4
	.uleb128 .LBB194-.LBB193
	.uleb128 .LBE194-.LBB193
	.byte	0x4
	.uleb128 .LBB195-.LBB193
	.uleb128 .LBE195-.LBB193
	.byte	0x4
	.uleb128 .LBB202-.LBB193
	.uleb128 .LBE202-.LBB193
	.byte	0
.LLRL99:
	.byte	0x5
	.8byte	.LBB197
	.byte	0x4
	.uleb128 .LBB197-.LBB197
	.uleb128 .LBE197-.LBB197
	.byte	0x4
	.uleb128 .LBB198-.LBB197
	.uleb128 .LBE198-.LBB197
	.byte	0x4
	.uleb128 .LBB199-.LBB197
	.uleb128 .LBE199-.LBB197
	.byte	0x4
	.uleb128 .LBB200-.LBB197
	.uleb128 .LBE200-.LBB197
	.byte	0
.LLRL101:
	.byte	0x7
	.8byte	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.8byte	.LFB10
	.uleb128 .LFE10-.LFB10
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF24:
	.string	"framebuffer"
.LASF59:
	.string	"malloc"
.LASF28:
	.string	"left_score"
.LASF6:
	.string	"__uint8_t"
.LASF38:
	.string	"hit_pos"
.LASF63:
	.string	"__builtin_memset"
.LASF19:
	.string	"long long unsigned int"
.LASF20:
	.string	"Ball"
.LASF46:
	.string	"pixel"
.LASF58:
	.string	"free"
.LASF16:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF34:
	.string	"frame_start"
.LASF15:
	.string	"fb_info_t"
.LASF41:
	.string	"digit"
.LASF61:
	.string	"draw_digit"
.LASF9:
	.string	"long int"
.LASF25:
	.string	"left_paddle"
.LASF26:
	.string	"right_paddle"
.LASF49:
	.string	"get_key"
.LASF40:
	.string	"count"
.LASF7:
	.string	"__uint32_t"
.LASF56:
	.string	"buffer_address"
.LASF8:
	.string	"unsigned int"
.LASF22:
	.string	"fb_info"
.LASF10:
	.string	"long unsigned int"
.LASF57:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF13:
	.string	"width"
.LASF5:
	.string	"short unsigned int"
.LASF35:
	.string	"current_time"
.LASF29:
	.string	"right_score"
.LASF23:
	.string	"total_pixels"
.LASF45:
	.string	"color"
.LASF50:
	.string	"key_available"
.LASF52:
	.string	"get_us"
.LASF48:
	.string	"sleep_us"
.LASF30:
	.string	"frame_count"
.LASF17:
	.string	"long double"
.LASF27:
	.string	"ball"
.LASF55:
	.string	"show_buffer"
.LASF44:
	.string	"fill_rect"
.LASF32:
	.string	"fps_counter"
.LASF36:
	.string	"frame_end"
.LASF47:
	.string	"fast_clear"
.LASF43:
	.string	"draw_number"
.LASF51:
	.string	"_Bool"
.LASF3:
	.string	"unsigned char"
.LASF33:
	.string	"current_fps"
.LASF4:
	.string	"short int"
.LASF54:
	.string	"info"
.LASF21:
	.string	"Paddle"
.LASF12:
	.string	"uint32_t"
.LASF31:
	.string	"last_fps_time"
.LASF18:
	.string	"char"
.LASF37:
	.string	"frame_duration"
.LASF39:
	.string	"digits"
.LASF62:
	.string	"memset"
.LASF42:
	.string	"font"
.LASF11:
	.string	"uint8_t"
.LASF53:
	.string	"get_framebuffer_info"
.LASF14:
	.string	"height"
.LASF60:
	.string	"main"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
