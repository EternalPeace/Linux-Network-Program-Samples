/*-
 * Copyright (c) 1985 The Regents of the University of California.
 * All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Computer Consoles Inc.
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
 *
 *	@(#)Kcvtlf.s	7.1 (Berkeley) 12/6/90
 */

#include "../math/fp.h"
#include "../math/Kfp.h"
#include "../tahoe/SYS.h"

	.text
ENTRY(Kcvtlf, R5|R4|R3|R2)
	clrl	r1
	clrl	r4		# r4 - negative flag.
	clrl	r2		# r2 - exponent.
	movl	12(fp),r0	# fetch operand.
	movl	r0,r5		# need another copy.
	jeql	retzero		# return zero.
	jgtr	positive
	mnegl	r0,r0
	jvs	retmin		# return minimum integer.
	incl	r4		# remember it was negative.
	movl	r0,r5		# remember the negated value.
 #
 #Compute exponent:
 #
positive:
	ffs	r0,r1
	incl 	r1
	addl2	r1,r2
	shrl	r1,r0,r0
	jneq	positive	# look for more set bits.
 #
 #we have the exponent in r2.
 #
	movl	r5,r0		# r0 will hold the resulting f.p. number.
 #
 #Shift the fraction part to its proper place:
 #
	subl3	r2,$HID_POS,r3
	jlss	shiftr		# if less then zero we have to shift right.
	shll	r3,r0,r0	# else we shift left.
	jmp	shifted
shiftr:
	mnegl	r3,r3
	shrl	r3,r0,r0
shifted:
	andl2	$CLEARHID,r0	# clear the hidden bit.
	shal	$EXPSHIFT,r2,r2	# shift the exponent to its proper place.
	orl2	$EXPSIGN,r2	# set the exponent sign bit(to bias it).
	orl2	r2,r0		# combine exponent & fraction.
	bbc	$0,r4,sign_ok	# do we  have to set the sign bit?
	orl2	$SIGNBIT,r0	# yes...
sign_ok:
	ret

retzero:
	clrl 	r0
	ret

retmin:
 	movl	$0xd0000000,r0
	ret
