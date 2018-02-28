	.file	"combinesum.c"
.globl combine1_descr
	.data
	.align 32
	.type	combine1_descr,@object
	.size	combine1_descr,42
combine1_descr:
	.string	"combine1: Maximum use of data abstraction"
	.text
	.p2align 2,,3
.globl combine1
	.type	combine1,@function
combine1:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	12(%ebp), %esi
	movl	8(%ebp), %edi
	xorl	%ebx, %ebx
	movl	$0x0, (%esi)
	.p2align 2,,3
.L2:
	subl	$12, %esp
	pushl	%edi
	call	vec_length
	addl	$16, %esp
	cmpl	%eax, %ebx
	jge	.L7
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
	pushl	%edi
	call	get_vec_element
	flds	-16(%ebp)
	fadds	(%esi)
	fstps	(%esi)
	addl	$16, %esp
	incl	%ebx
	jmp	.L2
.L7:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe1:
	.size	combine1,.Lfe1-combine1
.globl combine2_descr
	.data
	.align 32
	.type	combine2_descr,@object
	.size	combine2_descr,40
combine2_descr:
	.string	"combine2: Take vec_length() out of loop"
	.text
	.p2align 2,,3
.globl combine2
	.type	combine2,@function
combine2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	pushl	8(%ebp)
	movl	12(%ebp), %esi
	xorl	%ebx, %ebx
	call	vec_length
	addl	$16, %esp
	cmpl	%eax, %ebx
	movl	%eax, %edi
	movl	$0x0, (%esi)
	jge	.L15
	.p2align 2,,3
.L13:
	pushl	%edx
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
	pushl	8(%ebp)
	call	get_vec_element
	incl	%ebx
	flds	-16(%ebp)
	fadds	(%esi)
	addl	$16, %esp
	cmpl	%edi, %ebx
	fstps	(%esi)
	jl	.L13
.L15:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe2:
	.size	combine2,.Lfe2-combine2
.globl combine3_descr
	.data
	.align 32
	.type	combine3_descr,@object
	.size	combine3_descr,41
combine3_descr:
	.string	"combine3: Array reference to vector data"
	.text
	.p2align 2,,3
.globl combine3
	.type	combine3,@function
combine3:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	movl	12(%ebp), %esi
	call	vec_length
	movl	%eax, %edi
	movl	%ebx, (%esp)
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	movl	$0x0, (%esi)
	jge	.L23
	.p2align 2,,3
.L21:
	flds	(%eax,%edx,4)
	incl	%edx
	fadds	(%esi)
	cmpl	%edi, %edx
	fstps	(%esi)
	jl	.L21
.L23:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe3:
	.size	combine3,.Lfe3-combine3
.globl combine4_descr
	.data
	.align 32
	.type	combine4_descr,@object
	.size	combine4_descr,51
combine4_descr:
	.string	"combine4: Array reference, accumulate in temporary"
	.text
	.p2align 2,,3
.globl combine4
	.type	combine4,@function
combine4:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%esi, %edx
	fldz
	jge	.L31
	.p2align 2,,3
.L29:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L29
.L31:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe4:
	.size	combine4,.Lfe4-combine4
.globl combine4p_descr
	.data
	.align 32
	.type	combine4p_descr,@object
	.size	combine4p_descr,54
combine4p_descr:
	.string	"combine4p: Pointer reference, accumulate in temporary"
	.text
	.p2align 2,,3
.globl combine4p
	.type	combine4p,@function
combine4p:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	(%eax,%esi,4), %edx
	addl	$16, %esp
	cmpl	%edx, %eax
	fldz
	jae	.L39
	.p2align 2,,3
.L37:
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jb	.L37
.L39:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe5:
	.size	combine4p,.Lfe5-combine4p
.globl unroll2a_descr
	.data
	.type	unroll2a_descr,@object
	.size	unroll2a_descr,26
unroll2a_descr:
	.string	"Array code, unrolled by 2"
	.text
	.p2align 2,,3
.globl unroll2a_combine
	.type	unroll2a_combine,@function
unroll2a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-1(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L52
	.p2align 2,,3
.L45:
	fadds	(%eax,%edx,4)
	fadds	4(%eax,%edx,4)
	addl	$2, %edx
	cmpl	%edi, %edx
	jl	.L45
.L52:
	cmpl	%esi, %edx
	jge	.L54
	.p2align 2,,3
.L50:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L50
.L54:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe6:
	.size	unroll2a_combine,.Lfe6-unroll2a_combine
.globl combine5_descr
	.data
	.align 32
	.type	combine5_descr,@object
	.size	combine5_descr,36
combine5_descr:
	.string	"combine5: Array code, unrolled by 3"
	.text
	.p2align 2,,3
.globl combine5
	.type	combine5,@function
combine5:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-2(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L67
	.p2align 2,,3
.L60:
	fadds	(%eax,%edx,4)
	fadds	4(%eax,%edx,4)
	fadds	8(%eax,%edx,4)
	addl	$3, %edx
	cmpl	%edi, %edx
	jl	.L60
.L67:
	cmpl	%esi, %edx
	jge	.L69
	.p2align 2,,3
.L65:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L65
.L69:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe7:
	.size	combine5,.Lfe7-combine5
.globl combine5p_descr
	.data
	.align 32
	.type	combine5p_descr,@object
	.size	combine5p_descr,49
combine5p_descr:
	.string	"combine5p: Pointer code, unrolled by 3, for loop"
	.text
	.p2align 2,,3
.globl combine5p
	.type	combine5p,@function
combine5p:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	get_vec_start
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	vec_length
	leal	(%esi,%eax,4), %eax
	leal	-8(%eax), %edx
	addl	$16, %esp
	cmpl	%edx, %esi
	fldz
	jae	.L82
	.p2align 2,,3
.L75:
	fadds	(%esi)
	fadds	4(%esi)
	fadds	8(%esi)
	addl	$12, %esi
	cmpl	%edx, %esi
	jb	.L75
.L82:
	cmpl	%eax, %esi
	jae	.L84
	.p2align 2,,3
.L80:
	fadds	(%esi)
	addl	$4, %esi
	cmpl	%eax, %esi
	jb	.L80
.L84:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe8:
	.size	combine5p,.Lfe8-combine5p
.globl unroll3aw_descr
	.data
	.align 32
	.type	unroll3aw_descr,@object
	.size	unroll3aw_descr,38
unroll3aw_descr:
	.string	"Array code, unrolled by 3, while loop"
	.text
	.p2align 2,,3
.globl unroll3aw_combine
	.type	unroll3aw_combine,@function
unroll3aw_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-1(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	%edi, %ecx
	fldz
	jge	.L96
	movl	%eax, %edx
	.p2align 2,,3
.L89:
	fadds	(%edx)
	addl	$3, %ecx
	addl	$12, %edx
	fadds	-8(%edx)
	cmpl	%edi, %ecx
	fadds	-4(%edx)
	jl	.L89
.L96:
	cmpl	%esi, %ecx
	jge	.L98
	.p2align 2,,3
.L94:
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L94
.L98:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe9:
	.size	unroll3aw_combine,.Lfe9-unroll3aw_combine
.globl unroll4a_descr
	.data
	.type	unroll4a_descr,@object
	.size	unroll4a_descr,26
unroll4a_descr:
	.string	"Array code, unrolled by 4"
	.text
	.p2align 2,,3
.globl unroll4a_combine
	.type	unroll4a_combine,@function
unroll4a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-3(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L111
	.p2align 2,,3
.L104:
	fadds	(%eax,%edx,4)
	fadds	4(%eax,%edx,4)
	fadds	8(%eax,%edx,4)
	fadds	12(%eax,%edx,4)
	addl	$4, %edx
	cmpl	%edi, %edx
	jl	.L104
.L111:
	cmpl	%esi, %edx
	jge	.L113
	.p2align 2,,3
.L109:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L109
.L113:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe10:
	.size	unroll4a_combine,.Lfe10-unroll4a_combine
.globl unroll8a_descr
	.data
	.type	unroll8a_descr,@object
	.size	unroll8a_descr,26
unroll8a_descr:
	.string	"Array code, unrolled by 8"
	.text
	.p2align 2,,3
.globl unroll8a_combine
	.type	unroll8a_combine,@function
unroll8a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-7(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	%edi, %ecx
	fldz
	jge	.L126
	movl	%eax, %edx
	.p2align 2,,3
.L119:
	fadds	(%edx)
	fadds	4(%edx)
	fadds	8(%edx)
	fadds	12(%edx)
	fadds	16(%edx)
	fadds	20(%edx)
	fadds	24(%edx)
	addl	$8, %ecx
	fadds	28(%edx)
	addl	$32, %edx
	cmpl	%edi, %ecx
	jl	.L119
.L126:
	cmpl	%esi, %ecx
	jge	.L128
	.p2align 2,,3
.L124:
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L124
.L128:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe11:
	.size	unroll8a_combine,.Lfe11-unroll8a_combine
.globl unroll16a_descr
	.data
	.type	unroll16a_descr,@object
	.size	unroll16a_descr,27
unroll16a_descr:
	.string	"Array code, unrolled by 16"
	.text
	.p2align 2,,3
.globl unroll16a_combine
	.type	unroll16a_combine,@function
unroll16a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-15(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	%edi, %ecx
	fldz
	jge	.L141
	movl	%eax, %edx
	.p2align 2,,3
.L134:
	fadds	(%edx)
	fadds	4(%edx)
	fadds	8(%edx)
	fadds	12(%edx)
	fadds	16(%edx)
	fadds	20(%edx)
	fadds	24(%edx)
	fadds	28(%edx)
	fadds	32(%edx)
	fadds	36(%edx)
	fadds	40(%edx)
	fadds	44(%edx)
	fadds	48(%edx)
	fadds	52(%edx)
	fadds	56(%edx)
	addl	$16, %ecx
	fadds	60(%edx)
	addl	$64, %edx
	cmpl	%edi, %ecx
	jl	.L134
.L141:
	cmpl	%esi, %ecx
	jge	.L143
	.p2align 2,,3
.L139:
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L139
.L143:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe12:
	.size	unroll16a_combine,.Lfe12-unroll16a_combine
.globl unroll2_descr
	.data
	.type	unroll2_descr,@object
	.size	unroll2_descr,28
unroll2_descr:
	.string	"Pointer code, unrolled by 2"
	.text
	.p2align 2,,3
.globl unroll2_combine
	.type	unroll2_combine,@function
unroll2_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %esi
	pushl	%esi
	call	vec_length
	movl	%eax, %ebx
	movl	%esi, (%esp)
	call	get_vec_start
	movl	%eax, %edx
	movl	%ebx, %eax
	shrl	$31, %eax
	leal	(%eax,%ebx), %eax
	andl	$-2, %eax
	movl	%ebx, %esi
	subl	%eax, %esi
	leal	(%edx,%ebx,4), %ecx
	leal	0(,%esi,4), %eax
	subl	%eax, %ecx
	addl	$16, %esp
	cmpl	%ecx, %edx
	fldz
	jae	.L154
	.p2align 2,,3
.L148:
	fadds	(%edx)
	fadds	4(%edx)
	addl	$8, %edx
	cmpl	%ecx, %edx
	jb	.L148
.L154:
	leal	(%ecx,%esi,4), %ecx
	cmpl	%ecx, %edx
	jae	.L156
	.p2align 2,,3
.L152:
	fadds	(%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jb	.L152
.L156:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe13:
	.size	unroll2_combine,.Lfe13-unroll2_combine
.globl unroll3_descr
	.data
	.type	unroll3_descr,@object
	.size	unroll3_descr,28
unroll3_descr:
	.string	"Pointer code, unrolled by 3"
	.text
	.p2align 2,,3
.globl unroll3_combine
	.type	unroll3_combine,@function
unroll3_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-8(%eax,%esi,4), %edx
	addl	$16, %esp
	cmpl	%edx, %eax
	fldz
	jae	.L167
	.p2align 2,,3
.L161:
	fadds	(%eax)
	fadds	4(%eax)
	fadds	8(%eax)
	addl	$12, %eax
	cmpl	%edx, %eax
	jb	.L161
.L167:
	addl	$8, %edx
	cmpl	%edx, %eax
	jae	.L169
	.p2align 2,,3
.L165:
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jb	.L165
.L169:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe14:
	.size	unroll3_combine,.Lfe14-unroll3_combine
.globl unroll4_descr
	.data
	.type	unroll4_descr,@object
	.size	unroll4_descr,28
unroll4_descr:
	.string	"Pointer code, unrolled by 4"
	.text
	.p2align 2,,3
.globl unroll4_combine
	.type	unroll4_combine,@function
unroll4_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-12(%eax,%esi,4), %edx
	addl	$16, %esp
	cmpl	%edx, %eax
	fldz
	jae	.L180
	.p2align 2,,3
.L174:
	fadds	(%eax)
	fadds	4(%eax)
	fadds	8(%eax)
	fadds	12(%eax)
	addl	$16, %eax
	cmpl	%edx, %eax
	jb	.L174
.L180:
	addl	$12, %edx
	cmpl	%edx, %eax
	jae	.L182
	.p2align 2,,3
.L178:
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jb	.L178
.L182:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.Lfe15:
	.size	unroll4_combine,.Lfe15-unroll4_combine
.globl unroll8_descr
	.data
	.type	unroll8_descr,@object
	.size	unroll8_descr,28
unroll8_descr:
	.string	"Pointer code, unrolled by 8"
	.text
	.p2align 2,,3
.globl unroll8_combine
	.type	unroll8_combine,@function
unroll8_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	testl	%esi, %esi
	movl	%eax, %edx
	movl	%esi, %eax
	js	.L197
.L184:
	andl	$-8, %eax
	movl	%esi, %ebx
	subl	%eax, %ebx
	leal	(%edx,%esi,4), %ecx
	leal	0(,%ebx,4), %eax
	subl	%eax, %ecx
	addl	$16, %esp
	cmpl	%ecx, %edx
	fldz
	jae	.L194
	.p2align 2,,3
.L188:
	fadds	(%edx)
	fadds	4(%edx)
	fadds	8(%edx)
	fadds	12(%edx)
	fadds	16(%edx)
	fadds	20(%edx)
	fadds	24(%edx)
	fadds	28(%edx)
	addl	$32, %edx
	cmpl	%ecx, %edx
	jb	.L188
.L194:
	leal	(%ecx,%ebx,4), %ecx
	cmpl	%ecx, %edx
	jae	.L196
	.p2align 2,,3
.L192:
	fadds	(%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jb	.L192
.L196:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L197:
	leal	7(%esi), %eax
	jmp	.L184
.Lfe16:
	.size	unroll8_combine,.Lfe16-unroll8_combine
.globl unroll16_descr
	.data
	.type	unroll16_descr,@object
	.size	unroll16_descr,29
unroll16_descr:
	.string	"Pointer code, unrolled by 16"
	.text
	.p2align 2,,3
.globl unroll16_combine
	.type	unroll16_combine,@function
unroll16_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	testl	%esi, %esi
	movl	%eax, %edx
	movl	%esi, %eax
	js	.L212
.L199:
	andl	$-16, %eax
	movl	%esi, %ebx
	subl	%eax, %ebx
	leal	(%edx,%esi,4), %ecx
	leal	0(,%ebx,4), %eax
	subl	%eax, %ecx
	addl	$16, %esp
	cmpl	%ecx, %edx
	fldz
	jae	.L209
	.p2align 2,,3
.L203:
	fadds	(%edx)
	fadds	4(%edx)
	fadds	8(%edx)
	fadds	12(%edx)
	fadds	16(%edx)
	fadds	20(%edx)
	fadds	24(%edx)
	fadds	28(%edx)
	fadds	32(%edx)
	fadds	36(%edx)
	fadds	40(%edx)
	fadds	44(%edx)
	fadds	48(%edx)
	fadds	52(%edx)
	fadds	56(%edx)
	fadds	60(%edx)
	addl	$64, %edx
	cmpl	%ecx, %edx
	jb	.L203
.L209:
	leal	(%ecx,%ebx,4), %ecx
	cmpl	%ecx, %edx
	jae	.L211
	.p2align 2,,3
.L207:
	fadds	(%edx)
	addl	$4, %edx
	cmpl	%ecx, %edx
	jb	.L207
.L211:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L212:
	leal	15(%esi), %eax
	jmp	.L199
.Lfe17:
	.size	unroll16_combine,.Lfe17-unroll16_combine
.globl combine6_descr
	.data
	.align 32
	.type	combine6_descr,@object
	.size	combine6_descr,52
combine6_descr:
	.string	"combine6: Array code, unrolled by 2, Superscalar x2"
	.text
	.p2align 2,,3
.globl combine6
	.type	combine6,@function
combine6:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-1(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	fldz
	addl	$16, %esp
	cmpl	%edi, %edx
	fld	%st(0)
	jge	.L225
	.p2align 2,,3
.L218:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	fxch	%st(1)
	fadds	4(%eax,%edx,4)
	addl	$2, %edx
	cmpl	%edi, %edx
	jl	.L218
.L225:
	cmpl	%esi, %edx
	jge	.L228
	.p2align 2,,3
.L223:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jge	.L227
	fxch	%st(1)
	jmp	.L223
	.p2align 2,,3
.L227:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L228:
	fxch	%st(1)
	jmp	.L227
.Lfe18:
	.size	combine6,.Lfe18-combine6
.globl unroll4x2a_descr
	.data
	.align 32
	.type	unroll4x2a_descr,@object
	.size	unroll4x2a_descr,42
unroll4x2a_descr:
	.string	"Array code, unrolled by 4, Superscalar x2"
	.text
	.p2align 2,,3
.globl unroll4x2a_combine
	.type	unroll4x2a_combine,@function
unroll4x2a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-3(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	fldz
	addl	$16, %esp
	cmpl	%edi, %edx
	fld	%st(0)
	jge	.L243
	.p2align 2,,3
.L236:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	fxch	%st(1)
	fadds	4(%eax,%edx,4)
	fxch	%st(1)
	fadds	8(%eax,%edx,4)
	fxch	%st(1)
	fadds	12(%eax,%edx,4)
	addl	$4, %edx
	cmpl	%edi, %edx
	jl	.L236
.L243:
	cmpl	%esi, %edx
	jge	.L246
	.p2align 2,,3
.L241:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jge	.L245
	fxch	%st(1)
	jmp	.L241
	.p2align 2,,3
.L245:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L246:
	fxch	%st(1)
	jmp	.L245
.Lfe19:
	.size	unroll4x2a_combine,.Lfe19-unroll4x2a_combine
.globl unroll8x2a_descr
	.data
	.align 32
	.type	unroll8x2a_descr,@object
	.size	unroll8x2a_descr,42
unroll8x2a_descr:
	.string	"Array code, unrolled by 8, Superscalar x2"
	.text
	.p2align 2,,3
.globl unroll8x2a_combine
	.type	unroll8x2a_combine,@function
unroll8x2a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-7(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	fldz
	addl	$16, %esp
	cmpl	%edi, %ecx
	fld	%st(0)
	jge	.L261
	movl	%eax, %edx
	.p2align 2,,3
.L254:
	fxch	%st(1)
	fadds	(%edx)
	fxch	%st(1)
	fadds	4(%edx)
	fxch	%st(1)
	fadds	8(%edx)
	fxch	%st(1)
	fadds	12(%edx)
	fxch	%st(1)
	fadds	16(%edx)
	fxch	%st(1)
	fadds	20(%edx)
	fxch	%st(1)
	addl	$8, %ecx
	fadds	24(%edx)
	fxch	%st(1)
	fadds	28(%edx)
	addl	$32, %edx
	cmpl	%edi, %ecx
	jl	.L254
.L261:
	cmpl	%esi, %ecx
	jge	.L264
	.p2align 2,,3
.L259:
	fxch	%st(1)
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jge	.L263
	fxch	%st(1)
	jmp	.L259
	.p2align 2,,3
.L263:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L264:
	fxch	%st(1)
	jmp	.L263
.Lfe20:
	.size	unroll8x2a_combine,.Lfe20-unroll8x2a_combine
.globl unroll8x4a_descr
	.data
	.align 32
	.type	unroll8x4a_descr,@object
	.size	unroll8x4a_descr,42
unroll8x4a_descr:
	.string	"Array code, unrolled by 8, Superscalar x4"
	.text
	.p2align 2,,3
.globl unroll8x4a_combine
	.type	unroll8x4a_combine,@function
unroll8x4a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-7(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	fldz
	addl	$16, %esp
	cmpl	%edi, %ecx
	fld	%st(0)
	fld	%st(1)
	fld	%st(2)
	jge	.L282
	movl	%eax, %edx
	.p2align 2,,3
.L272:
	fxch	%st(3)
	fadds	(%edx)
	fxch	%st(2)
	fadds	4(%edx)
	fxch	%st(3)
	fadds	8(%edx)
	fxch	%st(1)
	fadds	12(%edx)
	fxch	%st(2)
	addl	$8, %ecx
	fadds	16(%edx)
	fxch	%st(3)
	fadds	20(%edx)
	fxch	%st(1)
	fadds	24(%edx)
	fxch	%st(2)
	fadds	28(%edx)
	addl	$32, %edx
	cmpl	%edi, %ecx
	jge	.L279
	fxch	%st(1)
	fxch	%st(2)
	jmp	.L272
	.p2align 2,,3
.L279:
	cmpl	%esi, %ecx
	jge	.L284
	.p2align 2,,3
.L277:
	fxch	%st(3)
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jge	.L281
	fxch	%st(3)
	jmp	.L277
	.p2align 2,,3
.L281:
	faddp	%st, %st(1)
	faddp	%st, %st(1)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L284:
	fxch	%st(3)
	jmp	.L281
.L282:
	fxch	%st(2)
	fxch	%st(1)
	jmp	.L279
.Lfe21:
	.size	unroll8x4a_combine,.Lfe21-unroll8x4a_combine
.globl unroll12x6a_descr
	.data
	.align 32
	.type	unroll12x6a_descr,@object
	.size	unroll12x6a_descr,43
unroll12x6a_descr:
	.string	"Array code, unrolled by 12, Superscalar x6"
	.text
	.p2align 2,,3
.globl unroll12x6a_combine
	.type	unroll12x6a_combine,@function
unroll12x6a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-11(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	fldz
	addl	$16, %esp
	cmpl	%edi, %ecx
	fld	%st(0)
	fld	%st(1)
	fld	%st(2)
	fld	%st(3)
	fld	%st(4)
	jge	.L303
	movl	%eax, %edx
	.p2align 2,,3
.L293:
	fxch	%st(5)
	fadds	(%edx)
	fxch	%st(4)
	fadds	4(%edx)
	fxch	%st(3)
	fadds	8(%edx)
	fxch	%st(2)
	fadds	12(%edx)
	fxch	%st(1)
	fadds	16(%edx)
	fxch	%st(5)
	fadds	20(%edx)
	fxch	%st(4)
	addl	$12, %ecx
	fadds	24(%edx)
	fxch	%st(3)
	fadds	28(%edx)
	fxch	%st(2)
	fadds	32(%edx)
	fxch	%st(1)
	fadds	36(%edx)
	fxch	%st(5)
	fadds	40(%edx)
	fxch	%st(4)
	fadds	44(%edx)
	addl	$48, %edx
	cmpl	%edi, %ecx
	jge	.L300
	fxch	%st(1)
	fxch	%st(3)
	fxch	%st(5)
	fxch	%st(2)
	fxch	%st(4)
	fxch	%st(1)
	jmp	.L293
	.p2align 2,,3
.L300:
	cmpl	%esi, %ecx
	jge	.L305
	.p2align 2,,3
.L298:
	fxch	%st(3)
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jge	.L302
	fxch	%st(3)
	jmp	.L298
	.p2align 2,,3
.L302:
	faddp	%st, %st(2)
	faddp	%st, %st(4)
	faddp	%st, %st(3)
	faddp	%st, %st(1)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L305:
	fxch	%st(3)
	jmp	.L302
.L303:
	fxch	%st(1)
	fxch	%st(4)
	fxch	%st(2)
	fxch	%st(5)
	fxch	%st(3)
	fxch	%st(1)
	jmp	.L300
.Lfe22:
	.size	unroll12x6a_combine,.Lfe22-unroll12x6a_combine
.globl unroll8x8a_descr
	.data
	.align 32
	.type	unroll8x8a_descr,@object
	.size	unroll8x8a_descr,42
unroll8x8a_descr:
	.string	"Array code, unrolled by 8, Superscalar x8"
	.text
	.p2align 2,,3
.globl unroll8x8a_combine
	.type	unroll8x8a_combine,@function
unroll8x8a_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-7(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	fldz
	addl	$16, %esp
	cmpl	%edi, %ecx
	fld	%st(0)
	fld	%st(1)
	fld	%st(2)
	fld	%st(3)
	fld	%st(4)
	fld	%st(5)
	fld	%st(6)
	jge	.L324
	movl	%eax, %edx
	.p2align 2,,3
.L314:
	fxch	%st(7)
	addl	$8, %ecx
	fadds	(%edx)
	fxch	%st(6)
	fadds	4(%edx)
	fxch	%st(4)
	fadds	8(%edx)
	fxch	%st(5)
	fadds	12(%edx)
	fxch	%st(2)
	fadds	16(%edx)
	fxch	%st(3)
	fadds	20(%edx)
	fxch	%st(7)
	fadds	24(%edx)
	fxch	%st(1)
	fadds	28(%edx)
	addl	$32, %edx
	cmpl	%edi, %ecx
	jge	.L321
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(5)
	fxch	%st(4)
	fxch	%st(6)
	fxch	%st(7)
	fxch	%st(3)
	fxch	%st(2)
	jmp	.L314
	.p2align 2,,3
.L321:
	cmpl	%esi, %ecx
	jge	.L326
	.p2align 2,,3
.L319:
	fxch	%st(6)
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jge	.L323
	fxch	%st(6)
	jmp	.L319
	.p2align 2,,3
.L323:
	faddp	%st, %st(4)
	fxch	%st(3)
	faddp	%st, %st(4)
	faddp	%st, %st(3)
	faddp	%st, %st(2)
	fxch	%st(1)
	faddp	%st, %st(3)
	faddp	%st, %st(2)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.L326:
	fxch	%st(6)
	jmp	.L323
.L324:
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(3)
	fxch	%st(7)
	fxch	%st(6)
	fxch	%st(4)
	fxch	%st(5)
	fxch	%st(2)
	jmp	.L321
.Lfe23:
	.size	unroll8x8a_combine,.Lfe23-unroll8x8a_combine
.globl unrollx2as_descr
	.data
	.align 32
	.type	unrollx2as_descr,@object
	.size	unrollx2as_descr,54
unrollx2as_descr:
	.string	"Array code, Unroll x2, Superscalar x2, noninterleaved"
	.text
	.p2align 2,,3
.globl unrollx2as_combine
	.type	unrollx2as_combine,@function
unrollx2as_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %edi
	shrl	$31, %eax
	leal	(%eax,%edi), %esi
	sarl	$1, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	xorl	%edx, %edx
	fldz
	addl	$16, %esp
	cmpl	%esi, %edx
	leal	(%eax,%esi,4), %ecx
	fld	%st(0)
	jge	.L342
	.p2align 2,,3
.L335:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	fxch	%st(1)
	fadds	(%ecx,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L335
.L342:
	leal	(%esi,%esi), %edx
	cmpl	%edi, %edx
	jge	.L344
	.p2align 2,,3
.L340:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%edi, %edx
	jl	.L340
.L344:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe24:
	.size	unrollx2as_combine,.Lfe24-unrollx2as_combine
.globl unroll4x2as_descr
	.data
	.align 32
	.type	unroll4x2as_descr,@object
	.size	unroll4x2as_descr,54
unroll4x2as_descr:
	.string	"Array code, Unroll x4, Superscalar x2, noninterleaved"
	.text
	.p2align 2,,3
.globl unroll4x2as_combine
	.type	unroll4x2as_combine,@function
unroll4x2as_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %edi
	shrl	$31, %eax
	leal	(%eax,%edi), %esi
	sarl	$1, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	xorl	%edx, %edx
	fldz
	addl	$16, %esp
	cmpl	%esi, %edx
	leal	(%eax,%esi,4), %ecx
	fld	%st(0)
	jge	.L357
	.p2align 2,,3
.L350:
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	fxch	%st(1)
	fadds	(%ecx,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L350
.L357:
	leal	(%esi,%esi), %edx
	cmpl	%edi, %edx
	jge	.L359
	.p2align 2,,3
.L355:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%edi, %edx
	jl	.L355
.L359:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe25:
	.size	unroll4x2as_combine,.Lfe25-unroll4x2as_combine
.globl unroll8x2_descr
	.data
	.align 32
	.type	unroll8x2_descr,@object
	.size	unroll8x2_descr,44
unroll8x2_descr:
	.string	"Pointer code, unrolled by 8, Superscalar x2"
	.text
	.p2align 2,,3
.globl unroll8x2_combine
	.type	unroll8x2_combine,@function
unroll8x2_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-28(%eax,%esi,4), %edx
	fldz
	addl	$16, %esp
	cmpl	%edx, %eax
	fld	%st(0)
	jae	.L370
	.p2align 2,,3
.L364:
	fxch	%st(1)
	fadds	(%eax)
	fxch	%st(1)
	fadds	4(%eax)
	fxch	%st(1)
	fadds	8(%eax)
	fxch	%st(1)
	fadds	12(%eax)
	fxch	%st(1)
	fadds	16(%eax)
	fxch	%st(1)
	fadds	20(%eax)
	fxch	%st(1)
	fadds	24(%eax)
	fxch	%st(1)
	fadds	28(%eax)
	addl	$32, %eax
	cmpl	%edx, %eax
	jb	.L364
.L370:
	addl	$28, %edx
	cmpl	%edx, %eax
	jae	.L373
	.p2align 2,,3
.L368:
	fxch	%st(1)
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jae	.L372
	fxch	%st(1)
	jmp	.L368
	.p2align 2,,3
.L372:
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L373:
	fxch	%st(1)
	jmp	.L372
.Lfe26:
	.size	unroll8x2_combine,.Lfe26-unroll8x2_combine
.globl unroll9x3_descr
	.data
	.align 32
	.type	unroll9x3_descr,@object
	.size	unroll9x3_descr,44
unroll9x3_descr:
	.string	"Pointer code, unrolled by 9, Superscalar x3"
	.text
	.p2align 2,,3
.globl unroll9x3_combine
	.type	unroll9x3_combine,@function
unroll9x3_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-32(%eax,%esi,4), %edx
	fldz
	addl	$16, %esp
	cmpl	%edx, %eax
	fld	%st(0)
	fld	%st(1)
	jae	.L389
	.p2align 2,,3
.L380:
	fxch	%st(2)
	fadds	(%eax)
	fxch	%st(1)
	fadds	4(%eax)
	fxch	%st(2)
	fadds	8(%eax)
	fxch	%st(1)
	fadds	12(%eax)
	fxch	%st(2)
	fadds	16(%eax)
	fxch	%st(1)
	fadds	20(%eax)
	fxch	%st(2)
	fadds	24(%eax)
	fxch	%st(1)
	fadds	28(%eax)
	fxch	%st(2)
	fadds	32(%eax)
	addl	$36, %eax
	cmpl	%edx, %eax
	jae	.L386
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(1)
	jmp	.L380
	.p2align 2,,3
.L386:
	addl	$32, %edx
	cmpl	%edx, %eax
	jae	.L391
	.p2align 2,,3
.L384:
	fxch	%st(1)
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jae	.L388
	fxch	%st(1)
	jmp	.L384
	.p2align 2,,3
.L388:
	faddp	%st, %st(2)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L391:
	fxch	%st(1)
	jmp	.L388
.L389:
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(1)
	jmp	.L386
.Lfe27:
	.size	unroll9x3_combine,.Lfe27-unroll9x3_combine
.globl unroll8x4_descr
	.data
	.align 32
	.type	unroll8x4_descr,@object
	.size	unroll8x4_descr,44
unroll8x4_descr:
	.string	"Pointer code, unrolled by 8, Superscalar x4"
	.text
	.p2align 2,,3
.globl unroll8x4_combine
	.type	unroll8x4_combine,@function
unroll8x4_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-28(%eax,%esi,4), %edx
	fldz
	addl	$16, %esp
	cmpl	%edx, %eax
	fld	%st(0)
	fld	%st(1)
	fld	%st(2)
	jae	.L408
	.p2align 2,,3
.L399:
	fxch	%st(3)
	fadds	(%eax)
	fxch	%st(2)
	fadds	4(%eax)
	fxch	%st(3)
	fadds	8(%eax)
	fxch	%st(1)
	fadds	12(%eax)
	fxch	%st(2)
	fadds	16(%eax)
	fxch	%st(3)
	fadds	20(%eax)
	fxch	%st(1)
	fadds	24(%eax)
	fxch	%st(2)
	fadds	28(%eax)
	addl	$32, %eax
	cmpl	%edx, %eax
	jae	.L405
	fxch	%st(1)
	fxch	%st(2)
	jmp	.L399
	.p2align 2,,3
.L405:
	addl	$28, %edx
	cmpl	%edx, %eax
	jae	.L410
	.p2align 2,,3
.L403:
	fxch	%st(3)
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jae	.L407
	fxch	%st(3)
	jmp	.L403
	.p2align 2,,3
.L407:
	faddp	%st, %st(1)
	faddp	%st, %st(1)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L410:
	fxch	%st(3)
	jmp	.L407
.L408:
	fxch	%st(2)
	fxch	%st(1)
	jmp	.L405
.Lfe28:
	.size	unroll8x4_combine,.Lfe28-unroll8x4_combine
.globl unroll8x8_descr
	.data
	.align 32
	.type	unroll8x8_descr,@object
	.size	unroll8x8_descr,44
unroll8x8_descr:
	.string	"Pointer code, unrolled by 8, Superscalar x8"
	.text
	.p2align 2,,3
.globl unroll8x8_combine
	.type	unroll8x8_combine,@function
unroll8x8_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-28(%eax,%esi,4), %edx
	fldz
	addl	$16, %esp
	cmpl	%edx, %eax
	fld	%st(0)
	fld	%st(1)
	fld	%st(2)
	fld	%st(3)
	fld	%st(4)
	fld	%st(5)
	fld	%st(6)
	jae	.L427
	.p2align 2,,3
.L418:
	fxch	%st(7)
	fadds	(%eax)
	fxch	%st(6)
	fadds	4(%eax)
	fxch	%st(4)
	fadds	8(%eax)
	fxch	%st(5)
	fadds	12(%eax)
	fxch	%st(2)
	fadds	16(%eax)
	fxch	%st(3)
	fadds	20(%eax)
	fxch	%st(7)
	fadds	24(%eax)
	fxch	%st(1)
	fadds	28(%eax)
	addl	$32, %eax
	cmpl	%edx, %eax
	jae	.L424
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(5)
	fxch	%st(4)
	fxch	%st(6)
	fxch	%st(7)
	fxch	%st(3)
	fxch	%st(2)
	jmp	.L418
	.p2align 2,,3
.L424:
	addl	$28, %edx
	cmpl	%edx, %eax
	jae	.L429
	.p2align 2,,3
.L422:
	fxch	%st(6)
	fadds	(%eax)
	addl	$4, %eax
	cmpl	%edx, %eax
	jae	.L426
	fxch	%st(6)
	jmp	.L422
	.p2align 2,,3
.L426:
	faddp	%st, %st(4)
	fxch	%st(3)
	faddp	%st, %st(4)
	faddp	%st, %st(3)
	faddp	%st, %st(2)
	fxch	%st(1)
	faddp	%st, %st(3)
	faddp	%st, %st(2)
	movl	12(%ebp), %eax
	faddp	%st, %st(1)
	fstps	(%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
.L429:
	fxch	%st(6)
	jmp	.L426
.L427:
	fxch	%st(1)
	fxch	%st(2)
	fxch	%st(3)
	fxch	%st(7)
	fxch	%st(6)
	fxch	%st(4)
	fxch	%st(5)
	fxch	%st(2)
	jmp	.L424
.Lfe29:
	.size	unroll8x8_combine,.Lfe29-unroll8x8_combine
.globl unroll2aa_descr
	.data
	.align 32
	.type	unroll2aa_descr,@object
	.size	unroll2aa_descr,51
unroll2aa_descr:
	.string	"Array code, unrolled by 2, different associativity"
	.text
	.p2align 2,,3
.globl unroll2aa_combine
	.type	unroll2aa_combine,@function
unroll2aa_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-1(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L445
	.p2align 2,,3
.L438:
	flds	4(%eax,%edx,4)
	fadds	(%eax,%edx,4)
	addl	$2, %edx
	cmpl	%edi, %edx
	faddp	%st, %st(1)
	jl	.L438
.L445:
	cmpl	%esi, %edx
	jge	.L447
	.p2align 2,,3
.L443:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L443
.L447:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe30:
	.size	unroll2aa_combine,.Lfe30-unroll2aa_combine
.globl unroll3aa_descr
	.data
	.align 32
	.type	unroll3aa_descr,@object
	.size	unroll3aa_descr,51
unroll3aa_descr:
	.string	"Array code, unrolled by 3, Different Associativity"
	.text
	.p2align 2,,3
.globl unroll3aa_combine
	.type	unroll3aa_combine,@function
unroll3aa_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-2(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L460
	.p2align 2,,3
.L453:
	flds	4(%eax,%edx,4)
	fadds	(%eax,%edx,4)
	fadds	8(%eax,%edx,4)
	addl	$3, %edx
	cmpl	%edi, %edx
	faddp	%st, %st(1)
	jl	.L453
.L460:
	cmpl	%esi, %edx
	jge	.L462
	.p2align 2,,3
.L458:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L458
.L462:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe31:
	.size	unroll3aa_combine,.Lfe31-unroll3aa_combine
.globl unroll4aa_descr
	.data
	.align 32
	.type	unroll4aa_descr,@object
	.size	unroll4aa_descr,51
unroll4aa_descr:
	.string	"Array code, unrolled by 4, Different Associativity"
	.text
	.p2align 2,,3
.globl unroll4aa_combine
	.type	unroll4aa_combine,@function
unroll4aa_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-3(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%edi, %edx
	fldz
	jge	.L475
	.p2align 2,,3
.L468:
	flds	4(%eax,%edx,4)
	flds	12(%eax,%edx,4)
	fxch	%st(1)
	fadds	(%eax,%edx,4)
	fxch	%st(1)
	fadds	8(%eax,%edx,4)
	addl	$4, %edx
	faddp	%st, %st(1)
	cmpl	%edi, %edx
	faddp	%st, %st(1)
	jl	.L468
.L475:
	cmpl	%esi, %edx
	jge	.L477
	.p2align 2,,3
.L473:
	fadds	(%eax,%edx,4)
	incl	%edx
	cmpl	%esi, %edx
	jl	.L473
.L477:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe32:
	.size	unroll4aa_combine,.Lfe32-unroll4aa_combine
.globl unroll6aa_descr
	.data
	.align 32
	.type	unroll6aa_descr,@object
	.size	unroll6aa_descr,51
unroll6aa_descr:
	.string	"Array code, unrolled by 6, Different Associativity"
	.text
	.p2align 2,,3
.globl unroll6aa_combine
	.type	unroll6aa_combine,@function
unroll6aa_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-5(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	%edi, %ecx
	fldz
	jge	.L490
	movl	%eax, %edx
	.p2align 2,,3
.L483:
	flds	4(%edx)
	flds	12(%edx)
	fxch	%st(1)
	fadds	(%edx)
	fxch	%st(1)
	fadds	8(%edx)
	flds	20(%edx)
	fadds	16(%edx)
	fxch	%st(2)
	faddp	%st, %st(1)
	addl	$6, %ecx
	faddp	%st, %st(1)
	addl	$24, %edx
	cmpl	%edi, %ecx
	faddp	%st, %st(1)
	jl	.L483
.L490:
	cmpl	%esi, %ecx
	jge	.L492
	.p2align 2,,3
.L488:
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L488
.L492:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe33:
	.size	unroll6aa_combine,.Lfe33-unroll6aa_combine
.globl unroll8aa_descr
	.data
	.align 32
	.type	unroll8aa_descr,@object
	.size	unroll8aa_descr,51
unroll8aa_descr:
	.string	"Array code, unrolled by 8, Different Associativity"
	.text
	.p2align 2,,3
.globl unroll8aa_combine
	.type	unroll8aa_combine,@function
unroll8aa_combine:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	leal	-7(%eax), %edi
	movl	%ebx, (%esp)
	movl	%eax, %esi
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	%edi, %ecx
	fldz
	jge	.L505
	movl	%eax, %edx
	.p2align 2,,3
.L498:
	flds	4(%edx)
	flds	12(%edx)
	fadds	8(%edx)
	fxch	%st(1)
	fadds	(%edx)
	faddp	%st, %st(1)
	flds	20(%edx)
	flds	28(%edx)
	fxch	%st(1)
	fadds	16(%edx)
	fxch	%st(1)
	fadds	24(%edx)
	faddp	%st, %st(1)
	addl	$8, %ecx
	faddp	%st, %st(1)
	addl	$32, %edx
	cmpl	%edi, %ecx
	faddp	%st, %st(1)
	jl	.L498
.L505:
	cmpl	%esi, %ecx
	jge	.L507
	.p2align 2,,3
.L503:
	fadds	(%eax,%ecx,4)
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L503
.L507:
	movl	12(%ebp), %eax
	fstps	(%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
.Lfe34:
	.size	unroll8aa_combine,.Lfe34-unroll8aa_combine
	.p2align 2,,3
.globl register_combiners
	.type	register_combiners,@function
register_combiners:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	pushl	$combine1_descr
	pushl	$combine1
	pushl	$combine1
	call	add_combiner
	addl	$12, %esp
	pushl	$combine2_descr
	pushl	$combine1
	pushl	$combine2
	call	add_combiner
	addl	$12, %esp
	pushl	$combine3_descr
	pushl	$combine1
	pushl	$combine3
	call	add_combiner
	addl	$12, %esp
	pushl	$combine4_descr
	pushl	$combine1
	pushl	$combine4
	call	add_combiner
	addl	$12, %esp
	pushl	$combine4p_descr
	pushl	$combine1
	pushl	$combine4p
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll2a_descr
	pushl	$combine1
	pushl	$unroll2a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$combine5p_descr
	pushl	$combine1
	pushl	$combine5p
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll3aw_descr
	pushl	$combine1
	pushl	$unroll3aw_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll4a_descr
	pushl	$combine1
	pushl	$unroll4a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8a_descr
	pushl	$combine1
	pushl	$unroll8a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll16a_descr
	pushl	$combine1
	pushl	$unroll16a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll2_descr
	pushl	$combine1
	pushl	$unroll2_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll3_descr
	pushl	$combine1
	pushl	$unroll3_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll4_descr
	pushl	$combine1
	pushl	$unroll4_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8_descr
	pushl	$combine1
	pushl	$unroll8_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll16_descr
	pushl	$combine1
	pushl	$unroll16_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$combine6_descr
	pushl	$combine1
	pushl	$combine6
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll4x2a_descr
	pushl	$combine1
	pushl	$unroll4x2a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x2a_descr
	pushl	$combine1
	pushl	$unroll8x2a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x4a_descr
	pushl	$combine1
	pushl	$unroll8x4a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x8a_descr
	pushl	$combine1
	pushl	$unroll8x8a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll12x6a_descr
	pushl	$combine1
	pushl	$unroll12x6a_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x2_descr
	pushl	$combine1
	pushl	$unroll8x2_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x4_descr
	pushl	$combine1
	pushl	$unroll8x4_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8x8_descr
	pushl	$combine1
	pushl	$unroll8x8_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll9x3_descr
	pushl	$combine1
	pushl	$unroll9x3_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unrollx2as_descr
	pushl	$combine1
	pushl	$unrollx2as_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll2aa_descr
	pushl	$combine1
	pushl	$unroll2aa_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll3aa_descr
	pushl	$combine1
	pushl	$unroll3aa_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll4aa_descr
	pushl	$combine1
	pushl	$unroll4aa_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll6aa_descr
	pushl	$combine1
	pushl	$unroll6aa_combine
	call	add_combiner
	addl	$12, %esp
	pushl	$unroll8aa_descr
	pushl	$combine1
	pushl	$unroll8aa_combine
	call	add_combiner
	leave
	ret
.Lfe35:
	.size	register_combiners,.Lfe35-register_combiners
	.ident	"GCC: (GNU) 3.2.2 20030222 (Red Hat Linux 3.2.2-5)"
