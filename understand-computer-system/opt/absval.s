	.file	"absval.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl absval
	.type	 absval,@function
absval:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	testl %eax,%eax
	jge .L3
	negl %eax
.L3:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 absval,.Lfe1-absval
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
