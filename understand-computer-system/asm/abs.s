	.file	"abs.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl absdiff
	.type	 absdiff,@function
absdiff:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	cmpl %eax,%edx
	jl .L3
	subl %eax,%edx
	movl %edx,%eax
	jmp .L5
	.p2align 4,,7
.L3:
	subl %edx,%eax
.L5:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 absdiff,.Lfe1-absdiff
	.align 4
.globl gotodiff
	.type	 gotodiff,@function
gotodiff:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%ecx
	movl 12(%ebp),%edx
	movl %edx,%eax
	subl %ecx,%eax
	cmpl %edx,%ecx
	jl .L8
	movl %ecx,%eax
	subl %edx,%eax
.L8:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 gotodiff,.Lfe2-gotodiff
	.align 4
.globl absdiff2
	.type	 absdiff2,@function
absdiff2:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%ecx
	movl %edx,%eax
	subl %ecx,%eax
	cmpl %ecx,%edx
	jge .L11
	movl %ecx,%eax
	subl %edx,%eax
.L11:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 absdiff2,.Lfe3-absdiff2
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
