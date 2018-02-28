	.file	"branch.c"
	.text
	.p2align 4,,15
.globl silly
	.type	silly,@function
silly:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	jle	.L7
	.p2align 4,,15
.L5:
	movl	%edx, %eax
	sarl	%eax
	subl	%eax, %edx
	testl	%edx, %edx
	jg	.L5
.L7:
	popl	%ebp
	movl	%edx, %eax
	ret
.Lfe1:
	.size	silly,.Lfe1-silly
	.p2align 4,,15
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$2, (%esp)
	call	silly
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe2:
	.size	main,.Lfe2-main
	.ident	"GCC: (GNU) 3.2.3"
