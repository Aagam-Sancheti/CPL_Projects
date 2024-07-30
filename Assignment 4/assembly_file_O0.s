// non optimised code for calculating the factorial 

	.arch armv8-a      // code is written for the ARMv8 Architecture
	.text              // this header gives information regarding sections and alignment of memory 
	.cstring
	.align	3         // specifies the memory alignment boundary of 8 bytes, 2^3
lC0:
	.ascii "Enter n of which factorial has to be calculated :\0"
	.align	3
lC1:
	.ascii "%d\0"         // format specifiers
	.align	3
lC2:
	.ascii "Factorial using recursion is : %d\12\0"
	.text
	.align	2
	.globl _main
_main:           // main function, the entry point of program, 
LFB1:
	sub	sp, sp, #48      // initialization of Stack 
LCFI0:
	stp	x29, x30, [sp, 16]        //saves the previous memory frame pointer 
LCFI1:
	add	x29, sp, 16             
	adrp	x0, lC0@PAGE
	add	x0, x0, lC0@PAGEOFF;momd                //calling the lC0 code block
	bl	_puts              // promting the user to enter n , using _puts function
	add	x0, sp, 44
	str	x0, [sp]
	adrp	x0, lC1@PAGE
	add	x0, x0, lC1@PAGEOFF;momd
	bl	_scanf             // _scanf will read the output
	ldr	w0, [sp, 44]
	bl	_factorial_recursion                // function call to recursion function
	str	w0, [sp]
	adrp	x0, lC2@PAGE                
	add	x0, x0, lC2@PAGEOFF;momd
	bl	_printf             // _printf will print the final factorial obtained by recursion
	ldr	w0, [sp, 44]
	bl	_factorial_loops               //calling the _factorial_loops function 
	mov	w0, 0                          // bl is function calling method , called as branch link (bl)
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 48
LCFI2:                
	ret
LFE1:                                 // Each function has a prologue (starting from LFB) and an epilogue (ending with LFE),
	.align	2                         // which handle stack frame setup and cleanup.
	.globl _factorial_recursion
_factorial_recursion:
LFB2:
	stp	x29, x30, [sp, -48]!
LCFI3:
	mov	x29, sp                   // basic implementation of the same code using assembly functions 
	str	w0, [sp, 28]             // MOV - MOVE
	ldr	w0, [sp, 28]            // STR - STORE 
	cmp	w0, 1                  // CMP - COMPARE 
	beq	L4                    // BEQ - BRANCH IF EQUAL 
	ldr	w0, [sp, 28]            // LDR - LOAD 
	cmp	w0, 0
	bne	L5                 // BNE - BRANCH IF NOT EQUAL
L4:
	mov	w0, 1
	b	L6
L5:
	ldr	w0, [sp, 28]
	sub	w0, w0, #1                  // SUB - SUBSTRACTION 
	bl	_factorial_recursion                 // BL - BRANCH LINK 
	str	w0, [sp, 44]
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 28]
	mul	w0, w1, w0                 // MUL - MULTIPLY 
	str	w0, [sp, 40]
	ldr	w0, [sp, 40]
L6:
	ldp	x29, x30, [sp], 48
LCFI4:
	ret
LFE2:
	.cstring                 //MEMORY alignment specifiers (CONSTANT STIRNG LITERALS AND ALIGN NUMBERING)
	.align	3
lC3:
	.ascii "Factorial using loops is : %d\12\0"    // Format specifiers like %d are used with _scanf and _printf to read and print integers.
	.text
	.align	2
	.globl _factorial_loops
_factorial_loops:
LFB3:
	sub	sp, sp, #64
LCFI5:
	stp	x29, x30, [sp, 16]
LCFI6:
	add	x29, sp, 16
	str	w0, [sp, 44]
	mov	w0, 1
	str	w0, [sp, 60]
	ldr	w0, [sp, 44]
	str	w0, [sp, 56]
	b	L8
L9:
	ldr	w1, [sp, 60]
	ldr	w0, [sp, 56]
	mul	w0, w1, w0
	str	w0, [sp, 60]
	ldr	w0, [sp, 56]
	sub	w0, w0, #1
	str	w0, [sp, 56]
L8:                           // VARIOUS FUNCTIONS AS PER REQUIREMENT AND FUNCTION CALL
	ldr	w0, [sp, 56]
	cmp	w0, 0
	bgt	L9                   // Conditional branching (beq, bne, bgt) is used for control flow
	ldr	w0, [sp, 60]
	str	w0, [sp]
	adrp	x0, lC3@PAGE
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	mov	w0, 0
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 64
LCFI7:
	ret
LFE3:
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
LASFDE1:                           // code block of exception handling frame information
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
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$6,LEFDE3-LASFDE3
	.long L$set$6
LASFDE3:                         // AGAIN EXCEPTION AND ERROR HANDLING CODE BLOCKS ADDED BY COMPILER BY DEFAULT
	.long	LASFDE3-EH_frame1
	.quad	LFB2-.
	.set L$set$7,LFE2-LFB2
	.quad L$set$7
	.uleb128 0
	.byte	0x4
	.set L$set$8,LCFI3-LFB2
	.long L$set$8
	.byte	0xe
	.uleb128 0x30
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE3:
LSFDE5:
	.set L$set$10,LEFDE5-LASFDE5
	.long L$set$10
LASFDE5:                       // THIS IS LIKE TRY-CATCH- FINALLY KIND OF SEQUENCE OF ERROR HANDLING 
	.long	LASFDE5-EH_frame1
	.quad	LFB3-.
	.set L$set$11,LFE3-LFB3
	.quad L$set$11
	.uleb128 0
	.byte	0x4
	.set L$set$12,LCFI5-LFB3
	.long L$set$12
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.set L$set$13,LCFI6-LCFI5
	.long L$set$13
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$14,LCFI7-LCFI6
	.long L$set$14
	.byte	0xdd
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE5:
	.ident	"GCC: (Homebrew GCC 13.2.0) 13.2.0"
	.subsections_via_symbols
