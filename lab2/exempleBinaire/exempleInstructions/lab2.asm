
lab2.elf:     format de fichier elf32-littleriscv


Déassemblage de la section .init :

00000004 <_enter>:
   4:	00218233          	add	tp,gp,sp
   8:	403604b3          	sub	s1,a2,gp
   c:	003140b3          	xor	ra,sp,gp
  10:	0041e133          	or	sp,gp,tp
  14:	00c5f533          	and	a0,a1,a2
  18:	00f716b3          	sll	a3,a4,a5
  1c:	0051d133          	srl	sp,gp,t0
  20:	4080d2b3          	sra	t0,ra,s0
  24:	00a4a433          	slt	s0,s1,a0
  28:	00523133          	sltu	sp,tp,t0
  2c:	12310093          	addi	ra,sp,291
  30:	03424113          	xori	sp,tp,52
  34:	04526093          	ori	ra,tp,69
  38:	0094f113          	andi	sp,s1,9
  3c:	00621193          	slli	gp,tp,0x6
  40:	00235293          	srli	t0,t1,0x2
  44:	40515093          	srai	ra,sp,0x5
  48:	0041a113          	slti	sp,gp,4
  4c:	00233193          	sltiu	gp,t1,2
  50:	00228083          	lb	ra,2(t0)
  54:	00439103          	lh	sp,4(t2)
  58:	00a42203          	lw	tp,10(s0)
  5c:	0022c083          	lbu	ra,2(t0)
  60:	0043d103          	lhu	sp,4(t2)
  64:	00128123          	sb	ra,2(t0)
  68:	00239223          	sh	sp,4(t2)
  6c:	00442523          	sw	tp,10(s0)
  70:	00209463          	bne	ra,sp,78 <_enter+0x74>
  74:	04c0006f          	j	c0 <__init_array_end>
  78:	00310463          	beq	sp,gp,80 <_enter+0x7c>
  7c:	0440006f          	j	c0 <__init_array_end>
  80:	00315463          	bge	sp,gp,88 <_enter+0x84>
  84:	03c0006f          	j	c0 <__init_array_end>
  88:	00314463          	blt	sp,gp,90 <_enter+0x8c>
  8c:	0340006f          	j	c0 <__init_array_end>
  90:	00317463          	bgeu	sp,gp,98 <_enter+0x94>
  94:	02c0006f          	j	c0 <__init_array_end>
  98:	00316463          	bltu	sp,gp,a0 <_enter+0x9c>
  9c:	0240006f          	j	c0 <__init_array_end>
  a0:	020000ef          	jal	ra,c0 <__init_array_end>
  a4:	00008067          	ret
  a8:	80002197          	auipc	gp,0x80002
  ac:	f5818193          	addi	gp,gp,-168 # 80002000 <__global_pointer$+0x0>
  b0:	80000117          	auipc	sp,0x80000
  b4:	35010113          	addi	sp,sp,848 # 80000400 <__global_pointer$+0xffffe400>
  b8:	0080006f          	j	c0 <__init_array_end>

Déassemblage de la section .text :

000000c0 <main>:
  c0:	fe010113          	addi	sp,sp,-32
  c4:	00500513          	li	a0,5
  c8:	00112e23          	sw	ra,28(sp)
  cc:	00c000ef          	jal	ra,d8 <facto>
  d0:	00a12623          	sw	a0,12(sp)
  d4:	0000006f          	j	d4 <main+0x14>

000000d8 <facto>:
  d8:	ff010113          	addi	sp,sp,-16
  dc:	00912223          	sw	s1,4(sp)
  e0:	00050593          	mv	a1,a0
  e4:	00112623          	sw	ra,12(sp)
  e8:	00812423          	sw	s0,8(sp)
  ec:	00100513          	li	a0,1
  f0:	00100493          	li	s1,1
  f4:	00958a63          	beq	a1,s1,108 <facto+0x30>
  f8:	fff58413          	addi	s0,a1,-1
  fc:	0b4000ef          	jal	ra,1b0 <__mulsi3>
 100:	00040593          	mv	a1,s0
 104:	ff1ff06f          	j	f4 <facto+0x1c>
 108:	00c12083          	lw	ra,12(sp)
 10c:	00812403          	lw	s0,8(sp)
 110:	00412483          	lw	s1,4(sp)
 114:	01010113          	addi	sp,sp,16
 118:	00008067          	ret

0000011c <_start>:
 11c:	800007b7          	lui	a5,0x80000
 120:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
 124:	800007b7          	lui	a5,0x80000
 128:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
 12c:	ff010113          	addi	sp,sp,-16
 130:	00000593          	li	a1,0
 134:	40a60633          	sub	a2,a2,a0
 138:	00112623          	sw	ra,12(sp)
 13c:	00812423          	sw	s0,8(sp)
 140:	00912223          	sw	s1,4(sp)
 144:	01212023          	sw	s2,0(sp)
 148:	1b4000ef          	jal	ra,2fc <memset>
 14c:	800007b7          	lui	a5,0x80000
 150:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
 154:	800007b7          	lui	a5,0x80000
 158:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
 15c:	3d802583          	lw	a1,984(zero) # 3d8 <metal_segment_data_source_start>
 160:	40a60633          	sub	a2,a2,a0
 164:	070000ef          	jal	ra,1d4 <memcpy>
 168:	0c000413          	li	s0,192
 16c:	0c000793          	li	a5,192
 170:	40f40433          	sub	s0,s0,a5
 174:	40245413          	srai	s0,s0,0x2
 178:	00245413          	srli	s0,s0,0x2
 17c:	0c000493          	li	s1,192
 180:	00000913          	li	s2,0
 184:	01241863          	bne	s0,s2,194 <_start+0x78>
 188:	f39ff0ef          	jal	ra,c0 <main>
 18c:	10500073          	wfi
 190:	ffdff06f          	j	18c <_start+0x70>
 194:	0004a783          	lw	a5,0(s1)
 198:	00190913          	addi	s2,s2,1
 19c:	00448493          	addi	s1,s1,4
 1a0:	000780e7          	jalr	a5
 1a4:	fe1ff06f          	j	184 <_start+0x68>

000001a8 <_Exit>:
 1a8:	10500073          	wfi
 1ac:	ffdff06f          	j	1a8 <_Exit>

000001b0 <__mulsi3>:
 1b0:	00050613          	mv	a2,a0
 1b4:	00000513          	li	a0,0
 1b8:	0015f693          	andi	a3,a1,1
 1bc:	00068463          	beqz	a3,1c4 <__mulsi3+0x14>
 1c0:	00c50533          	add	a0,a0,a2
 1c4:	0015d593          	srli	a1,a1,0x1
 1c8:	00161613          	slli	a2,a2,0x1
 1cc:	fe0596e3          	bnez	a1,1b8 <__mulsi3+0x8>
 1d0:	00008067          	ret

000001d4 <memcpy>:
 1d4:	00b547b3          	xor	a5,a0,a1
 1d8:	0037f793          	andi	a5,a5,3
 1dc:	00c508b3          	add	a7,a0,a2
 1e0:	06079663          	bnez	a5,24c <memcpy+0x78>
 1e4:	00300793          	li	a5,3
 1e8:	06c7f263          	bgeu	a5,a2,24c <memcpy+0x78>
 1ec:	00357793          	andi	a5,a0,3
 1f0:	00050713          	mv	a4,a0
 1f4:	0c079a63          	bnez	a5,2c8 <memcpy+0xf4>
 1f8:	ffc8f613          	andi	a2,a7,-4
 1fc:	40e606b3          	sub	a3,a2,a4
 200:	02000793          	li	a5,32
 204:	02000293          	li	t0,32
 208:	06d7c263          	blt	a5,a3,26c <memcpy+0x98>
 20c:	00058693          	mv	a3,a1
 210:	00070793          	mv	a5,a4
 214:	02c77863          	bgeu	a4,a2,244 <memcpy+0x70>
 218:	0006a803          	lw	a6,0(a3)
 21c:	00478793          	addi	a5,a5,4
 220:	00468693          	addi	a3,a3,4
 224:	ff07ae23          	sw	a6,-4(a5)
 228:	fec7e8e3          	bltu	a5,a2,218 <memcpy+0x44>
 22c:	fff60793          	addi	a5,a2,-1
 230:	40e787b3          	sub	a5,a5,a4
 234:	ffc7f793          	andi	a5,a5,-4
 238:	00478793          	addi	a5,a5,4
 23c:	00f70733          	add	a4,a4,a5
 240:	00f585b3          	add	a1,a1,a5
 244:	01176863          	bltu	a4,a7,254 <memcpy+0x80>
 248:	00008067          	ret
 24c:	00050713          	mv	a4,a0
 250:	ff157ce3          	bgeu	a0,a7,248 <memcpy+0x74>
 254:	0005c783          	lbu	a5,0(a1)
 258:	00170713          	addi	a4,a4,1
 25c:	00158593          	addi	a1,a1,1
 260:	fef70fa3          	sb	a5,-1(a4)
 264:	ff1768e3          	bltu	a4,a7,254 <memcpy+0x80>
 268:	00008067          	ret
 26c:	0045a683          	lw	a3,4(a1)
 270:	01c5a783          	lw	a5,28(a1)
 274:	0005af83          	lw	t6,0(a1)
 278:	0085af03          	lw	t5,8(a1)
 27c:	00c5ae83          	lw	t4,12(a1)
 280:	0105ae03          	lw	t3,16(a1)
 284:	0145a303          	lw	t1,20(a1)
 288:	0185a803          	lw	a6,24(a1)
 28c:	00d72223          	sw	a3,4(a4)
 290:	0205a683          	lw	a3,32(a1)
 294:	01f72023          	sw	t6,0(a4)
 298:	01e72423          	sw	t5,8(a4)
 29c:	01d72623          	sw	t4,12(a4)
 2a0:	01c72823          	sw	t3,16(a4)
 2a4:	00672a23          	sw	t1,20(a4)
 2a8:	01072c23          	sw	a6,24(a4)
 2ac:	00f72e23          	sw	a5,28(a4)
 2b0:	02470713          	addi	a4,a4,36
 2b4:	40e607b3          	sub	a5,a2,a4
 2b8:	fed72e23          	sw	a3,-4(a4)
 2bc:	02458593          	addi	a1,a1,36
 2c0:	faf2c6e3          	blt	t0,a5,26c <memcpy+0x98>
 2c4:	f49ff06f          	j	20c <memcpy+0x38>
 2c8:	0005c683          	lbu	a3,0(a1)
 2cc:	00170713          	addi	a4,a4,1
 2d0:	00377793          	andi	a5,a4,3
 2d4:	fed70fa3          	sb	a3,-1(a4)
 2d8:	00158593          	addi	a1,a1,1
 2dc:	f0078ee3          	beqz	a5,1f8 <memcpy+0x24>
 2e0:	0005c683          	lbu	a3,0(a1)
 2e4:	00170713          	addi	a4,a4,1
 2e8:	00377793          	andi	a5,a4,3
 2ec:	fed70fa3          	sb	a3,-1(a4)
 2f0:	00158593          	addi	a1,a1,1
 2f4:	fc079ae3          	bnez	a5,2c8 <memcpy+0xf4>
 2f8:	f01ff06f          	j	1f8 <memcpy+0x24>

000002fc <memset>:
 2fc:	00f00313          	li	t1,15
 300:	00050713          	mv	a4,a0
 304:	02c37e63          	bgeu	t1,a2,340 <memset+0x44>
 308:	00f77793          	andi	a5,a4,15
 30c:	0a079063          	bnez	a5,3ac <memset+0xb0>
 310:	08059263          	bnez	a1,394 <memset+0x98>
 314:	ff067693          	andi	a3,a2,-16
 318:	00f67613          	andi	a2,a2,15
 31c:	00e686b3          	add	a3,a3,a4
 320:	00b72023          	sw	a1,0(a4)
 324:	00b72223          	sw	a1,4(a4)
 328:	00b72423          	sw	a1,8(a4)
 32c:	00b72623          	sw	a1,12(a4)
 330:	01070713          	addi	a4,a4,16
 334:	fed766e3          	bltu	a4,a3,320 <memset+0x24>
 338:	00061463          	bnez	a2,340 <memset+0x44>
 33c:	00008067          	ret
 340:	40c306b3          	sub	a3,t1,a2
 344:	00269693          	slli	a3,a3,0x2
 348:	00000297          	auipc	t0,0x0
 34c:	005686b3          	add	a3,a3,t0
 350:	00c68067          	jr	12(a3)
 354:	00b70723          	sb	a1,14(a4)
 358:	00b706a3          	sb	a1,13(a4)
 35c:	00b70623          	sb	a1,12(a4)
 360:	00b705a3          	sb	a1,11(a4)
 364:	00b70523          	sb	a1,10(a4)
 368:	00b704a3          	sb	a1,9(a4)
 36c:	00b70423          	sb	a1,8(a4)
 370:	00b703a3          	sb	a1,7(a4)
 374:	00b70323          	sb	a1,6(a4)
 378:	00b702a3          	sb	a1,5(a4)
 37c:	00b70223          	sb	a1,4(a4)
 380:	00b701a3          	sb	a1,3(a4)
 384:	00b70123          	sb	a1,2(a4)
 388:	00b700a3          	sb	a1,1(a4)
 38c:	00b70023          	sb	a1,0(a4)
 390:	00008067          	ret
 394:	0ff5f593          	zext.b	a1,a1
 398:	00859693          	slli	a3,a1,0x8
 39c:	00d5e5b3          	or	a1,a1,a3
 3a0:	01059693          	slli	a3,a1,0x10
 3a4:	00d5e5b3          	or	a1,a1,a3
 3a8:	f6dff06f          	j	314 <memset+0x18>
 3ac:	00279693          	slli	a3,a5,0x2
 3b0:	00000297          	auipc	t0,0x0
 3b4:	005686b3          	add	a3,a3,t0
 3b8:	00008293          	mv	t0,ra
 3bc:	fa0680e7          	jalr	-96(a3)
 3c0:	00028093          	mv	ra,t0
 3c4:	ff078793          	addi	a5,a5,-16
 3c8:	40f70733          	sub	a4,a4,a5
 3cc:	00f60633          	add	a2,a2,a5
 3d0:	f6c378e3          	bgeu	t1,a2,340 <memset+0x44>
 3d4:	f3dff06f          	j	310 <memset+0x14>
