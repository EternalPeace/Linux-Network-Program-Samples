	.file	"combine-ans.c"
	.version	"01.01"
gcc2_compiled.:
.globl combine5px8_descr
.data
	.align 32
	.type	 combine5px8_descr,@object
	.size	 combine5px8_descr,32
combine5px8_descr:
	.string	"GNU pointer code, unrolled by 8"
.text
	.align 4
.globl combine5px8
	.type	 combine5px8,@function
combine5px8:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	pushl %ebx
	call vec_length
	movl %eax,%edi
	leal -8(%edi),%esi
	addl $-12,%esp
	pushl %ebx
	call get_vec_start
	xorl %edx,%edx
	xorl %ecx,%ecx
	cmpl %esi,%edx
	jge .L4
	.p2align 4,,7
.L6:
	addl (%eax),%edx
	addl 4(%eax),%edx
	addl 8(%eax),%edx
	addl 12(%eax),%edx
	addl 16(%eax),%edx
	addl 20(%eax),%edx
	addl 24(%eax),%edx
	addl 28(%eax),%edx
	addl $32,%eax
	addl $8,%ecx
	cmpl %esi,%ecx
	jl .L6
.L4:
	cmpl %edi,%ecx
	jge .L13
	subl %ecx,%edi
	movl %edi,%ecx
	.p2align 4,,7
.L11:
	addl (%eax),%edx
	addl $4,%eax
	decl %ecx
	jnz .L11
.L13:
	movl 12(%ebp),%eax
	movl %edx,(%eax)
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 combine5px8,.Lfe1-combine5px8
	.align 4
.globl register_combiners
	.type	 register_combiners,@function
register_combiners:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	addl $-4,%esp
	pushl $combine5px8_descr
	pushl $combine5px8
	pushl $combine5px8
	call add_combiner
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 register_combiners,.Lfe2-register_combiners
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
