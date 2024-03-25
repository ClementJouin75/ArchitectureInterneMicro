
lab2.elf:     format de fichier elf32-littleriscv


Déassemblage de la section .init :

00000004 <_enter>:
   4:	80002197          	auipc	gp,0x80002
   8:	ffc18193          	addi	gp,gp,-4 # 80002000 <__global_pointer$+0x0>
   c:	80000117          	auipc	sp,0x80000
  10:	42410113          	addi	sp,sp,1060 # 80000430 <__global_pointer$+0xffffe430>
  14:	0040006f          	j	18 <__init_array_end>

Déassemblage de la section .text :

00000018 <main>:
  18:	800007b7          	lui	a5,0x80000
  1c:	00078793          	mv	a5,a5
  20:	00000713          	li	a4,0
  24:	00a00693          	li	a3,10
  28:	00e7a023          	sw	a4,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  2c:	00170713          	addi	a4,a4,1
  30:	00478793          	addi	a5,a5,4
  34:	fed71ae3          	bne	a4,a3,28 <main+0x10>
  38:	00000513          	li	a0,0
  3c:	00008067          	ret

00000040 <_start>:
  40:	800007b7          	lui	a5,0x80000
  44:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  48:	800007b7          	lui	a5,0x80000
  4c:	0287a603          	lw	a2,40(a5) # 80000028 <__global_pointer$+0xffffe028>
  50:	ff010113          	addi	sp,sp,-16
  54:	00000593          	li	a1,0
  58:	40a60633          	sub	a2,a2,a0
  5c:	00112623          	sw	ra,12(sp)
  60:	00812423          	sw	s0,8(sp)
  64:	00912223          	sw	s1,4(sp)
  68:	01212023          	sw	s2,0(sp)
  6c:	190000ef          	jal	ra,1fc <memset>
  70:	800007b7          	lui	a5,0x80000
  74:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  78:	800007b7          	lui	a5,0x80000
  7c:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  80:	2d802583          	lw	a1,728(zero) # 2d8 <metal_segment_data_source_start>
  84:	40a60633          	sub	a2,a2,a0
  88:	04c000ef          	jal	ra,d4 <memcpy>
  8c:	01800413          	li	s0,24
  90:	01800793          	li	a5,24
  94:	40f40433          	sub	s0,s0,a5
  98:	40245413          	srai	s0,s0,0x2
  9c:	00245413          	srli	s0,s0,0x2
  a0:	01800493          	li	s1,24
  a4:	00000913          	li	s2,0
  a8:	01241863          	bne	s0,s2,b8 <_start+0x78>
  ac:	f6dff0ef          	jal	ra,18 <main>
  b0:	10500073          	wfi
  b4:	ffdff06f          	j	b0 <_start+0x70>
  b8:	0004a783          	lw	a5,0(s1)
  bc:	00190913          	addi	s2,s2,1
  c0:	00448493          	addi	s1,s1,4
  c4:	000780e7          	jalr	a5
  c8:	fe1ff06f          	j	a8 <_start+0x68>

000000cc <_Exit>:
  cc:	10500073          	wfi
  d0:	ffdff06f          	j	cc <_Exit>

000000d4 <memcpy>:
  d4:	00b547b3          	xor	a5,a0,a1
  d8:	0037f793          	andi	a5,a5,3
  dc:	00c508b3          	add	a7,a0,a2
  e0:	06079663          	bnez	a5,14c <memcpy+0x78>
  e4:	00300793          	li	a5,3
  e8:	06c7f263          	bgeu	a5,a2,14c <memcpy+0x78>
  ec:	00357793          	andi	a5,a0,3
  f0:	00050713          	mv	a4,a0
  f4:	0c079a63          	bnez	a5,1c8 <memcpy+0xf4>
  f8:	ffc8f613          	andi	a2,a7,-4
  fc:	40e606b3          	sub	a3,a2,a4
 100:	02000793          	li	a5,32
 104:	02000293          	li	t0,32
 108:	06d7c263          	blt	a5,a3,16c <memcpy+0x98>
 10c:	00058693          	mv	a3,a1
 110:	00070793          	mv	a5,a4
 114:	02c77863          	bgeu	a4,a2,144 <memcpy+0x70>
 118:	0006a803          	lw	a6,0(a3)
 11c:	00478793          	addi	a5,a5,4
 120:	00468693          	addi	a3,a3,4
 124:	ff07ae23          	sw	a6,-4(a5)
 128:	fec7e8e3          	bltu	a5,a2,118 <memcpy+0x44>
 12c:	fff60793          	addi	a5,a2,-1
 130:	40e787b3          	sub	a5,a5,a4
 134:	ffc7f793          	andi	a5,a5,-4
 138:	00478793          	addi	a5,a5,4
 13c:	00f70733          	add	a4,a4,a5
 140:	00f585b3          	add	a1,a1,a5
 144:	01176863          	bltu	a4,a7,154 <memcpy+0x80>
 148:	00008067          	ret
 14c:	00050713          	mv	a4,a0
 150:	ff157ce3          	bgeu	a0,a7,148 <memcpy+0x74>
 154:	0005c783          	lbu	a5,0(a1)
 158:	00170713          	addi	a4,a4,1
 15c:	00158593          	addi	a1,a1,1
 160:	fef70fa3          	sb	a5,-1(a4)
 164:	ff1768e3          	bltu	a4,a7,154 <memcpy+0x80>
 168:	00008067          	ret
 16c:	0045a683          	lw	a3,4(a1)
 170:	01c5a783          	lw	a5,28(a1)
 174:	0005af83          	lw	t6,0(a1)
 178:	0085af03          	lw	t5,8(a1)
 17c:	00c5ae83          	lw	t4,12(a1)
 180:	0105ae03          	lw	t3,16(a1)
 184:	0145a303          	lw	t1,20(a1)
 188:	0185a803          	lw	a6,24(a1)
 18c:	00d72223          	sw	a3,4(a4)
 190:	0205a683          	lw	a3,32(a1)
 194:	01f72023          	sw	t6,0(a4)
 198:	01e72423          	sw	t5,8(a4)
 19c:	01d72623          	sw	t4,12(a4)
 1a0:	01c72823          	sw	t3,16(a4)
 1a4:	00672a23          	sw	t1,20(a4)
 1a8:	01072c23          	sw	a6,24(a4)
 1ac:	00f72e23          	sw	a5,28(a4)
 1b0:	02470713          	addi	a4,a4,36
 1b4:	40e607b3          	sub	a5,a2,a4
 1b8:	fed72e23          	sw	a3,-4(a4)
 1bc:	02458593          	addi	a1,a1,36
 1c0:	faf2c6e3          	blt	t0,a5,16c <memcpy+0x98>
 1c4:	f49ff06f          	j	10c <memcpy+0x38>
 1c8:	0005c683          	lbu	a3,0(a1)
 1cc:	00170713          	addi	a4,a4,1
 1d0:	00377793          	andi	a5,a4,3
 1d4:	fed70fa3          	sb	a3,-1(a4)
 1d8:	00158593          	addi	a1,a1,1
 1dc:	f0078ee3          	beqz	a5,f8 <memcpy+0x24>
 1e0:	0005c683          	lbu	a3,0(a1)
 1e4:	00170713          	addi	a4,a4,1
 1e8:	00377793          	andi	a5,a4,3
 1ec:	fed70fa3          	sb	a3,-1(a4)
 1f0:	00158593          	addi	a1,a1,1
 1f4:	fc079ae3          	bnez	a5,1c8 <memcpy+0xf4>
 1f8:	f01ff06f          	j	f8 <memcpy+0x24>

000001fc <memset>:
 1fc:	00f00313          	li	t1,15
 200:	00050713          	mv	a4,a0
 204:	02c37e63          	bgeu	t1,a2,240 <memset+0x44>
 208:	00f77793          	andi	a5,a4,15
 20c:	0a079063          	bnez	a5,2ac <memset+0xb0>
 210:	08059263          	bnez	a1,294 <memset+0x98>
 214:	ff067693          	andi	a3,a2,-16
 218:	00f67613          	andi	a2,a2,15
 21c:	00e686b3          	add	a3,a3,a4
 220:	00b72023          	sw	a1,0(a4)
 224:	00b72223          	sw	a1,4(a4)
 228:	00b72423          	sw	a1,8(a4)
 22c:	00b72623          	sw	a1,12(a4)
 230:	01070713          	addi	a4,a4,16
 234:	fed766e3          	bltu	a4,a3,220 <memset+0x24>
 238:	00061463          	bnez	a2,240 <memset+0x44>
 23c:	00008067          	ret
 240:	40c306b3          	sub	a3,t1,a2
 244:	00269693          	slli	a3,a3,0x2
 248:	00000297          	auipc	t0,0x0
 24c:	005686b3          	add	a3,a3,t0
 250:	00c68067          	jr	12(a3)
 254:	00b70723          	sb	a1,14(a4)
 258:	00b706a3          	sb	a1,13(a4)
 25c:	00b70623          	sb	a1,12(a4)
 260:	00b705a3          	sb	a1,11(a4)
 264:	00b70523          	sb	a1,10(a4)
 268:	00b704a3          	sb	a1,9(a4)
 26c:	00b70423          	sb	a1,8(a4)
 270:	00b703a3          	sb	a1,7(a4)
 274:	00b70323          	sb	a1,6(a4)
 278:	00b702a3          	sb	a1,5(a4)
 27c:	00b70223          	sb	a1,4(a4)
 280:	00b701a3          	sb	a1,3(a4)
 284:	00b70123          	sb	a1,2(a4)
 288:	00b700a3          	sb	a1,1(a4)
 28c:	00b70023          	sb	a1,0(a4)
 290:	00008067          	ret
 294:	0ff5f593          	zext.b	a1,a1
 298:	00859693          	slli	a3,a1,0x8
 29c:	00d5e5b3          	or	a1,a1,a3
 2a0:	01059693          	slli	a3,a1,0x10
 2a4:	00d5e5b3          	or	a1,a1,a3
 2a8:	f6dff06f          	j	214 <memset+0x18>
 2ac:	00279693          	slli	a3,a5,0x2
 2b0:	00000297          	auipc	t0,0x0
 2b4:	005686b3          	add	a3,a3,t0
 2b8:	00008293          	mv	t0,ra
 2bc:	fa0680e7          	jalr	-96(a3)
 2c0:	00028093          	mv	ra,t0
 2c4:	ff078793          	addi	a5,a5,-16
 2c8:	40f70733          	sub	a4,a4,a5
 2cc:	00f60633          	add	a2,a2,a5
 2d0:	f6c378e3          	bgeu	t1,a2,240 <memset+0x44>
 2d4:	f3dff06f          	j	210 <memset+0x14>
