
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
  18:	fe010113          	addi	sp,sp,-32
  1c:	00500513          	li	a0,5
  20:	00112e23          	sw	ra,28(sp)
  24:	00c000ef          	jal	ra,30 <facto>
  28:	00a12623          	sw	a0,12(sp)
  2c:	0000006f          	j	2c <main+0x14>

00000030 <facto>:
  30:	ff010113          	addi	sp,sp,-16
  34:	00912223          	sw	s1,4(sp)
  38:	00050593          	mv	a1,a0
  3c:	00112623          	sw	ra,12(sp)
  40:	00812423          	sw	s0,8(sp)
  44:	00100513          	li	a0,1
  48:	00100493          	li	s1,1
  4c:	00958a63          	beq	a1,s1,60 <facto+0x30>
  50:	fff58413          	addi	s0,a1,-1
  54:	0b4000ef          	jal	ra,108 <__mulsi3>
  58:	00040593          	mv	a1,s0
  5c:	ff1ff06f          	j	4c <facto+0x1c>
  60:	00c12083          	lw	ra,12(sp)
  64:	00812403          	lw	s0,8(sp)
  68:	00412483          	lw	s1,4(sp)
  6c:	01010113          	addi	sp,sp,16
  70:	00008067          	ret

00000074 <_start>:
  74:	800007b7          	lui	a5,0x80000
  78:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  7c:	800007b7          	lui	a5,0x80000
  80:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  84:	ff010113          	addi	sp,sp,-16
  88:	00000593          	li	a1,0
  8c:	40a60633          	sub	a2,a2,a0
  90:	00112623          	sw	ra,12(sp)
  94:	00812423          	sw	s0,8(sp)
  98:	00912223          	sw	s1,4(sp)
  9c:	01212023          	sw	s2,0(sp)
  a0:	1b4000ef          	jal	ra,254 <memset>
  a4:	800007b7          	lui	a5,0x80000
  a8:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  ac:	800007b7          	lui	a5,0x80000
  b0:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  b4:	33002583          	lw	a1,816(zero) # 330 <metal_segment_data_source_start>
  b8:	40a60633          	sub	a2,a2,a0
  bc:	070000ef          	jal	ra,12c <memcpy>
  c0:	01800413          	li	s0,24
  c4:	01800793          	li	a5,24
  c8:	40f40433          	sub	s0,s0,a5
  cc:	40245413          	srai	s0,s0,0x2
  d0:	00245413          	srli	s0,s0,0x2
  d4:	01800493          	li	s1,24
  d8:	00000913          	li	s2,0
  dc:	01241863          	bne	s0,s2,ec <_start+0x78>
  e0:	f39ff0ef          	jal	ra,18 <main>
  e4:	10500073          	wfi
  e8:	ffdff06f          	j	e4 <_start+0x70>
  ec:	0004a783          	lw	a5,0(s1)
  f0:	00190913          	addi	s2,s2,1
  f4:	00448493          	addi	s1,s1,4
  f8:	000780e7          	jalr	a5
  fc:	fe1ff06f          	j	dc <_start+0x68>

00000100 <_Exit>:
 100:	10500073          	wfi
 104:	ffdff06f          	j	100 <_Exit>

00000108 <__mulsi3>:
 108:	00050613          	mv	a2,a0
 10c:	00000513          	li	a0,0
 110:	0015f693          	andi	a3,a1,1
 114:	00068463          	beqz	a3,11c <__mulsi3+0x14>
 118:	00c50533          	add	a0,a0,a2
 11c:	0015d593          	srli	a1,a1,0x1
 120:	00161613          	slli	a2,a2,0x1
 124:	fe0596e3          	bnez	a1,110 <__mulsi3+0x8>
 128:	00008067          	ret

0000012c <memcpy>:
 12c:	00b547b3          	xor	a5,a0,a1
 130:	0037f793          	andi	a5,a5,3
 134:	00c508b3          	add	a7,a0,a2
 138:	06079663          	bnez	a5,1a4 <memcpy+0x78>
 13c:	00300793          	li	a5,3
 140:	06c7f263          	bgeu	a5,a2,1a4 <memcpy+0x78>
 144:	00357793          	andi	a5,a0,3
 148:	00050713          	mv	a4,a0
 14c:	0c079a63          	bnez	a5,220 <memcpy+0xf4>
 150:	ffc8f613          	andi	a2,a7,-4
 154:	40e606b3          	sub	a3,a2,a4
 158:	02000793          	li	a5,32
 15c:	02000293          	li	t0,32
 160:	06d7c263          	blt	a5,a3,1c4 <memcpy+0x98>
 164:	00058693          	mv	a3,a1
 168:	00070793          	mv	a5,a4
 16c:	02c77863          	bgeu	a4,a2,19c <memcpy+0x70>
 170:	0006a803          	lw	a6,0(a3)
 174:	00478793          	addi	a5,a5,4
 178:	00468693          	addi	a3,a3,4
 17c:	ff07ae23          	sw	a6,-4(a5)
 180:	fec7e8e3          	bltu	a5,a2,170 <memcpy+0x44>
 184:	fff60793          	addi	a5,a2,-1
 188:	40e787b3          	sub	a5,a5,a4
 18c:	ffc7f793          	andi	a5,a5,-4
 190:	00478793          	addi	a5,a5,4
 194:	00f70733          	add	a4,a4,a5
 198:	00f585b3          	add	a1,a1,a5
 19c:	01176863          	bltu	a4,a7,1ac <memcpy+0x80>
 1a0:	00008067          	ret
 1a4:	00050713          	mv	a4,a0
 1a8:	ff157ce3          	bgeu	a0,a7,1a0 <memcpy+0x74>
 1ac:	0005c783          	lbu	a5,0(a1)
 1b0:	00170713          	addi	a4,a4,1
 1b4:	00158593          	addi	a1,a1,1
 1b8:	fef70fa3          	sb	a5,-1(a4)
 1bc:	ff1768e3          	bltu	a4,a7,1ac <memcpy+0x80>
 1c0:	00008067          	ret
 1c4:	0045a683          	lw	a3,4(a1)
 1c8:	01c5a783          	lw	a5,28(a1)
 1cc:	0005af83          	lw	t6,0(a1)
 1d0:	0085af03          	lw	t5,8(a1)
 1d4:	00c5ae83          	lw	t4,12(a1)
 1d8:	0105ae03          	lw	t3,16(a1)
 1dc:	0145a303          	lw	t1,20(a1)
 1e0:	0185a803          	lw	a6,24(a1)
 1e4:	00d72223          	sw	a3,4(a4)
 1e8:	0205a683          	lw	a3,32(a1)
 1ec:	01f72023          	sw	t6,0(a4)
 1f0:	01e72423          	sw	t5,8(a4)
 1f4:	01d72623          	sw	t4,12(a4)
 1f8:	01c72823          	sw	t3,16(a4)
 1fc:	00672a23          	sw	t1,20(a4)
 200:	01072c23          	sw	a6,24(a4)
 204:	00f72e23          	sw	a5,28(a4)
 208:	02470713          	addi	a4,a4,36
 20c:	40e607b3          	sub	a5,a2,a4
 210:	fed72e23          	sw	a3,-4(a4)
 214:	02458593          	addi	a1,a1,36
 218:	faf2c6e3          	blt	t0,a5,1c4 <memcpy+0x98>
 21c:	f49ff06f          	j	164 <memcpy+0x38>
 220:	0005c683          	lbu	a3,0(a1)
 224:	00170713          	addi	a4,a4,1
 228:	00377793          	andi	a5,a4,3
 22c:	fed70fa3          	sb	a3,-1(a4)
 230:	00158593          	addi	a1,a1,1
 234:	f0078ee3          	beqz	a5,150 <memcpy+0x24>
 238:	0005c683          	lbu	a3,0(a1)
 23c:	00170713          	addi	a4,a4,1
 240:	00377793          	andi	a5,a4,3
 244:	fed70fa3          	sb	a3,-1(a4)
 248:	00158593          	addi	a1,a1,1
 24c:	fc079ae3          	bnez	a5,220 <memcpy+0xf4>
 250:	f01ff06f          	j	150 <memcpy+0x24>

00000254 <memset>:
 254:	00f00313          	li	t1,15
 258:	00050713          	mv	a4,a0
 25c:	02c37e63          	bgeu	t1,a2,298 <memset+0x44>
 260:	00f77793          	andi	a5,a4,15
 264:	0a079063          	bnez	a5,304 <memset+0xb0>
 268:	08059263          	bnez	a1,2ec <memset+0x98>
 26c:	ff067693          	andi	a3,a2,-16
 270:	00f67613          	andi	a2,a2,15
 274:	00e686b3          	add	a3,a3,a4
 278:	00b72023          	sw	a1,0(a4)
 27c:	00b72223          	sw	a1,4(a4)
 280:	00b72423          	sw	a1,8(a4)
 284:	00b72623          	sw	a1,12(a4)
 288:	01070713          	addi	a4,a4,16
 28c:	fed766e3          	bltu	a4,a3,278 <memset+0x24>
 290:	00061463          	bnez	a2,298 <memset+0x44>
 294:	00008067          	ret
 298:	40c306b3          	sub	a3,t1,a2
 29c:	00269693          	slli	a3,a3,0x2
 2a0:	00000297          	auipc	t0,0x0
 2a4:	005686b3          	add	a3,a3,t0
 2a8:	00c68067          	jr	12(a3)
 2ac:	00b70723          	sb	a1,14(a4)
 2b0:	00b706a3          	sb	a1,13(a4)
 2b4:	00b70623          	sb	a1,12(a4)
 2b8:	00b705a3          	sb	a1,11(a4)
 2bc:	00b70523          	sb	a1,10(a4)
 2c0:	00b704a3          	sb	a1,9(a4)
 2c4:	00b70423          	sb	a1,8(a4)
 2c8:	00b703a3          	sb	a1,7(a4)
 2cc:	00b70323          	sb	a1,6(a4)
 2d0:	00b702a3          	sb	a1,5(a4)
 2d4:	00b70223          	sb	a1,4(a4)
 2d8:	00b701a3          	sb	a1,3(a4)
 2dc:	00b70123          	sb	a1,2(a4)
 2e0:	00b700a3          	sb	a1,1(a4)
 2e4:	00b70023          	sb	a1,0(a4)
 2e8:	00008067          	ret
 2ec:	0ff5f593          	zext.b	a1,a1
 2f0:	00859693          	slli	a3,a1,0x8
 2f4:	00d5e5b3          	or	a1,a1,a3
 2f8:	01059693          	slli	a3,a1,0x10
 2fc:	00d5e5b3          	or	a1,a1,a3
 300:	f6dff06f          	j	26c <memset+0x18>
 304:	00279693          	slli	a3,a5,0x2
 308:	00000297          	auipc	t0,0x0
 30c:	005686b3          	add	a3,a3,t0
 310:	00008293          	mv	t0,ra
 314:	fa0680e7          	jalr	-96(a3)
 318:	00028093          	mv	ra,t0
 31c:	ff078793          	addi	a5,a5,-16
 320:	40f70733          	sub	a4,a4,a5
 324:	00f60633          	add	a2,a2,a5
 328:	f6c378e3          	bgeu	t1,a2,298 <memset+0x44>
 32c:	f3dff06f          	j	268 <memset+0x14>
