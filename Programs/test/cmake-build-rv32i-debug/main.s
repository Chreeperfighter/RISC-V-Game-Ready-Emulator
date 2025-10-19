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
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 5 16
	.cfi_startproc
	.loc 1 6 5
.LVL0:
	.loc 1 7 5
	.loc 1 8 5
	.loc 1 9 5
	.loc 1 11 5
.LBB2:
	.loc 1 11 10
	.loc 1 11 28 discriminator 1
.LBE2:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:9:     uint64_t c = 0xCAFEBABEDEADBEEFULL;
	.loc 1 9 14 is_stmt 0
	li	a4,-889274368		# tmp172,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:8:     uint64_t b = 0x0FEDCBA987654321ULL;
	.loc 1 8 14
	li	a2,267243520		# tmp177,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7:     uint64_t a = 0x123456789ABCDEF0ULL;
	.loc 1 7 14
	li	a1,305418240		# tmp182,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:9:     uint64_t c = 0xCAFEBABEDEADBEEFULL;
	.loc 1 9 14
	addi	a4,a4,-1345	#, tmp169, tmp172
	li	a0,-559038464		# tmp171,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:8:     uint64_t b = 0x0FEDCBA987654321ULL;
	.loc 1 8 14
	addi	a2,a2,-1110	#, tmp174, tmp177
	li	a3,-2023407616		# tmp176,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7:     uint64_t a = 0x123456789ABCDEF0ULL;
	.loc 1 7 14
	addi	a1,a1,1657	#, tmp179, tmp182
	li	a5,-1698897920		# tmp181,
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:9:     uint64_t c = 0xCAFEBABEDEADBEEFULL;
	.loc 1 9 14
	addi	a0,a0,-273	#, tmp170, tmp171
	slli	a4,a4,32	#, tmp173, tmp169
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:8:     uint64_t b = 0x0FEDCBA987654321ULL;
	.loc 1 8 14
	slli	a2,a2,32	#, tmp178, tmp174
	addi	a3,a3,801	#, tmp175, tmp176
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7:     uint64_t a = 0x123456789ABCDEF0ULL;
	.loc 1 7 14
	slli	a1,a1,32	#, tmp183, tmp179
	addi	a5,a5,-272	#, tmp180, tmp181
.LBB3:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:11:     for (uint64_t i = 0; i < iterations; i++) {
	.loc 1 11 28 discriminator 1
	li	a7,99999744		# tmp184,
.LBE3:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:9:     uint64_t c = 0xCAFEBABEDEADBEEFULL;
	.loc 1 9 14
	add	a4,a4,a0	# tmp170, c, tmp173
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:8:     uint64_t b = 0x0FEDCBA987654321ULL;
	.loc 1 8 14
	add	a2,a2,a3	# tmp175, b, tmp178
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:7:     uint64_t a = 0x123456789ABCDEF0ULL;
	.loc 1 7 14
	add	a1,a1,a5	# tmp180, a, tmp183
.LBB4:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:11:     for (uint64_t i = 0; i < iterations; i++) {
	.loc 1 11 28 discriminator 1
	addi	a7,a7,256	#, tmp165, tmp184
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:11:     for (uint64_t i = 0; i < iterations; i++) {
	.loc 1 11 19
	li	a0,0		# i,
.LVL1:
.L2:
	.loc 1 12 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:12:         a ^= (b + c);
	.loc 1 12 17 is_stmt 0
	add	a5,a2,a4	# c, _1, b
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:12:         a ^= (b + c);
	.loc 1 12 11
	xor	a5,a5,a1	# a, a, _1
.LVL2:
	.loc 1 13 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:13:         b += (a << 3) ^ (c >> 2);
	.loc 1 13 28 is_stmt 0
	srli	a3,a4,2	#, _3, c
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:13:         b += (a << 3) ^ (c >> 2);
	.loc 1 13 17
	slli	a4,a5,3	#, _2, a
.LVL3:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:13:         b += (a << 3) ^ (c >> 2);
	.loc 1 13 23
	xor	a4,a4,a3	# _3, _4, _2
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:13:         b += (a << 3) ^ (c >> 2);
	.loc 1 13 11
	add	a4,a4,a2	# b, b, _4
.LVL4:
	.loc 1 14 9 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:16:         b = (b >> 1) | (b << 63); // rotate right
	.loc 1 16 11 is_stmt 0
	srli	a6,a4,1	#, tmp163, b
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:15:         a = (a << 1) | (a >> 63); // rotate left
	.loc 1 15 11
	srli	a3,a5,63	#, tmp162, a
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:16:         b = (b >> 1) | (b << 63); // rotate right
	.loc 1 16 11
	slli	a2,a4,63	#, b, b
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:15:         a = (a << 1) | (a >> 63); // rotate left
	.loc 1 15 11
	slli	a1,a5,1	#, a, a
	or	a1,a1,a3	# tmp162, a, a
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:16:         b = (b >> 1) | (b << 63); // rotate right
	.loc 1 16 11
	or	a2,a2,a6	# tmp163, b, b
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:14:         c = (b * 33) ^ (a >> 7);
	.loc 1 14 16
	slli	a3,a4,5	#, tmp159, b
	add	a4,a3,a4	# b, _5, tmp159
.LVL5:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:14:         c = (b * 33) ^ (a >> 7);
	.loc 1 14 27
	srli	a5,a5,7	#, _6, a
.LVL6:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:         c += a ^ b ^ i;
	.loc 1 17 16
	xor	a6,a1,a2	# b, _7, a
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:14:         c = (b * 33) ^ (a >> 7);
	.loc 1 14 11
	xor	a5,a4,a5	# _6, c, _5
.LVL7:
	.loc 1 15 9 is_stmt 1
	.loc 1 16 9
	.loc 1 17 9
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:         c += a ^ b ^ i;
	.loc 1 17 20 is_stmt 0
	xor	a4,a6,a0	# i, _8, _7
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:11:     for (uint64_t i = 0; i < iterations; i++) {
	.loc 1 11 43 discriminator 3
	addi	a0,a0,1	#, i, i
.LVL8:
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:17:         c += a ^ b ^ i;
	.loc 1 17 11
	add	a4,a4,a5	# c, c, _8
.LVL9:
	.loc 1 11 43 is_stmt 1 discriminator 3
	.loc 1 11 28 discriminator 1
	bne	a0,a7,.L2	#, i, tmp165,
.LBE4:
	.loc 1 20 5
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     result = a ^ b ^ c; // write final value so compiler keeps it
	.loc 1 20 20 is_stmt 0
	xor	a6,a6,a4	# c, _10, _7
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:20:     result = a ^ b ^ c; // write final value so compiler keeps it
	.loc 1 20 12
	lui	a5,%hi(result)	# tmp167,
	sd	a6,%lo(result)(a5)	# _10, result
	.loc 1 21 5 is_stmt 1
# /Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:22: }
	.loc 1 22 1 is_stmt 0
	li	a0,0		#,
.LVL10:
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	result
	.section	.sbss,"aw",@nobits
	.align	3
	.type	result, @object
	.size	result, 8
result:
	.zero	8
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 3 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x100
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL5
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
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x69
	.byte	0x19
	.4byte	0x67
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x5b
	.uleb128 0x6
	.4byte	0x6e
	.uleb128 0x7
	.4byte	0x6e
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3
	.byte	0x13
	.4byte	0x7a
	.uleb128 0x9
	.byte	0x3
	.8byte	result
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0x46
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x1
	.byte	0x6
	.byte	0x14
	.4byte	0x7f
	.4byte	0x5f5e100
	.uleb128 0x2
	.string	"a"
	.byte	0x7
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST0
	.uleb128 0x2
	.string	"b"
	.byte	0x8
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST1
	.uleb128 0x2
	.string	"c"
	.byte	0x9
	.byte	0xe
	.4byte	0x6e
	.4byte	.LLST2
	.uleb128 0xb
	.4byte	.LLRL3
	.uleb128 0x2
	.string	"i"
	.byte	0xb
	.byte	0x13
	.4byte	0x6e
	.4byte	.LLST4
	.byte	0
	.byte	0
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0x123456789abcdef0
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL6-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE0-.LVL0
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LLST1:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0xfedcba987654321
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL4-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL4-.LVL0
	.uleb128 .LVL5-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LFE0-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST2:
	.byte	0x6
	.8byte	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.8byte	0xcafebabedeadbeef
	.byte	0x4
	.uleb128 .LVL1-.LVL0
	.uleb128 .LVL3-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL7-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LFE0-.LVL0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST4:
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
	.uleb128 .LVL8-.LVL0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL8-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LVL10-.LVL0
	.uleb128 0x1
	.byte	0x5a
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
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
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
	.8byte	.LBB2
	.byte	0x4
	.uleb128 .LBB2-.LBB2
	.uleb128 .LBE2-.LBB2
	.byte	0x4
	.uleb128 .LBB3-.LBB2
	.uleb128 .LBE3-.LBB2
	.byte	0x4
	.uleb128 .LBB4-.LBB2
	.uleb128 .LBE4-.LBB2
	.byte	0
.LLRL5:
	.byte	0x7
	.8byte	.LFB0
	.uleb128 .LFE0-.LFB0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"uint64_t"
.LASF3:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF11:
	.string	"iterations"
.LASF14:
	.string	"main"
.LASF12:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF6:
	.string	"unsigned int"
.LASF13:
	.string	"result"
.LASF4:
	.string	"short int"
.LASF9:
	.string	"__uint64_t"
.LASF7:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-debug"
.LASF0:
	.string	"/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
