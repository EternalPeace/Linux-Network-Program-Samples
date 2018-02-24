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
 *	@(#)Ksqrtf.s	7.1 (Berkeley) 12/6/90
 */

#include "../tahoe/SYS.h"

	.text
ENTRY(Ksqrtf, 0)
	subl3	$76,fp,sp
	tstl	4(fp)			# if (arg <= 0.) {
	jgtr	L18
	jgeq	L19			# if (arg < 0.)
L19:	clrl	r1
	clrl	r0
	ret				# return(0.);}
L18:	
	pushl	20(fp)			# hfs
	subl3	$72,fp,-(sp)
	pushl	8(fp)
	pushl	4(fp)
	callf	$20,_Kfrexpf
	clrl	-60+4(fp)
	movl	r0,-60(fp)		# x = frexp(arg,&exp);
	jbr	L20
L2000001:
	pushl	20(fp)			# hfs
	ldd	two
	pushd
	ldd	-60(fp)
	pushd
	callf	$24,_Kmuld		# x * 2
	ldd	r0
	std	-60(fp)			# x *= 2;
	decl	-72(fp)			# exp--;}
L20:	cmpd2	-60(fp),half		# while(x < 0.5){
	jlss	L2000001
	bitl	$1,-72(fp)		# if(exp & 1) {
	jeql	L24
	pushl	20(fp)			# hfs
	ldd	two
	pushd
	ldd	-60(fp)
	pushd
	callf	$24,_Kmuld		# x * 2
	ldd	r0
	std	-60(fp)			# x *= 2;
	decl	-72(fp)			# exp--;}
L24:	pushl	20(fp)			# hfs
	ldd	-60(fp)
	pushd
	ldd	one
	pushd
	callf	$24,_Kaddd		# (1.0+x)
	pushl	20(fp)			# hfs
	ldd	r0
	pushd
	ldd	half
	pushd
	callf	$24,_Kmuld
	ldd	r0
	std	-68(fp)			 # temp=0.5*(1.0+x);
	jbr	L28
L2000003:
	pushl	20(fp)			# hfs
	ldd	big
	pushd
	ldd	-68(fp)
	pushd
	callf	$24,_Kmuld		# temp*(1L<<30)
	ldd	r0
	std	-68(fp)			# temp *=(1L<<30);
	subl2	$60,-72(fp)		# exp -= 60;}
L28:	cmpl	-72(fp),$60		# while(exp > 60){
	jleq	L31
	jbr	L2000003
L2000005:
	pushl	20(fp)			# hfs
	ldd	big
	pushd
	ldd	-68(fp)
	pushd
	callf	$24,_Kdivd
	ldd	r0
	std	-68(fp)			# temp /= (1L<<30);
	addl2	$60,-72(fp)		# exp +=60;}
L31:	cmpl	-72(fp),$-60		# while(exp < -60) {
	jlss	L2000005
	tstl	-72(fp)			# if(exp >=0)
	jlss	L34
	divl3	$2,-72(fp),r0
	shll	r0,$1,r0
	pushl	20(fp)			# hfs
	pushl	$0
	pushl	r0
	pushl	$0
	pushl	$0
	callf	$24,_Kcvtld
	pushl	20(fp)			# hfs
	ldd	r0
	pushd
	ldd	-68(fp)
	pushd
	callf	$24,_Kmuld		# temp * (1L <<(exp/2))
	jbr	L2000006		# temp *= 1L << (exp/2));
L34:	mnegl	-72(fp),r0		# -exp
	divl2	$2,r0			# -exp/2
	shll	r0,$1,r0
	pushl	20(fp)			# hfs
	pushl	$0
	pushl	r0
	pushl	$0
	pushl	$0
	callf	$24,_Kcvtld
	pushl	20(fp)			# hfs
	ldd	r0
	pushd
	ldd	-68(fp)
	pushd
	callf	$24,_Kdivd		# temp / (1L <<(-exp/2))
L2000006:
	ldd	r0
	std	-68(fp)			# temp (*/)= 1L << (exp/2));
	clrl	-76(fp)
L2000008:
	pushl	20(fp)			# hfs
	ldd	-68(fp)
	pushd
	ldd	4(fp)
	pushd
	callf	$24,_Kdivd
	pushl	20(fp)			# hfs
	ldd	r0
	pushd
	ldd	-68(fp)
	pushd
	callf	$24,_Kaddd
	pushl	20(fp)			# hfs
	ldd	r0	
	pushd
	ldd	half
	pushd
	callf	$24,_Kmuld
	ldd	r0
	std	-68(fp)			# temp=0.5*(temp+arg/temp);
	aobleq	$3,-76(fp),L2000008
	ldd	-68(fp)
	cvdf
	stf	r0
	ret

	.data
	.align	2
half:	.long	0x40000000, 0x00000000 # .double .5
two:	.long	0x41000000, 0x00000000 # .double 2
one:	.long	0x40800000, 0x00000000 # .double 1
big:	.long	0x4F800000, 0x00000000 # .double (1<<30)
