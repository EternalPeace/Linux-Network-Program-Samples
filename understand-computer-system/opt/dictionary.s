	.file	"dictionary.c"
	.version	"01.01"
gcc2_compiled.:
.globl wcnt
.data
	.align 4
	.type	 wcnt,@object
	.size	 wcnt,4
wcnt:
	.long 0
.globl ucnt
	.align 4
	.type	 ucnt,@object
	.size	 ucnt,4
ucnt:
	.long 0
.globl mcnt
	.align 4
	.type	 mcnt,@object
	.size	 mcnt,4
mcnt:
	.long 0
.globl mstring
.section	.rodata
.LC0:
	.string	""
.data
	.align 4
	.type	 mstring,@object
	.size	 mstring,4
mstring:
	.long .LC0
.text
	.align 4
.globl lower1
	.type	 lower1,@function
lower1:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ebx
	movl %ebx,%edx
	movl %ebx,%eax
	andl $3,%edx
	je .L178
	jp .L183
	cmpl $2,%edx
	je .L184
	cmpb %dh,(%eax)
	je .L182
	incl %eax
.L184:
	cmpb %dh,(%eax)
	je .L182
	incl %eax
.L183:
	cmpb %dh,(%eax)
	je .L182
	incl %eax
.L178:
	movl (%eax),%edx
	testb %dl,%dl
	je .L182
	testb %dh,%dh
	je .L181
	testl $16711680,%edx
	je .L180
	addl $4,%eax
	testl $-16777216,%edx
	jne .L178
	subl $3,%eax
.L180:
	incl %eax
.L181:
	incl %eax
.L182:
	xorl %ecx,%ecx
	cmpl %ebx,%eax
	je .L173
	.p2align 4,,7
.L175:
	movb (%ecx,%ebx),%dl
	leal -65(%edx),%eax
	cmpb $25,%al
	ja .L174
	addb $32,%dl
	movb %dl,(%ecx,%ebx)
.L174:
	incl %ecx
	movl %ebx,%edx
	movl %ebx,%eax
	andl $3,%edx
	je .L185
	jp .L190
	cmpl $2,%edx
	je .L191
	cmpb %dh,(%eax)
	je .L189
	incl %eax
.L191:
	cmpb %dh,(%eax)
	je .L189
	incl %eax
.L190:
	cmpb %dh,(%eax)
	je .L189
	incl %eax
.L185:
	movl (%eax),%edx
	testb %dl,%dl
	je .L189
	testb %dh,%dh
	je .L188
	testl $16711680,%edx
	je .L187
	addl $4,%eax
	testl $-16777216,%edx
	jne .L185
	subl $3,%eax
.L187:
	incl %eax
.L188:
	incl %eax
.L189:
	subl %ebx,%eax
	cmpl %eax,%ecx
	jb .L175
.L173:
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 lower1,.Lfe1-lower1
	.align 4
.globl lower2
	.type	 lower2,@function
lower2:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	movl %esi,%eax
	movl %esi,%ebx
	andl $3,%eax
	je .L199
	jp .L204
	cmpl $2,%eax
	je .L205
	cmpb %ah,(%ebx)
	je .L203
	incl %ebx
.L205:
	cmpb %ah,(%ebx)
	je .L203
	incl %ebx
.L204:
	cmpb %ah,(%ebx)
	je .L203
	incl %ebx
.L199:
	movl (%ebx),%eax
	testb %al,%al
	je .L203
	testb %ah,%ah
	je .L202
	testl $16711680,%eax
	je .L201
	addl $4,%ebx
	testl $-16777216,%eax
	jne .L199
	subl $3,%ebx
.L201:
	incl %ebx
.L202:
	incl %ebx
.L203:
	subl %esi,%ebx
	xorl %ecx,%ecx
	cmpl %ebx,%ecx
	jge .L194
	.p2align 4,,7
.L196:
	movb (%ecx,%esi),%dl
	leal -65(%edx),%eax
	cmpb $25,%al
	ja .L195
	addb $32,%dl
	movb %dl,(%ecx,%esi)
.L195:
	incl %ecx
	cmpl %ebx,%ecx
	jl .L196
.L194:
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 lower2,.Lfe2-lower2
.globl lower_fun_set
.data
	.align 4
	.type	 lower_fun_set,@object
	.size	 lower_fun_set,8
lower_fun_set:
	.long lower1
	.long lower2
.globl lower_fun_names
	.align 4
	.type	 lower_fun_names,@object
	.size	 lower_fun_names,8
lower_fun_names:
	.long .LC1
	.long .LC2
.section	.rodata
.LC2:
	.string	"lower2"
.LC1:
	.string	"lower1"
.text
	.align 4
.globl strlen
	.type	 strlen,@function
strlen:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	xorl %eax,%eax
	cmpb $0,(%edx)
	je .L208
	.p2align 4,,7
.L209:
	incl %edx
	incl %eax
	cmpb $0,(%edx)
	jne .L209
.L208:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 strlen,.Lfe3-strlen
.section	.rodata
	.align 32
.LC3:
	.string	"Couldn't allocate hash array, exiting\n"
.text
	.align 4
	.type	 new_table,@function
new_table:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 8(%ebp),%eax
	movl %eax,tsize
	addl $-8,%esp
	pushl $4
	pushl %eax
	call calloc
	movl %eax,htable
	addl $16,%esp
	testl %eax,%eax
	jne .L212
	addl $-8,%esp
	pushl $.LC3
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L212:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 new_table,.Lfe4-new_table
.section	.rodata
	.align 32
.LC4:
	.string	"Couldn't allocate hash element, exiting\n"
.text
	.align 4
	.type	 new_ele,@function
new_ele:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	addl $-12,%esp
	pushl $12
	call malloc
	movl %eax,%edx
	addl $16,%esp
	testl %edx,%edx
	jne .L214
	addl $-8,%esp
	pushl $.LC4
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L214:
	movl 8(%ebp),%eax
	movl %eax,(%edx)
	movl $1,4(%edx)
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe5:
	.size	 new_ele,.Lfe5-new_ele
	.align 4
.globl h_mod
	.type	 h_mod,@function
h_mod:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	xorl %ebx,%ebx
	movsbl (%esi),%eax
	incl %esi
	testl %eax,%eax
	je .L217
	movl tsize,%ecx
	.p2align 4,,7
.L218:
	sall $7,%ebx
	addl %ebx,%eax
	xorl %edx,%edx
	divl %ecx
	movl %edx,%ebx
	movsbl (%esi),%eax
	incl %esi
	testl %eax,%eax
	jne .L218
.L217:
	movl %ebx,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe6:
	.size	 h_mod,.Lfe6-h_mod
	.align 4
.globl h_add
	.type	 h_add,@function
h_add:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	movl tsize,%ebx
	xorl %eax,%eax
	jmp .L225
	.p2align 4,,7
.L223:
	addl %edx,%eax
.L225:
	movsbl (%ecx),%edx
	incl %ecx
	testl %edx,%edx
	jne .L223
	xorl %edx,%edx
	divl %ebx
	movl %edx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe7:
	.size	 h_add,.Lfe7-h_add
	.align 4
.globl h_xor
	.type	 h_xor,@function
h_xor:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	movl tsize,%ebx
	xorl %eax,%eax
	jmp .L231
	.p2align 4,,7
.L229:
	xorl %eax,%edx
	sall $4,%edx
	shrl $28,%eax
	orl %edx,%eax
.L231:
	movsbl (%ecx),%edx
	incl %ecx
	testl %edx,%edx
	jne .L229
	xorl %edx,%edx
	divl %ebx
	movl %edx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe8:
	.size	 h_xor,.Lfe8-h_xor
.globl hash_fun_set
.data
	.align 4
	.type	 hash_fun_set,@object
	.size	 hash_fun_set,12
hash_fun_set:
	.long h_mod
	.long h_add
	.long h_xor
.globl hash_fun_names
	.align 4
	.type	 hash_fun_names,@object
	.size	 hash_fun_names,12
hash_fun_names:
	.long .LC5
	.long .LC6
	.long .LC7
.section	.rodata
.LC7:
	.string	"h_xor"
.LC6:
	.string	"h_add"
.LC5:
	.string	"h_mod"
	.align 32
.LC8:
	.string	"Couldn't allocate space for string, exiting\n"
.text
	.align 4
.globl save_string
	.type	 save_string,@function
save_string:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	addl $-12,%esp
	addl $-12,%esp
	pushl %esi
	call strlen
	incl %eax
	pushl %eax
	call malloc
	movl %eax,%ebx
	addl $32,%esp
	testl %ebx,%ebx
	jne .L234
	addl $-8,%esp
	pushl $.LC8
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L234:
	addl $-8,%esp
	pushl %esi
	pushl %ebx
	call strcpy
	movl %ebx,%eax
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe9:
	.size	 save_string,.Lfe9-save_string
	.align 4
.globl find_ele_rec
	.type	 find_ele_rec,@function
find_ele_rec:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%esi
	testl %ebx,%ebx
	jne .L271
	incl ucnt
	addl $-12,%esp
	addl $-12,%esp
	pushl %esi
	call save_string
	pushl %eax
	call new_ele
	jmp .L277
	.p2align 4,,7
.L271:
	movl (%ebx),%eax
	addl $-8,%esp
	pushl %eax
	pushl %esi
	call strcmp
	addl $16,%esp
	testl %eax,%eax
	jne .L275
	movl 4(%ebx),%eax
	leal 1(%eax),%edx
	movl %edx,4(%ebx)
	movl %edx,%eax
	cmpl mcnt,%eax
	jle .L278
	movl %eax,mcnt
	movl (%ebx),%eax
	movl %eax,mstring
	jmp .L278
	.p2align 4,,7
.L275:
	addl $-8,%esp
	pushl %esi
	movl 8(%ebx),%eax
	pushl %eax
	call find_ele_rec
	movl %eax,8(%ebx)
.L278:
	movl %ebx,%eax
.L277:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe10:
	.size	 find_ele_rec,.Lfe10-find_ele_rec
	.align 4
.globl find_ele_iter_f
	.type	 find_ele_iter_f,@function
find_ele_iter_f:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edi
	movl %edi,%ebx
	testl %ebx,%ebx
	je .L281
	.p2align 4,,7
.L283:
	movl (%ebx),%esi
	addl $-8,%esp
	pushl %esi
	movl 12(%ebp),%eax
	pushl %eax
	call strcmp
	addl $16,%esp
	testl %eax,%eax
	jne .L282
	movl 4(%ebx),%eax
	leal 1(%eax),%edx
	movl %edx,4(%ebx)
	movl %edx,%eax
	cmpl mcnt,%eax
	jle .L308
	movl %eax,mcnt
	movl %esi,mstring
.L308:
	movl %edi,%eax
	jmp .L310
	.p2align 4,,7
.L282:
	movl 8(%ebx),%ebx
	testl %ebx,%ebx
	jne .L283
.L281:
	movl 12(%ebp),%eax
	addl $-12,%esp
	addl $-12,%esp
	pushl %eax
	call save_string
	pushl %eax
	call new_ele
	movl %eax,%ebx
	incl ucnt
	movl %edi,8(%ebx)
.L310:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe11:
	.size	 find_ele_iter_f,.Lfe11-find_ele_iter_f
	.align 4
.globl find_ele_iter_r
	.type	 find_ele_iter_r,@function
find_ele_iter_r:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edi
	xorl %esi,%esi
	movl %edi,%ebx
	testl %edi,%edi
	je .L313
	.p2align 4,,7
.L315:
	movl (%ebx),%esi
	addl $-8,%esp
	pushl %esi
	movl 12(%ebp),%eax
	pushl %eax
	call strcmp
	addl $16,%esp
	testl %eax,%eax
	jne .L339
	movl 4(%ebx),%eax
	leal 1(%eax),%edx
	movl %edx,4(%ebx)
	movl %edx,%eax
	cmpl mcnt,%eax
	jle .L345
	movl %eax,mcnt
	movl %esi,mstring
	jmp .L345
	.p2align 4,,7
.L339:
	movl %ebx,%esi
	movl 8(%ebx),%ebx
	testl %ebx,%ebx
	jne .L315
.L313:
	movl 12(%ebp),%eax
	addl $-12,%esp
	addl $-12,%esp
	pushl %eax
	call save_string
	pushl %eax
	call new_ele
	movl %eax,%ebx
	incl ucnt
	movl $0,8(%ebx)
	testl %esi,%esi
	je .L344
	movl %ebx,8(%esi)
.L345:
	movl %edi,%eax
.L344:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe12:
	.size	 find_ele_iter_r,.Lfe12-find_ele_iter_r
.globl find_ele_fun_set
.data
	.align 4
	.type	 find_ele_fun_set,@object
	.size	 find_ele_fun_set,12
find_ele_fun_set:
	.long find_ele_rec
	.long find_ele_iter_f
	.long find_ele_iter_r
.globl find_ele_fun_names
	.align 4
	.type	 find_ele_fun_names,@object
	.size	 find_ele_fun_names,12
find_ele_fun_names:
	.long .LC9
	.long .LC10
	.long .LC11
.section	.rodata
.LC11:
	.string	"find_ele_iter_r"
.LC10:
	.string	"find_ele_iter_f"
.LC9:
	.string	"find_ele_rec"
.text
	.align 4
.globl compare_ele
	.type	 compare_ele,@function
compare_ele:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl %ebp,%esp
	movl (%eax),%eax
	movl (%edx),%edx
	popl %ebp
	movl 4(%eax),%eax
	movl 4(%edx),%edx
	subl %eax,%edx
	movl %edx,%eax
	ret
.Lfe13:
	.size	 compare_ele,.Lfe13-compare_ele
	.align 4
.globl sort_words
	.type	 sort_words,@function
sort_words:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	addl $-8,%esp
	pushl $4
	movl ucnt,%eax
	pushl %eax
	call calloc
	movl %eax,%ebx
	xorl %edi,%edi
	xorl %ecx,%ecx
	addl $16,%esp
	cmpl $0,tsize
	jle .L349
	.p2align 4,,7
.L351:
	movl htable,%eax
	movl (%eax,%ecx,4),%edx
	incl %ecx
	movl %ecx,-8(%ebp)
	testl %edx,%edx
	je .L350
	.p2align 4,,7
.L355:
	cmpl $0,8(%ebp)
	je .L356
	movl %edx,(%ebx,%edi,4)
	leal 1(%edi),%esi
	jmp .L357
	.p2align 4,,7
.L356:
	movl %edi,%ecx
	leal 1(%edi),%esi
	testl %edi,%edi
	jle .L359
	movl -4(%ebx,%edi,4),%eax
	jmp .L372
	.p2align 4,,7
.L361:
	movl -4(%ebx,%ecx,4),%eax
	movl %eax,(%ebx,%ecx,4)
	decl %ecx
	testl %ecx,%ecx
	jle .L359
	movl -4(%ebx,%ecx,4),%eax
.L372:
	movl 4(%eax),%eax
	cmpl %eax,4(%edx)
	jg .L361
.L359:
	movl %edx,(%ebx,%ecx,4)
.L357:
	movl 8(%edx),%edx
	movl %esi,%edi
	testl %edx,%edx
	jne .L355
.L350:
	movl -8(%ebp),%ecx
	cmpl tsize,%ecx
	jl .L351
.L349:
	cmpl $0,8(%ebp)
	je .L366
	pushl $compare_ele
	pushl $4
	pushl %edi
	pushl %ebx
	call qsort
	addl $16,%esp
.L366:
	movl (%ebx),%eax
	movl %eax,-4(%ebp)
	xorl %ecx,%ecx
	leal -1(%edi),%esi
	cmpl %esi,%ecx
	jge .L368
	.p2align 4,,7
.L370:
	movl (%ebx,%ecx,4),%edx
	movl 4(%ebx,%ecx,4),%eax
	movl %eax,8(%edx)
	incl %ecx
	cmpl %esi,%ecx
	jl .L370
.L368:
	movl -4(%ebx,%edi,4),%eax
	movl $0,8(%eax)
	addl $-12,%esp
	pushl %ebx
	call free
	movl -4(%ebp),%eax
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe14:
	.size	 sort_words,.Lfe14-sort_words
	.align 4
.globl insert_string
	.type	 insert_string,@function
insert_string:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	movl 12(%ebp),%esi
	movl 16(%ebp),%eax
	movl 20(%ebp),%edi
	addl $-12,%esp
	pushl %ebx
	call *%eax
	addl $-12,%esp
	pushl %ebx
	call *%esi
	movl %eax,%esi
	addl $32,%esp
	addl $-8,%esp
	pushl %ebx
	movl htable,%eax
	movl (%eax,%esi,4),%eax
	pushl %eax
	call *%edi
	movl %eax,%edx
	movl htable,%eax
	movl %edx,(%eax,%esi,4)
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe15:
	.size	 insert_string,.Lfe15-insert_string
.globl bufvalid
.data
	.align 4
	.type	 bufvalid,@object
	.size	 bufvalid,4
bufvalid:
	.long 0
.text
	.align 4
.globl init_token
	.type	 init_token,@function
init_token:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl $0,bufvalid
	movl %eax,infile
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe16:
	.size	 init_token,.Lfe16-init_token
.section	.rodata
.LC12:
	.string	" \t\n\r.,:;()[]{}?!\"-"
.data
	.align 4
	.type	 skipchar,@object
	.size	 skipchar,4
skipchar:
	.long .LC12
.text
	.align 4
.globl get_token
	.type	 get_token,@function
get_token:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	.p2align 4,,7
.L382:
	cmpl $0,bufvalid
	je .L379
	movl skipchar,%eax
	addl $-8,%esp
	pushl %eax
	pushl $0
	call strtok
	addl $16,%esp
	testl %eax,%eax
	jne .L377
.L379:
	movl infile,%eax
	addl $-4,%esp
	pushl %eax
	pushl $1024
	pushl $buf
	call fgets
	addl $16,%esp
	testl %eax,%eax
	jne .L381
	xorl %eax,%eax
	jmp .L383
	.p2align 4,,7
.L381:
	movl skipchar,%eax
	movl $1,bufvalid
	addl $-8,%esp
	pushl %eax
	pushl $buf
	call strtok
	addl $16,%esp
	testl %eax,%eax
	je .L382
.L377:
	incl wcnt
.L383:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe17:
	.size	 get_token,.Lfe17-get_token
.section	.rodata
.LC13:
	.string	"%d\t'%s'\n"
	.align 32
.LC14:
	.string	"%d words, %d unique.  Most common (%d) = '%s'\n"
.text
	.align 4
.globl word_freq
	.type	 word_freq,@function
word_freq:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%esi
	movl 16(%ebp),%ebx
	movl 32(%ebp),%edi
	addl $-12,%esp
	pushl %eax
	call init_token
	addl $-12,%esp
	pushl %ebx
	call new_table
	addl $32,%esp
	jmp .L385
	.p2align 4,,7
.L387:
	pushl %edi
	movl 28(%ebp),%edx
	pushl %edx
	movl 24(%ebp),%edx
	pushl %edx
	pushl %eax
	call insert_string
	addl $16,%esp
.L385:
	call get_token
	testl %eax,%eax
	jne .L387
	testl %esi,%esi
	jle .L389
	movl 20(%ebp),%eax
	addl $-12,%esp
	pushl %eax
	call sort_words
	movl %eax,%ebx
	addl $16,%esp
	testl %ebx,%ebx
	je .L389
	subl $1,%esi
	jc .L389
	.p2align 4,,7
.L392:
	movl (%ebx),%eax
	addl $-4,%esp
	pushl %eax
	movl 4(%ebx),%eax
	pushl %eax
	pushl $.LC13
	call printf
	movl 8(%ebx),%ebx
	addl $16,%esp
	testl %ebx,%ebx
	je .L389
	subl $1,%esi
	jnc .L392
.L389:
	movl mstring,%eax
	addl $-12,%esp
	pushl %eax
	movl mcnt,%eax
	pushl %eax
	movl ucnt,%eax
	pushl %eax
	movl wcnt,%eax
	pushl %eax
	pushl $.LC14
	call printf
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe18:
	.size	 word_freq,.Lfe18-word_freq
.section	.rodata
.LC15:
	.string	"verbose"
.LC16:
	.string	"size"
.LC17:
	.string	"hash"
.LC18:
	.string	"lower"
.LC19:
	.string	"find"
.LC20:
	.string	"quicksort"
.LC21:
	.string	"file"
.LC22:
	.string	"Lower case function %s\n"
.LC23:
	.string	"Hash function %s\n"
.LC24:
	.string	"Find element function %s\n"
	.align 32
.LC25:
	.string	"Invalid hash function index %d\n"
	.align 32
.LC26:
	.string	"Invalid lower function index %d\n"
	.align 32
.LC27:
	.string	"Invalid find function index %d\n"
.LC28:
	.string	"r"
.LC29:
	.string	"Couldn't open file '%s'\n"
.LC31:
	.string	"Total time = %f seconds\n"
	.align 8
.LC30:
	.long 0x0,0x412e8480
.text
	.align 4
.globl main
	.type	 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $44,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	movl 12(%ebp),%ebx
	movl $0,-8(%ebp)
	movl $1024,-12(%ebp)
	movl $0,-16(%ebp)
	movl $0,-20(%ebp)
	movl $0,-24(%ebp)
	movl $0,-28(%ebp)
	movl $0,-32(%ebp)
	movl stdin,%edi
	addl $-8,%esp
	leal -8(%ebp),%eax
	pushl %eax
	pushl $.LC15
	call add_int_option
	addl $-8,%esp
	leal -12(%ebp),%eax
	pushl %eax
	pushl $.LC16
	call add_int_option
	addl $32,%esp
	addl $-8,%esp
	leal -16(%ebp),%eax
	pushl %eax
	pushl $.LC17
	call add_int_option
	addl $-8,%esp
	leal -20(%ebp),%eax
	pushl %eax
	pushl $.LC18
	call add_int_option
	addl $32,%esp
	addl $-8,%esp
	leal -24(%ebp),%eax
	pushl %eax
	pushl $.LC19
	call add_int_option
	addl $-8,%esp
	leal -28(%ebp),%eax
	pushl %eax
	pushl $.LC20
	call add_int_option
	addl $32,%esp
	addl $-8,%esp
	leal -32(%ebp),%eax
	pushl %eax
	pushl $.LC21
	call add_string_option
	addl $-4,%esp
	pushl $0
	pushl %ebx
	pushl %esi
	call parse_options
	movl stdout,%eax
	addl $32,%esp
	addl $-12,%esp
	pushl %eax
	call show_options
	movl -20(%ebp),%eax
	sall $2,%eax
	movl lower_fun_names(%eax),%eax
	addl $-8,%esp
	pushl %eax
	pushl $.LC22
	call printf
	movl -16(%ebp),%eax
	sall $2,%eax
	movl hash_fun_names(%eax),%eax
	addl $32,%esp
	addl $-8,%esp
	pushl %eax
	pushl $.LC23
	call printf
	movl -24(%ebp),%eax
	sall $2,%eax
	movl find_ele_fun_names(%eax),%eax
	addl $-8,%esp
	pushl %eax
	pushl $.LC24
	call printf
	movl -16(%ebp),%eax
	addl $32,%esp
	cmpl $2,%eax
	jbe .L396
	addl $-4,%esp
	pushl %eax
	pushl $.LC25
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L396:
	movl -20(%ebp),%eax
	cmpl $1,%eax
	jbe .L397
	addl $-4,%esp
	pushl %eax
	pushl $.LC26
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L397:
	movl -24(%ebp),%eax
	cmpl $2,%eax
	jbe .L398
	addl $-4,%esp
	pushl %eax
	pushl $.LC27
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L398:
	movl -32(%ebp),%eax
	testl %eax,%eax
	je .L399
	addl $-8,%esp
	pushl $.LC28
	pushl %eax
	call fopen
	movl %eax,%edi
	addl $16,%esp
	testl %edi,%edi
	jne .L399
	movl -32(%ebp),%eax
	addl $-4,%esp
	pushl %eax
	pushl $.LC29
	movl stderr,%eax
	pushl %eax
	call fprintf
	addl $-12,%esp
	pushl $1
	call exit
	.p2align 4,,7
.L399:
	movl -24(%ebp),%eax
	sall $2,%eax
	movl find_ele_fun_set(%eax),%eax
	addl $-4,%esp
	pushl %eax
	movl -20(%ebp),%eax
	sall $2,%eax
	movl lower_fun_set(%eax),%eax
	pushl %eax
	movl -16(%ebp),%eax
	sall $2,%eax
	movl hash_fun_set(%eax),%eax
	pushl %eax
	movl -28(%ebp),%eax
	pushl %eax
	movl -12(%ebp),%eax
	pushl %eax
	movl -8(%ebp),%eax
	pushl %eax
	pushl %edi
	call word_freq
	addl $32,%esp
	addl $-4,%esp
	call clock
	movl %eax,-4(%ebp)
	fildl -4(%ebp)
	fdivl .LC30
	subl $8,%esp
	fstpl (%esp)
	pushl $.LC31
	call printf
	addl $-12,%esp
	pushl %edi
	call fclose
	xorl %eax,%eax
	leal -56(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe19:
	.size	 main,.Lfe19-main
	.comm	htable,4,4
	.comm	tsize,4,4
	.comm	buf,1024,32
	.comm	infile,4,4
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
