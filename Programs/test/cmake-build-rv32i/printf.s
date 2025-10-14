	.file	"printf.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	_out_buffer, @function
_out_buffer:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	sb	a5,-17(s0)
	ld	a4,-40(s0)
	ld	a5,-48(s0)
	bgeu	a4,a5,.L3
	ld	a4,-32(s0)
	ld	a5,-40(s0)
	add	a5,a4,a5
	lbu	a4,-17(s0)
	sb	a4,0(a5)
.L3:
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_out_buffer, .-_out_buffer
	.align	1
	.type	_out_null, @function
_out_null:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	sb	a5,-17(s0)
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_out_null, .-_out_null
	.align	1
	.type	_out_char, @function
_out_char:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L7
	lbu	a5,-17(s0)
	mv	a0,a5
	call	_putchar
.L7:
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_out_char, .-_out_char
	.align	1
	.type	_out_fct, @function
_out_fct:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L10
	ld	a5,-32(s0)
	ld	a5,0(a5)
	ld	a4,-32(s0)
	ld	a3,8(a4)
	lbu	a4,-17(s0)
	mv	a1,a3
	mv	a0,a4
	jalr	a5
.L10:
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_out_fct, .-_out_fct
	.align	1
	.type	_strnlen_s, @function
_strnlen_s:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	j	.L12
.L14:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L12:
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	beq	a5,zero,.L13
	ld	a5,-48(s0)
	addi	a4,a5,-1
	sd	a4,-48(s0)
	bne	a5,zero,.L14
.L13:
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_strnlen_s, .-_strnlen_s
	.align	1
	.type	_is_digit, @function
_is_digit:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,47
	bleu	a4,a5,.L17
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,57
	bgtu	a4,a5,.L17
	li	a5,1
	j	.L18
.L17:
	li	a5,0
.L18:
	andi	a5,a5,1
	andi	a5,a5,0xff
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	_is_digit, .-_is_digit
	.align	1
	.type	_atoi, @function
_atoi:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sw	zero,-20(s0)
	j	.L21
.L22:
	lw	a5,-20(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sext.w	a4,a5
	ld	a5,-40(s0)
	ld	a5,0(a5)
	addi	a2,a5,1
	ld	a3,-40(s0)
	sd	a2,0(a3)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-48
	sw	a5,-20(s0)
.L21:
	ld	a5,-40(s0)
	ld	a5,0(a5)
	lbu	a5,0(a5)
	mv	a0,a5
	call	_is_digit
	mv	a5,a0
	bne	a5,zero,.L22
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	_atoi, .-_atoi
	.align	1
	.type	_out_rev, @function
_out_rev:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	s0,sp,96
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	sd	a4,-72(s0)
	sd	a5,-80(s0)
	mv	a5,a6
	mv	a4,a7
	sw	a5,-84(s0)
	mv	a5,a4
	sw	a5,-88(s0)
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	lw	a5,-88(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L28
	lw	a5,-88(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	bne	a5,zero,.L28
	ld	a5,-80(s0)
	sd	a5,-24(s0)
	j	.L26
.L27:
	ld	a5,-56(s0)
	addi	a4,a5,1
	sd	a4,-56(s0)
	ld	a4,-40(s0)
	ld	a3,-64(s0)
	mv	a2,a5
	ld	a1,-48(s0)
	li	a0,32
	jalr	a4
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L26:
	lwu	a5,-84(s0)
	ld	a4,-24(s0)
	bltu	a4,a5,.L27
	j	.L28
.L29:
	ld	a5,-80(s0)
	addi	a5,a5,-1
	sd	a5,-80(s0)
	ld	a4,-72(s0)
	ld	a5,-80(s0)
	add	a5,a4,a5
	lbu	a0,0(a5)
	ld	a5,-56(s0)
	addi	a4,a5,1
	sd	a4,-56(s0)
	ld	a4,-40(s0)
	ld	a3,-64(s0)
	mv	a2,a5
	ld	a1,-48(s0)
	jalr	a4
.L28:
	ld	a5,-80(s0)
	bne	a5,zero,.L29
	lw	a5,-88(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	beq	a5,zero,.L30
	j	.L31
.L32:
	ld	a5,-56(s0)
	addi	a4,a5,1
	sd	a4,-56(s0)
	ld	a4,-40(s0)
	ld	a3,-64(s0)
	mv	a2,a5
	ld	a1,-48(s0)
	li	a0,32
	jalr	a4
.L31:
	ld	a4,-56(s0)
	ld	a5,-32(s0)
	sub	a4,a4,a5
	lwu	a5,-84(s0)
	bltu	a4,a5,.L32
.L30:
	ld	a5,-56(s0)
	mv	a0,a5
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	_out_rev, .-_out_rev
	.align	1
	.type	_ntoa_format, @function
_ntoa_format:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	sd	a4,-56(s0)
	sd	a5,-64(s0)
	mv	a5,a6
	mv	a4,a7
	sb	a5,-65(s0)
	mv	a5,a4
	sw	a5,-72(s0)
	lw	a5,16(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L35
	lw	a5,8(s0)
	sext.w	a5,a5
	beq	a5,zero,.L38
	lw	a5,16(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L38
	lbu	a5,-65(s0)
	andi	a5,a5,0xff
	bne	a5,zero,.L37
	lw	a5,16(s0)
	andi	a5,a5,12
	sext.w	a5,a5
	beq	a5,zero,.L38
.L37:
	lw	a5,8(s0)
	addiw	a5,a5,-1
	sw	a5,8(s0)
	j	.L38
.L40:
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,48
	sb	a4,0(a5)
.L38:
	lwu	a5,0(s0)
	ld	a4,-64(s0)
	bgeu	a4,a5,.L41
	ld	a4,-64(s0)
	li	a5,31
	bleu	a4,a5,.L40
	j	.L41
.L42:
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,48
	sb	a4,0(a5)
.L41:
	lw	a5,16(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L35
	lwu	a5,8(s0)
	ld	a4,-64(s0)
	bgeu	a4,a5,.L35
	ld	a4,-64(s0)
	li	a5,31
	bleu	a4,a5,.L42
.L35:
	lw	a5,16(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	beq	a5,zero,.L43
	lw	a5,16(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	bne	a5,zero,.L44
	ld	a5,-64(s0)
	beq	a5,zero,.L44
	lwu	a5,0(s0)
	ld	a4,-64(s0)
	beq	a4,a5,.L45
	lwu	a5,8(s0)
	ld	a4,-64(s0)
	bne	a4,a5,.L44
.L45:
	ld	a5,-64(s0)
	addi	a5,a5,-1
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	beq	a5,zero,.L44
	lw	a5,-72(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L44
	ld	a5,-64(s0)
	addi	a5,a5,-1
	sd	a5,-64(s0)
.L44:
	lw	a5,-72(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L46
	lw	a5,16(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	bne	a5,zero,.L46
	ld	a4,-64(s0)
	li	a5,31
	bgtu	a4,a5,.L46
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,120
	sb	a4,0(a5)
	j	.L47
.L46:
	lw	a5,-72(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L48
	lw	a5,16(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	beq	a5,zero,.L48
	ld	a4,-64(s0)
	li	a5,31
	bgtu	a4,a5,.L48
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,88
	sb	a4,0(a5)
	j	.L47
.L48:
	lw	a5,-72(s0)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L47
	ld	a4,-64(s0)
	li	a5,31
	bgtu	a4,a5,.L47
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,98
	sb	a4,0(a5)
.L47:
	ld	a4,-64(s0)
	li	a5,31
	bgtu	a4,a5,.L43
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,48
	sb	a4,0(a5)
.L43:
	ld	a4,-64(s0)
	li	a5,31
	bgtu	a4,a5,.L49
	lbu	a5,-65(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L50
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,45
	sb	a4,0(a5)
	j	.L49
.L50:
	lw	a5,16(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	beq	a5,zero,.L51
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,43
	sb	a4,0(a5)
	j	.L49
.L51:
	lw	a5,16(s0)
	andi	a5,a5,8
	sext.w	a5,a5
	beq	a5,zero,.L49
	ld	a5,-64(s0)
	addi	a4,a5,1
	sd	a4,-64(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	li	a4,32
	sb	a4,0(a5)
.L49:
	lw	a4,16(s0)
	lw	a5,8(s0)
	mv	a7,a4
	mv	a6,a5
	ld	a5,-64(s0)
	ld	a4,-56(s0)
	ld	a3,-48(s0)
	ld	a2,-40(s0)
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	_out_rev
	mv	a5,a0
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	_ntoa_format, .-_ntoa_format
	.align	1
	.type	_ntoa_long, @function
_ntoa_long:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sd	a3,-96(s0)
	sd	a4,-104(s0)
	sd	a6,-120(s0)
	mv	a4,a7
	sb	a5,-105(s0)
	mv	a5,a4
	sw	a5,-112(s0)
	sd	zero,-24(s0)
	ld	a5,-104(s0)
	bne	a5,zero,.L54
	lw	a5,8(s0)
	andi	a5,a5,-17
	sw	a5,8(s0)
.L54:
	lw	a5,8(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L61
	ld	a5,-104(s0)
	beq	a5,zero,.L56
.L61:
	ld	a4,-104(s0)
	ld	a5,-120(s0)
	remu	a5,a4,a5
	sb	a5,-25(s0)
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,9
	bgtu	a4,a5,.L57
	lbu	a5,-25(s0)
	addiw	a5,a5,48
	andi	a5,a5,0xff
	j	.L58
.L57:
	lw	a5,8(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	beq	a5,zero,.L59
	li	a5,65
	j	.L60
.L59:
	li	a5,97
.L60:
	lbu	a4,-25(s0)
	addw	a5,a5,a4
	andi	a5,a5,0xff
	addiw	a5,a5,-10
	andi	a5,a5,0xff
.L58:
	ld	a4,-24(s0)
	addi	a3,a4,1
	sd	a3,-24(s0)
	addi	a4,a4,-16
	add	a4,a4,s0
	sb	a5,-48(a4)
	ld	a4,-104(s0)
	ld	a5,-120(s0)
	divu	a5,a4,a5
	sd	a5,-104(s0)
	ld	a5,-104(s0)
	beq	a5,zero,.L56
	ld	a4,-24(s0)
	li	a5,31
	bleu	a4,a5,.L61
.L56:
	ld	a5,-120(s0)
	sext.w	a2,a5
	lbu	a3,-105(s0)
	addi	a4,s0,-64
	lw	a5,8(s0)
	sd	a5,16(sp)
	lw	a5,0(s0)
	sd	a5,8(sp)
	lw	a5,-112(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	ld	a5,-24(s0)
	ld	a3,-96(s0)
	ld	a2,-88(s0)
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	_ntoa_format
	mv	a5,a0
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	_ntoa_long, .-_ntoa_long
	.align	1
	.type	_ntoa_long_long, @function
_ntoa_long_long:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sd	a3,-96(s0)
	sd	a4,-104(s0)
	sd	a6,-120(s0)
	mv	a4,a7
	sb	a5,-105(s0)
	mv	a5,a4
	sw	a5,-112(s0)
	sd	zero,-24(s0)
	ld	a5,-104(s0)
	bne	a5,zero,.L64
	lw	a5,8(s0)
	andi	a5,a5,-17
	sw	a5,8(s0)
.L64:
	lw	a5,8(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L71
	ld	a5,-104(s0)
	beq	a5,zero,.L66
.L71:
	ld	a4,-104(s0)
	ld	a5,-120(s0)
	remu	a5,a4,a5
	sb	a5,-25(s0)
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,9
	bgtu	a4,a5,.L67
	lbu	a5,-25(s0)
	addiw	a5,a5,48
	andi	a5,a5,0xff
	j	.L68
.L67:
	lw	a5,8(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	beq	a5,zero,.L69
	li	a5,65
	j	.L70
.L69:
	li	a5,97
.L70:
	lbu	a4,-25(s0)
	addw	a5,a5,a4
	andi	a5,a5,0xff
	addiw	a5,a5,-10
	andi	a5,a5,0xff
.L68:
	ld	a4,-24(s0)
	addi	a3,a4,1
	sd	a3,-24(s0)
	addi	a4,a4,-16
	add	a4,a4,s0
	sb	a5,-48(a4)
	ld	a4,-104(s0)
	ld	a5,-120(s0)
	divu	a5,a4,a5
	sd	a5,-104(s0)
	ld	a5,-104(s0)
	beq	a5,zero,.L66
	ld	a4,-24(s0)
	li	a5,31
	bleu	a4,a5,.L71
.L66:
	ld	a5,-120(s0)
	sext.w	a2,a5
	lbu	a3,-105(s0)
	addi	a4,s0,-64
	lw	a5,8(s0)
	sd	a5,16(sp)
	lw	a5,0(s0)
	sd	a5,8(sp)
	lw	a5,-112(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	ld	a5,-24(s0)
	ld	a3,-96(s0)
	ld	a2,-88(s0)
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	_ntoa_format
	mv	a5,a0
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	_ntoa_long_long, .-_ntoa_long_long
	.section	.rodata
	.align	3
.LC0:
	.string	"nan"
	.align	3
.LC2:
	.string	"fni-"
	.align	3
.LC4:
	.string	"fni+"
	.align	3
.LC5:
	.string	"fni"
	.text
	.align	1
	.type	_ftoa, @function
_ftoa:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	sd	a0,-104(s0)
	sd	a1,-112(s0)
	sd	a2,-120(s0)
	sd	a3,-128(s0)
	fsd	fa0,-136(s0)
	mv	a2,a4
	mv	a3,a5
	mv	a4,a6
	mv	a5,a2
	sw	a5,-140(s0)
	mv	a5,a3
	sw	a5,-144(s0)
	mv	a5,a4
	sw	a5,-148(s0)
	sd	zero,-24(s0)
	sd	zero,-56(s0)
	fld	fa4,-136(s0)
	fld	fa5,-136(s0)
	feq.d	a5,fa4,fa5
	bne	a5,zero,.L74
	lw	a4,-148(s0)
	lw	a5,-144(s0)
	mv	a7,a4
	mv	a6,a5
	li	a5,3
	lui	a4,%hi(.LC0)
	addi	a4,a4,%lo(.LC0)
	ld	a3,-128(s0)
	ld	a2,-120(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_out_rev
	mv	a5,a0
	j	.L119
.L74:
	fld	fa4,-136(s0)
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L120
	j	.L125
.L120:
	lw	a4,-148(s0)
	lw	a5,-144(s0)
	mv	a7,a4
	mv	a6,a5
	li	a5,4
	lui	a4,%hi(.LC2)
	addi	a4,a4,%lo(.LC2)
	ld	a3,-128(s0)
	ld	a2,-120(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_out_rev
	mv	a5,a0
	j	.L119
.L125:
	fld	fa4,-136(s0)
	lui	a5,%hi(.LC3)
	fld	fa5,%lo(.LC3)(a5)
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L121
	j	.L126
.L121:
	lw	a5,-148(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	beq	a5,zero,.L80
	lui	a5,%hi(.LC4)
	addi	a4,a5,%lo(.LC4)
	j	.L81
.L80:
	lui	a5,%hi(.LC5)
	addi	a4,a5,%lo(.LC5)
.L81:
	lw	a5,-148(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	beq	a5,zero,.L82
	li	a5,4
	j	.L83
.L82:
	li	a5,3
.L83:
	lw	a2,-148(s0)
	lw	a3,-144(s0)
	mv	a7,a2
	mv	a6,a3
	ld	a3,-128(s0)
	ld	a2,-120(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_out_rev
	mv	a5,a0
	j	.L119
.L126:
	fld	fa4,-136(s0)
	lui	a5,%hi(.LC6)
	fld	fa5,%lo(.LC6)(a5)
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L84
	fld	fa4,-136(s0)
	lui	a5,%hi(.LC7)
	fld	fa5,%lo(.LC7)(a5)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L84
	j	.L127
.L84:
	lw	a3,-148(s0)
	lw	a5,-144(s0)
	lw	a4,-140(s0)
	mv	a6,a3
	fld	fa0,-136(s0)
	ld	a3,-128(s0)
	ld	a2,-120(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_etoa
	mv	a5,a0
	j	.L119
.L127:
	sb	zero,-25(s0)
	fld	fa5,-136(s0)
	fmv.d.x	fa4,zero
	flt.d	a5,fa5,fa4
	bne	a5,zero,.L122
	j	.L87
.L122:
	li	a5,1
	sb	a5,-25(s0)
	fmv.d.x	fa4,zero
	fld	fa5,-136(s0)
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-136(s0)
.L87:
	lw	a5,-148(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	bne	a5,zero,.L90
	li	a5,6
	sw	a5,-140(s0)
	j	.L90
.L92:
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-80(a5)
	lw	a5,-140(s0)
	addiw	a5,a5,-1
	sw	a5,-140(s0)
.L90:
	ld	a4,-24(s0)
	li	a5,31
	bgtu	a4,a5,.L91
	lw	a5,-140(s0)
	sext.w	a4,a5
	li	a5,9
	bgtu	a4,a5,.L92
.L91:
	fld	fa5,-136(s0)
	fcvt.w.d a5,fa5,rtz
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	fcvt.d.w	fa5,a5
	fld	fa4,-136(s0)
	fsub.d	fa4,fa4,fa5
	lui	a5,%hi(pow10.0)
	addi	a4,a5,%lo(pow10.0)
	lwu	a5,-140(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmul.d	fa5,fa4,fa5
	fsd	fa5,-64(s0)
	fld	fa5,-64(s0)
	fcvt.lu.d a5,fa5,rtz
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	fcvt.d.lu	fa5,a5
	fld	fa4,-64(s0)
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	fld	fa4,-56(s0)
	lui	a5,%hi(.LC8)
	fld	fa5,%lo(.LC8)(a5)
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L123
	j	.L128
.L123:
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	fcvt.d.lu	fa4,a5
	lui	a5,%hi(pow10.0)
	addi	a4,a5,%lo(pow10.0)
	lwu	a5,-140(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fge.d	a5,fa4,fa5
	bne	a5,zero,.L124
	j	.L95
.L124:
	sd	zero,-40(s0)
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
	j	.L95
.L128:
	fld	fa4,-56(s0)
	lui	a5,%hi(.LC8)
	fld	fa5,%lo(.LC8)(a5)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L95
	ld	a5,-40(s0)
	beq	a5,zero,.L97
	ld	a5,-40(s0)
	andi	a5,a5,1
	beq	a5,zero,.L95
.L97:
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
.L95:
	lw	a5,-140(s0)
	sext.w	a5,a5
	bne	a5,zero,.L98
	lw	a5,-32(s0)
	fcvt.d.w	fa5,a5
	fld	fa4,-136(s0)
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	fld	fa4,-56(s0)
	lui	a5,%hi(.LC8)
	fld	fa5,%lo(.LC8)(a5)
	flt.d	a5,fa4,fa5
	andi	a5,a5,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	bne	a5,zero,.L99
	fld	fa4,-56(s0)
	lui	a5,%hi(.LC8)
	fld	fa5,%lo(.LC8)(a5)
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L99
	j	.L100
.L99:
	lw	a5,-32(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L108
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
	j	.L108
.L98:
	lw	a5,-140(s0)
	sw	a5,-44(s0)
	j	.L102
.L104:
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sw	a5,-44(s0)
	ld	a3,-40(s0)
	lui	a5,%hi(.LC9)
	ld	a5,%lo(.LC9)(a5)
	mulhu	a5,a3,a5
	srli	a4,a5,3
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sub	a4,a3,a5
	andi	a4,a4,0xff
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	addiw	a4,a4,48
	andi	a4,a4,0xff
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-80(a5)
	ld	a4,-40(s0)
	lui	a5,%hi(.LC9)
	ld	a5,%lo(.LC9)(a5)
	mulhu	a5,a4,a5
	srli	a5,a5,3
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	beq	a5,zero,.L129
.L102:
	ld	a4,-24(s0)
	li	a5,31
	bleu	a4,a5,.L104
	j	.L105
.L129:
	nop
	j	.L105
.L107:
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-80(a5)
.L105:
	ld	a4,-24(s0)
	li	a5,31
	bgtu	a4,a5,.L106
	lw	a5,-44(s0)
	addiw	a4,a5,-1
	sw	a4,-44(s0)
	bne	a5,zero,.L107
.L106:
	ld	a4,-24(s0)
	li	a5,31
	bgtu	a4,a5,.L108
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,46
	sb	a4,-80(a5)
.L100:
	j	.L108
.L110:
	lw	a5,-32(s0)
	mv	a4,a5
	sext.w	a3,a4
	li	a5,1717985280
	addi	a5,a5,1639
	mul	a5,a3,a5
	srli	a5,a5,32
	sraiw	a5,a5,2
	mv	a3,a5
	sraiw	a5,a4,31
	subw	a5,a3,a5
	mv	a3,a5
	mv	a5,a3
	slliw	a5,a5,2
	addw	a5,a5,a3
	slliw	a5,a5,1
	subw	a5,a4,a5
	sext.w	a5,a5
	andi	a4,a5,0xff
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	addiw	a4,a4,48
	andi	a4,a4,0xff
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-80(a5)
	lw	a5,-32(s0)
	mv	a3,a5
	sext.w	a4,a3
	li	a5,1717985280
	addi	a5,a5,1639
	mul	a5,a4,a5
	srli	a5,a5,32
	sraiw	a5,a5,2
	mv	a4,a5
	sraiw	a5,a3,31
	subw	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	sext.w	a5,a5
	beq	a5,zero,.L130
.L108:
	ld	a4,-24(s0)
	li	a5,31
	bleu	a4,a5,.L110
	j	.L109
.L130:
	nop
.L109:
	lw	a5,-148(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L111
	lw	a5,-148(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L111
	lw	a5,-144(s0)
	sext.w	a5,a5
	beq	a5,zero,.L114
	lbu	a5,-25(s0)
	andi	a5,a5,0xff
	bne	a5,zero,.L113
	lw	a5,-148(s0)
	andi	a5,a5,12
	sext.w	a5,a5
	beq	a5,zero,.L114
.L113:
	lw	a5,-144(s0)
	addiw	a5,a5,-1
	sw	a5,-144(s0)
	j	.L114
.L115:
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-80(a5)
.L114:
	lwu	a5,-144(s0)
	ld	a4,-24(s0)
	bgeu	a4,a5,.L111
	ld	a4,-24(s0)
	li	a5,31
	bleu	a4,a5,.L115
.L111:
	ld	a4,-24(s0)
	li	a5,31
	bgtu	a4,a5,.L116
	lbu	a5,-25(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L117
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,45
	sb	a4,-80(a5)
	j	.L116
.L117:
	lw	a5,-148(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	beq	a5,zero,.L118
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,43
	sb	a4,-80(a5)
	j	.L116
.L118:
	lw	a5,-148(s0)
	andi	a5,a5,8
	sext.w	a5,a5
	beq	a5,zero,.L116
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,32
	sb	a4,-80(a5)
.L116:
	lw	a3,-148(s0)
	lw	a5,-144(s0)
	addi	a4,s0,-96
	mv	a7,a3
	mv	a6,a5
	ld	a5,-24(s0)
	ld	a3,-128(s0)
	ld	a2,-120(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_out_rev
	mv	a5,a0
.L119:
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	_ftoa, .-_ftoa
	.align	1
	.type	_etoa, @function
_etoa:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	sd	a0,-88(s0)
	sd	a1,-96(s0)
	sd	a2,-104(s0)
	sd	a3,-112(s0)
	fsd	fa0,-120(s0)
	mv	a2,a4
	mv	a3,a5
	mv	a4,a6
	mv	a5,a2
	sw	a5,-124(s0)
	mv	a5,a3
	sw	a5,-128(s0)
	mv	a5,a4
	sw	a5,-132(s0)
	fld	fa4,-120(s0)
	fld	fa5,-120(s0)
	feq.d	a5,fa4,fa5
	beq	a5,zero,.L136
	fld	fa4,-120(s0)
	lui	a5,%hi(.LC3)
	fld	fa5,%lo(.LC3)(a5)
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L136
	fld	fa4,-120(s0)
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L136
	j	.L167
.L136:
	lw	a3,-132(s0)
	lw	a5,-128(s0)
	lw	a4,-124(s0)
	mv	a6,a3
	fld	fa0,-120(s0)
	ld	a3,-112(s0)
	ld	a2,-104(s0)
	ld	a1,-96(s0)
	ld	a0,-88(s0)
	call	_ftoa
	mv	a5,a0
	j	.L163
.L167:
	fld	fa5,-120(s0)
	fmv.d.x	fa4,zero
	flt.d	a5,fa5,fa4
	sb	a5,-29(s0)
	lbu	a5,-29(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L140
	fld	fa5,-120(s0)
	fneg.d	fa5,fa5
	fsd	fa5,-120(s0)
.L140:
	lw	a5,-132(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	bne	a5,zero,.L141
	li	a5,6
	sw	a5,-124(s0)
.L141:
	fld	fa5,-120(s0)
	fsd	fa5,-72(s0)
	ld	a5,-72(s0)
	srli	a5,a5,52
	sext.w	a5,a5
	andi	a5,a5,2047
	sext.w	a5,a5
	addiw	a5,a5,-1023
	sw	a5,-36(s0)
	ld	a4,-72(s0)
	li	a5,-1
	srli	a5,a5,12
	and	a4,a4,a5
	li	a5,1023
	slli	a5,a5,52
	or	a5,a4,a5
	sd	a5,-72(s0)
	lw	a5,-36(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC10)
	fld	fa5,%lo(.LC10)(a5)
	fmul.d	fa4,fa4,fa5
	lui	a5,%hi(.LC11)
	fld	fa5,%lo(.LC11)(a5)
	fadd.d	fa4,fa4,fa5
	fld	fa3,-72(s0)
	lui	a5,%hi(.LC12)
	fld	fa5,%lo(.LC12)(a5)
	fsub.d	fa3,fa3,fa5
	lui	a5,%hi(.LC13)
	fld	fa5,%lo(.LC13)(a5)
	fmul.d	fa5,fa3,fa5
	fadd.d	fa5,fa4,fa5
	fcvt.w.d a5,fa5,rtz
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC14)
	fld	fa5,%lo(.LC14)(a5)
	fmul.d	fa4,fa4,fa5
	lui	a5,%hi(.LC8)
	fld	fa5,%lo(.LC8)(a5)
	fadd.d	fa5,fa4,fa5
	fcvt.w.d a5,fa5,rtz
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC15)
	fld	fa5,%lo(.LC15)(a5)
	fmul.d	fa4,fa4,fa5
	lw	a5,-36(s0)
	fcvt.d.w	fa3,a5
	lui	a5,%hi(.LC16)
	fld	fa5,%lo(.LC16)(a5)
	fmul.d	fa5,fa3,fa5
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	fld	fa5,-48(s0)
	fmul.d	fa5,fa5,fa5
	fsd	fa5,-56(s0)
	lw	a5,-36(s0)
	addiw	a5,a5,1023
	sext.w	a5,a5
	slli	a5,a5,52
	sd	a5,-72(s0)
	fld	fa4,-72(s0)
	fld	fa5,-48(s0)
	fadd.d	fa3,fa5,fa5
	lui	a5,%hi(.LC17)
	fld	fa2,%lo(.LC17)(a5)
	fld	fa5,-48(s0)
	fsub.d	fa2,fa2,fa5
	fld	fa1,-56(s0)
	lui	a5,%hi(.LC18)
	fld	fa5,%lo(.LC18)(a5)
	fdiv.d	fa1,fa1,fa5
	lui	a5,%hi(.LC19)
	fld	fa5,%lo(.LC19)(a5)
	fadd.d	fa5,fa1,fa5
	fld	fa1,-56(s0)
	fdiv.d	fa1,fa1,fa5
	lui	a5,%hi(.LC20)
	fld	fa5,%lo(.LC20)(a5)
	fadd.d	fa5,fa1,fa5
	fld	fa1,-56(s0)
	fdiv.d	fa5,fa1,fa5
	fadd.d	fa5,fa2,fa5
	fdiv.d	fa3,fa3,fa5
	lui	a5,%hi(.LC21)
	fld	fa5,%lo(.LC21)(a5)
	fadd.d	fa5,fa3,fa5
	fmul.d	fa5,fa4,fa5
	fsd	fa5,-72(s0)
	fld	fa5,-72(s0)
	fld	fa4,-120(s0)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L164
	j	.L142
.L164:
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
	fld	fa4,-72(s0)
	lui	a5,%hi(.LC19)
	fld	fa5,%lo(.LC19)(a5)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-72(s0)
.L142:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,99
	bgt	a4,a5,.L144
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,-99
	blt	a4,a5,.L144
	li	a5,4
	j	.L145
.L144:
	li	a5,5
.L145:
	sw	a5,-24(s0)
	lw	a5,-132(s0)
	mv	a4,a5
	li	a5,4096
	addi	a5,a5,-2048
	and	a5,a4,a5
	sext.w	a5,a5
	beq	a5,zero,.L146
	fld	fa4,-120(s0)
	lui	a5,%hi(.LC22)
	fld	fa5,%lo(.LC22)(a5)
	fge.d	a5,fa4,fa5
	bne	a5,zero,.L165
	j	.L147
.L165:
	fld	fa4,-120(s0)
	lui	a5,%hi(.LC23)
	fld	fa5,%lo(.LC23)(a5)
	flt.d	a5,fa4,fa5
	bne	a5,zero,.L166
	j	.L147
.L166:
	lw	a5,-124(s0)
	lw	a4,-20(s0)
	sext.w	a4,a4
	bge	a4,a5,.L150
	lw	a5,-124(s0)
	lw	a4,-20(s0)
	subw	a5,a5,a4
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a5,a5
	sw	a5,-124(s0)
	j	.L151
.L150:
	sw	zero,-124(s0)
.L151:
	lw	a5,-132(s0)
	ori	a5,a5,1024
	sw	a5,-132(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	j	.L146
.L147:
	lw	a5,-124(s0)
	sext.w	a5,a5
	beq	a5,zero,.L146
	lw	a5,-132(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L146
	lw	a5,-124(s0)
	addiw	a5,a5,-1
	sw	a5,-124(s0)
.L146:
	lw	a5,-128(s0)
	sw	a5,-28(s0)
	lw	a5,-128(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bleu	a4,a5,.L152
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	subw	a5,a4,a5
	sw	a5,-28(s0)
	j	.L153
.L152:
	sw	zero,-28(s0)
.L153:
	lw	a5,-132(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	beq	a5,zero,.L154
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L154
	sw	zero,-28(s0)
.L154:
	lw	a5,-20(s0)
	sext.w	a5,a5
	beq	a5,zero,.L155
	fld	fa5,-72(s0)
	fld	fa4,-120(s0)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-120(s0)
.L155:
	ld	a5,-104(s0)
	sd	a5,-64(s0)
	lbu	a5,-29(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L156
	fld	fa5,-120(s0)
	fneg.d	fa5,fa5
	j	.L157
.L156:
	fld	fa5,-120(s0)
.L157:
	lw	a5,-132(s0)
	mv	a4,a5
	li	a5,-4096
	addi	a5,a5,2047
	and	a5,a4,a5
	sext.w	a3,a5
	lw	a5,-28(s0)
	lw	a4,-124(s0)
	mv	a6,a3
	fmv.d	fa0,fa5
	ld	a3,-112(s0)
	ld	a2,-104(s0)
	ld	a1,-96(s0)
	ld	a0,-88(s0)
	call	_ftoa
	sd	a0,-104(s0)
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L158
	lw	a5,-132(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	beq	a5,zero,.L159
	li	a5,69
	j	.L160
.L159:
	li	a5,101
.L160:
	ld	a4,-104(s0)
	addi	a3,a4,1
	sd	a3,-104(s0)
	ld	a6,-88(s0)
	ld	a3,-112(s0)
	mv	a2,a4
	ld	a1,-96(s0)
	mv	a0,a5
	jalr	a6
	lw	a5,-20(s0)
	sraiw	a5,a5,31
	lw	a4,-20(s0)
	xor	a4,a5,a4
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a2,a5
	lw	a5,-20(s0)
	srliw	a5,a5,31
	andi	a3,a5,0xff
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	li	a4,5
	sd	a4,8(sp)
	sd	a5,0(sp)
	li	a7,0
	li	a6,10
	mv	a5,a3
	mv	a4,a2
	ld	a3,-112(s0)
	ld	a2,-104(s0)
	ld	a1,-96(s0)
	ld	a0,-88(s0)
	call	_ntoa_long
	sd	a0,-104(s0)
	lw	a5,-132(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	beq	a5,zero,.L158
	j	.L161
.L162:
	ld	a5,-104(s0)
	addi	a4,a5,1
	sd	a4,-104(s0)
	ld	a4,-88(s0)
	ld	a3,-112(s0)
	mv	a2,a5
	ld	a1,-96(s0)
	li	a0,32
	jalr	a4
.L161:
	ld	a4,-104(s0)
	ld	a5,-64(s0)
	sub	a4,a4,a5
	lwu	a5,-128(s0)
	bltu	a4,a5,.L162
.L158:
	ld	a5,-104(s0)
.L163:
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	_etoa, .-_etoa
	.align	1
	.type	_vsnprintf, @function
_vsnprintf:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	sd	a0,-104(s0)
	sd	a1,-112(s0)
	sd	a2,-120(s0)
	sd	a3,-128(s0)
	sd	a4,-136(s0)
	sd	zero,-40(s0)
	ld	a5,-112(s0)
	bne	a5,zero,.L173
	lui	a5,%hi(_out_null)
	addi	a5,a5,%lo(_out_null)
	sd	a5,-104(s0)
	j	.L173
.L263:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L174
	ld	a5,-128(s0)
	lbu	a0,0(a5)
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	jalr	a4
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L174:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	sw	zero,-20(s0)
.L183:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a5,a5,-32
	mv	a3,a5
	sext.w	a4,a3
	li	a5,16
	bgtu	a4,a5,.L175
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lui	a5,%hi(.L177)
	addi	a5,a5,%lo(.L177)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L177:
	.word	.L181
	.word	.L175
	.word	.L175
	.word	.L180
	.word	.L175
	.word	.L175
	.word	.L175
	.word	.L175
	.word	.L175
	.word	.L175
	.word	.L175
	.word	.L179
	.word	.L175
	.word	.L178
	.word	.L175
	.word	.L175
	.word	.L176
	.text
.L176:
	lw	a5,-20(s0)
	ori	a5,a5,1
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	li	a5,1
	sw	a5,-32(s0)
	j	.L182
.L178:
	lw	a5,-20(s0)
	ori	a5,a5,2
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	li	a5,1
	sw	a5,-32(s0)
	j	.L182
.L179:
	lw	a5,-20(s0)
	ori	a5,a5,4
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	li	a5,1
	sw	a5,-32(s0)
	j	.L182
.L181:
	lw	a5,-20(s0)
	ori	a5,a5,8
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	li	a5,1
	sw	a5,-32(s0)
	j	.L182
.L180:
	lw	a5,-20(s0)
	ori	a5,a5,16
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	li	a5,1
	sw	a5,-32(s0)
	j	.L182
.L175:
	sw	zero,-32(s0)
	nop
.L182:
	lw	a5,-32(s0)
	sext.w	a5,a5
	bne	a5,zero,.L183
	sw	zero,-24(s0)
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	_is_digit
	mv	a5,a0
	beq	a5,zero,.L184
	addi	a5,s0,-128
	mv	a0,a5
	call	_atoi
	mv	a5,a0
	sw	a5,-24(s0)
	j	.L185
.L184:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L185
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	sw	a5,-64(s0)
	lw	a5,-64(s0)
	sext.w	a5,a5
	bge	a5,zero,.L186
	lw	a5,-20(s0)
	ori	a5,a5,2
	sw	a5,-20(s0)
	lw	a5,-64(s0)
	negw	a5,a5
	sext.w	a5,a5
	sw	a5,-24(s0)
	j	.L187
.L186:
	lw	a5,-64(s0)
	sw	a5,-24(s0)
.L187:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
.L185:
	sw	zero,-28(s0)
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,46
	bne	a4,a5,.L188
	lw	a5,-20(s0)
	ori	a5,a5,1024
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	_is_digit
	mv	a5,a0
	beq	a5,zero,.L189
	addi	a5,s0,-128
	mv	a0,a5
	call	_atoi
	mv	a5,a0
	sw	a5,-28(s0)
	j	.L188
.L189:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L188
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	sw	a5,-68(s0)
	lw	a5,-68(s0)
	mv	a4,a5
	sext.w	a5,a4
	bge	a5,zero,.L190
	li	a4,0
.L190:
	sext.w	a5,a4
	sw	a5,-28(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
.L188:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a5,a5,-104
	mv	a3,a5
	sext.w	a4,a3
	li	a5,18
	bgtu	a4,a5,.L267
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lui	a5,%hi(.L193)
	addi	a5,a5,%lo(.L193)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L193:
	.word	.L197
	.word	.L267
	.word	.L196
	.word	.L267
	.word	.L195
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L194
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L267
	.word	.L192
	.text
.L195:
	lw	a5,-20(s0)
	ori	a5,a5,256
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,108
	bne	a4,a5,.L268
	lw	a5,-20(s0)
	ori	a5,a5,512
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L268
.L197:
	lw	a5,-20(s0)
	ori	a5,a5,128
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,104
	bne	a4,a5,.L269
	lw	a5,-20(s0)
	ori	a5,a5,64
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L269
.L194:
	lw	a5,-20(s0)
	ori	a5,a5,256
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L199
.L196:
	lw	a5,-20(s0)
	ori	a5,a5,256
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L199
.L192:
	lw	a5,-20(s0)
	ori	a5,a5,256
	sw	a5,-20(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L199
.L267:
	nop
	j	.L199
.L268:
	nop
	j	.L199
.L269:
	nop
.L199:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	li	a4,103
	bgt	a5,a4,.L201
	li	a4,37
	bge	a5,a4,.L202
	j	.L203
.L212:
	addiw	a5,a5,-105
	sext.w	a5,a5
	mv	a4,a5
	li	a5,1
	sll	a5,a5,a4
	li	a4,36864
	addi	a4,a4,65
	and	a4,a5,a4
	snez	a4,a4
	andi	a4,a4,0xff
	bne	a4,zero,.L204
	andi	a4,a5,128
	snez	a4,a4
	andi	a4,a4,0xff
	bne	a4,zero,.L205
	andi	a5,a5,1024
	snez	a5,a5
	andi	a5,a5,0xff
	bne	a5,zero,.L206
	j	.L203
.L202:
	addiw	a5,a5,-37
	mv	a3,a5
	sext.w	a4,a3
	li	a5,66
	bgtu	a4,a5,.L203
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lui	a5,%hi(.L208)
	addi	a5,a5,%lo(.L208)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L208:
	.word	.L211
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L207
	.word	.L209
	.word	.L207
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L204
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L203
	.word	.L204
	.word	.L210
	.word	.L204
	.word	.L207
	.word	.L209
	.word	.L207
	.text
.L201:
	li	a4,120
	bgt	a5,a4,.L203
	li	a4,105
	bge	a5,a4,.L212
	j	.L203
.L204:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,120
	beq	a4,a5,.L213
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,88
	bne	a4,a5,.L214
.L213:
	li	a5,16
	sw	a5,-44(s0)
	j	.L215
.L214:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,111
	bne	a4,a5,.L216
	li	a5,8
	sw	a5,-44(s0)
	j	.L215
.L216:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,98
	bne	a4,a5,.L217
	li	a5,2
	sw	a5,-44(s0)
	j	.L215
.L217:
	li	a5,10
	sw	a5,-44(s0)
	lw	a5,-20(s0)
	andi	a5,a5,-17
	sw	a5,-20(s0)
.L215:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,88
	bne	a4,a5,.L218
	lw	a5,-20(s0)
	ori	a5,a5,32
	sw	a5,-20(s0)
.L218:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,105
	beq	a4,a5,.L219
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,100
	beq	a4,a5,.L219
	lw	a5,-20(s0)
	andi	a5,a5,-13
	sw	a5,-20(s0)
.L219:
	lw	a5,-20(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L220
	lw	a5,-20(s0)
	andi	a5,a5,-2
	sw	a5,-20(s0)
.L220:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,105
	beq	a4,a5,.L221
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,100
	bne	a4,a5,.L222
.L221:
	lw	a5,-20(s0)
	andi	a5,a5,512
	sext.w	a5,a5
	beq	a5,zero,.L223
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a5,0(a5)
	sd	a5,-96(s0)
	ld	a5,-96(s0)
	srai	a4,a5,63
	ld	a5,-96(s0)
	xor	a5,a4,a5
	sub	a5,a5,a4
	mv	a1,a5
	ld	a5,-96(s0)
	srli	a5,a5,63
	andi	a4,a5,0xff
	lwu	a3,-44(s0)
	lw	a2,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	mv	a5,a4
	mv	a4,a1
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long_long
	sd	a0,-40(s0)
	j	.L230
.L223:
	lw	a5,-20(s0)
	andi	a5,a5,256
	sext.w	a5,a5
	beq	a5,zero,.L225
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a5,0(a5)
	sd	a5,-88(s0)
	ld	a5,-88(s0)
	srai	a4,a5,63
	ld	a5,-88(s0)
	xor	a5,a4,a5
	sub	a5,a5,a4
	mv	a1,a5
	ld	a5,-88(s0)
	srli	a5,a5,63
	andi	a4,a5,0xff
	lwu	a3,-44(s0)
	lw	a2,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	mv	a5,a4
	mv	a4,a1
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long
	sd	a0,-40(s0)
	j	.L230
.L225:
	lw	a5,-20(s0)
	andi	a5,a5,64
	sext.w	a5,a5
	beq	a5,zero,.L226
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	andi	a5,a5,0xff
	sext.w	a5,a5
	j	.L227
.L226:
	lw	a5,-20(s0)
	andi	a5,a5,128
	sext.w	a5,a5
	beq	a5,zero,.L228
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	slliw	a5,a5,16
	sraiw	a5,a5,16
	j	.L227
.L228:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
.L227:
	sw	a5,-80(s0)
	lw	a5,-80(s0)
	sraiw	a5,a5,31
	lw	a4,-80(s0)
	xor	a4,a5,a4
	subw	a5,a4,a5
	sext.w	a5,a5
	slli	a4,a5,32
	srli	a4,a4,32
	lw	a5,-80(s0)
	srliw	a5,a5,31
	andi	a3,a5,0xff
	lwu	a2,-44(s0)
	lw	a1,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a1
	mv	a6,a2
	mv	a5,a3
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long
	sd	a0,-40(s0)
	j	.L230
.L222:
	lw	a5,-20(s0)
	andi	a5,a5,512
	sext.w	a5,a5
	beq	a5,zero,.L231
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a4,0(a5)
	lwu	a3,-44(s0)
	lw	a2,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	li	a5,0
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long_long
	sd	a0,-40(s0)
	j	.L230
.L231:
	lw	a5,-20(s0)
	andi	a5,a5,256
	sext.w	a5,a5
	beq	a5,zero,.L232
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a4,0(a5)
	lwu	a3,-44(s0)
	lw	a2,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	li	a5,0
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long
	sd	a0,-40(s0)
	j	.L230
.L232:
	lw	a5,-20(s0)
	andi	a5,a5,64
	sext.w	a5,a5
	beq	a5,zero,.L233
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	andi	a5,a5,0xff
	sext.w	a5,a5
	j	.L234
.L233:
	lw	a5,-20(s0)
	andi	a5,a5,128
	sext.w	a5,a5
	beq	a5,zero,.L235
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	slli	a5,a5,48
	srli	a5,a5,48
	sext.w	a5,a5
	j	.L234
.L235:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
.L234:
	sw	a5,-76(s0)
	lwu	a4,-76(s0)
	lwu	a3,-44(s0)
	lw	a2,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a2
	mv	a6,a3
	li	a5,0
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long
	sd	a0,-40(s0)
.L230:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L209:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,70
	bne	a4,a5,.L237
	lw	a5,-20(s0)
	ori	a5,a5,32
	sw	a5,-20(s0)
.L237:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	fld	fa5,0(a5)
	lw	a3,-20(s0)
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	mv	a6,a3
	fmv.d	fa0,fa5
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ftoa
	sd	a0,-40(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L207:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,103
	beq	a4,a5,.L238
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,71
	bne	a4,a5,.L239
.L238:
	lw	a5,-20(s0)
	mv	a4,a5
	li	a5,4096
	addi	a5,a5,-2048
	or	a5,a4,a5
	sw	a5,-20(s0)
.L239:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,69
	beq	a4,a5,.L240
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,71
	bne	a4,a5,.L241
.L240:
	lw	a5,-20(s0)
	ori	a5,a5,32
	sw	a5,-20(s0)
.L241:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	fld	fa5,0(a5)
	lw	a3,-20(s0)
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	mv	a6,a3
	fmv.d	fa0,fa5
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_etoa
	sd	a0,-40(s0)
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L210:
	li	a5,1
	sw	a5,-48(s0)
	lw	a5,-20(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L242
	j	.L243
.L244:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,32
	jalr	a4
.L243:
	lw	a5,-48(s0)
	addiw	a4,a5,1
	sw	a4,-48(s0)
	lw	a4,-24(s0)
	sext.w	a4,a4
	bgtu	a4,a5,.L244
.L242:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	lw	a5,0(a5)
	andi	a0,a5,0xff
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	jalr	a4
	lw	a5,-20(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	beq	a5,zero,.L245
	j	.L246
.L247:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,32
	jalr	a4
.L246:
	lw	a5,-48(s0)
	addiw	a4,a5,1
	sw	a4,-48(s0)
	lw	a4,-24(s0)
	sext.w	a4,a4
	bgtu	a4,a5,.L247
.L245:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L206:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
	lw	a5,-28(s0)
	sext.w	a5,a5
	beq	a5,zero,.L248
	lwu	a5,-28(s0)
	j	.L249
.L248:
	li	a5,-1
.L249:
	mv	a1,a5
	ld	a0,-56(s0)
	call	_strnlen_s
	mv	a5,a0
	sw	a5,-60(s0)
	lw	a5,-20(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L250
	lw	a5,-60(s0)
	mv	a2,a5
	lw	a5,-28(s0)
	sext.w	a3,a5
	sext.w	a4,a2
	bleu	a3,a4,.L251
	mv	a5,a2
.L251:
	sw	a5,-60(s0)
.L250:
	lw	a5,-20(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	bne	a5,zero,.L255
	j	.L253
.L254:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,32
	jalr	a4
.L253:
	lw	a5,-60(s0)
	addiw	a4,a5,1
	sw	a4,-60(s0)
	lw	a4,-24(s0)
	sext.w	a4,a4
	bgtu	a4,a5,.L254
	j	.L255
.L257:
	ld	a5,-56(s0)
	addi	a4,a5,1
	sd	a4,-56(s0)
	lbu	a0,0(a5)
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	jalr	a4
.L255:
	ld	a5,-56(s0)
	lbu	a5,0(a5)
	beq	a5,zero,.L256
	lw	a5,-20(s0)
	andi	a5,a5,1024
	sext.w	a5,a5
	beq	a5,zero,.L257
	lw	a5,-28(s0)
	addiw	a4,a5,-1
	sw	a4,-28(s0)
	bne	a5,zero,.L257
.L256:
	lw	a5,-20(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	beq	a5,zero,.L258
	j	.L259
.L260:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,32
	jalr	a4
.L259:
	lw	a5,-60(s0)
	addiw	a4,a5,1
	sw	a4,-60(s0)
	lw	a4,-24(s0)
	sext.w	a4,a4
	bgtu	a4,a5,.L260
.L258:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L205:
	li	a5,16
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	ori	a5,a5,33
	sw	a5,-20(s0)
	li	a5,1
	sb	a5,-69(s0)
	lbu	a5,-69(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L261
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a5,0(a5)
	mv	a3,a5
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a4
	li	a6,16
	li	a5,0
	mv	a4,a3
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long_long
	sd	a0,-40(s0)
	j	.L262
.L261:
	ld	a5,-136(s0)
	addi	a4,a5,8
	sd	a4,-136(s0)
	ld	a5,0(a5)
	mv	a3,a5
	lw	a4,-28(s0)
	lw	a5,-20(s0)
	sd	a5,8(sp)
	lw	a5,-24(s0)
	sd	a5,0(sp)
	mv	a7,a4
	li	a6,16
	li	a5,0
	mv	a4,a3
	ld	a3,-120(s0)
	ld	a2,-40(s0)
	ld	a1,-112(s0)
	ld	a0,-104(s0)
	call	_ntoa_long
	sd	a0,-40(s0)
.L262:
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L211:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,37
	jalr	a4
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	j	.L173
.L203:
	ld	a5,-128(s0)
	lbu	a0,0(a5)
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	jalr	a4
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
	nop
.L173:
	ld	a5,-128(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L263
	ld	a4,-40(s0)
	ld	a5,-120(s0)
	bltu	a4,a5,.L264
	ld	a5,-120(s0)
	addi	a5,a5,-1
	j	.L265
.L264:
	ld	a5,-40(s0)
.L265:
	ld	a4,-104(s0)
	ld	a3,-120(s0)
	mv	a2,a5
	ld	a1,-112(s0)
	li	a0,0
	jalr	a4
	ld	a5,-40(s0)
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	_vsnprintf, .-_vsnprintf
	.align	1
	.globl	printf_
	.type	printf_, @function
printf_:
	addi	sp,sp,-128
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	addi	a5,s0,64
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	addi	a5,a5,-56
	sd	a5,-32(s0)
	ld	a4,-32(s0)
	addi	a5,s0,-40
	ld	a3,-56(s0)
	li	a2,-1
	mv	a1,a5
	lui	a5,%hi(_out_char)
	addi	a0,a5,%lo(_out_char)
	call	_vsnprintf
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,128
	jr	ra
	.size	printf_, .-printf_
	.align	1
	.globl	sprintf_
	.type	sprintf_, @function
sprintf_:
	addi	sp,sp,-112
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,0(s0)
	sd	a3,8(s0)
	sd	a4,16(s0)
	sd	a5,24(s0)
	sd	a6,32(s0)
	sd	a7,40(s0)
	addi	a5,s0,48
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	addi	a5,a5,-48
	sd	a5,-32(s0)
	ld	a5,-32(s0)
	mv	a4,a5
	ld	a3,-48(s0)
	li	a2,-1
	ld	a1,-40(s0)
	lui	a5,%hi(_out_buffer)
	addi	a0,a5,%lo(_out_buffer)
	call	_vsnprintf
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,112
	jr	ra
	.size	sprintf_, .-sprintf_
	.align	1
	.globl	snprintf_
	.type	snprintf_, @function
snprintf_:
	addi	sp,sp,-112
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,8(s0)
	sd	a4,16(s0)
	sd	a5,24(s0)
	sd	a6,32(s0)
	sd	a7,40(s0)
	addi	a5,s0,48
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	addi	a5,a5,-40
	sd	a5,-32(s0)
	ld	a5,-32(s0)
	mv	a4,a5
	ld	a3,-56(s0)
	ld	a2,-48(s0)
	ld	a1,-40(s0)
	lui	a5,%hi(_out_buffer)
	addi	a0,a5,%lo(_out_buffer)
	call	_vsnprintf
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,112
	jr	ra
	.size	snprintf_, .-snprintf_
	.align	1
	.globl	vprintf_
	.type	vprintf_, @function
vprintf_:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	addi	a5,s0,-24
	ld	a4,-48(s0)
	ld	a3,-40(s0)
	li	a2,-1
	mv	a1,a5
	lui	a5,%hi(_out_char)
	addi	a0,a5,%lo(_out_char)
	call	_vsnprintf
	mv	a5,a0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	vprintf_, .-vprintf_
	.align	1
	.globl	vsnprintf_
	.type	vsnprintf_, @function
vsnprintf_:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	ld	a4,-48(s0)
	ld	a3,-40(s0)
	ld	a2,-32(s0)
	ld	a1,-24(s0)
	lui	a5,%hi(_out_buffer)
	addi	a0,a5,%lo(_out_buffer)
	call	_vsnprintf
	mv	a5,a0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	vsnprintf_, .-vsnprintf_
	.align	1
	.globl	fctprintf
	.type	fctprintf, @function
fctprintf:
	addi	sp,sp,-128
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sd	a3,8(s0)
	sd	a4,16(s0)
	sd	a5,24(s0)
	sd	a6,32(s0)
	sd	a7,40(s0)
	addi	a5,s0,48
	sd	a5,-80(s0)
	ld	a5,-80(s0)
	addi	a5,a5,-40
	sd	a5,-32(s0)
	ld	a5,-56(s0)
	sd	a5,-48(s0)
	ld	a5,-64(s0)
	sd	a5,-40(s0)
	ld	a4,-32(s0)
	addi	a5,s0,-48
	ld	a3,-72(s0)
	li	a2,-1
	mv	a1,a5
	lui	a5,%hi(_out_fct)
	addi	a0,a5,%lo(_out_fct)
	call	_vsnprintf
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,128
	jr	ra
	.size	fctprintf, .-fctprintf
	.section	.rodata
	.align	3
	.type	pow10.0, @object
	.size	pow10.0, 80
pow10.0:
	.word	0
	.word	1072693248
	.word	0
	.word	1076101120
	.word	0
	.word	1079574528
	.word	0
	.word	1083129856
	.word	0
	.word	1086556160
	.word	0
	.word	1090021888
	.word	0
	.word	1093567616
	.word	0
	.word	1097011920
	.word	0
	.word	1100470148
	.word	0
	.word	1104006501
	.align	3
.LC1:
	.word	-1
	.word	-1048577
	.align	3
.LC3:
	.word	-1
	.word	2146435071
	.align	3
.LC6:
	.word	0
	.word	1104006501
	.align	3
.LC7:
	.word	0
	.word	-1043477147
	.align	3
.LC8:
	.word	0
	.word	1071644672
	.align	3
.LC9:
	.dword	-3689348814741910323
	.align	3
.LC10:
	.word	1352628731
	.word	1070810131
	.align	3
.LC11:
	.word	-1956591437
	.word	1069976104
	.align	3
.LC12:
	.word	0
	.word	1073217536
	.align	3
.LC13:
	.word	1668236129
	.word	1070761895
	.align	3
.LC14:
	.word	158966641
	.word	1074434895
	.align	3
.LC15:
	.word	-1145744106
	.word	1073900465
	.align	3
.LC16:
	.word	-17155601
	.word	1072049730
	.align	3
.LC17:
	.word	0
	.word	1073741824
	.align	3
.LC18:
	.word	0
	.word	1076625408
	.align	3
.LC19:
	.word	0
	.word	1076101120
	.align	3
.LC20:
	.word	0
	.word	1075314688
	.align	3
.LC21:
	.word	0
	.word	1072693248
	.align	3
.LC22:
	.word	-350469331
	.word	1058682594
	.align	3
.LC23:
	.word	0
	.word	1093567616
	.ident	"GCC: (g04696df09) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
