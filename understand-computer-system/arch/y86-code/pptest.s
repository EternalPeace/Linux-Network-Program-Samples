	.file	"pptest.c"
	.text
	.p2align 4,,15
.globl pushtest
	.type	pushtest,@function
pushtest:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
#APP
	movl %esp,%eax;pushl %esp;popl %edx;subl %edx,%eax;movl %eax,%ecx
#NO_APP
	movl	%ecx, %eax
	ret
.Lfe1:
	.size	pushtest,.Lfe1-pushtest
	.p2align 4,,15
.globl poptest
	.type	poptest,@function
poptest:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
#APP
	pushl %eax; movl %esp,%edx; popl %esp; movl %esp,%eax; movl %edx,%esp
#NO_APP
	popl	%ebp
	ret
.Lfe2:
	.size	poptest,.Lfe2-poptest
	.section	.rodata
.LC0:
	.string	"Push test yields  0x%x\n"
.LC1:
	.string	"Pop test yields  0x%x\n"
	.text
	.p2align 4,,15
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	andl	$-16, %esp
	call	pushtest
	movl	$.LC0, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	cmpl	$1, 8(%ebp)
	jg	.L7
.L4:
	movl	%ebp, %esp
	xorl	%eax, %eax
	popl	%ebp
	ret
	.p2align 4,,7
.L7:
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	$0, 4(%esp)
	movl	$0, 12(%esp)
	movl	$10, 8(%esp)
	movl	%eax, (%esp)
	call	__strtol_internal
	movl	%eax, (%esp)
	call	poptest
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	jmp	.L4
.Lfe3:
	.size	main,.Lfe3-main
	.ident	"GCC: (GNU) 3.2.3"
