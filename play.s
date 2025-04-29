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
	.file	"play.c"
	.text
	.align	2
	.global	playSong
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	ldr	r2, .L4+4
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #2
	ldr	r1, [r0, #12]
	push	{r4, lr}
	ldr	r0, [r0, #16]
	ldr	r2, [r2, #12]
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r0, #49152
	mvn	r1, #59
	ldr	r3, .L4+12
	pop	{r4, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	songs
	.word	soundA
	.word	playSoundA
	.word	67109120
	.size	playSong, .-playSong
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"surge\000"
	.text
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	ldr	r3, .L8
	ldr	r1, .L8+4
	ldr	r2, [r3]
	ldr	r3, .L8+8
	str	lr, [sp, #-4]!
	ldr	ip, .L8+12
	ldr	lr, [r1]
	ldr	r1, .L8+16
	str	r2, [r3, #8]
	ldr	r2, .L8+20
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	r1, [r3]
	ldr	lr, [sp], #4
	str	r0, [r2]
	b	playSong
.L9:
	.align	2
.L8:
	.word	surge_sampleRate
	.word	surge_length
	.word	songs
	.word	surge_data
	.word	.LC0
	.word	currentSong
	.size	init, .-init
	.comm	currentSong,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,60,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
