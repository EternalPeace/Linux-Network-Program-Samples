	.file	"code.c"
.globl accum
	.bss
	.align 4
	.type	accum, @object
	.size	accum, 4
accum:
	.zero	4
	.text
	.p2align 4,,15
.globl sum
	.type	sum, @function
sum:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	addl	8(%ebp), %eax
	addl	%eax, accum
	leave
	ret
	.size	sum, .-sum
	.p2align 4,,15
.globl p
	.type	p, @function
p:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%eax, (%esp)
	call	sum
	leave
	ret
	.size	p, .-p
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.2 20041017 (Red Hat 3.4.2-6.fc3)"
