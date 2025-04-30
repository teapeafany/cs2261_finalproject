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
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L5
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L5
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L15
	mov	r0, #67108864
	ldr	r1, .L17+8
	str	r2, [r3, #8]
	str	r2, [r0, #196]
	strh	r2, [r1, #2]	@ movhi
.L5:
	ldr	r3, .L17+12
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L16
	mov	r0, #67108864
	ldr	r1, .L17+8
	str	r2, [r3, #8]
	str	r2, [r0, #208]
	strh	r2, [r1, #6]	@ movhi
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	mov	r2, #1
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	mov	r2, #1
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlower.part.0, %function
drawFlower.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L23
	ldr	r3, [r0, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	add	r2, r3, #16
	cmp	r2, #255
	ldr	r2, [r0, #16]
	bhi	.L20
	ldr	ip, .L23+4
	ldr	r1, [r0]
	ldr	ip, [ip]
	sub	r1, r1, ip
	add	ip, r1, #32
	cmp	ip, #191
	bhi	.L20
	and	r1, r1, #255
	mvn	r1, r1, lsl #17
	ldr	ip, [r0, #24]
	ldr	r0, .L23+8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmp	ip, #0
	lsl	ip, r2, #3
	add	r2, r0, r2, lsl #3
	strh	r3, [r2, #2]	@ movhi
	mvn	r1, r1, lsr #17
	movne	r3, #13248
	moveq	r3, #9152
	strh	r1, [r0, ip]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L20:
	mov	r1, #512
	ldr	r3, .L23+8
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawFlower.part.0, .-drawFlower.part.0
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #4864
	mov	r0, #4224
	ldr	r2, .L27+4
	ldr	r5, .L27+8
	ldr	r4, .L27+12
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #22528
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #22528
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L27+36
	ldr	r1, .L27+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L27+44
	ldr	r1, .L27+48
	mov	lr, pc
	bx	r4
	mov	r4, #16
	mov	lr, #64
	mov	ip, #40
	ldr	r3, .L27+52
	ldr	r2, .L27+56
	str	r4, [r3, #16]
	ldr	r1, [r2]
	ldr	r4, .L27+60
	mov	r2, #1
	ldr	r0, .L27+64
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	ip, [r3]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L27+68
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	hideSprites
	.word	2178
	.word	parallaxtilesetTiles
	.word	DMANow
	.word	parallaxtilesetPal
	.word	100679680
	.word	bubbleMap
	.word	100696064
	.word	cloudsMap
	.word	100728832
	.word	myspritesheetTiles
	.word	83886592
	.word	myspritesheetPal
	.word	startsprite
	.word	surge_length
	.word	playSoundA
	.word	surge_data
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	mov	r4, #97
	mov	lr, #1
	mov	r2, #67108864
	mov	r0, #8
	mov	r1, #0
	ldr	r3, .L31+4
	ldr	ip, .L31+8
	ldrh	ip, [ip, #48]
	strh	r4, [r3]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	ldr	lr, .L31+12
	ldr	r3, .L31+16
	strh	r0, [r2, #4]	@ movhi
	ldr	r0, .L31+20
	ldr	r2, .L31+24
	str	lr, [r3, #4092]
	ldr	r3, .L31+28
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L32:
	.align	2
.L31:
	.word	setupSounds
	.word	67109376
	.word	67109120
	.word	interruptHandler
	.word	50360320
	.word	buttons
	.word	oldButtons
	.word	init
	.size	initialize, .-initialize
	.align	2
	.global	updatestart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatestart, %function
updatestart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L35
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r2, #99
	mov	r0, #67108864
	ldreq	r3, .L35+4
	ldr	ip, .L35+8
	strheq	r2, [r3, #2]	@ movhi
	ldr	r2, [ip]
	add	r2, r2, #1
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r1, r2, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	str	r2, [ip]
	strh	r1, [r0, #20]	@ movhi
	strh	r3, [r0, #16]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	buttons
	.word	100696732
	.word	hScroll
	.size	updatestart, .-updatestart
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .L39
	ldr	r7, .L39+4
	ldr	r6, .L39+8
	mov	r1, r7
	ldr	r4, .L39+12
	strh	r2, [r3]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r5, .L39+16
	mov	r0, r6
	mov	lr, pc
	bx	r5
	ldr	r3, .L39+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L39+24
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+28
	mov	lr, pc
	bx	r3
	mov	r1, r7
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, r6
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r3, .L39+32
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	1028
	.word	instructionsPal
	.word	instructionsBitmap
	.word	DMANow
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L48
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #5824
	mvn	r3, r3, lsr #18
	push	{r4, lr}
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r4, .L48+4
	ldr	r2, .L48+8
	strh	r3, [r4, #42]	@ movhi
	strh	r0, [r4, #40]	@ movhi
	strh	r1, [r4, #44]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L48+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToInstructions
.L49:
	.align	2
.L48:
	.word	startsprite
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L55
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L55+4
	ldr	r4, .L55+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+12
	ldr	r0, .L55+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L55+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+32
	ldr	r2, [r3]
	cmp	r2, #2
	beq	.L54
	cmp	r2, #3
	moveq	r1, #1
	ldreq	r2, .L55+36
	streq	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	mov	r1, #0
	ldr	r2, .L55+36
	str	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	1028
	.word	pausedPal
	.word	DMANow
	.word	drawFullscreenImage4
	.word	pausedBitmap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.word	prevState
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r2, #67108864
	ldr	r3, .L59
	ldr	r1, .L59+4
	push	{r4, lr}
	str	r0, [r3]
	ldr	r4, .L59+8
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L59+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+16
	ldr	r0, .L59+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L59+32
	mov	lr, pc
	bx	r4
	mov	r0, #2
	mov	r2, #5
	ldr	r1, .L59+36
	ldr	r3, .L59+40
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.word	1028
	.word	DMANow
	.word	winPal
	.word	drawFullscreenImage4
	.word	winBitmap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	prevState
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r2, #67108864
	ldr	r3, .L63
	ldr	r1, .L63+4
	push	{r4, lr}
	str	r0, [r3]
	ldr	r4, .L63+8
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L63+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+16
	ldr	r0, .L63+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L63+32
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L63+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.word	1028
	.word	DMANow
	.word	losePal
	.word	drawFullscreenImage4
	.word	loseBitmap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L72
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
	ldr	r3, .L72+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
.L65:
	pop	{r4, lr}
	bx	lr
.L71:
	pop	{r4, lr}
	b	goToStart
.L73:
	.align	2
.L72:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L79
	ldr	r3, [r5]
	mov	r2, #67108864
	mov	r1, #7296
	cmp	r3, #4
	mov	r3, #4352
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L79+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #32768
	mov	r2, #100663296
	ldr	r1, .L79+8
	sub	sp, sp, #12
	beq	.L78
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L79+12
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L79+24
	ldr	r1, .L79+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L79+32
	ldr	r1, .L79+36
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79+44
	mov	lr, pc
	bx	r4
	mov	r3, #3
	mov	r0, #10
	mov	r2, #0
	mov	r4, #64
	mov	r6, #32
	mov	lr, #1
	mov	r1, #100
	mov	r9, #30
	mov	r8, #14
	mov	r7, #16
	ldr	ip, .L79+48
	str	r3, [ip, #44]
	str	r0, [ip, #24]
	ldr	r3, .L79+52
	ldr	r0, .L79+56
	str	r4, [sp]
	str	r6, [ip, #20]
	str	r2, [ip, #28]
	str	r2, [ip, #40]
	str	r2, [ip, #32]
	str	r2, [r3]
	str	r2, [r0]
	mov	r3, r4
	ldr	r6, .L79+60
	mov	r2, #90
	ldr	r0, .L79+64
	str	r1, [ip, #48]
	str	r9, [ip]
	str	r8, [ip, #4]
	str	r7, [ip, #16]
	str	lr, [ip, #8]
	str	lr, [ip, #12]
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, #40
	mov	r1, #140
	str	r4, [sp]
	ldr	r0, .L79+68
	mov	lr, pc
	bx	r6
	mov	r3, #2
	str	r3, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L78:
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L79+12
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L79+24
	ldr	r1, .L79+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L79+32
	ldr	r1, .L79+36
	mov	lr, pc
	bx	r4
	mov	r3, #2
	str	r3, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	state
	.word	DMANow
	.word	tilesetsampleTiles
	.word	100720640
	.word	tilemapsampleMap
	.word	tilesetsamplePal
	.word	100728832
	.word	myspritesheetTiles
	.word	83886592
	.word	myspritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	player
	.word	hOff
	.word	vOff
	.word	initBoss
	.word	waterBoss
	.word	samuraiBoss
	.size	goToGame1, .-goToGame1
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L88
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L88+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L81:
	pop	{r4, lr}
	bx	lr
.L87:
	pop	{r4, lr}
	b	goToGame1
.L89:
	.align	2
.L88:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L97
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L97+4
	ldrh	r1, [r3]
	ldr	r3, .L97+8
	tst	r1, #8
	str	r2, [r3]
	beq	.L90
	ldr	r3, .L97+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L96
.L90:
	pop	{r4, lr}
	bx	lr
.L96:
	pop	{r4, lr}
	b	goToGame1
.L98:
	.align	2
.L97:
	.word	waitForVBlank
	.word	oldButtons
	.word	prevState
	.word	buttons
	.size	win, .-win
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L122
	push	{r4, r5, r6, lr}
	ldrh	lr, [r3]
	ldr	r3, .L122+4
	tst	lr, #64
	str	r2, [r3, #32]
	ldr	r1, [r3]
	ldr	ip, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #20]
	bne	.L100
	mov	r4, #1
	cmp	r2, #0
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #12]
	subgt	r2, r2, r4
	strgt	r2, [r3, #4]
.L100:
	ands	r4, lr, #128
	bne	.L101
	mov	r5, #1
	str	r4, [r3, #28]
	rsb	r4, r0, #256
	cmp	r4, r2
	ldrgt	r4, [r3, #12]
	addgt	r2, r2, r4
	str	r5, [r3, #32]
	strgt	r2, [r3, #4]
.L101:
	tst	lr, #32
	bne	.L102
	mov	r4, #1
	mov	r5, #2
	cmp	r1, #0
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #8]
	subgt	r1, r1, r4
	str	r5, [r3, #28]
	strgt	r1, [r3]
.L102:
	tst	lr, #16
	bne	.L103
	mov	r5, #3
	mov	r4, #1
	str	r5, [r3, #28]
	rsb	r5, ip, #256
	cmp	r5, r1
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #8]
	addgt	r1, r1, r4
	strgt	r1, [r3]
.L103:
	cmp	r1, #0
	movlt	r4, #0
	addge	r5, ip, r1
	movlt	r1, r4
	strlt	r4, [r3]
	movlt	r5, ip
	cmp	r2, #0
	movlt	r6, #0
	movlt	r4, r0
	movlt	r2, r6
	addge	r4, r0, r2
	strlt	r6, [r3, #4]
	cmp	r5, #256
	rsbgt	r1, ip, #256
	strgt	r1, [r3]
	rsb	ip, ip, #240
	cmp	r4, #256
	rsbgt	r2, r0, #256
	add	ip, ip, ip, lsr #31
	rsb	r0, r0, #160
	sub	r1, r1, ip, asr #1
	ldr	r4, .L122+8
	ldr	ip, .L122+12
	add	r0, r0, r0, lsr #31
	strgt	r2, [r3, #4]
	sub	r2, r2, r0, asr #1
	cmp	r1, #0
	str	r1, [r4]
	str	r2, [ip]
	blt	.L120
	cmp	r2, #0
	blt	.L121
	cmp	r1, #16
	movgt	r1, #16
	strgt	r1, [r4]
.L111:
	cmp	r2, #96
	movgt	r2, #96
	strgt	r2, [ip]
.L114:
	ldr	r2, .L122+16
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L99
	tst	lr, #2
	bne	.L99
	ldr	r1, [r3, #36]
	cmp	r1, #0
	bne	.L99
	mov	r0, #1
	ldr	r2, [r3, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r0, [r3, #36]
	strgt	r2, [r3, #24]
	bgt	.L99
	mov	r0, #5
	add	r2, r3, #40
	ldm	r2, {r2, ip}
	add	r2, r2, #1
	cmp	r2, ip
	str	r2, [r3, #40]
	str	r0, [r3, #24]
	strge	r1, [r3, #40]
	strge	r1, [r3, #36]
.L99:
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	mov	r2, #0
	cmp	r1, #16
	str	r2, [ip]
	movgt	r2, #16
	strgt	r2, [r4]
	b	.L114
.L120:
	mov	r1, #0
	cmp	r2, r1
	str	r1, [r4]
	strlt	r1, [ip]
	bge	.L111
	b	.L114
.L123:
	.align	2
.L122:
	.word	buttons
	.word	player
	.word	hOff
	.word	vOff
	.word	oldButtons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	ldr	r0, .L134
	ldr	r3, .L134+4
	push	{r4, r5, lr}
	ldr	r2, [r0, #4]
	ldrh	r5, [r3]
	ldr	r3, .L134+8
	ldr	lr, .L134+12
	sub	r2, r2, r5
	ldrh	r4, [r3]
	ldr	r1, .L134+16
	and	r2, r2, #255
	orr	r2, r2, lr
	strh	r2, [r1]	@ movhi
	ldr	r3, [r0]
	strh	r4, [ip, #16]	@ movhi
	strh	r5, [ip, #18]	@ movhi
	ldr	ip, .L134+20
	ldr	r5, .L134+24
	ldr	r2, [ip, #4]
	sub	r3, r3, r4
	lsl	r3, r3, #23
	ldr	r4, [r5]
	add	r2, r2, #1
	lsr	r3, r3, #23
	orr	r3, r3, lr
	cmp	r2, r4
	strh	r3, [r1, #2]	@ movhi
	str	r2, [ip, #4]
	ldr	r3, [r0, #40]
	blt	.L125
	mov	r4, #0
	ldr	r2, .L134+28
	add	lr, r3, #1
	smull	r3, r2, lr, r2
	asr	r3, lr, #31
	add	r2, r2, lr
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, lr, r3
	str	r3, [r0, #40]
	str	r4, [ip, #4]
.L125:
	ldr	r0, [r0, #28]
	cmp	r0, #0
	beq	.L126
	cmp	r0, #1
	moveq	r0, #64
	beq	.L126
	cmp	r0, #2
	moveq	r0, #128
	beq	.L126
	cmp	r0, #3
	movne	r0, #0
	moveq	r0, #192
.L126:
	ldr	r2, .L134+32
	smull	lr, ip, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, ip, asr #1
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2
	ldr	r2, .L134+36
	add	r3, r3, r0
	and	r3, r2, r3, lsl #1
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L135:
	.align	2
.L134:
	.word	player
	.word	vOff
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	-1840700269
	.word	1717986919
	.word	1022
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawstartsprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawstartsprite, %function
drawstartsprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L137
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #5824
	mvn	r3, r3, lsr #18
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r2, .L137+4
	strh	r3, [r2, #42]	@ movhi
	strh	r0, [r2, #40]	@ movhi
	strh	r1, [r2, #44]	@ movhi
	bx	lr
.L138:
	.align	2
.L137:
	.word	startsprite
	.word	shadowOAM
	.size	drawstartsprite, .-drawstartsprite
	.align	2
	.global	drawSamuraiBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSamuraiBoss, %function
drawSamuraiBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L150
	ldr	r4, .L150+4
	ldr	r2, [r2]
	ldr	r3, [r4]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r0, r3, lsl #17
	ldr	r2, .L150+8
	ldr	ip, [r2]
	ldr	r2, [r4, #4]
	sub	r2, r2, ip
	ldr	ip, [r4, #56]
	mvn	r0, r0, lsr #17
	cmp	ip, #0
	moveq	r3, #544
	ldr	r1, .L150+12
	strh	r0, [r1, #130]	@ movhi
	ldr	r0, .L150+16
	and	r2, r2, #255
	strh	r0, [r1, #132]	@ movhi
	strh	r2, [r1, #128]	@ movhi
	strheq	r3, [r1, #132]	@ movhi
	beq	.L141
	cmp	ip, #1
	beq	.L146
	cmp	ip, #2
	beq	.L147
	cmp	ip, #3
	beq	.L148
.L141:
	ldr	r3, [r4, #44]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #44]
	ble	.L149
	pop	{r4, lr}
	bx	lr
.L149:
	ldr	r3, .L150+20
	ldr	r3, [r3, #56]
	add	r3, r3, #1
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	ldr	r2, .L150+24
	str	r3, [r4, #56]
	mov	lr, pc
	bx	r2
	ldr	r2, .L150+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #20
	str	r0, [r4, #44]
	pop	{r4, lr}
	bx	lr
.L146:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, .L150+32
	orr	r2, r2, #16384
	strh	r3, [r1, #130]	@ movhi
	strh	r2, [r1, #128]	@ movhi
	strh	r0, [r1, #132]	@ movhi
	b	.L141
.L148:
	mvn	r3, r3, lsl #18
	mov	r0, #568
	mvn	r3, r3, lsr #18
	orr	r2, r2, #16384
	strh	r3, [r1, #130]	@ movhi
	strh	r2, [r1, #128]	@ movhi
	strh	r0, [r1, #132]	@ movhi
	b	.L141
.L147:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, .L150+36
	orr	r2, r2, #16384
	strh	r3, [r1, #130]	@ movhi
	strh	r2, [r1, #128]	@ movhi
	strh	r0, [r1, #132]	@ movhi
	b	.L141
.L151:
	.align	2
.L150:
	.word	hOff
	.word	samuraiBoss
	.word	vOff
	.word	shadowOAM
	.word	546
	.word	waterBoss
	.word	rand
	.word	-2078209981
	.word	550
	.word	559
	.size	drawSamuraiBoss, .-drawSamuraiBoss
	.align	2
	.global	drawWaterBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWaterBoss, %function
drawWaterBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L163
	ldr	r4, .L163+4
	ldr	r2, [r2]
	ldr	r3, [r4]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	ip, r3, lsl #17
	ldr	r2, .L163+8
	ldr	r0, [r2]
	ldr	r2, [r4, #4]
	sub	r2, r2, r0
	ldr	r0, [r4, #56]
	mvn	ip, ip, lsr #17
	cmp	r0, #0
	moveq	r3, #544
	ldr	r1, .L163+12
	strh	ip, [r1, #18]	@ movhi
	ldr	ip, .L163+16
	and	r2, r2, #255
	strh	ip, [r1, #20]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strheq	r3, [r1, #20]	@ movhi
	beq	.L154
	cmp	r0, #1
	beq	.L159
	cmp	r0, #2
	beq	.L160
	cmp	r0, #3
	beq	.L161
.L154:
	ldr	r3, [r4, #44]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #44]
	ble	.L162
	pop	{r4, lr}
	bx	lr
.L162:
	add	r0, r0, #1
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	ldr	r3, .L163+20
	str	r0, [r4, #56]
	mov	lr, pc
	bx	r3
	ldr	r2, .L163+24
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #20
	str	r0, [r4, #44]
	pop	{r4, lr}
	bx	lr
.L159:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	ip, .L163+28
	orr	r2, r2, #16384
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	b	.L154
.L161:
	mvn	r3, r3, lsl #18
	mov	ip, #568
	mvn	r3, r3, lsr #18
	orr	r2, r2, #16384
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	b	.L154
.L160:
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	ip, .L163+32
	orr	r2, r2, #16384
	strh	r3, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	b	.L154
.L164:
	.align	2
.L163:
	.word	hOff
	.word	waterBoss
	.word	vOff
	.word	shadowOAM
	.word	546
	.word	rand
	.word	-2078209981
	.word	550
	.word	559
	.size	drawWaterBoss, .-drawWaterBoss
	.align	2
	.global	drawFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlower, %function
drawFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #8]
	cmp	r2, #0
	bne	drawFlower.part.0
.L166:
	mov	r1, #512
	ldr	r3, [r0, #16]
	ldr	r2, .L167
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L168:
	.align	2
.L167:
	.word	shadowOAM
	.size	drawFlower, .-drawFlower
	.align	2
	.global	playAnalogSoundEffect
	.syntax unified
	.arm
	.fpu softvfp
	.type	playAnalogSoundEffect, %function
playAnalogSoundEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L171
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	playAnalogSound
	.size	playAnalogSoundEffect, .-playAnalogSoundEffect
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L175
	ldr	r2, .L175+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L175+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L176:
	.align	2
.L175:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	initFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlowers, %function
initFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #8
	mov	r0, #16
	ldr	r3, .L181
	add	r1, r3, #360
.L178:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L178
	bx	lr
.L182:
	.align	2
.L181:
	.word	flowers
	.size	initFlowers, .-initFlowers
	.align	2
	.global	spawnRandomFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnRandomFlower, %function
spawnRandomFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L190
	mov	lr, pc
	bx	r5
	mov	r4, r0
	mov	lr, pc
	bx	r5
	ldr	ip, .L190+4
	mov	r3, #0
	mov	r2, ip
.L186:
	ldr	r1, [r2, #8]
	cmp	r1, #0
	beq	.L189
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #36
	bne	.L186
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L189:
	mov	r5, #1
	mov	lr, #300
	ldr	r2, .L190+8
	smull	r7, r6, r2, r4
	smull	r7, r2, r0, r2
	add	r8, r6, r4
	add	r7, r2, r0
	asr	r6, r4, #31
	asr	r2, r0, #31
	rsb	r6, r6, r8, asr #7
	rsb	r2, r2, r7, asr #7
	rsb	r6, r6, r6, lsl #4
	rsb	r2, r2, r2, lsl #4
	sub	r4, r4, r6, lsl #4
	sub	r0, r0, r2, lsl #4
	add	r6, r3, r3, lsl #3
	add	r2, ip, r6, lsl #2
	add	r4, r4, #8
	add	r3, r3, #3
	add	r0, r0, #8
	stmib	r2, {r0, r5}
	str	r4, [ip, r6, lsl #2]
	str	lr, [r2, #20]
	str	r1, [r2, #12]
	str	r1, [r2, #24]
	str	r3, [r2, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L191:
	.align	2
.L190:
	.word	rand
	.word	flowers
	.word	-2004318071
	.size	spawnRandomFlower, .-spawnRandomFlower
	.align	2
	.global	spawnFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnFlower, %function
spawnFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	lr, .L199
	mov	r3, #0
	mov	r2, lr
.L195:
	ldr	ip, [r2, #8]
	cmp	ip, #0
	beq	.L198
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #36
	bne	.L195
	pop	{r4, r5, lr}
	bx	lr
.L198:
	mov	r5, #1
	mov	r4, #300
	add	r2, r3, r3, lsl #3
	str	r0, [lr, r2, lsl #2]
	add	r3, r3, #3
	add	lr, lr, r2, lsl #2
	str	r1, [lr, #4]
	str	ip, [lr, #12]
	str	ip, [lr, #24]
	str	r3, [lr, #16]
	str	r5, [lr, #8]
	str	r4, [lr, #20]
	pop	{r4, r5, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	flowers
	.size	spawnFlower, .-spawnFlower
	.align	2
	.global	initRedFlowerPalette
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRedFlowerPalette, %function
initRedFlowerPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L205
	push	{r4, lr}
	ldr	r0, .L205+4
	rsb	lr, ip, #83886080
	mov	r1, ip
	add	lr, lr, #576
	add	ip, ip, #32
.L202:
	ldrh	r2, [lr, r1]
	lsr	r3, r2, #10
	and	r3, r3, #31
	lsr	r2, r2, #5
	umull	r4, r3, r0, r3
	and	r2, r2, #31
	umull	r4, r2, r0, r2
	lsr	r3, r3, #1
	lsl	r3, r3, #10
	lsr	r2, r2, #1
	orr	r3, r3, r2, lsl #5
	orr	r3, r3, #31
	strh	r3, [r1], #2	@ movhi
	cmp	ip, r1
	bne	.L202
	ldr	r4, .L205+8
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L205+12
	ldr	r1, .L205
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L206:
	.align	2
.L205:
	.word	redFlowerPalette
	.word	-1431655765
	.word	DMANow
	.word	83886688
	.size	initRedFlowerPalette, .-initRedFlowerPalette
	.align	2
	.global	goToBoss1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBoss1, %function
goToBoss1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r2, #10
	ldr	r3, .L220
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L220+4
	str	r1, [r3]
	ldr	r3, .L220+8
	mov	r8, #512
	mov	r5, r4
	str	r2, [r3, #4]
	ldr	r7, .L220+12
	add	r6, r4, #360
	b	.L210
.L218:
	mov	r0, r5
	add	r5, r5, #36
	bl	drawFlower.part.0
	cmp	r5, r6
	beq	.L217
.L210:
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L218
	ldr	r3, [r5, #16]
	add	r5, r5, #36
	lsl	r3, r3, #3
	cmp	r5, r6
	strh	r8, [r7, r3]	@ movhi
	bne	.L210
.L217:
	mov	r5, #1
	ldr	r7, .L220+16
	ldr	r3, .L220+20
	ldr	r2, [r7]
	str	r5, [r3]
	mov	r1, #7296
	mov	r3, #4352
	cmp	r2, #4
	mov	r2, #67108864
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #32768
	mov	r2, #100663296
	ldr	r1, .L220+24
	beq	.L219
	ldr	r8, .L220+28
	mov	lr, pc
	bx	r8
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L220+32
	ldr	r1, .L220+36
	mov	lr, pc
	bx	r8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L220+40
	mov	lr, pc
	bx	r8
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L220+44
	ldr	r1, .L220+48
	mov	lr, pc
	bx	r8
	mov	r0, #3
	ldr	r2, .L220+52
	ldr	r1, .L220+56
	mov	r3, #256
	mov	lr, pc
	bx	r8
	ldr	r3, .L220+60
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L220+12
	mov	lr, pc
	bx	r8
	mov	ip, #0
	mov	r8, #10
	mov	lr, #100
	mov	r9, #3
	mov	r3, ip
	mov	r0, #8
	mov	r1, #16
	ldr	r2, .L220+64
	str	ip, [r2]
	ldr	r2, .L220+68
	str	ip, [r2]
	ldr	r2, .L220+72
	str	ip, [r2, #28]
	str	r5, [r2, #8]
	str	r5, [r2, #12]
	str	ip, [r2, #40]
	str	ip, [r2, #32]
	str	ip, [r2, #52]
	str	r9, [r2, #44]
	str	r8, [r2]
	str	r8, [r2, #24]
	str	lr, [r2, #4]
	str	lr, [r2, #48]
.L213:
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	str	r0, [r4, #28]
	str	r1, [r4, #32]
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L213
	bl	initRedFlowerPalette
	mov	r3, #3
	str	r3, [r7]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L219:
	ldr	r4, .L220+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L220+32
	ldr	r1, .L220+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L220+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L220+44
	ldr	r1, .L220+48
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L220+52
	ldr	r1, .L220+56
	mov	lr, pc
	bx	r4
	mov	r3, #3
	str	r3, [r7]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L221:
	.align	2
.L220:
	.word	.LANCHOR0
	.word	flowers
	.word	.LANCHOR1
	.word	shadowOAM
	.word	state
	.word	prevState
	.word	bossmazetilesTiles
	.word	DMANow
	.word	100720640
	.word	bossmazemapMap
	.word	bossmazetilesPal
	.word	100728832
	.word	myspritesheetTiles
	.word	83886592
	.word	myspritesheetPal
	.word	hideSprites
	.word	hOff
	.word	vOff
	.word	player
	.size	goToBoss1, .-goToBoss1
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L238
	ldr	r3, .L238+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L223
	ldr	r2, .L238+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L235
.L223:
	tst	r3, #8
	beq	.L222
	ldr	r5, .L238+8
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L222
	ldr	r6, .L238+12
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L236
.L227:
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L237
.L222:
	pop	{r4, r5, r6, lr}
	bx	lr
.L235:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L223
.L236:
	bl	goToGame1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L222
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L227
	b	.L222
.L237:
	pop	{r4, r5, r6, lr}
	b	goToBoss1
.L239:
	.align	2
.L238:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	prevState
	.size	pause, .-pause
	.align	2
	.global	checkTriggerAreas
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkTriggerAreas, %function
checkTriggerAreas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L247
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	sub	sp, sp, #20
	ldr	r0, .L247+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L247+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L246
.L240:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L246:
	ldr	r3, [r4, #24]
	cmp	r3, #3
	bne	.L240
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToBoss1
.L248:
	.align	2
.L247:
	.word	.LANCHOR1
	.word	player
	.word	collision
	.size	checkTriggerAreas, .-checkTriggerAreas
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	checkTriggerAreas
	ldr	r3, .L261
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L250
	ldr	r2, .L261+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L259
.L250:
	tst	r3, #8
	beq	.L251
	ldr	r3, .L261+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L260
.L251:
	bl	drawPlayer
	ldr	r3, .L261+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L261+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L261+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L260:
	pop	{r4, lr}
	b	goToPause
.L259:
	pop	{r4, lr}
	b	goToBoss1
.L262:
	.align	2
.L261:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	game1, .-game1
	.align	2
	.global	updateFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlowers, %function
updateFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	ip, #1
	ldr	r3, .L272
	add	r1, r3, #360
.L269:
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L265
	ldr	r2, [r3, #20]
	sub	r2, r2, #1
	cmp	r2, #99
	str	r2, [r3, #20]
	strgt	r0, [r3, #24]
	bgt	.L265
	cmp	r2, #0
	str	ip, [r3, #24]
	strle	r0, [r3, #8]
.L265:
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L269
	bx	lr
.L273:
	.align	2
.L272:
	.word	flowers
	.size	updateFlowers, .-updateFlowers
	.align	2
	.global	checkFlowerCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkFlowerCollisions, %function
checkFlowerCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L286
	mov	fp, #0
	ldr	r5, .L286+4
	ldr	r7, .L286+8
	ldr	r8, .L286+12
	ldr	r10, .L286+16
	ldr	r9, .L286+20
	sub	sp, sp, #20
	add	r6, r4, #360
	b	.L276
.L275:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L285
.L276:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L275
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #32]
	ldr	r1, [r4, #28]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L275
	ldr	r3, [r8]
	mov	r0, #16
	add	r3, r3, #1
	str	r3, [r8]
	str	fp, [r4, #8]
	mov	lr, pc
	bx	r10
	ldr	r2, [r8]
	ldr	r3, [r9, #4]
	cmp	r2, r3
	blt	.L275
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToWin
.L285:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L287:
	.align	2
.L286:
	.word	flowers
	.word	player
	.word	collision
	.word	.LANCHOR0
	.word	playAnalogSound
	.word	.LANCHOR1
	.size	checkFlowerCollisions, .-checkFlowerCollisions
	.align	2
	.global	boss
	.syntax unified
	.arm
	.fpu softvfp
	.type	boss, %function
boss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L313
	bl	updatePlayer
	bl	updateFlowers
	bl	checkFlowerCollisions
	ldr	r3, [r7, #8]
	ldr	r4, .L313+4
	add	r3, r3, #1
	mov	r8, #512
	str	r3, [r7, #8]
	ldr	r6, .L313+8
	add	r5, r4, #360
	b	.L291
.L310:
	mov	r0, r4
	add	r4, r4, #36
	bl	drawFlower.part.0
	cmp	r4, r5
	beq	.L309
.L291:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L310
	ldr	r3, [r4, #16]
	add	r4, r4, #36
	lsl	r3, r3, #3
	cmp	r4, r5
	strh	r8, [r6, r3]	@ movhi
	bne	.L291
.L309:
	ldr	r4, .L313+12
	ldr	r5, .L313+16
	mov	r1, r4
	ldr	r0, .L313+20
	mov	lr, pc
	bx	r5
	mov	r1, r4
	ldr	r0, .L313+24
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #52]
	cmp	r3, #0
	subgt	r3, r3, #1
	ldr	r1, .L313+12
	ldr	r0, .L313+20
	ldr	r5, .L313+28
	strgt	r3, [r4, #52]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L293
.L296:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L294
.L297:
	ldr	r3, [r7, #8]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L313+32
	add	r3, r3, r3, lsl #8
	ldr	r1, .L313+36
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	bcs	.L311
.L299:
	bl	drawPlayer
	bl	drawWaterBoss
	bl	drawSamuraiBoss
	ldr	r3, .L313+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L313+44
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L313+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L313+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L288
	ldr	r3, .L313+52
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L312
.L288:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L294:
	ldr	r3, .L313+20
	ldr	r3, [r3, #56]
	cmp	r3, #1
	beq	.L298
	ldr	r3, .L313+24
	ldr	r3, [r3, #56]
	cmp	r3, #1
	bne	.L297
.L298:
	mov	r2, #50
	ldr	r3, [r4, #48]
	sub	r3, r3, #10
	cmp	r3, #0
	str	r3, [r4, #48]
	str	r2, [r4, #52]
	bgt	.L297
	mov	r3, #0
	str	r3, [r4, #48]
	bl	goToLose
	b	.L297
.L293:
	ldr	r1, .L313+12
	ldr	r0, .L313+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L296
	b	.L297
.L311:
	bl	spawnRandomFlower
	b	.L299
.L312:
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToPause
.L314:
	.align	2
.L313:
	.word	.LANCHOR0
	.word	flowers
	.word	shadowOAM
	.word	player
	.word	updateBoss
	.word	waterBoss
	.word	samuraiBoss
	.word	checkBossCollision
	.word	143165576
	.word	35791394
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.size	boss, .-boss
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L330
	mov	lr, pc
	bx	r3
	ldr	r3, .L330+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r4, .L330+8
	mov	r0, #42
	ldr	r3, .L330+12
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r10, .L330+16
	ldr	r6, .L330+20
	ldr	r7, .L330+24
	ldr	r9, .L330+28
	ldr	fp, .L330+32
	ldr	r8, .L330+36
	ldr	r5, .L330+40
.L316:
	ldr	r2, [r4]
	ldrh	r3, [r10]
.L317:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L317
.L319:
	.word	.L325
	.word	.L324
	.word	.L323
	.word	.L322
	.word	.L321
	.word	.L320
	.word	.L318
.L318:
	ldr	r3, .L330+44
	mov	lr, pc
	bx	r3
	b	.L316
.L320:
	ldr	r3, .L330+48
	mov	lr, pc
	bx	r3
	b	.L316
.L321:
	ldr	r3, .L330+52
	mov	lr, pc
	bx	r3
	b	.L316
.L322:
	ldr	r3, .L330+56
	mov	lr, pc
	bx	r3
	b	.L316
.L323:
	ldr	r3, .L330+60
	mov	lr, pc
	bx	r3
	b	.L316
.L324:
	ldr	r3, .L330+64
	mov	lr, pc
	bx	r3
	b	.L316
.L325:
	ldr	r3, [r9]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	mov	r2, #5824
	strh	r3, [r7, #42]	@ movhi
	ldrb	r3, [r9, #4]	@ zero_extendqisi2
	strh	r2, [r7, #44]	@ movhi
	strh	r3, [r7, #40]	@ movhi
	mov	lr, pc
	bx	fp
	ldrh	r3, [r10]
	tst	r3, #4
	moveq	r2, #99
	mov	r1, #67108864
	ldreq	r3, .L330+68
	strheq	r2, [r3]	@ movhi
	ldr	r2, [r8]
	add	r2, r2, #1
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r0, r2, #16
	lsr	r3, r3, #16
	lsr	r0, r0, #16
	str	r2, [r8]
	strh	r0, [r1, #20]	@ movhi
	strh	r3, [r1, #16]	@ movhi
	b	.L316
.L331:
	.align	2
.L330:
	.word	initSound
	.word	initialize
	.word	state
	.word	srand
	.word	buttons
	.word	oldButtons
	.word	shadowOAM
	.word	startsprite
	.word	start
	.word	hScroll
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.word	boss
	.word	game1
	.word	instructions
	.word	100696734
	.size	main, .-main
	.text
	.align	2
	.global	playCollectSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playCollectSound, %function
playCollectSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #16
	ldr	r3, .L334
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L335:
	.align	2
.L334:
	.word	playAnalogSound
	.size	playCollectSound, .-playCollectSound
	.global	triggerAreas
	.comm	prevState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.global	animationSpeed
	.global	animationCounter
	.global	flowersNeeded
	.global	flowersProtected
	.comm	startsprite,60,4
	.comm	samuraiBoss,68,4
	.comm	waterBoss,68,4
	.comm	bossEntrance,60,4
	.comm	player,60,4
	.comm	state,4,4
	.comm	flowers,360,4
	.comm	shadowOAM,1024,4
	.comm	hScroll,4,4
	.comm	redFlowerPalette,32,4
	.global	timer
	.comm	NOTES,2,2
	.comm	songs,60,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	animationSpeed, %object
	.size	animationSpeed, 4
animationSpeed:
	.word	10
	.type	flowersNeeded, %object
	.size	flowersNeeded, 4
flowersNeeded:
	.word	10
	.type	triggerAreas, %object
	.size	triggerAreas, 20
triggerAreas:
	.word	240
	.word	40
	.word	32
	.word	32
	.word	3
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	flowersProtected, %object
	.size	flowersProtected, 4
flowersProtected:
	.space	4
	.type	animationCounter, %object
	.size	animationCounter, 4
animationCounter:
	.space	4
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
