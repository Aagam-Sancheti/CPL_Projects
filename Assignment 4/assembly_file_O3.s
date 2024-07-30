	.arch armv8-a
	.text
	.cstring
	.align	3
lC0:
	.ascii "Enter n of which factorial has to be calculated :\0"
	.align	3
lC1:
	.ascii "%d\0"
	.align	3
lC2:
	.ascii "Factorial using recursion is : %d\12\0"
	.align	3
lC3:
	.ascii "Factorial using loops is : %d\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 4,,11
	.globl _main
_main:
LFB1:
	sub	sp, sp, #48
LCFI0:
	adrp	x0, lC0@PAGE
	add	x0, x0, lC0@PAGEOFF;momd
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
	bl	_puts
	add	x0, sp, 44
	str	x0, [sp]
	adrp	x0, lC1@PAGE
	add	x0, x0, lC1@PAGEOFF;momd
	bl	_scanf
	ldr	w1, [sp, 44]
	cmp	w1, 1
	bls	L97
	sub	w0, w1, #2
	sub	w2, w1, #1
	cmp	w0, 13
	bls	L14
	adrp	x0, lC4@PAGE
	dup	v0.4s, w1
	movi	v1.4s, 0x1
	lsr	w3, w2, 2
	ldr	q2, [x0, #lC4@PAGEOFF]
	mov	w0, 0
	mvni	v3.4s, 0x3
	add	v0.4s, v0.4s, v2.4s
	.p2align 3,,7
L7:
	mov	v2.16b, v0.16b
	add	w0, w0, 1
	add	v0.4s, v0.4s, v3.4s
	mul	v1.4s, v1.4s, v2.4s
	cmp	w3, w0
	bne	L7
	movi	v0.4s, 0
	ext	v2.16b, v1.16b, v0.16b, #8
	mul	v1.4s, v2.4s, v1.4s
	ext	v0.16b, v1.16b, v0.16b, #4
	mul	v0.4s, v0.4s, v1.4s
	fmov	w0, s0
	tst	x2, 3
	beq	L8
	and	w2, w2, -4
	sub	w1, w1, w2
	sub	w2, w1, #1
L5:
	mul	w0, w0, w1
	cmp	w2, 1
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #2
	cmp	w1, 3
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #3
	cmp	w1, 4
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #4
	cmp	w1, 5
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #5
	cmp	w1, 6
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #6
	cmp	w1, 7
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #7
	cmp	w1, 8
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #8
	cmp	w1, 9
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #9
	cmp	w1, 10
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #10
	cmp	w1, 11
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #11
	cmp	w1, 12
	beq	L8
	mul	w0, w0, w2
	sub	w2, w1, #12
	cmp	w1, 13
	beq	L8
	mul	w0, w2, w0
	sub	w1, w1, #13
	mul	w0, w1, w0
	.p2align 3,,7
L8:
	str	w0, [sp]
	adrp	x0, lC2@PAGE
	add	x0, x0, lC2@PAGEOFF;momd
	bl	_printf
	ldr	w0, [sp, 44]
	mov	w1, 1
	cmp	w0, 0
	ble	L4
	cmp	w0, 14
	ble	L15
	adrp	x1, lC4@PAGE
	dup	v0.4s, w0
	movi	v1.4s, 0x1
	lsr	w2, w0, 2
	ldr	q2, [x1, #lC4@PAGEOFF]
	mov	w1, 0
	mvni	v3.4s, 0x3
	add	v0.4s, v0.4s, v2.4s
	.p2align 3,,7
L11:
	mov	v2.16b, v0.16b
	add	w1, w1, 1
	add	v0.4s, v0.4s, v3.4s
	mul	v1.4s, v1.4s, v2.4s
	cmp	w2, w1
	bne	L11
	movi	v0.4s, 0
	and	w2, w0, -4
	ext	v2.16b, v1.16b, v0.16b, #8
	mul	v1.4s, v2.4s, v1.4s
	ext	v0.16b, v1.16b, v0.16b, #4
	mul	v0.4s, v0.4s, v1.4s
	fmov	w1, s0
	cmp	w0, w2
	beq	L4
	sub	w0, w0, w2
L10:
	mul	w1, w1, w0
	subs	w2, w0, #1
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #2
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #3
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #4
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #5
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #6
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #7
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #8
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #9
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #10
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #11
	beq	L4
	mul	w1, w1, w2
	subs	w2, w0, #12
	beq	L4
	mul	w1, w1, w2
	subs	w0, w0, #13
	beq	L4
	mul	w1, w1, w0
L4:
	str	w1, [sp]
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	ldp	x29, x30, [sp, 16]
	mov	w0, 0
	add	sp, sp, 48
LCFI2:
	ret
L97:
LCFI3:
	mov	w0, 1
	b	L8
L14:
	mov	w0, 1
	b	L5
L15:
	mov	w1, 1
	b	L10
LFE1:
	.text
	.align	2
	.p2align 4,,11
	.globl _factorial_recursion
_factorial_recursion:
LFB2:
	mov	w2, w0
	mov	w0, 1
	cmp	w2, 1
	bls	L98
	sub	w0, w2, #2
	sub	w1, w2, #1
	cmp	w0, 13
	bls	L105
	adrp	x0, lC4@PAGE
	dup	v0.4s, w2
	movi	v1.4s, 0x1
	lsr	w3, w1, 2
	ldr	q2, [x0, #lC4@PAGEOFF]
	mov	w0, 0
	mvni	v3.4s, 0x3
	add	v0.4s, v0.4s, v2.4s
	.p2align 3,,7
L102:
	mov	v2.16b, v0.16b
	add	w0, w0, 1
	add	v0.4s, v0.4s, v3.4s
	mul	v1.4s, v1.4s, v2.4s
	cmp	w0, w3
	bne	L102
	movi	v0.4s, 0
	ext	v2.16b, v1.16b, v0.16b, #8
	mul	v1.4s, v2.4s, v1.4s
	ext	v0.16b, v1.16b, v0.16b, #4
	mul	v0.4s, v0.4s, v1.4s
	fmov	w0, s0
	tst	x1, 3
	beq	L98
	and	w1, w1, -4
	sub	w2, w2, w1
	sub	w1, w2, #1
L100:
	mul	w0, w0, w2
	cmp	w1, 1
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #2
	cmp	w2, 3
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #3
	cmp	w2, 4
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #4
	cmp	w2, 5
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #5
	cmp	w2, 6
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #6
	cmp	w2, 7
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #7
	cmp	w2, 8
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #8
	cmp	w2, 9
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #9
	cmp	w2, 10
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #10
	cmp	w2, 11
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #11
	cmp	w2, 12
	beq	L98
	mul	w0, w0, w1
	sub	w1, w2, #12
	cmp	w2, 13
	beq	L98
	mul	w1, w1, w0
	sub	w2, w2, #13
	mul	w0, w2, w1
L98:
	ret
L105:
	mov	w0, 1
	b	L100
LFE2:
	.align	2
	.p2align 4,,11
	.globl _factorial_loops
_factorial_loops:
LFB3:
	sub	sp, sp, #32
LCFI4:
	stp	x29, x30, [sp, 16]
LCFI5:
	add	x29, sp, 16
	cmp	w0, 0
	ble	L151
	cmp	w0, 14
	ble	L152
	adrp	x1, lC4@PAGE
	dup	v0.4s, w0
	movi	v1.4s, 0x1
	lsr	w2, w0, 2
	ldr	q2, [x1, #lC4@PAGEOFF]
	mov	w1, 0
	mvni	v3.4s, 0x3
	add	v0.4s, v0.4s, v2.4s
	.p2align 3,,7
L148:
	mov	v2.16b, v0.16b
	add	w1, w1, 1
	add	v0.4s, v0.4s, v3.4s
	mul	v1.4s, v1.4s, v2.4s
	cmp	w1, w2
	bne	L148
	movi	v0.4s, 0
	and	w2, w0, -4
	ext	v2.16b, v1.16b, v0.16b, #8
	mul	v1.4s, v2.4s, v1.4s
	ext	v0.16b, v1.16b, v0.16b, #4
	mul	v0.4s, v0.4s, v1.4s
	fmov	w1, s0
	cmp	w0, w2
	beq	L146
	sub	w0, w0, w2
L147:
	mul	w1, w1, w0
	subs	w2, w0, #1
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #2
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #3
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #4
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #5
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #6
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #7
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #8
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #9
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #10
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #11
	beq	L146
	mul	w1, w1, w2
	subs	w2, w0, #12
	beq	L146
	mul	w1, w1, w2
	subs	w0, w0, #13
	mul	w0, w1, w0
	csel	w1, w0, w1, ne
L146:
	str	w1, [sp]
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	ldp	x29, x30, [sp, 16]
	mov	w0, 0
	add	sp, sp, 32
LCFI6:
	ret
	.p2align 2,,3
L151:
LCFI7:
	mov	w1, 1
	str	w1, [sp]
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	ldp	x29, x30, [sp, 16]
	mov	w0, 0
	add	sp, sp, 32
LCFI8:
	ret
L152:
LCFI9:
	mov	w1, 1
	b	L147
LFE3:
	.literal16
	.align	4
lC4:
	.word	0
	.word	-1
	.word	-2
	.word	-3
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB1-.
	.set L$set$2,LFE1-LFB1
	.quad L$set$2
	.uleb128 0
	.byte	0x4
	.set L$set$3,LCFI0-LFB1
	.long L$set$3
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xb
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$7,LEFDE3-LASFDE3
	.long L$set$7
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB2-.
	.set L$set$8,LFE2-LFB2
	.quad L$set$8
	.uleb128 0
	.align	3
LEFDE3:
LSFDE5:
	.set L$set$9,LEFDE5-LASFDE5
	.long L$set$9
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB3-.
	.set L$set$10,LFE3-LFB3
	.quad L$set$10
	.uleb128 0
	.byte	0x4
	.set L$set$11,LCFI4-LFB3
	.long L$set$11
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$12,LCFI5-LCFI4
	.long L$set$12
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.set L$set$13,LCFI6-LCFI5
	.long L$set$13
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$14,LCFI7-LCFI6
	.long L$set$14
	.byte	0xb
	.byte	0x4
	.set L$set$15,LCFI8-LCFI7
	.long L$set$15
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$16,LCFI9-LCFI8
	.long L$set$16
	.byte	0xb
	.align	3
LEFDE5:
	.ident	"GCC: (Homebrew GCC 13.2.0) 13.2.0"
	.subsections_via_symbols
