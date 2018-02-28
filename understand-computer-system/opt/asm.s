.L32:
	movl %edx, (%ecx)
	movl (%ebx), %edx
	incl %edx
	subl $1, %eax
	jne .L32
