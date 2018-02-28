	.file	"div111.c"
	.text
	.align 16
.globl div111
	.type	div111,@function
div111:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	cmpl	$444, %eax
	je	.L7
	cmpl	$444, %eax
	jg	.L15
	cmpl	$111, %eax
	je	.L4
	cmpl	$111, %eax
	jg	.L16
	testl	%eax, %eax
	je	.L3
.L13:
	movl	$-1, %eax
.L1:
	popl	%ebp
	ret
	.p2align 4,,7
.L3:
	xorl	%eax, %eax
	jmp	.L1
	.p2align 4,,7
.L16:
	cmpl	$222, %eax
	je	.L5
	cmpl	$333, %eax
	jne	.L13
	movl	$3, %eax
	jmp	.L1
	.p2align 4,,7
.L5:
	movl	$2, %eax
	jmp	.L1
	.p2align 4,,7
.L4:
	movl	$1, %eax
	jmp	.L1
	.p2align 4,,7
.L15:
	cmpl	$777, %eax
	je	.L10
	cmpl	$777, %eax
	jg	.L17
	cmpl	$555, %eax
	je	.L8
	cmpl	$666, %eax
	jne	.L13
	movl	$6, %eax
	jmp	.L1
	.p2align 4,,7
.L8:
	movl	$5, %eax
	jmp	.L1
	.p2align 4,,7
.L17:
	cmpl	$888, %eax
	je	.L11
	cmpl	$999, %eax
	jne	.L13
	movl	$9, %eax
	jmp	.L1
	.p2align 4,,7
.L11:
	movl	$8, %eax
	jmp	.L1
	.p2align 4,,7
.L10:
	movl	$7, %eax
	jmp	.L1
	.p2align 4,,7
.L7:
	movl	$4, %eax
	jmp	.L1
.Lfe1:
	.size	div111,.Lfe1-div111
	.ident	"GCC: (GNU) 3.0.1"
