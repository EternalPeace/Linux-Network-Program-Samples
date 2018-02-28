	.file	"badcnt.c"
.globl cnt
	.data
	.align 4
	.type	cnt,@object
	.size	cnt,4
cnt:
	.long	0
	.section	.rodata
.LC0:
	.string	"BOOM! cnt=%d\n"
.LC1:
	.string	"OK cnt=%d\n"
	.text
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	movl	$0, %eax
	subl	%eax, %esp
	pushl	$0
	pushl	$count
	pushl	$0
	leal	-4(%ebp), %eax
	pushl	%eax
	call	Pthread_create
	addl	$16, %esp
	pushl	$0
	pushl	$count
	pushl	$0
	leal	-8(%ebp), %eax
	pushl	%eax
	call	Pthread_create
	addl	$16, %esp
	subl	$8, %esp
	pushl	$0
	pushl	-4(%ebp)
	call	Pthread_join
	addl	$16, %esp
	subl	$8, %esp
	pushl	$0
	pushl	-8(%ebp)
	call	Pthread_join
	addl	$16, %esp
	movl	cnt, %eax
	cmpl	$400000000, %eax
	je	.L6
	subl	$8, %esp
	pushl	cnt
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	jmp	.L7
.L6:
	subl	$8, %esp
	pushl	cnt
	pushl	$.LC1
	call	printf
	addl	$16, %esp
.L7:
	subl	$12, %esp
	pushl	$0
	call	exit
.Lfe1:
	.size	main,.Lfe1-main
.globl count
	.type	count,@function
count:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	$0, -4(%ebp)
.L9:
	movl	-4(%ebp), %eax
	cmpl	$199999999, %eax
	jle	.L12
	jmp	.L10
.L12:
	movl	cnt, %eax
	incl	%eax
	movl	%eax, cnt
	movl	-4(%ebp), %eax
	incl	%eax
	movl	%eax, -4(%ebp)
	jmp	.L9
.L10:
	movl	$0, %eax
	leave
	ret
.Lfe2:
	.size	count,.Lfe2-count
	.ident	"GCC: (GNU) 3.2.2 20030222 (Red Hat Linux 3.2.2-5)"
