	.file	"opt-meas.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl aprod
	.type	 aprod,@function
aprod:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl $1,%eax
	xorl %ebx,%ebx
	movl 12(%ebp),%edi
	addl $-2,%edi
	movl %edi,-4(%ebp)
	cmpl %edi,%ebx
	jge .L33
	movl 8(%ebp),%esi
	addl $8,%esi
	movl 8(%ebp),%ecx
	addl $4,%ecx
	movl 8(%ebp),%edx
	.p2align 4,,7
.L35:
	addl (%edx),%eax
	addl (%ecx),%eax
	addl (%esi),%eax
	addl $12,%esi
	addl $12,%ecx
	addl $12,%edx
	addl $3,%ebx
	cmpl -4(%ebp),%ebx
	jl .L35
.L33:
	cmpl 12(%ebp),%ebx
	jge .L42
	movl 8(%ebp),%edi
	leal (%edi,%ebx,4),%ecx
	movl 12(%ebp),%edx
	subl %ebx,%edx
	andl $3,%edx
	je .L40
	cmpl $1,%edx
	jle .L45
	cmpl $2,%edx
	jle .L46
	addl (%ecx),%eax
	addl $4,%ecx
	incl %ebx
.L46:
	addl (%ecx),%eax
	addl $4,%ecx
	incl %ebx
.L45:
	addl (%ecx),%eax
	addl $4,%ecx
	incl %ebx
	cmpl 12(%ebp),%ebx
	jge .L42
	.p2align 4,,7
.L40:
	addl (%ecx),%eax
	addl 4(%ecx),%eax
	addl 8(%ecx),%eax
	addl 12(%ecx),%eax
	addl $16,%ecx
	addl $4,%ebx
	cmpl 12(%ebp),%ebx
	jl .L40
.L42:
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe1:
	.size	 aprod,.Lfe1-aprod
	.align 4
.globl aprod0
	.type	 aprod0,@function
aprod0:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 12(%ebp),%esi
	movl $1,%eax
	xorl %ebx,%ebx
	cmpl %esi,%ebx
	jge .L65
	movl 8(%ebp),%edx
	movl %esi,%ecx
	andl $3,%ecx
	je .L67
	cmpl $1,%ecx
	jle .L71
	cmpl $2,%ecx
	jle .L72
	movl (%edx),%eax
	incl %eax
	addl $4,%edx
	incl %ebx
.L72:
	addl (%edx),%eax
	addl $4,%edx
	incl %ebx
.L71:
	addl (%edx),%eax
	addl $4,%edx
	incl %ebx
	cmpl %esi,%ebx
	jge .L65
	.p2align 4,,7
.L67:
	addl (%edx),%eax
	addl 4(%edx),%eax
	addl 8(%edx),%eax
	addl 12(%edx),%eax
	addl $16,%edx
	addl $4,%ebx
	cmpl %esi,%ebx
	jl .L67
.L65:
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
.Lfe2:
	.size	 aprod0,.Lfe2-aprod0
	.align 4
.globl aprod0p
	.type	 aprod0p,@function
aprod0p:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edx
	movl 12(%ebp),%esi
	leal 0(,%esi,4),%eax
	leal (%eax,%edx),%ebx
	movl $1,%eax
	cmpl %ebx,%edx
	jae .L90
	movl %ebx,%ecx
	subl %edx,%ecx
	andl $15,%ecx
	cmpl %ebx,%edx
	jge .L96
	testl %ecx,%ecx
	je .L92
	cmpl $4,%ecx
	jle .L96
	cmpl $8,%ecx
	jle .L97
	cmpl $13,%ecx
	jge .L92
	movl (%edx),%eax
	incl %eax
	addl $4,%edx
.L97:
	addl (%edx),%eax
	addl $4,%edx
.L96:
	addl (%edx),%eax
	addl $4,%edx
	cmpl %ebx,%edx
	jae .L90
	.p2align 4,,7
.L92:
	addl (%edx),%eax
	addl 4(%edx),%eax
	addl 8(%edx),%eax
	addl 12(%edx),%eax
	addl $16,%edx
	cmpl %ebx,%edx
	jb .L92
.L90:
	leal -8(%ebp),%esp
	popl %ebx
	popl %esi
	leave
	ret
.Lfe3:
	.size	 aprod0p,.Lfe3-aprod0p
	.align 4
.globl aprod1
	.type	 aprod1,@function
aprod1:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%edi
	movl $1,%eax
	xorl %edx,%edx
	cmpl %edi,%edx
	jge .L124
	leal 8(%ecx),%esi
	leal 4(%ecx),%ebx
	.p2align 4,,7
.L117:
	addl (%ecx),%eax
	addl (%ebx),%eax
	addl (%esi),%eax
	addl $12,%esi
	addl $12,%ebx
	addl $12,%ecx
	addl $3,%edx
	cmpl %edi,%edx
	jl .L117
	.p2align 4,,7
.L124:
	leal -12(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe4:
	.size	 aprod1,.Lfe4-aprod1
	.align 4
.globl aprod2
	.type	 aprod2,@function
aprod2:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,%edx
	xorl %ecx,%ecx
	cmpl 12(%ebp),%ecx
	jge .L156
	leal 8(%eax),%edi
	leal 4(%eax),%esi
	movl %eax,-4(%ebp)
	.p2align 4,,7
.L149:
	movl (%esi),%eax
	movl -4(%ebp),%ebx
	addl (%ebx),%eax
	addl %eax,%edx
	addl (%edi),%edx
	addl $12,%edi
	addl $12,%esi
	addl $12,%ebx
	movl %ebx,-4(%ebp)
	addl $3,%ecx
	cmpl 12(%ebp),%ecx
	jl .L149
	.p2align 4,,7
.L156:
	movl %edx,%eax
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe5:
	.size	 aprod2,.Lfe5-aprod2
	.align 4
.globl aprod3
	.type	 aprod3,@function
aprod3:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,-4(%ebp)
	xorl %edx,%edx
	cmpl 12(%ebp),%edx
	jge .L188
	leal 8(%eax),%esi
	leal 4(%eax),%ebx
	movl %eax,%ecx
	.p2align 4,,7
.L181:
	movl (%ebx),%eax
	addl (%ecx),%eax
	addl (%esi),%eax
	addl %eax,-4(%ebp)
	addl $12,%esi
	addl $12,%ebx
	addl $12,%ecx
	addl $3,%edx
	cmpl 12(%ebp),%edx
	jl .L181
	.p2align 4,,7
.L188:
	movl -4(%ebp),%eax
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe6:
	.size	 aprod3,.Lfe6-aprod3
	.align 4
.globl aprod4
	.type	 aprod4,@function
aprod4:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,-4(%ebp)
	xorl %edx,%edx
	cmpl 12(%ebp),%edx
	jge .L220
	leal 8(%eax),%esi
	leal 4(%eax),%ebx
	movl %eax,%ecx
	.p2align 4,,7
.L213:
	movl (%esi),%eax
	addl (%ebx),%eax
	addl (%ecx),%eax
	addl %eax,-4(%ebp)
	addl $12,%esi
	addl $12,%ebx
	addl $12,%ecx
	addl $3,%edx
	cmpl 12(%ebp),%edx
	jl .L213
	.p2align 4,,7
.L220:
	movl -4(%ebp),%eax
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe7:
	.size	 aprod4,.Lfe7-aprod4
	.align 4
.globl aprod5
	.type	 aprod5,@function
aprod5:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,%edx
	xorl %ecx,%ecx
	cmpl 12(%ebp),%ecx
	jge .L252
	leal 8(%eax),%edi
	leal 4(%eax),%esi
	movl %eax,-4(%ebp)
	.p2align 4,,7
.L245:
	movl (%edi),%eax
	movl -4(%ebp),%ebx
	addl (%ebx),%edx
	addl (%esi),%eax
	addl %eax,%edx
	addl $12,%edi
	addl $12,%esi
	addl $12,%ebx
	movl %ebx,-4(%ebp)
	addl $3,%ecx
	cmpl 12(%ebp),%ecx
	jl .L245
	.p2align 4,,7
.L252:
	movl %edx,%eax
	leal -16(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
.Lfe8:
	.size	 aprod5,.Lfe8-aprod5
.globl sink
.data
	.align 4
	.type	 sink,@object
	.size	 sink,4
sink:
	.long 0
.text
	.align 4
.globl t0
	.type	 t0,@function
t0:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod0
	movl %eax,sink
	leave
	ret
.Lfe9:
	.size	 t0,.Lfe9-t0
	.align 4
.globl t0p
	.type	 t0p,@function
t0p:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod0p
	movl %eax,sink
	leave
	ret
.Lfe10:
	.size	 t0p,.Lfe10-t0p
	.align 4
.globl t1
	.type	 t1,@function
t1:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod1
	movl %eax,sink
	leave
	ret
.Lfe11:
	.size	 t1,.Lfe11-t1
	.align 4
.globl t2
	.type	 t2,@function
t2:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod2
	movl %eax,sink
	leave
	ret
.Lfe12:
	.size	 t2,.Lfe12-t2
	.align 4
.globl t3
	.type	 t3,@function
t3:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod3
	movl %eax,sink
	leave
	ret
.Lfe13:
	.size	 t3,.Lfe13-t3
	.align 4
.globl t4
	.type	 t4,@function
t4:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod4
	movl %eax,sink
	leave
	ret
.Lfe14:
	.size	 t4,.Lfe14-t4
	.align 4
.globl t5
	.type	 t5,@function
t5:
	pushl %ebp
	movl %esp,%ebp
	pushl 8(%ebp)
	pushl $a
	call aprod5
	movl %eax,sink
	leave
	ret
.Lfe15:
	.size	 t5,.Lfe15-t5
.section	.rodata
.LC0:
	.string	"A0 CPE = %.2f\n"
.LC1:
	.string	"A0p CPE = %.2f\n"
.LC2:
	.string	"A1 CPE = %.2f\n"
.LC3:
	.string	"A2 CPE = %.2f\n"
.LC4:
	.string	"A3 CPE = %.2f\n"
.LC5:
	.string	"A4 CPE = %.2f\n"
.LC6:
	.string	"A5 CPE = %.2f\n"
.text
	.align 4
.globl main
	.type	 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	pushl $1
	call mhz
	fstp %st(0)
	pushl $1024
	pushl $t0
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC0
	call printf
	pushl $1024
	pushl $t0p
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC1
	call printf
	addl $44,%esp
	pushl $1024
	pushl $t1
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC2
	call printf
	pushl $1024
	pushl $t2
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC3
	call printf
	addl $40,%esp
	pushl $1024
	pushl $t3
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC4
	call printf
	pushl $1024
	pushl $t4
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC5
	call printf
	addl $40,%esp
	pushl $1024
	pushl $t5
	call find_cpe
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC6
	call printf
	xorl %eax,%eax
	leave
	ret
.Lfe16:
	.size	 main,.Lfe16-main
	.comm	a,4096,32
	.ident	"GCC: (GNU) egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)"
