# Copyright (c) 1987, 1993
#	The Regents of the University of California.  All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#	This product includes software developed by the University of
#	California, Berkeley and its contributors.
# 4. Neither the name of the University nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
#	@(#)cabs.s	8.1 (Berkeley) 6/4/93
#
	.data
	.align	2
_sccsid:
.asciz	"@(#)cabs.s	8.1	8.1	(ucb.elefunt)	6/4/93"

# double precision complex absolute value
# CABS by W. Kahan, 9/7/80.
# Revised for reserved operands by E. LeBlanc, 8/18/82
# argument for complex absolute value by reference, *4(fp)
# argument for cabs and hypot (C fcns) by value, 4(fp)
# output is in r0:r1

	.text
	.align	2
	.globl  _cabs
	.globl  _hypot
	.globl	_z_abs

#	entry for c functions cabs and hypot
_cabs:
_hypot:
	.word	0x807c		# save r2-r6, enable floating overflow
	movl	16(fp),r3
	movl	12(fp),r2	# r2:3 = y
	movl	8(fp),r1
	movl	4(fp),r0	# r0:1 = x
	brb	1f
#	entry for Fortran use, call by:   d = abs(z)
_z_abs:
	.word	0x807c		# save r2-r6, enable floating overflow
	movl	4(fp),r4	# indirect addressing is necessary here
	movl	12(r4),r3	#
	movl	8(r4),r2	# r2:3 = y
	movl	4(r4),r1	#
	movl	(r4),r0		# r0:1 = x
1:	andl3	$0xff800000,r0,r4	# r4 has signed biased exp of x
	cmpl	$0x80000000,r4
	beql	2f		# x is a reserved operand, so return it
	andl3	$0xff800000,r2,r5	# r5 has signed biased exp of y
	cmpl	$0x80000000,r5
	bneq	3f		# y isn't a reserved operand
	movl	r3,r1
	movl	r2,r0		# return y if it's reserved
2:	ret

3:	callf	$4,regs_set	# r0:1 = dsqrt(x^2+y^2)/2^r6
	addl2	r6,r0		# unscaled cdabs in r0:1
	jvc	2b		# unless it overflows
	subl2	$0x800000,r0	# halve r0 to get meaningful overflow
	ldd	r0
	addd	r0		# overflow; r0 is half of true abs value
	ret

regs_set:
	.word	0x0000
	andl2	$0x7fffffff,r0	# r0:r1 = dabs(x)
	andl2	$0x7fffffff,r2	# r2:r3 = dabs(y)
	cmpl	r0,r2
	bgeq	4f
	movl	r1,r5
	movl	r0,r4
	movl	r3,r1
	movl	r2,r0
	movl	r5,r3
	movl	r4,r2		# force y's exp <= x's exp
4:	andl3	$0xff800000,r0,r6	# r6 = exponent(x) + bias(129)
	beql	5f		# if x = y = 0 then cdabs(x,y) = 0
	subl2	$0x47800000,r6	# r6 = exponent(x) - 14
	subl2	r6,r0		# 2^14 <= scaled x < 2^15
	bitl	$0xff800000,r2
	beql	5f		# if y = 0 return dabs(x)
	subl2	r6,r2
	cmpl	$0x37800000,r2	# if scaled y < 2^-18
	bgtr	5f		#   return dabs(x)
	ldd	r0
	muld	r0
	std	r0		# r0:1 = scaled x^2
	ldd	r2
	muld	r2		# acc = scaled y^2
	addd	r0
	std	r0
	pushl	r1
	pushl	r0
	callf	$12,_sqrt	# r0:1 = dsqrt(x^2+y^2)/2^r6
5:	ret
