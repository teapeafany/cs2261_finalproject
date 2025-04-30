	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"bossmovement.c"
	.text
	.align	2
	.global	initBoss
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, lr}
	mov	lr, #20
	mov	r4, #60
	stm	r0, {r1, r2}
	ldr	r2, [sp, #8]
	str	r4, [r0, #24]
	str	lr, [r0, #44]
	str	lr, [r0, #16]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	str	ip, [r0, #20]
	str	ip, [r0, #28]
	str	ip, [r0, #32]
	str	ip, [r0, #36]
	str	ip, [r0, #40]
	str	ip, [r0, #56]
	pop	{r4, lr}
	bx	lr
	.size	initBoss, .-initBoss
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	str	r3, [r0, #24]
	ble	.L42
.L5:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #32]
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #40]
	movle	r3, #0
	strle	r3, [r4, #36]
.L8:
	ldr	r3, [r4, #4]
	ldr	r0, [r5, #4]
	sub	r0, r0, r3
	mul	ip, r0, r0
	ldr	r1, [r5]
	ldr	r2, [r4]
	ldr	lr, [r4, #20]
	sub	r1, r1, r2
	mla	ip, r1, r1, ip
	cmp	lr, #3
	ldrls	pc, [pc, lr, asl #2]
	b	.L10
.L12:
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L11
.L13:
	ldr	lr, [r4, #28]
	cmp	lr, #0
	movle	r5, #1
	movgt	r5, #0
	cmp	ip, #400
	movle	r5, #0
	cmp	r5, #0
	subeq	lr, lr, #1
	streq	lr, [r4, #28]
	beq	.L10
	cmp	r1, #0
	movgt	ip, #3
	bgt	.L24
	mvnne	ip, #2
	moveq	ip, #0
.L24:
	cmp	r0, #0
	movgt	r0, #3
	bgt	.L25
	mvnne	r0, #2
	moveq	r0, #0
.L25:
	mov	r1, #15
	add	r2, r2, ip
	add	r3, r3, r0
	stm	r4, {r2, r3}
	str	r1, [r4, #28]
.L10:
	cmp	r2, #0
	movlt	r1, #0
	strlt	r1, [r4]
	movlt	r2, r1
	cmp	r3, #0
	movlt	r1, #0
	movlt	r3, r1
	strlt	r1, [r4, #4]
	ldr	r1, [r4, #8]
	add	r2, r1, r2
	cmp	r2, #256
	ldr	r2, [r4, #12]
	rsbgt	r1, r1, #256
	add	r3, r2, r3
	strgt	r1, [r4]
	cmp	r3, #256
	rsbgt	r2, r2, #256
	strgt	r2, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	cmp	ip, #900
	bge	.L10
	cmp	r1, #0
	mvngt	r1, #0
	lsrle	r1, r1, #31
	cmp	r0, #0
	mvngt	r0, #0
	lsrle	r0, r0, #31
	add	r2, r2, r1
	add	r3, r3, r0
	stm	r4, {r2, r3}
	b	.L10
.L14:
	ldr	r6, .L46
	sub	r5, ip, #900
	sub	r5, r5, #1
	cmp	r5, r6
	bls	.L43
	ldr	r5, .L46+4
	cmp	ip, r5
	ble	.L10
	cmp	r1, #0
	movgt	r1, lr
	ble	.L44
.L21:
	cmp	r0, #0
	ble	.L45
.L22:
	add	r2, r2, r1
	add	r3, r3, lr
	stm	r4, {r2, r3}
	b	.L10
.L15:
	cmp	ip, #25
	ble	.L10
	cmp	r1, #0
	movgt	ip, #1
	bgt	.L16
	mvnne	ip, #0
	moveq	ip, #0
.L16:
	cmp	r0, #0
	movgt	r1, #1
	bgt	.L17
	mvnne	r1, #0
	moveq	r1, #0
.L17:
	add	r2, r2, ip
	add	r3, r3, r1
	stm	r4, {r2, r3}
	b	.L10
.L42:
	ldr	r6, .L46+8
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	str	r0, [r4, #20]
	mov	lr, pc
	bx	r6
	ldr	r2, .L46+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #60
	str	r0, [r4, #24]
	b	.L5
.L43:
	cmp	r0, #0
	movgt	r0, lr
	mvnle	r0, #0
	cmp	r1, #0
	mvngt	lr, #0
	add	r2, r2, r0
	add	r3, r3, lr
	stm	r4, {r2, r3}
	b	.L10
.L44:
	mvnne	r1, #0
	moveq	r1, #0
	b	.L21
.L45:
	mvnne	lr, #0
	moveq	lr, #0
	b	.L22
.L47:
	.align	2
.L46:
	.word	1598
	.word	2500
	.word	rand
	.word	-2004318071
	.size	updateBoss, .-updateBoss
	.align	2
	.global	checkBossCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBossCollision, %function
checkBossCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #56]
	sub	r3, r3, #1
	cmp	r3, #1
	bls	.L55
	mov	r0, #0
	bx	lr
.L55:
	mov	ip, r1
	push	{r4, lr}
	add	r1, r0, #8
	ldm	r1, {r1, lr}
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	sub	sp, sp, #16
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, ip, #16
	ldm	r2, {r2, r3}
	ldm	ip, {r0, r1}
	ldr	r4, .L56
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	collision
	.size	checkBossCollision, .-checkBossCollision
	.ident	"GCC: (devkitARM release 53) 9.1.0"
