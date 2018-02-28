
code-linux.o:     file format elf32-i386

Disassembly of section .text:

00000000 <Sum>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 4d 08             	mov    0x8(%ebp),%ecx
   6:	8b 55 0c             	mov    0xc(%ebp),%edx
   9:	31 c0                	xor    %eax,%eax
   b:	85 d2                	test   %edx,%edx
   d:	74 09                	je     18 <Sum+0x18>
   f:	90                   	nop    
  10:	03 01                	add    (%ecx),%eax
  12:	83 c1 04             	add    $0x4,%ecx
  15:	4a                   	dec    %edx
  16:	75 f8                	jne    10 <Sum+0x10>
  18:	89 ec                	mov    %ebp,%esp
  1a:	5d                   	pop    %ebp
  1b:	c3                   	ret    

0000001c <rSum>:
  1c:	55                   	push   %ebp
  1d:	89 e5                	mov    %esp,%ebp
  1f:	83 ec 14             	sub    $0x14,%esp
  22:	53                   	push   %ebx
  23:	8b 5d 08             	mov    0x8(%ebp),%ebx
  26:	8b 45 0c             	mov    0xc(%ebp),%eax
  29:	85 c0                	test   %eax,%eax
  2b:	7e 13                	jle    40 <rSum+0x24>
  2d:	83 c4 f8             	add    $0xfffffff8,%esp
  30:	48                   	dec    %eax
  31:	50                   	push   %eax
  32:	8d 43 04             	lea    0x4(%ebx),%eax
  35:	50                   	push   %eax
  36:	e8 fc ff ff ff       	call   37 <rSum+0x1b>
  3b:	03 03                	add    (%ebx),%eax
  3d:	eb 03                	jmp    42 <rSum+0x26>
  3f:	90                   	nop    
  40:	31 c0                	xor    %eax,%eax
  42:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
  45:	89 ec                	mov    %ebp,%esp
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    
  49:	8d 76 00             	lea    0x0(%esi),%esi

0000004c <Prog>:
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	83 c4 f8             	add    $0xfffffff8,%esp
  55:	6a 04                	push   $0x4
  57:	68 00 00 00 00       	push   $0x0
  5c:	e8 fc ff ff ff       	call   5d <Prog+0x11>
  61:	83 c4 f8             	add    $0xfffffff8,%esp
  64:	50                   	push   %eax
  65:	68 00 00 00 00       	push   $0x0
  6a:	e8 fc ff ff ff       	call   6b <Prog+0x1f>
  6f:	83 c4 20             	add    $0x20,%esp
  72:	83 c4 f4             	add    $0xfffffff4,%esp
  75:	6a 00                	push   $0x0
  77:	e8 fc ff ff ff       	call   78 <Prog+0x2c>

0000007c <main>:
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	83 ec 08             	sub    $0x8,%esp
  82:	e8 fc ff ff ff       	call   83 <main+0x7>
  87:	31 c0                	xor    %eax,%eax
  89:	89 ec                	mov    %ebp,%esp
  8b:	5d                   	pop    %ebp
  8c:	c3                   	ret    
