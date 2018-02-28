	.file	"deref.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl deref
	.type	 deref,@function
deref:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	xorl %eax,%eax
	testl %edx,%edx
	je .L3
	movl (%edx),%eax
.L3:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 deref,.Lfe1-deref
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
