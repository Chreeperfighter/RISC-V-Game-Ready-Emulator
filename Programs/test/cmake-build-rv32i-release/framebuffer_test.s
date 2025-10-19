	.file	"framebuffer_test.c"
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
	.file 0 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release" "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
	.align	1
	.globl	set_pixel
	.type	set_pixel, @function
set_pixel:
.LFB3:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
	.loc 1 18 64
	.cfi_startproc
.LVL0:
	.loc 1 19 5
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     uint32_t width = display_width;
	.loc 1 19 14 is_stmt 0
	lui	a5,%hi(display_width)	# tmp148,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	lw	a5,%lo(display_width)(a5)		# display_width, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	lui	a4,%hi(framebuffer)	# tmp147,
	ld	a4,%lo(framebuffer)(a4)		# framebuffer, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	mulw	a5,a5,a1	# tmp152, display_width, tmp159
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27
	addw	a5,a5,a0	# tmp158, tmp154, tmp152
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a3,a5,32	#, tmp161, tmp154
	srli	a5,a3,30	#, _8, tmp161
	add	a4,a4,a5	# _8, _9, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a2,0(a4)	# color, *_9
.LVL1:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:21: }
	.loc 1 21 1
	ret	
	.cfi_endproc
.LFE3:
	.size	set_pixel, .-set_pixel
	.align	1
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
.LFB4:
	.loc 1 23 41 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 26 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t width = display_width;
	.loc 1 24 14 is_stmt 0
	lui	a5,%hi(display_width)	# tmp146,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t height = display_height;
	.loc 1 25 14
	lui	a4,%hi(display_height)	# tmp147,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:26:     uint32_t total = width * height;
	.loc 1 26 14
	lw	a5,%lo(display_width)(a5)		# display_width, display_width
	lw	a4,%lo(display_height)(a4)		# display_height, display_height
	mulw	a4,a4,a5	# tmp153, display_height, display_width
.LVL3:
	.loc 1 28 5 is_stmt 1
.LBB51:
	.loc 1 28 10
	.loc 1 28 28 discriminator 1
	beq	a4,zero,.L3	#, tmp153,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 20 is_stmt 0
	lui	a5,%hi(framebuffer)	# tmp154,
	ld	a5,%lo(framebuffer)(a5)		# ivtmp.72, framebuffer
	slli	a3,a4,32	#, tmp158, tmp153
	srli	a4,a3,30	#, _22, tmp158
.LVL4:
	add	a4,a4,a5	# ivtmp.72, _24, _22
.LVL5:
.L5:
	.loc 1 29 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 24 is_stmt 0
	sw	a0,0(a5)	# color, *_6
	.loc 1 28 38 is_stmt 1 discriminator 3
.LVL6:
	.loc 1 28 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.72, ivtmp.72
.LVL7:
	bne	a5,a4,.L5	#, ivtmp.72, _24,
.LVL8:
.L3:
.LBE51:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:31: }
	.loc 1 31 1 is_stmt 0
	ret	
	.cfi_endproc
.LFE4:
	.size	clear_screen, .-clear_screen
	.align	1
	.globl	fast_sin
	.type	fast_sin, @function
fast_sin:
.LFB5:
	.loc 1 34 25 is_stmt 1
	.cfi_startproc
.LVL9:
	.loc 1 36 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 14 is_stmt 0 discriminator 1
	lui	a5,%hi(.LC0)	# tmp169,
	flw	fa5,%lo(.LC0)(a5)	# tmp141,
	.loc 1 36 14 is_stmt 1 discriminator 1
	lui	a5,%hi(.LC1)	# tmp170,
	fgt.s	a4,fa0,fa5	#, tmp143, x, tmp141
	beq	a4,zero,.L21	#, tmp143,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 28 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp144,
.L13:
	.loc 1 36 26 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 28 is_stmt 0 discriminator 2
	fsub.s	fa0,fa0,fa4	# x, x, tmp144
.LVL10:
	.loc 1 36 14 is_stmt 1 discriminator 1
	fgt.s	a5,fa0,fa5	#, tmp148, x, tmp146
	bne	a5,zero,.L13	#, tmp148,,
.L14:
.LVL11:
	.loc 1 40 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     float x2 = x * x;
	.loc 1 40 11 is_stmt 0
	fmul.s	fa5,fa0,fa0	# x2, x, x
.LVL12:
	.loc 1 41 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 47 is_stmt 0
	lui	a5,%hi(.LC4)	# tmp162,
	flw	fa4,%lo(.LC4)(a5)	# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 27
	lui	a5,%hi(.LC3)	# tmp159,
	flw	fa2,%lo(.LC3)(a5)	# tmp158,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 47
	fdiv.s	fa4,fa5,fa4	# _2, x2, tmp161
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 42
	lui	a5,%hi(.LC5)	# tmp165,
	flw	fa3,%lo(.LC5)(a5)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 27
	fdiv.s	fa5,fa5,fa2	# _1, x2, tmp158
.LVL13:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 42
	fsub.s	fa4,fa3,fa4	# _3, tmp164, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 22
	fnmsub.s	fa5,fa5,fa4,fa3	# _5, _1, _3, tmp164
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:42: }
	.loc 1 42 1
	fmul.s	fa0,fa5,fa0	#, _5, x
.LVL14:
	ret	
.LVL15:
.L21:
	.loc 1 37 14 is_stmt 1 discriminator 1
	lui	a4,%hi(.LC2)	# tmp171,
	flw	fa5,%lo(.LC2)(a4)	# tmp149,
	flt.s	a4,fa0,fa5	#, tmp151, x, tmp149
	beq	a4,zero,.L14	#, tmp151,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:37:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 37 29 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp152,
.L16:
	.loc 1 37 27 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:37:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 37 29 is_stmt 0 discriminator 2
	fadd.s	fa0,fa0,fa4	# x, x, tmp152
.LVL16:
	.loc 1 37 14 is_stmt 1 discriminator 1
	flt.s	a5,fa0,fa5	#, tmp156, x, tmp154
	bne	a5,zero,.L16	#, tmp156,,
	j	.L14		#
	.cfi_endproc
.LFE5:
	.size	fast_sin, .-fast_sin
	.align	1
	.globl	fast_cos
	.type	fast_cos, @function
fast_cos:
.LFB6:
	.loc 1 44 25
	.cfi_startproc
.LVL17:
	.loc 1 45 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:45:     return fast_sin(x + 1.5708f);  // cos(x) = sin(x + PI/2)
	.loc 1 45 12 is_stmt 0
	lui	a5,%hi(.LC6)	# tmp143,
	flw	fa4,%lo(.LC6)(a5)	# tmp142,
.LBB54:
.LBB55:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 14 discriminator 1
	lui	a5,%hi(.LC0)	# tmp172,
	flw	fa5,%lo(.LC0)(a5)	# tmp144,
.LBE55:
.LBE54:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:45:     return fast_sin(x + 1.5708f);  // cos(x) = sin(x + PI/2)
	.loc 1 45 12
	fadd.s	fa0,fa0,fa4	# x, tmp175, tmp142
.LVL18:
.LBB58:
.LBB56:
	.loc 1 36 5 is_stmt 1
	.loc 1 36 14 discriminator 1
	lui	a5,%hi(.LC1)	# tmp173,
	fgt.s	a4,fa0,fa5	#, tmp146, x, tmp144
	beq	a4,zero,.L35	#, tmp146,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 28 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp147,
.L27:
	.loc 1 36 26 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 36 28 is_stmt 0 discriminator 2
	fsub.s	fa0,fa0,fa4	# x, x, tmp147
.LVL19:
	.loc 1 36 14 is_stmt 1 discriminator 1
	fgt.s	a5,fa0,fa5	#, tmp151, x, tmp149
	bne	a5,zero,.L27	#, tmp151,,
.L28:
.LVL20:
	.loc 1 40 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     float x2 = x * x;
	.loc 1 40 11 is_stmt 0
	fmul.s	fa5,fa0,fa0	# x2, x, x
.LVL21:
	.loc 1 41 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 47 is_stmt 0
	lui	a5,%hi(.LC4)	# tmp165,
	flw	fa4,%lo(.LC4)(a5)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 27
	lui	a5,%hi(.LC3)	# tmp162,
	flw	fa2,%lo(.LC3)(a5)	# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 47
	fdiv.s	fa4,fa5,fa4	# _11, x2, tmp164
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 42
	lui	a5,%hi(.LC5)	# tmp168,
	flw	fa3,%lo(.LC5)(a5)	# tmp167,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 27
	fdiv.s	fa5,fa5,fa2	# _10, x2, tmp161
.LVL22:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 42
	fsub.s	fa4,fa3,fa4	# _12, tmp167, _11
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 41 22
	fnmsub.s	fa5,fa5,fa4,fa3	# _14, _10, _12, tmp167
.LVL23:
.LBE56:
.LBE58:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:46: }
	.loc 1 46 1
	fmul.s	fa0,fa5,fa0	#, _14, x
	ret	
.LVL24:
.L35:
.LBB59:
.LBB57:
	.loc 1 37 14 is_stmt 1 discriminator 1
	lui	a4,%hi(.LC2)	# tmp174,
	flw	fa5,%lo(.LC2)(a4)	# tmp152,
	flt.s	a4,fa0,fa5	#, tmp154, x, tmp152
	beq	a4,zero,.L28	#, tmp154,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:37:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 37 29 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp155,
.L30:
	.loc 1 37 27 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:37:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 37 29 is_stmt 0 discriminator 2
	fadd.s	fa0,fa0,fa4	# x, x, tmp155
.LVL25:
	.loc 1 37 14 is_stmt 1 discriminator 1
	flt.s	a5,fa0,fa5	#, tmp159, x, tmp157
	bne	a5,zero,.L30	#, tmp159,,
	j	.L28		#
.LBE57:
.LBE59:
	.cfi_endproc
.LFE6:
	.size	fast_cos, .-fast_cos
	.align	1
	.globl	absf
	.type	absf, @function
absf:
.LFB7:
	.loc 1 49 21
	.cfi_startproc
.LVL26:
	.loc 1 50 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 is_stmt 0
	fmv.s.x	fa5,zero	# tmp136,
	flt.s	a5,fa0,fa5	#, tmp137, x, tmp136
	bne	a5,zero,.L42	#, tmp137,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:51: }
	.loc 1 51 1
	ret	
.L42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 discriminator 1
	fneg.s	fa0,fa0	# x, x
.LVL27:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:51: }
	.loc 1 51 1
	ret	
	.cfi_endproc
.LFE7:
	.size	absf, .-absf
	.align	1
	.globl	inv_sqrt
	.type	inv_sqrt, @function
inv_sqrt:
.LFB8:
	.loc 1 54 25 is_stmt 1
	.cfi_startproc
.LVL28:
	.loc 1 55 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:55:     float xhalf = 0.5f * x;
	.loc 1 55 11 is_stmt 0
	lui	a5,%hi(.LC7)	# tmp151,
	flw	fa5,%lo(.LC7)(a5)	# tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:54: float inv_sqrt(float x) {
	.loc 1 54 25
	fmv.x.s	a4,fa0	# x, tmp156
.LVL29:
	.loc 1 56 5 is_stmt 1
	.loc 1 57 5
	.loc 1 58 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 20 is_stmt 0
	li	a5,1597464576		# tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:55:     float xhalf = 0.5f * x;
	.loc 1 55 11
	fmul.s	fa0,fa0,fa5	# xhalf_10, x, tmp150
.LVL30:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 25
	sraiw	a4,a4,1	#, tmp144, x
.LVL31:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 20
	addiw	a5,a5,-1569	#, tmp146, tmp157
	subw	a5,a5,a4	# _3, tmp146, tmp144
.LVL32:
	.loc 1 59 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 27 is_stmt 0
	fmv.s.x	fa4,a5	# tmp160, _3
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 19
	lui	a4,%hi(.LC8)	# tmp154,
	flw	fa5,%lo(.LC8)(a4)	# tmp153,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 27
	fmul.s	fa0,fa0,fa4	# _5, xhalf_10, tmp160
.LVL33:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 19
	fnmsub.s	fa0,fa4,fa0,fa5	# _7, tmp161, _5, tmp153
.LVL34:
	.loc 1 60 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:61: }
	.loc 1 61 1 is_stmt 0
	fmul.s	fa0,fa0,fa4	#, _7, tmp162
.LVL35:
	ret	
	.cfi_endproc
.LFE8:
	.size	inv_sqrt, .-inv_sqrt
	.align	1
	.globl	sqrt_approx
	.type	sqrt_approx, @function
sqrt_approx:
.LFB9:
	.loc 1 64 28 is_stmt 1
	.cfi_startproc
.LVL36:
	.loc 1 65 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     if (x <= 0.0f) return 0.0f;
	.loc 1 65 8 is_stmt 0
	fmv.s.x	fa5,zero	# tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:64: float sqrt_approx(float x) {
	.loc 1 64 28
	fmv.x.s	a5,fa0	# x, tmp160
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     if (x <= 0.0f) return 0.0f;
	.loc 1 65 8
	fmv.s	fa4,fa0	# x, x
	fle.s	a4,fa0,fa5	#, tmp145, x, tmp144
	bne	a4,zero,.L46	#, tmp145,,
	.loc 1 66 5 is_stmt 1
.LVL37:
.LBB60:
.LBB61:
	.loc 1 55 5
	.loc 1 56 5
	.loc 1 57 5
	.loc 1 58 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:55:     float xhalf = 0.5f * x;
	.loc 1 55 11 is_stmt 0
	lui	a4,%hi(.LC7)	# tmp154,
	flw	fa0,%lo(.LC7)(a4)	# tmp153,
.LVL38:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 20
	li	a4,1597464576		# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 25
	sraiw	a3,a5,1	#, tmp147, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:55:     float xhalf = 0.5f * x;
	.loc 1 55 11
	fmul.s	fa0,fa4,fa0	# xhalf_4, x, tmp153
.LVL39:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:57:     i = 0x5f3759df - (i >> 1);
	.loc 1 57 20
	addiw	a4,a4,-1569	#, tmp149, tmp161
	subw	a4,a4,a3	# _8, tmp149, tmp147
.LVL40:
	.loc 1 59 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 27 is_stmt 0
	fmv.s.x	fa4,a4	# tmp165, _8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 19
	lui	a3,%hi(.LC8)	# tmp157,
	flw	fa5,%lo(.LC8)(a3)	# tmp156,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 27
	fmul.s	fa0,fa0,fa4	# _10, xhalf_4, tmp165
.LVL41:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 19
	fnmsub.s	fa0,fa4,fa0,fa5	# _12, tmp166, _10, tmp156
.LVL42:
	.loc 1 60 5 is_stmt 1
.LBE61:
.LBE60:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:66:     return x * inv_sqrt(x);
	.loc 1 66 14 is_stmt 0 discriminator 1
	fmv.s.x	fa5,a5	# x, x
.LBB63:
.LBB62:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:59:     x = x * (1.5f - xhalf * x * x);
	.loc 1 59 11
	fmul.s	fa0,fa0,fa4	# _13, _12, tmp167
.LBE62:
.LBE63:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:66:     return x * inv_sqrt(x);
	.loc 1 66 14 discriminator 1
	fmul.s	fa0,fa0,fa5	# <retval>, _13, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:66:     return x * inv_sqrt(x);
	.loc 1 66 14
	ret	
.L46:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     if (x <= 0.0f) return 0.0f;
	.loc 1 65 27 discriminator 1
	fmv.s	fa0,fa5	# <retval>, tmp144
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:67: }
	.loc 1 67 1
	ret	
	.cfi_endproc
.LFE9:
	.size	sqrt_approx, .-sqrt_approx
	.align	1
	.globl	fmod_simple
	.type	fmod_simple, @function
fmod_simple:
.LFB10:
	.loc 1 71 37 is_stmt 1
	.cfi_startproc
.LVL43:
	.loc 1 72 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 24 is_stmt 0
	fdiv.s	fa5,fa0,fa1	# _1, x, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 16
	fcvt.w.s a5,fa5,rtz	# _2, _1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 29
	fcvt.s.w	fa5,a5	# _3, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:73: }
	.loc 1 73 1
	fnmsub.s	fa0,fa5,fa1,fa0	#, _3, y, x
.LVL44:
	ret	
	.cfi_endproc
.LFE10:
	.size	fmod_simple, .-fmod_simple
	.align	1
	.globl	atan2_approx
	.type	atan2_approx, @function
atan2_approx:
.LFB11:
	.loc 1 76 38 is_stmt 1
	.cfi_startproc
.LVL45:
	.loc 1 77 5
.LBB64:
.LBB65:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 is_stmt 0
	fmv.s.x	fa4,zero	# tmp144,
.LBE65:
.LBE64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:76: float atan2_approx(float y, float x) {
	.loc 1 76 38
	fmv.s	fa5,fa0	# y, tmp163
.LVL46:
.LBB67:
.LBB66:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 is_stmt 0
	flt.s	a5,fa0,fa4	#, tmp145, y, tmp144
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 discriminator 2
	fmv.s	fa4,fa0	# iftmp.7_11, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23
	beq	a5,zero,.L49	#, tmp145,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 discriminator 1
	fneg.s	fa4,fa0	# iftmp.7_11, y
.L49:
.LVL47:
.LBE66:
.LBE67:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:77:     float abs_y = absf(y) + 1e-10f;  // Prevent division by zero
	.loc 1 77 11 discriminator 1
	lui	a5,%hi(.LC9)	# tmp147,
	flw	fa3,%lo(.LC9)(a5)	# tmp146,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:     if (x >= 0) {
	.loc 1 80 8
	fmv.s.x	fa2,zero	# tmp148,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:77:     float abs_y = absf(y) + 1e-10f;  // Prevent division by zero
	.loc 1 77 11 discriminator 1
	fadd.s	fa4,fa4,fa3	# abs_y, iftmp.7_11, tmp146
.LVL48:
	.loc 1 78 5 is_stmt 1
	.loc 1 80 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:     if (x >= 0) {
	.loc 1 80 8 is_stmt 0
	fge.s	a5,fa1,fa2	#, tmp149, x, tmp148
.LBB68:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:81:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 81 36
	fadd.s	fa3,fa4,fa1	# _22, abs_y, x
.LBE68:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:     if (x >= 0) {
	.loc 1 80 8
	beq	a5,zero,.L61	#, tmp149,,
.LBB69:
	.loc 1 81 9 is_stmt 1
.LVL49:
	.loc 1 82 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:81:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 81 22 is_stmt 0
	fsub.s	fa1,fa1,fa4	# _1, x, abs_y
.LVL50:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:82:         angle = 0.785398f - 0.785398f * r;  // PI/4
	.loc 1 82 15
	lui	a5,%hi(.LC10)	# tmp153,
	flw	fa0,%lo(.LC10)(a5)	# tmp152,
.LVL51:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:81:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 81 15
	fdiv.s	fa1,fa1,fa3	# r_16, _1, _22
.LVL52:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:82:         angle = 0.785398f - 0.785398f * r;  // PI/4
	.loc 1 82 15
	fnmsub.s	fa0,fa1,fa0,fa0	# <retval>, r_16, tmp152, tmp152
.LVL53:
.L53:
.LBE69:
	.loc 1 88 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:88:     return y < 0 ? -angle : angle;
	.loc 1 88 27 is_stmt 0
	fmv.s.x	fa4,zero	# tmp160,
	flt.s	a5,fa5,fa4	#, tmp161, y, tmp160
	bne	a5,zero,.L62	#, tmp161,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:89: }
	.loc 1 89 1
	ret	
.L62:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:88:     return y < 0 ? -angle : angle;
	.loc 1 88 27 discriminator 1
	fneg.s	fa0,fa0	# <retval>, <retval>
.LVL54:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:89: }
	.loc 1 89 1
	ret	
.LVL55:
.L61:
.LBB70:
	.loc 1 84 9 is_stmt 1
	.loc 1 85 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:84:         float r = (x + abs_y) / (abs_y - x);
	.loc 1 84 40 is_stmt 0
	fsub.s	fa4,fa4,fa1	# _5, abs_y, x
.LVL56:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:85:         angle = 2.356194f - 0.785398f * r;  // 3*PI/4
	.loc 1 85 15
	lui	a4,%hi(.LC10)	# tmp157,
	lui	a5,%hi(.LC11)	# tmp159,
	flw	fa0,%lo(.LC10)(a4)	# tmp156,
.LVL57:
	flw	fa2,%lo(.LC11)(a5)	# tmp158,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:84:         float r = (x + abs_y) / (abs_y - x);
	.loc 1 84 15
	fdiv.s	fa3,fa3,fa4	# r_14, _22, _5
.LVL58:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:85:         angle = 2.356194f - 0.785398f * r;  // 3*PI/4
	.loc 1 85 15
	fnmsub.s	fa0,fa3,fa0,fa2	# <retval>, r_14, tmp156, tmp158
	j	.L53		#
.LBE70:
	.cfi_endproc
.LFE11:
	.size	atan2_approx, .-atan2_approx
	.align	1
	.globl	hsv_to_rgb
	.type	hsv_to_rgb, @function
hsv_to_rgb:
.LFB12:
	.loc 1 92 48 is_stmt 1
	.cfi_startproc
.LVL59:
	.loc 1 93 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:94:     float h_prime = h / 60.0f;
	.loc 1 94 11 is_stmt 0
	lui	a5,%hi(.LC12)	# tmp228,
	flw	fa5,%lo(.LC12)(a5)	# tmp166,
.LBB71:
.LBB72:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 24
	lui	a4,%hi(.LC7)	# tmp170,
	flw	fa4,%lo(.LC7)(a4)	# tmp169,
.LBE72:
.LBE71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:94:     float h_prime = h / 60.0f;
	.loc 1 94 11
	fdiv.s	fa5,fa0,fa5	# h_prime, h, tmp166
.LBB75:
.LBB73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 14
	lui	a4,%hi(.LC13)	# tmp174,
	flw	ft1,%lo(.LC13)(a4)	# tmp173,
.LBE73:
.LBE75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 96 27
	lui	a4,%hi(.LC5)	# tmp227,
	flw	ft0,%lo(.LC5)(a4)	# tmp175,
.LBB76:
.LBB77:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23
	fmv.s.x	fa3,zero	# tmp177,
.LBE77:
.LBE76:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:93:     float c = v * s;
	.loc 1 93 11
	fmul.s	fa1,fa2,fa1	# c, v, tmp230
.LVL60:
	.loc 1 94 5 is_stmt 1
	.loc 1 95 5
.LBB79:
.LBB74:
	.loc 1 72 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 24 is_stmt 0
	fmul.s	fa4,fa5,fa4	# _33, h_prime, tmp169
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 16
	fcvt.w.s a3,fa4,rtz	# _34, _33
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 29
	fcvt.s.w	fa4,a3	# _35, _34
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72:     return x - (int)(x / y) * y;
	.loc 1 72 14
	fnmsub.s	fa4,fa4,ft1,fa5	# _37, _35, tmp173, h_prime
.LVL61:
.LBE74:
.LBE79:
	.loc 1 96 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 96 27 is_stmt 0
	fsub.s	fa4,fa4,ft0	# _1, _37, tmp175
.LVL62:
.LBB80:
.LBB78:
	.loc 1 50 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 is_stmt 0
	flt.s	a3,fa4,fa3	#, tmp178, _1, tmp177
	beq	a3,zero,.L64	#, tmp178,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50:     return x < 0 ? -x : x;
	.loc 1 50 23 discriminator 1
	fneg.s	fa4,fa4	# _1, _1
.LVL63:
.L64:
.LBE78:
.LBE80:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 96 25 discriminator 1
	flw	fa5,%lo(.LC5)(a4)	# tmp180,
.LVL64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 101 8
	flw	fa3,%lo(.LC12)(a5)	# tmp182,
.LVL65:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:97:     float m = v - c;
	.loc 1 97 11
	fsub.s	fa2,fa2,fa1	# m, v, c
.LVL66:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 96 25 discriminator 1
	fsub.s	fa5,fa5,fa4	# _2, tmp180, _1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 101 8
	flt.s	a5,fa0,fa3	#, tmp184, h, tmp182
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 101 35 discriminator 1
	fmv.s.x	fa4,zero	# b,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 96 11 discriminator 1
	fmul.s	fa5,fa5,fa1	# x, _2, c
.LVL67:
	.loc 1 97 5 is_stmt 1
	.loc 1 99 5
	.loc 1 101 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 101 8 is_stmt 0
	bne	a5,zero,.L66	#, tmp184,,
	.loc 1 102 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 102 13 is_stmt 0
	lui	a5,%hi(.LC14)	# tmp186,
	flw	fa3,%lo(.LC14)(a5)	# tmp185,
.LVL68:
	flt.s	a5,fa0,fa3	#, tmp187, h, tmp185
	beq	a5,zero,.L77	#, tmp187,,
	fmv.s	fa3,fa1	# c, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 102 27 discriminator 1
	fmv.s	fa1,fa5	# c, x
.LVL69:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 102 34 discriminator 1
	fmv.s	fa5,fa3	# x, c
.LVL70:
.L66:
	.loc 1 108 5 is_stmt 1
	.loc 1 109 5
	.loc 1 110 5
	.loc 1 112 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 108 31 is_stmt 0
	fadd.s	fa1,fa1,fa2	# _3, c, m
.LVL71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 109 31
	fadd.s	fa5,fa5,fa2	# _5, x, m
.LVL72:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 108 36
	lui	a5,%hi(.LC18)	# tmp201,
	flw	fa3,%lo(.LC18)(a5)	# tmp200,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:110:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 110 31
	fadd.s	fa4,fa4,fa2	# _7, b, m
.LVL73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 108 36
	fmul.s	fa1,fa1,fa3	# _4, _3, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 109 36
	fmul.s	fa5,fa5,fa3	# _6, _5, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:110:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 110 36
	fmul.s	fa4,fa4,fa3	# _8, _7, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 108 13
	fcvt.wu.s a5,fa1,rtz	# tmp203, _4
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 109 13
	fcvt.wu.s a4,fa5,rtz	# tmp212, _6
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:110:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 110 13
	fcvt.wu.s a0,fa4,rtz	# tmp222, _8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 112 16
	andi	a5,a5,0xff	# _9, tmp203
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 112 29
	andi	a4,a4,0xff	# _11, tmp212
	slliw	a4,a4,8	#, tmp215, _11
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 112 16
	slliw	a5,a5,16	#, tmp206, _9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 112 23
	or	a5,a5,a4	# tmp215, tmp216, tmp206
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 112 35
	andi	a0,a0,0xff	# tmp225, tmp222
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:113: }
	.loc 1 113 1
	or	a0,a0,a5	# tmp216,, tmp225
	ret	
.LVL74:
.L77:
	.loc 1 103 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 103 13 is_stmt 0
	lui	a5,%hi(.LC15)	# tmp189,
	flw	fa4,%lo(.LC15)(a5)	# tmp188,
	flt.s	a5,fa0,fa4	#, tmp190, h, tmp188
	bne	a5,zero,.L70	#, tmp190,,
	.loc 1 104 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 104 13 is_stmt 0
	lui	a5,%hi(.LC16)	# tmp192,
	flw	fa4,%lo(.LC16)(a5)	# tmp191,
	flt.s	a5,fa0,fa4	#, tmp193, h, tmp191
	bne	a5,zero,.L71	#, tmp193,,
	.loc 1 105 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 105 13 is_stmt 0
	lui	a5,%hi(.LC17)	# tmp195,
	flw	fa4,%lo(.LC17)(a5)	# tmp194,
	flt.s	a5,fa0,fa4	#, tmp196, h, tmp194
	beq	a5,zero,.L75	#, tmp196,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 105 41 discriminator 1
	fmv.s	fa4,fa1	# b, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 105 27 discriminator 1
	fmv.s	fa1,fa5	# c, x
.LVL75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 105 34 discriminator 1
	fmv.s.x	fa5,zero	# x,
.LVL76:
	j	.L66		#
.LVL77:
.L70:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 103 41 discriminator 1
	fmv.s	fa4,fa5	# b, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 103 34 discriminator 1
	fmv.s	fa5,fa1	# x, c
.LVL78:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 103 27 discriminator 1
	fmv.s.x	fa1,zero	# c,
.LVL79:
	j	.L66		#
.LVL80:
.L71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 104 41 discriminator 1
	fmv.s	fa4,fa1	# b, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 104 27 discriminator 1
	fmv.s.x	fa1,zero	# c,
.LVL81:
	j	.L66		#
.LVL82:
.L75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:106:     else { r = c; g = 0; b = x; }
	.loc 1 106 28
	fmv.s	fa4,fa5	# b, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:106:     else { r = c; g = 0; b = x; }
	.loc 1 106 21
	fmv.s.x	fa5,zero	# x,
.LVL83:
	j	.L66		#
	.cfi_endproc
.LFE12:
	.size	hsv_to_rgb, .-hsv_to_rgb
	.section	.rodata.str1.8,"aMS",@progbits,1
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
.LFB13:
	.loc 1 116 25 is_stmt 1
	.cfi_startproc
	.loc 1 117 5
	lui	a0,%hi(.LC19)	# tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:116: void init_display(void) {
	.loc 1 116 25 is_stmt 0
	addi	sp,sp,-16	#,,
	.cfi_def_cfa_offset 16
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:117:     printf("Initializing display...\n");
	.loc 1 117 5
	addi	a0,a0,%lo(.LC19)	#, tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:116: void init_display(void) {
	.loc 1 116 25
	sd	ra,8(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:117:     printf("Initializing display...\n");
	.loc 1 117 5
	call	puts		#
.LVL84:
	.loc 1 119 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:119:     uint32_t status = get_display_status();
	.loc 1 119 23 is_stmt 0
	call	get_display_status		#
.LVL85:
	.loc 1 120 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:120:     if (!(status & 0x2)) {
	.loc 1 120 8 is_stmt 0
	andi	a0,a0,2	#, tmp149, tmp165
.LVL86:
	beq	a0,zero,.L83	#, tmp149,,
	.loc 1 125 5 is_stmt 1
	sd	s0,0(sp)	#,
	.cfi_offset 8, -16
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_width = (int)get_display_width();
	.loc 1 125 26 is_stmt 0
	call	get_display_width		#
.LVL87:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_width = (int)get_display_width();
	.loc 1 125 19 discriminator 1
	lui	s0,%hi(display_width)	# tmp152,
	sw	a0,%lo(display_width)(s0)	# tmp166, display_width
	.loc 1 126 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:126:     display_height = (int)get_display_height();
	.loc 1 126 27 is_stmt 0
	call	get_display_height		#
.LVL88:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:132:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 132 5
	lw	a1,%lo(display_width)(s0)		#, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:126:     display_height = (int)get_display_height();
	.loc 1 126 27
	mv	a2,a0	# tmp153, tmp167
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:132:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 132 5
	lui	a0,%hi(.LC21)	# tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:126:     display_height = (int)get_display_height();
	.loc 1 126 20 discriminator 1
	lui	a5,%hi(display_height)	# tmp154,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:132:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 132 5
	addi	a0,a0,%lo(.LC21)	#, tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:126:     display_height = (int)get_display_height();
	.loc 1 126 20 discriminator 1
	sw	a2,%lo(display_height)(a5)	# tmp153, display_height
	.loc 1 129 5 is_stmt 1
.LVL89:
	.loc 1 130 5
	.loc 1 132 5
	call	printf		#
.LVL90:
	.loc 1 134 5
	li	a0,1		#,
	call	set_display_enable		#
.LVL91:
	.loc 1 135 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:135:     status = get_display_status();
	.loc 1 135 14 is_stmt 0
	call	get_display_status		#
.LVL92:
	.loc 1 136 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:136:     if (status & 0x1) {
	.loc 1 136 8 is_stmt 0
	andi	a0,a0,1	#, tmp162, tmp168
.LVL93:
	bne	a0,zero,.L84	#, tmp162,,
	.loc 1 140 9 is_stmt 1
	ld	s0,0(sp)		#,
	.cfi_remember_state
	.cfi_restore 8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1 is_stmt 0
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:140:         printf("Warning: Display not ready\n");
	.loc 1 140 9
	lui	a0,%hi(.LC23)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:140:         printf("Warning: Display not ready\n");
	.loc 1 140 9
	addi	a0,a0,%lo(.LC23)	#, tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:140:         printf("Warning: Display not ready\n");
	.loc 1 140 9
	tail	puts		#
.LVL94:
.L84:
	.cfi_restore_state
	.loc 1 137 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:140:         printf("Warning: Display not ready\n");
	.loc 1 140 9 is_stmt 0
	ld	s0,0(sp)		#,
	.cfi_restore 8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:137:         printf("Display enabled successfully\n");
	.loc 1 137 9
	lui	a0,%hi(.LC22)	# tmp163,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:137:         printf("Display enabled successfully\n");
	.loc 1 137 9
	addi	a0,a0,%lo(.LC22)	#, tmp163,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:140:         printf("Warning: Display not ready\n");
	.loc 1 140 9
	tail	puts		#
.LVL95:
.L83:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -8
	.loc 1 121 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1 is_stmt 0
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:121:         printf("Warning: Display not ready.\n");
	.loc 1 121 9
	lui	a0,%hi(.LC20)	# tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:121:         printf("Warning: Display not ready.\n");
	.loc 1 121 9
	addi	a0,a0,%lo(.LC20)	#, tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:142: }
	.loc 1 142 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:121:         printf("Warning: Display not ready.\n");
	.loc 1 121 9
	tail	puts		#
.LVL96:
	.cfi_endproc
.LFE13:
	.size	init_display, .-init_display
	.section	.rodata.str1.8
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
.LFB14:
	.loc 1 145 34 is_stmt 1
	.cfi_startproc
	.loc 1 146 5
.LVL97:
.LBB104:
.LBB105:
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 26 5
.LBE105:
.LBE104:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:145: void run_frame_buffer_test(void) {
	.loc 1 145 34 is_stmt 0
	addi	sp,sp,-80	#,,
	.cfi_def_cfa_offset 80
	sd	s0,64(sp)	#,
	sd	s2,48(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 18, -32
.LBB111:
.LBB108:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t height = display_height;
	.loc 1 25 14
	lui	s0,%hi(display_height)	# tmp337,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t width = display_width;
	.loc 1 24 14
	lui	s2,%hi(display_width)	# tmp341,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:26:     uint32_t total = width * height;
	.loc 1 26 14
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	lw	a4,%lo(display_height)(s0)		# display_height, display_height
.LBE108:
.LBE111:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:145: void run_frame_buffer_test(void) {
	.loc 1 145 34
	sd	ra,72(sp)	#,
	sd	s3,40(sp)	#,
.LBB112:
.LBB109:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:26:     uint32_t total = width * height;
	.loc 1 26 14
	mulw	a4,a4,a5	# tmp215, display_height, display_width
.LVL98:
	.loc 1 28 5 is_stmt 1
.LBB106:
	.loc 1 28 10
	.loc 1 28 28 discriminator 1
.LBE106:
.LBE109:
.LBE112:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:145: void run_frame_buffer_test(void) {
	.loc 1 145 34 is_stmt 0
	sd	s4,32(sp)	#,
	sd	s5,24(sp)	#,
	sd	s7,8(sp)	#,
	sd	s8,0(sp)	#,
	.cfi_offset 1, -8
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	.cfi_offset 24, -80
.LBB113:
.LBB110:
.LBB107:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:     for (uint32_t i = 0; i < total; i++) {
	.loc 1 28 28 discriminator 1
	beq	a4,zero,.L90	#, tmp215,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 20
	lui	a5,%hi(framebuffer)	# tmp228,
	ld	a5,%lo(framebuffer)(a5)		# ivtmp.152, framebuffer
	slli	a3,a4,32	#, tmp346, tmp215
	srli	a4,a3,30	#, _130, tmp346
.LVL99:
	add	a4,a4,a5	# ivtmp.152, _128, _130
.LVL100:
.L89:
	.loc 1 29 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 24 is_stmt 0
	sw	zero,0(a5)	#, *_105
	.loc 1 28 38 is_stmt 1 discriminator 3
.LVL101:
	.loc 1 28 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.152, ivtmp.152
.LVL102:
	bne	a5,a4,.L89	#, ivtmp.152, _128,
.LVL103:
.L90:
.LBE107:
.LBE110:
.LBE113:
	.loc 1 148 5
	lui	a0,%hi(.LC24)	# tmp216,
	addi	a0,a0,%lo(.LC24)	#, tmp216,
	call	puts		#
.LVL104:
	.loc 1 150 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:151:     uint32_t height = display_height;
	.loc 1 151 14 is_stmt 0
	lw	s4,%lo(display_height)(s0)		# height, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:156:     printf("Test 1: Red gradient\n");
	.loc 1 156 5
	lui	a0,%hi(.LC25)	# tmp221,
	addi	a0,a0,%lo(.LC25)	#, tmp221,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:153:     uint32_t section_height = height / 4;
	.loc 1 153 14
	srliw	s7,s4,2	# tmp220, height,
.LBB114:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:175:     for (uint32_t y = section_height * 2; y < section_height * 3; y++) {
	.loc 1 175 62 discriminator 1
	slliw	s8,s7,1	#, tmp338, tmp220
	addw	s5,s8,s7	# tmp220, tmp227, tmp338
.LBE114:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:150:     uint32_t width = display_width;
	.loc 1 150 14
	lw	s0,%lo(display_width)(s2)		# width, display_width
.LVL105:
	.loc 1 151 5 is_stmt 1
	.loc 1 153 5
	.loc 1 156 5
.LBB125:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:175:     for (uint32_t y = section_height * 2; y < section_height * 3; y++) {
	.loc 1 175 62 is_stmt 0 discriminator 1
	mv	s3,s5	# y, tmp227
.LBE125:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:156:     printf("Test 1: Red gradient\n");
	.loc 1 156 5
	call	puts		#
.LVL106:
	.loc 1 157 5 is_stmt 1
.LBB126:
	.loc 1 157 10
	.loc 1 157 28 discriminator 1
	beq	s7,zero,.L131	#, tmp220,,
	sd	s1,56(sp)	#,
	sd	s6,16(sp)	#,
	.cfi_offset 9, -24
	.cfi_offset 22, -64
.LBB127:
.LBB128:
.LBB129:
.LBB130:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16 is_stmt 0
	lui	s1,%hi(framebuffer)	# tmp340,
	ld	a0,%lo(framebuffer)(s1)		# framebuffer.1_61, framebuffer
.LVL107:
.LBE130:
.LBE129:
.LBE128:
	.loc 1 158 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L91	#, width,,
	li	a1,0		# y,
.LBB139:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:160:             set_pixel(x, y, intensity << 16);
	.loc 1 160 13 is_stmt 0
	li	a6,16711680		# tmp238,
.LVL108:
.L93:
.LBE139:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:158:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 158 32 discriminator 1
	li	a2,0		# ivtmp.145,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:158:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 158 23
	li	a3,0		# x,
.L92:
.LVL109:
.LBB140:
	.loc 1 159 13 is_stmt 1
	.loc 1 160 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:159:             uint8_t intensity = (x * 255) / width;
	.loc 1 159 43 is_stmt 0
	divuw	a4,a2,s0	# width, tmp234, ivtmp.145
.LBB135:
.LBB131:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
.LBE131:
.LBE135:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:160:             set_pixel(x, y, intensity << 16);
	.loc 1 160 13
	addiw	a2,a2,255	#, ivtmp.145, ivtmp.145
.LVL110:
.LBB136:
.LBB132:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	mulw	a5,a5,a1	# tmp243, display_width, y
.LBE132:
.LBE136:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:160:             set_pixel(x, y, intensity << 16);
	.loc 1 160 13
	slliw	a4,a4,16	#, tmp236, tmp234
	and	a4,a4,a6	# tmp238, _5, tmp236
.LVL111:
.LBB137:
.LBB133:
	.loc 1 19 5 is_stmt 1
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp245, tmp243
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a7,a5,32	#, tmp347, tmp245
	srli	a5,a7,30	#, _65, tmp347
	add	a5,a0,a5	# _65, _66, framebuffer.1_61
.LBE133:
.LBE137:
.LBE140:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:158:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 158 42 discriminator 3
	addiw	a3,a3,1	#, x, x
.LVL112:
.LBB141:
.LBB138:
.LBB134:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a4,0(a5)	# _5, *_66
.LVL113:
.LBE134:
.LBE138:
.LBE141:
	.loc 1 158 42 is_stmt 1 discriminator 3
	.loc 1 158 32 discriminator 1
	bne	s0,a3,.L92	#, width, x,
.LBE127:
	.loc 1 157 47 discriminator 2
	addiw	a1,a1,1	#, y, y
.LVL114:
	.loc 1 157 28 discriminator 1
	bne	s7,a1,.L93	#, tmp220, y,
.LVL115:
.L91:
.LBE126:
	.loc 1 165 5
	lui	a0,%hi(.LC26)	# tmp256,
	addi	a0,a0,%lo(.LC26)	#, tmp256,
	call	puts		#
.LVL116:
	.loc 1 166 5
.LBB142:
	.loc 1 166 10
	.loc 1 166 41 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:166:     for (uint32_t y = section_height; y < section_height * 2; y++) {
	.loc 1 166 58 is_stmt 0 discriminator 1
	mv	s6,s8	# y, tmp338
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:166:     for (uint32_t y = section_height; y < section_height * 2; y++) {
	.loc 1 166 41 discriminator 1
	bgeu	s7,s8,.L95	#, tmp220, tmp338,
.LBB143:
.LBB144:
.LBB145:
.LBB146:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	ld	a1,%lo(framebuffer)(s1)		# framebuffer.1_69, framebuffer
.LVL117:
.LBE146:
.LBE145:
.LBE144:
	.loc 1 167 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L95	#, width,,
	mv	a2,s7	# y, tmp220
	li	a6,0		# ivtmp.141,
.LVL118:
.L97:
.LBB149:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:168:             uint8_t intensity = ((y - section_height) * 255) / section_height;
	.loc 1 168 62 is_stmt 0
	divuw	a3,a6,s7	# tmp220, tmp262, ivtmp.141
.LBE149:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:167:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 167 23
	li	a4,0		# x,
.LBB150:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:169:             set_pixel(x, y, intensity << 8);
	.loc 1 169 13
	slliw	a3,a3,8	#, tmp264, tmp262
	slli	a3,a3,48	#, _16, tmp264
	srli	a3,a3,48	#, _16, _16
	sext.w	a3,a3	# _10, _16
.L96:
.LVL119:
	.loc 1 168 13 is_stmt 1
	.loc 1 169 13
.LBB148:
.LBB147:
	.loc 1 19 5
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19 is_stmt 0
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	mulw	a5,a5,a2	# tmp270, display_width, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27
	addw	a5,a5,a4	# x, tmp272, tmp270
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a0,a5,32	#, tmp348, tmp272
	srli	a5,a0,30	#, _73, tmp348
	add	a5,a1,a5	# _73, _74, framebuffer.1_69
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a3,0(a5)	# _10, *_74
.LVL120:
.LBE147:
.LBE148:
.LBE150:
	.loc 1 167 42 is_stmt 1 discriminator 3
	addiw	a4,a4,1	#, x, x
.LVL121:
	.loc 1 167 32 discriminator 1
	bne	s0,a4,.L96	#, width, x,
.LBE143:
	.loc 1 166 64 discriminator 2
	addiw	a2,a2,1	#, y, y
.LVL122:
	.loc 1 166 41 discriminator 1
	addiw	a6,a6,255	#, ivtmp.141, ivtmp.141
.LVL123:
	bne	s8,a2,.L97	#, tmp338, y,
.LVL124:
.L95:
.LBE142:
	.loc 1 174 5
	lui	a0,%hi(.LC27)	# tmp281,
	addi	a0,a0,%lo(.LC27)	#, tmp281,
	call	puts		#
.LVL125:
	.loc 1 175 5
.LBB151:
	.loc 1 175 10
	.loc 1 175 45 discriminator 1
	bgeu	s8,s5,.L130	#, tmp338, tmp227,
.LBB115:
.LBB116:
.LBB117:
.LBB118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16 is_stmt 0
	ld	a1,%lo(framebuffer)(s1)		# framebuffer.1_77, framebuffer
.LVL126:
.LBE118:
.LBE117:
.LBE116:
	.loc 1 176 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L130	#, width,,
	addw	a0,s0,s5	# tmp227, tmp339, width
.LVL127:
.L100:
	slliw	a2,s6,8	#, tmp288, y
	subw	a2,a2,s6	# ivtmp.128, tmp288, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:176:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 176 23 is_stmt 0
	li	a3,0		# x,
.L99:
.LVL128:
.LBB123:
	.loc 1 177 13 is_stmt 1
	.loc 1 178 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:177:             uint8_t intensity = ((x + y) * 255) / (width + section_height * 3);
	.loc 1 177 49 is_stmt 0
	divuw	a4,a2,a0	# tmp339, tmp293, ivtmp.128
.LBB121:
.LBB119:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	addiw	a2,a2,255	#, ivtmp.128, ivtmp.128
.LVL129:
	mulw	a5,a5,s6	# tmp299, display_width, y
	andi	a4,a4,0xff	# _87, tmp293
.LVL130:
	.loc 1 19 5 is_stmt 1
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp301, tmp299
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a6,a5,32	#, tmp349, tmp301
	srli	a5,a6,30	#, _81, tmp349
	add	a5,a1,a5	# _81, _82, framebuffer.1_77
.LBE119:
.LBE121:
.LBE123:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:176:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 176 42 discriminator 3
	addiw	a3,a3,1	#, x, x
.LVL131:
.LBB124:
.LBB122:
.LBB120:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a4,0(a5)	# _87, *_82
.LVL132:
.LBE120:
.LBE122:
.LBE124:
	.loc 1 176 42 is_stmt 1 discriminator 3
	.loc 1 176 32 discriminator 1
	bne	s0,a3,.L99	#, width, x,
.LBE115:
	.loc 1 175 68 discriminator 2
	addiw	s6,s6,1	#, y, y
.LVL133:
	.loc 1 175 45 discriminator 1
	bne	s6,s5,.L100	#, y, tmp227,
.LVL134:
.L130:
	ld	s1,56(sp)		#,
	.cfi_restore 9
	ld	s6,16(sp)		#,
	.cfi_restore 22
.L94:
.LBE151:
	.loc 1 183 5
	lui	a0,%hi(.LC28)	# tmp310,
	addi	a0,a0,%lo(.LC28)	#, tmp310,
	call	puts		#
.LVL135:
	.loc 1 184 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:184:     uint32_t checker_size = width / 16;  // Scale with resolution
	.loc 1 184 14 is_stmt 0
	srliw	a2,s0,4	# tmp312, width,
.LVL136:
	.loc 1 185 5 is_stmt 1
.LBB152:
	.loc 1 185 10
	.loc 1 185 45 discriminator 1
	bleu	s4,s5,.L101	#, height, tmp227,
.LBB153:
.LBB154:
.LBB155:
.LBB156:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16 is_stmt 0
	lui	a5,%hi(framebuffer)	# tmp313,
	ld	a0,%lo(framebuffer)(a5)		# framebuffer.1_85, framebuffer
.LVL137:
.LBE156:
.LBE155:
.LBE154:
	.loc 1 186 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L101	#, width,,
.LBB163:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:188:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 188 49 is_stmt 0 discriminator 1
	li	a7,16777216		# tmp342,
	addi	a7,a7,-1	#, iftmp.26_167, tmp342
.LVL138:
.L104:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 187 52
	divuw	a1,s3,a2	# tmp312, tmp316, y
.LBE163:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:186:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 186 23
	li	a3,0		# x,
.L103:
.LVL139:
.LBB164:
	.loc 1 187 13 is_stmt 1
.LBB160:
.LBB157:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19 is_stmt 0
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
.LBE157:
.LBE160:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 187 31
	divuw	a4,a3,a2	# tmp312, tmp319, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 187 47
	addw	a4,a4,a1	# tmp316, tmp321, tmp319
	andi	a4,a4,1	#, iftmp.26_167, tmp321
.LVL140:
	.loc 1 188 13 is_stmt 1
.LBB161:
.LBB158:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19 is_stmt 0
	mulw	a5,a5,s3	# tmp327, display_width, y
.LBE158:
.LBE161:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:188:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 188 49
	beq	a4,zero,.L102	#, iftmp.26_167,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:188:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 188 49 discriminator 1
	mv	a4,a7	# iftmp.26_167, iftmp.26_167
.LVL141:
.L102:
	.loc 1 189 13 is_stmt 1
.LBB162:
.LBB159:
	.loc 1 19 5
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp329, tmp327
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a6,a5,32	#, tmp350, tmp329
	srli	a5,a6,30	#, _161, tmp350
	add	a5,a0,a5	# _161, _160, framebuffer.1_85
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a4,0(a5)	# iftmp.26_167, *_160
.LVL142:
.LBE159:
.LBE162:
.LBE164:
	.loc 1 186 42 is_stmt 1 discriminator 2
	addiw	a3,a3,1	#, x, x
.LVL143:
	.loc 1 186 32 discriminator 1
	bne	s0,a3,.L103	#, width, x,
.LBE153:
	.loc 1 185 56 discriminator 2
	addiw	s3,s3,1	#, y, y
.LVL144:
	.loc 1 185 45 discriminator 1
	bne	s4,s3,.L104	#, height, y,
.LVL145:
.L101:
.LBE152:
	.loc 1 193 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:194: }
	.loc 1 194 1 is_stmt 0
	ld	s0,64(sp)		#,
	.cfi_remember_state
	.cfi_restore 8
.LVL146:
	ld	ra,72(sp)		#,
	.cfi_restore 1
	ld	s2,48(sp)		#,
	.cfi_restore 18
	ld	s3,40(sp)		#,
	.cfi_restore 19
	ld	s4,32(sp)		#,
	.cfi_restore 20
.LVL147:
	ld	s5,24(sp)		#,
	.cfi_restore 21
	ld	s7,8(sp)		#,
	.cfi_restore 23
.LVL148:
	ld	s8,0(sp)		#,
	.cfi_restore 24
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193:     printf("Framebuffer test complete!\n");
	.loc 1 193 5
	lui	a0,%hi(.LC29)	# tmp336,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:194: }
	.loc 1 194 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193:     printf("Framebuffer test complete!\n");
	.loc 1 193 5
	addi	a0,a0,%lo(.LC29)	#, tmp336,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:194: }
	.loc 1 194 1
	addi	sp,sp,80	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193:     printf("Framebuffer test complete!\n");
	.loc 1 193 5
	tail	puts		#
.LVL149:
.L131:
	.cfi_restore_state
	.loc 1 165 5 is_stmt 1
	lui	a0,%hi(.LC26)	# tmp254,
	addi	a0,a0,%lo(.LC26)	#, tmp254,
	call	puts		#
.LVL150:
	.loc 1 166 5
.LBB165:
	.loc 1 166 10
	.loc 1 166 41 discriminator 1
.LBE165:
	.loc 1 174 5
	lui	a0,%hi(.LC27)	# tmp255,
	addi	a0,a0,%lo(.LC27)	#, tmp255,
	call	puts		#
.LVL151:
	.loc 1 175 5
.LBB166:
	.loc 1 175 10
	.loc 1 175 45 discriminator 1
	j	.L94		#
.LBE166:
	.cfi_endproc
.LFE14:
	.size	run_frame_buffer_test, .-run_frame_buffer_test
	.section	.rodata.str1.8
	.align	3
.LC30:
	.string	"Rendering cool pattern..."
	.align	3
.LC32:
	.string	"Progress: %d0%%\n"
	.align	3
.LC33:
	.string	"Rendering complete!"
	.text
	.align	1
	.globl	draw_cool_pattern
	.type	draw_cool_pattern, @function
draw_cool_pattern:
.LFB15:
	.loc 1 197 30
	.cfi_startproc
	.loc 1 198 5
.LVL152:
.LBB175:
.LBB176:
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 26 5
.LBE176:
.LBE175:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:197: void draw_cool_pattern(void) {
	.loc 1 197 30 is_stmt 0
	addi	sp,sp,-160	#,,
	.cfi_def_cfa_offset 160
	sd	s0,144(sp)	#,
	sd	s9,72(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 25, -88
.LBB182:
.LBB179:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t height = display_height;
	.loc 1 25 14
	lui	s0,%hi(display_height)	# tmp324,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t width = display_width;
	.loc 1 24 14
	lui	s9,%hi(display_width)	# tmp323,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:26:     uint32_t total = width * height;
	.loc 1 26 14
	lw	a5,%lo(display_width)(s9)		# display_width, display_width
	lw	a4,%lo(display_height)(s0)		# display_height, display_height
.LBE179:
.LBE182:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:197: void draw_cool_pattern(void) {
	.loc 1 197 30
	sd	ra,152(sp)	#,
	sd	s4,112(sp)	#,
.LBB183:
.LBB180:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:26:     uint32_t total = width * height;
	.loc 1 26 14
	mulw	a4,a4,a5	# tmp207, display_height, display_width
.LVL153:
	.loc 1 28 5 is_stmt 1
.LBB177:
	.loc 1 28 10
	.loc 1 28 28 discriminator 1
.LBE177:
.LBE180:
.LBE183:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:197: void draw_cool_pattern(void) {
	.loc 1 197 30 is_stmt 0
	sd	s8,80(sp)	#,
	sd	s10,64(sp)	#,
	.cfi_offset 1, -8
	.cfi_offset 20, -48
	.cfi_offset 24, -80
	.cfi_offset 26, -96
.LBB184:
.LBB181:
.LBB178:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:     for (uint32_t i = 0; i < total; i++) {
	.loc 1 28 28 discriminator 1
	beq	a4,zero,.L137	#, tmp207,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 20
	lui	s10,%hi(framebuffer)	# tmp326,
	ld	a5,%lo(framebuffer)(s10)		# ivtmp.176, framebuffer
	slli	a3,a4,32	#, tmp330, tmp207
	srli	a4,a3,30	#, _130, tmp330
.LVL154:
	add	a4,a4,a5	# ivtmp.176, _128, _130
.LVL155:
.L136:
	.loc 1 29 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:29:         framebuffer[i] = color;
	.loc 1 29 24 is_stmt 0
	sw	zero,0(a5)	#, *_78
	.loc 1 28 38 is_stmt 1 discriminator 3
.LVL156:
	.loc 1 28 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.176, ivtmp.176
.LVL157:
	bne	a4,a5,.L136	#, _128, ivtmp.176,
.LVL158:
.L137:
.LBE178:
.LBE181:
.LBE184:
	.loc 1 200 5
	lui	a0,%hi(.LC30)	# tmp208,
	addi	a0,a0,%lo(.LC30)	#, tmp208,
	call	puts		#
.LVL159:
	.loc 1 202 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:203:     uint32_t height = display_height;
	.loc 1 203 14 is_stmt 0
	lw	t6,%lo(display_height)(s0)		# height, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:202:     uint32_t width = display_width;
	.loc 1 202 14
	lw	s8,%lo(display_width)(s9)		# width, display_width
.LVL160:
	.loc 1 203 5 is_stmt 1
	.loc 1 205 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:206:     int cy = height / 2;
	.loc 1 206 21 is_stmt 0
	srliw	t0,t6,1	# tmp214, height,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:208:     uint32_t total_pixels = width * height;
	.loc 1 208 14
	mulw	t3,s8,t6	# tmp216, width, height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:205:     int cx = width / 2;
	.loc 1 205 20
	srliw	s4,s8,1	# tmp212, width,
.LVL161:
	.loc 1 206 5 is_stmt 1
	.loc 1 208 5
	.loc 1 209 5
	.loc 1 210 5
	.loc 1 212 5
.LBB185:
	.loc 1 212 10
	.loc 1 212 28 discriminator 1
	beq	t6,zero,.L134	#, height,,
	subw	t6,t6,t0	# tmp220, height, tmp214
.LVL162:
.LBB186:
	.loc 1 213 32 discriminator 1
	negw	a1,t0	# ivtmp.172, tmp214
	beq	s8,zero,.L134	#, width,,
	negw	a5,s4	# tmp325, tmp212
	sd	s11,56(sp)	#,
	li	a0,0		# pixels_done,
	.cfi_offset 27, -104
.LBB187:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 17 is_stmt 0
	li	s11,1431654400		# tmp329,
	lui	s10,%hi(framebuffer)	# tmp326,
	sd	s1,136(sp)	#,
	sd	s2,128(sp)	#,
	sd	s3,120(sp)	#,
	sd	s5,104(sp)	#,
	sd	s6,96(sp)	#,
	sd	s7,88(sp)	#,
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	sd	a5,24(sp)	# tmp325, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 17
	addi	s11,s11,1366	#, tmp267, tmp329
.LBE187:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:213:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 213 32 discriminator 1
	li	s1,0		# y,
	li	s3,-1		# percent,
.LBB198:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 33
	li	t5,16711680		# tmp278,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:241:                 printf("Progress: %d0%%\n", percent);
	.loc 1 241 17
	lui	s4,%hi(.LC32)	# tmp327,
.LVL163:
	mv	a2,a1	# ivtmp.172, ivtmp.172
	mv	s5,s8	# width, width
	mv	a3,a0	# pixels_done, pixels_done
	sd	t0,40(sp)	# tmp214, %sfp
	mv	s0,t3	# tmp216, tmp216
	sd	t6,32(sp)	# tmp220, %sfp
	mv	s2,s10	# tmp326, tmp326
.LVL164:
.L135:
	addiw	a4,a3,1	#, tmp232, pixels_done
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:218:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 218 60
	sraiw	a5,a2,31	#, tmp225, ivtmp.172
	ld	s7,24(sp)		# ivtmp.164, %sfp
	slliw	s8,a4,2	#, tmp235, tmp232
	xor	t1,a2,a5	# tmp225, tmp226, ivtmp.172
	addw	s8,s8,a4	# tmp232, tmp237, tmp235
	slliw	s8,s8,1	#, ivtmp.167, tmp237
	subw	t1,t1,a5	# tmp228, tmp226, tmp225
	li	s10,0		# ivtmp.166,
.LBE198:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:213:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 213 23
	li	s6,0		# x,
	mv	a5,s0	# tmp216, tmp216
	mv	a7,s2	# tmp326, tmp326
	mv	s0,s8	# ivtmp.167, ivtmp.167
.LVL165:
	mv	s2,s10	# ivtmp.166, ivtmp.166
	mv	s8,s1	# y, y
	mv	s10,s7	# ivtmp.164, ivtmp.164
	sd	a2,8(sp)	# ivtmp.172, %sfp
	mv	s7,s6	# x, x
	sd	a3,16(sp)	# pixels_done, %sfp
	mv	s6,t1	# tmp228, tmp228
	mv	s1,a5	# tmp216, tmp216
.LVL166:
.L139:
.LBB199:
	.loc 1 214 13 is_stmt 1
	.loc 1 215 13
	.loc 1 218 13
	.loc 1 241 17
	mv	a2,s3	# last_percent, percent
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:239:             int percent = (pixels_done * 10) / total_pixels;
	.loc 1 239 46 is_stmt 0
	divuw	s3,s0,s1	# tmp216, percent, ivtmp.167
.LVL167:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:218:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 218 38
	sraiw	a5,s10,31	#, tmp241, ivtmp.164
	xor	t3,s10,a5	# tmp241, tmp242, ivtmp.164
	subw	t3,t3,a5	# tmp244, tmp242, tmp241
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:221:             int pattern1 = (x + y) & 0xFF;
	.loc 1 221 31
	addw	a4,s8,s7	# x, tmp248, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:218:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 218 17
	addw	t3,t3,s6	# tmp228, tmp246, tmp244
.LVL168:
	.loc 1 221 13 is_stmt 1
	.loc 1 222 13
	.loc 1 223 13
	.loc 1 226 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:221:             int pattern1 = (x + y) & 0xFF;
	.loc 1 221 17 is_stmt 0
	andi	a4,a4,255	#, tmp249, tmp248
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:222:             int pattern2 = (x * y) >> 4;
	.loc 1 222 36
	srliw	a5,s2,4	# tmp251, ivtmp.166,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:223:             int pattern3 = dist & 0xFF;
	.loc 1 223 17
	andi	a3,t3,255	#, tmp254, tmp246
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 38
	addw	a5,a5,a4	# tmp249, tmp253, tmp251
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 49
	addw	a5,a5,a3	# tmp254, tmp256, tmp253
.LBB188:
.LBB189:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	lw	t4,%lo(display_width)(s9)		# display_width, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	ld	a3,%lo(framebuffer)(a7)		# framebuffer, framebuffer
.LBE189:
.LBE188:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:241:                 printf("Progress: %d0%%\n", percent);
	.loc 1 241 17
	addi	a0,s4,%lo(.LC32)	#, tmp327,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 17
	mul	a5,a5,s11	# tmp266, tmp256, tmp267
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:241:                 printf("Progress: %d0%%\n", percent);
	.loc 1 241 17
	mv	a1,s3	#, percent
.LBB194:
.LBB190:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	mulw	t4,t4,s8	# tmp298, display_width, y
.LBE190:
.LBE194:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:226:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 226 17
	srli	a5,a5,32	#, tmp272, tmp266
.LVL169:
	.loc 1 229 13 is_stmt 1
	.loc 1 230 13
	.loc 1 231 13
	.loc 1 233 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:230:             int g = (combined + y) & 0xFF;
	.loc 1 230 31 is_stmt 0
	addw	t6,s8,a5	# tmp272, tmp280, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:229:             int r = (combined + x) & 0xFF;
	.loc 1 229 31
	addw	a4,a5,s7	# x, tmp274, tmp272
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 45
	slliw	t6,t6,8	#, tmp282, tmp280
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 33
	slliw	a4,a4,16	#, tmp276, tmp274
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 45
	slli	t6,t6,48	#, _41, tmp282
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:231:             int b = (combined + dist) & 0xFF;
	.loc 1 231 31
	addw	t3,t3,a5	# tmp272, tmp288, tmp246
.LVL170:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 45
	srli	t6,t6,48	#, _41, _41
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 33
	and	a5,a4,t5	# tmp278, tmp277, tmp276
.LVL171:
.LBB195:
.LBB191:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27
	addw	t4,t4,s7	# x, tmp300, tmp298
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	a4,t4,32	#, tmp331, tmp300
.LBE191:
.LBE195:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:231:             int b = (combined + dist) & 0xFF;
	.loc 1 231 17
	andi	t3,t3,255	#, tmp289, tmp288
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 40
	or	a5,a5,t6	# _41, tmp286, tmp277
.LBB196:
.LBB192:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	srli	t4,a4,30	#, _66, tmp331
.LBE192:
.LBE196:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:233:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 233 22
	or	a5,a5,t3	# tmp289, color, tmp286
.LVL172:
	.loc 1 234 13 is_stmt 1
.LBB197:
.LBB193:
	.loc 1 19 5
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16 is_stmt 0
	add	a3,a3,t4	# _66, _67, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a5,0(a3)	# color, *_67
.LVL173:
.LBE193:
.LBE197:
	.loc 1 236 13 is_stmt 1
	.loc 1 239 13
	.loc 1 240 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:240:             if (percent != last_percent) {
	.loc 1 240 16 is_stmt 0
	beq	s3,a2,.L138	#, percent, last_percent,
	sd	a7,0(sp)	# tmp326, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:241:                 printf("Progress: %d0%%\n", percent);
	.loc 1 241 17
	call	printf		#
.LVL174:
	ld	a7,0(sp)		# tmp326, %sfp
	li	t5,16711680		# tmp278,
	.loc 1 242 17 is_stmt 1
.L138:
.LVL175:
.LBE199:
	.loc 1 213 42 discriminator 2
	addiw	s7,s7,1	#, x, x
.LVL176:
	.loc 1 213 32 discriminator 1
	addiw	s10,s10,1	#, ivtmp.164, ivtmp.164
.LVL177:
	addw	s2,s8,s2	# ivtmp.166, ivtmp.166, y
.LVL178:
	addiw	s0,s0,10	#, ivtmp.167, ivtmp.167
	bne	s5,s7,.L139	#, width, x,
.LBE186:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:212:     for (uint32_t y = 0; y < height; y++) {
	.loc 1 212 28 is_stmt 0 discriminator 1
	ld	a2,8(sp)		# ivtmp.172, %sfp
	ld	a3,16(sp)		# pixels_done, %sfp
	ld	a5,32(sp)		# tmp220, %sfp
	addiw	a2,a2,1	#, ivtmp.172, ivtmp.172
	mv	s0,s1	# tmp216, tmp216
	mv	s2,a7	# tmp326, tmp326
	addw	a3,s5,a3	# pixels_done, pixels_done, width
	.loc 1 212 39 is_stmt 1 discriminator 2
.LVL179:
	.loc 1 212 28 discriminator 1
	beq	a2,a5,.L147	#, ivtmp.172, tmp220,
.LVL180:
	ld	a5,40(sp)		# tmp214, %sfp
	addw	s1,a5,a2	# ivtmp.172, y, tmp214
.LVL181:
.LBB200:
	.loc 1 213 32 discriminator 1
	j	.L135		#
.LVL182:
.L147:
	ld	s1,136(sp)		#,
	.cfi_restore 9
	ld	s2,128(sp)		#,
	.cfi_restore 18
	ld	s3,120(sp)		#,
	.cfi_restore 19
.LVL183:
	ld	s5,104(sp)		#,
	.cfi_restore 21
.LVL184:
	ld	s6,96(sp)		#,
	.cfi_restore 22
	ld	s7,88(sp)		#,
	.cfi_restore 23
.LVL185:
	ld	s11,56(sp)		#,
	.cfi_restore 27
.LVL186:
.L134:
.LBE200:
.LBE185:
	.loc 1 247 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:248: }
	.loc 1 248 1 is_stmt 0
	ld	s0,144(sp)		#,
	.cfi_restore 8
	ld	ra,152(sp)		#,
	.cfi_restore 1
	ld	s4,112(sp)		#,
	.cfi_restore 20
	ld	s8,80(sp)		#,
	.cfi_restore 24
	ld	s9,72(sp)		#,
	.cfi_restore 25
	ld	s10,64(sp)		#,
	.cfi_restore 26
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247:     printf("Rendering complete!\n");
	.loc 1 247 5
	lui	a0,%hi(.LC33)	# tmp322,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:248: }
	.loc 1 248 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247:     printf("Rendering complete!\n");
	.loc 1 247 5
	addi	a0,a0,%lo(.LC33)	#, tmp322,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:248: }
	.loc 1 248 1
	addi	sp,sp,160	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247:     printf("Rendering complete!\n");
	.loc 1 247 5
	tail	puts		#
.LVL187:
	.cfi_endproc
.LFE15:
	.size	draw_cool_pattern, .-draw_cool_pattern
	.align	1
	.globl	run_bouncing_ball_demo_size
	.type	run_bouncing_ball_demo_size, @function
run_bouncing_ball_demo_size:
.LFB16:
	.loc 1 251 51 is_stmt 1
	.cfi_startproc
.LVL188:
	.loc 1 252 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:251: void run_bouncing_ball_demo_size(int ball_radius) {
	.loc 1 251 51 is_stmt 0
	addi	sp,sp,-64	#,,
	.cfi_def_cfa_offset 64
	sd	s0,48(sp)	#,
	sd	s2,32(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 18, -32
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 32
	lui	s0,%hi(display_width)	# tmp328,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 33
	lui	s2,%hi(display_height)	# tmp329,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 9
	lw	a5,%lo(display_height)(s2)		# display_height, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 9
	lw	a4,%lo(display_width)(s0)		# display_width, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:251: void run_bouncing_ball_demo_size(int ball_radius) {
	.loc 1 251 51
	sd	s3,24(sp)	#,
	sd	s4,16(sp)	#,
	.cfi_offset 19, -40
	.cfi_offset 20, -48
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 9
	sraiw	s3,a4,31	#, tmp203, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 9
	sraiw	s4,a5,31	#, tmp218, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:251: void run_bouncing_ball_demo_size(int ball_radius) {
	.loc 1 251 51
	sd	s1,40(sp)	#,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 9
	srliw	s3,s3,30	# tmp205, tmp203,
	.cfi_offset 9, -24
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:251: void run_bouncing_ball_demo_size(int ball_radius) {
	.loc 1 251 51
	mv	s1,a0	# tmp345, ball_radius
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 9
	srliw	s4,s4,30	# tmp220, tmp218,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:261:     clear_screen(bg_color);
	.loc 1 261 5
	li	a0,-16777216		#,
.LVL189:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 9
	addw	s4,s4,a5	# display_height, tmp222, tmp220
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 9
	addw	s3,s3,a4	# display_width, tmp207, tmp205
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:251: void run_bouncing_ball_demo_size(int ball_radius) {
	.loc 1 251 51
	sd	ra,56(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:261:     clear_screen(bg_color);
	.loc 1 261 5
	call	clear_screen		#
.LVL190:
.LBB201:
.LBB202:
.LBB203:
.LBB204:
.LBB205:
.LBB206:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	lui	a5,%hi(framebuffer)	# tmp225,
	ld	a2,%lo(framebuffer)(a5)		# framebuffer.1_65, framebuffer
.LBE206:
.LBE205:
.LBE204:
.LBE203:
.LBE202:
.LBE201:
.LBB223:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:308:         for (volatile int i = 0; i < 10000; i++);
	.loc 1 308 36 discriminator 1
	li	t3,8192		# tmp346,
.LBE223:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:252:     int ball_x = display_width / 4;
	.loc 1 252 9
	sraiw	s3,s3,2	#, ball_x, tmp207
.LVL191:
	.loc 1 253 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:253:     int ball_y = display_height / 4;
	.loc 1 253 9 is_stmt 0
	sraiw	s4,s4,2	#, ball_y, tmp222
.LVL192:
	.loc 1 254 5 is_stmt 1
	.loc 1 255 5
	.loc 1 257 5
	.loc 1 258 5
	.loc 1 261 5
.LBB224:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:265:         for (int dy = -ball_radius; dy <= ball_radius; dy++) {
	.loc 1 265 18 is_stmt 0
	negw	t4,s1	# tmp227, ball_radius
	addiw	a6,s1,1	#, tmp327, ball_radius
.LBE224:
.LBB225:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:308:         for (volatile int i = 0; i < 10000; i++);
	.loc 1 308 36 discriminator 1
	addi	t3,t3,1807	#, tmp344, tmp346
.LBE225:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:255:     int vy = 1;
	.loc 1 255 9
	li	t1,1		# vy,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:254:     int vx = 2;
	.loc 1 254 9
	li	a7,2		# vx,
.LBB226:
.LBB220:
.LBB218:
.LBB215:
.LBB211:
.LBB207:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	li	a0,-16777216		# tmp338,
.LBE207:
.LBE211:
.LBE215:
.LBE218:
.LBE220:
.LBE226:
.LBB227:
.LBB228:
.LBB229:
.LBB230:
.LBB231:
.LBB232:
	li	a1,-1		# tmp341,
.LVL193:
.L170:
.LBE232:
.LBE231:
.LBE230:
.LBE229:
.LBE228:
.LBE227:
	.loc 1 263 5 is_stmt 1
	.loc 1 265 9
.LBB244:
	.loc 1 265 14
	.loc 1 265 40 discriminator 1
	bgt	t4,s1,.L154	#, tmp227, ball_radius,
	subw	a3,s4,s1	# ivtmp.204, ball_y, ball_radius
	addw	t0,s4,a6	# tmp327, tmp237, ball_y
	addw	t5,s3,a6	# tmp327, tmp335, ball_x
.LVL194:
.L153:
.LBB221:
	.loc 1 266 13
	.loc 1 267 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:267:             if (y < 0 || y >= display_height) continue;
	.loc 1 267 16 is_stmt 0
	blt	a3,zero,.L155	#, ivtmp.204,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:267:             if (y < 0 || y >= display_height) continue;
	.loc 1 267 23 discriminator 2
	lw	a5,%lo(display_height)(s2)		# display_height, display_height
	bgt	a5,a3,.L179	#, display_height, ivtmp.204,
.L155:
.LBE221:
	.loc 1 265 58 is_stmt 1 discriminator 2
.LVL195:
	.loc 1 265 40 discriminator 1
	addiw	a3,a3,1	#, ivtmp.204, ivtmp.204
.LVL196:
	bne	a3,t0,.L153	#, ivtmp.204, tmp237,
.LVL197:
.L154:
.LBE244:
	.loc 1 276 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:276:         ball_x += vx;
	.loc 1 276 16 is_stmt 0
	addw	s3,s3,a7	# vx, ball_x, ball_x
.LVL198:
	.loc 1 277 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:277:         ball_y += vy;
	.loc 1 277 16 is_stmt 0
	addw	s4,s4,t1	# vy, ball_y, ball_y
.LVL199:
	.loc 1 280 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:280:         if (ball_x - ball_radius < 0) {
	.loc 1 280 12 is_stmt 0
	blt	s3,s1,.L180	#, ball_x, ball_radius,
	.loc 1 283 16 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:283:         } else if (ball_x + ball_radius >= display_width) {
	.loc 1 283 41 is_stmt 0
	lw	a5,%lo(display_width)(s0)		# display_width.41_7, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:283:         } else if (ball_x + ball_radius >= display_width) {
	.loc 1 283 27
	addw	a4,s1,s3	# ball_x, tmp262, ball_radius
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:283:         } else if (ball_x + ball_radius >= display_width) {
	.loc 1 283 19
	blt	a4,a5,.L158	#, tmp262, display_width.41_7,
	.loc 1 284 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:284:             ball_x = display_width - 1 - ball_radius;
	.loc 1 284 36 is_stmt 0
	addiw	a5,a5,-1	#, tmp265, display_width.41_7
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:284:             ball_x = display_width - 1 - ball_radius;
	.loc 1 284 20
	subw	s3,a5,s1	# ball_x, tmp265, ball_radius
.LVL200:
	.loc 1 285 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:285:             vx = -vx;
	.loc 1 285 16 is_stmt 0
	negw	a7,a7	# vx, vx
.LVL201:
.L158:
	.loc 1 288 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:288:         if (ball_y - ball_radius < 0) {
	.loc 1 288 12 is_stmt 0
	blt	s4,s1,.L181	#, ball_y, ball_radius,
.L159:
	.loc 1 291 16 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:291:         } else if (ball_y + ball_radius >= display_height) {
	.loc 1 291 41 is_stmt 0
	lw	a5,%lo(display_height)(s2)		# display_height.43_11, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:291:         } else if (ball_y + ball_radius >= display_height) {
	.loc 1 291 27
	addw	a4,s1,s4	# ball_y, tmp274, ball_radius
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:291:         } else if (ball_y + ball_radius >= display_height) {
	.loc 1 291 19
	blt	a4,a5,.L160	#, tmp274, display_height.43_11,
	.loc 1 292 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:292:             ball_y = display_height - 1 - ball_radius;
	.loc 1 292 37 is_stmt 0
	addiw	a5,a5,-1	#, tmp277, display_height.43_11
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:292:             ball_y = display_height - 1 - ball_radius;
	.loc 1 292 20
	subw	s4,a5,s1	# ball_y, tmp277, ball_radius
.LVL202:
	.loc 1 293 13 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:293:             vy = -vy;
	.loc 1 293 16 is_stmt 0
	negw	t1,t1	# vy, vy
.LVL203:
.L160:
	.loc 1 297 9 is_stmt 1
.LBB245:
	.loc 1 297 14
	.loc 1 297 40 discriminator 1
	bgt	t4,s1,.L166	#, tmp227, ball_radius,
	subw	a3,s4,s1	# ivtmp.194, ball_y, ball_radius
	addw	t0,s4,a6	# tmp327, tmp294, ball_y
	addw	t5,s3,a6	# tmp327, tmp331, ball_x
.LVL204:
.L165:
.LBB242:
	.loc 1 298 13
	.loc 1 299 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:299:             if (y < 0 || y >= display_height) continue;
	.loc 1 299 16 is_stmt 0
	blt	a3,zero,.L167	#, ivtmp.194,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:299:             if (y < 0 || y >= display_height) continue;
	.loc 1 299 23 discriminator 2
	lw	a5,%lo(display_height)(s2)		# display_height, display_height
	bgt	a5,a3,.L182	#, display_height, ivtmp.194,
.L167:
.LBE242:
	.loc 1 297 58 is_stmt 1 discriminator 2
.LVL205:
	.loc 1 297 40 discriminator 1
	addiw	a3,a3,1	#, ivtmp.194, ivtmp.194
.LVL206:
	bne	a3,t0,.L165	#, ivtmp.194, tmp294,
.LVL207:
.L166:
.LBE245:
	.loc 1 308 9
.LBB246:
	.loc 1 308 14
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:308:         for (volatile int i = 0; i < 10000; i++);
	.loc 1 308 27 is_stmt 0
	sw	zero,12(sp)	#, i
	.loc 1 308 36 is_stmt 1 discriminator 1
	lw	a5,12(sp)		# i, i
	bgt	a5,t3,.L170	#, i, tmp344,
.L162:
	.loc 1 308 46 discriminator 3
	lw	a5,12(sp)		# i, i
	addiw	a5,a5,1	#, tmp319, i
	sw	a5,12(sp)	# tmp319, i
	.loc 1 308 36 discriminator 1
	lw	a5,12(sp)		# i, i
	ble	a5,t3,.L162	#, i, tmp344,
	j	.L170		#
.LVL208:
.L179:
	subw	a4,s3,s1	# ivtmp.199, ball_x, ball_radius
.L157:
.LVL209:
.LBE246:
.LBB247:
.LBB222:
.LBB219:
.LBB216:
	.loc 1 269 17
	.loc 1 270 17
	.loc 1 271 17
.LBB212:
.LBB208:
	.loc 1 19 5
.LBE208:
.LBE212:
.LBE216:
	.loc 1 268 62 discriminator 2
	.loc 1 268 44 discriminator 1
.LBB217:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:270:                 if (x < 0 || x >= display_width) continue;
	.loc 1 270 20 is_stmt 0
	blt	a4,zero,.L156	#, ivtmp.199,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:270:                 if (x < 0 || x >= display_width) continue;
	.loc 1 270 32 discriminator 2
	lw	a5,%lo(display_width)(s0)		# display_width.40_4, display_width
.LVL210:
.LBB213:
.LBB209:
	.loc 1 20 5 is_stmt 1
.LBE209:
.LBE213:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:270:                 if (x < 0 || x >= display_width) continue;
	.loc 1 270 27 is_stmt 0 discriminator 2
	ble	a5,a4,.L156	#, display_width.40_4, ivtmp.199,
.LBB214:
.LBB210:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	mulw	a5,a5,a3	# tmp250, display_width.40_4, ivtmp.204
.LVL211:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27
	addw	a5,a5,a4	# ivtmp.199, tmp252, tmp250
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	t6,a5,32	#, tmp347, tmp252
	srli	a5,t6,30	#, _71, tmp347
	add	a5,a2,a5	# _71, _72, framebuffer.1_65
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a0,0(a5)	# tmp338, *_72
.LVL212:
.L156:
.LBE210:
.LBE214:
.LBE217:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:268:             for (int dx = -ball_radius; dx <= ball_radius; dx++) {
	.loc 1 268 44 discriminator 1
	addiw	a4,a4,1	#, ivtmp.199, ivtmp.199
.LVL213:
	bne	a4,t5,.L157	#, ivtmp.199, tmp335,
	j	.L155		#
.LVL214:
.L182:
	subw	a4,s3,s1	# ivtmp.189, ball_x, ball_radius
.L169:
.LVL215:
.LBE219:
.LBE222:
.LBE247:
.LBB248:
.LBB243:
.LBB241:
.LBB239:
	.loc 1 301 17 is_stmt 1
	.loc 1 302 17
	.loc 1 303 17
.LBB236:
.LBB233:
	.loc 1 19 5
.LBE233:
.LBE236:
.LBE239:
	.loc 1 300 62 discriminator 2
	.loc 1 300 44 discriminator 1
.LBB240:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:302:                 if (x < 0 || x >= display_width) continue;
	.loc 1 302 20 is_stmt 0
	blt	a4,zero,.L168	#, ivtmp.189,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:302:                 if (x < 0 || x >= display_width) continue;
	.loc 1 302 32 discriminator 2
	lw	a5,%lo(display_width)(s0)		# display_width.46_14, display_width
.LVL216:
.LBB237:
.LBB234:
	.loc 1 20 5 is_stmt 1
.LBE234:
.LBE237:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:302:                 if (x < 0 || x >= display_width) continue;
	.loc 1 302 27 is_stmt 0 discriminator 2
	ble	a5,a4,.L168	#, display_width.46_14, ivtmp.189,
.LBB238:
.LBB235:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 19
	mulw	a5,a5,a3	# tmp307, display_width.46_14, ivtmp.194
.LVL217:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 27
	addw	a5,a5,a4	# ivtmp.189, tmp309, tmp307
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 16
	slli	t6,a5,32	#, tmp348, tmp309
	srli	a5,t6,30	#, _80, tmp348
	add	a5,a2,a5	# _80, _81, framebuffer.1_65
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20:     framebuffer[y * width + x] = color;
	.loc 1 20 32
	sw	a1,0(a5)	# tmp341, *_81
.LVL218:
.L168:
.LBE235:
.LBE238:
.LBE240:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:300:             for (int dx = -ball_radius; dx <= ball_radius; dx++) {
	.loc 1 300 44 discriminator 1
	addiw	a4,a4,1	#, ivtmp.189, ivtmp.189
.LVL219:
	bne	a4,t5,.L169	#, ivtmp.189, tmp331,
	j	.L167		#
.LVL220:
.L180:
.LBE241:
.LBE243:
.LBE248:
	.loc 1 281 13 is_stmt 1
	.loc 1 282 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:282:             vx = -vx;
	.loc 1 282 16 is_stmt 0
	negw	a7,a7	# vx, vx
.LVL221:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:281:             ball_x = ball_radius;
	.loc 1 281 20
	mv	s3,s1	# ball_x, ball_radius
.LVL222:
	.loc 1 288 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:288:         if (ball_y - ball_radius < 0) {
	.loc 1 288 12 is_stmt 0
	bge	s4,s1,.L159	#, ball_y, ball_radius,
.L181:
	.loc 1 289 13 is_stmt 1
.LVL223:
	.loc 1 290 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:290:             vy = -vy;
	.loc 1 290 16 is_stmt 0
	negw	t1,t1	# vy, vy
.LVL224:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:289:             ball_y = ball_radius;
	.loc 1 289 20
	mv	s4,s1	# ball_y, ball_radius
	j	.L160		#
	.cfi_endproc
.LFE16:
	.size	run_bouncing_ball_demo_size, .-run_bouncing_ball_demo_size
	.globl	display_height
	.globl	display_width
	.globl	framebuffer
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1078530000
	.align	2
.LC1:
	.word	1086918608
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
	.section	.sbss,"aw",@nobits
	.align	2
	.type	display_height, @object
	.size	display_height, 4
display_height:
	.zero	4
	.type	display_width, @object
	.size	display_width, 4
display_width:
	.zero	4
	.section	.sdata,"aw"
	.align	3
	.type	framebuffer, @object
	.size	framebuffer, 8
framebuffer:
	.dword	268435456
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 3 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 4 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.h"
	.file 5 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdio.h"
	.file 6 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xfa3
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x29
	.4byte	.LASF67
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x7
	.byte	0x4
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x11
	.4byte	.LASF7
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x35
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1f
	.4byte	0x5d
	.uleb128 0x19
	.4byte	0x5d
	.uleb128 0x11
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x7a
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x11
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x43
	.uleb128 0x11
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x6e
	.uleb128 0x1f
	.4byte	0x9b
	.uleb128 0x19
	.4byte	0x9b
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x7
	.byte	0x10
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x19
	.4byte	0xbf
	.uleb128 0x20
	.4byte	0xc6
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x1a
	.4byte	.LASF18
	.byte	0xd
	.byte	0x14
	.4byte	0xec
	.uleb128 0x9
	.byte	0x3
	.8byte	framebuffer
	.uleb128 0x20
	.4byte	0xa7
	.uleb128 0x1a
	.4byte	.LASF19
	.byte	0xf
	.byte	0x5
	.4byte	0x5d
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.uleb128 0x1a
	.4byte	.LASF20
	.byte	0x10
	.byte	0x5
	.4byte	0x5d
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.uleb128 0x2b
	.4byte	.LASF21
	.byte	0x4
	.byte	0xc
	.byte	0x6
	.4byte	0x12d
	.uleb128 0x21
	.4byte	0x5d
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF55
	.byte	0x5
	.byte	0xce
	.byte	0x5
	.4byte	0x5d
	.4byte	0x144
	.uleb128 0x21
	.4byte	0xcb
	.uleb128 0x1b
	.byte	0
	.uleb128 0x22
	.4byte	.LASF22
	.byte	0xb
	.4byte	0x7a
	.4byte	0x154
	.uleb128 0x1b
	.byte	0
	.uleb128 0x22
	.4byte	.LASF23
	.byte	0xa
	.4byte	0x7a
	.4byte	0x164
	.uleb128 0x1b
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF68
	.byte	0x4
	.byte	0xd
	.byte	0xe
	.4byte	0x7a
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0xfb
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x348
	.uleb128 0x2e
	.4byte	.LASF49
	.byte	0x1
	.byte	0xfb
	.byte	0x26
	.4byte	0x5d
	.4byte	.LLST134
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0xfc
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST135
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0xfd
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST136
	.uleb128 0x3
	.string	"vx"
	.byte	0xfe
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST137
	.uleb128 0x3
	.string	"vy"
	.byte	0xff
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST138
	.uleb128 0x23
	.4byte	.LASF26
	.2byte	0x101
	.4byte	0xac
	.sleb128 -1
	.uleb128 0x23
	.4byte	.LASF27
	.2byte	0x102
	.4byte	0xac
	.sleb128 -16777216
	.uleb128 0xc
	.4byte	.LLRL139
	.4byte	0x285
	.uleb128 0x9
	.string	"dy"
	.2byte	0x109
	.byte	0x12
	.4byte	0x5d
	.4byte	.LLST140
	.uleb128 0x5
	.4byte	.LLRL141
	.uleb128 0x9
	.string	"y"
	.2byte	0x10a
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST142
	.uleb128 0x5
	.4byte	.LLRL143
	.uleb128 0x9
	.string	"dx"
	.2byte	0x10c
	.byte	0x16
	.4byte	0x5d
	.4byte	.LLST144
	.uleb128 0x5
	.4byte	.LLRL145
	.uleb128 0x9
	.string	"x"
	.2byte	0x10d
	.byte	0x15
	.4byte	0x5d
	.4byte	.LLST146
	.uleb128 0x24
	.4byte	0xe1a
	.8byte	.LBB205
	.4byte	.LLRL147
	.2byte	0x10f
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST148
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST149
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST150
	.uleb128 0x5
	.4byte	.LLRL147
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST151
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LLRL153
	.4byte	0x319
	.uleb128 0x9
	.string	"dy"
	.2byte	0x129
	.byte	0x12
	.4byte	0x5d
	.4byte	.LLST154
	.uleb128 0x5
	.4byte	.LLRL155
	.uleb128 0x9
	.string	"y"
	.2byte	0x12a
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST156
	.uleb128 0x5
	.4byte	.LLRL157
	.uleb128 0x9
	.string	"dx"
	.2byte	0x12c
	.byte	0x16
	.4byte	0x5d
	.4byte	.LLST158
	.uleb128 0x5
	.4byte	.LLRL159
	.uleb128 0x9
	.string	"x"
	.2byte	0x12d
	.byte	0x15
	.4byte	0x5d
	.4byte	.LLST160
	.uleb128 0x24
	.4byte	0xe1a
	.8byte	.LBB231
	.4byte	.LLRL161
	.2byte	0x12f
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST162
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST163
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST164
	.uleb128 0x5
	.4byte	.LLRL161
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST165
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LLRL152
	.4byte	0x331
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.2byte	0x134
	.byte	0x1b
	.4byte	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x1c
	.8byte	.LVL190
	.4byte	0xdd8
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x4
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0x1f
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0xc5
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a6
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0xca
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST99
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0xcb
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST100
	.uleb128 0x3
	.string	"cx"
	.byte	0xcd
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST101
	.uleb128 0x3
	.string	"cy"
	.byte	0xce
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST102
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0xd0
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST103
	.uleb128 0x2
	.4byte	.LASF33
	.byte	0xd1
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST104
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0xd2
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST105
	.uleb128 0x13
	.8byte	.LBB185
	.8byte	.LBE185-.LBB185
	.4byte	0x516
	.uleb128 0x3
	.string	"y"
	.byte	0xd4
	.byte	0x13
	.4byte	0x9b
	.4byte	.LLST113
	.uleb128 0x5
	.4byte	.LLRL114
	.uleb128 0x3
	.string	"x"
	.byte	0xd5
	.byte	0x17
	.4byte	0x9b
	.4byte	.LLST115
	.uleb128 0x5
	.4byte	.LLRL116
	.uleb128 0x3
	.string	"dx"
	.byte	0xd6
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST117
	.uleb128 0x3
	.string	"dy"
	.byte	0xd7
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST118
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0xda
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST119
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0xdd
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST120
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0xde
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST121
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0xdf
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST122
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0xe2
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST123
	.uleb128 0x3
	.string	"r"
	.byte	0xe5
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST124
	.uleb128 0x3
	.string	"g"
	.byte	0xe6
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST125
	.uleb128 0x3
	.string	"b"
	.byte	0xe7
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST126
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0xe9
	.byte	0x16
	.4byte	0x9b
	.4byte	.LLST127
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0xef
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST128
	.uleb128 0x14
	.4byte	0xe1a
	.8byte	.LBB188
	.4byte	.LLRL129
	.byte	0xea
	.byte	0xd
	.4byte	0x4f2
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST130
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST131
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST132
	.uleb128 0x5
	.4byte	.LLRL129
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST133
	.byte	0
	.byte	0
	.uleb128 0x1c
	.8byte	.LVL174
	.4byte	0x12d
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC32
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xdd8
	.8byte	.LBB175
	.4byte	.LLRL106
	.byte	0xc6
	.byte	0x5
	.4byte	0x56b
	.uleb128 0x1
	.4byte	0xde2
	.4byte	.LLST107
	.uleb128 0x5
	.4byte	.LLRL106
	.uleb128 0x4
	.4byte	0xded
	.4byte	.LLST108
	.uleb128 0x4
	.4byte	0xdf8
	.4byte	.LLST109
	.uleb128 0x4
	.4byte	0xe03
	.4byte	.LLST110
	.uleb128 0x25
	.4byte	0xe0e
	.4byte	.LLRL111
	.uleb128 0x4
	.4byte	0xe0f
	.4byte	.LLST112
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.8byte	.LVL159
	.4byte	0xf9b
	.4byte	0x58a
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC30
	.byte	0
	.uleb128 0x26
	.8byte	.LVL187
	.4byte	0xf9b
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC33
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF42
	.byte	0x91
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x993
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x96
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST49
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x97
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST50
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x99
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST51
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0xb8
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST52
	.uleb128 0x13
	.8byte	.LBB126
	.8byte	.LBE126-.LBB126
	.4byte	0x693
	.uleb128 0x3
	.string	"y"
	.byte	0x9d
	.byte	0x13
	.4byte	0x9b
	.4byte	.LLST70
	.uleb128 0x15
	.8byte	.LBB127
	.8byte	.LBE127-.LBB127
	.uleb128 0x3
	.string	"x"
	.byte	0x9e
	.byte	0x17
	.4byte	0x9b
	.4byte	.LLST71
	.uleb128 0x5
	.4byte	.LLRL72
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x9f
	.byte	0x15
	.4byte	0x8f
	.4byte	.LLST73
	.uleb128 0xa
	.4byte	0xe1a
	.8byte	.LBB129
	.4byte	.LLRL74
	.byte	0xa0
	.byte	0xd
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST75
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST76
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST77
	.uleb128 0x5
	.4byte	.LLRL74
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LLRL79
	.4byte	0x71c
	.uleb128 0x3
	.string	"y"
	.byte	0xa6
	.byte	0x13
	.4byte	0x9b
	.4byte	.LLST80
	.uleb128 0x15
	.8byte	.LBB143
	.8byte	.LBE143-.LBB143
	.uleb128 0x3
	.string	"x"
	.byte	0xa7
	.byte	0x17
	.4byte	0x9b
	.4byte	.LLST81
	.uleb128 0x5
	.4byte	.LLRL82
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0xa8
	.byte	0x15
	.4byte	0x8f
	.4byte	.LLST83
	.uleb128 0xa
	.4byte	0xe1a
	.8byte	.LBB145
	.4byte	.LLRL84
	.byte	0xa9
	.byte	0xd
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST85
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST86
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST87
	.uleb128 0x5
	.4byte	.LLRL84
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST88
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LLRL60
	.4byte	0x7a5
	.uleb128 0x3
	.string	"y"
	.byte	0xaf
	.byte	0x13
	.4byte	0x9b
	.4byte	.LLST61
	.uleb128 0x15
	.8byte	.LBB115
	.8byte	.LBE115-.LBB115
	.uleb128 0x3
	.string	"x"
	.byte	0xb0
	.byte	0x17
	.4byte	0x9b
	.4byte	.LLST62
	.uleb128 0x5
	.4byte	.LLRL63
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0xb1
	.byte	0x15
	.4byte	0x8f
	.4byte	.LLST64
	.uleb128 0xa
	.4byte	0xe1a
	.8byte	.LBB117
	.4byte	.LLRL65
	.byte	0xb2
	.byte	0xd
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST66
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST67
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST68
	.uleb128 0x5
	.4byte	.LLRL65
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST69
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.8byte	.LBB152
	.8byte	.LBE152-.LBB152
	.4byte	0x849
	.uleb128 0x3
	.string	"y"
	.byte	0xb9
	.byte	0x13
	.4byte	0x9b
	.4byte	.LLST89
	.uleb128 0x15
	.8byte	.LBB153
	.8byte	.LBE153-.LBB153
	.uleb128 0x3
	.string	"x"
	.byte	0xba
	.byte	0x17
	.4byte	0x9b
	.4byte	.LLST90
	.uleb128 0x5
	.4byte	.LLRL91
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0xbb
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST92
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0xbc
	.byte	0x16
	.4byte	0x9b
	.4byte	.LLST93
	.uleb128 0xa
	.4byte	0xe1a
	.8byte	.LBB155
	.4byte	.LLRL94
	.byte	0xbd
	.byte	0xd
	.uleb128 0x1
	.4byte	0xe24
	.4byte	.LLST95
	.uleb128 0x1
	.4byte	0xe2d
	.4byte	.LLST96
	.uleb128 0x1
	.4byte	0xe36
	.4byte	.LLST97
	.uleb128 0x5
	.4byte	.LLRL94
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST98
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0xdd8
	.8byte	.LBB104
	.4byte	.LLRL53
	.byte	0x92
	.byte	0x5
	.4byte	0x89e
	.uleb128 0x1
	.4byte	0xde2
	.4byte	.LLST54
	.uleb128 0x5
	.4byte	.LLRL53
	.uleb128 0x4
	.4byte	0xded
	.4byte	.LLST55
	.uleb128 0x4
	.4byte	0xdf8
	.4byte	.LLST56
	.uleb128 0x4
	.4byte	0xe03
	.4byte	.LLST57
	.uleb128 0x25
	.4byte	0xe0e
	.4byte	.LLRL58
	.uleb128 0x4
	.4byte	0xe0f
	.4byte	.LLST59
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.8byte	.LVL104
	.4byte	0xf9b
	.4byte	0x8bd
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC24
	.byte	0
	.uleb128 0x8
	.8byte	.LVL106
	.4byte	0xf9b
	.4byte	0x8dc
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC25
	.byte	0
	.uleb128 0x8
	.8byte	.LVL116
	.4byte	0xf9b
	.4byte	0x8fb
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.uleb128 0x8
	.8byte	.LVL125
	.4byte	0xf9b
	.4byte	0x91a
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC27
	.byte	0
	.uleb128 0x8
	.8byte	.LVL135
	.4byte	0xf9b
	.4byte	0x939
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC28
	.byte	0
	.uleb128 0x1d
	.8byte	.LVL149
	.4byte	0xf9b
	.4byte	0x958
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC29
	.byte	0
	.uleb128 0x8
	.8byte	.LVL150
	.4byte	0xf9b
	.4byte	0x977
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.uleb128 0x1c
	.8byte	.LVL151
	.4byte	0xf9b
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC27
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x74
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xabf
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x77
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST46
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x81
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST47
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x82
	.byte	0xe
	.4byte	0x9b
	.4byte	.LLST48
	.uleb128 0x8
	.8byte	.LVL84
	.4byte	0xf9b
	.4byte	0x9fb
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC19
	.byte	0
	.uleb128 0x16
	.8byte	.LVL85
	.4byte	0x164
	.uleb128 0x16
	.8byte	.LVL87
	.4byte	0x154
	.uleb128 0x16
	.8byte	.LVL88
	.4byte	0x144
	.uleb128 0x8
	.8byte	.LVL90
	.4byte	0x12d
	.4byte	0xa41
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC21
	.byte	0
	.uleb128 0x8
	.8byte	.LVL91
	.4byte	0x11b
	.4byte	0xa58
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x16
	.8byte	.LVL92
	.4byte	0x164
	.uleb128 0x1d
	.8byte	.LVL94
	.4byte	0xf9b
	.4byte	0xa84
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC23
	.byte	0
	.uleb128 0x1d
	.8byte	.LVL95
	.4byte	0xf9b
	.4byte	0xaa3
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC22
	.byte	0
	.uleb128 0x26
	.8byte	.LVL96
	.4byte	0xf9b
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC20
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x5c
	.byte	0xa
	.4byte	0x9b
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbe1
	.uleb128 0x30
	.string	"h"
	.byte	0x1
	.byte	0x5c
	.byte	0x1b
	.4byte	0x2e
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.uleb128 0xd
	.string	"s"
	.byte	0x5c
	.byte	0x24
	.4byte	0x2e
	.4byte	.LLST30
	.uleb128 0xd
	.string	"v"
	.byte	0x5c
	.byte	0x2d
	.4byte	0x2e
	.4byte	.LLST31
	.uleb128 0x3
	.string	"c"
	.byte	0x5d
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST32
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x5e
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST33
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x5f
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x3
	.string	"x"
	.byte	0x60
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST34
	.uleb128 0x31
	.string	"m"
	.byte	0x1
	.byte	0x61
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2c
	.uleb128 0x3
	.string	"r"
	.byte	0x63
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST35
	.uleb128 0x3
	.string	"g"
	.byte	0x63
	.byte	0xe
	.4byte	0x2e
	.4byte	.LLST36
	.uleb128 0x3
	.string	"b"
	.byte	0x63
	.byte	0x11
	.4byte	0x2e
	.4byte	.LLST37
	.uleb128 0x3
	.string	"ri"
	.byte	0x6c
	.byte	0xd
	.4byte	0x8f
	.4byte	.LLST38
	.uleb128 0x3
	.string	"gi"
	.byte	0x6d
	.byte	0xd
	.4byte	0x8f
	.4byte	.LLST39
	.uleb128 0x3
	.string	"bi"
	.byte	0x6e
	.byte	0xd
	.4byte	0x8f
	.4byte	.LLST40
	.uleb128 0x14
	.4byte	0xc92
	.8byte	.LBB71
	.4byte	.LLRL41
	.byte	0x5f
	.byte	0x13
	.4byte	0xbc3
	.uleb128 0x1
	.4byte	0xca0
	.4byte	.LLST42
	.uleb128 0x1
	.4byte	0xca9
	.4byte	.LLST43
	.byte	0
	.uleb128 0xa
	.4byte	0xd43
	.8byte	.LBB76
	.4byte	.LLRL44
	.byte	0x60
	.byte	0x1b
	.uleb128 0x1
	.4byte	0xd51
	.4byte	.LLST45
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF52
	.byte	0x4c
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc92
	.uleb128 0xd
	.string	"y"
	.byte	0x4c
	.byte	0x1a
	.4byte	0x2e
	.4byte	.LLST21
	.uleb128 0xd
	.string	"x"
	.byte	0x4c
	.byte	0x23
	.4byte	0x2e
	.4byte	.LLST22
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x4d
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST23
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x4e
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST24
	.uleb128 0xc
	.4byte	.LLRL27
	.4byte	0xc51
	.uleb128 0x3
	.string	"r"
	.byte	0x51
	.byte	0xf
	.4byte	0x2e
	.4byte	.LLST28
	.byte	0
	.uleb128 0x13
	.8byte	.LBB70
	.8byte	.LBE70-.LBB70
	.4byte	0xc74
	.uleb128 0x3
	.string	"r"
	.byte	0x54
	.byte	0xf
	.4byte	0x2e
	.4byte	.LLST29
	.byte	0
	.uleb128 0xa
	.4byte	0xd43
	.8byte	.LBB64
	.4byte	.LLRL25
	.byte	0x4d
	.byte	0x13
	.uleb128 0x1
	.4byte	0xd51
	.4byte	.LLST26
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF56
	.byte	0x47
	.4byte	0x2e
	.4byte	0xcb3
	.uleb128 0xb
	.string	"x"
	.byte	0x47
	.byte	0x19
	.4byte	0x2e
	.uleb128 0xb
	.string	"y"
	.byte	0x47
	.byte	0x22
	.4byte	0x2e
	.byte	0
	.uleb128 0x17
	.4byte	.LASF57
	.byte	0x40
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd17
	.uleb128 0xd
	.string	"x"
	.byte	0x40
	.byte	0x19
	.4byte	0x2e
	.4byte	.LLST15
	.uleb128 0xa
	.4byte	0xd17
	.8byte	.LBB60
	.4byte	.LLRL16
	.byte	0x42
	.byte	0x10
	.uleb128 0x1
	.4byte	0xd25
	.4byte	.LLST17
	.uleb128 0x5
	.4byte	.LLRL16
	.uleb128 0x4
	.4byte	0xd2e
	.4byte	.LLST18
	.uleb128 0x4
	.4byte	0xd39
	.4byte	.LLST19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF58
	.byte	0x36
	.4byte	0x2e
	.4byte	0xd43
	.uleb128 0xb
	.string	"x"
	.byte	0x36
	.byte	0x16
	.4byte	0x2e
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x37
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x1e
	.string	"i"
	.byte	0x38
	.byte	0x9
	.4byte	0x5d
	.byte	0
	.uleb128 0x18
	.4byte	.LASF61
	.byte	0x31
	.4byte	0x2e
	.4byte	0xd5b
	.uleb128 0xb
	.string	"x"
	.byte	0x31
	.byte	0x12
	.4byte	0x2e
	.byte	0
	.uleb128 0x17
	.4byte	.LASF62
	.byte	0x2c
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdb6
	.uleb128 0xd
	.string	"x"
	.byte	0x2c
	.byte	0x16
	.4byte	0x2e
	.4byte	.LLST7
	.uleb128 0xa
	.4byte	0xdb6
	.8byte	.LBB54
	.4byte	.LLRL8
	.byte	0x2d
	.byte	0xc
	.uleb128 0x1
	.4byte	0xdc4
	.4byte	.LLST9
	.uleb128 0x5
	.4byte	.LLRL8
	.uleb128 0x4
	.4byte	0xdcd
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF63
	.byte	0x22
	.4byte	0x2e
	.4byte	0xdd8
	.uleb128 0xb
	.string	"x"
	.byte	0x22
	.byte	0x16
	.4byte	0x2e
	.uleb128 0x1e
	.string	"x2"
	.byte	0x28
	.byte	0xb
	.4byte	0x2e
	.byte	0
	.uleb128 0x27
	.4byte	.LASF64
	.byte	0x17
	.4byte	0xe1a
	.uleb128 0x28
	.4byte	.LASF40
	.byte	0x17
	.byte	0x22
	.4byte	0xac
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x18
	.byte	0xe
	.4byte	0x9b
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x19
	.byte	0xe
	.4byte	0x9b
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x1a
	.byte	0xe
	.4byte	0x9b
	.uleb128 0x32
	.uleb128 0x1e
	.string	"i"
	.byte	0x1c
	.byte	0x13
	.4byte	0x9b
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	.LASF66
	.byte	0x12
	.4byte	0xe4d
	.uleb128 0xb
	.string	"x"
	.byte	0x12
	.byte	0x1a
	.4byte	0x69
	.uleb128 0xb
	.string	"y"
	.byte	0x12
	.byte	0x27
	.4byte	0x69
	.uleb128 0x28
	.4byte	.LASF40
	.byte	0x12
	.byte	0x39
	.4byte	0xac
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x13
	.byte	0xe
	.4byte	0x9b
	.byte	0
	.uleb128 0xf
	.4byte	0xe1a
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe87
	.uleb128 0x10
	.4byte	0xe24
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x10
	.4byte	0xe2d
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x10
	.4byte	0xe36
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x4
	.4byte	0xe41
	.4byte	.LLST0
	.byte	0
	.uleb128 0xf
	.4byte	0xdd8
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xee4
	.uleb128 0x10
	.4byte	0xde2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x4
	.4byte	0xded
	.4byte	.LLST1
	.uleb128 0x4
	.4byte	0xdf8
	.4byte	.LLST2
	.uleb128 0x4
	.4byte	0xe03
	.4byte	.LLST3
	.uleb128 0x33
	.4byte	0xe0e
	.8byte	.LBB51
	.8byte	.LBE51-.LBB51
	.uleb128 0x4
	.4byte	0xe0f
	.4byte	.LLST4
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0xdb6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf12
	.uleb128 0x1
	.4byte	0xdc4
	.4byte	.LLST5
	.uleb128 0x4
	.4byte	0xdcd
	.4byte	.LLST6
	.byte	0
	.uleb128 0xf
	.4byte	0xd43
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf37
	.uleb128 0x1
	.4byte	0xd51
	.4byte	.LLST11
	.byte	0
	.uleb128 0xf
	.4byte	0xd17
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf6e
	.uleb128 0x1
	.4byte	0xd25
	.4byte	.LLST12
	.uleb128 0x4
	.4byte	0xd2e
	.4byte	.LLST13
	.uleb128 0x4
	.4byte	0xd39
	.4byte	.LLST14
	.byte	0
	.uleb128 0xf
	.4byte	0xc92
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf9b
	.uleb128 0x1
	.4byte	0xca0
	.4byte	.LLST20
	.uleb128 0x10
	.4byte	0xca9
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
	.uleb128 0x34
	.4byte	.LASF69
	.4byte	.LASF70
	.byte	0x6
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
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
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.sleb128 7
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 20
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x21
	.sleb128 17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
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
.LLST134:
	.byte	0x4
	.uleb128 .LVL188-.Ltext0
	.uleb128 .LVL189-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL189-.Ltext0
	.uleb128 .LFE16-.Ltext0
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST135:
	.byte	0x4
	.uleb128 .LVL191-.Ltext0
	.uleb128 .LVL220-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL220-.Ltext0
	.uleb128 .LVL222-.Ltext0
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL222-.Ltext0
	.uleb128 .LFE16-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST136:
	.byte	0x4
	.uleb128 .LVL192-.Ltext0
	.uleb128 .LVL223-.Ltext0
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL223-.Ltext0
	.uleb128 .LFE16-.Ltext0
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST137:
	.byte	0x4
	.uleb128 .LVL192-.Ltext0
	.uleb128 .LVL193-.Ltext0
	.uleb128 0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.Ltext0
	.uleb128 .LFE16-.Ltext0
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LLST138:
	.byte	0x4
	.uleb128 .LVL192-.Ltext0
	.uleb128 .LVL193-.Ltext0
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL193-.Ltext0
	.uleb128 .LFE16-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST140:
	.byte	0x4
	.uleb128 .LVL193-.Ltext0
	.uleb128 .LVL194-.Ltext0
	.uleb128 0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL194-.Ltext0
	.uleb128 .LVL195-.Ltext0
	.uleb128 0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL195-.Ltext0
	.uleb128 .LVL196-.Ltext0
	.uleb128 0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL208-.Ltext0
	.uleb128 .LVL214-.Ltext0
	.uleb128 0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST142:
	.byte	0x4
	.uleb128 .LVL194-.Ltext0
	.uleb128 .LVL196-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL208-.Ltext0
	.uleb128 .LVL214-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST144:
	.byte	0x4
	.uleb128 .LVL209-.Ltext0
	.uleb128 .LVL213-.Ltext0
	.uleb128 0x8
	.byte	0x7e
	.sleb128 0
	.byte	0x83
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LLST146:
	.byte	0x4
	.uleb128 .LVL209-.Ltext0
	.uleb128 .LVL213-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST148:
	.byte	0x4
	.uleb128 .LVL209-.Ltext0
	.uleb128 .LVL212-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST149:
	.byte	0x4
	.uleb128 .LVL209-.Ltext0
	.uleb128 .LVL212-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST150:
	.byte	0x4
	.uleb128 .LVL209-.Ltext0
	.uleb128 .LVL212-.Ltext0
	.uleb128 0x5
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0x1f
	.byte	0x9f
	.byte	0
.LLST151:
	.byte	0x4
	.uleb128 .LVL210-.Ltext0
	.uleb128 .LVL211-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL211-.Ltext0
	.uleb128 .LVL212-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST154:
	.byte	0x4
	.uleb128 .LVL203-.Ltext0
	.uleb128 .LVL204-.Ltext0
	.uleb128 0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1f
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL204-.Ltext0
	.uleb128 .LVL205-.Ltext0
	.uleb128 0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL205-.Ltext0
	.uleb128 .LVL206-.Ltext0
	.uleb128 0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL214-.Ltext0
	.uleb128 .LVL220-.Ltext0
	.uleb128 0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x84
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST156:
	.byte	0x4
	.uleb128 .LVL204-.Ltext0
	.uleb128 .LVL206-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL214-.Ltext0
	.uleb128 .LVL220-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST158:
	.byte	0x4
	.uleb128 .LVL215-.Ltext0
	.uleb128 .LVL219-.Ltext0
	.uleb128 0x8
	.byte	0x7e
	.sleb128 0
	.byte	0x83
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LLST160:
	.byte	0x4
	.uleb128 .LVL215-.Ltext0
	.uleb128 .LVL219-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST162:
	.byte	0x4
	.uleb128 .LVL215-.Ltext0
	.uleb128 .LVL218-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST163:
	.byte	0x4
	.uleb128 .LVL215-.Ltext0
	.uleb128 .LVL218-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST164:
	.byte	0x4
	.uleb128 .LVL215-.Ltext0
	.uleb128 .LVL218-.Ltext0
	.uleb128 0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST165:
	.byte	0x4
	.uleb128 .LVL216-.Ltext0
	.uleb128 .LVL217-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL217-.Ltext0
	.uleb128 .LVL218-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST99:
	.byte	0x4
	.uleb128 .LVL160-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL164-.Ltext0
	.uleb128 .LVL184-.Ltext0
	.uleb128 0x1
	.byte	0x65
	.byte	0
.LLST100:
	.byte	0x4
	.uleb128 .LVL160-.Ltext0
	.uleb128 .LVL162-.Ltext0
	.uleb128 0x1
	.byte	0x6f
	.byte	0x4
	.uleb128 .LVL162-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.byte	0
.LLST101:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL163-.Ltext0
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL163-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x5
	.byte	0x88
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL164-.Ltext0
	.uleb128 .LVL184-.Ltext0
	.uleb128 0x5
	.byte	0x85
	.sleb128 0
	.byte	0x31
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST102:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL164-.Ltext0
	.uleb128 .LVL186-.Ltext0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
.LLST103:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL164-.Ltext0
	.uleb128 .LVL165-.Ltext0
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL165-.Ltext0
	.uleb128 .LVL166-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL180-.Ltext0
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL180-.Ltext0
	.uleb128 .LVL186-.Ltext0
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST104:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL173-.Ltext0
	.uleb128 0x9
	.byte	0x91
	.sleb128 -144
	.byte	0x94
	.byte	0x4
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL173-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0xb
	.byte	0x91
	.sleb128 -144
	.byte	0x94
	.byte	0x4
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL179-.Ltext0
	.uleb128 .LVL186-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST105:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL167-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL167-.Ltext0
	.uleb128 .LVL174-1-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL175-.Ltext0
	.uleb128 .LVL183-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST113:
	.byte	0x4
	.uleb128 .LVL161-.Ltext0
	.uleb128 .LVL164-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL181-.Ltext0
	.uleb128 .LVL182-.Ltext0
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST115:
	.byte	0x4
	.uleb128 .LVL162-.Ltext0
	.uleb128 .LVL166-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL181-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL181-.Ltext0
	.uleb128 .LVL182-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL182-.Ltext0
	.uleb128 .LVL185-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0
.LLST117:
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL177-.Ltext0
	.uleb128 0x1
	.byte	0x6a
	.byte	0
.LLST118:
	.byte	0x4
	.uleb128 .LVL166-.Ltext0
	.uleb128 .LVL186-.Ltext0
	.uleb128 0x9
	.byte	0x88
	.sleb128 0
	.byte	0x91
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST119:
	.byte	0x4
	.uleb128 .LVL168-.Ltext0
	.uleb128 .LVL170-.Ltext0
	.uleb128 0x1
	.byte	0x6c
	.byte	0x4
	.uleb128 .LVL170-.Ltext0
	.uleb128 .LVL177-.Ltext0
	.uleb128 0x16
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0
.LLST120:
	.byte	0x4
	.uleb128 .LVL168-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0x9
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST121:
	.byte	0x4
	.uleb128 .LVL168-.Ltext0
	.uleb128 .LVL178-.Ltext0
	.uleb128 0x5
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST122:
	.byte	0x4
	.uleb128 .LVL168-.Ltext0
	.uleb128 .LVL170-.Ltext0
	.uleb128 0x6
	.byte	0x8c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL170-.Ltext0
	.uleb128 .LVL177-.Ltext0
	.uleb128 0x19
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST123:
	.byte	0x4
	.uleb128 .LVL169-.Ltext0
	.uleb128 .LVL171-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL171-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0x33
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST124:
	.byte	0x4
	.uleb128 .LVL169-.Ltext0
	.uleb128 .LVL171-.Ltext0
	.uleb128 0x9
	.byte	0x7f
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL171-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0x39
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST125:
	.byte	0x4
	.uleb128 .LVL169-.Ltext0
	.uleb128 .LVL171-.Ltext0
	.uleb128 0x9
	.byte	0x88
	.sleb128 0
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL171-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0x39
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x88
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST126:
	.byte	0x4
	.uleb128 .LVL169-.Ltext0
	.uleb128 .LVL170-.Ltext0
	.uleb128 0x9
	.byte	0x8c
	.sleb128 0
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL170-.Ltext0
	.uleb128 .LVL171-.Ltext0
	.uleb128 0x1c
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x7f
	.sleb128 0
	.byte	0x22
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL171-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0x4c
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x22
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST127:
	.byte	0x4
	.uleb128 .LVL172-.Ltext0
	.uleb128 .LVL174-1-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL174-1-.Ltext0
	.uleb128 .LVL176-.Ltext0
	.uleb128 0xd9
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x88
	.sleb128 0
	.byte	0x22
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8
	.byte	0x30
	.byte	0x24
	.byte	0x8
	.byte	0x30
	.byte	0x25
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x40
	.byte	0x24
	.byte	0x8
	.byte	0xff
	.byte	0x40
	.byte	0x24
	.byte	0x1a
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x21
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x88
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x8a
	.sleb128 0
	.byte	0x27
	.byte	0x8a
	.sleb128 0
	.byte	0x4f
	.byte	0x26
	.byte	0x1c
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0x82
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x22
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x8b
	.sleb128 0
	.byte	0x1e
	.byte	0x8
	.byte	0x20
	.byte	0x25
	.byte	0x22
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.byte	0
.LLST128:
	.byte	0x4
	.uleb128 .LVL173-.Ltext0
	.uleb128 .LVL174-1-.Ltext0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL174-1-.Ltext0
	.uleb128 .LVL183-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST130:
	.byte	0x4
	.uleb128 .LVL172-.Ltext0
	.uleb128 .LVL173-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0
.LLST131:
	.byte	0x4
	.uleb128 .LVL172-.Ltext0
	.uleb128 .LVL173-.Ltext0
	.uleb128 0x1
	.byte	0x68
	.byte	0
.LLST132:
	.byte	0x4
	.uleb128 .LVL172-.Ltext0
	.uleb128 .LVL173-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST133:
	.byte	0x4
	.uleb128 .LVL172-.Ltext0
	.uleb128 .LVL173-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST107:
	.byte	0x4
	.uleb128 .LVL152-.Ltext0
	.uleb128 .LVL158-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST108:
	.byte	0x4
	.uleb128 .LVL152-.Ltext0
	.uleb128 .LVL155-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST109:
	.byte	0x4
	.uleb128 .LVL152-.Ltext0
	.uleb128 .LVL155-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.byte	0
.LLST110:
	.byte	0x4
	.uleb128 .LVL153-.Ltext0
	.uleb128 .LVL154-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL154-.Ltext0
	.uleb128 .LVL155-.Ltext0
	.uleb128 0x18
	.byte	0x3
	.8byte	display_height
	.byte	0x94
	.byte	0x4
	.byte	0x3
	.8byte	display_width
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST112:
	.byte	0x4
	.uleb128 .LVL153-.Ltext0
	.uleb128 .LVL155-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL155-.Ltext0
	.uleb128 .LVL156-.Ltext0
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
	.uleb128 .LVL156-.Ltext0
	.uleb128 .LVL157-.Ltext0
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
	.uleb128 .LVL157-.Ltext0
	.uleb128 .LVL158-.Ltext0
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
.LLST49:
	.byte	0x4
	.uleb128 .LVL105-.Ltext0
	.uleb128 .LVL146-.Ltext0
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL149-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST50:
	.byte	0x4
	.uleb128 .LVL105-.Ltext0
	.uleb128 .LVL147-.Ltext0
	.uleb128 0x1
	.byte	0x64
	.byte	0x4
	.uleb128 .LVL149-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x1
	.byte	0x64
	.byte	0
.LLST51:
	.byte	0x4
	.uleb128 .LVL105-.Ltext0
	.uleb128 .LVL148-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL149-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0
.LLST52:
	.byte	0x4
	.uleb128 .LVL136-.Ltext0
	.uleb128 .LVL149-1-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST70:
	.byte	0x4
	.uleb128 .LVL106-.Ltext0
	.uleb128 .LVL108-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL114-.Ltext0
	.uleb128 .LVL115-.Ltext0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL149-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST71:
	.byte	0x4
	.uleb128 .LVL107-.Ltext0
	.uleb128 .LVL108-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL109-.Ltext0
	.uleb128 .LVL112-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL113-.Ltext0
	.uleb128 .LVL115-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST73:
	.byte	0x4
	.uleb128 .LVL109-.Ltext0
	.uleb128 .LVL110-.Ltext0
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.byte	0
.LLST75:
	.byte	0x4
	.uleb128 .LVL111-.Ltext0
	.uleb128 .LVL112-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST76:
	.byte	0x4
	.uleb128 .LVL111-.Ltext0
	.uleb128 .LVL113-.Ltext0
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST77:
	.byte	0x4
	.uleb128 .LVL111-.Ltext0
	.uleb128 .LVL113-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST78:
	.byte	0x4
	.uleb128 .LVL111-.Ltext0
	.uleb128 .LVL113-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST80:
	.byte	0x4
	.uleb128 .LVL116-.Ltext0
	.uleb128 .LVL118-.Ltext0
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL122-.Ltext0
	.uleb128 .LVL124-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL150-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST81:
	.byte	0x4
	.uleb128 .LVL117-.Ltext0
	.uleb128 .LVL118-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL124-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST83:
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL123-.Ltext0
	.uleb128 0x6
	.byte	0x80
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.byte	0
.LLST85:
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL120-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST86:
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL120-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST87:
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL120-.Ltext0
	.uleb128 0xc
	.byte	0x80
	.sleb128 0
	.byte	0x87
	.sleb128 0
	.byte	0x1b
	.byte	0x38
	.byte	0x24
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST88:
	.byte	0x4
	.uleb128 .LVL119-.Ltext0
	.uleb128 .LVL120-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST61:
	.byte	0x4
	.uleb128 .LVL125-.Ltext0
	.uleb128 .LVL127-.Ltext0
	.uleb128 0x5
	.byte	0x87
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL133-.Ltext0
	.uleb128 .LVL134-.Ltext0
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL151-.Ltext0
	.uleb128 .LFE14-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST62:
	.byte	0x4
	.uleb128 .LVL126-.Ltext0
	.uleb128 .LVL127-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL128-.Ltext0
	.uleb128 .LVL131-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL132-.Ltext0
	.uleb128 .LVL134-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST64:
	.byte	0x4
	.uleb128 .LVL128-.Ltext0
	.uleb128 .LVL129-.Ltext0
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x7a
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.byte	0
.LLST66:
	.byte	0x4
	.uleb128 .LVL129-.Ltext0
	.uleb128 .LVL131-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST67:
	.byte	0x4
	.uleb128 .LVL129-.Ltext0
	.uleb128 .LVL132-.Ltext0
	.uleb128 0x1
	.byte	0x66
	.byte	0
.LLST68:
	.byte	0x4
	.uleb128 .LVL130-.Ltext0
	.uleb128 .LVL132-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST69:
	.byte	0x4
	.uleb128 .LVL130-.Ltext0
	.uleb128 .LVL132-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST89:
	.byte	0x4
	.uleb128 .LVL136-.Ltext0
	.uleb128 .LVL138-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL144-.Ltext0
	.uleb128 .LVL145-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST90:
	.byte	0x4
	.uleb128 .LVL137-.Ltext0
	.uleb128 .LVL138-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL139-.Ltext0
	.uleb128 .LVL145-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST92:
	.byte	0x4
	.uleb128 .LVL140-.Ltext0
	.uleb128 .LVL141-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL143-.Ltext0
	.uleb128 0xb
	.byte	0x7d
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x1b
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST93:
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL145-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST95:
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL142-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST96:
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL142-.Ltext0
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LLST97:
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL142-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST98:
	.byte	0x4
	.uleb128 .LVL141-.Ltext0
	.uleb128 .LVL142-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST54:
	.byte	0x4
	.uleb128 .LVL97-.Ltext0
	.uleb128 .LVL103-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST55:
	.byte	0x4
	.uleb128 .LVL97-.Ltext0
	.uleb128 .LVL100-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST56:
	.byte	0x4
	.uleb128 .LVL97-.Ltext0
	.uleb128 .LVL100-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.byte	0
.LLST57:
	.byte	0x4
	.uleb128 .LVL98-.Ltext0
	.uleb128 .LVL99-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL99-.Ltext0
	.uleb128 .LVL100-.Ltext0
	.uleb128 0x18
	.byte	0x3
	.8byte	display_height
	.byte	0x94
	.byte	0x4
	.byte	0x3
	.8byte	display_width
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST59:
	.byte	0x4
	.uleb128 .LVL98-.Ltext0
	.uleb128 .LVL100-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL100-.Ltext0
	.uleb128 .LVL101-.Ltext0
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
	.uleb128 .LVL101-.Ltext0
	.uleb128 .LVL102-.Ltext0
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
	.uleb128 .LVL102-.Ltext0
	.uleb128 .LVL103-.Ltext0
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
.LLST46:
	.byte	0x4
	.uleb128 .LVL85-.Ltext0
	.uleb128 .LVL86-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL92-.Ltext0
	.uleb128 .LVL93-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST47:
	.byte	0x4
	.uleb128 .LVL89-.Ltext0
	.uleb128 .LVL90-1-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST48:
	.byte	0x4
	.uleb128 .LVL89-.Ltext0
	.uleb128 .LVL90-1-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST30:
	.byte	0x4
	.uleb128 .LVL59-.Ltext0
	.uleb128 .LVL60-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LFE12-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x9f
	.byte	0
.LLST31:
	.byte	0x4
	.uleb128 .LVL59-.Ltext0
	.uleb128 .LVL66-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2c
	.byte	0x4
	.uleb128 .LVL66-.Ltext0
	.uleb128 .LFE12-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x9f
	.byte	0
.LLST32:
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LVL69-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL69-.Ltext0
	.uleb128 .LVL70-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2d
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL74-.Ltext0
	.uleb128 0xc
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL74-.Ltext0
	.uleb128 .LVL75-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL75-.Ltext0
	.uleb128 .LVL77-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0x4
	.uleb128 .LVL77-.Ltext0
	.uleb128 .LVL79-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL79-.Ltext0
	.uleb128 .LVL80-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL80-.Ltext0
	.uleb128 .LVL81-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL81-.Ltext0
	.uleb128 .LVL82-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0x4
	.uleb128 .LVL82-.Ltext0
	.uleb128 .LFE12-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
.LLST33:
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LVL64-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL64-.Ltext0
	.uleb128 .LVL65-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x42700000
	.byte	0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL65-.Ltext0
	.uleb128 .LVL68-.Ltext0
	.uleb128 0x8
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL68-.Ltext0
	.uleb128 .LFE12-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x42700000
	.byte	0x1b
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x4
	.uleb128 .LVL67-.Ltext0
	.uleb128 .LVL70-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL74-.Ltext0
	.uleb128 .LVL76-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL76-.Ltext0
	.uleb128 .LVL77-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL77-.Ltext0
	.uleb128 .LVL78-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL78-.Ltext0
	.uleb128 .LVL80-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0x4
	.uleb128 .LVL80-.Ltext0
	.uleb128 .LVL83-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL83-.Ltext0
	.uleb128 .LFE12-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0
.LLST35:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL71-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
.LLST36:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL72-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0
.LLST37:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL73-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0
.LLST38:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL71-.Ltext0
	.uleb128 0x14
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x22
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x437f0000
	.byte	0x1e
	.byte	0xa8
	.uleb128 0x35
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL72-.Ltext0
	.uleb128 0x14
	.byte	0xa5
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x22
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x437f0000
	.byte	0x1e
	.byte	0xa8
	.uleb128 0x35
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LLST40:
	.byte	0x4
	.uleb128 .LVL70-.Ltext0
	.uleb128 .LVL73-.Ltext0
	.uleb128 0x14
	.byte	0xa5
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x22
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x437f0000
	.byte	0x1e
	.byte	0xa8
	.uleb128 0x35
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LLST42:
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LVL61-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0
.LLST43:
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LVL61-.Ltext0
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0x40000000
	.byte	0
.LLST45:
	.byte	0x4
	.uleb128 .LVL62-.Ltext0
	.uleb128 .LVL63-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0
.LLST21:
	.byte	0x4
	.uleb128 .LVL45-.Ltext0
	.uleb128 .LVL51-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL51-.Ltext0
	.uleb128 .LVL55-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL55-.Ltext0
	.uleb128 .LVL57-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL57-.Ltext0
	.uleb128 .LFE11-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0
.LLST22:
	.byte	0x4
	.uleb128 .LVL45-.Ltext0
	.uleb128 .LVL50-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0x4
	.uleb128 .LVL50-.Ltext0
	.uleb128 .LVL55-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL55-.Ltext0
	.uleb128 .LFE11-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
.LLST23:
	.byte	0x4
	.uleb128 .LVL48-.Ltext0
	.uleb128 .LVL53-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0x4
	.uleb128 .LVL55-.Ltext0
	.uleb128 .LVL56-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2e
	.byte	0
.LLST24:
	.byte	0x4
	.uleb128 .LVL53-.Ltext0
	.uleb128 .LVL54-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0
.LLST28:
	.byte	0x4
	.uleb128 .LVL49-.Ltext0
	.uleb128 .LVL50-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1c
	.byte	0xa5
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL50-.Ltext0
	.uleb128 .LVL52-.Ltext0
	.uleb128 0xe
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1c
	.byte	0xa5
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL52-.Ltext0
	.uleb128 .LVL53-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
.LLST29:
	.byte	0x4
	.uleb128 .LVL55-.Ltext0
	.uleb128 .LVL56-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1c
	.byte	0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL58-.Ltext0
	.uleb128 .LFE11-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2d
	.byte	0
.LLST26:
	.byte	0x4
	.uleb128 .LVL46-.Ltext0
	.uleb128 .LVL47-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0
.LLST15:
	.byte	0x4
	.uleb128 .LVL36-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL38-.Ltext0
	.uleb128 .LFE9-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST17:
	.byte	0x4
	.uleb128 .LVL37-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL38-.Ltext0
	.uleb128 .LVL40-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL40-.Ltext0
	.uleb128 .LVL42-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST18:
	.byte	0x4
	.uleb128 .LVL37-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x3f000000
	.byte	0x1e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL38-.Ltext0
	.uleb128 .LVL39-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x3f000000
	.byte	0x1e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.Ltext0
	.uleb128 .LVL41-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL41-.Ltext0
	.uleb128 .LVL42-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x3f000000
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x4
	.uleb128 .LVL37-.Ltext0
	.uleb128 .LVL42-.Ltext0
	.uleb128 0xb
	.byte	0xc
	.4byte	0x5f3759df
	.byte	0x7f
	.sleb128 0
	.byte	0x31
	.byte	0x26
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x4
	.uleb128 .LVL17-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL18-.Ltext0
	.uleb128 .LFE6-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x4
	.uleb128 .LVL18-.Ltext0
	.uleb128 .LVL20-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL24-.Ltext0
	.uleb128 .LFE6-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0
.LLST10:
	.byte	0x4
	.uleb128 .LVL21-.Ltext0
	.uleb128 .LVL22-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL22-.Ltext0
	.uleb128 .LVL23-.Ltext0
	.uleb128 0x6
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x12
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL1-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST1:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.byte	0
.LLST2:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.byte	0
.LLST3:
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL4-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL4-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x18
	.byte	0x3
	.8byte	display_height
	.byte	0x94
	.byte	0x4
	.byte	0x3
	.8byte	display_width
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.Ltext0
	.uleb128 .LVL6-.Ltext0
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
	.uleb128 .LVL6-.Ltext0
	.uleb128 .LVL7-.Ltext0
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
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL8-.Ltext0
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
.LLST5:
	.byte	0x4
	.uleb128 .LVL9-.Ltext0
	.uleb128 .LVL10-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL10-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL15-.Ltext0
	.uleb128 .LFE5-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0
.LLST6:
	.byte	0x4
	.uleb128 .LVL12-.Ltext0
	.uleb128 .LVL13-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2f
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL14-.Ltext0
	.uleb128 0x6
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x12
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x4
	.uleb128 .LVL26-.Ltext0
	.uleb128 .LVL27-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL27-.Ltext0
	.uleb128 .LFE7-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x4
	.uleb128 .LVL28-.Ltext0
	.uleb128 .LVL30-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL30-.Ltext0
	.uleb128 .LVL31-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL31-.Ltext0
	.uleb128 .LVL32-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL32-.Ltext0
	.uleb128 .LVL34-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL34-.Ltext0
	.uleb128 .LVL35-.Ltext0
	.uleb128 0x8
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa5
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x4
	.uleb128 .LVL29-.Ltext0
	.uleb128 .LVL30-.Ltext0
	.uleb128 0xc
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x3f000000
	.byte	0x1e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.Ltext0
	.uleb128 .LVL33-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL33-.Ltext0
	.uleb128 .LFE8-.Ltext0
	.uleb128 0xe
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0xa4
	.uleb128 0x2e
	.byte	0x4
	.4byte	0x3f000000
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x4
	.uleb128 .LVL29-.Ltext0
	.uleb128 .LVL31-.Ltext0
	.uleb128 0xb
	.byte	0xc
	.4byte	0x5f3759df
	.byte	0x7e
	.sleb128 0
	.byte	0x31
	.byte	0x26
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x4
	.uleb128 .LVL43-.Ltext0
	.uleb128 .LVL44-.Ltext0
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.byte	0x4
	.uleb128 .LVL44-.Ltext0
	.uleb128 .LFE10-.Ltext0
	.uleb128 0x6
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
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
.LLRL8:
	.byte	0x4
	.uleb128 .LBB54-.Ltext0
	.uleb128 .LBE54-.Ltext0
	.byte	0x4
	.uleb128 .LBB58-.Ltext0
	.uleb128 .LBE58-.Ltext0
	.byte	0x4
	.uleb128 .LBB59-.Ltext0
	.uleb128 .LBE59-.Ltext0
	.byte	0
.LLRL16:
	.byte	0x4
	.uleb128 .LBB60-.Ltext0
	.uleb128 .LBE60-.Ltext0
	.byte	0x4
	.uleb128 .LBB63-.Ltext0
	.uleb128 .LBE63-.Ltext0
	.byte	0
.LLRL25:
	.byte	0x4
	.uleb128 .LBB64-.Ltext0
	.uleb128 .LBE64-.Ltext0
	.byte	0x4
	.uleb128 .LBB67-.Ltext0
	.uleb128 .LBE67-.Ltext0
	.byte	0
.LLRL27:
	.byte	0x4
	.uleb128 .LBB68-.Ltext0
	.uleb128 .LBE68-.Ltext0
	.byte	0x4
	.uleb128 .LBB69-.Ltext0
	.uleb128 .LBE69-.Ltext0
	.byte	0
.LLRL41:
	.byte	0x4
	.uleb128 .LBB71-.Ltext0
	.uleb128 .LBE71-.Ltext0
	.byte	0x4
	.uleb128 .LBB75-.Ltext0
	.uleb128 .LBE75-.Ltext0
	.byte	0x4
	.uleb128 .LBB79-.Ltext0
	.uleb128 .LBE79-.Ltext0
	.byte	0
.LLRL44:
	.byte	0x4
	.uleb128 .LBB76-.Ltext0
	.uleb128 .LBE76-.Ltext0
	.byte	0x4
	.uleb128 .LBB80-.Ltext0
	.uleb128 .LBE80-.Ltext0
	.byte	0
.LLRL53:
	.byte	0x4
	.uleb128 .LBB104-.Ltext0
	.uleb128 .LBE104-.Ltext0
	.byte	0x4
	.uleb128 .LBB111-.Ltext0
	.uleb128 .LBE111-.Ltext0
	.byte	0x4
	.uleb128 .LBB112-.Ltext0
	.uleb128 .LBE112-.Ltext0
	.byte	0x4
	.uleb128 .LBB113-.Ltext0
	.uleb128 .LBE113-.Ltext0
	.byte	0
.LLRL58:
	.byte	0x4
	.uleb128 .LBB106-.Ltext0
	.uleb128 .LBE106-.Ltext0
	.byte	0x4
	.uleb128 .LBB107-.Ltext0
	.uleb128 .LBE107-.Ltext0
	.byte	0
.LLRL60:
	.byte	0x4
	.uleb128 .LBB114-.Ltext0
	.uleb128 .LBE114-.Ltext0
	.byte	0x4
	.uleb128 .LBB125-.Ltext0
	.uleb128 .LBE125-.Ltext0
	.byte	0x4
	.uleb128 .LBB151-.Ltext0
	.uleb128 .LBE151-.Ltext0
	.byte	0x4
	.uleb128 .LBB166-.Ltext0
	.uleb128 .LBE166-.Ltext0
	.byte	0
.LLRL63:
	.byte	0x4
	.uleb128 .LBB116-.Ltext0
	.uleb128 .LBE116-.Ltext0
	.byte	0x4
	.uleb128 .LBB123-.Ltext0
	.uleb128 .LBE123-.Ltext0
	.byte	0x4
	.uleb128 .LBB124-.Ltext0
	.uleb128 .LBE124-.Ltext0
	.byte	0
.LLRL65:
	.byte	0x4
	.uleb128 .LBB117-.Ltext0
	.uleb128 .LBE117-.Ltext0
	.byte	0x4
	.uleb128 .LBB121-.Ltext0
	.uleb128 .LBE121-.Ltext0
	.byte	0x4
	.uleb128 .LBB122-.Ltext0
	.uleb128 .LBE122-.Ltext0
	.byte	0
.LLRL72:
	.byte	0x4
	.uleb128 .LBB128-.Ltext0
	.uleb128 .LBE128-.Ltext0
	.byte	0x4
	.uleb128 .LBB139-.Ltext0
	.uleb128 .LBE139-.Ltext0
	.byte	0x4
	.uleb128 .LBB140-.Ltext0
	.uleb128 .LBE140-.Ltext0
	.byte	0x4
	.uleb128 .LBB141-.Ltext0
	.uleb128 .LBE141-.Ltext0
	.byte	0
.LLRL74:
	.byte	0x4
	.uleb128 .LBB129-.Ltext0
	.uleb128 .LBE129-.Ltext0
	.byte	0x4
	.uleb128 .LBB135-.Ltext0
	.uleb128 .LBE135-.Ltext0
	.byte	0x4
	.uleb128 .LBB136-.Ltext0
	.uleb128 .LBE136-.Ltext0
	.byte	0x4
	.uleb128 .LBB137-.Ltext0
	.uleb128 .LBE137-.Ltext0
	.byte	0x4
	.uleb128 .LBB138-.Ltext0
	.uleb128 .LBE138-.Ltext0
	.byte	0
.LLRL79:
	.byte	0x4
	.uleb128 .LBB142-.Ltext0
	.uleb128 .LBE142-.Ltext0
	.byte	0x4
	.uleb128 .LBB165-.Ltext0
	.uleb128 .LBE165-.Ltext0
	.byte	0
.LLRL82:
	.byte	0x4
	.uleb128 .LBB144-.Ltext0
	.uleb128 .LBE144-.Ltext0
	.byte	0x4
	.uleb128 .LBB149-.Ltext0
	.uleb128 .LBE149-.Ltext0
	.byte	0x4
	.uleb128 .LBB150-.Ltext0
	.uleb128 .LBE150-.Ltext0
	.byte	0
.LLRL84:
	.byte	0x4
	.uleb128 .LBB145-.Ltext0
	.uleb128 .LBE145-.Ltext0
	.byte	0x4
	.uleb128 .LBB148-.Ltext0
	.uleb128 .LBE148-.Ltext0
	.byte	0
.LLRL91:
	.byte	0x4
	.uleb128 .LBB154-.Ltext0
	.uleb128 .LBE154-.Ltext0
	.byte	0x4
	.uleb128 .LBB163-.Ltext0
	.uleb128 .LBE163-.Ltext0
	.byte	0x4
	.uleb128 .LBB164-.Ltext0
	.uleb128 .LBE164-.Ltext0
	.byte	0
.LLRL94:
	.byte	0x4
	.uleb128 .LBB155-.Ltext0
	.uleb128 .LBE155-.Ltext0
	.byte	0x4
	.uleb128 .LBB160-.Ltext0
	.uleb128 .LBE160-.Ltext0
	.byte	0x4
	.uleb128 .LBB161-.Ltext0
	.uleb128 .LBE161-.Ltext0
	.byte	0x4
	.uleb128 .LBB162-.Ltext0
	.uleb128 .LBE162-.Ltext0
	.byte	0
.LLRL106:
	.byte	0x4
	.uleb128 .LBB175-.Ltext0
	.uleb128 .LBE175-.Ltext0
	.byte	0x4
	.uleb128 .LBB182-.Ltext0
	.uleb128 .LBE182-.Ltext0
	.byte	0x4
	.uleb128 .LBB183-.Ltext0
	.uleb128 .LBE183-.Ltext0
	.byte	0x4
	.uleb128 .LBB184-.Ltext0
	.uleb128 .LBE184-.Ltext0
	.byte	0
.LLRL111:
	.byte	0x4
	.uleb128 .LBB177-.Ltext0
	.uleb128 .LBE177-.Ltext0
	.byte	0x4
	.uleb128 .LBB178-.Ltext0
	.uleb128 .LBE178-.Ltext0
	.byte	0
.LLRL114:
	.byte	0x4
	.uleb128 .LBB186-.Ltext0
	.uleb128 .LBE186-.Ltext0
	.byte	0x4
	.uleb128 .LBB200-.Ltext0
	.uleb128 .LBE200-.Ltext0
	.byte	0
.LLRL116:
	.byte	0x4
	.uleb128 .LBB187-.Ltext0
	.uleb128 .LBE187-.Ltext0
	.byte	0x4
	.uleb128 .LBB198-.Ltext0
	.uleb128 .LBE198-.Ltext0
	.byte	0x4
	.uleb128 .LBB199-.Ltext0
	.uleb128 .LBE199-.Ltext0
	.byte	0
.LLRL129:
	.byte	0x4
	.uleb128 .LBB188-.Ltext0
	.uleb128 .LBE188-.Ltext0
	.byte	0x4
	.uleb128 .LBB194-.Ltext0
	.uleb128 .LBE194-.Ltext0
	.byte	0x4
	.uleb128 .LBB195-.Ltext0
	.uleb128 .LBE195-.Ltext0
	.byte	0x4
	.uleb128 .LBB196-.Ltext0
	.uleb128 .LBE196-.Ltext0
	.byte	0x4
	.uleb128 .LBB197-.Ltext0
	.uleb128 .LBE197-.Ltext0
	.byte	0
.LLRL139:
	.byte	0x4
	.uleb128 .LBB201-.Ltext0
	.uleb128 .LBE201-.Ltext0
	.byte	0x4
	.uleb128 .LBB224-.Ltext0
	.uleb128 .LBE224-.Ltext0
	.byte	0x4
	.uleb128 .LBB226-.Ltext0
	.uleb128 .LBE226-.Ltext0
	.byte	0x4
	.uleb128 .LBB244-.Ltext0
	.uleb128 .LBE244-.Ltext0
	.byte	0x4
	.uleb128 .LBB247-.Ltext0
	.uleb128 .LBE247-.Ltext0
	.byte	0
.LLRL141:
	.byte	0x4
	.uleb128 .LBB202-.Ltext0
	.uleb128 .LBE202-.Ltext0
	.byte	0x4
	.uleb128 .LBB220-.Ltext0
	.uleb128 .LBE220-.Ltext0
	.byte	0x4
	.uleb128 .LBB221-.Ltext0
	.uleb128 .LBE221-.Ltext0
	.byte	0x4
	.uleb128 .LBB222-.Ltext0
	.uleb128 .LBE222-.Ltext0
	.byte	0
.LLRL143:
	.byte	0x4
	.uleb128 .LBB203-.Ltext0
	.uleb128 .LBE203-.Ltext0
	.byte	0x4
	.uleb128 .LBB218-.Ltext0
	.uleb128 .LBE218-.Ltext0
	.byte	0x4
	.uleb128 .LBB219-.Ltext0
	.uleb128 .LBE219-.Ltext0
	.byte	0
.LLRL145:
	.byte	0x4
	.uleb128 .LBB204-.Ltext0
	.uleb128 .LBE204-.Ltext0
	.byte	0x4
	.uleb128 .LBB215-.Ltext0
	.uleb128 .LBE215-.Ltext0
	.byte	0x4
	.uleb128 .LBB216-.Ltext0
	.uleb128 .LBE216-.Ltext0
	.byte	0x4
	.uleb128 .LBB217-.Ltext0
	.uleb128 .LBE217-.Ltext0
	.byte	0
.LLRL147:
	.byte	0x4
	.uleb128 .LBB205-.Ltext0
	.uleb128 .LBE205-.Ltext0
	.byte	0x4
	.uleb128 .LBB211-.Ltext0
	.uleb128 .LBE211-.Ltext0
	.byte	0x4
	.uleb128 .LBB212-.Ltext0
	.uleb128 .LBE212-.Ltext0
	.byte	0x4
	.uleb128 .LBB213-.Ltext0
	.uleb128 .LBE213-.Ltext0
	.byte	0x4
	.uleb128 .LBB214-.Ltext0
	.uleb128 .LBE214-.Ltext0
	.byte	0
.LLRL152:
	.byte	0x4
	.uleb128 .LBB223-.Ltext0
	.uleb128 .LBE223-.Ltext0
	.byte	0x4
	.uleb128 .LBB225-.Ltext0
	.uleb128 .LBE225-.Ltext0
	.byte	0x4
	.uleb128 .LBB246-.Ltext0
	.uleb128 .LBE246-.Ltext0
	.byte	0
.LLRL153:
	.byte	0x4
	.uleb128 .LBB227-.Ltext0
	.uleb128 .LBE227-.Ltext0
	.byte	0x4
	.uleb128 .LBB245-.Ltext0
	.uleb128 .LBE245-.Ltext0
	.byte	0x4
	.uleb128 .LBB248-.Ltext0
	.uleb128 .LBE248-.Ltext0
	.byte	0
.LLRL155:
	.byte	0x4
	.uleb128 .LBB228-.Ltext0
	.uleb128 .LBE228-.Ltext0
	.byte	0x4
	.uleb128 .LBB242-.Ltext0
	.uleb128 .LBE242-.Ltext0
	.byte	0x4
	.uleb128 .LBB243-.Ltext0
	.uleb128 .LBE243-.Ltext0
	.byte	0
.LLRL157:
	.byte	0x4
	.uleb128 .LBB229-.Ltext0
	.uleb128 .LBE229-.Ltext0
	.byte	0x4
	.uleb128 .LBB241-.Ltext0
	.uleb128 .LBE241-.Ltext0
	.byte	0
.LLRL159:
	.byte	0x4
	.uleb128 .LBB230-.Ltext0
	.uleb128 .LBE230-.Ltext0
	.byte	0x4
	.uleb128 .LBB239-.Ltext0
	.uleb128 .LBE239-.Ltext0
	.byte	0x4
	.uleb128 .LBB240-.Ltext0
	.uleb128 .LBE240-.Ltext0
	.byte	0
.LLRL161:
	.byte	0x4
	.uleb128 .LBB231-.Ltext0
	.uleb128 .LBE231-.Ltext0
	.byte	0x4
	.uleb128 .LBB236-.Ltext0
	.uleb128 .LBE236-.Ltext0
	.byte	0x4
	.uleb128 .LBB237-.Ltext0
	.uleb128 .LBE237-.Ltext0
	.byte	0x4
	.uleb128 .LBB238-.Ltext0
	.uleb128 .LBE238-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF55:
	.string	"printf"
.LASF18:
	.string	"framebuffer"
.LASF7:
	.string	"__uint8_t"
.LASF58:
	.string	"inv_sqrt"
.LASF17:
	.string	"long long unsigned int"
.LASF54:
	.string	"angle"
.LASF19:
	.string	"display_width"
.LASF14:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF57:
	.string	"sqrt_approx"
.LASF52:
	.string	"atan2_approx"
.LASF63:
	.string	"fast_sin"
.LASF68:
	.string	"get_display_status"
.LASF10:
	.string	"long int"
.LASF50:
	.string	"h_prime"
.LASF70:
	.string	"__builtin_puts"
.LASF44:
	.string	"checker_size"
.LASF62:
	.string	"fast_cos"
.LASF21:
	.string	"set_display_enable"
.LASF8:
	.string	"__uint32_t"
.LASF42:
	.string	"run_frame_buffer_test"
.LASF9:
	.string	"unsigned int"
.LASF45:
	.string	"intensity"
.LASF51:
	.string	"hsv_to_rgb"
.LASF11:
	.string	"long unsigned int"
.LASF29:
	.string	"draw_cool_pattern"
.LASF59:
	.string	"x_val"
.LASF67:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF30:
	.string	"width"
.LASF6:
	.string	"short unsigned int"
.LASF61:
	.string	"absf"
.LASF65:
	.string	"total"
.LASF32:
	.string	"total_pixels"
.LASF69:
	.string	"puts"
.LASF41:
	.string	"percent"
.LASF15:
	.string	"long double"
.LASF27:
	.string	"bg_color"
.LASF26:
	.string	"ball_color"
.LASF34:
	.string	"last_percent"
.LASF66:
	.string	"set_pixel"
.LASF53:
	.string	"abs_y"
.LASF2:
	.string	"float"
.LASF47:
	.string	"init_display"
.LASF60:
	.string	"xhalf"
.LASF43:
	.string	"section_height"
.LASF33:
	.string	"pixels_done"
.LASF36:
	.string	"pattern1"
.LASF37:
	.string	"pattern2"
.LASF38:
	.string	"pattern3"
.LASF3:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF49:
	.string	"ball_radius"
.LASF24:
	.string	"ball_x"
.LASF25:
	.string	"ball_y"
.LASF13:
	.string	"uint32_t"
.LASF40:
	.string	"color"
.LASF16:
	.string	"char"
.LASF28:
	.string	"run_bouncing_ball_demo_size"
.LASF56:
	.string	"fmod_simple"
.LASF35:
	.string	"dist"
.LASF20:
	.string	"display_height"
.LASF48:
	.string	"status"
.LASF39:
	.string	"combined"
.LASF12:
	.string	"uint8_t"
.LASF23:
	.string	"get_display_width"
.LASF31:
	.string	"height"
.LASF64:
	.string	"clear_screen"
.LASF22:
	.string	"get_display_height"
.LASF46:
	.string	"checker"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
