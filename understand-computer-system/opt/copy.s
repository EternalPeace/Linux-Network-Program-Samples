	.file	"copy.c"
	.text
	.p2align 4,,15
	.type	stationary_clear,@function
stationary_clear:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %eax
	testl	%eax, %eax
	jle	.L8
	.p2align 4,,15
.L6:
	decl	%eax
	jne	.L6
	movl	12(%ebp), %eax
	movl	$0, (%eax)
.L8:
	popl	%ebp
	ret
.Lfe1:
	.size	stationary_clear,.Lfe1-stationary_clear
	.p2align 4,,15
	.type	stationary_copy,@function
stationary_copy:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	testl	%eax, %eax
	jle	.L17
	movl	%eax, %edx
	.p2align 4,,15
.L15:
	movl	(%ebx), %eax
	decl	%edx
	movl	%eax, (%ecx)
	jne	.L15
.L17:
	popl	%ebx
	popl	%ebp
	ret
.Lfe2:
	.size	stationary_copy,.Lfe2-stationary_copy
	.p2align 4,,15
.globl write_read
	.type	write_read,@function
write_read:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %eax
	pushl	%ebx
	xorl	%edx, %edx
	movl	8(%ebp), %ebx
	decl	%eax
	cmpl	$-1, %eax
	movl	12(%ebp), %ecx
	je	.L24
	.p2align 4,,15
.L22:
	movl	%edx, (%ecx)
	movl	(%ebx), %edx
	decl	%eax
	incl	%edx
	cmpl	$-1, %eax
	jne	.L22
.L24:
	popl	%ebx
	popl	%ebp
	ret
.Lfe3:
	.size	write_read,.Lfe3-write_read
	.p2align 4,,15
	.type	moving_copy,@function
moving_copy:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	testl	%eax, %eax
	jle	.L32
	movl	%eax, %edx
	.p2align 4,,15
.L30:
	movl	(%ebx), %eax
	addl	$4, %ebx
	movl	%eax, (%ecx)
	addl	$4, %ecx
	decl	%edx
	jne	.L30
.L32:
	popl	%ebx
	popl	%ebp
	ret
.Lfe4:
	.size	moving_copy,.Lfe4-moving_copy
	.p2align 4,,15
	.type	moving_clear,@function
moving_clear:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %eax
	movl	12(%ebp), %edx
	testl	%eax, %eax
	jle	.L40
	.p2align 4,,15
.L38:
	movl	$0, (%edx)
	addl	$4, %edx
	decl	%eax
	jne	.L38
.L40:
	popl	%ebp
	ret
.Lfe5:
	.size	moving_clear,.Lfe5-moving_clear
	.p2align 4,,15
.globl copy_array
	.type	copy_array,@function
copy_array:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %ecx
	pushl	%esi
	xorl	%edx, %edx
	movl	8(%ebp), %esi
	pushl	%ebx
	cmpl	%ecx, %edx
	movl	12(%ebp), %ebx
	jge	.L48
	.p2align 4,,15
.L46:
	movl	(%esi,%edx,4), %eax
	movl	%eax, (%ebx,%edx,4)
	incl	%edx
	cmpl	%ecx, %edx
	jl	.L46
.L48:
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe6:
	.size	copy_array,.Lfe6-copy_array
	.p2align 4,,15
.globl array_clear
	.type	array_clear,@function
array_clear:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %edx
	xorl	%eax, %eax
	movl	12(%ebp), %ecx
	cmpl	%edx, %eax
	jge	.L56
	.p2align 4,,15
.L54:
	movl	$0, (%ecx,%eax,4)
	incl	%eax
	cmpl	%edx, %eax
	jl	.L54
.L56:
	popl	%ebp
	ret
.Lfe7:
	.size	array_clear,.Lfe7-array_clear
	.p2align 4,,15
	.type	array_clear_8,@function
array_clear_8:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%esi
	movl	12(%ebp), %esi
	pushl	%ebx
	movl	16(%ebp), %ebx
	leal	-7(%ebx), %ecx
	cmpl	%ecx, %edx
	jge	.L69
	movl	%esi, %eax
	.p2align 4,,15
.L62:
	movl	$0, (%eax)
	addl	$8, %edx
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	movl	$0, 16(%eax)
	movl	$0, 20(%eax)
	movl	$0, 24(%eax)
	movl	$0, 28(%eax)
	addl	$32, %eax
	cmpl	%ecx, %edx
	jl	.L62
.L69:
	cmpl	%ebx, %edx
	jge	.L71
	.p2align 4,,15
.L67:
	movl	$0, (%esi,%edx,4)
	incl	%edx
	cmpl	%ebx, %edx
	jl	.L67
.L71:
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe8:
	.size	array_clear_8,.Lfe8-array_clear_8
	.p2align 4,,15
	.type	mem_clear,@function
mem_clear:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	16(%ebp), %eax
	movl	12(%ebp), %edi
	sall	$2, %eax
	cmpl	$7, %eax
	jbe	.L73
	testl	$4, %edi
	je	.L73
	movl	$0, (%edi)
	subl	$4, %eax
	addl	$4, %edi
.L73:
	cld
	movl	%eax, %ecx
	xorl	%eax, %eax
	shrl	$2, %ecx
	rep
	stosl
	popl	%edi
	popl	%ebp
	ret
.Lfe9:
	.size	mem_clear,.Lfe9-mem_clear
	.p2align 4,,15
	.type	stationary_clear_2,@function
stationary_clear_2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %ecx
	pushl	%esi
	xorl	%eax, %eax
	movl	12(%ebp), %esi
	pushl	%ebx
	leal	-1(%ecx), %edx
	cmpl	%edx, %eax
	jge	.L89
	movl	%eax, %ebx
	.p2align 4,,15
.L82:
	addl	$2, %eax
	cmpl	%edx, %eax
	jl	.L82
	movl	%ebx, (%esi)
.L89:
	cmpl	%ecx, %eax
	jge	.L91
	subl	%eax, %ecx
	movl	%ecx, %eax
	.p2align 4,,15
.L87:
	decl	%eax
	jne	.L87
	movl	$0, (%esi)
.L91:
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe10:
	.size	stationary_clear_2,.Lfe10-stationary_clear_2
	.p2align 4,,15
	.type	stationary_copy_2,@function
stationary_copy_2:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	12(%ebp), %ecx
	pushl	%ebx
	movl	8(%ebp), %ebx
	leal	-1(%edi), %esi
	cmpl	%esi, %edx
	jge	.L106
	.p2align 4,,15
.L99:
	movl	(%ebx), %eax
	addl	$2, %edx
	cmpl	%esi, %edx
	movl	%eax, (%ecx)
	movl	(%ebx), %eax
	movl	%eax, (%ecx)
	jl	.L99
.L106:
	cmpl	%edi, %edx
	jge	.L108
	subl	%edx, %edi
	movl	%edi, %edx
	.p2align 4,,15
.L104:
	movl	(%ebx), %eax
	decl	%edx
	movl	%eax, (%ecx)
	jne	.L104
.L108:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe11:
	.size	stationary_copy_2,.Lfe11-stationary_copy_2
	.p2align 4,,15
	.type	moving_copy_2,@function
moving_copy_2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	8(%ebp), %ecx
	pushl	%ebx
	xorl	%ebx, %ebx
	leal	-1(%edi), %esi
	cmpl	%esi, %ebx
	movl	12(%ebp), %edx
	jge	.L121
	.p2align 4,,15
.L114:
	movl	(%ecx), %eax
	addl	$2, %ebx
	movl	%eax, (%edx)
	movl	4(%ecx), %eax
	addl	$8, %ecx
	movl	%eax, 4(%edx)
	addl	$8, %edx
	cmpl	%esi, %ebx
	jl	.L114
.L121:
	cmpl	%edi, %ebx
	jge	.L123
	subl	%ebx, %edi
	movl	%edi, %ebx
	.p2align 4,,15
.L119:
	movl	(%ecx), %eax
	addl	$4, %ecx
	movl	%eax, (%edx)
	addl	$4, %edx
	decl	%ebx
	jne	.L119
.L123:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe12:
	.size	moving_copy_2,.Lfe12-moving_copy_2
	.p2align 4,,15
	.type	moving_clear_2,@function
moving_clear_2:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%ebx
	movl	16(%ebp), %ebx
	movl	12(%ebp), %eax
	leal	-1(%ebx), %ecx
	cmpl	%ecx, %edx
	jge	.L136
	.p2align 4,,15
.L129:
	movl	$0, (%eax)
	addl	$2, %edx
	movl	$0, 4(%eax)
	addl	$8, %eax
	cmpl	%ecx, %edx
	jl	.L129
.L136:
	cmpl	%ebx, %edx
	jge	.L138
	subl	%edx, %ebx
	movl	%ebx, %edx
	.p2align 4,,15
.L134:
	movl	$0, (%eax)
	addl	$4, %eax
	decl	%edx
	jne	.L134
.L138:
	popl	%ebx
	popl	%ebp
	ret
.Lfe13:
	.size	moving_clear_2,.Lfe13-moving_clear_2
	.p2align 4,,15
	.type	array_copy_2,@function
array_copy_2:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	12(%ebp), %ecx
	pushl	%ebx
	movl	8(%ebp), %ebx
	leal	-1(%edi), %esi
	cmpl	%esi, %edx
	jge	.L151
	.p2align 4,,15
.L144:
	movl	(%ebx,%edx,4), %eax
	movl	%eax, (%ecx,%edx,4)
	movl	4(%ebx,%edx,4), %eax
	movl	%eax, 4(%ecx,%edx,4)
	addl	$2, %edx
	cmpl	%esi, %edx
	jl	.L144
.L151:
	cmpl	%edi, %edx
	jge	.L153
	.p2align 4,,15
.L149:
	movl	(%ebx,%edx,4), %eax
	movl	%eax, (%ecx,%edx,4)
	incl	%edx
	cmpl	%edi, %edx
	jl	.L149
.L153:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe14:
	.size	array_copy_2,.Lfe14-array_copy_2
	.p2align 4,,15
	.type	array_clear_2,@function
array_clear_2:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%eax, %eax
	pushl	%ebx
	movl	16(%ebp), %ebx
	movl	12(%ebp), %edx
	leal	-1(%ebx), %ecx
	cmpl	%ecx, %eax
	jge	.L166
	.p2align 4,,15
.L159:
	movl	$0, (%edx,%eax,4)
	movl	$0, 4(%edx,%eax,4)
	addl	$2, %eax
	cmpl	%ecx, %eax
	jl	.L159
.L166:
	cmpl	%ebx, %eax
	jge	.L168
	.p2align 4,,15
.L164:
	movl	$0, (%edx,%eax,4)
	incl	%eax
	cmpl	%ebx, %eax
	jl	.L164
.L168:
	popl	%ebx
	popl	%ebp
	ret
.Lfe15:
	.size	array_clear_2,.Lfe15-array_clear_2
	.p2align 4,,15
	.type	stationary_clear_4,@function
stationary_clear_4:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %ecx
	pushl	%esi
	xorl	%eax, %eax
	movl	12(%ebp), %esi
	pushl	%ebx
	leal	-3(%ecx), %edx
	cmpl	%edx, %eax
	jge	.L181
	movl	%eax, %ebx
	.p2align 4,,15
.L174:
	addl	$4, %eax
	cmpl	%edx, %eax
	jl	.L174
	movl	%ebx, (%esi)
.L181:
	cmpl	%ecx, %eax
	jge	.L183
	subl	%eax, %ecx
	movl	%ecx, %eax
	.p2align 4,,15
.L179:
	decl	%eax
	jne	.L179
	movl	$0, (%esi)
.L183:
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe16:
	.size	stationary_clear_4,.Lfe16-stationary_clear_4
	.p2align 4,,15
	.type	stationary_copy_4,@function
stationary_copy_4:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	12(%ebp), %ecx
	pushl	%ebx
	movl	8(%ebp), %ebx
	leal	-3(%edi), %esi
	cmpl	%esi, %edx
	jge	.L198
	.p2align 4,,15
.L191:
	movl	(%ebx), %eax
	addl	$4, %edx
	cmpl	%esi, %edx
	movl	%eax, (%ecx)
	movl	(%ebx), %eax
	movl	%eax, (%ecx)
	movl	(%ebx), %eax
	movl	%eax, (%ecx)
	movl	(%ebx), %eax
	movl	%eax, (%ecx)
	jl	.L191
.L198:
	cmpl	%edi, %edx
	jge	.L200
	subl	%edx, %edi
	movl	%edi, %edx
	.p2align 4,,15
.L196:
	movl	(%ebx), %eax
	decl	%edx
	movl	%eax, (%ecx)
	jne	.L196
.L200:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe17:
	.size	stationary_copy_4,.Lfe17-stationary_copy_4
	.p2align 4,,15
	.type	moving_copy_4,@function
moving_copy_4:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	8(%ebp), %ecx
	pushl	%ebx
	xorl	%ebx, %ebx
	leal	-3(%edi), %esi
	cmpl	%esi, %ebx
	movl	12(%ebp), %edx
	jge	.L213
	.p2align 4,,15
.L206:
	movl	(%ecx), %eax
	addl	$4, %ebx
	movl	%eax, (%edx)
	movl	4(%ecx), %eax
	movl	%eax, 4(%edx)
	movl	8(%ecx), %eax
	movl	%eax, 8(%edx)
	movl	12(%ecx), %eax
	addl	$16, %ecx
	movl	%eax, 12(%edx)
	addl	$16, %edx
	cmpl	%esi, %ebx
	jl	.L206
.L213:
	cmpl	%edi, %ebx
	jge	.L215
	subl	%ebx, %edi
	movl	%edi, %ebx
	.p2align 4,,15
.L211:
	movl	(%ecx), %eax
	addl	$4, %ecx
	movl	%eax, (%edx)
	addl	$4, %edx
	decl	%ebx
	jne	.L211
.L215:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe18:
	.size	moving_copy_4,.Lfe18-moving_copy_4
	.p2align 4,,15
	.type	moving_clear_4,@function
moving_clear_4:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%ebx
	movl	16(%ebp), %ebx
	movl	12(%ebp), %eax
	leal	-3(%ebx), %ecx
	cmpl	%ecx, %edx
	jge	.L228
	.p2align 4,,15
.L221:
	movl	$0, (%eax)
	addl	$4, %edx
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	%ecx, %edx
	jl	.L221
.L228:
	cmpl	%ebx, %edx
	jge	.L230
	subl	%edx, %ebx
	movl	%ebx, %edx
	.p2align 4,,15
.L226:
	movl	$0, (%eax)
	addl	$4, %eax
	decl	%edx
	jne	.L226
.L230:
	popl	%ebx
	popl	%ebp
	ret
.Lfe19:
	.size	moving_clear_4,.Lfe19-moving_clear_4
	.p2align 4,,15
	.type	array_copy_4,@function
array_copy_4:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%edx, %edx
	pushl	%edi
	movl	16(%ebp), %edi
	pushl	%esi
	movl	12(%ebp), %ecx
	pushl	%ebx
	movl	8(%ebp), %ebx
	leal	-3(%edi), %esi
	cmpl	%esi, %edx
	jge	.L243
	.p2align 4,,15
.L236:
	movl	(%ebx,%edx,4), %eax
	movl	%eax, (%ecx,%edx,4)
	movl	4(%ebx,%edx,4), %eax
	movl	%eax, 4(%ecx,%edx,4)
	movl	8(%ebx,%edx,4), %eax
	movl	%eax, 8(%ecx,%edx,4)
	movl	12(%ebx,%edx,4), %eax
	movl	%eax, 12(%ecx,%edx,4)
	addl	$4, %edx
	cmpl	%esi, %edx
	jl	.L236
.L243:
	cmpl	%edi, %edx
	jge	.L245
	.p2align 4,,15
.L241:
	movl	(%ebx,%edx,4), %eax
	movl	%eax, (%ecx,%edx,4)
	incl	%edx
	cmpl	%edi, %edx
	jl	.L241
.L245:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe20:
	.size	array_copy_4,.Lfe20-array_copy_4
	.p2align 4,,15
	.type	array_clear_4,@function
array_clear_4:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%eax, %eax
	pushl	%ebx
	movl	16(%ebp), %ebx
	movl	12(%ebp), %edx
	leal	-3(%ebx), %ecx
	cmpl	%ecx, %eax
	jge	.L258
	.p2align 4,,15
.L251:
	movl	$0, (%edx,%eax,4)
	movl	$0, 4(%edx,%eax,4)
	movl	$0, 8(%edx,%eax,4)
	movl	$0, 12(%edx,%eax,4)
	addl	$4, %eax
	cmpl	%ecx, %eax
	jl	.L251
.L258:
	cmpl	%ebx, %eax
	jge	.L260
	.p2align 4,,15
.L256:
	movl	$0, (%edx,%eax,4)
	incl	%eax
	cmpl	%ebx, %eax
	jl	.L256
.L260:
	popl	%ebx
	popl	%ebp
	ret
.Lfe21:
	.size	array_clear_4,.Lfe21-array_clear_4
	.data
	.align 32
	.type	copier,@object
	.size	copier,84
copier:
	.long	stationary_copy
	.long	moving_copy
	.long	copy_array
	.long	stationary_clear
	.long	moving_clear
	.long	array_clear
	.long	stationary_copy_2
	.long	moving_copy_2
	.long	array_copy_2
	.long	stationary_clear_2
	.long	moving_clear_2
	.long	array_clear_2
	.long	stationary_copy_4
	.long	moving_copy_4
	.long	array_copy_4
	.long	stationary_clear_4
	.long	moving_clear_4
	.long	array_clear_4
	.long	array_clear_8
	.long	mem_clear
	.long	write_read
	.section	.rodata
.LC0:
	.string	"Stationary Copy"
.LC1:
	.string	"Moving Copy"
.LC2:
	.string	"Array Copy"
.LC3:
	.string	"Stationary Clear"
.LC4:
	.string	"Moving Clear"
.LC5:
	.string	"Array Clear"
.LC6:
	.string	"Stationary Copy x2"
.LC7:
	.string	"Moving Copy x2"
.LC8:
	.string	"Array Copy x2"
.LC9:
	.string	"Stationary Clear x2"
.LC10:
	.string	"Moving Clear x2"
.LC11:
	.string	"Array Clear x2"
.LC12:
	.string	"Stationary Copy x4"
.LC13:
	.string	"Moving Copy x4"
.LC14:
	.string	"Array Copy x4"
.LC15:
	.string	"Stationary Clear x4"
.LC16:
	.string	"Moving Clear x4"
.LC17:
	.string	"Array Clear x4"
.LC18:
	.string	"Array Clear x8"
.LC19:
	.string	"Memset Clear"
.LC20:
	.string	"Write-Read"
	.data
	.align 32
	.type	test_descr,@object
	.size	test_descr,84
test_descr:
	.long	.LC0
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.long	.LC5
	.long	.LC6
	.long	.LC7
	.long	.LC8
	.long	.LC9
	.long	.LC10
	.long	.LC11
	.long	.LC12
	.long	.LC13
	.long	.LC14
	.long	.LC15
	.long	.LC16
	.long	.LC17
	.long	.LC18
	.long	.LC19
	.long	.LC20
.globl idx
	.align 4
	.type	idx,@object
	.size	idx,4
idx:
	.long	0
	.text
	.p2align 4,,15
	.type	test2a,@function
test2a:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$data, 4(%esp)
	movl	8(%ebp), %eax
	movl	$data, (%esp)
	movl	%eax, 8(%esp)
	movl	idx, %eax
	call	*copier(,%eax,4)
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe22:
	.size	test2a,.Lfe22-test2a
	.p2align 4,,15
	.type	test2b,@function
test2b:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$data+4, 4(%esp)
	movl	8(%ebp), %eax
	movl	$data, (%esp)
	movl	%eax, 8(%esp)
	movl	idx, %eax
	call	*copier(,%eax,4)
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe23:
	.size	test2b,.Lfe23-test2b
	.p2align 4,,15
	.type	test2c,@function
test2c:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$data, 4(%esp)
	movl	8(%ebp), %eax
	movl	$data+4, (%esp)
	movl	%eax, 8(%esp)
	movl	idx, %eax
	call	*copier(,%eax,4)
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe24:
	.size	test2c,.Lfe24-test2c
	.p2align 4,,15
	.type	test2d,@function
test2d:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$data2, 4(%esp)
	movl	8(%ebp), %eax
	movl	$data, (%esp)
	movl	%eax, 8(%esp)
	movl	idx, %eax
	call	*copier(,%eax,4)
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe25:
	.size	test2d,.Lfe25-test2d
	.data
	.align 4
	.type	case_fun,@object
	.size	case_fun,16
case_fun:
	.long	test2a
	.long	test2b
	.long	test2c
	.long	test2d
	.section	.rodata
.LC21:
	.string	"data --> data"
.LC22:
	.string	"data --> data+1"
.LC23:
	.string	"data+1 --> data"
.LC24:
	.string	"data1 --> data2"
	.data
	.align 4
	.type	case_descr,@object
	.size	case_descr,16
case_descr:
	.long	.LC21
	.long	.LC22
	.long	.LC23
	.long	.LC24
	.section	.rodata
.LC25:
	.string	"Description: %s, %s, "
.LC26:
	.string	"CPE = %.2f\n"
	.text
	.p2align 4,,15
	.type	run_test,@function
run_test:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	%esi, -4(%ebp)
	movl	12(%ebp), %esi
	movl	%ebx, -8(%ebp)
	movl	8(%ebp), %ebx
	movl	case_descr(,%esi,4), %eax
	movl	$.LC25, (%esp)
	movl	%eax, 8(%esp)
	movl	test_descr(,%ebx,4), %eax
	movl	%eax, 4(%esp)
	call	printf
	movl	case_fun(,%esi,4), %eax
	movl	%ebx, idx
	movl	$1024, 4(%esp)
	movl	%eax, (%esp)
	call	find_cpe
	movl	$.LC26, (%esp)
	fstpl	4(%esp)
	call	printf
	movl	-4(%ebp), %esi
	movl	-8(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe26:
	.size	run_test,.Lfe26-run_test
	.p2align 4,,15
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	subl	$16, %esp
	andl	$-16, %esp
	.p2align 4,,15
.L276:
	xorl	%ebx, %ebx
.L275:
	movl	%ebx, 4(%esp)
	incl	%ebx
	movl	%esi, (%esp)
	call	run_test
	cmpl	$3, %ebx
	jle	.L275
	incl	%esi
	cmpl	$20, %esi
	jle	.L276
	leal	-8(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe27:
	.size	main,.Lfe27-main
	.comm	data,4100,32
	.comm	data2,4100,32
	.ident	"GCC: (GNU) 3.2.3"
