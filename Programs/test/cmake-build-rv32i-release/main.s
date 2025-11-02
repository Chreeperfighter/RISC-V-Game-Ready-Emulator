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
	.file 0 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release" "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.align	1
	.type	display_glyph, @function
display_glyph:
.LFB15:
	.file 1 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.loc 1 77 81
	.cfi_startproc
.LVL0:
	.loc 1 78 5
.LBB50:
	.loc 1 78 10
	.loc 1 78 23 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 30 is_stmt 0 discriminator 1
	lbu	t4,0(a0)	#, glyph_51(D)->width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 45 discriminator 1
	lbu	t6,1(a0)	# _45, glyph_51(D)->height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 30 discriminator 1
	mv	t5,t4	#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 38 discriminator 1
	mulw	a6,t6,t4	# tmp199, _45, _43
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 23 discriminator 1
	beq	a6,zero,.L1	#, tmp199,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 14
	li	t1,0		# i,
.LVL1:
.L4:
.LBB51:
	.loc 1 79 9 is_stmt 1
	.loc 1 80 9
	.loc 1 81 9
	.loc 1 83 9
.LBB52:
	.loc 1 84 13
	.loc 1 85 13
	.loc 1 86 13
.LBE52:
.LBE51:
	.loc 1 78 56 discriminator 2
.LBB57:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         const uint8_t byte = glyph->data[index];
	.loc 1 80 23 is_stmt 0
	ld	a6,8(a0)		# glyph_51(D)->data, glyph_51(D)->data
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:79:         const uint32_t index = i >> 3;
	.loc 1 79 34
	sraiw	t3,t1,3	#, tmp202, i
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:81:         const uint8_t bit = 7 - (i & 0x7);
	.loc 1 81 23
	not	a7,t1	# tmp208, i
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:80:         const uint8_t byte = glyph->data[index];
	.loc 1 80 23
	add	a6,a6,t3	# tmp202, tmp205, glyph_51(D)->data
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (byte & (1 << bit)) {
	.loc 1 83 13
	lbu	a6,0(a6)	# _7, *_4
	andi	a7,a7,7	#, _8, tmp208
	sraw	a6,a6,a7	# _8, tmp213, _7
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:83:         if (byte & (1 << bit)) {
	.loc 1 83 12
	andi	a6,a6,1	#, tmp216, tmp213
	beq	a6,zero,.L3	#, tmp216,,
.LBB56:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:84:             const int relative_x = i % glyph->width;
	.loc 1 84 23
	remw	a6,t1,t4	# _43, tmp227, i
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:86:             const int fb_x = x + glyph->x_offset + relative_x;
	.loc 1 86 39
	lb	a7,2(a0)		# _12, glyph_51(D)->x_offset
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:86:             const int fb_x = x + glyph->x_offset + relative_x;
	.loc 1 86 32
	addw	a7,a7,a1	# x, tmp219, _12
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:86:             const int fb_x = x + glyph->x_offset + relative_x;
	.loc 1 86 23
	addw	a6,a6,a7	# tmp219, tmp229, tmp227
.LVL2:
	.loc 1 87 13 is_stmt 1
	.loc 1 89 13
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:             if (fb_x >= 0 && fb_x < fb_info->width &&
	.loc 1 89 16 is_stmt 0
	blt	a6,zero,.L3	#, tmp229,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:             if (fb_x >= 0 && fb_x < fb_info->width &&
	.loc 1 89 44 discriminator 1
	lw	a7,0(a4)		# _17, fb_info_60(D)->width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:             if (fb_x >= 0 && fb_x < fb_info->width &&
	.loc 1 89 27 discriminator 1
	bleu	a7,a6,.L3	#, _17, tmp229,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:85:             const int relative_y = i / glyph->width;
	.loc 1 85 23
	divw	t4,t1,t4	# _43, tmp238, i
.LVL3:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:             const int fb_y = y + glyph->y_offset + relative_y;
	.loc 1 87 39
	lb	t3,3(a0)		# _15, glyph_51(D)->y_offset
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:             const int fb_y = y + glyph->y_offset + relative_y;
	.loc 1 87 32
	addw	t3,t3,a2	# y, tmp232, _15
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:87:             const int fb_y = y + glyph->y_offset + relative_y;
	.loc 1 87 23
	addw	t4,t4,t3	# tmp232, tmp240, tmp238
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:89:             if (fb_x >= 0 && fb_x < fb_info->width &&
	.loc 1 89 52 discriminator 2
	blt	t4,zero,.L3	#, tmp240,,
.LBB53:
	.loc 1 91 17 is_stmt 1
.LBE53:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:90:                 fb_y >= 0 && fb_y < fb_info->height) {
	.loc 1 90 27 is_stmt 0
	lw	t3,4(a4)		# fb_info_60(D)->height, fb_info_60(D)->height
.LBB54:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:93:                 fb[fb_index + 2] = (color >> 16) & 0xFF;
	.loc 1 93 43
	srliw	t2,a5,16	# tmp261, color,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:94:                 fb[fb_index + 1] = (color >> 8) & 0xFF;
	.loc 1 94 43
	srliw	t0,a5,8	# tmp267, color,
.LBE54:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:90:                 fb_y >= 0 && fb_y < fb_info->height) {
	.loc 1 90 27
	bleu	t3,t4,.L3	#, fb_info_60(D)->height, tmp240,
.LBB55:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:91:                 const uint32_t fb_index = (fb_x + fb_y * fb_info->width) * fb_info->bpp;
	.loc 1 91 56
	mulw	a7,a7,t4	# tmp245, _17, tmp240
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:91:                 const uint32_t fb_index = (fb_x + fb_y * fb_info->width) * fb_info->bpp;
	.loc 1 91 32
	lw	t3,8(a4)		# fb_info_60(D)->bpp, fb_info_60(D)->bpp
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:91:                 const uint32_t fb_index = (fb_x + fb_y * fb_info->width) * fb_info->bpp;
	.loc 1 91 49
	addw	a7,a7,a6	# tmp229, tmp247, tmp245
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:91:                 const uint32_t fb_index = (fb_x + fb_y * fb_info->width) * fb_info->bpp;
	.loc 1 91 32
	mulw	a6,t3,a7	# tmp251, fb_info_60(D)->bpp, tmp247
.LVL4:
	.loc 1 92 17 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:92:                 fb[fb_index + 3] = (color >> 24) & 0xFF;
	.loc 1 92 29 is_stmt 0
	addiw	t4,a6,3	#, tmp253, tmp251
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:93:                 fb[fb_index + 2] = (color >> 16) & 0xFF;
	.loc 1 93 29
	addiw	t3,a6,2	#, tmp257, tmp251
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:92:                 fb[fb_index + 3] = (color >> 24) & 0xFF;
	.loc 1 92 29
	slli	t4,t4,32	#, _26, tmp253
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:94:                 fb[fb_index + 1] = (color >> 8) & 0xFF;
	.loc 1 94 29
	addiw	a7,a6,1	#, tmp263, tmp251
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:92:                 fb[fb_index + 3] = (color >> 24) & 0xFF;
	.loc 1 92 29
	srli	t4,t4,32	#, _26, _26
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:93:                 fb[fb_index + 2] = (color >> 16) & 0xFF;
	.loc 1 93 29
	slli	t3,t3,32	#, _31, tmp257
	srli	t3,t3,32	#, _31, _31
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:94:                 fb[fb_index + 1] = (color >> 8) & 0xFF;
	.loc 1 94 29
	slli	a7,a7,32	#, _36, tmp263
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:92:                 fb[fb_index + 3] = (color >> 24) & 0xFF;
	.loc 1 92 34
	add	t4,a3,t4	# _26, tmp255, fb
	sb	zero,0(t4)	#, *_27
.LVL5:
	.loc 1 93 17 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:94:                 fb[fb_index + 1] = (color >> 8) & 0xFF;
	.loc 1 94 29 is_stmt 0
	srli	a7,a7,32	#, _36, _36
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:95:                 fb[fb_index + 0] = color & 0xFF;
	.loc 1 95 29
	slli	a6,a6,32	#, _39, tmp251
.LVL6:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:93:                 fb[fb_index + 2] = (color >> 16) & 0xFF;
	.loc 1 93 34
	add	t3,a3,t3	# _31, tmp259, fb
	sb	t2,0(t3)	# tmp261, *_32
	.loc 1 94 17 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:95:                 fb[fb_index + 0] = color & 0xFF;
	.loc 1 95 29 is_stmt 0
	srli	a6,a6,32	#, _39, _39
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:94:                 fb[fb_index + 1] = (color >> 8) & 0xFF;
	.loc 1 94 34
	add	a7,a3,a7	# _36, tmp265, fb
	sb	t0,0(a7)	# tmp267, *_37
	.loc 1 95 17 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:95:                 fb[fb_index + 0] = color & 0xFF;
	.loc 1 95 34 is_stmt 0
	add	a6,a3,a6	# _39, tmp269, fb
	sb	a5,0(a6)	# color, *_40
	lbu	t5,0(a0)	# _43, glyph_51(D)->width
	lbu	t6,1(a0)	# _45, glyph_51(D)->height
.LVL7:
.L3:
.LBE55:
.LBE56:
.LBE57:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 38 discriminator 1
	mulw	a6,t6,t5	# tmp275, _45, _43
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 56 discriminator 2
	addiw	t1,t1,1	#, i, i
.LVL8:
	.loc 1 78 23 is_stmt 1 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 30 is_stmt 0 discriminator 1
	sext.w	t4,t5	# _43, _43
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:78:     for (int i = 0; i < glyph->width * glyph->height; i++) {
	.loc 1 78 23 discriminator 1
	bgt	a6,t1,.L4	#, tmp275, i,
.LVL9:
.L1:
.LBE50:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:99: }
	.loc 1 99 1
	ret	
	.cfi_endproc
.LFE15:
	.size	display_glyph, .-display_glyph
	.align	1
	.type	cmd_clear, @function
cmd_clear:
.LFB31:
	.loc 1 297 57 is_stmt 1
	.cfi_startproc
.LVL10:
	.loc 1 298 5
	.loc 1 299 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:299:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 299 22 is_stmt 0
	lwu	a5,8(a0)	# _2, term_10(D)->fb_info.width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:299:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 299 65
	lwu	a4,12(a0)	# _4, term_10(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:299:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 299 88
	lwu	a2,16(a0)	# _7, term_10(D)->fb_info.bpp
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:297: static bool cmd_clear(Terminal* term, const char* args) {
	.loc 1 297 57
	addi	sp,sp,-16	#,,
	.cfi_def_cfa_offset 16
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:299:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 299 50
	mul	a5,a5,a4	# _5, _2, _4
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:297: static bool cmd_clear(Terminal* term, const char* args) {
	.loc 1 297 57
	sd	s0,0(sp)	#,
	.cfi_offset 8, -16
	mv	s0,a0	# term, tmp157
.LVL11:
	.loc 1 300 5 is_stmt 1
	ld	a0,0(a0)		#, term_10(D)->framebuffer
.LVL12:
	li	a1,0		#,
.LVL13:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:297: static bool cmd_clear(Terminal* term, const char* args) {
	.loc 1 297 57 is_stmt 0
	sd	ra,8(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:300:     memset(term->framebuffer, 0, fb_size);
	.loc 1 300 5
	mul	a2,a5,a2	#, _5, _7
	call	memset		#
.LVL14:
	.loc 1 301 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:302:     term->cursor_y = FONT_ASCENT;
	.loc 1 302 20 is_stmt 0
	li	a5,32		# tmp155,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:304: }
	.loc 1 304 1
	ld	ra,8(sp)		#,
	.cfi_restore 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:301:     term->cursor_x = 0;
	.loc 1 301 20
	sw	zero,20(s0)	#, term_10(D)->cursor_x
	.loc 1 302 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:302:     term->cursor_y = FONT_ASCENT;
	.loc 1 302 20 is_stmt 0
	sw	a5,24(s0)	# tmp155, term_10(D)->cursor_y
	.loc 1 303 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:304: }
	.loc 1 304 1 is_stmt 0
	ld	s0,0(sp)		#,
	.cfi_restore 8
.LVL15:
	li	a0,1		#,
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE31:
	.size	cmd_clear, .-cmd_clear
	.align	1
	.type	terminal_print, @function
terminal_print:
.LFB23:
	.loc 1 181 78 is_stmt 1
	.cfi_startproc
.LVL16:
	.loc 1 182 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:181: static void terminal_print(Terminal* term, const char* text, uint32_t color) {
	.loc 1 181 78 is_stmt 0
	addi	sp,sp,-80	#,,
	.cfi_def_cfa_offset 80
	sd	s6,16(sp)	#,
	sd	s7,8(sp)	#,
	.cfi_offset 22, -64
	.cfi_offset 23, -72
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:182:     display_string(text, &term->cursor_x, term->cursor_y,
	.loc 1 182 5
	ld	s6,0(a0)		# _3, term_5(D)->framebuffer
	lw	s7,24(a0)		# _2, term_5(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:181: static void terminal_print(Terminal* term, const char* text, uint32_t color) {
	.loc 1 181 78
	sd	s0,64(sp)	#,
	sd	s1,56(sp)	#,
	sd	s2,48(sp)	#,
	sd	s3,40(sp)	#,
	sd	s4,32(sp)	#,
	sd	s5,24(sp)	#,
	sd	ra,72(sp)	#,
	sd	s8,0(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 1, -8
	.cfi_offset 24, -80
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:181: static void terminal_print(Terminal* term, const char* text, uint32_t color) {
	.loc 1 181 78
	mv	s2,a0	# term, tmp166
	mv	s1,a1	# text, tmp167
	mv	s3,a2	# color, tmp168
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:183:                   term->framebuffer, &term->fb_info, color);
	.loc 1 183 38
	addi	s5,a0,8	#, _4, term
.LVL17:
.LBB63:
	.loc 1 112 5 is_stmt 1
.LBB64:
	.loc 1 112 10
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:112:     for (size_t i = 0; i < strlen(str); i++) {
	.loc 1 112 17 is_stmt 0
	li	s0,0		# i,
.LBB65:
.LBB66:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:103:     const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 103 18
	lui	s4,%hi(MinecraftRegular_Bmg3_table)	# tmp165,
.LVL18:
.L16:
.LBE66:
.LBE65:
	.loc 1 112 26 is_stmt 1 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:112:     for (size_t i = 0; i < strlen(str); i++) {
	.loc 1 112 28 is_stmt 0 discriminator 1
	mv	a0,s1	#, text
	call	strlen		#
.LVL19:
	.loc 1 113 9 is_stmt 1
.LBB70:
.LBB67:
	.loc 1 103 5
	.loc 1 105 9
.LBE67:
.LBE70:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:113:         display_char(str[i], x, y, fb, fb_info, color);
	.loc 1 113 9 is_stmt 0
	add	a1,s1,s0	# i, _1, text
.LVL20:
.LBB71:
.LBB68:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:105:         display_glyph(glyph, *x, y, fb, fb_info, color);
	.loc 1 105 9
	mv	a5,s3	#, color
	mv	a4,s5	#, _4
	mv	a3,s6	#, _3
	mv	a2,s7	#, _2
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:103:     const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 103 18
	addi	a6,s4,%lo(MinecraftRegular_Bmg3_table)	# tmp152, tmp165,
.LBE68:
.LBE71:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:112:     for (size_t i = 0; i < strlen(str); i++) {
	.loc 1 112 26 discriminator 1
	bgeu	s0,a0,.L23	#, i, tmp169,
.LVL21:
.LBB72:
.LBB69:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:103:     const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 103 18
	lbu	a7,0(a1)	# _15, MEM[(const char *)_1]
	slli	a7,a7,3	#, tmp156, _15
	add	a6,a6,a7	# tmp156, tmp157, tmp152
	ld	s8,0(a6)		# glyph, MinecraftRegular_Bmg3_table[_15]
.LVL22:
	.loc 1 104 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:105:         display_glyph(glyph, *x, y, fb, fb_info, color);
	.loc 1 105 9 is_stmt 0
	mv	a0,s8	#, glyph
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:104:     if (glyph != NULL) {
	.loc 1 104 8
	beq	s8,zero,.L17	#, glyph,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:105:         display_glyph(glyph, *x, y, fb, fb_info, color);
	.loc 1 105 9
	lw	a1,20(s2)		#, MEM[(int *)term_5(D) + 20B]
.LVL23:
	call	display_glyph		#
.LVL24:
	.loc 1 106 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:106:         *x += glyph->advance;
	.loc 1 106 20 is_stmt 0
	lbu	a5,4(s8)	# _20, glyph_16->advance
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:106:         *x += glyph->advance;
	.loc 1 106 12
	lw	a4,20(s2)		# MEM[(int *)term_5(D) + 20B], MEM[(int *)term_5(D) + 20B]
	addw	a5,a5,a4	# MEM[(int *)term_5(D) + 20B], tmp163, _20
	sw	a5,20(s2)	# tmp163, MEM[(int *)term_5(D) + 20B]
.L17:
.LVL25:
.LBE69:
.LBE72:
	.loc 1 112 42 is_stmt 1 discriminator 3
	addi	s0,s0,1	#, i, i
.LVL26:
	j	.L16		#
.LVL27:
.L23:
.LBE64:
.LBE63:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:184: }
	.loc 1 184 1 is_stmt 0
	ld	ra,72(sp)		#,
	.cfi_restore 1
	ld	s0,64(sp)		#,
	.cfi_restore 8
.LVL28:
	ld	s1,56(sp)		#,
	.cfi_restore 9
.LVL29:
	ld	s2,48(sp)		#,
	.cfi_restore 18
.LVL30:
	ld	s3,40(sp)		#,
	.cfi_restore 19
.LVL31:
	ld	s4,32(sp)		#,
	.cfi_restore 20
	ld	s5,24(sp)		#,
	.cfi_restore 21
	ld	s6,16(sp)		#,
	.cfi_restore 22
	ld	s7,8(sp)		#,
	.cfi_restore 23
.LVL32:
	ld	s8,0(sp)		#,
	.cfi_restore 24
	addi	sp,sp,80	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE23:
	.size	terminal_print, .-terminal_print
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"neofetch"
	.align	3
.LC1:
	.string	"Available commands:"
	.align	3
.LC2:
	.string	"  "
	.align	3
.LC3:
	.string	" - "
	.text
	.align	1
	.type	cmd_help, @function
cmd_help:
.LFB32:
	.loc 1 306 56 is_stmt 1
	.cfi_startproc
.LVL33:
	.loc 1 307 5
	.loc 1 308 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:306: static bool cmd_help(Terminal* term, const char* args) {
	.loc 1 306 56 is_stmt 0
	addi	sp,sp,-64	#,,
	.cfi_def_cfa_offset 64
	sd	s2,32(sp)	#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:308:     terminal_print(term, "Available commands:", TEXT_COLOR);
	.loc 1 308 5
	lui	a1,%hi(.LC1)	# tmp150,
.LVL34:
	.cfi_offset 18, -32
	li	s2,16777216		# tmp149,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:306: static bool cmd_help(Terminal* term, const char* args) {
	.loc 1 306 56
	sd	s1,40(sp)	#,
	sd	s3,24(sp)	#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:308:     terminal_print(term, "Available commands:", TEXT_COLOR);
	.loc 1 308 5
	addi	a2,s2,-1	#,, tmp149
	addi	a1,a1,%lo(.LC1)	#, tmp150,
	.cfi_offset 9, -24
	.cfi_offset 19, -40
	lui	s1,%hi(.LANCHOR0)	# tmp152,
.LBB73:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:310:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 310 32 discriminator 1
	lui	s3,%hi(.LC0)	# tmp148,
.LBE73:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:306: static bool cmd_help(Terminal* term, const char* args) {
	.loc 1 306 56
	sd	s0,48(sp)	#,
	sd	s4,16(sp)	#,
	sd	s5,8(sp)	#,
	sd	ra,56(sp)	#,
	.cfi_offset 8, -16
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 1, -8
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:306: static bool cmd_help(Terminal* term, const char* args) {
	.loc 1 306 56
	mv	s0,a0	# term, tmp172
.LBB80:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:312:         terminal_print(term, "  ", TEXT_COLOR);
	.loc 1 312 9
	addi	s2,s2,-1	#, tmp170, tmp149
.LBE80:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:308:     terminal_print(term, "Available commands:", TEXT_COLOR);
	.loc 1 308 5
	call	terminal_print		#
.LVL35:
	.loc 1 310 5 is_stmt 1
.LBB81:
	.loc 1 310 10
	.loc 1 310 38 discriminator 1
	addi	s1,s1,%lo(.LANCHOR0)	# ivtmp.66, tmp152,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:310:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 310 32 is_stmt 0 discriminator 1
	addi	s3,s3,%lo(.LC0)	# _2, tmp148,
	lui	s5,%hi(.LC2)	# tmp167,
	lui	s4,%hi(.LC3)	# tmp168,
.LVL36:
.L26:
	.loc 1 311 9 is_stmt 1
.LBB74:
.LBB75:
	.loc 1 171 5
	.loc 1 176 9
.LBE75:
.LBE74:
	.loc 1 312 9
.LBB78:
.LBB76:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_6(D)->cursor_y, term_6(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _16, term_6(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_6(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp156, term_6(D)->cursor_y
	sw	a5,24(s0)	# tmp156, term_6(D)->cursor_y
	.loc 1 175 5 is_stmt 1
.LBE76:
.LBE78:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:312:         terminal_print(term, "  ", TEXT_COLOR);
	.loc 1 312 9 is_stmt 0
	mv	a2,s2	#, tmp170
	addi	a1,s5,%lo(.LC2)	#, tmp167,
	mv	a0,s0	#, term
.LBB79:
.LBB77:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47
	addiw	a3,a4,-40	#, tmp158, _16
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8
	bltu	a5,a4,.L25	#, tmp156, _16,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a3,24(s0)	# tmp158, term_6(D)->cursor_y
.L25:
.LBE77:
.LBE79:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:312:         terminal_print(term, "  ", TEXT_COLOR);
	.loc 1 312 9
	call	terminal_print		#
.LVL37:
	.loc 1 313 9 is_stmt 1
	li	a2,2412544		# tmp174,
	mv	a1,s3	#, _2
	mv	a0,s0	#, term
	addi	a2,a2,1670	#,, tmp174
	call	terminal_print		#
.LVL38:
	.loc 1 314 9
	mv	a2,s2	#, tmp170
	addi	a1,s4,%lo(.LC3)	#, tmp168,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL39:
	.loc 1 315 9
	ld	a1,16(s1)		#, MEM[(const char * *)_23 + 16B]
	mv	a2,s2	#, tmp170
	mv	a0,s0	#, term
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:310:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 310 38 is_stmt 0 discriminator 1
	addi	s1,s1,24	#, ivtmp.66, ivtmp.66
.LVL40:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:315:         terminal_print(term, commands[i].description, TEXT_COLOR);
	.loc 1 315 9
	call	terminal_print		#
.LVL41:
	.loc 1 310 48 is_stmt 1 discriminator 3
	.loc 1 310 38 discriminator 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:310:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 310 32 is_stmt 0 discriminator 1
	ld	s3,0(s1)		# _2, MEM[(const char * *)_25]
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:310:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 310 38 discriminator 1
	bne	s3,zero,.L26	#, _2,,
.LBE81:
	.loc 1 318 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:319: }
	.loc 1 319 1 is_stmt 0
	ld	ra,56(sp)		#,
	.cfi_restore 1
	ld	s0,48(sp)		#,
	.cfi_restore 8
.LVL42:
	ld	s1,40(sp)		#,
	.cfi_restore 9
	ld	s2,32(sp)		#,
	.cfi_restore 18
	ld	s3,24(sp)		#,
	.cfi_restore 19
	ld	s4,16(sp)		#,
	.cfi_restore 20
	ld	s5,8(sp)		#,
	.cfi_restore 21
	li	a0,0		#,
	addi	sp,sp,64	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE32:
	.size	cmd_help, .-cmd_help
	.align	1
	.type	cmd_echo, @function
cmd_echo:
.LFB30:
	.loc 1 292 56 is_stmt 1
	.cfi_startproc
.LVL43:
	.loc 1 293 5
	li	a2,16777216		# tmp137,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:292: static bool cmd_echo(Terminal* term, const char* args) {
	.loc 1 292 56 is_stmt 0
	addi	sp,sp,-16	#,,
	.cfi_def_cfa_offset 16
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:293:     terminal_print(term, args, TEXT_COLOR);
	.loc 1 293 5
	addi	a2,a2,-1	#,, tmp137
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:292: static bool cmd_echo(Terminal* term, const char* args) {
	.loc 1 292 56
	sd	ra,8(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:293:     terminal_print(term, args, TEXT_COLOR);
	.loc 1 293 5
	call	terminal_print		#
.LVL44:
	.loc 1 294 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:295: }
	.loc 1 295 1 is_stmt 0
	ld	ra,8(sp)		#,
	.cfi_restore 1
	li	a0,0		#,
	addi	sp,sp,16	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE30:
	.size	cmd_echo, .-cmd_echo
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"OS"
	.align	3
.LC5:
	.string	": None"
	.align	3
.LC6:
	.string	"Host"
	.align	3
.LC7:
	.string	": Unknown"
	.align	3
.LC8:
	.string	"Kernel"
	.align	3
.LC9:
	.string	"Uptime"
	.align	3
.LC10:
	.string	": x min"
	.align	3
.LC11:
	.string	"Shell"
	.align	3
.LC12:
	.string	": Custom"
	.align	3
.LC13:
	.string	"Resolution"
	.align	3
.LC14:
	.string	"%dx%d"
	.align	3
.LC15:
	.string	": "
	.align	3
.LC16:
	.string	"Terminal"
	.align	3
.LC17:
	.string	"CPU"
	.align	3
.LC18:
	.string	": RV32I @ 200MI/s"
	.align	3
.LC19:
	.string	"GPU"
	.align	3
.LC20:
	.string	"Memory"
	.align	3
.LC21:
	.string	": 32MB"
	.text
	.align	1
	.type	cmd_neofetch, @function
cmd_neofetch:
.LFB33:
	.loc 1 321 60 is_stmt 1
	.cfi_startproc
.LVL45:
	.loc 1 322 5
	.loc 1 323 5
	li	a2,2064384		# tmp325,
	lui	a1,%hi(.LC4)	# tmp194,
.LVL46:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:321: static bool cmd_neofetch(Terminal* term, const char* args) {
	.loc 1 321 60 is_stmt 0
	addi	sp,sp,-288	#,,
	.cfi_def_cfa_offset 288
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:323:     terminal_print(term, "OS", SECONDARY_TEXT_COLOR);
	.loc 1 323 5
	addi	a2,a2,1948	#,, tmp325
	addi	a1,a1,%lo(.LC4)	#, tmp194,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:321: static bool cmd_neofetch(Terminal* term, const char* args) {
	.loc 1 321 60
	sd	ra,280(sp)	#,
	sd	s0,272(sp)	#,
	sd	s1,264(sp)	#,
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0	# term, tmp306
	sd	s2,256(sp)	#,
	.cfi_offset 18, -32
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:323:     terminal_print(term, "OS", SECONDARY_TEXT_COLOR);
	.loc 1 323 5
	call	terminal_print		#
.LVL47:
	.loc 1 324 5 is_stmt 1
	li	a2,16777216		# tmp195,
	lui	s1,%hi(.LC5)	# tmp294,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp195
	addi	a1,s1,%lo(.LC5)	#, tmp294,
	call	terminal_print		#
.LVL48:
	.loc 1 325 5
.LBB82:
.LBB83:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _79, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp200, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp200, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L32	#, tmp200, _79,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp202, _79
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp202, term_4(D)->cursor_y
.L32:
.LVL49:
.LBE83:
.LBE82:
	.loc 1 326 5 is_stmt 1
	li	a2,2064384		# tmp324,
	lui	a1,%hi(.LC6)	# tmp204,
	addi	a2,a2,1948	#,, tmp324
	addi	a1,a1,%lo(.LC6)	#, tmp204,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL50:
	.loc 1 327 5
	li	a2,16777216		# tmp205,
	lui	a1,%hi(.LC7)	# tmp206,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp205
	addi	a1,a1,%lo(.LC7)	#, tmp206,
	call	terminal_print		#
.LVL51:
	.loc 1 328 5
.LBB84:
.LBB85:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _73, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp210, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp210, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L33	#, tmp210, _73,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp212, _73
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp212, term_4(D)->cursor_y
.L33:
.LVL52:
.LBE85:
.LBE84:
	.loc 1 329 5 is_stmt 1
	li	a2,2064384		# tmp323,
	lui	a1,%hi(.LC8)	# tmp214,
	addi	a2,a2,1948	#,, tmp323
	addi	a1,a1,%lo(.LC8)	#, tmp214,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL53:
	.loc 1 330 5
	li	a2,16777216		# tmp215,
	addi	a1,s1,%lo(.LC5)	#, tmp294,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp215
	call	terminal_print		#
.LVL54:
	.loc 1 331 5
.LBB86:
.LBB87:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _67, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp220, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp220, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L34	#, tmp220, _67,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp222, _67
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp222, term_4(D)->cursor_y
.L34:
.LVL55:
.LBE87:
.LBE86:
	.loc 1 332 5 is_stmt 1
	li	a2,2064384		# tmp322,
	lui	a1,%hi(.LC9)	# tmp224,
	addi	a2,a2,1948	#,, tmp322
	addi	a1,a1,%lo(.LC9)	#, tmp224,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL56:
	.loc 1 333 5
	li	a2,16777216		# tmp225,
	lui	a1,%hi(.LC10)	# tmp226,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp225
	addi	a1,a1,%lo(.LC10)	#, tmp226,
	call	terminal_print		#
.LVL57:
	.loc 1 334 5
.LBB88:
.LBB89:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _61, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp230, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp230, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L35	#, tmp230, _61,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp232, _61
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp232, term_4(D)->cursor_y
.L35:
.LVL58:
.LBE89:
.LBE88:
	.loc 1 335 5 is_stmt 1
	li	a2,2064384		# tmp321,
	lui	a1,%hi(.LC11)	# tmp234,
	addi	a2,a2,1948	#,, tmp321
	addi	a1,a1,%lo(.LC11)	#, tmp234,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL59:
	.loc 1 336 5
	li	a2,16777216		# tmp235,
	lui	s1,%hi(.LC12)	# tmp295,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp235
	addi	a1,s1,%lo(.LC12)	#, tmp295,
	call	terminal_print		#
.LVL60:
	.loc 1 337 5
.LBB90:
.LBB91:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _55, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp240, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp240, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L36	#, tmp240, _55,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp242, _55
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp242, term_4(D)->cursor_y
.L36:
.LVL61:
.LBE91:
.LBE90:
	.loc 1 338 5 is_stmt 1
	li	a2,2064384		# tmp320,
	lui	a1,%hi(.LC13)	# tmp244,
	addi	a2,a2,1948	#,, tmp320
	addi	a1,a1,%lo(.LC13)	#, tmp244,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL62:
	.loc 1 339 5
	.loc 1 340 5
	lw	a3,12(s0)		#, term_4(D)->fb_info.height
	lw	a2,8(s0)		#, term_4(D)->fb_info.width
	lui	a1,%hi(.LC14)	# tmp248,
	addi	a1,a1,%lo(.LC14)	#, tmp248,
	mv	a0,sp	#,
	call	sprintf		#
.LVL63:
	.loc 1 341 5
	li	s2,16777216		# tmp249,
	lui	a1,%hi(.LC15)	# tmp250,
	mv	a0,s0	#, term
	addi	a2,s2,-1	#,, tmp249
	addi	a1,a1,%lo(.LC15)	#, tmp250,
	call	terminal_print		#
.LVL64:
	.loc 1 342 5
	addi	a2,s2,-1	#,, tmp249
	mv	a1,sp	#,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL65:
	.loc 1 343 5
.LBB92:
.LBB93:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _49, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp256, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp256, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L37	#, tmp256, _49,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp258, _49
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp258, term_4(D)->cursor_y
.L37:
.LVL66:
.LBE93:
.LBE92:
	.loc 1 344 5 is_stmt 1
	li	a2,2064384		# tmp319,
	lui	a1,%hi(.LC16)	# tmp260,
	addi	a2,a2,1948	#,, tmp319
	addi	a1,a1,%lo(.LC16)	#, tmp260,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL67:
	.loc 1 345 5
	li	a2,16777216		# tmp261,
	addi	a1,s1,%lo(.LC12)	#, tmp295,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp261
	call	terminal_print		#
.LVL68:
	.loc 1 346 5
.LBB94:
.LBB95:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _43, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp266, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp266, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L38	#, tmp266, _43,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp268, _43
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp268, term_4(D)->cursor_y
.L38:
.LVL69:
.LBE95:
.LBE94:
	.loc 1 347 5 is_stmt 1
	li	a2,2064384		# tmp318,
	lui	a1,%hi(.LC17)	# tmp270,
	addi	a2,a2,1948	#,, tmp318
	addi	a1,a1,%lo(.LC17)	#, tmp270,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL70:
	.loc 1 348 5
	li	a2,16777216		# tmp271,
	lui	s1,%hi(.LC18)	# tmp296,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp271
	addi	a1,s1,%lo(.LC18)	#, tmp296,
	call	terminal_print		#
.LVL71:
	.loc 1 349 5
.LBB96:
.LBB97:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _37, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp276, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp276, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L39	#, tmp276, _37,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp278, _37
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp278, term_4(D)->cursor_y
.L39:
.LVL72:
.LBE97:
.LBE96:
	.loc 1 350 5 is_stmt 1
	li	a2,2064384		# tmp317,
	lui	a1,%hi(.LC19)	# tmp280,
	addi	a2,a2,1948	#,, tmp317
	addi	a1,a1,%lo(.LC19)	#, tmp280,
	mv	a0,s0	#, term
	call	terminal_print		#
.LVL73:
	.loc 1 351 5
	li	a2,16777216		# tmp281,
	addi	a1,s1,%lo(.LC18)	#, tmp296,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp281
	call	terminal_print		#
.LVL74:
	.loc 1 352 5
.LBB98:
.LBB99:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,24(s0)		# term_4(D)->cursor_y, term_4(D)->cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,12(s0)		# _31, term_4(D)->fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,20(s0)	#, term_4(D)->cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp286, term_4(D)->cursor_y
	sw	a5,24(s0)	# tmp286, term_4(D)->cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L40	#, tmp286, _31,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp288, _31
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,24(s0)	# tmp288, term_4(D)->cursor_y
.L40:
.LVL75:
.LBE99:
.LBE98:
	.loc 1 353 5 is_stmt 1
	li	a2,2064384		# tmp316,
	lui	a1,%hi(.LC20)	# tmp290,
	mv	a0,s0	#, term
	addi	a2,a2,1948	#,, tmp316
	addi	a1,a1,%lo(.LC20)	#, tmp290,
	call	terminal_print		#
.LVL76:
	.loc 1 354 5
	li	a2,16777216		# tmp291,
	lui	a1,%hi(.LC21)	# tmp292,
	mv	a0,s0	#, term
	addi	a2,a2,-1	#,, tmp291
	addi	a1,a1,%lo(.LC21)	#, tmp292,
	call	terminal_print		#
.LVL77:
	.loc 1 355 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:356: }
	.loc 1 356 1 is_stmt 0
	ld	ra,280(sp)		#,
	.cfi_restore 1
	ld	s0,272(sp)		#,
	.cfi_restore 8
.LVL78:
	ld	s1,264(sp)		#,
	.cfi_restore 9
	ld	s2,256(sp)		#,
	.cfi_restore 18
	li	a0,0		#,
	addi	sp,sp,288	#,,
	.cfi_def_cfa_offset 0
	jr	ra		#
	.cfi_endproc
.LFE33:
	.size	cmd_neofetch, .-cmd_neofetch
	.section	.rodata.str1.8
	.align	3
.LC22:
	.string	"mark@rv32i: "
	.align	3
.LC23:
	.string	"%63s %255[^\n]"
	.align	3
.LC24:
	.string	"Unknown command: "
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB34:
	.loc 1 359 16 is_stmt 1
	.cfi_startproc
	.loc 1 360 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:359: int main(void) {
	.loc 1 359 16 is_stmt 0
	addi	sp,sp,-1520	#,,
	.cfi_def_cfa_offset 1520
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:360:     Terminal term = {0};
	.loc 1 360 14
	addi	a0,sp,336	#, tmp466,
	li	a2,1072		#,
	li	a1,0		#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:359: int main(void) {
	.loc 1 359 16
	sd	ra,1512(sp)	#,
	.cfi_offset 1, -8
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:360:     Terminal term = {0};
	.loc 1 360 14
	call	memset		#
.LVL79:
	.loc 1 361 5 is_stmt 1
.LBB147:
.LBB148:
	.loc 1 119 5
.LBB149:
.LBB150:
	.file 2 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h"
	.loc 2 33 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:33:     register long a0 __asm__("a0") = (long)info;
	.loc 2 33 38 is_stmt 0
	addi	a0,sp,344	#, a0,
.LVL80:
	.loc 2 34 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:34:     register long a7 __asm__("a7") = GET_FRAMEBUFFER_INFO;
	.loc 2 34 19 is_stmt 0
	li	a7,200		# a7,
	.loc 2 36 5 is_stmt 1
 #APP
# 36 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL81:
	.loc 2 37 5
 #NO_APP
.LBE150:
.LBE149:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:119:     if (get_framebuffer_info(&term->fb_info) == -1) {
	.loc 1 119 8 is_stmt 0 discriminator 1
	li	a4,-1		# tmp235,
	sext.w	a5,a0	# a0.1_8, tmp444
	beq	a5,a4,.L44	#, a0.1_8, tmp235,
	.loc 1 123 5 is_stmt 1
.LVL82:
	.loc 1 124 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:123:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 123 22 is_stmt 0
	lwu	a5,344(sp)	# _11, term.fb_info.width
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:123:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 123 65
	lwu	a4,348(sp)	# _13, term.fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:123:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 123 88
	lwu	a0,352(sp)	# _16, term.fb_info.bpp
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:124:     term->framebuffer = malloc(fb_size);
	.loc 1 124 25
	li	a1,1		#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:123:     size_t fb_size = (size_t)term->fb_info.width * term->fb_info.height * term->fb_info.bpp;
	.loc 1 123 50
	mul	a5,a5,a4	# _14, _11, _13
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:124:     term->framebuffer = malloc(fb_size);
	.loc 1 124 25
	mul	a0,a5,a0	#, _14, _16
	call	calloc		#
.LVL83:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:124:     term->framebuffer = malloc(fb_size);
	.loc 1 124 23 discriminator 1
	sd	a0,336(sp)	# tmp241, term.framebuffer
	.loc 1 125 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:125:     if (term->framebuffer == NULL) {
	.loc 1 125 8 is_stmt 0
	beq	a0,zero,.L44	#, tmp241,,
	.loc 1 129 5 is_stmt 1
	.loc 1 130 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:131:     term->cursor_y = FONT_ASCENT;
	.loc 1 131 20 is_stmt 0
	li	a5,32		# tmp242,
	sd	s0,1504(sp)	#,
	sd	s1,1496(sp)	#,
	sd	s2,1488(sp)	#,
	sd	s3,1480(sp)	#,
	sd	s4,1472(sp)	#,
	sd	s5,1464(sp)	#,
	sd	s6,1456(sp)	#,
	sd	s7,1448(sp)	#,
	sd	s8,1440(sp)	#,
	sd	s9,1432(sp)	#,
	sd	s10,1424(sp)	#,
	sd	s11,1416(sp)	#,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:130:     term->cursor_x = 0;
	.loc 1 130 20
	sw	zero,356(sp)	#, term.cursor_x
	.loc 1 131 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:132:     term->line_index = 0;
	.loc 1 132 22 is_stmt 0
	sw	zero,1388(sp)	#, term.line_index
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:133:     term->shift_pressed = false;
	.loc 1 133 25
	sh	zero,1392(sp)	#, MEM <vector(2) unsigned char> [(_Bool *)&term + 1056B]
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:131:     term->cursor_y = FONT_ASCENT;
	.loc 1 131 20
	sw	a5,360(sp)	# tmp242, term.cursor_y
	.loc 1 132 5 is_stmt 1
	.loc 1 133 5
	.loc 1 134 5
	.loc 1 135 5
.LBB151:
.LBB152:
	.file 3 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h"
	.loc 3 14 5
	.loc 3 15 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:15:     register long a7 __asm__("a7") = GET_US;
	.loc 3 15 19 is_stmt 0
	li	a7,11		# a7,
	.loc 3 17 5 is_stmt 1
 #APP
# 17 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE152:
.LBE151:
.LBB153:
.LBB154:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:187:     terminal_print(term, PROMPT_TEXT, PROMPT_COLOR);
	.loc 1 187 5 is_stmt 0
	li	a2,2412544		# tmp464,
.LBE154:
.LBE153:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:135:     term->last_blink_time = get_us();
	.loc 1 135 29 discriminator 1
	slli	a5,a0,32	#, _20, tmp446
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
.LBB158:
.LBB155:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:187:     terminal_print(term, PROMPT_TEXT, PROMPT_COLOR);
	.loc 1 187 5
	lui	s7,%hi(.LC22)	# tmp411,
.LBE155:
.LBE158:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:135:     term->last_blink_time = get_us();
	.loc 1 135 29 discriminator 1
	srli	a5,a5,32	#, _20, _20
.LBB159:
.LBB156:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:187:     terminal_print(term, PROMPT_TEXT, PROMPT_COLOR);
	.loc 1 187 5
	addi	a0,sp,336	#, tmp467,
.LVL84:
	addi	a2,a2,1670	#,, tmp464
	addi	a1,s7,%lo(.LC22)	#, tmp411,
.LBE156:
.LBE159:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:135:     term->last_blink_time = get_us();
	.loc 1 135 27 discriminator 1
	sd	a5,1400(sp)	# _20, term.last_blink_time
	.loc 1 137 5 is_stmt 1
.LVL85:
.LBB160:
.LBB157:
	.loc 1 187 5
	lui	s8,%hi(.LC0)	# tmp416,
	call	terminal_print		#
.LVL86:
	lui	s6,%hi(.LANCHOR0)	# tmp410,
	lui	s2,%hi(.LANCHOR0+120)	# tmp427,
	lui	s3,%hi(MinecraftRegular_Bmg3_table)	# tmp420,
	lui	s9,%hi(.LANCHOR0+24)	# tmp429,
.LBE157:
.LBE160:
.LBE148:
.LBE147:
.LBB162:
.LBB163:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:258:     if (scancode & 0x8000) {
	.loc 1 258 18 is_stmt 0
	li	s0,32768		# tmp439,
.LBB164:
.LBB165:
.LBB166:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:205:         display_glyph(glyph, term->cursor_x, term->cursor_y,
	.loc 1 205 9
	li	s5,16777216		# tmp442,
	addi	a5,s8,%lo(.LC0)	# _85, tmp416,
	addi	s6,s6,%lo(.LANCHOR0)	# tmp409, tmp410,
	addi	s2,s2,%lo(.LANCHOR0+120)	# tmp422, tmp427,
	addi	s3,s3,%lo(MinecraftRegular_Bmg3_table)	# tmp418, tmp420,
	addi	s9,s9,%lo(.LANCHOR0+24)	# ivtmp.84, tmp429,
	sd	a5,8(sp)	# _85, %sfp
.LBE166:
.LBE165:
.LBB170:
.LBB171:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/german_keyboard_map.h:12:     scancode &= 0x7FFF;
	.file 4 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/german_keyboard_map.h"
	.loc 4 12 14
	addi	s4,s0,-1	#, tmp441, tmp439
.LBE171:
.LBE170:
.LBB174:
.LBB167:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:205:         display_glyph(glyph, term->cursor_x, term->cursor_y,
	.loc 1 205 9
	addi	s5,s5,-1	#, tmp443, tmp442
	lui	s10,%hi(.LC23)	# tmp412,
.LBE167:
.LBE174:
.LBE164:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:267:     if (scancode == SDL_SCANCODE_LSHIFT || scancode == SDL_SCANCODE_RSHIFT) {
	.loc 1 267 8
	li	s1,225		# tmp440,
.L45:
.LBE163:
.LBE162:
	.loc 1 363 5 is_stmt 1
	.loc 1 364 9 discriminator 1
.LVL87:
.LBB229:
.LBB227:
	.loc 1 249 5
.LBB179:
.LBB180:
	.file 5 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h"
	.loc 5 17 5
	.loc 5 18 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:18:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 5 18 19 is_stmt 0
	li	a7,13		# a7,
	.loc 5 20 5 is_stmt 1
 #APP
# 20 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 5 21 5
 #NO_APP
.LBE180:
.LBE179:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:249:     if (!key_available()) {
	.loc 1 249 8 is_stmt 0 discriminator 1
	beq	a0,zero,.L87	#, tmp447,,
.L46:
	.loc 1 255 5 is_stmt 1
.LBB182:
.LBB183:
	.loc 5 25 5
	.loc 5 26 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:26:     register long a7 __asm__("a7") = GET_KEY;
	.loc 5 26 19 is_stmt 0
	li	a7,14		# a7,
	.loc 5 28 5 is_stmt 1
 #APP
# 28 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 5 29 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:29:     return a0;
	.loc 5 29 12 is_stmt 0
 #NO_APP
	sext.w	s11,a0	# _24, a0.9_23
.LVL88:
.LBE183:
.LBE182:
	.loc 1 258 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:258:     if (scancode & 0x8000) {
	.loc 1 258 8 is_stmt 0
	and	a5,s11,s0	# tmp439, tmp273, _24
.LBB185:
.LBB184:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:29:     return a0;
	.loc 5 29 12
	mv	s8,a0	# a0.9_23, tmp449
.LBE184:
.LBE185:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:258:     if (scancode & 0x8000) {
	.loc 1 258 8
	bne	a5,zero,.L88	#, tmp273,,
	.loc 1 267 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:267:     if (scancode == SDL_SCANCODE_LSHIFT || scancode == SDL_SCANCODE_RSHIFT) {
	.loc 1 267 8 is_stmt 0
	andi	a5,s11,-5	#, tmp282, _24
	beq	a5,s1,.L89	#, tmp282, tmp440,
	.loc 1 273 5 is_stmt 1
.LVL89:
.LBB186:
.LBB187:
	.loc 1 148 5
	.loc 1 149 5
	.loc 1 150 9
	ld	a3,336(sp)		#, term.framebuffer
	lw	a2,360(sp)		#, term.cursor_y
	lw	a1,356(sp)		#, term.cursor_x
	li	a5,0		#,
	addi	a4,sp,344	#, tmp470,
	mv	a0,s2	#, tmp422
	call	display_glyph		#
.LVL90:
.LBE187:
.LBE186:
	.loc 1 276 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:276:     if (scancode == SDL_SCANCODE_BACKSPACE) {
	.loc 1 276 8 is_stmt 0
	li	a5,42		# tmp293,
	beq	s11,a5,.L90	#, _24, tmp293,
	.loc 1 279 10 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:279:     else if (scancode == SDL_SCANCODE_RETURN) {
	.loc 1 279 13 is_stmt 0
	li	a5,40		# tmp312,
	beq	s11,a5,.L91	#, _24, tmp312,
.LBB188:
	.loc 1 284 9 is_stmt 1
.LVL91:
.LBB175:
.LBB172:
	.loc 4 12 5
	.loc 4 14 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/german_keyboard_map.h:12:     scancode &= 0x7FFF;
	.loc 4 12 14 is_stmt 0
	and	a6,s8,s4	# tmp441, tmp366, a0.9_23
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/german_keyboard_map.h:14:     if (!shift) {
	.loc 4 14 8
	lbu	a5,1392(sp)	# term.shift_pressed, term.shift_pressed
	addiw	a6,a6,-4	#, tmp371, tmp366
	slli	a6,a6,48	#, _194, tmp371
	srli	a6,a6,48	#, _194, _194
	bne	a5,zero,.L65	#, term.shift_pressed,,
	.loc 4 16 9 is_stmt 1
	li	a5,96		# tmp376,
	bgtu	a6,a5,.L86	#, _194, tmp376,
	add	a6,s6,a6	# _194, tmp379, tmp409
	lbu	s8,136(a6)	# _110, CSWTCH.18[_194]
.LVL92:
	sext.w	a5,s8	# _111, _110
.L66:
.LVL93:
.LBE172:
.LBE175:
	.loc 1 285 9
.LBB176:
.LBB168:
	.loc 1 203 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:203:     const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 203 18 is_stmt 0
	slli	a5,a5,3	#, tmp387, _111
.LVL94:
	add	a5,s3,a5	# tmp387, tmp388, tmp418
	ld	s11,0(a5)		# glyph, MinecraftRegular_Bmg3_table[_92]
.LVL95:
	.loc 1 204 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:204:     if (glyph != NULL && term->line_index < MAX_LINE_LENGTH - 1) {
	.loc 1 204 8 is_stmt 0
	beq	s11,zero,.L86	#, glyph,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:204:     if (glyph != NULL && term->line_index < MAX_LINE_LENGTH - 1) {
	.loc 1 204 23 discriminator 1
	lw	a4,1388(sp)		# term.line_index, term.line_index
	li	a5,1022		# tmp392,
	bleu	a4,a5,.L84	#, term.line_index, tmp392,
.LVL96:
.L86:
	ld	a0,336(sp)		# term.framebuffer, term.framebuffer
.L54:
.LBE168:
.LBE176:
.LBE188:
	.loc 1 288 5 is_stmt 1
.LVL97:
.LBB189:
.LBB190:
	.loc 2 27 5
	.loc 2 28 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:28:     register int a7 asm("a7") = SHOW_BUFFER;
	.loc 2 28 18 is_stmt 0
	li	a7,101		# a7,
	.loc 2 29 5 is_stmt 1
 #APP
# 29 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL98:
 #NO_APP
.LBE190:
.LBE189:
.LBE227:
.LBE229:
	.loc 1 363 5
	.loc 1 364 9 discriminator 1
.LBB230:
.LBB228:
	.loc 1 249 5
.LBB191:
.LBB181:
	.loc 5 17 5
	.loc 5 18 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h:18:     register long a7 __asm__("a7") = KEY_AVAILABLE;
	.loc 5 18 19 is_stmt 0
	li	a7,13		# a7,
	.loc 5 20 5 is_stmt 1
 #APP
# 20 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/keyboard.h" 1
	ecall	
# 0 "" 2
	.loc 5 21 5
 #NO_APP
.LBE181:
.LBE191:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:249:     if (!key_available()) {
	.loc 1 249 8 is_stmt 0 discriminator 1
	bne	a0,zero,.L46	#, tmp447,,
.L87:
	.loc 1 250 9 is_stmt 1
.LVL99:
.LBB192:
.LBB193:
	.loc 3 22 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:22:     register long a0 __asm__("a0") = us;
	.loc 3 22 19 is_stmt 0
	li	a0,32768		# tmp462,
	addi	a0,a0,-768	#, a0, tmp462
	.loc 3 23 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:23:     register long a7 __asm__("a7") = SLEEP_US;
	.loc 3 23 19 is_stmt 0
	li	a7,12		# a7,
	.loc 3 25 5 is_stmt 1
 #APP
# 25 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
.LVL100:
 #NO_APP
.LBE193:
.LBE192:
	.loc 1 251 9
.LBB194:
.LBB195:
	.loc 1 156 5
.LBB196:
.LBB197:
	.loc 3 14 5
	.loc 3 15 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h:15:     register long a7 __asm__("a7") = GET_US;
	.loc 3 15 19 is_stmt 0
	li	a7,11		# a7,
	.loc 3 17 5 is_stmt 1
 #APP
# 17 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/timer.h" 1
	ecall	
# 0 "" 2
	.loc 3 18 5
 #NO_APP
.LBE197:
.LBE196:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:157:     if (current_time - term->last_blink_time > CURSOR_BLINK_US) {
	.loc 1 157 22 is_stmt 0
	ld	a4,1400(sp)		# term.last_blink_time, term.last_blink_time
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:156:     const uint64_t current_time = get_us();
	.loc 1 156 20 discriminator 1
	slli	a0,a0,32	#, current_time, tmp448
	srli	a0,a0,32	#, current_time, current_time
.LVL101:
	.loc 1 157 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:157:     if (current_time - term->last_blink_time > CURSOR_BLINK_US) {
	.loc 1 157 8 is_stmt 0
	li	a5,499712		# tmp463,
	addi	a5,a5,288	#, tmp252, tmp463
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:157:     if (current_time - term->last_blink_time > CURSOR_BLINK_US) {
	.loc 1 157 22
	sub	a4,a0,a4	# _38, current_time, term.last_blink_time
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:157:     if (current_time - term->last_blink_time > CURSOR_BLINK_US) {
	.loc 1 157 8
	bleu	a4,a5,.L45	#, _38, tmp252,
.LBB198:
	.loc 1 158 9 is_stmt 1
.LBB199:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:161:             uint32_t color = term->cursor_visible ? TEXT_COLOR : BG_COLOR;
	.loc 1 161 64 is_stmt 0
	lbu	a4,1393(sp)	# term.cursor_visible, term.cursor_visible
.LBE199:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:158:         term->last_blink_time = current_time;
	.loc 1 158 31
	sd	a0,1400(sp)	# current_time, term.last_blink_time
	.loc 1 159 9 is_stmt 1
.LVL102:
	.loc 1 160 9
.LBB202:
	.loc 1 161 13
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:161:             uint32_t color = term->cursor_visible ? TEXT_COLOR : BG_COLOR;
	.loc 1 161 64 is_stmt 0 discriminator 2
	li	a5,0		# iftmp.8_45,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:161:             uint32_t color = term->cursor_visible ? TEXT_COLOR : BG_COLOR;
	.loc 1 161 64
	beq	a4,zero,.L48	#, term.cursor_visible,,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:161:             uint32_t color = term->cursor_visible ? TEXT_COLOR : BG_COLOR;
	.loc 1 161 64 discriminator 1
	mv	a5,s5	# iftmp.8_45, tmp443
.L48:
.LVL103:
	.loc 1 162 13 is_stmt 1
	ld	a3,336(sp)		#, term.framebuffer
	lw	a2,360(sp)		#, term.cursor_y
	lw	a1,356(sp)		#, term.cursor_x
	mv	a0,s2	#, tmp422
.LVL104:
	addi	a4,sp,344	#, tmp469,
	call	display_glyph		#
.LVL105:
	.loc 1 164 13
.LBB200:
.LBB201:
	.loc 2 27 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:27:     register int a0 asm("a0") = (uintptr_t)buffer;
	.loc 2 27 18 is_stmt 0
	lw	a0,336(sp)		#, term.framebuffer
	.loc 2 28 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h:28:     register int a7 asm("a7") = SHOW_BUFFER;
	.loc 2 28 18 is_stmt 0
	li	a7,101		# a7,
	.loc 2 29 5 is_stmt 1
 #APP
# 29 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/display.h" 1
	ecall	
# 0 "" 2
.LVL106:
 #NO_APP
.LBE201:
.LBE200:
	.loc 1 165 13
	lbu	a5,1393(sp)	# term.cursor_visible, term.cursor_visible
	xori	a5,a5,1	#, tmp268, term.cursor_visible
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:165:             term->cursor_visible = !term->cursor_visible;
	.loc 1 165 34 is_stmt 0
	sb	a5,1393(sp)	# tmp268, term.cursor_visible
	j	.L45		#
.LVL107:
.L84:
.LBE202:
.LBE198:
.LBE195:
.LBE194:
.LBB203:
.LBB177:
.LBB169:
	.loc 1 205 9 is_stmt 1
	ld	a3,336(sp)		#, term.framebuffer
	lw	a2,360(sp)		#, term.cursor_y
	lw	a1,356(sp)		#, term.cursor_x
	mv	a5,s5	#, tmp443
	addi	a4,sp,344	#, tmp483,
	mv	a0,s11	#, glyph
	call	display_glyph		#
.LVL108:
	.loc 1 207 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:         term->input_line[term->line_index++] = c;
	.loc 1 207 30 is_stmt 0
	lw	a5,1388(sp)		# _99, term.line_index
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:208:         term->cursor_x += glyph->advance;
	.loc 1 208 24
	lw	a3,356(sp)		# term.cursor_x, term.cursor_x
	ld	a0,336(sp)		# term.framebuffer, term.framebuffer
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:         term->input_line[term->line_index++] = c;
	.loc 1 207 46
	slli	a4,a5,32	#, _99, _99
	srli	a4,a4,32	#, _99, _99
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:         term->input_line[term->line_index++] = c;
	.loc 1 207 42
	addiw	a5,a5,1	#, tmp400, _99
	sw	a5,1388(sp)	# tmp400, term.line_index
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:207:         term->input_line[term->line_index++] = c;
	.loc 1 207 46
	add	a5,a4,sp	#, tmp402, tmp484
	sb	s8,364(a5)	# _110, term.input_line[_99]
	.loc 1 208 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:208:         term->cursor_x += glyph->advance;
	.loc 1 208 32 is_stmt 0
	lbu	a5,4(s11)	# _103, glyph_93->advance
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:208:         term->cursor_x += glyph->advance;
	.loc 1 208 24
	addw	a5,a5,a3	# term.cursor_x, tmp407, _103
	sw	a5,356(sp)	# tmp407, term.cursor_x
	j	.L54		#
.LVL109:
.L88:
.LBE169:
.LBE177:
.LBE203:
	.loc 1 259 9 is_stmt 1
	.loc 1 260 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:260:         if (scancode == SDL_SCANCODE_LSHIFT || scancode == SDL_SCANCODE_RSHIFT) {
	.loc 1 260 12 is_stmt 0
	li	a5,32768		# tmp461,
	addi	a5,a5,-5	#, tmp276, tmp461
	and	a7,s11,a5	# tmp276, tmp278, _24
	bne	a7,s1,.L45	#, tmp278, tmp440,
	.loc 1 261 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:261:             term->shift_pressed = false;
	.loc 1 261 33 is_stmt 0
	sb	zero,1392(sp)	#, term.shift_pressed
	j	.L45		#
.LVL110:
.L89:
	.loc 1 268 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:268:         term->shift_pressed = true;
	.loc 1 268 29 is_stmt 0
	li	a5,1		# tmp284,
	sb	a5,1392(sp)	# tmp284, term.shift_pressed
	.loc 1 269 9 is_stmt 1
	j	.L45		#
.L91:
	.loc 1 280 9
.LVL111:
.LBB204:
.LBB205:
	.loc 1 235 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:235:     term->input_line[term->line_index] = '\0';
	.loc 1 235 40 is_stmt 0
	lwu	a4,1388(sp)	# term.line_index, term.line_index
.LBB206:
.LBB207:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20
	lw	a5,360(sp)		# term.cursor_y, term.cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a3,348(sp)		# _72, term.fb_info.height
.LBE207:
.LBE206:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:235:     term->input_line[term->line_index] = '\0';
	.loc 1 235 40
	add	a4,a4,sp	#, tmp314, tmp473
.LBB210:
.LBB208:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20
	addiw	a5,a5,40	#, tmp318, term.cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,356(sp)	#, term.cursor_x
.LBE208:
.LBE210:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:235:     term->input_line[term->line_index] = '\0';
	.loc 1 235 40
	sb	zero,364(a4)	#, term.input_line[_68]
	.loc 1 236 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:236:     term->line_index = 0;
	.loc 1 236 22 is_stmt 0
	sw	zero,1388(sp)	#, term.line_index
	.loc 1 238 5 is_stmt 1
.LVL112:
.LBB211:
.LBB209:
	.loc 1 171 5
	.loc 1 172 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	sw	a5,360(sp)	# tmp318, term.cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a3,.L57	#, tmp318, _72,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a3,a3,-40	#, tmp320, _72
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a3,360(sp)	# tmp320, term.cursor_y
.L57:
.LVL113:
.LBE209:
.LBE211:
	.loc 1 240 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:240:     if (strlen(term->input_line) > 0) {
	.loc 1 240 8 is_stmt 0
	lbu	a5,364(sp)	# MEM[(const char *)&term + 28B], MEM[(const char *)&term + 28B]
	bne	a5,zero,.L92	#, MEM[(const char *)&term + 28B],,
.LVL114:
.L59:
	.loc 1 245 5 is_stmt 1
.LBB212:
.LBB213:
	.loc 1 187 5
	li	a2,2412544		# tmp459,
	addi	a0,sp,336	#, tmp482,
.LVL115:
	addi	a2,a2,1670	#,, tmp459
	addi	a1,s7,%lo(.LC22)	#, tmp411,
	call	terminal_print		#
.LVL116:
	ld	a0,336(sp)		# term.framebuffer, term.framebuffer
.LBE213:
.LBE212:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:246: }
	.loc 1 246 1 is_stmt 0
	j	.L54		#
.LVL117:
.L65:
.LBE205:
.LBE204:
.LBB222:
.LBB178:
.LBB173:
	.loc 4 81 9 is_stmt 1
	li	a5,96		# tmp381,
	bgtu	a6,a5,.L86	#, _194, tmp381,
	add	a6,s6,a6	# _194, tmp384, tmp409
	lbu	s8,240(a6)	# _110, CSWTCH.19[_194]
.LVL118:
	sext.w	a5,s8	# _111, _110
	j	.L66		#
.LVL119:
.L90:
.LBE173:
.LBE178:
.LBE222:
	.loc 1 277 9
.LBB223:
.LBB224:
	.loc 1 191 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:191:     if (term->line_index > 0) {
	.loc 1 191 13 is_stmt 0
	lw	a5,1388(sp)		# _56, term.line_index
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:191:     if (term->line_index > 0) {
	.loc 1 191 8
	beq	a5,zero,.L86	#, _56,,
.LBB225:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:192:         const char c = term->input_line[--term->line_index];
	.loc 1 192 41
	addiw	a5,a5,-1	#, tmp295, _56
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:192:         const char c = term->input_line[--term->line_index];
	.loc 1 192 20
	slli	a4,a5,32	#, _57, tmp295
	srli	a4,a4,32	#, _57, _57
	sw	a5,1388(sp)	# tmp295, term.line_index
	add	a5,a4,sp	#, tmp299, tmp471
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:193:         const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 193 22
	lbu	a5,364(a5)	# _59, term.input_line[_57]
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:196:             display_glyph(glyph, term->cursor_x, term->cursor_y,
	.loc 1 196 13
	ld	a0,336(sp)		# term.framebuffer, term.framebuffer
	.loc 1 192 9 is_stmt 1
.LVL120:
	.loc 1 193 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:193:         const Glyph* glyph = MinecraftRegular_Bmg3_table[(unsigned char)c];
	.loc 1 193 22 is_stmt 0
	slli	a5,a5,3	#, tmp302, _59
	add	a5,s3,a5	# tmp302, tmp303, tmp418
	ld	a5,0(a5)		# glyph, MinecraftRegular_Bmg3_table[_59]
.LVL121:
	.loc 1 194 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:194:         if (glyph != NULL) {
	.loc 1 194 12 is_stmt 0
	beq	a5,zero,.L54	#, glyph,,
	.loc 1 195 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:195:             term->cursor_x -= glyph->advance;
	.loc 1 195 36 is_stmt 0
	lbu	a4,4(a5)	# _63, glyph_60->advance
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:195:             term->cursor_x -= glyph->advance;
	.loc 1 195 28
	lw	a1,356(sp)		# term.cursor_x, term.cursor_x
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:196:             display_glyph(glyph, term->cursor_x, term->cursor_y,
	.loc 1 196 13
	lw	a2,360(sp)		#, term.cursor_y
	mv	a3,a0	#, term.framebuffer
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:195:             term->cursor_x -= glyph->advance;
	.loc 1 195 28
	subw	a1,a1,a4	# tmp308, term.cursor_x, _63
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:196:             display_glyph(glyph, term->cursor_x, term->cursor_y,
	.loc 1 196 13
	mv	a0,a5	#, glyph
	addi	a4,sp,344	#, tmp472,
	li	a5,0		#,
.LVL122:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:195:             term->cursor_x -= glyph->advance;
	.loc 1 195 28
	sw	a1,356(sp)	# tmp308, term.cursor_x
	.loc 1 196 13 is_stmt 1
	call	display_glyph		#
.LVL123:
	j	.L86		#
.LVL124:
.L92:
.LBE225:
.LBE224:
.LBE223:
.LBB226:
.LBB221:
	.loc 1 241 9
.LBB214:
.LBB215:
	.loc 1 213 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:214:     char args[MAX_ARGS_LENGTH] = {0};
	.loc 1 214 10 is_stmt 0
	li	a2,256		#,
	li	a1,0		#,
	addi	a0,sp,80	#, tmp474,
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:213:     char command[MAX_COMMAND_LENGTH] = {0};
	.loc 1 213 10
	sd	zero,16(sp)	#, command
	sd	zero,24(sp)	#, command
	sd	zero,32(sp)	#, command
	sd	zero,40(sp)	#, command
	sd	zero,48(sp)	#, command
	sd	zero,56(sp)	#, command
	sd	zero,64(sp)	#, command
	sd	zero,72(sp)	#, command
	.loc 1 214 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:214:     char args[MAX_ARGS_LENGTH] = {0};
	.loc 1 214 10 is_stmt 0
	call	memset		#
.LVL125:
	.loc 1 217 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:217:     if (sscanf(input, "%63s %255[^\n]", command, args) < 1) {
	.loc 1 217 9 is_stmt 0
	addi	a3,sp,80	#, tmp475,
	addi	a2,sp,16	#,,
	addi	a1,s10,%lo(.LC23)	#, tmp412,
	addi	a0,sp,364	#, tmp476,
.LVL126:
	call	sscanf		#
.LVL127:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:217:     if (sscanf(input, "%63s %255[^\n]", command, args) < 1) {
	.loc 1 217 8 discriminator 1
	ble	a0,zero,.L63	#, tmp450,,
.LBB216:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 222 32 discriminator 1
	ld	a1,8(sp)		# _85, %sfp
	mv	s11,s9	# ivtmp.84, ivtmp.84
.LVL128:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 222 14
	li	s8,0		# i,
.LVL129:
	j	.L64		#
.LVL130:
.L61:
	.loc 1 222 48 is_stmt 1 discriminator 2
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 222 32 is_stmt 0 discriminator 1
	ld	a1,0(s11)		# _85, MEM[(const char * *)_91 + -24B]
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 222 38 discriminator 1
	addi	s11,s11,24	#, ivtmp.84, ivtmp.84
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:222:     for (int i = 0; commands[i].name != NULL; i++) {
	.loc 1 222 48 discriminator 2
	addiw	s8,s8,1	#, i, i
.LVL131:
	.loc 1 222 38 is_stmt 1 discriminator 1
	beq	a1,zero,.L93	#, _85,,
.LVL132:
.L64:
	.loc 1 223 9
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:223:         if (strcmp(command, commands[i].name) == 0) {
	.loc 1 223 13 is_stmt 0
	addi	a0,sp,16	#,,
	call	strcmp		#
.LVL133:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:223:         if (strcmp(command, commands[i].name) == 0) {
	.loc 1 223 12 discriminator 1
	bne	a0,zero,.L61	#, tmp451,,
	.loc 1 224 13 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:224:             return commands[i].handler(term, args);
	.loc 1 224 31 is_stmt 0
	slli	a5,s8,1	#, tmp343, i
	add	a5,a5,s8	# i, tmp344, tmp343
	slli	a5,a5,3	#, tmp345, tmp344
	add	a5,s6,a5	# tmp345, tmp341, tmp409
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:224:             return commands[i].handler(term, args);
	.loc 1 224 20
	ld	a5,8(a5)		# commands[i_113].handler, commands[i_113].handler
	addi	a1,sp,80	#, tmp477,
	addi	a0,sp,336	#, tmp478,
.LVL134:
	jalr	a5		# commands[i_113].handler
.LVL135:
.LBE216:
.LBE215:
.LBE214:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:241:         if (!terminal_execute_command(term, term->input_line)) {
	.loc 1 241 12 discriminator 1
	bne	a0,zero,.L59	#, tmp452,,
.L63:
	.loc 1 242 13 is_stmt 1
.LVL136:
.LBB218:
.LBB219:
	.loc 1 171 5
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	lw	a5,360(sp)		# term.cursor_y, term.cursor_y
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 40
	lw	a4,348(sp)		# _81, term.fb_info.height
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:171:     term->cursor_x = 0;
	.loc 1 171 20
	sw	zero,356(sp)	#, term.cursor_x
	.loc 1 172 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:172:     term->cursor_y += FONT_LINEHEIGHT;
	.loc 1 172 20 is_stmt 0
	addiw	a5,a5,40	#, tmp359, term.cursor_y
	sw	a5,360(sp)	# tmp359, term.cursor_y
	.loc 1 175 5 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:175:     if (term->cursor_y >= term->fb_info.height) {
	.loc 1 175 8 is_stmt 0
	bltu	a5,a4,.L59	#, tmp359, _81,
	.loc 1 176 9 is_stmt 1
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 47 is_stmt 0
	addiw	a4,a4,-40	#, tmp361, _81
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:176:         term->cursor_y = term->fb_info.height - FONT_LINEHEIGHT;
	.loc 1 176 24
	sw	a4,360(sp)	# tmp361, term.cursor_y
	j	.L59		#
.LVL137:
.L93:
.LBE219:
.LBE218:
.LBB220:
.LBB217:
	.loc 1 229 5 is_stmt 1
	lui	a5,%hi(.LC24)	# tmp479,
	li	a2,14364672		# tmp460,
	addi	a1,a5,%lo(.LC24)	#, tmp479,
	addi	a0,sp,336	#, tmp480,
.LVL138:
	addi	a2,a2,48	#,, tmp460
	call	terminal_print		#
.LVL139:
	.loc 1 230 5
	li	a2,16777216		# tmp355,
	addi	a1,sp,16	#,,
	addi	a0,sp,336	#, tmp481,
.LVL140:
	addi	a2,a2,-1	#,, tmp355
	call	terminal_print		#
.LVL141:
	.loc 1 231 5
	j	.L63		#
.LVL142:
.L44:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
.LBE217:
.LBE220:
.LBE221:
.LBE226:
.LBE228:
.LBE230:
.LBB231:
.LBB161:
# /Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c:120:         exit(1);
	.loc 1 120 9 is_stmt 0
	li	a0,1		#,
	sd	s0,1504(sp)	#,
	sd	s1,1496(sp)	#,
	sd	s2,1488(sp)	#,
	sd	s3,1480(sp)	#,
	sd	s4,1472(sp)	#,
	sd	s5,1464(sp)	#,
	sd	s6,1456(sp)	#,
	sd	s7,1448(sp)	#,
	sd	s8,1440(sp)	#,
	sd	s9,1432(sp)	#,
	sd	s10,1424(sp)	#,
	sd	s11,1416(sp)	#,
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
	.loc 1 120 9 is_stmt 1
	call	exit		#
.LVL143:
.LBE161:
.LBE231:
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"Print information"
	.align	3
.LC26:
	.string	"echo"
	.align	3
.LC27:
	.string	"Print text to the screen"
	.align	3
.LC28:
	.string	"clear"
	.align	3
.LC29:
	.string	"Clear the screen"
	.align	3
.LC30:
	.string	"help"
	.align	3
.LC31:
	.string	"Show available commands"
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	commands, @object
	.size	commands, 120
commands:
# name:
	.dword	.LC0
# handler:
	.dword	cmd_neofetch
# description:
	.dword	.LC25
# name:
	.dword	.LC26
# handler:
	.dword	cmd_echo
# description:
	.dword	.LC27
# name:
	.dword	.LC28
# handler:
	.dword	cmd_clear
# description:
	.dword	.LC29
# name:
	.dword	.LC30
# handler:
	.dword	cmd_help
# description:
	.dword	.LC31
# name:
	.dword	0
# handler:
	.dword	0
# description:
	.dword	0
	.type	MinecraftRegular_Bmg3_glyph_95, @object
	.size	MinecraftRegular_Bmg3_glyph_95, 16
MinecraftRegular_Bmg3_glyph_95:
# width:
	.byte	24
# height:
	.byte	4
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_95_data
	.type	CSWTCH.18, @object
	.size	CSWTCH.18, 97
CSWTCH.18:
	.byte	97
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	107
	.byte	108
	.byte	109
	.byte	110
	.byte	111
	.byte	112
	.byte	113
	.byte	114
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	122
	.byte	121
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	48
	.byte	13
	.byte	0
	.byte	8
	.byte	9
	.byte	32
	.byte	-33
	.byte	-76
	.byte	-4
	.byte	43
	.byte	35
	.byte	0
	.byte	-10
	.byte	-28
	.byte	94
	.byte	44
	.byte	46
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.zero	7
	.type	CSWTCH.19, @object
	.size	CSWTCH.19, 97
CSWTCH.19:
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	71
	.byte	72
	.byte	73
	.byte	74
	.byte	75
	.byte	76
	.byte	77
	.byte	78
	.byte	79
	.byte	80
	.byte	81
	.byte	82
	.byte	83
	.byte	84
	.byte	85
	.byte	86
	.byte	87
	.byte	88
	.byte	90
	.byte	89
	.byte	33
	.byte	34
	.byte	-89
	.byte	36
	.byte	37
	.byte	38
	.byte	47
	.byte	40
	.byte	41
	.byte	61
	.byte	13
	.byte	0
	.byte	8
	.byte	9
	.byte	32
	.byte	63
	.byte	96
	.byte	-36
	.byte	42
	.byte	39
	.byte	0
	.byte	-42
	.byte	-60
	.byte	-80
	.byte	59
	.byte	58
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.zero	7
	.type	MinecraftRegular_Bmg3_table, @object
	.size	MinecraftRegular_Bmg3_table, 2048
MinecraftRegular_Bmg3_table:
	.zero	256
	.dword	MinecraftRegular_Bmg3_glyph_32
	.dword	MinecraftRegular_Bmg3_glyph_33
	.dword	MinecraftRegular_Bmg3_glyph_34
	.dword	MinecraftRegular_Bmg3_glyph_35
	.dword	MinecraftRegular_Bmg3_glyph_36
	.dword	MinecraftRegular_Bmg3_glyph_37
	.dword	MinecraftRegular_Bmg3_glyph_38
	.dword	MinecraftRegular_Bmg3_glyph_39
	.dword	MinecraftRegular_Bmg3_glyph_40
	.dword	MinecraftRegular_Bmg3_glyph_41
	.dword	MinecraftRegular_Bmg3_glyph_42
	.dword	MinecraftRegular_Bmg3_glyph_43
	.dword	MinecraftRegular_Bmg3_glyph_44
	.dword	MinecraftRegular_Bmg3_glyph_45
	.dword	MinecraftRegular_Bmg3_glyph_46
	.dword	MinecraftRegular_Bmg3_glyph_47
	.dword	MinecraftRegular_Bmg3_glyph_48
	.dword	MinecraftRegular_Bmg3_glyph_49
	.dword	MinecraftRegular_Bmg3_glyph_50
	.dword	MinecraftRegular_Bmg3_glyph_51
	.dword	MinecraftRegular_Bmg3_glyph_52
	.dword	MinecraftRegular_Bmg3_glyph_53
	.dword	MinecraftRegular_Bmg3_glyph_54
	.dword	MinecraftRegular_Bmg3_glyph_55
	.dword	MinecraftRegular_Bmg3_glyph_56
	.dword	MinecraftRegular_Bmg3_glyph_57
	.dword	MinecraftRegular_Bmg3_glyph_58
	.dword	MinecraftRegular_Bmg3_glyph_59
	.dword	MinecraftRegular_Bmg3_glyph_60
	.dword	MinecraftRegular_Bmg3_glyph_61
	.dword	MinecraftRegular_Bmg3_glyph_62
	.dword	MinecraftRegular_Bmg3_glyph_63
	.dword	MinecraftRegular_Bmg3_glyph_64
	.dword	MinecraftRegular_Bmg3_glyph_65
	.dword	MinecraftRegular_Bmg3_glyph_66
	.dword	MinecraftRegular_Bmg3_glyph_67
	.dword	MinecraftRegular_Bmg3_glyph_68
	.dword	MinecraftRegular_Bmg3_glyph_69
	.dword	MinecraftRegular_Bmg3_glyph_70
	.dword	MinecraftRegular_Bmg3_glyph_71
	.dword	MinecraftRegular_Bmg3_glyph_72
	.dword	MinecraftRegular_Bmg3_glyph_73
	.dword	MinecraftRegular_Bmg3_glyph_74
	.dword	MinecraftRegular_Bmg3_glyph_75
	.dword	MinecraftRegular_Bmg3_glyph_76
	.dword	MinecraftRegular_Bmg3_glyph_77
	.dword	MinecraftRegular_Bmg3_glyph_78
	.dword	MinecraftRegular_Bmg3_glyph_79
	.dword	MinecraftRegular_Bmg3_glyph_80
	.dword	MinecraftRegular_Bmg3_glyph_81
	.dword	MinecraftRegular_Bmg3_glyph_82
	.dword	MinecraftRegular_Bmg3_glyph_83
	.dword	MinecraftRegular_Bmg3_glyph_84
	.dword	MinecraftRegular_Bmg3_glyph_85
	.dword	MinecraftRegular_Bmg3_glyph_86
	.dword	MinecraftRegular_Bmg3_glyph_87
	.dword	MinecraftRegular_Bmg3_glyph_88
	.dword	MinecraftRegular_Bmg3_glyph_89
	.dword	MinecraftRegular_Bmg3_glyph_90
	.dword	MinecraftRegular_Bmg3_glyph_91
	.dword	MinecraftRegular_Bmg3_glyph_92
	.dword	MinecraftRegular_Bmg3_glyph_93
	.dword	MinecraftRegular_Bmg3_glyph_94
	.dword	MinecraftRegular_Bmg3_glyph_95
	.dword	MinecraftRegular_Bmg3_glyph_96
	.dword	MinecraftRegular_Bmg3_glyph_97
	.dword	MinecraftRegular_Bmg3_glyph_98
	.dword	MinecraftRegular_Bmg3_glyph_99
	.dword	MinecraftRegular_Bmg3_glyph_100
	.dword	MinecraftRegular_Bmg3_glyph_101
	.dword	MinecraftRegular_Bmg3_glyph_102
	.dword	MinecraftRegular_Bmg3_glyph_103
	.dword	MinecraftRegular_Bmg3_glyph_104
	.dword	MinecraftRegular_Bmg3_glyph_105
	.dword	MinecraftRegular_Bmg3_glyph_106
	.dword	MinecraftRegular_Bmg3_glyph_107
	.dword	MinecraftRegular_Bmg3_glyph_108
	.dword	MinecraftRegular_Bmg3_glyph_109
	.dword	MinecraftRegular_Bmg3_glyph_110
	.dword	MinecraftRegular_Bmg3_glyph_111
	.dword	MinecraftRegular_Bmg3_glyph_112
	.dword	MinecraftRegular_Bmg3_glyph_113
	.dword	MinecraftRegular_Bmg3_glyph_114
	.dword	MinecraftRegular_Bmg3_glyph_115
	.dword	MinecraftRegular_Bmg3_glyph_116
	.dword	MinecraftRegular_Bmg3_glyph_117
	.dword	MinecraftRegular_Bmg3_glyph_118
	.dword	MinecraftRegular_Bmg3_glyph_119
	.dword	MinecraftRegular_Bmg3_glyph_120
	.dword	MinecraftRegular_Bmg3_glyph_121
	.dword	MinecraftRegular_Bmg3_glyph_122
	.dword	MinecraftRegular_Bmg3_glyph_123
	.dword	MinecraftRegular_Bmg3_glyph_124
	.dword	MinecraftRegular_Bmg3_glyph_125
	.dword	MinecraftRegular_Bmg3_glyph_126
	.zero	320
	.dword	MinecraftRegular_Bmg3_glyph_U00A7
	.zero	32
	.dword	MinecraftRegular_Bmg3_glyph_U00AC
	.zero	24
	.dword	MinecraftRegular_Bmg3_glyph_U00B0
	.zero	8
	.dword	MinecraftRegular_Bmg3_glyph_U00B2
	.dword	MinecraftRegular_Bmg3_glyph_U00B3
	.zero	8
	.dword	MinecraftRegular_Bmg3_glyph_U00B5
	.zero	112
	.dword	MinecraftRegular_Bmg3_glyph_U00C4
	.zero	136
	.dword	MinecraftRegular_Bmg3_glyph_U00D6
	.zero	40
	.dword	MinecraftRegular_Bmg3_glyph_U00DC
	.zero	16
	.dword	MinecraftRegular_Bmg3_glyph_U00DF
	.zero	32
	.dword	MinecraftRegular_Bmg3_glyph_U00E4
	.zero	136
	.dword	MinecraftRegular_Bmg3_glyph_U00F6
	.zero	40
	.dword	MinecraftRegular_Bmg3_glyph_U00FC
	.zero	24
	.type	MinecraftRegular_Bmg3_glyph_U00AC, @object
	.size	MinecraftRegular_Bmg3_glyph_U00AC, 16
MinecraftRegular_Bmg3_glyph_U00AC:
# width:
	.byte	24
# height:
	.byte	12
# x_offset:
	.byte	0
# y_offset:
	.byte	-12
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00AC_data
	.type	MinecraftRegular_Bmg3_glyph_U00AC_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00AC_data, 36
MinecraftRegular_Bmg3_glyph_U00AC_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00B5, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B5, 16
MinecraftRegular_Bmg3_glyph_U00B5:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00B5_data
	.type	MinecraftRegular_Bmg3_glyph_U00B5_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B5_data, 0
MinecraftRegular_Bmg3_glyph_U00B5_data:
	.type	MinecraftRegular_Bmg3_glyph_U00B3, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B3, 16
MinecraftRegular_Bmg3_glyph_U00B3:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00B3_data
	.type	MinecraftRegular_Bmg3_glyph_U00B3_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B3_data, 0
MinecraftRegular_Bmg3_glyph_U00B3_data:
	.type	MinecraftRegular_Bmg3_glyph_U00B2, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B2, 16
MinecraftRegular_Bmg3_glyph_U00B2:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00B2_data
	.type	MinecraftRegular_Bmg3_glyph_U00B2_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B2_data, 0
MinecraftRegular_Bmg3_glyph_U00B2_data:
	.type	MinecraftRegular_Bmg3_glyph_U00B0, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B0, 16
MinecraftRegular_Bmg3_glyph_U00B0:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00B0_data
	.type	MinecraftRegular_Bmg3_glyph_U00B0_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00B0_data, 0
MinecraftRegular_Bmg3_glyph_U00B0_data:
	.type	MinecraftRegular_Bmg3_glyph_U00A7, @object
	.size	MinecraftRegular_Bmg3_glyph_U00A7, 16
MinecraftRegular_Bmg3_glyph_U00A7:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00A7_data
	.type	MinecraftRegular_Bmg3_glyph_U00A7_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00A7_data, 84
MinecraftRegular_Bmg3_glyph_U00A7_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00DF, @object
	.size	MinecraftRegular_Bmg3_glyph_U00DF, 16
MinecraftRegular_Bmg3_glyph_U00DF:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00DF_data
	.type	MinecraftRegular_Bmg3_glyph_U00DF_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00DF_data, 0
MinecraftRegular_Bmg3_glyph_U00DF_data:
	.type	MinecraftRegular_Bmg3_glyph_U00DC, @object
	.size	MinecraftRegular_Bmg3_glyph_U00DC, 16
MinecraftRegular_Bmg3_glyph_U00DC:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00DC_data
	.type	MinecraftRegular_Bmg3_glyph_U00DC_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00DC_data, 84
MinecraftRegular_Bmg3_glyph_U00DC_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00FC, @object
	.size	MinecraftRegular_Bmg3_glyph_U00FC, 16
MinecraftRegular_Bmg3_glyph_U00FC:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00FC_data
	.type	MinecraftRegular_Bmg3_glyph_U00FC_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00FC_data, 84
MinecraftRegular_Bmg3_glyph_U00FC_data:
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.ascii	"\340\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00D6, @object
	.size	MinecraftRegular_Bmg3_glyph_U00D6, 16
MinecraftRegular_Bmg3_glyph_U00D6:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00D6_data
	.type	MinecraftRegular_Bmg3_glyph_U00D6_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00D6_data, 0
MinecraftRegular_Bmg3_glyph_U00D6_data:
	.type	MinecraftRegular_Bmg3_glyph_U00F6, @object
	.size	MinecraftRegular_Bmg3_glyph_U00F6, 16
MinecraftRegular_Bmg3_glyph_U00F6:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00F6_data
	.type	MinecraftRegular_Bmg3_glyph_U00F6_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00F6_data, 84
MinecraftRegular_Bmg3_glyph_U00F6_data:
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00C4, @object
	.size	MinecraftRegular_Bmg3_glyph_U00C4, 16
MinecraftRegular_Bmg3_glyph_U00C4:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00C4_data
	.type	MinecraftRegular_Bmg3_glyph_U00C4_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00C4_data, 84
MinecraftRegular_Bmg3_glyph_U00C4_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\377\377\340\377\377\340\377\377\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_U00E4, @object
	.size	MinecraftRegular_Bmg3_glyph_U00E4, 16
MinecraftRegular_Bmg3_glyph_U00E4:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_U00E4_data
	.type	MinecraftRegular_Bmg3_glyph_U00E4_data, @object
	.size	MinecraftRegular_Bmg3_glyph_U00E4_data, 0
MinecraftRegular_Bmg3_glyph_U00E4_data:
	.type	MinecraftRegular_Bmg3_glyph_126, @object
	.size	MinecraftRegular_Bmg3_glyph_126, 16
MinecraftRegular_Bmg3_glyph_126:
# width:
	.byte	28
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	28
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_126_data
	.type	MinecraftRegular_Bmg3_glyph_126_data, @object
	.size	MinecraftRegular_Bmg3_glyph_126_data, 98
MinecraftRegular_Bmg3_glyph_126_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\376"
	.string	"\340\017\340\016"
	.string	"\376"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	"\376"
	.string	"\340\017\340\016"
	.string	"\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	6
	.type	MinecraftRegular_Bmg3_glyph_125, @object
	.size	MinecraftRegular_Bmg3_glyph_125, 16
MinecraftRegular_Bmg3_glyph_125:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_125_data
	.type	MinecraftRegular_Bmg3_glyph_125_data, @object
	.size	MinecraftRegular_Bmg3_glyph_125_data, 70
MinecraftRegular_Bmg3_glyph_125_data:
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_124, @object
	.size	MinecraftRegular_Bmg3_glyph_124, 16
MinecraftRegular_Bmg3_glyph_124:
# width:
	.byte	8
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_124_data
	.type	MinecraftRegular_Bmg3_glyph_124_data, @object
	.size	MinecraftRegular_Bmg3_glyph_124_data, 28
MinecraftRegular_Bmg3_glyph_124_data:
	.string	""
	.string	"\340\340\340\340\340\340\340\340\340\340\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\340\340\340\340\340\340\340\340\340\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_123, @object
	.size	MinecraftRegular_Bmg3_glyph_123, 16
MinecraftRegular_Bmg3_glyph_123:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_123_data
	.type	MinecraftRegular_Bmg3_glyph_123_data, @object
	.size	MinecraftRegular_Bmg3_glyph_123_data, 70
MinecraftRegular_Bmg3_glyph_123_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.ascii	"\017\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_122, @object
	.size	MinecraftRegular_Bmg3_glyph_122, 16
MinecraftRegular_Bmg3_glyph_122:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_122_data
	.type	MinecraftRegular_Bmg3_glyph_122_data, @object
	.size	MinecraftRegular_Bmg3_glyph_122_data, 60
MinecraftRegular_Bmg3_glyph_122_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\017"
	.string	""
	.ascii	"\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_121, @object
	.size	MinecraftRegular_Bmg3_glyph_121, 16
MinecraftRegular_Bmg3_glyph_121:
# width:
	.byte	24
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_121_data
	.type	MinecraftRegular_Bmg3_glyph_121_data, @object
	.size	MinecraftRegular_Bmg3_glyph_121_data, 72
MinecraftRegular_Bmg3_glyph_121_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.type	MinecraftRegular_Bmg3_glyph_120, @object
	.size	MinecraftRegular_Bmg3_glyph_120, 16
MinecraftRegular_Bmg3_glyph_120:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_120_data
	.type	MinecraftRegular_Bmg3_glyph_120_data, @object
	.size	MinecraftRegular_Bmg3_glyph_120_data, 60
MinecraftRegular_Bmg3_glyph_120_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_119, @object
	.size	MinecraftRegular_Bmg3_glyph_119, 16
MinecraftRegular_Bmg3_glyph_119:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_119_data
	.type	MinecraftRegular_Bmg3_glyph_119_data, @object
	.size	MinecraftRegular_Bmg3_glyph_119_data, 60
MinecraftRegular_Bmg3_glyph_119_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340"
	.ascii	"\360\340\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_118, @object
	.size	MinecraftRegular_Bmg3_glyph_118, 16
MinecraftRegular_Bmg3_glyph_118:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_118_data
	.type	MinecraftRegular_Bmg3_glyph_118_data, @object
	.size	MinecraftRegular_Bmg3_glyph_118_data, 60
MinecraftRegular_Bmg3_glyph_118_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_117, @object
	.size	MinecraftRegular_Bmg3_glyph_117, 16
MinecraftRegular_Bmg3_glyph_117:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_117_data
	.type	MinecraftRegular_Bmg3_glyph_117_data, @object
	.size	MinecraftRegular_Bmg3_glyph_117_data, 60
MinecraftRegular_Bmg3_glyph_117_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.ascii	"\340\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_116, @object
	.size	MinecraftRegular_Bmg3_glyph_116, 16
MinecraftRegular_Bmg3_glyph_116:
# width:
	.byte	16
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	16
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_116_data
	.type	MinecraftRegular_Bmg3_glyph_116_data, @object
	.size	MinecraftRegular_Bmg3_glyph_116_data, 56
MinecraftRegular_Bmg3_glyph_116_data:
	.string	""
	.string	""
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\017"
	.string	"\377\340\377\340\377\340\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340"
	.ascii	"\340"
	.type	MinecraftRegular_Bmg3_glyph_115, @object
	.size	MinecraftRegular_Bmg3_glyph_115, 16
MinecraftRegular_Bmg3_glyph_115:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_115_data
	.type	MinecraftRegular_Bmg3_glyph_115_data, @object
	.size	MinecraftRegular_Bmg3_glyph_115_data, 60
MinecraftRegular_Bmg3_glyph_115_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_114, @object
	.size	MinecraftRegular_Bmg3_glyph_114, 16
MinecraftRegular_Bmg3_glyph_114:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_114_data
	.type	MinecraftRegular_Bmg3_glyph_114_data, @object
	.size	MinecraftRegular_Bmg3_glyph_114_data, 60
MinecraftRegular_Bmg3_glyph_114_data:
	.string	""
	.string	""
	.string	""
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\360"
	.string	""
	.string	"\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_113, @object
	.size	MinecraftRegular_Bmg3_glyph_113, 16
MinecraftRegular_Bmg3_glyph_113:
# width:
	.byte	24
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_113_data
	.type	MinecraftRegular_Bmg3_glyph_113_data, @object
	.size	MinecraftRegular_Bmg3_glyph_113_data, 72
MinecraftRegular_Bmg3_glyph_113_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\340\340\017\340\340\017\340\340"
	.string	""
	.string	"\340\340\017\340\340\017\340\340\017\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.ascii	"\340"
	.type	MinecraftRegular_Bmg3_glyph_112, @object
	.size	MinecraftRegular_Bmg3_glyph_112, 16
MinecraftRegular_Bmg3_glyph_112:
# width:
	.byte	24
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_112_data
	.type	MinecraftRegular_Bmg3_glyph_112_data, @object
	.size	MinecraftRegular_Bmg3_glyph_112_data, 72
MinecraftRegular_Bmg3_glyph_112_data:
	.string	""
	.string	""
	.string	""
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\360"
	.string	""
	.string	"\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.type	MinecraftRegular_Bmg3_glyph_111, @object
	.size	MinecraftRegular_Bmg3_glyph_111, 16
MinecraftRegular_Bmg3_glyph_111:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_111_data
	.type	MinecraftRegular_Bmg3_glyph_111_data, @object
	.size	MinecraftRegular_Bmg3_glyph_111_data, 60
MinecraftRegular_Bmg3_glyph_111_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_110, @object
	.size	MinecraftRegular_Bmg3_glyph_110, 16
MinecraftRegular_Bmg3_glyph_110:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_110_data
	.type	MinecraftRegular_Bmg3_glyph_110_data, @object
	.size	MinecraftRegular_Bmg3_glyph_110_data, 60
MinecraftRegular_Bmg3_glyph_110_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_109, @object
	.size	MinecraftRegular_Bmg3_glyph_109, 16
MinecraftRegular_Bmg3_glyph_109:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_109_data
	.type	MinecraftRegular_Bmg3_glyph_109_data, @object
	.size	MinecraftRegular_Bmg3_glyph_109_data, 60
MinecraftRegular_Bmg3_glyph_109_data:
	.string	""
	.string	""
	.string	""
	.string	"\376\016"
	.string	"\376\016"
	.string	"\376\016"
	.string	"\340"
	.string	""
	.string	"\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_108, @object
	.size	MinecraftRegular_Bmg3_glyph_108, 16
MinecraftRegular_Bmg3_glyph_108:
# width:
	.byte	12
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	12
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_108_data
	.type	MinecraftRegular_Bmg3_glyph_108_data, @object
	.size	MinecraftRegular_Bmg3_glyph_108_data, 42
MinecraftRegular_Bmg3_glyph_108_data:
	.string	""
	.string	"\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	""
	.string	""
	.string	"\340\016"
	.ascii	"\340"
	.zero	6
	.type	MinecraftRegular_Bmg3_glyph_107, @object
	.size	MinecraftRegular_Bmg3_glyph_107, 16
MinecraftRegular_Bmg3_glyph_107:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_107_data
	.type	MinecraftRegular_Bmg3_glyph_107_data, @object
	.size	MinecraftRegular_Bmg3_glyph_107_data, 70
MinecraftRegular_Bmg3_glyph_107_data:
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	"\340\340\016\016"
	.string	"\340\340"
	.string	"\016\016"
	.string	"\340\340\016\016"
	.string	"\360"
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.string	"\340"
	.string	"\016\016"
	.string	"\340\340\016\016"
	.string	"\340"
	.string	"\016"
	.string	"\340\340\016\016"
	.ascii	"\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_106, @object
	.size	MinecraftRegular_Bmg3_glyph_106, 16
MinecraftRegular_Bmg3_glyph_106:
# width:
	.byte	24
# height:
	.byte	32
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_106_data
	.type	MinecraftRegular_Bmg3_glyph_106_data, @object
	.size	MinecraftRegular_Bmg3_glyph_106_data, 96
MinecraftRegular_Bmg3_glyph_106_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.type	MinecraftRegular_Bmg3_glyph_105, @object
	.size	MinecraftRegular_Bmg3_glyph_105, 16
MinecraftRegular_Bmg3_glyph_105:
# width:
	.byte	8
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_105_data
	.type	MinecraftRegular_Bmg3_glyph_105_data, @object
	.size	MinecraftRegular_Bmg3_glyph_105_data, 28
MinecraftRegular_Bmg3_glyph_105_data:
	.string	""
	.string	"\340\340\340"
	.string	""
	.string	""
	.string	""
	.ascii	"\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340"
	.ascii	"\340\340\340\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_104, @object
	.size	MinecraftRegular_Bmg3_glyph_104, 16
MinecraftRegular_Bmg3_glyph_104:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_104_data
	.type	MinecraftRegular_Bmg3_glyph_104_data, @object
	.size	MinecraftRegular_Bmg3_glyph_104_data, 84
MinecraftRegular_Bmg3_glyph_104_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\360"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_103, @object
	.size	MinecraftRegular_Bmg3_glyph_103, 16
MinecraftRegular_Bmg3_glyph_103:
# width:
	.byte	24
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_103_data
	.type	MinecraftRegular_Bmg3_glyph_103_data, @object
	.size	MinecraftRegular_Bmg3_glyph_103_data, 72
MinecraftRegular_Bmg3_glyph_103_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.type	MinecraftRegular_Bmg3_glyph_102, @object
	.size	MinecraftRegular_Bmg3_glyph_102, 16
MinecraftRegular_Bmg3_glyph_102:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_102_data
	.type	MinecraftRegular_Bmg3_glyph_102_data, @object
	.size	MinecraftRegular_Bmg3_glyph_102_data, 70
MinecraftRegular_Bmg3_glyph_102_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\017"
	.string	"\017\377\340\377\376\017\377\340\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_101, @object
	.size	MinecraftRegular_Bmg3_glyph_101, 16
MinecraftRegular_Bmg3_glyph_101:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_101_data
	.type	MinecraftRegular_Bmg3_glyph_101_data, @object
	.size	MinecraftRegular_Bmg3_glyph_101_data, 60
MinecraftRegular_Bmg3_glyph_101_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\377\377\340\377\377\340\377\377\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_100, @object
	.size	MinecraftRegular_Bmg3_glyph_100, 16
MinecraftRegular_Bmg3_glyph_100:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_100_data
	.type	MinecraftRegular_Bmg3_glyph_100_data, @object
	.size	MinecraftRegular_Bmg3_glyph_100_data, 84
MinecraftRegular_Bmg3_glyph_100_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\017\340\340\017\340\340\017\340\340"
	.string	""
	.string	"\340\340\017\340\340\017\340\340\017\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.ascii	"\340\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_99, @object
	.size	MinecraftRegular_Bmg3_glyph_99, 16
MinecraftRegular_Bmg3_glyph_99:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_99_data
	.type	MinecraftRegular_Bmg3_glyph_99_data, @object
	.size	MinecraftRegular_Bmg3_glyph_99_data, 60
MinecraftRegular_Bmg3_glyph_99_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_98, @object
	.size	MinecraftRegular_Bmg3_glyph_98, 16
MinecraftRegular_Bmg3_glyph_98:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_98_data
	.type	MinecraftRegular_Bmg3_glyph_98_data, @object
	.size	MinecraftRegular_Bmg3_glyph_98_data, 84
MinecraftRegular_Bmg3_glyph_98_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\360"
	.string	""
	.string	"\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_97, @object
	.size	MinecraftRegular_Bmg3_glyph_97, 16
MinecraftRegular_Bmg3_glyph_97:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_97_data
	.type	MinecraftRegular_Bmg3_glyph_97_data, @object
	.size	MinecraftRegular_Bmg3_glyph_97_data, 60
MinecraftRegular_Bmg3_glyph_97_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.ascii	"\340\017\377\340\017\377\340\017\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_96, @object
	.size	MinecraftRegular_Bmg3_glyph_96, 16
MinecraftRegular_Bmg3_glyph_96:
# width:
	.byte	4
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	4
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_96_data
	.type	MinecraftRegular_Bmg3_glyph_96_data, @object
	.size	MinecraftRegular_Bmg3_glyph_96_data, 0
MinecraftRegular_Bmg3_glyph_96_data:
	.type	MinecraftRegular_Bmg3_glyph_95_data, @object
	.size	MinecraftRegular_Bmg3_glyph_95_data, 12
MinecraftRegular_Bmg3_glyph_95_data:
	.ascii	"\377\377\340\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_94, @object
	.size	MinecraftRegular_Bmg3_glyph_94, 16
MinecraftRegular_Bmg3_glyph_94:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_94_data
	.type	MinecraftRegular_Bmg3_glyph_94_data, @object
	.size	MinecraftRegular_Bmg3_glyph_94_data, 84
MinecraftRegular_Bmg3_glyph_94_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_93, @object
	.size	MinecraftRegular_Bmg3_glyph_93, 16
MinecraftRegular_Bmg3_glyph_93:
# width:
	.byte	16
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	16
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_93_data
	.type	MinecraftRegular_Bmg3_glyph_93_data, @object
	.size	MinecraftRegular_Bmg3_glyph_93_data, 56
MinecraftRegular_Bmg3_glyph_93_data:
	.string	""
	.string	""
	.string	"\377\340\377\340\377\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.ascii	"\340\377\340\377\340\377\340"
	.type	MinecraftRegular_Bmg3_glyph_92, @object
	.size	MinecraftRegular_Bmg3_glyph_92, 16
MinecraftRegular_Bmg3_glyph_92:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_92_data
	.type	MinecraftRegular_Bmg3_glyph_92_data, @object
	.size	MinecraftRegular_Bmg3_glyph_92_data, 84
MinecraftRegular_Bmg3_glyph_92_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_91, @object
	.size	MinecraftRegular_Bmg3_glyph_91, 16
MinecraftRegular_Bmg3_glyph_91:
# width:
	.byte	16
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	16
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_91_data
	.type	MinecraftRegular_Bmg3_glyph_91_data, @object
	.size	MinecraftRegular_Bmg3_glyph_91_data, 56
MinecraftRegular_Bmg3_glyph_91_data:
	.string	""
	.string	""
	.string	"\377\340\377\340\377\340\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\340"
	.string	"\360"
	.ascii	"\377\340\377\340\377\340"
	.type	MinecraftRegular_Bmg3_glyph_90, @object
	.size	MinecraftRegular_Bmg3_glyph_90, 16
MinecraftRegular_Bmg3_glyph_90:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_90_data
	.type	MinecraftRegular_Bmg3_glyph_90_data, @object
	.size	MinecraftRegular_Bmg3_glyph_90_data, 84
MinecraftRegular_Bmg3_glyph_90_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.ascii	"\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_89, @object
	.size	MinecraftRegular_Bmg3_glyph_89, 16
MinecraftRegular_Bmg3_glyph_89:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_89_data
	.type	MinecraftRegular_Bmg3_glyph_89_data, @object
	.size	MinecraftRegular_Bmg3_glyph_89_data, 84
MinecraftRegular_Bmg3_glyph_89_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_88, @object
	.size	MinecraftRegular_Bmg3_glyph_88, 16
MinecraftRegular_Bmg3_glyph_88:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_88_data
	.type	MinecraftRegular_Bmg3_glyph_88_data, @object
	.size	MinecraftRegular_Bmg3_glyph_88_data, 84
MinecraftRegular_Bmg3_glyph_88_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_87, @object
	.size	MinecraftRegular_Bmg3_glyph_87, 16
MinecraftRegular_Bmg3_glyph_87:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_87_data
	.type	MinecraftRegular_Bmg3_glyph_87_data, @object
	.size	MinecraftRegular_Bmg3_glyph_87_data, 84
MinecraftRegular_Bmg3_glyph_87_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340\340\340\340\340\340\340\340\340\360"
	.string	"\340\376\017\340\376\017\340\376\017\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_86, @object
	.size	MinecraftRegular_Bmg3_glyph_86, 16
MinecraftRegular_Bmg3_glyph_86:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_86_data
	.type	MinecraftRegular_Bmg3_glyph_86_data, @object
	.size	MinecraftRegular_Bmg3_glyph_86_data, 84
MinecraftRegular_Bmg3_glyph_86_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_85, @object
	.size	MinecraftRegular_Bmg3_glyph_85, 16
MinecraftRegular_Bmg3_glyph_85:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_85_data
	.type	MinecraftRegular_Bmg3_glyph_85_data, @object
	.size	MinecraftRegular_Bmg3_glyph_85_data, 84
MinecraftRegular_Bmg3_glyph_85_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_84, @object
	.size	MinecraftRegular_Bmg3_glyph_84, 16
MinecraftRegular_Bmg3_glyph_84:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_84_data
	.type	MinecraftRegular_Bmg3_glyph_84_data, @object
	.size	MinecraftRegular_Bmg3_glyph_84_data, 84
MinecraftRegular_Bmg3_glyph_84_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_83, @object
	.size	MinecraftRegular_Bmg3_glyph_83, 16
MinecraftRegular_Bmg3_glyph_83:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_83_data
	.type	MinecraftRegular_Bmg3_glyph_83_data, @object
	.size	MinecraftRegular_Bmg3_glyph_83_data, 84
MinecraftRegular_Bmg3_glyph_83_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_82, @object
	.size	MinecraftRegular_Bmg3_glyph_82, 16
MinecraftRegular_Bmg3_glyph_82:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_82_data
	.type	MinecraftRegular_Bmg3_glyph_82_data, @object
	.size	MinecraftRegular_Bmg3_glyph_82_data, 84
MinecraftRegular_Bmg3_glyph_82_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_81, @object
	.size	MinecraftRegular_Bmg3_glyph_81, 16
MinecraftRegular_Bmg3_glyph_81:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_81_data
	.type	MinecraftRegular_Bmg3_glyph_81_data, @object
	.size	MinecraftRegular_Bmg3_glyph_81_data, 84
MinecraftRegular_Bmg3_glyph_81_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	""
	.string	""
	.string	""
	.ascii	"\017\340\340\017\340\340\017\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_80, @object
	.size	MinecraftRegular_Bmg3_glyph_80, 16
MinecraftRegular_Bmg3_glyph_80:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_80_data
	.type	MinecraftRegular_Bmg3_glyph_80_data, @object
	.size	MinecraftRegular_Bmg3_glyph_80_data, 84
MinecraftRegular_Bmg3_glyph_80_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_79, @object
	.size	MinecraftRegular_Bmg3_glyph_79, 16
MinecraftRegular_Bmg3_glyph_79:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_79_data
	.type	MinecraftRegular_Bmg3_glyph_79_data, @object
	.size	MinecraftRegular_Bmg3_glyph_79_data, 84
MinecraftRegular_Bmg3_glyph_79_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_78, @object
	.size	MinecraftRegular_Bmg3_glyph_78, 16
MinecraftRegular_Bmg3_glyph_78:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_78_data
	.type	MinecraftRegular_Bmg3_glyph_78_data, @object
	.size	MinecraftRegular_Bmg3_glyph_78_data, 84
MinecraftRegular_Bmg3_glyph_78_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	"\340\340\340\340\340\340\340\340\340\340\340"
	.string	"\340\340\017\340\340\017\340\340\017\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_77, @object
	.size	MinecraftRegular_Bmg3_glyph_77, 16
MinecraftRegular_Bmg3_glyph_77:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_77_data
	.type	MinecraftRegular_Bmg3_glyph_77_data, @object
	.size	MinecraftRegular_Bmg3_glyph_77_data, 84
MinecraftRegular_Bmg3_glyph_77_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\376\017\340\376\017\340\376\017\340\340"
	.string	"\340\340\340\340\340\340\340\340\340\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_76, @object
	.size	MinecraftRegular_Bmg3_glyph_76, 16
MinecraftRegular_Bmg3_glyph_76:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_76_data
	.type	MinecraftRegular_Bmg3_glyph_76_data, @object
	.size	MinecraftRegular_Bmg3_glyph_76_data, 84
MinecraftRegular_Bmg3_glyph_76_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.ascii	"\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_75, @object
	.size	MinecraftRegular_Bmg3_glyph_75, 16
MinecraftRegular_Bmg3_glyph_75:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_75_data
	.type	MinecraftRegular_Bmg3_glyph_75_data, @object
	.size	MinecraftRegular_Bmg3_glyph_75_data, 84
MinecraftRegular_Bmg3_glyph_75_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\360"
	.string	""
	.string	"\377\340"
	.string	"\377\340"
	.string	"\377\340"
	.string	"\340"
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_74, @object
	.size	MinecraftRegular_Bmg3_glyph_74, 16
MinecraftRegular_Bmg3_glyph_74:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_74_data
	.type	MinecraftRegular_Bmg3_glyph_74_data, @object
	.size	MinecraftRegular_Bmg3_glyph_74_data, 84
MinecraftRegular_Bmg3_glyph_74_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_73, @object
	.size	MinecraftRegular_Bmg3_glyph_73, 16
MinecraftRegular_Bmg3_glyph_73:
# width:
	.byte	16
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	16
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_73_data
	.type	MinecraftRegular_Bmg3_glyph_73_data, @object
	.size	MinecraftRegular_Bmg3_glyph_73_data, 56
MinecraftRegular_Bmg3_glyph_73_data:
	.string	""
	.string	""
	.string	"\377\340\377\340\377\340\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\016"
	.string	"\017"
	.ascii	"\377\340\377\340\377\340"
	.type	MinecraftRegular_Bmg3_glyph_72, @object
	.size	MinecraftRegular_Bmg3_glyph_72, 16
MinecraftRegular_Bmg3_glyph_72:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_72_data
	.type	MinecraftRegular_Bmg3_glyph_72_data, @object
	.size	MinecraftRegular_Bmg3_glyph_72_data, 84
MinecraftRegular_Bmg3_glyph_72_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\377\377\340\377\377\340\377\377\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_71, @object
	.size	MinecraftRegular_Bmg3_glyph_71, 16
MinecraftRegular_Bmg3_glyph_71:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_71_data
	.type	MinecraftRegular_Bmg3_glyph_71_data, @object
	.size	MinecraftRegular_Bmg3_glyph_71_data, 84
MinecraftRegular_Bmg3_glyph_71_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\377\340\017\377\340\017\377\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\017\340\340\017\340\340\017\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_70, @object
	.size	MinecraftRegular_Bmg3_glyph_70, 16
MinecraftRegular_Bmg3_glyph_70:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_70_data
	.type	MinecraftRegular_Bmg3_glyph_70_data, @object
	.size	MinecraftRegular_Bmg3_glyph_70_data, 84
MinecraftRegular_Bmg3_glyph_70_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.string	"\377\340"
	.string	"\377\340"
	.string	"\377\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_69, @object
	.size	MinecraftRegular_Bmg3_glyph_69, 16
MinecraftRegular_Bmg3_glyph_69:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_69_data
	.type	MinecraftRegular_Bmg3_glyph_69_data, @object
	.size	MinecraftRegular_Bmg3_glyph_69_data, 84
MinecraftRegular_Bmg3_glyph_69_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.string	"\377\340"
	.string	"\377\340"
	.string	"\377\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.ascii	"\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_68, @object
	.size	MinecraftRegular_Bmg3_glyph_68, 16
MinecraftRegular_Bmg3_glyph_68:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_68_data
	.type	MinecraftRegular_Bmg3_glyph_68_data, @object
	.size	MinecraftRegular_Bmg3_glyph_68_data, 84
MinecraftRegular_Bmg3_glyph_68_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_67, @object
	.size	MinecraftRegular_Bmg3_glyph_67, 16
MinecraftRegular_Bmg3_glyph_67:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_67_data
	.type	MinecraftRegular_Bmg3_glyph_67_data, @object
	.size	MinecraftRegular_Bmg3_glyph_67_data, 84
MinecraftRegular_Bmg3_glyph_67_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_66, @object
	.size	MinecraftRegular_Bmg3_glyph_66, 16
MinecraftRegular_Bmg3_glyph_66:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_66_data
	.type	MinecraftRegular_Bmg3_glyph_66_data, @object
	.size	MinecraftRegular_Bmg3_glyph_66_data, 84
MinecraftRegular_Bmg3_glyph_66_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_65, @object
	.size	MinecraftRegular_Bmg3_glyph_65, 16
MinecraftRegular_Bmg3_glyph_65:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_65_data
	.type	MinecraftRegular_Bmg3_glyph_65_data, @object
	.size	MinecraftRegular_Bmg3_glyph_65_data, 84
MinecraftRegular_Bmg3_glyph_65_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\377\377\340\377\377\340\377\377\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_64, @object
	.size	MinecraftRegular_Bmg3_glyph_64, 16
MinecraftRegular_Bmg3_glyph_64:
# width:
	.byte	28
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	28
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_64_data
	.type	MinecraftRegular_Bmg3_glyph_64_data, @object
	.size	MinecraftRegular_Bmg3_glyph_64_data, 98
MinecraftRegular_Bmg3_glyph_64_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\017\377\340"
	.string	"\377\376"
	.string	"\340"
	.string	"\016\016"
	.string	""
	.string	"\340\340"
	.string	"\016\016"
	.string	""
	.string	"\340\340\376\016\016\017\340\340\340\376\016\016\017\340\340\340\376\016\016\017\340\340\340\376\016\016\017\340\340\340\377\016\016\017\377\340\340\377\376\016\017\377\340\340"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\017\377\340"
	.string	"\377\376"
	.zero	6
	.type	MinecraftRegular_Bmg3_glyph_63, @object
	.size	MinecraftRegular_Bmg3_glyph_63, 16
MinecraftRegular_Bmg3_glyph_63:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_63_data
	.type	MinecraftRegular_Bmg3_glyph_63_data, @object
	.size	MinecraftRegular_Bmg3_glyph_63_data, 84
MinecraftRegular_Bmg3_glyph_63_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_62, @object
	.size	MinecraftRegular_Bmg3_glyph_62, 16
MinecraftRegular_Bmg3_glyph_62:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_62_data
	.type	MinecraftRegular_Bmg3_glyph_62_data, @object
	.size	MinecraftRegular_Bmg3_glyph_62_data, 70
MinecraftRegular_Bmg3_glyph_62_data:
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_61, @object
	.size	MinecraftRegular_Bmg3_glyph_61, 16
MinecraftRegular_Bmg3_glyph_61:
# width:
	.byte	24
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_61_data
	.type	MinecraftRegular_Bmg3_glyph_61_data, @object
	.size	MinecraftRegular_Bmg3_glyph_61_data, 60
MinecraftRegular_Bmg3_glyph_61_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_60, @object
	.size	MinecraftRegular_Bmg3_glyph_60, 16
MinecraftRegular_Bmg3_glyph_60:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_60_data
	.type	MinecraftRegular_Bmg3_glyph_60_data, @object
	.size	MinecraftRegular_Bmg3_glyph_60_data, 70
MinecraftRegular_Bmg3_glyph_60_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.ascii	"\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_59, @object
	.size	MinecraftRegular_Bmg3_glyph_59, 16
MinecraftRegular_Bmg3_glyph_59:
# width:
	.byte	8
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-24
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_59_data
	.type	MinecraftRegular_Bmg3_glyph_59_data, @object
	.size	MinecraftRegular_Bmg3_glyph_59_data, 28
MinecraftRegular_Bmg3_glyph_59_data:
	.string	""
	.string	"\340\340\340\340\340\340\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\340\340\340\340\340\340\340\340\340\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_58, @object
	.size	MinecraftRegular_Bmg3_glyph_58, 16
MinecraftRegular_Bmg3_glyph_58:
# width:
	.byte	8
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-24
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_58_data
	.type	MinecraftRegular_Bmg3_glyph_58_data, @object
	.size	MinecraftRegular_Bmg3_glyph_58_data, 24
MinecraftRegular_Bmg3_glyph_58_data:
	.string	""
	.string	"\340\340\340\340\340\340\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\340\340\340\340\340\340\340"
	.type	MinecraftRegular_Bmg3_glyph_57, @object
	.size	MinecraftRegular_Bmg3_glyph_57, 16
MinecraftRegular_Bmg3_glyph_57:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_57_data
	.type	MinecraftRegular_Bmg3_glyph_57_data, @object
	.size	MinecraftRegular_Bmg3_glyph_57_data, 84
MinecraftRegular_Bmg3_glyph_57_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\017\340"
	.string	"\017\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_56, @object
	.size	MinecraftRegular_Bmg3_glyph_56, 16
MinecraftRegular_Bmg3_glyph_56:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_56_data
	.type	MinecraftRegular_Bmg3_glyph_56_data, @object
	.size	MinecraftRegular_Bmg3_glyph_56_data, 84
MinecraftRegular_Bmg3_glyph_56_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_55, @object
	.size	MinecraftRegular_Bmg3_glyph_55, 16
MinecraftRegular_Bmg3_glyph_55:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_55_data
	.type	MinecraftRegular_Bmg3_glyph_55_data, @object
	.size	MinecraftRegular_Bmg3_glyph_55_data, 84
MinecraftRegular_Bmg3_glyph_55_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_54, @object
	.size	MinecraftRegular_Bmg3_glyph_54, 16
MinecraftRegular_Bmg3_glyph_54:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_54_data
	.type	MinecraftRegular_Bmg3_glyph_54_data, @object
	.size	MinecraftRegular_Bmg3_glyph_54_data, 84
MinecraftRegular_Bmg3_glyph_54_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_53, @object
	.size	MinecraftRegular_Bmg3_glyph_53, 16
MinecraftRegular_Bmg3_glyph_53:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_53_data
	.type	MinecraftRegular_Bmg3_glyph_53_data, @object
	.size	MinecraftRegular_Bmg3_glyph_53_data, 84
MinecraftRegular_Bmg3_glyph_53_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_52, @object
	.size	MinecraftRegular_Bmg3_glyph_52, 16
MinecraftRegular_Bmg3_glyph_52:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_52_data
	.type	MinecraftRegular_Bmg3_glyph_52_data, @object
	.size	MinecraftRegular_Bmg3_glyph_52_data, 84
MinecraftRegular_Bmg3_glyph_52_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\017\340"
	.string	"\017\340"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.string	"\340\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_51, @object
	.size	MinecraftRegular_Bmg3_glyph_51, 16
MinecraftRegular_Bmg3_glyph_51:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_51_data
	.type	MinecraftRegular_Bmg3_glyph_51_data, @object
	.size	MinecraftRegular_Bmg3_glyph_51_data, 84
MinecraftRegular_Bmg3_glyph_51_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_50, @object
	.size	MinecraftRegular_Bmg3_glyph_50, 16
MinecraftRegular_Bmg3_glyph_50:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_50_data
	.type	MinecraftRegular_Bmg3_glyph_50_data, @object
	.size	MinecraftRegular_Bmg3_glyph_50_data, 84
MinecraftRegular_Bmg3_glyph_50_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	"\376"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\360"
	.ascii	"\340\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_49, @object
	.size	MinecraftRegular_Bmg3_glyph_49, 16
MinecraftRegular_Bmg3_glyph_49:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_49_data
	.type	MinecraftRegular_Bmg3_glyph_49_data, @object
	.size	MinecraftRegular_Bmg3_glyph_49_data, 84
MinecraftRegular_Bmg3_glyph_49_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\017\340"
	.string	"\017\340"
	.string	"\017\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.ascii	"\377\377\340\377\377\340\377\377\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_48, @object
	.size	MinecraftRegular_Bmg3_glyph_48, 16
MinecraftRegular_Bmg3_glyph_48:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_48_data
	.type	MinecraftRegular_Bmg3_glyph_48_data, @object
	.size	MinecraftRegular_Bmg3_glyph_48_data, 84
MinecraftRegular_Bmg3_glyph_48_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340\017\340\340\017\340\340\017\340\340"
	.string	"\340\340\340\340\340\340\340\340\340\340\360"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340"
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_47, @object
	.size	MinecraftRegular_Bmg3_glyph_47, 16
MinecraftRegular_Bmg3_glyph_47:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_47_data
	.type	MinecraftRegular_Bmg3_glyph_47_data, @object
	.size	MinecraftRegular_Bmg3_glyph_47_data, 84
MinecraftRegular_Bmg3_glyph_47_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_46, @object
	.size	MinecraftRegular_Bmg3_glyph_46, 16
MinecraftRegular_Bmg3_glyph_46:
# width:
	.byte	8
# height:
	.byte	8
# x_offset:
	.byte	0
# y_offset:
	.byte	-8
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_46_data
	.type	MinecraftRegular_Bmg3_glyph_45, @object
	.size	MinecraftRegular_Bmg3_glyph_45, 16
MinecraftRegular_Bmg3_glyph_45:
# width:
	.byte	24
# height:
	.byte	16
# x_offset:
	.byte	0
# y_offset:
	.byte	-16
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_45_data
	.type	MinecraftRegular_Bmg3_glyph_45_data, @object
	.size	MinecraftRegular_Bmg3_glyph_45_data, 48
MinecraftRegular_Bmg3_glyph_45_data:
	.string	""
	.string	""
	.string	""
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.type	MinecraftRegular_Bmg3_glyph_44, @object
	.size	MinecraftRegular_Bmg3_glyph_44, 16
MinecraftRegular_Bmg3_glyph_44:
# width:
	.byte	8
# height:
	.byte	12
# x_offset:
	.byte	0
# y_offset:
	.byte	-8
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_44_data
	.type	MinecraftRegular_Bmg3_glyph_44_data, @object
	.size	MinecraftRegular_Bmg3_glyph_44_data, 12
MinecraftRegular_Bmg3_glyph_44_data:
	.string	""
	.ascii	"\340\340\340\340\340\340\340\340\340\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_43, @object
	.size	MinecraftRegular_Bmg3_glyph_43, 16
MinecraftRegular_Bmg3_glyph_43:
# width:
	.byte	24
# height:
	.byte	24
# x_offset:
	.byte	0
# y_offset:
	.byte	-24
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_43_data
	.type	MinecraftRegular_Bmg3_glyph_43_data, @object
	.size	MinecraftRegular_Bmg3_glyph_43_data, 72
MinecraftRegular_Bmg3_glyph_43_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	"\377\377\340\377\377\340\377\377\340"
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.type	MinecraftRegular_Bmg3_glyph_42, @object
	.size	MinecraftRegular_Bmg3_glyph_42, 16
MinecraftRegular_Bmg3_glyph_42:
# width:
	.byte	20
# height:
	.byte	20
# x_offset:
	.byte	0
# y_offset:
	.byte	-20
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_42_data
	.type	MinecraftRegular_Bmg3_glyph_42_data, @object
	.size	MinecraftRegular_Bmg3_glyph_42_data, 50
MinecraftRegular_Bmg3_glyph_42_data:
	.string	""
	.string	""
	.string	"\016"
	.string	"\340\340\016\016"
	.string	"\340"
	.string	""
	.string	""
	.string	"\376"
	.string	"\017\340"
	.string	"\376"
	.string	""
	.string	""
	.string	"\016"
	.string	"\340\340\016\016"
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	6
	.type	MinecraftRegular_Bmg3_glyph_41, @object
	.size	MinecraftRegular_Bmg3_glyph_41, 16
MinecraftRegular_Bmg3_glyph_41:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_41_data
	.type	MinecraftRegular_Bmg3_glyph_41_data, @object
	.size	MinecraftRegular_Bmg3_glyph_41_data, 70
MinecraftRegular_Bmg3_glyph_41_data:
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_40, @object
	.size	MinecraftRegular_Bmg3_glyph_40, 16
MinecraftRegular_Bmg3_glyph_40:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_40_data
	.type	MinecraftRegular_Bmg3_glyph_40_data, @object
	.size	MinecraftRegular_Bmg3_glyph_40_data, 70
MinecraftRegular_Bmg3_glyph_40_data:
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.string	"\017\340"
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\016"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\017\340"
	.string	"\376"
	.ascii	"\017\340"
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_39, @object
	.size	MinecraftRegular_Bmg3_glyph_39, 16
MinecraftRegular_Bmg3_glyph_39:
# width:
	.byte	12
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	12
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_39_data
	.type	MinecraftRegular_Bmg3_glyph_39_data, @object
	.size	MinecraftRegular_Bmg3_glyph_39_data, 42
MinecraftRegular_Bmg3_glyph_39_data:
	.string	""
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340"
	.string	"\016"
	.string	"\340\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	6
	.type	MinecraftRegular_Bmg3_glyph_38, @object
	.size	MinecraftRegular_Bmg3_glyph_38, 16
MinecraftRegular_Bmg3_glyph_38:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_38_data
	.type	MinecraftRegular_Bmg3_glyph_38_data, @object
	.size	MinecraftRegular_Bmg3_glyph_38_data, 84
MinecraftRegular_Bmg3_glyph_38_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	"\017\340\340\017\340\340\017\340\340"
	.string	"\360"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\376"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	""
	.string	""
	.string	""
	.ascii	"\017\340\340\017\340\340\017\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_37, @object
	.size	MinecraftRegular_Bmg3_glyph_37, 16
MinecraftRegular_Bmg3_glyph_37:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_37_data
	.type	MinecraftRegular_Bmg3_glyph_37_data, @object
	.size	MinecraftRegular_Bmg3_glyph_37_data, 84
MinecraftRegular_Bmg3_glyph_37_data:
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.string	""
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	""
	.string	"\016"
	.string	"\340\016"
	.string	"\340\016"
	.string	"\340"
	.string	""
	.string	"\340\340"
	.string	"\340\340"
	.string	"\340\340"
	.ascii	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_36, @object
	.size	MinecraftRegular_Bmg3_glyph_36, 16
MinecraftRegular_Bmg3_glyph_36:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_36_data
	.type	MinecraftRegular_Bmg3_glyph_36_data, @object
	.size	MinecraftRegular_Bmg3_glyph_36_data, 84
MinecraftRegular_Bmg3_glyph_36_data:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\360"
	.string	"\017\377\340\017\377\340\017\377\340"
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\017\376"
	.string	"\017\376"
	.string	"\017\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	""
	.string	"\377\376"
	.string	"\377\376"
	.string	"\377\376"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.string	""
	.string	"\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_35, @object
	.size	MinecraftRegular_Bmg3_glyph_35, 16
MinecraftRegular_Bmg3_glyph_35:
# width:
	.byte	24
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	24
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_35_data
	.type	MinecraftRegular_Bmg3_glyph_35_data, @object
	.size	MinecraftRegular_Bmg3_glyph_35_data, 84
MinecraftRegular_Bmg3_glyph_35_data:
	.string	""
	.string	""
	.string	""
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\017\017"
	.string	"\377\377\340\377\377\340\377\377\340\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\017\017"
	.string	"\377\377\340\377\377\340\377\377\340\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.string	"\016\016"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_34, @object
	.size	MinecraftRegular_Bmg3_glyph_34, 16
MinecraftRegular_Bmg3_glyph_34:
# width:
	.byte	20
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	20
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_34_data
	.type	MinecraftRegular_Bmg3_glyph_34_data, @object
	.size	MinecraftRegular_Bmg3_glyph_34_data, 70
MinecraftRegular_Bmg3_glyph_34_data:
	.string	""
	.string	""
	.string	""
	.string	"\340\340\016\016"
	.string	"\340\340\016\016"
	.string	"\340\340\016\016"
	.string	"\340\340"
	.string	""
	.string	"\016\016"
	.string	"\340\340\016\016"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	2
	.type	MinecraftRegular_Bmg3_glyph_33, @object
	.size	MinecraftRegular_Bmg3_glyph_33, 16
MinecraftRegular_Bmg3_glyph_33:
# width:
	.byte	8
# height:
	.byte	28
# x_offset:
	.byte	0
# y_offset:
	.byte	-28
# advance:
	.byte	8
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_33_data
	.type	MinecraftRegular_Bmg3_glyph_33_data, @object
	.size	MinecraftRegular_Bmg3_glyph_33_data, 28
MinecraftRegular_Bmg3_glyph_33_data:
	.string	""
	.string	"\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340\340"
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\340\340\340"
	.zero	4
	.type	MinecraftRegular_Bmg3_glyph_32, @object
	.size	MinecraftRegular_Bmg3_glyph_32, 16
MinecraftRegular_Bmg3_glyph_32:
# width:
	.byte	16
# height:
	.byte	0
# x_offset:
	.byte	0
# y_offset:
	.byte	0
# advance:
	.byte	16
# data:
	.zero	3
	.dword	MinecraftRegular_Bmg3_glyph_32_data
	.type	MinecraftRegular_Bmg3_glyph_32_data, @object
	.size	MinecraftRegular_Bmg3_glyph_32_data, 0
MinecraftRegular_Bmg3_glyph_32_data:
	.section	.srodata,"a"
	.align	3
	.type	MinecraftRegular_Bmg3_glyph_46_data, @object
	.size	MinecraftRegular_Bmg3_glyph_46_data, 8
MinecraftRegular_Bmg3_glyph_46_data:
	.string	""
	.ascii	"\340\340\340\340\340\340\340"
	.text
.Letext0:
	.file 6 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 7 "/usr/local/Cellar/riscv-gnu-toolchain/main/lib/gcc/riscv64-unknown-elf/14.2.0/include/stddef.h"
	.file 8 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 9 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/MinecraftRegular_Bmg3.h"
	.file 10 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdio.h"
	.file 11 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/string.h"
	.file 12 "/usr/local/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/include/stdlib.h"
	.file 13 "<built-in>"
	.file 14 "/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/SDL_scancode.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3292
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x2f
	.4byte	.LASF574
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL93
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x12
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0xc
	.4byte	.LASF4
	.byte	0x6
	.byte	0x29
	.byte	0x17
	.4byte	0x3d
	.uleb128 0x12
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0xc
	.4byte	.LASF5
	.byte	0x6
	.byte	0x2b
	.byte	0x18
	.4byte	0x50
	.uleb128 0x12
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x12
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0xc
	.4byte	.LASF8
	.byte	0x6
	.byte	0x39
	.byte	0x19
	.4byte	0x6a
	.uleb128 0x12
	.byte	0x2
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x30
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.4byte	0x71
	.uleb128 0xc
	.4byte	.LASF10
	.byte	0x6
	.byte	0x4f
	.byte	0x19
	.4byte	0x89
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x12
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x6
	.byte	0x69
	.byte	0x19
	.4byte	0x2a
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x6
	.byte	0xe8
	.byte	0x1a
	.4byte	0x2a
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x7
	.byte	0xd6
	.byte	0x17
	.4byte	0x2a
	.uleb128 0x12
	.byte	0x8
	.byte	0x5
	.4byte	.LASF16
	.uleb128 0x12
	.byte	0x10
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x31
	.byte	0x8
	.uleb128 0x17
	.4byte	0xd0
	.uleb128 0x12
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0x8
	.4byte	0xd0
	.uleb128 0x17
	.4byte	0xd7
	.uleb128 0x12
	.byte	0x8
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x8
	.byte	0x14
	.byte	0x12
	.4byte	0x31
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.4byte	0x44
	.uleb128 0x8
	.4byte	0xf4
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x8
	.byte	0x24
	.byte	0x14
	.4byte	0x5e
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x8
	.byte	0x30
	.byte	0x14
	.4byte	0x7d
	.uleb128 0x8
	.4byte	0x111
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x8
	.byte	0x3c
	.byte	0x14
	.4byte	0x97
	.uleb128 0x8
	.4byte	0x122
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x8
	.byte	0x52
	.byte	0x15
	.4byte	0xa3
	.uleb128 0x24
	.byte	0x10
	.byte	0x9
	.byte	0x9
	.4byte	0x196
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x9
	.byte	0xa
	.byte	0xd
	.4byte	0xf4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x9
	.byte	0xb
	.byte	0xd
	.4byte	0xf4
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x9
	.byte	0xc
	.byte	0xc
	.4byte	0xe8
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x9
	.byte	0xd
	.byte	0xc
	.4byte	0xe8
	.byte	0x3
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x9
	.byte	0xe
	.byte	0xd
	.4byte	0xf4
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x9
	.byte	0xf
	.byte	0x14
	.4byte	0x196
	.byte	0x8
	.byte	0
	.uleb128 0x17
	.4byte	0x100
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x9
	.byte	0x10
	.byte	0x3
	.4byte	0x13f
	.uleb128 0x8
	.4byte	0x19b
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x1bc
	.uleb128 0x32
	.4byte	0x1c1
	.sleb128 -1
	.byte	0
	.uleb128 0x8
	.4byte	0x1ac
	.uleb128 0x12
	.byte	0x8
	.byte	0x5
	.4byte	.LASF33
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x9
	.byte	0x12
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_32_data
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x9
	.byte	0x13
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_32
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x204
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x1b
	.byte	0
	.uleb128 0x8
	.4byte	0x1f4
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x9
	.byte	0x15
	.byte	0x16
	.4byte	0x204
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_33_data
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x9
	.byte	0x19
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_33
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x245
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x45
	.byte	0
	.uleb128 0x8
	.4byte	0x235
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x9
	.byte	0x1b
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_34_data
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x9
	.byte	0x22
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_34
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x286
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x53
	.byte	0
	.uleb128 0x8
	.4byte	0x276
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x9
	.byte	0x24
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_35_data
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x9
	.byte	0x2c
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_35
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x9
	.byte	0x2e
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_36_data
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x9
	.byte	0x36
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_36
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0x9
	.byte	0x38
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_37_data
	.uleb128 0x4
	.4byte	.LASF45
	.byte	0x9
	.byte	0x40
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_37
	.uleb128 0x4
	.4byte	.LASF46
	.byte	0x9
	.byte	0x42
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_38_data
	.uleb128 0x4
	.4byte	.LASF47
	.byte	0x9
	.byte	0x4a
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_38
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x34b
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x29
	.byte	0
	.uleb128 0x8
	.4byte	0x33b
	.uleb128 0x4
	.4byte	.LASF48
	.byte	0x9
	.byte	0x4c
	.byte	0x16
	.4byte	0x34b
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_39_data
	.uleb128 0x4
	.4byte	.LASF49
	.byte	0x9
	.byte	0x51
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_39
	.uleb128 0x4
	.4byte	.LASF50
	.byte	0x9
	.byte	0x53
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_40_data
	.uleb128 0x4
	.4byte	.LASF51
	.byte	0x9
	.byte	0x5a
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_40
	.uleb128 0x4
	.4byte	.LASF52
	.byte	0x9
	.byte	0x5c
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_41_data
	.uleb128 0x4
	.4byte	.LASF53
	.byte	0x9
	.byte	0x63
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_41
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x3e4
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x31
	.byte	0
	.uleb128 0x8
	.4byte	0x3d4
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x9
	.byte	0x65
	.byte	0x16
	.4byte	0x3e4
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_42_data
	.uleb128 0x4
	.4byte	.LASF55
	.byte	0x9
	.byte	0x6b
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_42
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x425
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x47
	.byte	0
	.uleb128 0x8
	.4byte	0x415
	.uleb128 0x4
	.4byte	.LASF56
	.byte	0x9
	.byte	0x6d
	.byte	0x16
	.4byte	0x425
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_43_data
	.uleb128 0x4
	.4byte	.LASF57
	.byte	0x9
	.byte	0x74
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_43
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x466
	.uleb128 0xa
	.4byte	0x2a
	.byte	0xb
	.byte	0
	.uleb128 0x8
	.4byte	0x456
	.uleb128 0x4
	.4byte	.LASF58
	.byte	0x9
	.byte	0x76
	.byte	0x16
	.4byte	0x466
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_44_data
	.uleb128 0x4
	.4byte	.LASF59
	.byte	0x9
	.byte	0x78
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_44
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x4a7
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x2f
	.byte	0
	.uleb128 0x8
	.4byte	0x497
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x9
	.byte	0x7a
	.byte	0x16
	.4byte	0x4a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_45_data
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0x9
	.byte	0x7f
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_45
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x4e8
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.4byte	0x4d8
	.uleb128 0x4
	.4byte	.LASF62
	.byte	0x9
	.byte	0x81
	.byte	0x16
	.4byte	0x4e8
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_46_data
	.uleb128 0x4
	.4byte	.LASF63
	.byte	0x9
	.byte	0x83
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_46
	.uleb128 0x4
	.4byte	.LASF64
	.byte	0x9
	.byte	0x85
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_47_data
	.uleb128 0x4
	.4byte	.LASF65
	.byte	0x9
	.byte	0x8d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_47
	.uleb128 0x4
	.4byte	.LASF66
	.byte	0x9
	.byte	0x8f
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_48_data
	.uleb128 0x4
	.4byte	.LASF67
	.byte	0x9
	.byte	0x97
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_48
	.uleb128 0x4
	.4byte	.LASF68
	.byte	0x9
	.byte	0x99
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_49_data
	.uleb128 0x4
	.4byte	.LASF69
	.byte	0x9
	.byte	0xa1
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_49
	.uleb128 0x4
	.4byte	.LASF70
	.byte	0x9
	.byte	0xa3
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_50_data
	.uleb128 0x4
	.4byte	.LASF71
	.byte	0x9
	.byte	0xab
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_50
	.uleb128 0x4
	.4byte	.LASF72
	.byte	0x9
	.byte	0xad
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_51_data
	.uleb128 0x4
	.4byte	.LASF73
	.byte	0x9
	.byte	0xb5
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_51
	.uleb128 0x4
	.4byte	.LASF74
	.byte	0x9
	.byte	0xb7
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_52_data
	.uleb128 0x4
	.4byte	.LASF75
	.byte	0x9
	.byte	0xbf
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_52
	.uleb128 0x4
	.4byte	.LASF76
	.byte	0x9
	.byte	0xc1
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_53_data
	.uleb128 0x4
	.4byte	.LASF77
	.byte	0x9
	.byte	0xc9
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_53
	.uleb128 0x4
	.4byte	.LASF78
	.byte	0x9
	.byte	0xcb
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_54_data
	.uleb128 0x4
	.4byte	.LASF79
	.byte	0x9
	.byte	0xd3
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_54
	.uleb128 0x4
	.4byte	.LASF80
	.byte	0x9
	.byte	0xd5
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_55_data
	.uleb128 0x4
	.4byte	.LASF81
	.byte	0x9
	.byte	0xdd
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_55
	.uleb128 0x4
	.4byte	.LASF82
	.byte	0x9
	.byte	0xdf
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_56_data
	.uleb128 0x4
	.4byte	.LASF83
	.byte	0x9
	.byte	0xe7
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_56
	.uleb128 0x4
	.4byte	.LASF84
	.byte	0x9
	.byte	0xe9
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_57_data
	.uleb128 0x4
	.4byte	.LASF85
	.byte	0x9
	.byte	0xf1
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_57
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x70d
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x17
	.byte	0
	.uleb128 0x8
	.4byte	0x6fd
	.uleb128 0x4
	.4byte	.LASF86
	.byte	0x9
	.byte	0xf3
	.byte	0x16
	.4byte	0x70d
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_58_data
	.uleb128 0x4
	.4byte	.LASF87
	.byte	0x9
	.byte	0xf6
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_58
	.uleb128 0x4
	.4byte	.LASF88
	.byte	0x9
	.byte	0xf8
	.byte	0x16
	.4byte	0x204
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_59_data
	.uleb128 0x4
	.4byte	.LASF89
	.byte	0x9
	.byte	0xfc
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_59
	.uleb128 0x4
	.4byte	.LASF90
	.byte	0x9
	.byte	0xfe
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_60_data
	.uleb128 0x2
	.4byte	.LASF91
	.byte	0x9
	.2byte	0x105
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_60
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x7a7
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x3b
	.byte	0
	.uleb128 0x8
	.4byte	0x797
	.uleb128 0x2
	.4byte	.LASF92
	.byte	0x9
	.2byte	0x107
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_61_data
	.uleb128 0x2
	.4byte	.LASF93
	.byte	0x9
	.2byte	0x10d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_61
	.uleb128 0x2
	.4byte	.LASF94
	.byte	0x9
	.2byte	0x10f
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_62_data
	.uleb128 0x2
	.4byte	.LASF95
	.byte	0x9
	.2byte	0x116
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_62
	.uleb128 0x2
	.4byte	.LASF96
	.byte	0x9
	.2byte	0x118
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_63_data
	.uleb128 0x2
	.4byte	.LASF97
	.byte	0x9
	.2byte	0x120
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_63
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x846
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x61
	.byte	0
	.uleb128 0x8
	.4byte	0x836
	.uleb128 0x2
	.4byte	.LASF98
	.byte	0x9
	.2byte	0x122
	.byte	0x16
	.4byte	0x846
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_64_data
	.uleb128 0x2
	.4byte	.LASF99
	.byte	0x9
	.2byte	0x12c
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_64
	.uleb128 0x2
	.4byte	.LASF100
	.byte	0x9
	.2byte	0x12e
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_65_data
	.uleb128 0x2
	.4byte	.LASF101
	.byte	0x9
	.2byte	0x136
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_65
	.uleb128 0x2
	.4byte	.LASF102
	.byte	0x9
	.2byte	0x138
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_66_data
	.uleb128 0x2
	.4byte	.LASF103
	.byte	0x9
	.2byte	0x140
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_66
	.uleb128 0x2
	.4byte	.LASF104
	.byte	0x9
	.2byte	0x142
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_67_data
	.uleb128 0x2
	.4byte	.LASF105
	.byte	0x9
	.2byte	0x14a
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_67
	.uleb128 0x2
	.4byte	.LASF106
	.byte	0x9
	.2byte	0x14c
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_68_data
	.uleb128 0x2
	.4byte	.LASF107
	.byte	0x9
	.2byte	0x154
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_68
	.uleb128 0x2
	.4byte	.LASF108
	.byte	0x9
	.2byte	0x156
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_69_data
	.uleb128 0x2
	.4byte	.LASF109
	.byte	0x9
	.2byte	0x15e
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_69
	.uleb128 0x2
	.4byte	.LASF110
	.byte	0x9
	.2byte	0x160
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_70_data
	.uleb128 0x2
	.4byte	.LASF111
	.byte	0x9
	.2byte	0x168
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_70
	.uleb128 0x2
	.4byte	.LASF112
	.byte	0x9
	.2byte	0x16a
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_71_data
	.uleb128 0x2
	.4byte	.LASF113
	.byte	0x9
	.2byte	0x172
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_71
	.uleb128 0x2
	.4byte	.LASF114
	.byte	0x9
	.2byte	0x174
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_72_data
	.uleb128 0x2
	.4byte	.LASF115
	.byte	0x9
	.2byte	0x17c
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_72
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x9f9
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x37
	.byte	0
	.uleb128 0x8
	.4byte	0x9e9
	.uleb128 0x2
	.4byte	.LASF116
	.byte	0x9
	.2byte	0x17e
	.byte	0x16
	.4byte	0x9f9
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_73_data
	.uleb128 0x2
	.4byte	.LASF117
	.byte	0x9
	.2byte	0x184
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_73
	.uleb128 0x2
	.4byte	.LASF118
	.byte	0x9
	.2byte	0x186
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_74_data
	.uleb128 0x2
	.4byte	.LASF119
	.byte	0x9
	.2byte	0x18e
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_74
	.uleb128 0x2
	.4byte	.LASF120
	.byte	0x9
	.2byte	0x190
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_75_data
	.uleb128 0x2
	.4byte	.LASF121
	.byte	0x9
	.2byte	0x198
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_75
	.uleb128 0x2
	.4byte	.LASF122
	.byte	0x9
	.2byte	0x19a
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_76_data
	.uleb128 0x2
	.4byte	.LASF123
	.byte	0x9
	.2byte	0x1a2
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_76
	.uleb128 0x2
	.4byte	.LASF124
	.byte	0x9
	.2byte	0x1a4
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_77_data
	.uleb128 0x2
	.4byte	.LASF125
	.byte	0x9
	.2byte	0x1ac
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_77
	.uleb128 0x2
	.4byte	.LASF126
	.byte	0x9
	.2byte	0x1ae
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_78_data
	.uleb128 0x2
	.4byte	.LASF127
	.byte	0x9
	.2byte	0x1b6
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_78
	.uleb128 0x2
	.4byte	.LASF128
	.byte	0x9
	.2byte	0x1b8
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_79_data
	.uleb128 0x2
	.4byte	.LASF129
	.byte	0x9
	.2byte	0x1c0
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_79
	.uleb128 0x2
	.4byte	.LASF130
	.byte	0x9
	.2byte	0x1c2
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_80_data
	.uleb128 0x2
	.4byte	.LASF131
	.byte	0x9
	.2byte	0x1ca
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_80
	.uleb128 0x2
	.4byte	.LASF132
	.byte	0x9
	.2byte	0x1cc
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_81_data
	.uleb128 0x2
	.4byte	.LASF133
	.byte	0x9
	.2byte	0x1d4
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_81
	.uleb128 0x2
	.4byte	.LASF134
	.byte	0x9
	.2byte	0x1d6
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_82_data
	.uleb128 0x2
	.4byte	.LASF135
	.byte	0x9
	.2byte	0x1de
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_82
	.uleb128 0x2
	.4byte	.LASF136
	.byte	0x9
	.2byte	0x1e0
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_83_data
	.uleb128 0x2
	.4byte	.LASF137
	.byte	0x9
	.2byte	0x1e8
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_83
	.uleb128 0x2
	.4byte	.LASF138
	.byte	0x9
	.2byte	0x1ea
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_84_data
	.uleb128 0x2
	.4byte	.LASF139
	.byte	0x9
	.2byte	0x1f2
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_84
	.uleb128 0x2
	.4byte	.LASF140
	.byte	0x9
	.2byte	0x1f4
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_85_data
	.uleb128 0x2
	.4byte	.LASF141
	.byte	0x9
	.2byte	0x1fc
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_85
	.uleb128 0x2
	.4byte	.LASF142
	.byte	0x9
	.2byte	0x1fe
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_86_data
	.uleb128 0x2
	.4byte	.LASF143
	.byte	0x9
	.2byte	0x206
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_86
	.uleb128 0x2
	.4byte	.LASF144
	.byte	0x9
	.2byte	0x208
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_87_data
	.uleb128 0x2
	.4byte	.LASF145
	.byte	0x9
	.2byte	0x210
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_87
	.uleb128 0x2
	.4byte	.LASF146
	.byte	0x9
	.2byte	0x212
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_88_data
	.uleb128 0x2
	.4byte	.LASF147
	.byte	0x9
	.2byte	0x21a
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_88
	.uleb128 0x2
	.4byte	.LASF148
	.byte	0x9
	.2byte	0x21c
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_89_data
	.uleb128 0x2
	.4byte	.LASF149
	.byte	0x9
	.2byte	0x224
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_89
	.uleb128 0x2
	.4byte	.LASF150
	.byte	0x9
	.2byte	0x226
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_90_data
	.uleb128 0x2
	.4byte	.LASF151
	.byte	0x9
	.2byte	0x22e
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_90
	.uleb128 0x2
	.4byte	.LASF152
	.byte	0x9
	.2byte	0x230
	.byte	0x16
	.4byte	0x9f9
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_91_data
	.uleb128 0x2
	.4byte	.LASF153
	.byte	0x9
	.2byte	0x236
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_91
	.uleb128 0x2
	.4byte	.LASF154
	.byte	0x9
	.2byte	0x238
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_92_data
	.uleb128 0x2
	.4byte	.LASF155
	.byte	0x9
	.2byte	0x240
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_92
	.uleb128 0x2
	.4byte	.LASF156
	.byte	0x9
	.2byte	0x242
	.byte	0x16
	.4byte	0x9f9
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_93_data
	.uleb128 0x2
	.4byte	.LASF157
	.byte	0x9
	.2byte	0x248
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_93
	.uleb128 0x2
	.4byte	.LASF158
	.byte	0x9
	.2byte	0x24a
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_94_data
	.uleb128 0x2
	.4byte	.LASF159
	.byte	0x9
	.2byte	0x252
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_94
	.uleb128 0x2
	.4byte	.LASF160
	.byte	0x9
	.2byte	0x254
	.byte	0x16
	.4byte	0x466
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_95_data
	.uleb128 0x2
	.4byte	.LASF161
	.byte	0x9
	.2byte	0x256
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_95
	.uleb128 0x2
	.4byte	.LASF162
	.byte	0x9
	.2byte	0x258
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_96_data
	.uleb128 0x2
	.4byte	.LASF163
	.byte	0x9
	.2byte	0x259
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_96
	.uleb128 0x2
	.4byte	.LASF164
	.byte	0x9
	.2byte	0x25b
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_97_data
	.uleb128 0x2
	.4byte	.LASF165
	.byte	0x9
	.2byte	0x261
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_97
	.uleb128 0x2
	.4byte	.LASF166
	.byte	0x9
	.2byte	0x263
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_98_data
	.uleb128 0x2
	.4byte	.LASF167
	.byte	0x9
	.2byte	0x26b
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_98
	.uleb128 0x2
	.4byte	.LASF168
	.byte	0x9
	.2byte	0x26d
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_99_data
	.uleb128 0x2
	.4byte	.LASF169
	.byte	0x9
	.2byte	0x273
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_99
	.uleb128 0x2
	.4byte	.LASF170
	.byte	0x9
	.2byte	0x275
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_100_data
	.uleb128 0x2
	.4byte	.LASF171
	.byte	0x9
	.2byte	0x27d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_100
	.uleb128 0x2
	.4byte	.LASF172
	.byte	0x9
	.2byte	0x27f
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_101_data
	.uleb128 0x2
	.4byte	.LASF173
	.byte	0x9
	.2byte	0x285
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_101
	.uleb128 0x2
	.4byte	.LASF174
	.byte	0x9
	.2byte	0x287
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_102_data
	.uleb128 0x2
	.4byte	.LASF175
	.byte	0x9
	.2byte	0x28e
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_102
	.uleb128 0x2
	.4byte	.LASF176
	.byte	0x9
	.2byte	0x290
	.byte	0x16
	.4byte	0x425
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_103_data
	.uleb128 0x2
	.4byte	.LASF177
	.byte	0x9
	.2byte	0x297
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_103
	.uleb128 0x2
	.4byte	.LASF178
	.byte	0x9
	.2byte	0x299
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_104_data
	.uleb128 0x2
	.4byte	.LASF179
	.byte	0x9
	.2byte	0x2a1
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_104
	.uleb128 0x2
	.4byte	.LASF180
	.byte	0x9
	.2byte	0x2a3
	.byte	0x16
	.4byte	0x204
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_105_data
	.uleb128 0x2
	.4byte	.LASF181
	.byte	0x9
	.2byte	0x2a7
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_105
	.uleb128 0x9
	.4byte	0x100
	.4byte	0xffc
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x5f
	.byte	0
	.uleb128 0x8
	.4byte	0xfec
	.uleb128 0x2
	.4byte	.LASF182
	.byte	0x9
	.2byte	0x2a9
	.byte	0x16
	.4byte	0xffc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_106_data
	.uleb128 0x2
	.4byte	.LASF183
	.byte	0x9
	.2byte	0x2b2
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_106
	.uleb128 0x2
	.4byte	.LASF184
	.byte	0x9
	.2byte	0x2b4
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_107_data
	.uleb128 0x2
	.4byte	.LASF185
	.byte	0x9
	.2byte	0x2bb
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_107
	.uleb128 0x2
	.4byte	.LASF186
	.byte	0x9
	.2byte	0x2bd
	.byte	0x16
	.4byte	0x34b
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_108_data
	.uleb128 0x2
	.4byte	.LASF187
	.byte	0x9
	.2byte	0x2c2
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_108
	.uleb128 0x2
	.4byte	.LASF188
	.byte	0x9
	.2byte	0x2c4
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_109_data
	.uleb128 0x2
	.4byte	.LASF189
	.byte	0x9
	.2byte	0x2ca
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_109
	.uleb128 0x2
	.4byte	.LASF190
	.byte	0x9
	.2byte	0x2cc
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_110_data
	.uleb128 0x2
	.4byte	.LASF191
	.byte	0x9
	.2byte	0x2d2
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_110
	.uleb128 0x2
	.4byte	.LASF192
	.byte	0x9
	.2byte	0x2d4
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_111_data
	.uleb128 0x2
	.4byte	.LASF193
	.byte	0x9
	.2byte	0x2da
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_111
	.uleb128 0x2
	.4byte	.LASF194
	.byte	0x9
	.2byte	0x2dc
	.byte	0x16
	.4byte	0x425
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_112_data
	.uleb128 0x2
	.4byte	.LASF195
	.byte	0x9
	.2byte	0x2e3
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_112
	.uleb128 0x2
	.4byte	.LASF196
	.byte	0x9
	.2byte	0x2e5
	.byte	0x16
	.4byte	0x425
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_113_data
	.uleb128 0x2
	.4byte	.LASF197
	.byte	0x9
	.2byte	0x2ec
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_113
	.uleb128 0x2
	.4byte	.LASF198
	.byte	0x9
	.2byte	0x2ee
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_114_data
	.uleb128 0x2
	.4byte	.LASF199
	.byte	0x9
	.2byte	0x2f4
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_114
	.uleb128 0x2
	.4byte	.LASF200
	.byte	0x9
	.2byte	0x2f6
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_115_data
	.uleb128 0x2
	.4byte	.LASF201
	.byte	0x9
	.2byte	0x2fc
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_115
	.uleb128 0x2
	.4byte	.LASF202
	.byte	0x9
	.2byte	0x2fe
	.byte	0x16
	.4byte	0x9f9
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_116_data
	.uleb128 0x2
	.4byte	.LASF203
	.byte	0x9
	.2byte	0x304
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_116
	.uleb128 0x2
	.4byte	.LASF204
	.byte	0x9
	.2byte	0x306
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_117_data
	.uleb128 0x2
	.4byte	.LASF205
	.byte	0x9
	.2byte	0x30c
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_117
	.uleb128 0x2
	.4byte	.LASF206
	.byte	0x9
	.2byte	0x30e
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_118_data
	.uleb128 0x2
	.4byte	.LASF207
	.byte	0x9
	.2byte	0x314
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_118
	.uleb128 0x2
	.4byte	.LASF208
	.byte	0x9
	.2byte	0x316
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_119_data
	.uleb128 0x2
	.4byte	.LASF209
	.byte	0x9
	.2byte	0x31c
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_119
	.uleb128 0x2
	.4byte	.LASF210
	.byte	0x9
	.2byte	0x31e
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_120_data
	.uleb128 0x2
	.4byte	.LASF211
	.byte	0x9
	.2byte	0x324
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_120
	.uleb128 0x2
	.4byte	.LASF212
	.byte	0x9
	.2byte	0x326
	.byte	0x16
	.4byte	0x425
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_121_data
	.uleb128 0x2
	.4byte	.LASF213
	.byte	0x9
	.2byte	0x32d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_121
	.uleb128 0x2
	.4byte	.LASF214
	.byte	0x9
	.2byte	0x32f
	.byte	0x16
	.4byte	0x7a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_122_data
	.uleb128 0x2
	.4byte	.LASF215
	.byte	0x9
	.2byte	0x335
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_122
	.uleb128 0x2
	.4byte	.LASF216
	.byte	0x9
	.2byte	0x337
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_123_data
	.uleb128 0x2
	.4byte	.LASF217
	.byte	0x9
	.2byte	0x33e
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_123
	.uleb128 0x2
	.4byte	.LASF218
	.byte	0x9
	.2byte	0x340
	.byte	0x16
	.4byte	0x204
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_124_data
	.uleb128 0x2
	.4byte	.LASF219
	.byte	0x9
	.2byte	0x344
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_124
	.uleb128 0x2
	.4byte	.LASF220
	.byte	0x9
	.2byte	0x346
	.byte	0x16
	.4byte	0x245
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_125_data
	.uleb128 0x2
	.4byte	.LASF221
	.byte	0x9
	.2byte	0x34d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_125
	.uleb128 0x2
	.4byte	.LASF222
	.byte	0x9
	.2byte	0x34f
	.byte	0x16
	.4byte	0x846
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_126_data
	.uleb128 0x2
	.4byte	.LASF223
	.byte	0x9
	.2byte	0x359
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_126
	.uleb128 0x2
	.4byte	.LASF224
	.byte	0x9
	.2byte	0x35b
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00E4_data
	.uleb128 0x2
	.4byte	.LASF225
	.byte	0x9
	.2byte	0x35c
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00E4
	.uleb128 0x2
	.4byte	.LASF226
	.byte	0x9
	.2byte	0x35e
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00C4_data
	.uleb128 0x2
	.4byte	.LASF227
	.byte	0x9
	.2byte	0x366
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00C4
	.uleb128 0x2
	.4byte	.LASF228
	.byte	0x9
	.2byte	0x368
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00F6_data
	.uleb128 0x2
	.4byte	.LASF229
	.byte	0x9
	.2byte	0x370
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00F6
	.uleb128 0x2
	.4byte	.LASF230
	.byte	0x9
	.2byte	0x372
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00D6_data
	.uleb128 0x2
	.4byte	.LASF231
	.byte	0x9
	.2byte	0x373
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00D6
	.uleb128 0x2
	.4byte	.LASF232
	.byte	0x9
	.2byte	0x375
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00FC_data
	.uleb128 0x2
	.4byte	.LASF233
	.byte	0x9
	.2byte	0x37d
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00FC
	.uleb128 0x2
	.4byte	.LASF234
	.byte	0x9
	.2byte	0x37f
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00DC_data
	.uleb128 0x2
	.4byte	.LASF235
	.byte	0x9
	.2byte	0x387
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00DC
	.uleb128 0x2
	.4byte	.LASF236
	.byte	0x9
	.2byte	0x389
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00DF_data
	.uleb128 0x2
	.4byte	.LASF237
	.byte	0x9
	.2byte	0x38a
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00DF
	.uleb128 0x2
	.4byte	.LASF238
	.byte	0x9
	.2byte	0x38c
	.byte	0x16
	.4byte	0x286
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00A7_data
	.uleb128 0x2
	.4byte	.LASF239
	.byte	0x9
	.2byte	0x394
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00A7
	.uleb128 0x2
	.4byte	.LASF240
	.byte	0x9
	.2byte	0x396
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B0_data
	.uleb128 0x2
	.4byte	.LASF241
	.byte	0x9
	.2byte	0x397
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B0
	.uleb128 0x2
	.4byte	.LASF242
	.byte	0x9
	.2byte	0x399
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B2_data
	.uleb128 0x2
	.4byte	.LASF243
	.byte	0x9
	.2byte	0x39a
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B2
	.uleb128 0x2
	.4byte	.LASF244
	.byte	0x9
	.2byte	0x39c
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B3_data
	.uleb128 0x2
	.4byte	.LASF245
	.byte	0x9
	.2byte	0x39d
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B3
	.uleb128 0x2
	.4byte	.LASF246
	.byte	0x9
	.2byte	0x39f
	.byte	0x16
	.4byte	0x1bc
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B5_data
	.uleb128 0x2
	.4byte	.LASF247
	.byte	0x9
	.2byte	0x3a0
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00B5
	.uleb128 0x9
	.4byte	0x100
	.4byte	0x15ff
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x23
	.byte	0
	.uleb128 0x8
	.4byte	0x15ef
	.uleb128 0x2
	.4byte	.LASF248
	.byte	0x9
	.2byte	0x3a2
	.byte	0x16
	.4byte	0x15ff
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00AC_data
	.uleb128 0x2
	.4byte	.LASF249
	.byte	0x9
	.2byte	0x3a6
	.byte	0x17
	.4byte	0x1a7
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_U00AC
	.uleb128 0x9
	.4byte	0x1642
	.4byte	0x1642
	.uleb128 0xa
	.4byte	0x2a
	.byte	0xff
	.byte	0
	.uleb128 0x17
	.4byte	0x1a7
	.uleb128 0x2
	.4byte	.LASF250
	.byte	0x9
	.2byte	0x3a8
	.byte	0x15
	.4byte	0x1632
	.uleb128 0x9
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_table
	.uleb128 0x24
	.byte	0xc
	.byte	0x2
	.byte	0x14
	.4byte	0x168e
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x2
	.byte	0x15
	.byte	0xe
	.4byte	0x111
	.byte	0
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x2
	.byte	0x16
	.byte	0xe
	.4byte	0x111
	.byte	0x4
	.uleb128 0x33
	.string	"bpp"
	.byte	0x2
	.byte	0x17
	.byte	0xe
	.4byte	0x111
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.4byte	.LASF251
	.byte	0x2
	.byte	0x18
	.byte	0x3
	.4byte	0x165e
	.uleb128 0x8
	.4byte	0x168e
	.uleb128 0x34
	.4byte	.LASF575
	.byte	0x7
	.byte	0x4
	.4byte	0x89
	.byte	0xe
	.byte	0x29
	.byte	0xe
	.4byte	0x1ca5
	.uleb128 0x1
	.4byte	.LASF252
	.byte	0
	.uleb128 0x1
	.4byte	.LASF253
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF255
	.byte	0x6
	.uleb128 0x1
	.4byte	.LASF256
	.byte	0x7
	.uleb128 0x1
	.4byte	.LASF257
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF258
	.byte	0x9
	.uleb128 0x1
	.4byte	.LASF259
	.byte	0xa
	.uleb128 0x1
	.4byte	.LASF260
	.byte	0xb
	.uleb128 0x1
	.4byte	.LASF261
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF262
	.byte	0xd
	.uleb128 0x1
	.4byte	.LASF263
	.byte	0xe
	.uleb128 0x1
	.4byte	.LASF264
	.byte	0xf
	.uleb128 0x1
	.4byte	.LASF265
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF266
	.byte	0x11
	.uleb128 0x1
	.4byte	.LASF267
	.byte	0x12
	.uleb128 0x1
	.4byte	.LASF268
	.byte	0x13
	.uleb128 0x1
	.4byte	.LASF269
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF270
	.byte	0x15
	.uleb128 0x1
	.4byte	.LASF271
	.byte	0x16
	.uleb128 0x1
	.4byte	.LASF272
	.byte	0x17
	.uleb128 0x1
	.4byte	.LASF273
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF274
	.byte	0x19
	.uleb128 0x1
	.4byte	.LASF275
	.byte	0x1a
	.uleb128 0x1
	.4byte	.LASF276
	.byte	0x1b
	.uleb128 0x1
	.4byte	.LASF277
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF278
	.byte	0x1d
	.uleb128 0x1
	.4byte	.LASF279
	.byte	0x1e
	.uleb128 0x1
	.4byte	.LASF280
	.byte	0x1f
	.uleb128 0x1
	.4byte	.LASF281
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF282
	.byte	0x21
	.uleb128 0x1
	.4byte	.LASF283
	.byte	0x22
	.uleb128 0x1
	.4byte	.LASF284
	.byte	0x23
	.uleb128 0x1
	.4byte	.LASF285
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF286
	.byte	0x25
	.uleb128 0x1
	.4byte	.LASF287
	.byte	0x26
	.uleb128 0x1
	.4byte	.LASF288
	.byte	0x27
	.uleb128 0x1
	.4byte	.LASF289
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF290
	.byte	0x29
	.uleb128 0x1
	.4byte	.LASF291
	.byte	0x2a
	.uleb128 0x1
	.4byte	.LASF292
	.byte	0x2b
	.uleb128 0x1
	.4byte	.LASF293
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF294
	.byte	0x2d
	.uleb128 0x1
	.4byte	.LASF295
	.byte	0x2e
	.uleb128 0x1
	.4byte	.LASF296
	.byte	0x2f
	.uleb128 0x1
	.4byte	.LASF297
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF298
	.byte	0x31
	.uleb128 0x1
	.4byte	.LASF299
	.byte	0x32
	.uleb128 0x1
	.4byte	.LASF300
	.byte	0x33
	.uleb128 0x1
	.4byte	.LASF301
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF302
	.byte	0x35
	.uleb128 0x1
	.4byte	.LASF303
	.byte	0x36
	.uleb128 0x1
	.4byte	.LASF304
	.byte	0x37
	.uleb128 0x1
	.4byte	.LASF305
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF306
	.byte	0x39
	.uleb128 0x1
	.4byte	.LASF307
	.byte	0x3a
	.uleb128 0x1
	.4byte	.LASF308
	.byte	0x3b
	.uleb128 0x1
	.4byte	.LASF309
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF310
	.byte	0x3d
	.uleb128 0x1
	.4byte	.LASF311
	.byte	0x3e
	.uleb128 0x1
	.4byte	.LASF312
	.byte	0x3f
	.uleb128 0x1
	.4byte	.LASF313
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF314
	.byte	0x41
	.uleb128 0x1
	.4byte	.LASF315
	.byte	0x42
	.uleb128 0x1
	.4byte	.LASF316
	.byte	0x43
	.uleb128 0x1
	.4byte	.LASF317
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF318
	.byte	0x45
	.uleb128 0x1
	.4byte	.LASF319
	.byte	0x46
	.uleb128 0x1
	.4byte	.LASF320
	.byte	0x47
	.uleb128 0x1
	.4byte	.LASF321
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF322
	.byte	0x49
	.uleb128 0x1
	.4byte	.LASF323
	.byte	0x4a
	.uleb128 0x1
	.4byte	.LASF324
	.byte	0x4b
	.uleb128 0x1
	.4byte	.LASF325
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF326
	.byte	0x4d
	.uleb128 0x1
	.4byte	.LASF327
	.byte	0x4e
	.uleb128 0x1
	.4byte	.LASF328
	.byte	0x4f
	.uleb128 0x1
	.4byte	.LASF329
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF330
	.byte	0x51
	.uleb128 0x1
	.4byte	.LASF331
	.byte	0x52
	.uleb128 0x1
	.4byte	.LASF332
	.byte	0x53
	.uleb128 0x1
	.4byte	.LASF333
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF334
	.byte	0x55
	.uleb128 0x1
	.4byte	.LASF335
	.byte	0x56
	.uleb128 0x1
	.4byte	.LASF336
	.byte	0x57
	.uleb128 0x1
	.4byte	.LASF337
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF338
	.byte	0x59
	.uleb128 0x1
	.4byte	.LASF339
	.byte	0x5a
	.uleb128 0x1
	.4byte	.LASF340
	.byte	0x5b
	.uleb128 0x1
	.4byte	.LASF341
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF342
	.byte	0x5d
	.uleb128 0x1
	.4byte	.LASF343
	.byte	0x5e
	.uleb128 0x1
	.4byte	.LASF344
	.byte	0x5f
	.uleb128 0x1
	.4byte	.LASF345
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF346
	.byte	0x61
	.uleb128 0x1
	.4byte	.LASF347
	.byte	0x62
	.uleb128 0x1
	.4byte	.LASF348
	.byte	0x63
	.uleb128 0x1
	.4byte	.LASF349
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF350
	.byte	0x65
	.uleb128 0x1
	.4byte	.LASF351
	.byte	0x66
	.uleb128 0x1
	.4byte	.LASF352
	.byte	0x67
	.uleb128 0x1
	.4byte	.LASF353
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF354
	.byte	0x69
	.uleb128 0x1
	.4byte	.LASF355
	.byte	0x6a
	.uleb128 0x1
	.4byte	.LASF356
	.byte	0x6b
	.uleb128 0x1
	.4byte	.LASF357
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF358
	.byte	0x6d
	.uleb128 0x1
	.4byte	.LASF359
	.byte	0x6e
	.uleb128 0x1
	.4byte	.LASF360
	.byte	0x6f
	.uleb128 0x1
	.4byte	.LASF361
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF362
	.byte	0x71
	.uleb128 0x1
	.4byte	.LASF363
	.byte	0x72
	.uleb128 0x1
	.4byte	.LASF364
	.byte	0x73
	.uleb128 0x1
	.4byte	.LASF365
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF366
	.byte	0x75
	.uleb128 0x1
	.4byte	.LASF367
	.byte	0x76
	.uleb128 0x1
	.4byte	.LASF368
	.byte	0x77
	.uleb128 0x1
	.4byte	.LASF369
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF370
	.byte	0x79
	.uleb128 0x1
	.4byte	.LASF371
	.byte	0x7a
	.uleb128 0x1
	.4byte	.LASF372
	.byte	0x7b
	.uleb128 0x1
	.4byte	.LASF373
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF374
	.byte	0x7d
	.uleb128 0x1
	.4byte	.LASF375
	.byte	0x7e
	.uleb128 0x1
	.4byte	.LASF376
	.byte	0x7f
	.uleb128 0x1
	.4byte	.LASF377
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF378
	.byte	0x81
	.uleb128 0x1
	.4byte	.LASF379
	.byte	0x85
	.uleb128 0x1
	.4byte	.LASF380
	.byte	0x86
	.uleb128 0x1
	.4byte	.LASF381
	.byte	0x87
	.uleb128 0x1
	.4byte	.LASF382
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF383
	.byte	0x89
	.uleb128 0x1
	.4byte	.LASF384
	.byte	0x8a
	.uleb128 0x1
	.4byte	.LASF385
	.byte	0x8b
	.uleb128 0x1
	.4byte	.LASF386
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF387
	.byte	0x8d
	.uleb128 0x1
	.4byte	.LASF388
	.byte	0x8e
	.uleb128 0x1
	.4byte	.LASF389
	.byte	0x8f
	.uleb128 0x1
	.4byte	.LASF390
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF391
	.byte	0x91
	.uleb128 0x1
	.4byte	.LASF392
	.byte	0x92
	.uleb128 0x1
	.4byte	.LASF393
	.byte	0x93
	.uleb128 0x1
	.4byte	.LASF394
	.byte	0x94
	.uleb128 0x1
	.4byte	.LASF395
	.byte	0x95
	.uleb128 0x1
	.4byte	.LASF396
	.byte	0x96
	.uleb128 0x1
	.4byte	.LASF397
	.byte	0x97
	.uleb128 0x1
	.4byte	.LASF398
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF399
	.byte	0x99
	.uleb128 0x1
	.4byte	.LASF400
	.byte	0x9a
	.uleb128 0x1
	.4byte	.LASF401
	.byte	0x9b
	.uleb128 0x1
	.4byte	.LASF402
	.byte	0x9c
	.uleb128 0x1
	.4byte	.LASF403
	.byte	0x9d
	.uleb128 0x1
	.4byte	.LASF404
	.byte	0x9e
	.uleb128 0x1
	.4byte	.LASF405
	.byte	0x9f
	.uleb128 0x1
	.4byte	.LASF406
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF407
	.byte	0xa1
	.uleb128 0x1
	.4byte	.LASF408
	.byte	0xa2
	.uleb128 0x1
	.4byte	.LASF409
	.byte	0xa3
	.uleb128 0x1
	.4byte	.LASF410
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF411
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF412
	.byte	0xb1
	.uleb128 0x1
	.4byte	.LASF413
	.byte	0xb2
	.uleb128 0x1
	.4byte	.LASF414
	.byte	0xb3
	.uleb128 0x1
	.4byte	.LASF415
	.byte	0xb4
	.uleb128 0x1
	.4byte	.LASF416
	.byte	0xb5
	.uleb128 0x1
	.4byte	.LASF417
	.byte	0xb6
	.uleb128 0x1
	.4byte	.LASF418
	.byte	0xb7
	.uleb128 0x1
	.4byte	.LASF419
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF420
	.byte	0xb9
	.uleb128 0x1
	.4byte	.LASF421
	.byte	0xba
	.uleb128 0x1
	.4byte	.LASF422
	.byte	0xbb
	.uleb128 0x1
	.4byte	.LASF423
	.byte	0xbc
	.uleb128 0x1
	.4byte	.LASF424
	.byte	0xbd
	.uleb128 0x1
	.4byte	.LASF425
	.byte	0xbe
	.uleb128 0x1
	.4byte	.LASF426
	.byte	0xbf
	.uleb128 0x1
	.4byte	.LASF427
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF428
	.byte	0xc1
	.uleb128 0x1
	.4byte	.LASF429
	.byte	0xc2
	.uleb128 0x1
	.4byte	.LASF430
	.byte	0xc3
	.uleb128 0x1
	.4byte	.LASF431
	.byte	0xc4
	.uleb128 0x1
	.4byte	.LASF432
	.byte	0xc5
	.uleb128 0x1
	.4byte	.LASF433
	.byte	0xc6
	.uleb128 0x1
	.4byte	.LASF434
	.byte	0xc7
	.uleb128 0x1
	.4byte	.LASF435
	.byte	0xc8
	.uleb128 0x1
	.4byte	.LASF436
	.byte	0xc9
	.uleb128 0x1
	.4byte	.LASF437
	.byte	0xca
	.uleb128 0x1
	.4byte	.LASF438
	.byte	0xcb
	.uleb128 0x1
	.4byte	.LASF439
	.byte	0xcc
	.uleb128 0x1
	.4byte	.LASF440
	.byte	0xcd
	.uleb128 0x1
	.4byte	.LASF441
	.byte	0xce
	.uleb128 0x1
	.4byte	.LASF442
	.byte	0xcf
	.uleb128 0x1
	.4byte	.LASF443
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF444
	.byte	0xd1
	.uleb128 0x1
	.4byte	.LASF445
	.byte	0xd2
	.uleb128 0x1
	.4byte	.LASF446
	.byte	0xd3
	.uleb128 0x1
	.4byte	.LASF447
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF448
	.byte	0xd5
	.uleb128 0x1
	.4byte	.LASF449
	.byte	0xd6
	.uleb128 0x1
	.4byte	.LASF450
	.byte	0xd7
	.uleb128 0x1
	.4byte	.LASF451
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF452
	.byte	0xd9
	.uleb128 0x1
	.4byte	.LASF453
	.byte	0xda
	.uleb128 0x1
	.4byte	.LASF454
	.byte	0xdb
	.uleb128 0x1
	.4byte	.LASF455
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF456
	.byte	0xdd
	.uleb128 0x1
	.4byte	.LASF457
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF458
	.byte	0xe1
	.uleb128 0x1
	.4byte	.LASF459
	.byte	0xe2
	.uleb128 0x1
	.4byte	.LASF460
	.byte	0xe3
	.uleb128 0x1
	.4byte	.LASF461
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF462
	.byte	0xe5
	.uleb128 0x1
	.4byte	.LASF463
	.byte	0xe6
	.uleb128 0x1
	.4byte	.LASF464
	.byte	0xe7
	.uleb128 0x6
	.4byte	.LASF465
	.2byte	0x101
	.uleb128 0x6
	.4byte	.LASF466
	.2byte	0x102
	.uleb128 0x6
	.4byte	.LASF467
	.2byte	0x103
	.uleb128 0x6
	.4byte	.LASF468
	.2byte	0x104
	.uleb128 0x6
	.4byte	.LASF469
	.2byte	0x105
	.uleb128 0x6
	.4byte	.LASF470
	.2byte	0x106
	.uleb128 0x6
	.4byte	.LASF471
	.2byte	0x107
	.uleb128 0x6
	.4byte	.LASF472
	.2byte	0x108
	.uleb128 0x6
	.4byte	.LASF473
	.2byte	0x109
	.uleb128 0x6
	.4byte	.LASF474
	.2byte	0x10a
	.uleb128 0x6
	.4byte	.LASF475
	.2byte	0x10b
	.uleb128 0x6
	.4byte	.LASF476
	.2byte	0x10c
	.uleb128 0x6
	.4byte	.LASF477
	.2byte	0x10d
	.uleb128 0x6
	.4byte	.LASF478
	.2byte	0x10e
	.uleb128 0x6
	.4byte	.LASF479
	.2byte	0x10f
	.uleb128 0x6
	.4byte	.LASF480
	.2byte	0x110
	.uleb128 0x6
	.4byte	.LASF481
	.2byte	0x111
	.uleb128 0x6
	.4byte	.LASF482
	.2byte	0x112
	.uleb128 0x6
	.4byte	.LASF483
	.2byte	0x113
	.uleb128 0x6
	.4byte	.LASF484
	.2byte	0x114
	.uleb128 0x6
	.4byte	.LASF485
	.2byte	0x115
	.uleb128 0x6
	.4byte	.LASF486
	.2byte	0x116
	.uleb128 0x6
	.4byte	.LASF487
	.2byte	0x117
	.uleb128 0x6
	.4byte	.LASF488
	.2byte	0x118
	.uleb128 0x6
	.4byte	.LASF489
	.2byte	0x119
	.uleb128 0x6
	.4byte	.LASF490
	.2byte	0x11a
	.uleb128 0x6
	.4byte	.LASF491
	.2byte	0x11b
	.uleb128 0x6
	.4byte	.LASF492
	.2byte	0x11c
	.uleb128 0x6
	.4byte	.LASF493
	.2byte	0x11d
	.uleb128 0x6
	.4byte	.LASF494
	.2byte	0x11e
	.uleb128 0x6
	.4byte	.LASF495
	.2byte	0x11f
	.uleb128 0x6
	.4byte	.LASF496
	.2byte	0x120
	.uleb128 0x6
	.4byte	.LASF497
	.2byte	0x121
	.uleb128 0x6
	.4byte	.LASF498
	.2byte	0x122
	.uleb128 0x6
	.4byte	.LASF499
	.2byte	0x200
	.byte	0
	.uleb128 0x35
	.2byte	0x430
	.byte	0x1
	.byte	0x1a
	.byte	0x9
	.4byte	0x1d25
	.uleb128 0xe
	.4byte	.LASF500
	.byte	0x1
	.byte	0x1b
	.byte	0xe
	.4byte	0x1d25
	.byte	0
	.uleb128 0xe
	.4byte	.LASF501
	.byte	0x1
	.byte	0x1c
	.byte	0xf
	.4byte	0x168e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF502
	.byte	0x1
	.byte	0x1d
	.byte	0x9
	.4byte	0x71
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF503
	.byte	0x1
	.byte	0x1e
	.byte	0x9
	.4byte	0x71
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF504
	.byte	0x1
	.byte	0x1f
	.byte	0xa
	.4byte	0x1d2a
	.byte	0x1c
	.uleb128 0x21
	.4byte	.LASF505
	.byte	0x20
	.byte	0xe
	.4byte	0x111
	.2byte	0x41c
	.uleb128 0x21
	.4byte	.LASF506
	.byte	0x21
	.byte	0xa
	.4byte	0x1d3b
	.2byte	0x420
	.uleb128 0x21
	.4byte	.LASF507
	.byte	0x22
	.byte	0xa
	.4byte	0x1d3b
	.2byte	0x421
	.uleb128 0x21
	.4byte	.LASF508
	.byte	0x23
	.byte	0xe
	.4byte	0x122
	.2byte	0x428
	.byte	0
	.uleb128 0x17
	.4byte	0xf4
	.uleb128 0x9
	.4byte	0xd0
	.4byte	0x1d3b
	.uleb128 0x36
	.4byte	0x2a
	.2byte	0x3ff
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.byte	0x2
	.4byte	.LASF509
	.uleb128 0xc
	.4byte	.LASF510
	.byte	0x1
	.byte	0x24
	.byte	0x3
	.4byte	0x1ca5
	.uleb128 0xc
	.4byte	.LASF511
	.byte	0x1
	.byte	0x34
	.byte	0x10
	.4byte	0x1d5a
	.uleb128 0x17
	.4byte	0x1d5f
	.uleb128 0x37
	.4byte	0x1d3b
	.4byte	0x1d73
	.uleb128 0x11
	.4byte	0x1d73
	.uleb128 0x11
	.4byte	0xdc
	.byte	0
	.uleb128 0x17
	.4byte	0x1d42
	.uleb128 0x24
	.byte	0x18
	.byte	0x1
	.byte	0x36
	.4byte	0x1da8
	.uleb128 0xe
	.4byte	.LASF512
	.byte	0x1
	.byte	0x37
	.byte	0x11
	.4byte	0xdc
	.byte	0
	.uleb128 0xe
	.4byte	.LASF513
	.byte	0x1
	.byte	0x38
	.byte	0x14
	.4byte	0x1d4e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF514
	.byte	0x1
	.byte	0x39
	.byte	0x11
	.4byte	0xdc
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.4byte	.LASF515
	.byte	0x1
	.byte	0x3a
	.byte	0x3
	.4byte	0x1d78
	.uleb128 0x8
	.4byte	0x1da8
	.uleb128 0x9
	.4byte	0x1db4
	.4byte	0x1dc9
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	0x1db9
	.uleb128 0x4
	.4byte	.LASF516
	.byte	0x1
	.byte	0x42
	.byte	0x16
	.4byte	0x1dc9
	.uleb128 0x9
	.byte	0x3
	.8byte	commands
	.uleb128 0x1d
	.4byte	.LASF517
	.byte	0xa
	.byte	0xfa
	.byte	0x5
	.4byte	0x71
	.4byte	0x1e00
	.uleb128 0x11
	.4byte	0xcb
	.uleb128 0x11
	.4byte	0xdc
	.uleb128 0x29
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF518
	.byte	0xb
	.byte	0x24
	.byte	0x6
	.4byte	0x71
	.4byte	0x1e1b
	.uleb128 0x11
	.4byte	0xdc
	.uleb128 0x11
	.4byte	0xdc
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF519
	.byte	0xa
	.byte	0xd2
	.byte	0x5
	.4byte	0x71
	.4byte	0x1e37
	.uleb128 0x11
	.4byte	0xdc
	.uleb128 0x11
	.4byte	0xdc
	.uleb128 0x29
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF520
	.byte	0xb
	.byte	0x29
	.byte	0x9
	.4byte	0xaf
	.4byte	0x1e4d
	.uleb128 0x11
	.4byte	0xdc
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF521
	.byte	0xb
	.byte	0x21
	.byte	0x9
	.4byte	0xc9
	.4byte	0x1e6d
	.uleb128 0x11
	.4byte	0xc9
	.uleb128 0x11
	.4byte	0x71
	.uleb128 0x11
	.4byte	0x2a
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF522
	.byte	0xc
	.byte	0x6c
	.byte	0x7
	.4byte	0xc9
	.4byte	0x1e83
	.uleb128 0x11
	.4byte	0x2a
	.byte	0
	.uleb128 0x38
	.4byte	.LASF523
	.byte	0xc
	.byte	0x5d
	.byte	0x6
	.4byte	0x1e95
	.uleb128 0x11
	.4byte	0x71
	.byte	0
	.uleb128 0x39
	.4byte	.LASF576
	.byte	0x1
	.2byte	0x167
	.byte	0x5
	.4byte	0x71
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2503
	.uleb128 0x2
	.4byte	.LASF524
	.byte	0x1
	.2byte	0x168
	.byte	0xe
	.4byte	0x1d42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x20
	.4byte	0x2f58
	.8byte	.LBB147
	.4byte	.LLRL51
	.2byte	0x169
	.byte	0x5
	.4byte	0x1fcd
	.uleb128 0x5
	.4byte	0x2f65
	.4byte	.LLST52
	.uleb128 0x18
	.4byte	.LLRL51
	.uleb128 0x14
	.4byte	0x2f71
	.4byte	.LLST53
	.uleb128 0x1b
	.4byte	0x321a
	.8byte	.LBB149
	.8byte	.LBE149-.LBB149
	.byte	0x77
	.byte	0x9
	.4byte	0x1f2b
	.uleb128 0x5
	.4byte	0x322b
	.4byte	.LLST54
	.uleb128 0xd
	.4byte	0x3237
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x3242
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x1b
	.4byte	0x31a6
	.8byte	.LBB151
	.8byte	.LBE151-.LBB151
	.byte	0x87
	.byte	0x1d
	.4byte	0x1f55
	.uleb128 0xd
	.4byte	0x31b7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x31c2
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x1e
	.4byte	0x2d6f
	.8byte	.LBB153
	.4byte	.LLRL55
	.byte	0x89
	.byte	0x5
	.4byte	0x1fa1
	.uleb128 0x5
	.4byte	0x2d7c
	.4byte	.LLST56
	.uleb128 0xf
	.8byte	.LVL86
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC22
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x24d686
	.byte	0
	.byte	0
	.uleb128 0x7
	.8byte	.LVL83
	.4byte	0x3283
	.4byte	0x1fb8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0xf
	.8byte	.LVL143
	.4byte	0x1e83
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	0x2c67
	.8byte	.LBB162
	.4byte	.LLRL57
	.2byte	0x16c
	.byte	0x9
	.4byte	0x24e1
	.uleb128 0x5
	.4byte	0x2c74
	.4byte	.LLST58
	.uleb128 0x18
	.4byte	.LLRL57
	.uleb128 0x14
	.4byte	0x2c80
	.4byte	.LLST59
	.uleb128 0x3a
	.4byte	0x2c8b
	.4byte	.LLRL60
	.4byte	0x2096
	.uleb128 0x14
	.4byte	0x2c8c
	.4byte	.LLST61
	.uleb128 0x20
	.4byte	0x2d0f
	.8byte	.LBB165
	.4byte	.LLRL62
	.2byte	0x11d
	.byte	0x9
	.4byte	0x206d
	.uleb128 0x5
	.4byte	0x2d1c
	.4byte	.LLST63
	.uleb128 0x5
	.4byte	0x2d28
	.4byte	.LLST61
	.uleb128 0x18
	.4byte	.LLRL62
	.uleb128 0x14
	.4byte	0x2d32
	.4byte	.LLST65
	.uleb128 0xf
	.8byte	.LVL108
	.4byte	0x303e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x8b
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1176
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.4byte	0x314d
	.8byte	.LBB170
	.4byte	.LLRL66
	.byte	0x1
	.2byte	0x11c
	.byte	0x12
	.uleb128 0x5
	.4byte	0x315e
	.4byte	.LLST67
	.uleb128 0x5
	.4byte	0x316a
	.4byte	.LLST68
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x31f4
	.8byte	.LBB179
	.4byte	.LLRL69
	.byte	0xf9
	.byte	0xa
	.4byte	0x20c2
	.uleb128 0x18
	.4byte	.LLRL69
	.uleb128 0xd
	.4byte	0x3203
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x320e
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x31ce
	.8byte	.LBB182
	.4byte	.LLRL70
	.byte	0xff
	.byte	0x19
	.4byte	0x20ee
	.uleb128 0x18
	.4byte	.LLRL70
	.uleb128 0xd
	.4byte	0x31dd
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x31e8
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	0x2f33
	.8byte	.LBB186
	.8byte	.LBE186-.LBB186
	.2byte	0x111
	.4byte	0x213c
	.uleb128 0x5
	.4byte	0x2f40
	.4byte	.LLST71
	.uleb128 0x14
	.4byte	0x2f4c
	.4byte	.LLST72
	.uleb128 0xf
	.8byte	.LVL90
	.4byte	0x303e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1176
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	0x3253
	.8byte	.LBB189
	.8byte	.LBE189-.LBB189
	.2byte	0x120
	.4byte	0x216f
	.uleb128 0x5
	.4byte	0x3260
	.4byte	.LLST73
	.uleb128 0xd
	.4byte	0x326c
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x3277
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x1b
	.4byte	0x3177
	.8byte	.LBB192
	.8byte	.LBE192-.LBB192
	.byte	0xfa
	.byte	0x9
	.4byte	0x21a2
	.uleb128 0x5
	.4byte	0x3184
	.4byte	.LLST74
	.uleb128 0xd
	.4byte	0x318f
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x319a
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x1b
	.4byte	0x2ef4
	.8byte	.LBB194
	.8byte	.LBE194-.LBB194
	.byte	0xfb
	.byte	0x9
	.4byte	0x227a
	.uleb128 0x5
	.4byte	0x2f01
	.4byte	.LLST75
	.uleb128 0x14
	.4byte	0x2f0d
	.4byte	.LLST76
	.uleb128 0x1b
	.4byte	0x31a6
	.8byte	.LBB196
	.8byte	.LBE196-.LBB196
	.byte	0x9c
	.byte	0x23
	.4byte	0x21f9
	.uleb128 0xd
	.4byte	0x31b7
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x31c2
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x25
	.4byte	0x2f18
	.8byte	.LBB198
	.8byte	.LBE198-.LBB198
	.uleb128 0x14
	.4byte	0x2f19
	.4byte	.LLST77
	.uleb128 0x3c
	.4byte	0x2f24
	.4byte	.LLRL78
	.uleb128 0x14
	.4byte	0x2f25
	.4byte	.LLST79
	.uleb128 0x1b
	.4byte	0x3253
	.8byte	.LBB200
	.8byte	.LBE200-.LBB200
	.byte	0xa4
	.byte	0xd
	.4byte	0x225c
	.uleb128 0x5
	.4byte	0x3260
	.4byte	.LLST80
	.uleb128 0xd
	.4byte	0x326c
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0xd
	.4byte	0x3277
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0xf
	.8byte	.LVL105
	.4byte	0x303e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1176
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	0x2c99
	.8byte	.LBB204
	.4byte	.LLRL81
	.2byte	0x118
	.byte	0x9
	.4byte	0x247e
	.uleb128 0x5
	.4byte	0x2ca6
	.4byte	.LLST82
	.uleb128 0x1e
	.4byte	0x2eda
	.8byte	.LBB206
	.4byte	.LLRL83
	.byte	0xee
	.byte	0x5
	.4byte	0x22bc
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST84
	.byte	0
	.uleb128 0x1b
	.4byte	0x2d6f
	.8byte	.LBB212
	.8byte	.LBE212-.LBB212
	.byte	0xf5
	.byte	0x5
	.4byte	0x230c
	.uleb128 0x5
	.4byte	0x2d7c
	.4byte	.LLST85
	.uleb128 0xf
	.8byte	.LVL116
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC22
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x24d686
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x2cb3
	.8byte	.LBB214
	.4byte	.LLRL86
	.byte	0xf1
	.byte	0xe
	.4byte	0x245c
	.uleb128 0x5
	.4byte	0x2cc4
	.4byte	.LLST87
	.uleb128 0x5
	.4byte	0x2cd0
	.4byte	.LLST88
	.uleb128 0x18
	.4byte	.LLRL86
	.uleb128 0xd
	.4byte	0x2cdc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1504
	.uleb128 0xd
	.4byte	0x2ce7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1440
	.uleb128 0x3d
	.4byte	0x2cf2
	.8byte	.LBB216
	.8byte	.LBE216-.LBB216
	.4byte	0x23b0
	.uleb128 0x14
	.4byte	0x2cf3
	.4byte	.LLST89
	.uleb128 0x7
	.8byte	.LVL133
	.4byte	0x1e00
	.4byte	0x2387
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1504
	.byte	0
	.uleb128 0x3e
	.8byte	.LVL135
	.uleb128 0xf
	.byte	0x88
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0x88
	.sleb128 0
	.byte	0x22
	.byte	0x33
	.byte	0x24
	.byte	0x86
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x8
	.byte	0x6
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1440
	.byte	0
	.byte	0
	.uleb128 0x7
	.8byte	.LVL125
	.4byte	0x328c
	.4byte	0x23d5
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1440
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.byte	0
	.uleb128 0x7
	.8byte	.LVL127
	.4byte	0x1e1b
	.4byte	0x2409
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1156
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC23
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1504
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1440
	.byte	0
	.uleb128 0x7
	.8byte	.LVL139
	.4byte	0x2d89
	.4byte	0x2438
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC24
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xdb3030
	.byte	0
	.uleb128 0xf
	.8byte	.LVL141
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1504
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.4byte	0x2eda
	.8byte	.LBB218
	.8byte	.LBE218-.LBB218
	.byte	0xf2
	.byte	0xd
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST90
	.byte	0
	.byte	0
	.uleb128 0x3f
	.4byte	0x2d3e
	.8byte	.LBB223
	.8byte	.LBE223-.LBB223
	.byte	0x1
	.2byte	0x115
	.byte	0x9
	.uleb128 0x5
	.4byte	0x2d4b
	.4byte	.LLST91
	.uleb128 0x25
	.4byte	0x2d57
	.8byte	.LBB225
	.8byte	.LBE225-.LBB225
	.uleb128 0x40
	.4byte	0x2d58
	.uleb128 0x14
	.4byte	0x2d62
	.4byte	.LLST92
	.uleb128 0xf
	.8byte	.LVL123
	.4byte	0x303e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1176
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL79
	.4byte	0x328c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x3
	.byte	0xa
	.2byte	0x430
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF527
	.2byte	0x141
	.4byte	0x1d3b
	.8byte	.LFB33
	.8byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a71
	.uleb128 0x1a
	.4byte	.LASF524
	.2byte	0x141
	.byte	0x24
	.4byte	0x1d73
	.4byte	.LLST40
	.uleb128 0x1a
	.4byte	.LASF525
	.2byte	0x141
	.byte	0x36
	.4byte	0xdc
	.4byte	.LLST41
	.uleb128 0x2
	.4byte	.LASF526
	.byte	0x1
	.2byte	0x153
	.byte	0xa
	.4byte	0x2a71
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB82
	.8byte	.LBE82-.LBB82
	.2byte	0x145
	.4byte	0x257a
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST42
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB84
	.8byte	.LBE84-.LBB84
	.2byte	0x148
	.4byte	0x259f
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST43
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB86
	.8byte	.LBE86-.LBB86
	.2byte	0x14b
	.4byte	0x25c4
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST44
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB88
	.8byte	.LBE88-.LBB88
	.2byte	0x14e
	.4byte	0x25e9
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST45
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB90
	.8byte	.LBE90-.LBB90
	.2byte	0x151
	.4byte	0x260e
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST46
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB92
	.8byte	.LBE92-.LBB92
	.2byte	0x157
	.4byte	0x2633
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST47
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB94
	.8byte	.LBE94-.LBB94
	.2byte	0x15a
	.4byte	0x2658
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST48
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB96
	.8byte	.LBE96-.LBB96
	.2byte	0x15d
	.4byte	0x267d
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST49
	.byte	0
	.uleb128 0x15
	.4byte	0x2eda
	.8byte	.LBB98
	.8byte	.LBE98-.LBB98
	.2byte	0x160
	.4byte	0x26a2
	.uleb128 0x5
	.4byte	0x2ee7
	.4byte	.LLST50
	.byte	0
	.uleb128 0x7
	.8byte	.LVL47
	.4byte	0x2d89
	.4byte	0x26d0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC4
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL48
	.4byte	0x2d89
	.4byte	0x26fe
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC5
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.uleb128 0x7
	.8byte	.LVL50
	.4byte	0x2d89
	.4byte	0x272c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC6
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL51
	.4byte	0x2d89
	.4byte	0x275a
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC7
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.uleb128 0x7
	.8byte	.LVL53
	.4byte	0x2d89
	.4byte	0x2788
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL54
	.4byte	0x2d89
	.4byte	0x27b6
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC5
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.uleb128 0x7
	.8byte	.LVL56
	.4byte	0x2d89
	.4byte	0x27e4
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC9
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL57
	.4byte	0x2d89
	.4byte	0x2812
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC10
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.uleb128 0x7
	.8byte	.LVL59
	.4byte	0x2d89
	.4byte	0x2840
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC11
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL60
	.4byte	0x2d89
	.4byte	0x286e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC12
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.uleb128 0x7
	.8byte	.LVL62
	.4byte	0x2d89
	.4byte	0x289c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC13
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL63
	.4byte	0x1de4
	.4byte	0x28c1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC14
	.byte	0
	.uleb128 0x7
	.8byte	.LVL64
	.4byte	0x2d89
	.4byte	0x28ec
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC15
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.uleb128 0x7
	.8byte	.LVL65
	.4byte	0x2d89
	.4byte	0x2910
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.uleb128 0x7
	.8byte	.LVL67
	.4byte	0x2d89
	.4byte	0x293e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC16
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL68
	.4byte	0x2d89
	.4byte	0x2969
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC12
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.uleb128 0x7
	.8byte	.LVL70
	.4byte	0x2d89
	.4byte	0x2997
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC17
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL71
	.4byte	0x2d89
	.4byte	0x29c2
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC18
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.uleb128 0x7
	.8byte	.LVL73
	.4byte	0x2d89
	.4byte	0x29f0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC19
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0x7
	.8byte	.LVL74
	.4byte	0x2d89
	.4byte	0x2a1b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC18
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.uleb128 0x7
	.8byte	.LVL76
	.4byte	0x2d89
	.4byte	0x2a49
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC20
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1f879c
	.byte	0
	.uleb128 0xf
	.8byte	.LVL77
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC21
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 -1
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0xd0
	.4byte	0x2a81
	.uleb128 0xa
	.4byte	0x2a
	.byte	0xff
	.byte	0
	.uleb128 0x22
	.4byte	.LASF528
	.2byte	0x132
	.4byte	0x1d3b
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b9a
	.uleb128 0x1a
	.4byte	.LASF524
	.2byte	0x132
	.byte	0x20
	.4byte	0x1d73
	.4byte	.LLST33
	.uleb128 0x1a
	.4byte	.LASF525
	.2byte	0x132
	.byte	0x32
	.4byte	0xdc
	.4byte	.LLST34
	.uleb128 0x41
	.4byte	.LLRL35
	.4byte	0x2b72
	.uleb128 0x42
	.string	"i"
	.byte	0x1
	.2byte	0x136
	.byte	0xe
	.4byte	0x71
	.4byte	.LLST36
	.uleb128 0x20
	.4byte	0x2eda
	.8byte	.LBB74
	.4byte	.LLRL37
	.2byte	0x137
	.byte	0x9
	.4byte	0x2af8
	.uleb128 0x43
	.4byte	0x2ee7
	.byte	0
	.uleb128 0x44
	.8byte	.LVL37
	.4byte	0x2d89
	.uleb128 0x7
	.8byte	.LVL38
	.4byte	0x2d89
	.4byte	0x2b2c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0x24d686
	.byte	0
	.uleb128 0x7
	.8byte	.LVL39
	.4byte	0x2d89
	.4byte	0x2b57
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC3
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL41
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL35
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	.LC1
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF529
	.2byte	0x129
	.4byte	0x1d3b
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c00
	.uleb128 0x1a
	.4byte	.LASF524
	.2byte	0x129
	.byte	0x21
	.4byte	0x1d73
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	.LASF525
	.2byte	0x129
	.byte	0x33
	.4byte	0xdc
	.4byte	.LLST13
	.uleb128 0x45
	.4byte	.LASF530
	.byte	0x1
	.2byte	0x12b
	.byte	0xc
	.4byte	0xaf
	.4byte	.LLST14
	.uleb128 0xf
	.8byte	.LVL14
	.4byte	0x328c
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	.LASF531
	.2byte	0x124
	.4byte	0x1d3b
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c67
	.uleb128 0x1a
	.4byte	.LASF524
	.2byte	0x124
	.byte	0x20
	.4byte	0x1d73
	.4byte	.LLST38
	.uleb128 0x1a
	.4byte	.LASF525
	.2byte	0x124
	.byte	0x32
	.4byte	0xdc
	.4byte	.LLST39
	.uleb128 0xf
	.8byte	.LVL44
	.4byte	0x2d89
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0xc
	.4byte	0xffffff
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF533
	.byte	0x1
	.byte	0xf8
	.byte	0xd
	.byte	0x1
	.4byte	0x2c99
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xf8
	.byte	0x2e
	.4byte	0x1d73
	.uleb128 0x16
	.4byte	.LASF532
	.byte	0xff
	.byte	0xe
	.4byte	0x111
	.uleb128 0x1f
	.uleb128 0x46
	.string	"c"
	.byte	0x1
	.2byte	0x11c
	.byte	0xe
	.4byte	0xd0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF534
	.byte	0x1
	.byte	0xea
	.byte	0xd
	.byte	0x1
	.4byte	0x2cb3
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xea
	.byte	0x2d
	.4byte	0x1d73
	.byte	0
	.uleb128 0x23
	.4byte	.LASF560
	.byte	0x1
	.byte	0xd4
	.byte	0xd
	.4byte	0x1d3b
	.byte	0x1
	.4byte	0x2cff
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xd4
	.byte	0x30
	.4byte	0x1d73
	.uleb128 0xb
	.4byte	.LASF535
	.byte	0x1
	.byte	0xd4
	.byte	0x42
	.4byte	0xdc
	.uleb128 0x16
	.4byte	.LASF536
	.byte	0xd5
	.byte	0xa
	.4byte	0x2cff
	.uleb128 0x16
	.4byte	.LASF525
	.byte	0xd6
	.byte	0xa
	.4byte	0x2a71
	.uleb128 0x1f
	.uleb128 0x10
	.string	"i"
	.byte	0x1
	.byte	0xde
	.byte	0xe
	.4byte	0x71
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0xd0
	.4byte	0x2d0f
	.uleb128 0xa
	.4byte	0x2a
	.byte	0x3f
	.byte	0
	.uleb128 0x13
	.4byte	.LASF537
	.byte	0x1
	.byte	0xca
	.byte	0xd
	.byte	0x1
	.4byte	0x2d3e
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xca
	.byte	0x2c
	.4byte	0x1d73
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0xca
	.byte	0x37
	.4byte	0xd0
	.uleb128 0x16
	.4byte	.LASF538
	.byte	0xcb
	.byte	0x12
	.4byte	0x1642
	.byte	0
	.uleb128 0x13
	.4byte	.LASF539
	.byte	0x1
	.byte	0xbe
	.byte	0xd
	.byte	0x1
	.4byte	0x2d6f
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xbe
	.byte	0x31
	.4byte	0x1d73
	.uleb128 0x1f
	.uleb128 0x10
	.string	"c"
	.byte	0x1
	.byte	0xc0
	.byte	0x14
	.4byte	0xd7
	.uleb128 0x16
	.4byte	.LASF538
	.byte	0xc1
	.byte	0x16
	.4byte	0x1642
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF540
	.byte	0x1
	.byte	0xba
	.byte	0xd
	.byte	0x1
	.4byte	0x2d89
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xba
	.byte	0x2d
	.4byte	0x1d73
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF551
	.byte	0xb5
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2eda
	.uleb128 0x26
	.4byte	.LASF524
	.byte	0x26
	.4byte	0x1d73
	.4byte	.LLST15
	.uleb128 0x26
	.4byte	.LASF541
	.byte	0x38
	.4byte	0xdc
	.4byte	.LLST16
	.uleb128 0x26
	.4byte	.LASF542
	.byte	0x47
	.4byte	0x111
	.4byte	.LLST17
	.uleb128 0x2a
	.4byte	0x2f7d
	.8byte	.LBB63
	.8byte	.LBE63-.LBB63
	.byte	0xb6
	.byte	0x5
	.uleb128 0x5
	.4byte	0x2f8a
	.4byte	.LLST18
	.uleb128 0x5
	.4byte	0x2f96
	.4byte	.LLST19
	.uleb128 0x5
	.4byte	0x2fa0
	.4byte	.LLST20
	.uleb128 0x5
	.4byte	0x2faa
	.4byte	.LLST21
	.uleb128 0x5
	.4byte	0x2fb5
	.4byte	.LLST22
	.uleb128 0x5
	.4byte	0x2fc1
	.4byte	.LLST23
	.uleb128 0x25
	.4byte	0x2fcd
	.8byte	.LBB64
	.8byte	.LBE64-.LBB64
	.uleb128 0x14
	.4byte	0x2fce
	.4byte	.LLST24
	.uleb128 0x1e
	.4byte	0x2fe4
	.8byte	.LBB65
	.4byte	.LLRL25
	.byte	0x71
	.byte	0x9
	.4byte	0x2ec3
	.uleb128 0x5
	.4byte	0x2ff1
	.4byte	.LLST26
	.uleb128 0x5
	.4byte	0x2ffb
	.4byte	.LLST27
	.uleb128 0x5
	.4byte	0x3005
	.4byte	.LLST28
	.uleb128 0x5
	.4byte	0x300f
	.4byte	.LLST29
	.uleb128 0x5
	.4byte	0x301a
	.4byte	.LLST30
	.uleb128 0x5
	.4byte	0x3026
	.4byte	.LLST31
	.uleb128 0x18
	.4byte	.LLRL25
	.uleb128 0x14
	.4byte	0x3032
	.4byte	.LLST32
	.uleb128 0xf
	.8byte	.LVL24
	.4byte	0x303e
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x88
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x87
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x2
	.byte	0x86
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x2
	.byte	0x85
	.sleb128 0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.8byte	.LVL19
	.4byte	0x1e37
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x2
	.byte	0x79
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF543
	.byte	0x1
	.byte	0xaa
	.byte	0xd
	.byte	0x1
	.4byte	0x2ef4
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0xaa
	.byte	0x28
	.4byte	0x1d73
	.byte	0
	.uleb128 0x13
	.4byte	.LASF544
	.byte	0x1
	.byte	0x9b
	.byte	0xd
	.byte	0x1
	.4byte	0x2f33
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0x9b
	.byte	0x2e
	.4byte	0x1d73
	.uleb128 0x16
	.4byte	.LASF545
	.byte	0x9c
	.byte	0x14
	.4byte	0x12e
	.uleb128 0x1f
	.uleb128 0x16
	.4byte	.LASF546
	.byte	0x9f
	.byte	0x16
	.4byte	0x1642
	.uleb128 0x1f
	.uleb128 0x16
	.4byte	.LASF542
	.byte	0xa1
	.byte	0x16
	.4byte	0x111
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF547
	.byte	0x1
	.byte	0x93
	.byte	0xd
	.byte	0x1
	.4byte	0x2f58
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0x93
	.byte	0x2d
	.4byte	0x1d73
	.uleb128 0x16
	.4byte	.LASF546
	.byte	0x94
	.byte	0x12
	.4byte	0x1642
	.byte	0
	.uleb128 0x13
	.4byte	.LASF548
	.byte	0x1
	.byte	0x76
	.byte	0xd
	.byte	0x1
	.4byte	0x2f7d
	.uleb128 0xb
	.4byte	.LASF524
	.byte	0x1
	.byte	0x76
	.byte	0x25
	.4byte	0x1d73
	.uleb128 0x16
	.4byte	.LASF530
	.byte	0x7b
	.byte	0xc
	.4byte	0xaf
	.byte	0
	.uleb128 0x13
	.4byte	.LASF549
	.byte	0x1
	.byte	0x6e
	.byte	0xd
	.byte	0x1
	.4byte	0x2fda
	.uleb128 0x19
	.string	"str"
	.byte	0x1
	.byte	0x6e
	.byte	0x28
	.4byte	0xdc
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.byte	0x6e
	.byte	0x32
	.4byte	0x2fda
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.byte	0x6e
	.byte	0x39
	.4byte	0x71
	.uleb128 0x19
	.string	"fb"
	.byte	0x1
	.byte	0x6f
	.byte	0x24
	.4byte	0x1d25
	.uleb128 0xb
	.4byte	.LASF501
	.byte	0x1
	.byte	0x6f
	.byte	0x39
	.4byte	0x2fdf
	.uleb128 0xb
	.4byte	.LASF542
	.byte	0x1
	.byte	0x6f
	.byte	0x4b
	.4byte	0x111
	.uleb128 0x1f
	.uleb128 0x10
	.string	"i"
	.byte	0x1
	.byte	0x70
	.byte	0x11
	.4byte	0xaf
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	0x71
	.uleb128 0x17
	.4byte	0x169a
	.uleb128 0x13
	.4byte	.LASF550
	.byte	0x1
	.byte	0x65
	.byte	0xd
	.byte	0x1
	.4byte	0x303e
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x65
	.byte	0x1f
	.4byte	0xd0
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.byte	0x65
	.byte	0x27
	.4byte	0x2fda
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.byte	0x65
	.byte	0x2e
	.4byte	0x71
	.uleb128 0x19
	.string	"fb"
	.byte	0x1
	.byte	0x66
	.byte	0x22
	.4byte	0x1d25
	.uleb128 0xb
	.4byte	.LASF501
	.byte	0x1
	.byte	0x66
	.byte	0x37
	.4byte	0x2fdf
	.uleb128 0xb
	.4byte	.LASF542
	.byte	0x1
	.byte	0x66
	.byte	0x49
	.4byte	0x111
	.uleb128 0x16
	.4byte	.LASF538
	.byte	0x67
	.byte	0x12
	.4byte	0x1642
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF552
	.byte	0x4c
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x314d
	.uleb128 0x27
	.4byte	.LASF538
	.byte	0x4c
	.byte	0x28
	.4byte	0x1642
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x28
	.string	"x"
	.byte	0x4c
	.byte	0x33
	.4byte	0x71
	.uleb128 0x1
	.byte	0x5b
	.uleb128 0x28
	.string	"y"
	.byte	0x4c
	.byte	0x3a
	.4byte	0x71
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x28
	.string	"fb"
	.byte	0x4d
	.byte	0x23
	.4byte	0x1d25
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x27
	.4byte	.LASF501
	.byte	0x4d
	.byte	0x38
	.4byte	0x2fdf
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x27
	.4byte	.LASF542
	.byte	0x4d
	.byte	0x4a
	.4byte	0x111
	.uleb128 0x1
	.byte	0x5f
	.uleb128 0x47
	.8byte	.LBB50
	.8byte	.LBE50-.LBB50
	.uleb128 0x2c
	.string	"i"
	.byte	0x4e
	.byte	0xe
	.4byte	0x71
	.4byte	.LLST0
	.uleb128 0x18
	.4byte	.LLRL1
	.uleb128 0x1c
	.4byte	.LASF553
	.byte	0x4f
	.byte	0x18
	.4byte	0x11d
	.4byte	.LLST2
	.uleb128 0x1c
	.4byte	.LASF554
	.byte	0x50
	.byte	0x17
	.4byte	0x100
	.4byte	.LLST3
	.uleb128 0x2c
	.string	"bit"
	.byte	0x51
	.byte	0x17
	.4byte	0x100
	.4byte	.LLST4
	.uleb128 0x18
	.4byte	.LLRL5
	.uleb128 0x1c
	.4byte	.LASF555
	.byte	0x54
	.byte	0x17
	.4byte	0x78
	.4byte	.LLST6
	.uleb128 0x1c
	.4byte	.LASF556
	.byte	0x55
	.byte	0x17
	.4byte	0x78
	.4byte	.LLST7
	.uleb128 0x1c
	.4byte	.LASF557
	.byte	0x56
	.byte	0x17
	.4byte	0x78
	.4byte	.LLST8
	.uleb128 0x1c
	.4byte	.LASF558
	.byte	0x57
	.byte	0x17
	.4byte	0x78
	.4byte	.LLST9
	.uleb128 0x18
	.4byte	.LLRL10
	.uleb128 0x1c
	.4byte	.LASF559
	.byte	0x5b
	.byte	0x20
	.4byte	0x11d
	.4byte	.LLST11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF561
	.byte	0x4
	.byte	0xa
	.byte	0x18
	.4byte	0x111
	.byte	0x3
	.4byte	0x3177
	.uleb128 0xb
	.4byte	.LASF532
	.byte	0x4
	.byte	0xa
	.byte	0x39
	.4byte	0x105
	.uleb128 0xb
	.4byte	.LASF562
	.byte	0x4
	.byte	0xa
	.byte	0x48
	.4byte	0x1d3b
	.byte	0
	.uleb128 0x13
	.4byte	.LASF563
	.byte	0x3
	.byte	0x15
	.byte	0x14
	.byte	0x3
	.4byte	0x31a6
	.uleb128 0x19
	.string	"us"
	.byte	0x3
	.byte	0x15
	.byte	0x2c
	.4byte	0x11d
	.uleb128 0x10
	.string	"a0"
	.byte	0x3
	.byte	0x16
	.byte	0x13
	.4byte	0x90
	.uleb128 0x10
	.string	"a7"
	.byte	0x3
	.byte	0x17
	.byte	0x13
	.4byte	0x90
	.byte	0
	.uleb128 0x23
	.4byte	.LASF564
	.byte	0x3
	.byte	0xd
	.byte	0x18
	.4byte	0x111
	.byte	0x3
	.4byte	0x31ce
	.uleb128 0x10
	.string	"a0"
	.byte	0x3
	.byte	0xe
	.byte	0x13
	.4byte	0x90
	.uleb128 0x10
	.string	"a7"
	.byte	0x3
	.byte	0xf
	.byte	0x13
	.4byte	0x90
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF565
	.byte	0x18
	.byte	0x18
	.4byte	0x111
	.4byte	0x31f4
	.uleb128 0x10
	.string	"a0"
	.byte	0x5
	.byte	0x19
	.byte	0x13
	.4byte	0x90
	.uleb128 0x10
	.string	"a7"
	.byte	0x5
	.byte	0x1a
	.byte	0x13
	.4byte	0x90
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF566
	.byte	0x10
	.byte	0x14
	.4byte	0x1d3b
	.4byte	0x321a
	.uleb128 0x10
	.string	"a0"
	.byte	0x5
	.byte	0x11
	.byte	0x13
	.4byte	0x90
	.uleb128 0x10
	.string	"a7"
	.byte	0x5
	.byte	0x12
	.byte	0x13
	.4byte	0x90
	.byte	0
	.uleb128 0x23
	.4byte	.LASF567
	.byte	0x2
	.byte	0x20
	.byte	0x13
	.4byte	0x71
	.byte	0x3
	.4byte	0x324e
	.uleb128 0xb
	.4byte	.LASF568
	.byte	0x2
	.byte	0x20
	.byte	0x33
	.4byte	0x324e
	.uleb128 0x10
	.string	"a0"
	.byte	0x2
	.byte	0x21
	.byte	0x13
	.4byte	0x90
	.uleb128 0x10
	.string	"a7"
	.byte	0x2
	.byte	0x22
	.byte	0x13
	.4byte	0x90
	.byte	0
	.uleb128 0x17
	.4byte	0x168e
	.uleb128 0x13
	.4byte	.LASF569
	.byte	0x2
	.byte	0x1a
	.byte	0x14
	.byte	0x3
	.4byte	0x3283
	.uleb128 0xb
	.4byte	.LASF570
	.byte	0x2
	.byte	0x1a
	.byte	0x29
	.4byte	0x1d25
	.uleb128 0x10
	.string	"a0"
	.byte	0x2
	.byte	0x1b
	.byte	0x12
	.4byte	0x71
	.uleb128 0x10
	.string	"a7"
	.byte	0x2
	.byte	0x1c
	.byte	0x12
	.4byte	0x71
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF571
	.4byte	.LASF572
	.uleb128 0x2e
	.4byte	.LASF521
	.4byte	.LASF573
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x3
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
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
	.uleb128 0x23
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 181
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x2e
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
	.sleb128 13
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x35
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x36
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x3a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
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
	.uleb128 0x3c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x83
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3f
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
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
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
	.uleb128 0x43
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x46
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
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
.LLST52:
	.byte	0x6
	.8byte	.LVL79
	.byte	0x4
	.uleb128 .LVL79-.LVL79
	.uleb128 .LVL84-.LVL79
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL84-.LVL79
	.uleb128 .LVL86-1-.LVL79
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL86-1-.LVL79
	.uleb128 .LVL86-.LVL79
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL142-.LVL79
	.uleb128 .LFE34-.LVL79
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST53:
	.byte	0x8
	.8byte	.LVL82
	.uleb128 .LVL83-1-.LVL82
	.uleb128 0x24
	.byte	0x91
	.sleb128 -1176
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x91
	.sleb128 -1172
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x91
	.sleb128 -1168
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x6
	.8byte	.LVL79
	.byte	0x4
	.uleb128 .LVL79-.LVL79
	.uleb128 .LVL80-.LVL79
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1176
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL80-.LVL79
	.uleb128 .LVL81-.LVL79
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST56:
	.byte	0x6
	.8byte	.LVL85
	.byte	0x4
	.uleb128 .LVL85-.LVL85
	.uleb128 .LVL86-1-.LVL85
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL86-1-.LVL85
	.uleb128 .LVL86-.LVL85
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST58:
	.byte	0x6
	.8byte	.LVL87
	.byte	0x4
	.uleb128 .LVL87-.LVL87
	.uleb128 .LVL115-.LVL87
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL115-.LVL87
	.uleb128 .LVL116-1-.LVL87
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL116-1-.LVL87
	.uleb128 .LVL134-.LVL87
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL87
	.uleb128 .LVL135-1-.LVL87
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL135-1-.LVL87
	.uleb128 .LVL138-.LVL87
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL138-.LVL87
	.uleb128 .LVL139-1-.LVL87
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL139-1-.LVL87
	.uleb128 .LVL140-.LVL87
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL140-.LVL87
	.uleb128 .LVL141-1-.LVL87
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL141-1-.LVL87
	.uleb128 .LVL142-.LVL87
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST59:
	.byte	0x6
	.8byte	.LVL88
	.byte	0x4
	.uleb128 .LVL88-.LVL88
	.uleb128 .LVL95-.LVL88
	.uleb128 0x1
	.byte	0x6b
	.byte	0x4
	.uleb128 .LVL109-.LVL88
	.uleb128 .LVL110-.LVL88
	.uleb128 0x7
	.byte	0x8b
	.sleb128 0
	.byte	0xa
	.2byte	0x7fff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL110-.LVL88
	.uleb128 .LVL114-.LVL88
	.uleb128 0x1
	.byte	0x6b
	.byte	0x4
	.uleb128 .LVL117-.LVL88
	.uleb128 .LVL128-.LVL88
	.uleb128 0x1
	.byte	0x6b
	.byte	0x4
	.uleb128 .LVL128-.LVL88
	.uleb128 .LVL129-.LVL88
	.uleb128 0x1
	.byte	0x68
	.byte	0
.LLST61:
	.byte	0x8
	.8byte	.LVL93
	.uleb128 .LVL94-.LVL93
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST63:
	.byte	0x6
	.8byte	.LVL93
	.byte	0x4
	.uleb128 .LVL93-.LVL93
	.uleb128 .LVL96-.LVL93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL107-.LVL93
	.uleb128 .LVL109-.LVL93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST65:
	.byte	0x6
	.8byte	.LVL95
	.byte	0x4
	.uleb128 .LVL95-.LVL95
	.uleb128 .LVL96-.LVL95
	.uleb128 0x1
	.byte	0x6b
	.byte	0x4
	.uleb128 .LVL107-.LVL95
	.uleb128 .LVL109-.LVL95
	.uleb128 0x1
	.byte	0x6b
	.byte	0
.LLST67:
	.byte	0x6
	.8byte	.LVL91
	.byte	0x4
	.uleb128 .LVL91-.LVL91
	.uleb128 .LVL92-.LVL91
	.uleb128 0x7
	.byte	0x88
	.sleb128 0
	.byte	0xa
	.2byte	0x7fff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL117-.LVL91
	.uleb128 .LVL118-.LVL91
	.uleb128 0x7
	.byte	0x88
	.sleb128 0
	.byte	0xa
	.2byte	0x7fff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST68:
	.byte	0x6
	.8byte	.LVL91
	.byte	0x4
	.uleb128 .LVL91-.LVL91
	.uleb128 .LVL93-.LVL91
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0x4
	.uleb128 .LVL117-.LVL91
	.uleb128 .LVL119-.LVL91
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
.LLST71:
	.byte	0x8
	.8byte	.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST72:
	.byte	0x8
	.8byte	.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0xa
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_95
	.byte	0x9f
	.byte	0
.LLST73:
	.byte	0x8
	.8byte	.LVL97
	.uleb128 .LVL98-.LVL97
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.byte	0
.LLST74:
	.byte	0x8
	.8byte	.LVL99
	.uleb128 .LVL100-.LVL99
	.uleb128 0x4
	.byte	0xa
	.2byte	0x7d00
	.byte	0x9f
	.byte	0
.LLST75:
	.byte	0x8
	.8byte	.LVL100
	.uleb128 .LVL107-.LVL100
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST76:
	.byte	0x6
	.8byte	.LVL101
	.byte	0x4
	.uleb128 .LVL101-.LVL101
	.uleb128 .LVL104-.LVL101
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL104-.LVL101
	.uleb128 .LVL105-1-.LVL101
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
.LLST77:
	.byte	0x8
	.8byte	.LVL102
	.uleb128 .LVL107-.LVL102
	.uleb128 0xa
	.byte	0x3
	.8byte	MinecraftRegular_Bmg3_glyph_95
	.byte	0x9f
	.byte	0
.LLST79:
	.byte	0x8
	.8byte	.LVL103
	.uleb128 .LVL105-1-.LVL103
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST80:
	.byte	0x8
	.8byte	.LVL105
	.uleb128 .LVL106-.LVL105
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.byte	0
.LLST82:
	.byte	0x6
	.8byte	.LVL111
	.byte	0x4
	.uleb128 .LVL111-.LVL111
	.uleb128 .LVL115-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL115-.LVL111
	.uleb128 .LVL116-1-.LVL111
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL116-1-.LVL111
	.uleb128 .LVL116-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL124-.LVL111
	.uleb128 .LVL134-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL111
	.uleb128 .LVL135-1-.LVL111
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL135-1-.LVL111
	.uleb128 .LVL138-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL138-.LVL111
	.uleb128 .LVL139-1-.LVL111
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL139-1-.LVL111
	.uleb128 .LVL140-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL140-.LVL111
	.uleb128 .LVL141-1-.LVL111
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL141-1-.LVL111
	.uleb128 .LVL142-.LVL111
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST84:
	.byte	0x8
	.8byte	.LVL112
	.uleb128 .LVL113-.LVL112
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST85:
	.byte	0x6
	.8byte	.LVL114
	.byte	0x4
	.uleb128 .LVL114-.LVL114
	.uleb128 .LVL115-.LVL114
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL115-.LVL114
	.uleb128 .LVL116-1-.LVL114
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL116-1-.LVL114
	.uleb128 .LVL116-.LVL114
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST87:
	.byte	0x6
	.8byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL134-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL134-.LVL124
	.uleb128 .LVL135-1-.LVL124
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL135-1-.LVL124
	.uleb128 .LVL135-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL137-.LVL124
	.uleb128 .LVL138-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL138-.LVL124
	.uleb128 .LVL139-1-.LVL124
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL139-1-.LVL124
	.uleb128 .LVL140-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL140-.LVL124
	.uleb128 .LVL141-1-.LVL124
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL141-1-.LVL124
	.uleb128 .LVL141-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST88:
	.byte	0x6
	.8byte	.LVL124
	.byte	0x4
	.uleb128 .LVL124-.LVL124
	.uleb128 .LVL126-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1156
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL126-.LVL124
	.uleb128 .LVL127-1-.LVL124
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL127-1-.LVL124
	.uleb128 .LVL135-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1156
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL137-.LVL124
	.uleb128 .LVL141-.LVL124
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1156
	.byte	0x9f
	.byte	0
.LLST89:
	.byte	0x6
	.8byte	.LVL130
	.byte	0x4
	.uleb128 .LVL130-.LVL130
	.uleb128 .LVL135-.LVL130
	.uleb128 0x1
	.byte	0x68
	.byte	0x4
	.uleb128 .LVL137-.LVL130
	.uleb128 .LVL141-.LVL130
	.uleb128 0x1
	.byte	0x68
	.byte	0
.LLST90:
	.byte	0x8
	.8byte	.LVL136
	.uleb128 .LVL137-.LVL136
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST91:
	.byte	0x8
	.8byte	.LVL119
	.uleb128 .LVL124-.LVL119
	.uleb128 0x4
	.byte	0x91
	.sleb128 -1184
	.byte	0x9f
	.byte	0
.LLST92:
	.byte	0x6
	.8byte	.LVL121
	.byte	0x4
	.uleb128 .LVL121-.LVL121
	.uleb128 .LVL122-.LVL121
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL122-.LVL121
	.uleb128 .LVL123-1-.LVL121
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST40:
	.byte	0x6
	.8byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL47-1-.LVL45
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL47-1-.LVL45
	.uleb128 .LVL78-.LVL45
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL78-.LVL45
	.uleb128 .LFE33-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x6
	.8byte	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL46-.LVL45
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL46-.LVL45
	.uleb128 .LFE33-.LVL45
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST42:
	.byte	0x8
	.8byte	.LVL48
	.uleb128 .LVL49-.LVL48
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST43:
	.byte	0x8
	.8byte	.LVL51
	.uleb128 .LVL52-.LVL51
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST44:
	.byte	0x8
	.8byte	.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST45:
	.byte	0x8
	.8byte	.LVL57
	.uleb128 .LVL58-.LVL57
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST46:
	.byte	0x8
	.8byte	.LVL60
	.uleb128 .LVL61-.LVL60
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST47:
	.byte	0x8
	.8byte	.LVL65
	.uleb128 .LVL66-.LVL65
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST48:
	.byte	0x8
	.8byte	.LVL68
	.uleb128 .LVL69-.LVL68
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST49:
	.byte	0x8
	.8byte	.LVL71
	.uleb128 .LVL72-.LVL71
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST50:
	.byte	0x8
	.8byte	.LVL74
	.uleb128 .LVL75-.LVL74
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST33:
	.byte	0x6
	.8byte	.LVL33
	.byte	0x4
	.uleb128 .LVL33-.LVL33
	.uleb128 .LVL35-1-.LVL33
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL35-1-.LVL33
	.uleb128 .LVL42-.LVL33
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL42-.LVL33
	.uleb128 .LFE32-.LVL33
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x6
	.8byte	.LVL33
	.byte	0x4
	.uleb128 .LVL33-.LVL33
	.uleb128 .LVL34-.LVL33
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL34-.LVL33
	.uleb128 .LFE32-.LVL33
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST36:
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
	.uleb128 .LVL40-.LVL35
	.uleb128 0x15
	.byte	0x79
	.sleb128 0
	.byte	0x3
	.8byte	commands
	.byte	0x1c
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x48
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x1b
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL40-.LVL35
	.uleb128 .LVL41-.LVL35
	.uleb128 0x15
	.byte	0x79
	.sleb128 0
	.byte	0x3
	.8byte	commands+24
	.byte	0x1c
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x48
	.byte	0xa8
	.uleb128 0x2a
	.byte	0x1b
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.LLST12:
	.byte	0x6
	.8byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL12-.LVL10
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL12-.LVL10
	.uleb128 .LVL15-.LVL10
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL15-.LVL10
	.uleb128 .LFE31-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x6
	.8byte	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL13-.LVL10
	.uleb128 .LFE31-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x6
	.8byte	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-.LVL11
	.uleb128 0x21
	.byte	0x7a
	.sleb128 8
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x7a
	.sleb128 12
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x7a
	.sleb128 16
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL12-.LVL11
	.uleb128 .LVL14-1-.LVL11
	.uleb128 0x21
	.byte	0x78
	.sleb128 8
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x78
	.sleb128 12
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x78
	.sleb128 16
	.byte	0x94
	.byte	0x4
	.byte	0xc
	.4byte	0xffffffff
	.byte	0x1a
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LLST38:
	.byte	0x6
	.8byte	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL44-1-.LVL43
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL44-1-.LVL43
	.uleb128 .LFE30-.LVL43
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x6
	.8byte	.LVL43
	.byte	0x4
	.uleb128 .LVL43-.LVL43
	.uleb128 .LVL44-1-.LVL43
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL44-1-.LVL43
	.uleb128 .LFE30-.LVL43
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x6
	.8byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL30-.LVL16
	.uleb128 0x1
	.byte	0x62
	.byte	0x4
	.uleb128 .LVL30-.LVL16
	.uleb128 .LFE23-.LVL16
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -8
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x6
	.8byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL29-.LVL16
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL29-.LVL16
	.uleb128 .LFE23-.LVL16
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x6
	.8byte	.LVL16
	.byte	0x4
	.uleb128 .LVL16-.LVL16
	.uleb128 .LVL18-.LVL16
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL18-.LVL16
	.uleb128 .LVL21-.LVL16
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL21-.LVL16
	.uleb128 .LVL24-1-.LVL16
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL24-1-.LVL16
	.uleb128 .LVL27-.LVL16
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL27-.LVL16
	.uleb128 .LFE23-.LVL16
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST18:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x5b
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL29-.LVL17
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL29-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x3
	.byte	0x7a
	.sleb128 20
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL30-.LVL17
	.uleb128 0x3
	.byte	0x82
	.sleb128 20
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x3
	.byte	0x7e
	.sleb128 12
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL32-.LVL17
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL32-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST21:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL21-.LVL17
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL21-.LVL17
	.uleb128 .LVL24-1-.LVL17
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL24-1-.LVL17
	.uleb128 .LVL27-.LVL17
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL27-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST22:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL21-.LVL17
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL21-.LVL17
	.uleb128 .LVL24-1-.LVL17
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL24-1-.LVL17
	.uleb128 .LVL27-.LVL17
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL27-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST23:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL31-.LVL17
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL31-.LVL17
	.uleb128 .LFE23-.LVL17
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST24:
	.byte	0x6
	.8byte	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL26-.LVL17
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL26-.LVL17
	.uleb128 .LVL27-.LVL17
	.uleb128 0x3
	.byte	0x78
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL17
	.uleb128 .LVL28-.LVL17
	.uleb128 0x1
	.byte	0x58
	.byte	0
.LLST26:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL20-.LVL19
	.uleb128 0x5
	.byte	0x79
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x4
	.uleb128 .LVL20-.LVL19
	.uleb128 .LVL23-.LVL19
	.uleb128 0x2
	.byte	0x7b
	.sleb128 0
	.byte	0x4
	.uleb128 .LVL23-.LVL19
	.uleb128 .LVL24-1-.LVL19
	.uleb128 0x5
	.byte	0x79
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
.LLST27:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x3
	.byte	0x82
	.sleb128 20
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LVL30-.LVL19
	.uleb128 0x3
	.byte	0x82
	.sleb128 20
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x3
	.byte	0x7e
	.sleb128 12
	.byte	0x9f
	.byte	0
.LLST28:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LVL32-.LVL19
	.uleb128 0x1
	.byte	0x67
	.byte	0x4
	.uleb128 .LVL32-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST29:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL24-1-.LVL19
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL24-1-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x1
	.byte	0x66
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST30:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL24-1-.LVL19
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL24-1-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x1
	.byte	0x65
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST31:
	.byte	0x6
	.8byte	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL25-.LVL19
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LVL31-.LVL19
	.uleb128 0x1
	.byte	0x63
	.byte	0x4
	.uleb128 .LVL31-.LVL19
	.uleb128 .LFE23-.LVL19
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LLST32:
	.byte	0x8
	.8byte	.LVL22
	.uleb128 .LVL25-.LVL22
	.uleb128 0x1
	.byte	0x68
	.byte	0
.LLST0:
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
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LLST2:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL8-.LVL1
	.uleb128 0x5
	.byte	0x76
	.sleb128 0
	.byte	0x33
	.byte	0x26
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL5-.LVL1
	.uleb128 0xe
	.byte	0x76
	.sleb128 0
	.byte	0x33
	.byte	0x26
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x7a
	.sleb128 8
	.byte	0x6
	.byte	0x22
	.byte	0
.LLST4:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL8-.LVL1
	.uleb128 0x6
	.byte	0x76
	.sleb128 0
	.byte	0x20
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0xa
	.byte	0x76
	.sleb128 0
	.byte	0x8d
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.8byte	.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x6
	.byte	0x76
	.sleb128 0
	.byte	0x8d
	.sleb128 0
	.byte	0x1b
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x8
	.8byte	.LVL2
	.uleb128 .LVL4-.LVL2
	.uleb128 0x1
	.byte	0x60
	.byte	0
.LLST9:
	.byte	0x8
	.8byte	.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0x14
	.byte	0x76
	.sleb128 0
	.byte	0x8d
	.sleb128 0
	.byte	0x1b
	.byte	0x7a
	.sleb128 3
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x22
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x8
	.8byte	.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x60
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
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
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
.LLRL1:
	.byte	0x5
	.8byte	.LBB51
	.byte	0x4
	.uleb128 .LBB51-.LBB51
	.uleb128 .LBE51-.LBB51
	.byte	0x4
	.uleb128 .LBB57-.LBB51
	.uleb128 .LBE57-.LBB51
	.byte	0
.LLRL5:
	.byte	0x5
	.8byte	.LBB52
	.byte	0x4
	.uleb128 .LBB52-.LBB52
	.uleb128 .LBE52-.LBB52
	.byte	0x4
	.uleb128 .LBB56-.LBB52
	.uleb128 .LBE56-.LBB52
	.byte	0
.LLRL10:
	.byte	0x5
	.8byte	.LBB53
	.byte	0x4
	.uleb128 .LBB53-.LBB53
	.uleb128 .LBE53-.LBB53
	.byte	0x4
	.uleb128 .LBB54-.LBB53
	.uleb128 .LBE54-.LBB53
	.byte	0x4
	.uleb128 .LBB55-.LBB53
	.uleb128 .LBE55-.LBB53
	.byte	0
.LLRL25:
	.byte	0x5
	.8byte	.LBB65
	.byte	0x4
	.uleb128 .LBB65-.LBB65
	.uleb128 .LBE65-.LBB65
	.byte	0x4
	.uleb128 .LBB70-.LBB65
	.uleb128 .LBE70-.LBB65
	.byte	0x4
	.uleb128 .LBB71-.LBB65
	.uleb128 .LBE71-.LBB65
	.byte	0x4
	.uleb128 .LBB72-.LBB65
	.uleb128 .LBE72-.LBB65
	.byte	0
.LLRL35:
	.byte	0x5
	.8byte	.LBB73
	.byte	0x4
	.uleb128 .LBB73-.LBB73
	.uleb128 .LBE73-.LBB73
	.byte	0x4
	.uleb128 .LBB80-.LBB73
	.uleb128 .LBE80-.LBB73
	.byte	0x4
	.uleb128 .LBB81-.LBB73
	.uleb128 .LBE81-.LBB73
	.byte	0
.LLRL37:
	.byte	0x5
	.8byte	.LBB74
	.byte	0x4
	.uleb128 .LBB74-.LBB74
	.uleb128 .LBE74-.LBB74
	.byte	0x4
	.uleb128 .LBB78-.LBB74
	.uleb128 .LBE78-.LBB74
	.byte	0x4
	.uleb128 .LBB79-.LBB74
	.uleb128 .LBE79-.LBB74
	.byte	0
.LLRL51:
	.byte	0x5
	.8byte	.LBB147
	.byte	0x4
	.uleb128 .LBB147-.LBB147
	.uleb128 .LBE147-.LBB147
	.byte	0x4
	.uleb128 .LBB231-.LBB147
	.uleb128 .LBE231-.LBB147
	.byte	0
.LLRL55:
	.byte	0x5
	.8byte	.LBB153
	.byte	0x4
	.uleb128 .LBB153-.LBB153
	.uleb128 .LBE153-.LBB153
	.byte	0x4
	.uleb128 .LBB158-.LBB153
	.uleb128 .LBE158-.LBB153
	.byte	0x4
	.uleb128 .LBB159-.LBB153
	.uleb128 .LBE159-.LBB153
	.byte	0x4
	.uleb128 .LBB160-.LBB153
	.uleb128 .LBE160-.LBB153
	.byte	0
.LLRL57:
	.byte	0x5
	.8byte	.LBB162
	.byte	0x4
	.uleb128 .LBB162-.LBB162
	.uleb128 .LBE162-.LBB162
	.byte	0x4
	.uleb128 .LBB229-.LBB162
	.uleb128 .LBE229-.LBB162
	.byte	0x4
	.uleb128 .LBB230-.LBB162
	.uleb128 .LBE230-.LBB162
	.byte	0
.LLRL60:
	.byte	0x5
	.8byte	.LBB164
	.byte	0x4
	.uleb128 .LBB164-.LBB164
	.uleb128 .LBE164-.LBB164
	.byte	0x4
	.uleb128 .LBB188-.LBB164
	.uleb128 .LBE188-.LBB164
	.byte	0x4
	.uleb128 .LBB203-.LBB164
	.uleb128 .LBE203-.LBB164
	.byte	0x4
	.uleb128 .LBB222-.LBB164
	.uleb128 .LBE222-.LBB164
	.byte	0
.LLRL62:
	.byte	0x5
	.8byte	.LBB165
	.byte	0x4
	.uleb128 .LBB165-.LBB165
	.uleb128 .LBE165-.LBB165
	.byte	0x4
	.uleb128 .LBB174-.LBB165
	.uleb128 .LBE174-.LBB165
	.byte	0x4
	.uleb128 .LBB176-.LBB165
	.uleb128 .LBE176-.LBB165
	.byte	0x4
	.uleb128 .LBB177-.LBB165
	.uleb128 .LBE177-.LBB165
	.byte	0
.LLRL66:
	.byte	0x5
	.8byte	.LBB170
	.byte	0x4
	.uleb128 .LBB170-.LBB170
	.uleb128 .LBE170-.LBB170
	.byte	0x4
	.uleb128 .LBB175-.LBB170
	.uleb128 .LBE175-.LBB170
	.byte	0x4
	.uleb128 .LBB178-.LBB170
	.uleb128 .LBE178-.LBB170
	.byte	0
.LLRL69:
	.byte	0x5
	.8byte	.LBB179
	.byte	0x4
	.uleb128 .LBB179-.LBB179
	.uleb128 .LBE179-.LBB179
	.byte	0x4
	.uleb128 .LBB191-.LBB179
	.uleb128 .LBE191-.LBB179
	.byte	0
.LLRL70:
	.byte	0x5
	.8byte	.LBB182
	.byte	0x4
	.uleb128 .LBB182-.LBB182
	.uleb128 .LBE182-.LBB182
	.byte	0x4
	.uleb128 .LBB185-.LBB182
	.uleb128 .LBE185-.LBB182
	.byte	0
.LLRL78:
	.byte	0x5
	.8byte	.LBB199
	.byte	0x4
	.uleb128 .LBB199-.LBB199
	.uleb128 .LBE199-.LBB199
	.byte	0x4
	.uleb128 .LBB202-.LBB199
	.uleb128 .LBE202-.LBB199
	.byte	0
.LLRL81:
	.byte	0x5
	.8byte	.LBB204
	.byte	0x4
	.uleb128 .LBB204-.LBB204
	.uleb128 .LBE204-.LBB204
	.byte	0x4
	.uleb128 .LBB226-.LBB204
	.uleb128 .LBE226-.LBB204
	.byte	0
.LLRL83:
	.byte	0x5
	.8byte	.LBB206
	.byte	0x4
	.uleb128 .LBB206-.LBB206
	.uleb128 .LBE206-.LBB206
	.byte	0x4
	.uleb128 .LBB210-.LBB206
	.uleb128 .LBE210-.LBB206
	.byte	0x4
	.uleb128 .LBB211-.LBB206
	.uleb128 .LBE211-.LBB206
	.byte	0
.LLRL86:
	.byte	0x5
	.8byte	.LBB214
	.byte	0x4
	.uleb128 .LBB214-.LBB214
	.uleb128 .LBE214-.LBB214
	.byte	0x4
	.uleb128 .LBB220-.LBB214
	.uleb128 .LBE220-.LBB214
	.byte	0
.LLRL93:
	.byte	0x7
	.8byte	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.8byte	.LFB34
	.uleb128 .LFE34-.LFB34
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF534:
	.string	"terminal_handle_enter"
.LASF300:
	.string	"SDL_SCANCODE_SEMICOLON"
.LASF369:
	.string	"SDL_SCANCODE_STOP"
.LASF363:
	.string	"SDL_SCANCODE_F23"
.LASF229:
	.string	"MinecraftRegular_Bmg3_glyph_U00F6"
.LASF364:
	.string	"SDL_SCANCODE_F24"
.LASF20:
	.string	"int8_t"
.LASF34:
	.string	"MinecraftRegular_Bmg3_glyph_32_data"
.LASF15:
	.string	"size_t"
.LASF68:
	.string	"MinecraftRegular_Bmg3_glyph_49_data"
.LASF462:
	.string	"SDL_SCANCODE_RSHIFT"
.LASF288:
	.string	"SDL_SCANCODE_0"
.LASF279:
	.string	"SDL_SCANCODE_1"
.LASF280:
	.string	"SDL_SCANCODE_2"
.LASF281:
	.string	"SDL_SCANCODE_3"
.LASF282:
	.string	"SDL_SCANCODE_4"
.LASF283:
	.string	"SDL_SCANCODE_5"
.LASF284:
	.string	"SDL_SCANCODE_6"
.LASF285:
	.string	"SDL_SCANCODE_7"
.LASF286:
	.string	"SDL_SCANCODE_8"
.LASF287:
	.string	"SDL_SCANCODE_9"
.LASF35:
	.string	"MinecraftRegular_Bmg3_glyph_32"
.LASF37:
	.string	"MinecraftRegular_Bmg3_glyph_33"
.LASF39:
	.string	"MinecraftRegular_Bmg3_glyph_34"
.LASF41:
	.string	"MinecraftRegular_Bmg3_glyph_35"
.LASF43:
	.string	"MinecraftRegular_Bmg3_glyph_36"
.LASF45:
	.string	"MinecraftRegular_Bmg3_glyph_37"
.LASF47:
	.string	"MinecraftRegular_Bmg3_glyph_38"
.LASF49:
	.string	"MinecraftRegular_Bmg3_glyph_39"
.LASF259:
	.string	"SDL_SCANCODE_G"
.LASF260:
	.string	"SDL_SCANCODE_H"
.LASF261:
	.string	"SDL_SCANCODE_I"
.LASF262:
	.string	"SDL_SCANCODE_J"
.LASF263:
	.string	"SDL_SCANCODE_K"
.LASF264:
	.string	"SDL_SCANCODE_L"
.LASF265:
	.string	"SDL_SCANCODE_M"
.LASF266:
	.string	"SDL_SCANCODE_N"
.LASF164:
	.string	"MinecraftRegular_Bmg3_glyph_97_data"
.LASF268:
	.string	"SDL_SCANCODE_P"
.LASF269:
	.string	"SDL_SCANCODE_Q"
.LASF270:
	.string	"SDL_SCANCODE_R"
.LASF271:
	.string	"SDL_SCANCODE_S"
.LASF272:
	.string	"SDL_SCANCODE_T"
.LASF273:
	.string	"SDL_SCANCODE_U"
.LASF274:
	.string	"SDL_SCANCODE_V"
.LASF275:
	.string	"SDL_SCANCODE_W"
.LASF276:
	.string	"SDL_SCANCODE_X"
.LASF277:
	.string	"SDL_SCANCODE_Y"
.LASF278:
	.string	"SDL_SCANCODE_Z"
.LASF400:
	.string	"SDL_SCANCODE_SYSREQ"
.LASF412:
	.string	"SDL_SCANCODE_KP_000"
.LASF477:
	.string	"SDL_SCANCODE_AC_HOME"
.LASF188:
	.string	"MinecraftRegular_Bmg3_glyph_109_data"
.LASF142:
	.string	"MinecraftRegular_Bmg3_glyph_86_data"
.LASF471:
	.string	"SDL_SCANCODE_MEDIASELECT"
.LASF572:
	.string	"__builtin_calloc"
.LASF501:
	.string	"fb_info"
.LASF51:
	.string	"MinecraftRegular_Bmg3_glyph_40"
.LASF53:
	.string	"MinecraftRegular_Bmg3_glyph_41"
.LASF54:
	.string	"MinecraftRegular_Bmg3_glyph_42_data"
.LASF57:
	.string	"MinecraftRegular_Bmg3_glyph_43"
.LASF59:
	.string	"MinecraftRegular_Bmg3_glyph_44"
.LASF61:
	.string	"MinecraftRegular_Bmg3_glyph_45"
.LASF63:
	.string	"MinecraftRegular_Bmg3_glyph_46"
.LASF65:
	.string	"MinecraftRegular_Bmg3_glyph_47"
.LASF67:
	.string	"MinecraftRegular_Bmg3_glyph_48"
.LASF69:
	.string	"MinecraftRegular_Bmg3_glyph_49"
.LASF88:
	.string	"MinecraftRegular_Bmg3_glyph_59_data"
.LASF121:
	.string	"MinecraftRegular_Bmg3_glyph_75"
.LASF125:
	.string	"MinecraftRegular_Bmg3_glyph_77"
.LASF150:
	.string	"MinecraftRegular_Bmg3_glyph_90_data"
.LASF543:
	.string	"terminal_newline"
.LASF246:
	.string	"MinecraftRegular_Bmg3_glyph_U00B5_data"
.LASF547:
	.string	"terminal_clear_cursor"
.LASF434:
	.string	"SDL_SCANCODE_KP_AMPERSAND"
.LASF71:
	.string	"MinecraftRegular_Bmg3_glyph_50"
.LASF73:
	.string	"MinecraftRegular_Bmg3_glyph_51"
.LASF75:
	.string	"MinecraftRegular_Bmg3_glyph_52"
.LASF77:
	.string	"MinecraftRegular_Bmg3_glyph_53"
.LASF79:
	.string	"MinecraftRegular_Bmg3_glyph_54"
.LASF81:
	.string	"MinecraftRegular_Bmg3_glyph_55"
.LASF83:
	.string	"MinecraftRegular_Bmg3_glyph_56"
.LASF85:
	.string	"MinecraftRegular_Bmg3_glyph_57"
.LASF87:
	.string	"MinecraftRegular_Bmg3_glyph_58"
.LASF89:
	.string	"MinecraftRegular_Bmg3_glyph_59"
.LASF438:
	.string	"SDL_SCANCODE_KP_COLON"
.LASF407:
	.string	"SDL_SCANCODE_OPER"
.LASF420:
	.string	"SDL_SCANCODE_KP_RIGHTBRACE"
.LASF186:
	.string	"MinecraftRegular_Bmg3_glyph_108_data"
.LASF74:
	.string	"MinecraftRegular_Bmg3_glyph_52_data"
.LASF316:
	.string	"SDL_SCANCODE_F10"
.LASF317:
	.string	"SDL_SCANCODE_F11"
.LASF318:
	.string	"SDL_SCANCODE_F12"
.LASF353:
	.string	"SDL_SCANCODE_F13"
.LASF108:
	.string	"MinecraftRegular_Bmg3_glyph_69_data"
.LASF355:
	.string	"SDL_SCANCODE_F15"
.LASF230:
	.string	"MinecraftRegular_Bmg3_glyph_U00D6_data"
.LASF357:
	.string	"SDL_SCANCODE_F17"
.LASF358:
	.string	"SDL_SCANCODE_F18"
.LASF359:
	.string	"SDL_SCANCODE_F19"
.LASF5:
	.string	"__uint8_t"
.LASF91:
	.string	"MinecraftRegular_Bmg3_glyph_60"
.LASF93:
	.string	"MinecraftRegular_Bmg3_glyph_61"
.LASF95:
	.string	"MinecraftRegular_Bmg3_glyph_62"
.LASF97:
	.string	"MinecraftRegular_Bmg3_glyph_63"
.LASF99:
	.string	"MinecraftRegular_Bmg3_glyph_64"
.LASF101:
	.string	"MinecraftRegular_Bmg3_glyph_65"
.LASF103:
	.string	"MinecraftRegular_Bmg3_glyph_66"
.LASF105:
	.string	"MinecraftRegular_Bmg3_glyph_67"
.LASF107:
	.string	"MinecraftRegular_Bmg3_glyph_68"
.LASF109:
	.string	"MinecraftRegular_Bmg3_glyph_69"
.LASF406:
	.string	"SDL_SCANCODE_OUT"
.LASF566:
	.string	"key_available"
.LASF473:
	.string	"SDL_SCANCODE_MAIL"
.LASF533:
	.string	"terminal_process_input"
.LASF297:
	.string	"SDL_SCANCODE_RIGHTBRACKET"
.LASF194:
	.string	"MinecraftRegular_Bmg3_glyph_112_data"
.LASF373:
	.string	"SDL_SCANCODE_COPY"
.LASF508:
	.string	"last_blink_time"
.LASF360:
	.string	"SDL_SCANCODE_F20"
.LASF12:
	.string	"long int"
.LASF362:
	.string	"SDL_SCANCODE_F22"
.LASF351:
	.string	"SDL_SCANCODE_POWER"
.LASF172:
	.string	"MinecraftRegular_Bmg3_glyph_101_data"
.LASF484:
	.string	"SDL_SCANCODE_BRIGHTNESSUP"
.LASF307:
	.string	"SDL_SCANCODE_F1"
.LASF308:
	.string	"SDL_SCANCODE_F2"
.LASF309:
	.string	"SDL_SCANCODE_F3"
.LASF310:
	.string	"SDL_SCANCODE_F4"
.LASF311:
	.string	"SDL_SCANCODE_F5"
.LASF312:
	.string	"SDL_SCANCODE_F6"
.LASF313:
	.string	"SDL_SCANCODE_F7"
.LASF314:
	.string	"SDL_SCANCODE_F8"
.LASF111:
	.string	"MinecraftRegular_Bmg3_glyph_70"
.LASF113:
	.string	"MinecraftRegular_Bmg3_glyph_71"
.LASF115:
	.string	"MinecraftRegular_Bmg3_glyph_72"
.LASF117:
	.string	"MinecraftRegular_Bmg3_glyph_73"
.LASF119:
	.string	"MinecraftRegular_Bmg3_glyph_74"
.LASF94:
	.string	"MinecraftRegular_Bmg3_glyph_62_data"
.LASF123:
	.string	"MinecraftRegular_Bmg3_glyph_76"
.LASF28:
	.string	"x_offset"
.LASF127:
	.string	"MinecraftRegular_Bmg3_glyph_78"
.LASF129:
	.string	"MinecraftRegular_Bmg3_glyph_79"
.LASF540:
	.string	"terminal_print_prompt"
.LASF433:
	.string	"SDL_SCANCODE_KP_GREATER"
.LASF507:
	.string	"cursor_visible"
.LASF128:
	.string	"MinecraftRegular_Bmg3_glyph_79_data"
.LASF328:
	.string	"SDL_SCANCODE_RIGHT"
.LASF576:
	.string	"main"
.LASF448:
	.string	"SDL_SCANCODE_KP_MEMMULTIPLY"
.LASF327:
	.string	"SDL_SCANCODE_PAGEDOWN"
.LASF403:
	.string	"SDL_SCANCODE_PRIOR"
.LASF446:
	.string	"SDL_SCANCODE_KP_MEMADD"
.LASF251:
	.string	"fb_info_t"
.LASF330:
	.string	"SDL_SCANCODE_DOWN"
.LASF302:
	.string	"SDL_SCANCODE_GRAVE"
.LASF40:
	.string	"MinecraftRegular_Bmg3_glyph_35_data"
.LASF295:
	.string	"SDL_SCANCODE_EQUALS"
.LASF470:
	.string	"SDL_SCANCODE_AUDIOMUTE"
.LASF497:
	.string	"SDL_SCANCODE_CALL"
.LASF427:
	.string	"SDL_SCANCODE_KP_E"
.LASF469:
	.string	"SDL_SCANCODE_AUDIOPLAY"
.LASF482:
	.string	"SDL_SCANCODE_AC_BOOKMARKS"
.LASF214:
	.string	"MinecraftRegular_Bmg3_glyph_122_data"
.LASF131:
	.string	"MinecraftRegular_Bmg3_glyph_80"
.LASF133:
	.string	"MinecraftRegular_Bmg3_glyph_81"
.LASF135:
	.string	"MinecraftRegular_Bmg3_glyph_82"
.LASF137:
	.string	"MinecraftRegular_Bmg3_glyph_83"
.LASF139:
	.string	"MinecraftRegular_Bmg3_glyph_84"
.LASF141:
	.string	"MinecraftRegular_Bmg3_glyph_85"
.LASF143:
	.string	"MinecraftRegular_Bmg3_glyph_86"
.LASF145:
	.string	"MinecraftRegular_Bmg3_glyph_87"
.LASF147:
	.string	"MinecraftRegular_Bmg3_glyph_88"
.LASF149:
	.string	"MinecraftRegular_Bmg3_glyph_89"
.LASF136:
	.string	"MinecraftRegular_Bmg3_glyph_83_data"
.LASF563:
	.string	"sleep_us"
.LASF192:
	.string	"MinecraftRegular_Bmg3_glyph_111_data"
.LASF3:
	.string	"signed char"
.LASF21:
	.string	"uint8_t"
.LASF114:
	.string	"MinecraftRegular_Bmg3_glyph_72_data"
.LASF299:
	.string	"SDL_SCANCODE_NONUSHASH"
.LASF442:
	.string	"SDL_SCANCODE_KP_EXCLAM"
.LASF148:
	.string	"MinecraftRegular_Bmg3_glyph_89_data"
.LASF228:
	.string	"MinecraftRegular_Bmg3_glyph_U00F6_data"
.LASF151:
	.string	"MinecraftRegular_Bmg3_glyph_90"
.LASF153:
	.string	"MinecraftRegular_Bmg3_glyph_91"
.LASF155:
	.string	"MinecraftRegular_Bmg3_glyph_92"
.LASF157:
	.string	"MinecraftRegular_Bmg3_glyph_93"
.LASF159:
	.string	"MinecraftRegular_Bmg3_glyph_94"
.LASF161:
	.string	"MinecraftRegular_Bmg3_glyph_95"
.LASF163:
	.string	"MinecraftRegular_Bmg3_glyph_96"
.LASF165:
	.string	"MinecraftRegular_Bmg3_glyph_97"
.LASF167:
	.string	"MinecraftRegular_Bmg3_glyph_98"
.LASF169:
	.string	"MinecraftRegular_Bmg3_glyph_99"
.LASF6:
	.string	"unsigned char"
.LASF60:
	.string	"MinecraftRegular_Bmg3_glyph_45_data"
.LASF460:
	.string	"SDL_SCANCODE_LGUI"
.LASF379:
	.string	"SDL_SCANCODE_KP_COMMA"
.LASF531:
	.string	"cmd_echo"
.LASF32:
	.string	"Glyph"
.LASF414:
	.string	"SDL_SCANCODE_DECIMALSEPARATOR"
.LASF156:
	.string	"MinecraftRegular_Bmg3_glyph_93_data"
.LASF212:
	.string	"MinecraftRegular_Bmg3_glyph_121_data"
.LASF293:
	.string	"SDL_SCANCODE_SPACE"
.LASF491:
	.string	"SDL_SCANCODE_APP1"
.LASF485:
	.string	"SDL_SCANCODE_DISPLAYSWITCH"
.LASF233:
	.string	"MinecraftRegular_Bmg3_glyph_U00FC"
.LASF509:
	.string	"_Bool"
.LASF134:
	.string	"MinecraftRegular_Bmg3_glyph_82_data"
.LASF561:
	.string	"german_scancode_to_char"
.LASF464:
	.string	"SDL_SCANCODE_RGUI"
.LASF399:
	.string	"SDL_SCANCODE_ALTERASE"
.LASF168:
	.string	"MinecraftRegular_Bmg3_glyph_99_data"
.LASF18:
	.string	"char"
.LASF453:
	.string	"SDL_SCANCODE_KP_BINARY"
.LASF538:
	.string	"glyph"
.LASF80:
	.string	"MinecraftRegular_Bmg3_glyph_55_data"
.LASF528:
	.string	"cmd_help"
.LASF8:
	.string	"__uint16_t"
.LASF432:
	.string	"SDL_SCANCODE_KP_LESS"
.LASF378:
	.string	"SDL_SCANCODE_VOLUMEDOWN"
.LASF559:
	.string	"fb_index"
.LASF294:
	.string	"SDL_SCANCODE_MINUS"
.LASF365:
	.string	"SDL_SCANCODE_EXECUTE"
.LASF250:
	.string	"MinecraftRegular_Bmg3_table"
.LASF498:
	.string	"SDL_SCANCODE_ENDCALL"
.LASF237:
	.string	"MinecraftRegular_Bmg3_glyph_U00DF"
.LASF436:
	.string	"SDL_SCANCODE_KP_VERTICALBAR"
.LASF305:
	.string	"SDL_SCANCODE_SLASH"
.LASF200:
	.string	"MinecraftRegular_Bmg3_glyph_115_data"
.LASF154:
	.string	"MinecraftRegular_Bmg3_glyph_92_data"
.LASF179:
	.string	"MinecraftRegular_Bmg3_glyph_104"
.LASF492:
	.string	"SDL_SCANCODE_APP2"
.LASF518:
	.string	"strcmp"
.LASF178:
	.string	"MinecraftRegular_Bmg3_glyph_104_data"
.LASF409:
	.string	"SDL_SCANCODE_CRSEL"
.LASF541:
	.string	"text"
.LASF100:
	.string	"MinecraftRegular_Bmg3_glyph_65_data"
.LASF30:
	.string	"advance"
.LASF348:
	.string	"SDL_SCANCODE_KP_PERIOD"
.LASF454:
	.string	"SDL_SCANCODE_KP_OCTAL"
.LASF535:
	.string	"input"
.LASF411:
	.string	"SDL_SCANCODE_KP_00"
.LASF532:
	.string	"scancode"
.LASF329:
	.string	"SDL_SCANCODE_LEFT"
.LASF334:
	.string	"SDL_SCANCODE_KP_MULTIPLY"
.LASF444:
	.string	"SDL_SCANCODE_KP_MEMRECALL"
.LASF46:
	.string	"MinecraftRegular_Bmg3_glyph_38_data"
.LASF220:
	.string	"MinecraftRegular_Bmg3_glyph_125_data"
.LASF570:
	.string	"buffer"
.LASF350:
	.string	"SDL_SCANCODE_APPLICATION"
.LASF198:
	.string	"MinecraftRegular_Bmg3_glyph_114_data"
.LASF375:
	.string	"SDL_SCANCODE_FIND"
.LASF184:
	.string	"MinecraftRegular_Bmg3_glyph_107_data"
.LASF320:
	.string	"SDL_SCANCODE_SCROLLLOCK"
.LASF120:
	.string	"MinecraftRegular_Bmg3_glyph_75_data"
.LASF565:
	.string	"get_key"
.LASF410:
	.string	"SDL_SCANCODE_EXSEL"
.LASF529:
	.string	"cmd_clear"
.LASF553:
	.string	"index"
.LASF66:
	.string	"MinecraftRegular_Bmg3_glyph_48_data"
.LASF303:
	.string	"SDL_SCANCODE_COMMA"
.LASF450:
	.string	"SDL_SCANCODE_KP_PLUSMINUS"
.LASF437:
	.string	"SDL_SCANCODE_KP_DBLVERTICALBAR"
.LASF447:
	.string	"SDL_SCANCODE_KP_MEMSUBTRACT"
.LASF13:
	.string	"__uint64_t"
.LASF44:
	.string	"MinecraftRegular_Bmg3_glyph_37_data"
.LASF2:
	.string	"long unsigned int"
.LASF234:
	.string	"MinecraftRegular_Bmg3_glyph_U00DC_data"
.LASF162:
	.string	"MinecraftRegular_Bmg3_glyph_96_data"
.LASF506:
	.string	"shift_pressed"
.LASF218:
	.string	"MinecraftRegular_Bmg3_glyph_124_data"
.LASF548:
	.string	"terminal_init"
.LASF322:
	.string	"SDL_SCANCODE_INSERT"
.LASF562:
	.string	"shift"
.LASF140:
	.string	"MinecraftRegular_Bmg3_glyph_85_data"
.LASF324:
	.string	"SDL_SCANCODE_PAGEUP"
.LASF527:
	.string	"cmd_neofetch"
.LASF52:
	.string	"MinecraftRegular_Bmg3_glyph_41_data"
.LASF217:
	.string	"MinecraftRegular_Bmg3_glyph_123"
.LASF494:
	.string	"SDL_SCANCODE_AUDIOFASTFORWARD"
.LASF86:
	.string	"MinecraftRegular_Bmg3_glyph_58_data"
.LASF25:
	.string	"uintptr_t"
.LASF306:
	.string	"SDL_SCANCODE_CAPSLOCK"
.LASF404:
	.string	"SDL_SCANCODE_RETURN2"
.LASF517:
	.string	"sprintf"
.LASF33:
	.string	"ssizetype"
.LASF439:
	.string	"SDL_SCANCODE_KP_HASH"
.LASF560:
	.string	"terminal_execute_command"
.LASF573:
	.string	"__builtin_memset"
.LASF452:
	.string	"SDL_SCANCODE_KP_CLEARENTRY"
.LASF555:
	.string	"relative_x"
.LASF556:
	.string	"relative_y"
.LASF525:
	.string	"args"
.LASF292:
	.string	"SDL_SCANCODE_TAB"
.LASF405:
	.string	"SDL_SCANCODE_SEPARATOR"
.LASF401:
	.string	"SDL_SCANCODE_CANCEL"
.LASF160:
	.string	"MinecraftRegular_Bmg3_glyph_95_data"
.LASF335:
	.string	"SDL_SCANCODE_KP_MINUS"
.LASF252:
	.string	"SDL_SCANCODE_UNKNOWN"
.LASF514:
	.string	"description"
.LASF10:
	.string	"__uint32_t"
.LASF567:
	.string	"get_framebuffer_info"
.LASF72:
	.string	"MinecraftRegular_Bmg3_glyph_51_data"
.LASF496:
	.string	"SDL_SCANCODE_SOFTRIGHT"
.LASF16:
	.string	"long long int"
.LASF545:
	.string	"current_time"
.LASF551:
	.string	"terminal_print"
.LASF106:
	.string	"MinecraftRegular_Bmg3_glyph_68_data"
.LASF26:
	.string	"width"
.LASF50:
	.string	"MinecraftRegular_Bmg3_glyph_40_data"
.LASF381:
	.string	"SDL_SCANCODE_INTERNATIONAL1"
.LASF382:
	.string	"SDL_SCANCODE_INTERNATIONAL2"
.LASF383:
	.string	"SDL_SCANCODE_INTERNATIONAL3"
.LASF384:
	.string	"SDL_SCANCODE_INTERNATIONAL4"
.LASF385:
	.string	"SDL_SCANCODE_INTERNATIONAL5"
.LASF386:
	.string	"SDL_SCANCODE_INTERNATIONAL6"
.LASF387:
	.string	"SDL_SCANCODE_INTERNATIONAL7"
.LASF388:
	.string	"SDL_SCANCODE_INTERNATIONAL8"
.LASF389:
	.string	"SDL_SCANCODE_INTERNATIONAL9"
.LASF440:
	.string	"SDL_SCANCODE_KP_SPACE"
.LASF226:
	.string	"MinecraftRegular_Bmg3_glyph_U00C4_data"
.LASF366:
	.string	"SDL_SCANCODE_HELP"
.LASF291:
	.string	"SDL_SCANCODE_BACKSPACE"
.LASF232:
	.string	"MinecraftRegular_Bmg3_glyph_U00FC_data"
.LASF455:
	.string	"SDL_SCANCODE_KP_DECIMAL"
.LASF500:
	.string	"framebuffer"
.LASF519:
	.string	"sscanf"
.LASF321:
	.string	"SDL_SCANCODE_PAUSE"
.LASF376:
	.string	"SDL_SCANCODE_MUTE"
.LASF457:
	.string	"SDL_SCANCODE_LCTRL"
.LASF476:
	.string	"SDL_SCANCODE_AC_SEARCH"
.LASF481:
	.string	"SDL_SCANCODE_AC_REFRESH"
.LASF542:
	.string	"color"
.LASF170:
	.string	"MinecraftRegular_Bmg3_glyph_100_data"
.LASF352:
	.string	"SDL_SCANCODE_KP_EQUALS"
.LASF504:
	.string	"input_line"
.LASF490:
	.string	"SDL_SCANCODE_SLEEP"
.LASF204:
	.string	"MinecraftRegular_Bmg3_glyph_117_data"
.LASF92:
	.string	"MinecraftRegular_Bmg3_glyph_61_data"
.LASF557:
	.string	"fb_x"
.LASF486:
	.string	"SDL_SCANCODE_KBDILLUMTOGGLE"
.LASF126:
	.string	"MinecraftRegular_Bmg3_glyph_78_data"
.LASF70:
	.string	"MinecraftRegular_Bmg3_glyph_50_data"
.LASF502:
	.string	"cursor_x"
.LASF503:
	.string	"cursor_y"
.LASF483:
	.string	"SDL_SCANCODE_BRIGHTNESSDOWN"
.LASF511:
	.string	"CommandHandler"
.LASF323:
	.string	"SDL_SCANCODE_HOME"
.LASF11:
	.string	"unsigned int"
.LASF38:
	.string	"MinecraftRegular_Bmg3_glyph_34_data"
.LASF415:
	.string	"SDL_SCANCODE_CURRENCYUNIT"
.LASF337:
	.string	"SDL_SCANCODE_KP_ENTER"
.LASF558:
	.string	"fb_y"
.LASF130:
	.string	"MinecraftRegular_Bmg3_glyph_80_data"
.LASF431:
	.string	"SDL_SCANCODE_KP_PERCENT"
.LASF190:
	.string	"MinecraftRegular_Bmg3_glyph_110_data"
.LASF238:
	.string	"MinecraftRegular_Bmg3_glyph_U00A7_data"
.LASF236:
	.string	"MinecraftRegular_Bmg3_glyph_U00DF_data"
.LASF520:
	.string	"strlen"
.LASF298:
	.string	"SDL_SCANCODE_BACKSLASH"
.LASF112:
	.string	"MinecraftRegular_Bmg3_glyph_71_data"
.LASF480:
	.string	"SDL_SCANCODE_AC_STOP"
.LASF539:
	.string	"terminal_handle_backspace"
.LASF461:
	.string	"SDL_SCANCODE_RCTRL"
.LASF466:
	.string	"SDL_SCANCODE_AUDIONEXT"
.LASF146:
	.string	"MinecraftRegular_Bmg3_glyph_88_data"
.LASF380:
	.string	"SDL_SCANCODE_KP_EQUALSAS400"
.LASF90:
	.string	"MinecraftRegular_Bmg3_glyph_60_data"
.LASF467:
	.string	"SDL_SCANCODE_AUDIOPREV"
.LASF515:
	.string	"Command"
.LASF58:
	.string	"MinecraftRegular_Bmg3_glyph_44_data"
.LASF224:
	.string	"MinecraftRegular_Bmg3_glyph_U00E4_data"
.LASF549:
	.string	"display_string"
.LASF325:
	.string	"SDL_SCANCODE_DELETE"
.LASF296:
	.string	"SDL_SCANCODE_LEFTBRACKET"
.LASF435:
	.string	"SDL_SCANCODE_KP_DBLAMPERSAND"
.LASF36:
	.string	"MinecraftRegular_Bmg3_glyph_33_data"
.LASF456:
	.string	"SDL_SCANCODE_KP_HEXADECIMAL"
.LASF495:
	.string	"SDL_SCANCODE_SOFTLEFT"
.LASF371:
	.string	"SDL_SCANCODE_UNDO"
.LASF210:
	.string	"MinecraftRegular_Bmg3_glyph_120_data"
.LASF489:
	.string	"SDL_SCANCODE_EJECT"
.LASF571:
	.string	"calloc"
.LASF132:
	.string	"MinecraftRegular_Bmg3_glyph_81_data"
.LASF552:
	.string	"display_glyph"
.LASF349:
	.string	"SDL_SCANCODE_NONUSBACKSLASH"
.LASF17:
	.string	"long double"
.LASF166:
	.string	"MinecraftRegular_Bmg3_glyph_98_data"
.LASF413:
	.string	"SDL_SCANCODE_THOUSANDSSEPARATOR"
.LASF110:
	.string	"MinecraftRegular_Bmg3_glyph_70_data"
.LASF564:
	.string	"get_us"
.LASF331:
	.string	"SDL_SCANCODE_UP"
.LASF78:
	.string	"MinecraftRegular_Bmg3_glyph_54_data"
.LASF524:
	.string	"term"
.LASF315:
	.string	"SDL_SCANCODE_F9"
.LASF568:
	.string	"info"
.LASF56:
	.string	"MinecraftRegular_Bmg3_glyph_43_data"
.LASF240:
	.string	"MinecraftRegular_Bmg3_glyph_U00B0_data"
.LASF458:
	.string	"SDL_SCANCODE_LSHIFT"
.LASF393:
	.string	"SDL_SCANCODE_LANG4"
.LASF408:
	.string	"SDL_SCANCODE_CLEARAGAIN"
.LASF4:
	.string	"__int8_t"
.LASF422:
	.string	"SDL_SCANCODE_KP_BACKSPACE"
.LASF333:
	.string	"SDL_SCANCODE_KP_DIVIDE"
.LASF19:
	.string	"long long unsigned int"
.LASF152:
	.string	"MinecraftRegular_Bmg3_glyph_91_data"
.LASF536:
	.string	"command"
.LASF22:
	.string	"uint16_t"
.LASF171:
	.string	"MinecraftRegular_Bmg3_glyph_100"
.LASF173:
	.string	"MinecraftRegular_Bmg3_glyph_101"
.LASF175:
	.string	"MinecraftRegular_Bmg3_glyph_102"
.LASF177:
	.string	"MinecraftRegular_Bmg3_glyph_103"
.LASF176:
	.string	"MinecraftRegular_Bmg3_glyph_103_data"
.LASF181:
	.string	"MinecraftRegular_Bmg3_glyph_105"
.LASF183:
	.string	"MinecraftRegular_Bmg3_glyph_106"
.LASF185:
	.string	"MinecraftRegular_Bmg3_glyph_107"
.LASF187:
	.string	"MinecraftRegular_Bmg3_glyph_108"
.LASF189:
	.string	"MinecraftRegular_Bmg3_glyph_109"
.LASF575:
	.string	"SDL_Scancode"
.LASF372:
	.string	"SDL_SCANCODE_CUT"
.LASF98:
	.string	"MinecraftRegular_Bmg3_glyph_64_data"
.LASF510:
	.string	"Terminal"
.LASF451:
	.string	"SDL_SCANCODE_KP_CLEAR"
.LASF377:
	.string	"SDL_SCANCODE_VOLUMEUP"
.LASF76:
	.string	"MinecraftRegular_Bmg3_glyph_53_data"
.LASF445:
	.string	"SDL_SCANCODE_KP_MEMCLEAR"
.LASF537:
	.string	"terminal_handle_char"
.LASF459:
	.string	"SDL_SCANCODE_LALT"
.LASF191:
	.string	"MinecraftRegular_Bmg3_glyph_110"
.LASF193:
	.string	"MinecraftRegular_Bmg3_glyph_111"
.LASF195:
	.string	"MinecraftRegular_Bmg3_glyph_112"
.LASF197:
	.string	"MinecraftRegular_Bmg3_glyph_113"
.LASF199:
	.string	"MinecraftRegular_Bmg3_glyph_114"
.LASF201:
	.string	"MinecraftRegular_Bmg3_glyph_115"
.LASF203:
	.string	"MinecraftRegular_Bmg3_glyph_116"
.LASF205:
	.string	"MinecraftRegular_Bmg3_glyph_117"
.LASF207:
	.string	"MinecraftRegular_Bmg3_glyph_118"
.LASF209:
	.string	"MinecraftRegular_Bmg3_glyph_119"
.LASF521:
	.string	"memset"
.LASF569:
	.string	"show_buffer"
.LASF516:
	.string	"commands"
.LASF332:
	.string	"SDL_SCANCODE_NUMLOCKCLEAR"
.LASF419:
	.string	"SDL_SCANCODE_KP_LEFTBRACE"
.LASF530:
	.string	"fb_size"
.LASF449:
	.string	"SDL_SCANCODE_KP_MEMDIVIDE"
.LASF574:
	.string	"GNU C17 14.2.0 -mtune=rocket -mabi=lp64d -misa-spec=20191213 -march=rv64imafdc_zicsr -g -O2"
.LASF196:
	.string	"MinecraftRegular_Bmg3_glyph_113_data"
.LASF367:
	.string	"SDL_SCANCODE_MENU"
.LASF374:
	.string	"SDL_SCANCODE_PASTE"
.LASF463:
	.string	"SDL_SCANCODE_RALT"
.LASF118:
	.string	"MinecraftRegular_Bmg3_glyph_74_data"
.LASF474:
	.string	"SDL_SCANCODE_CALCULATOR"
.LASF513:
	.string	"handler"
.LASF174:
	.string	"MinecraftRegular_Bmg3_glyph_102_data"
.LASF523:
	.string	"exit"
.LASF211:
	.string	"MinecraftRegular_Bmg3_glyph_120"
.LASF213:
	.string	"MinecraftRegular_Bmg3_glyph_121"
.LASF215:
	.string	"MinecraftRegular_Bmg3_glyph_122"
.LASF14:
	.string	"__uintptr_t"
.LASF219:
	.string	"MinecraftRegular_Bmg3_glyph_124"
.LASF221:
	.string	"MinecraftRegular_Bmg3_glyph_125"
.LASF223:
	.string	"MinecraftRegular_Bmg3_glyph_126"
.LASF248:
	.string	"MinecraftRegular_Bmg3_glyph_U00AC_data"
.LASF96:
	.string	"MinecraftRegular_Bmg3_glyph_63_data"
.LASF478:
	.string	"SDL_SCANCODE_AC_BACK"
.LASF64:
	.string	"MinecraftRegular_Bmg3_glyph_47_data"
.LASF336:
	.string	"SDL_SCANCODE_KP_PLUS"
.LASF465:
	.string	"SDL_SCANCODE_MODE"
.LASF42:
	.string	"MinecraftRegular_Bmg3_glyph_36_data"
.LASF29:
	.string	"y_offset"
.LASF370:
	.string	"SDL_SCANCODE_AGAIN"
.LASF512:
	.string	"name"
.LASF216:
	.string	"MinecraftRegular_Bmg3_glyph_123_data"
.LASF488:
	.string	"SDL_SCANCODE_KBDILLUMUP"
.LASF554:
	.string	"byte"
.LASF472:
	.string	"SDL_SCANCODE_WWW"
.LASF138:
	.string	"MinecraftRegular_Bmg3_glyph_84_data"
.LASF7:
	.string	"short int"
.LASF24:
	.string	"uint64_t"
.LASF116:
	.string	"MinecraftRegular_Bmg3_glyph_73_data"
.LASF526:
	.string	"resolution"
.LASF84:
	.string	"MinecraftRegular_Bmg3_glyph_57_data"
.LASF208:
	.string	"MinecraftRegular_Bmg3_glyph_119_data"
.LASF239:
	.string	"MinecraftRegular_Bmg3_glyph_U00A7"
.LASF62:
	.string	"MinecraftRegular_Bmg3_glyph_46_data"
.LASF418:
	.string	"SDL_SCANCODE_KP_RIGHTPAREN"
.LASF244:
	.string	"MinecraftRegular_Bmg3_glyph_U00B3_data"
.LASF468:
	.string	"SDL_SCANCODE_AUDIOSTOP"
.LASF361:
	.string	"SDL_SCANCODE_F21"
.LASF443:
	.string	"SDL_SCANCODE_KP_MEMSTORE"
.LASF347:
	.string	"SDL_SCANCODE_KP_0"
.LASF338:
	.string	"SDL_SCANCODE_KP_1"
.LASF339:
	.string	"SDL_SCANCODE_KP_2"
.LASF340:
	.string	"SDL_SCANCODE_KP_3"
.LASF341:
	.string	"SDL_SCANCODE_KP_4"
.LASF342:
	.string	"SDL_SCANCODE_KP_5"
.LASF343:
	.string	"SDL_SCANCODE_KP_6"
.LASF344:
	.string	"SDL_SCANCODE_KP_7"
.LASF345:
	.string	"SDL_SCANCODE_KP_8"
.LASF346:
	.string	"SDL_SCANCODE_KP_9"
.LASF158:
	.string	"MinecraftRegular_Bmg3_glyph_94_data"
.LASF423:
	.string	"SDL_SCANCODE_KP_A"
.LASF424:
	.string	"SDL_SCANCODE_KP_B"
.LASF425:
	.string	"SDL_SCANCODE_KP_C"
.LASF426:
	.string	"SDL_SCANCODE_KP_D"
.LASF421:
	.string	"SDL_SCANCODE_KP_TAB"
.LASF428:
	.string	"SDL_SCANCODE_KP_F"
.LASF241:
	.string	"MinecraftRegular_Bmg3_glyph_U00B0"
.LASF55:
	.string	"MinecraftRegular_Bmg3_glyph_42"
.LASF243:
	.string	"MinecraftRegular_Bmg3_glyph_U00B2"
.LASF245:
	.string	"MinecraftRegular_Bmg3_glyph_U00B3"
.LASF247:
	.string	"MinecraftRegular_Bmg3_glyph_U00B5"
.LASF182:
	.string	"MinecraftRegular_Bmg3_glyph_106_data"
.LASF326:
	.string	"SDL_SCANCODE_END"
.LASF487:
	.string	"SDL_SCANCODE_KBDILLUMDOWN"
.LASF479:
	.string	"SDL_SCANCODE_AC_FORWARD"
.LASF104:
	.string	"MinecraftRegular_Bmg3_glyph_67_data"
.LASF402:
	.string	"SDL_SCANCODE_CLEAR"
.LASF82:
	.string	"MinecraftRegular_Bmg3_glyph_56_data"
.LASF417:
	.string	"SDL_SCANCODE_KP_LEFTPAREN"
.LASF416:
	.string	"SDL_SCANCODE_CURRENCYSUBUNIT"
.LASF290:
	.string	"SDL_SCANCODE_ESCAPE"
.LASF23:
	.string	"uint32_t"
.LASF227:
	.string	"MinecraftRegular_Bmg3_glyph_U00C4"
.LASF242:
	.string	"MinecraftRegular_Bmg3_glyph_U00B2_data"
.LASF441:
	.string	"SDL_SCANCODE_KP_AT"
.LASF429:
	.string	"SDL_SCANCODE_KP_XOR"
.LASF493:
	.string	"SDL_SCANCODE_AUDIOREWIND"
.LASF475:
	.string	"SDL_SCANCODE_COMPUTER"
.LASF368:
	.string	"SDL_SCANCODE_SELECT"
.LASF522:
	.string	"malloc"
.LASF202:
	.string	"MinecraftRegular_Bmg3_glyph_116_data"
.LASF249:
	.string	"MinecraftRegular_Bmg3_glyph_U00AC"
.LASF9:
	.string	"short unsigned int"
.LASF319:
	.string	"SDL_SCANCODE_PRINTSCREEN"
.LASF390:
	.string	"SDL_SCANCODE_LANG1"
.LASF391:
	.string	"SDL_SCANCODE_LANG2"
.LASF392:
	.string	"SDL_SCANCODE_LANG3"
.LASF124:
	.string	"MinecraftRegular_Bmg3_glyph_77_data"
.LASF394:
	.string	"SDL_SCANCODE_LANG5"
.LASF395:
	.string	"SDL_SCANCODE_LANG6"
.LASF396:
	.string	"SDL_SCANCODE_LANG7"
.LASF397:
	.string	"SDL_SCANCODE_LANG8"
.LASF398:
	.string	"SDL_SCANCODE_LANG9"
.LASF180:
	.string	"MinecraftRegular_Bmg3_glyph_105_data"
.LASF231:
	.string	"MinecraftRegular_Bmg3_glyph_U00D6"
.LASF354:
	.string	"SDL_SCANCODE_F14"
.LASF356:
	.string	"SDL_SCANCODE_F16"
.LASF550:
	.string	"display_char"
.LASF235:
	.string	"MinecraftRegular_Bmg3_glyph_U00DC"
.LASF102:
	.string	"MinecraftRegular_Bmg3_glyph_66_data"
.LASF253:
	.string	"SDL_SCANCODE_A"
.LASF254:
	.string	"SDL_SCANCODE_B"
.LASF255:
	.string	"SDL_SCANCODE_C"
.LASF289:
	.string	"SDL_SCANCODE_RETURN"
.LASF256:
	.string	"SDL_SCANCODE_D"
.LASF257:
	.string	"SDL_SCANCODE_E"
.LASF258:
	.string	"SDL_SCANCODE_F"
.LASF301:
	.string	"SDL_SCANCODE_APOSTROPHE"
.LASF267:
	.string	"SDL_SCANCODE_O"
.LASF48:
	.string	"MinecraftRegular_Bmg3_glyph_39_data"
.LASF225:
	.string	"MinecraftRegular_Bmg3_glyph_U00E4"
.LASF304:
	.string	"SDL_SCANCODE_PERIOD"
.LASF222:
	.string	"MinecraftRegular_Bmg3_glyph_126_data"
.LASF31:
	.string	"data"
.LASF430:
	.string	"SDL_SCANCODE_KP_POWER"
.LASF144:
	.string	"MinecraftRegular_Bmg3_glyph_87_data"
.LASF206:
	.string	"MinecraftRegular_Bmg3_glyph_118_data"
.LASF544:
	.string	"terminal_update_cursor"
.LASF546:
	.string	"cursor"
.LASF499:
	.string	"SDL_NUM_SCANCODES"
.LASF505:
	.string	"line_index"
.LASF122:
	.string	"MinecraftRegular_Bmg3_glyph_76_data"
.LASF27:
	.string	"height"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release"
.LASF0:
	.string	"/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/main.c"
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
