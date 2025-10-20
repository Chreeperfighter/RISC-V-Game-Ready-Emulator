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
	.file 0 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug" "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Display width = %lu, height = %lu, ready = %lu\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB15:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 7 16
	.cfi_startproc
	.loc 1 8 5
.LBB15:
.LBB16:
	.file 2 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h"
	.loc 2 92 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:92:     return DISPLAY_WIDTH_REG;
	.loc 2 92 12 is_stmt 0
	li	a3,268435456		# tmp192,
.LBE16:
.LBE15:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7: int main(void) {
	.loc 1 7 16
	addi	sp,sp,-32	#,,
	.cfi_def_cfa_offset 32
	sd	s1,8(sp)	#,
	.cfi_offset 9, -24
.LBB19:
.LBB17:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:92:     return DISPLAY_WIDTH_REG;
	.loc 2 92 12
	lw	s1,4(a3)		# MEM[(volatile uint32_t *)268435460B], MEM[(volatile uint32_t *)268435460B]
.LBE17:
.LBE19:
.LBB20:
.LBB21:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:96:     return DISPLAY_HEIGHT_REG;
	.loc 2 96 12
	lw	a2,8(a3)		# MEM[(volatile uint32_t *)268435464B], MEM[(volatile uint32_t *)268435464B]
.LBE21:
.LBE20:
.LBB23:
.LBB24:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:50:     DISPLAY_CTRL_REG |= DISPLAY_ENABLE;
	.loc 2 50 5
	lw	a4,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE24:
.LBE23:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7: int main(void) {
	.loc 1 7 16
	sd	s0,16(sp)	#,
	sd	ra,24(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 1, -8
.LBB27:
.LBB25:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:50:     DISPLAY_CTRL_REG |= DISPLAY_ENABLE;
	.loc 2 50 22
	ori	a4,a4,1	#, _19, MEM[(volatile uint32_t *)268435456B]
	sw	a4,0(a3)	# _19, MEM[(volatile uint32_t *)268435456B]
.LBE25:
.LBE27:
.LBB28:
.LBB29:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:60:     DISPLAY_CTRL_REG |= DISPLAY_AUTO_REFRESH;
	.loc 2 60 5
	lw	a4,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE29:
.LBE28:
.LBB31:
.LBB18:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:92:     return DISPLAY_WIDTH_REG;
	.loc 2 92 12
	sext.w	s1,s1	# _21, MEM[(volatile uint32_t *)268435460B]
.LVL0:
.LBE18:
.LBE31:
	.loc 1 9 5 is_stmt 1
.LBB32:
.LBB22:
	.loc 2 96 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:96:     return DISPLAY_HEIGHT_REG;
	.loc 2 96 12 is_stmt 0
	sext.w	s0,a2	# _20, MEM[(volatile uint32_t *)268435464B]
.LVL1:
.LBE22:
.LBE32:
	.loc 1 10 5 is_stmt 1
.LBB33:
.LBB26:
	.loc 2 50 5
.LBE26:
.LBE33:
	.loc 1 11 5
.LBB34:
.LBB30:
	.loc 2 60 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:60:     DISPLAY_CTRL_REG |= DISPLAY_AUTO_REFRESH;
	.loc 2 60 22 is_stmt 0
	ori	a4,a4,8	#, _17, MEM[(volatile uint32_t *)268435456B]
	sw	a4,0(a3)	# _17, MEM[(volatile uint32_t *)268435456B]
.LBE30:
.LBE34:
	.loc 1 12 5 is_stmt 1
.LBB35:
.LBB36:
	.loc 2 75 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:75:     return (DISPLAY_CTRL_REG & DISPLAY_READY) != 0;
	.loc 2 75 13 is_stmt 0
	lw	a3,0(a3)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LVL2:
.LBE36:
.LBE35:
	.loc 1 14 5 is_stmt 1
	lui	a0,%hi(.LC0)	# tmp179,
	mv	a2,s0	#, _20
.LBB38:
.LBB37:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:75:     return (DISPLAY_CTRL_REG & DISPLAY_READY) != 0;
	.loc 2 75 47 is_stmt 0
	srli	a3,a3,2	#, tmp175, MEM[(volatile uint32_t *)268435456B]
.LVL3:
.LBE37:
.LBE38:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:14:     printf("Display width = %lu, height = %lu, ready = %lu\n", width, height, ready);
	.loc 1 14 5
	mv	a1,s1	#, _21
	addi	a0,a0,%lo(.LC0)	#, tmp179,
	andi	a3,a3,1	#,, tmp175
	call	printf		#
.LVL4:
	.loc 1 17 5 is_stmt 1
.LBB39:
	.loc 1 17 10
	.loc 1 17 28 discriminator 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 17 36 is_stmt 0 discriminator 1
	mulw	a2,s0,s1	# tmp181, _20, _21
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 17 28 discriminator 1
	beq	a2,zero,.L2	#, tmp181,,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:18:         framebuffer[i] = i;
	.loc 1 18 20
	lui	a5,%hi(framebuffer)	# tmp182,
	ld	a4,%lo(framebuffer)(a5)		# ivtmp.14, framebuffer
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:     for (uint32_t i = 0; i < width * height; i++) {
	.loc 1 17 19
	li	a5,0		# i,
.LVL5:
.L3:
	.loc 1 18 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:18:         framebuffer[i] = i;
	.loc 1 18 24 is_stmt 0
	sw	a5,0(a4)	# i, *_4
	.loc 1 17 47 is_stmt 1 discriminator 3
	addiw	a5,a5,1	#, i, i
.LVL6:
	.loc 1 17 28 discriminator 1
	addi	a4,a4,4	#, ivtmp.14, ivtmp.14
	bne	a5,a2,.L3	#, i, tmp181,
.LVL7:
.L2:
.LBE39:
	.loc 1 21 5
.LBB40:
.LBB41:
	.loc 2 70 5
	li	a4,268435456		# tmp185,
	lw	a5,0(a4)		# MEM[(volatile uint32_t *)268435456B], MEM[(volatile uint32_t *)268435456B]
.LBE41:
.LBE40:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24: }
	.loc 1 24 1 is_stmt 0
	ld	ra,24(sp)		#,
	.cfi_restore 1
	ld	s0,16(sp)		#,
	.cfi_restore 8
.LVL8:
.LBB43:
.LBB42:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:70:     DISPLAY_CTRL_REG |= DISPLAY_NEW_FRAME;
	.loc 2 70 22
	ori	a5,a5,2	#, _23, MEM[(volatile uint32_t *)268435456B]
	sw	a5,0(a4)	# _23, MEM[(volatile uint32_t *)268435456B]
.LBE42:
.LBE43:
	.loc 1 23 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:24: }
	.loc 1 24 1 is_stmt 0
	ld	s1,8(sp)		#,
	.cfi_restore 9
.LVL9:
	li	a0,0		#,
	addi	sp,sp,32	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.globl	framebuffer
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
	.4byte	0x211
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL10
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x59
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x4d
	.uleb128 0xb
	.4byte	0x6e
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0xc
	.4byte	0x8d
	.uleb128 0x8
	.4byte	0x94
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x5
	.byte	0x14
	.4byte	0xbb
	.uleb128 0x9
	.byte	0x3
	.8byte	framebuffer
	.uleb128 0x8
	.4byte	0x7a
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x5
	.byte	0xce
	.byte	0x5
	.4byte	0x46
	.4byte	0xd7
	.uleb128 0xf
	.4byte	0x99
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x46
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e1
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x8
	.4byte	0x6e
	.4byte	.LLST0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x9
	.4byte	0x6e
	.4byte	.LLST1
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0xc
	.4byte	0x6e
	.4byte	.LLST2
	.uleb128 0x12
	.8byte	.LBB39
	.8byte	.LBE39-.LBB39
	.4byte	0x147
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x11
	.byte	0x13
	.4byte	0x6e
	.4byte	.LLST8
	.byte	0
	.uleb128 0x2
	.4byte	0x1ec
	.8byte	.LBB15
	.4byte	.LLRL3
	.byte	0x8
	.byte	0x16
	.uleb128 0x2
	.4byte	0x1e1
	.8byte	.LBB20
	.4byte	.LLRL4
	.byte	0x9
	.byte	0x17
	.uleb128 0x2
	.4byte	0x20e
	.8byte	.LBB23
	.4byte	.LLRL5
	.byte	0xa
	.byte	0x5
	.uleb128 0x2
	.4byte	0x208
	.8byte	.LBB28
	.4byte	.LLRL6
	.byte	0xb
	.byte	0x5
	.uleb128 0x2
	.4byte	0x1f7
	.8byte	.LBB35
	.4byte	.LLRL7
	.byte	0xc
	.byte	0x16
	.uleb128 0x2
	.4byte	0x202
	.8byte	.LBB40
	.4byte	.LLRL9
	.byte	0x15
	.byte	0x5
	.uleb128 0x14
	.8byte	.LVL4
	.4byte	0xc0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x5f
	.byte	0x18
	.4byte	0x6e
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x5b
	.byte	0x18
	.4byte	0x6e
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x4a
	.byte	0x13
	.4byte	0x46
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x45
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x3b
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x31
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
.LLST0:
	.byte	0x8
	.8byte	.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x59
	.byte	0
.LLST1:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL8-.LVL1
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST2:
	.byte	0x8
	.8byte	.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0xd
	.byte	0x7d
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
.LLST8:
	.byte	0x6
	.8byte	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL4
	.uleb128 .LVL7-.LVL4
	.uleb128 0x1
	.byte	0x5f
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
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
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
.LLRL3:
	.byte	0x5
	.8byte	.LBB15
	.byte	0x4
	.uleb128 .LBB15-.LBB15
	.uleb128 .LBE15-.LBB15
	.byte	0x4
	.uleb128 .LBB19-.LBB15
	.uleb128 .LBE19-.LBB15
	.byte	0x4
	.uleb128 .LBB31-.LBB15
	.uleb128 .LBE31-.LBB15
	.byte	0
.LLRL4:
	.byte	0x5
	.8byte	.LBB20
	.byte	0x4
	.uleb128 .LBB20-.LBB20
	.uleb128 .LBE20-.LBB20
	.byte	0x4
	.uleb128 .LBB32-.LBB20
	.uleb128 .LBE32-.LBB20
	.byte	0
.LLRL5:
	.byte	0x5
	.8byte	.LBB23
	.byte	0x4
	.uleb128 .LBB23-.LBB23
	.uleb128 .LBE23-.LBB23
	.byte	0x4
	.uleb128 .LBB27-.LBB23
	.uleb128 .LBE27-.LBB23
	.byte	0x4
	.uleb128 .LBB33-.LBB23
	.uleb128 .LBE33-.LBB23
	.byte	0
.LLRL6:
	.byte	0x5
	.8byte	.LBB28
	.byte	0x4
	.uleb128 .LBB28-.LBB28
	.uleb128 .LBE28-.LBB28
	.byte	0x4
	.uleb128 .LBB34-.LBB28
	.uleb128 .LBE34-.LBB28
	.byte	0
.LLRL7:
	.byte	0x5
	.8byte	.LBB35
	.byte	0x4
	.uleb128 .LBB35-.LBB35
	.uleb128 .LBE35-.LBB35
	.byte	0x4
	.uleb128 .LBB38-.LBB35
	.uleb128 .LBE38-.LBB35
	.byte	0
.LLRL9:
	.byte	0x5
	.8byte	.LBB40
	.byte	0x4
	.uleb128 .LBB40-.LBB40
	.uleb128 .LBE40-.LBB40
	.byte	0x4
	.uleb128 .LBB43-.LBB40
	.uleb128 .LBE43-.LBB40
	.byte	0
.LLRL10:
	.byte	0x7
	.8byte	.LFB15
	.uleb128 .LFE15-.LFB15
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"long long int"
.LASF6:
	.string	"unsigned int"
.LASF22:
	.string	"display_auto_refresh_on"
.LASF27:
	.string	"main"
.LASF9:
	.string	"__uint32_t"
.LASF17:
	.string	"ready"
.LASF25:
	.string	"framebuffer"
.LASF8:
	.string	"long unsigned int"
.LASF14:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned char"
.LASF18:
	.string	"display_get_height"
.LASF23:
	.string	"display_enable"
.LASF13:
	.string	"char"
.LASF16:
	.string	"height"
.LASF10:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF15:
	.string	"width"
.LASF20:
	.string	"display_is_ready"
.LASF5:
	.string	"short unsigned int"
.LASF26:
	.string	"printf"
.LASF24:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF19:
	.string	"display_get_width"
.LASF12:
	.string	"long double"
.LASF4:
	.string	"short int"
.LASF2:
	.string	"signed char"
.LASF21:
	.string	"display_trigger_frame"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
