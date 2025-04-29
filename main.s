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
	.global	playPauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playPauseSound, %function
playPauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #7
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	playAnalogSound
	.size	playPauseSound, .-playPauseSound
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
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r5, #256
	mov	r2, #4864
	ldr	r1, .L25+4
	ldr	r4, .L25+8
	strh	r5, [r6]	@ movhi
	mov	r3, r5
	strh	r2, [r6]	@ movhi
	mov	r0, #3
	strh	r1, [r6, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L25+20
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	mov	r2, #2560
	mov	r3, #1024
	strh	r2, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L25+28
	ldr	r1, .L25+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L25+36
	ldr	r1, .L25+40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L25+44
	ldr	r1, .L25+48
	mov	lr, pc
	bx	r4
	mov	r5, #16
	mov	lr, #64
	mov	ip, #40
	ldr	r2, .L25+52
	ldr	r3, .L25+56
	ldr	r1, [r2]
	ldr	r4, .L25+60
	mov	r2, #1
	ldr	r0, .L25+64
	str	r5, [r3, #16]
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	ip, [r3]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L25+68
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	hideSprites
	.word	2049
	.word	DMANow
	.word	gardenTilesPal
	.word	gardenTilesTiles
	.word	100679680
	.word	myGardenMap
	.word	100683776
	.word	myCloudsMap
	.word	100728832
	.word	spritesheetm3Tiles
	.word	83886592
	.word	spritesheetm3Pal
	.word	surge_length
	.word	startsprite
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
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	mov	r4, #97
	mov	lr, #1
	mov	r2, #67108864
	mov	r0, #8
	mov	r1, #0
	ldr	r3, .L29+4
	ldr	ip, .L29+8
	ldrh	ip, [ip, #48]
	strh	r4, [r3]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	ldr	lr, .L29+12
	ldr	r3, .L29+16
	strh	r0, [r2, #4]	@ movhi
	ldr	r0, .L29+20
	ldr	r2, .L29+24
	str	lr, [r3, #4092]
	ldr	r3, .L29+28
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L30:
	.align	2
.L29:
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
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r2, #12
	mov	r0, #67108864
	ldreq	r3, .L33+4
	ldr	ip, .L33+8
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
.L34:
	.align	2
.L33:
	.word	buttons
	.word	100680668
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
	mov	r2, #67108864
	ldr	r1, .L37
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L37+4
	mov	r2, #83886080
	ldr	r1, .L37+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+12
	ldr	r0, .L37+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L37+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L37+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	1028
	.word	DMANow
	.word	instructionsPal
	.word	drawFullscreenImage4
	.word	instructionsBitmap
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
	ldr	r2, .L46
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	push	{r4, lr}
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r4, .L46+4
	ldr	r1, .L46+8
	strh	r3, [r4, #42]	@ movhi
	strh	r0, [r4, #40]	@ movhi
	strh	r1, [r4, #44]	@ movhi
	ldr	r2, .L46+12
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L46+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L46+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
.L39:
	pop	{r4, lr}
	bx	lr
.L45:
	pop	{r4, lr}
	b	goToInstructions
.L47:
	.align	2
.L46:
	.word	startsprite
	.word	shadowOAM
	.word	8234
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
	push	{r4, lr}
	mov	r0, #7
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r1, .L53+4
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L53+8
	ldr	r4, .L53+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+16
	ldr	r0, .L53+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L53+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+36
	ldr	r2, [r3]
	cmp	r2, #2
	beq	.L52
	cmp	r2, #3
	moveq	r1, #1
	ldreq	r2, .L53+40
	streq	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	mov	r1, #0
	ldr	r2, .L53+40
	str	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	playAnalogSound
	.word	1028
	.word	pausePal
	.word	DMANow
	.word	drawFullscreenImage4
	.word	pauseBitmap
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
	mov	r2, #67108864
	ldr	r1, .L57
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L57+4
	mov	r2, #83886080
	ldr	r1, .L57+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+12
	ldr	r0, .L57+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+28
	mov	lr, pc
	bx	r4
	mov	lr, #1
	mov	r0, #2
	mov	r2, #5
	ldr	ip, .L57+32
	ldr	r1, .L57+36
	ldr	r3, .L57+40
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	1028
	.word	DMANow
	.word	winPal
	.word	drawFullscreenImage4
	.word	winBitmap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	.LANCHOR0
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
	mov	r2, #67108864
	ldr	r1, .L61
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L61+4
	mov	r2, #83886080
	ldr	r1, .L61+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+12
	ldr	r0, .L61+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+28
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L61+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L63:
	pop	{r4, lr}
	bx	lr
.L69:
	pop	{r4, lr}
	b	goToStart
.L71:
	.align	2
.L70:
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
	ldr	r3, .L78
	ldr	r3, [r3]
	cmp	r3, #2
	moveq	r2, #1
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldreq	r3, .L78+4
	ldr	r5, .L78+8
	streq	r2, [r3]
	ldr	r3, [r5]
	mov	r2, #67108864
	mov	r1, #7296
	cmp	r3, #4
	mov	r3, #4352
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L78+12
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #512
	mov	r2, #100663296
	ldr	r1, .L78+16
	sub	sp, sp, #8
	beq	.L77
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L78+20
	ldr	r1, .L78+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L78+32
	ldr	r1, .L78+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L78+40
	ldr	r1, .L78+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L78+52
	mov	lr, pc
	bx	r4
	mov	r2, #20
	mov	r3, #64
	mov	r4, #16
	mov	r0, #40
	mov	r8, #32
	mov	r7, #200
	mov	r6, #160
	mov	r1, #0
	mov	lr, #1
	mov	r10, #3
	mov	r9, #10
	ldr	ip, .L78+56
	str	r2, [ip, #48]
	ldr	r2, .L78+60
	str	r3, [sp]
	str	r0, [ip, #20]
	str	r7, [r2]
	str	r4, [r2, #16]
	str	r8, [r2, #20]
	str	r6, [r2, #4]
	str	r0, [ip]
	ldr	r2, .L78+64
	ldr	r0, .L78+68
	str	r4, [ip, #16]
	str	r1, [ip, #28]
	str	r1, [ip, #40]
	str	r1, [ip, #32]
	str	r1, [r2]
	str	r1, [r0]
	mov	r2, #90
	mov	r1, #100
	ldr	r0, .L78+72
	ldr	r4, .L78+76
	str	r3, [ip, #4]
	str	r10, [ip, #44]
	str	r9, [ip, #24]
	str	lr, [ip, #8]
	str	lr, [ip, #12]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	str	r3, [r5]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L77:
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L78+20
	ldr	r1, .L78+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L78+32
	ldr	r1, .L78+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L78+40
	ldr	r1, .L78+44
	mov	lr, pc
	bx	r4
	mov	r3, #2
	str	r3, [r5]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	prevState
	.word	.LANCHOR0
	.word	state
	.word	DMANow
	.word	decor_8x8Tiles
	.word	100720640
	.word	town1fakeMap
	.word	decor_8x8Pal
	.word	100728832
	.word	spritesheetm3Tiles
	.word	83886592
	.word	spritesheetm3Pal
	.word	hideSprites
	.word	shadowOAM
	.word	player
	.word	bossEntrance
	.word	hOff
	.word	vOff
	.word	waterBoss
	.word	initBoss
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
	ldr	r3, .L87
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L87+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L86
.L80:
	pop	{r4, lr}
	bx	lr
.L86:
	pop	{r4, lr}
	b	goToGame1
.L88:
	.align	2
.L87:
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
	ldr	r3, .L96
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L96+4
	ldrh	r1, [r3]
	ldr	r3, .L96+8
	tst	r1, #8
	str	r2, [r3]
	beq	.L89
	ldr	r3, .L96+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L95
.L89:
	pop	{r4, lr}
	bx	lr
.L95:
	pop	{r4, lr}
	b	goToGame1
.L97:
	.align	2
.L96:
	.word	waitForVBlank
	.word	oldButtons
	.word	prevState
	.word	buttons
	.size	win, .-win
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #1
	ldr	r6, .L103
	ldr	r3, .L103+4
	ldr	r2, [r6]
	str	r5, [r3]
	mov	r1, #7296
	mov	r3, #4352
	cmp	r2, #4
	mov	r2, #67108864
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L103+8
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #512
	mov	r2, #100663296
	ldr	r1, .L103+12
	beq	.L102
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L103+16
	ldr	r1, .L103+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L103+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L103+28
	ldr	r1, .L103+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L103+36
	ldr	r1, .L103+40
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L103+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L103+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r7, #16
	mov	r4, #40
	mov	lr, #10
	mov	r0, #100
	mov	r1, #3
	mov	ip, #20
	ldr	r3, .L103+52
	str	r2, [r3]
	ldr	r3, .L103+56
	str	r2, [r3]
	ldr	r3, .L103+60
	str	r1, [r6]
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	str	r7, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	ip, [r3, #48]
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L102:
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L103+16
	ldr	r1, .L103+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L103+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L103+28
	ldr	r1, .L103+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L103+36
	ldr	r1, .L103+40
	mov	lr, pc
	bx	r4
	mov	r3, #3
	str	r3, [r6]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	state
	.word	prevState
	.word	DMANow
	.word	decor_8x8Tiles
	.word	100720640
	.word	bossroom1Map
	.word	decor_8x8Pal
	.word	100728832
	.word	spritesheetm3Tiles
	.word	83886592
	.word	spritesheetm3Pal
	.word	hideSprites
	.word	shadowOAM
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
	ldr	r4, .L121
	ldr	r3, .L121+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L106
	ldr	r2, .L121+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L118
.L106:
	tst	r3, #8
	beq	.L105
	ldr	r5, .L121+8
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L105
	ldr	r6, .L121+12
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L119
.L110:
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L120
.L105:
	pop	{r4, r5, r6, lr}
	bx	lr
.L118:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L106
.L119:
	bl	goToGame1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L105
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L110
	b	.L105
.L120:
	pop	{r4, r5, r6, lr}
	b	goToBoss1
.L122:
	.align	2
.L121:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	prevState
	.size	pause, .-pause
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
	mov	r1, #0
	ldr	r3, .L152
	ldrh	r2, [r3]
	ldr	r3, .L152+4
	tst	r2, #64
	push	{r4, r5, r6, r7, lr}
	ldr	ip, [r3]
	str	r1, [r3, #32]
	ldr	lr, [r3, #16]
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #20]
	bne	.L124
	mov	r1, #1
	cmp	r0, #0
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	ldrgt	r1, [r3, #12]
	subgt	r0, r0, r1
	strgt	r0, [r3, #4]
.L124:
	ands	r1, r2, #128
	bne	.L125
	mov	r5, #1
	str	r1, [r3, #28]
	rsb	r1, r4, #256
	cmp	r1, r0
	ldrgt	r1, [r3, #12]
	addgt	r0, r0, r1
	str	r5, [r3, #32]
	strgt	r0, [r3, #4]
.L125:
	tst	r2, #32
	bne	.L126
	mov	r1, #1
	mov	r5, #2
	cmp	ip, #0
	str	r1, [r3, #32]
	ldrgt	r1, [r3, #8]
	subgt	ip, ip, r1
	str	r5, [r3, #28]
	strgt	ip, [r3]
.L126:
	tst	r2, #16
	bne	.L127
	mov	r5, #3
	mov	r1, #1
	str	r5, [r3, #28]
	rsb	r5, lr, #256
	cmp	r5, ip
	str	r1, [r3, #32]
	ldrgt	r1, [r3, #8]
	addgt	ip, ip, r1
	strgt	ip, [r3]
.L127:
	ldr	r1, .L152+8
	ldrh	r1, [r1]
	tst	r1, #2
	ldr	r1, [r3, #36]
	beq	.L128
	tst	r2, #2
	bne	.L128
	cmp	r1, #0
	moveq	r2, #1
	streq	r2, [r3, #36]
.L129:
	ldr	r2, [r3, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	strgt	r2, [r3, #24]
	ble	.L149
.L130:
	cmp	ip, #0
	movlt	r7, #0
	rsb	r1, lr, #240
	add	r1, r1, r1, lsr #31
	sub	r1, ip, r1, asr #1
	strlt	r7, [r3]
	movlt	ip, lr
	addge	ip, lr, ip
	cmp	r0, #0
	movlt	r7, #0
	rsb	r2, r4, #160
	add	r2, r2, r2, lsr #31
	sub	r2, r0, r2, asr #1
	movlt	r0, r4
	addge	r0, r4, r0
	strlt	r7, [r3, #4]
	cmp	ip, #256
	rsbgt	lr, lr, #256
	strgt	lr, [r3]
	cmp	r0, #256
	rsbgt	r4, r4, #256
	ldr	r6, .L152+12
	ldr	r5, .L152+16
	strgt	r4, [r3, #4]
	cmp	r1, #0
	str	r1, [r6]
	str	r2, [r5]
	blt	.L150
	cmp	r2, #0
	blt	.L151
	cmp	r1, #16
	movgt	r3, #16
	strgt	r3, [r6]
.L139:
	cmp	r2, #96
	ble	.L123
	mov	r3, #96
.L148:
	str	r3, [r5]
.L123:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L128:
	cmp	r1, #0
	beq	.L130
	b	.L129
.L151:
	mov	r3, #0
	cmp	r1, #16
	str	r3, [r5]
	ble	.L123
	mov	r3, #16
	str	r3, [r6]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L149:
	add	r2, r3, #40
	ldm	r2, {r2, r5}
	add	r2, r2, #1
	cmp	r2, r5
	str	r2, [r3, #40]
	mov	r1, #5
	movge	r2, #0
	str	r1, [r3, #24]
	strge	r2, [r3, #40]
	strge	r2, [r3, #36]
	b	.L130
.L150:
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r6]
	bge	.L139
	b	.L148
.L153:
	.align	2
.L152:
	.word	buttons
	.word	player
	.word	oldButtons
	.word	hOff
	.word	vOff
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
	ldr	r1, .L160
	push	{r4, lr}
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	ldr	r3, .L160+4
	ldr	lr, .L160+8
	ldr	r2, .L160+12
	ldrh	r4, [r3]
	orr	r0, r0, lr
	ldr	r3, [r1]
	strh	r0, [r2]	@ movhi
	ldr	r0, .L160+16
	ldr	r1, [r1, #36]
	lsl	r3, r3, #23
	strh	r4, [ip, #16]	@ movhi
	lsr	r3, r3, #23
	ldrh	r4, [r0]
	ldr	r0, .L160+20
	orr	r3, r3, lr
	cmp	r1, #0
	strh	r3, [r2, #2]	@ movhi
	strh	r4, [ip, #18]	@ movhi
	ldr	r3, [r0, #4]
	beq	.L155
	cmp	r3, #1
	movne	r3, #34
	ldreq	r3, .L160+24
	pop	{r4, lr}
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L155:
	cmp	r3, #1
	moveq	r3, #12416
	strhne	r1, [r2, #4]	@ movhi
	strheq	r3, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L161:
	.align	2
.L160:
	.word	player
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.word	vOff
	.word	.LANCHOR0
	.word	12451
	.size	drawPlayer, .-drawPlayer
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
	ldr	r2, .L180
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, .L180+4
	ldrh	r3, [r3]
	beq	.L164
	tst	r3, #1
	bne	.L177
.L164:
	tst	r3, #4
	beq	.L165
	ldr	r2, .L180+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L178
.L165:
	tst	r3, #8
	beq	.L166
	ldr	r3, .L180+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L179
.L166:
	bl	drawPlayer
	mov	r0, #544
	ldr	r2, .L180+12
	ldr	ip, .L180+16
	ldr	r1, .L180+20
	ldr	r3, [r2]
	ldr	ip, [ip]
	ldr	r1, [r1]
	ldr	r2, [r2, #4]
	sub	r3, r3, ip
	sub	r2, r2, r1
	lsl	r3, r3, #23
	ldr	r1, .L180+24
	ldr	r4, .L180+28
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r3, r3, r1
	orr	r2, r2, r1
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r0, [r4, #12]	@ movhi
	ldr	r1, .L180+32
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L180+36
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L177:
	ldr	r1, .L180+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L164
	ldr	r1, [r2, #4]
	rsbs	r1, r1, #1
	movcc	r1, #0
	str	r1, [r2, #4]
	b	.L164
.L179:
	pop	{r4, lr}
	b	goToPause
.L178:
	pop	{r4, lr}
	b	goToBoss1
.L181:
	.align	2
.L180:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	bossEntrance
	.word	hOff
	.word	vOff
	.word	-32768
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	game1, .-game1
	.align	2
	.global	drawBossEntrance
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBossEntrance, %function
drawBossEntrance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #544
	ldr	r2, .L183
	ldr	r0, .L183+4
	ldr	r1, .L183+8
	ldr	r3, [r2]
	ldr	r0, [r0]
	ldr	r1, [r1]
	ldr	r2, [r2, #4]
	sub	r3, r3, r0
	sub	r2, r2, r1
	ldr	r0, .L183+12
	lsl	r3, r3, #23
	ldr	r1, .L183+16
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r3, r3, r0
	orr	r2, r2, r0
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	ip, [r1, #12]	@ movhi
	bx	lr
.L184:
	.align	2
.L183:
	.word	bossEntrance
	.word	hOff
	.word	vOff
	.word	-32768
	.word	shadowOAM
	.size	drawBossEntrance, .-drawBossEntrance
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
	ldr	r2, .L186
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r1, .L186+4
	ldr	r2, .L186+8
	strh	r3, [r2, #42]	@ movhi
	strh	r0, [r2, #40]	@ movhi
	strh	r1, [r2, #44]	@ movhi
	bx	lr
.L187:
	.align	2
.L186:
	.word	startsprite
	.word	8234
	.word	shadowOAM
	.size	drawstartsprite, .-drawstartsprite
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L197
	ldr	r4, .L197+4
	ldr	r0, .L197+8
	ldr	r2, [r3]
	ldr	r6, [r0]
	ldr	r1, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #56]
	sub	r1, r1, r2
	sub	r3, r3, r6
	ldr	r2, .L197+12
	and	r3, r3, #255
	cmp	r0, #0
	strh	r3, [r2, #16]	@ movhi
	moveq	r3, #512
	ldr	r5, .L197+16
	ldr	lr, .L197+20
	and	ip, r1, r5
	orr	ip, ip, #49152
	strh	ip, [r2, #18]	@ movhi
	strh	lr, [r2, #20]	@ movhi
	strheq	r3, [r2, #24]	@ movhi
	beq	.L190
	cmp	r0, #1
	beq	.L194
	cmp	r0, #2
	beq	.L195
.L190:
	ldr	r3, [r4, #44]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #44]
	ble	.L196
	pop	{r4, r5, r6, lr}
	bx	lr
.L196:
	ldr	r3, .L197+24
	add	r0, r0, #1
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	ldr	r3, .L197+28
	str	r0, [r4, #56]
	mov	lr, pc
	bx	r3
	ldr	r2, .L197+32
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #20
	str	r0, [r4, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L194:
	mov	r1, #512
	ldr	r3, .L197+36
	strh	r1, [r2, #24]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	b	.L190
.L195:
	ldr	lr, .L197+40
	sub	r1, r1, #64
	and	r1, r1, r5
	ldr	r6, .L197+44
	ldr	r5, .L197+48
	orr	r1, r1, lr
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	ip, [r2, #26]	@ movhi
	strh	r6, [r2, #20]	@ movhi
	strh	r5, [r2, #28]	@ movhi
	b	.L190
.L198:
	.align	2
.L197:
	.word	hOff
	.word	waterBoss
	.word	vOff
	.word	shadowOAM
	.word	511
	.word	4642
	.word	1431655766
	.word	rand
	.word	-2078209981
	.word	4649
	.word	-16384
	.word	4655
	.word	4663
	.size	drawWaterBoss, .-drawWaterBoss
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L220
	bl	updatePlayer
	mov	r1, r4
	ldr	r0, .L220+4
	ldr	r3, .L220+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	ldr	r5, .L220+4
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #52]
	mov	r0, r5
	ldr	r1, .L220
	ldr	r3, .L220+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L201
	ldr	r6, .L220+16
.L202:
	bl	drawPlayer
	bl	drawWaterBoss
	ldr	r3, .L220+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L220+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L220+28
	mov	lr, pc
	bx	r4
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L199
	ldr	r3, .L220+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L218
.L199:
	pop	{r4, r5, r6, lr}
	bx	lr
.L201:
	ldr	r3, [r5, #56]
	cmp	r3, #2
	beq	.L219
.L204:
	ldr	r6, .L220+16
	ldrh	r3, [r6]
	tst	r3, #2
	beq	.L202
	ldr	r3, .L220+32
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L202
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L202
	ldr	r3, [r5, #16]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r3, [r5, #16]
	bgt	.L202
	bl	goToWin
	b	.L202
.L219:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L204
	mov	r1, #60
	ldr	r3, [r4, #48]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r3, [r4, #48]
	str	r1, [r4, #52]
	bgt	.L204
	str	r2, [r4, #48]
	bl	goToLose
	b	.L204
.L218:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L221:
	.align	2
.L220:
	.word	player
	.word	waterBoss
	.word	updateBoss
	.word	checkBossCollision
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
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
	ldr	r3, .L237
	mov	lr, pc
	bx	r3
	ldr	r3, .L237+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, r3
	ldr	r6, .L237+8
	ldr	r10, .L237+12
	str	r3, [r6]
	ldr	r5, .L237+16
	ldr	r7, .L237+20
	ldr	r9, .L237+24
	ldr	fp, .L237+28
	ldr	r8, .L237+32
	ldr	r4, .L237+36
.L223:
	ldrh	r3, [r10]
.L224:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L224
.L226:
	.word	.L232
	.word	.L231
	.word	.L230
	.word	.L229
	.word	.L228
	.word	.L227
	.word	.L225
.L225:
	ldr	r3, .L237+40
	mov	lr, pc
	bx	r3
.L234:
	ldr	r1, [r6]
	b	.L223
.L227:
	ldr	r3, .L237+44
	mov	lr, pc
	bx	r3
	b	.L234
.L228:
	ldr	r3, .L237+48
	mov	lr, pc
	bx	r3
	b	.L234
.L229:
	ldr	r3, .L237+52
	mov	lr, pc
	bx	r3
	b	.L234
.L230:
	ldr	r3, .L237+56
	mov	lr, pc
	bx	r3
	b	.L234
.L231:
	ldr	r3, .L237+60
	mov	lr, pc
	bx	r3
	b	.L234
.L232:
	ldr	r3, [r9]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldrb	r2, [r9, #4]	@ zero_extendqisi2
	strh	r3, [r7, #42]	@ movhi
	ldr	r3, .L237+64
	strh	r2, [r7, #40]	@ movhi
	strh	r3, [r7, #44]	@ movhi
	mov	lr, pc
	bx	fp
	ldrh	r3, [r10]
	tst	r3, #4
	moveq	r2, #12
	mov	r1, #67108864
	ldreq	r3, .L237+68
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
	b	.L234
.L238:
	.align	2
.L237:
	.word	initSound
	.word	initialize
	.word	state
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
	.word	8234
	.word	100680670
	.size	main, .-main
	.text
	.align	2
	.global	playBackgroundMusic
	.syntax unified
	.arm
	.fpu softvfp
	.type	playBackgroundMusic, %function
playBackgroundMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L241
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L241+4
	ldr	r3, .L241+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L242:
	.align	2
.L241:
	.word	surge_length
	.word	surge_data
	.word	playSoundA
	.size	playBackgroundMusic, .-playBackgroundMusic
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
	ldr	r3, .L245
	ldr	r2, .L245+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L245+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L246:
	.align	2
.L245:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	prevState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.global	currentCharacter
	.global	muShengUnlocked
	.comm	startsprite,60,4
	.comm	waterBoss,68,4
	.comm	bossEntrance,60,4
	.comm	player,60,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	hScroll,4,4
	.comm	tileid,1,1
	.comm	NOTES,2,2
	.comm	songs,60,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	muShengUnlocked, %object
	.size	muShengUnlocked, 4
muShengUnlocked:
	.space	4
	.type	currentCharacter, %object
	.size	currentCharacter, 4
currentCharacter:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
