
code.o:     file format elf32-i386

Disassembly of section .text:

00000000 <sum>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 0c             	mov    0xc(%ebp),%eax
   6:	8b 55 08             	mov    0x8(%ebp),%edx
   9:	5d                   	pop    %ebp
   a:	01 d0                	add    %edx,%eax
   c:	01 05 00 00 00 00    	add    %eax,0x0
  12:	c3                   	ret    
  13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

00000020 <p>:
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	83 ec 08             	sub    $0x8,%esp
  26:	8b 45 08             	mov    0x8(%ebp),%eax
  29:	89 44 24 04          	mov    %eax,0x4(%esp,1)
  2d:	89 04 24             	mov    %eax,(%esp,1)
  30:	e8 fc ff ff ff       	call   31 <p+0x11>
  35:	89 ec                	mov    %ebp,%esp
  37:	5d                   	pop    %ebp
  38:	c3                   	ret    
  39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
