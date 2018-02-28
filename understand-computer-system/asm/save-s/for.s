	.file	"for.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl loop
	.type	 loop,@function
loop:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 16(%ebp),%edx
	xorl %eax,%eax
	decl %edx
	js .L4
	movl %ebx,%ecx
	imull 12(%ebp),%ecx
	.p2align 4,,7
.L6:
	addl %ecx,%eax
	subl %ebx,%edx
	jns .L6
.L4:
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 loop,.Lfe1-loop
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
