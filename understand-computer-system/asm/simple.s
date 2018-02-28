	.file	"simple.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl simple
	.type	 simple,@function
simple:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl (%eax),%edx
	addl 12(%ebp),%edx
	movl %edx,(%eax)
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 simple,.Lfe1-simple
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
