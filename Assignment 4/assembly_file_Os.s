	.arch armv8-a
	.text
	.align	2
	.globl _factorial_recursion
_factorial_recursion:
LFB2:
	mov	w1, w0
	mov	w0, 1
L3:
	cmp	w1, 1
	bls	L4
	mul	w0, w0, w1
	sub	w1, w1, #1
	b	L3
L4:
	ret
LFE2:
	.cstring
lC0:
	.ascii "Factorial using loops is : %d\12\0"
	.text
	.align	2
	.globl _factorial_loops
_factorial_loops:
LFB3:
	sub	sp, sp, #32
LCFI0:
	mov	w1, 1
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
L6:
	cmp	w0, 0
	bgt	L7
	str	w1, [sp]
	adrp	x0, lC0@PAGE
	add	x0, x0, lC0@PAGEOFF;momd
	bl	_printf
	ldp	x29, x30, [sp, 16]
	mov	w0, 0
	add	sp, sp, 32
LCFI2:
	ret
L7:
LCFI3:
	mul	w1, w1, w0
	sub	w0, w0, #1
	b	L6
LFE3:
	.cstring
lC1:
	.ascii "Enter n of which factorial has to be calculated :\0"
lC2:
	.ascii "%d\0"
lC3:
	.ascii "Factorial using recursion is : %d\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.globl _main
_main:
LFB1:
	sub	sp, sp, #48
LCFI4:
	adrp	x0, lC1@PAGE
	add	x0, x0, lC1@PAGEOFF;momd
	stp	x29, x30, [sp, 16]
LCFI5:
	add	x29, sp, 16
	bl	_puts
	add	x0, sp, 44
	str	x0, [sp]
	adrp	x0, lC2@PAGE
	add	x0, x0, lC2@PAGEOFF;momd
	bl	_scanf
	ldr	w0, [sp, 44]
	bl	_factorial_recursion
	str	w0, [sp]
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	ldr	w0, [sp, 44]
	bl	_factorial_loops
	ldp	x29, x30, [sp, 16]
	mov	w0, 0
	add	sp, sp, 48
LCFI6:
	ret
LFE1:
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
	.quad	LFB2-.
	.set L$set$2,LFE2-LFB2
	.quad L$set$2
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB3-.
	.set L$set$4,LFE3-LFB3
	.quad L$set$4
	.uleb128 0
	.byte	0x4
	.set L$set$5,LCFI0-LFB3
	.long L$set$5
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0xb
	.align	3
LEFDE3:
LSFDE5:
	.set L$set$9,LEFDE5-LASFDE5
	.long L$set$9
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB1-.
	.set L$set$10,LFE1-LFB1
	.quad L$set$10
	.uleb128 0
	.byte	0x4
	.set L$set$11,LCFI4-LFB1
	.long L$set$11
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.set L$set$12,LCFI5-LCFI4
	.long L$set$12
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$13,LCFI6-LCFI5
	.long L$set$13
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE5:
	.ident	"GCC: (Homebrew GCC 13.2.0) 13.2.0"
	.subsections_via_symbols
