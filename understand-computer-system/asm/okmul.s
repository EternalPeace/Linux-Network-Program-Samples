	.file	"okmul.c"
	.text
	.p2align 4,,15
.globl ok_smul1
	.type	ok_smul1,@function
ok_smul1:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	imull	%edx, %eax
	movl	16(%ebp), %edx
	movl	%eax, (%edx)
#APP
	setae %al
#NO_APP
	xorl	%eax, %eax
	popl	%ebp
	ret
.Lfe1:
	.size	ok_smul1,.Lfe1-ok_smul1
.globl dummy
	.data
	.align 4
	.type	dummy,@object
	.size	dummy,4
dummy:
	.long	0
	.text
	.p2align 4,,15
.globl ok_smul2
	.type	ok_smul2,@function
ok_smul2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	16(%ebp), %edx
	imull	%ecx, %eax
	movl	%eax, (%edx)
	movl	dummy, %eax
#APP
	setae %al
#NO_APP
	popl	%ebp
	ret
.Lfe2:
	.size	ok_smul2,.Lfe2-ok_smul2
	.p2align 4,,15
.globl ok_smul3
	.type	ok_smul3,@function
ok_smul3:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	16(%ebp), %edx
	imull	%ebx, %eax
	movl	%eax, (%edx)
#APP
	setae %bl; movzbl %bl,%eax
#NO_APP
	popl	%ebx
	popl	%ebp
	ret
.Lfe3:
	.size	ok_smul3,.Lfe3-ok_smul3
	.p2align 4,,15
.globl ok_smul4
	.type	ok_smul4,@function
ok_smul4:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	imull	%edx, %eax
	movl	16(%ebp), %edx
	movl	%eax, (%edx)
#APP
	setae %al
#NO_APP
	popl	%ebp
	movzbl	%al, %eax
	ret
.Lfe4:
	.size	ok_smul4,.Lfe4-ok_smul4
	.p2align 4,,15
.globl ok_umul
	.type	ok_umul,@function
ok_umul:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
#APP
	movl %ebx,%eax; mull %ecx; movl %eax,%ebx; 
           setae %dl; movzbl %dl,%ecx
#NO_APP
	movl	16(%ebp), %eax
	movl	%ebx, (%eax)
	movl	%ecx, %eax
	popl	%ebx
	popl	%ebp
	ret
.Lfe5:
	.size	ok_umul,.Lfe5-ok_umul
	.p2align 4,,15
.globl ok_umul2
	.type	ok_umul2,@function
ok_umul2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
#APP
	movl %ecx,%eax; mull %edx; movl %eax,%ecx; setae %dl
#NO_APP
	movl	16(%ebp), %eax
	movl	%ecx, (%eax)
	movzbl	%dl, %eax
	popl	%ebp
	ret
.Lfe6:
	.size	ok_umul2,.Lfe6-ok_umul2
	.section	.rodata
.LC0:
	.string	"Enter sx:"
.LC1:
	.string	"%d"
.LC2:
	.string	"Enter sy:"
	.align 32
.LC3:
	.string	"ok_smul1: %d*%d=%d does not overflow\n"
	.align 32
.LC5:
	.string	"ok_smul2: %d*%d=%d does not overflow\n"
	.align 32
.LC7:
	.string	"ok_smul3: %d*%d=%d does not overflow\n"
	.align 32
.LC9:
	.string	"ok_smul4: %d*%d=%d does not overflow\n"
.LC11:
	.string	"Enter ux:"
.LC12:
	.string	"%u"
.LC13:
	.string	"Enter uy:"
	.align 32
.LC14:
	.string	"ok_umul: %u*%u=%u does not overflow\n"
	.align 32
.LC16:
	.string	"ok_umul2: %u*%u=%u does not overflow\n"
.LC17:
	.string	"ok_umul2: %u*%u=%u overflows\n"
.LC15:
	.string	"ok_umul: %u*%u=%u overflows\n"
.LC10:
	.string	"ok_smul4: %d*%d=%d overflows\n"
.LC8:
	.string	"ok_smul3: %d*%d=%d overflows\n"
.LC6:
	.string	"ok_smul2: %d*%d=%d overflows\n"
.LC4:
	.string	"ok_smul1: %d*%d=%d overflows\n"
	.text
	.p2align 4,,15
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	andl	$-16, %esp
	movl	$.LC0, (%esp)
	leal	-16(%ebp), %ebx
	call	printf
	movl	$.LC1, (%esp)
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	call	scanf
	movl	$.LC2, (%esp)
	call	printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	scanf
	movl	-12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_smul1
	testl	%eax, %eax
	je	.L8
	movl	$.LC3, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
.L20:
	call	printf
	movl	-12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_smul2
	testl	%eax, %eax
	je	.L10
	movl	$.LC5, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
.L21:
	call	printf
	movl	-12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_smul3
	testl	%eax, %eax
	je	.L12
	movl	$.LC7, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
.L22:
	call	printf
	movl	-12(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_smul4
	testl	%eax, %eax
	je	.L14
	movl	$.LC9, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
.L23:
	call	printf
	movl	$.LC11, (%esp)
	leal	-28(%ebp), %ebx
	call	printf
	movl	$.LC12, (%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	call	scanf
	movl	$.LC13, (%esp)
	call	printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC12, (%esp)
	call	scanf
	movl	-24(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_umul
	testl	%eax, %eax
	je	.L16
	movl	$.LC14, (%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
.L24:
	call	printf
	movl	-24(%ebp), %eax
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	ok_umul2
	testl	%eax, %eax
	je	.L18
	movl	$.LC16, (%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L25
	.p2align 4,,7
.L18:
	movl	$.LC17, (%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
.L25:
	call	printf
	movl	$0, (%esp)
	call	exit
	.p2align 4,,7
.L16:
	movl	$.LC15, (%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L24
	.p2align 4,,7
.L14:
	movl	$.LC10, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L23
	.p2align 4,,7
.L12:
	movl	$.LC8, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L22
	.p2align 4,,7
.L10:
	movl	$.LC6, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L21
	.p2align 4,,7
.L8:
	movl	$.LC4, (%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	jmp	.L20
.Lfe7:
	.size	main,.Lfe7-main
	.ident	"GCC: (GNU) 3.2.3"
