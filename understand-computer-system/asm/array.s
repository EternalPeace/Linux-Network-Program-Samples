	.file	"array.c"
	.text
	.p2align 4,,15
.globl get_value
	.type	get_value,@function
get_value:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	movl	16(%ebp), %edx
	leal	(%eax,%eax,2), %eax
	addl	%edx, %eax
	movl	8(%ebp), %edx
	popl	%ebp
	movl	(%edx,%eax,4), %eax
	ret
.Lfe1:
	.size	get_value,.Lfe1-get_value
.globl B
	.data
	.align 4
	.type	B,@object
	.size	B,16
B:
	.long	row0
	.long	row1
	.long	row2
	.long	row3
	.text
	.p2align 4,,15
.globl get_value2
	.type	get_value2,@function
get_value2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	(%eax,%edx,4), %edx
	movl	16(%ebp), %eax
	popl	%ebp
	movl	(%edx,%eax,4), %eax
	ret
.Lfe2:
	.size	get_value2,.Lfe2-get_value2
	.p2align 4,,15
.globl fix_prod_ele
	.type	fix_prod_ele,@function
fix_prod_ele:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	movl	20(%ebp), %eax
	pushl	%ebx
	movl	16(%ebp), %edx
	xorl	%esi, %esi
	movl	12(%ebp), %ebx
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	sall	$6, %edx
	addl	%ebx, %ecx
	movl	$15, %ebx
	addl	%eax, %edx
	.p2align 4,,15
.L8:
	movl	(%ecx), %eax
	addl	$64, %ecx
	imull	(%edx), %eax
	addl	$4, %edx
	addl	%eax, %esi
	decl	%ebx
	jns	.L8
	popl	%ebx
	movl	%esi, %eax
	popl	%esi
	popl	%ebp
	ret
.Lfe3:
	.size	fix_prod_ele,.Lfe3-fix_prod_ele
	.p2align 4,,15
.globl fix_prod_ele_opt
	.type	fix_prod_ele_opt,@function
fix_prod_ele_opt:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	movl	16(%ebp), %edx
	pushl	%ebx
	movl	8(%ebp), %ecx
	xorl	%esi, %esi
	movl	20(%ebp), %eax
	sall	$6, %edx
	addl	%ecx, %edx
	leal	0(,%eax,4), %ecx
	movl	12(%ebp), %eax
	movl	$15, %ebx
	addl	%eax, %ecx
	.p2align 4,,15
.L12:
	movl	(%ecx), %eax
	addl	$64, %ecx
	imull	(%edx), %eax
	addl	$4, %edx
	addl	%eax, %esi
	decl	%ebx
	jns	.L12
	popl	%ebx
	movl	%esi, %eax
	popl	%esi
	popl	%ebp
	ret
.Lfe4:
	.size	fix_prod_ele_opt,.Lfe4-fix_prod_ele_opt
	.p2align 4,,15
.globl fix_ele
	.type	fix_ele,@function
fix_ele:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	movl	16(%ebp), %edx
	sall	$4, %eax
	addl	%edx, %eax
	movl	8(%ebp), %edx
	popl	%ebp
	movl	(%edx,%eax,4), %eax
	ret
.Lfe5:
	.size	fix_ele,.Lfe5-fix_ele
	.p2align 4,,15
.globl new_var_matrix
	.type	new_var_matrix,@function
new_var_matrix:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	$4, (%esp)
	movl	8(%ebp), %eax
	imull	%eax, %eax
	movl	%eax, 4(%esp)
	call	calloc
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe6:
	.size	new_var_matrix,.Lfe6-new_var_matrix
	.p2align 4,,15
.globl var_ele
	.type	var_ele,@function
var_ele:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	20(%ebp), %eax
	movl	16(%ebp), %ecx
	imull	%edx, %eax
	movl	8(%ebp), %edx
	popl	%ebp
	addl	%ecx, %eax
	movl	(%edx,%eax,4), %eax
	ret
.Lfe7:
	.size	var_ele,.Lfe7-var_ele
	.p2align 4,,15
.globl var_prod_ele
	.type	var_prod_ele,@function
var_prod_ele:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	16(%ebp), %ecx
	pushl	%esi
	xorl	%esi, %esi
	cmpl	24(%ebp), %esi
	pushl	%ebx
	jge	.L26
	movl	24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	24(%ebp), %edi
	imull	%eax, %ecx
	movl	20(%ebp), %eax
	sall	$2, %edi
	leal	(%edx,%eax,4), %ebx
	movl	24(%ebp), %edx
	movl	8(%ebp), %eax
	leal	(%eax,%ecx,4), %ecx
	.p2align 4,,15
.L24:
	movl	(%ebx), %eax
	addl	%edi, %ebx
	imull	(%ecx), %eax
	addl	$4, %ecx
	addl	%eax, %esi
	decl	%edx
	jne	.L24
.L26:
	popl	%ebx
	movl	%esi, %eax
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe8:
	.size	var_prod_ele,.Lfe8-var_prod_ele
	.p2align 4,,15
.globl var_prod_ele_opt
	.type	var_prod_ele_opt,@function
var_prod_ele_opt:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	16(%ebp), %edx
	pushl	%esi
	movl	24(%ebp), %eax
	xorl	%esi, %esi
	pushl	%ebx
	movl	20(%ebp), %ecx
	imull	%edx, %eax
	movl	24(%ebp), %edx
	leal	0(,%eax,4), %ebx
	movl	8(%ebp), %eax
	addl	%eax, %ebx
	xorl	%eax, %eax
	testl	%edx, %edx
	jle	.L27
	.p2align 4,,15
.L29:
	movl	12(%ebp), %edi
	movl	(%edi,%ecx,4), %eax
	movl	(%ebx), %edi
	addl	$4, %ebx
	imull	%edi, %eax
	movl	24(%ebp), %edi
	addl	%edi, %ecx
	addl	%eax, %esi
	decl	%edx
	jne	.L29
	movl	%esi, %eax
.L27:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe9:
	.size	var_prod_ele_opt,.Lfe9-var_prod_ele_opt
	.p2align 4,,15
.globl fix_set_diag
	.type	fix_set_diag,@function
fix_set_diag:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %ecx
	movl	8(%ebp), %eax
	movl	$15, %edx
	.p2align 4,,15
.L38:
	movl	%ecx, (%eax)
	addl	$68, %eax
	decl	%edx
	jns	.L38
	popl	%ebp
	ret
.Lfe10:
	.size	fix_set_diag,.Lfe10-fix_set_diag
	.p2align 4,,15
.globl fix_set_diag_opt
	.type	fix_set_diag_opt,@function
fix_set_diag_opt:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	$15, %edx
	addl	$1020, %eax
	.p2align 4,,15
.L42:
	movl	%ecx, (%eax)
	subl	$68, %eax
	decl	%edx
	jns	.L42
	popl	%ebp
	ret
.Lfe11:
	.size	fix_set_diag_opt,.Lfe11-fix_set_diag_opt
	.comm	A,48,32
	.comm	row0,12,4
	.comm	row1,12,4
	.comm	row2,12,4
	.comm	row3,12,4
	.ident	"GCC: (GNU) 3.2.3"
