
lab2.elf:     format de fichier elf32-littleriscv


Déassemblage de la section .init :

00000004 <_enter>:
   4:	80002197          	auipc	gp,0x80002
   8:	ffc18193          	addi	gp,gp,-4 # 80002000 <__global_pointer$+0x0>
   c:	80000117          	auipc	sp,0x80000
  10:	3f410113          	addi	sp,sp,1012 # 80000400 <__global_pointer$+0xffffe400>
  14:	0040006f          	j	18 <__init_array_end>

Déassemblage de la section .text :

00000018 <main>:
  18:	200007b7          	lui	a5,0x20000
  1c:	fff00713          	li	a4,-1
  20:	00e7a023          	sw	a4,0(a5) # 20000000 <GPIO_DIR>
  24:	00000793          	li	a5,0
  28:	20000737          	lui	a4,0x20000
  2c:	00f72223          	sw	a5,4(a4) # 20000004 <GPIO_VAL>
  30:	00178793          	addi	a5,a5,1
  34:	ff9ff06f          	j	2c <main+0x14>

00000038 <_start>:
  38:	800007b7          	lui	a5,0x80000
  3c:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  40:	800007b7          	lui	a5,0x80000
  44:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  48:	ff010113          	addi	sp,sp,-16
  4c:	00000593          	li	a1,0
  50:	40a60633          	sub	a2,a2,a0
  54:	00112623          	sw	ra,12(sp)
  58:	00812423          	sw	s0,8(sp)
  5c:	00912223          	sw	s1,4(sp)
  60:	01212023          	sw	s2,0(sp)
  64:	190000ef          	jal	ra,1f4 <memset>
  68:	800007b7          	lui	a5,0x80000
  6c:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  70:	800007b7          	lui	a5,0x80000
  74:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  78:	2d002583          	lw	a1,720(zero) # 2d0 <metal_segment_data_source_start>
  7c:	40a60633          	sub	a2,a2,a0
  80:	04c000ef          	jal	ra,cc <memcpy>
  84:	01800413          	li	s0,24
  88:	01800793          	li	a5,24
  8c:	40f40433          	sub	s0,s0,a5
  90:	40245413          	srai	s0,s0,0x2
  94:	00245413          	srli	s0,s0,0x2
  98:	01800493          	li	s1,24
  9c:	00000913          	li	s2,0
  a0:	01241863          	bne	s0,s2,b0 <_start+0x78>
  a4:	f75ff0ef          	jal	ra,18 <main>
  a8:	10500073          	wfi
  ac:	ffdff06f          	j	a8 <_start+0x70>
  b0:	0004a783          	lw	a5,0(s1)
  b4:	00190913          	addi	s2,s2,1
  b8:	00448493          	addi	s1,s1,4
  bc:	000780e7          	jalr	a5
  c0:	fe1ff06f          	j	a0 <_start+0x68>

000000c4 <_Exit>:
  c4:	10500073          	wfi
  c8:	ffdff06f          	j	c4 <_Exit>

000000cc <memcpy>:
  cc:	00b547b3          	xor	a5,a0,a1
  d0:	0037f793          	andi	a5,a5,3
  d4:	00c508b3          	add	a7,a0,a2
  d8:	06079663          	bnez	a5,144 <memcpy+0x78>
  dc:	00300793          	li	a5,3
  e0:	06c7f263          	bgeu	a5,a2,144 <memcpy+0x78>
  e4:	00357793          	andi	a5,a0,3
  e8:	00050713          	mv	a4,a0
  ec:	0c079a63          	bnez	a5,1c0 <memcpy+0xf4>
  f0:	ffc8f613          	andi	a2,a7,-4
  f4:	40e606b3          	sub	a3,a2,a4
  f8:	02000793          	li	a5,32
  fc:	02000293          	li	t0,32
 100:	06d7c263          	blt	a5,a3,164 <memcpy+0x98>
 104:	00058693          	mv	a3,a1
 108:	00070793          	mv	a5,a4
 10c:	02c77863          	bgeu	a4,a2,13c <memcpy+0x70>
 110:	0006a803          	lw	a6,0(a3)
 114:	00478793          	addi	a5,a5,4
 118:	00468693          	addi	a3,a3,4
 11c:	ff07ae23          	sw	a6,-4(a5)
 120:	fec7e8e3          	bltu	a5,a2,110 <memcpy+0x44>
 124:	fff60793          	addi	a5,a2,-1
 128:	40e787b3          	sub	a5,a5,a4
 12c:	ffc7f793          	andi	a5,a5,-4
 130:	00478793          	addi	a5,a5,4
 134:	00f70733          	add	a4,a4,a5
 138:	00f585b3          	add	a1,a1,a5
 13c:	01176863          	bltu	a4,a7,14c <memcpy+0x80>
 140:	00008067          	ret
 144:	00050713          	mv	a4,a0
 148:	ff157ce3          	bgeu	a0,a7,140 <memcpy+0x74>
 14c:	0005c783          	lbu	a5,0(a1)
 150:	00170713          	addi	a4,a4,1
 154:	00158593          	addi	a1,a1,1
 158:	fef70fa3          	sb	a5,-1(a4)
 15c:	ff1768e3          	bltu	a4,a7,14c <memcpy+0x80>
 160:	00008067          	ret
 164:	0045a683          	lw	a3,4(a1)
 168:	01c5a783          	lw	a5,28(a1)
 16c:	0005af83          	lw	t6,0(a1)
 170:	0085af03          	lw	t5,8(a1)
 174:	00c5ae83          	lw	t4,12(a1)
 178:	0105ae03          	lw	t3,16(a1)
 17c:	0145a303          	lw	t1,20(a1)
 180:	0185a803          	lw	a6,24(a1)
 184:	00d72223          	sw	a3,4(a4)
 188:	0205a683          	lw	a3,32(a1)
 18c:	01f72023          	sw	t6,0(a4)
 190:	01e72423          	sw	t5,8(a4)
 194:	01d72623          	sw	t4,12(a4)
 198:	01c72823          	sw	t3,16(a4)
 19c:	00672a23          	sw	t1,20(a4)
 1a0:	01072c23          	sw	a6,24(a4)
 1a4:	00f72e23          	sw	a5,28(a4)
 1a8:	02470713          	addi	a4,a4,36
 1ac:	40e607b3          	sub	a5,a2,a4
 1b0:	fed72e23          	sw	a3,-4(a4)
 1b4:	02458593          	addi	a1,a1,36
 1b8:	faf2c6e3          	blt	t0,a5,164 <memcpy+0x98>
 1bc:	f49ff06f          	j	104 <memcpy+0x38>
 1c0:	0005c683          	lbu	a3,0(a1)
 1c4:	00170713          	addi	a4,a4,1
 1c8:	00377793          	andi	a5,a4,3
 1cc:	fed70fa3          	sb	a3,-1(a4)
 1d0:	00158593          	addi	a1,a1,1
 1d4:	f0078ee3          	beqz	a5,f0 <memcpy+0x24>
 1d8:	0005c683          	lbu	a3,0(a1)
 1dc:	00170713          	addi	a4,a4,1
 1e0:	00377793          	andi	a5,a4,3
 1e4:	fed70fa3          	sb	a3,-1(a4)
 1e8:	00158593          	addi	a1,a1,1
 1ec:	fc079ae3          	bnez	a5,1c0 <memcpy+0xf4>
 1f0:	f01ff06f          	j	f0 <memcpy+0x24>

000001f4 <memset>:
 1f4:	00f00313          	li	t1,15
 1f8:	00050713          	mv	a4,a0
 1fc:	02c37e63          	bgeu	t1,a2,238 <memset+0x44>
 200:	00f77793          	andi	a5,a4,15
 204:	0a079063          	bnez	a5,2a4 <memset+0xb0>
 208:	08059263          	bnez	a1,28c <memset+0x98>
 20c:	ff067693          	andi	a3,a2,-16
 210:	00f67613          	andi	a2,a2,15
 214:	00e686b3          	add	a3,a3,a4
 218:	00b72023          	sw	a1,0(a4)
 21c:	00b72223          	sw	a1,4(a4)
 220:	00b72423          	sw	a1,8(a4)
 224:	00b72623          	sw	a1,12(a4)
 228:	01070713          	addi	a4,a4,16
 22c:	fed766e3          	bltu	a4,a3,218 <memset+0x24>
 230:	00061463          	bnez	a2,238 <memset+0x44>
 234:	00008067          	ret
 238:	40c306b3          	sub	a3,t1,a2
 23c:	00269693          	slli	a3,a3,0x2
 240:	00000297          	auipc	t0,0x0
 244:	005686b3          	add	a3,a3,t0
 248:	00c68067          	jr	12(a3)
 24c:	00b70723          	sb	a1,14(a4)
 250:	00b706a3          	sb	a1,13(a4)
 254:	00b70623          	sb	a1,12(a4)
 258:	00b705a3          	sb	a1,11(a4)
 25c:	00b70523          	sb	a1,10(a4)
 260:	00b704a3          	sb	a1,9(a4)
 264:	00b70423          	sb	a1,8(a4)
 268:	00b703a3          	sb	a1,7(a4)
 26c:	00b70323          	sb	a1,6(a4)
 270:	00b702a3          	sb	a1,5(a4)
 274:	00b70223          	sb	a1,4(a4)
 278:	00b701a3          	sb	a1,3(a4)
 27c:	00b70123          	sb	a1,2(a4)
 280:	00b700a3          	sb	a1,1(a4)
 284:	00b70023          	sb	a1,0(a4)
 288:	00008067          	ret
 28c:	0ff5f593          	zext.b	a1,a1
 290:	00859693          	slli	a3,a1,0x8
 294:	00d5e5b3          	or	a1,a1,a3
 298:	01059693          	slli	a3,a1,0x10
 29c:	00d5e5b3          	or	a1,a1,a3
 2a0:	f6dff06f          	j	20c <memset+0x18>
 2a4:	00279693          	slli	a3,a5,0x2
 2a8:	00000297          	auipc	t0,0x0
 2ac:	005686b3          	add	a3,a3,t0
 2b0:	00008293          	mv	t0,ra
 2b4:	fa0680e7          	jalr	-96(a3)
 2b8:	00028093          	mv	ra,t0
 2bc:	ff078793          	addi	a5,a5,-16
 2c0:	40f70733          	sub	a4,a4,a5
 2c4:	00f60633          	add	a2,a2,a5
 2c8:	f6c378e3          	bgeu	t1,a2,238 <memset+0x44>
 2cc:	f3dff06f          	j	208 <memset+0x14>
