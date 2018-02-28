	.file	"code-linux.c"
	.version	"01.01"
gcc2_compiled.:
.globl array
.data
	.align 4
	.type	 array,@object
array:
	.long 13
	.long 192
	.long 2816
	.long 40960
	.size	 array,16
.text
	.align 4
.globl Sum
	.type	 Sum,@function
Sum:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%ecx
	movl 12(%ebp),%edx
	xorl %eax,%eax
	testl %edx,%edx
	je .L34
	.p2align 4,,7
.L35:
	addl (%ecx),%eax
	addl $4,%ecx
	decl %edx
	jnz .L35
.L34:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 Sum,.Lfe1-Sum
	.align 4
.globl rSum
	.type	 rSum,@function
rSum:
	pushl %ebp
	movl %esp,%ebp
	subl $20,%esp
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%eax
	testl %eax,%eax
	jle .L38
	addl $-8,%esp
	decl %eax
	pushl %eax
	leal 4(%ebx),%eax
	pushl %eax
	call rSum
	addl (%ebx),%eax
	jmp .L39
	.p2align 4,,7
.L38:
	xorl %eax,%eax
.L39:
	movl -24(%ebp),%ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 rSum,.Lfe2-rSum
.section	.rodata
.LC0:
	.string	"0x%x\n"
.text
	.align 4
.globl Prog
	.type	 Prog,@function
Prog:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	addl $-8,%esp
	pushl $4
	pushl $array
	call Sum
	addl $-8,%esp
	pushl %eax
	pushl $.LC0
	call printf
	addl $32,%esp
	addl $-12,%esp
	pushl $0
	call exit
.Lfe3:
	.size	 Prog,.Lfe3-Prog
	.align 4
.globl main
	.type	 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	call Prog
	xorl %eax,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 main,.Lfe4-main
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
