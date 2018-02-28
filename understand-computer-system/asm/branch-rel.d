
branch.o:     file format elf32-i386

Disassembly of section .text:

00000000 <silly>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 55 08             	mov    0x8(%ebp),%edx
   6:	85 d2                	test   %edx,%edx
   8:	7e 10                	jle    1a <silly+0x1a>
   a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10:	89 d0                	mov    %edx,%eax
  12:	d1 f8                	sar    %eax
  14:	29 c2                	sub    %eax,%edx
  16:	85 d2                	test   %edx,%edx
  18:	7f f6                	jg     10 <silly+0x10>
  1a:	5d                   	pop    %ebp
  1b:	89 d0                	mov    %edx,%eax
  1d:	c3                   	ret    
  1e:	89 f6                	mov    %esi,%esi

00000020 <main>:
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	83 ec 08             	sub    $0x8,%esp
  26:	83 e4 f0             	and    $0xfffffff0,%esp
  29:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp,1)
  30:	e8 fc ff ff ff       	call   31 <main+0x11>
  35:	89 ec                	mov    %ebp,%esp
  37:	5d                   	pop    %ebp
  38:	c3                   	ret    
  39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
