
test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	80010137          	lui	sp,0x80010
   4:	ff010113          	addi	sp,sp,-16 # 8000fff0 <main+0x8000ff44>
   8:	0a4000ef          	jal	ac <main>
   c:	00a00893          	li	a7,10
  10:	00000073          	ecall

00000014 <print>:
  14:	fe010113          	addi	sp,sp,-32
  18:	00112e23          	sw	ra,28(sp)
  1c:	00812c23          	sw	s0,24(sp)
  20:	02010413          	addi	s0,sp,32
  24:	fea42623          	sw	a0,-20(s0)
  28:	fec42503          	lw	a0,-20(s0)
  2c:	00100893          	li	a7,1
  30:	00000073          	ecall
  34:	00000013          	nop
  38:	01c12083          	lw	ra,28(sp)
  3c:	01812403          	lw	s0,24(sp)
  40:	02010113          	addi	sp,sp,32
  44:	00008067          	ret

00000048 <multiply>:
  48:	fd010113          	addi	sp,sp,-48
  4c:	02112623          	sw	ra,44(sp)
  50:	02812423          	sw	s0,40(sp)
  54:	03010413          	addi	s0,sp,48
  58:	fca42e23          	sw	a0,-36(s0)
  5c:	fcb42c23          	sw	a1,-40(s0)
  60:	fe042623          	sw	zero,-20(s0)
  64:	fe042423          	sw	zero,-24(s0)
  68:	0200006f          	j	88 <multiply+0x40>
  6c:	fec42703          	lw	a4,-20(s0)
  70:	fdc42783          	lw	a5,-36(s0)
  74:	00f707b3          	add	a5,a4,a5
  78:	fef42623          	sw	a5,-20(s0)
  7c:	fe842783          	lw	a5,-24(s0)
  80:	00178793          	addi	a5,a5,1
  84:	fef42423          	sw	a5,-24(s0)
  88:	fe842703          	lw	a4,-24(s0)
  8c:	fd842783          	lw	a5,-40(s0)
  90:	fcf74ee3          	blt	a4,a5,6c <multiply+0x24>
  94:	fec42783          	lw	a5,-20(s0)
  98:	00078513          	mv	a0,a5
  9c:	02c12083          	lw	ra,44(sp)
  a0:	02812403          	lw	s0,40(sp)
  a4:	03010113          	addi	sp,sp,48
  a8:	00008067          	ret

000000ac <main>:
  ac:	fe010113          	addi	sp,sp,-32
  b0:	00112e23          	sw	ra,28(sp)
  b4:	00812c23          	sw	s0,24(sp)
  b8:	02010413          	addi	s0,sp,32
  bc:	01e00793          	li	a5,30
  c0:	fef42623          	sw	a5,-20(s0)
  c4:	fec42583          	lw	a1,-20(s0)
  c8:	fec42503          	lw	a0,-20(s0)
  cc:	f7dff0ef          	jal	48 <multiply>
  d0:	00050793          	mv	a5,a0
  d4:	00078513          	mv	a0,a5
  d8:	f3dff0ef          	jal	14 <print>
  dc:	00000793          	li	a5,0
  e0:	00078513          	mv	a0,a5
  e4:	01c12083          	lw	ra,28(sp)
  e8:	01812403          	lw	s0,24(sp)
  ec:	02010113          	addi	sp,sp,32
  f0:	00008067          	ret

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <print>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	36343067          	.insn	4, 0x36343067
   a:	3639                	.insn	2, 0x3639
   c:	6664                	.insn	2, 0x6664
   e:	3930                	.insn	2, 0x3930
  10:	2029                	.insn	2, 0x2029
  12:	3431                	.insn	2, 0x3431
  14:	322e                	.insn	2, 0x322e
  16:	302e                	.insn	2, 0x302e
	...
