	.file	"inner.c"
gcc2_compiled.:
___gnu_compiled_c:
.globl _abstract_descr
.data
	.align 32
_abstract_descr:
	.ascii "Maximum use of data abstraction\0"
.text
	.align 4
.globl _abstract_inner
	.def	_abstract_inner;	.scl	2;	.type	32;	.endef
_abstract_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edi
	xorl %ebx,%ebx
	movl 16(%ebp),%esi
	movl $0,(%esi)
	jmp L3
	.align 4
L6:
	addl $-4,%esp
	leal -4(%ebp),%eax
	pushl %eax
	pushl %ebx
	pushl %edi
	call _get_vec_element
	addl $-4,%esp
	leal -8(%ebp),%eax
	pushl %eax
	pushl %ebx
	movl 12(%ebp),%eax
	incl %ebx
	pushl %eax
	call _get_vec_element
	movl -4(%ebp),%eax
	addl $32,%esp
	imull -8(%ebp),%eax
	addl %eax,(%esi)
L3:
	addl $-12,%esp
	pushl %edi
	call _vec_length
	addl $16,%esp
	cmpl %eax,%ebx
	jl L6
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _motion_descr
.data
_motion_descr:
	.ascii "Take vec_length() out of loop\0"
.text
	.align 4
.globl _motion_inner
	.def	_motion_inner;	.scl	2;	.type	32;	.endef
_motion_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%edi
	addl $-12,%esp
	movl 8(%ebp),%eax
	xorl %ebx,%ebx
	pushl %eax
	call _vec_length
	movl %eax,%esi
	movl $0,(%edi)
	addl $16,%esp
	cmpl %esi,%ebx
	jge L10
	.align 4
L12:
	addl $-4,%esp
	leal -4(%ebp),%eax
	pushl %eax
	pushl %ebx
	movl 8(%ebp),%eax
	pushl %eax
	call _get_vec_element
	addl $-4,%esp
	leal -8(%ebp),%eax
	pushl %eax
	pushl %ebx
	movl 12(%ebp),%eax
	incl %ebx
	pushl %eax
	call _get_vec_element
	movl -4(%ebp),%eax
	addl $32,%esp
	imull -8(%ebp),%eax
	addl %eax,(%edi)
	cmpl %esi,%ebx
	jl L12
L10:
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _array_descr
.data
	.align 32
_array_descr:
	.ascii "Array reference to vector data\0"
.text
	.align 4
.globl _array_inner
	.def	_array_inner;	.scl	2;	.type	32;	.endef
_array_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 16(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	movl %eax,%ebx
	addl $32,%esp
	addl $-12,%esp
	movl 12(%ebp),%eax
	pushl %eax
	call _get_vec_start
	movl %eax,%ecx
	movl $0,(%esi)
	xorl %edx,%edx
	cmpl %edi,%edx
	jge L16
	.align 4
L18:
	movl (%ebx,%edx,4),%eax
	imull (%ecx,%edx,4),%eax
	addl %eax,(%esi)
	incl %edx
	cmpl %edi,%edx
	jl L18
L16:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _inner4_descr
.data
	.align 32
_inner4_descr:
	.ascii "inner4: Array reference, accumulate in temporary\0"
.text
	.align 4
.globl _inner4
	.def	_inner4;	.scl	2;	.type	32;	.endef
_inner4:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	movl %eax,%esi
	addl $32,%esp
	addl $-12,%esp
	movl 12(%ebp),%eax
	pushl %eax
	call _get_vec_start
	movl %eax,%ebx
	xorl %ecx,%ecx
	xorl %edx,%edx
	cmpl %edi,%ecx
	jge L22
	.align 4
L24:
	movl (%esi,%edx,4),%eax
	imull (%ebx,%edx,4),%eax
	addl %eax,%ecx
	incl %edx
	cmpl %edi,%edx
	jl L24
L22:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %ecx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _pointer_descr
.data
	.align 32
_pointer_descr:
	.ascii "Pointer reference, accumulate in temporary\0"
.text
	.align 4
.globl _pointer_inner
	.def	_pointer_inner;	.scl	2;	.type	32;	.endef
_pointer_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,%edx
	leal (%ebx,%edi,4),%ecx
	cmpl %ecx,%ebx
	jae L28
	.align 4
L30:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl $4,%ebx
	addl %eax,%esi
	addl $4,%edx
	cmpl %ecx,%ebx
	jb L30
L28:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %esi,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll2a_descr
.data
_unroll2a_descr:
	.ascii "Array code, unrolled by 2\0"
.text
	.align 4
.globl _unroll2a_inner
	.def	_unroll2a_inner;	.scl	2;	.type	32;	.endef
_unroll2a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	pushl %ebx
	call _vec_length
	movl %eax,-4(%ebp)
	addl $-12,%esp
	pushl %ebx
	movl %eax,%esi
	call _get_vec_start
	decl %esi
	movl %eax,%edi
	addl $32,%esp
	addl $-12,%esp
	movl 12(%ebp),%eax
	pushl %eax
	call _get_vec_start
	movl %eax,%ebx
	xorl %edx,%edx
	xorl %ecx,%ecx
	cmpl %esi,%edx
	jge L44
	.align 4
L36:
	movl (%edi,%ecx,4),%eax
	imull (%ebx,%ecx,4),%eax
	addl %edx,%eax
	movl 4(%edi,%ecx,4),%edx
	imull 4(%ebx,%ecx,4),%edx
	addl %eax,%edx
	addl $2,%ecx
	cmpl %esi,%ecx
	jl L36
	jmp L44
	.align 4
L41:
	movl (%edi,%ecx,4),%eax
	imull (%ebx,%ecx,4),%eax
	addl %eax,%edx
	incl %ecx
L44:
	cmpl -4(%ebp),%ecx
	jl L41
	movl 16(%ebp),%eax
	leal -40(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8a_descr
.data
_unroll8a_descr:
	.ascii "Array code, unrolled by 8\0"
.text
	.align 4
.globl _unroll8a_inner
	.def	_unroll8a_inner;	.scl	2;	.type	32;	.endef
_unroll8a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 12(%ebp),%esi
	addl $-12,%esp
	movl 8(%ebp),%ebx
	pushl %ebx
	call _vec_length
	movl %eax,%edi
	addl $-12,%esp
	leal -7(%edi),%eax
	movl %eax,-4(%ebp)
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,-8(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-12(%ebp)
	xorl %edx,%edx
	cmpl -4(%ebp),%edx
	jge L57
	movl -8(%ebp),%ecx
	movl %eax,%ebx
	.align 4
L49:
	movl (%ecx),%eax
	addl $8,%esi
	imull (%ebx),%eax
	addl %edx,%eax
	movl 4(%ecx),%edx
	imull 4(%ebx),%edx
	addl %edx,%eax
	movl 8(%ecx),%edx
	imull 8(%ebx),%edx
	addl %edx,%eax
	movl 12(%ecx),%edx
	imull 12(%ebx),%edx
	addl %edx,%eax
	movl 16(%ecx),%edx
	imull 16(%ebx),%edx
	addl %edx,%eax
	movl 20(%ecx),%edx
	imull 20(%ebx),%edx
	addl %edx,%eax
	movl 24(%ecx),%edx
	imull 24(%ebx),%edx
	addl %edx,%eax
	movl 28(%ecx),%edx
	imull 28(%ebx),%edx
	addl $32,%ecx
	addl %eax,%edx
	addl $32,%ebx
	cmpl -4(%ebp),%esi
	jl L49
	jmp L57
	.align 4
L54:
	movl -8(%ebp),%ecx
	movl (%ecx,%esi,4),%eax
	movl -12(%ebp),%ecx
	imull (%ecx,%esi,4),%eax
	addl %eax,%edx
	incl %esi
L57:
	cmpl %edi,%esi
	jl L54
	movl 16(%ebp),%eax
	leal -40(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll16a_descr
.data
_unroll16a_descr:
	.ascii "Array code, unrolled by 16\0"
.text
	.align 4
.globl _unroll16a_inner
	.def	_unroll16a_inner;	.scl	2;	.type	32;	.endef
_unroll16a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 12(%ebp),%esi
	addl $-12,%esp
	movl 8(%ebp),%ebx
	pushl %ebx
	call _vec_length
	movl %eax,%edi
	addl $-12,%esp
	leal -15(%edi),%eax
	movl %eax,-4(%ebp)
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,-8(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-12(%ebp)
	xorl %edx,%edx
	cmpl -4(%ebp),%edx
	jge L70
	movl -8(%ebp),%ecx
	movl %eax,%ebx
	.align 4
L62:
	movl (%ecx),%eax
	addl $16,%esi
	imull (%ebx),%eax
	addl %edx,%eax
	movl 4(%ecx),%edx
	imull 4(%ebx),%edx
	addl %edx,%eax
	movl 8(%ecx),%edx
	imull 8(%ebx),%edx
	addl %edx,%eax
	movl 12(%ecx),%edx
	imull 12(%ebx),%edx
	addl %edx,%eax
	movl 16(%ecx),%edx
	imull 16(%ebx),%edx
	addl %edx,%eax
	movl 20(%ecx),%edx
	imull 20(%ebx),%edx
	addl %edx,%eax
	movl 24(%ecx),%edx
	imull 24(%ebx),%edx
	addl %edx,%eax
	movl 28(%ecx),%edx
	imull 28(%ebx),%edx
	addl %edx,%eax
	movl 32(%ecx),%edx
	imull 32(%ebx),%edx
	addl %edx,%eax
	movl 36(%ecx),%edx
	imull 36(%ebx),%edx
	addl %edx,%eax
	movl 40(%ecx),%edx
	imull 40(%ebx),%edx
	addl %edx,%eax
	movl 44(%ecx),%edx
	imull 44(%ebx),%edx
	addl %edx,%eax
	movl 48(%ecx),%edx
	imull 48(%ebx),%edx
	addl %edx,%eax
	movl 52(%ecx),%edx
	imull 52(%ebx),%edx
	addl %edx,%eax
	movl 56(%ecx),%edx
	imull 56(%ebx),%edx
	addl %edx,%eax
	movl 60(%ecx),%edx
	imull 60(%ebx),%edx
	addl $64,%ecx
	addl %eax,%edx
	addl $64,%ebx
	cmpl -4(%ebp),%esi
	jl L62
	jmp L70
	.align 4
L67:
	movl -8(%ebp),%ecx
	movl (%ecx,%esi,4),%eax
	movl -12(%ebp),%ecx
	imull (%ecx,%esi,4),%eax
	addl %eax,%edx
	incl %esi
L70:
	cmpl %edi,%esi
	jl L67
	movl 16(%ebp),%eax
	leal -40(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll2_descr
.data
_unroll2_descr:
	.ascii "Pointer code, unrolled by 2\0"
.text
	.align 4
.globl _unroll2_inner
	.def	_unroll2_inner;	.scl	2;	.type	32;	.endef
_unroll2_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	leal -4(%ebx,%edi,4),%esi
	movl %eax,%ecx
	xorl %edx,%edx
	cmpl %esi,%ebx
	jae L73
	.align 4
L75:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl %edx,%eax
	movl 4(%ebx),%edx
	imull 4(%ecx),%edx
	addl $8,%ebx
	addl %eax,%edx
	addl $8,%ecx
	cmpl %esi,%ebx
	jb L75
L73:
	addl $4,%esi
	cmpl %esi,%ebx
	jae L78
	.align 4
L80:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl $4,%ebx
	addl %eax,%edx
	addl $4,%ecx
	cmpl %esi,%ebx
	jb L80
L78:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll4_descr
.data
_unroll4_descr:
	.ascii "Pointer code, unrolled by 4\0"
.text
	.align 4
.globl _unroll4_inner
	.def	_unroll4_inner;	.scl	2;	.type	32;	.endef
_unroll4_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	leal -12(%ebx,%edi,4),%esi
	movl %eax,%ecx
	xorl %edx,%edx
	cmpl %esi,%ebx
	jae L84
	.align 4
L86:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl %edx,%eax
	movl 4(%ebx),%edx
	imull 4(%ecx),%edx
	addl %edx,%eax
	movl 8(%ebx),%edx
	imull 8(%ecx),%edx
	addl %edx,%eax
	movl 12(%ebx),%edx
	imull 12(%ecx),%edx
	addl $16,%ebx
	addl %eax,%edx
	addl $16,%ecx
	cmpl %esi,%ebx
	jb L86
L84:
	addl $12,%esi
	cmpl %esi,%ebx
	jae L89
	.align 4
L91:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl $4,%ebx
	addl %eax,%edx
	addl $4,%ecx
	cmpl %esi,%ebx
	jb L91
L89:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8_descr
.data
_unroll8_descr:
	.ascii "Pointer code, unrolled by 8\0"
.text
	.align 4
.globl _unroll8_inner
	.def	_unroll8_inner;	.scl	2;	.type	32;	.endef
_unroll8_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	leal -28(%ebx,%edi,4),%esi
	movl %eax,%ecx
	xorl %edx,%edx
	cmpl %esi,%ebx
	jae L95
	.align 4
L97:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl %edx,%eax
	movl 4(%ebx),%edx
	imull 4(%ecx),%edx
	addl %edx,%eax
	movl 8(%ebx),%edx
	imull 8(%ecx),%edx
	addl %edx,%eax
	movl 12(%ebx),%edx
	imull 12(%ecx),%edx
	addl %edx,%eax
	movl 16(%ebx),%edx
	imull 16(%ecx),%edx
	addl %edx,%eax
	movl 20(%ebx),%edx
	imull 20(%ecx),%edx
	addl %edx,%eax
	movl 24(%ebx),%edx
	imull 24(%ecx),%edx
	addl %edx,%eax
	movl 28(%ebx),%edx
	imull 28(%ecx),%edx
	addl $32,%ebx
	addl %eax,%edx
	addl $32,%ecx
	cmpl %esi,%ebx
	jb L97
L95:
	addl $28,%esi
	cmpl %esi,%ebx
	jae L100
	.align 4
L102:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl $4,%ebx
	addl %eax,%edx
	addl $4,%ecx
	cmpl %esi,%ebx
	jb L102
L100:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll16_descr
.data
_unroll16_descr:
	.ascii "Pointer code, unrolled by 16\0"
.text
	.align 4
.globl _unroll16_inner
	.def	_unroll16_inner;	.scl	2;	.type	32;	.endef
_unroll16_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	leal -60(%ebx,%edi,4),%esi
	movl %eax,%ecx
	xorl %edx,%edx
	cmpl %esi,%ebx
	jae L106
	.align 4
L108:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl %edx,%eax
	movl 4(%ebx),%edx
	imull 4(%ecx),%edx
	addl %edx,%eax
	movl 8(%ebx),%edx
	imull 8(%ecx),%edx
	addl %edx,%eax
	movl 12(%ebx),%edx
	imull 12(%ecx),%edx
	addl %edx,%eax
	movl 16(%ebx),%edx
	imull 16(%ecx),%edx
	addl %edx,%eax
	movl 20(%ebx),%edx
	imull 20(%ecx),%edx
	addl %edx,%eax
	movl 24(%ebx),%edx
	imull 24(%ecx),%edx
	addl %edx,%eax
	movl 28(%ebx),%edx
	imull 28(%ecx),%edx
	addl %edx,%eax
	movl 32(%ebx),%edx
	imull 32(%ecx),%edx
	addl %edx,%eax
	movl 36(%ebx),%edx
	imull 36(%ecx),%edx
	addl %edx,%eax
	movl 40(%ebx),%edx
	imull 40(%ecx),%edx
	addl %edx,%eax
	movl 44(%ebx),%edx
	imull 44(%ecx),%edx
	addl %edx,%eax
	movl 48(%ebx),%edx
	imull 48(%ecx),%edx
	addl %edx,%eax
	movl 52(%ebx),%edx
	imull 52(%ecx),%edx
	addl %edx,%eax
	movl 56(%ebx),%edx
	imull 56(%ecx),%edx
	addl %edx,%eax
	movl 60(%ebx),%edx
	imull 60(%ecx),%edx
	addl $64,%ebx
	addl %eax,%edx
	addl $64,%ecx
	cmpl %esi,%ebx
	jb L108
L106:
	addl $60,%esi
	cmpl %esi,%ebx
	jae L111
	.align 4
L113:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl $4,%ebx
	addl %eax,%edx
	addl $4,%ecx
	cmpl %esi,%ebx
	jb L113
L111:
	movl 16(%ebp),%eax
	leal -24(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x2a_descr
.data
	.align 32
_unroll8x2a_descr:
	.ascii "Array code, unrolled by 8, Superscalar x2\0"
.text
	.align 4
.globl _unroll8x2a_inner
	.def	_unroll8x2a_inner;	.scl	2;	.type	32;	.endef
_unroll8x2a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	xorl %edi,%edi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	movl %eax,-4(%ebp)
	addl $-12,%esp
	addl $-7,%eax
	movl %eax,-8(%ebp)
	pushl %ebx
	call _get_vec_start
	xorl %ebx,%ebx
	addl $32,%esp
	movl %eax,-12(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-16(%ebp)
	cmpl -8(%ebp),%ebx
	jge L127
	movl -12(%ebp),%edx
	movl %eax,%ecx
	.align 4
L119:
	movl (%edx),%eax
	addl $8,%esi
	imull (%ecx),%eax
	addl %eax,%ebx
	movl 4(%edx),%eax
	imull 4(%ecx),%eax
	addl %eax,%edi
	movl 8(%edx),%eax
	imull 8(%ecx),%eax
	addl %eax,%ebx
	movl 12(%edx),%eax
	imull 12(%ecx),%eax
	addl %eax,%edi
	movl 16(%edx),%eax
	imull 16(%ecx),%eax
	addl %eax,%ebx
	movl 20(%edx),%eax
	imull 20(%ecx),%eax
	addl %eax,%edi
	movl 24(%edx),%eax
	imull 24(%ecx),%eax
	addl %eax,%ebx
	movl 28(%edx),%eax
	imull 28(%ecx),%eax
	addl $32,%edx
	addl %eax,%edi
	addl $32,%ecx
	cmpl -8(%ebp),%esi
	jl L119
	jmp L127
	.align 4
L124:
	movl -12(%ebp),%edx
	movl (%edx,%esi,4),%eax
	movl -16(%ebp),%edx
	imull (%edx,%esi,4),%eax
	addl %eax,%ebx
	incl %esi
L127:
	cmpl -4(%ebp),%esi
	jl L124
	movl 16(%ebp),%eax
	addl %edi,%ebx
	movl %ebx,(%eax)
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x4a_descr
.data
	.align 32
_unroll8x4a_descr:
	.ascii "Array code, unrolled by 8, Superscalar x4\0"
.text
	.align 4
.globl _unroll8x4a_inner
	.def	_unroll8x4a_inner;	.scl	2;	.type	32;	.endef
_unroll8x4a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $44,%esp
	pushl %edi
	pushl %esi
	xorl %edi,%edi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	movl %eax,-4(%ebp)
	addl $-12,%esp
	addl $-7,%eax
	movl %eax,-8(%ebp)
	pushl %ebx
	call _get_vec_start
	xorl %ebx,%ebx
	addl $32,%esp
	movl %eax,-12(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-16(%ebp)
	movl $0,-20(%ebp)
	movl $0,-24(%ebp)
	cmpl -8(%ebp),%edi
	jge L140
	movl -12(%ebp),%edx
	movl %eax,%ecx
	.align 4
L132:
	movl (%edx),%eax
	addl $8,%ebx
	imull (%ecx),%eax
	addl %eax,%esi
	movl 4(%edx),%eax
	imull 4(%ecx),%eax
	addl %eax,-20(%ebp)
	movl 8(%edx),%eax
	imull 8(%ecx),%eax
	addl %eax,-24(%ebp)
	movl 12(%edx),%eax
	imull 12(%ecx),%eax
	addl %eax,%edi
	movl 16(%edx),%eax
	imull 16(%ecx),%eax
	addl %eax,%esi
	movl 20(%edx),%eax
	imull 20(%ecx),%eax
	addl %eax,-20(%ebp)
	movl 24(%edx),%eax
	imull 24(%ecx),%eax
	addl %eax,-24(%ebp)
	movl 28(%edx),%eax
	imull 28(%ecx),%eax
	addl $32,%edx
	addl %eax,%edi
	addl $32,%ecx
	cmpl -8(%ebp),%ebx
	jl L132
	jmp L140
	.align 4
L137:
	movl -12(%ebp),%edx
	movl (%edx,%ebx,4),%eax
	movl -16(%ebp),%edx
	imull (%edx,%ebx,4),%eax
	addl %eax,%esi
	incl %ebx
L140:
	cmpl -4(%ebp),%ebx
	jl L137
	movl -20(%ebp),%edx
	leal -56(%ebp),%esp
	leal (%edx,%esi),%eax
	addl -24(%ebp),%eax
	movl 16(%ebp),%edx
	addl %edi,%eax
	movl %eax,(%edx)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll12x6a_descr
.data
	.align 32
_unroll12x6a_descr:
	.ascii "Array code, unrolled by 12, Superscalar x6\0"
.text
	.align 4
.globl _unroll12x6a_inner
	.def	_unroll12x6a_inner;	.scl	2;	.type	32;	.endef
_unroll12x6a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $44,%esp
	pushl %edi
	pushl %esi
	xorl %edi,%edi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	movl %eax,-4(%ebp)
	addl $-12,%esp
	addl $-11,%eax
	movl %eax,-8(%ebp)
	pushl %ebx
	call _get_vec_start
	xorl %ebx,%ebx
	addl $32,%esp
	movl %eax,-12(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-16(%ebp)
	movl $0,-20(%ebp)
	movl $0,-24(%ebp)
	movl $0,-28(%ebp)
	movl $0,-32(%ebp)
	cmpl -8(%ebp),%edi
	jge L153
	movl -12(%ebp),%edx
	movl %eax,%ecx
	.align 4
L145:
	movl (%edx),%eax
	addl $12,%ebx
	imull (%ecx),%eax
	addl %eax,%esi
	movl 4(%edx),%eax
	imull 4(%ecx),%eax
	addl %eax,-20(%ebp)
	movl 8(%edx),%eax
	imull 8(%ecx),%eax
	addl %eax,-24(%ebp)
	movl 12(%edx),%eax
	imull 12(%ecx),%eax
	addl %eax,-28(%ebp)
	movl 16(%edx),%eax
	imull 16(%ecx),%eax
	addl %eax,-32(%ebp)
	movl 20(%edx),%eax
	imull 20(%ecx),%eax
	addl %eax,%edi
	movl 24(%edx),%eax
	imull 24(%ecx),%eax
	addl %eax,%esi
	movl 28(%edx),%eax
	imull 28(%ecx),%eax
	addl %eax,-20(%ebp)
	movl 32(%edx),%eax
	imull 32(%ecx),%eax
	addl %eax,-24(%ebp)
	movl 36(%edx),%eax
	imull 36(%ecx),%eax
	addl %eax,-28(%ebp)
	movl 40(%edx),%eax
	imull 40(%ecx),%eax
	addl %eax,-32(%ebp)
	movl 44(%edx),%eax
	imull 44(%ecx),%eax
	addl $48,%edx
	addl %eax,%edi
	addl $48,%ecx
	cmpl -8(%ebp),%ebx
	jl L145
	jmp L153
	.align 4
L150:
	movl -12(%ebp),%edx
	movl (%edx,%ebx,4),%eax
	movl -16(%ebp),%edx
	imull (%edx,%ebx,4),%eax
	addl %eax,%esi
	incl %ebx
L153:
	cmpl -4(%ebp),%ebx
	jl L150
	movl -20(%ebp),%edx
	leal -56(%ebp),%esp
	leal (%edx,%esi),%eax
	addl -24(%ebp),%eax
	addl -28(%ebp),%eax
	addl -32(%ebp),%eax
	movl 16(%ebp),%edx
	addl %edi,%eax
	movl %eax,(%edx)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x8a_descr
.data
	.align 32
_unroll8x8a_descr:
	.ascii "Array code, unrolled by 8, Superscalar x8\0"
.text
	.align 4
.globl _unroll8x8a_inner
	.def	_unroll8x8a_inner;	.scl	2;	.type	32;	.endef
_unroll8x8a_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $60,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	movl %eax,%edi
	addl $-12,%esp
	leal -7(%edi),%eax
	movl %eax,-4(%ebp)
	pushl %ebx
	call _get_vec_start
	xorl %ebx,%ebx
	addl $32,%esp
	movl %eax,-8(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,-12(%ebp)
	movl -4(%ebp),%edx
	movl $0,-16(%ebp)
	movl $0,-20(%ebp)
	movl $0,-24(%ebp)
	movl $0,-28(%ebp)
	movl $0,-32(%ebp)
	movl $0,-36(%ebp)
	movl $0,-40(%ebp)
	cmpl %edx,-40(%ebp)
	jge L166
	movl -8(%ebp),%edx
	movl %eax,%ecx
	.align 4
L158:
	movl (%edx),%eax
	addl $8,%ebx
	imull (%ecx),%eax
	addl %eax,%esi
	movl 4(%edx),%eax
	imull 4(%ecx),%eax
	addl %eax,-16(%ebp)
	movl 8(%edx),%eax
	imull 8(%ecx),%eax
	addl %eax,-20(%ebp)
	movl 12(%edx),%eax
	imull 12(%ecx),%eax
	addl %eax,-24(%ebp)
	movl 16(%edx),%eax
	imull 16(%ecx),%eax
	addl %eax,-28(%ebp)
	movl 20(%edx),%eax
	imull 20(%ecx),%eax
	addl %eax,-32(%ebp)
	movl 24(%edx),%eax
	imull 24(%ecx),%eax
	addl %eax,-36(%ebp)
	movl 28(%edx),%eax
	imull 28(%ecx),%eax
	addl $32,%edx
	addl %eax,-40(%ebp)
	addl $32,%ecx
	cmpl -4(%ebp),%ebx
	jl L158
	jmp L166
	.align 4
L163:
	movl -8(%ebp),%edx
	movl (%edx,%ebx,4),%eax
	movl -12(%ebp),%edx
	imull (%edx,%ebx,4),%eax
	addl %eax,%esi
	incl %ebx
L166:
	cmpl %edi,%ebx
	jl L163
	movl -16(%ebp),%edx
	leal -72(%ebp),%esp
	leal (%edx,%esi),%eax
	addl -20(%ebp),%eax
	addl -24(%ebp),%eax
	addl -28(%ebp),%eax
	addl -32(%ebp),%eax
	addl -36(%ebp),%eax
	movl 16(%ebp),%edx
	addl -40(%ebp),%eax
	movl %eax,(%edx)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unrollx2as_descr
.data
	.align 32
_unrollx2as_descr:
	.ascii "Array code, Unroll x2, Superscalar x2, noninterleaved\0"
.text
	.align 4
.globl _unrollx2as_inner
	.def	_unrollx2as_inner;	.scl	2;	.type	32;	.endef
_unrollx2as_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $60,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	movl %eax,-4(%ebp)
	addl $-12,%esp
	movl -4(%ebp),%edi
	shrl $31,%eax
	pushl %ebx
	addl %eax,%edi
	call _get_vec_start
	sarl $1,%edi
	movl %eax,-8(%ebp)
	leal 0(,%edi,4),%ebx
	addl %ebx,%eax
	addl $32,%esp
	movl %eax,-12(%ebp)
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	movl %eax,-36(%ebp)
	xorl %ecx,%ecx
	addl %eax,%ebx
	xorl %edx,%edx
	movl %ebx,-16(%ebp)
	xorl %ebx,%ebx
	cmpl %edi,%ebx
	jge L169
	.align 4
L171:
	movl -8(%ebp),%esi
	movl (%esi,%edx,4),%eax
	movl -36(%ebp),%esi
	imull (%esi,%edx,4),%eax
	movl -12(%ebp),%esi
	addl %eax,%ebx
	movl (%esi,%edx,4),%eax
	movl -16(%ebp),%esi
	imull (%esi,%edx,4),%eax
	addl %eax,%ecx
	incl %edx
	cmpl %edi,%edx
	jl L171
L169:
	leal (%edi,%edi),%edx
	cmpl -4(%ebp),%edx
	jge L174
	.align 4
L176:
	movl -8(%ebp),%esi
	movl (%esi,%edx,4),%eax
	movl -36(%ebp),%esi
	imull (%esi,%edx,4),%eax
	addl %eax,%ecx
	incl %edx
	cmpl -4(%ebp),%edx
	jl L176
L174:
	movl 16(%ebp),%eax
	addl %ecx,%ebx
	movl %ebx,(%eax)
	leal -72(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x2_descr
.data
	.align 32
_unroll8x2_descr:
	.ascii "Pointer code, unrolled by 8, Superscalar x2\0"
.text
	.align 4
.globl _unroll8x2_inner
	.def	_unroll8x2_inner;	.scl	2;	.type	32;	.endef
_unroll8x2_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	leal -28(%ebx,%edi,4),%edi
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	movl %eax,%edx
	xorl %ecx,%ecx
	cmpl %edi,%ebx
	jae L180
	.align 4
L182:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl %eax,%ecx
	movl 4(%ebx),%eax
	imull 4(%edx),%eax
	addl %eax,%esi
	movl 8(%ebx),%eax
	imull 8(%edx),%eax
	addl %eax,%ecx
	movl 12(%ebx),%eax
	imull 12(%edx),%eax
	addl %eax,%esi
	movl 16(%ebx),%eax
	imull 16(%edx),%eax
	addl %eax,%ecx
	movl 20(%ebx),%eax
	imull 20(%edx),%eax
	addl %eax,%esi
	movl 24(%ebx),%eax
	imull 24(%edx),%eax
	addl %eax,%ecx
	movl 28(%ebx),%eax
	imull 28(%edx),%eax
	addl $32,%ebx
	addl %eax,%esi
	addl $32,%edx
	cmpl %edi,%ebx
	jb L182
L180:
	addl $28,%edi
	cmpl %edi,%ebx
	jae L185
	.align 4
L187:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl $4,%ebx
	addl %eax,%ecx
	addl $4,%edx
	cmpl %edi,%ebx
	jb L187
L185:
	movl 16(%ebp),%eax
	addl %esi,%ecx
	movl %ecx,(%eax)
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll9x3_descr
.data
	.align 32
_unroll9x3_descr:
	.ascii "Pointer code, unrolled by 9, Superscalar x3\0"
.text
	.align 4
.globl _unroll9x3_inner
	.def	_unroll9x3_inner;	.scl	2;	.type	32;	.endef
_unroll9x3_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	leal -32(%ebx,%edi,4),%esi
	movl %eax,%ecx
	xorl %edx,%edx
	xorl %edi,%edi
	movl $0,-4(%ebp)
	cmpl %esi,%ebx
	jae L191
	.align 4
L193:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl %eax,%edx
	movl 4(%ebx),%eax
	imull 4(%ecx),%eax
	addl %eax,%edi
	movl 8(%ebx),%eax
	imull 8(%ecx),%eax
	addl %eax,-4(%ebp)
	movl 12(%ebx),%eax
	imull 12(%ecx),%eax
	addl %eax,%edx
	movl 16(%ebx),%eax
	imull 16(%ecx),%eax
	addl %eax,%edi
	movl 20(%ebx),%eax
	imull 20(%ecx),%eax
	addl %eax,-4(%ebp)
	movl 24(%ebx),%eax
	imull 24(%ecx),%eax
	addl %eax,%edx
	movl 28(%ebx),%eax
	imull 28(%ecx),%eax
	addl %eax,%edi
	movl 32(%ebx),%eax
	imull 32(%ecx),%eax
	addl $36,%ebx
	addl %eax,-4(%ebp)
	addl $36,%ecx
	cmpl %esi,%ebx
	jb L193
L191:
	addl $32,%esi
	cmpl %esi,%ebx
	jae L196
	.align 4
L198:
	movl (%ebx),%eax
	imull (%ecx),%eax
	addl $4,%ebx
	addl %eax,%edx
	addl $4,%ecx
	cmpl %esi,%ebx
	jb L198
L196:
	addl %edi,%edx
	movl 16(%ebp),%eax
	addl -4(%ebp),%edx
	leal -40(%ebp),%esp
	movl %edx,(%eax)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x4_descr
.data
	.align 32
_unroll8x4_descr:
	.ascii "Pointer code, unrolled by 8, Superscalar x4\0"
.text
	.align 4
.globl _unroll8x4_inner
	.def	_unroll8x4_inner;	.scl	2;	.type	32;	.endef
_unroll8x4_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	leal -28(%ebx,%edi,4),%ecx
	movl %eax,%edx
	xorl %edi,%edi
	movl $0,-4(%ebp)
	movl $0,-8(%ebp)
	cmpl %ecx,%ebx
	jae L202
	.align 4
L204:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl %eax,%esi
	movl 4(%ebx),%eax
	imull 4(%edx),%eax
	addl %eax,%edi
	movl 8(%ebx),%eax
	imull 8(%edx),%eax
	addl %eax,-4(%ebp)
	movl 12(%ebx),%eax
	imull 12(%edx),%eax
	addl %eax,-8(%ebp)
	movl 16(%ebx),%eax
	imull 16(%edx),%eax
	addl %eax,%esi
	movl 20(%ebx),%eax
	imull 20(%edx),%eax
	addl %eax,%edi
	movl 24(%ebx),%eax
	imull 24(%edx),%eax
	addl %eax,-4(%ebp)
	movl 28(%ebx),%eax
	imull 28(%edx),%eax
	addl $32,%ebx
	addl %eax,-8(%ebp)
	addl $32,%edx
	cmpl %ecx,%ebx
	jb L204
L202:
	addl $28,%ecx
	cmpl %ecx,%ebx
	jae L207
	.align 4
L209:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl $4,%ebx
	addl %eax,%esi
	addl $4,%edx
	cmpl %ecx,%ebx
	jb L209
L207:
	leal (%edi,%esi),%eax
	movl 16(%ebp),%edx
	addl -4(%ebp),%eax
	leal -40(%ebp),%esp
	addl -8(%ebp),%eax
	movl %eax,(%edx)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.globl _unroll8x8_descr
.data
	.align 32
_unroll8x8_descr:
	.ascii "Pointer code, unrolled by 8, Superscalar x8\0"
.text
	.align 4
.globl _unroll8x8_inner
	.def	_unroll8x8_inner;	.scl	2;	.type	32;	.endef
_unroll8x8_inner:
	pushl %ebp
	movl %esp,%ebp
	subl $44,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	addl $-12,%esp
	movl 12(%ebp),%esi
	pushl %ebx
	call _vec_length
	addl $-12,%esp
	movl %eax,%edi
	pushl %ebx
	call _get_vec_start
	addl $32,%esp
	movl %eax,%ebx
	addl $-12,%esp
	pushl %esi
	call _get_vec_start
	xorl %esi,%esi
	leal -28(%ebx,%edi,4),%ecx
	movl %eax,%edx
	xorl %edi,%edi
	movl $0,-4(%ebp)
	movl $0,-8(%ebp)
	movl $0,-12(%ebp)
	movl $0,-16(%ebp)
	movl $0,-20(%ebp)
	movl $0,-24(%ebp)
	cmpl %ecx,%ebx
	jae L213
	.align 4
L215:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl %eax,%esi
	movl 4(%ebx),%eax
	imull 4(%edx),%eax
	addl %eax,%edi
	movl 8(%ebx),%eax
	imull 8(%edx),%eax
	addl %eax,-4(%ebp)
	movl 12(%ebx),%eax
	imull 12(%edx),%eax
	addl %eax,-8(%ebp)
	movl 16(%ebx),%eax
	imull 16(%edx),%eax
	addl %eax,-12(%ebp)
	movl 20(%ebx),%eax
	imull 20(%edx),%eax
	addl %eax,-16(%ebp)
	movl 24(%ebx),%eax
	imull 24(%edx),%eax
	addl %eax,-20(%ebp)
	movl 28(%ebx),%eax
	imull 28(%edx),%eax
	addl $32,%ebx
	addl %eax,-24(%ebp)
	addl $32,%edx
	cmpl %ecx,%ebx
	jb L215
L213:
	addl $28,%ecx
	cmpl %ecx,%ebx
	jae L218
	.align 4
L220:
	movl (%ebx),%eax
	imull (%edx),%eax
	addl $4,%ebx
	addl %eax,%esi
	addl $4,%edx
	cmpl %ecx,%ebx
	jb L220
L218:
	leal (%edi,%esi),%eax
	movl 16(%ebp),%edx
	addl -4(%ebp),%eax
	leal -56(%ebp),%esp
	addl -8(%ebp),%eax
	addl -12(%ebp),%eax
	addl -16(%ebp),%eax
	addl -20(%ebp),%eax
	addl -24(%ebp),%eax
	movl %eax,(%edx)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
	.align 4
.globl _register_inners
	.def	_register_inners;	.scl	2;	.type	32;	.endef
_register_inners:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	addl $-4,%esp
	pushl $_abstract_descr
	pushl $_abstract_inner
	pushl $_abstract_inner
	call _add_inner
	addl $-4,%esp
	pushl $_motion_descr
	pushl $_abstract_inner
	pushl $_motion_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_array_descr
	pushl $_abstract_inner
	pushl $_array_inner
	call _add_inner
	addl $-4,%esp
	pushl $_inner4_descr
	pushl $_abstract_inner
	pushl $_inner4
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_pointer_descr
	pushl $_abstract_inner
	pushl $_pointer_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll2a_descr
	pushl $_abstract_inner
	pushl $_unroll2a_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8a_descr
	pushl $_abstract_inner
	pushl $_unroll8a_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll16a_descr
	pushl $_abstract_inner
	pushl $_unroll16a_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll2_descr
	pushl $_abstract_inner
	pushl $_unroll2_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll4_descr
	pushl $_abstract_inner
	pushl $_unroll4_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8_descr
	pushl $_abstract_inner
	pushl $_unroll8_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll16_descr
	pushl $_abstract_inner
	pushl $_unroll16_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8x2a_descr
	pushl $_abstract_inner
	pushl $_unroll8x2a_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll8x4a_descr
	pushl $_abstract_inner
	pushl $_unroll8x4a_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8x8a_descr
	pushl $_abstract_inner
	pushl $_unroll8x8a_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll12x6a_descr
	pushl $_abstract_inner
	pushl $_unroll12x6a_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8x2_descr
	pushl $_abstract_inner
	pushl $_unroll8x2_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll8x4_descr
	pushl $_abstract_inner
	pushl $_unroll8x4_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unroll8x8_descr
	pushl $_abstract_inner
	pushl $_unroll8x8_inner
	call _add_inner
	addl $-4,%esp
	pushl $_unroll9x3_descr
	pushl $_abstract_inner
	pushl $_unroll9x3_inner
	call _add_inner
	addl $32,%esp
	addl $-4,%esp
	pushl $_unrollx2as_descr
	pushl $_abstract_inner
	pushl $_unrollx2as_inner
	call _add_inner
	movl %ebp,%esp
	popl %ebp
	ret
	.def	_add_inner;	.scl	2;	.type	32;	.endef
	.def	_get_vec_start;	.scl	2;	.type	32;	.endef
	.def	_get_vec_element;	.scl	2;	.type	32;	.endef
	.def	_vec_length;	.scl	2;	.type	32;	.endef
