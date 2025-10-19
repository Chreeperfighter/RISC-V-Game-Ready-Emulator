	.file	"util.c"
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
	.file 0 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release" "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c"
	.align	1
	.globl	get_display_width
	.type	get_display_width, @function
get_display_width:
.LFB0:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c"
	.loc 1 7 38
	.cfi_startproc
	.loc 1 8 5
	.loc 1 9 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:9:     register int a7 asm("a7") = 200; // GET_SCREEN_WIDTH
	.loc 1 9 18 is_stmt 0
	li	a7,200		# a7,
	.loc 1 10 5 is_stmt 1
 #APP
# 10 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
	.loc 1 12 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:13: }
	.loc 1 13 1 is_stmt 0
 #NO_APP
	sext.w	a0,a0	#, a0
	ret	
	.cfi_endproc
.LFE0:
	.size	get_display_width, .-get_display_width
	.align	1
	.globl	get_display_height
	.type	get_display_height, @function
get_display_height:
.LFB1:
	.loc 1 15 39 is_stmt 1
	.cfi_startproc
	.loc 1 16 5
	.loc 1 17 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:17:     register int a7 asm("a7") = 201; // GET_SCREEN_HEIGHT
	.loc 1 17 18 is_stmt 0
	li	a7,201		# a7,
	.loc 1 18 5 is_stmt 1
 #APP
# 18 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:21: }
	.loc 1 21 1 is_stmt 0
 #NO_APP
	sext.w	a0,a0	#, a0
	ret	
	.cfi_endproc
.LFE1:
	.size	get_display_height, .-get_display_height
	.align	1
	.globl	set_display_enable
	.type	set_display_enable, @function
set_display_enable:
.LFB2:
	.loc 1 23 37 is_stmt 1
	.cfi_startproc
.LVL0:
	.loc 1 24 5
	.loc 1 25 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:25:     register int a7 asm("a7") = 202; // DISPLAY_ENABLE
	.loc 1 25 18 is_stmt 0
	li	a7,202		# a7,
	.loc 1 26 5 is_stmt 1
 #APP
# 26 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:27: }
	.loc 1 27 1 is_stmt 0
 #NO_APP
	ret	
	.cfi_endproc
.LFE2:
	.size	set_display_enable, .-set_display_enable
	.align	1
	.globl	get_display_status
	.type	get_display_status, @function
get_display_status:
.LFB3:
	.loc 1 29 39 is_stmt 1
	.cfi_startproc
	.loc 1 30 5
	.loc 1 31 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:31:     register int a7 asm("a7") = 203; // DISPLAY_STATUS
	.loc 1 31 18 is_stmt 0
	li	a7,203		# a7,
	.loc 1 32 5 is_stmt 1
 #APP
# 32 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
	.loc 1 34 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:35: }
	.loc 1 35 1 is_stmt 0
 #NO_APP
	sext.w	a0,a0	#, a0
	ret	
	.cfi_endproc
.LFE3:
	.size	get_display_status, .-get_display_status
	.align	1
	.globl	get_cycles
	.type	get_cycles, @function
get_cycles:
.LFB4:
	.loc 1 37 37 is_stmt 1
	.cfi_startproc
	.loc 1 38 5
	.loc 1 39 5
	.loc 1 40 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:40:     register int a7 asm("a7") = 100; // GET_CYCLES
	.loc 1 40 18 is_stmt 0
	li	a7,100		# a7,
	.loc 1 41 5 is_stmt 1
 #APP
# 41 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
	.loc 1 43 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:43:     return (unsigned long long)a1 << 32 | a0;
	.loc 1 43 35 is_stmt 0
 #NO_APP
	slli	a1,a1,32	#, _3, a1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:43:     return (unsigned long long)a1 << 32 | a0;
	.loc 1 43 41
	sext.w	a0,a0	# a0.4_4, a0
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:44: }
	.loc 1 44 1
	or	a0,a1,a0	# a0.4_4,, _3
	ret	
	.cfi_endproc
.LFE4:
	.size	get_cycles, .-get_cycles
	.align	1
	.globl	breakpoint
	.type	breakpoint, @function
breakpoint:
.LFB5:
	.loc 1 46 23 is_stmt 1
	.cfi_startproc
	.loc 1 47 5
 #APP
# 47 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ebreak	
# 0 "" 2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:48: }
	.loc 1 48 1 is_stmt 0
 #NO_APP
	ret	
	.cfi_endproc
.LFE5:
	.size	breakpoint, .-breakpoint
	.align	1
	.globl	read
	.type	read, @function
read:
.LFB6:
	.loc 1 50 63 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 51 5
	.loc 1 52 5
	.loc 1 53 5
	.loc 1 54 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:54:     register uint32_t a7 asm("a7") = 63; // READ
	.loc 1 54 23 is_stmt 0
	li	a7,63		# a7,
	.loc 1 56 5 is_stmt 1
 #APP
# 56 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
.LVL2:
	.loc 1 61 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:62: }
	.loc 1 62 1 is_stmt 0
 #NO_APP
	sext.w	a0,a0	#, a0
	ret	
	.cfi_endproc
.LFE6:
	.size	read, .-read
	.align	1
	.globl	write
	.type	write, @function
write:
.LFB7:
	.loc 1 64 64 is_stmt 1
	.cfi_startproc
.LVL3:
	.loc 1 65 5
	.loc 1 66 5
	.loc 1 67 5
	.loc 1 68 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:68:     register uint32_t a7 asm("a7") = 64; // WRITE
	.loc 1 68 23 is_stmt 0
	li	a7,64		# a7,
	.loc 1 70 5 is_stmt 1
 #APP
# 70 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c" 1
	ecall	
# 0 "" 2
.LVL4:
	.loc 1 75 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c:76: }
	.loc 1 76 1 is_stmt 0
 #NO_APP
	sext.w	a0,a0	#, a0
	ret	
	.cfi_endproc
.LFE7:
	.size	write, .-write
.Letext0:
	.file 2 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 3 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2ef
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0xe8
	.byte	0x1a
	.4byte	0x6b
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x51
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x52
	.byte	0x15
	.4byte	0x72
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x40
	.byte	0x5
	.4byte	0x4a
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x110
	.uleb128 0x6
	.string	"fd"
	.byte	0x40
	.byte	0x14
	.4byte	0x7e
	.4byte	.LLST1
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x40
	.byte	0x24
	.4byte	0x110
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x40
	.byte	0x35
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x1
	.string	"a0"
	.byte	0x41
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a1"
	.byte	0x42
	.byte	0x18
	.4byte	0x8a
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.string	"a2"
	.byte	0x43
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x1
	.string	"a7"
	.byte	0x44
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x11d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xa
	.4byte	0x116
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x32
	.byte	0x5
	.4byte	0x4a
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19c
	.uleb128 0x6
	.string	"fd"
	.byte	0x32
	.byte	0x13
	.4byte	0x7e
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x32
	.byte	0x23
	.4byte	0x110
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x32
	.byte	0x34
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x1
	.string	"a0"
	.byte	0x33
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a1"
	.byte	0x34
	.byte	0x18
	.4byte	0x8a
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.string	"a2"
	.byte	0x35
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x1
	.string	"a7"
	.byte	0x36
	.byte	0x17
	.4byte	0x7e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x2e
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x25
	.byte	0x14
	.4byte	0x1fc
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fc
	.uleb128 0x1
	.string	"a0"
	.byte	0x26
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a1"
	.byte	0x27
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.string	"a7"
	.byte	0x28
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF20
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1d
	.byte	0xe
	.4byte	0x5d
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23d
	.uleb128 0x1
	.string	"a0"
	.byte	0x1e
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a7"
	.byte	0x1f
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x281
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x17
	.byte	0x1d
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a0"
	.byte	0x18
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a7"
	.byte	0x19
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0xf
	.byte	0xe
	.4byte	0x5d
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2bb
	.uleb128 0x1
	.string	"a0"
	.byte	0x10
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a7"
	.byte	0x11
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x7
	.byte	0xe
	.4byte	0x5d
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.string	"a0"
	.byte	0x8
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.string	"a7"
	.byte	0x9
	.byte	0x12
	.4byte	0x4a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
.LLST1:
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL4-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL4-.Ltext0
	.uleb128 .LFE7-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LFE6-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"get_display_status"
.LASF14:
	.string	"num_bytes"
.LASF12:
	.string	"uintptr_t"
.LASF10:
	.string	"__uintptr_t"
.LASF19:
	.string	"get_cycles"
.LASF18:
	.string	"max_bytes"
.LASF3:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"write"
.LASF9:
	.string	"__uint32_t"
.LASF26:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF22:
	.string	"enable"
.LASF6:
	.string	"unsigned int"
.LASF27:
	.string	"breakpoint"
.LASF15:
	.string	"char"
.LASF24:
	.string	"set_display_enable"
.LASF23:
	.string	"get_display_height"
.LASF4:
	.string	"short int"
.LASF13:
	.string	"buffer"
.LASF11:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF25:
	.string	"get_display_width"
.LASF20:
	.string	"long long unsigned int"
.LASF17:
	.string	"read"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/util.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
