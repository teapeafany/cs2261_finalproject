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
	mov	r1, #67108864
	mov	r3, #4864
	mov	r0, #4224
	ldr	r2, .L25+4
	ldr	r5, .L25+8
	ldr	r4, .L25+12
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+16
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
	ldr	r2, .L25+20
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
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
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L25+44
	ldr	r1, .L25+48
	mov	lr, pc
	bx	r4
	mov	r4, #16
	mov	lr, #64
	mov	ip, #40
	ldr	r3, .L25+52
	ldr	r2, .L25+56
	str	r4, [r3, #16]
	ldr	r1, [r2]
	ldr	r4, .L25+60
	mov	r2, #1
	ldr	r0, .L25+64
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
	.word	2178
	.word	parallaxtilesetTiles
	.word	DMANow
	.word	parallaxtilesetPal
	.word	100679680
	.word	parallaxbgMap
	.word	100696064
	.word	parallaxcloudsMap
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
	mov	r0, #67108864
	ldr	ip, .L32
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
.L33:
	.align	2
.L32:
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
	ldr	r1, .L36
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L36+4
	mov	r2, #83886080
	ldr	r1, .L36+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+12
	ldr	r0, .L36+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L36+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L36+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	r2, .L45
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #5952
	mvn	r3, r3, lsr #18
	push	{r4, lr}
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r4, .L45+4
	ldr	r2, .L45+8
	strh	r3, [r4, #42]	@ movhi
	strh	r0, [r4, #40]	@ movhi
	strh	r1, [r4, #44]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L45+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
	ldr	r3, .L45+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
.L38:
	pop	{r4, lr}
	bx	lr
.L44:
	pop	{r4, lr}
	b	goToInstructions
.L46:
	.align	2
.L45:
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
	push	{r4, lr}
	mov	r0, #7
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r1, .L52+4
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L52+8
	ldr	r4, .L52+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+16
	ldr	r0, .L52+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L52+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L52+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+36
	ldr	r2, [r3]
	cmp	r2, #2
	beq	.L51
	cmp	r2, #3
	moveq	r1, #1
	ldreq	r2, .L52+40
	streq	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	mov	r1, #0
	ldr	r2, .L52+40
	str	r1, [r2]
	mov	r2, #4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	playAnalogSound
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
	mov	r2, #67108864
	ldr	r1, .L56
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L56+4
	mov	r2, #83886080
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+12
	ldr	r0, .L56+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L56+28
	mov	lr, pc
	bx	r4
	mov	lr, #1
	mov	r0, #2
	mov	r2, #5
	ldr	ip, .L56+32
	ldr	r1, .L56+36
	ldr	r3, .L56+40
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r1, .L60
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L60+4
	mov	r2, #83886080
	ldr	r1, .L60+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L60+12
	ldr	r0, .L60+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L60+28
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L60+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	r3, .L69
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L62:
	pop	{r4, lr}
	bx	lr
.L68:
	pop	{r4, lr}
	b	goToStart
.L70:
	.align	2
.L69:
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
	ldr	r3, .L77
	ldr	r3, [r3]
	cmp	r3, #2
	moveq	r2, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldreq	r3, .L77+4
	ldr	r4, .L77+8
	streq	r2, [r3]
	ldr	r3, [r4]
	mov	r2, #67108864
	mov	r1, #7296
	cmp	r3, #4
	mov	r3, #4352
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r5, .L77+12
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #32768
	mov	r2, #100663296
	ldr	r1, .L77+16
	sub	sp, sp, #12
	beq	.L76
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L77+20
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+28
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L77+32
	ldr	r1, .L77+36
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L77+40
	ldr	r1, .L77+44
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L77+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L77+52
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r3, #64
	mov	r6, #20
	mov	r1, #16
	ldr	ip, .L77+56
	str	r3, [sp]
	str	r2, [ip]
	ldr	ip, .L77+60
	str	r2, [ip]
	ldr	ip, .L77+64
	str	r6, [ip, #48]
	ldr	r6, .L77+68
	mov	lr, #1
	str	r1, [ip, #16]
	str	r1, [r6, #16]
	mov	fp, #40
	mov	r10, #30
	mov	r9, #14
	mov	r8, #3
	mov	r7, #10
	mov	r5, #32
	mov	r0, #200
	mov	r1, #160
	str	r2, [ip, #28]
	str	r2, [ip, #40]
	str	r2, [ip, #32]
	str	r5, [r6, #20]
	str	r0, [r6]
	str	r1, [r6, #4]
	mov	r2, #90
	mov	r1, #100
	str	fp, [ip, #20]
	str	r10, [ip]
	str	r9, [ip, #4]
	str	r8, [ip, #44]
	str	r7, [ip, #24]
	ldr	r0, .L77+72
	str	lr, [ip, #8]
	str	lr, [ip, #12]
	ldr	r5, .L77+76
	mov	lr, pc
	bx	r5
	mov	r3, #2
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L76:
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L77+20
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+28
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L77+32
	ldr	r1, .L77+36
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L77+40
	ldr	r1, .L77+44
	mov	lr, pc
	bx	r5
	mov	r3, #2
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	prevState
	.word	.LANCHOR0
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
	.word	hOff
	.word	vOff
	.word	player
	.word	bossEntrance
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
	ldr	r3, .L86
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
	ldr	r3, .L86+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
.L79:
	pop	{r4, lr}
	bx	lr
.L85:
	pop	{r4, lr}
	b	goToGame1
.L87:
	.align	2
.L86:
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
	ldr	r3, .L95
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L95+4
	ldrh	r1, [r3]
	ldr	r3, .L95+8
	tst	r1, #8
	str	r2, [r3]
	beq	.L88
	ldr	r3, .L95+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L94
.L88:
	pop	{r4, lr}
	bx	lr
.L94:
	pop	{r4, lr}
	b	goToGame1
.L96:
	.align	2
.L95:
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
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r6, .L102
	ldr	r3, .L102+4
	ldr	r2, [r6]
	str	r5, [r3]
	mov	r1, #7296
	mov	r3, #4352
	cmp	r2, #4
	mov	r2, #67108864
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L102+8
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #512
	mov	r2, #100663296
	ldr	r1, .L102+12
	beq	.L101
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L102+16
	ldr	r1, .L102+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L102+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L102+28
	ldr	r1, .L102+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L102+36
	ldr	r1, .L102+40
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L102+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L102+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #10
	mov	r0, #100
	mov	r1, #3
	mov	ip, #20
	ldr	r3, .L102+52
	ldr	r4, .L102+56
	str	r2, [r3]
	ldr	r3, .L102+60
	str	r1, [r6]
	str	r2, [r4]
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #52]
	str	ip, [r3, #48]
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L102+16
	ldr	r1, .L102+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L102+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L102+28
	ldr	r1, .L102+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L102+36
	ldr	r1, .L102+40
	mov	lr, pc
	bx	r4
	mov	r3, #3
	str	r3, [r6]
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	state
	.word	prevState
	.word	DMANow
	.word	decor_8x8Tiles
	.word	100720640
	.word	bossroom1Map
	.word	decor_8x8Pal
	.word	100728832
	.word	myspritesheetTiles
	.word	83886592
	.word	myspritesheetPal
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
	ldr	r4, .L120
	ldr	r3, .L120+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L105
	ldr	r2, .L120+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L117
.L105:
	tst	r3, #8
	beq	.L104
	ldr	r5, .L120+8
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L104
	ldr	r6, .L120+12
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L118
.L109:
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L119
.L104:
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L105
.L118:
	bl	goToGame1
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L104
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L109
	b	.L104
.L119:
	pop	{r4, r5, r6, lr}
	b	goToBoss1
.L121:
	.align	2
.L120:
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
	mov	r2, #0
	ldr	r3, .L151
	push	{r4, r5, lr}
	ldrh	lr, [r3]
	ldr	r3, .L151+4
	tst	lr, #64
	str	r2, [r3, #32]
	ldr	ip, [r3]
	ldr	r1, [r3, #16]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #20]
	bne	.L123
	mov	r4, #1
	cmp	r0, #0
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #12]
	subgt	r0, r0, r4
	strgt	r0, [r3, #4]
.L123:
	ands	r4, lr, #128
	bne	.L124
	mov	r5, #1
	str	r4, [r3, #28]
	rsb	r4, r2, #256
	cmp	r4, r0
	ldrgt	r4, [r3, #12]
	addgt	r0, r0, r4
	str	r5, [r3, #32]
	strgt	r0, [r3, #4]
.L124:
	tst	lr, #32
	bne	.L125
	mov	r4, #1
	mov	r5, #2
	cmp	ip, #0
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #8]
	subgt	ip, ip, r4
	str	r5, [r3, #28]
	strgt	ip, [r3]
.L125:
	tst	lr, #16
	bne	.L126
	mov	r5, #3
	mov	r4, #1
	str	r5, [r3, #28]
	rsb	r5, r1, #256
	cmp	r5, ip
	str	r4, [r3, #32]
	ldrgt	r4, [r3, #8]
	addgt	ip, ip, r4
	strgt	ip, [r3]
.L126:
	ldr	r4, .L151+8
	ldrh	r4, [r4]
	tst	r4, #2
	ldr	r4, [r3, #36]
	beq	.L127
	tst	lr, #2
	bne	.L127
	cmp	r4, #0
	moveq	lr, #1
	streq	lr, [r3, #36]
.L128:
	ldr	lr, [r3, #24]
	sub	lr, lr, #1
	cmp	lr, #0
	strgt	lr, [r3, #24]
	ble	.L148
.L129:
	cmp	ip, #0
	movlt	lr, #0
	addge	r4, r1, ip
	movlt	ip, lr
	strlt	lr, [r3]
	movlt	r4, r1
	cmp	r0, #0
	movlt	r5, #0
	movlt	lr, r2
	movlt	r0, r5
	addge	lr, r2, r0
	strlt	r5, [r3, #4]
	cmp	r4, #256
	rsbgt	ip, r1, #256
	strgt	ip, [r3]
	rsb	r1, r1, #240
	cmp	lr, #256
	rsbgt	r0, r2, #256
	add	r1, r1, r1, lsr #31
	rsb	r2, r2, #160
	sub	r1, ip, r1, asr #1
	strgt	r0, [r3, #4]
	ldr	ip, .L151+12
	ldr	r3, .L151+16
	add	r2, r2, r2, lsr #31
	sub	r2, r0, r2, asr #1
	cmp	r1, #0
	str	r1, [ip]
	str	r2, [r3]
	blt	.L149
	cmp	r2, #0
	blt	.L150
	cmp	r1, #16
	movgt	r1, #16
	strgt	r1, [ip]
.L138:
	cmp	r2, #96
	movgt	r2, #96
	strgt	r2, [r3]
.L122:
	pop	{r4, r5, lr}
	bx	lr
.L127:
	cmp	r4, #0
	beq	.L129
	b	.L128
.L150:
	mov	r2, #0
	cmp	r1, #16
	str	r2, [r3]
	ble	.L122
	mov	r3, #16
	pop	{r4, r5, lr}
	str	r3, [ip]
	bx	lr
.L148:
	ldr	lr, [r3, #40]
	ldr	r5, [r3, #44]
	add	lr, lr, #1
	cmp	lr, r5
	str	lr, [r3, #40]
	mov	r4, #5
	movge	lr, #0
	str	r4, [r3, #24]
	strge	lr, [r3, #40]
	strge	lr, [r3, #36]
	b	.L129
.L149:
	mov	r1, #0
	cmp	r2, r1
	str	r1, [ip]
	strlt	r1, [r3]
	bge	.L138
	pop	{r4, r5, lr}
	bx	lr
.L152:
	.align	2
.L151:
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
	mov	r0, #67108864
	ldr	r3, .L174
	ldr	r1, .L174+4
	push	{r4, r5, lr}
	ldr	r2, [r1, #4]
	ldrh	r5, [r3]
	ldr	r3, .L174+8
	ldr	lr, .L174+12
	sub	r2, r2, r5
	ldrh	r4, [r3]
	ldr	ip, .L174+16
	and	r2, r2, #255
	orr	r2, r2, lr
	strh	r2, [ip]	@ movhi
	ldr	r3, [r1]
	strh	r4, [r0, #16]	@ movhi
	strh	r5, [r0, #18]	@ movhi
	ldr	r0, .L174+20
	ldr	r5, .L174+24
	ldr	r2, [r0, #4]
	sub	r3, r3, r4
	lsl	r3, r3, #23
	ldr	r4, [r5]
	add	r2, r2, #1
	lsr	r3, r3, #23
	orr	r3, r3, lr
	cmp	r2, r4
	strh	r3, [ip, #2]	@ movhi
	str	r2, [r0, #4]
	blt	.L154
	mov	r4, #0
	ldr	r3, [r1, #40]
	ldr	lr, .L174+28
	add	r3, r3, #1
	smull	r2, lr, r3, lr
	asr	r2, r3, #31
	add	lr, lr, r3
	rsb	r2, r2, lr, asr #2
	rsb	r2, r2, r2, lsl #3
	sub	r3, r3, r2
	str	r3, [r1, #40]
	str	r4, [r0, #4]
.L154:
	ldr	r3, [r1, #36]
	cmp	r3, #0
	ldr	r2, [r0, #8]
	beq	.L155
	cmp	r2, #1
	movne	r3, #34
	strhne	r3, [ip, #4]	@ movhi
	beq	.L158
	pop	{r4, r5, lr}
	bx	lr
.L155:
	cmp	r2, #1
	beq	.L158
	ldr	r0, [r1, #28]
	cmp	r0, #0
	beq	.L159
	cmp	r0, #1
	beq	.L159
	cmp	r0, #2
	beq	.L159
	cmp	r0, #3
	movne	r0, #0
.L159:
	ldr	r3, [r1, #40]
	ldr	r1, .L174+28
	smull	lr, r1, r3, r1
	add	lr, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, lr, asr #2
	rsb	r1, r1, r1, lsl #3
	sub	r3, r3, r1
	add	r2, r0, r2, lsl #2
	ldr	r1, .L174+32
	add	r3, r3, r2, lsl #6
	and	r3, r1, r3, lsl #1
	strh	r3, [ip, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L158:
	mov	r3, #512
	pop	{r4, r5, lr}
	strh	r3, [ip, #4]	@ movhi
	bx	lr
.L175:
	.align	2
.L174:
	.word	vOff
	.word	player
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	-1840700269
	.word	1022
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
	ldr	r2, .L194
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, .L194+4
	ldrh	r3, [r3]
	beq	.L178
	tst	r3, #1
	bne	.L191
.L178:
	tst	r3, #4
	beq	.L179
	ldr	r2, .L194+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L192
.L179:
	tst	r3, #8
	beq	.L180
	ldr	r3, .L194+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L193
.L180:
	bl	drawPlayer
	ldr	r2, .L194+12
	ldr	r1, .L194+16
	ldr	r3, [r2]
	ldr	r1, [r1]
	sub	r3, r3, r1
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #544
	mvn	r3, r3, lsr #17
	ldr	r1, .L194+20
	ldr	r2, [r2, #4]
	ldr	r1, [r1]
	sub	r2, r2, r1
	ldr	r4, .L194+24
	and	r2, r2, #255
	orr	r2, r2, #40960
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r0, [r4, #12]	@ movhi
	ldr	r1, .L194+28
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L194+32
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L191:
	ldr	r1, .L194+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L178
	ldr	r1, [r2, #8]
	rsbs	r1, r1, #1
	movcc	r1, #0
	str	r1, [r2, #8]
	b	.L178
.L193:
	pop	{r4, lr}
	b	goToPause
.L192:
	pop	{r4, lr}
	b	goToBoss1
.L195:
	.align	2
.L194:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	bossEntrance
	.word	hOff
	.word	vOff
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
	ldr	r2, .L197
	ldr	r1, .L197+4
	ldr	r3, [r2]
	ldr	r1, [r1]
	sub	r3, r3, r1
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #544
	mvn	r3, r3, lsr #17
	ldr	r1, .L197+8
	ldr	r2, [r2, #4]
	ldr	r1, [r1]
	sub	r2, r2, r1
	and	r2, r2, #255
	ldr	r1, .L197+12
	orr	r2, r2, #40960
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	bx	lr
.L198:
	.align	2
.L197:
	.word	bossEntrance
	.word	hOff
	.word	vOff
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
	ldr	r2, .L200
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #5952
	mvn	r3, r3, lsr #18
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r2, .L200+4
	strh	r3, [r2, #42]	@ movhi
	strh	r0, [r2, #40]	@ movhi
	strh	r1, [r2, #44]	@ movhi
	bx	lr
.L201:
	.align	2
.L200:
	.word	startsprite
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
	ldr	r3, .L211
	ldr	r4, .L211+4
	ldr	r0, .L211+8
	ldr	r2, [r3]
	ldr	r6, [r0]
	ldr	r1, [r4]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #56]
	sub	r1, r1, r2
	sub	r3, r3, r6
	ldr	r2, .L211+12
	and	r3, r3, #255
	cmp	r0, #0
	strh	r3, [r2, #16]	@ movhi
	moveq	r3, #512
	ldr	r5, .L211+16
	ldr	lr, .L211+20
	and	ip, r1, r5
	orr	ip, ip, #49152
	strh	ip, [r2, #18]	@ movhi
	strh	lr, [r2, #20]	@ movhi
	strheq	r3, [r2, #24]	@ movhi
	beq	.L204
	cmp	r0, #1
	beq	.L208
	cmp	r0, #2
	beq	.L209
.L204:
	ldr	r3, [r4, #44]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #44]
	ble	.L210
	pop	{r4, r5, r6, lr}
	bx	lr
.L210:
	ldr	r3, .L211+24
	add	r0, r0, #1
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	ldr	r3, .L211+28
	str	r0, [r4, #56]
	mov	lr, pc
	bx	r3
	ldr	r2, .L211+32
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
.L208:
	mov	r1, #512
	ldr	r3, .L211+36
	strh	r1, [r2, #24]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	b	.L204
.L209:
	ldr	lr, .L211+40
	sub	r1, r1, #64
	and	r1, r1, r5
	ldr	r6, .L211+44
	ldr	r5, .L211+48
	orr	r1, r1, lr
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	ip, [r2, #26]	@ movhi
	strh	r6, [r2, #20]	@ movhi
	strh	r5, [r2, #28]	@ movhi
	b	.L204
.L212:
	.align	2
.L211:
	.word	hOff
	.word	waterBoss
	.word	vOff
	.word	shadowOAM
	.word	511
	.word	546
	.word	1431655766
	.word	rand
	.word	-2078209981
	.word	553
	.word	-16384
	.word	559
	.word	567
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
	ldr	r4, .L234
	bl	updatePlayer
	mov	r1, r4
	ldr	r0, .L234+4
	ldr	r3, .L234+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	ldr	r5, .L234+4
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #52]
	mov	r0, r5
	ldr	r1, .L234
	ldr	r3, .L234+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L215
	ldr	r6, .L234+16
.L216:
	bl	drawPlayer
	bl	drawWaterBoss
	ldr	r3, .L234+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L234+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L234+28
	mov	lr, pc
	bx	r4
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L213
	ldr	r3, .L234+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L232
.L213:
	pop	{r4, r5, r6, lr}
	bx	lr
.L215:
	ldr	r3, [r5, #56]
	cmp	r3, #2
	beq	.L233
.L218:
	ldr	r6, .L234+16
	ldrh	r3, [r6]
	tst	r3, #2
	beq	.L216
	ldr	r3, .L234+32
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L216
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L216
	ldr	r3, [r5, #16]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r3, [r5, #16]
	bgt	.L216
	bl	goToWin
	b	.L216
.L233:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L218
	mov	r1, #60
	ldr	r3, [r4, #48]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r3, [r4, #48]
	str	r1, [r4, #52]
	bgt	.L218
	str	r2, [r4, #48]
	bl	goToLose
	b	.L218
.L232:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L235:
	.align	2
.L234:
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
	ldr	r3, .L250
	mov	lr, pc
	bx	r3
	ldr	r3, .L250+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, r3
	ldr	r6, .L250+8
	ldr	r10, .L250+12
	str	r3, [r6]
	ldr	r5, .L250+16
	ldr	r7, .L250+20
	ldr	r9, .L250+24
	ldr	fp, .L250+28
	ldr	r8, .L250+32
	ldr	r4, .L250+36
.L237:
	ldrh	r3, [r10]
.L238:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L238
.L240:
	.word	.L246
	.word	.L245
	.word	.L244
	.word	.L243
	.word	.L242
	.word	.L241
	.word	.L239
.L239:
	ldr	r3, .L250+40
	mov	lr, pc
	bx	r3
.L247:
	ldr	r1, [r6]
	b	.L237
.L241:
	ldr	r3, .L250+44
	mov	lr, pc
	bx	r3
	b	.L247
.L242:
	ldr	r3, .L250+48
	mov	lr, pc
	bx	r3
	b	.L247
.L243:
	ldr	r3, .L250+52
	mov	lr, pc
	bx	r3
	b	.L247
.L244:
	ldr	r3, .L250+56
	mov	lr, pc
	bx	r3
	b	.L247
.L245:
	ldr	r3, .L250+60
	mov	lr, pc
	bx	r3
	b	.L247
.L246:
	ldr	r3, [r9]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mov	r1, #5952
	mvn	r3, r3, lsr #18
	ldrb	r2, [r9, #4]	@ zero_extendqisi2
	strh	r3, [r7, #42]	@ movhi
	strh	r1, [r7, #44]	@ movhi
	strh	r2, [r7, #40]	@ movhi
	mov	lr, pc
	bx	fp
	mov	r1, #67108864
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
	b	.L247
.L251:
	.align	2
.L250:
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
	ldr	r3, .L254
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L254+4
	ldr	r3, .L254+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L255:
	.align	2
.L254:
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
	ldr	r3, .L258
	ldr	r2, .L258+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L258+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L259:
	.align	2
.L258:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	prevState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.global	animationSpeed
	.global	animationCounter
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
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	animationSpeed, %object
	.size	animationSpeed, 4
animationSpeed:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	muShengUnlocked, %object
	.size	muShengUnlocked, 4
muShengUnlocked:
	.space	4
	.type	animationCounter, %object
	.size	animationCounter, 4
animationCounter:
	.space	4
	.type	currentCharacter, %object
	.size	currentCharacter, 4
currentCharacter:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
