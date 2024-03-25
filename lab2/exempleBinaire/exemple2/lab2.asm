
lab2.elf:     format de fichier elf32-littleriscv


Déassemblage de la section .init :

00000004 <_enter>:
   4:	80002197          	auipc	gp,0x80002
   8:	ffc18193          	addi	gp,gp,-4 # 80002000 <__global_pointer$+0x0>
   c:	80000117          	auipc	sp,0x80000
  10:	40410113          	addi	sp,sp,1028 # 80000410 <__global_pointer$+0xffffe410>
  14:	0040006f          	j	18 <__init_array_end>

Déassemblage de la section .text :

00000018 <main>:
  18:	fe010113          	addi	sp,sp,-32
  1c:	00812c23          	sw	s0,24(sp)
  20:	06400793          	li	a5,100
  24:	80000437          	lui	s0,0x80000
  28:	00112e23          	sw	ra,28(sp)
  2c:	00f42023          	sw	a5,0(s0) # 80000000 <__global_pointer$+0xffffe000>
  30:	00000013          	nop
  34:	038000ef          	jal	ra,6c <func>
  38:	00a00693          	li	a3,10
  3c:	00a12623          	sw	a0,12(sp)
  40:	00000793          	li	a5,0
  44:	00c12703          	lw	a4,12(sp)
  48:	00f70733          	add	a4,a4,a5
  4c:	00e12623          	sw	a4,12(sp)
  50:	00c12703          	lw	a4,12(sp)
  54:	00042603          	lw	a2,0(s0)
  58:	00178793          	addi	a5,a5,1
  5c:	00c70733          	add	a4,a4,a2
  60:	00e42023          	sw	a4,0(s0)
  64:	fed790e3          	bne	a5,a3,44 <main+0x2c>
  68:	fd5ff06f          	j	3c <main+0x24>

0000006c <func>:
  6c:	01000513          	li	a0,16
  70:	00008067          	ret

00000074 <_start>:
  74:	800007b7          	lui	a5,0x80000
  78:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  7c:	800007b7          	lui	a5,0x80000
  80:	0047a603          	lw	a2,4(a5) # 80000004 <__global_pointer$+0xffffe004>
  84:	ff010113          	addi	sp,sp,-16
  88:	00000593          	li	a1,0
  8c:	40a60633          	sub	a2,a2,a0
  90:	00112623          	sw	ra,12(sp)
  94:	00812423          	sw	s0,8(sp)
  98:	00912223          	sw	s1,4(sp)
  9c:	01212023          	sw	s2,0(sp)
  a0:	190000ef          	jal	ra,230 <memset>
  a4:	800007b7          	lui	a5,0x80000
  a8:	0007a503          	lw	a0,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  ac:	800007b7          	lui	a5,0x80000
  b0:	0007a603          	lw	a2,0(a5) # 80000000 <__global_pointer$+0xffffe000>
  b4:	31002583          	lw	a1,784(zero) # 310 <metal_segment_data_source_start>
  b8:	40a60633          	sub	a2,a2,a0
  bc:	04c000ef          	jal	ra,108 <memcpy>
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

00000108 <memcpy>:
 108:	00b547b3          	xor	a5,a0,a1
 10c:	0037f793          	andi	a5,a5,3
 110:	00c508b3          	add	a7,a0,a2
 114:	06079663          	bnez	a5,180 <memcpy+0x78>
 118:	00300793          	li	a5,3
 11c:	06c7f263          	bgeu	a5,a2,180 <memcpy+0x78>
 120:	00357793          	andi	a5,a0,3
 124:	00050713          	mv	a4,a0
 128:	0c079a63          	bnez	a5,1fc <memcpy+0xf4>
 12c:	ffc8f613          	andi	a2,a7,-4
 130:	40e606b3          	sub	a3,a2,a4
 134:	02000793          	li	a5,32
 138:	02000293          	li	t0,32
 13c:	06d7c263          	blt	a5,a3,1a0 <memcpy+0x98>
 140:	00058693          	mv	a3,a1
 144:	00070793          	mv	a5,a4
 148:	02c77863          	bgeu	a4,a2,178 <memcpy+0x70>
 14c:	0006a803          	lw	a6,0(a3)
 150:	00478793          	addi	a5,a5,4
 154:	00468693          	addi	a3,a3,4
 158:	ff07ae23          	sw	a6,-4(a5)
 15c:	fec7e8e3          	bltu	a5,a2,14c <memcpy+0x44>
 160:	fff60793          	addi	a5,a2,-1
 164:	40e787b3          	sub	a5,a5,a4
 168:	ffc7f793          	andi	a5,a5,-4
 16c:	00478793          	addi	a5,a5,4
 170:	00f70733          	add	a4,a4,a5
 174:	00f585b3          	add	a1,a1,a5
 178:	01176863          	bltu	a4,a7,188 <memcpy+0x80>
 17c:	00008067          	ret
 180:	00050713          	mv	a4,a0
 184:	ff157ce3          	bgeu	a0,a7,17c <memcpy+0x74>
 188:	0005c783          	lbu	a5,0(a1)
 18c:	00170713          	addi	a4,a4,1
 190:	00158593          	addi	a1,a1,1
 194:	fef70fa3          	sb	a5,-1(a4)
 198:	ff1768e3          	bltu	a4,a7,188 <memcpy+0x80>
 19c:	00008067          	ret
 1a0:	0045a683          	lw	a3,4(a1)
 1a4:	01c5a783          	lw	a5,28(a1)
 1a8:	0005af83          	lw	t6,0(a1)
 1ac:	0085af03          	lw	t5,8(a1)
 1b0:	00c5ae83          	lw	t4,12(a1)
 1b4:	0105ae03          	lw	t3,16(a1)
 1b8:	0145a303          	lw	t1,20(a1)
 1bc:	0185a803          	lw	a6,24(a1)
 1c0:	00d72223          	sw	a3,4(a4)
 1c4:	0205a683          	lw	a3,32(a1)
 1c8:	01f72023          	sw	t6,0(a4)
 1cc:	01e72423          	sw	t5,8(a4)
 1d0:	01d72623          	sw	t4,12(a4)
 1d4:	01c72823          	sw	t3,16(a4)
 1d8:	00672a23          	sw	t1,20(a4)
 1dc:	01072c23          	sw	a6,24(a4)
 1e0:	00f72e23          	sw	a5,28(a4)
 1e4:	02470713          	addi	a4,a4,36
 1e8:	40e607b3          	sub	a5,a2,a4
 1ec:	fed72e23          	sw	a3,-4(a4)
 1f0:	02458593          	addi	a1,a1,36
 1f4:	faf2c6e3          	blt	t0,a5,1a0 <memcpy+0x98>
 1f8:	f49ff06f          	j	140 <memcpy+0x38>
 1fc:	0005c683          	lbu	a3,0(a1)
 200:	00170713          	addi	a4,a4,1
 204:	00377793          	andi	a5,a4,3
 208:	fed70fa3          	sb	a3,-1(a4)
 20c:	00158593          	addi	a1,a1,1
 210:	f0078ee3          	beqz	a5,12c <memcpy+0x24>
 214:	0005c683          	lbu	a3,0(a1)
 218:	00170713          	addi	a4,a4,1
 21c:	00377793          	andi	a5,a4,3
 220:	fed70fa3          	sb	a3,-1(a4)
 224:	00158593          	addi	a1,a1,1
 228:	fc079ae3          	bnez	a5,1fc <memcpy+0xf4>
 22c:	f01ff06f          	j	12c <memcpy+0x24>

00000230 <memset>:
 230:	00f00313          	li	t1,15
 234:	00050713          	mv	a4,a0
 238:	02c37e63          	bgeu	t1,a2,274 <memset+0x44>
 23c:	00f77793          	andi	a5,a4,15
 240:	0a079063          	bnez	a5,2e0 <memset+0xb0>
 244:	08059263          	bnez	a1,2c8 <memset+0x98>
 248:	ff067693          	andi	a3,a2,-16
 24c:	00f67613          	andi	a2,a2,15
 250:	00e686b3          	add	a3,a3,a4
 254:	00b72023          	sw	a1,0(a4)
 258:	00b72223          	sw	a1,4(a4)
 25c:	00b72423          	sw	a1,8(a4)
 260:	00b72623          	sw	a1,12(a4)
 264:	01070713          	addi	a4,a4,16
 268:	fed766e3          	bltu	a4,a3,254 <memset+0x24>
 26c:	00061463          	bnez	a2,274 <memset+0x44>
 270:	00008067          	ret
 274:	40c306b3          	sub	a3,t1,a2
 278:	00269693          	slli	a3,a3,0x2
 27c:	00000297          	auipc	t0,0x0
 280:	005686b3          	add	a3,a3,t0
 284:	00c68067          	jr	12(a3)
 288:	00b70723          	sb	a1,14(a4)
 28c:	00b706a3          	sb	a1,13(a4)
 290:	00b70623          	sb	a1,12(a4)
 294:	00b705a3          	sb	a1,11(a4)
 298:	00b70523          	sb	a1,10(a4)
 29c:	00b704a3          	sb	a1,9(a4)
 2a0:	00b70423          	sb	a1,8(a4)
 2a4:	00b703a3          	sb	a1,7(a4)
 2a8:	00b70323          	sb	a1,6(a4)
 2ac:	00b702a3          	sb	a1,5(a4)
 2b0:	00b70223          	sb	a1,4(a4)
 2b4:	00b701a3          	sb	a1,3(a4)
 2b8:	00b70123          	sb	a1,2(a4)
 2bc:	00b700a3          	sb	a1,1(a4)
 2c0:	00b70023          	sb	a1,0(a4)
 2c4:	00008067          	ret
 2c8:	0ff5f593          	zext.b	a1,a1
 2cc:	00859693          	slli	a3,a1,0x8
 2d0:	00d5e5b3          	or	a1,a1,a3
 2d4:	01059693          	slli	a3,a1,0x10
 2d8:	00d5e5b3          	or	a1,a1,a3
 2dc:	f6dff06f          	j	248 <memset+0x18>
 2e0:	00279693          	slli	a3,a5,0x2
 2e4:	00000297          	auipc	t0,0x0
 2e8:	005686b3          	add	a3,a3,t0
 2ec:	00008293          	mv	t0,ra
 2f0:	fa0680e7          	jalr	-96(a3)
 2f4:	00028093          	mv	ra,t0
 2f8:	ff078793          	addi	a5,a5,-16
 2fc:	40f70733          	sub	a4,a4,a5
 300:	00f60633          	add	a2,a2,a5
 304:	f6c378e3          	bgeu	t1,a2,274 <memset+0x44>
 308:	f3dff06f          	j	244 <memset+0x14>
