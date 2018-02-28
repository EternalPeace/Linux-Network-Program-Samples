	.file	"swapadd.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl swap_add
	.type	 swap_add,@function
swap_add:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%edx
	movl 12(%ebp),%ecx
	movl (%edx),%ebx
	movl (%ecx),%eax
	movl %eax,(%edx)
	movl %ebx,(%ecx)
	addl %ebx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 swap_add,.Lfe1-swap_add
	.align 4
.globl caller
	.type	 caller,@function
caller:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	movl $534,-8(%ebp)
	movl $1057,-4(%ebp)
	addl $-8,%esp
	leal -4(%ebp),%eax
	pushl %eax
	leal -8(%ebp),%eax
	pushl %eax
	call swap_add
	movl %eax,%edx
	movl -4(%ebp),%eax
	movl -8(%ebp),%ecx
	subl %eax,%ecx
	movl %ecx,%eax
	imull %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 caller,.Lfe2-caller
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
