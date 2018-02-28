	.file	"max.c"
	.text
	.p2align 4,,15
.globl max
	.type	max,@function
max:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	cmpl	%edx, %eax
	jge	.L2
	movl	%edx, %eax
.L2:
	popl	%ebp
	ret
.Lfe1:
	.size	max,.Lfe1-max
	.p2align 4,,15
.globl bmax
	.type	bmax,@function
bmax:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	xorl	%edx, %edx
	popl	%ebp
	cmpl	%ecx, %eax
	setle	%dl
	decl	%edx
	andl	%edx, %eax
	notl	%edx
	andl	%ecx, %edx
	orl	%edx, %eax
	ret
.Lfe2:
	.size	bmax,.Lfe2-bmax
	.p2align 4,,15
.globl bvmax
	.type	bvmax,@function
bvmax:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	xorl	%edx, %edx
	movl	12(%ebp), %ecx
	cmpl	%ecx, %eax
	setg	%dl
	movl	%edx, -4(%ebp)
	movl	-4(%ebp), %edx
	movl	%ebp, %esp
	popl	%ebp
	negl	%edx
	andl	%edx, %eax
	notl	%edx
	andl	%ecx, %edx
	orl	%edx, %eax
	ret
.Lfe3:
	.size	bvmax,.Lfe3-bvmax
	.p2align 4,,15
.globl bamax
	.type	bamax,@function
bamax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %edx
	movl	12(%ebp), %ebx
#APP
	cmpl %edx,%ebx;setg %al;movzbl %al,%ecx
#NO_APP
	negl	%ecx
	andl	%ecx, %edx
	notl	%ecx
	andl	%ebx, %ecx
	popl	%ebx
	orl	%ecx, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
.Lfe4:
	.size	bamax,.Lfe4-bamax
	.p2align 4,,15
.globl cmax
	.type	cmax,@function
cmax:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
#APP
	cmpl %eax, %edx;cmovll %eax,%eax
#NO_APP
	popl	%ebp
	ret
.Lfe5:
	.size	cmax,.Lfe5-cmax
	.p2align 4,,15
	.type	init,@function
init:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	xorl	%ebx, %ebx
	.p2align 4,,15
.L16:
	xorl	%ecx, %ecx
	movl	$1, %eax
	movl	$-1, %edx
	movl	%eax, one(,%ebx,4)
	movl	%ecx, zero(,%ebx,4)
	movl	%edx, m1(,%ebx,4)
	call	random
	andl	$1, %eax
	setne	%al
	movzbl	%al, %eax
	leal	-1(%eax,%eax), %eax
	movl	%eax, pm1(,%ebx,4)
	incl	%ebx
	cmpl	$511, %ebx
	jle	.L16
	popl	%eax
	popl	%ebx
	popl	%ebp
	ret
.Lfe6:
	.size	init,.Lfe6-init
	.p2align 4,,15
.globl test_max
	.type	test_max,@function
test_max:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$12, %esp
	movl	8(%ebp), %edi
	.p2align 4,,15
.L24:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	max
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L24
	movl	%esi, cnt
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe7:
	.size	test_max,.Lfe7-test_max
	.p2align 4,,15
.globl test_bmax
	.type	test_bmax,@function
test_bmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$12, %esp
	movl	8(%ebp), %edi
	.p2align 4,,15
.L32:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L32
	movl	%esi, cnt
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe8:
	.size	test_bmax,.Lfe8-test_bmax
	.p2align 4,,15
.globl test_bvmax
	.type	test_bvmax,@function
test_bvmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$12, %esp
	movl	8(%ebp), %edi
	.p2align 4,,15
.L40:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bvmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L40
	movl	%esi, cnt
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe9:
	.size	test_bvmax,.Lfe9-test_bvmax
	.p2align 4,,15
.globl test_bamax
	.type	test_bamax,@function
test_bamax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$12, %esp
	movl	8(%ebp), %edi
	.p2align 4,,15
.L48:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bamax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L48
	movl	%esi, cnt
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe10:
	.size	test_bamax,.Lfe10-test_bamax
	.p2align 4,,15
.globl test_cmax
	.type	test_cmax,@function
test_cmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$12, %esp
	movl	8(%ebp), %edi
	.p2align 4,,15
.L56:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	cmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L56
	movl	%esi, cnt
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe11:
	.size	test_cmax,.Lfe11-test_cmax
	.p2align 4,,15
.globl test_ref
	.type	test_ref,@function
test_ref:
	pushl	%ebp
	xorl	%ecx, %ecx
	movl	%esp, %ebp
	pushl	%esi
	movl	8(%ebp), %esi
	xorl	%edx, %edx
	pushl	%ebx
	movl	$zero, %ebx
	.p2align 4,,15
.L64:
	movl	(%esi,%edx,4), %eax
	addl	(%ebx,%edx,4), %eax
	incl	%edx
	addl	%eax, %ecx
	cmpl	$511, %edx
	jle	.L64
	popl	%ebx
	movl	%ecx, cnt
	popl	%esi
	popl	%ebp
	ret
.Lfe12:
	.size	test_ref,.Lfe12-test_ref
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1063256064
	.text
	.p2align 4,,15
.globl cpt
	.type	cpt,@function
cpt:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	fcyc
	fmull	.LC0
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe13:
	.size	cpt,.Lfe13-cpt
	.section	.rodata
	.align 32
.LC2:
	.string	"Function: %s\tmax(0, +1)\tCPT = %.2f\n"
	.align 32
.LC3:
	.string	"Function: %s\tmax(0, -1)\tCPT = %.2f\n"
	.align 32
.LC4:
	.string	"Function: %s\tmax(0,+-1)\tCPT = %.2f\n"
	.text
	.p2align 4,,15
.globl run_tests
	.type	run_tests,@function
run_tests:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	%ebx, -8(%ebp)
	movl	8(%ebp), %ebx
	movl	%esi, -4(%ebp)
	movl	12(%ebp), %esi
	movl	%ebx, (%esp)
	movl	$one, 4(%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC2, (%esp)
	call	printf
	movl	%ebx, (%esp)
	movl	$m1, 4(%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC3, (%esp)
	call	printf
	movl	%ebx, (%esp)
	movl	$pm1, 4(%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC4, (%esp)
	call	printf
	movl	-4(%ebp), %esi
	movl	-8(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe14:
	.size	run_tests,.Lfe14-run_tests
	.section	.rodata
.LC6:
	.string	"max"
.LC7:
	.string	"bmax"
.LC8:
	.string	"bvmax"
.LC9:
	.string	"bamax"
.LC10:
	.string	"cmax"
.LC11:
	.string	"reference"
	.text
	.p2align 4,,15
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	call	init
	movl	$test_max, (%esp)
	movl	$.LC6, 4(%esp)
	call	run_tests
	movl	$.LC7, 4(%esp)
	movl	$test_bmax, (%esp)
	call	run_tests
	movl	$.LC8, 4(%esp)
	movl	$test_bvmax, (%esp)
	call	run_tests
	movl	$.LC9, 4(%esp)
	movl	$test_bamax, (%esp)
	call	run_tests
	movl	$.LC10, 4(%esp)
	movl	$test_cmax, (%esp)
	call	run_tests
	movl	$.LC11, 4(%esp)
	movl	$test_ref, (%esp)
	call	run_tests
	movl	%ebp, %esp
	xorl	%eax, %eax
	popl	%ebp
	ret
.Lfe15:
	.size	main,.Lfe15-main
	.comm	one,2048,32
	.comm	zero,2048,32
	.comm	pm1,2048,32
	.comm	m1,2048,32
	.comm	cnt,4,4
	.ident	"GCC: (GNU) 3.2.3"
