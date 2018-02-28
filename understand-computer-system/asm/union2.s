	.file	"union2.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl proc
	.type	 proc,@function
proc:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 4(%eax),%edx
	movl (%edx),%ecx
	movl %ebp,%esp
	movl (%eax),%eax
	movl (%ecx),%ecx
	subl %eax,%ecx
	movl %ecx,4(%edx)
	popl %ebp
	ret
.Lfe1:
	.size	 proc,.Lfe1-proc
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
