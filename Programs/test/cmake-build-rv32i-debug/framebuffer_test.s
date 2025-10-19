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
	.file 0 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug" "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
	.align	1
	.globl	set_pixel
	.type	set_pixel, @function
set_pixel:
.LFB3:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
	.loc 1 17 64
	.cfi_startproc
.LVL0:
	.loc 1 18 5
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:18:     uint32_t width = display_width;
	.loc 1 18 14 is_stmt 0
	lui	a5,%hi(display_width)	# tmp148,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	lw	a5,%lo(display_width)(a5)		# display_width, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	lui	a4,%hi(framebuffer)	# tmp147,
	ld	a4,%lo(framebuffer)(a4)		# framebuffer, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	mulw	a5,a5,a1	# tmp152, display_width, tmp159
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27
	addw	a5,a5,a0	# tmp158, tmp154, tmp152
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a3,a5,32	#, tmp161, tmp154
	srli	a5,a3,30	#, _8, tmp161
	add	a4,a4,a5	# _8, _9, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a2,0(a4)	# color, *_9
.LVL1:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:20: }
	.loc 1 20 1
	ret	
	.cfi_endproc
.LFE3:
	.size	set_pixel, .-set_pixel
	.align	1
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
.LFB4:
	.loc 1 22 41 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 23 5
	.loc 1 24 5
	.loc 1 25 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:23:     uint32_t width = display_width;
	.loc 1 23 14 is_stmt 0
	lui	a5,%hi(display_width)	# tmp146,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t height = display_height;
	.loc 1 24 14
	lui	a4,%hi(display_height)	# tmp147,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t total = width * height;
	.loc 1 25 14
	lw	a5,%lo(display_width)(a5)		# display_width, display_width
	lw	a4,%lo(display_height)(a4)		# display_height, display_height
	mulw	a4,a4,a5	# tmp153, display_height, display_width
.LVL3:
	.loc 1 27 5 is_stmt 1
.LBB38:
	.loc 1 27 10
	.loc 1 27 28 discriminator 1
	beq	a4,zero,.L3	#, tmp153,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 20 is_stmt 0
	lui	a5,%hi(framebuffer)	# tmp154,
	ld	a5,%lo(framebuffer)(a5)		# ivtmp.59, framebuffer
	slli	a3,a4,32	#, tmp158, tmp153
	srli	a4,a3,30	#, _22, tmp158
.LVL4:
	add	a4,a4,a5	# ivtmp.59, _24, _22
.LVL5:
.L5:
	.loc 1 28 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 24 is_stmt 0
	sw	a0,0(a5)	# color, *_6
	.loc 1 27 38 is_stmt 1 discriminator 3
.LVL6:
	.loc 1 27 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.59, ivtmp.59
.LVL7:
	bne	a5,a4,.L5	#, ivtmp.59, _24,
.LVL8:
.L3:
.LBE38:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:30: }
	.loc 1 30 1 is_stmt 0
	ret	
	.cfi_endproc
.LFE4:
	.size	clear_screen, .-clear_screen
	.align	1
	.globl	fast_sin
	.type	fast_sin, @function
fast_sin:
.LFB5:
	.loc 1 33 25 is_stmt 1
	.cfi_startproc
.LVL9:
	.loc 1 35 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 14 is_stmt 0 discriminator 1
	lui	a5,%hi(.LC0)	# tmp169,
	flw	fa5,%lo(.LC0)(a5)	# tmp141,
	.loc 1 35 14 is_stmt 1 discriminator 1
	lui	a5,%hi(.LC1)	# tmp170,
	fgt.s	a4,fa0,fa5	#, tmp143, x, tmp141
	beq	a4,zero,.L21	#, tmp143,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 28 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp144,
.L13:
	.loc 1 35 26 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 28 is_stmt 0 discriminator 2
	fsub.s	fa0,fa0,fa4	# x, x, tmp144
.LVL10:
	.loc 1 35 14 is_stmt 1 discriminator 1
	fgt.s	a5,fa0,fa5	#, tmp148, x, tmp146
	bne	a5,zero,.L13	#, tmp148,,
.L14:
.LVL11:
	.loc 1 39 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:39:     float x2 = x * x;
	.loc 1 39 11 is_stmt 0
	fmul.s	fa5,fa0,fa0	# x2, x, x
.LVL12:
	.loc 1 40 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 47 is_stmt 0
	lui	a5,%hi(.LC4)	# tmp162,
	flw	fa4,%lo(.LC4)(a5)	# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 27
	lui	a5,%hi(.LC3)	# tmp159,
	flw	fa2,%lo(.LC3)(a5)	# tmp158,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 47
	fdiv.s	fa4,fa5,fa4	# _2, x2, tmp161
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 42
	lui	a5,%hi(.LC5)	# tmp165,
	flw	fa3,%lo(.LC5)(a5)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 27
	fdiv.s	fa5,fa5,fa2	# _1, x2, tmp158
.LVL13:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 42
	fsub.s	fa4,fa3,fa4	# _3, tmp164, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 22
	fnmsub.s	fa5,fa5,fa4,fa3	# _5, _1, _3, tmp164
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:41: }
	.loc 1 41 1
	fmul.s	fa0,fa5,fa0	#, _5, x
.LVL14:
	ret	
.LVL15:
.L21:
	.loc 1 36 14 is_stmt 1 discriminator 1
	lui	a4,%hi(.LC2)	# tmp171,
	flw	fa5,%lo(.LC2)(a4)	# tmp149,
	flt.s	a4,fa0,fa5	#, tmp151, x, tmp149
	beq	a4,zero,.L14	#, tmp151,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 36 29 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp152,
.L16:
	.loc 1 36 27 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 36 29 is_stmt 0 discriminator 2
	fadd.s	fa0,fa0,fa4	# x, x, tmp152
.LVL16:
	.loc 1 36 14 is_stmt 1 discriminator 1
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
	.loc 1 43 25
	.cfi_startproc
.LVL17:
	.loc 1 44 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:44:     return fast_sin(x + 1.5708f);  // cos(x) = sin(x + PI/2)
	.loc 1 44 12 is_stmt 0
	lui	a5,%hi(.LC6)	# tmp143,
	flw	fa4,%lo(.LC6)(a5)	# tmp142,
.LBB41:
.LBB42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 14 discriminator 1
	lui	a5,%hi(.LC0)	# tmp172,
	flw	fa5,%lo(.LC0)(a5)	# tmp144,
.LBE42:
.LBE41:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:44:     return fast_sin(x + 1.5708f);  // cos(x) = sin(x + PI/2)
	.loc 1 44 12
	fadd.s	fa0,fa0,fa4	# x, tmp175, tmp142
.LVL18:
.LBB45:
.LBB43:
	.loc 1 35 5 is_stmt 1
	.loc 1 35 14 discriminator 1
	lui	a5,%hi(.LC1)	# tmp173,
	fgt.s	a4,fa0,fa5	#, tmp146, x, tmp144
	beq	a4,zero,.L35	#, tmp146,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 28 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp147,
.L27:
	.loc 1 35 26 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:35:     while (x > 3.14159f) x -= 6.28318f;
	.loc 1 35 28 is_stmt 0 discriminator 2
	fsub.s	fa0,fa0,fa4	# x, x, tmp147
.LVL19:
	.loc 1 35 14 is_stmt 1 discriminator 1
	fgt.s	a5,fa0,fa5	#, tmp151, x, tmp149
	bne	a5,zero,.L27	#, tmp151,,
.L28:
.LVL20:
	.loc 1 39 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:39:     float x2 = x * x;
	.loc 1 39 11 is_stmt 0
	fmul.s	fa5,fa0,fa0	# x2, x, x
.LVL21:
	.loc 1 40 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 47 is_stmt 0
	lui	a5,%hi(.LC4)	# tmp165,
	flw	fa4,%lo(.LC4)(a5)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 27
	lui	a5,%hi(.LC3)	# tmp162,
	flw	fa2,%lo(.LC3)(a5)	# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 47
	fdiv.s	fa4,fa5,fa4	# _11, x2, tmp164
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 42
	lui	a5,%hi(.LC5)	# tmp168,
	flw	fa3,%lo(.LC5)(a5)	# tmp167,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 27
	fdiv.s	fa5,fa5,fa2	# _10, x2, tmp161
.LVL22:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 42
	fsub.s	fa4,fa3,fa4	# _12, tmp167, _11
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:40:     return x * (1.0f - x2 / 6.0f * (1.0f - x2 / 20.0f));
	.loc 1 40 22
	fnmsub.s	fa5,fa5,fa4,fa3	# _14, _10, _12, tmp167
.LVL23:
.LBE43:
.LBE45:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:45: }
	.loc 1 45 1
	fmul.s	fa0,fa5,fa0	#, _14, x
	ret	
.LVL24:
.L35:
.LBB46:
.LBB44:
	.loc 1 36 14 is_stmt 1 discriminator 1
	lui	a4,%hi(.LC2)	# tmp174,
	flw	fa5,%lo(.LC2)(a4)	# tmp152,
	flt.s	a4,fa0,fa5	#, tmp154, x, tmp152
	beq	a4,zero,.L28	#, tmp154,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 36 29 is_stmt 0 discriminator 2
	flw	fa4,%lo(.LC1)(a5)	# tmp155,
.L30:
	.loc 1 36 27 is_stmt 1 discriminator 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:36:     while (x < -3.14159f) x += 6.28318f;
	.loc 1 36 29 is_stmt 0 discriminator 2
	fadd.s	fa0,fa0,fa4	# x, x, tmp155
.LVL25:
	.loc 1 36 14 is_stmt 1 discriminator 1
	flt.s	a5,fa0,fa5	#, tmp159, x, tmp157
	bne	a5,zero,.L30	#, tmp159,,
	j	.L28		#
.LBE44:
.LBE46:
	.cfi_endproc
.LFE6:
	.size	fast_cos, .-fast_cos
	.align	1
	.globl	absf
	.type	absf, @function
absf:
.LFB7:
	.loc 1 48 21
	.cfi_startproc
.LVL26:
	.loc 1 49 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 is_stmt 0
	fmv.s.x	fa5,zero	# tmp136,
	flt.s	a5,fa0,fa5	#, tmp137, x, tmp136
	bne	a5,zero,.L42	#, tmp137,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50: }
	.loc 1 50 1
	ret	
.L42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 discriminator 1
	fneg.s	fa0,fa0	# x, x
.LVL27:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:50: }
	.loc 1 50 1
	ret	
	.cfi_endproc
.LFE7:
	.size	absf, .-absf
	.align	1
	.globl	inv_sqrt
	.type	inv_sqrt, @function
inv_sqrt:
.LFB8:
	.loc 1 53 25 is_stmt 1
	.cfi_startproc
.LVL28:
	.loc 1 54 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:54:     float xhalf = 0.5f * x;
	.loc 1 54 11 is_stmt 0
	lui	a5,%hi(.LC7)	# tmp151,
	flw	fa5,%lo(.LC7)(a5)	# tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:53: float inv_sqrt(float x) {
	.loc 1 53 25
	fmv.x.s	a4,fa0	# x, tmp156
.LVL29:
	.loc 1 55 5 is_stmt 1
	.loc 1 56 5
	.loc 1 57 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 20 is_stmt 0
	li	a5,1597464576		# tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:54:     float xhalf = 0.5f * x;
	.loc 1 54 11
	fmul.s	fa0,fa0,fa5	# xhalf_10, x, tmp150
.LVL30:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 25
	sraiw	a4,a4,1	#, tmp144, x
.LVL31:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 20
	addiw	a5,a5,-1569	#, tmp146, tmp157
	subw	a5,a5,a4	# _3, tmp146, tmp144
.LVL32:
	.loc 1 58 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 27 is_stmt 0
	fmv.s.x	fa4,a5	# tmp160, _3
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 19
	lui	a4,%hi(.LC8)	# tmp154,
	flw	fa5,%lo(.LC8)(a4)	# tmp153,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 27
	fmul.s	fa0,fa0,fa4	# _5, xhalf_10, tmp160
.LVL33:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 19
	fnmsub.s	fa0,fa4,fa0,fa5	# _7, tmp161, _5, tmp153
.LVL34:
	.loc 1 59 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:60: }
	.loc 1 60 1 is_stmt 0
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
	.loc 1 63 28 is_stmt 1
	.cfi_startproc
.LVL36:
	.loc 1 64 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:64:     if (x <= 0.0f) return 0.0f;
	.loc 1 64 8 is_stmt 0
	fmv.s.x	fa5,zero	# tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:63: float sqrt_approx(float x) {
	.loc 1 63 28
	fmv.x.s	a5,fa0	# x, tmp160
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:64:     if (x <= 0.0f) return 0.0f;
	.loc 1 64 8
	fmv.s	fa4,fa0	# x, x
	fle.s	a4,fa0,fa5	#, tmp145, x, tmp144
	bne	a4,zero,.L46	#, tmp145,,
	.loc 1 65 5 is_stmt 1
.LVL37:
.LBB47:
.LBB48:
	.loc 1 54 5
	.loc 1 55 5
	.loc 1 56 5
	.loc 1 57 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:54:     float xhalf = 0.5f * x;
	.loc 1 54 11 is_stmt 0
	lui	a4,%hi(.LC7)	# tmp154,
	flw	fa0,%lo(.LC7)(a4)	# tmp153,
.LVL38:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 20
	li	a4,1597464576		# tmp161,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 25
	sraiw	a3,a5,1	#, tmp147, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:54:     float xhalf = 0.5f * x;
	.loc 1 54 11
	fmul.s	fa0,fa4,fa0	# xhalf_4, x, tmp153
.LVL39:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:56:     i = 0x5f3759df - (i >> 1);
	.loc 1 56 20
	addiw	a4,a4,-1569	#, tmp149, tmp161
	subw	a4,a4,a3	# _8, tmp149, tmp147
.LVL40:
	.loc 1 58 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 27 is_stmt 0
	fmv.s.x	fa4,a4	# tmp165, _8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 19
	lui	a3,%hi(.LC8)	# tmp157,
	flw	fa5,%lo(.LC8)(a3)	# tmp156,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 27
	fmul.s	fa0,fa0,fa4	# _10, xhalf_4, tmp165
.LVL41:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 19
	fnmsub.s	fa0,fa4,fa0,fa5	# _12, tmp166, _10, tmp156
.LVL42:
	.loc 1 59 5 is_stmt 1
.LBE48:
.LBE47:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     return x * inv_sqrt(x);
	.loc 1 65 14 is_stmt 0 discriminator 1
	fmv.s.x	fa5,a5	# x, x
.LBB50:
.LBB49:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:58:     x = x * (1.5f - xhalf * x * x);
	.loc 1 58 11
	fmul.s	fa0,fa0,fa4	# _13, _12, tmp167
.LBE49:
.LBE50:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     return x * inv_sqrt(x);
	.loc 1 65 14 discriminator 1
	fmul.s	fa0,fa0,fa5	# <retval>, _13, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:65:     return x * inv_sqrt(x);
	.loc 1 65 14
	ret	
.L46:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:64:     if (x <= 0.0f) return 0.0f;
	.loc 1 64 27 discriminator 1
	fmv.s	fa0,fa5	# <retval>, tmp144
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:66: }
	.loc 1 66 1
	ret	
	.cfi_endproc
.LFE9:
	.size	sqrt_approx, .-sqrt_approx
	.align	1
	.globl	fmod_simple
	.type	fmod_simple, @function
fmod_simple:
.LFB10:
	.loc 1 70 37 is_stmt 1
	.cfi_startproc
.LVL43:
	.loc 1 71 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 24 is_stmt 0
	fdiv.s	fa5,fa0,fa1	# _1, x, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 16
	fcvt.w.s a5,fa5,rtz	# _2, _1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 29
	fcvt.s.w	fa5,a5	# _3, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:72: }
	.loc 1 72 1
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
	.loc 1 75 38 is_stmt 1
	.cfi_startproc
.LVL45:
	.loc 1 76 5
.LBB51:
.LBB52:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 is_stmt 0
	fmv.s.x	fa4,zero	# tmp144,
.LBE52:
.LBE51:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:75: float atan2_approx(float y, float x) {
	.loc 1 75 38
	fmv.s	fa5,fa0	# y, tmp163
.LVL46:
.LBB54:
.LBB53:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 is_stmt 0
	flt.s	a5,fa0,fa4	#, tmp145, y, tmp144
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 discriminator 2
	fmv.s	fa4,fa0	# iftmp.7_11, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23
	beq	a5,zero,.L49	#, tmp145,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 discriminator 1
	fneg.s	fa4,fa0	# iftmp.7_11, y
.L49:
.LVL47:
.LBE53:
.LBE54:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:76:     float abs_y = absf(y) + 1e-10f;  // Prevent division by zero
	.loc 1 76 11 discriminator 1
	lui	a5,%hi(.LC9)	# tmp147,
	flw	fa3,%lo(.LC9)(a5)	# tmp146,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:79:     if (x >= 0) {
	.loc 1 79 8
	fmv.s.x	fa2,zero	# tmp148,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:76:     float abs_y = absf(y) + 1e-10f;  // Prevent division by zero
	.loc 1 76 11 discriminator 1
	fadd.s	fa4,fa4,fa3	# abs_y, iftmp.7_11, tmp146
.LVL48:
	.loc 1 77 5 is_stmt 1
	.loc 1 79 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:79:     if (x >= 0) {
	.loc 1 79 8 is_stmt 0
	fge.s	a5,fa1,fa2	#, tmp149, x, tmp148
.LBB55:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 80 36
	fadd.s	fa3,fa4,fa1	# _22, abs_y, x
.LBE55:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:79:     if (x >= 0) {
	.loc 1 79 8
	beq	a5,zero,.L61	#, tmp149,,
.LBB56:
	.loc 1 80 9 is_stmt 1
.LVL49:
	.loc 1 81 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 80 22 is_stmt 0
	fsub.s	fa1,fa1,fa4	# _1, x, abs_y
.LVL50:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:81:         angle = 0.785398f - 0.785398f * r;  // PI/4
	.loc 1 81 15
	lui	a5,%hi(.LC10)	# tmp153,
	flw	fa0,%lo(.LC10)(a5)	# tmp152,
.LVL51:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:80:         float r = (x - abs_y) / (x + abs_y);
	.loc 1 80 15
	fdiv.s	fa1,fa1,fa3	# r_16, _1, _22
.LVL52:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:81:         angle = 0.785398f - 0.785398f * r;  // PI/4
	.loc 1 81 15
	fnmsub.s	fa0,fa1,fa0,fa0	# <retval>, r_16, tmp152, tmp152
.LVL53:
.L53:
.LBE56:
	.loc 1 87 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:87:     return y < 0 ? -angle : angle;
	.loc 1 87 27 is_stmt 0
	fmv.s.x	fa4,zero	# tmp160,
	flt.s	a5,fa5,fa4	#, tmp161, y, tmp160
	bne	a5,zero,.L62	#, tmp161,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:88: }
	.loc 1 88 1
	ret	
.L62:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:87:     return y < 0 ? -angle : angle;
	.loc 1 87 27 discriminator 1
	fneg.s	fa0,fa0	# <retval>, <retval>
.LVL54:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:88: }
	.loc 1 88 1
	ret	
.LVL55:
.L61:
.LBB57:
	.loc 1 83 9 is_stmt 1
	.loc 1 84 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:83:         float r = (x + abs_y) / (abs_y - x);
	.loc 1 83 40 is_stmt 0
	fsub.s	fa4,fa4,fa1	# _5, abs_y, x
.LVL56:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:84:         angle = 2.356194f - 0.785398f * r;  // 3*PI/4
	.loc 1 84 15
	lui	a4,%hi(.LC10)	# tmp157,
	lui	a5,%hi(.LC11)	# tmp159,
	flw	fa0,%lo(.LC10)(a4)	# tmp156,
.LVL57:
	flw	fa2,%lo(.LC11)(a5)	# tmp158,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:83:         float r = (x + abs_y) / (abs_y - x);
	.loc 1 83 15
	fdiv.s	fa3,fa3,fa4	# r_14, _22, _5
.LVL58:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:84:         angle = 2.356194f - 0.785398f * r;  // 3*PI/4
	.loc 1 84 15
	fnmsub.s	fa0,fa3,fa0,fa2	# <retval>, r_14, tmp156, tmp158
	j	.L53		#
.LBE57:
	.cfi_endproc
.LFE11:
	.size	atan2_approx, .-atan2_approx
	.align	1
	.globl	hsv_to_rgb
	.type	hsv_to_rgb, @function
hsv_to_rgb:
.LFB12:
	.loc 1 91 48 is_stmt 1
	.cfi_startproc
.LVL59:
	.loc 1 92 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:93:     float h_prime = h / 60.0f;
	.loc 1 93 11 is_stmt 0
	lui	a5,%hi(.LC12)	# tmp228,
	flw	fa5,%lo(.LC12)(a5)	# tmp166,
.LBB58:
.LBB59:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 24
	lui	a4,%hi(.LC7)	# tmp170,
	flw	fa4,%lo(.LC7)(a4)	# tmp169,
.LBE59:
.LBE58:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:93:     float h_prime = h / 60.0f;
	.loc 1 93 11
	fdiv.s	fa5,fa0,fa5	# h_prime, h, tmp166
.LBB62:
.LBB60:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 14
	lui	a4,%hi(.LC13)	# tmp174,
	flw	ft1,%lo(.LC13)(a4)	# tmp173,
.LBE60:
.LBE62:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:95:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 95 27
	lui	a4,%hi(.LC5)	# tmp227,
	flw	ft0,%lo(.LC5)(a4)	# tmp175,
.LBB63:
.LBB64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23
	fmv.s.x	fa3,zero	# tmp177,
.LBE64:
.LBE63:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:92:     float c = v * s;
	.loc 1 92 11
	fmul.s	fa1,fa2,fa1	# c, v, tmp230
.LVL60:
	.loc 1 93 5 is_stmt 1
	.loc 1 94 5
.LBB66:
.LBB61:
	.loc 1 71 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 24 is_stmt 0
	fmul.s	fa4,fa5,fa4	# _33, h_prime, tmp169
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 16
	fcvt.w.s a3,fa4,rtz	# _34, _33
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 29
	fcvt.s.w	fa4,a3	# _35, _34
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:71:     return x - (int)(x / y) * y;
	.loc 1 71 14
	fnmsub.s	fa4,fa4,ft1,fa5	# _37, _35, tmp173, h_prime
.LVL61:
.LBE61:
.LBE66:
	.loc 1 95 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:95:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 95 27 is_stmt 0
	fsub.s	fa4,fa4,ft0	# _1, _37, tmp175
.LVL62:
.LBB67:
.LBB65:
	.loc 1 49 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 is_stmt 0
	flt.s	a3,fa4,fa3	#, tmp178, _1, tmp177
	beq	a3,zero,.L64	#, tmp178,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:49:     return x < 0 ? -x : x;
	.loc 1 49 23 discriminator 1
	fneg.s	fa4,fa4	# _1, _1
.LVL63:
.L64:
.LBE65:
.LBE67:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:95:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 95 25 discriminator 1
	flw	fa5,%lo(.LC5)(a4)	# tmp180,
.LVL64:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:100:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 100 8
	flw	fa3,%lo(.LC12)(a5)	# tmp182,
.LVL65:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:96:     float m = v - c;
	.loc 1 96 11
	fsub.s	fa2,fa2,fa1	# m, v, c
.LVL66:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:95:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 95 25 discriminator 1
	fsub.s	fa5,fa5,fa4	# _2, tmp180, _1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:100:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 100 8
	flt.s	a5,fa0,fa3	#, tmp184, h, tmp182
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:100:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 100 35 discriminator 1
	fmv.s.x	fa4,zero	# b,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:95:     float x = c * (1.0f - absf(x_val - 1.0f));
	.loc 1 95 11 discriminator 1
	fmul.s	fa5,fa5,fa1	# x, _2, c
.LVL67:
	.loc 1 96 5 is_stmt 1
	.loc 1 98 5
	.loc 1 100 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:100:     if (h < 60) { r = c; g = x; b = 0; }
	.loc 1 100 8 is_stmt 0
	bne	a5,zero,.L66	#, tmp184,,
	.loc 1 101 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 101 13 is_stmt 0
	lui	a5,%hi(.LC14)	# tmp186,
	flw	fa3,%lo(.LC14)(a5)	# tmp185,
.LVL68:
	flt.s	a5,fa0,fa3	#, tmp187, h, tmp185
	beq	a5,zero,.L77	#, tmp187,,
	fmv.s	fa3,fa1	# c, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 101 27 discriminator 1
	fmv.s	fa1,fa5	# c, x
.LVL69:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:101:     else if (h < 120) { r = x; g = c; b = 0; }
	.loc 1 101 34 discriminator 1
	fmv.s	fa5,fa3	# x, c
.LVL70:
.L66:
	.loc 1 107 5 is_stmt 1
	.loc 1 108 5
	.loc 1 109 5
	.loc 1 111 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:107:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 107 31 is_stmt 0
	fadd.s	fa1,fa1,fa2	# _3, c, m
.LVL71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 108 31
	fadd.s	fa5,fa5,fa2	# _5, x, m
.LVL72:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:107:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 107 36
	lui	a5,%hi(.LC18)	# tmp201,
	flw	fa3,%lo(.LC18)(a5)	# tmp200,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 109 31
	fadd.s	fa4,fa4,fa2	# _7, b, m
.LVL73:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:107:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 107 36
	fmul.s	fa1,fa1,fa3	# _4, _3, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 108 36
	fmul.s	fa5,fa5,fa3	# _6, _5, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 109 36
	fmul.s	fa4,fa4,fa3	# _8, _7, tmp200
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:107:     uint8_t ri = (uint8_t)((r + m) * 255);
	.loc 1 107 13
	fcvt.wu.s a5,fa1,rtz	# tmp203, _4
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:108:     uint8_t gi = (uint8_t)((g + m) * 255);
	.loc 1 108 13
	fcvt.wu.s a4,fa5,rtz	# tmp212, _6
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:109:     uint8_t bi = (uint8_t)((b + m) * 255);
	.loc 1 109 13
	fcvt.wu.s a0,fa4,rtz	# tmp222, _8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:111:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 111 16
	andi	a5,a5,0xff	# _9, tmp203
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:111:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 111 29
	andi	a4,a4,0xff	# _11, tmp212
	slliw	a4,a4,8	#, tmp215, _11
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:111:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 111 16
	slliw	a5,a5,16	#, tmp206, _9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:111:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 111 23
	or	a5,a5,a4	# tmp215, tmp216, tmp206
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:111:     return (ri << 16) | (gi << 8) | bi;
	.loc 1 111 35
	andi	a0,a0,0xff	# tmp225, tmp222
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:112: }
	.loc 1 112 1
	or	a0,a0,a5	# tmp216,, tmp225
	ret	
.LVL74:
.L77:
	.loc 1 102 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 102 13 is_stmt 0
	lui	a5,%hi(.LC15)	# tmp189,
	flw	fa4,%lo(.LC15)(a5)	# tmp188,
	flt.s	a5,fa0,fa4	#, tmp190, h, tmp188
	bne	a5,zero,.L70	#, tmp190,,
	.loc 1 103 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 103 13 is_stmt 0
	lui	a5,%hi(.LC16)	# tmp192,
	flw	fa4,%lo(.LC16)(a5)	# tmp191,
	flt.s	a5,fa0,fa4	#, tmp193, h, tmp191
	bne	a5,zero,.L71	#, tmp193,,
	.loc 1 104 10 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 104 13 is_stmt 0
	lui	a5,%hi(.LC17)	# tmp195,
	flw	fa4,%lo(.LC17)(a5)	# tmp194,
	flt.s	a5,fa0,fa4	#, tmp196, h, tmp194
	beq	a5,zero,.L75	#, tmp196,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 104 41 discriminator 1
	fmv.s	fa4,fa1	# b, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 104 27 discriminator 1
	fmv.s	fa1,fa5	# c, x
.LVL75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:104:     else if (h < 300) { r = x; g = 0; b = c; }
	.loc 1 104 34 discriminator 1
	fmv.s.x	fa5,zero	# x,
.LVL76:
	j	.L66		#
.LVL77:
.L70:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 102 41 discriminator 1
	fmv.s	fa4,fa5	# b, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 102 34 discriminator 1
	fmv.s	fa5,fa1	# x, c
.LVL78:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:102:     else if (h < 180) { r = 0; g = c; b = x; }
	.loc 1 102 27 discriminator 1
	fmv.s.x	fa1,zero	# c,
.LVL79:
	j	.L66		#
.LVL80:
.L71:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 103 41 discriminator 1
	fmv.s	fa4,fa1	# b, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:103:     else if (h < 240) { r = 0; g = x; b = c; }
	.loc 1 103 27 discriminator 1
	fmv.s.x	fa1,zero	# c,
.LVL81:
	j	.L66		#
.LVL82:
.L75:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else { r = c; g = 0; b = x; }
	.loc 1 105 28
	fmv.s	fa4,fa5	# b, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:105:     else { r = c; g = 0; b = x; }
	.loc 1 105 21
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
	.loc 1 115 25 is_stmt 1
	.cfi_startproc
	.loc 1 116 5
	lui	a0,%hi(.LC19)	# tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:115: void init_display(void) {
	.loc 1 115 25 is_stmt 0
	addi	sp,sp,-16	#,,
	.cfi_def_cfa_offset 16
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:116:     printf("Initializing display...\n");
	.loc 1 116 5
	addi	a0,a0,%lo(.LC19)	#, tmp144,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:115: void init_display(void) {
	.loc 1 115 25
	sd	ra,8(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:116:     printf("Initializing display...\n");
	.loc 1 116 5
	call	puts		#
.LVL84:
	.loc 1 118 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:118:     uint32_t status = get_display_status();
	.loc 1 118 23 is_stmt 0
	call	get_display_status		#
.LVL85:
	.loc 1 119 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:119:     if (!(status & 0x2)) {
	.loc 1 119 8 is_stmt 0
	andi	a0,a0,2	#, tmp149, tmp165
.LVL86:
	beq	a0,zero,.L83	#, tmp149,,
	.loc 1 124 5 is_stmt 1
	sd	s0,0(sp)	#,
	.cfi_offset 8, -16
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:124:     display_width = (int)get_display_width();
	.loc 1 124 26 is_stmt 0
	call	get_display_width		#
.LVL87:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:124:     display_width = (int)get_display_width();
	.loc 1 124 19 discriminator 1
	lui	s0,%hi(display_width)	# tmp152,
	sw	a0,%lo(display_width)(s0)	# tmp166, display_width
	.loc 1 125 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_height = (int)get_display_height();
	.loc 1 125 27 is_stmt 0
	call	get_display_height		#
.LVL88:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:131:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 131 5
	lw	a1,%lo(display_width)(s0)		#, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_height = (int)get_display_height();
	.loc 1 125 27
	mv	a2,a0	# tmp153, tmp167
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:131:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 131 5
	lui	a0,%hi(.LC21)	# tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_height = (int)get_display_height();
	.loc 1 125 20 discriminator 1
	lui	a5,%hi(display_height)	# tmp154,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:131:     printf("Display resolution: %lux%lu\n", width, height);
	.loc 1 131 5
	addi	a0,a0,%lo(.LC21)	#, tmp157,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:125:     display_height = (int)get_display_height();
	.loc 1 125 20 discriminator 1
	sw	a2,%lo(display_height)(a5)	# tmp153, display_height
	.loc 1 128 5 is_stmt 1
.LVL89:
	.loc 1 129 5
	.loc 1 131 5
	call	printf		#
.LVL90:
	.loc 1 133 5
	li	a0,1		#,
	call	set_display_enable		#
.LVL91:
	.loc 1 134 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:134:     status = get_display_status();
	.loc 1 134 14 is_stmt 0
	call	get_display_status		#
.LVL92:
	.loc 1 135 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:135:     if (status & 0x1) {
	.loc 1 135 8 is_stmt 0
	andi	a0,a0,1	#, tmp162, tmp168
.LVL93:
	bne	a0,zero,.L84	#, tmp162,,
	.loc 1 139 9 is_stmt 1
	ld	s0,0(sp)		#,
	.cfi_remember_state
	.cfi_restore 8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1 is_stmt 0
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:139:         printf("Warning: Display not ready\n");
	.loc 1 139 9
	lui	a0,%hi(.LC23)	# tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:139:         printf("Warning: Display not ready\n");
	.loc 1 139 9
	addi	a0,a0,%lo(.LC23)	#, tmp164,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:139:         printf("Warning: Display not ready\n");
	.loc 1 139 9
	tail	puts		#
.LVL94:
.L84:
	.cfi_restore_state
	.loc 1 136 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:139:         printf("Warning: Display not ready\n");
	.loc 1 139 9 is_stmt 0
	ld	s0,0(sp)		#,
	.cfi_restore 8
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:136:         printf("Display enabled successfully\n");
	.loc 1 136 9
	lui	a0,%hi(.LC22)	# tmp163,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:136:         printf("Display enabled successfully\n");
	.loc 1 136 9
	addi	a0,a0,%lo(.LC22)	#, tmp163,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:139:         printf("Warning: Display not ready\n");
	.loc 1 139 9
	tail	puts		#
.LVL95:
.L83:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -8
	.loc 1 120 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1 is_stmt 0
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:120:         printf("Warning: Display not ready.\n");
	.loc 1 120 9
	lui	a0,%hi(.LC20)	# tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:120:         printf("Warning: Display not ready.\n");
	.loc 1 120 9
	addi	a0,a0,%lo(.LC20)	#, tmp150,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:141: }
	.loc 1 141 1
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:120:         printf("Warning: Display not ready.\n");
	.loc 1 120 9
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
	.loc 1 144 34 is_stmt 1
	.cfi_startproc
	.loc 1 145 5
.LVL97:
.LBB91:
.LBB92:
	.loc 1 23 5
	.loc 1 24 5
	.loc 1 25 5
.LBE92:
.LBE91:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:144: void run_frame_buffer_test(void) {
	.loc 1 144 34 is_stmt 0
	addi	sp,sp,-80	#,,
	.cfi_def_cfa_offset 80
	sd	s0,64(sp)	#,
	sd	s2,48(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 18, -32
.LBB98:
.LBB95:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t height = display_height;
	.loc 1 24 14
	lui	s0,%hi(display_height)	# tmp337,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:23:     uint32_t width = display_width;
	.loc 1 23 14
	lui	s2,%hi(display_width)	# tmp341,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t total = width * height;
	.loc 1 25 14
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	lw	a4,%lo(display_height)(s0)		# display_height, display_height
.LBE95:
.LBE98:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:144: void run_frame_buffer_test(void) {
	.loc 1 144 34
	sd	ra,72(sp)	#,
	sd	s3,40(sp)	#,
.LBB99:
.LBB96:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t total = width * height;
	.loc 1 25 14
	mulw	a4,a4,a5	# tmp215, display_height, display_width
.LVL98:
	.loc 1 27 5 is_stmt 1
.LBB93:
	.loc 1 27 10
	.loc 1 27 28 discriminator 1
.LBE93:
.LBE96:
.LBE99:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:144: void run_frame_buffer_test(void) {
	.loc 1 144 34 is_stmt 0
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
.LBB100:
.LBB97:
.LBB94:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:27:     for (uint32_t i = 0; i < total; i++) {
	.loc 1 27 28 discriminator 1
	beq	a4,zero,.L90	#, tmp215,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 20
	lui	a5,%hi(framebuffer)	# tmp228,
	ld	a5,%lo(framebuffer)(a5)		# ivtmp.139, framebuffer
	slli	a3,a4,32	#, tmp346, tmp215
	srli	a4,a3,30	#, _130, tmp346
.LVL99:
	add	a4,a4,a5	# ivtmp.139, _128, _130
.LVL100:
.L89:
	.loc 1 28 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 24 is_stmt 0
	sw	zero,0(a5)	#, *_105
	.loc 1 27 38 is_stmt 1 discriminator 3
.LVL101:
	.loc 1 27 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.139, ivtmp.139
.LVL102:
	bne	a5,a4,.L89	#, ivtmp.139, _128,
.LVL103:
.L90:
.LBE94:
.LBE97:
.LBE100:
	.loc 1 147 5
	lui	a0,%hi(.LC24)	# tmp216,
	addi	a0,a0,%lo(.LC24)	#, tmp216,
	call	puts		#
.LVL104:
	.loc 1 149 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:150:     uint32_t height = display_height;
	.loc 1 150 14 is_stmt 0
	lw	s4,%lo(display_height)(s0)		# height, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:155:     printf("Test 1: Red gradient\n");
	.loc 1 155 5
	lui	a0,%hi(.LC25)	# tmp221,
	addi	a0,a0,%lo(.LC25)	#, tmp221,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:152:     uint32_t section_height = height / 4;
	.loc 1 152 14
	srliw	s7,s4,2	# tmp220, height,
.LBB101:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:174:     for (uint32_t y = section_height * 2; y < section_height * 3; y++) {
	.loc 1 174 62 discriminator 1
	slliw	s8,s7,1	#, tmp338, tmp220
	addw	s5,s8,s7	# tmp220, tmp227, tmp338
.LBE101:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:149:     uint32_t width = display_width;
	.loc 1 149 14
	lw	s0,%lo(display_width)(s2)		# width, display_width
.LVL105:
	.loc 1 150 5 is_stmt 1
	.loc 1 152 5
	.loc 1 155 5
.LBB112:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:174:     for (uint32_t y = section_height * 2; y < section_height * 3; y++) {
	.loc 1 174 62 is_stmt 0 discriminator 1
	mv	s3,s5	# y, tmp227
.LBE112:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:155:     printf("Test 1: Red gradient\n");
	.loc 1 155 5
	call	puts		#
.LVL106:
	.loc 1 156 5 is_stmt 1
.LBB113:
	.loc 1 156 10
	.loc 1 156 28 discriminator 1
	beq	s7,zero,.L131	#, tmp220,,
	sd	s1,56(sp)	#,
	sd	s6,16(sp)	#,
	.cfi_offset 9, -24
	.cfi_offset 22, -64
.LBB114:
.LBB115:
.LBB116:
.LBB117:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16 is_stmt 0
	lui	s1,%hi(framebuffer)	# tmp340,
	ld	a0,%lo(framebuffer)(s1)		# framebuffer.1_61, framebuffer
.LVL107:
.LBE117:
.LBE116:
.LBE115:
	.loc 1 157 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L91	#, width,,
	li	a1,0		# y,
.LBB126:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:159:             set_pixel(x, y, intensity << 16);
	.loc 1 159 13 is_stmt 0
	li	a6,16711680		# tmp238,
.LVL108:
.L93:
.LBE126:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:157:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 157 32 discriminator 1
	li	a2,0		# ivtmp.132,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:157:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 157 23
	li	a3,0		# x,
.L92:
.LVL109:
.LBB127:
	.loc 1 158 13 is_stmt 1
	.loc 1 159 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:158:             uint8_t intensity = (x * 255) / width;
	.loc 1 158 43 is_stmt 0
	divuw	a4,a2,s0	# width, tmp234, ivtmp.132
.LBB122:
.LBB118:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
.LBE118:
.LBE122:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:159:             set_pixel(x, y, intensity << 16);
	.loc 1 159 13
	addiw	a2,a2,255	#, ivtmp.132, ivtmp.132
.LVL110:
.LBB123:
.LBB119:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	mulw	a5,a5,a1	# tmp243, display_width, y
.LBE119:
.LBE123:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:159:             set_pixel(x, y, intensity << 16);
	.loc 1 159 13
	slliw	a4,a4,16	#, tmp236, tmp234
	and	a4,a4,a6	# tmp238, _5, tmp236
.LVL111:
.LBB124:
.LBB120:
	.loc 1 18 5 is_stmt 1
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp245, tmp243
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a7,a5,32	#, tmp347, tmp245
	srli	a5,a7,30	#, _65, tmp347
	add	a5,a0,a5	# _65, _66, framebuffer.1_61
.LBE120:
.LBE124:
.LBE127:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:157:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 157 42 discriminator 3
	addiw	a3,a3,1	#, x, x
.LVL112:
.LBB128:
.LBB125:
.LBB121:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a4,0(a5)	# _5, *_66
.LVL113:
.LBE121:
.LBE125:
.LBE128:
	.loc 1 157 42 is_stmt 1 discriminator 3
	.loc 1 157 32 discriminator 1
	bne	s0,a3,.L92	#, width, x,
.LBE114:
	.loc 1 156 47 discriminator 2
	addiw	a1,a1,1	#, y, y
.LVL114:
	.loc 1 156 28 discriminator 1
	bne	s7,a1,.L93	#, tmp220, y,
.LVL115:
.L91:
.LBE113:
	.loc 1 164 5
	lui	a0,%hi(.LC26)	# tmp256,
	addi	a0,a0,%lo(.LC26)	#, tmp256,
	call	puts		#
.LVL116:
	.loc 1 165 5
.LBB129:
	.loc 1 165 10
	.loc 1 165 41 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:165:     for (uint32_t y = section_height; y < section_height * 2; y++) {
	.loc 1 165 58 is_stmt 0 discriminator 1
	mv	s6,s8	# y, tmp338
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:165:     for (uint32_t y = section_height; y < section_height * 2; y++) {
	.loc 1 165 41 discriminator 1
	bgeu	s7,s8,.L95	#, tmp220, tmp338,
.LBB130:
.LBB131:
.LBB132:
.LBB133:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	ld	a1,%lo(framebuffer)(s1)		# framebuffer.1_69, framebuffer
.LVL117:
.LBE133:
.LBE132:
.LBE131:
	.loc 1 166 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L95	#, width,,
	mv	a2,s7	# y, tmp220
	li	a6,0		# ivtmp.128,
.LVL118:
.L97:
.LBB136:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:167:             uint8_t intensity = ((y - section_height) * 255) / section_height;
	.loc 1 167 62 is_stmt 0
	divuw	a3,a6,s7	# tmp220, tmp262, ivtmp.128
.LBE136:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:166:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 166 23
	li	a4,0		# x,
.LBB137:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:168:             set_pixel(x, y, intensity << 8);
	.loc 1 168 13
	slliw	a3,a3,8	#, tmp264, tmp262
	slli	a3,a3,48	#, _16, tmp264
	srli	a3,a3,48	#, _16, _16
	sext.w	a3,a3	# _10, _16
.L96:
.LVL119:
	.loc 1 167 13 is_stmt 1
	.loc 1 168 13
.LBB135:
.LBB134:
	.loc 1 18 5
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19 is_stmt 0
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	mulw	a5,a5,a2	# tmp270, display_width, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27
	addw	a5,a5,a4	# x, tmp272, tmp270
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a0,a5,32	#, tmp348, tmp272
	srli	a5,a0,30	#, _73, tmp348
	add	a5,a1,a5	# _73, _74, framebuffer.1_69
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a3,0(a5)	# _10, *_74
.LVL120:
.LBE134:
.LBE135:
.LBE137:
	.loc 1 166 42 is_stmt 1 discriminator 3
	addiw	a4,a4,1	#, x, x
.LVL121:
	.loc 1 166 32 discriminator 1
	bne	s0,a4,.L96	#, width, x,
.LBE130:
	.loc 1 165 64 discriminator 2
	addiw	a2,a2,1	#, y, y
.LVL122:
	.loc 1 165 41 discriminator 1
	addiw	a6,a6,255	#, ivtmp.128, ivtmp.128
.LVL123:
	bne	s8,a2,.L97	#, tmp338, y,
.LVL124:
.L95:
.LBE129:
	.loc 1 173 5
	lui	a0,%hi(.LC27)	# tmp281,
	addi	a0,a0,%lo(.LC27)	#, tmp281,
	call	puts		#
.LVL125:
	.loc 1 174 5
.LBB138:
	.loc 1 174 10
	.loc 1 174 45 discriminator 1
	bgeu	s8,s5,.L130	#, tmp338, tmp227,
.LBB102:
.LBB103:
.LBB104:
.LBB105:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16 is_stmt 0
	ld	a1,%lo(framebuffer)(s1)		# framebuffer.1_77, framebuffer
.LVL126:
.LBE105:
.LBE104:
.LBE103:
	.loc 1 175 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L130	#, width,,
	addw	a0,s0,s5	# tmp227, tmp339, width
.LVL127:
.L100:
	slliw	a2,s6,8	#, tmp288, y
	subw	a2,a2,s6	# ivtmp.115, tmp288, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:175:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 175 23 is_stmt 0
	li	a3,0		# x,
.L99:
.LVL128:
.LBB110:
	.loc 1 176 13 is_stmt 1
	.loc 1 177 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:176:             uint8_t intensity = ((x + y) * 255) / (width + section_height * 3);
	.loc 1 176 49 is_stmt 0
	divuw	a4,a2,a0	# tmp339, tmp293, ivtmp.115
.LBB108:
.LBB106:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
	addiw	a2,a2,255	#, ivtmp.115, ivtmp.115
.LVL129:
	mulw	a5,a5,s6	# tmp299, display_width, y
	andi	a4,a4,0xff	# _87, tmp293
.LVL130:
	.loc 1 18 5 is_stmt 1
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp301, tmp299
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a6,a5,32	#, tmp349, tmp301
	srli	a5,a6,30	#, _81, tmp349
	add	a5,a1,a5	# _81, _82, framebuffer.1_77
.LBE106:
.LBE108:
.LBE110:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:175:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 175 42 discriminator 3
	addiw	a3,a3,1	#, x, x
.LVL131:
.LBB111:
.LBB109:
.LBB107:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a4,0(a5)	# _87, *_82
.LVL132:
.LBE107:
.LBE109:
.LBE111:
	.loc 1 175 42 is_stmt 1 discriminator 3
	.loc 1 175 32 discriminator 1
	bne	s0,a3,.L99	#, width, x,
.LBE102:
	.loc 1 174 68 discriminator 2
	addiw	s6,s6,1	#, y, y
.LVL133:
	.loc 1 174 45 discriminator 1
	bne	s6,s5,.L100	#, y, tmp227,
.LVL134:
.L130:
	ld	s1,56(sp)		#,
	.cfi_restore 9
	ld	s6,16(sp)		#,
	.cfi_restore 22
.L94:
.LBE138:
	.loc 1 182 5
	lui	a0,%hi(.LC28)	# tmp310,
	addi	a0,a0,%lo(.LC28)	#, tmp310,
	call	puts		#
.LVL135:
	.loc 1 183 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:183:     uint32_t checker_size = width / 16;  // Scale with resolution
	.loc 1 183 14 is_stmt 0
	srliw	a2,s0,4	# tmp312, width,
.LVL136:
	.loc 1 184 5 is_stmt 1
.LBB139:
	.loc 1 184 10
	.loc 1 184 45 discriminator 1
	bleu	s4,s5,.L101	#, height, tmp227,
.LBB140:
.LBB141:
.LBB142:
.LBB143:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16 is_stmt 0
	lui	a5,%hi(framebuffer)	# tmp313,
	ld	a0,%lo(framebuffer)(a5)		# framebuffer.1_85, framebuffer
.LVL137:
.LBE143:
.LBE142:
.LBE141:
	.loc 1 185 32 is_stmt 1 discriminator 1
	beq	s0,zero,.L101	#, width,,
.LBB150:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 187 49 is_stmt 0 discriminator 1
	li	a7,16777216		# tmp342,
	addi	a7,a7,-1	#, iftmp.26_167, tmp342
.LVL138:
.L104:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:186:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 186 52
	divuw	a1,s3,a2	# tmp312, tmp316, y
.LBE150:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:185:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 185 23
	li	a3,0		# x,
.L103:
.LVL139:
.LBB151:
	.loc 1 186 13 is_stmt 1
.LBB147:
.LBB144:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19 is_stmt 0
	lw	a5,%lo(display_width)(s2)		# display_width, display_width
.LBE144:
.LBE147:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:186:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 186 31
	divuw	a4,a3,a2	# tmp312, tmp319, x
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:186:             int checker = ((x / checker_size) + (y / checker_size)) & 1;
	.loc 1 186 47
	addw	a4,a4,a1	# tmp316, tmp321, tmp319
	andi	a4,a4,1	#, iftmp.26_167, tmp321
.LVL140:
	.loc 1 187 13 is_stmt 1
.LBB148:
.LBB145:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19 is_stmt 0
	mulw	a5,a5,s3	# tmp327, display_width, y
.LBE145:
.LBE148:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 187 49
	beq	a4,zero,.L102	#, iftmp.26_167,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:187:             uint32_t color = checker ? 0xFFFFFF : 0x000000;
	.loc 1 187 49 discriminator 1
	mv	a4,a7	# iftmp.26_167, iftmp.26_167
.LVL141:
.L102:
	.loc 1 188 13 is_stmt 1
.LBB149:
.LBB146:
	.loc 1 18 5
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27 is_stmt 0
	addw	a5,a5,a3	# x, tmp329, tmp327
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a6,a5,32	#, tmp350, tmp329
	srli	a5,a6,30	#, _161, tmp350
	add	a5,a0,a5	# _161, _160, framebuffer.1_85
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a4,0(a5)	# iftmp.26_167, *_160
.LVL142:
.LBE146:
.LBE149:
.LBE151:
	.loc 1 185 42 is_stmt 1 discriminator 2
	addiw	a3,a3,1	#, x, x
.LVL143:
	.loc 1 185 32 discriminator 1
	bne	s0,a3,.L103	#, width, x,
.LBE140:
	.loc 1 184 56 discriminator 2
	addiw	s3,s3,1	#, y, y
.LVL144:
	.loc 1 184 45 discriminator 1
	bne	s4,s3,.L104	#, height, y,
.LVL145:
.L101:
.LBE139:
	.loc 1 192 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193: }
	.loc 1 193 1 is_stmt 0
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
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:192:     printf("Framebuffer test complete!\n");
	.loc 1 192 5
	lui	a0,%hi(.LC29)	# tmp336,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193: }
	.loc 1 193 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:192:     printf("Framebuffer test complete!\n");
	.loc 1 192 5
	addi	a0,a0,%lo(.LC29)	#, tmp336,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:193: }
	.loc 1 193 1
	addi	sp,sp,80	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:192:     printf("Framebuffer test complete!\n");
	.loc 1 192 5
	tail	puts		#
.LVL149:
.L131:
	.cfi_restore_state
	.loc 1 164 5 is_stmt 1
	lui	a0,%hi(.LC26)	# tmp254,
	addi	a0,a0,%lo(.LC26)	#, tmp254,
	call	puts		#
.LVL150:
	.loc 1 165 5
.LBB152:
	.loc 1 165 10
	.loc 1 165 41 discriminator 1
.LBE152:
	.loc 1 173 5
	lui	a0,%hi(.LC27)	# tmp255,
	addi	a0,a0,%lo(.LC27)	#, tmp255,
	call	puts		#
.LVL151:
	.loc 1 174 5
.LBB153:
	.loc 1 174 10
	.loc 1 174 45 discriminator 1
	j	.L94		#
.LBE153:
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
	.loc 1 196 30
	.cfi_startproc
	.loc 1 197 5
.LVL152:
.LBB162:
.LBB163:
	.loc 1 23 5
	.loc 1 24 5
	.loc 1 25 5
.LBE163:
.LBE162:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:196: void draw_cool_pattern(void) {
	.loc 1 196 30 is_stmt 0
	addi	sp,sp,-160	#,,
	.cfi_def_cfa_offset 160
	sd	s0,144(sp)	#,
	sd	s9,72(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 25, -88
.LBB169:
.LBB166:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:24:     uint32_t height = display_height;
	.loc 1 24 14
	lui	s0,%hi(display_height)	# tmp324,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:23:     uint32_t width = display_width;
	.loc 1 23 14
	lui	s9,%hi(display_width)	# tmp323,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t total = width * height;
	.loc 1 25 14
	lw	a5,%lo(display_width)(s9)		# display_width, display_width
	lw	a4,%lo(display_height)(s0)		# display_height, display_height
.LBE166:
.LBE169:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:196: void draw_cool_pattern(void) {
	.loc 1 196 30
	sd	ra,152(sp)	#,
	sd	s4,112(sp)	#,
.LBB170:
.LBB167:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:25:     uint32_t total = width * height;
	.loc 1 25 14
	mulw	a4,a4,a5	# tmp207, display_height, display_width
.LVL153:
	.loc 1 27 5 is_stmt 1
.LBB164:
	.loc 1 27 10
	.loc 1 27 28 discriminator 1
.LBE164:
.LBE167:
.LBE170:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:196: void draw_cool_pattern(void) {
	.loc 1 196 30 is_stmt 0
	sd	s8,80(sp)	#,
	sd	s10,64(sp)	#,
	.cfi_offset 1, -8
	.cfi_offset 20, -48
	.cfi_offset 24, -80
	.cfi_offset 26, -96
.LBB171:
.LBB168:
.LBB165:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:27:     for (uint32_t i = 0; i < total; i++) {
	.loc 1 27 28 discriminator 1
	beq	a4,zero,.L137	#, tmp207,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 20
	lui	s10,%hi(framebuffer)	# tmp326,
	ld	a5,%lo(framebuffer)(s10)		# ivtmp.163, framebuffer
	slli	a3,a4,32	#, tmp330, tmp207
	srli	a4,a3,30	#, _130, tmp330
.LVL154:
	add	a4,a4,a5	# ivtmp.163, _128, _130
.LVL155:
.L136:
	.loc 1 28 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:28:         framebuffer[i] = color;
	.loc 1 28 24 is_stmt 0
	sw	zero,0(a5)	#, *_78
	.loc 1 27 38 is_stmt 1 discriminator 3
.LVL156:
	.loc 1 27 28 discriminator 1
	addi	a5,a5,4	#, ivtmp.163, ivtmp.163
.LVL157:
	bne	a4,a5,.L136	#, _128, ivtmp.163,
.LVL158:
.L137:
.LBE165:
.LBE168:
.LBE171:
	.loc 1 199 5
	lui	a0,%hi(.LC30)	# tmp208,
	addi	a0,a0,%lo(.LC30)	#, tmp208,
	call	puts		#
.LVL159:
	.loc 1 201 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:202:     uint32_t height = display_height;
	.loc 1 202 14 is_stmt 0
	lw	t6,%lo(display_height)(s0)		# height, display_height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:201:     uint32_t width = display_width;
	.loc 1 201 14
	lw	s8,%lo(display_width)(s9)		# width, display_width
.LVL160:
	.loc 1 202 5 is_stmt 1
	.loc 1 204 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:205:     int cy = height / 2;
	.loc 1 205 21 is_stmt 0
	srliw	t0,t6,1	# tmp214, height,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:207:     uint32_t total_pixels = width * height;
	.loc 1 207 14
	mulw	t3,s8,t6	# tmp216, width, height
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:204:     int cx = width / 2;
	.loc 1 204 20
	srliw	s4,s8,1	# tmp212, width,
.LVL161:
	.loc 1 205 5 is_stmt 1
	.loc 1 207 5
	.loc 1 208 5
	.loc 1 209 5
	.loc 1 211 5
.LBB172:
	.loc 1 211 10
	.loc 1 211 28 discriminator 1
	beq	t6,zero,.L134	#, height,,
	subw	t6,t6,t0	# tmp220, height, tmp214
.LVL162:
.LBB173:
	.loc 1 212 32 discriminator 1
	negw	a1,t0	# ivtmp.159, tmp214
	beq	s8,zero,.L134	#, width,,
	negw	a5,s4	# tmp325, tmp212
	sd	s11,56(sp)	#,
	li	a0,0		# pixels_done,
	.cfi_offset 27, -104
.LBB174:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 17 is_stmt 0
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
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 17
	addi	s11,s11,1366	#, tmp267, tmp329
.LBE174:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:212:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 212 32 discriminator 1
	li	s1,0		# y,
	li	s3,-1		# percent,
.LBB185:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 33
	li	t5,16711680		# tmp278,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:240:                 printf("Progress: %d0%%\n", percent);
	.loc 1 240 17
	lui	s4,%hi(.LC32)	# tmp327,
.LVL163:
	mv	a2,a1	# ivtmp.159, ivtmp.159
	mv	s5,s8	# width, width
	mv	a3,a0	# pixels_done, pixels_done
	sd	t0,40(sp)	# tmp214, %sfp
	mv	s0,t3	# tmp216, tmp216
	sd	t6,32(sp)	# tmp220, %sfp
	mv	s2,s10	# tmp326, tmp326
.LVL164:
.L135:
	addiw	a4,a3,1	#, tmp232, pixels_done
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:217:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 217 60
	sraiw	a5,a2,31	#, tmp225, ivtmp.159
	ld	s7,24(sp)		# ivtmp.151, %sfp
	slliw	s8,a4,2	#, tmp235, tmp232
	xor	t1,a2,a5	# tmp225, tmp226, ivtmp.159
	addw	s8,s8,a4	# tmp232, tmp237, tmp235
	slliw	s8,s8,1	#, ivtmp.154, tmp237
	subw	t1,t1,a5	# tmp228, tmp226, tmp225
	li	s10,0		# ivtmp.153,
.LBE185:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:212:         for (uint32_t x = 0; x < width; x++) {
	.loc 1 212 23
	li	s6,0		# x,
	mv	a5,s0	# tmp216, tmp216
	mv	a7,s2	# tmp326, tmp326
	mv	s0,s8	# ivtmp.154, ivtmp.154
.LVL165:
	mv	s2,s10	# ivtmp.153, ivtmp.153
	mv	s8,s1	# y, y
	mv	s10,s7	# ivtmp.151, ivtmp.151
	sd	a2,8(sp)	# ivtmp.159, %sfp
	mv	s7,s6	# x, x
	sd	a3,16(sp)	# pixels_done, %sfp
	mv	s6,t1	# tmp228, tmp228
	mv	s1,a5	# tmp216, tmp216
.LVL166:
.L139:
.LBB186:
	.loc 1 213 13 is_stmt 1
	.loc 1 214 13
	.loc 1 217 13
	.loc 1 240 17
	mv	a2,s3	# last_percent, percent
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:238:             int percent = (pixels_done * 10) / total_pixels;
	.loc 1 238 46 is_stmt 0
	divuw	s3,s0,s1	# tmp216, percent, ivtmp.154
.LVL167:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:217:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 217 38
	sraiw	a5,s10,31	#, tmp241, ivtmp.151
	xor	t3,s10,a5	# tmp241, tmp242, ivtmp.151
	subw	t3,t3,a5	# tmp244, tmp242, tmp241
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:220:             int pattern1 = (x + y) & 0xFF;
	.loc 1 220 31
	addw	a4,s8,s7	# x, tmp248, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:217:             int dist = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
	.loc 1 217 17
	addw	t3,t3,s6	# tmp228, tmp246, tmp244
.LVL168:
	.loc 1 220 13 is_stmt 1
	.loc 1 221 13
	.loc 1 222 13
	.loc 1 225 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:220:             int pattern1 = (x + y) & 0xFF;
	.loc 1 220 17 is_stmt 0
	andi	a4,a4,255	#, tmp249, tmp248
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:221:             int pattern2 = (x * y) >> 4;
	.loc 1 221 36
	srliw	a5,s2,4	# tmp251, ivtmp.153,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:222:             int pattern3 = dist & 0xFF;
	.loc 1 222 17
	andi	a3,t3,255	#, tmp254, tmp246
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 38
	addw	a5,a5,a4	# tmp249, tmp253, tmp251
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 49
	addw	a5,a5,a3	# tmp254, tmp256, tmp253
.LBB175:
.LBB176:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	lw	t4,%lo(display_width)(s9)		# display_width, display_width
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	ld	a3,%lo(framebuffer)(a7)		# framebuffer, framebuffer
.LBE176:
.LBE175:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:240:                 printf("Progress: %d0%%\n", percent);
	.loc 1 240 17
	addi	a0,s4,%lo(.LC32)	#, tmp327,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 17
	mul	a5,a5,s11	# tmp266, tmp256, tmp267
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:240:                 printf("Progress: %d0%%\n", percent);
	.loc 1 240 17
	mv	a1,s3	#, percent
.LBB181:
.LBB177:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 19
	mulw	t4,t4,s8	# tmp298, display_width, y
.LBE177:
.LBE181:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:225:             int combined = (pattern1 + pattern2 + pattern3) / 3;
	.loc 1 225 17
	srli	a5,a5,32	#, tmp272, tmp266
.LVL169:
	.loc 1 228 13 is_stmt 1
	.loc 1 229 13
	.loc 1 230 13
	.loc 1 232 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:229:             int g = (combined + y) & 0xFF;
	.loc 1 229 31 is_stmt 0
	addw	t6,s8,a5	# tmp272, tmp280, y
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:228:             int r = (combined + x) & 0xFF;
	.loc 1 228 31
	addw	a4,a5,s7	# x, tmp274, tmp272
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 45
	slliw	t6,t6,8	#, tmp282, tmp280
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 33
	slliw	a4,a4,16	#, tmp276, tmp274
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 45
	slli	t6,t6,48	#, _41, tmp282
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:230:             int b = (combined + dist) & 0xFF;
	.loc 1 230 31
	addw	t3,t3,a5	# tmp272, tmp288, tmp246
.LVL170:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 45
	srli	t6,t6,48	#, _41, _41
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 33
	and	a5,a4,t5	# tmp278, tmp277, tmp276
.LVL171:
.LBB182:
.LBB178:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 27
	addw	t4,t4,s7	# x, tmp300, tmp298
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	slli	a4,t4,32	#, tmp331, tmp300
.LBE178:
.LBE182:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:230:             int b = (combined + dist) & 0xFF;
	.loc 1 230 17
	andi	t3,t3,255	#, tmp289, tmp288
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 40
	or	a5,a5,t6	# _41, tmp286, tmp277
.LBB183:
.LBB179:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16
	srli	t4,a4,30	#, _66, tmp331
.LBE179:
.LBE183:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:232:             uint32_t color = (r << 16) | (g << 8) | b;
	.loc 1 232 22
	or	a5,a5,t3	# tmp289, color, tmp286
.LVL172:
	.loc 1 233 13 is_stmt 1
.LBB184:
.LBB180:
	.loc 1 18 5
	.loc 1 19 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 16 is_stmt 0
	add	a3,a3,t4	# _66, _67, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:19:     framebuffer[y * width + x] = color;
	.loc 1 19 32
	sw	a5,0(a3)	# color, *_67
.LVL173:
.LBE180:
.LBE184:
	.loc 1 235 13 is_stmt 1
	.loc 1 238 13
	.loc 1 239 13
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:239:             if (percent != last_percent) {
	.loc 1 239 16 is_stmt 0
	beq	s3,a2,.L138	#, percent, last_percent,
	sd	a7,0(sp)	# tmp326, %sfp
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:240:                 printf("Progress: %d0%%\n", percent);
	.loc 1 240 17
	call	printf		#
.LVL174:
	ld	a7,0(sp)		# tmp326, %sfp
	li	t5,16711680		# tmp278,
	.loc 1 241 17 is_stmt 1
.L138:
.LVL175:
.LBE186:
	.loc 1 212 42 discriminator 2
	addiw	s7,s7,1	#, x, x
.LVL176:
	.loc 1 212 32 discriminator 1
	addiw	s10,s10,1	#, ivtmp.151, ivtmp.151
.LVL177:
	addw	s2,s8,s2	# ivtmp.153, ivtmp.153, y
.LVL178:
	addiw	s0,s0,10	#, ivtmp.154, ivtmp.154
	bne	s5,s7,.L139	#, width, x,
.LBE173:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:211:     for (uint32_t y = 0; y < height; y++) {
	.loc 1 211 28 is_stmt 0 discriminator 1
	ld	a2,8(sp)		# ivtmp.159, %sfp
	ld	a3,16(sp)		# pixels_done, %sfp
	ld	a5,32(sp)		# tmp220, %sfp
	addiw	a2,a2,1	#, ivtmp.159, ivtmp.159
	mv	s0,s1	# tmp216, tmp216
	mv	s2,a7	# tmp326, tmp326
	addw	a3,s5,a3	# pixels_done, pixels_done, width
	.loc 1 211 39 is_stmt 1 discriminator 2
.LVL179:
	.loc 1 211 28 discriminator 1
	beq	a2,a5,.L147	#, ivtmp.159, tmp220,
.LVL180:
	ld	a5,40(sp)		# tmp214, %sfp
	addw	s1,a5,a2	# ivtmp.159, y, tmp214
.LVL181:
.LBB187:
	.loc 1 212 32 discriminator 1
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
.LBE187:
.LBE172:
	.loc 1 246 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247: }
	.loc 1 247 1 is_stmt 0
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
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:246:     printf("Rendering complete!\n");
	.loc 1 246 5
	lui	a0,%hi(.LC33)	# tmp322,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247: }
	.loc 1 247 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:246:     printf("Rendering complete!\n");
	.loc 1 246 5
	addi	a0,a0,%lo(.LC33)	#, tmp322,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:247: }
	.loc 1 247 1
	addi	sp,sp,160	#,,
	.cfi_def_cfa_offset 0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c:246:     printf("Rendering complete!\n");
	.loc 1 246 5
	tail	puts		#
.LVL187:
	.cfi_endproc
.LFE15:
	.size	draw_cool_pattern, .-draw_cool_pattern
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
	.4byte	0xdc6
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x25
	.4byte	.LASF61
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
	.uleb128 0xf
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
	.uleb128 0x26
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x16
	.4byte	0x5d
	.uleb128 0xf
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x75
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
	.uleb128 0xf
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x43
	.uleb128 0xf
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x69
	.uleb128 0x27
	.4byte	0x96
	.uleb128 0x16
	.4byte	0x96
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
	.uleb128 0x16
	.4byte	0xba
	.uleb128 0x1d
	.4byte	0xc1
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x17
	.4byte	.LASF18
	.byte	0xc
	.byte	0x14
	.4byte	0xe7
	.uleb128 0x9
	.byte	0x3
	.8byte	framebuffer
	.uleb128 0x1d
	.4byte	0xa2
	.uleb128 0x17
	.4byte	.LASF19
	.byte	0xe
	.byte	0x5
	.4byte	0x5d
	.uleb128 0x9
	.byte	0x3
	.8byte	display_width
	.uleb128 0x17
	.4byte	.LASF20
	.byte	0xf
	.byte	0x5
	.4byte	0x5d
	.uleb128 0x9
	.byte	0x3
	.8byte	display_height
	.uleb128 0x28
	.4byte	.LASF21
	.byte	0x4
	.byte	0xc
	.byte	0x6
	.4byte	0x128
	.uleb128 0x1e
	.4byte	0x5d
	.byte	0
	.uleb128 0x29
	.4byte	.LASF49
	.byte	0x5
	.byte	0xce
	.byte	0x5
	.4byte	0x5d
	.4byte	0x13f
	.uleb128 0x1e
	.4byte	0xc6
	.uleb128 0x18
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF22
	.byte	0xb
	.4byte	0x75
	.4byte	0x14f
	.uleb128 0x18
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF23
	.byte	0xa
	.4byte	0x75
	.4byte	0x15f
	.uleb128 0x18
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF62
	.byte	0x4
	.byte	0xd
	.byte	0xe
	.4byte	0x75
	.uleb128 0x19
	.4byte	.LASF36
	.byte	0xc4
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c9
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xc9
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST99
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0xca
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST100
	.uleb128 0x2
	.string	"cx"
	.byte	0xcc
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST101
	.uleb128 0x2
	.string	"cy"
	.byte	0xcd
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST102
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0xcf
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST103
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0xd0
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST104
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0xd1
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST105
	.uleb128 0x10
	.8byte	.LBB172
	.8byte	.LBE172-.LBB172
	.4byte	0x339
	.uleb128 0x2
	.string	"y"
	.byte	0xd3
	.byte	0x13
	.4byte	0x96
	.4byte	.LLST113
	.uleb128 0x6
	.4byte	.LLRL114
	.uleb128 0x2
	.string	"x"
	.byte	0xd4
	.byte	0x17
	.4byte	0x96
	.4byte	.LLST115
	.uleb128 0x6
	.4byte	.LLRL116
	.uleb128 0x2
	.string	"dx"
	.byte	0xd5
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST117
	.uleb128 0x2
	.string	"dy"
	.byte	0xd6
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST118
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0xd9
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST119
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0xdc
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST120
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0xdd
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST121
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0xde
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST122
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0xe1
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST123
	.uleb128 0x2
	.string	"r"
	.byte	0xe4
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST124
	.uleb128 0x2
	.string	"g"
	.byte	0xe5
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST125
	.uleb128 0x2
	.string	"b"
	.byte	0xe6
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST126
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0xe8
	.byte	0x16
	.4byte	0x96
	.4byte	.LLST127
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0xee
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST128
	.uleb128 0x11
	.4byte	0xc3d
	.8byte	.LBB175
	.4byte	.LLRL129
	.byte	0xe9
	.byte	0xd
	.4byte	0x315
	.uleb128 0x3
	.4byte	0xc47
	.4byte	.LLST130
	.uleb128 0x3
	.4byte	0xc50
	.4byte	.LLST131
	.uleb128 0x3
	.4byte	0xc59
	.4byte	.LLST132
	.uleb128 0x6
	.4byte	.LLRL129
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST133
	.byte	0
	.byte	0
	.uleb128 0x20
	.8byte	.LVL174
	.4byte	0x128
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC32
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0xbfb
	.8byte	.LBB162
	.4byte	.LLRL106
	.byte	0xc5
	.byte	0x5
	.4byte	0x38e
	.uleb128 0x3
	.4byte	0xc05
	.4byte	.LLST107
	.uleb128 0x6
	.4byte	.LLRL106
	.uleb128 0x4
	.4byte	0xc10
	.4byte	.LLST108
	.uleb128 0x4
	.4byte	0xc1b
	.4byte	.LLST109
	.uleb128 0x4
	.4byte	0xc26
	.4byte	.LLST110
	.uleb128 0x21
	.4byte	0xc31
	.4byte	.LLRL111
	.uleb128 0x4
	.4byte	0xc32
	.4byte	.LLST112
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.8byte	.LVL159
	.4byte	0xdbe
	.4byte	0x3ad
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC30
	.byte	0
	.uleb128 0x22
	.8byte	.LVL187
	.4byte	0xdbe
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC33
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF37
	.byte	0x90
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b6
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x95
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST49
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x96
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST50
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x98
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST51
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0xb7
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST52
	.uleb128 0x10
	.8byte	.LBB113
	.8byte	.LBE113-.LBB113
	.4byte	0x4b6
	.uleb128 0x2
	.string	"y"
	.byte	0x9c
	.byte	0x13
	.4byte	0x96
	.4byte	.LLST70
	.uleb128 0x12
	.8byte	.LBB114
	.8byte	.LBE114-.LBB114
	.uleb128 0x2
	.string	"x"
	.byte	0x9d
	.byte	0x17
	.4byte	0x96
	.4byte	.LLST71
	.uleb128 0x6
	.4byte	.LLRL72
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x9e
	.byte	0x15
	.4byte	0x8a
	.4byte	.LLST73
	.uleb128 0x9
	.4byte	0xc3d
	.8byte	.LBB116
	.4byte	.LLRL74
	.byte	0x9f
	.byte	0xd
	.uleb128 0x3
	.4byte	0xc47
	.4byte	.LLST75
	.uleb128 0x3
	.4byte	0xc50
	.4byte	.LLST76
	.uleb128 0x3
	.4byte	0xc59
	.4byte	.LLST77
	.uleb128 0x6
	.4byte	.LLRL74
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LLRL79
	.4byte	0x53f
	.uleb128 0x2
	.string	"y"
	.byte	0xa5
	.byte	0x13
	.4byte	0x96
	.4byte	.LLST80
	.uleb128 0x12
	.8byte	.LBB130
	.8byte	.LBE130-.LBB130
	.uleb128 0x2
	.string	"x"
	.byte	0xa6
	.byte	0x17
	.4byte	0x96
	.4byte	.LLST81
	.uleb128 0x6
	.4byte	.LLRL82
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0xa7
	.byte	0x15
	.4byte	0x8a
	.4byte	.LLST83
	.uleb128 0x9
	.4byte	0xc3d
	.8byte	.LBB132
	.4byte	.LLRL84
	.byte	0xa8
	.byte	0xd
	.uleb128 0x3
	.4byte	0xc47
	.4byte	.LLST85
	.uleb128 0x3
	.4byte	0xc50
	.4byte	.LLST86
	.uleb128 0x3
	.4byte	0xc59
	.4byte	.LLST87
	.uleb128 0x6
	.4byte	.LLRL84
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST88
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LLRL60
	.4byte	0x5c8
	.uleb128 0x2
	.string	"y"
	.byte	0xae
	.byte	0x13
	.4byte	0x96
	.4byte	.LLST61
	.uleb128 0x12
	.8byte	.LBB102
	.8byte	.LBE102-.LBB102
	.uleb128 0x2
	.string	"x"
	.byte	0xaf
	.byte	0x17
	.4byte	0x96
	.4byte	.LLST62
	.uleb128 0x6
	.4byte	.LLRL63
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0xb0
	.byte	0x15
	.4byte	0x8a
	.4byte	.LLST64
	.uleb128 0x9
	.4byte	0xc3d
	.8byte	.LBB104
	.4byte	.LLRL65
	.byte	0xb1
	.byte	0xd
	.uleb128 0x3
	.4byte	0xc47
	.4byte	.LLST66
	.uleb128 0x3
	.4byte	0xc50
	.4byte	.LLST67
	.uleb128 0x3
	.4byte	0xc59
	.4byte	.LLST68
	.uleb128 0x6
	.4byte	.LLRL65
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST69
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.8byte	.LBB139
	.8byte	.LBE139-.LBB139
	.4byte	0x66c
	.uleb128 0x2
	.string	"y"
	.byte	0xb8
	.byte	0x13
	.4byte	0x96
	.4byte	.LLST89
	.uleb128 0x12
	.8byte	.LBB140
	.8byte	.LBE140-.LBB140
	.uleb128 0x2
	.string	"x"
	.byte	0xb9
	.byte	0x17
	.4byte	0x96
	.4byte	.LLST90
	.uleb128 0x6
	.4byte	.LLRL91
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0xba
	.byte	0x11
	.4byte	0x5d
	.4byte	.LLST92
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0xbb
	.byte	0x16
	.4byte	0x96
	.4byte	.LLST93
	.uleb128 0x9
	.4byte	0xc3d
	.8byte	.LBB142
	.4byte	.LLRL94
	.byte	0xbc
	.byte	0xd
	.uleb128 0x3
	.4byte	0xc47
	.4byte	.LLST95
	.uleb128 0x3
	.4byte	0xc50
	.4byte	.LLST96
	.uleb128 0x3
	.4byte	0xc59
	.4byte	.LLST97
	.uleb128 0x6
	.4byte	.LLRL94
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST98
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0xbfb
	.8byte	.LBB91
	.4byte	.LLRL53
	.byte	0x91
	.byte	0x5
	.4byte	0x6c1
	.uleb128 0x3
	.4byte	0xc05
	.4byte	.LLST54
	.uleb128 0x6
	.4byte	.LLRL53
	.uleb128 0x4
	.4byte	0xc10
	.4byte	.LLST55
	.uleb128 0x4
	.4byte	0xc1b
	.4byte	.LLST56
	.uleb128 0x4
	.4byte	0xc26
	.4byte	.LLST57
	.uleb128 0x21
	.4byte	0xc31
	.4byte	.LLRL58
	.uleb128 0x4
	.4byte	0xc32
	.4byte	.LLST59
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.8byte	.LVL104
	.4byte	0xdbe
	.4byte	0x6e0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC24
	.byte	0
	.uleb128 0x8
	.8byte	.LVL106
	.4byte	0xdbe
	.4byte	0x6ff
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC25
	.byte	0
	.uleb128 0x8
	.8byte	.LVL116
	.4byte	0xdbe
	.4byte	0x71e
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.uleb128 0x8
	.8byte	.LVL125
	.4byte	0xdbe
	.4byte	0x73d
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC27
	.byte	0
	.uleb128 0x8
	.8byte	.LVL135
	.4byte	0xdbe
	.4byte	0x75c
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC28
	.byte	0
	.uleb128 0x1b
	.8byte	.LVL149
	.4byte	0xdbe
	.4byte	0x77b
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC29
	.byte	0
	.uleb128 0x8
	.8byte	.LVL150
	.4byte	0xdbe
	.4byte	0x79a
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC26
	.byte	0
	.uleb128 0x20
	.8byte	.LVL151
	.4byte	0xdbe
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC27
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF42
	.byte	0x73
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8e2
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x76
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST46
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x80
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST47
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x81
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST48
	.uleb128 0x8
	.8byte	.LVL84
	.4byte	0xdbe
	.4byte	0x81e
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC19
	.byte	0
	.uleb128 0x13
	.8byte	.LVL85
	.4byte	0x15f
	.uleb128 0x13
	.8byte	.LVL87
	.4byte	0x14f
	.uleb128 0x13
	.8byte	.LVL88
	.4byte	0x13f
	.uleb128 0x8
	.8byte	.LVL90
	.4byte	0x128
	.4byte	0x864
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC21
	.byte	0
	.uleb128 0x8
	.8byte	.LVL91
	.4byte	0x116
	.4byte	0x87b
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x13
	.8byte	.LVL92
	.4byte	0x15f
	.uleb128 0x1b
	.8byte	.LVL94
	.4byte	0xdbe
	.4byte	0x8a7
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC23
	.byte	0
	.uleb128 0x1b
	.8byte	.LVL95
	.4byte	0xdbe
	.4byte	0x8c6
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC22
	.byte	0
	.uleb128 0x22
	.8byte	.LVL96
	.4byte	0xdbe
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC20
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x5b
	.byte	0xa
	.4byte	0x96
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa04
	.uleb128 0x2b
	.string	"h"
	.byte	0x1
	.byte	0x5b
	.byte	0x1b
	.4byte	0x2e
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2a
	.uleb128 0xb
	.string	"s"
	.byte	0x5b
	.byte	0x24
	.4byte	0x2e
	.4byte	.LLST30
	.uleb128 0xb
	.string	"v"
	.byte	0x5b
	.byte	0x2d
	.4byte	0x2e
	.4byte	.LLST31
	.uleb128 0x2
	.string	"c"
	.byte	0x5c
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST32
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x5d
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST33
	.uleb128 0xc
	.4byte	.LASF53
	.byte	0x5e
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x2
	.string	"x"
	.byte	0x5f
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST34
	.uleb128 0x2c
	.string	"m"
	.byte	0x1
	.byte	0x60
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2c
	.uleb128 0x2
	.string	"r"
	.byte	0x62
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST35
	.uleb128 0x2
	.string	"g"
	.byte	0x62
	.byte	0xe
	.4byte	0x2e
	.4byte	.LLST36
	.uleb128 0x2
	.string	"b"
	.byte	0x62
	.byte	0x11
	.4byte	0x2e
	.4byte	.LLST37
	.uleb128 0x2
	.string	"ri"
	.byte	0x6b
	.byte	0xd
	.4byte	0x8a
	.4byte	.LLST38
	.uleb128 0x2
	.string	"gi"
	.byte	0x6c
	.byte	0xd
	.4byte	0x8a
	.4byte	.LLST39
	.uleb128 0x2
	.string	"bi"
	.byte	0x6d
	.byte	0xd
	.4byte	0x8a
	.4byte	.LLST40
	.uleb128 0x11
	.4byte	0xab5
	.8byte	.LBB58
	.4byte	.LLRL41
	.byte	0x5e
	.byte	0x13
	.4byte	0x9e6
	.uleb128 0x3
	.4byte	0xac3
	.4byte	.LLST42
	.uleb128 0x3
	.4byte	0xacc
	.4byte	.LLST43
	.byte	0
	.uleb128 0x9
	.4byte	0xb66
	.8byte	.LBB63
	.4byte	.LLRL44
	.byte	0x5f
	.byte	0x1b
	.uleb128 0x3
	.4byte	0xb74
	.4byte	.LLST45
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x4b
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab5
	.uleb128 0xb
	.string	"y"
	.byte	0x4b
	.byte	0x1a
	.4byte	0x2e
	.4byte	.LLST21
	.uleb128 0xb
	.string	"x"
	.byte	0x4b
	.byte	0x23
	.4byte	0x2e
	.4byte	.LLST22
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x4c
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST23
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x4d
	.byte	0xb
	.4byte	0x2e
	.4byte	.LLST24
	.uleb128 0x1a
	.4byte	.LLRL27
	.4byte	0xa74
	.uleb128 0x2
	.string	"r"
	.byte	0x50
	.byte	0xf
	.4byte	0x2e
	.4byte	.LLST28
	.byte	0
	.uleb128 0x10
	.8byte	.LBB57
	.8byte	.LBE57-.LBB57
	.4byte	0xa97
	.uleb128 0x2
	.string	"r"
	.byte	0x53
	.byte	0xf
	.4byte	0x2e
	.4byte	.LLST29
	.byte	0
	.uleb128 0x9
	.4byte	0xb66
	.8byte	.LBB51
	.4byte	.LLRL25
	.byte	0x4c
	.byte	0x13
	.uleb128 0x3
	.4byte	0xb74
	.4byte	.LLST26
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x46
	.4byte	0x2e
	.4byte	0xad6
	.uleb128 0xa
	.string	"x"
	.byte	0x46
	.byte	0x19
	.4byte	0x2e
	.uleb128 0xa
	.string	"y"
	.byte	0x46
	.byte	0x22
	.4byte	0x2e
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x3f
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb3a
	.uleb128 0xb
	.string	"x"
	.byte	0x3f
	.byte	0x19
	.4byte	0x2e
	.4byte	.LLST15
	.uleb128 0x9
	.4byte	0xb3a
	.8byte	.LBB47
	.4byte	.LLRL16
	.byte	0x41
	.byte	0x10
	.uleb128 0x3
	.4byte	0xb48
	.4byte	.LLST17
	.uleb128 0x6
	.4byte	.LLRL16
	.uleb128 0x4
	.4byte	0xb51
	.4byte	.LLST18
	.uleb128 0x4
	.4byte	0xb5c
	.4byte	.LLST19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF52
	.byte	0x35
	.4byte	0x2e
	.4byte	0xb66
	.uleb128 0xa
	.string	"x"
	.byte	0x35
	.byte	0x16
	.4byte	0x2e
	.uleb128 0xc
	.4byte	.LASF54
	.byte	0x36
	.byte	0xb
	.4byte	0x2e
	.uleb128 0x1c
	.string	"i"
	.byte	0x37
	.byte	0x9
	.4byte	0x5d
	.byte	0
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x30
	.4byte	0x2e
	.4byte	0xb7e
	.uleb128 0xa
	.string	"x"
	.byte	0x30
	.byte	0x12
	.4byte	0x2e
	.byte	0
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x2b
	.byte	0x7
	.4byte	0x2e
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbd9
	.uleb128 0xb
	.string	"x"
	.byte	0x2b
	.byte	0x16
	.4byte	0x2e
	.4byte	.LLST7
	.uleb128 0x9
	.4byte	0xbd9
	.8byte	.LBB41
	.4byte	.LLRL8
	.byte	0x2c
	.byte	0xc
	.uleb128 0x3
	.4byte	0xbe7
	.4byte	.LLST9
	.uleb128 0x6
	.4byte	.LLRL8
	.uleb128 0x4
	.4byte	0xbf0
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x21
	.4byte	0x2e
	.4byte	0xbfb
	.uleb128 0xa
	.string	"x"
	.byte	0x21
	.byte	0x16
	.4byte	0x2e
	.uleb128 0x1c
	.string	"x2"
	.byte	0x27
	.byte	0xb
	.4byte	0x2e
	.byte	0
	.uleb128 0x23
	.4byte	.LASF58
	.byte	0x16
	.4byte	0xc3d
	.uleb128 0x24
	.4byte	.LASF34
	.byte	0x16
	.byte	0x22
	.4byte	0xa7
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x17
	.byte	0xe
	.4byte	0x96
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x18
	.byte	0xe
	.4byte	0x96
	.uleb128 0xc
	.4byte	.LASF59
	.byte	0x19
	.byte	0xe
	.4byte	0x96
	.uleb128 0x2d
	.uleb128 0x1c
	.string	"i"
	.byte	0x1b
	.byte	0x13
	.4byte	0x96
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF60
	.byte	0x11
	.4byte	0xc70
	.uleb128 0xa
	.string	"x"
	.byte	0x11
	.byte	0x1a
	.4byte	0x64
	.uleb128 0xa
	.string	"y"
	.byte	0x11
	.byte	0x27
	.4byte	0x64
	.uleb128 0x24
	.4byte	.LASF34
	.byte	0x11
	.byte	0x39
	.4byte	0xa7
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x12
	.byte	0xe
	.4byte	0x96
	.byte	0
	.uleb128 0xd
	.4byte	0xc3d
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcaa
	.uleb128 0xe
	.4byte	0xc47
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xe
	.4byte	0xc50
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0xe
	.4byte	0xc59
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x4
	.4byte	0xc64
	.4byte	.LLST0
	.byte	0
	.uleb128 0xd
	.4byte	0xbfb
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd07
	.uleb128 0xe
	.4byte	0xc05
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x4
	.4byte	0xc10
	.4byte	.LLST1
	.uleb128 0x4
	.4byte	0xc1b
	.4byte	.LLST2
	.uleb128 0x4
	.4byte	0xc26
	.4byte	.LLST3
	.uleb128 0x2e
	.4byte	0xc31
	.8byte	.LBB38
	.8byte	.LBE38-.LBB38
	.uleb128 0x4
	.4byte	0xc32
	.4byte	.LLST4
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0xbd9
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd35
	.uleb128 0x3
	.4byte	0xbe7
	.4byte	.LLST5
	.uleb128 0x4
	.4byte	0xbf0
	.4byte	.LLST6
	.byte	0
	.uleb128 0xd
	.4byte	0xb66
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd5a
	.uleb128 0x3
	.4byte	0xb74
	.4byte	.LLST11
	.byte	0
	.uleb128 0xd
	.4byte	0xb3a
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd91
	.uleb128 0x3
	.4byte	0xb48
	.4byte	.LLST12
	.uleb128 0x4
	.4byte	0xb51
	.4byte	.LLST13
	.uleb128 0x4
	.4byte	0xb5c
	.4byte	.LLST14
	.byte	0
	.uleb128 0xd
	.4byte	0xab5
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdbe
	.uleb128 0x3
	.4byte	0xac3
	.4byte	.LLST20
	.uleb128 0xe
	.4byte	0xacc
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x2b
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF63
	.4byte	.LASF64
	.byte	0x6
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
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
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 .LBB41-.Ltext0
	.uleb128 .LBE41-.Ltext0
	.byte	0x4
	.uleb128 .LBB45-.Ltext0
	.uleb128 .LBE45-.Ltext0
	.byte	0x4
	.uleb128 .LBB46-.Ltext0
	.uleb128 .LBE46-.Ltext0
	.byte	0
.LLRL16:
	.byte	0x4
	.uleb128 .LBB47-.Ltext0
	.uleb128 .LBE47-.Ltext0
	.byte	0x4
	.uleb128 .LBB50-.Ltext0
	.uleb128 .LBE50-.Ltext0
	.byte	0
.LLRL25:
	.byte	0x4
	.uleb128 .LBB51-.Ltext0
	.uleb128 .LBE51-.Ltext0
	.byte	0x4
	.uleb128 .LBB54-.Ltext0
	.uleb128 .LBE54-.Ltext0
	.byte	0
.LLRL27:
	.byte	0x4
	.uleb128 .LBB55-.Ltext0
	.uleb128 .LBE55-.Ltext0
	.byte	0x4
	.uleb128 .LBB56-.Ltext0
	.uleb128 .LBE56-.Ltext0
	.byte	0
.LLRL41:
	.byte	0x4
	.uleb128 .LBB58-.Ltext0
	.uleb128 .LBE58-.Ltext0
	.byte	0x4
	.uleb128 .LBB62-.Ltext0
	.uleb128 .LBE62-.Ltext0
	.byte	0x4
	.uleb128 .LBB66-.Ltext0
	.uleb128 .LBE66-.Ltext0
	.byte	0
.LLRL44:
	.byte	0x4
	.uleb128 .LBB63-.Ltext0
	.uleb128 .LBE63-.Ltext0
	.byte	0x4
	.uleb128 .LBB67-.Ltext0
	.uleb128 .LBE67-.Ltext0
	.byte	0
.LLRL53:
	.byte	0x4
	.uleb128 .LBB91-.Ltext0
	.uleb128 .LBE91-.Ltext0
	.byte	0x4
	.uleb128 .LBB98-.Ltext0
	.uleb128 .LBE98-.Ltext0
	.byte	0x4
	.uleb128 .LBB99-.Ltext0
	.uleb128 .LBE99-.Ltext0
	.byte	0x4
	.uleb128 .LBB100-.Ltext0
	.uleb128 .LBE100-.Ltext0
	.byte	0
.LLRL58:
	.byte	0x4
	.uleb128 .LBB93-.Ltext0
	.uleb128 .LBE93-.Ltext0
	.byte	0x4
	.uleb128 .LBB94-.Ltext0
	.uleb128 .LBE94-.Ltext0
	.byte	0
.LLRL60:
	.byte	0x4
	.uleb128 .LBB101-.Ltext0
	.uleb128 .LBE101-.Ltext0
	.byte	0x4
	.uleb128 .LBB112-.Ltext0
	.uleb128 .LBE112-.Ltext0
	.byte	0x4
	.uleb128 .LBB138-.Ltext0
	.uleb128 .LBE138-.Ltext0
	.byte	0x4
	.uleb128 .LBB153-.Ltext0
	.uleb128 .LBE153-.Ltext0
	.byte	0
.LLRL63:
	.byte	0x4
	.uleb128 .LBB103-.Ltext0
	.uleb128 .LBE103-.Ltext0
	.byte	0x4
	.uleb128 .LBB110-.Ltext0
	.uleb128 .LBE110-.Ltext0
	.byte	0x4
	.uleb128 .LBB111-.Ltext0
	.uleb128 .LBE111-.Ltext0
	.byte	0
.LLRL65:
	.byte	0x4
	.uleb128 .LBB104-.Ltext0
	.uleb128 .LBE104-.Ltext0
	.byte	0x4
	.uleb128 .LBB108-.Ltext0
	.uleb128 .LBE108-.Ltext0
	.byte	0x4
	.uleb128 .LBB109-.Ltext0
	.uleb128 .LBE109-.Ltext0
	.byte	0
.LLRL72:
	.byte	0x4
	.uleb128 .LBB115-.Ltext0
	.uleb128 .LBE115-.Ltext0
	.byte	0x4
	.uleb128 .LBB126-.Ltext0
	.uleb128 .LBE126-.Ltext0
	.byte	0x4
	.uleb128 .LBB127-.Ltext0
	.uleb128 .LBE127-.Ltext0
	.byte	0x4
	.uleb128 .LBB128-.Ltext0
	.uleb128 .LBE128-.Ltext0
	.byte	0
.LLRL74:
	.byte	0x4
	.uleb128 .LBB116-.Ltext0
	.uleb128 .LBE116-.Ltext0
	.byte	0x4
	.uleb128 .LBB122-.Ltext0
	.uleb128 .LBE122-.Ltext0
	.byte	0x4
	.uleb128 .LBB123-.Ltext0
	.uleb128 .LBE123-.Ltext0
	.byte	0x4
	.uleb128 .LBB124-.Ltext0
	.uleb128 .LBE124-.Ltext0
	.byte	0x4
	.uleb128 .LBB125-.Ltext0
	.uleb128 .LBE125-.Ltext0
	.byte	0
.LLRL79:
	.byte	0x4
	.uleb128 .LBB129-.Ltext0
	.uleb128 .LBE129-.Ltext0
	.byte	0x4
	.uleb128 .LBB152-.Ltext0
	.uleb128 .LBE152-.Ltext0
	.byte	0
.LLRL82:
	.byte	0x4
	.uleb128 .LBB131-.Ltext0
	.uleb128 .LBE131-.Ltext0
	.byte	0x4
	.uleb128 .LBB136-.Ltext0
	.uleb128 .LBE136-.Ltext0
	.byte	0x4
	.uleb128 .LBB137-.Ltext0
	.uleb128 .LBE137-.Ltext0
	.byte	0
.LLRL84:
	.byte	0x4
	.uleb128 .LBB132-.Ltext0
	.uleb128 .LBE132-.Ltext0
	.byte	0x4
	.uleb128 .LBB135-.Ltext0
	.uleb128 .LBE135-.Ltext0
	.byte	0
.LLRL91:
	.byte	0x4
	.uleb128 .LBB141-.Ltext0
	.uleb128 .LBE141-.Ltext0
	.byte	0x4
	.uleb128 .LBB150-.Ltext0
	.uleb128 .LBE150-.Ltext0
	.byte	0x4
	.uleb128 .LBB151-.Ltext0
	.uleb128 .LBE151-.Ltext0
	.byte	0
.LLRL94:
	.byte	0x4
	.uleb128 .LBB142-.Ltext0
	.uleb128 .LBE142-.Ltext0
	.byte	0x4
	.uleb128 .LBB147-.Ltext0
	.uleb128 .LBE147-.Ltext0
	.byte	0x4
	.uleb128 .LBB148-.Ltext0
	.uleb128 .LBE148-.Ltext0
	.byte	0x4
	.uleb128 .LBB149-.Ltext0
	.uleb128 .LBE149-.Ltext0
	.byte	0
.LLRL106:
	.byte	0x4
	.uleb128 .LBB162-.Ltext0
	.uleb128 .LBE162-.Ltext0
	.byte	0x4
	.uleb128 .LBB169-.Ltext0
	.uleb128 .LBE169-.Ltext0
	.byte	0x4
	.uleb128 .LBB170-.Ltext0
	.uleb128 .LBE170-.Ltext0
	.byte	0x4
	.uleb128 .LBB171-.Ltext0
	.uleb128 .LBE171-.Ltext0
	.byte	0
.LLRL111:
	.byte	0x4
	.uleb128 .LBB164-.Ltext0
	.uleb128 .LBE164-.Ltext0
	.byte	0x4
	.uleb128 .LBB165-.Ltext0
	.uleb128 .LBE165-.Ltext0
	.byte	0
.LLRL114:
	.byte	0x4
	.uleb128 .LBB173-.Ltext0
	.uleb128 .LBE173-.Ltext0
	.byte	0x4
	.uleb128 .LBB187-.Ltext0
	.uleb128 .LBE187-.Ltext0
	.byte	0
.LLRL116:
	.byte	0x4
	.uleb128 .LBB174-.Ltext0
	.uleb128 .LBE174-.Ltext0
	.byte	0x4
	.uleb128 .LBB185-.Ltext0
	.uleb128 .LBE185-.Ltext0
	.byte	0x4
	.uleb128 .LBB186-.Ltext0
	.uleb128 .LBE186-.Ltext0
	.byte	0
.LLRL129:
	.byte	0x4
	.uleb128 .LBB175-.Ltext0
	.uleb128 .LBE175-.Ltext0
	.byte	0x4
	.uleb128 .LBB181-.Ltext0
	.uleb128 .LBE181-.Ltext0
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
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF49:
	.string	"printf"
.LASF18:
	.string	"framebuffer"
.LASF7:
	.string	"__uint8_t"
.LASF52:
	.string	"inv_sqrt"
.LASF17:
	.string	"long long unsigned int"
.LASF48:
	.string	"angle"
.LASF19:
	.string	"display_width"
.LASF14:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF51:
	.string	"sqrt_approx"
.LASF46:
	.string	"atan2_approx"
.LASF57:
	.string	"fast_sin"
.LASF62:
	.string	"get_display_status"
.LASF10:
	.string	"long int"
.LASF44:
	.string	"h_prime"
.LASF64:
	.string	"__builtin_puts"
.LASF39:
	.string	"checker_size"
.LASF56:
	.string	"fast_cos"
.LASF21:
	.string	"set_display_enable"
.LASF8:
	.string	"__uint32_t"
.LASF37:
	.string	"run_frame_buffer_test"
.LASF9:
	.string	"unsigned int"
.LASF40:
	.string	"intensity"
.LASF45:
	.string	"hsv_to_rgb"
.LASF11:
	.string	"long unsigned int"
.LASF36:
	.string	"draw_cool_pattern"
.LASF53:
	.string	"x_val"
.LASF61:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF24:
	.string	"width"
.LASF6:
	.string	"short unsigned int"
.LASF55:
	.string	"absf"
.LASF59:
	.string	"total"
.LASF26:
	.string	"total_pixels"
.LASF63:
	.string	"puts"
.LASF15:
	.string	"long double"
.LASF28:
	.string	"last_percent"
.LASF60:
	.string	"set_pixel"
.LASF47:
	.string	"abs_y"
.LASF2:
	.string	"float"
.LASF42:
	.string	"init_display"
.LASF54:
	.string	"xhalf"
.LASF38:
	.string	"section_height"
.LASF27:
	.string	"pixels_done"
.LASF30:
	.string	"pattern1"
.LASF31:
	.string	"pattern2"
.LASF32:
	.string	"pattern3"
.LASF3:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"uint32_t"
.LASF34:
	.string	"color"
.LASF16:
	.string	"char"
.LASF35:
	.string	"percent"
.LASF50:
	.string	"fmod_simple"
.LASF29:
	.string	"dist"
.LASF20:
	.string	"display_height"
.LASF43:
	.string	"status"
.LASF33:
	.string	"combined"
.LASF12:
	.string	"uint8_t"
.LASF23:
	.string	"get_display_width"
.LASF25:
	.string	"height"
.LASF58:
	.string	"clear_screen"
.LASF22:
	.string	"get_display_height"
.LASF41:
	.string	"checker"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/framebuffer_test.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
