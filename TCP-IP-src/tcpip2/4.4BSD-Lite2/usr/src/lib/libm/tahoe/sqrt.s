/*
 * Copyright (c) 1987, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
	.data
	.align	2
_sccsid:
.asciz	"@(#)sqrt.s	8.1	(ucb.elefunt)	6/4/93"

/*
 * double sqrt(arg)   revised August 15,1982
 * double arg;
 * if(arg<0.0) { _errno = EDOM; return(<a reserved operand>); }
 * if arg is a reserved operand it is returned as it is
 * W. Kahan's magic square root
 * Coded by Heidi Stettner and revised by Emile LeBlanc 8/18/82.
 * Re-coded in tahoe assembly language by Z. Alex Liu 7/13/87.
 *
 * entry points:_d_sqrt		address of double arg is on the stack
 *		_sqrt		double arg is on the stack
 */
	.text
	.align	2
	.globl	_sqrt
	.globl	_d_sqrt
	.globl	libm$dsqrt_r5
	.set	EDOM,33

_d_sqrt:
	.word	0x003c          # save r2-r5
	movl	4(fp),r2
	movl	(r2),r0
	movl	4(r2),r1	# r0:r1 = x
	brb  	1f
_sqrt:
	.word	0x003c          # save r2-r5
	movl    4(fp),r0
	movl	8(fp),r1	# r0:r1 = x
1:	andl3	$0x7f800000,r0,r2	# r2 = biased exponent
	bneq	2f
	ret			# biased exponent is zero -> 0 or reserved op.
/*
 *				# internal procedure
 *				# ENTRY POINT FOR cdabs and cdsqrt
 */
libm$dsqrt_r5:			# returns double square root scaled by 2^r6
	.word	0x0000		# save nothing
2:	ldd	r0
	std	r4
	bleq	nonpos		# argument is not positive
	andl3	$0xfffe0000,r4,r2
	shar	$1,r2,r0
	addl2	$0x203c0000,r0	# r0 has magic initial approximation
/*
 *				# Do two steps of Heron's rule
 *				# ((arg/guess)+guess)/2 = better guess
 */
	ldf	r4
	divf	r0
	addf	r0
	stf	r0
	subl2	$0x800000,r0	# divide by two
	ldf	r4
	divf	r0
	addf	r0
	stf	r0
	subl2	$0x800000,r0	# divide by two
/*
 *				# Scale argument and approximation
 *				# to prevent over/underflow
 */
	andl3	$0x7f800000,r4,r1
	subl2	$0x40800000,r1	# r1 contains scaling factor
	subl2	r1,r4		# r4:r5 = n/s
	movl	r0,r2
	subl2	r1,r2		# r2 = a/s
/*
 *				# Cubic step
 *				# b = a+2*a*(n-a*a)/(n+3*a*a) where
 *				# b is better approximation, a is approximation
 *				# and n is the original argument.
 *				# s := scale factor.
 */
	clrl	r1		# r0:r1 = a
	clrl	r3		# r2:r3 = a/s
	ldd	r0		# acc = a
	muld	r2		# acc = a*a/s
	std	r2		# r2:r3 = a*a/s
	negd			# acc = -a*a/s
	addd	r4		# acc = n/s-a*a/s
	std	r4		# r4:r5 = n/s-a*a/s
	addl2	$0x1000000,r2	# r2:r3 = 4*a*a/s
	ldd	r2		# acc = 4*a*a/s
	addd	r4		# acc = n/s+3*a*a/s
	std	r2		# r2:r3 = n/s+3*a*a/s
	ldd	r0		# acc = a
	muld	r4		# acc = a*n/s-a*a*a/s
	divd	r2		# acc = a*(n-a*a)/(n+3*a*a)
	std	r4		# r4:r5 = a*(n-a*a)/(n+3*a*a)
	addl2	$0x800000,r4	# r4:r5 = 2*a*(n-a*a)/(n+3*a*a)
	ldd	r4		# acc = 2*a*(n-a*a)/(n+3*a*a)
	addd	r0		# acc = a+2*a*(n-a*a)/(n+3*a*a)
	std	r0		# r0:r1 = a+2*a*(n-a*a)/(n+3*a*a)
	ret			# rsb
nonpos:
	bneq	negarg
	ret			# argument and root are zero
negarg:
	pushl	$EDOM
	callf	$8,_infnan	# generate the reserved op fault
	ret
