	.file	"combineprod.c"
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
	movl	$1, (%esi)
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
	movl	-16(%ebp), %eax
	imull	(%esi), %eax
	movl	%eax, (%esi)
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
	movl	$1, (%esi)
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
	movl	-16(%ebp), %eax
	imull	(%esi), %eax
	addl	$16, %esp
	cmpl	%edi, %ebx
	movl	%eax, (%esi)
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
	movl	%eax, %ecx
	movl	$1, (%esi)
	jge	.L23
	.p2align 2,,3
.L21:
	movl	(%ecx,%edx,4), %eax
	incl	%edx
	imull	(%esi), %eax
	cmpl	%edi, %edx
	movl	%eax, (%esi)
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
	movl	$1, %ecx
	jge	.L31
	.p2align 2,,3
.L29:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L29
.L31:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	leal	(%eax,%esi,4), %ecx
	addl	$16, %esp
	cmpl	%ecx, %eax
	movl	$1, %edx
	jae	.L39
	.p2align 2,,3
.L37:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L37
.L39:
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
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
	movl	$1, %ecx
	jge	.L52
	.p2align 2,,3
.L45:
	imull	(%eax,%edx,4), %ecx
	imull	4(%eax,%edx,4), %ecx
	addl	$2, %edx
	cmpl	%edi, %edx
	jl	.L45
.L52:
	cmpl	%esi, %edx
	jge	.L54
	.p2align 2,,3
.L50:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L50
.L54:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	movl	$1, %ecx
	jge	.L67
	.p2align 2,,3
.L60:
	imull	(%eax,%edx,4), %ecx
	imull	4(%eax,%edx,4), %ecx
	imull	8(%eax,%edx,4), %ecx
	addl	$3, %edx
	cmpl	%edi, %edx
	jl	.L60
.L67:
	cmpl	%esi, %edx
	jge	.L69
	.p2align 2,,3
.L65:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L65
.L69:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	leal	-8(%eax), %ecx
	addl	$16, %esp
	cmpl	%ecx, %esi
	movl	$1, %edx
	jae	.L82
	.p2align 2,,3
.L75:
	imull	(%esi), %edx
	imull	4(%esi), %edx
	imull	8(%esi), %edx
	addl	$12, %esi
	cmpl	%ecx, %esi
	jb	.L75
.L82:
	cmpl	%eax, %esi
	jae	.L84
	.p2align 2,,3
.L80:
	imull	(%esi), %edx
	addl	$4, %esi
	cmpl	%eax, %esi
	jb	.L80
.L84:
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
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
	movl	$1, %ebx
	jge	.L96
	movl	%eax, %edx
	.p2align 2,,3
.L89:
	imull	(%edx), %ebx
	addl	$12, %edx
	imull	-8(%edx), %ebx
	addl	$3, %ecx
	imull	-4(%edx), %ebx
	cmpl	%edi, %ecx
	jl	.L89
.L96:
	cmpl	%esi, %ecx
	jge	.L98
	.p2align 2,,3
.L94:
	imull	(%eax,%ecx,4), %ebx
	incl	%ecx
	cmpl	%esi, %ecx
	jl	.L94
.L98:
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
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
	movl	$1, %ecx
	jge	.L111
	.p2align 2,,3
.L104:
	imull	(%eax,%edx,4), %ecx
	imull	4(%eax,%edx,4), %ecx
	imull	8(%eax,%edx,4), %ecx
	imull	12(%eax,%edx,4), %ecx
	addl	$4, %edx
	cmpl	%edi, %edx
	jl	.L104
.L111:
	cmpl	%esi, %edx
	jge	.L113
	.p2align 2,,3
.L109:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L109
.L113:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	xorl	%ebx, %ebx
	movl	%eax, %esi
	call	get_vec_start
	addl	$16, %esp
	cmpl	%edi, %ebx
	movl	$1, %ecx
	jge	.L126
	movl	%eax, %edx
	.p2align 2,,3
.L119:
	imull	(%edx), %ecx
	imull	4(%edx), %ecx
	imull	8(%edx), %ecx
	imull	12(%edx), %ecx
	imull	16(%edx), %ecx
	imull	20(%edx), %ecx
	imull	24(%edx), %ecx
	addl	$8, %ebx
	imull	28(%edx), %ecx
	addl	$32, %edx
	cmpl	%edi, %ebx
	jl	.L119
.L126:
	cmpl	%esi, %ebx
	jge	.L128
	.p2align 2,,3
.L124:
	imull	(%eax,%ebx,4), %ecx
	incl	%ebx
	cmpl	%esi, %ebx
	jl	.L124
.L128:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	xorl	%ebx, %ebx
	movl	%eax, %esi
	call	get_vec_start
	addl	$16, %esp
	cmpl	%edi, %ebx
	movl	$1, %ecx
	jge	.L141
	movl	%eax, %edx
	.p2align 2,,3
.L134:
	imull	(%edx), %ecx
	imull	4(%edx), %ecx
	imull	8(%edx), %ecx
	imull	12(%edx), %ecx
	imull	16(%edx), %ecx
	imull	20(%edx), %ecx
	imull	24(%edx), %ecx
	imull	28(%edx), %ecx
	imull	32(%edx), %ecx
	imull	36(%edx), %ecx
	imull	40(%edx), %ecx
	imull	44(%edx), %ecx
	imull	48(%edx), %ecx
	imull	52(%edx), %ecx
	imull	56(%edx), %ecx
	addl	$16, %ebx
	imull	60(%edx), %ecx
	addl	$64, %edx
	cmpl	%edi, %ebx
	jl	.L134
.L141:
	cmpl	%esi, %ebx
	jge	.L143
	.p2align 2,,3
.L139:
	imull	(%eax,%ebx,4), %ecx
	incl	%ebx
	cmpl	%esi, %ebx
	jl	.L139
.L143:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	leal	(%edx,%ebx,4), %ebx
	leal	0(,%esi,4), %eax
	subl	%eax, %ebx
	addl	$16, %esp
	cmpl	%ebx, %edx
	movl	$1, %ecx
	jae	.L154
	.p2align 2,,3
.L148:
	imull	(%edx), %ecx
	imull	4(%edx), %ecx
	addl	$8, %edx
	cmpl	%ebx, %edx
	jb	.L148
.L154:
	leal	(%ebx,%esi,4), %ebx
	cmpl	%ebx, %edx
	jae	.L156
	.p2align 2,,3
.L152:
	imull	(%edx), %ecx
	addl	$4, %edx
	cmpl	%ebx, %edx
	jb	.L152
.L156:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
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
	leal	-8(%eax,%esi,4), %ecx
	addl	$16, %esp
	cmpl	%ecx, %eax
	movl	$1, %edx
	jae	.L167
	.p2align 2,,3
.L161:
	imull	(%eax), %edx
	imull	4(%eax), %edx
	imull	8(%eax), %edx
	addl	$12, %eax
	cmpl	%ecx, %eax
	jb	.L161
.L167:
	addl	$8, %ecx
	cmpl	%ecx, %eax
	jae	.L169
	.p2align 2,,3
.L165:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L165
.L169:
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
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
	leal	-12(%eax,%esi,4), %ecx
	addl	$16, %esp
	cmpl	%ecx, %eax
	movl	$1, %edx
	jae	.L180
	.p2align 2,,3
.L174:
	imull	(%eax), %edx
	imull	4(%eax), %edx
	imull	8(%eax), %edx
	imull	12(%eax), %edx
	addl	$16, %eax
	cmpl	%ecx, %eax
	jb	.L174
.L180:
	addl	$12, %ecx
	cmpl	%ecx, %eax
	jae	.L182
	.p2align 2,,3
.L178:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L178
.L182:
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
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
	movl	%esi, %edi
	subl	%eax, %edi
	leal	(%edx,%esi,4), %ebx
	leal	0(,%edi,4), %eax
	subl	%eax, %ebx
	addl	$16, %esp
	cmpl	%ebx, %edx
	movl	$1, %ecx
	jae	.L194
	.p2align 2,,3
.L188:
	imull	(%edx), %ecx
	imull	4(%edx), %ecx
	imull	8(%edx), %ecx
	imull	12(%edx), %ecx
	imull	16(%edx), %ecx
	imull	20(%edx), %ecx
	imull	24(%edx), %ecx
	imull	28(%edx), %ecx
	addl	$32, %edx
	cmpl	%ebx, %edx
	jb	.L188
.L194:
	leal	(%ebx,%edi,4), %ebx
	cmpl	%ebx, %edx
	jae	.L196
	.p2align 2,,3
.L192:
	imull	(%edx), %ecx
	addl	$4, %edx
	cmpl	%ebx, %edx
	jb	.L192
.L196:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
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
	movl	%esi, %edi
	subl	%eax, %edi
	leal	(%edx,%esi,4), %ebx
	leal	0(,%edi,4), %eax
	subl	%eax, %ebx
	addl	$16, %esp
	cmpl	%ebx, %edx
	movl	$1, %ecx
	jae	.L209
	.p2align 2,,3
.L203:
	imull	(%edx), %ecx
	imull	4(%edx), %ecx
	imull	8(%edx), %ecx
	imull	12(%edx), %ecx
	imull	16(%edx), %ecx
	imull	20(%edx), %ecx
	imull	24(%edx), %ecx
	imull	28(%edx), %ecx
	imull	32(%edx), %ecx
	imull	36(%edx), %ecx
	imull	40(%edx), %ecx
	imull	44(%edx), %ecx
	imull	48(%edx), %ecx
	imull	52(%edx), %ecx
	imull	56(%edx), %ecx
	imull	60(%edx), %ecx
	addl	$64, %edx
	cmpl	%ebx, %edx
	jb	.L203
.L209:
	leal	(%ebx,%edi,4), %ebx
	cmpl	%ebx, %edx
	jae	.L211
	.p2align 2,,3
.L207:
	imull	(%edx), %ecx
	addl	$4, %edx
	cmpl	%ebx, %edx
	jb	.L207
.L211:
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
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
	addl	$16, %esp
	cmpl	%edi, %edx
	movl	$1, %ecx
	movl	$1, %ebx
	jge	.L225
	.p2align 2,,3
.L218:
	imull	(%eax,%edx,4), %ecx
	imull	4(%eax,%edx,4), %ebx
	addl	$2, %edx
	cmpl	%edi, %edx
	jl	.L218
.L225:
	cmpl	%esi, %edx
	jge	.L227
	.p2align 2,,3
.L223:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L223
.L227:
	movl	12(%ebp), %eax
	imull	%ebx, %ecx
	movl	%ecx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	addl	$16, %esp
	cmpl	%edi, %edx
	movl	$1, %ecx
	movl	$1, %ebx
	jge	.L240
	.p2align 2,,3
.L233:
	imull	(%eax,%edx,4), %ecx
	imull	4(%eax,%edx,4), %ebx
	imull	8(%eax,%edx,4), %ecx
	imull	12(%eax,%edx,4), %ebx
	addl	$4, %edx
	cmpl	%edi, %edx
	jl	.L233
.L240:
	cmpl	%esi, %edx
	jge	.L242
	.p2align 2,,3
.L238:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L238
.L242:
	movl	12(%ebp), %eax
	imull	%ebx, %ecx
	movl	%ecx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	xorl	%ebx, %ebx
	movl	%eax, %esi
	call	get_vec_start
	addl	$16, %esp
	cmpl	%edi, %ebx
	movl	%eax, -16(%ebp)
	movl	$1, %ecx
	movl	$1, %eax
	jge	.L255
	movl	-16(%ebp), %edx
	.p2align 2,,3
.L248:
	imull	(%edx), %ecx
	imull	4(%edx), %eax
	imull	8(%edx), %ecx
	imull	12(%edx), %eax
	imull	16(%edx), %ecx
	imull	20(%edx), %eax
	addl	$8, %ebx
	imull	24(%edx), %ecx
	imull	28(%edx), %eax
	addl	$32, %edx
	cmpl	%edi, %ebx
	jl	.L248
.L255:
	cmpl	%esi, %ebx
	jge	.L257
	.p2align 2,,3
.L253:
	movl	-16(%ebp), %edx
	imull	(%edx,%ebx,4), %ecx
	incl	%ebx
	cmpl	%esi, %ebx
	jl	.L253
.L257:
	imull	%eax, %ecx
	movl	12(%ebp), %eax
	movl	%ecx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	movl	%eax, -16(%ebp)
	subl	$7, %eax
	movl	%ebx, (%esp)
	movl	%eax, -20(%ebp)
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	-20(%ebp), %ecx
	movl	%eax, -24(%ebp)
	movl	$1, %ebx
	movl	$1, %eax
	movl	$1, %esi
	movl	$1, %edi
	jge	.L270
	movl	-24(%ebp), %edx
	.p2align 2,,3
.L263:
	imull	(%edx), %ebx
	imull	4(%edx), %eax
	imull	8(%edx), %esi
	imull	12(%edx), %edi
	addl	$8, %ecx
	imull	16(%edx), %ebx
	imull	20(%edx), %eax
	imull	24(%edx), %esi
	imull	28(%edx), %edi
	addl	$32, %edx
	cmpl	-20(%ebp), %ecx
	jl	.L263
.L270:
	cmpl	-16(%ebp), %ecx
	jge	.L272
	.p2align 2,,3
.L268:
	movl	-24(%ebp), %edx
	imull	(%edx,%ecx,4), %ebx
	incl	%ecx
	cmpl	-16(%ebp), %ecx
	jl	.L268
.L272:
	imull	%eax, %ebx
	imull	%esi, %ebx
	imull	%edi, %ebx
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	subl	$40, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, -16(%ebp)
	subl	$11, %eax
	movl	%ebx, (%esp)
	movl	%eax, -20(%ebp)
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	-20(%ebp), %ecx
	movl	%eax, -24(%ebp)
	movl	$1, %ebx
	movl	$1, -28(%ebp)
	movl	$1, %eax
	movl	$1, -36(%ebp)
	movl	$1, %esi
	movl	$1, -32(%ebp)
	jge	.L285
	movl	-24(%ebp), %edx
	.p2align 2,,3
.L278:
	movl	-28(%ebp), %edi
	imull	4(%edx), %edi
	imull	28(%edx), %edi
	movl	%edi, -28(%ebp)
	movl	-36(%ebp), %edi
	imull	12(%edx), %edi
	imull	36(%edx), %edi
	movl	%edi, -36(%ebp)
	movl	-32(%ebp), %edi
	imull	(%edx), %ebx
	imull	8(%edx), %eax
	imull	16(%edx), %esi
	imull	20(%edx), %edi
	addl	$12, %ecx
	imull	44(%edx), %edi
	imull	24(%edx), %ebx
	imull	32(%edx), %eax
	imull	40(%edx), %esi
	addl	$48, %edx
	cmpl	-20(%ebp), %ecx
	movl	%edi, -32(%ebp)
	jl	.L278
.L285:
	cmpl	-16(%ebp), %ecx
	jge	.L287
	.p2align 2,,3
.L283:
	movl	-24(%ebp), %edx
	imull	(%edx,%ecx,4), %ebx
	incl	%ecx
	cmpl	-16(%ebp), %ecx
	jl	.L283
.L287:
	imull	-36(%ebp), %eax
	imull	-28(%ebp), %ebx
	imull	-32(%ebp), %esi
	imull	%eax, %ebx
	imull	%esi, %ebx
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	subl	$56, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, -44(%ebp)
	subl	$7, %eax
	movl	%ebx, (%esp)
	movl	%eax, -16(%ebp)
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	-16(%ebp), %ecx
	movl	%eax, -20(%ebp)
	movl	$1, %ebx
	movl	$1, %eax
	movl	$1, %edi
	movl	$1, -24(%ebp)
	movl	$1, -28(%ebp)
	movl	$1, -32(%ebp)
	movl	$1, -36(%ebp)
	movl	$1, -40(%ebp)
	jge	.L300
	movl	-20(%ebp), %edx
	.p2align 2,,3
.L293:
	movl	-24(%ebp), %esi
	imull	12(%edx), %esi
	movl	%esi, -24(%ebp)
	movl	-28(%ebp), %esi
	imull	16(%edx), %esi
	movl	%esi, -28(%ebp)
	movl	-32(%ebp), %esi
	imull	20(%edx), %esi
	movl	%esi, -32(%ebp)
	movl	-36(%ebp), %esi
	imull	24(%edx), %esi
	movl	%esi, -36(%ebp)
	addl	$8, %ecx
	movl	-40(%ebp), %esi
	imull	28(%edx), %esi
	imull	(%edx), %ebx
	imull	4(%edx), %eax
	imull	8(%edx), %edi
	addl	$32, %edx
	cmpl	-16(%ebp), %ecx
	movl	%esi, -40(%ebp)
	jl	.L293
.L300:
	cmpl	-44(%ebp), %ecx
	jge	.L302
	.p2align 2,,3
.L298:
	movl	-20(%ebp), %edx
	imull	(%edx,%ecx,4), %ebx
	incl	%ecx
	cmpl	-44(%ebp), %ecx
	jl	.L298
.L302:
	imull	%eax, %ebx
	imull	%edi, %ebx
	imull	-24(%ebp), %ebx
	imull	-28(%ebp), %ebx
	imull	-32(%ebp), %ebx
	imull	-36(%ebp), %ebx
	imull	-40(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %esi
	shrl	$31, %eax
	addl	%eax, %esi
	movl	%ebx, (%esp)
	sarl	$1, %esi
	call	get_vec_start
	leal	(%eax,%esi,4), %edx
	movl	%edx, -16(%ebp)
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%esi, %edx
	movl	$1, %ebx
	movl	$1, %ecx
	jge	.L315
	.p2align 2,,3
.L308:
	movl	-16(%ebp), %edi
	imull	(%eax,%edx,4), %ebx
	imull	(%edi,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L308
.L315:
	leal	(%esi,%esi), %edx
	cmpl	-20(%ebp), %edx
	jge	.L317
	.p2align 2,,3
.L313:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	-20(%ebp), %edx
	jl	.L313
.L317:
	movl	12(%ebp), %eax
	imull	%ecx, %ebx
	movl	%ebx, (%eax)
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
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %esi
	shrl	$31, %eax
	addl	%eax, %esi
	movl	%ebx, (%esp)
	sarl	$1, %esi
	call	get_vec_start
	leal	(%eax,%esi,4), %edx
	movl	%edx, -16(%ebp)
	xorl	%edx, %edx
	addl	$16, %esp
	cmpl	%esi, %edx
	movl	$1, %ebx
	movl	$1, %ecx
	jge	.L330
	.p2align 2,,3
.L323:
	movl	-16(%ebp), %edi
	imull	(%eax,%edx,4), %ebx
	imull	(%edi,%edx,4), %ecx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L323
.L330:
	leal	(%esi,%esi), %edx
	cmpl	-20(%ebp), %edx
	jge	.L332
	.p2align 2,,3
.L328:
	imull	(%eax,%edx,4), %ecx
	incl	%edx
	cmpl	-20(%ebp), %edx
	jl	.L328
.L332:
	movl	12(%ebp), %eax
	imull	%ecx, %ebx
	movl	%ebx, (%eax)
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
	leal	-28(%eax,%esi,4), %ebx
	addl	$16, %esp
	cmpl	%ebx, %eax
	movl	$1, %edx
	movl	$1, %ecx
	jae	.L343
	.p2align 2,,3
.L337:
	imull	(%eax), %edx
	imull	4(%eax), %ecx
	imull	8(%eax), %edx
	imull	12(%eax), %ecx
	imull	16(%eax), %edx
	imull	20(%eax), %ecx
	imull	24(%eax), %edx
	imull	28(%eax), %ecx
	addl	$32, %eax
	cmpl	%ebx, %eax
	jb	.L337
.L343:
	addl	$28, %ebx
	cmpl	%ebx, %eax
	jae	.L345
	.p2align 2,,3
.L341:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ebx, %eax
	jb	.L341
.L345:
	movl	12(%ebp), %eax
	imull	%ecx, %edx
	movl	%edx, (%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
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
	leal	-32(%eax,%esi,4), %esi
	addl	$16, %esp
	cmpl	%esi, %eax
	movl	$1, %edx
	movl	$1, %ecx
	movl	$1, %ebx
	jae	.L356
	.p2align 2,,3
.L350:
	imull	(%eax), %edx
	imull	4(%eax), %ecx
	imull	8(%eax), %ebx
	imull	12(%eax), %edx
	imull	16(%eax), %ecx
	imull	20(%eax), %ebx
	imull	24(%eax), %edx
	imull	28(%eax), %ecx
	imull	32(%eax), %ebx
	addl	$36, %eax
	cmpl	%esi, %eax
	jb	.L350
.L356:
	addl	$32, %esi
	cmpl	%esi, %eax
	jae	.L358
	.p2align 2,,3
.L354:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%esi, %eax
	jb	.L354
.L358:
	imull	%ecx, %edx
	movl	12(%ebp), %eax
	imull	%ebx, %edx
	movl	%edx, (%eax)
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	leave
	ret
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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-28(%eax,%esi,4), %ecx
	addl	$16, %esp
	cmpl	%ecx, %eax
	movl	$1, %edx
	movl	$1, %ebx
	movl	$1, %esi
	movl	$1, %edi
	jae	.L369
	.p2align 2,,3
.L363:
	imull	(%eax), %edx
	imull	4(%eax), %ebx
	imull	8(%eax), %esi
	imull	12(%eax), %edi
	imull	16(%eax), %edx
	imull	20(%eax), %ebx
	imull	24(%eax), %esi
	imull	28(%eax), %edi
	addl	$32, %eax
	cmpl	%ecx, %eax
	jb	.L363
.L369:
	addl	$28, %ecx
	cmpl	%ecx, %eax
	jae	.L371
	.p2align 2,,3
.L367:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L367
.L371:
	imull	%ebx, %edx
	imull	%esi, %edx
	movl	12(%ebp), %eax
	imull	%edi, %edx
	movl	%edx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$40, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	vec_length
	movl	%eax, %esi
	movl	%ebx, (%esp)
	call	get_vec_start
	leal	-28(%eax,%esi,4), %ecx
	addl	$16, %esp
	cmpl	%ecx, %eax
	movl	$1, %edx
	movl	$1, -32(%ebp)
	movl	$1, %esi
	movl	$1, %edi
	movl	$1, -16(%ebp)
	movl	$1, -20(%ebp)
	movl	$1, -24(%ebp)
	movl	$1, -28(%ebp)
	jae	.L382
	.p2align 2,,3
.L376:
	movl	-32(%ebp), %ebx
	imull	4(%eax), %ebx
	movl	%ebx, -32(%ebp)
	movl	-16(%ebp), %ebx
	imull	16(%eax), %ebx
	movl	%ebx, -16(%ebp)
	movl	-20(%ebp), %ebx
	imull	20(%eax), %ebx
	movl	%ebx, -20(%ebp)
	movl	-24(%ebp), %ebx
	imull	24(%eax), %ebx
	movl	%ebx, -24(%ebp)
	movl	-28(%ebp), %ebx
	imull	28(%eax), %ebx
	imull	(%eax), %edx
	imull	8(%eax), %esi
	imull	12(%eax), %edi
	addl	$32, %eax
	cmpl	%ecx, %eax
	movl	%ebx, -28(%ebp)
	jb	.L376
.L382:
	addl	$28, %ecx
	cmpl	%ecx, %eax
	jae	.L384
	.p2align 2,,3
.L380:
	imull	(%eax), %edx
	addl	$4, %eax
	cmpl	%ecx, %eax
	jb	.L380
.L384:
	imull	-32(%ebp), %edx
	imull	%esi, %edx
	imull	%edi, %edx
	imull	-16(%ebp), %edx
	imull	-20(%ebp), %edx
	imull	-24(%ebp), %edx
	imull	-28(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	movl	%eax, %ecx
	movl	$1, %ebx
	jge	.L397
	.p2align 2,,3
.L390:
	movl	4(%ecx,%edx,4), %eax
	imull	(%ecx,%edx,4), %eax
	addl	$2, %edx
	imull	%eax, %ebx
	cmpl	%edi, %edx
	jl	.L390
.L397:
	cmpl	%esi, %edx
	jge	.L399
	.p2align 2,,3
.L395:
	imull	(%ecx,%edx,4), %ebx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L395
.L399:
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
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
	movl	%eax, %ecx
	movl	$1, %ebx
	jge	.L412
	.p2align 2,,3
.L405:
	movl	4(%ecx,%edx,4), %eax
	imull	(%ecx,%edx,4), %eax
	imull	8(%ecx,%edx,4), %eax
	addl	$3, %edx
	imull	%eax, %ebx
	cmpl	%edi, %edx
	jl	.L405
.L412:
	cmpl	%esi, %edx
	jge	.L414
	.p2align 2,,3
.L410:
	imull	(%ecx,%edx,4), %ebx
	incl	%edx
	cmpl	%esi, %edx
	jl	.L410
.L414:
	movl	12(%ebp), %eax
	movl	%ebx, (%eax)
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
	movl	%eax, %edi
	leal	-3(%eax), %eax
	movl	%ebx, (%esp)
	movl	%eax, -16(%ebp)
	call	get_vec_start
	xorl	%ecx, %ecx
	addl	$16, %esp
	cmpl	-16(%ebp), %ecx
	movl	%eax, %ebx
	movl	$1, %esi
	jge	.L427
	.p2align 2,,3
.L420:
	movl	4(%ebx,%ecx,4), %edx
	movl	12(%ebx,%ecx,4), %eax
	imull	(%ebx,%ecx,4), %edx
	imull	8(%ebx,%ecx,4), %eax
	imull	%eax, %edx
	addl	$4, %ecx
	imull	%edx, %esi
	cmpl	-16(%ebp), %ecx
	jl	.L420
.L427:
	cmpl	%edi, %ecx
	jge	.L429
	.p2align 2,,3
.L425:
	imull	(%ebx,%ecx,4), %esi
	incl	%ecx
	cmpl	%edi, %ecx
	jl	.L425
.L429:
	movl	12(%ebp), %eax
	movl	%esi, (%eax)
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
	movl	%eax, -16(%ebp)
	xorl	%esi, %esi
	subl	$5, %eax
	movl	%ebx, (%esp)
	movl	%eax, -20(%ebp)
	call	get_vec_start
	addl	$16, %esp
	cmpl	-20(%ebp), %esi
	movl	%eax, -24(%ebp)
	movl	$1, %edi
	jge	.L442
	movl	%eax, %ebx
	.p2align 2,,3
.L435:
	movl	4(%ebx), %eax
	movl	12(%ebx), %ecx
	imull	(%ebx), %eax
	imull	8(%ebx), %ecx
	movl	20(%ebx), %edx
	imull	16(%ebx), %edx
	imull	%ecx, %eax
	imull	%edx, %eax
	addl	$6, %esi
	imull	%eax, %edi
	addl	$24, %ebx
	cmpl	-20(%ebp), %esi
	jl	.L435
.L442:
	cmpl	-16(%ebp), %esi
	jge	.L444
	.p2align 2,,3
.L440:
	movl	-24(%ebp), %eax
	imull	(%eax,%esi,4), %edi
	incl	%esi
	cmpl	-16(%ebp), %esi
	jl	.L440
.L444:
	movl	12(%ebp), %eax
	movl	%edi, (%eax)
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
	movl	%eax, -16(%ebp)
	xorl	%esi, %esi
	subl	$7, %eax
	movl	%ebx, (%esp)
	movl	%eax, -20(%ebp)
	call	get_vec_start
	addl	$16, %esp
	cmpl	-20(%ebp), %esi
	movl	%eax, -24(%ebp)
	movl	$1, %edi
	jge	.L457
	movl	%eax, %ebx
	.p2align 2,,3
.L450:
	movl	4(%ebx), %ecx
	movl	12(%ebx), %eax
	imull	8(%ebx), %eax
	imull	(%ebx), %ecx
	imull	%eax, %ecx
	movl	20(%ebx), %edx
	movl	28(%ebx), %eax
	imull	16(%ebx), %edx
	imull	24(%ebx), %eax
	imull	%eax, %edx
	imull	%edx, %ecx
	addl	$8, %esi
	imull	%ecx, %edi
	addl	$32, %ebx
	cmpl	-20(%ebp), %esi
	jl	.L450
.L457:
	cmpl	-16(%ebp), %esi
	jge	.L459
	.p2align 2,,3
.L455:
	movl	-24(%ebp), %eax
	imull	(%eax,%esi,4), %edi
	incl	%esi
	cmpl	-16(%ebp), %esi
	jl	.L455
.L459:
	movl	12(%ebp), %eax
	movl	%edi, (%eax)
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
