	.file	"fp.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl ident_x
	.type	 ident_x,@function
ident_x:
	pushl %ebp
	movl %esp,%ebp
	fldl 8(%ebp)
	fmul %st(0),%st
	fdivl 8(%ebp)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 ident_x,.Lfe1-ident_x
.globl i
.data
	.align 4
	.type	 i,@object
	.size	 i,4
i:
	.long 0
.text
	.align 4
.globl ident_d
	.type	 ident_d,@function
ident_d:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	fldl 8(%ebp)
	fld %st(0)
	fmul %st(0),%st
	fstpl -8(%ebp)
	movl i,%eax
	sall $3,%eax
	fdivrl -8(%eax,%ebp)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 ident_d,.Lfe2-ident_d
	.align 4
.globl funct
	.type	 funct,@function
funct:
	pushl %ebp
	movl %esp,%ebp
	subl $40,%esp
	fldl 8(%ebp)
	flds 16(%ebp)
	fmulp %st,%st(1)
	movl 28(%ebp),%eax
	movl %eax,-20(%ebp)
	fildl -20(%ebp)
	fldl 20(%ebp)
	fdivp %st,%st(1)
	movl %ebp,%esp
	popl %ebp
	fsubrp %st,%st(1)
	ret
.Lfe3:
	.size	 funct,.Lfe3-funct
	.align 4
.globl less
	.type	 less,@function
less:
	pushl %ebp
	movl %esp,%ebp
	fldl 16(%ebp)
	fcompl 8(%ebp)
	fnstsw %ax
	andb $69,%ah
	sete %al
	movzbl %al,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 less,.Lfe4-less
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
