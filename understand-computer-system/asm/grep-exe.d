
/bin/grep:     file format elf32-i386

Disassembly of section .init:

08048eac <.init>:
 8048eac:	55                   	push   %ebp
 8048ead:	89 e5                	mov    %esp,%ebp
 8048eaf:	53                   	push   %ebx
 8048eb0:	e8 00 00 00 00       	call   0x8048eb5
 8048eb5:	5b                   	pop    %ebx
 8048eb6:	81 c3 77 22 01 00    	add    $0x12277,%ebx
 8048ebc:	83 bb e0 00 00 00 00 	cmpl   $0x0,0xe0(%ebx)
 8048ec3:	74 05                	je     0x8048eca
 8048ec5:	e8 36 71 fb f7       	call   0x0
 8048eca:	89 f6                	mov    %esi,%esi
 8048ecc:	e8 ef 03 00 00       	call   0x80492c0
 8048ed1:	e8 ba f0 00 00       	call   0x8057f90
 8048ed6:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8048ed9:	c9                   	leave  
 8048eda:	c3                   	ret    
Disassembly of section .plt:

08048edc <.plt>:
 8048edc:	ff 35 30 b1 05 08    	pushl  0x805b130
 8048ee2:	ff 25 34 b1 05 08    	jmp    *0x805b134
 8048ee8:	00 00                	add    %al,(%eax)
 8048eea:	00 00                	add    %al,(%eax)
 8048eec:	ff 25 38 b1 05 08    	jmp    *0x805b138
 8048ef2:	68 00 00 00 00       	push   $0x0
 8048ef7:	e9 e0 ff ff ff       	jmp    0x8048edc
 8048efc:	ff 25 3c b1 05 08    	jmp    *0x805b13c
 8048f02:	68 08 00 00 00       	push   $0x8
 8048f07:	e9 d0 ff ff ff       	jmp    0x8048edc
 8048f0c:	ff 25 40 b1 05 08    	jmp    *0x805b140
 8048f12:	68 10 00 00 00       	push   $0x10
 8048f17:	e9 c0 ff ff ff       	jmp    0x8048edc
 8048f1c:	ff 25 44 b1 05 08    	jmp    *0x805b144
 8048f22:	68 18 00 00 00       	push   $0x18
 8048f27:	e9 b0 ff ff ff       	jmp    0x8048edc
 8048f2c:	ff 25 48 b1 05 08    	jmp    *0x805b148
 8048f32:	68 20 00 00 00       	push   $0x20
 8048f37:	e9 a0 ff ff ff       	jmp    0x8048edc
 8048f3c:	ff 25 4c b1 05 08    	jmp    *0x805b14c
 8048f42:	68 28 00 00 00       	push   $0x28
 8048f47:	e9 90 ff ff ff       	jmp    0x8048edc
 8048f4c:	ff 25 50 b1 05 08    	jmp    *0x805b150
 8048f52:	68 30 00 00 00       	push   $0x30
 8048f57:	e9 80 ff ff ff       	jmp    0x8048edc
 8048f5c:	ff 25 54 b1 05 08    	jmp    *0x805b154
 8048f62:	68 38 00 00 00       	push   $0x38
 8048f67:	e9 70 ff ff ff       	jmp    0x8048edc
 8048f6c:	ff 25 58 b1 05 08    	jmp    *0x805b158
 8048f72:	68 40 00 00 00       	push   $0x40
 8048f77:	e9 60 ff ff ff       	jmp    0x8048edc
 8048f7c:	ff 25 5c b1 05 08    	jmp    *0x805b15c
 8048f82:	68 48 00 00 00       	push   $0x48
 8048f87:	e9 50 ff ff ff       	jmp    0x8048edc
 8048f8c:	ff 25 60 b1 05 08    	jmp    *0x805b160
 8048f92:	68 50 00 00 00       	push   $0x50
 8048f97:	e9 40 ff ff ff       	jmp    0x8048edc
 8048f9c:	ff 25 64 b1 05 08    	jmp    *0x805b164
 8048fa2:	68 58 00 00 00       	push   $0x58
 8048fa7:	e9 30 ff ff ff       	jmp    0x8048edc
 8048fac:	ff 25 68 b1 05 08    	jmp    *0x805b168
 8048fb2:	68 60 00 00 00       	push   $0x60
 8048fb7:	e9 20 ff ff ff       	jmp    0x8048edc
 8048fbc:	ff 25 6c b1 05 08    	jmp    *0x805b16c
 8048fc2:	68 68 00 00 00       	push   $0x68
 8048fc7:	e9 10 ff ff ff       	jmp    0x8048edc
 8048fcc:	ff 25 70 b1 05 08    	jmp    *0x805b170
 8048fd2:	68 70 00 00 00       	push   $0x70
 8048fd7:	e9 00 ff ff ff       	jmp    0x8048edc
 8048fdc:	ff 25 74 b1 05 08    	jmp    *0x805b174
 8048fe2:	68 78 00 00 00       	push   $0x78
 8048fe7:	e9 f0 fe ff ff       	jmp    0x8048edc
 8048fec:	ff 25 78 b1 05 08    	jmp    *0x805b178
 8048ff2:	68 80 00 00 00       	push   $0x80
 8048ff7:	e9 e0 fe ff ff       	jmp    0x8048edc
 8048ffc:	ff 25 7c b1 05 08    	jmp    *0x805b17c
 8049002:	68 88 00 00 00       	push   $0x88
 8049007:	e9 d0 fe ff ff       	jmp    0x8048edc
 804900c:	ff 25 80 b1 05 08    	jmp    *0x805b180
 8049012:	68 90 00 00 00       	push   $0x90
 8049017:	e9 c0 fe ff ff       	jmp    0x8048edc
 804901c:	ff 25 84 b1 05 08    	jmp    *0x805b184
 8049022:	68 98 00 00 00       	push   $0x98
 8049027:	e9 b0 fe ff ff       	jmp    0x8048edc
 804902c:	ff 25 88 b1 05 08    	jmp    *0x805b188
 8049032:	68 a0 00 00 00       	push   $0xa0
 8049037:	e9 a0 fe ff ff       	jmp    0x8048edc
 804903c:	ff 25 8c b1 05 08    	jmp    *0x805b18c
 8049042:	68 a8 00 00 00       	push   $0xa8
 8049047:	e9 90 fe ff ff       	jmp    0x8048edc
 804904c:	ff 25 90 b1 05 08    	jmp    *0x805b190
 8049052:	68 b0 00 00 00       	push   $0xb0
 8049057:	e9 80 fe ff ff       	jmp    0x8048edc
 804905c:	ff 25 94 b1 05 08    	jmp    *0x805b194
 8049062:	68 b8 00 00 00       	push   $0xb8
 8049067:	e9 70 fe ff ff       	jmp    0x8048edc
 804906c:	ff 25 98 b1 05 08    	jmp    *0x805b198
 8049072:	68 c0 00 00 00       	push   $0xc0
 8049077:	e9 60 fe ff ff       	jmp    0x8048edc
 804907c:	ff 25 9c b1 05 08    	jmp    *0x805b19c
 8049082:	68 c8 00 00 00       	push   $0xc8
 8049087:	e9 50 fe ff ff       	jmp    0x8048edc
 804908c:	ff 25 a0 b1 05 08    	jmp    *0x805b1a0
 8049092:	68 d0 00 00 00       	push   $0xd0
 8049097:	e9 40 fe ff ff       	jmp    0x8048edc
 804909c:	ff 25 a4 b1 05 08    	jmp    *0x805b1a4
 80490a2:	68 d8 00 00 00       	push   $0xd8
 80490a7:	e9 30 fe ff ff       	jmp    0x8048edc
 80490ac:	ff 25 a8 b1 05 08    	jmp    *0x805b1a8
 80490b2:	68 e0 00 00 00       	push   $0xe0
 80490b7:	e9 20 fe ff ff       	jmp    0x8048edc
 80490bc:	ff 25 ac b1 05 08    	jmp    *0x805b1ac
 80490c2:	68 e8 00 00 00       	push   $0xe8
 80490c7:	e9 10 fe ff ff       	jmp    0x8048edc
 80490cc:	ff 25 b0 b1 05 08    	jmp    *0x805b1b0
 80490d2:	68 f0 00 00 00       	push   $0xf0
 80490d7:	e9 00 fe ff ff       	jmp    0x8048edc
 80490dc:	ff 25 b4 b1 05 08    	jmp    *0x805b1b4
 80490e2:	68 f8 00 00 00       	push   $0xf8
 80490e7:	e9 f0 fd ff ff       	jmp    0x8048edc
 80490ec:	ff 25 b8 b1 05 08    	jmp    *0x805b1b8
 80490f2:	68 00 01 00 00       	push   $0x100
 80490f7:	e9 e0 fd ff ff       	jmp    0x8048edc
 80490fc:	ff 25 bc b1 05 08    	jmp    *0x805b1bc
 8049102:	68 08 01 00 00       	push   $0x108
 8049107:	e9 d0 fd ff ff       	jmp    0x8048edc
 804910c:	ff 25 c0 b1 05 08    	jmp    *0x805b1c0
 8049112:	68 10 01 00 00       	push   $0x110
 8049117:	e9 c0 fd ff ff       	jmp    0x8048edc
 804911c:	ff 25 c4 b1 05 08    	jmp    *0x805b1c4
 8049122:	68 18 01 00 00       	push   $0x118
 8049127:	e9 b0 fd ff ff       	jmp    0x8048edc
 804912c:	ff 25 c8 b1 05 08    	jmp    *0x805b1c8
 8049132:	68 20 01 00 00       	push   $0x120
 8049137:	e9 a0 fd ff ff       	jmp    0x8048edc
 804913c:	ff 25 cc b1 05 08    	jmp    *0x805b1cc
 8049142:	68 28 01 00 00       	push   $0x128
 8049147:	e9 90 fd ff ff       	jmp    0x8048edc
 804914c:	ff 25 d0 b1 05 08    	jmp    *0x805b1d0
 8049152:	68 30 01 00 00       	push   $0x130
 8049157:	e9 80 fd ff ff       	jmp    0x8048edc
 804915c:	ff 25 d4 b1 05 08    	jmp    *0x805b1d4
 8049162:	68 38 01 00 00       	push   $0x138
 8049167:	e9 70 fd ff ff       	jmp    0x8048edc
 804916c:	ff 25 d8 b1 05 08    	jmp    *0x805b1d8
 8049172:	68 40 01 00 00       	push   $0x140
 8049177:	e9 60 fd ff ff       	jmp    0x8048edc
 804917c:	ff 25 dc b1 05 08    	jmp    *0x805b1dc
 8049182:	68 48 01 00 00       	push   $0x148
 8049187:	e9 50 fd ff ff       	jmp    0x8048edc
 804918c:	ff 25 e0 b1 05 08    	jmp    *0x805b1e0
 8049192:	68 50 01 00 00       	push   $0x150
 8049197:	e9 40 fd ff ff       	jmp    0x8048edc
 804919c:	ff 25 e4 b1 05 08    	jmp    *0x805b1e4
 80491a2:	68 58 01 00 00       	push   $0x158
 80491a7:	e9 30 fd ff ff       	jmp    0x8048edc
 80491ac:	ff 25 e8 b1 05 08    	jmp    *0x805b1e8
 80491b2:	68 60 01 00 00       	push   $0x160
 80491b7:	e9 20 fd ff ff       	jmp    0x8048edc
 80491bc:	ff 25 ec b1 05 08    	jmp    *0x805b1ec
 80491c2:	68 68 01 00 00       	push   $0x168
 80491c7:	e9 10 fd ff ff       	jmp    0x8048edc
 80491cc:	ff 25 f0 b1 05 08    	jmp    *0x805b1f0
 80491d2:	68 70 01 00 00       	push   $0x170
 80491d7:	e9 00 fd ff ff       	jmp    0x8048edc
 80491dc:	ff 25 f4 b1 05 08    	jmp    *0x805b1f4
 80491e2:	68 78 01 00 00       	push   $0x178
 80491e7:	e9 f0 fc ff ff       	jmp    0x8048edc
 80491ec:	ff 25 f8 b1 05 08    	jmp    *0x805b1f8
 80491f2:	68 80 01 00 00       	push   $0x180
 80491f7:	e9 e0 fc ff ff       	jmp    0x8048edc
 80491fc:	ff 25 fc b1 05 08    	jmp    *0x805b1fc
 8049202:	68 88 01 00 00       	push   $0x188
 8049207:	e9 d0 fc ff ff       	jmp    0x8048edc
 804920c:	ff 25 00 b2 05 08    	jmp    *0x805b200
 8049212:	68 90 01 00 00       	push   $0x190
 8049217:	e9 c0 fc ff ff       	jmp    0x8048edc
 804921c:	ff 25 04 b2 05 08    	jmp    *0x805b204
 8049222:	68 98 01 00 00       	push   $0x198
 8049227:	e9 b0 fc ff ff       	jmp    0x8048edc
 804922c:	ff 25 08 b2 05 08    	jmp    *0x805b208
 8049232:	68 a0 01 00 00       	push   $0x1a0
 8049237:	e9 a0 fc ff ff       	jmp    0x8048edc
Disassembly of section .text:

08049240 <.text>:
 8049240:	31 ed                	xor    %ebp,%ebp
 8049242:	5e                   	pop    %esi
 8049243:	89 e1                	mov    %esp,%ecx
 8049245:	83 e4 f8             	and    $0xfffffff8,%esp
 8049248:	50                   	push   %eax
 8049249:	54                   	push   %esp
 804924a:	52                   	push   %edx
 804924b:	68 bc 7f 05 08       	push   $0x8057fbc
 8049250:	68 ac 8e 04 08       	push   $0x8048eac
 8049255:	51                   	push   %ecx
 8049256:	56                   	push   %esi
 8049257:	68 e0 ac 04 08       	push   $0x804ace0
 804925c:	e8 7b fe ff ff       	call   0x80490dc
 8049261:	f4                   	hlt    
 8049262:	90                   	nop    
 8049263:	90                   	nop    
 8049264:	90                   	nop    
 8049265:	90                   	nop    
 8049266:	90                   	nop    
 8049267:	90                   	nop    
 8049268:	90                   	nop    
 8049269:	90                   	nop    
 804926a:	90                   	nop    
 804926b:	90                   	nop    
 804926c:	90                   	nop    
 804926d:	90                   	nop    
 804926e:	90                   	nop    
 804926f:	90                   	nop    
 8049270:	55                   	push   %ebp
 8049271:	89 e5                	mov    %esp,%ebp
 8049273:	83 3d f4 ad 05 08 00 	cmpl   $0x0,0x805adf4
 804927a:	75 38                	jne    0x80492b4
 804927c:	eb 0f                	jmp    0x804928d
 804927e:	89 f6                	mov    %esi,%esi
 8049280:	8d 50 04             	lea    0x4(%eax),%edx
 8049283:	89 15 f0 ad 05 08    	mov    %edx,0x805adf0
 8049289:	8b 00                	mov    (%eax),%eax
 804928b:	ff d0                	call   *%eax
 804928d:	a1 f0 ad 05 08       	mov    0x805adf0,%eax
 8049292:	83 38 00             	cmpl   $0x0,(%eax)
 8049295:	75 e9                	jne    0x8049280
 8049297:	b8 3c 90 04 08       	mov    $0x804903c,%eax
 804929c:	85 c0                	test   %eax,%eax
 804929e:	74 0a                	je     0x80492aa
 80492a0:	68 18 b1 05 08       	push   $0x805b118
 80492a5:	e8 92 fd ff ff       	call   0x804903c
 80492aa:	c7 05 f4 ad 05 08 01 	movl   $0x1,0x805adf4
 80492b1:	00 00 00 
 80492b4:	c9                   	leave  
 80492b5:	c3                   	ret    
 80492b6:	89 f6                	mov    %esi,%esi
 80492b8:	55                   	push   %ebp
 80492b9:	89 e5                	mov    %esp,%ebp
 80492bb:	c9                   	leave  
 80492bc:	c3                   	ret    
 80492bd:	8d 76 00             	lea    0x0(%esi),%esi
 80492c0:	55                   	push   %ebp
 80492c1:	89 e5                	mov    %esp,%ebp
 80492c3:	b8 3c 8f 04 08       	mov    $0x8048f3c,%eax
 80492c8:	85 c0                	test   %eax,%eax
 80492ca:	74 0f                	je     0x80492db
 80492cc:	68 e4 b2 05 08       	push   $0x805b2e4
 80492d1:	68 18 b1 05 08       	push   $0x805b118
 80492d6:	e8 61 fc ff ff       	call   0x8048f3c
 80492db:	c9                   	leave  
 80492dc:	c3                   	ret    
 80492dd:	8d 76 00             	lea    0x0(%esi),%esi
 80492e0:	55                   	push   %ebp
 80492e1:	89 e5                	mov    %esp,%ebp
 80492e3:	c9                   	leave  
 80492e4:	c3                   	ret    
 80492e5:	90                   	nop    
 80492e6:	90                   	nop    
 80492e7:	90                   	nop    
 80492e8:	90                   	nop    
 80492e9:	90                   	nop    
 80492ea:	90                   	nop    
 80492eb:	90                   	nop    
 80492ec:	90                   	nop    
 80492ed:	90                   	nop    
 80492ee:	90                   	nop    
 80492ef:	90                   	nop    
 80492f0:	55                   	push   %ebp
 80492f1:	89 e5                	mov    %esp,%ebp
 80492f3:	53                   	push   %ebx
 80492f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80492f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492fa:	85 c0                	test   %eax,%eax
 80492fc:	74 22                	je     0x8049320
 80492fe:	50                   	push   %eax
 80492ff:	e8 a8 fc ff ff       	call   0x8048fac
 8049304:	50                   	push   %eax
 8049305:	53                   	push   %ebx
 8049306:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804930b:	50                   	push   %eax
 804930c:	68 99 81 05 08       	push   $0x8058199
 8049311:	a1 c8 b2 05 08       	mov    0x805b2c8,%eax
 8049316:	50                   	push   %eax
 8049317:	e8 60 fc ff ff       	call   0x8048f7c
 804931c:	eb 19                	jmp    0x8049337
 804931e:	89 f6                	mov    %esi,%esi
 8049320:	53                   	push   %ebx
 8049321:	a1 70 b4 05 08       	mov    0x805b470,%eax
 8049326:	50                   	push   %eax
 8049327:	68 a5 81 05 08       	push   $0x80581a5
 804932c:	a1 c8 b2 05 08       	mov    0x805b2c8,%eax
 8049331:	50                   	push   %eax
 8049332:	e8 45 fc ff ff       	call   0x8048f7c
 8049337:	c7 05 78 b4 05 08 01 	movl   $0x1,0x805b478
 804933e:	00 00 00 
 8049341:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8049344:	89 ec                	mov    %ebp,%esp
 8049346:	5d                   	pop    %ebp
 8049347:	c3                   	ret    
 8049348:	90                   	nop    
 8049349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049350:	55                   	push   %ebp
 8049351:	89 e5                	mov    %esp,%ebp
 8049353:	8b 55 08             	mov    0x8(%ebp),%edx
 8049356:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049359:	50                   	push   %eax
 804935a:	52                   	push   %edx
 804935b:	e8 90 ff ff ff       	call   0x80492f0
 8049360:	6a 02                	push   $0x2
 8049362:	e8 65 fe ff ff       	call   0x80491cc
 8049367:	89 f6                	mov    %esi,%esi
 8049369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8049370:	55                   	push   %ebp
 8049371:	89 e5                	mov    %esp,%ebp
 8049373:	53                   	push   %ebx
 8049374:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049377:	53                   	push   %ebx
 8049378:	e8 8f fc ff ff       	call   0x804900c
 804937d:	83 c4 04             	add    $0x4,%esp
 8049380:	85 db                	test   %ebx,%ebx
 8049382:	74 4c                	je     0x80493d0
 8049384:	85 c0                	test   %eax,%eax
 8049386:	75 48                	jne    0x80493d0
 8049388:	6a 00                	push   $0x0
 804938a:	8b 15 00 b3 05 08    	mov    0x805b300,%edx
 8049390:	85 d2                	test   %edx,%edx
 8049392:	74 0d                	je     0x80493a1
 8049394:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049399:	39 05 04 b3 05 08    	cmp    %eax,0x805b304
 804939f:	74 23                	je     0x80493c4
 80493a1:	6a 05                	push   $0x5
 80493a3:	68 ad 81 05 08       	push   $0x80581ad
 80493a8:	6a 00                	push   $0x0
 80493aa:	e8 0d fe ff ff       	call   0x80491bc
 80493af:	83 c4 0c             	add    $0xc,%esp
 80493b2:	89 c2                	mov    %eax,%edx
 80493b4:	89 15 00 b3 05 08    	mov    %edx,0x805b300
 80493ba:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 80493bf:	a3 04 b3 05 08       	mov    %eax,0x805b304
 80493c4:	52                   	push   %edx
 80493c5:	e8 86 ff ff ff       	call   0x8049350
 80493ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80493d0:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80493d3:	89 ec                	mov    %ebp,%esp
 80493d5:	5d                   	pop    %ebp
 80493d6:	c3                   	ret    
 80493d7:	89 f6                	mov    %esi,%esi
 80493d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 80493e0:	55                   	push   %ebp
 80493e1:	89 e5                	mov    %esp,%ebp
 80493e3:	53                   	push   %ebx
 80493e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80493e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80493ea:	85 c0                	test   %eax,%eax
 80493ec:	74 12                	je     0x8049400
 80493ee:	53                   	push   %ebx
 80493ef:	50                   	push   %eax
 80493f0:	e8 f7 fc ff ff       	call   0x80490ec
 80493f5:	83 c4 08             	add    $0x8,%esp
 80493f8:	eb 0f                	jmp    0x8049409
 80493fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049400:	53                   	push   %ebx
 8049401:	e8 06 fc ff ff       	call   0x804900c
 8049406:	83 c4 04             	add    $0x4,%esp
 8049409:	85 db                	test   %ebx,%ebx
 804940b:	74 46                	je     0x8049453
 804940d:	85 c0                	test   %eax,%eax
 804940f:	75 42                	jne    0x8049453
 8049411:	6a 00                	push   $0x0
 8049413:	8b 15 08 b3 05 08    	mov    0x805b308,%edx
 8049419:	85 d2                	test   %edx,%edx
 804941b:	74 0d                	je     0x804942a
 804941d:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049422:	39 05 0c b3 05 08    	cmp    %eax,0x805b30c
 8049428:	74 23                	je     0x804944d
 804942a:	6a 05                	push   $0x5
 804942c:	68 ad 81 05 08       	push   $0x80581ad
 8049431:	6a 00                	push   $0x0
 8049433:	e8 84 fd ff ff       	call   0x80491bc
 8049438:	83 c4 0c             	add    $0xc,%esp
 804943b:	89 c2                	mov    %eax,%edx
 804943d:	89 15 08 b3 05 08    	mov    %edx,0x805b308
 8049443:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049448:	a3 0c b3 05 08       	mov    %eax,0x805b30c
 804944d:	52                   	push   %edx
 804944e:	e8 fd fe ff ff       	call   0x8049350
 8049453:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8049456:	89 ec                	mov    %ebp,%esp
 8049458:	5d                   	pop    %ebp
 8049459:	c3                   	ret    
 804945a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049460:	55                   	push   %ebp
 8049461:	89 e5                	mov    %esp,%ebp
 8049463:	8b 55 08             	mov    0x8(%ebp),%edx
 8049466:	eb 0e                	jmp    0x8049476
 8049468:	04 d0                	add    $0xd0,%al
 804946a:	3c 09                	cmp    $0x9,%al
 804946c:	76 07                	jbe    0x8049475
 804946e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049473:	eb 21                	jmp    0x8049496
 8049475:	42                   	inc    %edx
 8049476:	8a 02                	mov    (%edx),%al
 8049478:	84 c0                	test   %al,%al
 804947a:	75 ec                	jne    0x8049468
 804947c:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 8049481:	6a 00                	push   $0x0
 8049483:	6a 0a                	push   $0xa
 8049485:	6a 00                	push   $0x0
 8049487:	50                   	push   %eax
 8049488:	e8 0f fc ff ff       	call   0x804909c
 804948d:	89 c2                	mov    %eax,%edx
 804948f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049492:	89 10                	mov    %edx,(%eax)
 8049494:	31 c0                	xor    %eax,%eax
 8049496:	89 ec                	mov    %ebp,%esp
 8049498:	5d                   	pop    %ebp
 8049499:	c3                   	ret    
 804949a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80494a0:	55                   	push   %ebp
 80494a1:	89 e5                	mov    %esp,%ebp
 80494a3:	57                   	push   %edi
 80494a4:	56                   	push   %esi
 80494a5:	53                   	push   %ebx
 80494a6:	8b 55 08             	mov    0x8(%ebp),%edx
 80494a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80494ac:	89 d0                	mov    %edx,%eax
 80494ae:	03 05 a4 b4 05 08    	add    0x805b4a4,%eax
 80494b4:	8d 48 ff             	lea    0xffffffff(%eax),%ecx
 80494b7:	39 ca                	cmp    %ecx,%edx
 80494b9:	77 45                	ja     0x8049500
 80494bb:	8b 33                	mov    (%ebx),%esi
 80494bd:	85 f6                	test   %esi,%esi
 80494bf:	74 0f                	je     0x80494d0
 80494c1:	51                   	push   %ecx
 80494c2:	56                   	push   %esi
 80494c3:	e8 24 fc ff ff       	call   0x80490ec
 80494c8:	eb 0c                	jmp    0x80494d6
 80494ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80494d0:	51                   	push   %ecx
 80494d1:	e8 36 fb ff ff       	call   0x804900c
 80494d6:	89 c1                	mov    %eax,%ecx
 80494d8:	85 c9                	test   %ecx,%ecx
 80494da:	74 24                	je     0x8049500
 80494dc:	89 0b                	mov    %ecx,(%ebx)
 80494de:	89 ce                	mov    %ecx,%esi
 80494e0:	8b 3d a4 b4 05 08    	mov    0x805b4a4,%edi
 80494e6:	89 f0                	mov    %esi,%eax
 80494e8:	31 d2                	xor    %edx,%edx
 80494ea:	f7 f7                	div    %edi,%eax
 80494ec:	89 d1                	mov    %edx,%ecx
 80494ee:	85 c9                	test   %ecx,%ecx
 80494f0:	74 04                	je     0x80494f6
 80494f2:	29 cf                	sub    %ecx,%edi
 80494f4:	01 fe                	add    %edi,%esi
 80494f6:	89 f0                	mov    %esi,%eax
 80494f8:	eb 08                	jmp    0x8049502
 80494fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049500:	31 c0                	xor    %eax,%eax
 8049502:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8049505:	5b                   	pop    %ebx
 8049506:	5e                   	pop    %esi
 8049507:	5f                   	pop    %edi
 8049508:	89 ec                	mov    %ebp,%esp
 804950a:	5d                   	pop    %ebp
 804950b:	c3                   	ret    
 804950c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049510:	55                   	push   %ebp
 8049511:	89 e5                	mov    %esp,%ebp
 8049513:	83 ec 0c             	sub    $0xc,%esp
 8049516:	57                   	push   %edi
 8049517:	56                   	push   %esi
 8049518:	53                   	push   %ebx
 8049519:	8b 7d 08             	mov    0x8(%ebp),%edi
 804951c:	8b 75 10             	mov    0x10(%ebp),%esi
 804951f:	8b 0d a4 b4 05 08    	mov    0x805b4a4,%ecx
 8049525:	85 c9                	test   %ecx,%ecx
 8049527:	74 37                	je     0x8049560
 8049529:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
 804952e:	f7 25 94 b4 05 08    	mul    0x805b494,%eax
 8049534:	c1 ea 02             	shr    $0x2,%edx
 8049537:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 804953a:	89 d0                	mov    %edx,%eax
 804953c:	31 d2                	xor    %edx,%edx
 804953e:	f7 f1                	div    %ecx,%eax
 8049540:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
 8049543:	85 d2                	test   %edx,%edx
 8049545:	74 05                	je     0x804954c
 8049547:	29 d1                	sub    %edx,%ecx
 8049549:	01 4d f8             	add    %ecx,0xfffffff8(%ebp)
 804954c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804954f:	a3 90 b4 05 08       	mov    %eax,0x805b490
 8049554:	e9 d7 00 00 00       	jmp    0x8049630
 8049559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049560:	e8 07 fb ff ff       	call   0x804906c
 8049565:	89 c1                	mov    %eax,%ecx
 8049567:	89 0d a4 b4 05 08    	mov    %ecx,0x805b4a4
 804956d:	85 c9                	test   %ecx,%ecx
 804956f:	75 05                	jne    0x8049576
 8049571:	e8 d6 fa ff ff       	call   0x804904c
 8049576:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
 804957c:	76 05                	jbe    0x8049583
 804957e:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 8049581:	eb 07                	jmp    0x804958a
 8049583:	c7 45 f8 00 20 00 00 	movl   $0x2000,0xfffffff8(%ebp)
 804958a:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804958d:	8b 15 a4 b4 05 08    	mov    0x805b4a4,%edx
 8049593:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
 8049596:	89 c8                	mov    %ecx,%eax
 8049598:	31 d2                	xor    %edx,%edx
 804959a:	f7 75 f4             	div    0xfffffff4(%ebp),%eax
 804959d:	89 d3                	mov    %edx,%ebx
 804959f:	85 db                	test   %ebx,%ebx
 80495a1:	74 06                	je     0x80495a9
 80495a3:	29 5d f4             	sub    %ebx,0xfffffff4(%ebp)
 80495a6:	03 4d f4             	add    0xfffffff4(%ebp),%ecx
 80495a9:	89 0d 90 b4 05 08    	mov    %ecx,0x805b490
 80495af:	8d 1c 89             	lea    (%ecx,%ecx,4),%ebx
 80495b2:	89 1d 94 b4 05 08    	mov    %ebx,0x805b494
 80495b8:	3b 4d f8             	cmp    0xfffffff8(%ebp),%ecx
 80495bb:	72 2c                	jb     0x80495e9
 80495bd:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
 80495c2:	f7 e3                	mul    %ebx,%eax
 80495c4:	c1 ea 02             	shr    $0x2,%edx
 80495c7:	39 ca                	cmp    %ecx,%edx
 80495c9:	75 1e                	jne    0x80495e9
 80495cb:	8d 4b 01             	lea    0x1(%ebx),%ecx
 80495ce:	39 d9                	cmp    %ebx,%ecx
 80495d0:	72 17                	jb     0x80495e9
 80495d2:	68 88 b4 05 08       	push   $0x805b488
 80495d7:	51                   	push   %ecx
 80495d8:	e8 c3 fe ff ff       	call   0x80494a0
 80495dd:	a3 8c b4 05 08       	mov    %eax,0x805b48c
 80495e2:	83 c4 08             	add    $0x8,%esp
 80495e5:	85 c0                	test   %eax,%eax
 80495e7:	75 47                	jne    0x8049630
 80495e9:	6a 00                	push   $0x0
 80495eb:	8b 0d 10 b3 05 08    	mov    0x805b310,%ecx
 80495f1:	85 c9                	test   %ecx,%ecx
 80495f3:	74 0d                	je     0x8049602
 80495f5:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 80495fa:	39 05 14 b3 05 08    	cmp    %eax,0x805b314
 8049600:	74 25                	je     0x8049627
 8049602:	6a 05                	push   $0x5
 8049604:	68 ad 81 05 08       	push   $0x80581ad
 8049609:	6a 00                	push   $0x0
 804960b:	e8 ac fb ff ff       	call   0x80491bc
 8049610:	83 c4 0c             	add    $0xc,%esp
 8049613:	89 c2                	mov    %eax,%edx
 8049615:	89 15 10 b3 05 08    	mov    %edx,0x805b310
 804961b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049620:	a3 14 b3 05 08       	mov    %eax,0x805b314
 8049625:	89 d1                	mov    %edx,%ecx
 8049627:	51                   	push   %ecx
 8049628:	e8 23 fd ff ff       	call   0x8049350
 804962d:	8d 76 00             	lea    0x0(%esi),%esi
 8049630:	a1 8c b4 05 08       	mov    0x805b48c,%eax
 8049635:	a3 a0 b4 05 08       	mov    %eax,0x805b4a0
 804963a:	89 3d 98 b4 05 08    	mov    %edi,0x805b498
 8049640:	8d 46 04             	lea    0x4(%esi),%eax
 8049643:	50                   	push   %eax
 8049644:	57                   	push   %edi
 8049645:	6a 03                	push   $0x3
 8049647:	e8 e0 f8 ff ff       	call   0x8048f2c
 804964c:	83 c4 0c             	add    $0xc,%esp
 804964f:	85 c0                	test   %eax,%eax
 8049651:	74 0f                	je     0x8049662
 8049653:	e8 84 f9 ff ff       	call   0x8048fdc
 8049658:	8b 00                	mov    (%eax),%eax
 804965a:	50                   	push   %eax
 804965b:	68 be 81 05 08       	push   $0x80581be
 8049660:	eb 68                	jmp    0x80496ca
 8049662:	83 3d 7c b4 05 08 02 	cmpl   $0x2,0x805b47c
 8049669:	75 16                	jne    0x8049681
 804966b:	8b 46 14             	mov    0x14(%esi),%eax
 804966e:	25 00 f0 00 00       	and    $0xf000,%eax
 8049673:	3d 00 40 00 00       	cmp    $0x4000,%eax
 8049678:	75 07                	jne    0x8049681
 804967a:	31 c0                	xor    %eax,%eax
 804967c:	e9 c3 00 00 00       	jmp    0x8049744
 8049681:	8b 46 14             	mov    0x14(%esi),%eax
 8049684:	25 00 f0 00 00       	and    $0xf000,%eax
 8049689:	3d 00 80 00 00       	cmp    $0x8000,%eax
 804968e:	0f 85 a1 00 00 00    	jne    0x8049735
 8049694:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049698:	75 39                	jne    0x80496d3
 804969a:	6a 01                	push   $0x1
 804969c:	6a 00                	push   $0x0
 804969e:	6a 00                	push   $0x0
 80496a0:	57                   	push   %edi
 80496a1:	e8 06 fa ff ff       	call   0x80490ac
 80496a6:	a3 a8 b4 05 08       	mov    %eax,0x805b4a8
 80496ab:	89 15 ac b4 05 08    	mov    %edx,0x805b4ac
 80496b1:	83 c4 10             	add    $0x10,%esp
 80496b4:	83 3d ac b4 05 08 00 	cmpl   $0x0,0x805b4ac
 80496bb:	7d 2a                	jge    0x80496e7
 80496bd:	e8 1a f9 ff ff       	call   0x8048fdc
 80496c2:	8b 00                	mov    (%eax),%eax
 80496c4:	50                   	push   %eax
 80496c5:	68 c4 81 05 08       	push   $0x80581c4
 80496ca:	e8 21 fc ff ff       	call   0x80492f0
 80496cf:	31 c0                	xor    %eax,%eax
 80496d1:	eb 71                	jmp    0x8049744
 80496d3:	c7 05 a8 b4 05 08 00 	movl   $0x0,0x805b4a8
 80496da:	00 00 00 
 80496dd:	c7 05 ac b4 05 08 00 	movl   $0x0,0x805b4ac
 80496e4:	00 00 00 
 80496e7:	8b 0d a8 b4 05 08    	mov    0x805b4a8,%ecx
 80496ed:	8b 1d ac b4 05 08    	mov    0x805b4ac,%ebx
 80496f3:	89 0d b4 b4 05 08    	mov    %ecx,0x805b4b4
 80496f9:	89 1d b8 b4 05 08    	mov    %ebx,0x805b4b8
 80496ff:	31 f6                	xor    %esi,%esi
 8049701:	83 3d 6c b4 05 08 00 	cmpl   $0x0,0x805b46c
 8049708:	74 23                	je     0x804972d
 804970a:	a1 a4 b4 05 08       	mov    0x805b4a4,%eax
 804970f:	31 d2                	xor    %edx,%edx
 8049711:	52                   	push   %edx
 8049712:	50                   	push   %eax
 8049713:	53                   	push   %ebx
 8049714:	51                   	push   %ecx
 8049715:	e8 26 e6 00 00       	call   0x8057d40
 804971a:	89 d1                	mov    %edx,%ecx
 804971c:	89 c2                	mov    %eax,%edx
 804971e:	89 d0                	mov    %edx,%eax
 8049720:	09 c8                	or     %ecx,%eax
 8049722:	0f 94 c0             	sete   %al
 8049725:	89 c6                	mov    %eax,%esi
 8049727:	81 e6 ff 00 00 00    	and    $0xff,%esi
 804972d:	89 35 b0 b4 05 08    	mov    %esi,0x805b4b0
 8049733:	eb 0a                	jmp    0x804973f
 8049735:	c7 05 b0 b4 05 08 00 	movl   $0x0,0x805b4b0
 804973c:	00 00 00 
 804973f:	b8 01 00 00 00       	mov    $0x1,%eax
 8049744:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8049747:	5b                   	pop    %ebx
 8049748:	5e                   	pop    %esi
 8049749:	5f                   	pop    %edi
 804974a:	89 ec                	mov    %ebp,%esp
 804974c:	5d                   	pop    %ebp
 804974d:	c3                   	ret    
 804974e:	89 f6                	mov    %esi,%esi
 8049750:	55                   	push   %ebp
 8049751:	89 e5                	mov    %esp,%ebp
 8049753:	83 ec 3c             	sub    $0x3c,%esp
 8049756:	57                   	push   %edi
 8049757:	56                   	push   %esi
 8049758:	53                   	push   %ebx
 8049759:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 8049760:	c7 45 f8 01 00 00 00 	movl   $0x1,0xfffffff8(%ebp)
 8049767:	a1 88 b4 05 08       	mov    0x805b488,%eax
 804976c:	8b 0d a0 b4 05 08    	mov    0x805b4a0,%ecx
 8049772:	29 c1                	sub    %eax,%ecx
 8049774:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049777:	29 d9                	sub    %ebx,%ecx
 8049779:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 804977c:	8b 15 90 b4 05 08    	mov    0x805b490,%edx
 8049782:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8049785:	39 da                	cmp    %ebx,%edx
 8049787:	0f 83 93 01 00 00    	jae    0x8049920
 804978d:	89 5d e8             	mov    %ebx,0xffffffe8(%ebp)
 8049790:	8b 3d a4 b4 05 08    	mov    0x805b4a4,%edi
 8049796:	89 7d c4             	mov    %edi,0xffffffc4(%ebp)
 8049799:	89 d8                	mov    %ebx,%eax
 804979b:	31 d2                	xor    %edx,%edx
 804979d:	f7 f7                	div    %edi,%eax
 804979f:	85 d2                	test   %edx,%edx
 80497a1:	74 09                	je     0x80497ac
 80497a3:	89 f8                	mov    %edi,%eax
 80497a5:	29 d0                	sub    %edx,%eax
 80497a7:	01 d8                	add    %ebx,%eax
 80497a9:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
 80497ac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80497af:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,0xffffffe4(%ebp)
 80497b6:	8b 41 14             	mov    0x14(%ecx),%eax
 80497b9:	25 00 f0 00 00       	and    $0xf000,%eax
 80497be:	3d 00 80 00 00       	cmp    $0x8000,%eax
 80497c3:	0f 85 88 00 00 00    	jne    0x8049851
 80497c9:	89 cf                	mov    %ecx,%edi
 80497cb:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 80497ce:	31 d2                	xor    %edx,%edx
 80497d0:	8b 4f 30             	mov    0x30(%edi),%ecx
 80497d3:	8b 5f 34             	mov    0x34(%edi),%ebx
 80497d6:	2b 0d a8 b4 05 08    	sub    0x805b4a8,%ecx
 80497dc:	1b 1d ac b4 05 08    	sbb    0x805b4ac,%ebx
 80497e2:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 80497e5:	89 5d cc             	mov    %ebx,0xffffffcc(%ebp)
 80497e8:	52                   	push   %edx
 80497e9:	50                   	push   %eax
 80497ea:	53                   	push   %ebx
 80497eb:	51                   	push   %ecx
 80497ec:	e8 4f e5 00 00       	call   0x8057d40
 80497f1:	83 c4 10             	add    $0x10,%esp
 80497f4:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
 80497f7:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 80497fa:	8b 5d cc             	mov    0xffffffcc(%ebp),%ebx
 80497fd:	89 4d d0             	mov    %ecx,0xffffffd0(%ebp)
 8049800:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8049803:	85 c0                	test   %eax,%eax
 8049805:	74 0d                	je     0x8049814
 8049807:	29 45 c4             	sub    %eax,0xffffffc4(%ebp)
 804980a:	8b 5d c4             	mov    0xffffffc4(%ebp),%ebx
 804980d:	01 5d d0             	add    %ebx,0xffffffd0(%ebp)
 8049810:	83 55 d4 00          	adcl   $0x0,0xffffffd4(%ebp)
 8049814:	8b 4d d0             	mov    0xffffffd0(%ebp),%ecx
 8049817:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 804981a:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 804981d:	89 4d d0             	mov    %ecx,0xffffffd0(%ebp)
 8049820:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8049823:	01 7d d0             	add    %edi,0xffffffd0(%ebp)
 8049826:	83 55 d4 00          	adcl   $0x0,0xffffffd4(%ebp)
 804982a:	83 7d d4 00          	cmpl   $0x0,0xffffffd4(%ebp)
 804982e:	7c 21                	jl     0x8049851
 8049830:	8b 45 d0             	mov    0xffffffd0(%ebp),%eax
 8049833:	89 45 c8             	mov    %eax,0xffffffc8(%ebp)
 8049836:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
 804983d:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 8049840:	39 c8                	cmp    %ecx,%eax
 8049842:	75 0d                	jne    0x8049851
 8049844:	8b 5d cc             	mov    0xffffffcc(%ebp),%ebx
 8049847:	39 5d d4             	cmp    %ebx,0xffffffd4(%ebp)
 804984a:	75 05                	jne    0x8049851
 804984c:	89 c7                	mov    %eax,%edi
 804984e:	89 7d e4             	mov    %edi,0xffffffe4(%ebp)
 8049851:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8049854:	3b 55 08             	cmp    0x8(%ebp),%edx
 8049857:	73 1f                	jae    0x8049878
 8049859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049860:	89 d0                	mov    %edx,%eax
 8049862:	01 d0                	add    %edx,%eax
 8049864:	39 c2                	cmp    %eax,%edx
 8049866:	0f 83 a4 00 00 00    	jae    0x8049910
 804986c:	a3 90 b4 05 08       	mov    %eax,0x805b490
 8049871:	89 c2                	mov    %eax,%edx
 8049873:	3b 55 08             	cmp    0x8(%ebp),%edx
 8049876:	72 e8                	jb     0x8049860
 8049878:	8b 15 90 b4 05 08    	mov    0x805b490,%edx
 804987e:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8049881:	39 45 e4             	cmp    %eax,0xffffffe4(%ebp)
 8049884:	73 0e                	jae    0x8049894
 8049886:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 8049889:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 804988c:	89 0d 90 b4 05 08    	mov    %ecx,0x805b490
 8049892:	89 ca                	mov    %ecx,%edx
 8049894:	3b 55 08             	cmp    0x8(%ebp),%edx
 8049897:	72 34                	jb     0x80498cd
 8049899:	3b 45 08             	cmp    0x8(%ebp),%eax
 804989c:	72 2f                	jb     0x80498cd
 804989e:	75 08                	jne    0x80498a8
 80498a0:	8b 5d e4             	mov    0xffffffe4(%ebp),%ebx
 80498a3:	39 5d 08             	cmp    %ebx,0x8(%ebp)
 80498a6:	75 25                	jne    0x80498cd
 80498a8:	39 05 94 b4 05 08    	cmp    %eax,0x805b494
 80498ae:	73 70                	jae    0x8049920
 80498b0:	68 88 b4 05 08       	push   $0x805b488
 80498b5:	a3 94 b4 05 08       	mov    %eax,0x805b494
 80498ba:	40                   	inc    %eax
 80498bb:	50                   	push   %eax
 80498bc:	e8 df fb ff ff       	call   0x80494a0
 80498c1:	a3 8c b4 05 08       	mov    %eax,0x805b48c
 80498c6:	83 c4 08             	add    $0x8,%esp
 80498c9:	85 c0                	test   %eax,%eax
 80498cb:	75 53                	jne    0x8049920
 80498cd:	6a 00                	push   $0x0
 80498cf:	8b 15 18 b3 05 08    	mov    0x805b318,%edx
 80498d5:	85 d2                	test   %edx,%edx
 80498d7:	74 0d                	je     0x80498e6
 80498d9:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 80498de:	39 05 1c b3 05 08    	cmp    %eax,0x805b31c
 80498e4:	74 23                	je     0x8049909
 80498e6:	6a 05                	push   $0x5
 80498e8:	68 ad 81 05 08       	push   $0x80581ad
 80498ed:	6a 00                	push   $0x0
 80498ef:	e8 c8 f8 ff ff       	call   0x80491bc
 80498f4:	83 c4 0c             	add    $0xc,%esp
 80498f7:	89 c2                	mov    %eax,%edx
 80498f9:	89 15 18 b3 05 08    	mov    %edx,0x805b318
 80498ff:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049904:	a3 1c b3 05 08       	mov    %eax,0x805b31c
 8049909:	52                   	push   %edx
 804990a:	e8 41 fa ff ff       	call   0x8049350
 804990f:	90                   	nop    
 8049910:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8049913:	89 3d 90 b4 05 08    	mov    %edi,0x805b490
 8049919:	e9 5a ff ff ff       	jmp    0x8049878
 804991e:	89 f6                	mov    %esi,%esi
 8049920:	a1 90 b4 05 08       	mov    0x805b490,%eax
 8049925:	03 05 8c b4 05 08    	add    0x805b48c,%eax
 804992b:	2b 45 08             	sub    0x8(%ebp),%eax
 804992e:	a3 9c b4 05 08       	mov    %eax,0x805b49c
 8049933:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049936:	51                   	push   %ecx
 8049937:	8b 1d 88 b4 05 08    	mov    0x805b488,%ebx
 804993d:	01 5d f0             	add    %ebx,0xfffffff0(%ebp)
 8049940:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8049943:	57                   	push   %edi
 8049944:	50                   	push   %eax
 8049945:	e8 e2 f6 ff ff       	call   0x804902c
 804994a:	8b 0d 90 b4 05 08    	mov    0x805b490,%ecx
 8049950:	89 4d c4             	mov    %ecx,0xffffffc4(%ebp)
 8049953:	8b 1d 94 b4 05 08    	mov    0x805b494,%ebx
 8049959:	29 cb                	sub    %ecx,%ebx
 804995b:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 804995e:	83 c4 0c             	add    $0xc,%esp
 8049961:	83 3d b0 b4 05 08 00 	cmpl   $0x0,0x805b4b0
 8049968:	0f 84 e8 00 00 00    	je     0x8049a56
 804996e:	89 de                	mov    %ebx,%esi
 8049970:	89 5d d0             	mov    %ebx,0xffffffd0(%ebp)
 8049973:	c7 45 d4 00 00 00 00 	movl   $0x0,0xffffffd4(%ebp)
 804997a:	8b 0d a8 b4 05 08    	mov    0x805b4a8,%ecx
 8049980:	8b 1d ac b4 05 08    	mov    0x805b4ac,%ebx
 8049986:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8049989:	89 4d d8             	mov    %ecx,0xffffffd8(%ebp)
 804998c:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 804998f:	8b 47 30             	mov    0x30(%edi),%eax
 8049992:	8b 57 34             	mov    0x34(%edi),%edx
 8049995:	29 c8                	sub    %ecx,%eax
 8049997:	19 da                	sbb    %ebx,%edx
 8049999:	39 55 d4             	cmp    %edx,0xffffffd4(%ebp)
 804999c:	7f 07                	jg     0x80499a5
 804999e:	75 1e                	jne    0x80499be
 80499a0:	39 45 d0             	cmp    %eax,0xffffffd0(%ebp)
 80499a3:	76 19                	jbe    0x80499be
 80499a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80499a8:	a1 a8 b4 05 08       	mov    0x805b4a8,%eax
 80499ad:	8b 71 30             	mov    0x30(%ecx),%esi
 80499b0:	29 c6                	sub    %eax,%esi
 80499b2:	89 f0                	mov    %esi,%eax
 80499b4:	31 d2                	xor    %edx,%edx
 80499b6:	f7 35 a4 b4 05 08    	div    0x805b4a4,%eax
 80499bc:	29 d6                	sub    %edx,%esi
 80499be:	85 f6                	test   %esi,%esi
 80499c0:	74 32                	je     0x80499f4
 80499c2:	8b 4d d8             	mov    0xffffffd8(%ebp),%ecx
 80499c5:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80499c8:	53                   	push   %ebx
 80499c9:	51                   	push   %ecx
 80499ca:	a1 98 b4 05 08       	mov    0x805b498,%eax
 80499cf:	50                   	push   %eax
 80499d0:	6a 12                	push   $0x12
 80499d2:	6a 03                	push   $0x3
 80499d4:	56                   	push   %esi
 80499d5:	8b 1d 8c b4 05 08    	mov    0x805b48c,%ebx
 80499db:	01 5d c4             	add    %ebx,0xffffffc4(%ebp)
 80499de:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 80499e1:	57                   	push   %edi
 80499e2:	e8 b5 f5 ff ff       	call   0x8048f9c
 80499e7:	83 c4 1c             	add    $0x1c,%esp
 80499ea:	83 f8 ff             	cmp    $0xffffffff,%eax
 80499ed:	74 05                	je     0x80499f4
 80499ef:	89 75 fc             	mov    %esi,0xfffffffc(%ebp)
 80499f2:	eb 62                	jmp    0x8049a56
 80499f4:	c7 05 b0 b4 05 08 00 	movl   $0x0,0x805b4b0
 80499fb:	00 00 00 
 80499fe:	a1 b4 b4 05 08       	mov    0x805b4b4,%eax
 8049a03:	39 05 a8 b4 05 08    	cmp    %eax,0x805b4a8
 8049a09:	75 0d                	jne    0x8049a18
 8049a0b:	a1 b8 b4 05 08       	mov    0x805b4b8,%eax
 8049a10:	39 05 ac b4 05 08    	cmp    %eax,0x805b4ac
 8049a16:	74 3e                	je     0x8049a56
 8049a18:	6a 00                	push   $0x0
 8049a1a:	8b 0d a8 b4 05 08    	mov    0x805b4a8,%ecx
 8049a20:	8b 1d ac b4 05 08    	mov    0x805b4ac,%ebx
 8049a26:	53                   	push   %ebx
 8049a27:	51                   	push   %ecx
 8049a28:	a1 98 b4 05 08       	mov    0x805b498,%eax
 8049a2d:	50                   	push   %eax
 8049a2e:	e8 79 f6 ff ff       	call   0x80490ac
 8049a33:	83 c4 10             	add    $0x10,%esp
 8049a36:	85 d2                	test   %edx,%edx
 8049a38:	7d 1c                	jge    0x8049a56
 8049a3a:	e8 9d f5 ff ff       	call   0x8048fdc
 8049a3f:	8b 00                	mov    (%eax),%eax
 8049a41:	50                   	push   %eax
 8049a42:	68 c4 81 05 08       	push   $0x80581c4
 8049a47:	e8 a4 f8 ff ff       	call   0x80492f0
 8049a4c:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 8049a53:	83 c4 08             	add    $0x8,%esp
 8049a56:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8049a5a:	75 47                	jne    0x8049aa3
 8049a5c:	eb 0c                	jmp    0x8049a6a
 8049a5e:	89 f6                	mov    %esi,%esi
 8049a60:	e8 77 f5 ff ff       	call   0x8048fdc
 8049a65:	83 38 04             	cmpl   $0x4,(%eax)
 8049a68:	75 24                	jne    0x8049a8e
 8049a6a:	8b 5d f4             	mov    0xfffffff4(%ebp),%ebx
 8049a6d:	53                   	push   %ebx
 8049a6e:	a1 90 b4 05 08       	mov    0x805b490,%eax
 8049a73:	03 05 8c b4 05 08    	add    0x805b48c,%eax
 8049a79:	50                   	push   %eax
 8049a7a:	a1 98 b4 05 08       	mov    0x805b498,%eax
 8049a7f:	50                   	push   %eax
 8049a80:	e8 97 f7 ff ff       	call   0x804921c
 8049a85:	89 c6                	mov    %eax,%esi
 8049a87:	83 c4 0c             	add    $0xc,%esp
 8049a8a:	85 f6                	test   %esi,%esi
 8049a8c:	7c d2                	jl     0x8049a60
 8049a8e:	85 f6                	test   %esi,%esi
 8049a90:	7d 0e                	jge    0x8049aa0
 8049a92:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 8049a99:	eb 08                	jmp    0x8049aa3
 8049a9b:	90                   	nop    
 8049a9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049aa0:	89 75 fc             	mov    %esi,0xfffffffc(%ebp)
 8049aa3:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 8049aa6:	01 3d a8 b4 05 08    	add    %edi,0x805b4a8
 8049aac:	83 15 ac b4 05 08 00 	adcl   $0x0,0x805b4ac
 8049ab3:	a1 90 b4 05 08       	mov    0x805b490,%eax
 8049ab8:	03 05 8c b4 05 08    	add    0x805b48c,%eax
 8049abe:	01 f8                	add    %edi,%eax
 8049ac0:	a3 a0 b4 05 08       	mov    %eax,0x805b4a0
 8049ac5:	8d 65 b8             	lea    0xffffffb8(%ebp),%esp
 8049ac8:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8049acb:	5b                   	pop    %ebx
 8049acc:	5e                   	pop    %esi
 8049acd:	5f                   	pop    %edi
 8049ace:	89 ec                	mov    %ebp,%esp
 8049ad0:	5d                   	pop    %ebp
 8049ad1:	c3                   	ret    
 8049ad2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8049ae0:	55                   	push   %ebp
 8049ae1:	89 e5                	mov    %esp,%ebp
 8049ae3:	53                   	push   %ebx
 8049ae4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049ae7:	8b 15 f8 b4 05 08    	mov    0x805b4f8,%edx
 8049aed:	eb 10                	jmp    0x8049aff
 8049aef:	90                   	nop    
 8049af0:	83 05 00 b5 05 08 01 	addl   $0x1,0x805b500
 8049af7:	83 15 04 b5 05 08 00 	adcl   $0x0,0x805b504
 8049afe:	42                   	inc    %edx
 8049aff:	89 d8                	mov    %ebx,%eax
 8049b01:	29 d0                	sub    %edx,%eax
 8049b03:	50                   	push   %eax
 8049b04:	31 c0                	xor    %eax,%eax
 8049b06:	a0 2c be 05 08       	mov    0x805be2c,%al
 8049b0b:	50                   	push   %eax
 8049b0c:	52                   	push   %edx
 8049b0d:	e8 da f4 ff ff       	call   0x8048fec
 8049b12:	89 c2                	mov    %eax,%edx
 8049b14:	83 c4 0c             	add    $0xc,%esp
 8049b17:	85 d2                	test   %edx,%edx
 8049b19:	75 d5                	jne    0x8049af0
 8049b1b:	89 1d f8 b4 05 08    	mov    %ebx,0x805b4f8
 8049b21:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8049b24:	89 ec                	mov    %ebp,%esp
 8049b26:	5d                   	pop    %ebp
 8049b27:	c3                   	ret    
 8049b28:	90                   	nop    
 8049b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049b30:	55                   	push   %ebp
 8049b31:	89 e5                	mov    %esp,%ebp
 8049b33:	83 ec 40             	sub    $0x40,%esp
 8049b36:	57                   	push   %edi
 8049b37:	56                   	push   %esi
 8049b38:	8d 7d ff             	lea    0xffffffff(%ebp),%edi
 8049b3b:	53                   	push   %ebx
 8049b3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049b3f:	8b 75 0c             	mov    0xc(%ebp),%esi
 8049b42:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b45:	88 45 ff             	mov    %al,0xffffffff(%ebp)
 8049b48:	6a 00                	push   $0x0
 8049b4a:	6a 0a                	push   $0xa
 8049b4c:	4f                   	dec    %edi
 8049b4d:	56                   	push   %esi
 8049b4e:	53                   	push   %ebx
 8049b4f:	e8 ec e1 00 00       	call   0x8057d40
 8049b54:	83 c4 10             	add    $0x10,%esp
 8049b57:	04 30                	add    $0x30,%al
 8049b59:	88 07                	mov    %al,(%edi)
 8049b5b:	6a 00                	push   $0x0
 8049b5d:	6a 0a                	push   $0xa
 8049b5f:	56                   	push   %esi
 8049b60:	53                   	push   %ebx
 8049b61:	e8 1a e0 00 00       	call   0x8057b80
 8049b66:	83 c4 10             	add    $0x10,%esp
 8049b69:	89 c3                	mov    %eax,%ebx
 8049b6b:	89 d6                	mov    %edx,%esi
 8049b6d:	89 d8                	mov    %ebx,%eax
 8049b6f:	09 f0                	or     %esi,%eax
 8049b71:	75 d5                	jne    0x8049b48
 8049b73:	a1 c4 b2 05 08       	mov    0x805b2c4,%eax
 8049b78:	50                   	push   %eax
 8049b79:	89 e8                	mov    %ebp,%eax
 8049b7b:	29 f8                	sub    %edi,%eax
 8049b7d:	50                   	push   %eax
 8049b7e:	6a 01                	push   $0x1
 8049b80:	57                   	push   %edi
 8049b81:	e8 86 f6 ff ff       	call   0x804920c
 8049b86:	8d 65 b4             	lea    0xffffffb4(%ebp),%esp
 8049b89:	5b                   	pop    %ebx
 8049b8a:	5e                   	pop    %esi
 8049b8b:	5f                   	pop    %edi
 8049b8c:	89 ec                	mov    %ebp,%esp
 8049b8e:	5d                   	pop    %ebp
 8049b8f:	c3                   	ret    
 8049b90:	55                   	push   %ebp
 8049b91:	89 e5                	mov    %esp,%ebp
 8049b93:	57                   	push   %edi
 8049b94:	56                   	push   %esi
 8049b95:	53                   	push   %ebx
 8049b96:	8b 75 08             	mov    0x8(%ebp),%esi
 8049b99:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8049b9c:	83 3d cc b4 05 08 00 	cmpl   $0x0,0x805b4cc
 8049ba3:	74 1d                	je     0x8049bc2
 8049ba5:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ba8:	23 05 c0 b4 05 08    	and    0x805b4c0,%eax
 8049bae:	50                   	push   %eax
 8049baf:	a1 74 b4 05 08       	mov    0x805b474,%eax
 8049bb4:	50                   	push   %eax
 8049bb5:	68 ca 81 05 08       	push   $0x80581ca
 8049bba:	e8 4d f5 ff ff       	call   0x804910c
 8049bbf:	83 c4 0c             	add    $0xc,%esp
 8049bc2:	83 3d d0 b4 05 08 00 	cmpl   $0x0,0x805b4d0
 8049bc9:	74 34                	je     0x8049bff
 8049bcb:	56                   	push   %esi
 8049bcc:	e8 0f ff ff ff       	call   0x8049ae0
 8049bd1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049bd4:	51                   	push   %ecx
 8049bd5:	83 05 00 b5 05 08 01 	addl   $0x1,0x805b500
 8049bdc:	83 15 04 b5 05 08 00 	adcl   $0x0,0x805b504
 8049be3:	8b 0d 00 b5 05 08    	mov    0x805b500,%ecx
 8049be9:	8b 1d 04 b5 05 08    	mov    0x805b504,%ebx
 8049bef:	53                   	push   %ebx
 8049bf0:	51                   	push   %ecx
 8049bf1:	e8 3a ff ff ff       	call   0x8049b30
 8049bf6:	89 3d f8 b4 05 08    	mov    %edi,0x805b4f8
 8049bfc:	83 c4 10             	add    $0x10,%esp
 8049bff:	83 3d d4 b4 05 08 00 	cmpl   $0x0,0x805b4d4
 8049c06:	74 23                	je     0x8049c2b
 8049c08:	89 f0                	mov    %esi,%eax
 8049c0a:	2b 05 9c b4 05 08    	sub    0x805b49c,%eax
 8049c10:	99                   	cltd   
 8049c11:	03 05 f0 b4 05 08    	add    0x805b4f0,%eax
 8049c17:	13 15 f4 b4 05 08    	adc    0x805b4f4,%edx
 8049c1d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8049c20:	53                   	push   %ebx
 8049c21:	52                   	push   %edx
 8049c22:	50                   	push   %eax
 8049c23:	e8 08 ff ff ff       	call   0x8049b30
 8049c28:	83 c4 0c             	add    $0xc,%esp
 8049c2b:	a1 c4 b2 05 08       	mov    0x805b2c4,%eax
 8049c30:	50                   	push   %eax
 8049c31:	89 f8                	mov    %edi,%eax
 8049c33:	29 f0                	sub    %esi,%eax
 8049c35:	50                   	push   %eax
 8049c36:	6a 01                	push   $0x1
 8049c38:	56                   	push   %esi
 8049c39:	e8 ce f5 ff ff       	call   0x804920c
 8049c3e:	a1 c4 b2 05 08       	mov    0x805b2c4,%eax
 8049c43:	50                   	push   %eax
 8049c44:	e8 b3 f2 ff ff       	call   0x8048efc
 8049c49:	83 c4 14             	add    $0x14,%esp
 8049c4c:	85 c0                	test   %eax,%eax
 8049c4e:	74 48                	je     0x8049c98
 8049c50:	e8 87 f3 ff ff       	call   0x8048fdc
 8049c55:	8b 00                	mov    (%eax),%eax
 8049c57:	50                   	push   %eax
 8049c58:	8b 15 20 b3 05 08    	mov    0x805b320,%edx
 8049c5e:	85 d2                	test   %edx,%edx
 8049c60:	74 0d                	je     0x8049c6f
 8049c62:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049c67:	39 05 24 b3 05 08    	cmp    %eax,0x805b324
 8049c6d:	74 23                	je     0x8049c92
 8049c6f:	6a 05                	push   $0x5
 8049c71:	68 cf 81 05 08       	push   $0x80581cf
 8049c76:	6a 00                	push   $0x0
 8049c78:	e8 3f f5 ff ff       	call   0x80491bc
 8049c7d:	83 c4 0c             	add    $0xc,%esp
 8049c80:	89 c2                	mov    %eax,%edx
 8049c82:	89 15 20 b3 05 08    	mov    %edx,0x805b320
 8049c88:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8049c8d:	a3 24 b3 05 08       	mov    %eax,0x805b324
 8049c92:	52                   	push   %edx
 8049c93:	e8 58 f6 ff ff       	call   0x80492f0
 8049c98:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8049c9b:	89 3d fc b4 05 08    	mov    %edi,0x805b4fc
 8049ca1:	5b                   	pop    %ebx
 8049ca2:	5e                   	pop    %esi
 8049ca3:	5f                   	pop    %edi
 8049ca4:	89 ec                	mov    %ebp,%esp
 8049ca6:	5d                   	pop    %ebp
 8049ca7:	c3                   	ret    
 8049ca8:	90                   	nop    
 8049ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049cb0:	55                   	push   %ebp
 8049cb1:	89 e5                	mov    %esp,%ebp
 8049cb3:	53                   	push   %ebx
 8049cb4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049cb7:	83 3d fc b4 05 08 00 	cmpl   $0x0,0x805b4fc
 8049cbe:	75 53                	jne    0x8049d13
 8049cc0:	a1 9c b4 05 08       	mov    0x805b49c,%eax
 8049cc5:	a3 fc b4 05 08       	mov    %eax,0x805b4fc
 8049cca:	eb 47                	jmp    0x8049d13
 8049ccc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049cd0:	8b 15 fc b4 05 08    	mov    0x805b4fc,%edx
 8049cd6:	39 da                	cmp    %ebx,%edx
 8049cd8:	73 42                	jae    0x8049d1c
 8049cda:	48                   	dec    %eax
 8049cdb:	a3 08 b5 05 08       	mov    %eax,0x805b508
 8049ce0:	89 d8                	mov    %ebx,%eax
 8049ce2:	29 d0                	sub    %edx,%eax
 8049ce4:	50                   	push   %eax
 8049ce5:	31 c0                	xor    %eax,%eax
 8049ce7:	a0 2c be 05 08       	mov    0x805be2c,%al
 8049cec:	50                   	push   %eax
 8049ced:	52                   	push   %edx
 8049cee:	e8 f9 f2 ff ff       	call   0x8048fec
 8049cf3:	83 c4 0c             	add    $0xc,%esp
 8049cf6:	85 c0                	test   %eax,%eax
 8049cf8:	74 06                	je     0x8049d00
 8049cfa:	40                   	inc    %eax
 8049cfb:	eb 05                	jmp    0x8049d02
 8049cfd:	8d 76 00             	lea    0x0(%esi),%esi
 8049d00:	89 d8                	mov    %ebx,%eax
 8049d02:	6a 2d                	push   $0x2d
 8049d04:	50                   	push   %eax
 8049d05:	a1 fc b4 05 08       	mov    0x805b4fc,%eax
 8049d0a:	50                   	push   %eax
 8049d0b:	e8 80 fe ff ff       	call   0x8049b90
 8049d10:	83 c4 0c             	add    $0xc,%esp
 8049d13:	a1 08 b5 05 08       	mov    0x805b508,%eax
 8049d18:	85 c0                	test   %eax,%eax
 8049d1a:	7f b4                	jg     0x8049cd0
 8049d1c:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8049d1f:	89 ec                	mov    %ebp,%esp
 8049d21:	5d                   	pop    %ebp
 8049d22:	c3                   	ret    
 8049d23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8049d30:	55                   	push   %ebp
 8049d31:	89 e5                	mov    %esp,%ebp
 8049d33:	83 ec 08             	sub    $0x8,%esp
 8049d36:	57                   	push   %edi
 8049d37:	56                   	push   %esi
 8049d38:	53                   	push   %ebx
 8049d39:	8a 0d 2c be 05 08    	mov    0x805be2c,%cl
 8049d3f:	88 4d ff             	mov    %cl,0xffffffff(%ebp)
 8049d42:	a1 c4 b4 05 08       	mov    0x805b4c4,%eax
 8049d47:	85 c0                	test   %eax,%eax
 8049d49:	75 1a                	jne    0x8049d65
 8049d4b:	83 3d 08 b5 05 08 00 	cmpl   $0x0,0x805b508
 8049d52:	7e 11                	jle    0x8049d65
 8049d54:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049d57:	51                   	push   %ecx
 8049d58:	e8 53 ff ff ff       	call   0x8049cb0
 8049d5d:	83 c4 04             	add    $0x4,%esp
 8049d60:	a1 c4 b4 05 08       	mov    0x805b4c4,%eax
 8049d65:	8b 75 08             	mov    0x8(%ebp),%esi
 8049d68:	85 c0                	test   %eax,%eax
 8049d6a:	0f 85 97 00 00 00    	jne    0x8049e07
 8049d70:	8b 1d fc b4 05 08    	mov    0x805b4fc,%ebx
 8049d76:	89 da                	mov    %ebx,%edx
 8049d78:	85 db                	test   %ebx,%ebx
 8049d7a:	75 06                	jne    0x8049d82
 8049d7c:	8b 15 9c b4 05 08    	mov    0x805b49c,%edx
 8049d82:	31 c0                	xor    %eax,%eax
 8049d84:	8b 0d d8 b4 05 08    	mov    0x805b4d8,%ecx
 8049d8a:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 8049d8d:	39 c8                	cmp    %ecx,%eax
 8049d8f:	7d 21                	jge    0x8049db2
 8049d91:	89 cf                	mov    %ecx,%edi
 8049d93:	39 d6                	cmp    %edx,%esi
 8049d95:	76 16                	jbe    0x8049dad
 8049d97:	eb 0f                	jmp    0x8049da8
 8049d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049da0:	8a 4d ff             	mov    0xffffffff(%ebp),%cl
 8049da3:	38 4e ff             	cmp    %cl,0xffffffff(%esi)
 8049da6:	74 05                	je     0x8049dad
 8049da8:	4e                   	dec    %esi
 8049da9:	39 d6                	cmp    %edx,%esi
 8049dab:	77 f3                	ja     0x8049da0
 8049dad:	40                   	inc    %eax
 8049dae:	39 f8                	cmp    %edi,%eax
 8049db0:	7c e1                	jl     0x8049d93
 8049db2:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 8049db6:	75 09                	jne    0x8049dc1
 8049db8:	83 3d dc b4 05 08 00 	cmpl   $0x0,0x805b4dc
 8049dbf:	74 1a                	je     0x8049ddb
 8049dc1:	83 3d 28 b3 05 08 00 	cmpl   $0x0,0x805b328
 8049dc8:	74 11                	je     0x8049ddb
 8049dca:	39 de                	cmp    %ebx,%esi
 8049dcc:	74 0d                	je     0x8049ddb
 8049dce:	68 de 81 05 08       	push   $0x80581de
 8049dd3:	e8 24 f2 ff ff       	call   0x8048ffc
 8049dd8:	83 c4 04             	add    $0x4,%esp
 8049ddb:	3b 75 08             	cmp    0x8(%ebp),%esi
 8049dde:	73 27                	jae    0x8049e07
 8049de0:	0f be 7d ff          	movsbl 0xffffffff(%ebp),%edi
 8049de4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049de7:	29 f0                	sub    %esi,%eax
 8049de9:	50                   	push   %eax
 8049dea:	57                   	push   %edi
 8049deb:	56                   	push   %esi
 8049dec:	e8 fb f1 ff ff       	call   0x8048fec
 8049df1:	89 c3                	mov    %eax,%ebx
 8049df3:	6a 2d                	push   $0x2d
 8049df5:	43                   	inc    %ebx
 8049df6:	53                   	push   %ebx
 8049df7:	56                   	push   %esi
 8049df8:	e8 93 fd ff ff       	call   0x8049b90
 8049dfd:	89 de                	mov    %ebx,%esi
 8049dff:	83 c4 18             	add    $0x18,%esp
 8049e02:	3b 75 08             	cmp    0x8(%ebp),%esi
 8049e05:	72 dd                	jb     0x8049de4
 8049e07:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049e0b:	74 4b                	je     0x8049e58
 8049e0d:	31 ff                	xor    %edi,%edi
 8049e0f:	3b 75 0c             	cmp    0xc(%ebp),%esi
 8049e12:	73 3d                	jae    0x8049e51
 8049e14:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049e17:	29 f0                	sub    %esi,%eax
 8049e19:	50                   	push   %eax
 8049e1a:	0f be 45 ff          	movsbl 0xffffffff(%ebp),%eax
 8049e1e:	50                   	push   %eax
 8049e1f:	56                   	push   %esi
 8049e20:	e8 c7 f1 ff ff       	call   0x8048fec
 8049e25:	89 c3                	mov    %eax,%ebx
 8049e27:	83 c4 0c             	add    $0xc,%esp
 8049e2a:	85 db                	test   %ebx,%ebx
 8049e2c:	74 03                	je     0x8049e31
 8049e2e:	43                   	inc    %ebx
 8049e2f:	eb 03                	jmp    0x8049e34
 8049e31:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049e34:	83 3d c4 b4 05 08 00 	cmpl   $0x0,0x805b4c4
 8049e3b:	75 0c                	jne    0x8049e49
 8049e3d:	6a 3a                	push   $0x3a
 8049e3f:	53                   	push   %ebx
 8049e40:	56                   	push   %esi
 8049e41:	e8 4a fd ff ff       	call   0x8049b90
 8049e46:	83 c4 0c             	add    $0xc,%esp
 8049e49:	89 de                	mov    %ebx,%esi
 8049e4b:	47                   	inc    %edi
 8049e4c:	3b 75 0c             	cmp    0xc(%ebp),%esi
 8049e4f:	72 c3                	jb     0x8049e14
 8049e51:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049e54:	89 39                	mov    %edi,(%ecx)
 8049e56:	eb 18                	jmp    0x8049e70
 8049e58:	83 3d c4 b4 05 08 00 	cmpl   $0x0,0x805b4c4
 8049e5f:	75 1f                	jne    0x8049e80
 8049e61:	6a 3a                	push   $0x3a
 8049e63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8049e66:	51                   	push   %ecx
 8049e67:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049e6a:	51                   	push   %ecx
 8049e6b:	e8 20 fd ff ff       	call   0x8049b90
 8049e70:	83 3d c4 b4 05 08 00 	cmpl   $0x0,0x805b4c4
 8049e77:	75 07                	jne    0x8049e80
 8049e79:	a1 dc b4 05 08       	mov    0x805b4dc,%eax
 8049e7e:	eb 02                	jmp    0x8049e82
 8049e80:	31 c0                	xor    %eax,%eax
 8049e82:	a3 08 b5 05 08       	mov    %eax,0x805b508
 8049e87:	8d 65 ec             	lea    0xffffffec(%ebp),%esp
 8049e8a:	c7 05 28 b3 05 08 01 	movl   $0x1,0x805b328
 8049e91:	00 00 00 
 8049e94:	5b                   	pop    %ebx
 8049e95:	5e                   	pop    %esi
 8049e96:	5f                   	pop    %edi
 8049e97:	89 ec                	mov    %ebp,%esp
 8049e99:	5d                   	pop    %ebp
 8049e9a:	c3                   	ret    
 8049e9b:	90                   	nop    
 8049e9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049ea0:	55                   	push   %ebp
 8049ea1:	89 e5                	mov    %esp,%ebp
 8049ea3:	83 ec 10             	sub    $0x10,%esp
 8049ea6:	57                   	push   %edi
 8049ea7:	56                   	push   %esi
 8049ea8:	31 f6                	xor    %esi,%esi
 8049eaa:	53                   	push   %ebx
 8049eab:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8049eae:	8a 0d 2c be 05 08    	mov    0x805be2c,%cl
 8049eb4:	88 4d f7             	mov    %cl,0xfffffff7(%ebp)
 8049eb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049eba:	8d 4d f8             	lea    0xfffffff8(%ebp),%ecx
 8049ebd:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 8049ec0:	eb 56                	jmp    0x8049f18
 8049ec2:	39 fa                	cmp    %edi,%edx
 8049ec4:	75 12                	jne    0x8049ed8
 8049ec6:	3b 7d 08             	cmp    0x8(%ebp),%edi
 8049ec9:	76 08                	jbe    0x8049ed3
 8049ecb:	8a 4d f7             	mov    0xfffffff7(%ebp),%cl
 8049ece:	38 4f ff             	cmp    %cl,0xffffffff(%edi)
 8049ed1:	74 5f                	je     0x8049f32
 8049ed3:	3b 7d 08             	cmp    0x8(%ebp),%edi
 8049ed6:	74 5a                	je     0x8049f32
 8049ed8:	83 3d c8 b4 05 08 00 	cmpl   $0x0,0x805b4c8
 8049edf:	75 1f                	jne    0x8049f00
 8049ee1:	6a 00                	push   $0x0
 8049ee3:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8049ee6:	50                   	push   %eax
 8049ee7:	52                   	push   %edx
 8049ee8:	e8 43 fe ff ff       	call   0x8049d30
 8049eed:	46                   	inc    %esi
 8049eee:	83 c4 0c             	add    $0xc,%esp
 8049ef1:	83 3d 0c b5 05 08 00 	cmpl   $0x0,0x805b50c
 8049ef8:	74 1b                	je     0x8049f15
 8049efa:	eb 51                	jmp    0x8049f4d
 8049efc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049f00:	39 d3                	cmp    %edx,%ebx
 8049f02:	73 11                	jae    0x8049f15
 8049f04:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8049f07:	50                   	push   %eax
 8049f08:	52                   	push   %edx
 8049f09:	53                   	push   %ebx
 8049f0a:	e8 21 fe ff ff       	call   0x8049d30
 8049f0f:	03 75 fc             	add    0xfffffffc(%ebp),%esi
 8049f12:	83 c4 0c             	add    $0xc,%esp
 8049f15:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 8049f18:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8049f1b:	51                   	push   %ecx
 8049f1c:	89 f8                	mov    %edi,%eax
 8049f1e:	29 d8                	sub    %ebx,%eax
 8049f20:	50                   	push   %eax
 8049f21:	53                   	push   %ebx
 8049f22:	a1 84 b4 05 08       	mov    0x805b484,%eax
 8049f27:	ff d0                	call   *%eax
 8049f29:	89 c2                	mov    %eax,%edx
 8049f2b:	83 c4 0c             	add    $0xc,%esp
 8049f2e:	85 d2                	test   %edx,%edx
 8049f30:	75 90                	jne    0x8049ec2
 8049f32:	83 3d c8 b4 05 08 00 	cmpl   $0x0,0x805b4c8
 8049f39:	74 12                	je     0x8049f4d
 8049f3b:	39 fb                	cmp    %edi,%ebx
 8049f3d:	73 0e                	jae    0x8049f4d
 8049f3f:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8049f42:	50                   	push   %eax
 8049f43:	57                   	push   %edi
 8049f44:	53                   	push   %ebx
 8049f45:	e8 e6 fd ff ff       	call   0x8049d30
 8049f4a:	03 75 fc             	add    0xfffffffc(%ebp),%esi
 8049f4d:	89 f0                	mov    %esi,%eax
 8049f4f:	8d 65 e4             	lea    0xffffffe4(%ebp),%esp
 8049f52:	5b                   	pop    %ebx
 8049f53:	5e                   	pop    %esi
 8049f54:	5f                   	pop    %edi
 8049f55:	89 ec                	mov    %ebp,%esp
 8049f57:	5d                   	pop    %ebp
 8049f58:	c3                   	ret    
 8049f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8049f60:	55                   	push   %ebp
 8049f61:	89 e5                	mov    %esp,%ebp
 8049f63:	83 ec 20             	sub    $0x20,%esp
 8049f66:	57                   	push   %edi
 8049f67:	56                   	push   %esi
 8049f68:	53                   	push   %ebx
 8049f69:	8b 75 08             	mov    0x8(%ebp),%esi
 8049f6c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049f6f:	8a 0d 2c be 05 08    	mov    0x805be2c,%cl
 8049f75:	88 4d f3             	mov    %cl,0xfffffff3(%ebp)
 8049f78:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049f7b:	51                   	push   %ecx
 8049f7c:	53                   	push   %ebx
 8049f7d:	56                   	push   %esi
 8049f7e:	e8 8d f5 ff ff       	call   0x8049510
 8049f83:	83 c4 0c             	add    $0xc,%esp
 8049f86:	85 c0                	test   %eax,%eax
 8049f88:	75 07                	jne    0x8049f91
 8049f8a:	31 c0                	xor    %eax,%eax
 8049f8c:	e9 2a 03 00 00       	jmp    0x804a2bb
 8049f91:	85 db                	test   %ebx,%ebx
 8049f93:	74 4b                	je     0x8049fe0
 8049f95:	83 3d 7c b4 05 08 01 	cmpl   $0x1,0x805b47c
 8049f9c:	75 42                	jne    0x8049fe0
 8049f9e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049fa1:	8b 41 14             	mov    0x14(%ecx),%eax
 8049fa4:	25 00 f0 00 00       	and    $0xf000,%eax
 8049fa9:	3d 00 40 00 00       	cmp    $0x4000,%eax
 8049fae:	75 30                	jne    0x8049fe0
 8049fb0:	56                   	push   %esi
 8049fb1:	e8 b6 ef ff ff       	call   0x8048f6c
 8049fb6:	83 c4 04             	add    $0x4,%esp
 8049fb9:	85 c0                	test   %eax,%eax
 8049fbb:	74 11                	je     0x8049fce
 8049fbd:	e8 1a f0 ff ff       	call   0x8048fdc
 8049fc2:	8b 00                	mov    (%eax),%eax
 8049fc4:	50                   	push   %eax
 8049fc5:	53                   	push   %ebx
 8049fc6:	e8 25 f3 ff ff       	call   0x80492f0
 8049fcb:	83 c4 08             	add    $0x8,%esp
 8049fce:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049fd1:	51                   	push   %ecx
 8049fd2:	53                   	push   %ebx
 8049fd3:	e8 f8 04 00 00       	call   0x804a4d0
 8049fd8:	83 c0 fe             	add    $0xfffffffe,%eax
 8049fdb:	e9 db 02 00 00       	jmp    0x804a2bb
 8049fe0:	c7 05 f0 b4 05 08 00 	movl   $0x0,0x805b4f0
 8049fe7:	00 00 00 
 8049fea:	c7 05 f4 b4 05 08 00 	movl   $0x0,0x805b4f4
 8049ff1:	00 00 00 
 8049ff4:	c7 05 fc b4 05 08 00 	movl   $0x0,0x805b4fc
 8049ffb:	00 00 00 
 8049ffe:	c7 05 00 b5 05 08 00 	movl   $0x0,0x805b500
 804a005:	00 00 00 
 804a008:	c7 05 04 b5 05 08 00 	movl   $0x0,0x805b504
 804a00f:	00 00 00 
 804a012:	c7 05 08 b5 05 08 00 	movl   $0x0,0x805b508
 804a019:	00 00 00 
 804a01c:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804a023:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
 804a02a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804a02d:	51                   	push   %ecx
 804a02e:	31 db                	xor    %ebx,%ebx
 804a030:	6a 00                	push   $0x0
 804a032:	e8 19 f7 ff ff       	call   0x8049750
 804a037:	83 c4 08             	add    $0x8,%esp
 804a03a:	85 c0                	test   %eax,%eax
 804a03c:	75 2a                	jne    0x804a068
 804a03e:	e8 99 ef ff ff       	call   0x8048fdc
 804a043:	8b 00                	mov    (%eax),%eax
 804a045:	83 f8 15             	cmp    $0x15,%eax
 804a048:	75 0d                	jne    0x804a057
 804a04a:	83 3d ec b4 05 08 00 	cmpl   $0x0,0x805b4ec
 804a051:	0f 85 33 ff ff ff    	jne    0x8049f8a
 804a057:	50                   	push   %eax
 804a058:	a1 74 b4 05 08       	mov    0x805b474,%eax
 804a05d:	50                   	push   %eax
 804a05e:	e8 8d f2 ff ff       	call   0x80492f0
 804a063:	e9 22 ff ff ff       	jmp    0x8049f8a
 804a068:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 804a06f:	a1 bc b4 05 08       	mov    0x805b4bc,%eax
 804a074:	0b 05 c4 b4 05 08    	or     0x805b4c4,%eax
 804a07a:	75 32                	jne    0x804a0ae
 804a07c:	8b 15 9c b4 05 08    	mov    0x805b49c,%edx
 804a082:	a1 a0 b4 05 08       	mov    0x805b4a0,%eax
 804a087:	29 d0                	sub    %edx,%eax
 804a089:	50                   	push   %eax
 804a08a:	80 7d f3 00          	cmpb   $0x0,0xfffffff3(%ebp)
 804a08e:	75 07                	jne    0x804a097
 804a090:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
 804a095:	eb 02                	jmp    0x804a099
 804a097:	31 c0                	xor    %eax,%eax
 804a099:	50                   	push   %eax
 804a09a:	52                   	push   %edx
 804a09b:	e8 4c ef ff ff       	call   0x8048fec
 804a0a0:	83 c4 0c             	add    $0xc,%esp
 804a0a3:	85 c0                	test   %eax,%eax
 804a0a5:	74 07                	je     0x804a0ae
 804a0a7:	c7 45 f8 01 00 00 00 	movl   $0x1,0xfffffff8(%ebp)
 804a0ae:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804a0b1:	01 0d 0c b5 05 08    	add    %ecx,0x805b50c
 804a0b7:	01 0d c4 b4 05 08    	add    %ecx,0x805b4c4
 804a0bd:	e9 32 01 00 00       	jmp    0x804a1f4
 804a0c2:	01 da                	add    %ebx,%edx
 804a0c4:	2b 55 f4             	sub    0xfffffff4(%ebp),%edx
 804a0c7:	89 f3                	mov    %esi,%ebx
 804a0c9:	39 d6                	cmp    %edx,%esi
 804a0cb:	76 10                	jbe    0x804a0dd
 804a0cd:	8d 76 00             	lea    0x0(%esi),%esi
 804a0d0:	8a 4d f3             	mov    0xfffffff3(%ebp),%cl
 804a0d3:	38 4b ff             	cmp    %cl,0xffffffff(%ebx)
 804a0d6:	74 05                	je     0x804a0dd
 804a0d8:	4b                   	dec    %ebx
 804a0d9:	39 d3                	cmp    %edx,%ebx
 804a0db:	77 f3                	ja     0x804a0d0
 804a0dd:	29 de                	sub    %ebx,%esi
 804a0df:	89 75 f4             	mov    %esi,0xfffffff4(%ebp)
 804a0e2:	39 da                	cmp    %ebx,%edx
 804a0e4:	73 3b                	jae    0x804a121
 804a0e6:	53                   	push   %ebx
 804a0e7:	52                   	push   %edx
 804a0e8:	e8 b3 fd ff ff       	call   0x8049ea0
 804a0ed:	01 45 fc             	add    %eax,0xfffffffc(%ebp)
 804a0f0:	83 c4 08             	add    $0x8,%esp
 804a0f3:	83 3d 08 b5 05 08 00 	cmpl   $0x0,0x805b508
 804a0fa:	74 09                	je     0x804a105
 804a0fc:	53                   	push   %ebx
 804a0fd:	e8 ae fb ff ff       	call   0x8049cb0
 804a102:	83 c4 04             	add    $0x4,%esp
 804a105:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804a109:	74 16                	je     0x804a121
 804a10b:	83 3d 0c b5 05 08 00 	cmpl   $0x0,0x805b50c
 804a112:	74 0d                	je     0x804a121
 804a114:	83 3d c8 b4 05 08 00 	cmpl   $0x0,0x805b4c8
 804a11b:	0f 84 30 01 00 00    	je     0x804a251
 804a121:	c7 45 e0 00 00 00 00 	movl   $0x0,0xffffffe0(%ebp)
 804a128:	89 da                	mov    %ebx,%edx
 804a12a:	a1 d8 b4 05 08       	mov    0x805b4d8,%eax
 804a12f:	8b 0d fc b4 05 08    	mov    0x805b4fc,%ecx
 804a135:	89 4d e4             	mov    %ecx,0xffffffe4(%ebp)
 804a138:	39 45 e0             	cmp    %eax,0xffffffe0(%ebp)
 804a13b:	7d 3c                	jge    0x804a179
 804a13d:	8b 35 9c b4 05 08    	mov    0x805b49c,%esi
 804a143:	39 f2                	cmp    %esi,%edx
 804a145:	76 32                	jbe    0x804a179
 804a147:	89 4d e8             	mov    %ecx,0xffffffe8(%ebp)
 804a14a:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
 804a14d:	89 f7                	mov    %esi,%edi
 804a14f:	90                   	nop    
 804a150:	3b 55 e8             	cmp    0xffffffe8(%ebp),%edx
 804a153:	74 33                	je     0x804a188
 804a155:	ff 45 e0             	incl   0xffffffe0(%ebp)
 804a158:	89 f0                	mov    %esi,%eax
 804a15a:	eb 0c                	jmp    0x804a168
 804a15c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804a160:	8a 4d f3             	mov    0xfffffff3(%ebp),%cl
 804a163:	38 4a ff             	cmp    %cl,0xffffffff(%edx)
 804a166:	74 05                	je     0x804a16d
 804a168:	4a                   	dec    %edx
 804a169:	39 c2                	cmp    %eax,%edx
 804a16b:	77 f3                	ja     0x804a160
 804a16d:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 804a170:	39 4d e0             	cmp    %ecx,0xffffffe0(%ebp)
 804a173:	7d 04                	jge    0x804a179
 804a175:	39 fa                	cmp    %edi,%edx
 804a177:	77 d7                	ja     0x804a150
 804a179:	3b 55 e4             	cmp    0xffffffe4(%ebp),%edx
 804a17c:	74 0a                	je     0x804a188
 804a17e:	c7 05 fc b4 05 08 00 	movl   $0x0,0x805b4fc
 804a185:	00 00 00 
 804a188:	03 5d f4             	add    0xfffffff4(%ebp),%ebx
 804a18b:	29 d3                	sub    %edx,%ebx
 804a18d:	a1 9c b4 05 08       	mov    0x805b49c,%eax
 804a192:	8b 0d a0 b4 05 08    	mov    0x805b4a0,%ecx
 804a198:	29 c1                	sub    %eax,%ecx
 804a19a:	89 c8                	mov    %ecx,%eax
 804a19c:	29 d8                	sub    %ebx,%eax
 804a19e:	01 05 f0 b4 05 08    	add    %eax,0x805b4f0
 804a1a4:	83 15 f4 b4 05 08 00 	adcl   $0x0,0x805b4f4
 804a1ab:	83 3d d0 b4 05 08 00 	cmpl   $0x0,0x805b4d0
 804a1b2:	74 09                	je     0x804a1bd
 804a1b4:	52                   	push   %edx
 804a1b5:	e8 26 f9 ff ff       	call   0x8049ae0
 804a1ba:	83 c4 04             	add    $0x4,%esp
 804a1bd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804a1c0:	51                   	push   %ecx
 804a1c1:	53                   	push   %ebx
 804a1c2:	e8 89 f5 ff ff       	call   0x8049750
 804a1c7:	83 c4 08             	add    $0x8,%esp
 804a1ca:	85 c0                	test   %eax,%eax
 804a1cc:	75 26                	jne    0x804a1f4
 804a1ce:	e8 09 ee ff ff       	call   0x8048fdc
 804a1d3:	8b 00                	mov    (%eax),%eax
 804a1d5:	83 f8 15             	cmp    $0x15,%eax
 804a1d8:	75 09                	jne    0x804a1e3
 804a1da:	83 3d ec b4 05 08 00 	cmpl   $0x0,0x805b4ec
 804a1e1:	75 6e                	jne    0x804a251
 804a1e3:	50                   	push   %eax
 804a1e4:	a1 74 b4 05 08       	mov    0x805b474,%eax
 804a1e9:	50                   	push   %eax
 804a1ea:	e8 01 f1 ff ff       	call   0x80492f0
 804a1ef:	83 c4 08             	add    $0x8,%esp
 804a1f2:	eb 5d                	jmp    0x804a251
 804a1f4:	8b 15 9c b4 05 08    	mov    0x805b49c,%edx
 804a1fa:	89 15 f8 b4 05 08    	mov    %edx,0x805b4f8
 804a200:	83 3d fc b4 05 08 00 	cmpl   $0x0,0x805b4fc
 804a207:	74 06                	je     0x804a20f
 804a209:	89 15 fc b4 05 08    	mov    %edx,0x805b4fc
 804a20f:	8b 35 a0 b4 05 08    	mov    0x805b4a0,%esi
 804a215:	89 f0                	mov    %esi,%eax
 804a217:	29 d0                	sub    %edx,%eax
 804a219:	39 d8                	cmp    %ebx,%eax
 804a21b:	0f 85 a1 fe ff ff    	jne    0x804a0c2
 804a221:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
 804a225:	74 2a                	je     0x804a251
 804a227:	56                   	push   %esi
 804a228:	8d 04 13             	lea    (%ebx,%edx,1),%eax
 804a22b:	2b 45 f4             	sub    0xfffffff4(%ebp),%eax
 804a22e:	50                   	push   %eax
 804a22f:	e8 6c fc ff ff       	call   0x8049ea0
 804a234:	01 45 fc             	add    %eax,0xfffffffc(%ebp)
 804a237:	83 c4 08             	add    $0x8,%esp
 804a23a:	83 3d 08 b5 05 08 00 	cmpl   $0x0,0x805b508
 804a241:	74 0e                	je     0x804a251
 804a243:	a1 a0 b4 05 08       	mov    0x805b4a0,%eax
 804a248:	50                   	push   %eax
 804a249:	e8 62 fa ff ff       	call   0x8049cb0
 804a24e:	83 c4 04             	add    $0x4,%esp
 804a251:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804a254:	29 0d 0c b5 05 08    	sub    %ecx,0x805b50c
 804a25a:	a1 c4 b4 05 08       	mov    0x805b4c4,%eax
 804a25f:	29 c8                	sub    %ecx,%eax
 804a261:	a3 c4 b4 05 08       	mov    %eax,0x805b4c4
 804a266:	f7 d0                	not    %eax
 804a268:	85 c1                	test   %eax,%ecx
 804a26a:	74 4c                	je     0x804a2b8
 804a26c:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804a270:	74 46                	je     0x804a2b8
 804a272:	a1 74 b4 05 08       	mov    0x805b474,%eax
 804a277:	50                   	push   %eax
 804a278:	8b 15 2c b3 05 08    	mov    0x805b32c,%edx
 804a27e:	85 d2                	test   %edx,%edx
 804a280:	74 0d                	je     0x804a28f
 804a282:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a287:	39 05 30 b3 05 08    	cmp    %eax,0x805b330
 804a28d:	74 23                	je     0x804a2b2
 804a28f:	6a 05                	push   $0x5
 804a291:	68 e1 81 05 08       	push   $0x80581e1
 804a296:	6a 00                	push   $0x0
 804a298:	e8 1f ef ff ff       	call   0x80491bc
 804a29d:	83 c4 0c             	add    $0xc,%esp
 804a2a0:	89 c2                	mov    %eax,%edx
 804a2a2:	89 15 2c b3 05 08    	mov    %edx,0x805b32c
 804a2a8:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a2ad:	a3 30 b3 05 08       	mov    %eax,0x805b330
 804a2b2:	52                   	push   %edx
 804a2b3:	e8 54 ee ff ff       	call   0x804910c
 804a2b8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804a2bb:	8d 65 d4             	lea    0xffffffd4(%ebp),%esp
 804a2be:	5b                   	pop    %ebx
 804a2bf:	5e                   	pop    %esi
 804a2c0:	5f                   	pop    %edi
 804a2c1:	89 ec                	mov    %ebp,%esp
 804a2c3:	5d                   	pop    %ebp
 804a2c4:	c3                   	ret    
 804a2c5:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804a2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804a2d0:	55                   	push   %ebp
 804a2d1:	89 e5                	mov    %esp,%ebp
 804a2d3:	57                   	push   %edi
 804a2d4:	56                   	push   %esi
 804a2d5:	53                   	push   %ebx
 804a2d6:	8b 7d 08             	mov    0x8(%ebp),%edi
 804a2d9:	85 ff                	test   %edi,%edi
 804a2db:	75 51                	jne    0x804a32e
 804a2dd:	31 f6                	xor    %esi,%esi
 804a2df:	8b 15 34 b3 05 08    	mov    0x805b334,%edx
 804a2e5:	85 d2                	test   %edx,%edx
 804a2e7:	74 0d                	je     0x804a2f6
 804a2e9:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a2ee:	39 05 38 b3 05 08    	cmp    %eax,0x805b338
 804a2f4:	74 23                	je     0x804a319
 804a2f6:	6a 05                	push   $0x5
 804a2f8:	68 f9 81 05 08       	push   $0x80581f9
 804a2fd:	6a 00                	push   $0x0
 804a2ff:	e8 b8 ee ff ff       	call   0x80491bc
 804a304:	83 c4 0c             	add    $0xc,%esp
 804a307:	89 c2                	mov    %eax,%edx
 804a309:	89 15 34 b3 05 08    	mov    %edx,0x805b334
 804a30f:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a314:	a3 38 b3 05 08       	mov    %eax,0x805b338
 804a319:	89 15 74 b4 05 08    	mov    %edx,0x805b474
 804a31f:	e9 c9 00 00 00       	jmp    0x804a3ed
 804a324:	e8 b3 ec ff ff       	call   0x8048fdc
 804a329:	83 38 04             	cmpl   $0x4,(%eax)
 804a32c:	75 11                	jne    0x804a33f
 804a32e:	6a 00                	push   $0x0
 804a330:	57                   	push   %edi
 804a331:	e8 f6 ed ff ff       	call   0x804912c
 804a336:	89 c6                	mov    %eax,%esi
 804a338:	83 c4 08             	add    $0x8,%esp
 804a33b:	85 f6                	test   %esi,%esi
 804a33d:	7c e5                	jl     0x804a324
 804a33f:	85 f6                	test   %esi,%esi
 804a341:	0f 8d a0 00 00 00    	jge    0x804a3e7
 804a347:	e8 90 ec ff ff       	call   0x8048fdc
 804a34c:	89 c6                	mov    %eax,%esi
 804a34e:	8b 1e                	mov    (%esi),%ebx
 804a350:	83 fb 15             	cmp    $0x15,%ebx
 804a353:	75 3b                	jne    0x804a390
 804a355:	83 3d 7c b4 05 08 01 	cmpl   $0x1,0x805b47c
 804a35c:	75 32                	jne    0x804a390
 804a35e:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a361:	83 c0 04             	add    $0x4,%eax
 804a364:	50                   	push   %eax
 804a365:	57                   	push   %edi
 804a366:	6a 03                	push   $0x3
 804a368:	e8 5f ec ff ff       	call   0x8048fcc
 804a36d:	83 c4 0c             	add    $0xc,%esp
 804a370:	85 c0                	test   %eax,%eax
 804a372:	74 0c                	je     0x804a380
 804a374:	8b 06                	mov    (%esi),%eax
 804a376:	50                   	push   %eax
 804a377:	eb 66                	jmp    0x804a3df
 804a379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804a380:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a383:	51                   	push   %ecx
 804a384:	57                   	push   %edi
 804a385:	e8 46 01 00 00       	call   0x804a4d0
 804a38a:	e9 30 01 00 00       	jmp    0x804a4bf
 804a38f:	90                   	nop    
 804a390:	83 3d ec b4 05 08 00 	cmpl   $0x0,0x805b4ec
 804a397:	75 13                	jne    0x804a3ac
 804a399:	83 3d 7c b4 05 08 02 	cmpl   $0x2,0x805b47c
 804a3a0:	75 3c                	jne    0x804a3de
 804a3a2:	83 fb 0d             	cmp    $0xd,%ebx
 804a3a5:	74 0f                	je     0x804a3b6
 804a3a7:	83 fb 15             	cmp    $0x15,%ebx
 804a3aa:	75 32                	jne    0x804a3de
 804a3ac:	b8 01 00 00 00       	mov    $0x1,%eax
 804a3b1:	e9 09 01 00 00       	jmp    0x804a4bf
 804a3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a3b9:	83 c0 04             	add    $0x4,%eax
 804a3bc:	50                   	push   %eax
 804a3bd:	57                   	push   %edi
 804a3be:	6a 03                	push   $0x3
 804a3c0:	e8 07 ec ff ff       	call   0x8048fcc
 804a3c5:	83 c4 0c             	add    $0xc,%esp
 804a3c8:	85 c0                	test   %eax,%eax
 804a3ca:	75 12                	jne    0x804a3de
 804a3cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a3cf:	8b 41 14             	mov    0x14(%ecx),%eax
 804a3d2:	25 00 f0 00 00       	and    $0xf000,%eax
 804a3d7:	3d 00 40 00 00       	cmp    $0x4000,%eax
 804a3dc:	74 ce                	je     0x804a3ac
 804a3de:	53                   	push   %ebx
 804a3df:	57                   	push   %edi
 804a3e0:	e8 0b ef ff ff       	call   0x80492f0
 804a3e5:	eb c5                	jmp    0x804a3ac
 804a3e7:	89 3d 74 b4 05 08    	mov    %edi,0x805b474
 804a3ed:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a3f0:	51                   	push   %ecx
 804a3f1:	57                   	push   %edi
 804a3f2:	56                   	push   %esi
 804a3f3:	e8 68 fb ff ff       	call   0x8049f60
 804a3f8:	89 c3                	mov    %eax,%ebx
 804a3fa:	83 c4 0c             	add    $0xc,%esp
 804a3fd:	85 db                	test   %ebx,%ebx
 804a3ff:	7d 1f                	jge    0x804a420
 804a401:	83 c3 02             	add    $0x2,%ebx
 804a404:	e9 b4 00 00 00       	jmp    0x804a4bd
 804a409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804a410:	50                   	push   %eax
 804a411:	57                   	push   %edi
 804a412:	e8 d9 ee ff ff       	call   0x80492f0
 804a417:	e9 a1 00 00 00       	jmp    0x804a4bd
 804a41c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804a420:	83 3d e0 b4 05 08 00 	cmpl   $0x0,0x805b4e0
 804a427:	74 33                	je     0x804a45c
 804a429:	83 3d cc b4 05 08 00 	cmpl   $0x0,0x805b4cc
 804a430:	74 1c                	je     0x804a44e
 804a432:	a1 c0 b4 05 08       	mov    0x805b4c0,%eax
 804a437:	83 e0 3a             	and    $0x3a,%eax
 804a43a:	50                   	push   %eax
 804a43b:	a1 74 b4 05 08       	mov    0x805b474,%eax
 804a440:	50                   	push   %eax
 804a441:	68 ca 81 05 08       	push   $0x80581ca
 804a446:	e8 c1 ec ff ff       	call   0x804910c
 804a44b:	83 c4 0c             	add    $0xc,%esp
 804a44e:	53                   	push   %ebx
 804a44f:	68 0a 82 05 08       	push   $0x805820a
 804a454:	e8 b3 ec ff ff       	call   0x804910c
 804a459:	83 c4 08             	add    $0x8,%esp
 804a45c:	85 db                	test   %ebx,%ebx
 804a45e:	0f 94 c0             	sete   %al
 804a461:	31 db                	xor    %ebx,%ebx
 804a463:	88 c3                	mov    %al,%bl
 804a465:	89 da                	mov    %ebx,%edx
 804a467:	01 da                	add    %ebx,%edx
 804a469:	b8 01 00 00 00       	mov    $0x1,%eax
 804a46e:	29 d0                	sub    %edx,%eax
 804a470:	39 05 e4 b4 05 08    	cmp    %eax,0x805b4e4
 804a476:	75 1c                	jne    0x804a494
 804a478:	a1 c0 b4 05 08       	mov    0x805b4c0,%eax
 804a47d:	83 e0 0a             	and    $0xa,%eax
 804a480:	50                   	push   %eax
 804a481:	a1 74 b4 05 08       	mov    0x805b474,%eax
 804a486:	50                   	push   %eax
 804a487:	68 ca 81 05 08       	push   $0x80581ca
 804a48c:	e8 7b ec ff ff       	call   0x804910c
 804a491:	83 c4 0c             	add    $0xc,%esp
 804a494:	85 ff                	test   %edi,%edi
 804a496:	74 25                	je     0x804a4bd
 804a498:	eb 16                	jmp    0x804a4b0
 804a49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a4a0:	e8 37 eb ff ff       	call   0x8048fdc
 804a4a5:	8b 00                	mov    (%eax),%eax
 804a4a7:	83 f8 04             	cmp    $0x4,%eax
 804a4aa:	0f 85 60 ff ff ff    	jne    0x804a410
 804a4b0:	56                   	push   %esi
 804a4b1:	e8 b6 ea ff ff       	call   0x8048f6c
 804a4b6:	83 c4 04             	add    $0x4,%esp
 804a4b9:	85 c0                	test   %eax,%eax
 804a4bb:	75 e3                	jne    0x804a4a0
 804a4bd:	89 d8                	mov    %ebx,%eax
 804a4bf:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804a4c2:	5b                   	pop    %ebx
 804a4c3:	5e                   	pop    %esi
 804a4c4:	5f                   	pop    %edi
 804a4c5:	89 ec                	mov    %ebp,%esp
 804a4c7:	5d                   	pop    %ebp
 804a4c8:	c3                   	ret    
 804a4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804a4d0:	55                   	push   %ebp
 804a4d1:	89 e5                	mov    %esp,%ebp
 804a4d3:	83 ec 78             	sub    $0x78,%esp
 804a4d6:	57                   	push   %edi
 804a4d7:	56                   	push   %esi
 804a4d8:	53                   	push   %ebx
 804a4d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804a4dc:	c7 45 98 01 00 00 00 	movl   $0x1,0xffffff98(%ebp)
 804a4e3:	8b 13                	mov    (%ebx),%edx
 804a4e5:	85 d2                	test   %edx,%edx
 804a4e7:	0f 84 d3 00 00 00    	je     0x804a5c0
 804a4ed:	8d 76 00             	lea    0x0(%esi),%esi
 804a4f0:	8b 43 10             	mov    0x10(%ebx),%eax
 804a4f3:	39 42 10             	cmp    %eax,0x10(%edx)
 804a4f6:	0f 85 ba 00 00 00    	jne    0x804a5b6
 804a4fc:	8b 43 04             	mov    0x4(%ebx),%eax
 804a4ff:	39 42 04             	cmp    %eax,0x4(%edx)
 804a502:	0f 85 ae 00 00 00    	jne    0x804a5b6
 804a508:	8b 43 08             	mov    0x8(%ebx),%eax
 804a50b:	39 42 08             	cmp    %eax,0x8(%edx)
 804a50e:	0f 85 a2 00 00 00    	jne    0x804a5b6
 804a514:	83 3d ec b4 05 08 00 	cmpl   $0x0,0x805b4ec
 804a51b:	0f 85 8b 00 00 00    	jne    0x804a5ac
 804a521:	8b 15 44 b3 05 08    	mov    0x805b344,%edx
 804a527:	85 d2                	test   %edx,%edx
 804a529:	74 0d                	je     0x804a538
 804a52b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a530:	39 05 48 b3 05 08    	cmp    %eax,0x805b348
 804a536:	74 23                	je     0x804a55b
 804a538:	6a 05                	push   $0x5
 804a53a:	68 23 82 05 08       	push   $0x8058223
 804a53f:	6a 00                	push   $0x0
 804a541:	e8 76 ec ff ff       	call   0x80491bc
 804a546:	83 c4 0c             	add    $0xc,%esp
 804a549:	89 c2                	mov    %eax,%edx
 804a54b:	89 15 44 b3 05 08    	mov    %edx,0x805b344
 804a551:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a556:	a3 48 b3 05 08       	mov    %eax,0x805b348
 804a55b:	52                   	push   %edx
 804a55c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804a55f:	51                   	push   %ecx
 804a560:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804a565:	50                   	push   %eax
 804a566:	8b 15 3c b3 05 08    	mov    0x805b33c,%edx
 804a56c:	85 d2                	test   %edx,%edx
 804a56e:	74 0d                	je     0x804a57d
 804a570:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a575:	39 05 40 b3 05 08    	cmp    %eax,0x805b340
 804a57b:	74 23                	je     0x804a5a0
 804a57d:	6a 05                	push   $0x5
 804a57f:	68 0e 82 05 08       	push   $0x805820e
 804a584:	6a 00                	push   $0x0
 804a586:	e8 31 ec ff ff       	call   0x80491bc
 804a58b:	83 c4 0c             	add    $0xc,%esp
 804a58e:	89 c2                	mov    %eax,%edx
 804a590:	89 15 3c b3 05 08    	mov    %edx,0x805b33c
 804a596:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a59b:	a3 40 b3 05 08       	mov    %eax,0x805b340
 804a5a0:	52                   	push   %edx
 804a5a1:	a1 c8 b2 05 08       	mov    0x805b2c8,%eax
 804a5a6:	50                   	push   %eax
 804a5a7:	e8 d0 e9 ff ff       	call   0x8048f7c
 804a5ac:	b8 01 00 00 00       	mov    $0x1,%eax
 804a5b1:	e9 e3 01 00 00       	jmp    0x804a799
 804a5b6:	8b 12                	mov    (%edx),%edx
 804a5b8:	85 d2                	test   %edx,%edx
 804a5ba:	0f 85 30 ff ff ff    	jne    0x804a4f0
 804a5c0:	8b 43 30             	mov    0x30(%ebx),%eax
 804a5c3:	50                   	push   %eax
 804a5c4:	8b 75 08             	mov    0x8(%ebp),%esi
 804a5c7:	56                   	push   %esi
 804a5c8:	e8 a3 ca 00 00       	call   0x8057070
 804a5cd:	89 45 94             	mov    %eax,0xffffff94(%ebp)
 804a5d0:	83 c4 08             	add    $0x8,%esp
 804a5d3:	85 c0                	test   %eax,%eax
 804a5d5:	75 6b                	jne    0x804a642
 804a5d7:	e8 00 ea ff ff       	call   0x8048fdc
 804a5dc:	8b 00                	mov    (%eax),%eax
 804a5de:	85 c0                	test   %eax,%eax
 804a5e0:	74 1e                	je     0x804a600
 804a5e2:	83 3d ec b4 05 08 00 	cmpl   $0x0,0x805b4ec
 804a5e9:	0f 85 a7 01 00 00    	jne    0x804a796
 804a5ef:	50                   	push   %eax
 804a5f0:	56                   	push   %esi
 804a5f1:	e8 fa ec ff ff       	call   0x80492f0
 804a5f6:	e9 9b 01 00 00       	jmp    0x804a796
 804a5fb:	90                   	nop    
 804a5fc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804a600:	6a 00                	push   $0x0
 804a602:	8b 15 4c b3 05 08    	mov    0x805b34c,%edx
 804a608:	85 d2                	test   %edx,%edx
 804a60a:	74 0d                	je     0x804a619
 804a60c:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a611:	39 05 50 b3 05 08    	cmp    %eax,0x805b350
 804a617:	74 23                	je     0x804a63c
 804a619:	6a 05                	push   $0x5
 804a61b:	68 3c 82 05 08       	push   $0x805823c
 804a620:	6a 00                	push   $0x0
 804a622:	e8 95 eb ff ff       	call   0x80491bc
 804a627:	83 c4 0c             	add    $0xc,%esp
 804a62a:	89 c2                	mov    %eax,%edx
 804a62c:	89 15 4c b3 05 08    	mov    %edx,0x805b34c
 804a632:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a637:	a3 50 b3 05 08       	mov    %eax,0x805b350
 804a63c:	52                   	push   %edx
 804a63d:	e8 0e ed ff ff       	call   0x8049350
 804a642:	8b 45 08             	mov    0x8(%ebp),%eax
 804a645:	89 c1                	mov    %eax,%ecx
 804a647:	8b 75 08             	mov    0x8(%ebp),%esi
 804a64a:	83 e0 03             	and    $0x3,%eax
 804a64d:	74 16                	je     0x804a665
 804a64f:	7a 0f                	jp     0x804a660
 804a651:	83 f8 02             	cmp    $0x2,%eax
 804a654:	74 05                	je     0x804a65b
 804a656:	38 21                	cmp    %ah,(%ecx)
 804a658:	74 2b                	je     0x804a685
 804a65a:	41                   	inc    %ecx
 804a65b:	38 21                	cmp    %ah,(%ecx)
 804a65d:	74 26                	je     0x804a685
 804a65f:	41                   	inc    %ecx
 804a660:	38 21                	cmp    %ah,(%ecx)
 804a662:	74 21                	je     0x804a685
 804a664:	41                   	inc    %ecx
 804a665:	8b 01                	mov    (%ecx),%eax
 804a667:	84 c0                	test   %al,%al
 804a669:	74 1a                	je     0x804a685
 804a66b:	84 e4                	test   %ah,%ah
 804a66d:	74 15                	je     0x804a684
 804a66f:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804a674:	74 0d                	je     0x804a683
 804a676:	83 c1 04             	add    $0x4,%ecx
 804a679:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804a67e:	75 e5                	jne    0x804a665
 804a680:	83 e9 03             	sub    $0x3,%ecx
 804a683:	41                   	inc    %ecx
 804a684:	41                   	inc    %ecx
 804a685:	29 f1                	sub    %esi,%ecx
 804a687:	89 4d 90             	mov    %ecx,0xffffff90(%ebp)
 804a68a:	c7 45 8c 00 00 00 00 	movl   $0x0,0xffffff8c(%ebp)
 804a691:	85 c9                	test   %ecx,%ecx
 804a693:	74 0f                	je     0x804a6a4
 804a695:	80 7c 0e ff 2f       	cmpb   $0x2f,0xffffffff(%esi,%ecx,1)
 804a69a:	0f 95 c0             	setne  %al
 804a69d:	31 c9                	xor    %ecx,%ecx
 804a69f:	88 c1                	mov    %al,%cl
 804a6a1:	89 4d 8c             	mov    %ecx,0xffffff8c(%ebp)
 804a6a4:	31 ff                	xor    %edi,%edi
 804a6a6:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 804a6a9:	89 75 88             	mov    %esi,0xffffff88(%ebp)
 804a6ac:	89 5d 9c             	mov    %ebx,0xffffff9c(%ebp)
 804a6af:	a1 cc b4 05 08       	mov    0x805b4cc,%eax
 804a6b4:	83 3d e8 b4 05 08 00 	cmpl   $0x0,0x805b4e8
 804a6bb:	75 01                	jne    0x804a6be
 804a6bd:	40                   	inc    %eax
 804a6be:	a3 cc b4 05 08       	mov    %eax,0x805b4cc
 804a6c3:	8b 4d 94             	mov    0xffffff94(%ebp),%ecx
 804a6c6:	80 39 00             	cmpb   $0x0,(%ecx)
 804a6c9:	0f 84 9d 00 00 00    	je     0x804a76c
 804a6cf:	90                   	nop    
 804a6d0:	8b 45 88             	mov    0xffffff88(%ebp),%eax
 804a6d3:	89 c3                	mov    %eax,%ebx
 804a6d5:	8b 75 90             	mov    0xffffff90(%ebp),%esi
 804a6d8:	83 e0 03             	and    $0x3,%eax
 804a6db:	74 16                	je     0x804a6f3
 804a6dd:	7a 0f                	jp     0x804a6ee
 804a6df:	83 f8 02             	cmp    $0x2,%eax
 804a6e2:	74 05                	je     0x804a6e9
 804a6e4:	38 23                	cmp    %ah,(%ebx)
 804a6e6:	74 2b                	je     0x804a713
 804a6e8:	43                   	inc    %ebx
 804a6e9:	38 23                	cmp    %ah,(%ebx)
 804a6eb:	74 26                	je     0x804a713
 804a6ed:	43                   	inc    %ebx
 804a6ee:	38 23                	cmp    %ah,(%ebx)
 804a6f0:	74 21                	je     0x804a713
 804a6f2:	43                   	inc    %ebx
 804a6f3:	8b 03                	mov    (%ebx),%eax
 804a6f5:	84 c0                	test   %al,%al
 804a6f7:	74 1a                	je     0x804a713
 804a6f9:	84 e4                	test   %ah,%ah
 804a6fb:	74 15                	je     0x804a712
 804a6fd:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804a702:	74 0d                	je     0x804a711
 804a704:	83 c3 04             	add    $0x4,%ebx
 804a707:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804a70c:	75 e5                	jne    0x804a6f3
 804a70e:	83 eb 03             	sub    $0x3,%ebx
 804a711:	43                   	inc    %ebx
 804a712:	43                   	inc    %ebx
 804a713:	2b 5d 88             	sub    0xffffff88(%ebp),%ebx
 804a716:	43                   	inc    %ebx
 804a717:	8d 44 33 01          	lea    0x1(%ebx,%esi,1),%eax
 804a71b:	50                   	push   %eax
 804a71c:	57                   	push   %edi
 804a71d:	e8 be ec ff ff       	call   0x80493e0
 804a722:	83 c4 08             	add    $0x8,%esp
 804a725:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804a728:	51                   	push   %ecx
 804a729:	89 c7                	mov    %eax,%edi
 804a72b:	57                   	push   %edi
 804a72c:	e8 fb ea ff ff       	call   0x804922c
 804a731:	83 c4 08             	add    $0x8,%esp
 804a734:	c6 04 3e 2f          	movb   $0x2f,(%esi,%edi,1)
 804a738:	8b 75 88             	mov    0xffffff88(%ebp),%esi
 804a73b:	56                   	push   %esi
 804a73c:	8b 4d 90             	mov    0xffffff90(%ebp),%ecx
 804a73f:	8d 04 39             	lea    (%ecx,%edi,1),%eax
 804a742:	03 45 8c             	add    0xffffff8c(%ebp),%eax
 804a745:	50                   	push   %eax
 804a746:	e8 e1 ea ff ff       	call   0x804922c
 804a74b:	83 c4 08             	add    $0x8,%esp
 804a74e:	01 de                	add    %ebx,%esi
 804a750:	89 75 88             	mov    %esi,0xffffff88(%ebp)
 804a753:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
 804a756:	50                   	push   %eax
 804a757:	57                   	push   %edi
 804a758:	e8 73 fb ff ff       	call   0x804a2d0
 804a75d:	21 45 98             	and    %eax,0xffffff98(%ebp)
 804a760:	83 c4 08             	add    $0x8,%esp
 804a763:	80 3e 00             	cmpb   $0x0,(%esi)
 804a766:	0f 85 64 ff ff ff    	jne    0x804a6d0
 804a76c:	a1 cc b4 05 08       	mov    0x805b4cc,%eax
 804a771:	83 3d e8 b4 05 08 00 	cmpl   $0x0,0x805b4e8
 804a778:	75 01                	jne    0x804a77b
 804a77a:	48                   	dec    %eax
 804a77b:	a3 cc b4 05 08       	mov    %eax,0x805b4cc
 804a780:	85 ff                	test   %edi,%edi
 804a782:	74 09                	je     0x804a78d
 804a784:	57                   	push   %edi
 804a785:	e8 62 ea ff ff       	call   0x80491ec
 804a78a:	83 c4 04             	add    $0x4,%esp
 804a78d:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 804a790:	56                   	push   %esi
 804a791:	e8 56 ea ff ff       	call   0x80491ec
 804a796:	8b 45 98             	mov    0xffffff98(%ebp),%eax
 804a799:	8d a5 7c ff ff ff    	lea    0xffffff7c(%ebp),%esp
 804a79f:	5b                   	pop    %ebx
 804a7a0:	5e                   	pop    %esi
 804a7a1:	5f                   	pop    %edi
 804a7a2:	89 ec                	mov    %ebp,%esp
 804a7a4:	5d                   	pop    %ebp
 804a7a5:	c3                   	ret    
 804a7a6:	8d 76 00             	lea    0x0(%esi),%esi
 804a7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804a7b0:	55                   	push   %ebp
 804a7b1:	89 e5                	mov    %esp,%ebp
 804a7b3:	53                   	push   %ebx
 804a7b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804a7b7:	85 db                	test   %ebx,%ebx
 804a7b9:	0f 84 a3 00 00 00    	je     0x804a862
 804a7bf:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804a7c4:	50                   	push   %eax
 804a7c5:	8b 15 54 b3 05 08    	mov    0x805b354,%edx
 804a7cb:	85 d2                	test   %edx,%edx
 804a7cd:	74 0d                	je     0x804a7dc
 804a7cf:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a7d4:	39 05 58 b3 05 08    	cmp    %eax,0x805b358
 804a7da:	74 23                	je     0x804a7ff
 804a7dc:	6a 05                	push   $0x5
 804a7de:	68 60 82 05 08       	push   $0x8058260
 804a7e3:	6a 00                	push   $0x0
 804a7e5:	e8 d2 e9 ff ff       	call   0x80491bc
 804a7ea:	83 c4 0c             	add    $0xc,%esp
 804a7ed:	89 c2                	mov    %eax,%edx
 804a7ef:	89 15 54 b3 05 08    	mov    %edx,0x805b354
 804a7f5:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a7fa:	a3 58 b3 05 08       	mov    %eax,0x805b358
 804a7ff:	52                   	push   %edx
 804a800:	a1 c8 b2 05 08       	mov    0x805b2c8,%eax
 804a805:	50                   	push   %eax
 804a806:	e8 71 e7 ff ff       	call   0x8048f7c
 804a80b:	83 c4 0c             	add    $0xc,%esp
 804a80e:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804a813:	8b 15 5c b3 05 08    	mov    0x805b35c,%edx
 804a819:	50                   	push   %eax
 804a81a:	85 d2                	test   %edx,%edx
 804a81c:	74 0d                	je     0x804a82b
 804a81e:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a823:	39 05 60 b3 05 08    	cmp    %eax,0x805b360
 804a829:	74 23                	je     0x804a84e
 804a82b:	6a 05                	push   $0x5
 804a82d:	68 a0 82 05 08       	push   $0x80582a0
 804a832:	6a 00                	push   $0x0
 804a834:	e8 83 e9 ff ff       	call   0x80491bc
 804a839:	83 c4 0c             	add    $0xc,%esp
 804a83c:	89 c2                	mov    %eax,%edx
 804a83e:	89 15 5c b3 05 08    	mov    %edx,0x805b35c
 804a844:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a849:	a3 60 b3 05 08       	mov    %eax,0x805b360
 804a84e:	52                   	push   %edx
 804a84f:	a1 c8 b2 05 08       	mov    0x805b2c8,%eax
 804a854:	50                   	push   %eax
 804a855:	e8 22 e7 ff ff       	call   0x8048f7c
 804a85a:	83 c4 0c             	add    $0xc,%esp
 804a85d:	e9 24 02 00 00       	jmp    0x804aa86
 804a862:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804a867:	50                   	push   %eax
 804a868:	8b 15 64 b3 05 08    	mov    0x805b364,%edx
 804a86e:	85 d2                	test   %edx,%edx
 804a870:	74 0d                	je     0x804a87f
 804a872:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a877:	39 05 68 b3 05 08    	cmp    %eax,0x805b368
 804a87d:	74 23                	je     0x804a8a2
 804a87f:	6a 05                	push   $0x5
 804a881:	68 e0 82 05 08       	push   $0x80582e0
 804a886:	6a 00                	push   $0x0
 804a888:	e8 2f e9 ff ff       	call   0x80491bc
 804a88d:	83 c4 0c             	add    $0xc,%esp
 804a890:	89 c2                	mov    %eax,%edx
 804a892:	89 15 64 b3 05 08    	mov    %edx,0x805b364
 804a898:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a89d:	a3 68 b3 05 08       	mov    %eax,0x805b368
 804a8a2:	52                   	push   %edx
 804a8a3:	e8 64 e8 ff ff       	call   0x804910c
 804a8a8:	83 c4 08             	add    $0x8,%esp
 804a8ab:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804a8b0:	8b 15 6c b3 05 08    	mov    0x805b36c,%edx
 804a8b6:	50                   	push   %eax
 804a8b7:	85 d2                	test   %edx,%edx
 804a8b9:	74 0d                	je     0x804a8c8
 804a8bb:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a8c0:	39 05 70 b3 05 08    	cmp    %eax,0x805b370
 804a8c6:	74 23                	je     0x804a8eb
 804a8c8:	6a 05                	push   $0x5
 804a8ca:	68 20 83 05 08       	push   $0x8058320
 804a8cf:	6a 00                	push   $0x0
 804a8d1:	e8 e6 e8 ff ff       	call   0x80491bc
 804a8d6:	83 c4 0c             	add    $0xc,%esp
 804a8d9:	89 c2                	mov    %eax,%edx
 804a8db:	89 15 6c b3 05 08    	mov    %edx,0x805b36c
 804a8e1:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a8e6:	a3 70 b3 05 08       	mov    %eax,0x805b370
 804a8eb:	52                   	push   %edx
 804a8ec:	e8 1b e8 ff ff       	call   0x804910c
 804a8f1:	83 c4 08             	add    $0x8,%esp
 804a8f4:	8b 15 74 b3 05 08    	mov    0x805b374,%edx
 804a8fa:	85 d2                	test   %edx,%edx
 804a8fc:	74 0d                	je     0x804a90b
 804a8fe:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a903:	39 05 78 b3 05 08    	cmp    %eax,0x805b378
 804a909:	74 23                	je     0x804a92e
 804a90b:	6a 05                	push   $0x5
 804a90d:	68 c0 83 05 08       	push   $0x80583c0
 804a912:	6a 00                	push   $0x0
 804a914:	e8 a3 e8 ff ff       	call   0x80491bc
 804a919:	83 c4 0c             	add    $0xc,%esp
 804a91c:	89 c2                	mov    %eax,%edx
 804a91e:	89 15 74 b3 05 08    	mov    %edx,0x805b374
 804a924:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a929:	a3 78 b3 05 08       	mov    %eax,0x805b378
 804a92e:	52                   	push   %edx
 804a92f:	e8 d8 e7 ff ff       	call   0x804910c
 804a934:	83 c4 04             	add    $0x4,%esp
 804a937:	8b 15 7c b3 05 08    	mov    0x805b37c,%edx
 804a93d:	85 d2                	test   %edx,%edx
 804a93f:	74 0d                	je     0x804a94e
 804a941:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a946:	39 05 80 b3 05 08    	cmp    %eax,0x805b380
 804a94c:	74 23                	je     0x804a971
 804a94e:	6a 05                	push   $0x5
 804a950:	68 a0 84 05 08       	push   $0x80584a0
 804a955:	6a 00                	push   $0x0
 804a957:	e8 60 e8 ff ff       	call   0x80491bc
 804a95c:	83 c4 0c             	add    $0xc,%esp
 804a95f:	89 c2                	mov    %eax,%edx
 804a961:	89 15 7c b3 05 08    	mov    %edx,0x805b37c
 804a967:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a96c:	a3 80 b3 05 08       	mov    %eax,0x805b380
 804a971:	52                   	push   %edx
 804a972:	e8 95 e7 ff ff       	call   0x804910c
 804a977:	83 c4 04             	add    $0x4,%esp
 804a97a:	8b 15 84 b3 05 08    	mov    0x805b384,%edx
 804a980:	85 d2                	test   %edx,%edx
 804a982:	74 0d                	je     0x804a991
 804a984:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a989:	39 05 88 b3 05 08    	cmp    %eax,0x805b388
 804a98f:	74 23                	je     0x804a9b4
 804a991:	6a 05                	push   $0x5
 804a993:	68 20 86 05 08       	push   $0x8058620
 804a998:	6a 00                	push   $0x0
 804a99a:	e8 1d e8 ff ff       	call   0x80491bc
 804a99f:	83 c4 0c             	add    $0xc,%esp
 804a9a2:	89 c2                	mov    %eax,%edx
 804a9a4:	89 15 84 b3 05 08    	mov    %edx,0x805b384
 804a9aa:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a9af:	a3 88 b3 05 08       	mov    %eax,0x805b388
 804a9b4:	52                   	push   %edx
 804a9b5:	e8 52 e7 ff ff       	call   0x804910c
 804a9ba:	83 c4 04             	add    $0x4,%esp
 804a9bd:	8b 15 8c b3 05 08    	mov    0x805b38c,%edx
 804a9c3:	85 d2                	test   %edx,%edx
 804a9c5:	74 0d                	je     0x804a9d4
 804a9c7:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a9cc:	39 05 90 b3 05 08    	cmp    %eax,0x805b390
 804a9d2:	74 23                	je     0x804a9f7
 804a9d4:	6a 05                	push   $0x5
 804a9d6:	68 60 87 05 08       	push   $0x8058760
 804a9db:	6a 00                	push   $0x0
 804a9dd:	e8 da e7 ff ff       	call   0x80491bc
 804a9e2:	83 c4 0c             	add    $0xc,%esp
 804a9e5:	89 c2                	mov    %eax,%edx
 804a9e7:	89 15 8c b3 05 08    	mov    %edx,0x805b38c
 804a9ed:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804a9f2:	a3 90 b3 05 08       	mov    %eax,0x805b390
 804a9f7:	52                   	push   %edx
 804a9f8:	e8 0f e7 ff ff       	call   0x804910c
 804a9fd:	83 c4 04             	add    $0x4,%esp
 804aa00:	8b 15 94 b3 05 08    	mov    0x805b394,%edx
 804aa06:	85 d2                	test   %edx,%edx
 804aa08:	74 0d                	je     0x804aa17
 804aa0a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aa0f:	39 05 98 b3 05 08    	cmp    %eax,0x805b398
 804aa15:	74 23                	je     0x804aa3a
 804aa17:	6a 05                	push   $0x5
 804aa19:	68 c0 8a 05 08       	push   $0x8058ac0
 804aa1e:	6a 00                	push   $0x0
 804aa20:	e8 97 e7 ff ff       	call   0x80491bc
 804aa25:	83 c4 0c             	add    $0xc,%esp
 804aa28:	89 c2                	mov    %eax,%edx
 804aa2a:	89 15 94 b3 05 08    	mov    %edx,0x805b394
 804aa30:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aa35:	a3 98 b3 05 08       	mov    %eax,0x805b398
 804aa3a:	52                   	push   %edx
 804aa3b:	e8 cc e6 ff ff       	call   0x804910c
 804aa40:	83 c4 04             	add    $0x4,%esp
 804aa43:	8b 15 9c b3 05 08    	mov    0x805b39c,%edx
 804aa49:	85 d2                	test   %edx,%edx
 804aa4b:	74 0d                	je     0x804aa5a
 804aa4d:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aa52:	39 05 a0 b3 05 08    	cmp    %eax,0x805b3a0
 804aa58:	74 23                	je     0x804aa7d
 804aa5a:	6a 05                	push   $0x5
 804aa5c:	68 80 8d 05 08       	push   $0x8058d80
 804aa61:	6a 00                	push   $0x0
 804aa63:	e8 54 e7 ff ff       	call   0x80491bc
 804aa68:	83 c4 0c             	add    $0xc,%esp
 804aa6b:	89 c2                	mov    %eax,%edx
 804aa6d:	89 15 9c b3 05 08    	mov    %edx,0x805b39c
 804aa73:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aa78:	a3 a0 b3 05 08       	mov    %eax,0x805b3a0
 804aa7d:	52                   	push   %edx
 804aa7e:	e8 89 e6 ff ff       	call   0x804910c
 804aa83:	83 c4 04             	add    $0x4,%esp
 804aa86:	53                   	push   %ebx
 804aa87:	e8 40 e7 ff ff       	call   0x80491cc
 804aa8c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804aa90:	55                   	push   %ebp
 804aa91:	89 e5                	mov    %esp,%ebp
 804aa93:	53                   	push   %ebx
 804aa94:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804aa97:	a1 3c be 05 08       	mov    0x805be3c,%eax
 804aa9c:	85 c0                	test   %eax,%eax
 804aa9e:	74 50                	je     0x804aaf0
 804aaa0:	53                   	push   %ebx
 804aaa1:	50                   	push   %eax
 804aaa2:	e8 b5 e4 ff ff       	call   0x8048f5c
 804aaa7:	83 c4 08             	add    $0x8,%esp
 804aaaa:	85 c0                	test   %eax,%eax
 804aaac:	74 42                	je     0x804aaf0
 804aaae:	6a 00                	push   $0x0
 804aab0:	8b 15 a4 b3 05 08    	mov    0x805b3a4,%edx
 804aab6:	85 d2                	test   %edx,%edx
 804aab8:	74 0d                	je     0x804aac7
 804aaba:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aabf:	39 05 a8 b3 05 08    	cmp    %eax,0x805b3a8
 804aac5:	74 23                	je     0x804aaea
 804aac7:	6a 05                	push   $0x5
 804aac9:	68 c0 8d 05 08       	push   $0x8058dc0
 804aace:	6a 00                	push   $0x0
 804aad0:	e8 e7 e6 ff ff       	call   0x80491bc
 804aad5:	83 c4 0c             	add    $0xc,%esp
 804aad8:	89 c2                	mov    %eax,%edx
 804aada:	89 15 a4 b3 05 08    	mov    %edx,0x805b3a4
 804aae0:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aae5:	a3 a8 b3 05 08       	mov    %eax,0x805b3a8
 804aaea:	52                   	push   %edx
 804aaeb:	e8 60 e8 ff ff       	call   0x8049350
 804aaf0:	89 1d 3c be 05 08    	mov    %ebx,0x805be3c
 804aaf6:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804aaf9:	89 ec                	mov    %ebp,%esp
 804aafb:	5d                   	pop    %ebp
 804aafc:	c3                   	ret    
 804aafd:	8d 76 00             	lea    0x0(%esi),%esi
 804ab00:	55                   	push   %ebp
 804ab01:	89 e5                	mov    %esp,%ebp
 804ab03:	57                   	push   %edi
 804ab04:	56                   	push   %esi
 804ab05:	31 f6                	xor    %esi,%esi
 804ab07:	53                   	push   %ebx
 804ab08:	83 3d d0 b0 05 08 00 	cmpl   $0x0,0x805b0d0
 804ab0f:	74 4a                	je     0x804ab5b
 804ab11:	bf d0 b0 05 08       	mov    $0x805b0d0,%edi
 804ab16:	8d 04 76             	lea    (%esi,%esi,2),%eax
 804ab19:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
 804ab20:	8b 04 3b             	mov    (%ebx,%edi,1),%eax
 804ab23:	50                   	push   %eax
 804ab24:	8b 55 08             	mov    0x8(%ebp),%edx
 804ab27:	52                   	push   %edx
 804ab28:	e8 2f e4 ff ff       	call   0x8048f5c
 804ab2d:	83 c4 08             	add    $0x8,%esp
 804ab30:	85 c0                	test   %eax,%eax
 804ab32:	75 1d                	jne    0x804ab51
 804ab34:	8b 83 d4 b0 05 08    	mov    0x805b0d4(%ebx),%eax
 804ab3a:	a3 80 b4 05 08       	mov    %eax,0x805b480
 804ab3f:	8b 83 d8 b0 05 08    	mov    0x805b0d8(%ebx),%eax
 804ab45:	a3 84 b4 05 08       	mov    %eax,0x805b484
 804ab4a:	b8 01 00 00 00       	mov    $0x1,%eax
 804ab4f:	eb 0c                	jmp    0x804ab5d
 804ab51:	46                   	inc    %esi
 804ab52:	8d 04 76             	lea    (%esi,%esi,2),%eax
 804ab55:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
 804ab59:	75 bb                	jne    0x804ab16
 804ab5b:	31 c0                	xor    %eax,%eax
 804ab5d:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804ab60:	5b                   	pop    %ebx
 804ab61:	5e                   	pop    %esi
 804ab62:	5f                   	pop    %edi
 804ab63:	89 ec                	mov    %ebp,%esp
 804ab65:	5d                   	pop    %ebp
 804ab66:	c3                   	ret    
 804ab67:	89 f6                	mov    %esi,%esi
 804ab69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804ab70:	55                   	push   %ebp
 804ab71:	89 e5                	mov    %esp,%ebp
 804ab73:	83 ec 04             	sub    $0x4,%esp
 804ab76:	57                   	push   %edi
 804ab77:	56                   	push   %esi
 804ab78:	53                   	push   %ebx
 804ab79:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804ab7c:	8b 75 0c             	mov    0xc(%ebp),%esi
 804ab7f:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804ab86:	31 c0                	xor    %eax,%eax
 804ab88:	8b 1d d4 b2 05 08    	mov    0x805b2d4,%ebx
 804ab8e:	eb 03                	jmp    0x804ab93
 804ab90:	41                   	inc    %ecx
 804ab91:	31 c0                	xor    %eax,%eax
 804ab93:	8a 01                	mov    (%ecx),%al
 804ab95:	f6 44 43 01 20       	testb  $0x20,0x1(%ebx,%eax,2)
 804ab9a:	75 f4                	jne    0x804ab90
 804ab9c:	8a 19                	mov    (%ecx),%bl
 804ab9e:	84 db                	test   %bl,%bl
 804aba0:	75 05                	jne    0x804aba7
 804aba2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804aba5:	eb 4a                	jmp    0x804abf1
 804aba7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804abab:	74 0b                	je     0x804abb8
 804abad:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 804abb0:	8b 7d 10             	mov    0x10(%ebp),%edi
 804abb3:	89 34 97             	mov    %esi,(%edi,%edx,4)
 804abb6:	8a 19                	mov    (%ecx),%bl
 804abb8:	ff 45 fc             	incl   0xfffffffc(%ebp)
 804abbb:	90                   	nop    
 804abbc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804abc0:	88 1e                	mov    %bl,(%esi)
 804abc2:	41                   	inc    %ecx
 804abc3:	46                   	inc    %esi
 804abc4:	80 fb 5c             	cmp    $0x5c,%bl
 804abc7:	75 0a                	jne    0x804abd3
 804abc9:	8a 01                	mov    (%ecx),%al
 804abcb:	84 c0                	test   %al,%al
 804abcd:	74 1c                	je     0x804abeb
 804abcf:	88 46 ff             	mov    %al,0xffffffff(%esi)
 804abd2:	41                   	inc    %ecx
 804abd3:	8a 01                	mov    (%ecx),%al
 804abd5:	88 c3                	mov    %al,%bl
 804abd7:	84 db                	test   %bl,%bl
 804abd9:	74 10                	je     0x804abeb
 804abdb:	31 d2                	xor    %edx,%edx
 804abdd:	88 c2                	mov    %al,%dl
 804abdf:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804abe4:	f6 44 50 01 20       	testb  $0x20,0x1(%eax,%edx,2)
 804abe9:	74 d5                	je     0x804abc0
 804abeb:	c6 06 00             	movb   $0x0,(%esi)
 804abee:	46                   	inc    %esi
 804abef:	eb 95                	jmp    0x804ab86
 804abf1:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 804abf4:	5b                   	pop    %ebx
 804abf5:	5e                   	pop    %esi
 804abf6:	5f                   	pop    %edi
 804abf7:	89 ec                	mov    %ebp,%esp
 804abf9:	5d                   	pop    %ebp
 804abfa:	c3                   	ret    
 804abfb:	90                   	nop    
 804abfc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ac00:	55                   	push   %ebp
 804ac01:	89 e5                	mov    %esp,%ebp
 804ac03:	83 ec 04             	sub    $0x4,%esp
 804ac06:	57                   	push   %edi
 804ac07:	56                   	push   %esi
 804ac08:	53                   	push   %ebx
 804ac09:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804ac0d:	0f 84 bb 00 00 00    	je     0x804acce
 804ac13:	8b 55 08             	mov    0x8(%ebp),%edx
 804ac16:	89 d0                	mov    %edx,%eax
 804ac18:	83 e2 03             	and    $0x3,%edx
 804ac1b:	74 16                	je     0x804ac33
 804ac1d:	7a 0f                	jp     0x804ac2e
 804ac1f:	83 fa 02             	cmp    $0x2,%edx
 804ac22:	74 05                	je     0x804ac29
 804ac24:	38 30                	cmp    %dh,(%eax)
 804ac26:	74 2d                	je     0x804ac55
 804ac28:	40                   	inc    %eax
 804ac29:	38 30                	cmp    %dh,(%eax)
 804ac2b:	74 28                	je     0x804ac55
 804ac2d:	40                   	inc    %eax
 804ac2e:	38 30                	cmp    %dh,(%eax)
 804ac30:	74 23                	je     0x804ac55
 804ac32:	40                   	inc    %eax
 804ac33:	8b 10                	mov    (%eax),%edx
 804ac35:	84 d2                	test   %dl,%dl
 804ac37:	74 1c                	je     0x804ac55
 804ac39:	84 f6                	test   %dh,%dh
 804ac3b:	74 17                	je     0x804ac54
 804ac3d:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 804ac43:	74 0e                	je     0x804ac53
 804ac45:	83 c0 04             	add    $0x4,%eax
 804ac48:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804ac4e:	75 e3                	jne    0x804ac33
 804ac50:	83 e8 03             	sub    $0x3,%eax
 804ac53:	40                   	inc    %eax
 804ac54:	40                   	inc    %eax
 804ac55:	2b 45 08             	sub    0x8(%ebp),%eax
 804ac58:	40                   	inc    %eax
 804ac59:	50                   	push   %eax
 804ac5a:	e8 11 e7 ff ff       	call   0x8049370
 804ac5f:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804ac62:	6a 00                	push   $0x0
 804ac64:	89 c1                	mov    %eax,%ecx
 804ac66:	51                   	push   %ecx
 804ac67:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804ac6a:	51                   	push   %ecx
 804ac6b:	e8 00 ff ff ff       	call   0x804ab70
 804ac70:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804ac73:	8b 31                	mov    (%ecx),%esi
 804ac75:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ac78:	89 c7                	mov    %eax,%edi
 804ac7a:	03 39                	add    (%ecx),%edi
 804ac7c:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
 804ac83:	50                   	push   %eax
 804ac84:	e8 e7 e6 ff ff       	call   0x8049370
 804ac89:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ac8c:	89 39                	mov    %edi,(%ecx)
 804ac8e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804ac91:	89 c3                	mov    %eax,%ebx
 804ac93:	89 19                	mov    %ebx,(%ecx)
 804ac95:	8b 06                	mov    (%esi),%eax
 804ac97:	89 03                	mov    %eax,(%ebx)
 804ac99:	83 c6 04             	add    $0x4,%esi
 804ac9c:	83 c3 04             	add    $0x4,%ebx
 804ac9f:	53                   	push   %ebx
 804aca0:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804aca3:	51                   	push   %ecx
 804aca4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804aca7:	51                   	push   %ecx
 804aca8:	e8 c3 fe ff ff       	call   0x804ab70
 804acad:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
 804acb0:	8b 06                	mov    (%esi),%eax
 804acb2:	83 c6 04             	add    $0x4,%esi
 804acb5:	89 03                	mov    %eax,(%ebx)
 804acb7:	eb 0e                	jmp    0x804acc7
 804acb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804acc0:	8b 06                	mov    (%esi),%eax
 804acc2:	89 03                	mov    %eax,(%ebx)
 804acc4:	83 c6 04             	add    $0x4,%esi
 804acc7:	83 c3 04             	add    $0x4,%ebx
 804acca:	85 c0                	test   %eax,%eax
 804accc:	75 f2                	jne    0x804acc0
 804acce:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 804acd1:	5b                   	pop    %ebx
 804acd2:	5e                   	pop    %esi
 804acd3:	5f                   	pop    %edi
 804acd4:	89 ec                	mov    %ebp,%esp
 804acd6:	5d                   	pop    %ebp
 804acd7:	c3                   	ret    
 804acd8:	90                   	nop    
 804acd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804ace0:	55                   	push   %ebp
 804ace1:	89 e5                	mov    %esp,%ebp
 804ace3:	83 ec 18             	sub    $0x18,%esp
 804ace6:	57                   	push   %edi
 804ace7:	56                   	push   %esi
 804ace8:	53                   	push   %ebx
 804ace9:	8b 45 0c             	mov    0xc(%ebp),%eax
 804acec:	8b 00                	mov    (%eax),%eax
 804acee:	a3 70 b4 05 08       	mov    %eax,0x805b470
 804acf3:	85 c0                	test   %eax,%eax
 804acf5:	74 25                	je     0x804ad1c
 804acf7:	6a 2f                	push   $0x2f
 804acf9:	50                   	push   %eax
 804acfa:	e8 4d e4 ff ff       	call   0x804914c
 804acff:	83 c4 08             	add    $0x8,%esp
 804ad02:	85 c0                	test   %eax,%eax
 804ad04:	74 16                	je     0x804ad1c
 804ad06:	6a 2f                	push   $0x2f
 804ad08:	a1 70 b4 05 08       	mov    0x805b470,%eax
 804ad0d:	50                   	push   %eax
 804ad0e:	e8 39 e4 ff ff       	call   0x804914c
 804ad13:	40                   	inc    %eax
 804ad14:	a3 70 b4 05 08       	mov    %eax,0x805b470
 804ad19:	83 c4 08             	add    $0x8,%esp
 804ad1c:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 804ad23:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
 804ad2a:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 804ad31:	c6 05 2c be 05 08 0a 	movb   $0xa,0x805be2c
 804ad38:	c7 05 c0 b4 05 08 ff 	movl   $0xffffffff,0x805b4c0
 804ad3f:	ff ff ff 
 804ad42:	c7 05 d8 b4 05 08 ff 	movl   $0xffffffff,0x805b4d8
 804ad49:	ff ff ff 
 804ad4c:	c7 05 dc b4 05 08 ff 	movl   $0xffffffff,0x805b4dc
 804ad53:	ff ff ff 
 804ad56:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804ad5d:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
 804ad64:	68 df 8d 05 08       	push   $0x8058ddf
 804ad69:	6a 06                	push   $0x6
 804ad6b:	e8 4c e2 ff ff       	call   0x8048fbc
 804ad70:	68 e0 8d 05 08       	push   $0x8058de0
 804ad75:	68 f2 8d 05 08       	push   $0x8058df2
 804ad7a:	e8 fd e2 ff ff       	call   0x804907c
 804ad7f:	68 f2 8d 05 08       	push   $0x8058df2
 804ad84:	e8 73 e3 ff ff       	call   0x80490fc
 804ad89:	8d 45 0c             	lea    0xc(%ebp),%eax
 804ad8c:	50                   	push   %eax
 804ad8d:	8d 4d 08             	lea    0x8(%ebp),%ecx
 804ad90:	51                   	push   %ecx
 804ad91:	68 f7 8d 05 08       	push   $0x8058df7
 804ad96:	e8 f1 e1 ff ff       	call   0x8048f8c
 804ad9b:	83 c4 04             	add    $0x4,%esp
 804ad9e:	50                   	push   %eax
 804ad9f:	e8 5c fe ff ff       	call   0x804ac00
 804ada4:	83 c4 20             	add    $0x20,%esp
 804ada7:	e9 1b 05 00 00       	jmp    0x804b2c7
 804adac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804adb0:	83 fa 7a             	cmp    $0x7a,%edx
 804adb3:	0f 87 07 05 00 00    	ja     0x804b2c0
 804adb9:	ff 24 95 a0 8f 05 08 	jmp    *0x8058fa0(,%edx,4)
 804adc0:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 804adc3:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 804adc6:	8d 54 42 d0          	lea    0xffffffd0(%edx,%eax,2),%edx
 804adca:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 804adcd:	89 55 fc             	mov    %edx,0xfffffffc(%ebp)
 804add0:	e9 f2 04 00 00       	jmp    0x804b2c7
 804add5:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804adda:	85 c0                	test   %eax,%eax
 804addc:	0f 84 e5 04 00 00    	je     0x804b2c7
 804ade2:	68 dc b4 05 08       	push   $0x805b4dc
 804ade7:	50                   	push   %eax
 804ade8:	e8 73 e6 ff ff       	call   0x8049460
 804aded:	83 c4 08             	add    $0x8,%esp
 804adf0:	85 c0                	test   %eax,%eax
 804adf2:	0f 84 cf 04 00 00    	je     0x804b2c7
 804adf8:	6a 00                	push   $0x0
 804adfa:	8b 15 ac b3 05 08    	mov    0x805b3ac,%edx
 804ae00:	85 d2                	test   %edx,%edx
 804ae02:	74 0d                	je     0x804ae11
 804ae04:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ae09:	39 05 b0 b3 05 08    	cmp    %eax,0x805b3b0
 804ae0f:	74 23                	je     0x804ae34
 804ae11:	6a 05                	push   $0x5
 804ae13:	68 20 8e 05 08       	push   $0x8058e20
 804ae18:	6a 00                	push   $0x0
 804ae1a:	e8 9d e3 ff ff       	call   0x80491bc
 804ae1f:	83 c4 0c             	add    $0xc,%esp
 804ae22:	89 c2                	mov    %eax,%edx
 804ae24:	89 15 ac b3 05 08    	mov    %edx,0x805b3ac
 804ae2a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ae2f:	a3 b0 b3 05 08       	mov    %eax,0x805b3b0
 804ae34:	52                   	push   %edx
 804ae35:	e8 16 e5 ff ff       	call   0x8049350
 804ae3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ae40:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804ae45:	85 c0                	test   %eax,%eax
 804ae47:	0f 84 7a 04 00 00    	je     0x804b2c7
 804ae4d:	68 d8 b4 05 08       	push   $0x805b4d8
 804ae52:	50                   	push   %eax
 804ae53:	e8 08 e6 ff ff       	call   0x8049460
 804ae58:	83 c4 08             	add    $0x8,%esp
 804ae5b:	85 c0                	test   %eax,%eax
 804ae5d:	0f 84 64 04 00 00    	je     0x804b2c7
 804ae63:	6a 00                	push   $0x0
 804ae65:	8b 15 b4 b3 05 08    	mov    0x805b3b4,%edx
 804ae6b:	85 d2                	test   %edx,%edx
 804ae6d:	74 0d                	je     0x804ae7c
 804ae6f:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ae74:	39 05 b8 b3 05 08    	cmp    %eax,0x805b3b8
 804ae7a:	74 23                	je     0x804ae9f
 804ae7c:	6a 05                	push   $0x5
 804ae7e:	68 20 8e 05 08       	push   $0x8058e20
 804ae83:	6a 00                	push   $0x0
 804ae85:	e8 32 e3 ff ff       	call   0x80491bc
 804ae8a:	83 c4 0c             	add    $0xc,%esp
 804ae8d:	89 c2                	mov    %eax,%edx
 804ae8f:	89 15 b4 b3 05 08    	mov    %edx,0x805b3b4
 804ae95:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ae9a:	a3 b8 b3 05 08       	mov    %eax,0x805b3b8
 804ae9f:	52                   	push   %edx
 804aea0:	e8 ab e4 ff ff       	call   0x8049350
 804aea5:	8b 15 dc b2 05 08    	mov    0x805b2dc,%edx
 804aeab:	85 d2                	test   %edx,%edx
 804aead:	74 57                	je     0x804af06
 804aeaf:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 804aeb2:	50                   	push   %eax
 804aeb3:	52                   	push   %edx
 804aeb4:	e8 a7 e5 ff ff       	call   0x8049460
 804aeb9:	83 c4 08             	add    $0x8,%esp
 804aebc:	85 c0                	test   %eax,%eax
 804aebe:	0f 84 03 04 00 00    	je     0x804b2c7
 804aec4:	6a 00                	push   $0x0
 804aec6:	8b 15 bc b3 05 08    	mov    0x805b3bc,%edx
 804aecc:	85 d2                	test   %edx,%edx
 804aece:	74 0d                	je     0x804aedd
 804aed0:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aed5:	39 05 c0 b3 05 08    	cmp    %eax,0x805b3c0
 804aedb:	74 23                	je     0x804af00
 804aedd:	6a 05                	push   $0x5
 804aedf:	68 20 8e 05 08       	push   $0x8058e20
 804aee4:	6a 00                	push   $0x0
 804aee6:	e8 d1 e2 ff ff       	call   0x80491bc
 804aeeb:	83 c4 0c             	add    $0xc,%esp
 804aeee:	89 c2                	mov    %eax,%edx
 804aef0:	89 15 bc b3 05 08    	mov    %edx,0x805b3bc
 804aef6:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804aefb:	a3 c0 b3 05 08       	mov    %eax,0x805b3c0
 804af00:	52                   	push   %edx
 804af01:	e8 4a e4 ff ff       	call   0x8049350
 804af06:	c7 45 fc 02 00 00 00 	movl   $0x2,0xfffffffc(%ebp)
 804af0d:	e9 b5 03 00 00       	jmp    0x804b2c7
 804af12:	68 40 8e 05 08       	push   $0x8058e40
 804af17:	eb 3d                	jmp    0x804af56
 804af19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804af20:	68 46 8e 05 08       	push   $0x8058e46
 804af25:	eb 2f                	jmp    0x804af56
 804af27:	68 f2 8d 05 08       	push   $0x8058df2
 804af2c:	eb 28                	jmp    0x804af56
 804af2e:	89 f6                	mov    %esi,%esi
 804af30:	c7 45 f0 01 00 00 00 	movl   $0x1,0xfffffff0(%ebp)
 804af37:	e9 8b 03 00 00       	jmp    0x804b2c7
 804af3c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804af40:	c7 05 68 b4 05 08 01 	movl   $0x1,0x805b468
 804af47:	00 00 00 
 804af4a:	e9 78 03 00 00       	jmp    0x804b2c7
 804af4f:	90                   	nop    
 804af50:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804af55:	50                   	push   %eax
 804af56:	e8 35 fb ff ff       	call   0x804aa90
 804af5b:	83 c4 04             	add    $0x4,%esp
 804af5e:	e9 64 03 00 00       	jmp    0x804b2c7
 804af63:	c7 05 bc b4 05 08 01 	movl   $0x1,0x805b4bc
 804af6a:	00 00 00 
 804af6d:	e9 55 03 00 00       	jmp    0x804b2c7
 804af72:	c7 05 d4 b4 05 08 01 	movl   $0x1,0x805b4d4
 804af79:	00 00 00 
 804af7c:	e9 46 03 00 00       	jmp    0x804b2c7
 804af81:	c7 05 c4 b4 05 08 01 	movl   $0x1,0x805b4c4
 804af88:	00 00 00 
 804af8b:	c7 05 e0 b4 05 08 01 	movl   $0x1,0x805b4e0
 804af92:	00 00 00 
 804af95:	e9 2d 03 00 00       	jmp    0x804b2c7
 804af9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804afa0:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804afa5:	89 c6                	mov    %eax,%esi
 804afa7:	bf 4c 8e 05 08       	mov    $0x8058e4c,%edi
 804afac:	b9 05 00 00 00       	mov    $0x5,%ecx
 804afb1:	fc                   	cld    
 804afb2:	a8 00                	test   $0x0,%al
 804afb4:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 804afb6:	75 0f                	jne    0x804afc7
 804afb8:	c7 05 7c b4 05 08 00 	movl   $0x0,0x805b47c
 804afbf:	00 00 00 
 804afc2:	e9 00 03 00 00       	jmp    0x804b2c7
 804afc7:	89 c6                	mov    %eax,%esi
 804afc9:	bf 51 8e 05 08       	mov    $0x8058e51,%edi
 804afce:	b9 05 00 00 00       	mov    $0x5,%ecx
 804afd3:	fc                   	cld    
 804afd4:	a8 00                	test   $0x0,%al
 804afd6:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 804afd8:	75 16                	jne    0x804aff0
 804afda:	c7 05 7c b4 05 08 02 	movl   $0x2,0x805b47c
 804afe1:	00 00 00 
 804afe4:	e9 de 02 00 00       	jmp    0x804b2c7
 804afe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804aff0:	89 c6                	mov    %eax,%esi
 804aff2:	bf 56 8e 05 08       	mov    $0x8058e56,%edi
 804aff7:	b9 08 00 00 00       	mov    $0x8,%ecx
 804affc:	fc                   	cld    
 804affd:	a8 00                	test   $0x0,%al
 804afff:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 804b001:	75 0f                	jne    0x804b012
 804b003:	c7 05 7c b4 05 08 01 	movl   $0x1,0x805b47c
 804b00a:	00 00 00 
 804b00d:	e9 b5 02 00 00       	jmp    0x804b2c7
 804b012:	6a 00                	push   $0x0
 804b014:	8b 15 c4 b3 05 08    	mov    0x805b3c4,%edx
 804b01a:	85 d2                	test   %edx,%edx
 804b01c:	74 0d                	je     0x804b02b
 804b01e:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b023:	39 05 c8 b3 05 08    	cmp    %eax,0x805b3c8
 804b029:	74 23                	je     0x804b04e
 804b02b:	6a 05                	push   $0x5
 804b02d:	68 5e 8e 05 08       	push   $0x8058e5e
 804b032:	6a 00                	push   $0x0
 804b034:	e8 83 e1 ff ff       	call   0x80491bc
 804b039:	83 c4 0c             	add    $0xc,%esp
 804b03c:	89 c2                	mov    %eax,%edx
 804b03e:	89 15 c4 b3 05 08    	mov    %edx,0x805b3c4
 804b044:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b049:	a3 c8 b3 05 08       	mov    %eax,0x805b3c8
 804b04e:	52                   	push   %edx
 804b04f:	e8 fc e2 ff ff       	call   0x8049350
 804b054:	8b 1d dc b2 05 08    	mov    0x805b2dc,%ebx
 804b05a:	89 da                	mov    %ebx,%edx
 804b05c:	89 d8                	mov    %ebx,%eax
 804b05e:	83 e0 03             	and    $0x3,%eax
 804b061:	74 16                	je     0x804b079
 804b063:	7a 0f                	jp     0x804b074
 804b065:	83 f8 02             	cmp    $0x2,%eax
 804b068:	74 05                	je     0x804b06f
 804b06a:	38 22                	cmp    %ah,(%edx)
 804b06c:	74 2b                	je     0x804b099
 804b06e:	42                   	inc    %edx
 804b06f:	38 22                	cmp    %ah,(%edx)
 804b071:	74 26                	je     0x804b099
 804b073:	42                   	inc    %edx
 804b074:	38 22                	cmp    %ah,(%edx)
 804b076:	74 21                	je     0x804b099
 804b078:	42                   	inc    %edx
 804b079:	8b 02                	mov    (%edx),%eax
 804b07b:	84 c0                	test   %al,%al
 804b07d:	74 1a                	je     0x804b099
 804b07f:	84 e4                	test   %ah,%ah
 804b081:	74 15                	je     0x804b098
 804b083:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804b088:	74 0d                	je     0x804b097
 804b08a:	83 c2 04             	add    $0x4,%edx
 804b08d:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804b092:	75 e5                	jne    0x804b079
 804b094:	83 ea 03             	sub    $0x3,%edx
 804b097:	42                   	inc    %edx
 804b098:	42                   	inc    %edx
 804b099:	29 da                	sub    %ebx,%edx
 804b09b:	8b 5d f4             	mov    0xfffffff4(%ebp),%ebx
 804b09e:	01 d3                	add    %edx,%ebx
 804b0a0:	8d 73 01             	lea    0x1(%ebx),%esi
 804b0a3:	56                   	push   %esi
 804b0a4:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804b0a7:	51                   	push   %ecx
 804b0a8:	e8 33 e3 ff ff       	call   0x80493e0
 804b0ad:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804b0b0:	83 c4 08             	add    $0x8,%esp
 804b0b3:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804b0b8:	50                   	push   %eax
 804b0b9:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804b0bc:	03 45 f4             	add    0xfffffff4(%ebp),%eax
 804b0bf:	50                   	push   %eax
 804b0c0:	e8 67 e1 ff ff       	call   0x804922c
 804b0c5:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804b0c8:	83 c4 08             	add    $0x8,%esp
 804b0cb:	c6 04 3b 0a          	movb   $0xa,(%ebx,%edi,1)
 804b0cf:	89 75 f4             	mov    %esi,0xfffffff4(%ebp)
 804b0d2:	e9 f0 01 00 00       	jmp    0x804b2c7
 804b0d7:	8b 15 dc b2 05 08    	mov    0x805b2dc,%edx
 804b0dd:	31 c0                	xor    %eax,%eax
 804b0df:	8a 02                	mov    (%edx),%al
 804b0e1:	83 c0 d3             	add    $0xffffffd3,%eax
 804b0e4:	75 05                	jne    0x804b0eb
 804b0e6:	31 c0                	xor    %eax,%eax
 804b0e8:	8a 42 01             	mov    0x1(%edx),%al
 804b0eb:	85 c0                	test   %eax,%eax
 804b0ed:	74 12                	je     0x804b101
 804b0ef:	68 7b 8e 05 08       	push   $0x8058e7b
 804b0f4:	52                   	push   %edx
 804b0f5:	e8 92 e0 ff ff       	call   0x804918c
 804b0fa:	83 c4 08             	add    $0x8,%esp
 804b0fd:	89 c6                	mov    %eax,%esi
 804b0ff:	eb 06                	jmp    0x804b107
 804b101:	8b 35 d8 b2 05 08    	mov    0x805b2d8,%esi
 804b107:	85 f6                	test   %esi,%esi
 804b109:	75 15                	jne    0x804b120
 804b10b:	e8 cc de ff ff       	call   0x8048fdc
 804b110:	8b 00                	mov    (%eax),%eax
 804b112:	50                   	push   %eax
 804b113:	a1 dc b2 05 08       	mov    0x805b2dc,%eax
 804b118:	50                   	push   %eax
 804b119:	e8 32 e2 ff ff       	call   0x8049350
 804b11e:	89 f6                	mov    %esi,%esi
 804b120:	bb 01 00 00 00       	mov    $0x1,%ebx
 804b125:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 804b128:	40                   	inc    %eax
 804b129:	39 c3                	cmp    %eax,%ebx
 804b12b:	77 09                	ja     0x804b136
 804b12d:	8d 76 00             	lea    0x0(%esi),%esi
 804b130:	01 db                	add    %ebx,%ebx
 804b132:	39 c3                	cmp    %eax,%ebx
 804b134:	76 fa                	jbe    0x804b130
 804b136:	53                   	push   %ebx
 804b137:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804b13a:	51                   	push   %ecx
 804b13b:	e8 a0 e2 ff ff       	call   0x80493e0
 804b140:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804b143:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804b146:	89 7d e8             	mov    %edi,0xffffffe8(%ebp)
 804b149:	eb 40                	jmp    0x804b18b
 804b14b:	90                   	nop    
 804b14c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b150:	56                   	push   %esi
 804b151:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 804b154:	40                   	inc    %eax
 804b155:	89 da                	mov    %ebx,%edx
 804b157:	29 c2                	sub    %eax,%edx
 804b159:	52                   	push   %edx
 804b15a:	6a 01                	push   $0x1
 804b15c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804b15f:	03 45 f4             	add    0xfffffff4(%ebp),%eax
 804b162:	50                   	push   %eax
 804b163:	e8 b4 de ff ff       	call   0x804901c
 804b168:	89 c2                	mov    %eax,%edx
 804b16a:	83 c4 10             	add    $0x10,%esp
 804b16d:	85 d2                	test   %edx,%edx
 804b16f:	7e 2a                	jle    0x804b19b
 804b171:	01 55 f4             	add    %edx,0xfffffff4(%ebp)
 804b174:	8d 43 ff             	lea    0xffffffff(%ebx),%eax
 804b177:	39 45 f4             	cmp    %eax,0xfffffff4(%ebp)
 804b17a:	75 12                	jne    0x804b18e
 804b17c:	01 db                	add    %ebx,%ebx
 804b17e:	53                   	push   %ebx
 804b17f:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804b182:	51                   	push   %ecx
 804b183:	e8 58 e2 ff ff       	call   0x80493e0
 804b188:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804b18b:	83 c4 08             	add    $0x8,%esp
 804b18e:	56                   	push   %esi
 804b18f:	e8 88 dd ff ff       	call   0x8048f1c
 804b194:	83 c4 04             	add    $0x4,%esp
 804b197:	85 c0                	test   %eax,%eax
 804b199:	74 b5                	je     0x804b150
 804b19b:	3b 35 d8 b2 05 08    	cmp    0x805b2d8,%esi
 804b1a1:	74 09                	je     0x804b1ac
 804b1a3:	56                   	push   %esi
 804b1a4:	e8 93 df ff ff       	call   0x804913c
 804b1a9:	83 c4 04             	add    $0x4,%esp
 804b1ac:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804b1af:	39 7d e8             	cmp    %edi,0xffffffe8(%ebp)
 804b1b2:	0f 84 0f 01 00 00    	je     0x804b2c7
 804b1b8:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804b1bb:	80 7c 39 ff 0a       	cmpb   $0xa,0xffffffff(%ecx,%edi,1)
 804b1c0:	0f 84 01 01 00 00    	je     0x804b2c7
 804b1c6:	c6 04 0f 0a          	movb   $0xa,(%edi,%ecx,1)
 804b1ca:	47                   	inc    %edi
 804b1cb:	89 7d f4             	mov    %edi,0xfffffff4(%ebp)
 804b1ce:	e9 f4 00 00 00       	jmp    0x804b2c7
 804b1d3:	c7 05 e8 b4 05 08 01 	movl   $0x1,0x805b4e8
 804b1da:	00 00 00 
 804b1dd:	e9 e5 00 00 00       	jmp    0x804b2c7
 804b1e2:	c7 05 34 be 05 08 01 	movl   $0x1,0x805be34
 804b1e9:	00 00 00 
 804b1ec:	e9 d6 00 00 00       	jmp    0x804b2c7
 804b1f1:	c7 05 c4 b4 05 08 01 	movl   $0x1,0x805b4c4
 804b1f8:	00 00 00 
 804b1fb:	c7 05 e4 b4 05 08 ff 	movl   $0xffffffff,0x805b4e4
 804b202:	ff ff ff 
 804b205:	c7 05 0c b5 05 08 01 	movl   $0x1,0x805b50c
 804b20c:	00 00 00 
 804b20f:	e9 b3 00 00 00       	jmp    0x804b2c7
 804b214:	c7 05 c4 b4 05 08 01 	movl   $0x1,0x805b4c4
 804b21b:	00 00 00 
 804b21e:	c7 05 e4 b4 05 08 01 	movl   $0x1,0x805b4e4
 804b225:	00 00 00 
 804b228:	c7 05 0c b5 05 08 01 	movl   $0x1,0x805b50c
 804b22f:	00 00 00 
 804b232:	e9 90 00 00 00       	jmp    0x804b2c7
 804b237:	c7 05 d0 b4 05 08 01 	movl   $0x1,0x805b4d0
 804b23e:	00 00 00 
 804b241:	e9 81 00 00 00       	jmp    0x804b2c7
 804b246:	c7 05 0c b5 05 08 01 	movl   $0x1,0x805b50c
 804b24d:	00 00 00 
 804b250:	c7 05 c4 b4 05 08 01 	movl   $0x1,0x805b4c4
 804b257:	00 00 00 
 804b25a:	eb 6b                	jmp    0x804b2c7
 804b25c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b260:	c7 05 ec b4 05 08 01 	movl   $0x1,0x805b4ec
 804b267:	00 00 00 
 804b26a:	eb 5b                	jmp    0x804b2c7
 804b26c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b270:	c7 05 c8 b4 05 08 01 	movl   $0x1,0x805b4c8
 804b277:	00 00 00 
 804b27a:	eb 4b                	jmp    0x804b2c7
 804b27c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b280:	c7 05 30 be 05 08 01 	movl   $0x1,0x805be30
 804b287:	00 00 00 
 804b28a:	eb 3b                	jmp    0x804b2c7
 804b28c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b290:	c7 05 28 be 05 08 01 	movl   $0x1,0x805be28
 804b297:	00 00 00 
 804b29a:	eb 2b                	jmp    0x804b2c7
 804b29c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b2a0:	c7 05 c0 b4 05 08 00 	movl   $0x0,0x805b4c0
 804b2a7:	00 00 00 
 804b2aa:	eb 1b                	jmp    0x804b2c7
 804b2ac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b2b0:	c6 05 2c be 05 08 00 	movb   $0x0,0x805be2c
 804b2b7:	eb 0e                	jmp    0x804b2c7
 804b2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804b2c0:	6a 02                	push   $0x2
 804b2c2:	e8 e9 f4 ff ff       	call   0x804a7b0
 804b2c7:	6a 00                	push   $0x0
 804b2c9:	68 f8 ad 05 08       	push   $0x805adf8
 804b2ce:	68 00 80 05 08       	push   $0x8058000
 804b2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b2d6:	50                   	push   %eax
 804b2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 804b2da:	50                   	push   %eax
 804b2db:	e8 9c de ff ff       	call   0x804917c
 804b2e0:	89 c2                	mov    %eax,%edx
 804b2e2:	83 c4 14             	add    $0x14,%esp
 804b2e5:	83 fa ff             	cmp    $0xffffffff,%edx
 804b2e8:	0f 85 c2 fa ff ff    	jne    0x804adb0
 804b2ee:	83 3d dc b4 05 08 00 	cmpl   $0x0,0x805b4dc
 804b2f5:	7d 08                	jge    0x804b2ff
 804b2f7:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804b2fa:	a3 dc b4 05 08       	mov    %eax,0x805b4dc
 804b2ff:	83 3d d8 b4 05 08 00 	cmpl   $0x0,0x805b4d8
 804b306:	7d 08                	jge    0x804b310
 804b308:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804b30b:	a3 d8 b4 05 08       	mov    %eax,0x805b4d8
 804b310:	83 3d 3c be 05 08 00 	cmpl   $0x0,0x805be3c
 804b317:	75 0a                	jne    0x804b323
 804b319:	c7 05 3c be 05 08 f2 	movl   $0x8058df2,0x805be3c
 804b320:	8d 05 08 
 804b323:	83 3d 68 b4 05 08 00 	cmpl   $0x0,0x805b468
 804b32a:	0f 84 f0 00 00 00    	je     0x804b420
 804b330:	68 8f 8e 05 08       	push   $0x8058e8f
 804b335:	a1 3c be 05 08       	mov    0x805be3c,%eax
 804b33a:	8b 15 cc b3 05 08    	mov    0x805b3cc,%edx
 804b340:	50                   	push   %eax
 804b341:	85 d2                	test   %edx,%edx
 804b343:	74 0d                	je     0x804b352
 804b345:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b34a:	39 05 d0 b3 05 08    	cmp    %eax,0x805b3d0
 804b350:	74 23                	je     0x804b375
 804b352:	6a 05                	push   $0x5
 804b354:	68 7d 8e 05 08       	push   $0x8058e7d
 804b359:	6a 00                	push   $0x0
 804b35b:	e8 5c de ff ff       	call   0x80491bc
 804b360:	83 c4 0c             	add    $0xc,%esp
 804b363:	89 c2                	mov    %eax,%edx
 804b365:	89 15 cc b3 05 08    	mov    %edx,0x805b3cc
 804b36b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b370:	a3 d0 b3 05 08       	mov    %eax,0x805b3d0
 804b375:	52                   	push   %edx
 804b376:	e8 91 dd ff ff       	call   0x804910c
 804b37b:	68 93 8e 05 08       	push   $0x8058e93
 804b380:	e8 87 dd ff ff       	call   0x804910c
 804b385:	83 c4 10             	add    $0x10,%esp
 804b388:	8b 15 d4 b3 05 08    	mov    0x805b3d4,%edx
 804b38e:	85 d2                	test   %edx,%edx
 804b390:	74 0d                	je     0x804b39f
 804b392:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b397:	39 05 d8 b3 05 08    	cmp    %eax,0x805b3d8
 804b39d:	74 23                	je     0x804b3c2
 804b39f:	6a 05                	push   $0x5
 804b3a1:	68 a0 8e 05 08       	push   $0x8058ea0
 804b3a6:	6a 00                	push   $0x0
 804b3a8:	e8 0f de ff ff       	call   0x80491bc
 804b3ad:	83 c4 0c             	add    $0xc,%esp
 804b3b0:	89 c2                	mov    %eax,%edx
 804b3b2:	89 15 d4 b3 05 08    	mov    %edx,0x805b3d4
 804b3b8:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b3bd:	a3 d8 b3 05 08       	mov    %eax,0x805b3d8
 804b3c2:	52                   	push   %edx
 804b3c3:	e8 44 dd ff ff       	call   0x804910c
 804b3c8:	83 c4 04             	add    $0x4,%esp
 804b3cb:	8b 15 dc b3 05 08    	mov    0x805b3dc,%edx
 804b3d1:	85 d2                	test   %edx,%edx
 804b3d3:	74 0d                	je     0x804b3e2
 804b3d5:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b3da:	39 05 e0 b3 05 08    	cmp    %eax,0x805b3e0
 804b3e0:	74 23                	je     0x804b405
 804b3e2:	6a 05                	push   $0x5
 804b3e4:	68 00 8f 05 08       	push   $0x8058f00
 804b3e9:	6a 00                	push   $0x0
 804b3eb:	e8 cc dd ff ff       	call   0x80491bc
 804b3f0:	83 c4 0c             	add    $0xc,%esp
 804b3f3:	89 c2                	mov    %eax,%edx
 804b3f5:	89 15 dc b3 05 08    	mov    %edx,0x805b3dc
 804b3fb:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b400:	a3 e0 b3 05 08       	mov    %eax,0x805b3e0
 804b405:	52                   	push   %edx
 804b406:	e8 01 dd ff ff       	call   0x804910c
 804b40b:	68 93 8e 05 08       	push   $0x8058e93
 804b410:	e8 f7 dc ff ff       	call   0x804910c
 804b415:	6a 00                	push   $0x0
 804b417:	e8 b0 dd ff ff       	call   0x80491cc
 804b41c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b420:	83 3d 64 b4 05 08 00 	cmpl   $0x0,0x805b464
 804b427:	74 07                	je     0x804b430
 804b429:	6a 00                	push   $0x0
 804b42b:	e8 80 f3 ff ff       	call   0x804a7b0
 804b430:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 804b434:	74 2a                	je     0x804b460
 804b436:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
 804b43a:	75 14                	jne    0x804b450
 804b43c:	80 35 c8 b4 05 08 01 	xorb   $0x1,0x805b4c8
 804b443:	a1 3c be 05 08       	mov    0x805be3c,%eax
 804b448:	e9 83 00 00 00       	jmp    0x804b4d0
 804b44d:	8d 76 00             	lea    0x0(%esi),%esi
 804b450:	ff 4d f4             	decl   0xfffffff4(%ebp)
 804b453:	a1 3c be 05 08       	mov    0x805be3c,%eax
 804b458:	eb 76                	jmp    0x804b4d0
 804b45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b460:	8b 15 e0 b2 05 08    	mov    0x805b2e0,%edx
 804b466:	3b 55 08             	cmp    0x8(%ebp),%edx
 804b469:	7d 5c                	jge    0x804b4c7
 804b46b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b46e:	8b 14 90             	mov    (%eax,%edx,4),%edx
 804b471:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 804b474:	ff 05 e0 b2 05 08    	incl   0x805b2e0
 804b47a:	89 d0                	mov    %edx,%eax
 804b47c:	89 d7                	mov    %edx,%edi
 804b47e:	89 d1                	mov    %edx,%ecx
 804b480:	83 e0 03             	and    $0x3,%eax
 804b483:	74 16                	je     0x804b49b
 804b485:	7a 0f                	jp     0x804b496
 804b487:	83 f8 02             	cmp    $0x2,%eax
 804b48a:	74 05                	je     0x804b491
 804b48c:	38 27                	cmp    %ah,(%edi)
 804b48e:	74 2b                	je     0x804b4bb
 804b490:	47                   	inc    %edi
 804b491:	38 27                	cmp    %ah,(%edi)
 804b493:	74 26                	je     0x804b4bb
 804b495:	47                   	inc    %edi
 804b496:	38 27                	cmp    %ah,(%edi)
 804b498:	74 21                	je     0x804b4bb
 804b49a:	47                   	inc    %edi
 804b49b:	8b 07                	mov    (%edi),%eax
 804b49d:	84 c0                	test   %al,%al
 804b49f:	74 1a                	je     0x804b4bb
 804b4a1:	84 e4                	test   %ah,%ah
 804b4a3:	74 15                	je     0x804b4ba
 804b4a5:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804b4aa:	74 0d                	je     0x804b4b9
 804b4ac:	83 c7 04             	add    $0x4,%edi
 804b4af:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804b4b4:	75 e5                	jne    0x804b49b
 804b4b6:	83 ef 03             	sub    $0x3,%edi
 804b4b9:	47                   	inc    %edi
 804b4ba:	47                   	inc    %edi
 804b4bb:	29 cf                	sub    %ecx,%edi
 804b4bd:	89 7d f4             	mov    %edi,0xfffffff4(%ebp)
 804b4c0:	a1 3c be 05 08       	mov    0x805be3c,%eax
 804b4c5:	eb 09                	jmp    0x804b4d0
 804b4c7:	6a 02                	push   $0x2
 804b4c9:	e8 e2 f2 ff ff       	call   0x804a7b0
 804b4ce:	89 f6                	mov    %esi,%esi
 804b4d0:	50                   	push   %eax
 804b4d1:	e8 2a f6 ff ff       	call   0x804ab00
 804b4d6:	83 c4 04             	add    $0x4,%esp
 804b4d9:	85 c0                	test   %eax,%eax
 804b4db:	75 16                	jne    0x804b4f3
 804b4dd:	68 97 8f 05 08       	push   $0x8058f97
 804b4e2:	e8 19 f6 ff ff       	call   0x804ab00
 804b4e7:	83 c4 04             	add    $0x4,%esp
 804b4ea:	85 c0                	test   %eax,%eax
 804b4ec:	75 05                	jne    0x804b4f3
 804b4ee:	e8 59 db ff ff       	call   0x804904c
 804b4f3:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804b4f6:	57                   	push   %edi
 804b4f7:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804b4fa:	a1 80 b4 05 08       	mov    0x805b480,%eax
 804b4ff:	51                   	push   %ecx
 804b500:	ff d0                	call   *%eax
 804b502:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b505:	8b 15 e0 b2 05 08    	mov    0x805b2e0,%edx
 804b50b:	89 d8                	mov    %ebx,%eax
 804b50d:	29 d0                	sub    %edx,%eax
 804b50f:	83 c4 08             	add    $0x8,%esp
 804b512:	83 f8 01             	cmp    $0x1,%eax
 804b515:	7e 09                	jle    0x804b520
 804b517:	83 3d e8 b4 05 08 00 	cmpl   $0x0,0x805b4e8
 804b51e:	74 06                	je     0x804b526
 804b520:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
 804b524:	74 13                	je     0x804b539
 804b526:	c7 05 cc b4 05 08 01 	movl   $0x1,0x805b4cc
 804b52d:	00 00 00 
 804b530:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b533:	8b 15 e0 b2 05 08    	mov    0x805b2e0,%edx
 804b539:	39 da                	cmp    %ebx,%edx
 804b53b:	7d 53                	jge    0x804b590
 804b53d:	bb 01 00 00 00       	mov    $0x1,%ebx
 804b542:	a1 e0 b2 05 08       	mov    0x805b2e0,%eax
 804b547:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b54a:	8b 14 82             	mov    (%edx,%eax,4),%edx
 804b54d:	68 00 b4 05 08       	push   $0x805b400
 804b552:	31 c0                	xor    %eax,%eax
 804b554:	8a 02                	mov    (%edx),%al
 804b556:	83 c0 d3             	add    $0xffffffd3,%eax
 804b559:	75 05                	jne    0x804b560
 804b55b:	31 c0                	xor    %eax,%eax
 804b55d:	8a 42 01             	mov    0x1(%edx),%al
 804b560:	85 c0                	test   %eax,%eax
 804b562:	74 04                	je     0x804b568
 804b564:	89 d0                	mov    %edx,%eax
 804b566:	eb 02                	jmp    0x804b56a
 804b568:	31 c0                	xor    %eax,%eax
 804b56a:	50                   	push   %eax
 804b56b:	e8 60 ed ff ff       	call   0x804a2d0
 804b570:	21 c3                	and    %eax,%ebx
 804b572:	83 c4 08             	add    $0x8,%esp
 804b575:	a1 e0 b2 05 08       	mov    0x805b2e0,%eax
 804b57a:	8d 78 01             	lea    0x1(%eax),%edi
 804b57d:	89 3d e0 b2 05 08    	mov    %edi,0x805b2e0
 804b583:	89 f8                	mov    %edi,%eax
 804b585:	3b 45 08             	cmp    0x8(%ebp),%eax
 804b588:	7c b8                	jl     0x804b542
 804b58a:	eb 15                	jmp    0x804b5a1
 804b58c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b590:	68 00 b4 05 08       	push   $0x805b400
 804b595:	6a 00                	push   $0x0
 804b597:	e8 34 ed ff ff       	call   0x804a2d0
 804b59c:	89 c3                	mov    %eax,%ebx
 804b59e:	83 c4 08             	add    $0x8,%esp
 804b5a1:	a1 c4 b2 05 08       	mov    0x805b2c4,%eax
 804b5a6:	50                   	push   %eax
 804b5a7:	e8 90 db ff ff       	call   0x804913c
 804b5ac:	83 c4 04             	add    $0x4,%esp
 804b5af:	83 f8 ff             	cmp    $0xffffffff,%eax
 804b5b2:	75 4b                	jne    0x804b5ff
 804b5b4:	e8 23 da ff ff       	call   0x8048fdc
 804b5b9:	8b 00                	mov    (%eax),%eax
 804b5bb:	50                   	push   %eax
 804b5bc:	8b 15 e4 b3 05 08    	mov    0x805b3e4,%edx
 804b5c2:	85 d2                	test   %edx,%edx
 804b5c4:	74 0d                	je     0x804b5d3
 804b5c6:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b5cb:	39 05 e8 b3 05 08    	cmp    %eax,0x805b3e8
 804b5d1:	74 23                	je     0x804b5f6
 804b5d3:	6a 05                	push   $0x5
 804b5d5:	68 cf 81 05 08       	push   $0x80581cf
 804b5da:	6a 00                	push   $0x0
 804b5dc:	e8 db db ff ff       	call   0x80491bc
 804b5e1:	83 c4 0c             	add    $0xc,%esp
 804b5e4:	89 c2                	mov    %eax,%edx
 804b5e6:	89 15 e4 b3 05 08    	mov    %edx,0x805b3e4
 804b5ec:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b5f1:	a3 e8 b3 05 08       	mov    %eax,0x805b3e8
 804b5f6:	52                   	push   %edx
 804b5f7:	e8 f4 dc ff ff       	call   0x80492f0
 804b5fc:	83 c4 08             	add    $0x8,%esp
 804b5ff:	83 3d 78 b4 05 08 00 	cmpl   $0x0,0x805b478
 804b606:	75 08                	jne    0x804b610
 804b608:	89 d8                	mov    %ebx,%eax
 804b60a:	eb 09                	jmp    0x804b615
 804b60c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b610:	b8 02 00 00 00       	mov    $0x2,%eax
 804b615:	50                   	push   %eax
 804b616:	e8 b1 db ff ff       	call   0x80491cc
 804b61b:	90                   	nop    
 804b61c:	90                   	nop    
 804b61d:	90                   	nop    
 804b61e:	90                   	nop    
 804b61f:	90                   	nop    
 804b620:	55                   	push   %ebp
 804b621:	89 e5                	mov    %esp,%ebp
 804b623:	53                   	push   %ebx
 804b624:	8b 55 08             	mov    0x8(%ebp),%edx
 804b627:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b62a:	50                   	push   %eax
 804b62b:	52                   	push   %edx
 804b62c:	e8 ab db ff ff       	call   0x80491dc
 804b631:	89 c3                	mov    %eax,%ebx
 804b633:	83 c4 08             	add    $0x8,%esp
 804b636:	85 db                	test   %ebx,%ebx
 804b638:	75 40                	jne    0x804b67a
 804b63a:	8b 15 20 b5 05 08    	mov    0x805b520,%edx
 804b640:	85 d2                	test   %edx,%edx
 804b642:	74 0d                	je     0x804b651
 804b644:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b649:	39 05 24 b5 05 08    	cmp    %eax,0x805b524
 804b64f:	74 23                	je     0x804b674
 804b651:	6a 05                	push   $0x5
 804b653:	68 8c 91 05 08       	push   $0x805918c
 804b658:	6a 00                	push   $0x0
 804b65a:	e8 5d db ff ff       	call   0x80491bc
 804b65f:	83 c4 0c             	add    $0xc,%esp
 804b662:	89 c2                	mov    %eax,%edx
 804b664:	89 15 20 b5 05 08    	mov    %edx,0x805b520
 804b66a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b66f:	a3 24 b5 05 08       	mov    %eax,0x805b524
 804b674:	52                   	push   %edx
 804b675:	e8 46 bb 00 00       	call   0x80571c0
 804b67a:	89 d8                	mov    %ebx,%eax
 804b67c:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b67f:	89 ec                	mov    %ebp,%esp
 804b681:	5d                   	pop    %ebp
 804b682:	c3                   	ret    
 804b683:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b690:	55                   	push   %ebp
 804b691:	89 e5                	mov    %esp,%ebp
 804b693:	53                   	push   %ebx
 804b694:	8b 45 08             	mov    0x8(%ebp),%eax
 804b697:	50                   	push   %eax
 804b698:	e8 6f d9 ff ff       	call   0x804900c
 804b69d:	89 c3                	mov    %eax,%ebx
 804b69f:	83 c4 04             	add    $0x4,%esp
 804b6a2:	85 db                	test   %ebx,%ebx
 804b6a4:	75 40                	jne    0x804b6e6
 804b6a6:	8b 15 28 b5 05 08    	mov    0x805b528,%edx
 804b6ac:	85 d2                	test   %edx,%edx
 804b6ae:	74 0d                	je     0x804b6bd
 804b6b0:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b6b5:	39 05 2c b5 05 08    	cmp    %eax,0x805b52c
 804b6bb:	74 23                	je     0x804b6e0
 804b6bd:	6a 05                	push   $0x5
 804b6bf:	68 8c 91 05 08       	push   $0x805918c
 804b6c4:	6a 00                	push   $0x0
 804b6c6:	e8 f1 da ff ff       	call   0x80491bc
 804b6cb:	83 c4 0c             	add    $0xc,%esp
 804b6ce:	89 c2                	mov    %eax,%edx
 804b6d0:	89 15 28 b5 05 08    	mov    %edx,0x805b528
 804b6d6:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b6db:	a3 2c b5 05 08       	mov    %eax,0x805b52c
 804b6e0:	52                   	push   %edx
 804b6e1:	e8 da ba 00 00       	call   0x80571c0
 804b6e6:	89 d8                	mov    %ebx,%eax
 804b6e8:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b6eb:	89 ec                	mov    %ebp,%esp
 804b6ed:	5d                   	pop    %ebp
 804b6ee:	c3                   	ret    
 804b6ef:	90                   	nop    
 804b6f0:	55                   	push   %ebp
 804b6f1:	89 e5                	mov    %esp,%ebp
 804b6f3:	53                   	push   %ebx
 804b6f4:	8b 55 08             	mov    0x8(%ebp),%edx
 804b6f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b6fa:	50                   	push   %eax
 804b6fb:	52                   	push   %edx
 804b6fc:	e8 eb d9 ff ff       	call   0x80490ec
 804b701:	89 c3                	mov    %eax,%ebx
 804b703:	83 c4 08             	add    $0x8,%esp
 804b706:	85 db                	test   %ebx,%ebx
 804b708:	75 40                	jne    0x804b74a
 804b70a:	8b 15 30 b5 05 08    	mov    0x805b530,%edx
 804b710:	85 d2                	test   %edx,%edx
 804b712:	74 0d                	je     0x804b721
 804b714:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b719:	39 05 34 b5 05 08    	cmp    %eax,0x805b534
 804b71f:	74 23                	je     0x804b744
 804b721:	6a 05                	push   $0x5
 804b723:	68 8c 91 05 08       	push   $0x805918c
 804b728:	6a 00                	push   $0x0
 804b72a:	e8 8d da ff ff       	call   0x80491bc
 804b72f:	83 c4 0c             	add    $0xc,%esp
 804b732:	89 c2                	mov    %eax,%edx
 804b734:	89 15 30 b5 05 08    	mov    %edx,0x805b530
 804b73a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804b73f:	a3 34 b5 05 08       	mov    %eax,0x805b534
 804b744:	52                   	push   %edx
 804b745:	e8 76 ba 00 00       	call   0x80571c0
 804b74a:	89 d8                	mov    %ebx,%eax
 804b74c:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b74f:	89 ec                	mov    %ebp,%esp
 804b751:	5d                   	pop    %ebp
 804b752:	c3                   	ret    
 804b753:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b760:	55                   	push   %ebp
 804b761:	89 e5                	mov    %esp,%ebp
 804b763:	ba 01 00 00 00       	mov    $0x1,%edx
 804b768:	53                   	push   %ebx
 804b769:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b76c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b76f:	89 d9                	mov    %ebx,%ecx
 804b771:	83 e1 1f             	and    $0x1f,%ecx
 804b774:	c1 eb 05             	shr    $0x5,%ebx
 804b777:	d3 e2                	shl    %cl,%edx
 804b779:	23 14 98             	and    (%eax,%ebx,4),%edx
 804b77c:	89 d0                	mov    %edx,%eax
 804b77e:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b781:	89 ec                	mov    %ebp,%esp
 804b783:	5d                   	pop    %ebp
 804b784:	c3                   	ret    
 804b785:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b790:	55                   	push   %ebp
 804b791:	89 e5                	mov    %esp,%ebp
 804b793:	b8 01 00 00 00       	mov    $0x1,%eax
 804b798:	53                   	push   %ebx
 804b799:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b79c:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b79f:	89 d9                	mov    %ebx,%ecx
 804b7a1:	83 e1 1f             	and    $0x1f,%ecx
 804b7a4:	c1 eb 05             	shr    $0x5,%ebx
 804b7a7:	d3 e0                	shl    %cl,%eax
 804b7a9:	09 04 9a             	or     %eax,(%edx,%ebx,4)
 804b7ac:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b7af:	89 ec                	mov    %ebp,%esp
 804b7b1:	5d                   	pop    %ebp
 804b7b2:	c3                   	ret    
 804b7b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b7b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b7c0:	55                   	push   %ebp
 804b7c1:	89 e5                	mov    %esp,%ebp
 804b7c3:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 804b7c8:	53                   	push   %ebx
 804b7c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b7cc:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b7cf:	89 d9                	mov    %ebx,%ecx
 804b7d1:	83 e1 1f             	and    $0x1f,%ecx
 804b7d4:	c1 eb 05             	shr    $0x5,%ebx
 804b7d7:	d3 c0                	rol    %cl,%eax
 804b7d9:	21 04 9a             	and    %eax,(%edx,%ebx,4)
 804b7dc:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b7df:	89 ec                	mov    %ebp,%esp
 804b7e1:	5d                   	pop    %ebp
 804b7e2:	c3                   	ret    
 804b7e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b7f0:	55                   	push   %ebp
 804b7f1:	89 e5                	mov    %esp,%ebp
 804b7f3:	31 d2                	xor    %edx,%edx
 804b7f5:	53                   	push   %ebx
 804b7f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b7f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804b7fc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b800:	8b 04 93             	mov    (%ebx,%edx,4),%eax
 804b803:	89 04 91             	mov    %eax,(%ecx,%edx,4)
 804b806:	42                   	inc    %edx
 804b807:	83 fa 07             	cmp    $0x7,%edx
 804b80a:	76 f4                	jbe    0x804b800
 804b80c:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b80f:	89 ec                	mov    %ebp,%esp
 804b811:	5d                   	pop    %ebp
 804b812:	c3                   	ret    
 804b813:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b820:	55                   	push   %ebp
 804b821:	89 e5                	mov    %esp,%ebp
 804b823:	31 c0                	xor    %eax,%eax
 804b825:	8b 55 08             	mov    0x8(%ebp),%edx
 804b828:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
 804b82f:	40                   	inc    %eax
 804b830:	83 f8 07             	cmp    $0x7,%eax
 804b833:	76 f3                	jbe    0x804b828
 804b835:	89 ec                	mov    %ebp,%esp
 804b837:	5d                   	pop    %ebp
 804b838:	c3                   	ret    
 804b839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804b840:	55                   	push   %ebp
 804b841:	89 e5                	mov    %esp,%ebp
 804b843:	31 c0                	xor    %eax,%eax
 804b845:	8b 55 08             	mov    0x8(%ebp),%edx
 804b848:	f7 14 82             	notl   (%edx,%eax,4)
 804b84b:	40                   	inc    %eax
 804b84c:	83 f8 07             	cmp    $0x7,%eax
 804b84f:	76 f7                	jbe    0x804b848
 804b851:	89 ec                	mov    %ebp,%esp
 804b853:	5d                   	pop    %ebp
 804b854:	c3                   	ret    
 804b855:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b860:	55                   	push   %ebp
 804b861:	89 e5                	mov    %esp,%ebp
 804b863:	31 d2                	xor    %edx,%edx
 804b865:	53                   	push   %ebx
 804b866:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804b869:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804b86c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b870:	8b 04 91             	mov    (%ecx,%edx,4),%eax
 804b873:	39 04 93             	cmp    %eax,(%ebx,%edx,4)
 804b876:	74 08                	je     0x804b880
 804b878:	31 c0                	xor    %eax,%eax
 804b87a:	eb 0f                	jmp    0x804b88b
 804b87c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b880:	42                   	inc    %edx
 804b881:	83 fa 07             	cmp    $0x7,%edx
 804b884:	76 ea                	jbe    0x804b870
 804b886:	b8 01 00 00 00       	mov    $0x1,%eax
 804b88b:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804b88e:	89 ec                	mov    %ebp,%esp
 804b890:	5d                   	pop    %ebp
 804b891:	c3                   	ret    
 804b892:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804b899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804b8a0:	55                   	push   %ebp
 804b8a1:	89 e5                	mov    %esp,%ebp
 804b8a3:	56                   	push   %esi
 804b8a4:	53                   	push   %ebx
 804b8a5:	8b 75 08             	mov    0x8(%ebp),%esi
 804b8a8:	31 db                	xor    %ebx,%ebx
 804b8aa:	eb 1a                	jmp    0x804b8c6
 804b8ac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b8b0:	89 d8                	mov    %ebx,%eax
 804b8b2:	c1 e0 05             	shl    $0x5,%eax
 804b8b5:	03 01                	add    (%ecx),%eax
 804b8b7:	50                   	push   %eax
 804b8b8:	56                   	push   %esi
 804b8b9:	e8 a2 ff ff ff       	call   0x804b860
 804b8be:	83 c4 08             	add    $0x8,%esp
 804b8c1:	85 c0                	test   %eax,%eax
 804b8c3:	75 5f                	jne    0x804b924
 804b8c5:	43                   	inc    %ebx
 804b8c6:	8b 15 dc ba 05 08    	mov    0x805badc,%edx
 804b8cc:	89 d1                	mov    %edx,%ecx
 804b8ce:	3b 5a 04             	cmp    0x4(%edx),%ebx
 804b8d1:	7c dd                	jl     0x804b8b0
 804b8d3:	89 d1                	mov    %edx,%ecx
 804b8d5:	8b 42 08             	mov    0x8(%edx),%eax
 804b8d8:	39 42 04             	cmp    %eax,0x4(%edx)
 804b8db:	7c 31                	jl     0x804b90e
 804b8dd:	8d 76 00             	lea    0x0(%esi),%esi
 804b8e0:	c1 61 08 01          	shll   $0x1,0x8(%ecx)
 804b8e4:	8b 15 dc ba 05 08    	mov    0x805badc,%edx
 804b8ea:	89 d1                	mov    %edx,%ecx
 804b8ec:	8b 42 08             	mov    0x8(%edx),%eax
 804b8ef:	39 42 04             	cmp    %eax,0x4(%edx)
 804b8f2:	7d ec                	jge    0x804b8e0
 804b8f4:	c1 e0 05             	shl    $0x5,%eax
 804b8f7:	50                   	push   %eax
 804b8f8:	8b 02                	mov    (%edx),%eax
 804b8fa:	50                   	push   %eax
 804b8fb:	e8 f0 fd ff ff       	call   0x804b6f0
 804b900:	89 c2                	mov    %eax,%edx
 804b902:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804b907:	83 c4 08             	add    $0x8,%esp
 804b90a:	89 10                	mov    %edx,(%eax)
 804b90c:	89 c2                	mov    %eax,%edx
 804b90e:	ff 42 04             	incl   0x4(%edx)
 804b911:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804b916:	89 da                	mov    %ebx,%edx
 804b918:	c1 e2 05             	shl    $0x5,%edx
 804b91b:	03 10                	add    (%eax),%edx
 804b91d:	52                   	push   %edx
 804b91e:	56                   	push   %esi
 804b91f:	e8 cc fe ff ff       	call   0x804b7f0
 804b924:	89 d8                	mov    %ebx,%eax
 804b926:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 804b929:	5b                   	pop    %ebx
 804b92a:	5e                   	pop    %esi
 804b92b:	89 ec                	mov    %ebp,%esp
 804b92d:	5d                   	pop    %ebp
 804b92e:	c3                   	ret    
 804b92f:	90                   	nop    
 804b930:	55                   	push   %ebp
 804b931:	89 e5                	mov    %esp,%ebp
 804b933:	8b 45 08             	mov    0x8(%ebp),%eax
 804b936:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b939:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804b93c:	c7 05 e4 ba 05 08 01 	movl   $0x1,0x805bae4
 804b943:	00 00 00 
 804b946:	a3 e0 ba 05 08       	mov    %eax,0x805bae0
 804b94b:	89 15 e8 ba 05 08    	mov    %edx,0x805bae8
 804b951:	88 0d ec ba 05 08    	mov    %cl,0x805baec
 804b957:	89 ec                	mov    %ebp,%esp
 804b959:	5d                   	pop    %ebp
 804b95a:	c3                   	ret    
 804b95b:	90                   	nop    
 804b95c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804b960:	55                   	push   %ebp
 804b961:	89 e5                	mov    %esp,%ebp
 804b963:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804b969:	8b 45 08             	mov    0x8(%ebp),%eax
 804b96c:	89 ec                	mov    %ebp,%esp
 804b96e:	5d                   	pop    %ebp
 804b96f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804b973:	25 00 04 00 00       	and    $0x400,%eax
 804b978:	25 ff ff 00 00       	and    $0xffff,%eax
 804b97d:	c3                   	ret    
 804b97e:	89 f6                	mov    %esi,%esi
 804b980:	55                   	push   %ebp
 804b981:	89 e5                	mov    %esp,%ebp
 804b983:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804b989:	8b 45 08             	mov    0x8(%ebp),%eax
 804b98c:	89 ec                	mov    %ebp,%esp
 804b98e:	5d                   	pop    %ebp
 804b98f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804b993:	25 00 01 00 00       	and    $0x100,%eax
 804b998:	25 ff ff 00 00       	and    $0xffff,%eax
 804b99d:	c3                   	ret    
 804b99e:	89 f6                	mov    %esi,%esi
 804b9a0:	55                   	push   %ebp
 804b9a1:	89 e5                	mov    %esp,%ebp
 804b9a3:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804b9a9:	8b 45 08             	mov    0x8(%ebp),%eax
 804b9ac:	89 ec                	mov    %ebp,%esp
 804b9ae:	5d                   	pop    %ebp
 804b9af:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804b9b3:	25 00 02 00 00       	and    $0x200,%eax
 804b9b8:	25 ff ff 00 00       	and    $0xffff,%eax
 804b9bd:	c3                   	ret    
 804b9be:	89 f6                	mov    %esi,%esi
 804b9c0:	55                   	push   %ebp
 804b9c1:	89 e5                	mov    %esp,%ebp
 804b9c3:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804b9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 804b9cc:	89 ec                	mov    %ebp,%esp
 804b9ce:	5d                   	pop    %ebp
 804b9cf:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804b9d3:	25 00 08 00 00       	and    $0x800,%eax
 804b9d8:	25 ff ff 00 00       	and    $0xffff,%eax
 804b9dd:	c3                   	ret    
 804b9de:	89 f6                	mov    %esi,%esi
 804b9e0:	55                   	push   %ebp
 804b9e1:	89 e5                	mov    %esp,%ebp
 804b9e3:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804b9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 804b9ec:	89 ec                	mov    %ebp,%esp
 804b9ee:	5d                   	pop    %ebp
 804b9ef:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804b9f3:	25 00 10 00 00       	and    $0x1000,%eax
 804b9f8:	25 ff ff 00 00       	and    $0xffff,%eax
 804b9fd:	c3                   	ret    
 804b9fe:	89 f6                	mov    %esi,%esi
 804ba00:	55                   	push   %ebp
 804ba01:	89 e5                	mov    %esp,%ebp
 804ba03:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804ba09:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba0c:	89 ec                	mov    %ebp,%esp
 804ba0e:	5d                   	pop    %ebp
 804ba0f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804ba13:	25 00 20 00 00       	and    $0x2000,%eax
 804ba18:	25 ff ff 00 00       	and    $0xffff,%eax
 804ba1d:	c3                   	ret    
 804ba1e:	89 f6                	mov    %esi,%esi
 804ba20:	55                   	push   %ebp
 804ba21:	89 e5                	mov    %esp,%ebp
 804ba23:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804ba29:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba2c:	89 ec                	mov    %ebp,%esp
 804ba2e:	5d                   	pop    %ebp
 804ba2f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804ba33:	83 e0 04             	and    $0x4,%eax
 804ba36:	25 ff ff 00 00       	and    $0xffff,%eax
 804ba3b:	c3                   	ret    
 804ba3c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ba40:	55                   	push   %ebp
 804ba41:	89 e5                	mov    %esp,%ebp
 804ba43:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804ba49:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba4c:	89 ec                	mov    %ebp,%esp
 804ba4e:	5d                   	pop    %ebp
 804ba4f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804ba53:	83 e0 08             	and    $0x8,%eax
 804ba56:	25 ff ff 00 00       	and    $0xffff,%eax
 804ba5b:	c3                   	ret    
 804ba5c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ba60:	55                   	push   %ebp
 804ba61:	89 e5                	mov    %esp,%ebp
 804ba63:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804ba69:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba6c:	89 ec                	mov    %ebp,%esp
 804ba6e:	5d                   	pop    %ebp
 804ba6f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804ba73:	25 00 40 00 00       	and    $0x4000,%eax
 804ba78:	25 ff ff 00 00       	and    $0xffff,%eax
 804ba7d:	c3                   	ret    
 804ba7e:	89 f6                	mov    %esi,%esi
 804ba80:	55                   	push   %ebp
 804ba81:	89 e5                	mov    %esp,%ebp
 804ba83:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804ba89:	8b 45 08             	mov    0x8(%ebp),%eax
 804ba8c:	89 ec                	mov    %ebp,%esp
 804ba8e:	5d                   	pop    %ebp
 804ba8f:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804ba93:	25 00 80 ff ff       	and    $0xffff8000,%eax
 804ba98:	25 ff ff 00 00       	and    $0xffff,%eax
 804ba9d:	c3                   	ret    
 804ba9e:	89 f6                	mov    %esi,%esi
 804baa0:	55                   	push   %ebp
 804baa1:	89 e5                	mov    %esp,%ebp
 804baa3:	8b 15 d4 b2 05 08    	mov    0x805b2d4,%edx
 804baa9:	8b 45 08             	mov    0x8(%ebp),%eax
 804baac:	89 ec                	mov    %ebp,%esp
 804baae:	5d                   	pop    %ebp
 804baaf:	66 8b 04 42          	mov    (%edx,%eax,2),%ax
 804bab3:	83 e0 02             	and    $0x2,%eax
 804bab6:	25 ff ff 00 00       	and    $0xffff,%eax
 804babb:	c3                   	ret    
 804babc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804bac0:	55                   	push   %ebp
 804bac1:	89 e5                	mov    %esp,%ebp
 804bac3:	31 c0                	xor    %eax,%eax
 804bac5:	8b 55 08             	mov    0x8(%ebp),%edx
 804bac8:	83 fa 20             	cmp    $0x20,%edx
 804bacb:	74 05                	je     0x804bad2
 804bacd:	83 fa 09             	cmp    $0x9,%edx
 804bad0:	75 05                	jne    0x804bad7
 804bad2:	b8 01 00 00 00       	mov    $0x1,%eax
 804bad7:	89 ec                	mov    %ebp,%esp
 804bad9:	5d                   	pop    %ebp
 804bada:	c3                   	ret    
 804badb:	90                   	nop    
 804badc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804bae0:	55                   	push   %ebp
 804bae1:	89 e5                	mov    %esp,%ebp
 804bae3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804bae6:	89 ca                	mov    %ecx,%edx
 804bae8:	89 c8                	mov    %ecx,%eax
 804baea:	83 e0 03             	and    $0x3,%eax
 804baed:	74 16                	je     0x804bb05
 804baef:	7a 0f                	jp     0x804bb00
 804baf1:	83 f8 02             	cmp    $0x2,%eax
 804baf4:	74 05                	je     0x804bafb
 804baf6:	38 22                	cmp    %ah,(%edx)
 804baf8:	74 2b                	je     0x804bb25
 804bafa:	42                   	inc    %edx
 804bafb:	38 22                	cmp    %ah,(%edx)
 804bafd:	74 26                	je     0x804bb25
 804baff:	42                   	inc    %edx
 804bb00:	38 22                	cmp    %ah,(%edx)
 804bb02:	74 21                	je     0x804bb25
 804bb04:	42                   	inc    %edx
 804bb05:	8b 02                	mov    (%edx),%eax
 804bb07:	84 c0                	test   %al,%al
 804bb09:	74 1a                	je     0x804bb25
 804bb0b:	84 e4                	test   %ah,%ah
 804bb0d:	74 15                	je     0x804bb24
 804bb0f:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804bb14:	74 0d                	je     0x804bb23
 804bb16:	83 c2 04             	add    $0x4,%edx
 804bb19:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804bb1e:	75 e5                	jne    0x804bb05
 804bb20:	83 ea 03             	sub    $0x3,%edx
 804bb23:	42                   	inc    %edx
 804bb24:	42                   	inc    %edx
 804bb25:	29 ca                	sub    %ecx,%edx
 804bb27:	39 15 f8 ba 05 08    	cmp    %edx,0x805baf8
 804bb2d:	73 04                	jae    0x804bb33
 804bb2f:	31 c0                	xor    %eax,%eax
 804bb31:	eb 17                	jmp    0x804bb4a
 804bb33:	52                   	push   %edx
 804bb34:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bb39:	50                   	push   %eax
 804bb3a:	51                   	push   %ecx
 804bb3b:	e8 8c d5 ff ff       	call   0x80490cc
 804bb40:	85 c0                	test   %eax,%eax
 804bb42:	0f 94 c0             	sete   %al
 804bb45:	25 ff 00 00 00       	and    $0xff,%eax
 804bb4a:	89 ec                	mov    %ebp,%esp
 804bb4c:	5d                   	pop    %ebp
 804bb4d:	c3                   	ret    
 804bb4e:	89 f6                	mov    %esi,%esi
 804bb50:	55                   	push   %ebp
 804bb51:	89 e5                	mov    %esp,%ebp
 804bb53:	83 ec 40             	sub    $0x40,%esp
 804bb56:	57                   	push   %edi
 804bb57:	56                   	push   %esi
 804bb58:	31 d2                	xor    %edx,%edx
 804bb5a:	53                   	push   %ebx
 804bb5b:	31 db                	xor    %ebx,%ebx
 804bb5d:	8d 76 00             	lea    0x0(%esi),%esi
 804bb60:	8b 35 f8 ba 05 08    	mov    0x805baf8,%esi
 804bb66:	85 f6                	test   %esi,%esi
 804bb68:	0f 84 36 14 00 00    	je     0x804cfa4
 804bb6e:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bb73:	31 c9                	xor    %ecx,%ecx
 804bb75:	4e                   	dec    %esi
 804bb76:	8a 08                	mov    (%eax),%cl
 804bb78:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804bb7b:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804bb81:	89 35 f8 ba 05 08    	mov    %esi,0x805baf8
 804bb87:	89 c8                	mov    %ecx,%eax
 804bb89:	83 c0 f6             	add    $0xfffffff6,%eax
 804bb8c:	83 f8 72             	cmp    $0x72,%eax
 804bb8f:	0f 87 62 13 00 00    	ja     0x804cef7
 804bb95:	ff 24 85 5c 92 05 08 	jmp    *0x805925c(,%eax,4)
 804bb9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804bba0:	85 d2                	test   %edx,%edx
 804bba2:	0f 85 4f 13 00 00    	jne    0x804cef7
 804bba8:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804bbaf:	75 43                	jne    0x804bbf4
 804bbb1:	8b 15 38 b5 05 08    	mov    0x805b538,%edx
 804bbb7:	85 d2                	test   %edx,%edx
 804bbb9:	74 0d                	je     0x804bbc8
 804bbbb:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804bbc0:	39 05 3c b5 05 08    	cmp    %eax,0x805b53c
 804bbc6:	74 23                	je     0x804bbeb
 804bbc8:	6a 05                	push   $0x5
 804bbca:	68 0a 92 05 08       	push   $0x805920a
 804bbcf:	6a 00                	push   $0x0
 804bbd1:	e8 e6 d5 ff ff       	call   0x80491bc
 804bbd6:	83 c4 0c             	add    $0xc,%esp
 804bbd9:	89 c2                	mov    %eax,%edx
 804bbdb:	89 15 38 b5 05 08    	mov    %edx,0x805b538
 804bbe1:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804bbe6:	a3 3c b5 05 08       	mov    %eax,0x805b53c
 804bbeb:	52                   	push   %edx
 804bbec:	e8 cf b5 00 00       	call   0x80571c0
 804bbf1:	83 c4 04             	add    $0x4,%esp
 804bbf4:	ba 01 00 00 00       	mov    $0x1,%edx
 804bbf9:	e9 97 13 00 00       	jmp    0x804cf95
 804bbfe:	89 f6                	mov    %esi,%esi
 804bc00:	85 d2                	test   %edx,%edx
 804bc02:	0f 85 ef 12 00 00    	jne    0x804cef7
 804bc08:	f6 05 e0 ba 05 08 08 	testb  $0x8,0x805bae0
 804bc0f:	0f 85 24 01 00 00    	jne    0x804bd39
 804bc15:	a1 fc ba 05 08       	mov    0x805bafc,%eax
 804bc1a:	83 f8 ff             	cmp    $0xffffffff,%eax
 804bc1d:	0f 84 16 01 00 00    	je     0x804bd39
 804bc23:	3d 0f 01 00 00       	cmp    $0x10f,%eax
 804bc28:	0f 84 0b 01 00 00    	je     0x804bd39
 804bc2e:	3d 0d 01 00 00       	cmp    $0x10d,%eax
 804bc33:	0f 85 be 12 00 00    	jne    0x804cef7
 804bc39:	e9 fb 00 00 00       	jmp    0x804bd39
 804bc3e:	89 f6                	mov    %esi,%esi
 804bc40:	85 d2                	test   %edx,%edx
 804bc42:	0f 85 af 12 00 00    	jne    0x804cef7
 804bc48:	8b 1d e0 ba 05 08    	mov    0x805bae0,%ebx
 804bc4e:	f6 c3 08             	test   $0x8,%bl
 804bc51:	0f 85 0e 01 00 00    	jne    0x804bd65
 804bc57:	8b 15 f8 ba 05 08    	mov    0x805baf8,%edx
 804bc5d:	85 d2                	test   %edx,%edx
 804bc5f:	0f 84 00 01 00 00    	je     0x804bd65
 804bc65:	f6 c7 20             	test   $0x20,%bh
 804bc68:	74 16                	je     0x804bc80
 804bc6a:	85 d2                	test   %edx,%edx
 804bc6c:	7e 2b                	jle    0x804bc99
 804bc6e:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bc73:	80 38 29             	cmpb   $0x29,(%eax)
 804bc76:	0f 84 e9 00 00 00    	je     0x804bd65
 804bc7c:	eb 1b                	jmp    0x804bc99
 804bc7e:	89 f6                	mov    %esi,%esi
 804bc80:	83 fa 01             	cmp    $0x1,%edx
 804bc83:	7e 14                	jle    0x804bc99
 804bc85:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bc8a:	80 38 5c             	cmpb   $0x5c,(%eax)
 804bc8d:	75 0a                	jne    0x804bc99
 804bc8f:	80 78 01 29          	cmpb   $0x29,0x1(%eax)
 804bc93:	0f 84 cc 00 00 00    	je     0x804bd65
 804bc99:	66 83 3d e0 ba 05 08 	cmpw   $0x0,0x805bae0
 804bca0:	00 
 804bca1:	7d 14                	jge    0x804bcb7
 804bca3:	85 d2                	test   %edx,%edx
 804bca5:	7e 29                	jle    0x804bcd0
 804bca7:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bcac:	80 38 7c             	cmpb   $0x7c,(%eax)
 804bcaf:	0f 84 b0 00 00 00    	je     0x804bd65
 804bcb5:	eb 19                	jmp    0x804bcd0
 804bcb7:	83 fa 01             	cmp    $0x1,%edx
 804bcba:	7e 14                	jle    0x804bcd0
 804bcbc:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bcc1:	80 38 5c             	cmpb   $0x5c,(%eax)
 804bcc4:	75 0a                	jne    0x804bcd0
 804bcc6:	80 78 01 7c          	cmpb   $0x7c,0x1(%eax)
 804bcca:	0f 84 95 00 00 00    	je     0x804bd65
 804bcd0:	f6 c7 08             	test   $0x8,%bh
 804bcd3:	0f 84 1e 12 00 00    	je     0x804cef7
 804bcd9:	85 d2                	test   %edx,%edx
 804bcdb:	0f 8e 16 12 00 00    	jle    0x804cef7
 804bce1:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804bce6:	80 38 0a             	cmpb   $0xa,(%eax)
 804bce9:	0f 85 08 12 00 00    	jne    0x804cef7
 804bcef:	eb 74                	jmp    0x804bd65
 804bcf1:	85 d2                	test   %edx,%edx
 804bcf3:	0f 84 fe 11 00 00    	je     0x804cef7
 804bcf9:	f6 05 e1 ba 05 08 40 	testb  $0x40,0x805bae1
 804bd00:	0f 85 f1 11 00 00    	jne    0x804cef7
 804bd06:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804bd0d:	00 00 00 
 804bd10:	c7 05 fc ba 05 08 01 	movl   $0x101,0x805bafc
 804bd17:	01 00 00 
 804bd1a:	b8 01 01 00 00       	mov    $0x101,%eax
 804bd1f:	e9 8f 12 00 00       	jmp    0x804cfb3
 804bd24:	85 d2                	test   %edx,%edx
 804bd26:	0f 84 cb 11 00 00    	je     0x804cef7
 804bd2c:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804bd33:	0f 85 be 11 00 00    	jne    0x804cef7
 804bd39:	c7 05 fc ba 05 08 02 	movl   $0x102,0x805bafc
 804bd40:	01 00 00 
 804bd43:	b8 02 01 00 00       	mov    $0x102,%eax
 804bd48:	e9 66 12 00 00       	jmp    0x804cfb3
 804bd4d:	8d 76 00             	lea    0x0(%esi),%esi
 804bd50:	85 d2                	test   %edx,%edx
 804bd52:	0f 84 9f 11 00 00    	je     0x804cef7
 804bd58:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804bd5f:	0f 85 92 11 00 00    	jne    0x804cef7
 804bd65:	c7 05 fc ba 05 08 03 	movl   $0x103,0x805bafc
 804bd6c:	01 00 00 
 804bd6f:	b8 03 01 00 00       	mov    $0x103,%eax
 804bd74:	e9 3a 12 00 00       	jmp    0x804cfb3
 804bd79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804bd80:	85 d2                	test   %edx,%edx
 804bd82:	0f 84 6f 11 00 00    	je     0x804cef7
 804bd88:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804bd8f:	0f 85 62 11 00 00    	jne    0x804cef7
 804bd95:	c7 05 fc ba 05 08 04 	movl   $0x104,0x805bafc
 804bd9c:	01 00 00 
 804bd9f:	b8 04 01 00 00       	mov    $0x104,%eax
 804bda4:	e9 0a 12 00 00       	jmp    0x804cfb3
 804bda9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804bdb0:	85 d2                	test   %edx,%edx
 804bdb2:	0f 84 3f 11 00 00    	je     0x804cef7
 804bdb8:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804bdbf:	0f 85 32 11 00 00    	jne    0x804cef7
 804bdc5:	c7 05 fc ba 05 08 05 	movl   $0x105,0x805bafc
 804bdcc:	01 00 00 
 804bdcf:	b8 05 01 00 00       	mov    $0x105,%eax
 804bdd4:	e9 da 11 00 00       	jmp    0x804cfb3
 804bdd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804bde0:	85 d2                	test   %edx,%edx
 804bde2:	0f 84 0f 11 00 00    	je     0x804cef7
 804bde8:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804bdef:	0f 85 02 11 00 00    	jne    0x804cef7
 804bdf5:	c7 05 fc ba 05 08 06 	movl   $0x106,0x805bafc
 804bdfc:	01 00 00 
 804bdff:	b8 06 01 00 00       	mov    $0x106,%eax
 804be04:	e9 aa 11 00 00       	jmp    0x804cfb3
 804be09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804be10:	85 d2                	test   %edx,%edx
 804be12:	0f 84 df 10 00 00    	je     0x804cef7
 804be18:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804be1f:	0f 85 d2 10 00 00    	jne    0x804cef7
 804be25:	c7 05 fc ba 05 08 07 	movl   $0x107,0x805bafc
 804be2c:	01 00 00 
 804be2f:	b8 07 01 00 00       	mov    $0x107,%eax
 804be34:	e9 7a 11 00 00       	jmp    0x804cfb3
 804be39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804be40:	8b 1d e0 ba 05 08    	mov    0x805bae0,%ebx
 804be46:	f6 c7 04             	test   $0x4,%bh
 804be49:	0f 85 a8 10 00 00    	jne    0x804cef7
 804be4f:	89 d8                	mov    %ebx,%eax
 804be51:	c1 e8 01             	shr    $0x1,%eax
 804be54:	83 e0 01             	and    $0x1,%eax
 804be57:	39 c2                	cmp    %eax,%edx
 804be59:	0f 85 98 10 00 00    	jne    0x804cef7
 804be5f:	f6 c3 10             	test   $0x10,%bl
 804be62:	75 0d                	jne    0x804be71
 804be64:	83 3d 00 bb 05 08 00 	cmpl   $0x0,0x805bb00
 804be6b:	0f 85 86 10 00 00    	jne    0x804cef7
 804be71:	c7 05 fc ba 05 08 08 	movl   $0x108,0x805bafc
 804be78:	01 00 00 
 804be7b:	b8 08 01 00 00       	mov    $0x108,%eax
 804be80:	e9 2e 11 00 00       	jmp    0x804cfb3
 804be85:	85 d2                	test   %edx,%edx
 804be87:	0f 85 6a 10 00 00    	jne    0x804cef7
 804be8d:	f6 05 e0 ba 05 08 10 	testb  $0x10,0x805bae0
 804be94:	75 0d                	jne    0x804bea3
 804be96:	83 3d 00 bb 05 08 00 	cmpl   $0x0,0x805bb00
 804be9d:	0f 85 54 10 00 00    	jne    0x804cef7
 804bea3:	c7 05 fc ba 05 08 09 	movl   $0x109,0x805bafc
 804beaa:	01 00 00 
 804bead:	b8 09 01 00 00       	mov    $0x109,%eax
 804beb2:	e9 fc 10 00 00       	jmp    0x804cfb3
 804beb7:	8b 1d e0 ba 05 08    	mov    0x805bae0,%ebx
 804bebd:	f6 c7 04             	test   $0x4,%bh
 804bec0:	0f 85 31 10 00 00    	jne    0x804cef7
 804bec6:	89 d8                	mov    %ebx,%eax
 804bec8:	c1 e8 01             	shr    $0x1,%eax
 804becb:	83 e0 01             	and    $0x1,%eax
 804bece:	39 c2                	cmp    %eax,%edx
 804bed0:	0f 85 21 10 00 00    	jne    0x804cef7
 804bed6:	f6 c3 10             	test   $0x10,%bl
 804bed9:	75 0d                	jne    0x804bee8
 804bedb:	83 3d 00 bb 05 08 00 	cmpl   $0x0,0x805bb00
 804bee2:	0f 85 0f 10 00 00    	jne    0x804cef7
 804bee8:	c7 05 fc ba 05 08 0a 	movl   $0x10a,0x805bafc
 804beef:	01 00 00 
 804bef2:	b8 0a 01 00 00       	mov    $0x10a,%eax
 804bef7:	e9 b7 10 00 00       	jmp    0x804cfb3
 804befc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804bf00:	8b 1d e0 ba 05 08    	mov    0x805bae0,%ebx
 804bf06:	f6 c7 02             	test   $0x2,%bh
 804bf09:	0f 84 e8 0f 00 00    	je     0x804cef7
 804bf0f:	89 d8                	mov    %ebx,%eax
 804bf11:	c1 e8 0c             	shr    $0xc,%eax
 804bf14:	34 01                	xor    $0x1,%al
 804bf16:	83 e0 01             	and    $0x1,%eax
 804bf19:	39 c2                	cmp    %eax,%edx
 804bf1b:	0f 85 d6 0f 00 00    	jne    0x804cef7
 804bf21:	f6 c3 10             	test   $0x10,%bl
 804bf24:	75 0d                	jne    0x804bf33
 804bf26:	83 3d 00 bb 05 08 00 	cmpl   $0x0,0x805bb00
 804bf2d:	0f 85 c4 0f 00 00    	jne    0x804cef7
 804bf33:	f6 c7 10             	test   $0x10,%bh
 804bf36:	0f 84 e1 00 00 00    	je     0x804c01d
 804bf3c:	c7 45 c0 ff ff ff ff 	movl   $0xffffffff,0xffffffc0(%ebp)
 804bf43:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 804bf46:	8b 15 f4 ba 05 08    	mov    0x805baf4,%edx
 804bf4c:	89 d3                	mov    %edx,%ebx
 804bf4e:	03 1d f8 ba 05 08    	add    0x805baf8,%ebx
 804bf54:	39 da                	cmp    %ebx,%edx
 804bf56:	0f 84 8a 00 00 00    	je     0x804bfe6
 804bf5c:	8b 3d d4 b2 05 08    	mov    0x805b2d4,%edi
 804bf62:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 804bf65:	0f be 0a             	movsbl (%edx),%ecx
 804bf68:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 804bf6b:	89 4d c4             	mov    %ecx,0xffffffc4(%ebp)
 804bf6e:	f6 44 4f 01 08       	testb  $0x8,0x1(%edi,%ecx,2)
 804bf73:	74 29                	je     0x804bf9e
 804bf75:	83 7d c0 00          	cmpl   $0x0,0xffffffc0(%ebp)
 804bf79:	7c 15                	jl     0x804bf90
 804bf7b:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 804bf7e:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 804bf81:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 804bf84:	8d 44 47 d0          	lea    0xffffffd0(%edi,%eax,2),%eax
 804bf88:	eb 0c                	jmp    0x804bf96
 804bf8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804bf90:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 804bf93:	83 c0 d0             	add    $0xffffffd0,%eax
 804bf96:	89 45 c0             	mov    %eax,0xffffffc0(%ebp)
 804bf99:	42                   	inc    %edx
 804bf9a:	39 da                	cmp    %ebx,%edx
 804bf9c:	75 c7                	jne    0x804bf65
 804bf9e:	39 da                	cmp    %ebx,%edx
 804bfa0:	74 44                	je     0x804bfe6
 804bfa2:	80 3a 2c             	cmpb   $0x2c,(%edx)
 804bfa5:	75 3f                	jne    0x804bfe6
 804bfa7:	42                   	inc    %edx
 804bfa8:	39 da                	cmp    %ebx,%edx
 804bfaa:	0f 84 47 0f 00 00    	je     0x804cef7
 804bfb0:	8b 4d d4             	mov    0xffffffd4(%ebp),%ecx
 804bfb3:	89 4d d0             	mov    %ecx,0xffffffd0(%ebp)
 804bfb6:	0f be 3a             	movsbl (%edx),%edi
 804bfb9:	8b 4d d0             	mov    0xffffffd0(%ebp),%ecx
 804bfbc:	89 7d c4             	mov    %edi,0xffffffc4(%ebp)
 804bfbf:	f6 44 79 01 08       	testb  $0x8,0x1(%ecx,%edi,2)
 804bfc4:	74 23                	je     0x804bfe9
 804bfc6:	85 f6                	test   %esi,%esi
 804bfc8:	7c 09                	jl     0x804bfd3
 804bfca:	8d 04 b6             	lea    (%esi,%esi,4),%eax
 804bfcd:	8d 44 47 d0          	lea    0xffffffd0(%edi,%eax,2),%eax
 804bfd1:	eb 06                	jmp    0x804bfd9
 804bfd3:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 804bfd6:	83 c0 d0             	add    $0xffffffd0,%eax
 804bfd9:	89 c6                	mov    %eax,%esi
 804bfdb:	42                   	inc    %edx
 804bfdc:	39 da                	cmp    %ebx,%edx
 804bfde:	0f 84 13 0f 00 00    	je     0x804cef7
 804bfe4:	eb d0                	jmp    0x804bfb6
 804bfe6:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 804bfe9:	39 da                	cmp    %ebx,%edx
 804bfeb:	0f 84 06 0f 00 00    	je     0x804cef7
 804bff1:	80 3a 7d             	cmpb   $0x7d,(%edx)
 804bff4:	0f 85 fd 0e 00 00    	jne    0x804cef7
 804bffa:	83 7d c0 00          	cmpl   $0x0,0xffffffc0(%ebp)
 804bffe:	0f 8c f3 0e 00 00    	jl     0x804cef7
 804c004:	81 fe ff 7f 00 00    	cmp    $0x7fff,%esi
 804c00a:	0f 8f e7 0e 00 00    	jg     0x804cef7
 804c010:	85 f6                	test   %esi,%esi
 804c012:	7c 09                	jl     0x804c01d
 804c014:	3b 75 c0             	cmp    0xffffffc0(%ebp),%esi
 804c017:	0f 8c da 0e 00 00    	jl     0x804cef7
 804c01d:	c7 05 08 bb 05 08 00 	movl   $0x0,0x805bb08
 804c024:	00 00 00 
 804c027:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c02e:	0f 85 85 00 00 00    	jne    0x804c0b9
 804c034:	8b 15 40 b5 05 08    	mov    0x805b540,%edx
 804c03a:	85 d2                	test   %edx,%edx
 804c03c:	74 0d                	je     0x804c04b
 804c03e:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c043:	39 05 44 b5 05 08    	cmp    %eax,0x805b544
 804c049:	74 23                	je     0x804c06e
 804c04b:	6a 05                	push   $0x5
 804c04d:	68 1e 92 05 08       	push   $0x805921e
 804c052:	6a 00                	push   $0x0
 804c054:	e8 63 d1 ff ff       	call   0x80491bc
 804c059:	83 c4 0c             	add    $0xc,%esp
 804c05c:	89 c2                	mov    %eax,%edx
 804c05e:	89 15 40 b5 05 08    	mov    %edx,0x805b540
 804c064:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c069:	a3 44 b5 05 08       	mov    %eax,0x805b544
 804c06e:	85 d2                	test   %edx,%edx
 804c070:	0f 84 2e 0f 00 00    	je     0x804cfa4
 804c076:	8b 15 48 b5 05 08    	mov    0x805b548,%edx
 804c07c:	85 d2                	test   %edx,%edx
 804c07e:	74 0d                	je     0x804c08d
 804c080:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c085:	39 05 4c b5 05 08    	cmp    %eax,0x805b54c
 804c08b:	74 23                	je     0x804c0b0
 804c08d:	6a 05                	push   $0x5
 804c08f:	68 1e 92 05 08       	push   $0x805921e
 804c094:	6a 00                	push   $0x0
 804c096:	e8 21 d1 ff ff       	call   0x80491bc
 804c09b:	83 c4 0c             	add    $0xc,%esp
 804c09e:	89 c2                	mov    %eax,%edx
 804c0a0:	89 15 48 b5 05 08    	mov    %edx,0x805b548
 804c0a6:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c0ab:	a3 4c b5 05 08       	mov    %eax,0x805b54c
 804c0b0:	52                   	push   %edx
 804c0b1:	e8 0a b1 00 00       	call   0x80571c0
 804c0b6:	83 c4 04             	add    $0x4,%esp
 804c0b9:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c0be:	31 c9                	xor    %ecx,%ecx
 804c0c0:	8a 08                	mov    (%eax),%cl
 804c0c2:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c0c5:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c0cb:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804c0d0:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c0d6:	f6 44 48 01 08       	testb  $0x8,0x1(%eax,%ecx,2)
 804c0db:	0f 84 df 00 00 00    	je     0x804c1c0
 804c0e1:	83 c1 d0             	add    $0xffffffd0,%ecx
 804c0e4:	89 0d 08 bb 05 08    	mov    %ecx,0x805bb08
 804c0ea:	eb 18                	jmp    0x804c104
 804c0ec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804c0f0:	a1 08 bb 05 08       	mov    0x805bb08,%eax
 804c0f5:	8d 04 80             	lea    (%eax,%eax,4),%eax
 804c0f8:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804c0fb:	8d 44 47 d0          	lea    0xffffffd0(%edi,%eax,2),%eax
 804c0ff:	a3 08 bb 05 08       	mov    %eax,0x805bb08
 804c104:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c10b:	0f 85 85 00 00 00    	jne    0x804c196
 804c111:	8b 15 50 b5 05 08    	mov    0x805b550,%edx
 804c117:	85 d2                	test   %edx,%edx
 804c119:	74 0d                	je     0x804c128
 804c11b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c120:	39 05 54 b5 05 08    	cmp    %eax,0x805b554
 804c126:	74 23                	je     0x804c14b
 804c128:	6a 05                	push   $0x5
 804c12a:	68 1e 92 05 08       	push   $0x805921e
 804c12f:	6a 00                	push   $0x0
 804c131:	e8 86 d0 ff ff       	call   0x80491bc
 804c136:	83 c4 0c             	add    $0xc,%esp
 804c139:	89 c2                	mov    %eax,%edx
 804c13b:	89 15 50 b5 05 08    	mov    %edx,0x805b550
 804c141:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c146:	a3 54 b5 05 08       	mov    %eax,0x805b554
 804c14b:	85 d2                	test   %edx,%edx
 804c14d:	0f 84 51 0e 00 00    	je     0x804cfa4
 804c153:	8b 15 58 b5 05 08    	mov    0x805b558,%edx
 804c159:	85 d2                	test   %edx,%edx
 804c15b:	74 0d                	je     0x804c16a
 804c15d:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c162:	39 05 5c b5 05 08    	cmp    %eax,0x805b55c
 804c168:	74 23                	je     0x804c18d
 804c16a:	6a 05                	push   $0x5
 804c16c:	68 1e 92 05 08       	push   $0x805921e
 804c171:	6a 00                	push   $0x0
 804c173:	e8 44 d0 ff ff       	call   0x80491bc
 804c178:	83 c4 0c             	add    $0xc,%esp
 804c17b:	89 c2                	mov    %eax,%edx
 804c17d:	89 15 58 b5 05 08    	mov    %edx,0x805b558
 804c183:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c188:	a3 5c b5 05 08       	mov    %eax,0x805b55c
 804c18d:	52                   	push   %edx
 804c18e:	e8 2d b0 00 00       	call   0x80571c0
 804c193:	83 c4 04             	add    $0x4,%esp
 804c196:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c19b:	31 c9                	xor    %ecx,%ecx
 804c19d:	8a 08                	mov    (%eax),%cl
 804c19f:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c1a2:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c1a8:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804c1ad:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c1b3:	f6 44 48 01 08       	testb  $0x8,0x1(%eax,%ecx,2)
 804c1b8:	0f 85 32 ff ff ff    	jne    0x804c0f0
 804c1be:	eb 43                	jmp    0x804c203
 804c1c0:	8b 15 60 b5 05 08    	mov    0x805b560,%edx
 804c1c6:	85 d2                	test   %edx,%edx
 804c1c8:	74 0d                	je     0x804c1d7
 804c1ca:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c1cf:	39 05 64 b5 05 08    	cmp    %eax,0x805b564
 804c1d5:	74 23                	je     0x804c1fa
 804c1d7:	6a 05                	push   $0x5
 804c1d9:	68 36 92 05 08       	push   $0x8059236
 804c1de:	6a 00                	push   $0x0
 804c1e0:	e8 d7 cf ff ff       	call   0x80491bc
 804c1e5:	83 c4 0c             	add    $0xc,%esp
 804c1e8:	89 c2                	mov    %eax,%edx
 804c1ea:	89 15 60 b5 05 08    	mov    %edx,0x805b560
 804c1f0:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c1f5:	a3 64 b5 05 08       	mov    %eax,0x805b564
 804c1fa:	52                   	push   %edx
 804c1fb:	e8 c0 af 00 00       	call   0x80571c0
 804c200:	83 c4 04             	add    $0x4,%esp
 804c203:	83 7d dc 2c          	cmpl   $0x2c,0xffffffdc(%ebp)
 804c207:	0f 85 f7 01 00 00    	jne    0x804c404
 804c20d:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c214:	0f 85 85 00 00 00    	jne    0x804c29f
 804c21a:	8b 15 68 b5 05 08    	mov    0x805b568,%edx
 804c220:	85 d2                	test   %edx,%edx
 804c222:	74 0d                	je     0x804c231
 804c224:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c229:	39 05 6c b5 05 08    	cmp    %eax,0x805b56c
 804c22f:	74 23                	je     0x804c254
 804c231:	6a 05                	push   $0x5
 804c233:	68 1e 92 05 08       	push   $0x805921e
 804c238:	6a 00                	push   $0x0
 804c23a:	e8 7d cf ff ff       	call   0x80491bc
 804c23f:	83 c4 0c             	add    $0xc,%esp
 804c242:	89 c2                	mov    %eax,%edx
 804c244:	89 15 68 b5 05 08    	mov    %edx,0x805b568
 804c24a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c24f:	a3 6c b5 05 08       	mov    %eax,0x805b56c
 804c254:	85 d2                	test   %edx,%edx
 804c256:	0f 84 48 0d 00 00    	je     0x804cfa4
 804c25c:	8b 15 70 b5 05 08    	mov    0x805b570,%edx
 804c262:	85 d2                	test   %edx,%edx
 804c264:	74 0d                	je     0x804c273
 804c266:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c26b:	39 05 74 b5 05 08    	cmp    %eax,0x805b574
 804c271:	74 23                	je     0x804c296
 804c273:	6a 05                	push   $0x5
 804c275:	68 1e 92 05 08       	push   $0x805921e
 804c27a:	6a 00                	push   $0x0
 804c27c:	e8 3b cf ff ff       	call   0x80491bc
 804c281:	83 c4 0c             	add    $0xc,%esp
 804c284:	89 c2                	mov    %eax,%edx
 804c286:	89 15 70 b5 05 08    	mov    %edx,0x805b570
 804c28c:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c291:	a3 74 b5 05 08       	mov    %eax,0x805b574
 804c296:	52                   	push   %edx
 804c297:	e8 24 af 00 00       	call   0x80571c0
 804c29c:	83 c4 04             	add    $0x4,%esp
 804c29f:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c2a4:	31 c9                	xor    %ecx,%ecx
 804c2a6:	8a 08                	mov    (%eax),%cl
 804c2a8:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c2ab:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c2b1:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804c2b6:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c2bc:	f6 44 48 01 08       	testb  $0x8,0x1(%eax,%ecx,2)
 804c2c1:	75 0f                	jne    0x804c2d2
 804c2c3:	c7 05 0c bb 05 08 ff 	movl   $0xffffffff,0x805bb0c
 804c2ca:	ff ff ff 
 804c2cd:	e9 3c 01 00 00       	jmp    0x804c40e
 804c2d2:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804c2d5:	83 c7 d0             	add    $0xffffffd0,%edi
 804c2d8:	89 3d 0c bb 05 08    	mov    %edi,0x805bb0c
 804c2de:	eb 14                	jmp    0x804c2f4
 804c2e0:	a1 0c bb 05 08       	mov    0x805bb0c,%eax
 804c2e5:	8d 04 80             	lea    (%eax,%eax,4),%eax
 804c2e8:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 804c2eb:	8d 44 41 d0          	lea    0xffffffd0(%ecx,%eax,2),%eax
 804c2ef:	a3 0c bb 05 08       	mov    %eax,0x805bb0c
 804c2f4:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c2fb:	0f 85 85 00 00 00    	jne    0x804c386
 804c301:	8b 15 78 b5 05 08    	mov    0x805b578,%edx
 804c307:	85 d2                	test   %edx,%edx
 804c309:	74 0d                	je     0x804c318
 804c30b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c310:	39 05 7c b5 05 08    	cmp    %eax,0x805b57c
 804c316:	74 23                	je     0x804c33b
 804c318:	6a 05                	push   $0x5
 804c31a:	68 1e 92 05 08       	push   $0x805921e
 804c31f:	6a 00                	push   $0x0
 804c321:	e8 96 ce ff ff       	call   0x80491bc
 804c326:	83 c4 0c             	add    $0xc,%esp
 804c329:	89 c2                	mov    %eax,%edx
 804c32b:	89 15 78 b5 05 08    	mov    %edx,0x805b578
 804c331:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c336:	a3 7c b5 05 08       	mov    %eax,0x805b57c
 804c33b:	85 d2                	test   %edx,%edx
 804c33d:	0f 84 61 0c 00 00    	je     0x804cfa4
 804c343:	8b 15 80 b5 05 08    	mov    0x805b580,%edx
 804c349:	85 d2                	test   %edx,%edx
 804c34b:	74 0d                	je     0x804c35a
 804c34d:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c352:	39 05 84 b5 05 08    	cmp    %eax,0x805b584
 804c358:	74 23                	je     0x804c37d
 804c35a:	6a 05                	push   $0x5
 804c35c:	68 1e 92 05 08       	push   $0x805921e
 804c361:	6a 00                	push   $0x0
 804c363:	e8 54 ce ff ff       	call   0x80491bc
 804c368:	83 c4 0c             	add    $0xc,%esp
 804c36b:	89 c2                	mov    %eax,%edx
 804c36d:	89 15 80 b5 05 08    	mov    %edx,0x805b580
 804c373:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c378:	a3 84 b5 05 08       	mov    %eax,0x805b584
 804c37d:	52                   	push   %edx
 804c37e:	e8 3d ae 00 00       	call   0x80571c0
 804c383:	83 c4 04             	add    $0x4,%esp
 804c386:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c38b:	31 c9                	xor    %ecx,%ecx
 804c38d:	8a 08                	mov    (%eax),%cl
 804c38f:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c392:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c398:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804c39d:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c3a3:	f6 44 48 01 08       	testb  $0x8,0x1(%eax,%ecx,2)
 804c3a8:	0f 85 32 ff ff ff    	jne    0x804c2e0
 804c3ae:	a1 0c bb 05 08       	mov    0x805bb0c,%eax
 804c3b3:	85 c0                	test   %eax,%eax
 804c3b5:	7c 57                	jl     0x804c40e
 804c3b7:	3b 05 08 bb 05 08    	cmp    0x805bb08,%eax
 804c3bd:	7d 4f                	jge    0x804c40e
 804c3bf:	8b 15 88 b5 05 08    	mov    0x805b588,%edx
 804c3c5:	85 d2                	test   %edx,%edx
 804c3c7:	74 0d                	je     0x804c3d6
 804c3c9:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c3ce:	39 05 8c b5 05 08    	cmp    %eax,0x805b58c
 804c3d4:	74 23                	je     0x804c3f9
 804c3d6:	6a 05                	push   $0x5
 804c3d8:	68 36 92 05 08       	push   $0x8059236
 804c3dd:	6a 00                	push   $0x0
 804c3df:	e8 d8 cd ff ff       	call   0x80491bc
 804c3e4:	83 c4 0c             	add    $0xc,%esp
 804c3e7:	89 c2                	mov    %eax,%edx
 804c3e9:	89 15 88 b5 05 08    	mov    %edx,0x805b588
 804c3ef:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c3f4:	a3 8c b5 05 08       	mov    %eax,0x805b58c
 804c3f9:	52                   	push   %edx
 804c3fa:	e8 c1 ad 00 00       	call   0x80571c0
 804c3ff:	83 c4 04             	add    $0x4,%esp
 804c402:	eb 0a                	jmp    0x804c40e
 804c404:	a1 08 bb 05 08       	mov    0x805bb08,%eax
 804c409:	a3 0c bb 05 08       	mov    %eax,0x805bb0c
 804c40e:	f6 05 e1 ba 05 08 10 	testb  $0x10,0x805bae1
 804c415:	0f 85 f3 00 00 00    	jne    0x804c50e
 804c41b:	83 7d dc 5c          	cmpl   $0x5c,0xffffffdc(%ebp)
 804c41f:	74 43                	je     0x804c464
 804c421:	8b 15 90 b5 05 08    	mov    0x805b590,%edx
 804c427:	85 d2                	test   %edx,%edx
 804c429:	74 0d                	je     0x804c438
 804c42b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c430:	39 05 94 b5 05 08    	cmp    %eax,0x805b594
 804c436:	74 23                	je     0x804c45b
 804c438:	6a 05                	push   $0x5
 804c43a:	68 36 92 05 08       	push   $0x8059236
 804c43f:	6a 00                	push   $0x0
 804c441:	e8 76 cd ff ff       	call   0x80491bc
 804c446:	83 c4 0c             	add    $0xc,%esp
 804c449:	89 c2                	mov    %eax,%edx
 804c44b:	89 15 90 b5 05 08    	mov    %edx,0x805b590
 804c451:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c456:	a3 94 b5 05 08       	mov    %eax,0x805b594
 804c45b:	52                   	push   %edx
 804c45c:	e8 5f ad 00 00       	call   0x80571c0
 804c461:	83 c4 04             	add    $0x4,%esp
 804c464:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c46b:	0f 85 85 00 00 00    	jne    0x804c4f6
 804c471:	8b 15 98 b5 05 08    	mov    0x805b598,%edx
 804c477:	85 d2                	test   %edx,%edx
 804c479:	74 0d                	je     0x804c488
 804c47b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c480:	39 05 9c b5 05 08    	cmp    %eax,0x805b59c
 804c486:	74 23                	je     0x804c4ab
 804c488:	6a 05                	push   $0x5
 804c48a:	68 1e 92 05 08       	push   $0x805921e
 804c48f:	6a 00                	push   $0x0
 804c491:	e8 26 cd ff ff       	call   0x80491bc
 804c496:	83 c4 0c             	add    $0xc,%esp
 804c499:	89 c2                	mov    %eax,%edx
 804c49b:	89 15 98 b5 05 08    	mov    %edx,0x805b598
 804c4a1:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c4a6:	a3 9c b5 05 08       	mov    %eax,0x805b59c
 804c4ab:	85 d2                	test   %edx,%edx
 804c4ad:	0f 84 f1 0a 00 00    	je     0x804cfa4
 804c4b3:	8b 15 a0 b5 05 08    	mov    0x805b5a0,%edx
 804c4b9:	85 d2                	test   %edx,%edx
 804c4bb:	74 0d                	je     0x804c4ca
 804c4bd:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c4c2:	39 05 a4 b5 05 08    	cmp    %eax,0x805b5a4
 804c4c8:	74 23                	je     0x804c4ed
 804c4ca:	6a 05                	push   $0x5
 804c4cc:	68 1e 92 05 08       	push   $0x805921e
 804c4d1:	6a 00                	push   $0x0
 804c4d3:	e8 e4 cc ff ff       	call   0x80491bc
 804c4d8:	83 c4 0c             	add    $0xc,%esp
 804c4db:	89 c2                	mov    %eax,%edx
 804c4dd:	89 15 a0 b5 05 08    	mov    %edx,0x805b5a0
 804c4e3:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c4e8:	a3 a4 b5 05 08       	mov    %eax,0x805b5a4
 804c4ed:	52                   	push   %edx
 804c4ee:	e8 cd ac 00 00       	call   0x80571c0
 804c4f3:	83 c4 04             	add    $0x4,%esp
 804c4f6:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c4fb:	31 c9                	xor    %ecx,%ecx
 804c4fd:	8a 08                	mov    (%eax),%cl
 804c4ff:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c502:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c508:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c50e:	83 7d dc 7d          	cmpl   $0x7d,0xffffffdc(%ebp)
 804c512:	74 40                	je     0x804c554
 804c514:	8b 15 a8 b5 05 08    	mov    0x805b5a8,%edx
 804c51a:	85 d2                	test   %edx,%edx
 804c51c:	74 0d                	je     0x804c52b
 804c51e:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c523:	39 05 ac b5 05 08    	cmp    %eax,0x805b5ac
 804c529:	74 23                	je     0x804c54e
 804c52b:	6a 05                	push   $0x5
 804c52d:	68 36 92 05 08       	push   $0x8059236
 804c532:	6a 00                	push   $0x0
 804c534:	e8 83 cc ff ff       	call   0x80491bc
 804c539:	83 c4 0c             	add    $0xc,%esp
 804c53c:	89 c2                	mov    %eax,%edx
 804c53e:	89 15 a8 b5 05 08    	mov    %edx,0x805b5a8
 804c544:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c549:	a3 ac b5 05 08       	mov    %eax,0x805b5ac
 804c54e:	52                   	push   %edx
 804c54f:	e8 6c ac 00 00       	call   0x80571c0
 804c554:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804c55b:	00 00 00 
 804c55e:	c7 05 fc ba 05 08 0b 	movl   $0x10b,0x805bafc
 804c565:	01 00 00 
 804c568:	b8 0b 01 00 00       	mov    $0x10b,%eax
 804c56d:	e9 41 0a 00 00       	jmp    0x804cfb3
 804c572:	a1 e0 ba 05 08       	mov    0x805bae0,%eax
 804c577:	f6 c4 04             	test   $0x4,%ah
 804c57a:	0f 85 77 09 00 00    	jne    0x804cef7
 804c580:	c1 e8 0f             	shr    $0xf,%eax
 804c583:	34 01                	xor    $0x1,%al
 804c585:	83 e0 01             	and    $0x1,%eax
 804c588:	39 c2                	cmp    %eax,%edx
 804c58a:	0f 85 67 09 00 00    	jne    0x804cef7
 804c590:	eb 1f                	jmp    0x804c5b1
 804c592:	a1 e0 ba 05 08       	mov    0x805bae0,%eax
 804c597:	f6 c4 04             	test   $0x4,%ah
 804c59a:	0f 85 57 09 00 00    	jne    0x804cef7
 804c5a0:	85 d2                	test   %edx,%edx
 804c5a2:	0f 85 4f 09 00 00    	jne    0x804cef7
 804c5a8:	f6 c4 08             	test   $0x8,%ah
 804c5ab:	0f 84 46 09 00 00    	je     0x804cef7
 804c5b1:	c7 05 00 bb 05 08 01 	movl   $0x1,0x805bb00
 804c5b8:	00 00 00 
 804c5bb:	c7 05 fc ba 05 08 0d 	movl   $0x10d,0x805bafc
 804c5c2:	01 00 00 
 804c5c5:	b8 0d 01 00 00       	mov    $0x10d,%eax
 804c5ca:	e9 e4 09 00 00       	jmp    0x804cfb3
 804c5cf:	90                   	nop    
 804c5d0:	a1 e0 ba 05 08       	mov    0x805bae0,%eax
 804c5d5:	c1 e8 0d             	shr    $0xd,%eax
 804c5d8:	34 01                	xor    $0x1,%al
 804c5da:	83 e0 01             	and    $0x1,%eax
 804c5dd:	39 c2                	cmp    %eax,%edx
 804c5df:	0f 85 12 09 00 00    	jne    0x804cef7
 804c5e5:	ff 05 04 bb 05 08    	incl   0x805bb04
 804c5eb:	c7 05 00 bb 05 08 01 	movl   $0x1,0x805bb00
 804c5f2:	00 00 00 
 804c5f5:	c7 05 fc ba 05 08 0f 	movl   $0x10f,0x805bafc
 804c5fc:	01 00 00 
 804c5ff:	b8 0f 01 00 00       	mov    $0x10f,%eax
 804c604:	e9 aa 09 00 00       	jmp    0x804cfb3
 804c609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804c610:	8b 1d e0 ba 05 08    	mov    0x805bae0,%ebx
 804c616:	89 d8                	mov    %ebx,%eax
 804c618:	c1 e8 0d             	shr    $0xd,%eax
 804c61b:	34 01                	xor    $0x1,%al
 804c61d:	83 e0 01             	and    $0x1,%eax
 804c620:	39 c2                	cmp    %eax,%edx
 804c622:	0f 85 cf 08 00 00    	jne    0x804cef7
 804c628:	a1 04 bb 05 08       	mov    0x805bb04,%eax
 804c62d:	85 c0                	test   %eax,%eax
 804c62f:	75 0c                	jne    0x804c63d
 804c631:	f7 c3 00 00 02 00    	test   $0x20000,%ebx
 804c637:	0f 85 ba 08 00 00    	jne    0x804cef7
 804c63d:	48                   	dec    %eax
 804c63e:	a3 04 bb 05 08       	mov    %eax,0x805bb04
 804c643:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804c64a:	00 00 00 
 804c64d:	c7 05 fc ba 05 08 10 	movl   $0x110,0x805bafc
 804c654:	01 00 00 
 804c657:	b8 10 01 00 00       	mov    $0x110,%eax
 804c65c:	e9 52 09 00 00       	jmp    0x804cfb3
 804c661:	85 d2                	test   %edx,%edx
 804c663:	0f 85 8e 08 00 00    	jne    0x804cef7
 804c669:	8d 5d e0             	lea    0xffffffe0(%ebp),%ebx
 804c66c:	53                   	push   %ebx
 804c66d:	e8 ae f1 ff ff       	call   0x804b820
 804c672:	53                   	push   %ebx
 804c673:	e8 c8 f1 ff ff       	call   0x804b840
 804c678:	83 c4 08             	add    $0x8,%esp
 804c67b:	f6 05 e0 ba 05 08 40 	testb  $0x40,0x805bae0
 804c682:	75 11                	jne    0x804c695
 804c684:	53                   	push   %ebx
 804c685:	31 c0                	xor    %eax,%eax
 804c687:	a0 ec ba 05 08       	mov    0x805baec,%al
 804c68c:	50                   	push   %eax
 804c68d:	e8 2e f1 ff ff       	call   0x804b7c0
 804c692:	83 c4 08             	add    $0x8,%esp
 804c695:	80 3d e0 ba 05 08 00 	cmpb   $0x0,0x805bae0
 804c69c:	7d 0b                	jge    0x804c6a9
 804c69e:	53                   	push   %ebx
 804c69f:	6a 00                	push   $0x0
 804c6a1:	e8 1a f1 ff ff       	call   0x804b7c0
 804c6a6:	83 c4 08             	add    $0x8,%esp
 804c6a9:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804c6b0:	00 00 00 
 804c6b3:	e9 c6 08 00 00       	jmp    0x804cf7e
 804c6b8:	85 d2                	test   %edx,%edx
 804c6ba:	0f 84 37 08 00 00    	je     0x804cef7
 804c6c0:	f6 05 e2 ba 05 08 08 	testb  $0x8,0x805bae2
 804c6c7:	0f 85 2a 08 00 00    	jne    0x804cef7
 804c6cd:	8d 7d e0             	lea    0xffffffe0(%ebp),%edi
 804c6d0:	89 7d c8             	mov    %edi,0xffffffc8(%ebp)
 804c6d3:	89 fb                	mov    %edi,%ebx
 804c6d5:	53                   	push   %ebx
 804c6d6:	e8 45 f1 ff ff       	call   0x804b820
 804c6db:	31 f6                	xor    %esi,%esi
 804c6dd:	83 c4 04             	add    $0x4,%esp
 804c6e0:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804c6e5:	f6 04 70 08          	testb  $0x8,(%eax,%esi,2)
 804c6e9:	75 05                	jne    0x804c6f0
 804c6eb:	83 fe 5f             	cmp    $0x5f,%esi
 804c6ee:	75 0a                	jne    0x804c6fa
 804c6f0:	53                   	push   %ebx
 804c6f1:	56                   	push   %esi
 804c6f2:	e8 99 f0 ff ff       	call   0x804b790
 804c6f7:	83 c4 08             	add    $0x8,%esp
 804c6fa:	46                   	inc    %esi
 804c6fb:	81 fe ff 00 00 00    	cmp    $0xff,%esi
 804c701:	7e dd                	jle    0x804c6e0
 804c703:	83 7d dc 57          	cmpl   $0x57,0xffffffdc(%ebp)
 804c707:	75 a0                	jne    0x804c6a9
 804c709:	53                   	push   %ebx
 804c70a:	e8 31 f1 ff ff       	call   0x804b840
 804c70f:	83 c4 04             	add    $0x4,%esp
 804c712:	eb 95                	jmp    0x804c6a9
 804c714:	85 d2                	test   %edx,%edx
 804c716:	0f 85 db 07 00 00    	jne    0x804cef7
 804c71c:	8d 4d e0             	lea    0xffffffe0(%ebp),%ecx
 804c71f:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 804c722:	89 4d cc             	mov    %ecx,0xffffffcc(%ebp)
 804c725:	51                   	push   %ecx
 804c726:	e8 f5 f0 ff ff       	call   0x804b820
 804c72b:	83 c4 04             	add    $0x4,%esp
 804c72e:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c735:	0f 85 85 00 00 00    	jne    0x804c7c0
 804c73b:	8b 15 b0 b5 05 08    	mov    0x805b5b0,%edx
 804c741:	85 d2                	test   %edx,%edx
 804c743:	74 0d                	je     0x804c752
 804c745:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c74a:	39 05 b4 b5 05 08    	cmp    %eax,0x805b5b4
 804c750:	74 23                	je     0x804c775
 804c752:	6a 05                	push   $0x5
 804c754:	68 4d 92 05 08       	push   $0x805924d
 804c759:	6a 00                	push   $0x0
 804c75b:	e8 5c ca ff ff       	call   0x80491bc
 804c760:	83 c4 0c             	add    $0xc,%esp
 804c763:	89 c2                	mov    %eax,%edx
 804c765:	89 15 b0 b5 05 08    	mov    %edx,0x805b5b0
 804c76b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c770:	a3 b4 b5 05 08       	mov    %eax,0x805b5b4
 804c775:	85 d2                	test   %edx,%edx
 804c777:	0f 84 27 08 00 00    	je     0x804cfa4
 804c77d:	8b 15 b8 b5 05 08    	mov    0x805b5b8,%edx
 804c783:	85 d2                	test   %edx,%edx
 804c785:	74 0d                	je     0x804c794
 804c787:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c78c:	39 05 bc b5 05 08    	cmp    %eax,0x805b5bc
 804c792:	74 23                	je     0x804c7b7
 804c794:	6a 05                	push   $0x5
 804c796:	68 4d 92 05 08       	push   $0x805924d
 804c79b:	6a 00                	push   $0x0
 804c79d:	e8 1a ca ff ff       	call   0x80491bc
 804c7a2:	83 c4 0c             	add    $0xc,%esp
 804c7a5:	89 c2                	mov    %eax,%edx
 804c7a7:	89 15 b8 b5 05 08    	mov    %edx,0x805b5b8
 804c7ad:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c7b2:	a3 bc b5 05 08       	mov    %eax,0x805b5bc
 804c7b7:	52                   	push   %edx
 804c7b8:	e8 03 aa 00 00       	call   0x80571c0
 804c7bd:	83 c4 04             	add    $0x4,%esp
 804c7c0:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c7c5:	31 c9                	xor    %ecx,%ecx
 804c7c7:	8a 08                	mov    (%eax),%cl
 804c7c9:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c7cc:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c7d2:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c7d8:	83 f9 5e             	cmp    $0x5e,%ecx
 804c7db:	0f 85 b3 00 00 00    	jne    0x804c894
 804c7e1:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804c7e8:	0f 85 85 00 00 00    	jne    0x804c873
 804c7ee:	8b 15 c0 b5 05 08    	mov    0x805b5c0,%edx
 804c7f4:	85 d2                	test   %edx,%edx
 804c7f6:	74 0d                	je     0x804c805
 804c7f8:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c7fd:	39 05 c4 b5 05 08    	cmp    %eax,0x805b5c4
 804c803:	74 23                	je     0x804c828
 804c805:	6a 05                	push   $0x5
 804c807:	68 4d 92 05 08       	push   $0x805924d
 804c80c:	6a 00                	push   $0x0
 804c80e:	e8 a9 c9 ff ff       	call   0x80491bc
 804c813:	83 c4 0c             	add    $0xc,%esp
 804c816:	89 c2                	mov    %eax,%edx
 804c818:	89 15 c0 b5 05 08    	mov    %edx,0x805b5c0
 804c81e:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c823:	a3 c4 b5 05 08       	mov    %eax,0x805b5c4
 804c828:	85 d2                	test   %edx,%edx
 804c82a:	0f 84 74 07 00 00    	je     0x804cfa4
 804c830:	8b 15 c8 b5 05 08    	mov    0x805b5c8,%edx
 804c836:	85 d2                	test   %edx,%edx
 804c838:	74 0d                	je     0x804c847
 804c83a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c83f:	39 05 cc b5 05 08    	cmp    %eax,0x805b5cc
 804c845:	74 23                	je     0x804c86a
 804c847:	6a 05                	push   $0x5
 804c849:	68 4d 92 05 08       	push   $0x805924d
 804c84e:	6a 00                	push   $0x0
 804c850:	e8 67 c9 ff ff       	call   0x80491bc
 804c855:	83 c4 0c             	add    $0xc,%esp
 804c858:	89 c2                	mov    %eax,%edx
 804c85a:	89 15 c8 b5 05 08    	mov    %edx,0x805b5c8
 804c860:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c865:	a3 cc b5 05 08       	mov    %eax,0x805b5cc
 804c86a:	52                   	push   %edx
 804c86b:	e8 50 a9 00 00       	call   0x80571c0
 804c870:	83 c4 04             	add    $0x4,%esp
 804c873:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804c878:	31 c9                	xor    %ecx,%ecx
 804c87a:	8a 08                	mov    (%eax),%cl
 804c87c:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804c87f:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804c885:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804c88b:	c7 45 d8 01 00 00 00 	movl   $0x1,0xffffffd8(%ebp)
 804c892:	eb 0c                	jmp    0x804c8a0
 804c894:	c7 45 d8 00 00 00 00 	movl   $0x0,0xffffffd8(%ebp)
 804c89b:	90                   	nop    
 804c89c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804c8a0:	83 7d dc 5b          	cmpl   $0x5b,0xffffffdc(%ebp)
 804c8a4:	0f 85 e3 01 00 00    	jne    0x804ca8d
 804c8aa:	f6 05 e0 ba 05 08 04 	testb  $0x4,0x805bae0
 804c8b1:	0f 84 d6 01 00 00    	je     0x804ca8d
 804c8b7:	31 db                	xor    %ebx,%ebx
 804c8b9:	83 3d 18 b0 05 08 00 	cmpl   $0x0,0x805b018
 804c8c0:	0f 84 c7 01 00 00    	je     0x804ca8d
 804c8c6:	be 18 b0 05 08       	mov    $0x805b018,%esi
 804c8cb:	90                   	nop    
 804c8cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804c8d0:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
 804c8d7:	89 7d c0             	mov    %edi,0xffffffc0(%ebp)
 804c8da:	8b 04 37             	mov    (%edi,%esi,1),%eax
 804c8dd:	50                   	push   %eax
 804c8de:	e8 fd f1 ff ff       	call   0x804bae0
 804c8e3:	83 c4 04             	add    $0x4,%esp
 804c8e6:	85 c0                	test   %eax,%eax
 804c8e8:	0f 84 94 01 00 00    	je     0x804ca82
 804c8ee:	8b 9f 1c b0 05 08    	mov    0x805b01c(%edi),%ebx
 804c8f4:	83 3d e8 ba 05 08 00 	cmpl   $0x0,0x805bae8
 804c8fb:	74 15                	je     0x804c912
 804c8fd:	81 fb 80 b9 04 08    	cmp    $0x804b980,%ebx
 804c903:	74 08                	je     0x804c90d
 804c905:	81 fb a0 b9 04 08    	cmp    $0x804b9a0,%ebx
 804c90b:	75 05                	jne    0x804c912
 804c90d:	bb 60 b9 04 08       	mov    $0x804b960,%ebx
 804c912:	31 f6                	xor    %esi,%esi
 804c914:	56                   	push   %esi
 804c915:	ff d3                	call   *%ebx
 804c917:	83 c4 04             	add    $0x4,%esp
 804c91a:	85 c0                	test   %eax,%eax
 804c91c:	74 0d                	je     0x804c92b
 804c91e:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 804c921:	51                   	push   %ecx
 804c922:	56                   	push   %esi
 804c923:	e8 68 ee ff ff       	call   0x804b790
 804c928:	83 c4 08             	add    $0x8,%esp
 804c92b:	46                   	inc    %esi
 804c92c:	81 fe ff 00 00 00    	cmp    $0xff,%esi
 804c932:	7e e0                	jle    0x804c914
 804c934:	8b 7d c0             	mov    0xffffffc0(%ebp),%edi
 804c937:	8b bf 18 b0 05 08    	mov    0x805b018(%edi),%edi
 804c93d:	89 fa                	mov    %edi,%edx
 804c93f:	89 d0                	mov    %edx,%eax
 804c941:	89 7d c4             	mov    %edi,0xffffffc4(%ebp)
 804c944:	83 e2 03             	and    $0x3,%edx
 804c947:	74 16                	je     0x804c95f
 804c949:	7a 0f                	jp     0x804c95a
 804c94b:	83 fa 02             	cmp    $0x2,%edx
 804c94e:	74 05                	je     0x804c955
 804c950:	38 30                	cmp    %dh,(%eax)
 804c952:	74 2d                	je     0x804c981
 804c954:	40                   	inc    %eax
 804c955:	38 30                	cmp    %dh,(%eax)
 804c957:	74 28                	je     0x804c981
 804c959:	40                   	inc    %eax
 804c95a:	38 30                	cmp    %dh,(%eax)
 804c95c:	74 23                	je     0x804c981
 804c95e:	40                   	inc    %eax
 804c95f:	8b 10                	mov    (%eax),%edx
 804c961:	84 d2                	test   %dl,%dl
 804c963:	74 1c                	je     0x804c981
 804c965:	84 f6                	test   %dh,%dh
 804c967:	74 17                	je     0x804c980
 804c969:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 804c96f:	74 0e                	je     0x804c97f
 804c971:	83 c0 04             	add    $0x4,%eax
 804c974:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804c97a:	75 e3                	jne    0x804c95f
 804c97c:	83 e8 03             	sub    $0x3,%eax
 804c97f:	40                   	inc    %eax
 804c980:	40                   	inc    %eax
 804c981:	29 f8                	sub    %edi,%eax
 804c983:	01 05 f4 ba 05 08    	add    %eax,0x805baf4
 804c989:	89 fa                	mov    %edi,%edx
 804c98b:	89 d0                	mov    %edx,%eax
 804c98d:	8b 0d f8 ba 05 08    	mov    0x805baf8,%ecx
 804c993:	83 e2 03             	and    $0x3,%edx
 804c996:	74 16                	je     0x804c9ae
 804c998:	7a 0f                	jp     0x804c9a9
 804c99a:	83 fa 02             	cmp    $0x2,%edx
 804c99d:	74 05                	je     0x804c9a4
 804c99f:	38 30                	cmp    %dh,(%eax)
 804c9a1:	74 2d                	je     0x804c9d0
 804c9a3:	40                   	inc    %eax
 804c9a4:	38 30                	cmp    %dh,(%eax)
 804c9a6:	74 28                	je     0x804c9d0
 804c9a8:	40                   	inc    %eax
 804c9a9:	38 30                	cmp    %dh,(%eax)
 804c9ab:	74 23                	je     0x804c9d0
 804c9ad:	40                   	inc    %eax
 804c9ae:	8b 10                	mov    (%eax),%edx
 804c9b0:	84 d2                	test   %dl,%dl
 804c9b2:	74 1c                	je     0x804c9d0
 804c9b4:	84 f6                	test   %dh,%dh
 804c9b6:	74 17                	je     0x804c9cf
 804c9b8:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 804c9be:	74 0e                	je     0x804c9ce
 804c9c0:	83 c0 04             	add    $0x4,%eax
 804c9c3:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804c9c9:	75 e3                	jne    0x804c9ae
 804c9cb:	83 e8 03             	sub    $0x3,%eax
 804c9ce:	40                   	inc    %eax
 804c9cf:	40                   	inc    %eax
 804c9d0:	29 f8                	sub    %edi,%eax
 804c9d2:	29 c1                	sub    %eax,%ecx
 804c9d4:	89 c8                	mov    %ecx,%eax
 804c9d6:	a3 f8 ba 05 08       	mov    %eax,0x805baf8
 804c9db:	85 c0                	test   %eax,%eax
 804c9dd:	0f 85 85 00 00 00    	jne    0x804ca68
 804c9e3:	8b 15 d0 b5 05 08    	mov    0x805b5d0,%edx
 804c9e9:	85 d2                	test   %edx,%edx
 804c9eb:	74 0d                	je     0x804c9fa
 804c9ed:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804c9f2:	39 05 d4 b5 05 08    	cmp    %eax,0x805b5d4
 804c9f8:	74 23                	je     0x804ca1d
 804c9fa:	6a 05                	push   $0x5
 804c9fc:	68 4d 92 05 08       	push   $0x805924d
 804ca01:	6a 00                	push   $0x0
 804ca03:	e8 b4 c7 ff ff       	call   0x80491bc
 804ca08:	83 c4 0c             	add    $0xc,%esp
 804ca0b:	89 c2                	mov    %eax,%edx
 804ca0d:	89 15 d0 b5 05 08    	mov    %edx,0x805b5d0
 804ca13:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ca18:	a3 d4 b5 05 08       	mov    %eax,0x805b5d4
 804ca1d:	85 d2                	test   %edx,%edx
 804ca1f:	0f 84 7f 05 00 00    	je     0x804cfa4
 804ca25:	8b 15 d8 b5 05 08    	mov    0x805b5d8,%edx
 804ca2b:	85 d2                	test   %edx,%edx
 804ca2d:	74 0d                	je     0x804ca3c
 804ca2f:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ca34:	39 05 dc b5 05 08    	cmp    %eax,0x805b5dc
 804ca3a:	74 23                	je     0x804ca5f
 804ca3c:	6a 05                	push   $0x5
 804ca3e:	68 4d 92 05 08       	push   $0x805924d
 804ca43:	6a 00                	push   $0x0
 804ca45:	e8 72 c7 ff ff       	call   0x80491bc
 804ca4a:	83 c4 0c             	add    $0xc,%esp
 804ca4d:	89 c2                	mov    %eax,%edx
 804ca4f:	89 15 d8 b5 05 08    	mov    %edx,0x805b5d8
 804ca55:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ca5a:	a3 dc b5 05 08       	mov    %eax,0x805b5dc
 804ca5f:	52                   	push   %edx
 804ca60:	e8 5b a7 00 00       	call   0x80571c0
 804ca65:	83 c4 04             	add    $0x4,%esp
 804ca68:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804ca6d:	31 db                	xor    %ebx,%ebx
 804ca6f:	8a 18                	mov    (%eax),%bl
 804ca71:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804ca77:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804ca7d:	e9 27 04 00 00       	jmp    0x804cea9
 804ca82:	43                   	inc    %ebx
 804ca83:	83 3c de 00          	cmpl   $0x0,(%esi,%ebx,8)
 804ca87:	0f 85 43 fe ff ff    	jne    0x804c8d0
 804ca8d:	83 7d dc 5c          	cmpl   $0x5c,0xffffffdc(%ebp)
 804ca91:	0f 85 b7 00 00 00    	jne    0x804cb4e
 804ca97:	f6 05 e0 ba 05 08 01 	testb  $0x1,0x805bae0
 804ca9e:	0f 84 aa 00 00 00    	je     0x804cb4e
 804caa4:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804caab:	0f 85 85 00 00 00    	jne    0x804cb36
 804cab1:	8b 15 e0 b5 05 08    	mov    0x805b5e0,%edx
 804cab7:	85 d2                	test   %edx,%edx
 804cab9:	74 0d                	je     0x804cac8
 804cabb:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cac0:	39 05 e4 b5 05 08    	cmp    %eax,0x805b5e4
 804cac6:	74 23                	je     0x804caeb
 804cac8:	6a 05                	push   $0x5
 804caca:	68 4d 92 05 08       	push   $0x805924d
 804cacf:	6a 00                	push   $0x0
 804cad1:	e8 e6 c6 ff ff       	call   0x80491bc
 804cad6:	83 c4 0c             	add    $0xc,%esp
 804cad9:	89 c2                	mov    %eax,%edx
 804cadb:	89 15 e0 b5 05 08    	mov    %edx,0x805b5e0
 804cae1:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cae6:	a3 e4 b5 05 08       	mov    %eax,0x805b5e4
 804caeb:	85 d2                	test   %edx,%edx
 804caed:	0f 84 b1 04 00 00    	je     0x804cfa4
 804caf3:	8b 15 e8 b5 05 08    	mov    0x805b5e8,%edx
 804caf9:	85 d2                	test   %edx,%edx
 804cafb:	74 0d                	je     0x804cb0a
 804cafd:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cb02:	39 05 ec b5 05 08    	cmp    %eax,0x805b5ec
 804cb08:	74 23                	je     0x804cb2d
 804cb0a:	6a 05                	push   $0x5
 804cb0c:	68 4d 92 05 08       	push   $0x805924d
 804cb11:	6a 00                	push   $0x0
 804cb13:	e8 a4 c6 ff ff       	call   0x80491bc
 804cb18:	83 c4 0c             	add    $0xc,%esp
 804cb1b:	89 c2                	mov    %eax,%edx
 804cb1d:	89 15 e8 b5 05 08    	mov    %edx,0x805b5e8
 804cb23:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cb28:	a3 ec b5 05 08       	mov    %eax,0x805b5ec
 804cb2d:	52                   	push   %edx
 804cb2e:	e8 8d a6 00 00       	call   0x80571c0
 804cb33:	83 c4 04             	add    $0x4,%esp
 804cb36:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804cb3b:	31 c9                	xor    %ecx,%ecx
 804cb3d:	8a 08                	mov    (%eax),%cl
 804cb3f:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804cb42:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804cb48:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804cb4e:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804cb55:	0f 85 85 00 00 00    	jne    0x804cbe0
 804cb5b:	8b 15 f0 b5 05 08    	mov    0x805b5f0,%edx
 804cb61:	85 d2                	test   %edx,%edx
 804cb63:	74 0d                	je     0x804cb72
 804cb65:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cb6a:	39 05 f4 b5 05 08    	cmp    %eax,0x805b5f4
 804cb70:	74 23                	je     0x804cb95
 804cb72:	6a 05                	push   $0x5
 804cb74:	68 4d 92 05 08       	push   $0x805924d
 804cb79:	6a 00                	push   $0x0
 804cb7b:	e8 3c c6 ff ff       	call   0x80491bc
 804cb80:	83 c4 0c             	add    $0xc,%esp
 804cb83:	89 c2                	mov    %eax,%edx
 804cb85:	89 15 f0 b5 05 08    	mov    %edx,0x805b5f0
 804cb8b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cb90:	a3 f4 b5 05 08       	mov    %eax,0x805b5f4
 804cb95:	85 d2                	test   %edx,%edx
 804cb97:	0f 84 07 04 00 00    	je     0x804cfa4
 804cb9d:	8b 15 f8 b5 05 08    	mov    0x805b5f8,%edx
 804cba3:	85 d2                	test   %edx,%edx
 804cba5:	74 0d                	je     0x804cbb4
 804cba7:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cbac:	39 05 fc b5 05 08    	cmp    %eax,0x805b5fc
 804cbb2:	74 23                	je     0x804cbd7
 804cbb4:	6a 05                	push   $0x5
 804cbb6:	68 4d 92 05 08       	push   $0x805924d
 804cbbb:	6a 00                	push   $0x0
 804cbbd:	e8 fa c5 ff ff       	call   0x80491bc
 804cbc2:	83 c4 0c             	add    $0xc,%esp
 804cbc5:	89 c2                	mov    %eax,%edx
 804cbc7:	89 15 f8 b5 05 08    	mov    %edx,0x805b5f8
 804cbcd:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cbd2:	a3 fc b5 05 08       	mov    %eax,0x805b5fc
 804cbd7:	52                   	push   %edx
 804cbd8:	e8 e3 a5 00 00       	call   0x80571c0
 804cbdd:	83 c4 04             	add    $0x4,%esp
 804cbe0:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804cbe5:	31 db                	xor    %ebx,%ebx
 804cbe7:	8a 18                	mov    (%eax),%bl
 804cbe9:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804cbef:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804cbf5:	83 fb 2d             	cmp    $0x2d,%ebx
 804cbf8:	0f 85 28 02 00 00    	jne    0x804ce26
 804cbfe:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804cc05:	0f 85 85 00 00 00    	jne    0x804cc90
 804cc0b:	8b 15 00 b6 05 08    	mov    0x805b600,%edx
 804cc11:	85 d2                	test   %edx,%edx
 804cc13:	74 0d                	je     0x804cc22
 804cc15:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cc1a:	39 05 04 b6 05 08    	cmp    %eax,0x805b604
 804cc20:	74 23                	je     0x804cc45
 804cc22:	6a 05                	push   $0x5
 804cc24:	68 4d 92 05 08       	push   $0x805924d
 804cc29:	6a 00                	push   $0x0
 804cc2b:	e8 8c c5 ff ff       	call   0x80491bc
 804cc30:	83 c4 0c             	add    $0xc,%esp
 804cc33:	89 c2                	mov    %eax,%edx
 804cc35:	89 15 00 b6 05 08    	mov    %edx,0x805b600
 804cc3b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cc40:	a3 04 b6 05 08       	mov    %eax,0x805b604
 804cc45:	85 d2                	test   %edx,%edx
 804cc47:	0f 84 57 03 00 00    	je     0x804cfa4
 804cc4d:	8b 15 08 b6 05 08    	mov    0x805b608,%edx
 804cc53:	85 d2                	test   %edx,%edx
 804cc55:	74 0d                	je     0x804cc64
 804cc57:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cc5c:	39 05 0c b6 05 08    	cmp    %eax,0x805b60c
 804cc62:	74 23                	je     0x804cc87
 804cc64:	6a 05                	push   $0x5
 804cc66:	68 4d 92 05 08       	push   $0x805924d
 804cc6b:	6a 00                	push   $0x0
 804cc6d:	e8 4a c5 ff ff       	call   0x80491bc
 804cc72:	83 c4 0c             	add    $0xc,%esp
 804cc75:	89 c2                	mov    %eax,%edx
 804cc77:	89 15 08 b6 05 08    	mov    %edx,0x805b608
 804cc7d:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cc82:	a3 0c b6 05 08       	mov    %eax,0x805b60c
 804cc87:	52                   	push   %edx
 804cc88:	e8 33 a5 00 00       	call   0x80571c0
 804cc8d:	83 c4 04             	add    $0x4,%esp
 804cc90:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804cc95:	0f b6 30             	movzbl (%eax),%esi
 804cc98:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804cc9e:	a1 f8 ba 05 08       	mov    0x805baf8,%eax
 804cca3:	8d 78 ff             	lea    0xffffffff(%eax),%edi
 804cca6:	89 3d f8 ba 05 08    	mov    %edi,0x805baf8
 804ccac:	83 fe 5d             	cmp    $0x5d,%esi
 804ccaf:	75 10                	jne    0x804ccc1
 804ccb1:	ff 0d f4 ba 05 08    	decl   0x805baf4
 804ccb7:	a3 f8 ba 05 08       	mov    %eax,0x805baf8
 804ccbc:	e9 65 01 00 00       	jmp    0x804ce26
 804ccc1:	83 fe 5c             	cmp    $0x5c,%esi
 804ccc4:	0f 85 b3 00 00 00    	jne    0x804cd7d
 804ccca:	f6 05 e0 ba 05 08 01 	testb  $0x1,0x805bae0
 804ccd1:	0f 84 a6 00 00 00    	je     0x804cd7d
 804ccd7:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804ccde:	0f 85 85 00 00 00    	jne    0x804cd69
 804cce4:	8b 15 10 b6 05 08    	mov    0x805b610,%edx
 804ccea:	85 d2                	test   %edx,%edx
 804ccec:	74 0d                	je     0x804ccfb
 804ccee:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ccf3:	39 05 14 b6 05 08    	cmp    %eax,0x805b614
 804ccf9:	74 23                	je     0x804cd1e
 804ccfb:	6a 05                	push   $0x5
 804ccfd:	68 4d 92 05 08       	push   $0x805924d
 804cd02:	6a 00                	push   $0x0
 804cd04:	e8 b3 c4 ff ff       	call   0x80491bc
 804cd09:	83 c4 0c             	add    $0xc,%esp
 804cd0c:	89 c2                	mov    %eax,%edx
 804cd0e:	89 15 10 b6 05 08    	mov    %edx,0x805b610
 804cd14:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cd19:	a3 14 b6 05 08       	mov    %eax,0x805b614
 804cd1e:	85 d2                	test   %edx,%edx
 804cd20:	0f 84 7e 02 00 00    	je     0x804cfa4
 804cd26:	8b 15 18 b6 05 08    	mov    0x805b618,%edx
 804cd2c:	85 d2                	test   %edx,%edx
 804cd2e:	74 0d                	je     0x804cd3d
 804cd30:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cd35:	39 05 1c b6 05 08    	cmp    %eax,0x805b61c
 804cd3b:	74 23                	je     0x804cd60
 804cd3d:	6a 05                	push   $0x5
 804cd3f:	68 4d 92 05 08       	push   $0x805924d
 804cd44:	6a 00                	push   $0x0
 804cd46:	e8 71 c4 ff ff       	call   0x80491bc
 804cd4b:	83 c4 0c             	add    $0xc,%esp
 804cd4e:	89 c2                	mov    %eax,%edx
 804cd50:	89 15 18 b6 05 08    	mov    %edx,0x805b618
 804cd56:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cd5b:	a3 1c b6 05 08       	mov    %eax,0x805b61c
 804cd60:	52                   	push   %edx
 804cd61:	e8 5a a4 00 00       	call   0x80571c0
 804cd66:	83 c4 04             	add    $0x4,%esp
 804cd69:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804cd6e:	0f b6 30             	movzbl (%eax),%esi
 804cd71:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804cd77:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804cd7d:	83 3d f8 ba 05 08 00 	cmpl   $0x0,0x805baf8
 804cd84:	0f 85 85 00 00 00    	jne    0x804ce0f
 804cd8a:	8b 15 20 b6 05 08    	mov    0x805b620,%edx
 804cd90:	85 d2                	test   %edx,%edx
 804cd92:	74 0d                	je     0x804cda1
 804cd94:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cd99:	39 05 24 b6 05 08    	cmp    %eax,0x805b624
 804cd9f:	74 23                	je     0x804cdc4
 804cda1:	6a 05                	push   $0x5
 804cda3:	68 4d 92 05 08       	push   $0x805924d
 804cda8:	6a 00                	push   $0x0
 804cdaa:	e8 0d c4 ff ff       	call   0x80491bc
 804cdaf:	83 c4 0c             	add    $0xc,%esp
 804cdb2:	89 c2                	mov    %eax,%edx
 804cdb4:	89 15 20 b6 05 08    	mov    %edx,0x805b620
 804cdba:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cdbf:	a3 24 b6 05 08       	mov    %eax,0x805b624
 804cdc4:	85 d2                	test   %edx,%edx
 804cdc6:	0f 84 d8 01 00 00    	je     0x804cfa4
 804cdcc:	8b 15 28 b6 05 08    	mov    0x805b628,%edx
 804cdd2:	85 d2                	test   %edx,%edx
 804cdd4:	74 0d                	je     0x804cde3
 804cdd6:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804cddb:	39 05 2c b6 05 08    	cmp    %eax,0x805b62c
 804cde1:	74 23                	je     0x804ce06
 804cde3:	6a 05                	push   $0x5
 804cde5:	68 4d 92 05 08       	push   $0x805924d
 804cdea:	6a 00                	push   $0x0
 804cdec:	e8 cb c3 ff ff       	call   0x80491bc
 804cdf1:	83 c4 0c             	add    $0xc,%esp
 804cdf4:	89 c2                	mov    %eax,%edx
 804cdf6:	89 15 28 b6 05 08    	mov    %edx,0x805b628
 804cdfc:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804ce01:	a3 2c b6 05 08       	mov    %eax,0x805b62c
 804ce06:	52                   	push   %edx
 804ce07:	e8 b4 a3 00 00       	call   0x80571c0
 804ce0c:	83 c4 04             	add    $0x4,%esp
 804ce0f:	a1 f4 ba 05 08       	mov    0x805baf4,%eax
 804ce14:	31 db                	xor    %ebx,%ebx
 804ce16:	8a 18                	mov    (%eax),%bl
 804ce18:	ff 05 f4 ba 05 08    	incl   0x805baf4
 804ce1e:	ff 0d f8 ba 05 08    	decl   0x805baf8
 804ce24:	eb 7e                	jmp    0x804cea4
 804ce26:	8b 75 dc             	mov    0xffffffdc(%ebp),%esi
 804ce29:	eb 79                	jmp    0x804cea4
 804ce2b:	90                   	nop    
 804ce2c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ce30:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 804ce33:	51                   	push   %ecx
 804ce34:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804ce37:	57                   	push   %edi
 804ce38:	e8 53 e9 ff ff       	call   0x804b790
 804ce3d:	83 c4 08             	add    $0x8,%esp
 804ce40:	83 3d e8 ba 05 08 00 	cmpl   $0x0,0x805bae8
 804ce47:	74 58                	je     0x804cea1
 804ce49:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804ce4e:	66 8b 04 78          	mov    (%eax,%edi,2),%ax
 804ce52:	f6 c4 01             	test   $0x1,%ah
 804ce55:	74 1b                	je     0x804ce72
 804ce57:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 804ce5a:	51                   	push   %ecx
 804ce5b:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804ce5e:	83 e8 80             	sub    $0xffffff80,%eax
 804ce61:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 804ce66:	77 2d                	ja     0x804ce95
 804ce68:	a1 c0 b2 05 08       	mov    0x805b2c0,%eax
 804ce6d:	8b 04 b8             	mov    (%eax,%edi,4),%eax
 804ce70:	eb 26                	jmp    0x804ce98
 804ce72:	f6 c4 02             	test   $0x2,%ah
 804ce75:	74 2a                	je     0x804cea1
 804ce77:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 804ce7a:	57                   	push   %edi
 804ce7b:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804ce7e:	83 e8 80             	sub    $0xffffff80,%eax
 804ce81:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 804ce86:	77 0d                	ja     0x804ce95
 804ce88:	a1 cc b2 05 08       	mov    0x805b2cc,%eax
 804ce8d:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 804ce90:	8b 04 88             	mov    (%eax,%ecx,4),%eax
 804ce93:	eb 03                	jmp    0x804ce98
 804ce95:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804ce98:	50                   	push   %eax
 804ce99:	e8 f2 e8 ff ff       	call   0x804b790
 804ce9e:	83 c4 08             	add    $0x8,%esp
 804cea1:	ff 45 dc             	incl   0xffffffdc(%ebp)
 804cea4:	39 75 dc             	cmp    %esi,0xffffffdc(%ebp)
 804cea7:	7e 87                	jle    0x804ce30
 804cea9:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 804ceac:	83 fb 5d             	cmp    $0x5d,%ebx
 804ceaf:	0f 85 eb f9 ff ff    	jne    0x804c8a0
 804ceb5:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 804ceb9:	74 29                	je     0x804cee4
 804cebb:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 804cebe:	57                   	push   %edi
 804cebf:	e8 7c e9 ff ff       	call   0x804b840
 804cec4:	83 c4 04             	add    $0x4,%esp
 804cec7:	f6 05 e1 ba 05 08 01 	testb  $0x1,0x805bae1
 804cece:	74 14                	je     0x804cee4
 804ced0:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 804ced3:	51                   	push   %ecx
 804ced4:	31 c0                	xor    %eax,%eax
 804ced6:	a0 ec ba 05 08       	mov    0x805baec,%al
 804cedb:	50                   	push   %eax
 804cedc:	e8 df e8 ff ff       	call   0x804b7c0
 804cee1:	83 c4 08             	add    $0x8,%esp
 804cee4:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804ceeb:	00 00 00 
 804ceee:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 804cef1:	57                   	push   %edi
 804cef2:	e9 88 00 00 00       	jmp    0x804cf7f
 804cef7:	c7 05 00 bb 05 08 00 	movl   $0x0,0x805bb00
 804cefe:	00 00 00 
 804cf01:	83 3d e8 ba 05 08 00 	cmpl   $0x0,0x805bae8
 804cf08:	0f 84 82 00 00 00    	je     0x804cf90
 804cf0e:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804cf13:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 804cf16:	f6 44 48 01 04       	testb  $0x4,0x1(%eax,%ecx,2)
 804cf1b:	74 73                	je     0x804cf90
 804cf1d:	8d 5d e0             	lea    0xffffffe0(%ebp),%ebx
 804cf20:	53                   	push   %ebx
 804cf21:	e8 fa e8 ff ff       	call   0x804b820
 804cf26:	53                   	push   %ebx
 804cf27:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804cf2a:	57                   	push   %edi
 804cf2b:	e8 60 e8 ff ff       	call   0x804b790
 804cf30:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804cf35:	83 c4 0c             	add    $0xc,%esp
 804cf38:	f6 44 78 01 01       	testb  $0x1,0x1(%eax,%edi,2)
 804cf3d:	74 18                	je     0x804cf57
 804cf3f:	53                   	push   %ebx
 804cf40:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804cf43:	83 e8 80             	sub    $0xffffff80,%eax
 804cf46:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 804cf4b:	77 25                	ja     0x804cf72
 804cf4d:	a1 c0 b2 05 08       	mov    0x805b2c0,%eax
 804cf52:	8b 04 b8             	mov    (%eax,%edi,4),%eax
 804cf55:	eb 1e                	jmp    0x804cf75
 804cf57:	53                   	push   %ebx
 804cf58:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804cf5b:	83 e8 80             	sub    $0xffffff80,%eax
 804cf5e:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 804cf63:	77 0d                	ja     0x804cf72
 804cf65:	a1 cc b2 05 08       	mov    0x805b2cc,%eax
 804cf6a:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 804cf6d:	8b 04 88             	mov    (%eax,%ecx,4),%eax
 804cf70:	eb 03                	jmp    0x804cf75
 804cf72:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804cf75:	50                   	push   %eax
 804cf76:	e8 15 e8 ff ff       	call   0x804b790
 804cf7b:	83 c4 08             	add    $0x8,%esp
 804cf7e:	53                   	push   %ebx
 804cf7f:	e8 1c e9 ff ff       	call   0x804b8a0
 804cf84:	05 11 01 00 00       	add    $0x111,%eax
 804cf89:	a3 fc ba 05 08       	mov    %eax,0x805bafc
 804cf8e:	eb 23                	jmp    0x804cfb3
 804cf90:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 804cf93:	eb 1e                	jmp    0x804cfb3
 804cf95:	43                   	inc    %ebx
 804cf96:	83 fb 01             	cmp    $0x1,%ebx
 804cf99:	0f 8e c1 eb ff ff    	jle    0x804bb60
 804cf9f:	e8 a8 c0 ff ff       	call   0x804904c
 804cfa4:	c7 05 fc ba 05 08 ff 	movl   $0xffffffff,0x805bafc
 804cfab:	ff ff ff 
 804cfae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804cfb3:	8d 65 b4             	lea    0xffffffb4(%ebp),%esp
 804cfb6:	5b                   	pop    %ebx
 804cfb7:	5e                   	pop    %esi
 804cfb8:	5f                   	pop    %edi
 804cfb9:	89 ec                	mov    %ebp,%esp
 804cfbb:	5d                   	pop    %ebp
 804cfbc:	c3                   	ret    
 804cfbd:	8d 76 00             	lea    0x0(%esi),%esi
 804cfc0:	55                   	push   %ebp
 804cfc1:	89 e5                	mov    %esp,%ebp
 804cfc3:	53                   	push   %ebx
 804cfc4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804cfc7:	8b 0d dc ba 05 08    	mov    0x805badc,%ecx
 804cfcd:	89 ca                	mov    %ecx,%edx
 804cfcf:	8b 41 14             	mov    0x14(%ecx),%eax
 804cfd2:	39 41 10             	cmp    %eax,0x10(%ecx)
 804cfd5:	7c 2d                	jl     0x804d004
 804cfd7:	c1 62 14 01          	shll   $0x1,0x14(%edx)
 804cfdb:	8b 0d dc ba 05 08    	mov    0x805badc,%ecx
 804cfe1:	89 ca                	mov    %ecx,%edx
 804cfe3:	8b 41 14             	mov    0x14(%ecx),%eax
 804cfe6:	39 41 10             	cmp    %eax,0x10(%ecx)
 804cfe9:	7d ec                	jge    0x804cfd7
 804cfeb:	c1 e0 02             	shl    $0x2,%eax
 804cfee:	50                   	push   %eax
 804cfef:	8b 41 0c             	mov    0xc(%ecx),%eax
 804cff2:	50                   	push   %eax
 804cff3:	e8 f8 e6 ff ff       	call   0x804b6f0
 804cff8:	89 c2                	mov    %eax,%edx
 804cffa:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804cfff:	89 c1                	mov    %eax,%ecx
 804d001:	89 50 0c             	mov    %edx,0xc(%eax)
 804d004:	8b 51 10             	mov    0x10(%ecx),%edx
 804d007:	8b 41 0c             	mov    0xc(%ecx),%eax
 804d00a:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 804d00d:	ff 41 10             	incl   0x10(%ecx)
 804d010:	8d 83 00 ff ff ff    	lea    0xffffff00(%ebx),%eax
 804d016:	83 f8 0e             	cmp    $0xe,%eax
 804d019:	77 15                	ja     0x804d030
 804d01b:	ff 24 85 28 94 05 08 	jmp    *0x8059428(,%eax,4)
 804d022:	ff 0d 14 bb 05 08    	decl   0x805bb14
 804d028:	eb 14                	jmp    0x804d03e
 804d02a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d030:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804d035:	ff 40 1c             	incl   0x1c(%eax)
 804d038:	ff 05 14 bb 05 08    	incl   0x805bb14
 804d03e:	8b 15 dc ba 05 08    	mov    0x805badc,%edx
 804d044:	a1 14 bb 05 08       	mov    0x805bb14,%eax
 804d049:	3b 42 18             	cmp    0x18(%edx),%eax
 804d04c:	7e 03                	jle    0x804d051
 804d04e:	89 42 18             	mov    %eax,0x18(%edx)
 804d051:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d054:	89 ec                	mov    %ebp,%esp
 804d056:	5d                   	pop    %ebp
 804d057:	c3                   	ret    
 804d058:	90                   	nop    
 804d059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804d060:	55                   	push   %ebp
 804d061:	89 e5                	mov    %esp,%ebp
 804d063:	a1 10 bb 05 08       	mov    0x805bb10,%eax
 804d068:	3d ff 00 00 00       	cmp    $0xff,%eax
 804d06d:	76 38                	jbe    0x804d0a7
 804d06f:	3d 10 01 00 00       	cmp    $0x110,%eax
 804d074:	7f 31                	jg     0x804d0a7
 804d076:	3d 01 01 00 00       	cmp    $0x101,%eax
 804d07b:	74 2a                	je     0x804d0a7
 804d07d:	3d 02 01 00 00       	cmp    $0x102,%eax
 804d082:	74 23                	je     0x804d0a7
 804d084:	3d 03 01 00 00       	cmp    $0x103,%eax
 804d089:	74 1c                	je     0x804d0a7
 804d08b:	3d 04 01 00 00       	cmp    $0x104,%eax
 804d090:	74 15                	je     0x804d0a7
 804d092:	3d 05 01 00 00       	cmp    $0x105,%eax
 804d097:	74 0e                	je     0x804d0a7
 804d099:	3d 06 01 00 00       	cmp    $0x106,%eax
 804d09e:	74 07                	je     0x804d0a7
 804d0a0:	3d 07 01 00 00       	cmp    $0x107,%eax
 804d0a5:	75 09                	jne    0x804d0b0
 804d0a7:	50                   	push   %eax
 804d0a8:	e8 13 ff ff ff       	call   0x804cfc0
 804d0ad:	eb 6b                	jmp    0x804d11a
 804d0af:	90                   	nop    
 804d0b0:	3d 0f 01 00 00       	cmp    $0x10f,%eax
 804d0b5:	75 6f                	jne    0x804d126
 804d0b7:	e8 94 ea ff ff       	call   0x804bb50
 804d0bc:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d0c1:	6a 00                	push   $0x0
 804d0c3:	e8 78 02 00 00       	call   0x804d340
 804d0c8:	83 c4 04             	add    $0x4,%esp
 804d0cb:	81 3d 10 bb 05 08 10 	cmpl   $0x110,0x805bb10
 804d0d2:	01 00 00 
 804d0d5:	74 43                	je     0x804d11a
 804d0d7:	8b 15 30 b6 05 08    	mov    0x805b630,%edx
 804d0dd:	85 d2                	test   %edx,%edx
 804d0df:	74 0d                	je     0x804d0ee
 804d0e1:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d0e6:	39 05 34 b6 05 08    	cmp    %eax,0x805b634
 804d0ec:	74 23                	je     0x804d111
 804d0ee:	6a 05                	push   $0x5
 804d0f0:	68 64 94 05 08       	push   $0x8059464
 804d0f5:	6a 00                	push   $0x0
 804d0f7:	e8 c0 c0 ff ff       	call   0x80491bc
 804d0fc:	83 c4 0c             	add    $0xc,%esp
 804d0ff:	89 c2                	mov    %eax,%edx
 804d101:	89 15 30 b6 05 08    	mov    %edx,0x805b630
 804d107:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d10c:	a3 34 b6 05 08       	mov    %eax,0x805b634
 804d111:	52                   	push   %edx
 804d112:	e8 a9 a0 00 00       	call   0x80571c0
 804d117:	83 c4 04             	add    $0x4,%esp
 804d11a:	e8 31 ea ff ff       	call   0x804bb50
 804d11f:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d124:	eb 0a                	jmp    0x804d130
 804d126:	68 00 01 00 00       	push   $0x100
 804d12b:	e8 90 fe ff ff       	call   0x804cfc0
 804d130:	89 ec                	mov    %ebp,%esp
 804d132:	5d                   	pop    %ebp
 804d133:	c3                   	ret    
 804d134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 804d140:	55                   	push   %ebp
 804d141:	89 e5                	mov    %esp,%ebp
 804d143:	56                   	push   %esi
 804d144:	53                   	push   %ebx
 804d145:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804d14a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804d14d:	8b 40 0c             	mov    0xc(%eax),%eax
 804d150:	8b 44 98 fc          	mov    0xfffffffc(%eax,%ebx,4),%eax
 804d154:	3d 08 01 00 00       	cmp    $0x108,%eax
 804d159:	7c 15                	jl     0x804d170
 804d15b:	3d 0a 01 00 00       	cmp    $0x10a,%eax
 804d160:	7e 15                	jle    0x804d177
 804d162:	3d 0e 01 00 00       	cmp    $0x10e,%eax
 804d167:	7f 07                	jg     0x804d170
 804d169:	3d 0c 01 00 00       	cmp    $0x10c,%eax
 804d16e:	7d 13                	jge    0x804d183
 804d170:	b8 01 00 00 00       	mov    $0x1,%eax
 804d175:	eb 26                	jmp    0x804d19d
 804d177:	8d 43 ff             	lea    0xffffffff(%ebx),%eax
 804d17a:	50                   	push   %eax
 804d17b:	e8 c0 ff ff ff       	call   0x804d140
 804d180:	40                   	inc    %eax
 804d181:	eb 1a                	jmp    0x804d19d
 804d183:	8d 43 ff             	lea    0xffffffff(%ebx),%eax
 804d186:	50                   	push   %eax
 804d187:	e8 b4 ff ff ff       	call   0x804d140
 804d18c:	89 c6                	mov    %eax,%esi
 804d18e:	8d 46 01             	lea    0x1(%esi),%eax
 804d191:	29 c3                	sub    %eax,%ebx
 804d193:	53                   	push   %ebx
 804d194:	e8 a7 ff ff ff       	call   0x804d140
 804d199:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
 804d19d:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 804d1a0:	5b                   	pop    %ebx
 804d1a1:	5e                   	pop    %esi
 804d1a2:	89 ec                	mov    %ebp,%esp
 804d1a4:	5d                   	pop    %ebp
 804d1a5:	c3                   	ret    
 804d1a6:	8d 76 00             	lea    0x0(%esi),%esi
 804d1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804d1b0:	55                   	push   %ebp
 804d1b1:	89 e5                	mov    %esp,%ebp
 804d1b3:	57                   	push   %edi
 804d1b4:	56                   	push   %esi
 804d1b5:	53                   	push   %ebx
 804d1b6:	8b 7d 08             	mov    0x8(%ebp),%edi
 804d1b9:	8b 75 0c             	mov    0xc(%ebp),%esi
 804d1bc:	31 db                	xor    %ebx,%ebx
 804d1be:	39 f3                	cmp    %esi,%ebx
 804d1c0:	7d 1c                	jge    0x804d1de
 804d1c2:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804d1c7:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
 804d1ca:	8b 40 0c             	mov    0xc(%eax),%eax
 804d1cd:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804d1d0:	50                   	push   %eax
 804d1d1:	e8 ea fd ff ff       	call   0x804cfc0
 804d1d6:	83 c4 04             	add    $0x4,%esp
 804d1d9:	43                   	inc    %ebx
 804d1da:	39 f3                	cmp    %esi,%ebx
 804d1dc:	7c e4                	jl     0x804d1c2
 804d1de:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804d1e1:	5b                   	pop    %ebx
 804d1e2:	5e                   	pop    %esi
 804d1e3:	5f                   	pop    %edi
 804d1e4:	89 ec                	mov    %ebp,%esp
 804d1e6:	5d                   	pop    %ebp
 804d1e7:	c3                   	ret    
 804d1e8:	90                   	nop    
 804d1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804d1f0:	55                   	push   %ebp
 804d1f1:	89 e5                	mov    %esp,%ebp
 804d1f3:	57                   	push   %edi
 804d1f4:	56                   	push   %esi
 804d1f5:	53                   	push   %ebx
 804d1f6:	e8 65 fe ff ff       	call   0x804d060
 804d1fb:	e9 c8 00 00 00       	jmp    0x804d2c8
 804d200:	81 fa 0b 01 00 00    	cmp    $0x10b,%edx
 804d206:	0f 85 a9 00 00 00    	jne    0x804d2b5
 804d20c:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804d211:	8b 40 10             	mov    0x10(%eax),%eax
 804d214:	50                   	push   %eax
 804d215:	e8 26 ff ff ff       	call   0x804d140
 804d21a:	89 c6                	mov    %eax,%esi
 804d21c:	a1 dc ba 05 08       	mov    0x805badc,%eax
 804d221:	83 c4 04             	add    $0x4,%esp
 804d224:	8b 78 10             	mov    0x10(%eax),%edi
 804d227:	29 f7                	sub    %esi,%edi
 804d229:	83 3d 0c bb 05 08 00 	cmpl   $0x0,0x805bb0c
 804d230:	7d 0d                	jge    0x804d23f
 804d232:	68 0a 01 00 00       	push   $0x10a
 804d237:	e8 84 fd ff ff       	call   0x804cfc0
 804d23c:	83 c4 04             	add    $0x4,%esp
 804d23f:	a1 08 bb 05 08       	mov    0x805bb08,%eax
 804d244:	85 c0                	test   %eax,%eax
 804d246:	75 12                	jne    0x804d25a
 804d248:	68 08 01 00 00       	push   $0x108
 804d24d:	e8 6e fd ff ff       	call   0x804cfc0
 804d252:	83 c4 04             	add    $0x4,%esp
 804d255:	a1 08 bb 05 08       	mov    0x805bb08,%eax
 804d25a:	bb 01 00 00 00       	mov    $0x1,%ebx
 804d25f:	39 c3                	cmp    %eax,%ebx
 804d261:	7d 3e                	jge    0x804d2a1
 804d263:	56                   	push   %esi
 804d264:	57                   	push   %edi
 804d265:	e8 46 ff ff ff       	call   0x804d1b0
 804d26a:	68 0c 01 00 00       	push   $0x10c
 804d26f:	e8 4c fd ff ff       	call   0x804cfc0
 804d274:	83 c4 0c             	add    $0xc,%esp
 804d277:	43                   	inc    %ebx
 804d278:	3b 1d 08 bb 05 08    	cmp    0x805bb08,%ebx
 804d27e:	7c e3                	jl     0x804d263
 804d280:	eb 1f                	jmp    0x804d2a1
 804d282:	56                   	push   %esi
 804d283:	57                   	push   %edi
 804d284:	e8 27 ff ff ff       	call   0x804d1b0
 804d289:	68 08 01 00 00       	push   $0x108
 804d28e:	e8 2d fd ff ff       	call   0x804cfc0
 804d293:	68 0c 01 00 00       	push   $0x10c
 804d298:	e8 23 fd ff ff       	call   0x804cfc0
 804d29d:	83 c4 10             	add    $0x10,%esp
 804d2a0:	43                   	inc    %ebx
 804d2a1:	3b 1d 0c bb 05 08    	cmp    0x805bb0c,%ebx
 804d2a7:	7c d9                	jl     0x804d282
 804d2a9:	e8 a2 e8 ff ff       	call   0x804bb50
 804d2ae:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d2b3:	eb 13                	jmp    0x804d2c8
 804d2b5:	52                   	push   %edx
 804d2b6:	e8 05 fd ff ff       	call   0x804cfc0
 804d2bb:	e8 90 e8 ff ff       	call   0x804bb50
 804d2c0:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d2c5:	83 c4 04             	add    $0x4,%esp
 804d2c8:	8b 15 10 bb 05 08    	mov    0x805bb10,%edx
 804d2ce:	8d 82 f8 fe ff ff    	lea    0xfffffef8(%edx),%eax
 804d2d4:	83 f8 03             	cmp    $0x3,%eax
 804d2d7:	0f 86 23 ff ff ff    	jbe    0x804d200
 804d2dd:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804d2e0:	5b                   	pop    %ebx
 804d2e1:	5e                   	pop    %esi
 804d2e2:	5f                   	pop    %edi
 804d2e3:	89 ec                	mov    %ebp,%esp
 804d2e5:	5d                   	pop    %ebp
 804d2e6:	c3                   	ret    
 804d2e7:	89 f6                	mov    %esi,%esi
 804d2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804d2f0:	55                   	push   %ebp
 804d2f1:	89 e5                	mov    %esp,%ebp
 804d2f3:	e8 f8 fe ff ff       	call   0x804d1f0
 804d2f8:	8b 15 10 bb 05 08    	mov    0x805bb10,%edx
 804d2fe:	81 fa 10 01 00 00    	cmp    $0x110,%edx
 804d304:	74 35                	je     0x804d33b
 804d306:	81 fa 0d 01 00 00    	cmp    $0x10d,%edx
 804d30c:	74 2d                	je     0x804d33b
 804d30e:	89 f6                	mov    %esi,%esi
 804d310:	85 d2                	test   %edx,%edx
 804d312:	7c 27                	jl     0x804d33b
 804d314:	e8 d7 fe ff ff       	call   0x804d1f0
 804d319:	68 0c 01 00 00       	push   $0x10c
 804d31e:	e8 9d fc ff ff       	call   0x804cfc0
 804d323:	83 c4 04             	add    $0x4,%esp
 804d326:	a1 10 bb 05 08       	mov    0x805bb10,%eax
 804d32b:	89 c2                	mov    %eax,%edx
 804d32d:	3d 10 01 00 00       	cmp    $0x110,%eax
 804d332:	74 07                	je     0x804d33b
 804d334:	3d 0d 01 00 00       	cmp    $0x10d,%eax
 804d339:	75 d5                	jne    0x804d310
 804d33b:	89 ec                	mov    %ebp,%esp
 804d33d:	5d                   	pop    %ebp
 804d33e:	c3                   	ret    
 804d33f:	90                   	nop    
 804d340:	55                   	push   %ebp
 804d341:	89 e5                	mov    %esp,%ebp
 804d343:	53                   	push   %ebx
 804d344:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804d347:	e8 a4 ff ff ff       	call   0x804d2f0
 804d34c:	81 3d 10 bb 05 08 0d 	cmpl   $0x10d,0x805bb10
 804d353:	01 00 00 
 804d356:	75 33                	jne    0x804d38b
 804d358:	e8 f3 e7 ff ff       	call   0x804bb50
 804d35d:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d362:	e8 89 ff ff ff       	call   0x804d2f0
 804d367:	85 db                	test   %ebx,%ebx
 804d369:	74 07                	je     0x804d372
 804d36b:	68 0e 01 00 00       	push   $0x10e
 804d370:	eb 05                	jmp    0x804d377
 804d372:	68 0d 01 00 00       	push   $0x10d
 804d377:	e8 44 fc ff ff       	call   0x804cfc0
 804d37c:	83 c4 04             	add    $0x4,%esp
 804d37f:	81 3d 10 bb 05 08 0d 	cmpl   $0x10d,0x805bb10
 804d386:	01 00 00 
 804d389:	74 cd                	je     0x804d358
 804d38b:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d38e:	89 ec                	mov    %ebp,%esp
 804d390:	5d                   	pop    %ebp
 804d391:	c3                   	ret    
 804d392:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804d399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804d3a0:	55                   	push   %ebp
 804d3a1:	89 e5                	mov    %esp,%ebp
 804d3a3:	53                   	push   %ebx
 804d3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 804d3a7:	8b 55 0c             	mov    0xc(%ebp),%edx
 804d3aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d3ad:	89 1d dc ba 05 08    	mov    %ebx,0x805badc
 804d3b3:	a3 f4 ba 05 08       	mov    %eax,0x805baf4
 804d3b8:	a3 f0 ba 05 08       	mov    %eax,0x805baf0
 804d3bd:	89 15 f8 ba 05 08    	mov    %edx,0x805baf8
 804d3c3:	c7 05 fc ba 05 08 ff 	movl   $0xffffffff,0x805bafc
 804d3ca:	ff ff ff 
 804d3cd:	c7 05 00 bb 05 08 01 	movl   $0x1,0x805bb00
 804d3d4:	00 00 00 
 804d3d7:	c7 05 04 bb 05 08 00 	movl   $0x0,0x805bb04
 804d3de:	00 00 00 
 804d3e1:	83 3d e4 ba 05 08 00 	cmpl   $0x0,0x805bae4
 804d3e8:	75 43                	jne    0x804d42d
 804d3ea:	8b 15 38 b6 05 08    	mov    0x805b638,%edx
 804d3f0:	85 d2                	test   %edx,%edx
 804d3f2:	74 0d                	je     0x804d401
 804d3f4:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d3f9:	39 05 3c b6 05 08    	cmp    %eax,0x805b63c
 804d3ff:	74 23                	je     0x804d424
 804d401:	6a 05                	push   $0x5
 804d403:	68 71 94 05 08       	push   $0x8059471
 804d408:	6a 00                	push   $0x0
 804d40a:	e8 ad bd ff ff       	call   0x80491bc
 804d40f:	83 c4 0c             	add    $0xc,%esp
 804d412:	89 c2                	mov    %eax,%edx
 804d414:	89 15 38 b6 05 08    	mov    %edx,0x805b638
 804d41a:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d41f:	a3 3c b6 05 08       	mov    %eax,0x805b63c
 804d424:	52                   	push   %edx
 804d425:	e8 96 9d 00 00       	call   0x80571c0
 804d42a:	83 c4 04             	add    $0x4,%esp
 804d42d:	e8 1e e7 ff ff       	call   0x804bb50
 804d432:	a3 10 bb 05 08       	mov    %eax,0x805bb10
 804d437:	8b 43 18             	mov    0x18(%ebx),%eax
 804d43a:	a3 14 bb 05 08       	mov    %eax,0x805bb14
 804d43f:	6a 01                	push   $0x1
 804d441:	e8 fa fe ff ff       	call   0x804d340
 804d446:	83 c4 04             	add    $0x4,%esp
 804d449:	83 3d 10 bb 05 08 ff 	cmpl   $0xffffffff,0x805bb10
 804d450:	74 43                	je     0x804d495
 804d452:	8b 15 40 b6 05 08    	mov    0x805b640,%edx
 804d458:	85 d2                	test   %edx,%edx
 804d45a:	74 0d                	je     0x804d469
 804d45c:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d461:	39 05 44 b6 05 08    	cmp    %eax,0x805b644
 804d467:	74 23                	je     0x804d48c
 804d469:	6a 05                	push   $0x5
 804d46b:	68 85 94 05 08       	push   $0x8059485
 804d470:	6a 00                	push   $0x0
 804d472:	e8 45 bd ff ff       	call   0x80491bc
 804d477:	83 c4 0c             	add    $0xc,%esp
 804d47a:	89 c2                	mov    %eax,%edx
 804d47c:	89 15 40 b6 05 08    	mov    %edx,0x805b640
 804d482:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804d487:	a3 44 b6 05 08       	mov    %eax,0x805b644
 804d48c:	52                   	push   %edx
 804d48d:	e8 2e 9d 00 00       	call   0x80571c0
 804d492:	83 c4 04             	add    $0x4,%esp
 804d495:	8b 43 20             	mov    0x20(%ebx),%eax
 804d498:	f7 d0                	not    %eax
 804d49a:	50                   	push   %eax
 804d49b:	e8 20 fb ff ff       	call   0x804cfc0
 804d4a0:	68 0c 01 00 00       	push   $0x10c
 804d4a5:	e8 16 fb ff ff       	call   0x804cfc0
 804d4aa:	83 c4 08             	add    $0x8,%esp
 804d4ad:	8b 43 20             	mov    0x20(%ebx),%eax
 804d4b0:	85 c0                	test   %eax,%eax
 804d4b2:	74 0d                	je     0x804d4c1
 804d4b4:	68 0e 01 00 00       	push   $0x10e
 804d4b9:	e8 02 fb ff ff       	call   0x804cfc0
 804d4be:	8b 43 20             	mov    0x20(%ebx),%eax
 804d4c1:	40                   	inc    %eax
 804d4c2:	89 43 20             	mov    %eax,0x20(%ebx)
 804d4c5:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d4c8:	89 ec                	mov    %ebp,%esp
 804d4ca:	5d                   	pop    %ebp
 804d4cb:	c3                   	ret    
 804d4cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804d4d0:	55                   	push   %ebp
 804d4d1:	89 e5                	mov    %esp,%ebp
 804d4d3:	57                   	push   %edi
 804d4d4:	56                   	push   %esi
 804d4d5:	53                   	push   %ebx
 804d4d6:	8b 75 08             	mov    0x8(%ebp),%esi
 804d4d9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d4dc:	31 db                	xor    %ebx,%ebx
 804d4de:	eb 13                	jmp    0x804d4f3
 804d4e0:	8b 06                	mov    (%esi),%eax
 804d4e2:	8b 0f                	mov    (%edi),%ecx
 804d4e4:	8b 54 d8 04          	mov    0x4(%eax,%ebx,8),%edx
 804d4e8:	8b 04 d8             	mov    (%eax,%ebx,8),%eax
 804d4eb:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
 804d4ee:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
 804d4f2:	43                   	inc    %ebx
 804d4f3:	8b 46 04             	mov    0x4(%esi),%eax
 804d4f6:	39 c3                	cmp    %eax,%ebx
 804d4f8:	7c e6                	jl     0x804d4e0
 804d4fa:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804d4fd:	89 47 04             	mov    %eax,0x4(%edi)
 804d500:	5b                   	pop    %ebx
 804d501:	5e                   	pop    %esi
 804d502:	5f                   	pop    %edi
 804d503:	89 ec                	mov    %ebp,%esp
 804d505:	5d                   	pop    %ebp
 804d506:	c3                   	ret    
 804d507:	89 f6                	mov    %esi,%esi
 804d509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804d510:	55                   	push   %ebp
 804d511:	89 e5                	mov    %esp,%ebp
 804d513:	83 ec 0c             	sub    $0xc,%esp
 804d516:	57                   	push   %edi
 804d517:	56                   	push   %esi
 804d518:	53                   	push   %ebx
 804d519:	8b 55 08             	mov    0x8(%ebp),%edx
 804d51c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804d51f:	8b 75 10             	mov    0x10(%ebp),%esi
 804d522:	31 db                	xor    %ebx,%ebx
 804d524:	8b 46 04             	mov    0x4(%esi),%eax
 804d527:	39 c3                	cmp    %eax,%ebx
 804d529:	7d 25                	jge    0x804d550
 804d52b:	8b 3e                	mov    (%esi),%edi
 804d52d:	89 7d f4             	mov    %edi,0xfffffff4(%ebp)
 804d530:	8b 75 f4             	mov    0xfffffff4(%ebp),%esi
 804d533:	3b 14 de             	cmp    (%esi,%ebx,8),%edx
 804d536:	73 05                	jae    0x804d53d
 804d538:	43                   	inc    %ebx
 804d539:	39 c3                	cmp    %eax,%ebx
 804d53b:	7c f3                	jl     0x804d530
 804d53d:	39 c3                	cmp    %eax,%ebx
 804d53f:	7d 0f                	jge    0x804d550
 804d541:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804d544:	3b 14 df             	cmp    (%edi,%ebx,8),%edx
 804d547:	75 07                	jne    0x804d550
 804d549:	09 4c df 04          	or     %ecx,0x4(%edi,%ebx,8)
 804d54d:	eb 3e                	jmp    0x804d58d
 804d54f:	90                   	nop    
 804d550:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 804d553:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 804d556:	8d 78 01             	lea    0x1(%eax),%edi
 804d559:	8b 75 10             	mov    0x10(%ebp),%esi
 804d55c:	89 f8                	mov    %edi,%eax
 804d55e:	89 7e 04             	mov    %edi,0x4(%esi)
 804d561:	39 c3                	cmp    %eax,%ebx
 804d563:	7d 28                	jge    0x804d58d
 804d565:	8b 75 10             	mov    0x10(%ebp),%esi
 804d568:	8b 06                	mov    (%esi),%eax
 804d56a:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 804d56d:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804d570:	8b 14 d8             	mov    (%eax,%ebx,8),%edx
 804d573:	8b 4c d8 04          	mov    0x4(%eax,%ebx,8),%ecx
 804d577:	89 34 d8             	mov    %esi,(%eax,%ebx,8)
 804d57a:	89 7c d8 04          	mov    %edi,0x4(%eax,%ebx,8)
 804d57e:	43                   	inc    %ebx
 804d57f:	8b 7d 10             	mov    0x10(%ebp),%edi
 804d582:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 804d585:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 804d588:	3b 5f 04             	cmp    0x4(%edi),%ebx
 804d58b:	7c d8                	jl     0x804d565
 804d58d:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 804d590:	5b                   	pop    %ebx
 804d591:	5e                   	pop    %esi
 804d592:	5f                   	pop    %edi
 804d593:	89 ec                	mov    %ebp,%esp
 804d595:	5d                   	pop    %ebp
 804d596:	c3                   	ret    
 804d597:	89 f6                	mov    %esi,%esi
 804d599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804d5a0:	55                   	push   %ebp
 804d5a1:	89 e5                	mov    %esp,%ebp
 804d5a3:	83 ec 20             	sub    $0x20,%esp
 804d5a6:	57                   	push   %edi
 804d5a7:	56                   	push   %esi
 804d5a8:	53                   	push   %ebx
 804d5a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d5ac:	31 ff                	xor    %edi,%edi
 804d5ae:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804d5b5:	8b 75 08             	mov    0x8(%ebp),%esi
 804d5b8:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804d5bf:	8b 46 04             	mov    0x4(%esi),%eax
 804d5c2:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
 804d5c5:	0f 8d 4b 01 00 00    	jge    0x804d716
 804d5cb:	90                   	nop    
 804d5cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804d5d0:	8b 75 0c             	mov    0xc(%ebp),%esi
 804d5d3:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d5d6:	3b 5e 04             	cmp    0x4(%esi),%ebx
 804d5d9:	0f 8d c6 00 00 00    	jge    0x804d6a5
 804d5df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804d5e2:	8b 1b                	mov    (%ebx),%ebx
 804d5e4:	89 5d e0             	mov    %ebx,0xffffffe0(%ebp)
 804d5e7:	8b 36                	mov    (%esi),%esi
 804d5e9:	89 75 e4             	mov    %esi,0xffffffe4(%ebp)
 804d5ec:	8b 14 fb             	mov    (%ebx,%edi,8),%edx
 804d5ef:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d5f2:	8b 04 de             	mov    (%esi,%ebx,8),%eax
 804d5f5:	39 c2                	cmp    %eax,%edx
 804d5f7:	76 28                	jbe    0x804d621
 804d5f9:	8b 75 10             	mov    0x10(%ebp),%esi
 804d5fc:	8b 76 04             	mov    0x4(%esi),%esi
 804d5ff:	89 75 f8             	mov    %esi,0xfffffff8(%ebp)
 804d602:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d605:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804d608:	8b 0b                	mov    (%ebx),%ecx
 804d60a:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 804d60d:	8b 04 fe             	mov    (%esi,%edi,8),%eax
 804d610:	8b 54 fe 04          	mov    0x4(%esi,%edi,8),%edx
 804d614:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
 804d617:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
 804d61b:	8b 75 10             	mov    0x10(%ebp),%esi
 804d61e:	47                   	inc    %edi
 804d61f:	eb 73                	jmp    0x804d694
 804d621:	39 c2                	cmp    %eax,%edx
 804d623:	73 2d                	jae    0x804d652
 804d625:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d628:	8b 5b 04             	mov    0x4(%ebx),%ebx
 804d62b:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 804d62e:	8b 75 10             	mov    0x10(%ebp),%esi
 804d631:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d634:	8b 0e                	mov    (%esi),%ecx
 804d636:	8b 75 e4             	mov    0xffffffe4(%ebp),%esi
 804d639:	8b 04 de             	mov    (%esi,%ebx,8),%eax
 804d63c:	8b 54 de 04          	mov    0x4(%esi,%ebx,8),%edx
 804d640:	8b 5d f4             	mov    0xfffffff4(%ebp),%ebx
 804d643:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
 804d646:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
 804d64a:	8b 75 10             	mov    0x10(%ebp),%esi
 804d64d:	ff 45 fc             	incl   0xfffffffc(%ebp)
 804d650:	eb 42                	jmp    0x804d694
 804d652:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d655:	8b 75 10             	mov    0x10(%ebp),%esi
 804d658:	8b 5b 04             	mov    0x4(%ebx),%ebx
 804d65b:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 804d65e:	8b 0e                	mov    (%esi),%ecx
 804d660:	8b 5d e0             	mov    0xffffffe0(%ebp),%ebx
 804d663:	8b 75 f0             	mov    0xfffffff0(%ebp),%esi
 804d666:	8b 04 fb             	mov    (%ebx,%edi,8),%eax
 804d669:	8b 54 fb 04          	mov    0x4(%ebx,%edi,8),%edx
 804d66d:	89 04 f1             	mov    %eax,(%ecx,%esi,8)
 804d670:	89 54 f1 04          	mov    %edx,0x4(%ecx,%esi,8)
 804d674:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d677:	8b 75 0c             	mov    0xc(%ebp),%esi
 804d67a:	8b 4b 04             	mov    0x4(%ebx),%ecx
 804d67d:	8b 13                	mov    (%ebx),%edx
 804d67f:	8b 06                	mov    (%esi),%eax
 804d681:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d684:	47                   	inc    %edi
 804d685:	8b 44 d8 04          	mov    0x4(%eax,%ebx,8),%eax
 804d689:	09 44 ca 04          	or     %eax,0x4(%edx,%ecx,8)
 804d68d:	43                   	inc    %ebx
 804d68e:	8b 75 10             	mov    0x10(%ebp),%esi
 804d691:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 804d694:	ff 46 04             	incl   0x4(%esi)
 804d697:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804d69a:	8b 43 04             	mov    0x4(%ebx),%eax
 804d69d:	39 c7                	cmp    %eax,%edi
 804d69f:	0f 8c 2b ff ff ff    	jl     0x804d5d0
 804d6a5:	39 c7                	cmp    %eax,%edi
 804d6a7:	7d 6d                	jge    0x804d716
 804d6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804d6b0:	8b 75 10             	mov    0x10(%ebp),%esi
 804d6b3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d6b6:	8b 76 04             	mov    0x4(%esi),%esi
 804d6b9:	89 75 ec             	mov    %esi,0xffffffec(%ebp)
 804d6bc:	8b 75 08             	mov    0x8(%ebp),%esi
 804d6bf:	8b 0b                	mov    (%ebx),%ecx
 804d6c1:	8b 06                	mov    (%esi),%eax
 804d6c3:	8b 5d ec             	mov    0xffffffec(%ebp),%ebx
 804d6c6:	8b 54 f8 04          	mov    0x4(%eax,%edi,8),%edx
 804d6ca:	8b 04 f8             	mov    (%eax,%edi,8),%eax
 804d6cd:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
 804d6d0:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
 804d6d4:	8b 75 10             	mov    0x10(%ebp),%esi
 804d6d7:	ff 46 04             	incl   0x4(%esi)
 804d6da:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804d6dd:	47                   	inc    %edi
 804d6de:	3b 7b 04             	cmp    0x4(%ebx),%edi
 804d6e1:	7c cd                	jl     0x804d6b0
 804d6e3:	eb 31                	jmp    0x804d716
 804d6e5:	8b 75 10             	mov    0x10(%ebp),%esi
 804d6e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d6eb:	8b 76 04             	mov    0x4(%esi),%esi
 804d6ee:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 804d6f1:	8b 0b                	mov    (%ebx),%ecx
 804d6f3:	8b 75 0c             	mov    0xc(%ebp),%esi
 804d6f6:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804d6f9:	8b 06                	mov    (%esi),%eax
 804d6fb:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804d6fe:	8b 54 d8 04          	mov    0x4(%eax,%ebx,8),%edx
 804d702:	8b 04 d8             	mov    (%eax,%ebx,8),%eax
 804d705:	89 04 f1             	mov    %eax,(%ecx,%esi,8)
 804d708:	89 54 f1 04          	mov    %edx,0x4(%ecx,%esi,8)
 804d70c:	43                   	inc    %ebx
 804d70d:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 804d710:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804d713:	ff 43 04             	incl   0x4(%ebx)
 804d716:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804d719:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 804d71c:	3b 73 04             	cmp    0x4(%ebx),%esi
 804d71f:	7c c4                	jl     0x804d6e5
 804d721:	8d 65 d4             	lea    0xffffffd4(%ebp),%esp
 804d724:	5b                   	pop    %ebx
 804d725:	5e                   	pop    %esi
 804d726:	5f                   	pop    %edi
 804d727:	89 ec                	mov    %ebp,%esp
 804d729:	5d                   	pop    %ebp
 804d72a:	c3                   	ret    
 804d72b:	90                   	nop    
 804d72c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804d730:	55                   	push   %ebp
 804d731:	89 e5                	mov    %esp,%ebp
 804d733:	57                   	push   %edi
 804d734:	56                   	push   %esi
 804d735:	53                   	push   %ebx
 804d736:	8b 75 10             	mov    0x10(%ebp),%esi
 804d739:	31 db                	xor    %ebx,%ebx
 804d73b:	8b 46 04             	mov    0x4(%esi),%eax
 804d73e:	89 c2                	mov    %eax,%edx
 804d740:	39 c3                	cmp    %eax,%ebx
 804d742:	7d 3c                	jge    0x804d780
 804d744:	8b 0e                	mov    (%esi),%ecx
 804d746:	8b 3c d9             	mov    (%ecx,%ebx,8),%edi
 804d749:	39 7d 08             	cmp    %edi,0x8(%ebp)
 804d74c:	74 05                	je     0x804d753
 804d74e:	43                   	inc    %ebx
 804d74f:	39 d3                	cmp    %edx,%ebx
 804d751:	7c f3                	jl     0x804d746
 804d753:	39 d3                	cmp    %edx,%ebx
 804d755:	7d 29                	jge    0x804d780
 804d757:	8d 78 ff             	lea    0xffffffff(%eax),%edi
 804d75a:	8b 75 10             	mov    0x10(%ebp),%esi
 804d75d:	89 f8                	mov    %edi,%eax
 804d75f:	89 7e 04             	mov    %edi,0x4(%esi)
 804d762:	39 c3                	cmp    %eax,%ebx
 804d764:	7d 1a                	jge    0x804d780
 804d766:	8b 75 10             	mov    0x10(%ebp),%esi
 804d769:	8b 0e                	mov    (%esi),%ecx
 804d76b:	8b 44 d9 08          	mov    0x8(%ecx,%ebx,8),%eax
 804d76f:	8b 54 d9 0c          	mov    0xc(%ecx,%ebx,8),%edx
 804d773:	89 04 d9             	mov    %eax,(%ecx,%ebx,8)
 804d776:	89 54 d9 04          	mov    %edx,0x4(%ecx,%ebx,8)
 804d77a:	43                   	inc    %ebx
 804d77b:	3b 5e 04             	cmp    0x4(%esi),%ebx
 804d77e:	7c e6                	jl     0x804d766
 804d780:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804d783:	5b                   	pop    %ebx
 804d784:	5e                   	pop    %esi
 804d785:	5f                   	pop    %edi
 804d786:	89 ec                	mov    %ebp,%esp
 804d788:	5d                   	pop    %ebp
 804d789:	c3                   	ret    
 804d78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d790:	55                   	push   %ebp
 804d791:	89 e5                	mov    %esp,%ebp
 804d793:	83 ec 34             	sub    $0x34,%esp
 804d796:	57                   	push   %edi
 804d797:	56                   	push   %esi
 804d798:	31 c9                	xor    %ecx,%ecx
 804d79a:	53                   	push   %ebx
 804d79b:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
 804d7a2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804d7a6:	0f 95 c0             	setne  %al
 804d7a9:	88 c1                	mov    %al,%cl
 804d7ab:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 804d7ae:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 804d7b2:	0f 95 c0             	setne  %al
 804d7b5:	31 c9                	xor    %ecx,%ecx
 804d7b7:	88 c1                	mov    %al,%cl
 804d7b9:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 804d7bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d7bf:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
 804d7c6:	8b 7f 04             	mov    0x4(%edi),%edi
 804d7c9:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 804d7cc:	89 fb                	mov    %edi,%ebx
 804d7ce:	39 7d cc             	cmp    %edi,0xffffffcc(%ebp)
 804d7d1:	7d 1a                	jge    0x804d7ed
 804d7d3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804d7d6:	8b 11                	mov    (%ecx),%edx
 804d7d8:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 804d7db:	8b 44 fa 04          	mov    0x4(%edx,%edi,8),%eax
 804d7df:	03 04 fa             	add    (%edx,%edi,8),%eax
 804d7e2:	31 45 f4             	xor    %eax,0xfffffff4(%ebp)
 804d7e5:	47                   	inc    %edi
 804d7e6:	89 7d cc             	mov    %edi,0xffffffcc(%ebp)
 804d7e9:	39 df                	cmp    %ebx,%edi
 804d7eb:	7c eb                	jl     0x804d7d8
 804d7ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d7f0:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
 804d7f7:	8b 49 28             	mov    0x28(%ecx),%ecx
 804d7fa:	89 4d d4             	mov    %ecx,0xffffffd4(%ebp)
 804d7fd:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804d800:	39 4d cc             	cmp    %ecx,0xffffffcc(%ebp)
 804d803:	0f 8d 86 00 00 00    	jge    0x804d88f
 804d809:	8b 7d 08             	mov    0x8(%ebp),%edi
 804d80c:	8b 77 24             	mov    0x24(%edi),%esi
 804d80f:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 804d812:	89 75 ec             	mov    %esi,0xffffffec(%ebp)
 804d815:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 804d818:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 804d81b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804d822:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804d825:	3b 3c 16             	cmp    (%esi,%edx,1),%edi
 804d828:	75 5a                	jne    0x804d884
 804d82a:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 804d82d:	3b 4c 16 08          	cmp    0x8(%esi,%edx,1),%ecx
 804d831:	75 51                	jne    0x804d884
 804d833:	0f be 44 16 0c       	movsbl 0xc(%esi,%edx,1),%eax
 804d838:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
 804d83b:	75 47                	jne    0x804d884
 804d83d:	0f be 44 16 0d       	movsbl 0xd(%esi,%edx,1),%eax
 804d842:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
 804d845:	75 3d                	jne    0x804d884
 804d847:	31 db                	xor    %ebx,%ebx
 804d849:	3b 5d d8             	cmp    0xffffffd8(%ebp),%ebx
 804d84c:	7d 2d                	jge    0x804d87b
 804d84e:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d851:	8b 3f                	mov    (%edi),%edi
 804d853:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 804d856:	89 7d d0             	mov    %edi,0xffffffd0(%ebp)
 804d859:	8b 54 11 04          	mov    0x4(%ecx,%edx,1),%edx
 804d85d:	8d 76 00             	lea    0x0(%esi),%esi
 804d860:	8b 7d d0             	mov    0xffffffd0(%ebp),%edi
 804d863:	8b 44 da 04          	mov    0x4(%edx,%ebx,8),%eax
 804d867:	39 44 df 04          	cmp    %eax,0x4(%edi,%ebx,8)
 804d86b:	75 0e                	jne    0x804d87b
 804d86d:	8b 04 da             	mov    (%edx,%ebx,8),%eax
 804d870:	39 04 df             	cmp    %eax,(%edi,%ebx,8)
 804d873:	75 06                	jne    0x804d87b
 804d875:	43                   	inc    %ebx
 804d876:	3b 5d d8             	cmp    0xffffffd8(%ebp),%ebx
 804d879:	7c e5                	jl     0x804d860
 804d87b:	3b 5d f0             	cmp    0xfffffff0(%ebp),%ebx
 804d87e:	0f 84 ec 01 00 00    	je     0x804da70
 804d884:	ff 45 cc             	incl   0xffffffcc(%ebp)
 804d887:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 804d88a:	39 4d cc             	cmp    %ecx,0xffffffcc(%ebp)
 804d88d:	7c 86                	jl     0x804d815
 804d88f:	8b 7d 08             	mov    0x8(%ebp),%edi
 804d892:	8b 57 2c             	mov    0x2c(%edi),%edx
 804d895:	39 55 dc             	cmp    %edx,0xffffffdc(%ebp)
 804d898:	7c 30                	jl     0x804d8ca
 804d89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804d8a0:	89 d0                	mov    %edx,%eax
 804d8a2:	01 d0                	add    %edx,%eax
 804d8a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d8a7:	89 c2                	mov    %eax,%edx
 804d8a9:	89 41 2c             	mov    %eax,0x2c(%ecx)
 804d8ac:	39 45 d4             	cmp    %eax,0xffffffd4(%ebp)
 804d8af:	7d ef                	jge    0x804d8a0
 804d8b1:	8d 04 80             	lea    (%eax,%eax,4),%eax
 804d8b4:	c1 e0 02             	shl    $0x2,%eax
 804d8b7:	50                   	push   %eax
 804d8b8:	8b 41 24             	mov    0x24(%ecx),%eax
 804d8bb:	50                   	push   %eax
 804d8bc:	e8 2f de ff ff       	call   0x804b6f0
 804d8c1:	8b 7d 08             	mov    0x8(%ebp),%edi
 804d8c4:	83 c4 08             	add    $0x8,%esp
 804d8c7:	89 47 24             	mov    %eax,0x24(%edi)
 804d8ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d8cd:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 804d8d0:	8d 3c bf             	lea    (%edi,%edi,4),%edi
 804d8d3:	89 7d e8             	mov    %edi,0xffffffe8(%ebp)
 804d8d6:	8d 34 bd 00 00 00 00 	lea    0x0(,%edi,4),%esi
 804d8dd:	8b 41 24             	mov    0x24(%ecx),%eax
 804d8e0:	8b 4d f4             	mov    0xfffffff4(%ebp),%ecx
 804d8e3:	89 0c 30             	mov    %ecx,(%eax,%esi,1)
 804d8e6:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d8e9:	8b 7f 04             	mov    0x4(%edi),%edi
 804d8ec:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804d8f3:	50                   	push   %eax
 804d8f4:	e8 97 dd ff ff       	call   0x804b690
 804d8f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d8fc:	89 c2                	mov    %eax,%edx
 804d8fe:	8b 41 24             	mov    0x24(%ecx),%eax
 804d901:	89 54 30 04          	mov    %edx,0x4(%eax,%esi,1)
 804d905:	89 f0                	mov    %esi,%eax
 804d907:	03 41 24             	add    0x24(%ecx),%eax
 804d90a:	83 c0 04             	add    $0x4,%eax
 804d90d:	50                   	push   %eax
 804d90e:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d911:	57                   	push   %edi
 804d912:	e8 b9 fb ff ff       	call   0x804d4d0
 804d917:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d91a:	8b 41 24             	mov    0x24(%ecx),%eax
 804d91d:	8a 4d fc             	mov    0xfffffffc(%ebp),%cl
 804d920:	88 4c 30 0c          	mov    %cl,0xc(%eax,%esi,1)
 804d924:	8b 7d 08             	mov    0x8(%ebp),%edi
 804d927:	8b 47 24             	mov    0x24(%edi),%eax
 804d92a:	8a 4d f8             	mov    0xfffffff8(%ebp),%cl
 804d92d:	88 4c 30 0d          	mov    %cl,0xd(%eax,%esi,1)
 804d931:	8b 47 24             	mov    0x24(%edi),%eax
 804d934:	c6 44 30 0e 00       	movb   $0x0,0xe(%eax,%esi,1)
 804d939:	8b 47 24             	mov    0x24(%edi),%eax
 804d93c:	c6 44 30 0f 00       	movb   $0x0,0xf(%eax,%esi,1)
 804d941:	8b 47 24             	mov    0x24(%edi),%eax
 804d944:	c7 44 30 10 00 00 00 	movl   $0x0,0x10(%eax,%esi,1)
 804d94b:	00 
 804d94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d94f:	31 db                	xor    %ebx,%ebx
 804d951:	3b 5f 04             	cmp    0x4(%edi),%ebx
 804d954:	0f 8d 10 01 00 00    	jge    0x804da6a
 804d95a:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 804d95d:	89 4d e4             	mov    %ecx,0xffffffe4(%ebp)
 804d960:	89 75 e0             	mov    %esi,0xffffffe0(%ebp)
 804d963:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804d966:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804d969:	8b 37                	mov    (%edi),%esi
 804d96b:	8b 41 0c             	mov    0xc(%ecx),%eax
 804d96e:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804d971:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804d974:	85 c0                	test   %eax,%eax
 804d976:	0f 8d c4 00 00 00    	jge    0x804da40
 804d97c:	8b 44 de 04          	mov    0x4(%esi,%ebx,8),%eax
 804d980:	8b 71 24             	mov    0x24(%ecx),%esi
 804d983:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804d987:	74 07                	je     0x804d990
 804d989:	a8 40                	test   $0x40,%al
 804d98b:	75 07                	jne    0x804d994
 804d98d:	eb 15                	jmp    0x804d9a4
 804d98f:	90                   	nop    
 804d990:	a8 10                	test   $0x10,%al
 804d992:	74 10                	je     0x804d9a4
 804d994:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 804d998:	74 06                	je     0x804d9a0
 804d99a:	a8 04                	test   $0x4,%al
 804d99c:	75 66                	jne    0x804da04
 804d99e:	eb 04                	jmp    0x804d9a4
 804d9a0:	a8 01                	test   $0x1,%al
 804d9a2:	75 60                	jne    0x804da04
 804d9a4:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804d9a8:	74 06                	je     0x804d9b0
 804d9aa:	a8 40                	test   $0x40,%al
 804d9ac:	75 06                	jne    0x804d9b4
 804d9ae:	eb 14                	jmp    0x804d9c4
 804d9b0:	a8 10                	test   $0x10,%al
 804d9b2:	74 10                	je     0x804d9c4
 804d9b4:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 804d9b8:	74 06                	je     0x804d9c0
 804d9ba:	a8 08                	test   $0x8,%al
 804d9bc:	75 46                	jne    0x804da04
 804d9be:	eb 04                	jmp    0x804d9c4
 804d9c0:	a8 02                	test   $0x2,%al
 804d9c2:	75 40                	jne    0x804da04
 804d9c4:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804d9c8:	74 06                	je     0x804d9d0
 804d9ca:	84 c0                	test   %al,%al
 804d9cc:	7c 06                	jl     0x804d9d4
 804d9ce:	eb 14                	jmp    0x804d9e4
 804d9d0:	a8 20                	test   $0x20,%al
 804d9d2:	74 10                	je     0x804d9e4
 804d9d4:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 804d9d8:	74 06                	je     0x804d9e0
 804d9da:	a8 04                	test   $0x4,%al
 804d9dc:	75 26                	jne    0x804da04
 804d9de:	eb 04                	jmp    0x804d9e4
 804d9e0:	a8 01                	test   $0x1,%al
 804d9e2:	75 20                	jne    0x804da04
 804d9e4:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 804d9e8:	74 06                	je     0x804d9f0
 804d9ea:	84 c0                	test   %al,%al
 804d9ec:	7c 06                	jl     0x804d9f4
 804d9ee:	eb 21                	jmp    0x804da11
 804d9f0:	a8 20                	test   $0x20,%al
 804d9f2:	74 1d                	je     0x804da11
 804d9f4:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 804d9f8:	74 06                	je     0x804da00
 804d9fa:	a8 08                	test   $0x8,%al
 804d9fc:	75 06                	jne    0x804da04
 804d9fe:	eb 11                	jmp    0x804da11
 804da00:	a8 02                	test   $0x2,%al
 804da02:	74 0d                	je     0x804da11
 804da04:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804da07:	08 44 3e 0f          	or     %al,0xf(%esi,%edi,1)
 804da0b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804da0e:	8b 71 24             	mov    0x24(%ecx),%esi
 804da11:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 804da14:	c1 e7 02             	shl    $0x2,%edi
 804da17:	89 7d d0             	mov    %edi,0xffffffd0(%ebp)
 804da1a:	83 7c 3e 10 00       	cmpl   $0x0,0x10(%esi,%edi,1)
 804da1f:	75 3c                	jne    0x804da5d
 804da21:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804da24:	8b 01                	mov    (%ecx),%eax
 804da26:	8b 7d 08             	mov    0x8(%ebp),%edi
 804da29:	8b 14 d8             	mov    (%eax,%ebx,8),%edx
 804da2c:	8b 47 0c             	mov    0xc(%edi),%eax
 804da2f:	8b 4d d0             	mov    0xffffffd0(%ebp),%ecx
 804da32:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804da35:	89 44 0e 10          	mov    %eax,0x10(%esi,%ecx,1)
 804da39:	eb 22                	jmp    0x804da5d
 804da3b:	90                   	nop    
 804da3c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804da40:	3d 01 01 00 00       	cmp    $0x101,%eax
 804da45:	75 16                	jne    0x804da5d
 804da47:	8b 7d 08             	mov    0x8(%ebp),%edi
 804da4a:	8b 47 24             	mov    0x24(%edi),%eax
 804da4d:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 804da50:	c6 44 08 0f ff       	movb   $0xff,0xf(%eax,%ecx,1)
 804da55:	8b 47 24             	mov    0x24(%edi),%eax
 804da58:	c6 44 08 0e 01       	movb   $0x1,0xe(%eax,%ecx,1)
 804da5d:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804da60:	43                   	inc    %ebx
 804da61:	3b 5f 04             	cmp    0x4(%edi),%ebx
 804da64:	0f 8c f9 fe ff ff    	jl     0x804d963
 804da6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804da6d:	ff 41 28             	incl   0x28(%ecx)
 804da70:	8b 45 cc             	mov    0xffffffcc(%ebp),%eax
 804da73:	8d 65 c0             	lea    0xffffffc0(%ebp),%esp
 804da76:	5b                   	pop    %ebx
 804da77:	5e                   	pop    %esi
 804da78:	5f                   	pop    %edi
 804da79:	89 ec                	mov    %ebp,%esp
 804da7b:	5d                   	pop    %ebp
 804da7c:	c3                   	ret    
 804da7d:	8d 76 00             	lea    0x0(%esi),%esi
 804da80:	55                   	push   %ebp
 804da81:	89 e5                	mov    %esp,%ebp
 804da83:	83 ec 20             	sub    $0x20,%esp
 804da86:	57                   	push   %edi
 804da87:	56                   	push   %esi
 804da88:	53                   	push   %ebx
 804da89:	8b 55 0c             	mov    0xc(%ebp),%edx
 804da8c:	8b 52 10             	mov    0x10(%edx),%edx
 804da8f:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
 804da96:	50                   	push   %eax
 804da97:	e8 f4 db ff ff       	call   0x804b690
 804da9c:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804da9f:	31 ff                	xor    %edi,%edi
 804daa1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804daa4:	83 c4 04             	add    $0x4,%esp
 804daa7:	3b 79 10             	cmp    0x10(%ecx),%edi
 804daaa:	7d 17                	jge    0x804dac3
 804daac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804dab0:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 804dab3:	c7 04 ba 00 00 00 00 	movl   $0x0,(%edx,%edi,4)
 804daba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804dabd:	47                   	inc    %edi
 804dabe:	3b 79 10             	cmp    0x10(%ecx),%edi
 804dac1:	7c ed                	jl     0x804dab0
 804dac3:	8b 55 08             	mov    0x8(%ebp),%edx
 804dac6:	31 ff                	xor    %edi,%edi
 804dac8:	8b 52 04             	mov    0x4(%edx),%edx
 804dacb:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 804dace:	39 d7                	cmp    %edx,%edi
 804dad0:	0f 8d 36 01 00 00    	jge    0x804dc0c
 804dad6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804dad9:	8b 09                	mov    (%ecx),%ecx
 804dadb:	89 4d e8             	mov    %ecx,0xffffffe8(%ebp)
 804dade:	8b 14 f9             	mov    (%ecx,%edi,8),%edx
 804dae1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804dae4:	8b 41 0c             	mov    0xc(%ecx),%eax
 804dae7:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804daea:	3d ff 00 00 00       	cmp    $0xff,%eax
 804daef:	0f 8e 0d 01 00 00    	jle    0x804dc02
 804daf5:	3d 01 01 00 00       	cmp    $0x101,%eax
 804dafa:	0f 84 02 01 00 00    	je     0x804dc02
 804db00:	3d 10 01 00 00       	cmp    $0x110,%eax
 804db05:	0f 8f f7 00 00 00    	jg     0x804dc02
 804db0b:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 804db0e:	8b 14 f9             	mov    (%ecx,%edi,8),%edx
 804db11:	8b 4c f9 04          	mov    0x4(%ecx,%edi,8),%ecx
 804db15:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
 804db18:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 804db1b:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 804db1e:	8b 55 08             	mov    0x8(%ebp),%edx
 804db21:	52                   	push   %edx
 804db22:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 804db25:	8b 14 f9             	mov    (%ecx,%edi,8),%edx
 804db28:	8b 4c f9 04          	mov    0x4(%ecx,%edi,8),%ecx
 804db2c:	51                   	push   %ecx
 804db2d:	52                   	push   %edx
 804db2e:	e8 fd fb ff ff       	call   0x804d730
 804db33:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 804db36:	89 55 e4             	mov    %edx,0xffffffe4(%ebp)
 804db39:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804db3c:	83 c4 0c             	add    $0xc,%esp
 804db3f:	83 3c 91 00          	cmpl   $0x0,(%ecx,%edx,4)
 804db43:	74 0b                	je     0x804db50
 804db45:	8b 55 08             	mov    0x8(%ebp),%edx
 804db48:	4f                   	dec    %edi
 804db49:	e9 ae 00 00 00       	jmp    0x804dbfc
 804db4e:	89 f6                	mov    %esi,%esi
 804db50:	8b 4d e4             	mov    0xffffffe4(%ebp),%ecx
 804db53:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 804db56:	c7 04 8a 01 00 00 00 	movl   $0x1,(%edx,%ecx,4)
 804db5d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804db60:	8b 55 e4             	mov    0xffffffe4(%ebp),%edx
 804db63:	8b 41 0c             	mov    0xc(%ecx),%eax
 804db66:	8b 04 90             	mov    (%eax,%edx,4),%eax
 804db69:	05 fe fe ff ff       	add    $0xfffffefe,%eax
 804db6e:	83 f8 05             	cmp    $0x5,%eax
 804db71:	77 3b                	ja     0x804dbae
 804db73:	ff 24 85 94 94 05 08 	jmp    *0x8059494(,%eax,4)
 804db7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804db80:	81 e6 cf 00 00 00    	and    $0xcf,%esi
 804db86:	eb 26                	jmp    0x804dbae
 804db88:	81 e6 af 00 00 00    	and    $0xaf,%esi
 804db8e:	eb 1e                	jmp    0x804dbae
 804db90:	81 e6 f2 00 00 00    	and    $0xf2,%esi
 804db96:	eb 16                	jmp    0x804dbae
 804db98:	81 e6 f4 00 00 00    	and    $0xf4,%esi
 804db9e:	eb 0e                	jmp    0x804dbae
 804dba0:	81 e6 f6 00 00 00    	and    $0xf6,%esi
 804dba6:	eb 06                	jmp    0x804dbae
 804dba8:	81 e6 f9 00 00 00    	and    $0xf9,%esi
 804dbae:	31 ff                	xor    %edi,%edi
 804dbb0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804dbb3:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 804dbb6:	8b 49 30             	mov    0x30(%ecx),%ecx
 804dbb9:	89 4d e4             	mov    %ecx,0xffffffe4(%ebp)
 804dbbc:	3b 7c c1 04          	cmp    0x4(%ecx,%eax,8),%edi
 804dbc0:	7d 32                	jge    0x804dbf4
 804dbc2:	89 c2                	mov    %eax,%edx
 804dbc4:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 804dbc7:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 804dbca:	8b 55 e4             	mov    0xffffffe4(%ebp),%edx
 804dbcd:	8b 04 ca             	mov    (%edx,%ecx,8),%eax
 804dbd0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804dbd3:	8b 1c f8             	mov    (%eax,%edi,8),%ebx
 804dbd6:	51                   	push   %ecx
 804dbd7:	56                   	push   %esi
 804dbd8:	53                   	push   %ebx
 804dbd9:	e8 32 f9 ff ff       	call   0x804d510
 804dbde:	83 c4 0c             	add    $0xc,%esp
 804dbe1:	47                   	inc    %edi
 804dbe2:	8b 55 0c             	mov    0xc(%ebp),%edx
 804dbe5:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 804dbe8:	8b 52 30             	mov    0x30(%edx),%edx
 804dbeb:	89 55 e4             	mov    %edx,0xffffffe4(%ebp)
 804dbee:	3b 7c ca 04          	cmp    0x4(%edx,%ecx,8),%edi
 804dbf2:	7c d3                	jl     0x804dbc7
 804dbf4:	8b 55 08             	mov    0x8(%ebp),%edx
 804dbf7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 804dbfc:	8b 52 04             	mov    0x4(%edx),%edx
 804dbff:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 804dc02:	47                   	inc    %edi
 804dc03:	3b 7d ec             	cmp    0xffffffec(%ebp),%edi
 804dc06:	0f 8c ca fe ff ff    	jl     0x804dad6
 804dc0c:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804dc0f:	51                   	push   %ecx
 804dc10:	e8 d7 b5 ff ff       	call   0x80491ec
 804dc15:	8d 65 d4             	lea    0xffffffd4(%ebp),%esp
 804dc18:	5b                   	pop    %ebx
 804dc19:	5e                   	pop    %esi
 804dc1a:	5f                   	pop    %edi
 804dc1b:	89 ec                	mov    %ebp,%esp
 804dc1d:	5d                   	pop    %ebp
 804dc1e:	c3                   	ret    
 804dc1f:	90                   	nop    
 804dc20:	55                   	push   %ebp
 804dc21:	89 e5                	mov    %esp,%ebp
 804dc23:	83 ec 58             	sub    $0x58,%esp
 804dc26:	57                   	push   %edi
 804dc27:	56                   	push   %esi
 804dc28:	53                   	push   %ebx
 804dc29:	8b 75 08             	mov    0x8(%ebp),%esi
 804dc2c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804dc2f:	89 46 34             	mov    %eax,0x34(%esi)
 804dc32:	8b 7e 18             	mov    0x18(%esi),%edi
 804dc35:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 804dc3c:	50                   	push   %eax
 804dc3d:	e8 4e da ff ff       	call   0x804b690
 804dc42:	89 45 d4             	mov    %eax,0xffffffd4(%ebp)
 804dc45:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
 804dc48:	8b 76 18             	mov    0x18(%esi),%esi
 804dc4b:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 804dc52:	50                   	push   %eax
 804dc53:	e8 38 da ff ff       	call   0x804b690
 804dc58:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
 804dc5b:	8b 7d 08             	mov    0x8(%ebp),%edi
 804dc5e:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
 804dc61:	8b 7f 1c             	mov    0x1c(%edi),%edi
 804dc64:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804dc6b:	50                   	push   %eax
 804dc6c:	e8 1f da ff ff       	call   0x804b690
 804dc71:	89 45 c8             	mov    %eax,0xffffffc8(%ebp)
 804dc74:	8b 75 08             	mov    0x8(%ebp),%esi
 804dc77:	8b 7d 08             	mov    0x8(%ebp),%edi
 804dc7a:	8b 76 1c             	mov    0x1c(%esi),%esi
 804dc7d:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804dc84:	03 45 c8             	add    0xffffffc8(%ebp),%eax
 804dc87:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
 804dc8a:	8b 7f 18             	mov    0x18(%edi),%edi
 804dc8d:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 804dc94:	50                   	push   %eax
 804dc95:	e8 f6 d9 ff ff       	call   0x804b690
 804dc9a:	89 45 cc             	mov    %eax,0xffffffcc(%ebp)
 804dc9d:	8b 75 08             	mov    0x8(%ebp),%esi
 804dca0:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
 804dca3:	8b 76 1c             	mov    0x1c(%esi),%esi
 804dca6:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804dcad:	50                   	push   %eax
 804dcae:	e8 dd d9 ff ff       	call   0x804b690
 804dcb3:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 804dcb6:	8b 7d 08             	mov    0x8(%ebp),%edi
 804dcb9:	8b 75 08             	mov    0x8(%ebp),%esi
 804dcbc:	8b 7f 1c             	mov    0x1c(%edi),%edi
 804dcbf:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804dcc6:	03 45 c4             	add    0xffffffc4(%ebp),%eax
 804dcc9:	89 45 dc             	mov    %eax,0xffffffdc(%ebp)
 804dccc:	8b 76 10             	mov    0x10(%esi),%esi
 804dccf:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 804dcd6:	50                   	push   %eax
 804dcd7:	e8 b4 d9 ff ff       	call   0x804b690
 804dcdc:	89 45 d8             	mov    %eax,0xffffffd8(%ebp)
 804dcdf:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 804dce6:	83 c4 18             	add    $0x18,%esp
 804dce9:	8b 75 08             	mov    0x8(%ebp),%esi
 804dcec:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804dcef:	3b 7e 10             	cmp    0x10(%esi),%edi
 804dcf2:	7d 19                	jge    0x804dd0d
 804dcf4:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804dcf7:	8b 75 d8             	mov    0xffffffd8(%ebp),%esi
 804dcfa:	c7 04 be 00 00 00 00 	movl   $0x0,(%esi,%edi,4)
 804dd01:	47                   	inc    %edi
 804dd02:	8b 75 08             	mov    0x8(%ebp),%esi
 804dd05:	89 7d a8             	mov    %edi,0xffffffa8(%ebp)
 804dd08:	3b 7e 10             	cmp    0x10(%esi),%edi
 804dd0b:	7c e7                	jl     0x804dcf4
 804dd0d:	8b 7d 08             	mov    0x8(%ebp),%edi
 804dd10:	8b 7f 1c             	mov    0x1c(%edi),%edi
 804dd13:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804dd1a:	50                   	push   %eax
 804dd1b:	e8 70 d9 ff ff       	call   0x804b690
 804dd20:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804dd23:	6a 08                	push   $0x8
 804dd25:	8b 75 08             	mov    0x8(%ebp),%esi
 804dd28:	8b 46 10             	mov    0x10(%esi),%eax
 804dd2b:	50                   	push   %eax
 804dd2c:	e8 ef d8 ff ff       	call   0x804b620
 804dd31:	89 46 30             	mov    %eax,0x30(%esi)
 804dd34:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 804dd3b:	83 c4 0c             	add    $0xc,%esp
 804dd3e:	8b 56 10             	mov    0x10(%esi),%edx
 804dd41:	8d 7d f8             	lea    0xfffffff8(%ebp),%edi
 804dd44:	89 7d b0             	mov    %edi,0xffffffb0(%ebp)
 804dd47:	39 55 a8             	cmp    %edx,0xffffffa8(%ebp)
 804dd4a:	0f 8d cb 03 00 00    	jge    0x804e11b
 804dd50:	8b 75 08             	mov    0x8(%ebp),%esi
 804dd53:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804dd56:	8b 56 0c             	mov    0xc(%esi),%edx
 804dd59:	8b 04 ba             	mov    (%edx,%edi,4),%eax
 804dd5c:	05 00 ff ff ff       	add    $0xffffff00,%eax
 804dd61:	83 f8 0e             	cmp    $0xe,%eax
 804dd64:	0f 87 1b 03 00 00    	ja     0x804e085
 804dd6a:	ff 24 85 ac 94 05 08 	jmp    *0x80594ac(,%eax,4)
 804dd71:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 804dd74:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
 804dd7a:	83 c6 04             	add    $0x4,%esi
 804dd7d:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804dd80:	89 75 ec             	mov    %esi,0xffffffec(%ebp)
 804dd83:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
 804dd89:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804dd8c:	83 c7 04             	add    $0x4,%edi
 804dd8f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 804dd95:	89 7d e0             	mov    %edi,0xffffffe0(%ebp)
 804dd98:	83 c6 04             	add    $0x4,%esi
 804dd9b:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 804dd9e:	e9 66 03 00 00       	jmp    0x804e109
 804dda3:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 804dda6:	8d 75 f0             	lea    0xfffffff0(%ebp),%esi
 804dda9:	89 75 c0             	mov    %esi,0xffffffc0(%ebp)
 804ddac:	31 db                	xor    %ebx,%ebx
 804ddae:	8b 47 fc             	mov    0xfffffffc(%edi),%eax
 804ddb1:	89 46 04             	mov    %eax,0x4(%esi)
 804ddb4:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 804ddb7:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804ddba:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 804ddbd:	3b 5e fc             	cmp    0xfffffffc(%esi),%ebx
 804ddc0:	0f 8d bb 00 00 00    	jge    0x804de81
 804ddc6:	8d 7d f8             	lea    0xfffffff8(%ebp),%edi
 804ddc9:	89 7d ac             	mov    %edi,0xffffffac(%ebp)
 804ddcc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ddd0:	8b 75 b0             	mov    0xffffffb0(%ebp),%esi
 804ddd3:	56                   	push   %esi
 804ddd4:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804ddd7:	8b 75 08             	mov    0x8(%ebp),%esi
 804ddda:	8b 3c df             	mov    (%edi,%ebx,8),%edi
 804dddd:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804dde4:	03 46 30             	add    0x30(%esi),%eax
 804dde7:	50                   	push   %eax
 804dde8:	8b 7d c0             	mov    0xffffffc0(%ebp),%edi
 804ddeb:	57                   	push   %edi
 804ddec:	e8 af f7 ff ff       	call   0x804d5a0
 804ddf1:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804ddf4:	89 75 b0             	mov    %esi,0xffffffb0(%ebp)
 804ddf7:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804ddfa:	83 c4 0c             	add    $0xc,%esp
 804ddfd:	8b 46 04             	mov    0x4(%esi),%eax
 804de00:	48                   	dec    %eax
 804de01:	8b 14 df             	mov    (%edi,%ebx,8),%edx
 804de04:	8b 75 d8             	mov    0xffffffd8(%ebp),%esi
 804de07:	89 d1                	mov    %edx,%ecx
 804de09:	3b 04 96             	cmp    (%esi,%edx,4),%eax
 804de0c:	7c 50                	jl     0x804de5e
 804de0e:	89 f6                	mov    %esi,%esi
 804de10:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 804de13:	c1 24 8f 01          	shll   $0x1,(%edi,%ecx,4)
 804de17:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804de1a:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804de1d:	8b 46 04             	mov    0x4(%esi),%eax
 804de20:	8b 14 df             	mov    (%edi,%ebx,8),%edx
 804de23:	89 d1                	mov    %edx,%ecx
 804de25:	8b 75 d8             	mov    0xffffffd8(%ebp),%esi
 804de28:	48                   	dec    %eax
 804de29:	8b 14 8e             	mov    (%esi,%ecx,4),%edx
 804de2c:	39 d0                	cmp    %edx,%eax
 804de2e:	7d e0                	jge    0x804de10
 804de30:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
 804de37:	50                   	push   %eax
 804de38:	8b 14 df             	mov    (%edi,%ebx,8),%edx
 804de3b:	8b 7d 08             	mov    0x8(%ebp),%edi
 804de3e:	8b 47 30             	mov    0x30(%edi),%eax
 804de41:	8b 04 d0             	mov    (%eax,%edx,8),%eax
 804de44:	50                   	push   %eax
 804de45:	e8 a6 d8 ff ff       	call   0x804b6f0
 804de4a:	89 c1                	mov    %eax,%ecx
 804de4c:	8b 75 dc             	mov    0xffffffdc(%ebp),%esi
 804de4f:	8b 47 30             	mov    0x30(%edi),%eax
 804de52:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804de55:	83 c4 08             	add    $0x8,%esp
 804de58:	89 0c d0             	mov    %ecx,(%eax,%edx,8)
 804de5b:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804de5e:	8b 7d 08             	mov    0x8(%ebp),%edi
 804de61:	8b 47 30             	mov    0x30(%edi),%eax
 804de64:	8d 04 d0             	lea    (%eax,%edx,8),%eax
 804de67:	50                   	push   %eax
 804de68:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804de6b:	56                   	push   %esi
 804de6c:	e8 5f f6 ff ff       	call   0x804d4d0
 804de71:	83 c4 08             	add    $0x8,%esp
 804de74:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804de77:	43                   	inc    %ebx
 804de78:	3b 5f fc             	cmp    0xfffffffc(%edi),%ebx
 804de7b:	0f 8c 4f ff ff ff    	jl     0x804ddd0
 804de81:	8b 75 08             	mov    0x8(%ebp),%esi
 804de84:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804de87:	8b 46 0c             	mov    0xc(%esi),%eax
 804de8a:	81 3c b8 0a 01 00 00 	cmpl   $0x10a,(%eax,%edi,4)
 804de91:	0f 84 72 02 00 00    	je     0x804e109
 804de97:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 804de9a:	c7 46 fc 01 00 00 00 	movl   $0x1,0xfffffffc(%esi)
 804dea1:	e9 63 02 00 00       	jmp    0x804e109
 804dea6:	8d 7d f0             	lea    0xfffffff0(%ebp),%edi
 804dea9:	89 7d bc             	mov    %edi,0xffffffbc(%ebp)
 804deac:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804deaf:	31 db                	xor    %ebx,%ebx
 804deb1:	8b 46 fc             	mov    0xfffffffc(%esi),%eax
 804deb4:	89 47 04             	mov    %eax,0x4(%edi)
 804deb7:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 804deba:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 804debd:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804dec0:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804dec3:	8b 76 fc             	mov    0xfffffffc(%esi),%esi
 804dec6:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804decd:	03 45 dc             	add    0xffffffdc(%ebp),%eax
 804ded0:	89 45 ac             	mov    %eax,0xffffffac(%ebp)
 804ded3:	8b 57 f8             	mov    0xfffffff8(%edi),%edx
 804ded6:	39 d3                	cmp    %edx,%ebx
 804ded8:	0f 8d b7 00 00 00    	jge    0x804df95
 804dede:	8d 75 f8             	lea    0xfffffff8(%ebp),%esi
 804dee1:	89 75 b8             	mov    %esi,0xffffffb8(%ebp)
 804dee4:	8b 7d b0             	mov    0xffffffb0(%ebp),%edi
 804dee7:	57                   	push   %edi
 804dee8:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804deeb:	8b 7d 08             	mov    0x8(%ebp),%edi
 804deee:	8b 34 de             	mov    (%esi,%ebx,8),%esi
 804def1:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804def8:	03 47 30             	add    0x30(%edi),%eax
 804defb:	50                   	push   %eax
 804defc:	8b 75 bc             	mov    0xffffffbc(%ebp),%esi
 804deff:	56                   	push   %esi
 804df00:	e8 9b f6 ff ff       	call   0x804d5a0
 804df05:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 804df08:	89 7d b0             	mov    %edi,0xffffffb0(%ebp)
 804df0b:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804df0e:	83 c4 0c             	add    $0xc,%esp
 804df11:	8b 47 04             	mov    0x4(%edi),%eax
 804df14:	48                   	dec    %eax
 804df15:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804df18:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 804df1b:	89 d1                	mov    %edx,%ecx
 804df1d:	3b 04 97             	cmp    (%edi,%edx,4),%eax
 804df20:	7c 4e                	jl     0x804df70
 804df22:	8b 75 d8             	mov    0xffffffd8(%ebp),%esi
 804df25:	c1 24 8e 01          	shll   $0x1,(%esi,%ecx,4)
 804df29:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 804df2c:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804df2f:	8b 47 04             	mov    0x4(%edi),%eax
 804df32:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804df35:	89 d1                	mov    %edx,%ecx
 804df37:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 804df3a:	48                   	dec    %eax
 804df3b:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 804df3e:	39 d0                	cmp    %edx,%eax
 804df40:	7d e0                	jge    0x804df22
 804df42:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
 804df49:	50                   	push   %eax
 804df4a:	8b 14 de             	mov    (%esi,%ebx,8),%edx
 804df4d:	8b 75 08             	mov    0x8(%ebp),%esi
 804df50:	8b 46 30             	mov    0x30(%esi),%eax
 804df53:	8b 04 d0             	mov    (%eax,%edx,8),%eax
 804df56:	50                   	push   %eax
 804df57:	e8 94 d7 ff ff       	call   0x804b6f0
 804df5c:	89 c1                	mov    %eax,%ecx
 804df5e:	8b 7d ac             	mov    0xffffffac(%ebp),%edi
 804df61:	8b 46 30             	mov    0x30(%esi),%eax
 804df64:	8b 14 df             	mov    (%edi,%ebx,8),%edx
 804df67:	83 c4 08             	add    $0x8,%esp
 804df6a:	89 0c d0             	mov    %ecx,(%eax,%edx,8)
 804df6d:	8b 14 df             	mov    (%edi,%ebx,8),%edx
 804df70:	8b 75 08             	mov    0x8(%ebp),%esi
 804df73:	8b 46 30             	mov    0x30(%esi),%eax
 804df76:	8d 04 d0             	lea    (%eax,%edx,8),%eax
 804df79:	50                   	push   %eax
 804df7a:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 804df7d:	57                   	push   %edi
 804df7e:	e8 4d f5 ff ff       	call   0x804d4d0
 804df83:	83 c4 08             	add    $0x8,%esp
 804df86:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804df89:	43                   	inc    %ebx
 804df8a:	8b 56 f8             	mov    0xfffffff8(%esi),%edx
 804df8d:	39 d3                	cmp    %edx,%ebx
 804df8f:	0f 8c 4f ff ff ff    	jl     0x804dee4
 804df95:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 804df98:	83 7f f8 00          	cmpl   $0x0,0xfffffff8(%edi)
 804df9c:	74 14                	je     0x804dfb2
 804df9e:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804dfa1:	8b 46 fc             	mov    0xfffffffc(%esi),%eax
 804dfa4:	01 46 f8             	add    %eax,0xfffffff8(%esi)
 804dfa7:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804dfaa:	8b 47 fc             	mov    0xfffffffc(%edi),%eax
 804dfad:	8b 57 f8             	mov    0xfffffff8(%edi),%edx
 804dfb0:	eb 16                	jmp    0x804dfc8
 804dfb2:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804dfb5:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804dfb8:	8b 76 fc             	mov    0xfffffffc(%esi),%esi
 804dfbb:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804dfc2:	01 45 e4             	add    %eax,0xffffffe4(%ebp)
 804dfc5:	8b 47 fc             	mov    0xfffffffc(%edi),%eax
 804dfc8:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 804dfcb:	83 45 e8 fc          	addl   $0xfffffffc,0xffffffe8(%ebp)
 804dfcf:	83 7e fc 00          	cmpl   $0x0,0xfffffffc(%esi)
 804dfd3:	74 0b                	je     0x804dfe0
 804dfd5:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804dfd8:	01 c2                	add    %eax,%edx
 804dfda:	89 57 f8             	mov    %edx,0xfffffff8(%edi)
 804dfdd:	eb 41                	jmp    0x804e020
 804dfdf:	90                   	nop    
 804dfe0:	8b 75 dc             	mov    0xffffffdc(%ebp),%esi
 804dfe3:	8d 14 d6             	lea    (%esi,%edx,8),%edx
 804dfe6:	89 55 ac             	mov    %edx,0xffffffac(%ebp)
 804dfe9:	8d 58 ff             	lea    0xffffffff(%eax),%ebx
 804dfec:	85 db                	test   %ebx,%ebx
 804dfee:	7c 17                	jl     0x804e007
 804dff0:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804dff3:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804dff6:	8b 04 df             	mov    (%edi,%ebx,8),%eax
 804dff9:	8b 54 df 04          	mov    0x4(%edi,%ebx,8),%edx
 804dffd:	89 04 de             	mov    %eax,(%esi,%ebx,8)
 804e000:	89 54 de 04          	mov    %edx,0x4(%esi,%ebx,8)
 804e004:	4b                   	dec    %ebx
 804e005:	79 e9                	jns    0x804dff0
 804e007:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804e00a:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804e00d:	8b 7f f8             	mov    0xfffffff8(%edi),%edi
 804e010:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804e017:	01 45 dc             	add    %eax,0xffffffdc(%ebp)
 804e01a:	8b 46 fc             	mov    0xfffffffc(%esi),%eax
 804e01d:	89 46 f8             	mov    %eax,0xfffffff8(%esi)
 804e020:	83 45 e0 fc          	addl   $0xfffffffc,0xffffffe0(%ebp)
 804e024:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 804e027:	31 c0                	xor    %eax,%eax
 804e029:	83 7f fc 00          	cmpl   $0x0,0xfffffffc(%edi)
 804e02d:	74 45                	je     0x804e074
 804e02f:	83 7f f8 00          	cmpl   $0x0,0xfffffff8(%edi)
 804e033:	0f 95 c0             	setne  %al
 804e036:	25 ff 00 00 00       	and    $0xff,%eax
 804e03b:	eb 37                	jmp    0x804e074
 804e03d:	8d 76 00             	lea    0x0(%esi),%esi
 804e040:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 804e043:	8b 47 fc             	mov    0xfffffffc(%edi),%eax
 804e046:	01 47 f8             	add    %eax,0xfffffff8(%edi)
 804e049:	83 c7 fc             	add    $0xfffffffc,%edi
 804e04c:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 804e04f:	89 7d e8             	mov    %edi,0xffffffe8(%ebp)
 804e052:	8b 46 fc             	mov    0xfffffffc(%esi),%eax
 804e055:	01 46 f8             	add    %eax,0xfffffff8(%esi)
 804e058:	83 c6 fc             	add    $0xfffffffc,%esi
 804e05b:	89 75 e0             	mov    %esi,0xffffffe0(%ebp)
 804e05e:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 804e061:	31 c0                	xor    %eax,%eax
 804e063:	83 7f fc 00          	cmpl   $0x0,0xfffffffc(%edi)
 804e067:	75 06                	jne    0x804e06f
 804e069:	83 7f f8 00          	cmpl   $0x0,0xfffffff8(%edi)
 804e06d:	74 05                	je     0x804e074
 804e06f:	b8 01 00 00 00       	mov    $0x1,%eax
 804e074:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 804e077:	89 46 f8             	mov    %eax,0xfffffff8(%esi)
 804e07a:	83 c6 fc             	add    $0xfffffffc,%esi
 804e07d:	89 75 ec             	mov    %esi,0xffffffec(%ebp)
 804e080:	e9 84 00 00 00       	jmp    0x804e109
 804e085:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 804e088:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e08b:	83 45 ec 04          	addl   $0x4,0xffffffec(%ebp)
 804e08f:	81 3c ba 01 01 00 00 	cmpl   $0x101,(%edx,%edi,4)
 804e096:	0f 94 c2             	sete   %dl
 804e099:	89 d6                	mov    %edx,%esi
 804e09b:	83 e6 01             	and    $0x1,%esi
 804e09e:	89 30                	mov    %esi,(%eax)
 804e0a0:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804e0a3:	c7 07 01 00 00 00    	movl   $0x1,(%edi)
 804e0a9:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804e0ac:	83 c7 04             	add    $0x4,%edi
 804e0af:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
 804e0b5:	89 7d e0             	mov    %edi,0xffffffe0(%ebp)
 804e0b8:	83 c6 04             	add    $0x4,%esi
 804e0bb:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 804e0be:	83 45 e4 f8          	addl   $0xfffffff8,0xffffffe4(%ebp)
 804e0c2:	83 45 dc f8          	addl   $0xfffffff8,0xffffffdc(%ebp)
 804e0c6:	8b 75 dc             	mov    0xffffffdc(%ebp),%esi
 804e0c9:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e0cc:	89 3e                	mov    %edi,(%esi)
 804e0ce:	8b 75 e4             	mov    0xffffffe4(%ebp),%esi
 804e0d1:	89 3e                	mov    %edi,(%esi)
 804e0d3:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 804e0d6:	c7 47 04 ff 00 00 00 	movl   $0xff,0x4(%edi)
 804e0dd:	c7 46 04 ff 00 00 00 	movl   $0xff,0x4(%esi)
 804e0e4:	8b 75 a8             	mov    0xffffffa8(%ebp),%esi
 804e0e7:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 804e0ea:	c7 04 b7 01 00 00 00 	movl   $0x1,(%edi,%esi,4)
 804e0f1:	6a 08                	push   $0x8
 804e0f3:	e8 98 d5 ff ff       	call   0x804b690
 804e0f8:	89 c2                	mov    %eax,%edx
 804e0fa:	8b 75 08             	mov    0x8(%ebp),%esi
 804e0fd:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e100:	8b 46 30             	mov    0x30(%esi),%eax
 804e103:	83 c4 04             	add    $0x4,%esp
 804e106:	89 14 f8             	mov    %edx,(%eax,%edi,8)
 804e109:	8b 75 08             	mov    0x8(%ebp),%esi
 804e10c:	ff 45 a8             	incl   0xffffffa8(%ebp)
 804e10f:	8b 56 10             	mov    0x10(%esi),%edx
 804e112:	39 55 a8             	cmp    %edx,0xffffffa8(%ebp)
 804e115:	0f 8c 35 fc ff ff    	jl     0x804dd50
 804e11b:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 804e122:	39 55 a8             	cmp    %edx,0xffffffa8(%ebp)
 804e125:	0f 8d a0 00 00 00    	jge    0x804e1cb
 804e12b:	90                   	nop    
 804e12c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804e130:	8b 7d 08             	mov    0x8(%ebp),%edi
 804e133:	8b 75 a8             	mov    0xffffffa8(%ebp),%esi
 804e136:	8b 47 0c             	mov    0xc(%edi),%eax
 804e139:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 804e13c:	3d ff 00 00 00       	cmp    $0xff,%eax
 804e141:	7e 0e                	jle    0x804e151
 804e143:	3d 01 01 00 00       	cmp    $0x101,%eax
 804e148:	74 07                	je     0x804e151
 804e14a:	3d 10 01 00 00       	cmp    $0x110,%eax
 804e14f:	7e 6e                	jle    0x804e1bf
 804e151:	8b 7d b0             	mov    0xffffffb0(%ebp),%edi
 804e154:	57                   	push   %edi
 804e155:	8b 75 a8             	mov    0xffffffa8(%ebp),%esi
 804e158:	c1 e6 03             	shl    $0x3,%esi
 804e15b:	89 75 ac             	mov    %esi,0xffffffac(%ebp)
 804e15e:	8b 7d 08             	mov    0x8(%ebp),%edi
 804e161:	89 f0                	mov    %esi,%eax
 804e163:	03 47 30             	add    0x30(%edi),%eax
 804e166:	50                   	push   %eax
 804e167:	e8 64 f3 ff ff       	call   0x804d4d0
 804e16c:	57                   	push   %edi
 804e16d:	8d 5d f8             	lea    0xfffffff8(%ebp),%ebx
 804e170:	53                   	push   %ebx
 804e171:	e8 0a f9 ff ff       	call   0x804da80
 804e176:	8b 57 30             	mov    0x30(%edi),%edx
 804e179:	89 5d b0             	mov    %ebx,0xffffffb0(%ebp)
 804e17c:	8b 43 04             	mov    0x4(%ebx),%eax
 804e17f:	8b 75 a8             	mov    0xffffffa8(%ebp),%esi
 804e182:	83 c4 10             	add    $0x10,%esp
 804e185:	39 44 f2 04          	cmp    %eax,0x4(%edx,%esi,8)
 804e189:	7d 1b                	jge    0x804e1a6
 804e18b:	c1 e0 03             	shl    $0x3,%eax
 804e18e:	50                   	push   %eax
 804e18f:	8b 04 f2             	mov    (%edx,%esi,8),%eax
 804e192:	50                   	push   %eax
 804e193:	e8 58 d5 ff ff       	call   0x804b6f0
 804e198:	89 c2                	mov    %eax,%edx
 804e19a:	8b 47 30             	mov    0x30(%edi),%eax
 804e19d:	83 c4 08             	add    $0x8,%esp
 804e1a0:	89 14 f0             	mov    %edx,(%eax,%esi,8)
 804e1a3:	8b 57 30             	mov    0x30(%edi),%edx
 804e1a6:	8b 7d ac             	mov    0xffffffac(%ebp),%edi
 804e1a9:	8d 04 17             	lea    (%edi,%edx,1),%eax
 804e1ac:	50                   	push   %eax
 804e1ad:	8b 75 b0             	mov    0xffffffb0(%ebp),%esi
 804e1b0:	56                   	push   %esi
 804e1b1:	e8 1a f3 ff ff       	call   0x804d4d0
 804e1b6:	8b 7d 08             	mov    0x8(%ebp),%edi
 804e1b9:	83 c4 08             	add    $0x8,%esp
 804e1bc:	8b 57 10             	mov    0x10(%edi),%edx
 804e1bf:	ff 45 a8             	incl   0xffffffa8(%ebp)
 804e1c2:	39 55 a8             	cmp    %edx,0xffffffa8(%ebp)
 804e1c5:	0f 8c 65 ff ff ff    	jl     0x804e130
 804e1cb:	8b 75 b0             	mov    0xffffffb0(%ebp),%esi
 804e1ce:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 804e1d5:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
 804e1dc:	eb 21                	jmp    0x804e1ff
 804e1de:	89 f6                	mov    %esi,%esi
 804e1e0:	8b 7d b0             	mov    0xffffffb0(%ebp),%edi
 804e1e3:	57                   	push   %edi
 804e1e4:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e1e7:	8b 75 e4             	mov    0xffffffe4(%ebp),%esi
 804e1ea:	8d 3c fe             	lea    (%esi,%edi,8),%edi
 804e1ed:	8b 37                	mov    (%edi),%esi
 804e1ef:	8b 7f 04             	mov    0x4(%edi),%edi
 804e1f2:	57                   	push   %edi
 804e1f3:	56                   	push   %esi
 804e1f4:	e8 17 f3 ff ff       	call   0x804d510
 804e1f9:	83 c4 0c             	add    $0xc,%esp
 804e1fc:	ff 45 a8             	incl   0xffffffa8(%ebp)
 804e1ff:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 804e202:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e205:	3b 7e fc             	cmp    0xfffffffc(%esi),%edi
 804e208:	7c d6                	jl     0x804e1e0
 804e20a:	8b 7d 08             	mov    0x8(%ebp),%edi
 804e20d:	57                   	push   %edi
 804e20e:	8b 75 b0             	mov    0xffffffb0(%ebp),%esi
 804e211:	56                   	push   %esi
 804e212:	e8 69 f8 ff ff       	call   0x804da80
 804e217:	31 db                	xor    %ebx,%ebx
 804e219:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 804e220:	83 c4 08             	add    $0x8,%esp
 804e223:	8d 7d f8             	lea    0xfffffff8(%ebp),%edi
 804e226:	89 7d b4             	mov    %edi,0xffffffb4(%ebp)
 804e229:	8b 47 04             	mov    0x4(%edi),%eax
 804e22c:	39 c3                	cmp    %eax,%ebx
 804e22e:	7d 30                	jge    0x804e260
 804e230:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 804e233:	89 75 ac             	mov    %esi,0xffffffac(%ebp)
 804e236:	89 c1                	mov    %eax,%ecx
 804e238:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 804e23b:	8b 75 ac             	mov    0xffffffac(%ebp),%esi
 804e23e:	8b 54 fe 04          	mov    0x4(%esi,%edi,8),%edx
 804e242:	89 d0                	mov    %edx,%eax
 804e244:	25 c0 00 00 00       	and    $0xc0,%eax
 804e249:	c1 e8 02             	shr    $0x2,%eax
 804e24c:	83 e2 30             	and    $0x30,%edx
 804e24f:	39 d0                	cmp    %edx,%eax
 804e251:	74 05                	je     0x804e258
 804e253:	bb 01 00 00 00       	mov    $0x1,%ebx
 804e258:	ff 45 a8             	incl   0xffffffa8(%ebp)
 804e25b:	39 4d a8             	cmp    %ecx,0xffffffa8(%ebp)
 804e25e:	7c d8                	jl     0x804e238
 804e260:	8b 7d 08             	mov    0x8(%ebp),%edi
 804e263:	c7 47 2c 01 00 00 00 	movl   $0x1,0x2c(%edi)
 804e26a:	c7 47 28 00 00 00 00 	movl   $0x0,0x28(%edi)
 804e271:	6a 14                	push   $0x14
 804e273:	e8 18 d4 ff ff       	call   0x804b690
 804e278:	89 47 24             	mov    %eax,0x24(%edi)
 804e27b:	6a 00                	push   $0x0
 804e27d:	53                   	push   %ebx
 804e27e:	8b 75 b4             	mov    0xffffffb4(%ebp),%esi
 804e281:	56                   	push   %esi
 804e282:	57                   	push   %edi
 804e283:	e8 08 f5 ff ff       	call   0x804d790
 804e288:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 804e28b:	57                   	push   %edi
 804e28c:	e8 5b af ff ff       	call   0x80491ec
 804e291:	8b 75 d0             	mov    0xffffffd0(%ebp),%esi
 804e294:	56                   	push   %esi
 804e295:	e8 52 af ff ff       	call   0x80491ec
 804e29a:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 804e29d:	57                   	push   %edi
 804e29e:	e8 49 af ff ff       	call   0x80491ec
 804e2a3:	83 c4 20             	add    $0x20,%esp
 804e2a6:	8b 75 cc             	mov    0xffffffcc(%ebp),%esi
 804e2a9:	56                   	push   %esi
 804e2aa:	e8 3d af ff ff       	call   0x80491ec
 804e2af:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 804e2b2:	57                   	push   %edi
 804e2b3:	e8 34 af ff ff       	call   0x80491ec
 804e2b8:	8b 75 d8             	mov    0xffffffd8(%ebp),%esi
 804e2bb:	56                   	push   %esi
 804e2bc:	e8 2b af ff ff       	call   0x80491ec
 804e2c1:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804e2c4:	50                   	push   %eax
 804e2c5:	e8 22 af ff ff       	call   0x80491ec
 804e2ca:	8d 65 9c             	lea    0xffffff9c(%ebp),%esp
 804e2cd:	5b                   	pop    %ebx
 804e2ce:	5e                   	pop    %esi
 804e2cf:	5f                   	pop    %edi
 804e2d0:	89 ec                	mov    %ebp,%esp
 804e2d2:	5d                   	pop    %ebp
 804e2d3:	c3                   	ret    
 804e2d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e2da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 804e2e0:	55                   	push   %ebp
 804e2e1:	89 e5                	mov    %esp,%ebp
 804e2e3:	81 ec 10 29 00 00    	sub    $0x2910,%esp
 804e2e9:	57                   	push   %edi
 804e2ea:	56                   	push   %esi
 804e2eb:	53                   	push   %ebx
 804e2ec:	c7 85 94 d7 ff ff 00 	movl   $0x0,0xffffd794(%ebp)
 804e2f3:	00 00 00 
 804e2f6:	83 3d a0 b6 05 08 00 	cmpl   $0x0,0x805b6a0
 804e2fd:	75 65                	jne    0x804e364
 804e2ff:	c7 05 a0 b6 05 08 01 	movl   $0x1,0x805b6a0
 804e306:	00 00 00 
 804e309:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804e310:	00 00 00 
 804e313:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804e318:	8b 8d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ecx
 804e31e:	f6 04 48 08          	testb  $0x8,(%eax,%ecx,2)
 804e322:	75 05                	jne    0x804e329
 804e324:	83 f9 5f             	cmp    $0x5f,%ecx
 804e327:	75 14                	jne    0x804e33d
 804e329:	68 60 b6 05 08       	push   $0x805b660
 804e32e:	8b 9d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ebx
 804e334:	53                   	push   %ebx
 804e335:	e8 56 d4 ff ff       	call   0x804b790
 804e33a:	83 c4 08             	add    $0x8,%esp
 804e33d:	ff 85 68 d7 ff ff    	incl   0xffffd768(%ebp)
 804e343:	81 bd 68 d7 ff ff ff 	cmpl   $0xff,0xffffd768(%ebp)
 804e34a:	00 00 00 
 804e34d:	7e c4                	jle    0x804e313
 804e34f:	68 80 b6 05 08       	push   $0x805b680
 804e354:	31 c0                	xor    %eax,%eax
 804e356:	a0 ec ba 05 08       	mov    0x805baec,%al
 804e35b:	50                   	push   %eax
 804e35c:	e8 2f d4 ff ff       	call   0x804b790
 804e361:	83 c4 08             	add    $0x8,%esp
 804e364:	8d b5 e0 d7 ff ff    	lea    0xffffd7e0(%ebp),%esi
 804e36a:	89 b5 64 d7 ff ff    	mov    %esi,0xffffd764(%ebp)
 804e370:	89 b5 00 d7 ff ff    	mov    %esi,0xffffd700(%ebp)
 804e376:	56                   	push   %esi
 804e377:	e8 a4 d4 ff ff       	call   0x804b820
 804e37c:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804e383:	00 00 00 
 804e386:	83 c4 04             	add    $0x4,%esp
 804e389:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e38c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804e38f:	8d 14 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edx
 804e396:	89 95 28 d7 ff ff    	mov    %edx,0xffffd728(%ebp)
 804e39c:	8d 04 13             	lea    (%ebx,%edx,1),%eax
 804e39f:	c1 e0 02             	shl    $0x2,%eax
 804e3a2:	8b 79 24             	mov    0x24(%ecx),%edi
 804e3a5:	8b b5 68 d7 ff ff    	mov    0xffffd768(%ebp),%esi
 804e3ab:	3b 74 07 08          	cmp    0x8(%edi,%eax,1),%esi
 804e3af:	0f 8d 5f 05 00 00    	jge    0x804e914
 804e3b5:	89 85 60 d7 ff ff    	mov    %eax,0xffffd760(%ebp)
 804e3bb:	90                   	nop    
 804e3bc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804e3c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804e3c3:	8d 04 11             	lea    (%ecx,%edx,1),%eax
 804e3c6:	8b b5 68 d7 ff ff    	mov    0xffffd768(%ebp),%esi
 804e3cc:	8b 44 87 04          	mov    0x4(%edi,%eax,4),%eax
 804e3d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e3d3:	8b 1c f0             	mov    (%eax,%esi,8),%ebx
 804e3d6:	8b 74 f0 04          	mov    0x4(%eax,%esi,8),%esi
 804e3da:	89 9d 8c d7 ff ff    	mov    %ebx,0xffffd78c(%ebp)
 804e3e0:	89 b5 90 d7 ff ff    	mov    %esi,0xffffd790(%ebp)
 804e3e6:	8b 95 8c d7 ff ff    	mov    0xffffd78c(%ebp),%edx
 804e3ec:	8b 41 0c             	mov    0xc(%ecx),%eax
 804e3ef:	8b 14 90             	mov    (%eax,%edx,4),%edx
 804e3f2:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 804e3f8:	77 16                	ja     0x804e410
 804e3fa:	8b 9d 64 d7 ff ff    	mov    0xffffd764(%ebp),%ebx
 804e400:	53                   	push   %ebx
 804e401:	52                   	push   %edx
 804e402:	e8 89 d3 ff ff       	call   0x804b790
 804e407:	eb 2f                	jmp    0x804e438
 804e409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804e410:	81 fa 10 01 00 00    	cmp    $0x110,%edx
 804e416:	0f 8e d0 04 00 00    	jle    0x804e8ec
 804e41c:	8b b5 64 d7 ff ff    	mov    0xffffd764(%ebp),%esi
 804e422:	56                   	push   %esi
 804e423:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e426:	c1 e2 05             	shl    $0x5,%edx
 804e429:	8b 01                	mov    (%ecx),%eax
 804e42b:	8d 84 10 e0 dd ff ff 	lea    0xffffdde0(%eax,%edx,1),%eax
 804e432:	50                   	push   %eax
 804e433:	e8 b8 d3 ff ff       	call   0x804b7f0
 804e438:	83 c4 08             	add    $0x8,%esp
 804e43b:	81 bd 90 d7 ff ff ff 	cmpl   $0xff,0xffffd790(%ebp)
 804e442:	00 00 00 
 804e445:	0f 84 3a 01 00 00    	je     0x804e585
 804e44b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804e44e:	8b b5 60 d7 ff ff    	mov    0xffffd760(%ebp),%esi
 804e454:	8b 53 24             	mov    0x24(%ebx),%edx
 804e457:	8b 85 90 d7 ff ff    	mov    0xffffd790(%ebp),%eax
 804e45d:	80 7c 32 0c 00       	cmpb   $0x0,0xc(%edx,%esi,1)
 804e462:	74 0c                	je     0x804e470
 804e464:	84 c0                	test   %al,%al
 804e466:	7c 29                	jl     0x804e491
 804e468:	eb 0a                	jmp    0x804e474
 804e46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e470:	a8 20                	test   $0x20,%al
 804e472:	75 1d                	jne    0x804e491
 804e474:	8b 8d 64 d7 ff ff    	mov    0xffffd764(%ebp),%ecx
 804e47a:	51                   	push   %ecx
 804e47b:	31 c0                	xor    %eax,%eax
 804e47d:	a0 ec ba 05 08       	mov    0x805baec,%al
 804e482:	50                   	push   %eax
 804e483:	e8 38 d3 ff ff       	call   0x804b7c0
 804e488:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804e48b:	83 c4 08             	add    $0x8,%esp
 804e48e:	8b 53 24             	mov    0x24(%ebx),%edx
 804e491:	8b b5 60 d7 ff ff    	mov    0xffffd760(%ebp),%esi
 804e497:	8b 85 90 d7 ff ff    	mov    0xffffd790(%ebp),%eax
 804e49d:	80 7c 32 0c 00       	cmpb   $0x0,0xc(%edx,%esi,1)
 804e4a2:	74 0c                	je     0x804e4b0
 804e4a4:	a8 40                	test   $0x40,%al
 804e4a6:	75 25                	jne    0x804e4cd
 804e4a8:	eb 0a                	jmp    0x804e4b4
 804e4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804e4b0:	a8 10                	test   $0x10,%al
 804e4b2:	75 19                	jne    0x804e4cd
 804e4b4:	31 ff                	xor    %edi,%edi
 804e4b6:	8b 85 64 d7 ff ff    	mov    0xffffd764(%ebp),%eax
 804e4bc:	ba 80 b6 05 08       	mov    $0x805b680,%edx
 804e4c1:	8b 0c ba             	mov    (%edx,%edi,4),%ecx
 804e4c4:	21 0c b8             	and    %ecx,(%eax,%edi,4)
 804e4c7:	47                   	inc    %edi
 804e4c8:	83 ff 07             	cmp    $0x7,%edi
 804e4cb:	76 f4                	jbe    0x804e4c1
 804e4cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804e4d0:	8b b5 60 d7 ff ff    	mov    0xffffd760(%ebp),%esi
 804e4d6:	8b 43 24             	mov    0x24(%ebx),%eax
 804e4d9:	8b 95 90 d7 ff ff    	mov    0xffffd790(%ebp),%edx
 804e4df:	80 7c 30 0d 00       	cmpb   $0x0,0xd(%eax,%esi,1)
 804e4e4:	74 0a                	je     0x804e4f0
 804e4e6:	f6 c2 08             	test   $0x8,%dl
 804e4e9:	75 27                	jne    0x804e512
 804e4eb:	eb 08                	jmp    0x804e4f5
 804e4ed:	8d 76 00             	lea    0x0(%esi),%esi
 804e4f0:	f6 c2 02             	test   $0x2,%dl
 804e4f3:	75 1d                	jne    0x804e512
 804e4f5:	31 ff                	xor    %edi,%edi
 804e4f7:	8b 95 64 d7 ff ff    	mov    0xffffd764(%ebp),%edx
 804e4fd:	8d 76 00             	lea    0x0(%esi),%esi
 804e500:	8b 04 bd 60 b6 05 08 	mov    0x805b660(,%edi,4),%eax
 804e507:	f7 d0                	not    %eax
 804e509:	21 04 ba             	and    %eax,(%edx,%edi,4)
 804e50c:	47                   	inc    %edi
 804e50d:	83 ff 07             	cmp    $0x7,%edi
 804e510:	76 ee                	jbe    0x804e500
 804e512:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e515:	8b 9d 60 d7 ff ff    	mov    0xffffd760(%ebp),%ebx
 804e51b:	8b 41 24             	mov    0x24(%ecx),%eax
 804e51e:	8b 95 90 d7 ff ff    	mov    0xffffd790(%ebp),%edx
 804e524:	80 7c 18 0d 00       	cmpb   $0x0,0xd(%eax,%ebx,1)
 804e529:	74 07                	je     0x804e532
 804e52b:	f6 c2 04             	test   $0x4,%dl
 804e52e:	75 20                	jne    0x804e550
 804e530:	eb 05                	jmp    0x804e537
 804e532:	f6 c2 01             	test   $0x1,%dl
 804e535:	75 19                	jne    0x804e550
 804e537:	31 ff                	xor    %edi,%edi
 804e539:	8b 85 64 d7 ff ff    	mov    0xffffd764(%ebp),%eax
 804e53f:	ba 60 b6 05 08       	mov    $0x805b660,%edx
 804e544:	8b 34 ba             	mov    (%edx,%edi,4),%esi
 804e547:	21 34 b8             	and    %esi,(%eax,%edi,4)
 804e54a:	47                   	inc    %edi
 804e54b:	83 ff 07             	cmp    $0x7,%edi
 804e54e:	76 f4                	jbe    0x804e544
 804e550:	31 ff                	xor    %edi,%edi
 804e552:	83 bd e0 d7 ff ff 00 	cmpl   $0x0,0xffffd7e0(%ebp)
 804e559:	75 21                	jne    0x804e57c
 804e55b:	bf 01 00 00 00       	mov    $0x1,%edi
 804e560:	83 bd e4 d7 ff ff 00 	cmpl   $0x0,0xffffd7e4(%ebp)
 804e567:	75 13                	jne    0x804e57c
 804e569:	8b 85 64 d7 ff ff    	mov    0xffffd764(%ebp),%eax
 804e56f:	90                   	nop    
 804e570:	47                   	inc    %edi
 804e571:	83 ff 07             	cmp    $0x7,%edi
 804e574:	77 06                	ja     0x804e57c
 804e576:	83 3c b8 00          	cmpl   $0x0,(%eax,%edi,4)
 804e57a:	74 f4                	je     0x804e570
 804e57c:	83 ff 08             	cmp    $0x8,%edi
 804e57f:	0f 84 67 03 00 00    	je     0x804e8ec
 804e585:	31 ff                	xor    %edi,%edi
 804e587:	3b bd 94 d7 ff ff    	cmp    0xffffd794(%ebp),%edi
 804e58d:	0f 8d db 02 00 00    	jge    0x804e86e
 804e593:	8d 8d 00 d8 ff ff    	lea    0xffffd800(%ebp),%ecx
 804e599:	89 8d 18 d7 ff ff    	mov    %ecx,0xffffd718(%ebp)
 804e59f:	90                   	nop    
 804e5a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804e5a3:	8b 95 8c d7 ff ff    	mov    0xffffd78c(%ebp),%edx
 804e5a9:	8b 43 0c             	mov    0xc(%ebx),%eax
 804e5ac:	8b 14 90             	mov    (%eax,%edx,4),%edx
 804e5af:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 804e5b5:	77 2b                	ja     0x804e5e2
 804e5b7:	89 bd 04 d7 ff ff    	mov    %edi,0xffffd704(%ebp)
 804e5bd:	c1 a5 04 d7 ff ff 05 	shll   $0x5,0xffffd704(%ebp)
 804e5c4:	8b 85 18 d7 ff ff    	mov    0xffffd718(%ebp),%eax
 804e5ca:	03 85 04 d7 ff ff    	add    0xffffd704(%ebp),%eax
 804e5d0:	50                   	push   %eax
 804e5d1:	52                   	push   %edx
 804e5d2:	e8 89 d1 ff ff       	call   0x804b760
 804e5d7:	83 c4 08             	add    $0x8,%esp
 804e5da:	85 c0                	test   %eax,%eax
 804e5dc:	0f 84 7f 02 00 00    	je     0x804e861
 804e5e2:	c7 85 fc d6 ff ff 00 	movl   $0x0,0xffffd6fc(%ebp)
 804e5e9:	00 00 00 
 804e5ec:	c7 85 f0 d6 ff ff 00 	movl   $0x0,0xffffd6f0(%ebp)
 804e5f3:	00 00 00 
 804e5f6:	89 bd 04 d7 ff ff    	mov    %edi,0xffffd704(%ebp)
 804e5fc:	c1 a5 04 d7 ff ff 05 	shll   $0x5,0xffffd704(%ebp)
 804e603:	8d b5 c0 d7 ff ff    	lea    0xffffd7c0(%ebp),%esi
 804e609:	89 b5 08 d7 ff ff    	mov    %esi,0xffffd708(%ebp)
 804e60f:	89 b5 5c d7 ff ff    	mov    %esi,0xffffd75c(%ebp)
 804e615:	8b 8d 64 d7 ff ff    	mov    0xffffd764(%ebp),%ecx
 804e61b:	89 8d 58 d7 ff ff    	mov    %ecx,0xffffd758(%ebp)
 804e621:	8b 9d 04 d7 ff ff    	mov    0xffffd704(%ebp),%ebx
 804e627:	89 9d 54 d7 ff ff    	mov    %ebx,0xffffd754(%ebp)
 804e62d:	8b b5 18 d7 ff ff    	mov    0xffffd718(%ebp),%esi
 804e633:	89 b5 f8 d6 ff ff    	mov    %esi,0xffffd6f8(%ebp)
 804e639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804e640:	8b 8d f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%ecx
 804e646:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
 804e64d:	8b 9d 54 d7 ff ff    	mov    0xffffd754(%ebp),%ebx
 804e653:	8b b5 58 d7 ff ff    	mov    0xffffd758(%ebp),%esi
 804e659:	8d 14 03             	lea    (%ebx,%eax,1),%edx
 804e65c:	8b 0c 30             	mov    (%eax,%esi,1),%ecx
 804e65f:	8b b5 f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%esi
 804e665:	8b 9d 5c d7 ff ff    	mov    0xffffd75c(%ebp),%ebx
 804e66b:	23 0c 32             	and    (%edx,%esi,1),%ecx
 804e66e:	89 ca                	mov    %ecx,%edx
 804e670:	89 14 18             	mov    %edx,(%eax,%ebx,1)
 804e673:	85 d2                	test   %edx,%edx
 804e675:	74 0a                	je     0x804e681
 804e677:	c7 85 fc d6 ff ff 01 	movl   $0x1,0xffffd6fc(%ebp)
 804e67e:	00 00 00 
 804e681:	ff 85 f0 d6 ff ff    	incl   0xffffd6f0(%ebp)
 804e687:	83 bd f0 d6 ff ff 07 	cmpl   $0x7,0xffffd6f0(%ebp)
 804e68e:	76 b0                	jbe    0x804e640
 804e690:	83 bd fc d6 ff ff 00 	cmpl   $0x0,0xffffd6fc(%ebp)
 804e697:	0f 84 c4 01 00 00    	je     0x804e861
 804e69d:	c7 85 88 d7 ff ff 00 	movl   $0x0,0xffffd788(%ebp)
 804e6a4:	00 00 00 
 804e6a7:	c7 85 84 d7 ff ff 00 	movl   $0x0,0xffffd784(%ebp)
 804e6ae:	00 00 00 
 804e6b1:	c7 85 f0 d6 ff ff 00 	movl   $0x0,0xffffd6f0(%ebp)
 804e6b8:	00 00 00 
 804e6bb:	8d b5 a0 d7 ff ff    	lea    0xffffd7a0(%ebp),%esi
 804e6c1:	89 b5 0c d7 ff ff    	mov    %esi,0xffffd70c(%ebp)
 804e6c7:	8d 8d 00 f8 ff ff    	lea    0xfffff800(%ebp),%ecx
 804e6cd:	89 8d 14 d7 ff ff    	mov    %ecx,0xffffd714(%ebp)
 804e6d3:	8d 9d 04 f8 ff ff    	lea    0xfffff804(%ebp),%ebx
 804e6d9:	89 9d 10 d7 ff ff    	mov    %ebx,0xffffd710(%ebp)
 804e6df:	8b b5 64 d7 ff ff    	mov    0xffffd764(%ebp),%esi
 804e6e5:	89 b5 50 d7 ff ff    	mov    %esi,0xffffd750(%ebp)
 804e6eb:	8b 8d 04 d7 ff ff    	mov    0xffffd704(%ebp),%ecx
 804e6f1:	89 8d 4c d7 ff ff    	mov    %ecx,0xffffd74c(%ebp)
 804e6f7:	8b 9d 18 d7 ff ff    	mov    0xffffd718(%ebp),%ebx
 804e6fd:	89 9d 48 d7 ff ff    	mov    %ebx,0xffffd748(%ebp)
 804e703:	8b b5 0c d7 ff ff    	mov    0xffffd70c(%ebp),%esi
 804e709:	89 b5 44 d7 ff ff    	mov    %esi,0xffffd744(%ebp)
 804e70f:	90                   	nop    
 804e710:	8b 8d f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%ecx
 804e716:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
 804e71d:	8b 9d 50 d7 ff ff    	mov    0xffffd750(%ebp),%ebx
 804e723:	8b b5 4c d7 ff ff    	mov    0xffffd74c(%ebp),%esi
 804e729:	8d 04 16             	lea    (%esi,%edx,1),%eax
 804e72c:	8b 8d 48 d7 ff ff    	mov    0xffffd748(%ebp),%ecx
 804e732:	8b 1c 1a             	mov    (%edx,%ebx,1),%ebx
 804e735:	89 9d f8 d6 ff ff    	mov    %ebx,0xffffd6f8(%ebp)
 804e73b:	8b 04 08             	mov    (%eax,%ecx,1),%eax
 804e73e:	89 85 fc d6 ff ff    	mov    %eax,0xffffd6fc(%ebp)
 804e744:	89 d8                	mov    %ebx,%eax
 804e746:	f7 d0                	not    %eax
 804e748:	8b 9d 44 d7 ff ff    	mov    0xffffd744(%ebp),%ebx
 804e74e:	23 85 fc d6 ff ff    	and    0xffffd6fc(%ebp),%eax
 804e754:	89 04 1a             	mov    %eax,(%edx,%ebx,1)
 804e757:	74 0a                	je     0x804e763
 804e759:	c7 85 84 d7 ff ff 01 	movl   $0x1,0xffffd784(%ebp)
 804e760:	00 00 00 
 804e763:	8b 85 fc d6 ff ff    	mov    0xffffd6fc(%ebp),%eax
 804e769:	f7 d0                	not    %eax
 804e76b:	8b b5 00 d7 ff ff    	mov    0xffffd700(%ebp),%esi
 804e771:	23 85 f8 d6 ff ff    	and    0xffffd6f8(%ebp),%eax
 804e777:	89 04 32             	mov    %eax,(%edx,%esi,1)
 804e77a:	74 0a                	je     0x804e786
 804e77c:	c7 85 88 d7 ff ff 01 	movl   $0x1,0xffffd788(%ebp)
 804e783:	00 00 00 
 804e786:	ff 85 f0 d6 ff ff    	incl   0xffffd6f0(%ebp)
 804e78c:	83 bd f0 d6 ff ff 07 	cmpl   $0x7,0xffffd6f0(%ebp)
 804e793:	0f 86 77 ff ff ff    	jbe    0x804e710
 804e799:	83 bd 84 d7 ff ff 00 	cmpl   $0x0,0xffffd784(%ebp)
 804e7a0:	74 75                	je     0x804e817
 804e7a2:	8b 85 94 d7 ff ff    	mov    0xffffd794(%ebp),%eax
 804e7a8:	c1 e0 05             	shl    $0x5,%eax
 804e7ab:	03 85 18 d7 ff ff    	add    0xffffd718(%ebp),%eax
 804e7b1:	50                   	push   %eax
 804e7b2:	8b 8d 0c d7 ff ff    	mov    0xffffd70c(%ebp),%ecx
 804e7b8:	51                   	push   %ecx
 804e7b9:	e8 32 d0 ff ff       	call   0x804b7f0
 804e7be:	8b 85 18 d7 ff ff    	mov    0xffffd718(%ebp),%eax
 804e7c4:	03 85 04 d7 ff ff    	add    0xffffd704(%ebp),%eax
 804e7ca:	50                   	push   %eax
 804e7cb:	8b 9d 08 d7 ff ff    	mov    0xffffd708(%ebp),%ebx
 804e7d1:	53                   	push   %ebx
 804e7d2:	e8 19 d0 ff ff       	call   0x804b7f0
 804e7d7:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e7da:	8b 76 1c             	mov    0x1c(%esi),%esi
 804e7dd:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804e7e4:	50                   	push   %eax
 804e7e5:	e8 a6 ce ff ff       	call   0x804b690
 804e7ea:	89 c2                	mov    %eax,%edx
 804e7ec:	8b 8d 94 d7 ff ff    	mov    0xffffd794(%ebp),%ecx
 804e7f2:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 804e7f9:	8b 9d 14 d7 ff ff    	mov    0xffffd714(%ebp),%ebx
 804e7ff:	89 14 18             	mov    %edx,(%eax,%ebx,1)
 804e802:	01 d8                	add    %ebx,%eax
 804e804:	50                   	push   %eax
 804e805:	8d 04 fb             	lea    (%ebx,%edi,8),%eax
 804e808:	50                   	push   %eax
 804e809:	e8 c2 ec ff ff       	call   0x804d4d0
 804e80e:	ff 85 94 d7 ff ff    	incl   0xffffd794(%ebp)
 804e814:	83 c4 1c             	add    $0x1c,%esp
 804e817:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 804e81e:	8b b5 10 d7 ff ff    	mov    0xffffd710(%ebp),%esi
 804e824:	8b 8d 14 d7 ff ff    	mov    0xffffd714(%ebp),%ecx
 804e82a:	8b 34 30             	mov    (%eax,%esi,1),%esi
 804e82d:	89 b5 f4 d6 ff ff    	mov    %esi,0xffffd6f4(%ebp)
 804e833:	8b 14 08             	mov    (%eax,%ecx,1),%edx
 804e836:	8b 8d f4 d6 ff ff    	mov    0xffffd6f4(%ebp),%ecx
 804e83c:	8b 9d 8c d7 ff ff    	mov    0xffffd78c(%ebp),%ebx
 804e842:	8b b5 90 d7 ff ff    	mov    0xffffd790(%ebp),%esi
 804e848:	89 1c ca             	mov    %ebx,(%edx,%ecx,8)
 804e84b:	89 74 ca 04          	mov    %esi,0x4(%edx,%ecx,8)
 804e84f:	8b 9d 10 d7 ff ff    	mov    0xffffd710(%ebp),%ebx
 804e855:	ff 04 18             	incl   (%eax,%ebx,1)
 804e858:	83 bd 88 d7 ff ff 00 	cmpl   $0x0,0xffffd788(%ebp)
 804e85f:	74 0d                	je     0x804e86e
 804e861:	47                   	inc    %edi
 804e862:	3b bd 94 d7 ff ff    	cmp    0xffffd794(%ebp),%edi
 804e868:	0f 8c 32 fd ff ff    	jl     0x804e5a0
 804e86e:	3b bd 94 d7 ff ff    	cmp    0xffffd794(%ebp),%edi
 804e874:	75 76                	jne    0x804e8ec
 804e876:	8b 85 94 d7 ff ff    	mov    0xffffd794(%ebp),%eax
 804e87c:	c1 e0 05             	shl    $0x5,%eax
 804e87f:	8d 84 28 00 d8 ff ff 	lea    0xffffd800(%eax,%ebp,1),%eax
 804e886:	50                   	push   %eax
 804e887:	8b b5 64 d7 ff ff    	mov    0xffffd764(%ebp),%esi
 804e88d:	56                   	push   %esi
 804e88e:	e8 5d cf ff ff       	call   0x804b7f0
 804e893:	56                   	push   %esi
 804e894:	e8 87 cf ff ff       	call   0x804b820
 804e899:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e89c:	8b 49 1c             	mov    0x1c(%ecx),%ecx
 804e89f:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 804e8a6:	50                   	push   %eax
 804e8a7:	e8 e4 cd ff ff       	call   0x804b690
 804e8ac:	89 c7                	mov    %eax,%edi
 804e8ae:	8b 9d 94 d7 ff ff    	mov    0xffffd794(%ebp),%ebx
 804e8b4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 804e8bb:	8d 95 00 f8 ff ff    	lea    0xfffff800(%ebp),%edx
 804e8c1:	83 c4 10             	add    $0x10,%esp
 804e8c4:	89 3c 10             	mov    %edi,(%eax,%edx,1)
 804e8c7:	c7 84 28 04 f8 ff ff 	movl   $0x1,0xfffff804(%eax,%ebp,1)
 804e8ce:	01 00 00 00 
 804e8d2:	8b 04 10             	mov    (%eax,%edx,1),%eax
 804e8d5:	8b 9d 8c d7 ff ff    	mov    0xffffd78c(%ebp),%ebx
 804e8db:	8b b5 90 d7 ff ff    	mov    0xffffd790(%ebp),%esi
 804e8e1:	89 18                	mov    %ebx,(%eax)
 804e8e3:	89 70 04             	mov    %esi,0x4(%eax)
 804e8e6:	ff 85 94 d7 ff ff    	incl   0xffffd794(%ebp)
 804e8ec:	ff 85 68 d7 ff ff    	incl   0xffffd768(%ebp)
 804e8f2:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e8f5:	8b 95 28 d7 ff ff    	mov    0xffffd728(%ebp),%edx
 804e8fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804e8fe:	8d 04 11             	lea    (%ecx,%edx,1),%eax
 804e901:	8b 7e 24             	mov    0x24(%esi),%edi
 804e904:	8b 9d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ebx
 804e90a:	3b 5c 87 08          	cmp    0x8(%edi,%eax,4),%ebx
 804e90e:	0f 8c ac fa ff ff    	jl     0x804e3c0
 804e914:	8b 75 0c             	mov    0xc(%ebp),%esi
 804e917:	8b 76 1c             	mov    0x1c(%esi),%esi
 804e91a:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 804e921:	50                   	push   %eax
 804e922:	e8 69 cd ff ff       	call   0x804b690
 804e927:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804e92a:	89 85 98 d7 ff ff    	mov    %eax,0xffffd798(%ebp)
 804e930:	8b 49 1c             	mov    0x1c(%ecx),%ecx
 804e933:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 804e93a:	50                   	push   %eax
 804e93b:	e8 50 cd ff ff       	call   0x804b690
 804e940:	89 85 7c d7 ff ff    	mov    %eax,0xffffd77c(%ebp)
 804e946:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804e949:	83 c4 08             	add    $0x8,%esp
 804e94c:	83 7b 34 00          	cmpl   $0x0,0x34(%ebx)
 804e950:	0f 84 92 01 00 00    	je     0x804eae8
 804e956:	c7 85 74 d7 ff ff 00 	movl   $0x0,0xffffd774(%ebp)
 804e95d:	00 00 00 
 804e960:	c7 85 6c d7 ff ff 00 	movl   $0x0,0xffffd76c(%ebp)
 804e967:	00 00 00 
 804e96a:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804e971:	00 00 00 
 804e974:	8b 73 24             	mov    0x24(%ebx),%esi
 804e977:	89 b5 f0 d6 ff ff    	mov    %esi,0xffffd6f0(%ebp)
 804e97d:	8b 46 08             	mov    0x8(%esi),%eax
 804e980:	39 85 68 d7 ff ff    	cmp    %eax,0xffffd768(%ebp)
 804e986:	7d 70                	jge    0x804e9f8
 804e988:	8b 7e 04             	mov    0x4(%esi),%edi
 804e98b:	89 85 f8 d6 ff ff    	mov    %eax,0xffffd6f8(%ebp)
 804e991:	8b 8d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ecx
 804e997:	8b 4c cf 04          	mov    0x4(%edi,%ecx,8),%ecx
 804e99b:	89 8d fc d6 ff ff    	mov    %ecx,0xffffd6fc(%ebp)
 804e9a1:	89 ca                	mov    %ecx,%edx
 804e9a3:	81 e2 c0 00 00 00    	and    $0xc0,%edx
 804e9a9:	c1 ea 02             	shr    $0x2,%edx
 804e9ac:	89 c8                	mov    %ecx,%eax
 804e9ae:	83 e0 30             	and    $0x30,%eax
 804e9b1:	39 c2                	cmp    %eax,%edx
 804e9b3:	74 0a                	je     0x804e9bf
 804e9b5:	c7 85 74 d7 ff ff 01 	movl   $0x1,0xffffd774(%ebp)
 804e9bc:	00 00 00 
 804e9bf:	8b 85 fc d6 ff ff    	mov    0xffffd6fc(%ebp),%eax
 804e9c5:	83 e0 0c             	and    $0xc,%eax
 804e9c8:	c1 e8 02             	shr    $0x2,%eax
 804e9cb:	83 a5 fc d6 ff ff 03 	andl   $0x3,0xffffd6fc(%ebp)
 804e9d2:	3b 85 fc d6 ff ff    	cmp    0xffffd6fc(%ebp),%eax
 804e9d8:	74 0a                	je     0x804e9e4
 804e9da:	c7 85 6c d7 ff ff 01 	movl   $0x1,0xffffd76c(%ebp)
 804e9e1:	00 00 00 
 804e9e4:	ff 85 68 d7 ff ff    	incl   0xffffd768(%ebp)
 804e9ea:	8b 9d f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%ebx
 804e9f0:	39 9d 68 d7 ff ff    	cmp    %ebx,0xffffd768(%ebp)
 804e9f6:	7c 99                	jl     0x804e991
 804e9f8:	8d b5 98 d7 ff ff    	lea    0xffffd798(%ebp),%esi
 804e9fe:	89 b5 1c d7 ff ff    	mov    %esi,0xffffd71c(%ebp)
 804ea04:	56                   	push   %esi
 804ea05:	8b 85 f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%eax
 804ea0b:	83 c0 04             	add    $0x4,%eax
 804ea0e:	50                   	push   %eax
 804ea0f:	e8 bc ea ff ff       	call   0x804d4d0
 804ea14:	6a 00                	push   $0x0
 804ea16:	6a 00                	push   $0x0
 804ea18:	8b bd 1c d7 ff ff    	mov    0xffffd71c(%ebp),%edi
 804ea1e:	57                   	push   %edi
 804ea1f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ea22:	51                   	push   %ecx
 804ea23:	e8 68 ed ff ff       	call   0x804d790
 804ea28:	89 85 78 d7 ff ff    	mov    %eax,0xffffd778(%ebp)
 804ea2e:	83 c4 18             	add    $0x18,%esp
 804ea31:	83 bd 74 d7 ff ff 00 	cmpl   $0x0,0xffffd774(%ebp)
 804ea38:	74 19                	je     0x804ea53
 804ea3a:	6a 00                	push   $0x0
 804ea3c:	6a 01                	push   $0x1
 804ea3e:	57                   	push   %edi
 804ea3f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804ea42:	53                   	push   %ebx
 804ea43:	e8 48 ed ff ff       	call   0x804d790
 804ea48:	89 85 70 d7 ff ff    	mov    %eax,0xffffd770(%ebp)
 804ea4e:	83 c4 10             	add    $0x10,%esp
 804ea51:	eb 0c                	jmp    0x804ea5f
 804ea53:	8b b5 78 d7 ff ff    	mov    0xffffd778(%ebp),%esi
 804ea59:	89 b5 70 d7 ff ff    	mov    %esi,0xffffd770(%ebp)
 804ea5f:	83 bd 6c d7 ff ff 00 	cmpl   $0x0,0xffffd76c(%ebp)
 804ea66:	74 19                	je     0x804ea81
 804ea68:	6a 01                	push   $0x1
 804ea6a:	6a 00                	push   $0x0
 804ea6c:	57                   	push   %edi
 804ea6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ea70:	51                   	push   %ecx
 804ea71:	e8 1a ed ff ff       	call   0x804d790
 804ea76:	89 85 f8 d6 ff ff    	mov    %eax,0xffffd6f8(%ebp)
 804ea7c:	83 c4 10             	add    $0x10,%esp
 804ea7f:	eb 0c                	jmp    0x804ea8d
 804ea81:	8b 9d 78 d7 ff ff    	mov    0xffffd778(%ebp),%ebx
 804ea87:	89 9d f8 d6 ff ff    	mov    %ebx,0xffffd6f8(%ebp)
 804ea8d:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804ea94:	00 00 00 
 804ea97:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804ea9c:	8b b5 68 d7 ff ff    	mov    0xffffd768(%ebp),%esi
 804eaa2:	f6 04 70 08          	testb  $0x8,(%eax,%esi,2)
 804eaa6:	75 05                	jne    0x804eaad
 804eaa8:	83 fe 5f             	cmp    $0x5f,%esi
 804eaab:	75 08                	jne    0x804eab5
 804eaad:	8b 85 f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%eax
 804eab3:	eb 06                	jmp    0x804eabb
 804eab5:	8b 85 78 d7 ff ff    	mov    0xffffd778(%ebp),%eax
 804eabb:	8b 8d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ecx
 804eac1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804eac4:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 804eac7:	41                   	inc    %ecx
 804eac8:	89 8d 68 d7 ff ff    	mov    %ecx,0xffffd768(%ebp)
 804eace:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 804ead4:	7e c1                	jle    0x804ea97
 804ead6:	31 c0                	xor    %eax,%eax
 804ead8:	a0 ec ba 05 08       	mov    0x805baec,%al
 804eadd:	8b b5 70 d7 ff ff    	mov    0xffffd770(%ebp),%esi
 804eae3:	89 34 83             	mov    %esi,(%ebx,%eax,4)
 804eae6:	eb 29                	jmp    0x804eb11
 804eae8:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804eaef:	00 00 00 
 804eaf2:	8b 8d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ecx
 804eaf8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804eafb:	c7 04 8b ff ff ff ff 	movl   $0xffffffff,(%ebx,%ecx,4)
 804eb02:	41                   	inc    %ecx
 804eb03:	89 8d 68 d7 ff ff    	mov    %ecx,0xffffd768(%ebp)
 804eb09:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 804eb0f:	7e e1                	jle    0x804eaf2
 804eb11:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804eb18:	00 00 00 
 804eb1b:	8b b5 94 d7 ff ff    	mov    0xffffd794(%ebp),%esi
 804eb21:	39 b5 68 d7 ff ff    	cmp    %esi,0xffffd768(%ebp)
 804eb27:	0f 8d d8 03 00 00    	jge    0x804ef05
 804eb2d:	8d 8d 98 d7 ff ff    	lea    0xffffd798(%ebp),%ecx
 804eb33:	89 8d 40 d7 ff ff    	mov    %ecx,0xffffd740(%ebp)
 804eb39:	8d 9d 04 f8 ff ff    	lea    0xfffff804(%ebp),%ebx
 804eb3f:	89 9d 20 d7 ff ff    	mov    %ebx,0xffffd720(%ebp)
 804eb45:	8d b5 00 d8 ff ff    	lea    0xffffd800(%ebp),%esi
 804eb4b:	89 b5 18 d7 ff ff    	mov    %esi,0xffffd718(%ebp)
 804eb51:	8b 8d 40 d7 ff ff    	mov    0xffffd740(%ebp),%ecx
 804eb57:	31 ff                	xor    %edi,%edi
 804eb59:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
 804eb60:	8b 9d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ebx
 804eb66:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 804eb6d:	8b b5 20 d7 ff ff    	mov    0xffffd720(%ebp),%esi
 804eb73:	89 85 24 d7 ff ff    	mov    %eax,0xffffd724(%ebp)
 804eb79:	3b 3c 30             	cmp    (%eax,%esi,1),%edi
 804eb7c:	0f 8d b5 00 00 00    	jge    0x804ec37
 804eb82:	c7 85 f0 d6 ff ff 00 	movl   $0x0,0xffffd6f0(%ebp)
 804eb89:	00 00 00 
 804eb8c:	89 85 fc d6 ff ff    	mov    %eax,0xffffd6fc(%ebp)
 804eb92:	8d 8d 00 f8 ff ff    	lea    0xfffff800(%ebp),%ecx
 804eb98:	89 8d f8 d6 ff ff    	mov    %ecx,0xffffd6f8(%ebp)
 804eb9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804eba1:	8b 04 08             	mov    (%eax,%ecx,1),%eax
 804eba4:	eb 69                	jmp    0x804ec0f
 804eba6:	8b 8d 40 d7 ff ff    	mov    0xffffd740(%ebp),%ecx
 804ebac:	51                   	push   %ecx
 804ebad:	8b 9d fc d6 ff ff    	mov    0xffffd6fc(%ebp),%ebx
 804ebb3:	89 9d 3c d7 ff ff    	mov    %ebx,0xffffd73c(%ebp)
 804ebb9:	8b b5 f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%esi
 804ebbf:	89 b5 38 d7 ff ff    	mov    %esi,0xffffd738(%ebp)
 804ebc5:	8b 04 33             	mov    (%ebx,%esi,1),%eax
 804ebc8:	8b 04 f8             	mov    (%eax,%edi,8),%eax
 804ebcb:	8b b5 f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%esi
 804ebd1:	8b 04 c2             	mov    (%edx,%eax,8),%eax
 804ebd4:	8b 1c f0             	mov    (%eax,%esi,8),%ebx
 804ebd7:	8b 74 f0 04          	mov    0x4(%eax,%esi,8),%esi
 804ebdb:	56                   	push   %esi
 804ebdc:	53                   	push   %ebx
 804ebdd:	e8 2e e9 ff ff       	call   0x804d510
 804ebe2:	83 c4 0c             	add    $0xc,%esp
 804ebe5:	ff 85 f0 d6 ff ff    	incl   0xffffd6f0(%ebp)
 804ebeb:	8b 8d 24 d7 ff ff    	mov    0xffffd724(%ebp),%ecx
 804ebf1:	89 8d fc d6 ff ff    	mov    %ecx,0xffffd6fc(%ebp)
 804ebf7:	8b 9d f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%ebx
 804ebfd:	8b b5 38 d7 ff ff    	mov    0xffffd738(%ebp),%esi
 804ec03:	8b 8d 3c d7 ff ff    	mov    0xffffd73c(%ebp),%ecx
 804ec09:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804ec0c:	8b 04 31             	mov    (%ecx,%esi,1),%eax
 804ec0f:	8b 53 30             	mov    0x30(%ebx),%edx
 804ec12:	8b 04 f8             	mov    (%eax,%edi,8),%eax
 804ec15:	8b b5 f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%esi
 804ec1b:	3b 74 c2 04          	cmp    0x4(%edx,%eax,8),%esi
 804ec1f:	7c 85                	jl     0x804eba6
 804ec21:	8b 85 24 d7 ff ff    	mov    0xffffd724(%ebp),%eax
 804ec27:	8b 8d 20 d7 ff ff    	mov    0xffffd720(%ebp),%ecx
 804ec2d:	47                   	inc    %edi
 804ec2e:	3b 3c 08             	cmp    (%eax,%ecx,1),%edi
 804ec31:	0f 8c 4b ff ff ff    	jl     0x804eb82
 804ec37:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804ec3a:	83 7b 34 00          	cmpl   $0x0,0x34(%ebx)
 804ec3e:	74 37                	je     0x804ec77
 804ec40:	8b 43 24             	mov    0x24(%ebx),%eax
 804ec43:	31 ff                	xor    %edi,%edi
 804ec45:	3b 78 08             	cmp    0x8(%eax),%edi
 804ec48:	7d 2d                	jge    0x804ec77
 804ec4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ec50:	8b b5 40 d7 ff ff    	mov    0xffffd740(%ebp),%esi
 804ec56:	56                   	push   %esi
 804ec57:	8b 40 04             	mov    0x4(%eax),%eax
 804ec5a:	8b 1c f8             	mov    (%eax,%edi,8),%ebx
 804ec5d:	8b 74 f8 04          	mov    0x4(%eax,%edi,8),%esi
 804ec61:	56                   	push   %esi
 804ec62:	53                   	push   %ebx
 804ec63:	e8 a8 e8 ff ff       	call   0x804d510
 804ec68:	8b 75 0c             	mov    0xc(%ebp),%esi
 804ec6b:	83 c4 0c             	add    $0xc,%esp
 804ec6e:	8b 46 24             	mov    0x24(%esi),%eax
 804ec71:	47                   	inc    %edi
 804ec72:	3b 78 08             	cmp    0x8(%eax),%edi
 804ec75:	7c d9                	jl     0x804ec50
 804ec77:	c7 85 74 d7 ff ff 00 	movl   $0x0,0xffffd774(%ebp)
 804ec7e:	00 00 00 
 804ec81:	8b 8d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ecx
 804ec87:	89 8d 34 d7 ff ff    	mov    %ecx,0xffffd734(%ebp)
 804ec8d:	c1 a5 34 d7 ff ff 05 	shll   $0x5,0xffffd734(%ebp)
 804ec94:	8b 85 18 d7 ff ff    	mov    0xffffd718(%ebp),%eax
 804ec9a:	03 85 34 d7 ff ff    	add    0xffffd734(%ebp),%eax
 804eca0:	50                   	push   %eax
 804eca1:	31 c0                	xor    %eax,%eax
 804eca3:	a0 ec ba 05 08       	mov    0x805baec,%al
 804eca8:	50                   	push   %eax
 804eca9:	e8 b2 ca ff ff       	call   0x804b760
 804ecae:	83 c4 08             	add    $0x8,%esp
 804ecb1:	85 c0                	test   %eax,%eax
 804ecb3:	74 4f                	je     0x804ed04
 804ecb5:	8b 9d 40 d7 ff ff    	mov    0xffffd740(%ebp),%ebx
 804ecbb:	31 ff                	xor    %edi,%edi
 804ecbd:	8b 43 04             	mov    0x4(%ebx),%eax
 804ecc0:	39 c7                	cmp    %eax,%edi
 804ecc2:	7d 40                	jge    0x804ed04
 804ecc4:	8b b5 98 d7 ff ff    	mov    0xffffd798(%ebp),%esi
 804ecca:	89 b5 f8 d6 ff ff    	mov    %esi,0xffffd6f8(%ebp)
 804ecd0:	89 85 f0 d6 ff ff    	mov    %eax,0xffffd6f0(%ebp)
 804ecd6:	8b 8d f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%ecx
 804ecdc:	8b 54 f9 04          	mov    0x4(%ecx,%edi,8),%edx
 804ece0:	89 d0                	mov    %edx,%eax
 804ece2:	25 c0 00 00 00       	and    $0xc0,%eax
 804ece7:	c1 e8 02             	shr    $0x2,%eax
 804ecea:	83 e2 30             	and    $0x30,%edx
 804eced:	39 d0                	cmp    %edx,%eax
 804ecef:	74 0a                	je     0x804ecfb
 804ecf1:	c7 85 74 d7 ff ff 01 	movl   $0x1,0xffffd774(%ebp)
 804ecf8:	00 00 00 
 804ecfb:	47                   	inc    %edi
 804ecfc:	3b bd f0 d6 ff ff    	cmp    0xffffd6f0(%ebp),%edi
 804ed02:	7c d2                	jl     0x804ecd6
 804ed04:	c7 85 6c d7 ff ff 00 	movl   $0x0,0xffffd76c(%ebp)
 804ed0b:	00 00 00 
 804ed0e:	31 ff                	xor    %edi,%edi
 804ed10:	8b 9d 34 d7 ff ff    	mov    0xffffd734(%ebp),%ebx
 804ed16:	89 9d f8 d6 ff ff    	mov    %ebx,0xffffd6f8(%ebp)
 804ed1c:	8b b5 18 d7 ff ff    	mov    0xffffd718(%ebp),%esi
 804ed22:	89 b5 fc d6 ff ff    	mov    %esi,0xffffd6fc(%ebp)
 804ed28:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 804ed2f:	8b 8d f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%ecx
 804ed35:	8d 14 01             	lea    (%ecx,%eax,1),%edx
 804ed38:	8b 9d fc d6 ff ff    	mov    0xffffd6fc(%ebp),%ebx
 804ed3e:	8b 14 1a             	mov    (%edx,%ebx,1),%edx
 804ed41:	23 90 60 b6 05 08    	and    0x805b660(%eax),%edx
 804ed47:	89 d0                	mov    %edx,%eax
 804ed49:	85 c0                	test   %eax,%eax
 804ed4b:	75 06                	jne    0x804ed53
 804ed4d:	47                   	inc    %edi
 804ed4e:	83 ff 07             	cmp    $0x7,%edi
 804ed51:	76 d5                	jbe    0x804ed28
 804ed53:	83 ff 07             	cmp    $0x7,%edi
 804ed56:	77 54                	ja     0x804edac
 804ed58:	8b b5 40 d7 ff ff    	mov    0xffffd740(%ebp),%esi
 804ed5e:	31 ff                	xor    %edi,%edi
 804ed60:	8b 46 04             	mov    0x4(%esi),%eax
 804ed63:	39 c7                	cmp    %eax,%edi
 804ed65:	7d 45                	jge    0x804edac
 804ed67:	8b 8d 98 d7 ff ff    	mov    0xffffd798(%ebp),%ecx
 804ed6d:	89 8d f8 d6 ff ff    	mov    %ecx,0xffffd6f8(%ebp)
 804ed73:	89 85 f0 d6 ff ff    	mov    %eax,0xffffd6f0(%ebp)
 804ed79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804ed80:	8b 9d f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%ebx
 804ed86:	8b 54 fb 04          	mov    0x4(%ebx,%edi,8),%edx
 804ed8a:	89 d0                	mov    %edx,%eax
 804ed8c:	83 e0 0c             	and    $0xc,%eax
 804ed8f:	c1 e8 02             	shr    $0x2,%eax
 804ed92:	83 e2 03             	and    $0x3,%edx
 804ed95:	39 d0                	cmp    %edx,%eax
 804ed97:	74 0a                	je     0x804eda3
 804ed99:	c7 85 6c d7 ff ff 01 	movl   $0x1,0xffffd76c(%ebp)
 804eda0:	00 00 00 
 804eda3:	47                   	inc    %edi
 804eda4:	3b bd f0 d6 ff ff    	cmp    0xffffd6f0(%ebp),%edi
 804edaa:	7c d4                	jl     0x804ed80
 804edac:	6a 00                	push   $0x0
 804edae:	6a 00                	push   $0x0
 804edb0:	8b b5 40 d7 ff ff    	mov    0xffffd740(%ebp),%esi
 804edb6:	56                   	push   %esi
 804edb7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804edba:	51                   	push   %ecx
 804edbb:	e8 d0 e9 ff ff       	call   0x804d790
 804edc0:	89 85 78 d7 ff ff    	mov    %eax,0xffffd778(%ebp)
 804edc6:	83 c4 10             	add    $0x10,%esp
 804edc9:	83 bd 74 d7 ff ff 00 	cmpl   $0x0,0xffffd774(%ebp)
 804edd0:	74 1e                	je     0x804edf0
 804edd2:	6a 00                	push   $0x0
 804edd4:	6a 01                	push   $0x1
 804edd6:	56                   	push   %esi
 804edd7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804edda:	53                   	push   %ebx
 804eddb:	e8 b0 e9 ff ff       	call   0x804d790
 804ede0:	89 85 70 d7 ff ff    	mov    %eax,0xffffd770(%ebp)
 804ede6:	83 c4 10             	add    $0x10,%esp
 804ede9:	eb 11                	jmp    0x804edfc
 804edeb:	90                   	nop    
 804edec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804edf0:	8b b5 78 d7 ff ff    	mov    0xffffd778(%ebp),%esi
 804edf6:	89 b5 70 d7 ff ff    	mov    %esi,0xffffd770(%ebp)
 804edfc:	83 bd 6c d7 ff ff 00 	cmpl   $0x0,0xffffd76c(%ebp)
 804ee03:	74 1f                	je     0x804ee24
 804ee05:	6a 01                	push   $0x1
 804ee07:	6a 00                	push   $0x0
 804ee09:	8b 8d 40 d7 ff ff    	mov    0xffffd740(%ebp),%ecx
 804ee0f:	51                   	push   %ecx
 804ee10:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804ee13:	53                   	push   %ebx
 804ee14:	e8 77 e9 ff ff       	call   0x804d790
 804ee19:	89 85 f8 d6 ff ff    	mov    %eax,0xffffd6f8(%ebp)
 804ee1f:	83 c4 10             	add    $0x10,%esp
 804ee22:	eb 0c                	jmp    0x804ee30
 804ee24:	8b b5 78 d7 ff ff    	mov    0xffffd778(%ebp),%esi
 804ee2a:	89 b5 f8 d6 ff ff    	mov    %esi,0xffffd6f8(%ebp)
 804ee30:	31 ff                	xor    %edi,%edi
 804ee32:	8b 8d 34 d7 ff ff    	mov    0xffffd734(%ebp),%ecx
 804ee38:	89 8d 30 d7 ff ff    	mov    %ecx,0xffffd730(%ebp)
 804ee3e:	89 f6                	mov    %esi,%esi
 804ee40:	c7 85 f0 d6 ff ff 00 	movl   $0x0,0xffffd6f0(%ebp)
 804ee47:	00 00 00 
 804ee4a:	8b 9d 30 d7 ff ff    	mov    0xffffd730(%ebp),%ebx
 804ee50:	8d 1c bb             	lea    (%ebx,%edi,4),%ebx
 804ee53:	89 9d 2c d7 ff ff    	mov    %ebx,0xffffd72c(%ebp)
 804ee59:	89 bd fc d6 ff ff    	mov    %edi,0xffffd6fc(%ebp)
 804ee5f:	c1 a5 fc d6 ff ff 05 	shll   $0x5,0xffffd6fc(%ebp)
 804ee66:	8b 8d 18 d7 ff ff    	mov    0xffffd718(%ebp),%ecx
 804ee6c:	8b 9d 2c d7 ff ff    	mov    0xffffd72c(%ebp),%ebx
 804ee72:	8b 04 0b             	mov    (%ebx,%ecx,1),%eax
 804ee75:	8b 8d f0 d6 ff ff    	mov    0xffffd6f0(%ebp),%ecx
 804ee7b:	d3 f8                	sar    %cl,%eax
 804ee7d:	a8 01                	test   $0x1,%al
 804ee7f:	74 53                	je     0x804eed4
 804ee81:	8b 95 fc d6 ff ff    	mov    0xffffd6fc(%ebp),%edx
 804ee87:	01 ca                	add    %ecx,%edx
 804ee89:	31 c0                	xor    %eax,%eax
 804ee8b:	a0 ec ba 05 08       	mov    0x805baec,%al
 804ee90:	39 c2                	cmp    %eax,%edx
 804ee92:	75 0e                	jne    0x804eea2
 804ee94:	8b 8d 70 d7 ff ff    	mov    0xffffd770(%ebp),%ecx
 804ee9a:	8b 75 10             	mov    0x10(%ebp),%esi
 804ee9d:	89 0c 96             	mov    %ecx,(%esi,%edx,4)
 804eea0:	eb 32                	jmp    0x804eed4
 804eea2:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 804eea7:	f6 04 50 08          	testb  $0x8,(%eax,%edx,2)
 804eeab:	75 05                	jne    0x804eeb2
 804eead:	83 fa 5f             	cmp    $0x5f,%edx
 804eeb0:	75 0e                	jne    0x804eec0
 804eeb2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804eeb5:	8b b5 f8 d6 ff ff    	mov    0xffffd6f8(%ebp),%esi
 804eebb:	89 34 93             	mov    %esi,(%ebx,%edx,4)
 804eebe:	eb 14                	jmp    0x804eed4
 804eec0:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 804eec6:	7f 0c                	jg     0x804eed4
 804eec8:	8b 9d 78 d7 ff ff    	mov    0xffffd778(%ebp),%ebx
 804eece:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804eed1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
 804eed4:	ff 85 f0 d6 ff ff    	incl   0xffffd6f0(%ebp)
 804eeda:	83 bd f0 d6 ff ff 1f 	cmpl   $0x1f,0xffffd6f0(%ebp)
 804eee1:	76 83                	jbe    0x804ee66
 804eee3:	47                   	inc    %edi
 804eee4:	83 ff 07             	cmp    $0x7,%edi
 804eee7:	0f 86 53 ff ff ff    	jbe    0x804ee40
 804eeed:	ff 85 68 d7 ff ff    	incl   0xffffd768(%ebp)
 804eef3:	8b b5 94 d7 ff ff    	mov    0xffffd794(%ebp),%esi
 804eef9:	39 b5 68 d7 ff ff    	cmp    %esi,0xffffd768(%ebp)
 804eeff:	0f 8c 4c fc ff ff    	jl     0x804eb51
 804ef05:	c7 85 68 d7 ff ff 00 	movl   $0x0,0xffffd768(%ebp)
 804ef0c:	00 00 00 
 804ef0f:	8b 8d 94 d7 ff ff    	mov    0xffffd794(%ebp),%ecx
 804ef15:	39 8d 68 d7 ff ff    	cmp    %ecx,0xffffd768(%ebp)
 804ef1b:	7d 29                	jge    0x804ef46
 804ef1d:	8d bd 00 f8 ff ff    	lea    0xfffff800(%ebp),%edi
 804ef23:	8b 9d 68 d7 ff ff    	mov    0xffffd768(%ebp),%ebx
 804ef29:	8b 04 df             	mov    (%edi,%ebx,8),%eax
 804ef2c:	50                   	push   %eax
 804ef2d:	e8 ba a2 ff ff       	call   0x80491ec
 804ef32:	83 c4 04             	add    $0x4,%esp
 804ef35:	43                   	inc    %ebx
 804ef36:	89 9d 68 d7 ff ff    	mov    %ebx,0xffffd768(%ebp)
 804ef3c:	8b b5 94 d7 ff ff    	mov    0xffffd794(%ebp),%esi
 804ef42:	39 f3                	cmp    %esi,%ebx
 804ef44:	7c dd                	jl     0x804ef23
 804ef46:	8b 85 98 d7 ff ff    	mov    0xffffd798(%ebp),%eax
 804ef4c:	50                   	push   %eax
 804ef4d:	e8 9a a2 ff ff       	call   0x80491ec
 804ef52:	8b 8d 7c d7 ff ff    	mov    0xffffd77c(%ebp),%ecx
 804ef58:	51                   	push   %ecx
 804ef59:	e8 8e a2 ff ff       	call   0x80491ec
 804ef5e:	8d a5 e4 d6 ff ff    	lea    0xffffd6e4(%ebp),%esp
 804ef64:	5b                   	pop    %ebx
 804ef65:	5e                   	pop    %esi
 804ef66:	5f                   	pop    %edi
 804ef67:	89 ec                	mov    %ebp,%esp
 804ef69:	5d                   	pop    %ebp
 804ef6a:	c3                   	ret    
 804ef6b:	90                   	nop    
 804ef6c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804ef70:	55                   	push   %ebp
 804ef71:	89 e5                	mov    %esp,%ebp
 804ef73:	83 ec 14             	sub    $0x14,%esp
 804ef76:	57                   	push   %edi
 804ef77:	56                   	push   %esi
 804ef78:	53                   	push   %ebx
 804ef79:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804ef7c:	8b 47 3c             	mov    0x3c(%edi),%eax
 804ef7f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
 804ef84:	7e 4d                	jle    0x804efd3
 804ef86:	31 f6                	xor    %esi,%esi
 804ef88:	8b 57 38             	mov    0x38(%edi),%edx
 804ef8b:	39 d6                	cmp    %edx,%esi
 804ef8d:	7d 3b                	jge    0x804efca
 804ef8f:	90                   	nop    
 804ef90:	8b 47 40             	mov    0x40(%edi),%eax
 804ef93:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 804ef96:	85 c0                	test   %eax,%eax
 804ef98:	74 0b                	je     0x804efa5
 804ef9a:	50                   	push   %eax
 804ef9b:	e8 4c a2 ff ff       	call   0x80491ec
 804efa0:	8b 47 40             	mov    0x40(%edi),%eax
 804efa3:	eb 13                	jmp    0x804efb8
 804efa5:	8b 47 48             	mov    0x48(%edi),%eax
 804efa8:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 804efab:	85 c0                	test   %eax,%eax
 804efad:	74 16                	je     0x804efc5
 804efaf:	50                   	push   %eax
 804efb0:	e8 37 a2 ff ff       	call   0x80491ec
 804efb5:	8b 47 48             	mov    0x48(%edi),%eax
 804efb8:	83 c4 04             	add    $0x4,%esp
 804efbb:	c7 04 b0 00 00 00 00 	movl   $0x0,(%eax,%esi,4)
 804efc2:	8b 57 38             	mov    0x38(%edi),%edx
 804efc5:	46                   	inc    %esi
 804efc6:	39 d6                	cmp    %edx,%esi
 804efc8:	7c c6                	jl     0x804ef90
 804efca:	c7 47 3c 00 00 00 00 	movl   $0x0,0x3c(%edi)
 804efd1:	31 c0                	xor    %eax,%eax
 804efd3:	40                   	inc    %eax
 804efd4:	89 47 3c             	mov    %eax,0x3c(%edi)
 804efd7:	8b 47 4c             	mov    0x4c(%edi),%eax
 804efda:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804efdd:	31 db                	xor    %ebx,%ebx
 804efdf:	c7 04 88 00 00 00 00 	movl   $0x0,(%eax,%ecx,4)
 804efe6:	8b 57 24             	mov    0x24(%edi),%edx
 804efe9:	89 d6                	mov    %edx,%esi
 804efeb:	c1 e1 02             	shl    $0x2,%ecx
 804efee:	89 c8                	mov    %ecx,%eax
 804eff0:	03 45 08             	add    0x8(%ebp),%eax
 804eff3:	c1 e0 02             	shl    $0x2,%eax
 804eff6:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 804eff9:	8a 5c 02 0f          	mov    0xf(%edx,%eax,1),%bl
 804effd:	89 5d ec             	mov    %ebx,0xffffffec(%ebp)
 804f000:	80 7c 02 0c 00       	cmpb   $0x0,0xc(%edx,%eax,1)
 804f005:	74 09                	je     0x804f010
 804f007:	80 7d ec 00          	cmpb   $0x0,0xffffffec(%ebp)
 804f00b:	7c 0b                	jl     0x804f018
 804f00d:	eb 3e                	jmp    0x804f04d
 804f00f:	90                   	nop    
 804f010:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 804f013:	f6 c1 20             	test   $0x20,%cl
 804f016:	74 35                	je     0x804f04d
 804f018:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f01b:	03 45 08             	add    0x8(%ebp),%eax
 804f01e:	c1 e0 02             	shl    $0x2,%eax
 804f021:	31 db                	xor    %ebx,%ebx
 804f023:	8a 5c 06 0f          	mov    0xf(%esi,%eax,1),%bl
 804f027:	89 5d ec             	mov    %ebx,0xffffffec(%ebp)
 804f02a:	80 7c 06 0d 00       	cmpb   $0x0,0xd(%esi,%eax,1)
 804f02f:	74 07                	je     0x804f038
 804f031:	f6 c3 04             	test   $0x4,%bl
 804f034:	75 0a                	jne    0x804f040
 804f036:	eb 15                	jmp    0x804f04d
 804f038:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 804f03b:	f6 c1 01             	test   $0x1,%cl
 804f03e:	74 0d                	je     0x804f04d
 804f040:	8b 47 4c             	mov    0x4c(%edi),%eax
 804f043:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f046:	80 0c 98 04          	orb    $0x4,(%eax,%ebx,4)
 804f04a:	8b 57 24             	mov    0x24(%edi),%edx
 804f04d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f050:	03 45 08             	add    0x8(%ebp),%eax
 804f053:	c1 e0 02             	shl    $0x2,%eax
 804f056:	0f b6 74 02 0f       	movzbl 0xf(%edx,%eax,1),%esi
 804f05b:	80 7c 02 0c 00       	cmpb   $0x0,0xc(%edx,%eax,1)
 804f060:	74 0e                	je     0x804f070
 804f062:	f7 c6 40 00 00 00    	test   $0x40,%esi
 804f068:	75 0e                	jne    0x804f078
 804f06a:	eb 40                	jmp    0x804f0ac
 804f06c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804f070:	f7 c6 10 00 00 00    	test   $0x10,%esi
 804f076:	74 34                	je     0x804f0ac
 804f078:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f07b:	03 45 08             	add    0x8(%ebp),%eax
 804f07e:	c1 e0 02             	shl    $0x2,%eax
 804f081:	0f b6 74 02 0f       	movzbl 0xf(%edx,%eax,1),%esi
 804f086:	80 7c 02 0d 00       	cmpb   $0x0,0xd(%edx,%eax,1)
 804f08b:	74 0a                	je     0x804f097
 804f08d:	f7 c6 08 00 00 00    	test   $0x8,%esi
 804f093:	75 0a                	jne    0x804f09f
 804f095:	eb 15                	jmp    0x804f0ac
 804f097:	f7 c6 02 00 00 00    	test   $0x2,%esi
 804f09d:	74 0d                	je     0x804f0ac
 804f09f:	8b 47 4c             	mov    0x4c(%edi),%eax
 804f0a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f0a5:	80 0c 88 02          	orb    $0x2,(%eax,%ecx,4)
 804f0a9:	8b 57 24             	mov    0x24(%edi),%edx
 804f0ac:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f0af:	03 45 08             	add    0x8(%ebp),%eax
 804f0b2:	c1 e0 02             	shl    $0x2,%eax
 804f0b5:	0f b6 74 02 0f       	movzbl 0xf(%edx,%eax,1),%esi
 804f0ba:	80 7c 02 0c 00       	cmpb   $0x0,0xc(%edx,%eax,1)
 804f0bf:	74 0f                	je     0x804f0d0
 804f0c1:	f7 c6 40 00 00 00    	test   $0x40,%esi
 804f0c7:	75 0f                	jne    0x804f0d8
 804f0c9:	eb 3e                	jmp    0x804f109
 804f0cb:	90                   	nop    
 804f0cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804f0d0:	f7 c6 10 00 00 00    	test   $0x10,%esi
 804f0d6:	74 31                	je     0x804f109
 804f0d8:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f0db:	03 45 08             	add    0x8(%ebp),%eax
 804f0de:	c1 e0 02             	shl    $0x2,%eax
 804f0e1:	0f b6 74 02 0f       	movzbl 0xf(%edx,%eax,1),%esi
 804f0e6:	80 7c 02 0d 00       	cmpb   $0x0,0xd(%edx,%eax,1)
 804f0eb:	74 0a                	je     0x804f0f7
 804f0ed:	f7 c6 04 00 00 00    	test   $0x4,%esi
 804f0f3:	75 0a                	jne    0x804f0ff
 804f0f5:	eb 12                	jmp    0x804f109
 804f0f7:	f7 c6 01 00 00 00    	test   $0x1,%esi
 804f0fd:	74 0a                	je     0x804f109
 804f0ff:	8b 47 4c             	mov    0x4c(%edi),%eax
 804f102:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f105:	80 0c 98 01          	orb    $0x1,(%eax,%ebx,4)
 804f109:	68 00 04 00 00       	push   $0x400
 804f10e:	e8 7d c5 ff ff       	call   0x804b690
 804f113:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804f116:	50                   	push   %eax
 804f117:	57                   	push   %edi
 804f118:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f11b:	51                   	push   %ecx
 804f11c:	e8 bf f1 ff ff       	call   0x804e2e0
 804f121:	31 f6                	xor    %esi,%esi
 804f123:	83 c4 10             	add    $0x10,%esp
 804f126:	8b 57 38             	mov    0x38(%edi),%edx
 804f129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804f130:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
 804f133:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804f136:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 804f139:	39 14 b3             	cmp    %edx,(%ebx,%esi,4)
 804f13c:	0f 8c a3 00 00 00    	jl     0x804f1e5
 804f142:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 804f145:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 804f148:	89 c8                	mov    %ecx,%eax
 804f14a:	01 c8                	add    %ecx,%eax
 804f14c:	89 47 38             	mov    %eax,0x38(%edi)
 804f14f:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804f152:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
 804f155:	39 04 b3             	cmp    %eax,(%ebx,%esi,4)
 804f158:	7d eb                	jge    0x804f145
 804f15a:	40                   	inc    %eax
 804f15b:	c1 e0 02             	shl    $0x2,%eax
 804f15e:	50                   	push   %eax
 804f15f:	8b 47 44             	mov    0x44(%edi),%eax
 804f162:	50                   	push   %eax
 804f163:	e8 88 c5 ff ff       	call   0x804b6f0
 804f168:	89 47 44             	mov    %eax,0x44(%edi)
 804f16b:	83 c0 04             	add    $0x4,%eax
 804f16e:	89 47 40             	mov    %eax,0x40(%edi)
 804f171:	8b 4f 38             	mov    0x38(%edi),%ecx
 804f174:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
 804f17b:	50                   	push   %eax
 804f17c:	8b 47 48             	mov    0x48(%edi),%eax
 804f17f:	50                   	push   %eax
 804f180:	e8 6b c5 ff ff       	call   0x804b6f0
 804f185:	89 47 48             	mov    %eax,0x48(%edi)
 804f188:	8b 5f 38             	mov    0x38(%edi),%ebx
 804f18b:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 804f192:	50                   	push   %eax
 804f193:	8b 47 4c             	mov    0x4c(%edi),%eax
 804f196:	50                   	push   %eax
 804f197:	e8 54 c5 ff ff       	call   0x804b6f0
 804f19c:	89 47 4c             	mov    %eax,0x4c(%edi)
 804f19f:	8b 4f 38             	mov    0x38(%edi),%ecx
 804f1a2:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
 804f1a9:	50                   	push   %eax
 804f1aa:	8b 47 50             	mov    0x50(%edi),%eax
 804f1ad:	50                   	push   %eax
 804f1ae:	e8 3d c5 ff ff       	call   0x804b6f0
 804f1b3:	89 47 50             	mov    %eax,0x50(%edi)
 804f1b6:	83 c4 20             	add    $0x20,%esp
 804f1b9:	8b 57 38             	mov    0x38(%edi),%edx
 804f1bc:	39 55 f4             	cmp    %edx,0xfffffff4(%ebp)
 804f1bf:	7d 24                	jge    0x804f1e5
 804f1c1:	8b 47 40             	mov    0x40(%edi),%eax
 804f1c4:	8b 5d f0             	mov    0xfffffff0(%ebp),%ebx
 804f1c7:	c7 04 98 00 00 00 00 	movl   $0x0,(%eax,%ebx,4)
 804f1ce:	8b 47 48             	mov    0x48(%edi),%eax
 804f1d1:	c7 04 98 00 00 00 00 	movl   $0x0,(%eax,%ebx,4)
 804f1d8:	43                   	inc    %ebx
 804f1d9:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 804f1dc:	8b 47 38             	mov    0x38(%edi),%eax
 804f1df:	89 c2                	mov    %eax,%edx
 804f1e1:	39 d3                	cmp    %edx,%ebx
 804f1e3:	7c dc                	jl     0x804f1c1
 804f1e5:	46                   	inc    %esi
 804f1e6:	81 fe ff 00 00 00    	cmp    $0xff,%esi
 804f1ec:	0f 8e 3e ff ff ff    	jle    0x804f130
 804f1f2:	8b 57 50             	mov    0x50(%edi),%edx
 804f1f5:	31 c0                	xor    %eax,%eax
 804f1f7:	a0 ec ba 05 08       	mov    0x805baec,%al
 804f1fc:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804f1ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f202:	8b 04 81             	mov    (%ecx,%eax,4),%eax
 804f205:	89 04 9a             	mov    %eax,(%edx,%ebx,4)
 804f208:	31 c0                	xor    %eax,%eax
 804f20a:	a0 ec ba 05 08       	mov    0x805baec,%al
 804f20f:	c7 04 81 ff ff ff ff 	movl   $0xffffffff,(%ecx,%eax,4)
 804f216:	8b 57 24             	mov    0x24(%edi),%edx
 804f219:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 804f21c:	01 d8                	add    %ebx,%eax
 804f21e:	80 7c 82 0f 00       	cmpb   $0x0,0xf(%edx,%eax,4)
 804f223:	74 0b                	je     0x804f230
 804f225:	8b 47 48             	mov    0x48(%edi),%eax
 804f228:	89 0c 98             	mov    %ecx,(%eax,%ebx,4)
 804f22b:	eb 0f                	jmp    0x804f23c
 804f22d:	8d 76 00             	lea    0x0(%esi),%esi
 804f230:	8b 47 40             	mov    0x40(%edi),%eax
 804f233:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f236:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804f239:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 804f23c:	8d 65 e0             	lea    0xffffffe0(%ebp),%esp
 804f23f:	5b                   	pop    %ebx
 804f240:	5e                   	pop    %esi
 804f241:	5f                   	pop    %edi
 804f242:	89 ec                	mov    %ebp,%esp
 804f244:	5d                   	pop    %ebp
 804f245:	c3                   	ret    
 804f246:	8d 76 00             	lea    0x0(%esi),%esi
 804f249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804f250:	55                   	push   %ebp
 804f251:	89 e5                	mov    %esp,%ebp
 804f253:	53                   	push   %ebx
 804f254:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f257:	c7 43 38 01 00 00 00 	movl   $0x1,0x38(%ebx)
 804f25e:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
 804f265:	6a 04                	push   $0x4
 804f267:	6a 02                	push   $0x2
 804f269:	e8 b2 c3 ff ff       	call   0x804b620
 804f26e:	89 43 44             	mov    %eax,0x44(%ebx)
 804f271:	83 c0 04             	add    $0x4,%eax
 804f274:	89 43 40             	mov    %eax,0x40(%ebx)
 804f277:	6a 04                	push   $0x4
 804f279:	8b 43 38             	mov    0x38(%ebx),%eax
 804f27c:	50                   	push   %eax
 804f27d:	e8 9e c3 ff ff       	call   0x804b620
 804f282:	89 43 48             	mov    %eax,0x48(%ebx)
 804f285:	8b 53 38             	mov    0x38(%ebx),%edx
 804f288:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
 804f28f:	50                   	push   %eax
 804f290:	e8 fb c3 ff ff       	call   0x804b690
 804f295:	89 43 4c             	mov    %eax,0x4c(%ebx)
 804f298:	8b 53 38             	mov    0x38(%ebx),%edx
 804f29b:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
 804f2a2:	50                   	push   %eax
 804f2a3:	e8 e8 c3 ff ff       	call   0x804b690
 804f2a8:	89 43 50             	mov    %eax,0x50(%ebx)
 804f2ab:	53                   	push   %ebx
 804f2ac:	6a 00                	push   $0x0
 804f2ae:	e8 bd fc ff ff       	call   0x804ef70
 804f2b3:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804f2b6:	89 ec                	mov    %ebp,%esp
 804f2b8:	5d                   	pop    %ebp
 804f2b9:	c3                   	ret    
 804f2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f2c0:	55                   	push   %ebp
 804f2c1:	89 e5                	mov    %esp,%ebp
 804f2c3:	83 ec 10             	sub    $0x10,%esp
 804f2c6:	57                   	push   %edi
 804f2c7:	56                   	push   %esi
 804f2c8:	53                   	push   %ebx
 804f2c9:	8a 0d ec ba 05 08    	mov    0x805baec,%cl
 804f2cf:	88 4d fb             	mov    %cl,0xfffffffb(%ebp)
 804f2d2:	83 3d c0 ba 05 08 00 	cmpl   $0x0,0x805bac0
 804f2d9:	75 55                	jne    0x804f330
 804f2db:	c7 05 c0 ba 05 08 01 	movl   $0x1,0x805bac0
 804f2e2:	00 00 00 
 804f2e5:	31 d2                	xor    %edx,%edx
 804f2e7:	bb c0 b6 05 08       	mov    $0x805b6c0,%ebx
 804f2ec:	8b 35 d4 b2 05 08    	mov    0x805b2d4,%esi
 804f2f2:	8d 3c 95 00 00 00 00 	lea    0x0(,%edx,4),%edi
 804f2f9:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 804f2fc:	f6 04 56 08          	testb  $0x8,(%esi,%edx,2)
 804f300:	75 05                	jne    0x804f307
 804f302:	83 fa 5f             	cmp    $0x5f,%edx
 804f305:	75 09                	jne    0x804f310
 804f307:	b8 02 00 00 00       	mov    $0x2,%eax
 804f30c:	eb 07                	jmp    0x804f315
 804f30e:	89 f6                	mov    %esi,%esi
 804f310:	b8 01 00 00 00       	mov    $0x1,%eax
 804f315:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 804f318:	42                   	inc    %edx
 804f319:	89 04 19             	mov    %eax,(%ecx,%ebx,1)
 804f31c:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 804f322:	7e ce                	jle    0x804f2f2
 804f324:	31 c0                	xor    %eax,%eax
 804f326:	8a 45 fb             	mov    0xfffffffb(%ebp),%al
 804f329:	c7 04 83 04 00 00 00 	movl   $0x4,(%ebx,%eax,4)
 804f330:	8b 7d 08             	mov    0x8(%ebp),%edi
 804f333:	83 7f 38 00          	cmpl   $0x0,0x38(%edi)
 804f337:	75 09                	jne    0x804f342
 804f339:	57                   	push   %edi
 804f33a:	e8 11 ff ff ff       	call   0x804f250
 804f33f:	83 c4 04             	add    $0x4,%esp
 804f342:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 804f349:	31 db                	xor    %ebx,%ebx
 804f34b:	8b 75 0c             	mov    0xc(%ebp),%esi
 804f34e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f351:	8b 7d 10             	mov    0x10(%ebp),%edi
 804f354:	8b 49 40             	mov    0x40(%ecx),%ecx
 804f357:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 804f35a:	8a 4d fb             	mov    0xfffffffb(%ebp),%cl
 804f35d:	88 0f                	mov    %cl,(%edi)
 804f35f:	90                   	nop    
 804f360:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804f363:	8b 14 99             	mov    (%ecx,%ebx,4),%edx
 804f366:	85 d2                	test   %edx,%edx
 804f368:	74 2a                	je     0x804f394
 804f36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f370:	31 c0                	xor    %eax,%eax
 804f372:	8a 06                	mov    (%esi),%al
 804f374:	8b 04 82             	mov    (%edx,%eax,4),%eax
 804f377:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 804f37a:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804f37d:	46                   	inc    %esi
 804f37e:	8b 14 87             	mov    (%edi,%eax,4),%edx
 804f381:	85 d2                	test   %edx,%edx
 804f383:	74 60                	je     0x804f3e5
 804f385:	31 c0                	xor    %eax,%eax
 804f387:	8a 06                	mov    (%esi),%al
 804f389:	8b 1c 82             	mov    (%edx,%eax,4),%ebx
 804f38c:	46                   	inc    %esi
 804f38d:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
 804f390:	85 d2                	test   %edx,%edx
 804f392:	75 dc                	jne    0x804f370
 804f394:	85 db                	test   %ebx,%ebx
 804f396:	7c 68                	jl     0x804f400
 804f398:	3b 75 10             	cmp    0x10(%ebp),%esi
 804f39b:	77 63                	ja     0x804f400
 804f39d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f3a0:	8b 41 48             	mov    0x48(%ecx),%eax
 804f3a3:	8b 04 98             	mov    (%eax,%ebx,4),%eax
 804f3a6:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 804f3a9:	85 c0                	test   %eax,%eax
 804f3ab:	74 53                	je     0x804f400
 804f3ad:	8b 41 4c             	mov    0x4c(%ecx),%eax
 804f3b0:	31 d2                	xor    %edx,%edx
 804f3b2:	8a 16                	mov    (%esi),%dl
 804f3b4:	8b 04 98             	mov    (%eax,%ebx,4),%eax
 804f3b7:	23 04 95 c0 b6 05 08 	and    0x805b6c0(,%edx,4),%eax
 804f3be:	74 30                	je     0x804f3f0
 804f3c0:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 804f3c4:	74 18                	je     0x804f3de
 804f3c6:	8b 41 24             	mov    0x24(%ecx),%eax
 804f3c9:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
 804f3cc:	80 7c 90 0e 00       	cmpb   $0x0,0xe(%eax,%edx,4)
 804f3d1:	0f 95 c0             	setne  %al
 804f3d4:	89 c1                	mov    %eax,%ecx
 804f3d6:	83 e1 01             	and    $0x1,%ecx
 804f3d9:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 804f3dc:	89 0f                	mov    %ecx,(%edi)
 804f3de:	89 f0                	mov    %esi,%eax
 804f3e0:	e9 82 00 00 00       	jmp    0x804f467
 804f3e5:	89 d8                	mov    %ebx,%eax
 804f3e7:	8b 5d f0             	mov    0xfffffff0(%ebp),%ebx
 804f3ea:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 804f3ed:	eb a5                	jmp    0x804f394
 804f3ef:	90                   	nop    
 804f3f0:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 804f3f3:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 804f3f6:	46                   	inc    %esi
 804f3f7:	8b 1c 97             	mov    (%edi,%edx,4),%ebx
 804f3fa:	e9 61 ff ff ff       	jmp    0x804f360
 804f3ff:	90                   	nop    
 804f400:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 804f404:	74 12                	je     0x804f418
 804f406:	3b 75 10             	cmp    0x10(%ebp),%esi
 804f409:	77 12                	ja     0x804f41d
 804f40b:	8a 4d fb             	mov    0xfffffffb(%ebp),%cl
 804f40e:	38 4e ff             	cmp    %cl,0xffffffff(%esi)
 804f411:	75 05                	jne    0x804f418
 804f413:	8b 7d 18             	mov    0x18(%ebp),%edi
 804f416:	ff 07                	incl   (%edi)
 804f418:	3b 75 10             	cmp    0x10(%ebp),%esi
 804f41b:	76 04                	jbe    0x804f421
 804f41d:	31 c0                	xor    %eax,%eax
 804f41f:	eb 46                	jmp    0x804f467
 804f421:	85 db                	test   %ebx,%ebx
 804f423:	7c 1b                	jl     0x804f440
 804f425:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f428:	51                   	push   %ecx
 804f429:	53                   	push   %ebx
 804f42a:	e8 41 fb ff ff       	call   0x804ef70
 804f42f:	8b 7d 08             	mov    0x8(%ebp),%edi
 804f432:	83 c4 08             	add    $0x8,%esp
 804f435:	8b 7f 40             	mov    0x40(%edi),%edi
 804f438:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 804f43b:	e9 20 ff ff ff       	jmp    0x804f360
 804f440:	8a 4d fb             	mov    0xfffffffb(%ebp),%cl
 804f443:	38 4e ff             	cmp    %cl,0xffffffff(%esi)
 804f446:	75 18                	jne    0x804f460
 804f448:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 804f44c:	74 12                	je     0x804f460
 804f44e:	8b 7d 08             	mov    0x8(%ebp),%edi
 804f451:	8b 47 50             	mov    0x50(%edi),%eax
 804f454:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 804f457:	8b 1c 88             	mov    (%eax,%ecx,4),%ebx
 804f45a:	e9 01 ff ff ff       	jmp    0x804f360
 804f45f:	90                   	nop    
 804f460:	31 db                	xor    %ebx,%ebx
 804f462:	e9 f9 fe ff ff       	jmp    0x804f360
 804f467:	8d 65 e4             	lea    0xffffffe4(%ebp),%esp
 804f46a:	5b                   	pop    %ebx
 804f46b:	5e                   	pop    %esi
 804f46c:	5f                   	pop    %edi
 804f46d:	89 ec                	mov    %ebp,%esp
 804f46f:	5d                   	pop    %ebp
 804f470:	c3                   	ret    
 804f471:	eb 0d                	jmp    0x804f480
 804f473:	90                   	nop    
 804f474:	90                   	nop    
 804f475:	90                   	nop    
 804f476:	90                   	nop    
 804f477:	90                   	nop    
 804f478:	90                   	nop    
 804f479:	90                   	nop    
 804f47a:	90                   	nop    
 804f47b:	90                   	nop    
 804f47c:	90                   	nop    
 804f47d:	90                   	nop    
 804f47e:	90                   	nop    
 804f47f:	90                   	nop    
 804f480:	55                   	push   %ebp
 804f481:	89 e5                	mov    %esp,%ebp
 804f483:	53                   	push   %ebx
 804f484:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f487:	c7 43 08 01 00 00 00 	movl   $0x1,0x8(%ebx)
 804f48e:	6a 20                	push   $0x20
 804f490:	e8 fb c1 ff ff       	call   0x804b690
 804f495:	89 03                	mov    %eax,(%ebx)
 804f497:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 804f49e:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
 804f4a5:	6a 04                	push   $0x4
 804f4a7:	e8 e4 c1 ff ff       	call   0x804b690
 804f4ac:	89 43 0c             	mov    %eax,0xc(%ebx)
 804f4af:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
 804f4b6:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
 804f4bd:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 804f4c4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 804f4cb:	c7 43 34 00 00 00 00 	movl   $0x0,0x34(%ebx)
 804f4d2:	c7 43 38 00 00 00 00 	movl   $0x0,0x38(%ebx)
 804f4d9:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
 804f4e0:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804f4e3:	89 ec                	mov    %ebp,%esp
 804f4e5:	5d                   	pop    %ebp
 804f4e6:	c3                   	ret    
 804f4e7:	89 f6                	mov    %esi,%esi
 804f4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804f4f0:	55                   	push   %ebp
 804f4f1:	89 e5                	mov    %esp,%ebp
 804f4f3:	83 ec 04             	sub    $0x4,%esp
 804f4f6:	57                   	push   %edi
 804f4f7:	56                   	push   %esi
 804f4f8:	53                   	push   %ebx
 804f4f9:	8b 75 10             	mov    0x10(%ebp),%esi
 804f4fc:	83 3d e8 ba 05 08 00 	cmpl   $0x0,0x805bae8
 804f503:	0f 84 fa 00 00 00    	je     0x804f603
 804f509:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804f50c:	51                   	push   %ecx
 804f50d:	e8 fa 9a ff ff       	call   0x804900c
 804f512:	89 c3                	mov    %eax,%ebx
 804f514:	83 c4 04             	add    $0x4,%esp
 804f517:	85 db                	test   %ebx,%ebx
 804f519:	75 43                	jne    0x804f55e
 804f51b:	8b 15 c4 ba 05 08    	mov    0x805bac4,%edx
 804f521:	85 d2                	test   %edx,%edx
 804f523:	74 0d                	je     0x804f532
 804f525:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804f52a:	39 05 c8 ba 05 08    	cmp    %eax,0x805bac8
 804f530:	74 23                	je     0x804f555
 804f532:	6a 05                	push   $0x5
 804f534:	68 e8 94 05 08       	push   $0x80594e8
 804f539:	6a 00                	push   $0x0
 804f53b:	e8 7c 9c ff ff       	call   0x80491bc
 804f540:	83 c4 0c             	add    $0xc,%esp
 804f543:	89 c2                	mov    %eax,%edx
 804f545:	89 15 c4 ba 05 08    	mov    %edx,0x805bac4
 804f54b:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 804f550:	a3 c8 ba 05 08       	mov    %eax,0x805bac8
 804f555:	52                   	push   %edx
 804f556:	e8 65 7c 00 00       	call   0x80571c0
 804f55b:	83 c4 04             	add    $0x4,%esp
 804f55e:	c7 05 e8 ba 05 08 00 	movl   $0x0,0x805bae8
 804f565:	00 00 00 
 804f568:	31 d2                	xor    %edx,%edx
 804f56a:	3b 55 0c             	cmp    0xc(%ebp),%edx
 804f56d:	73 37                	jae    0x804f5a6
 804f56f:	8b 3d d4 b2 05 08    	mov    0x805b2d4,%edi
 804f575:	8b 0d c0 b2 05 08    	mov    0x805b2c0,%ecx
 804f57b:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 804f57e:	89 f6                	mov    %esi,%esi
 804f580:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f583:	31 c0                	xor    %eax,%eax
 804f585:	8a 04 0a             	mov    (%edx,%ecx,1),%al
 804f588:	f6 44 47 01 01       	testb  $0x1,0x1(%edi,%eax,2)
 804f58d:	74 08                	je     0x804f597
 804f58f:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804f592:	8b 04 81             	mov    (%ecx,%eax,4),%eax
 804f595:	eb 06                	jmp    0x804f59d
 804f597:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f59a:	8a 04 0a             	mov    (%edx,%ecx,1),%al
 804f59d:	88 04 1a             	mov    %al,(%edx,%ebx,1)
 804f5a0:	42                   	inc    %edx
 804f5a1:	3b 55 0c             	cmp    0xc(%ebp),%edx
 804f5a4:	72 da                	jb     0x804f580
 804f5a6:	56                   	push   %esi
 804f5a7:	e8 d4 fe ff ff       	call   0x804f480
 804f5ac:	56                   	push   %esi
 804f5ad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804f5b0:	51                   	push   %ecx
 804f5b1:	53                   	push   %ebx
 804f5b2:	e8 e9 dd ff ff       	call   0x804d3a0
 804f5b7:	53                   	push   %ebx
 804f5b8:	e8 2f 9c ff ff       	call   0x80491ec
 804f5bd:	56                   	push   %esi
 804f5be:	e8 bd 06 00 00       	call   0x804fc80
 804f5c3:	c7 46 20 00 00 00 00 	movl   $0x0,0x20(%esi)
 804f5ca:	c7 46 1c 00 00 00 00 	movl   $0x0,0x1c(%esi)
 804f5d1:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
 804f5d8:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
 804f5df:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
 804f5e6:	c7 05 e8 ba 05 08 01 	movl   $0x1,0x805bae8
 804f5ed:	00 00 00 
 804f5f0:	56                   	push   %esi
 804f5f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804f5f4:	51                   	push   %ecx
 804f5f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f5f8:	51                   	push   %ecx
 804f5f9:	e8 a2 dd ff ff       	call   0x804d3a0
 804f5fe:	83 c4 24             	add    $0x24,%esp
 804f601:	eb 1a                	jmp    0x804f61d
 804f603:	56                   	push   %esi
 804f604:	e8 77 fe ff ff       	call   0x804f480
 804f609:	56                   	push   %esi
 804f60a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804f60d:	51                   	push   %ecx
 804f60e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f611:	51                   	push   %ecx
 804f612:	e8 89 dd ff ff       	call   0x804d3a0
 804f617:	56                   	push   %esi
 804f618:	e8 63 06 00 00       	call   0x804fc80
 804f61d:	8b 4d 14             	mov    0x14(%ebp),%ecx
 804f620:	51                   	push   %ecx
 804f621:	56                   	push   %esi
 804f622:	e8 f9 e5 ff ff       	call   0x804dc20
 804f627:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 804f62a:	5b                   	pop    %ebx
 804f62b:	5e                   	pop    %esi
 804f62c:	5f                   	pop    %edi
 804f62d:	89 ec                	mov    %ebp,%esp
 804f62f:	5d                   	pop    %ebp
 804f630:	c3                   	ret    
 804f631:	eb 0d                	jmp    0x804f640
 804f633:	90                   	nop    
 804f634:	90                   	nop    
 804f635:	90                   	nop    
 804f636:	90                   	nop    
 804f637:	90                   	nop    
 804f638:	90                   	nop    
 804f639:	90                   	nop    
 804f63a:	90                   	nop    
 804f63b:	90                   	nop    
 804f63c:	90                   	nop    
 804f63d:	90                   	nop    
 804f63e:	90                   	nop    
 804f63f:	90                   	nop    
 804f640:	55                   	push   %ebp
 804f641:	89 e5                	mov    %esp,%ebp
 804f643:	56                   	push   %esi
 804f644:	53                   	push   %ebx
 804f645:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f648:	8b 03                	mov    (%ebx),%eax
 804f64a:	50                   	push   %eax
 804f64b:	e8 9c 9b ff ff       	call   0x80491ec
 804f650:	8b 43 0c             	mov    0xc(%ebx),%eax
 804f653:	50                   	push   %eax
 804f654:	e8 93 9b ff ff       	call   0x80491ec
 804f659:	31 f6                	xor    %esi,%esi
 804f65b:	83 c4 08             	add    $0x8,%esp
 804f65e:	3b 73 28             	cmp    0x28(%ebx),%esi
 804f661:	7d 19                	jge    0x804f67c
 804f663:	8b 43 24             	mov    0x24(%ebx),%eax
 804f666:	8d 14 b6             	lea    (%esi,%esi,4),%edx
 804f669:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
 804f66d:	50                   	push   %eax
 804f66e:	e8 79 9b ff ff       	call   0x80491ec
 804f673:	83 c4 04             	add    $0x4,%esp
 804f676:	46                   	inc    %esi
 804f677:	3b 73 28             	cmp    0x28(%ebx),%esi
 804f67a:	7c e7                	jl     0x804f663
 804f67c:	8b 43 24             	mov    0x24(%ebx),%eax
 804f67f:	50                   	push   %eax
 804f680:	e8 67 9b ff ff       	call   0x80491ec
 804f685:	31 f6                	xor    %esi,%esi
 804f687:	83 c4 04             	add    $0x4,%esp
 804f68a:	8b 4b 10             	mov    0x10(%ebx),%ecx
 804f68d:	8b 53 30             	mov    0x30(%ebx),%edx
 804f690:	39 ce                	cmp    %ecx,%esi
 804f692:	7d 1b                	jge    0x804f6af
 804f694:	8b 04 f2             	mov    (%edx,%esi,8),%eax
 804f697:	85 c0                	test   %eax,%eax
 804f699:	74 0f                	je     0x804f6aa
 804f69b:	50                   	push   %eax
 804f69c:	e8 4b 9b ff ff       	call   0x80491ec
 804f6a1:	83 c4 04             	add    $0x4,%esp
 804f6a4:	8b 4b 10             	mov    0x10(%ebx),%ecx
 804f6a7:	8b 53 30             	mov    0x30(%ebx),%edx
 804f6aa:	46                   	inc    %esi
 804f6ab:	39 ce                	cmp    %ecx,%esi
 804f6ad:	7c e5                	jl     0x804f694
 804f6af:	52                   	push   %edx
 804f6b0:	e8 37 9b ff ff       	call   0x80491ec
 804f6b5:	31 f6                	xor    %esi,%esi
 804f6b7:	83 c4 04             	add    $0x4,%esp
 804f6ba:	8b 53 38             	mov    0x38(%ebx),%edx
 804f6bd:	39 d6                	cmp    %edx,%esi
 804f6bf:	7d 25                	jge    0x804f6e6
 804f6c1:	8b 43 40             	mov    0x40(%ebx),%eax
 804f6c4:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 804f6c7:	85 c0                	test   %eax,%eax
 804f6c9:	75 0a                	jne    0x804f6d5
 804f6cb:	8b 43 48             	mov    0x48(%ebx),%eax
 804f6ce:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 804f6d1:	85 c0                	test   %eax,%eax
 804f6d3:	74 0c                	je     0x804f6e1
 804f6d5:	50                   	push   %eax
 804f6d6:	e8 11 9b ff ff       	call   0x80491ec
 804f6db:	83 c4 04             	add    $0x4,%esp
 804f6de:	8b 53 38             	mov    0x38(%ebx),%edx
 804f6e1:	46                   	inc    %esi
 804f6e2:	39 d6                	cmp    %edx,%esi
 804f6e4:	7c db                	jl     0x804f6c1
 804f6e6:	8b 43 44             	mov    0x44(%ebx),%eax
 804f6e9:	85 c0                	test   %eax,%eax
 804f6eb:	74 09                	je     0x804f6f6
 804f6ed:	50                   	push   %eax
 804f6ee:	e8 f9 9a ff ff       	call   0x80491ec
 804f6f3:	83 c4 04             	add    $0x4,%esp
 804f6f6:	8b 43 48             	mov    0x48(%ebx),%eax
 804f6f9:	85 c0                	test   %eax,%eax
 804f6fb:	74 09                	je     0x804f706
 804f6fd:	50                   	push   %eax
 804f6fe:	e8 e9 9a ff ff       	call   0x80491ec
 804f703:	83 c4 04             	add    $0x4,%esp
 804f706:	8b 43 50             	mov    0x50(%ebx),%eax
 804f709:	85 c0                	test   %eax,%eax
 804f70b:	74 09                	je     0x804f716
 804f70d:	50                   	push   %eax
 804f70e:	e8 d9 9a ff ff       	call   0x80491ec
 804f713:	83 c4 04             	add    $0x4,%esp
 804f716:	8b 43 4c             	mov    0x4c(%ebx),%eax
 804f719:	85 c0                	test   %eax,%eax
 804f71b:	74 09                	je     0x804f726
 804f71d:	50                   	push   %eax
 804f71e:	e8 c9 9a ff ff       	call   0x80491ec
 804f723:	83 c4 04             	add    $0x4,%esp
 804f726:	8b 73 54             	mov    0x54(%ebx),%esi
 804f729:	85 f6                	test   %esi,%esi
 804f72b:	74 1e                	je     0x804f74b
 804f72d:	8d 76 00             	lea    0x0(%esi),%esi
 804f730:	8b 5e 08             	mov    0x8(%esi),%ebx
 804f733:	8b 46 04             	mov    0x4(%esi),%eax
 804f736:	50                   	push   %eax
 804f737:	e8 b0 9a ff ff       	call   0x80491ec
 804f73c:	56                   	push   %esi
 804f73d:	e8 aa 9a ff ff       	call   0x80491ec
 804f742:	83 c4 08             	add    $0x8,%esp
 804f745:	89 de                	mov    %ebx,%esi
 804f747:	85 f6                	test   %esi,%esi
 804f749:	75 e5                	jne    0x804f730
 804f74b:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 804f74e:	5b                   	pop    %ebx
 804f74f:	5e                   	pop    %esi
 804f750:	89 ec                	mov    %ebp,%esp
 804f752:	5d                   	pop    %ebp
 804f753:	c3                   	ret    
 804f754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f75a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 804f760:	55                   	push   %ebp
 804f761:	89 e5                	mov    %esp,%ebp
 804f763:	57                   	push   %edi
 804f764:	56                   	push   %esi
 804f765:	53                   	push   %ebx
 804f766:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804f769:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804f76c:	85 ff                	test   %edi,%edi
 804f76e:	74 43                	je     0x804f7b3
 804f770:	89 fa                	mov    %edi,%edx
 804f772:	89 f8                	mov    %edi,%eax
 804f774:	83 e0 03             	and    $0x3,%eax
 804f777:	74 16                	je     0x804f78f
 804f779:	7a 0f                	jp     0x804f78a
 804f77b:	83 f8 02             	cmp    $0x2,%eax
 804f77e:	74 05                	je     0x804f785
 804f780:	38 22                	cmp    %ah,(%edx)
 804f782:	74 2b                	je     0x804f7af
 804f784:	42                   	inc    %edx
 804f785:	38 22                	cmp    %ah,(%edx)
 804f787:	74 26                	je     0x804f7af
 804f789:	42                   	inc    %edx
 804f78a:	38 22                	cmp    %ah,(%edx)
 804f78c:	74 21                	je     0x804f7af
 804f78e:	42                   	inc    %edx
 804f78f:	8b 02                	mov    (%edx),%eax
 804f791:	84 c0                	test   %al,%al
 804f793:	74 1a                	je     0x804f7af
 804f795:	84 e4                	test   %ah,%ah
 804f797:	74 15                	je     0x804f7ae
 804f799:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804f79e:	74 0d                	je     0x804f7ad
 804f7a0:	83 c2 04             	add    $0x4,%edx
 804f7a3:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804f7a8:	75 e5                	jne    0x804f78f
 804f7aa:	83 ea 03             	sub    $0x3,%edx
 804f7ad:	42                   	inc    %edx
 804f7ae:	42                   	inc    %edx
 804f7af:	29 fa                	sub    %edi,%edx
 804f7b1:	eb 02                	jmp    0x804f7b5
 804f7b3:	31 d2                	xor    %edx,%edx
 804f7b5:	85 c9                	test   %ecx,%ecx
 804f7b7:	75 07                	jne    0x804f7c0
 804f7b9:	31 db                	xor    %ebx,%ebx
 804f7bb:	eb 4c                	jmp    0x804f809
 804f7bd:	8d 76 00             	lea    0x0(%esi),%esi
 804f7c0:	85 d2                	test   %edx,%edx
 804f7c2:	75 04                	jne    0x804f7c8
 804f7c4:	89 c8                	mov    %ecx,%eax
 804f7c6:	eb 7c                	jmp    0x804f844
 804f7c8:	89 cb                	mov    %ecx,%ebx
 804f7ca:	89 c8                	mov    %ecx,%eax
 804f7cc:	83 e0 03             	and    $0x3,%eax
 804f7cf:	74 16                	je     0x804f7e7
 804f7d1:	7a 0f                	jp     0x804f7e2
 804f7d3:	83 f8 02             	cmp    $0x2,%eax
 804f7d6:	74 05                	je     0x804f7dd
 804f7d8:	38 23                	cmp    %ah,(%ebx)
 804f7da:	74 2b                	je     0x804f807
 804f7dc:	43                   	inc    %ebx
 804f7dd:	38 23                	cmp    %ah,(%ebx)
 804f7df:	74 26                	je     0x804f807
 804f7e1:	43                   	inc    %ebx
 804f7e2:	38 23                	cmp    %ah,(%ebx)
 804f7e4:	74 21                	je     0x804f807
 804f7e6:	43                   	inc    %ebx
 804f7e7:	8b 03                	mov    (%ebx),%eax
 804f7e9:	84 c0                	test   %al,%al
 804f7eb:	74 1a                	je     0x804f807
 804f7ed:	84 e4                	test   %ah,%ah
 804f7ef:	74 15                	je     0x804f806
 804f7f1:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804f7f6:	74 0d                	je     0x804f805
 804f7f8:	83 c3 04             	add    $0x4,%ebx
 804f7fb:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804f800:	75 e5                	jne    0x804f7e7
 804f802:	83 eb 03             	sub    $0x3,%ebx
 804f805:	43                   	inc    %ebx
 804f806:	43                   	inc    %ebx
 804f807:	29 cb                	sub    %ecx,%ebx
 804f809:	85 c9                	test   %ecx,%ecx
 804f80b:	75 13                	jne    0x804f820
 804f80d:	8d 42 01             	lea    0x1(%edx),%eax
 804f810:	50                   	push   %eax
 804f811:	e8 f6 97 ff ff       	call   0x804900c
 804f816:	89 c6                	mov    %eax,%esi
 804f818:	83 c4 04             	add    $0x4,%esp
 804f81b:	eb 13                	jmp    0x804f830
 804f81d:	8d 76 00             	lea    0x0(%esi),%esi
 804f820:	8d 44 1a 01          	lea    0x1(%edx,%ebx,1),%eax
 804f824:	50                   	push   %eax
 804f825:	51                   	push   %ecx
 804f826:	e8 c1 98 ff ff       	call   0x80490ec
 804f82b:	89 c6                	mov    %eax,%esi
 804f82d:	83 c4 08             	add    $0x8,%esp
 804f830:	85 f6                	test   %esi,%esi
 804f832:	74 0e                	je     0x804f842
 804f834:	85 ff                	test   %edi,%edi
 804f836:	74 0a                	je     0x804f842
 804f838:	57                   	push   %edi
 804f839:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 804f83c:	50                   	push   %eax
 804f83d:	e8 ea 99 ff ff       	call   0x804922c
 804f842:	89 f0                	mov    %esi,%eax
 804f844:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804f847:	5b                   	pop    %ebx
 804f848:	5e                   	pop    %esi
 804f849:	5f                   	pop    %edi
 804f84a:	89 ec                	mov    %ebp,%esp
 804f84c:	5d                   	pop    %ebp
 804f84d:	c3                   	ret    
 804f84e:	89 f6                	mov    %esi,%esi
 804f850:	55                   	push   %ebp
 804f851:	89 e5                	mov    %esp,%ebp
 804f853:	8b 45 08             	mov    0x8(%ebp),%eax
 804f856:	50                   	push   %eax
 804f857:	6a 00                	push   $0x0
 804f859:	e8 02 ff ff ff       	call   0x804f760
 804f85e:	89 ec                	mov    %ebp,%esp
 804f860:	5d                   	pop    %ebp
 804f861:	c3                   	ret    
 804f862:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804f869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804f870:	55                   	push   %ebp
 804f871:	89 e5                	mov    %esp,%ebp
 804f873:	57                   	push   %edi
 804f874:	56                   	push   %esi
 804f875:	53                   	push   %ebx
 804f876:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804f879:	89 f8                	mov    %edi,%eax
 804f87b:	89 fe                	mov    %edi,%esi
 804f87d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f880:	83 e0 03             	and    $0x3,%eax
 804f883:	74 16                	je     0x804f89b
 804f885:	7a 0f                	jp     0x804f896
 804f887:	83 f8 02             	cmp    $0x2,%eax
 804f88a:	74 05                	je     0x804f891
 804f88c:	38 26                	cmp    %ah,(%esi)
 804f88e:	74 2b                	je     0x804f8bb
 804f890:	46                   	inc    %esi
 804f891:	38 26                	cmp    %ah,(%esi)
 804f893:	74 26                	je     0x804f8bb
 804f895:	46                   	inc    %esi
 804f896:	38 26                	cmp    %ah,(%esi)
 804f898:	74 21                	je     0x804f8bb
 804f89a:	46                   	inc    %esi
 804f89b:	8b 06                	mov    (%esi),%eax
 804f89d:	84 c0                	test   %al,%al
 804f89f:	74 1a                	je     0x804f8bb
 804f8a1:	84 e4                	test   %ah,%ah
 804f8a3:	74 15                	je     0x804f8ba
 804f8a5:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804f8aa:	74 0d                	je     0x804f8b9
 804f8ac:	83 c6 04             	add    $0x4,%esi
 804f8af:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804f8b4:	75 e5                	jne    0x804f89b
 804f8b6:	83 ee 03             	sub    $0x3,%esi
 804f8b9:	46                   	inc    %esi
 804f8ba:	46                   	inc    %esi
 804f8bb:	29 fe                	sub    %edi,%esi
 804f8bd:	80 3b 00             	cmpb   $0x0,(%ebx)
 804f8c0:	74 19                	je     0x804f8db
 804f8c2:	56                   	push   %esi
 804f8c3:	57                   	push   %edi
 804f8c4:	53                   	push   %ebx
 804f8c5:	e8 02 98 ff ff       	call   0x80490cc
 804f8ca:	83 c4 0c             	add    $0xc,%esp
 804f8cd:	85 c0                	test   %eax,%eax
 804f8cf:	75 04                	jne    0x804f8d5
 804f8d1:	89 d8                	mov    %ebx,%eax
 804f8d3:	eb 08                	jmp    0x804f8dd
 804f8d5:	43                   	inc    %ebx
 804f8d6:	80 3b 00             	cmpb   $0x0,(%ebx)
 804f8d9:	75 e7                	jne    0x804f8c2
 804f8db:	31 c0                	xor    %eax,%eax
 804f8dd:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804f8e0:	5b                   	pop    %ebx
 804f8e1:	5e                   	pop    %esi
 804f8e2:	5f                   	pop    %edi
 804f8e3:	89 ec                	mov    %ebp,%esp
 804f8e5:	5d                   	pop    %ebp
 804f8e6:	c3                   	ret    
 804f8e7:	89 f6                	mov    %esi,%esi
 804f8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804f8f0:	55                   	push   %ebp
 804f8f1:	89 e5                	mov    %esp,%ebp
 804f8f3:	8b 45 08             	mov    0x8(%ebp),%eax
 804f8f6:	85 c0                	test   %eax,%eax
 804f8f8:	74 06                	je     0x804f900
 804f8fa:	50                   	push   %eax
 804f8fb:	e8 ec 98 ff ff       	call   0x80491ec
 804f900:	89 ec                	mov    %ebp,%esp
 804f902:	5d                   	pop    %ebp
 804f903:	c3                   	ret    
 804f904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f90a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 804f910:	55                   	push   %ebp
 804f911:	89 e5                	mov    %esp,%ebp
 804f913:	56                   	push   %esi
 804f914:	53                   	push   %ebx
 804f915:	8b 75 08             	mov    0x8(%ebp),%esi
 804f918:	85 f6                	test   %esi,%esi
 804f91a:	74 21                	je     0x804f93d
 804f91c:	31 db                	xor    %ebx,%ebx
 804f91e:	83 3e 00             	cmpl   $0x0,(%esi)
 804f921:	74 1a                	je     0x804f93d
 804f923:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
 804f926:	50                   	push   %eax
 804f927:	e8 c0 98 ff ff       	call   0x80491ec
 804f92c:	c7 04 9e 00 00 00 00 	movl   $0x0,(%esi,%ebx,4)
 804f933:	43                   	inc    %ebx
 804f934:	83 c4 04             	add    $0x4,%esp
 804f937:	83 3c 9e 00          	cmpl   $0x0,(%esi,%ebx,4)
 804f93b:	75 e6                	jne    0x804f923
 804f93d:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 804f940:	5b                   	pop    %ebx
 804f941:	5e                   	pop    %esi
 804f942:	89 ec                	mov    %ebp,%esp
 804f944:	5d                   	pop    %ebp
 804f945:	c3                   	ret    
 804f946:	8d 76 00             	lea    0x0(%esi),%esi
 804f949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804f950:	55                   	push   %ebp
 804f951:	89 e5                	mov    %esp,%ebp
 804f953:	57                   	push   %edi
 804f954:	56                   	push   %esi
 804f955:	53                   	push   %ebx
 804f956:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804f959:	85 db                	test   %ebx,%ebx
 804f95b:	0f 84 c4 00 00 00    	je     0x804fa25
 804f961:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f964:	52                   	push   %edx
 804f965:	e8 e6 fe ff ff       	call   0x804f850
 804f96a:	89 45 0c             	mov    %eax,0xc(%ebp)
 804f96d:	83 c4 04             	add    $0x4,%esp
 804f970:	85 c0                	test   %eax,%eax
 804f972:	75 0c                	jne    0x804f980
 804f974:	53                   	push   %ebx
 804f975:	e8 96 ff ff ff       	call   0x804f910
 804f97a:	e9 a6 00 00 00       	jmp    0x804fa25
 804f97f:	90                   	nop    
 804f980:	8b 45 10             	mov    0x10(%ebp),%eax
 804f983:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f986:	31 ff                	xor    %edi,%edi
 804f988:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
 804f98c:	83 3b 00             	cmpl   $0x0,(%ebx)
 804f98f:	74 1b                	je     0x804f9ac
 804f991:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f994:	52                   	push   %edx
 804f995:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 804f998:	50                   	push   %eax
 804f999:	e8 d2 fe ff ff       	call   0x804f870
 804f99e:	83 c4 08             	add    $0x8,%esp
 804f9a1:	85 c0                	test   %eax,%eax
 804f9a3:	75 73                	jne    0x804fa18
 804f9a5:	47                   	inc    %edi
 804f9a6:	83 3c bb 00          	cmpl   $0x0,(%ebx,%edi,4)
 804f9aa:	75 e5                	jne    0x804f991
 804f9ac:	31 f6                	xor    %esi,%esi
 804f9ae:	83 3b 00             	cmpl   $0x0,(%ebx)
 804f9b1:	74 41                	je     0x804f9f4
 804f9b3:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 804f9b6:	50                   	push   %eax
 804f9b7:	8b 55 0c             	mov    0xc(%ebp),%edx
 804f9ba:	52                   	push   %edx
 804f9bb:	e8 b0 fe ff ff       	call   0x804f870
 804f9c0:	83 c4 08             	add    $0x8,%esp
 804f9c3:	85 c0                	test   %eax,%eax
 804f9c5:	75 09                	jne    0x804f9d0
 804f9c7:	46                   	inc    %esi
 804f9c8:	eb 24                	jmp    0x804f9ee
 804f9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804f9d0:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 804f9d3:	50                   	push   %eax
 804f9d4:	e8 13 98 ff ff       	call   0x80491ec
 804f9d9:	4f                   	dec    %edi
 804f9da:	83 c4 04             	add    $0x4,%esp
 804f9dd:	39 f7                	cmp    %esi,%edi
 804f9df:	74 13                	je     0x804f9f4
 804f9e1:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 804f9e4:	89 04 b3             	mov    %eax,(%ebx,%esi,4)
 804f9e7:	c7 04 bb 00 00 00 00 	movl   $0x0,(%ebx,%edi,4)
 804f9ee:	83 3c b3 00          	cmpl   $0x0,(%ebx,%esi,4)
 804f9f2:	75 bf                	jne    0x804f9b3
 804f9f4:	8d 04 bd 08 00 00 00 	lea    0x8(,%edi,4),%eax
 804f9fb:	50                   	push   %eax
 804f9fc:	53                   	push   %ebx
 804f9fd:	e8 ea 96 ff ff       	call   0x80490ec
 804fa02:	89 c3                	mov    %eax,%ebx
 804fa04:	85 db                	test   %ebx,%ebx
 804fa06:	74 1d                	je     0x804fa25
 804fa08:	8b 55 0c             	mov    0xc(%ebp),%edx
 804fa0b:	89 14 bb             	mov    %edx,(%ebx,%edi,4)
 804fa0e:	c7 44 bb 04 00 00 00 	movl   $0x0,0x4(%ebx,%edi,4)
 804fa15:	00 
 804fa16:	eb 0f                	jmp    0x804fa27
 804fa18:	8b 55 0c             	mov    0xc(%ebp),%edx
 804fa1b:	52                   	push   %edx
 804fa1c:	e8 cb 97 ff ff       	call   0x80491ec
 804fa21:	89 d8                	mov    %ebx,%eax
 804fa23:	eb 02                	jmp    0x804fa27
 804fa25:	31 c0                	xor    %eax,%eax
 804fa27:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804fa2a:	5b                   	pop    %ebx
 804fa2b:	5e                   	pop    %esi
 804fa2c:	5f                   	pop    %edi
 804fa2d:	89 ec                	mov    %ebp,%esp
 804fa2f:	5d                   	pop    %ebp
 804fa30:	c3                   	ret    
 804fa31:	eb 0d                	jmp    0x804fa40
 804fa33:	90                   	nop    
 804fa34:	90                   	nop    
 804fa35:	90                   	nop    
 804fa36:	90                   	nop    
 804fa37:	90                   	nop    
 804fa38:	90                   	nop    
 804fa39:	90                   	nop    
 804fa3a:	90                   	nop    
 804fa3b:	90                   	nop    
 804fa3c:	90                   	nop    
 804fa3d:	90                   	nop    
 804fa3e:	90                   	nop    
 804fa3f:	90                   	nop    
 804fa40:	55                   	push   %ebp
 804fa41:	89 e5                	mov    %esp,%ebp
 804fa43:	83 ec 04             	sub    $0x4,%esp
 804fa46:	57                   	push   %edi
 804fa47:	56                   	push   %esi
 804fa48:	53                   	push   %ebx
 804fa49:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804fa4c:	85 db                	test   %ebx,%ebx
 804fa4e:	74 17                	je     0x804fa67
 804fa50:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804fa54:	74 11                	je     0x804fa67
 804fa56:	6a 04                	push   $0x4
 804fa58:	e8 af 95 ff ff       	call   0x804900c
 804fa5d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804fa60:	83 c4 04             	add    $0x4,%esp
 804fa63:	85 c0                	test   %eax,%eax
 804fa65:	75 09                	jne    0x804fa70
 804fa67:	31 c0                	xor    %eax,%eax
 804fa69:	e9 7f 00 00 00       	jmp    0x804faed
 804fa6e:	89 f6                	mov    %esi,%esi
 804fa70:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804fa73:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
 804fa79:	80 3b 00             	cmpb   $0x0,(%ebx)
 804fa7c:	74 6c                	je     0x804faea
 804fa7e:	89 f6                	mov    %esi,%esi
 804fa80:	31 f6                	xor    %esi,%esi
 804fa82:	0f be 03             	movsbl (%ebx),%eax
 804fa85:	50                   	push   %eax
 804fa86:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fa89:	57                   	push   %edi
 804fa8a:	eb 31                	jmp    0x804fabd
 804fa8c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804fa90:	ba 01 00 00 00       	mov    $0x1,%edx
 804fa95:	80 7b 01 00          	cmpb   $0x0,0x1(%ebx)
 804fa99:	74 14                	je     0x804faaf
 804fa9b:	90                   	nop    
 804fa9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804faa0:	8a 04 0a             	mov    (%edx,%ecx,1),%al
 804faa3:	38 04 1a             	cmp    %al,(%edx,%ebx,1)
 804faa6:	75 07                	jne    0x804faaf
 804faa8:	42                   	inc    %edx
 804faa9:	80 3c 1a 00          	cmpb   $0x0,(%edx,%ebx,1)
 804faad:	75 f1                	jne    0x804faa0
 804faaf:	39 f2                	cmp    %esi,%edx
 804fab1:	76 02                	jbe    0x804fab5
 804fab3:	89 d6                	mov    %edx,%esi
 804fab5:	0f be 03             	movsbl (%ebx),%eax
 804fab8:	50                   	push   %eax
 804fab9:	8d 41 01             	lea    0x1(%ecx),%eax
 804fabc:	50                   	push   %eax
 804fabd:	e8 4a 94 ff ff       	call   0x8048f0c
 804fac2:	83 c4 08             	add    $0x8,%esp
 804fac5:	89 c1                	mov    %eax,%ecx
 804fac7:	85 c9                	test   %ecx,%ecx
 804fac9:	75 c5                	jne    0x804fa90
 804facb:	85 f6                	test   %esi,%esi
 804facd:	74 15                	je     0x804fae4
 804facf:	56                   	push   %esi
 804fad0:	53                   	push   %ebx
 804fad1:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804fad4:	57                   	push   %edi
 804fad5:	e8 76 fe ff ff       	call   0x804f950
 804fada:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804fadd:	83 c4 0c             	add    $0xc,%esp
 804fae0:	85 c0                	test   %eax,%eax
 804fae2:	74 06                	je     0x804faea
 804fae4:	43                   	inc    %ebx
 804fae5:	80 3b 00             	cmpb   $0x0,(%ebx)
 804fae8:	75 96                	jne    0x804fa80
 804faea:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804faed:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 804faf0:	5b                   	pop    %ebx
 804faf1:	5e                   	pop    %esi
 804faf2:	5f                   	pop    %edi
 804faf3:	89 ec                	mov    %ebp,%esp
 804faf5:	5d                   	pop    %ebp
 804faf6:	c3                   	ret    
 804faf7:	89 f6                	mov    %esi,%esi
 804faf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 804fb00:	55                   	push   %ebp
 804fb01:	89 e5                	mov    %esp,%ebp
 804fb03:	57                   	push   %edi
 804fb04:	56                   	push   %esi
 804fb05:	53                   	push   %ebx
 804fb06:	8b 75 08             	mov    0x8(%ebp),%esi
 804fb09:	8b 7d 0c             	mov    0xc(%ebp),%edi
 804fb0c:	85 f6                	test   %esi,%esi
 804fb0e:	74 04                	je     0x804fb14
 804fb10:	85 ff                	test   %edi,%edi
 804fb12:	75 04                	jne    0x804fb18
 804fb14:	31 c0                	xor    %eax,%eax
 804fb16:	eb 68                	jmp    0x804fb80
 804fb18:	31 db                	xor    %ebx,%ebx
 804fb1a:	83 3f 00             	cmpl   $0x0,(%edi)
 804fb1d:	74 5f                	je     0x804fb7e
 804fb1f:	90                   	nop    
 804fb20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 804fb23:	89 c2                	mov    %eax,%edx
 804fb25:	89 c1                	mov    %eax,%ecx
 804fb27:	83 e1 03             	and    $0x3,%ecx
 804fb2a:	74 16                	je     0x804fb42
 804fb2c:	7a 0f                	jp     0x804fb3d
 804fb2e:	83 f9 02             	cmp    $0x2,%ecx
 804fb31:	74 05                	je     0x804fb38
 804fb33:	38 2a                	cmp    %ch,(%edx)
 804fb35:	74 2d                	je     0x804fb64
 804fb37:	42                   	inc    %edx
 804fb38:	38 2a                	cmp    %ch,(%edx)
 804fb3a:	74 28                	je     0x804fb64
 804fb3c:	42                   	inc    %edx
 804fb3d:	38 2a                	cmp    %ch,(%edx)
 804fb3f:	74 23                	je     0x804fb64
 804fb41:	42                   	inc    %edx
 804fb42:	8b 0a                	mov    (%edx),%ecx
 804fb44:	84 c9                	test   %cl,%cl
 804fb46:	74 1c                	je     0x804fb64
 804fb48:	84 ed                	test   %ch,%ch
 804fb4a:	74 17                	je     0x804fb63
 804fb4c:	f7 c1 00 00 ff 00    	test   $0xff0000,%ecx
 804fb52:	74 0e                	je     0x804fb62
 804fb54:	83 c2 04             	add    $0x4,%edx
 804fb57:	f7 c1 00 00 00 ff    	test   $0xff000000,%ecx
 804fb5d:	75 e3                	jne    0x804fb42
 804fb5f:	83 ea 03             	sub    $0x3,%edx
 804fb62:	42                   	inc    %edx
 804fb63:	42                   	inc    %edx
 804fb64:	29 c2                	sub    %eax,%edx
 804fb66:	52                   	push   %edx
 804fb67:	50                   	push   %eax
 804fb68:	56                   	push   %esi
 804fb69:	e8 e2 fd ff ff       	call   0x804f950
 804fb6e:	89 c6                	mov    %eax,%esi
 804fb70:	83 c4 0c             	add    $0xc,%esp
 804fb73:	85 f6                	test   %esi,%esi
 804fb75:	74 07                	je     0x804fb7e
 804fb77:	43                   	inc    %ebx
 804fb78:	83 3c 9f 00          	cmpl   $0x0,(%edi,%ebx,4)
 804fb7c:	75 a2                	jne    0x804fb20
 804fb7e:	89 f0                	mov    %esi,%eax
 804fb80:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 804fb83:	5b                   	pop    %ebx
 804fb84:	5e                   	pop    %esi
 804fb85:	5f                   	pop    %edi
 804fb86:	89 ec                	mov    %ebp,%esp
 804fb88:	5d                   	pop    %ebp
 804fb89:	c3                   	ret    
 804fb8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804fb90:	55                   	push   %ebp
 804fb91:	89 e5                	mov    %esp,%ebp
 804fb93:	83 ec 04             	sub    $0x4,%esp
 804fb96:	57                   	push   %edi
 804fb97:	56                   	push   %esi
 804fb98:	53                   	push   %ebx
 804fb99:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804fb9d:	74 16                	je     0x804fbb5
 804fb9f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804fba3:	74 10                	je     0x804fbb5
 804fba5:	6a 04                	push   $0x4
 804fba7:	e8 60 94 ff ff       	call   0x804900c
 804fbac:	89 c7                	mov    %eax,%edi
 804fbae:	83 c4 04             	add    $0x4,%esp
 804fbb1:	85 ff                	test   %edi,%edi
 804fbb3:	75 13                	jne    0x804fbc8
 804fbb5:	31 c0                	xor    %eax,%eax
 804fbb7:	e9 8a 00 00 00       	jmp    0x804fc46
 804fbbc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 804fbc0:	57                   	push   %edi
 804fbc1:	e8 4a fd ff ff       	call   0x804f910
 804fbc6:	eb ed                	jmp    0x804fbb5
 804fbc8:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
 804fbce:	8b 55 08             	mov    0x8(%ebp),%edx
 804fbd1:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804fbd8:	83 3a 00             	cmpl   $0x0,(%edx)
 804fbdb:	74 67                	je     0x804fc44
 804fbdd:	8d 76 00             	lea    0x0(%esi),%esi
 804fbe0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804fbe3:	31 f6                	xor    %esi,%esi
 804fbe5:	83 39 00             	cmpl   $0x0,(%ecx)
 804fbe8:	74 4b                	je     0x804fc35
 804fbea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804fbf0:	8b 55 0c             	mov    0xc(%ebp),%edx
 804fbf3:	8b 04 b2             	mov    (%edx,%esi,4),%eax
 804fbf6:	50                   	push   %eax
 804fbf7:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804fbfa:	8b 55 08             	mov    0x8(%ebp),%edx
 804fbfd:	8b 04 8a             	mov    (%edx,%ecx,4),%eax
 804fc00:	50                   	push   %eax
 804fc01:	e8 3a fe ff ff       	call   0x804fa40
 804fc06:	89 c3                	mov    %eax,%ebx
 804fc08:	83 c4 08             	add    $0x8,%esp
 804fc0b:	85 db                	test   %ebx,%ebx
 804fc0d:	74 b1                	je     0x804fbc0
 804fc0f:	53                   	push   %ebx
 804fc10:	57                   	push   %edi
 804fc11:	e8 ea fe ff ff       	call   0x804fb00
 804fc16:	89 c7                	mov    %eax,%edi
 804fc18:	53                   	push   %ebx
 804fc19:	e8 f2 fc ff ff       	call   0x804f910
 804fc1e:	53                   	push   %ebx
 804fc1f:	e8 c8 95 ff ff       	call   0x80491ec
 804fc24:	83 c4 10             	add    $0x10,%esp
 804fc27:	85 ff                	test   %edi,%edi
 804fc29:	74 8a                	je     0x804fbb5
 804fc2b:	46                   	inc    %esi
 804fc2c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804fc2f:	83 3c b1 00          	cmpl   $0x0,(%ecx,%esi,4)
 804fc33:	75 bb                	jne    0x804fbf0
 804fc35:	ff 45 fc             	incl   0xfffffffc(%ebp)
 804fc38:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 804fc3b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804fc3e:	83 3c 91 00          	cmpl   $0x0,(%ecx,%edx,4)
 804fc42:	75 9c                	jne    0x804fbe0
 804fc44:	89 f8                	mov    %edi,%eax
 804fc46:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 804fc49:	5b                   	pop    %ebx
 804fc4a:	5e                   	pop    %esi
 804fc4b:	5f                   	pop    %edi
 804fc4c:	89 ec                	mov    %ebp,%esp
 804fc4e:	5d                   	pop    %ebp
 804fc4f:	c3                   	ret    
 804fc50:	55                   	push   %ebp
 804fc51:	89 e5                	mov    %esp,%ebp
 804fc53:	53                   	push   %ebx
 804fc54:	8b 55 08             	mov    0x8(%ebp),%edx
 804fc57:	8b 5a 04             	mov    0x4(%edx),%ebx
 804fc5a:	8b 42 0c             	mov    0xc(%edx),%eax
 804fc5d:	8b 4a 08             	mov    0x8(%edx),%ecx
 804fc60:	c6 00 00             	movb   $0x0,(%eax)
 804fc63:	c6 01 00             	movb   $0x0,(%ecx)
 804fc66:	c6 03 00             	movb   $0x0,(%ebx)
 804fc69:	8b 02                	mov    (%edx),%eax
 804fc6b:	50                   	push   %eax
 804fc6c:	e8 9f fc ff ff       	call   0x804f910
 804fc71:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804fc74:	89 ec                	mov    %ebp,%esp
 804fc76:	5d                   	pop    %ebp
 804fc77:	c3                   	ret    
 804fc78:	90                   	nop    
 804fc79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 804fc80:	55                   	push   %ebp
 804fc81:	89 e5                	mov    %esp,%ebp
 804fc83:	83 ec 38             	sub    $0x38,%esp
 804fc86:	57                   	push   %edi
 804fc87:	56                   	push   %esi
 804fc88:	53                   	push   %ebx
 804fc89:	c7 45 f4 80 b0 05 08 	movl   $0x805b080,0xfffffff4(%ebp)
 804fc90:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804fc93:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
 804fc9a:	8b 41 10             	mov    0x10(%ecx),%eax
 804fc9d:	40                   	inc    %eax
 804fc9e:	c1 e0 04             	shl    $0x4,%eax
 804fca1:	50                   	push   %eax
 804fca2:	e8 65 93 ff ff       	call   0x804900c
 804fca7:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804fcaa:	83 c4 04             	add    $0x4,%esp
 804fcad:	85 c0                	test   %eax,%eax
 804fcaf:	0f 84 2b 07 00 00    	je     0x80503e0
 804fcb5:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804fcb8:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fcbb:	31 f6                	xor    %esi,%esi
 804fcbd:	8b 57 10             	mov    0x10(%edi),%edx
 804fcc0:	39 d6                	cmp    %edx,%esi
 804fcc2:	7f 46                	jg     0x804fd0a
 804fcc4:	b8 cc ba 05 08       	mov    $0x805bacc,%eax
 804fcc9:	8b 0d cc ba 05 08    	mov    0x805bacc,%ecx
 804fccf:	89 4d e8             	mov    %ecx,0xffffffe8(%ebp)
 804fcd2:	89 55 c8             	mov    %edx,0xffffffc8(%ebp)
 804fcd5:	8b 78 04             	mov    0x4(%eax),%edi
 804fcd8:	89 7d e4             	mov    %edi,0xffffffe4(%ebp)
 804fcdb:	8b 48 08             	mov    0x8(%eax),%ecx
 804fcde:	89 4d cc             	mov    %ecx,0xffffffcc(%ebp)
 804fce1:	8b 58 0c             	mov    0xc(%eax),%ebx
 804fce4:	89 f0                	mov    %esi,%eax
 804fce6:	c1 e0 04             	shl    $0x4,%eax
 804fce9:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 804fcec:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804fcef:	46                   	inc    %esi
 804fcf0:	89 0c 07             	mov    %ecx,(%edi,%eax,1)
 804fcf3:	8b 4d e4             	mov    0xffffffe4(%ebp),%ecx
 804fcf6:	89 4c 07 04          	mov    %ecx,0x4(%edi,%eax,1)
 804fcfa:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 804fcfd:	89 4c 07 08          	mov    %ecx,0x8(%edi,%eax,1)
 804fd01:	89 5c 07 0c          	mov    %ebx,0xc(%edi,%eax,1)
 804fd05:	3b 75 c8             	cmp    0xffffffc8(%ebp),%esi
 804fd08:	7e da                	jle    0x804fce4
 804fd0a:	31 f6                	xor    %esi,%esi
 804fd0c:	39 d6                	cmp    %edx,%esi
 804fd0e:	0f 8f 80 00 00 00    	jg     0x804fd94
 804fd14:	6a 04                	push   $0x4
 804fd16:	e8 f1 92 ff ff       	call   0x804900c
 804fd1b:	89 f3                	mov    %esi,%ebx
 804fd1d:	c1 e3 04             	shl    $0x4,%ebx
 804fd20:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804fd23:	89 04 1f             	mov    %eax,(%edi,%ebx,1)
 804fd26:	6a 02                	push   $0x2
 804fd28:	e8 df 92 ff ff       	call   0x804900c
 804fd2d:	89 44 1f 04          	mov    %eax,0x4(%edi,%ebx,1)
 804fd31:	6a 02                	push   $0x2
 804fd33:	e8 d4 92 ff ff       	call   0x804900c
 804fd38:	89 44 1f 08          	mov    %eax,0x8(%edi,%ebx,1)
 804fd3c:	6a 02                	push   $0x2
 804fd3e:	e8 c9 92 ff ff       	call   0x804900c
 804fd43:	89 44 1f 0c          	mov    %eax,0xc(%edi,%ebx,1)
 804fd47:	83 c4 10             	add    $0x10,%esp
 804fd4a:	83 3c 1f 00          	cmpl   $0x0,(%edi,%ebx,1)
 804fd4e:	0f 84 70 05 00 00    	je     0x80502c4
 804fd54:	8b 4c 1f 04          	mov    0x4(%edi,%ebx,1),%ecx
 804fd58:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 804fd5b:	85 c9                	test   %ecx,%ecx
 804fd5d:	0f 84 61 05 00 00    	je     0x80502c4
 804fd63:	8b 54 1f 08          	mov    0x8(%edi,%ebx,1),%edx
 804fd67:	85 d2                	test   %edx,%edx
 804fd69:	0f 84 55 05 00 00    	je     0x80502c4
 804fd6f:	85 c0                	test   %eax,%eax
 804fd71:	0f 84 4d 05 00 00    	je     0x80502c4
 804fd77:	c6 00 00             	movb   $0x0,(%eax)
 804fd7a:	c6 02 00             	movb   $0x0,(%edx)
 804fd7d:	c6 01 00             	movb   $0x0,(%ecx)
 804fd80:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
 804fd83:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804fd89:	8b 7d 08             	mov    0x8(%ebp),%edi
 804fd8c:	46                   	inc    %esi
 804fd8d:	8b 57 10             	mov    0x10(%edi),%edx
 804fd90:	39 d6                	cmp    %edx,%esi
 804fd92:	7e 80                	jle    0x804fd14
 804fd94:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 804fd9b:	39 55 f0             	cmp    %edx,0xfffffff0(%ebp)
 804fd9e:	0f 8d 20 05 00 00    	jge    0x80502c4
 804fda4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804fda7:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 804fdaa:	8b 41 0c             	mov    0xc(%ecx),%eax
 804fdad:	8b 1c b8             	mov    (%eax,%edi,4),%ebx
 804fdb0:	81 fb 0a 01 00 00    	cmp    $0x10a,%ebx
 804fdb6:	0f 84 14 02 00 00    	je     0x804ffd0
 804fdbc:	7f 22                	jg     0x804fde0
 804fdbe:	81 fb 07 01 00 00    	cmp    $0x107,%ebx
 804fdc4:	7f 4c                	jg     0x804fe12
 804fdc6:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
 804fdcc:	0f 8d 84 04 00 00    	jge    0x8050256
 804fdd2:	83 fb ff             	cmp    $0xffffffff,%ebx
 804fdd5:	0f 84 15 02 00 00    	je     0x804fff0
 804fddb:	e9 65 04 00 00       	jmp    0x8050245
 804fde0:	81 fb 0e 01 00 00    	cmp    $0x10e,%ebx
 804fde6:	7f 19                	jg     0x804fe01
 804fde8:	81 fb 0d 01 00 00    	cmp    $0x10d,%ebx
 804fdee:	7d 37                	jge    0x804fe27
 804fdf0:	81 fb 0c 01 00 00    	cmp    $0x10c,%ebx
 804fdf6:	0f 84 e4 02 00 00    	je     0x80500e0
 804fdfc:	e9 44 04 00 00       	jmp    0x8050245
 804fe01:	81 fb 10 01 00 00    	cmp    $0x110,%ebx
 804fe07:	0f 8f 38 04 00 00    	jg     0x8050245
 804fe0d:	e9 b2 04 00 00       	jmp    0x80502c4
 804fe12:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 804fe15:	39 7d f8             	cmp    %edi,0xfffffff8(%ebp)
 804fe18:	0f 86 a6 04 00 00    	jbe    0x80502c4
 804fe1e:	83 45 f8 f0          	addl   $0xfffffff0,0xfffffff8(%ebp)
 804fe22:	e9 2f 04 00 00       	jmp    0x8050256
 804fe27:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804fe2a:	83 c0 20             	add    $0x20,%eax
 804fe2d:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
 804fe30:	0f 82 8e 04 00 00    	jb     0x80502c4
 804fe36:	83 45 f8 f0          	addl   $0xfffffff0,0xfffffff8(%ebp)
 804fe3a:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804fe3d:	89 7d e0             	mov    %edi,0xffffffe0(%ebp)
 804fe40:	83 c7 f0             	add    $0xfffffff0,%edi
 804fe43:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 804fe46:	89 7d f8             	mov    %edi,0xfffffff8(%ebp)
 804fe49:	8b 41 0c             	mov    0xc(%ecx),%eax
 804fe4c:	50                   	push   %eax
 804fe4d:	8b 47 0c             	mov    0xc(%edi),%eax
 804fe50:	50                   	push   %eax
 804fe51:	e8 06 91 ff ff       	call   0x8048f5c
 804fe56:	83 c4 08             	add    $0x8,%esp
 804fe59:	85 c0                	test   %eax,%eax
 804fe5b:	74 06                	je     0x804fe63
 804fe5d:	8b 47 0c             	mov    0xc(%edi),%eax
 804fe60:	c6 00 00             	movb   $0x0,(%eax)
 804fe63:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804fe66:	31 f6                	xor    %esi,%esi
 804fe68:	8b 57 04             	mov    0x4(%edi),%edx
 804fe6b:	89 55 cc             	mov    %edx,0xffffffcc(%ebp)
 804fe6e:	80 3a 00             	cmpb   $0x0,(%edx)
 804fe71:	74 22                	je     0x804fe95
 804fe73:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 804fe76:	89 d3                	mov    %edx,%ebx
 804fe78:	8b 49 04             	mov    0x4(%ecx),%ecx
 804fe7b:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 804fe7e:	89 f6                	mov    %esi,%esi
 804fe80:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 804fe83:	8a 04 3e             	mov    (%esi,%edi,1),%al
 804fe86:	38 04 1e             	cmp    %al,(%esi,%ebx,1)
 804fe89:	75 0a                	jne    0x804fe95
 804fe8b:	46                   	inc    %esi
 804fe8c:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 804fe8f:	80 3c 0e 00          	cmpb   $0x0,(%esi,%ecx,1)
 804fe93:	75 eb                	jne    0x804fe80
 804fe95:	c6 04 16 00          	movb   $0x0,(%esi,%edx,1)
 804fe99:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804fe9c:	8b 7f 08             	mov    0x8(%edi),%edi
 804fe9f:	89 7d c8             	mov    %edi,0xffffffc8(%ebp)
 804fea2:	89 f9                	mov    %edi,%ecx
 804fea4:	89 f8                	mov    %edi,%eax
 804fea6:	83 e0 03             	and    $0x3,%eax
 804fea9:	74 16                	je     0x804fec1
 804feab:	7a 0f                	jp     0x804febc
 804fead:	83 f8 02             	cmp    $0x2,%eax
 804feb0:	74 05                	je     0x804feb7
 804feb2:	38 21                	cmp    %ah,(%ecx)
 804feb4:	74 2b                	je     0x804fee1
 804feb6:	41                   	inc    %ecx
 804feb7:	38 21                	cmp    %ah,(%ecx)
 804feb9:	74 26                	je     0x804fee1
 804febb:	41                   	inc    %ecx
 804febc:	38 21                	cmp    %ah,(%ecx)
 804febe:	74 21                	je     0x804fee1
 804fec0:	41                   	inc    %ecx
 804fec1:	8b 01                	mov    (%ecx),%eax
 804fec3:	84 c0                	test   %al,%al
 804fec5:	74 1a                	je     0x804fee1
 804fec7:	84 e4                	test   %ah,%ah
 804fec9:	74 15                	je     0x804fee0
 804fecb:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804fed0:	74 0d                	je     0x804fedf
 804fed2:	83 c1 04             	add    $0x4,%ecx
 804fed5:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804feda:	75 e5                	jne    0x804fec1
 804fedc:	83 e9 03             	sub    $0x3,%ecx
 804fedf:	41                   	inc    %ecx
 804fee0:	41                   	inc    %ecx
 804fee1:	29 f9                	sub    %edi,%ecx
 804fee3:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 804fee6:	89 4d cc             	mov    %ecx,0xffffffcc(%ebp)
 804fee9:	8b 57 08             	mov    0x8(%edi),%edx
 804feec:	89 d3                	mov    %edx,%ebx
 804feee:	89 d0                	mov    %edx,%eax
 804fef0:	83 e0 03             	and    $0x3,%eax
 804fef3:	74 16                	je     0x804ff0b
 804fef5:	7a 0f                	jp     0x804ff06
 804fef7:	83 f8 02             	cmp    $0x2,%eax
 804fefa:	74 05                	je     0x804ff01
 804fefc:	38 23                	cmp    %ah,(%ebx)
 804fefe:	74 2b                	je     0x804ff2b
 804ff00:	43                   	inc    %ebx
 804ff01:	38 23                	cmp    %ah,(%ebx)
 804ff03:	74 26                	je     0x804ff2b
 804ff05:	43                   	inc    %ebx
 804ff06:	38 23                	cmp    %ah,(%ebx)
 804ff08:	74 21                	je     0x804ff2b
 804ff0a:	43                   	inc    %ebx
 804ff0b:	8b 03                	mov    (%ebx),%eax
 804ff0d:	84 c0                	test   %al,%al
 804ff0f:	74 1a                	je     0x804ff2b
 804ff11:	84 e4                	test   %ah,%ah
 804ff13:	74 15                	je     0x804ff2a
 804ff15:	a9 00 00 ff 00       	test   $0xff0000,%eax
 804ff1a:	74 0d                	je     0x804ff29
 804ff1c:	83 c3 04             	add    $0x4,%ebx
 804ff1f:	a9 00 00 00 ff       	test   $0xff000000,%eax
 804ff24:	75 e5                	jne    0x804ff0b
 804ff26:	83 eb 03             	sub    $0x3,%ebx
 804ff29:	43                   	inc    %ebx
 804ff2a:	43                   	inc    %ebx
 804ff2b:	29 d3                	sub    %edx,%ebx
 804ff2d:	89 4d dc             	mov    %ecx,0xffffffdc(%ebp)
 804ff30:	39 d9                	cmp    %ebx,%ecx
 804ff32:	7e 03                	jle    0x804ff37
 804ff34:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 804ff37:	31 f6                	xor    %esi,%esi
 804ff39:	3b 75 dc             	cmp    0xffffffdc(%ebp),%esi
 804ff3c:	7d 28                	jge    0x804ff66
 804ff3e:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 804ff41:	89 4d d8             	mov    %ecx,0xffffffd8(%ebp)
 804ff44:	89 55 d4             	mov    %edx,0xffffffd4(%ebp)
 804ff47:	8b 45 cc             	mov    0xffffffcc(%ebp),%eax
 804ff4a:	29 f0                	sub    %esi,%eax
 804ff4c:	89 da                	mov    %ebx,%edx
 804ff4e:	29 f2                	sub    %esi,%edx
 804ff50:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 804ff53:	8b 4d d8             	mov    0xffffffd8(%ebp),%ecx
 804ff56:	8a 54 17 ff          	mov    0xffffffff(%edi,%edx,1),%dl
 804ff5a:	38 54 01 ff          	cmp    %dl,0xffffffff(%ecx,%eax,1)
 804ff5e:	75 06                	jne    0x804ff66
 804ff60:	46                   	inc    %esi
 804ff61:	3b 75 dc             	cmp    0xffffffdc(%ebp),%esi
 804ff64:	7c e1                	jl     0x804ff47
 804ff66:	31 d2                	xor    %edx,%edx
 804ff68:	39 f2                	cmp    %esi,%edx
 804ff6a:	7d 1f                	jge    0x804ff8b
 804ff6c:	8b 5d cc             	mov    0xffffffcc(%ebp),%ebx
 804ff6f:	29 f3                	sub    %esi,%ebx
 804ff71:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
 804ff74:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 804ff77:	8a 04 38             	mov    (%eax,%edi,1),%al
 804ff7a:	88 04 3a             	mov    %al,(%edx,%edi,1)
 804ff7d:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 804ff80:	42                   	inc    %edx
 804ff81:	8b 49 08             	mov    0x8(%ecx),%ecx
 804ff84:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 804ff87:	39 f2                	cmp    %esi,%edx
 804ff89:	7c e6                	jl     0x804ff71
 804ff8b:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 804ff8e:	c6 04 3a 00          	movb   $0x0,(%edx,%edi,1)
 804ff92:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 804ff95:	8b 01                	mov    (%ecx),%eax
 804ff97:	50                   	push   %eax
 804ff98:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804ff9b:	8b 07                	mov    (%edi),%eax
 804ff9d:	50                   	push   %eax
 804ff9e:	e8 ed fb ff ff       	call   0x804fb90
 804ffa3:	89 c3                	mov    %eax,%ebx
 804ffa5:	83 c4 08             	add    $0x8,%esp
 804ffa8:	85 db                	test   %ebx,%ebx
 804ffaa:	0f 84 14 03 00 00    	je     0x80502c4
 804ffb0:	8b 07                	mov    (%edi),%eax
 804ffb2:	50                   	push   %eax
 804ffb3:	e8 58 f9 ff ff       	call   0x804f910
 804ffb8:	8b 07                	mov    (%edi),%eax
 804ffba:	50                   	push   %eax
 804ffbb:	e8 2c 92 ff ff       	call   0x80491ec
 804ffc0:	89 1f                	mov    %ebx,(%edi)
 804ffc2:	83 c4 08             	add    $0x8,%esp
 804ffc5:	e9 e4 02 00 00       	jmp    0x80502ae
 804ffca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804ffd0:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 804ffd3:	39 4d f8             	cmp    %ecx,0xfffffff8(%ebp)
 804ffd6:	0f 86 e8 02 00 00    	jbe    0x80502c4
 804ffdc:	83 45 f8 f0          	addl   $0xfffffff0,0xfffffff8(%ebp)
 804ffe0:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 804ffe3:	8b 47 0c             	mov    0xc(%edi),%eax
 804ffe6:	c6 00 00             	movb   $0x0,(%eax)
 804ffe9:	e9 c0 02 00 00       	jmp    0x80502ae
 804ffee:	89 f6                	mov    %esi,%esi
 804fff0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804fff3:	83 c0 10             	add    $0x10,%eax
 804fff6:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
 804fff9:	0f 85 c5 02 00 00    	jne    0x80502c4
 804ffff:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8050002:	31 f6                	xor    %esi,%esi
 8050004:	8b 09                	mov    (%ecx),%ecx
 8050006:	89 4d cc             	mov    %ecx,0xffffffcc(%ebp)
 8050009:	83 39 00             	cmpl   $0x0,(%ecx)
 805000c:	0f 84 a4 00 00 00    	je     0x80500b6
 8050012:	89 4d d0             	mov    %ecx,0xffffffd0(%ebp)
 8050015:	8b 7d d0             	mov    0xffffffd0(%ebp),%edi
 8050018:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805001b:	8b 1c b7             	mov    (%edi,%esi,4),%ebx
 805001e:	89 d9                	mov    %ebx,%ecx
 8050020:	89 d8                	mov    %ebx,%eax
 8050022:	83 e0 03             	and    $0x3,%eax
 8050025:	74 16                	je     0x805003d
 8050027:	7a 0f                	jp     0x8050038
 8050029:	83 f8 02             	cmp    $0x2,%eax
 805002c:	74 05                	je     0x8050033
 805002e:	38 21                	cmp    %ah,(%ecx)
 8050030:	74 2b                	je     0x805005d
 8050032:	41                   	inc    %ecx
 8050033:	38 21                	cmp    %ah,(%ecx)
 8050035:	74 26                	je     0x805005d
 8050037:	41                   	inc    %ecx
 8050038:	38 21                	cmp    %ah,(%ecx)
 805003a:	74 21                	je     0x805005d
 805003c:	41                   	inc    %ecx
 805003d:	8b 01                	mov    (%ecx),%eax
 805003f:	84 c0                	test   %al,%al
 8050041:	74 1a                	je     0x805005d
 8050043:	84 e4                	test   %ah,%ah
 8050045:	74 15                	je     0x805005c
 8050047:	a9 00 00 ff 00       	test   $0xff0000,%eax
 805004c:	74 0d                	je     0x805005b
 805004e:	83 c1 04             	add    $0x4,%ecx
 8050051:	a9 00 00 00 ff       	test   $0xff000000,%eax
 8050056:	75 e5                	jne    0x805003d
 8050058:	83 e9 03             	sub    $0x3,%ecx
 805005b:	41                   	inc    %ecx
 805005c:	41                   	inc    %ecx
 805005d:	89 d0                	mov    %edx,%eax
 805005f:	29 d9                	sub    %ebx,%ecx
 8050061:	83 e2 03             	and    $0x3,%edx
 8050064:	74 16                	je     0x805007c
 8050066:	7a 0f                	jp     0x8050077
 8050068:	83 fa 02             	cmp    $0x2,%edx
 805006b:	74 05                	je     0x8050072
 805006d:	38 30                	cmp    %dh,(%eax)
 805006f:	74 2d                	je     0x805009e
 8050071:	40                   	inc    %eax
 8050072:	38 30                	cmp    %dh,(%eax)
 8050074:	74 28                	je     0x805009e
 8050076:	40                   	inc    %eax
 8050077:	38 30                	cmp    %dh,(%eax)
 8050079:	74 23                	je     0x805009e
 805007b:	40                   	inc    %eax
 805007c:	8b 10                	mov    (%eax),%edx
 805007e:	84 d2                	test   %dl,%dl
 8050080:	74 1c                	je     0x805009e
 8050082:	84 f6                	test   %dh,%dh
 8050084:	74 17                	je     0x805009d
 8050086:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 805008c:	74 0e                	je     0x805009c
 805008e:	83 c0 04             	add    $0x4,%eax
 8050091:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 8050097:	75 e3                	jne    0x805007c
 8050099:	83 e8 03             	sub    $0x3,%eax
 805009c:	40                   	inc    %eax
 805009d:	40                   	inc    %eax
 805009e:	2b 45 f4             	sub    0xfffffff4(%ebp),%eax
 80500a1:	39 c1                	cmp    %eax,%ecx
 80500a3:	76 03                	jbe    0x80500a8
 80500a5:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 80500a8:	46                   	inc    %esi
 80500a9:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 80500ac:	83 3c b7 00          	cmpl   $0x0,(%edi,%esi,4)
 80500b0:	0f 85 5f ff ff ff    	jne    0x8050015
 80500b6:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80500b9:	8b 41 0c             	mov    0xc(%ecx),%eax
 80500bc:	50                   	push   %eax
 80500bd:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 80500c0:	57                   	push   %edi
 80500c1:	e8 96 8e ff ff       	call   0x8048f5c
 80500c6:	83 c4 08             	add    $0x8,%esp
 80500c9:	85 c0                	test   %eax,%eax
 80500cb:	0f 85 f3 01 00 00    	jne    0x80502c4
 80500d1:	c7 45 ec 01 00 00 00 	movl   $0x1,0xffffffec(%ebp)
 80500d8:	e9 e7 01 00 00       	jmp    0x80502c4
 80500dd:	8d 76 00             	lea    0x0(%esi),%esi
 80500e0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80500e3:	83 c0 20             	add    $0x20,%eax
 80500e6:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
 80500e9:	0f 82 d5 01 00 00    	jb     0x80502c4
 80500ef:	83 45 f8 f0          	addl   $0xfffffff0,0xfffffff8(%ebp)
 80500f3:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 80500f6:	83 45 f8 f0          	addl   $0xfffffff0,0xfffffff8(%ebp)
 80500fa:	8b 06                	mov    (%esi),%eax
 80500fc:	50                   	push   %eax
 80500fd:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 8050100:	8b 01                	mov    (%ecx),%eax
 8050102:	50                   	push   %eax
 8050103:	e8 f8 f9 ff ff       	call   0x804fb00
 8050108:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 805010b:	83 c4 08             	add    $0x8,%esp
 805010e:	89 07                	mov    %eax,(%edi)
 8050110:	85 c0                	test   %eax,%eax
 8050112:	0f 84 ac 01 00 00    	je     0x80502c4
 8050118:	8b 4f 08             	mov    0x8(%edi),%ecx
 805011b:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 805011e:	80 39 00             	cmpb   $0x0,(%ecx)
 8050121:	0f 84 95 00 00 00    	je     0x80501bc
 8050127:	8b 46 04             	mov    0x4(%esi),%eax
 805012a:	80 38 00             	cmpb   $0x0,(%eax)
 805012d:	0f 84 89 00 00 00    	je     0x80501bc
 8050133:	51                   	push   %ecx
 8050134:	e8 17 f7 ff ff       	call   0x804f850
 8050139:	89 c3                	mov    %eax,%ebx
 805013b:	83 c4 04             	add    $0x4,%esp
 805013e:	85 db                	test   %ebx,%ebx
 8050140:	0f 84 7e 01 00 00    	je     0x80502c4
 8050146:	8b 46 04             	mov    0x4(%esi),%eax
 8050149:	50                   	push   %eax
 805014a:	53                   	push   %ebx
 805014b:	e8 10 f6 ff ff       	call   0x804f760
 8050150:	89 c3                	mov    %eax,%ebx
 8050152:	83 c4 08             	add    $0x8,%esp
 8050155:	85 db                	test   %ebx,%ebx
 8050157:	0f 84 67 01 00 00    	je     0x80502c4
 805015d:	89 da                	mov    %ebx,%edx
 805015f:	83 e2 03             	and    $0x3,%edx
 8050162:	74 16                	je     0x805017a
 8050164:	7a 0f                	jp     0x8050175
 8050166:	83 fa 02             	cmp    $0x2,%edx
 8050169:	74 05                	je     0x8050170
 805016b:	38 30                	cmp    %dh,(%eax)
 805016d:	74 2d                	je     0x805019c
 805016f:	40                   	inc    %eax
 8050170:	38 30                	cmp    %dh,(%eax)
 8050172:	74 28                	je     0x805019c
 8050174:	40                   	inc    %eax
 8050175:	38 30                	cmp    %dh,(%eax)
 8050177:	74 23                	je     0x805019c
 8050179:	40                   	inc    %eax
 805017a:	8b 10                	mov    (%eax),%edx
 805017c:	84 d2                	test   %dl,%dl
 805017e:	74 1c                	je     0x805019c
 8050180:	84 f6                	test   %dh,%dh
 8050182:	74 17                	je     0x805019b
 8050184:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 805018a:	74 0e                	je     0x805019a
 805018c:	83 c0 04             	add    $0x4,%eax
 805018f:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 8050195:	75 e3                	jne    0x805017a
 8050197:	83 e8 03             	sub    $0x3,%eax
 805019a:	40                   	inc    %eax
 805019b:	40                   	inc    %eax
 805019c:	29 d8                	sub    %ebx,%eax
 805019e:	50                   	push   %eax
 805019f:	53                   	push   %ebx
 80501a0:	8b 07                	mov    (%edi),%eax
 80501a2:	50                   	push   %eax
 80501a3:	e8 a8 f7 ff ff       	call   0x804f950
 80501a8:	89 07                	mov    %eax,(%edi)
 80501aa:	53                   	push   %ebx
 80501ab:	e8 3c 90 ff ff       	call   0x80491ec
 80501b0:	83 c4 10             	add    $0x10,%esp
 80501b3:	83 3f 00             	cmpl   $0x0,(%edi)
 80501b6:	0f 84 08 01 00 00    	je     0x80502c4
 80501bc:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 80501bf:	8b 47 0c             	mov    0xc(%edi),%eax
 80501c2:	80 38 00             	cmpb   $0x0,(%eax)
 80501c5:	74 1b                	je     0x80501e2
 80501c7:	8b 46 04             	mov    0x4(%esi),%eax
 80501ca:	50                   	push   %eax
 80501cb:	8b 47 04             	mov    0x4(%edi),%eax
 80501ce:	50                   	push   %eax
 80501cf:	e8 8c f5 ff ff       	call   0x804f760
 80501d4:	89 47 04             	mov    %eax,0x4(%edi)
 80501d7:	83 c4 08             	add    $0x8,%esp
 80501da:	85 c0                	test   %eax,%eax
 80501dc:	0f 84 e2 00 00 00    	je     0x80502c4
 80501e2:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 80501e5:	8b 46 0c             	mov    0xc(%esi),%eax
 80501e8:	8b 49 08             	mov    0x8(%ecx),%ecx
 80501eb:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 80501ee:	80 38 00             	cmpb   $0x0,(%eax)
 80501f1:	75 0c                	jne    0x80501ff
 80501f3:	c6 01 00             	movb   $0x0,(%ecx)
 80501f6:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 80501f9:	8b 7f 08             	mov    0x8(%edi),%edi
 80501fc:	89 7d c8             	mov    %edi,0xffffffc8(%ebp)
 80501ff:	8b 46 08             	mov    0x8(%esi),%eax
 8050202:	50                   	push   %eax
 8050203:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 8050206:	51                   	push   %ecx
 8050207:	e8 54 f5 ff ff       	call   0x804f760
 805020c:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 805020f:	83 c4 08             	add    $0x8,%esp
 8050212:	89 47 08             	mov    %eax,0x8(%edi)
 8050215:	85 c0                	test   %eax,%eax
 8050217:	0f 84 a7 00 00 00    	je     0x80502c4
 805021d:	8b 57 0c             	mov    0xc(%edi),%edx
 8050220:	80 3a 00             	cmpb   $0x0,(%edx)
 8050223:	74 1b                	je     0x8050240
 8050225:	8b 46 0c             	mov    0xc(%esi),%eax
 8050228:	80 38 00             	cmpb   $0x0,(%eax)
 805022b:	74 13                	je     0x8050240
 805022d:	50                   	push   %eax
 805022e:	52                   	push   %edx
 805022f:	e8 2c f5 ff ff       	call   0x804f760
 8050234:	89 47 0c             	mov    %eax,0xc(%edi)
 8050237:	83 c4 08             	add    $0x8,%esp
 805023a:	eb 6e                	jmp    0x80502aa
 805023c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050240:	c6 02 00             	movb   $0x0,(%edx)
 8050243:	eb 69                	jmp    0x80502ae
 8050245:	83 fb ff             	cmp    $0xffffffff,%ebx
 8050248:	7c 7a                	jl     0x80502c4
 805024a:	85 db                	test   %ebx,%ebx
 805024c:	74 76                	je     0x80502c4
 805024e:	81 fb 10 01 00 00    	cmp    $0x110,%ebx
 8050254:	7e 0e                	jle    0x8050264
 8050256:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 8050259:	51                   	push   %ecx
 805025a:	e8 f1 f9 ff ff       	call   0x804fc50
 805025f:	83 c4 04             	add    $0x4,%esp
 8050262:	eb 4a                	jmp    0x80502ae
 8050264:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8050267:	57                   	push   %edi
 8050268:	e8 e3 f9 ff ff       	call   0x804fc50
 805026d:	8b 4f 0c             	mov    0xc(%edi),%ecx
 8050270:	8b 47 08             	mov    0x8(%edi),%eax
 8050273:	8b 57 04             	mov    0x4(%edi),%edx
 8050276:	88 18                	mov    %bl,(%eax)
 8050278:	88 1a                	mov    %bl,(%edx)
 805027a:	88 19                	mov    %bl,(%ecx)
 805027c:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 805027f:	8b 7f 0c             	mov    0xc(%edi),%edi
 8050282:	8b 41 08             	mov    0x8(%ecx),%eax
 8050285:	8b 51 04             	mov    0x4(%ecx),%edx
 8050288:	c6 40 01 00          	movb   $0x0,0x1(%eax)
 805028c:	c6 42 01 00          	movb   $0x0,0x1(%edx)
 8050290:	c6 47 01 00          	movb   $0x0,0x1(%edi)
 8050294:	6a 01                	push   $0x1
 8050296:	8b 41 0c             	mov    0xc(%ecx),%eax
 8050299:	50                   	push   %eax
 805029a:	8b 01                	mov    (%ecx),%eax
 805029c:	50                   	push   %eax
 805029d:	e8 ae f6 ff ff       	call   0x804f950
 80502a2:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 80502a5:	83 c4 10             	add    $0x10,%esp
 80502a8:	89 07                	mov    %eax,(%edi)
 80502aa:	85 c0                	test   %eax,%eax
 80502ac:	74 16                	je     0x80502c4
 80502ae:	83 45 f8 10          	addl   $0x10,0xfffffff8(%ebp)
 80502b2:	ff 45 f0             	incl   0xfffffff0(%ebp)
 80502b5:	8b 7d 08             	mov    0x8(%ebp),%edi
 80502b8:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 80502bb:	3b 4f 10             	cmp    0x10(%edi),%ecx
 80502be:	0f 8c e0 fa ff ff    	jl     0x804fda4
 80502c4:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80502c7:	89 d0                	mov    %edx,%eax
 80502c9:	83 e2 03             	and    $0x3,%edx
 80502cc:	74 16                	je     0x80502e4
 80502ce:	7a 0f                	jp     0x80502df
 80502d0:	83 fa 02             	cmp    $0x2,%edx
 80502d3:	74 05                	je     0x80502da
 80502d5:	38 30                	cmp    %dh,(%eax)
 80502d7:	74 2d                	je     0x8050306
 80502d9:	40                   	inc    %eax
 80502da:	38 30                	cmp    %dh,(%eax)
 80502dc:	74 28                	je     0x8050306
 80502de:	40                   	inc    %eax
 80502df:	38 30                	cmp    %dh,(%eax)
 80502e1:	74 23                	je     0x8050306
 80502e3:	40                   	inc    %eax
 80502e4:	8b 10                	mov    (%eax),%edx
 80502e6:	84 d2                	test   %dl,%dl
 80502e8:	74 1c                	je     0x8050306
 80502ea:	84 f6                	test   %dh,%dh
 80502ec:	74 17                	je     0x8050305
 80502ee:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 80502f4:	74 0e                	je     0x8050304
 80502f6:	83 c0 04             	add    $0x4,%eax
 80502f9:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 80502ff:	75 e3                	jne    0x80502e4
 8050301:	83 e8 03             	sub    $0x3,%eax
 8050304:	40                   	inc    %eax
 8050305:	40                   	inc    %eax
 8050306:	3b 45 f4             	cmp    0xfffffff4(%ebp),%eax
 8050309:	74 77                	je     0x8050382
 805030b:	6a 0c                	push   $0xc
 805030d:	e8 fa 8c ff ff       	call   0x804900c
 8050312:	89 c3                	mov    %eax,%ebx
 8050314:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 8050317:	89 0b                	mov    %ecx,(%ebx)
 8050319:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805031c:	89 c2                	mov    %eax,%edx
 805031e:	83 e0 03             	and    $0x3,%eax
 8050321:	74 16                	je     0x8050339
 8050323:	7a 0f                	jp     0x8050334
 8050325:	83 f8 02             	cmp    $0x2,%eax
 8050328:	74 05                	je     0x805032f
 805032a:	38 22                	cmp    %ah,(%edx)
 805032c:	74 2b                	je     0x8050359
 805032e:	42                   	inc    %edx
 805032f:	38 22                	cmp    %ah,(%edx)
 8050331:	74 26                	je     0x8050359
 8050333:	42                   	inc    %edx
 8050334:	38 22                	cmp    %ah,(%edx)
 8050336:	74 21                	je     0x8050359
 8050338:	42                   	inc    %edx
 8050339:	8b 02                	mov    (%edx),%eax
 805033b:	84 c0                	test   %al,%al
 805033d:	74 1a                	je     0x8050359
 805033f:	84 e4                	test   %ah,%ah
 8050341:	74 15                	je     0x8050358
 8050343:	a9 00 00 ff 00       	test   $0xff0000,%eax
 8050348:	74 0d                	je     0x8050357
 805034a:	83 c2 04             	add    $0x4,%edx
 805034d:	a9 00 00 00 ff       	test   $0xff000000,%eax
 8050352:	75 e5                	jne    0x8050339
 8050354:	83 ea 03             	sub    $0x3,%edx
 8050357:	42                   	inc    %edx
 8050358:	42                   	inc    %edx
 8050359:	2b 55 f4             	sub    0xfffffff4(%ebp),%edx
 805035c:	42                   	inc    %edx
 805035d:	52                   	push   %edx
 805035e:	e8 a9 8c ff ff       	call   0x804900c
 8050363:	89 43 04             	mov    %eax,0x4(%ebx)
 8050366:	83 c4 08             	add    $0x8,%esp
 8050369:	8b 7d f4             	mov    0xfffffff4(%ebp),%edi
 805036c:	57                   	push   %edi
 805036d:	50                   	push   %eax
 805036e:	e8 b9 8e ff ff       	call   0x804922c
 8050373:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8050376:	83 c4 08             	add    $0x8,%esp
 8050379:	8b 41 54             	mov    0x54(%ecx),%eax
 805037c:	89 43 08             	mov    %eax,0x8(%ebx)
 805037f:	89 59 54             	mov    %ebx,0x54(%ecx)
 8050382:	8b 7d 08             	mov    0x8(%ebp),%edi
 8050385:	31 f6                	xor    %esi,%esi
 8050387:	3b 77 10             	cmp    0x10(%edi),%esi
 805038a:	7f 4b                	jg     0x80503d7
 805038c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050390:	89 f3                	mov    %esi,%ebx
 8050392:	c1 e3 04             	shl    $0x4,%ebx
 8050395:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8050398:	8b 04 19             	mov    (%ecx,%ebx,1),%eax
 805039b:	50                   	push   %eax
 805039c:	e8 6f f5 ff ff       	call   0x804f910
 80503a1:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 80503a4:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
 80503a7:	50                   	push   %eax
 80503a8:	e8 43 f5 ff ff       	call   0x804f8f0
 80503ad:	8b 44 1f 04          	mov    0x4(%edi,%ebx,1),%eax
 80503b1:	50                   	push   %eax
 80503b2:	e8 39 f5 ff ff       	call   0x804f8f0
 80503b7:	8b 44 1f 08          	mov    0x8(%edi,%ebx,1),%eax
 80503bb:	50                   	push   %eax
 80503bc:	e8 2f f5 ff ff       	call   0x804f8f0
 80503c1:	8b 44 1f 0c          	mov    0xc(%edi,%ebx,1),%eax
 80503c5:	50                   	push   %eax
 80503c6:	e8 25 f5 ff ff       	call   0x804f8f0
 80503cb:	83 c4 14             	add    $0x14,%esp
 80503ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80503d1:	46                   	inc    %esi
 80503d2:	3b 71 10             	cmp    0x10(%ecx),%esi
 80503d5:	7e b9                	jle    0x8050390
 80503d7:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 80503da:	57                   	push   %edi
 80503db:	e8 0c 8e ff ff       	call   0x80491ec
 80503e0:	8d 65 bc             	lea    0xffffffbc(%ebp),%esp
 80503e3:	5b                   	pop    %ebx
 80503e4:	5e                   	pop    %esi
 80503e5:	5f                   	pop    %edi
 80503e6:	89 ec                	mov    %ebp,%esp
 80503e8:	5d                   	pop    %ebp
 80503e9:	c3                   	ret    
 80503ea:	90                   	nop    
 80503eb:	90                   	nop    
 80503ec:	90                   	nop    
 80503ed:	90                   	nop    
 80503ee:	90                   	nop    
 80503ef:	90                   	nop    
 80503f0:	55                   	push   %ebp
 80503f1:	89 e5                	mov    %esp,%ebp
 80503f3:	57                   	push   %edi
 80503f4:	56                   	push   %esi
 80503f5:	53                   	push   %ebx
 80503f6:	68 48 05 00 00       	push   $0x548
 80503fb:	e8 70 8f ff ff       	call   0x8049370
 8050400:	89 c3                	mov    %eax,%ebx
 8050402:	83 c4 04             	add    $0x4,%esp
 8050405:	85 db                	test   %ebx,%ebx
 8050407:	0f 84 e9 00 00 00    	je     0x80504f6
 805040d:	68 ec 91 04 08       	push   $0x80491ec
 8050412:	68 70 93 04 08       	push   $0x8049370
 8050417:	6a 00                	push   $0x0
 8050419:	6a 00                	push   $0x0
 805041b:	53                   	push   %ebx
 805041c:	e8 2b 8b ff ff       	call   0x8048f4c
 8050421:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
 8050428:	83 c4 14             	add    $0x14,%esp
 805042b:	8b 53 0c             	mov    0xc(%ebx),%edx
 805042e:	8b 43 10             	mov    0x10(%ebx),%eax
 8050431:	29 d0                	sub    %edx,%eax
 8050433:	83 f8 20             	cmp    $0x20,%eax
 8050436:	7d 0e                	jge    0x8050446
 8050438:	6a 20                	push   $0x20
 805043a:	53                   	push   %ebx
 805043b:	e8 bc 8d ff ff       	call   0x80491fc
 8050440:	83 c4 08             	add    $0x8,%esp
 8050443:	8b 53 0c             	mov    0xc(%ebx),%edx
 8050446:	8d 42 20             	lea    0x20(%edx),%eax
 8050449:	89 43 0c             	mov    %eax,0xc(%ebx)
 805044c:	8b 7b 08             	mov    0x8(%ebx),%edi
 805044f:	39 f8                	cmp    %edi,%eax
 8050451:	75 04                	jne    0x8050457
 8050453:	80 4b 28 02          	orb    $0x2,0x28(%ebx)
 8050457:	8b 43 18             	mov    0x18(%ebx),%eax
 805045a:	89 c2                	mov    %eax,%edx
 805045c:	03 53 0c             	add    0xc(%ebx),%edx
 805045f:	f7 d0                	not    %eax
 8050461:	21 c2                	and    %eax,%edx
 8050463:	89 53 0c             	mov    %edx,0xc(%ebx)
 8050466:	8b 4b 04             	mov    0x4(%ebx),%ecx
 8050469:	29 ca                	sub    %ecx,%edx
 805046b:	8b 73 10             	mov    0x10(%ebx),%esi
 805046e:	89 f0                	mov    %esi,%eax
 8050470:	29 c8                	sub    %ecx,%eax
 8050472:	39 c2                	cmp    %eax,%edx
 8050474:	7e 03                	jle    0x8050479
 8050476:	89 73 0c             	mov    %esi,0xc(%ebx)
 8050479:	8b 43 0c             	mov    0xc(%ebx),%eax
 805047c:	89 43 08             	mov    %eax,0x8(%ebx)
 805047f:	89 7b 30             	mov    %edi,0x30(%ebx)
 8050482:	85 ff                	test   %edi,%edi
 8050484:	74 6a                	je     0x80504f0
 8050486:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
 805048c:	8b 43 30             	mov    0x30(%ebx),%eax
 805048f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050496:	8b 43 30             	mov    0x30(%ebx),%eax
 8050499:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 80504a0:	8b 43 30             	mov    0x30(%ebx),%eax
 80504a3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 80504aa:	8b 43 30             	mov    0x30(%ebx),%eax
 80504ad:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
 80504b4:	8b 43 30             	mov    0x30(%ebx),%eax
 80504b7:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
 80504be:	8b 43 30             	mov    0x30(%ebx),%eax
 80504c1:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
 80504c8:	c7 43 34 ff ff ff 7f 	movl   $0x7fffffff,0x34(%ebx)
 80504cf:	c7 43 38 ff ff ff ff 	movl   $0xffffffff,0x38(%ebx)
 80504d6:	c7 83 3c 05 00 00 00 	movl   $0x0,0x53c(%ebx)
 80504dd:	00 00 00 
 80504e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80504e3:	89 83 44 05 00 00    	mov    %eax,0x544(%ebx)
 80504e9:	89 d8                	mov    %ebx,%eax
 80504eb:	eb 0b                	jmp    0x80504f8
 80504ed:	8d 76 00             	lea    0x0(%esi),%esi
 80504f0:	53                   	push   %ebx
 80504f1:	e8 aa 0f 00 00       	call   0x80514a0
 80504f6:	31 c0                	xor    %eax,%eax
 80504f8:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 80504fb:	5b                   	pop    %ebx
 80504fc:	5e                   	pop    %esi
 80504fd:	5f                   	pop    %edi
 80504fe:	89 ec                	mov    %ebp,%esp
 8050500:	5d                   	pop    %ebp
 8050501:	c3                   	ret    
 8050502:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8050509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8050510:	55                   	push   %ebp
 8050511:	89 e5                	mov    %esp,%ebp
 8050513:	81 ec 84 00 00 00    	sub    $0x84,%esp
 8050519:	57                   	push   %edi
 805051a:	56                   	push   %esi
 805051b:	53                   	push   %ebx
 805051c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805051f:	8b 75 10             	mov    0x10(%ebp),%esi
 8050522:	89 75 9c             	mov    %esi,0xffffff9c(%ebp)
 8050525:	8b 7b 30             	mov    0x30(%ebx),%edi
 8050528:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 805052b:	01 5d 9c             	add    %ebx,0xffffff9c(%ebp)
 805052e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 8050532:	0f 82 b3 04 00 00    	jb     0x80509eb
 8050538:	8b 75 08             	mov    0x8(%ebp),%esi
 805053b:	8b 96 44 05 00 00    	mov    0x544(%esi),%edx
 8050541:	85 d2                	test   %edx,%edx
 8050543:	74 12                	je     0x8050557
 8050545:	ff 4d 9c             	decl   0xffffff9c(%ebp)
 8050548:	8b 5d 9c             	mov    0xffffff9c(%ebp),%ebx
 805054b:	31 c0                	xor    %eax,%eax
 805054d:	8a 03                	mov    (%ebx),%al
 805054f:	8a 14 10             	mov    (%eax,%edx,1),%dl
 8050552:	88 55 9b             	mov    %dl,0xffffff9b(%ebp)
 8050555:	eb 0b                	jmp    0x8050562
 8050557:	ff 4d 9c             	decl   0xffffff9c(%ebp)
 805055a:	8b 5d 9c             	mov    0xffffff9c(%ebp),%ebx
 805055d:	8a 1b                	mov    (%ebx),%bl
 805055f:	88 5d 9b             	mov    %bl,0xffffff9b(%ebp)
 8050562:	8b 77 04             	mov    0x4(%edi),%esi
 8050565:	89 75 94             	mov    %esi,0xffffff94(%ebp)
 8050568:	8d 5f 04             	lea    0x4(%edi),%ebx
 805056b:	89 5d d0             	mov    %ebx,0xffffffd0(%ebp)
 805056e:	c7 45 a0 00 00 00 00 	movl   $0x0,0xffffffa0(%ebp)
 8050575:	c7 45 90 01 00 00 00 	movl   $0x1,0xffffff90(%ebp)
 805057c:	85 f6                	test   %esi,%esi
 805057e:	74 6c                	je     0x80505ec
 8050580:	8d 55 d0             	lea    0xffffffd0(%ebp),%edx
 8050583:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 8050586:	8a 5d 9b             	mov    0xffffff9b(%ebp),%bl
 8050589:	3a 5e 0c             	cmp    0xc(%esi),%bl
 805058c:	74 54                	je     0x80505e2
 805058e:	8b 5d 90             	mov    0xffffff90(%ebp),%ebx
 8050591:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 8050598:	89 34 10             	mov    %esi,(%eax,%edx,1)
 805059b:	8d 75 a0             	lea    0xffffffa0(%ebp),%esi
 805059e:	89 b5 7c ff ff ff    	mov    %esi,0xffffff7c(%ebp)
 80505a4:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 80505a7:	8a 5d 9b             	mov    0xffffff9b(%ebp),%bl
 80505aa:	3a 5e 0c             	cmp    0xc(%esi),%bl
 80505ad:	73 14                	jae    0x80505c3
 80505af:	8b 9d 7c ff ff ff    	mov    0xffffff7c(%ebp),%ebx
 80505b5:	c7 04 18 00 00 00 00 	movl   $0x0,(%eax,%ebx,1)
 80505bc:	ff 45 90             	incl   0xffffff90(%ebp)
 80505bf:	8b 36                	mov    (%esi),%esi
 80505c1:	eb 16                	jmp    0x80505d9
 80505c3:	8b 9d 7c ff ff ff    	mov    0xffffff7c(%ebp),%ebx
 80505c9:	c7 04 18 01 00 00 00 	movl   $0x1,(%eax,%ebx,1)
 80505d0:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 80505d3:	ff 45 90             	incl   0xffffff90(%ebp)
 80505d6:	8b 76 04             	mov    0x4(%esi),%esi
 80505d9:	89 75 94             	mov    %esi,0xffffff94(%ebp)
 80505dc:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 80505e0:	75 a1                	jne    0x8050583
 80505e2:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 80505e6:	0f 85 ef 03 00 00    	jne    0x80509db
 80505ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80505ef:	8b 53 0c             	mov    0xc(%ebx),%edx
 80505f2:	8b 43 10             	mov    0x10(%ebx),%eax
 80505f5:	29 d0                	sub    %edx,%eax
 80505f7:	83 f8 10             	cmp    $0x10,%eax
 80505fa:	7d 0e                	jge    0x805060a
 80505fc:	6a 10                	push   $0x10
 80505fe:	53                   	push   %ebx
 80505ff:	e8 f8 8b ff ff       	call   0x80491fc
 8050604:	83 c4 08             	add    $0x8,%esp
 8050607:	8b 53 0c             	mov    0xc(%ebx),%edx
 805060a:	8b 75 08             	mov    0x8(%ebp),%esi
 805060d:	8d 42 10             	lea    0x10(%edx),%eax
 8050610:	89 46 0c             	mov    %eax,0xc(%esi)
 8050613:	8b 5e 08             	mov    0x8(%esi),%ebx
 8050616:	89 9d 7c ff ff ff    	mov    %ebx,0xffffff7c(%ebp)
 805061c:	39 d8                	cmp    %ebx,%eax
 805061e:	75 04                	jne    0x8050624
 8050620:	80 4e 28 02          	orb    $0x2,0x28(%esi)
 8050624:	8b 75 08             	mov    0x8(%ebp),%esi
 8050627:	8b 46 18             	mov    0x18(%esi),%eax
 805062a:	89 c2                	mov    %eax,%edx
 805062c:	03 56 0c             	add    0xc(%esi),%edx
 805062f:	f7 d0                	not    %eax
 8050631:	21 c2                	and    %eax,%edx
 8050633:	89 56 0c             	mov    %edx,0xc(%esi)
 8050636:	8b 4e 04             	mov    0x4(%esi),%ecx
 8050639:	29 ca                	sub    %ecx,%edx
 805063b:	8b 5e 10             	mov    0x10(%esi),%ebx
 805063e:	89 5d 80             	mov    %ebx,0xffffff80(%ebp)
 8050641:	89 d8                	mov    %ebx,%eax
 8050643:	29 c8                	sub    %ecx,%eax
 8050645:	39 c2                	cmp    %eax,%edx
 8050647:	7e 03                	jle    0x805064c
 8050649:	89 5e 0c             	mov    %ebx,0xc(%esi)
 805064c:	8b 75 08             	mov    0x8(%ebp),%esi
 805064f:	8b 46 0c             	mov    0xc(%esi),%eax
 8050652:	89 46 08             	mov    %eax,0x8(%esi)
 8050655:	8b 9d 7c ff ff ff    	mov    0xffffff7c(%ebp),%ebx
 805065b:	89 5d 94             	mov    %ebx,0xffffff94(%ebp)
 805065e:	85 db                	test   %ebx,%ebx
 8050660:	75 40                	jne    0x80506a2
 8050662:	8b 15 18 bb 05 08    	mov    0x805bb18,%edx
 8050668:	85 d2                	test   %edx,%edx
 805066a:	74 11                	je     0x805067d
 805066c:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8050671:	39 05 1c bb 05 08    	cmp    %eax,0x805bb1c
 8050677:	0f 84 e5 00 00 00    	je     0x8050762
 805067d:	6a 05                	push   $0x5
 805067f:	68 f6 94 05 08       	push   $0x80594f6
 8050684:	6a 00                	push   $0x0
 8050686:	e8 31 8b ff ff       	call   0x80491bc
 805068b:	89 c2                	mov    %eax,%edx
 805068d:	89 15 18 bb 05 08    	mov    %edx,0x805bb18
 8050693:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 8050698:	a3 1c bb 05 08       	mov    %eax,0x805bb1c
 805069d:	e9 c0 00 00 00       	jmp    0x8050762
 80506a2:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 80506a5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 80506ab:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
 80506b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80506b5:	8b 53 0c             	mov    0xc(%ebx),%edx
 80506b8:	8b 43 10             	mov    0x10(%ebx),%eax
 80506bb:	29 d0                	sub    %edx,%eax
 80506bd:	83 f8 20             	cmp    $0x20,%eax
 80506c0:	7d 0e                	jge    0x80506d0
 80506c2:	6a 20                	push   $0x20
 80506c4:	53                   	push   %ebx
 80506c5:	e8 32 8b ff ff       	call   0x80491fc
 80506ca:	83 c4 08             	add    $0x8,%esp
 80506cd:	8b 53 0c             	mov    0xc(%ebx),%edx
 80506d0:	8b 75 08             	mov    0x8(%ebp),%esi
 80506d3:	8d 42 20             	lea    0x20(%edx),%eax
 80506d6:	89 46 0c             	mov    %eax,0xc(%esi)
 80506d9:	8b 5e 08             	mov    0x8(%esi),%ebx
 80506dc:	89 9d 7c ff ff ff    	mov    %ebx,0xffffff7c(%ebp)
 80506e2:	39 d8                	cmp    %ebx,%eax
 80506e4:	75 04                	jne    0x80506ea
 80506e6:	80 4e 28 02          	orb    $0x2,0x28(%esi)
 80506ea:	8b 75 08             	mov    0x8(%ebp),%esi
 80506ed:	8b 46 18             	mov    0x18(%esi),%eax
 80506f0:	89 c2                	mov    %eax,%edx
 80506f2:	03 56 0c             	add    0xc(%esi),%edx
 80506f5:	f7 d0                	not    %eax
 80506f7:	21 c2                	and    %eax,%edx
 80506f9:	89 56 0c             	mov    %edx,0xc(%esi)
 80506fc:	8b 4e 04             	mov    0x4(%esi),%ecx
 80506ff:	29 ca                	sub    %ecx,%edx
 8050701:	8b 5e 10             	mov    0x10(%esi),%ebx
 8050704:	89 5d 80             	mov    %ebx,0xffffff80(%ebp)
 8050707:	89 d8                	mov    %ebx,%eax
 8050709:	29 c8                	sub    %ecx,%eax
 805070b:	39 c2                	cmp    %eax,%edx
 805070d:	7e 03                	jle    0x8050712
 805070f:	89 5e 0c             	mov    %ebx,0xc(%esi)
 8050712:	8b 75 08             	mov    0x8(%ebp),%esi
 8050715:	8b 46 0c             	mov    0xc(%esi),%eax
 8050718:	89 46 08             	mov    %eax,0x8(%esi)
 805071b:	8b 5d 94             	mov    0xffffff94(%ebp),%ebx
 805071e:	8b b5 7c ff ff ff    	mov    0xffffff7c(%ebp),%esi
 8050724:	89 73 08             	mov    %esi,0x8(%ebx)
 8050727:	85 f6                	test   %esi,%esi
 8050729:	75 45                	jne    0x8050770
 805072b:	8b 15 20 bb 05 08    	mov    0x805bb20,%edx
 8050731:	85 d2                	test   %edx,%edx
 8050733:	74 0d                	je     0x8050742
 8050735:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 805073a:	39 05 24 bb 05 08    	cmp    %eax,0x805bb24
 8050740:	74 20                	je     0x8050762
 8050742:	6a 05                	push   $0x5
 8050744:	68 f6 94 05 08       	push   $0x80594f6
 8050749:	6a 00                	push   $0x0
 805074b:	e8 6c 8a ff ff       	call   0x80491bc
 8050750:	89 c2                	mov    %eax,%edx
 8050752:	89 15 20 bb 05 08    	mov    %edx,0x805bb20
 8050758:	a1 d0 b2 05 08       	mov    0x805b2d0,%eax
 805075d:	a3 24 bb 05 08       	mov    %eax,0x805bb24
 8050762:	89 d0                	mov    %edx,%eax
 8050764:	e9 b6 02 00 00       	jmp    0x8050a1f
 8050769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8050770:	8b 9d 7c ff ff ff    	mov    0xffffff7c(%ebp),%ebx
 8050776:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 805077c:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 805077f:	8b 46 08             	mov    0x8(%esi),%eax
 8050782:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8050789:	8b 46 08             	mov    0x8(%esi),%eax
 805078c:	89 78 08             	mov    %edi,0x8(%eax)
 805078f:	8b 46 08             	mov    0x8(%esi),%eax
 8050792:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 8050799:	8b 46 08             	mov    0x8(%esi),%eax
 805079c:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
 80507a3:	8b 46 08             	mov    0x8(%esi),%eax
 80507a6:	8b 7f 14             	mov    0x14(%edi),%edi
 80507a9:	47                   	inc    %edi
 80507aa:	89 78 14             	mov    %edi,0x14(%eax)
 80507ad:	8b 46 08             	mov    0x8(%esi),%eax
 80507b0:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
 80507b7:	8a 5d 9b             	mov    0xffffff9b(%ebp),%bl
 80507ba:	88 5e 0c             	mov    %bl,0xc(%esi)
 80507bd:	c6 46 0d 00          	movb   $0x0,0xd(%esi)
 80507c1:	ff 4d 90             	decl   0xffffff90(%ebp)
 80507c4:	8b 75 90             	mov    0xffffff90(%ebp),%esi
 80507c7:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
 80507ce:	89 ca                	mov    %ecx,%edx
 80507d0:	8d 5d a0             	lea    0xffffffa0(%ebp),%ebx
 80507d3:	89 5d 8c             	mov    %ebx,0xffffff8c(%ebp)
 80507d6:	89 9d 7c ff ff ff    	mov    %ebx,0xffffff7c(%ebp)
 80507dc:	8d 75 d0             	lea    0xffffffd0(%ebp),%esi
 80507df:	89 75 84             	mov    %esi,0xffffff84(%ebp)
 80507e2:	83 3c 19 00          	cmpl   $0x0,(%ecx,%ebx,1)
 80507e6:	75 0a                	jne    0x80507f2
 80507e8:	8b 04 31             	mov    (%ecx,%esi,1),%eax
 80507eb:	8b 5d 94             	mov    0xffffff94(%ebp),%ebx
 80507ee:	89 18                	mov    %ebx,(%eax)
 80507f0:	eb 0c                	jmp    0x80507fe
 80507f2:	8b 75 84             	mov    0xffffff84(%ebp),%esi
 80507f5:	8b 04 31             	mov    (%ecx,%esi,1),%eax
 80507f8:	8b 5d 94             	mov    0xffffff94(%ebp),%ebx
 80507fb:	89 58 04             	mov    %ebx,0x4(%eax)
 80507fe:	83 7d 90 00          	cmpl   $0x0,0xffffff90(%ebp)
 8050802:	0f 84 d3 01 00 00    	je     0x80509db
 8050808:	8b 75 84             	mov    0xffffff84(%ebp),%esi
 805080b:	89 75 80             	mov    %esi,0xffffff80(%ebp)
 805080e:	8b 04 32             	mov    (%edx,%esi,1),%eax
 8050811:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
 8050815:	75 47                	jne    0x805085e
 8050817:	8b 5d 8c             	mov    0xffffff8c(%ebp),%ebx
 805081a:	89 5d 88             	mov    %ebx,0xffffff88(%ebp)
 805081d:	89 f7                	mov    %esi,%edi
 805081f:	90                   	nop    
 8050820:	8b 75 88             	mov    0xffffff88(%ebp),%esi
 8050823:	83 3c 32 00          	cmpl   $0x0,(%edx,%esi,1)
 8050827:	75 0b                	jne    0x8050834
 8050829:	8b 5d 80             	mov    0xffffff80(%ebp),%ebx
 805082c:	8b 04 1a             	mov    (%edx,%ebx,1),%eax
 805082f:	fe 48 0d             	decb   0xd(%eax)
 8050832:	eb 06                	jmp    0x805083a
 8050834:	8b 04 3a             	mov    (%edx,%edi,1),%eax
 8050837:	fe 40 0d             	incb   0xd(%eax)
 805083a:	ff 4d 90             	decl   0xffffff90(%ebp)
 805083d:	0f 84 98 01 00 00    	je     0x80509db
 8050843:	8b 75 90             	mov    0xffffff90(%ebp),%esi
 8050846:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
 805084d:	8b 5d 84             	mov    0xffffff84(%ebp),%ebx
 8050850:	89 5d 80             	mov    %ebx,0xffffff80(%ebp)
 8050853:	8b 04 19             	mov    (%ecx,%ebx,1),%eax
 8050856:	89 ca                	mov    %ecx,%edx
 8050858:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
 805085c:	74 c2                	je     0x8050820
 805085e:	83 7d 90 00          	cmpl   $0x0,0xffffff90(%ebp)
 8050862:	0f 84 73 01 00 00    	je     0x80509db
 8050868:	8b 75 8c             	mov    0xffffff8c(%ebp),%esi
 805086b:	83 3c 31 00          	cmpl   $0x0,(%ecx,%esi,1)
 805086f:	75 15                	jne    0x8050886
 8050871:	8b 5d 84             	mov    0xffffff84(%ebp),%ebx
 8050874:	8b 04 19             	mov    (%ecx,%ebx,1),%eax
 8050877:	8a 50 0d             	mov    0xd(%eax),%dl
 805087a:	88 d3                	mov    %dl,%bl
 805087c:	fe cb                	dec    %bl
 805087e:	88 58 0d             	mov    %bl,0xd(%eax)
 8050881:	80 fa 01             	cmp    $0x1,%dl
 8050884:	75 29                	jne    0x80508af
 8050886:	8b b5 7c ff ff ff    	mov    0xffffff7c(%ebp),%esi
 805088c:	83 3c 31 01          	cmpl   $0x1,(%ecx,%esi,1)
 8050890:	0f 85 45 01 00 00    	jne    0x80509db
 8050896:	8b 5d 84             	mov    0xffffff84(%ebp),%ebx
 8050899:	8b 04 19             	mov    (%ecx,%ebx,1),%eax
 805089c:	8a 50 0d             	mov    0xd(%eax),%dl
 805089f:	88 d3                	mov    %dl,%bl
 80508a1:	fe c3                	inc    %bl
 80508a3:	88 58 0d             	mov    %bl,0xd(%eax)
 80508a6:	80 fa ff             	cmp    $0xff,%dl
 80508a9:	0f 84 2c 01 00 00    	je     0x80509db
 80508af:	8b 75 84             	mov    0xffffff84(%ebp),%esi
 80508b2:	8b 3c 31             	mov    (%ecx,%esi,1),%edi
 80508b5:	8a 47 0d             	mov    0xd(%edi),%al
 80508b8:	3c fe                	cmp    $0xfe,%al
 80508ba:	74 14                	je     0x80508d0
 80508bc:	3c 02                	cmp    $0x2,%al
 80508be:	0f 84 82 00 00 00    	je     0x8050946
 80508c4:	e9 e7 00 00 00       	jmp    0x80509b0
 80508c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80508d0:	8b 5d 90             	mov    0xffffff90(%ebp),%ebx
 80508d3:	8b 75 8c             	mov    0xffffff8c(%ebp),%esi
 80508d6:	8b 44 9e 04          	mov    0x4(%esi,%ebx,4),%eax
 80508da:	85 c0                	test   %eax,%eax
 80508dc:	74 07                	je     0x80508e5
 80508de:	83 f8 01             	cmp    $0x1,%eax
 80508e1:	74 1d                	je     0x8050900
 80508e3:	eb 5c                	jmp    0x8050941
 80508e5:	89 f9                	mov    %edi,%ecx
 80508e7:	8b 11                	mov    (%ecx),%edx
 80508e9:	8b 5a 04             	mov    0x4(%edx),%ebx
 80508ec:	89 4a 04             	mov    %ecx,0x4(%edx)
 80508ef:	89 19                	mov    %ebx,(%ecx)
 80508f1:	c6 41 0d 00          	movb   $0x0,0xd(%ecx)
 80508f5:	c6 42 0d 00          	movb   $0x0,0xd(%edx)
 80508f9:	e9 b7 00 00 00       	jmp    0x80509b5
 80508fe:	89 f6                	mov    %esi,%esi
 8050900:	89 f9                	mov    %edi,%ecx
 8050902:	8b 31                	mov    (%ecx),%esi
 8050904:	89 b5 7c ff ff ff    	mov    %esi,0xffffff7c(%ebp)
 805090a:	8b 56 04             	mov    0x4(%esi),%edx
 805090d:	8b 5a 04             	mov    0x4(%edx),%ebx
 8050910:	8b 02                	mov    (%edx),%eax
 8050912:	89 32                	mov    %esi,(%edx)
 8050914:	89 46 04             	mov    %eax,0x4(%esi)
 8050917:	89 4a 04             	mov    %ecx,0x4(%edx)
 805091a:	89 19                	mov    %ebx,(%ecx)
 805091c:	80 7a 0d 01          	cmpb   $0x1,0xd(%edx)
 8050920:	75 04                	jne    0x8050926
 8050922:	b0 ff                	mov    $0xff,%al
 8050924:	eb 02                	jmp    0x8050928
 8050926:	31 c0                	xor    %eax,%eax
 8050928:	8b b5 7c ff ff ff    	mov    0xffffff7c(%ebp),%esi
 805092e:	88 46 0d             	mov    %al,0xd(%esi)
 8050931:	80 7a 0d ff          	cmpb   $0xff,0xd(%edx)
 8050935:	0f 94 c0             	sete   %al
 8050938:	88 47 0d             	mov    %al,0xd(%edi)
 805093b:	c6 42 0d 00          	movb   $0x0,0xd(%edx)
 805093f:	eb 74                	jmp    0x80509b5
 8050941:	e8 06 87 ff ff       	call   0x804904c
 8050946:	8b 5d 90             	mov    0xffffff90(%ebp),%ebx
 8050949:	8b 75 8c             	mov    0xffffff8c(%ebp),%esi
 805094c:	8b 44 9e 04          	mov    0x4(%esi,%ebx,4),%eax
 8050950:	85 c0                	test   %eax,%eax
 8050952:	74 1c                	je     0x8050970
 8050954:	83 f8 01             	cmp    $0x1,%eax
 8050957:	75 4c                	jne    0x80509a5
 8050959:	8b 57 04             	mov    0x4(%edi),%edx
 805095c:	8b 02                	mov    (%edx),%eax
 805095e:	89 3a                	mov    %edi,(%edx)
 8050960:	89 47 04             	mov    %eax,0x4(%edi)
 8050963:	c6 47 0d 00          	movb   $0x0,0xd(%edi)
 8050967:	c6 42 0d 00          	movb   $0x0,0xd(%edx)
 805096b:	eb 48                	jmp    0x80509b5
 805096d:	8d 76 00             	lea    0x0(%esi),%esi
 8050970:	8b 4f 04             	mov    0x4(%edi),%ecx
 8050973:	8b 11                	mov    (%ecx),%edx
 8050975:	8b 02                	mov    (%edx),%eax
 8050977:	8b 5a 04             	mov    0x4(%edx),%ebx
 805097a:	89 3a                	mov    %edi,(%edx)
 805097c:	89 47 04             	mov    %eax,0x4(%edi)
 805097f:	89 4a 04             	mov    %ecx,0x4(%edx)
 8050982:	89 19                	mov    %ebx,(%ecx)
 8050984:	80 7a 0d 01          	cmpb   $0x1,0xd(%edx)
 8050988:	75 06                	jne    0x8050990
 805098a:	b0 ff                	mov    $0xff,%al
 805098c:	eb 04                	jmp    0x8050992
 805098e:	89 f6                	mov    %esi,%esi
 8050990:	31 c0                	xor    %eax,%eax
 8050992:	88 47 0d             	mov    %al,0xd(%edi)
 8050995:	80 7a 0d ff          	cmpb   $0xff,0xd(%edx)
 8050999:	0f 94 c0             	sete   %al
 805099c:	88 41 0d             	mov    %al,0xd(%ecx)
 805099f:	c6 42 0d 00          	movb   $0x0,0xd(%edx)
 80509a3:	eb 10                	jmp    0x80509b5
 80509a5:	e8 a2 86 ff ff       	call   0x804904c
 80509aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80509b0:	e8 97 86 ff ff       	call   0x804904c
 80509b5:	8b 75 90             	mov    0xffffff90(%ebp),%esi
 80509b8:	8d 04 b5 fc ff ff ff 	lea    0xfffffffc(,%esi,4),%eax
 80509bf:	8b 5d 8c             	mov    0xffffff8c(%ebp),%ebx
 80509c2:	83 3c 18 00          	cmpl   $0x0,(%eax,%ebx,1)
 80509c6:	75 0a                	jne    0x80509d2
 80509c8:	8b 75 84             	mov    0xffffff84(%ebp),%esi
 80509cb:	8b 04 30             	mov    (%eax,%esi,1),%eax
 80509ce:	89 10                	mov    %edx,(%eax)
 80509d0:	eb 09                	jmp    0x80509db
 80509d2:	8b 5d 84             	mov    0xffffff84(%ebp),%ebx
 80509d5:	8b 04 18             	mov    (%eax,%ebx,1),%eax
 80509d8:	89 50 04             	mov    %edx,0x4(%eax)
 80509db:	8b 75 94             	mov    0xffffff94(%ebp),%esi
 80509de:	8b 7e 08             	mov    0x8(%esi),%edi
 80509e1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 80509e5:	0f 83 4d fb ff ff    	jae    0x8050538
 80509eb:	83 3f 00             	cmpl   $0x0,(%edi)
 80509ee:	75 0e                	jne    0x80509fe
 80509f0:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80509f3:	8b 5b 2c             	mov    0x2c(%ebx),%ebx
 80509f6:	89 d8                	mov    %ebx,%eax
 80509f8:	01 d8                	add    %ebx,%eax
 80509fa:	0c 01                	or     $0x1,%al
 80509fc:	89 07                	mov    %eax,(%edi)
 80509fe:	8b 75 08             	mov    0x8(%ebp),%esi
 8050a01:	ff 46 2c             	incl   0x2c(%esi)
 8050a04:	8b 47 14             	mov    0x14(%edi),%eax
 8050a07:	3b 46 34             	cmp    0x34(%esi),%eax
 8050a0a:	7d 06                	jge    0x8050a12
 8050a0c:	89 46 34             	mov    %eax,0x34(%esi)
 8050a0f:	8b 47 14             	mov    0x14(%edi),%eax
 8050a12:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8050a15:	3b 43 38             	cmp    0x38(%ebx),%eax
 8050a18:	7e 03                	jle    0x8050a1d
 8050a1a:	89 43 38             	mov    %eax,0x38(%ebx)
 8050a1d:	31 c0                	xor    %eax,%eax
 8050a1f:	8d a5 70 ff ff ff    	lea    0xffffff70(%ebp),%esp
 8050a25:	5b                   	pop    %ebx
 8050a26:	5e                   	pop    %esi
 8050a27:	5f                   	pop    %edi
 8050a28:	89 ec                	mov    %ebp,%esp
 8050a2a:	5d                   	pop    %ebp
 8050a2b:	c3                   	ret    
 8050a2c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050a30:	55                   	push   %ebp
 8050a31:	89 e5                	mov    %esp,%ebp
 8050a33:	56                   	push   %esi
 8050a34:	53                   	push   %ebx
 8050a35:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8050a38:	8b 75 0c             	mov    0xc(%ebp),%esi
 8050a3b:	85 db                	test   %ebx,%ebx
 8050a3d:	74 1d                	je     0x8050a5c
 8050a3f:	56                   	push   %esi
 8050a40:	8b 03                	mov    (%ebx),%eax
 8050a42:	50                   	push   %eax
 8050a43:	e8 e8 ff ff ff       	call   0x8050a30
 8050a48:	56                   	push   %esi
 8050a49:	8b 43 04             	mov    0x4(%ebx),%eax
 8050a4c:	50                   	push   %eax
 8050a4d:	e8 de ff ff ff       	call   0x8050a30
 8050a52:	8b 16                	mov    (%esi),%edx
 8050a54:	8b 43 08             	mov    0x8(%ebx),%eax
 8050a57:	89 42 0c             	mov    %eax,0xc(%edx)
 8050a5a:	89 06                	mov    %eax,(%esi)
 8050a5c:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8050a5f:	5b                   	pop    %ebx
 8050a60:	5e                   	pop    %esi
 8050a61:	89 ec                	mov    %ebp,%esp
 8050a63:	5d                   	pop    %ebp
 8050a64:	c3                   	ret    
 8050a65:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8050a70:	55                   	push   %ebp
 8050a71:	89 e5                	mov    %esp,%ebp
 8050a73:	57                   	push   %edi
 8050a74:	56                   	push   %esi
 8050a75:	53                   	push   %ebx
 8050a76:	8b 75 08             	mov    0x8(%ebp),%esi
 8050a79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8050a7c:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050a7f:	85 f6                	test   %esi,%esi
 8050a81:	74 60                	je     0x8050ae3
 8050a83:	57                   	push   %edi
 8050a84:	53                   	push   %ebx
 8050a85:	8b 06                	mov    (%esi),%eax
 8050a87:	50                   	push   %eax
 8050a88:	e8 e3 ff ff ff       	call   0x8050a70
 8050a8d:	57                   	push   %edi
 8050a8e:	53                   	push   %ebx
 8050a8f:	8b 46 04             	mov    0x4(%esi),%eax
 8050a92:	50                   	push   %eax
 8050a93:	e8 d8 ff ff ff       	call   0x8050a70
 8050a98:	85 db                	test   %ebx,%ebx
 8050a9a:	74 41                	je     0x8050add
 8050a9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050aa0:	8b 4b 04             	mov    0x4(%ebx),%ecx
 8050aa3:	85 c9                	test   %ecx,%ecx
 8050aa5:	74 2f                	je     0x8050ad6
 8050aa7:	8a 56 0c             	mov    0xc(%esi),%dl
 8050aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050ab0:	8a 41 0c             	mov    0xc(%ecx),%al
 8050ab3:	38 c2                	cmp    %al,%dl
 8050ab5:	74 10                	je     0x8050ac7
 8050ab7:	73 07                	jae    0x8050ac0
 8050ab9:	8b 09                	mov    (%ecx),%ecx
 8050abb:	eb 06                	jmp    0x8050ac3
 8050abd:	8d 76 00             	lea    0x0(%esi),%esi
 8050ac0:	8b 49 04             	mov    0x4(%ecx),%ecx
 8050ac3:	85 c9                	test   %ecx,%ecx
 8050ac5:	75 e9                	jne    0x8050ab0
 8050ac7:	85 c9                	test   %ecx,%ecx
 8050ac9:	74 0b                	je     0x8050ad6
 8050acb:	8b 56 08             	mov    0x8(%esi),%edx
 8050ace:	8b 41 08             	mov    0x8(%ecx),%eax
 8050ad1:	89 42 10             	mov    %eax,0x10(%edx)
 8050ad4:	eb 0d                	jmp    0x8050ae3
 8050ad6:	8b 5b 10             	mov    0x10(%ebx),%ebx
 8050ad9:	85 db                	test   %ebx,%ebx
 8050adb:	75 c3                	jne    0x8050aa0
 8050add:	8b 46 08             	mov    0x8(%esi),%eax
 8050ae0:	89 78 10             	mov    %edi,0x10(%eax)
 8050ae3:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8050ae6:	5b                   	pop    %ebx
 8050ae7:	5e                   	pop    %esi
 8050ae8:	5f                   	pop    %edi
 8050ae9:	89 ec                	mov    %ebp,%esp
 8050aeb:	5d                   	pop    %ebp
 8050aec:	c3                   	ret    
 8050aed:	8d 76 00             	lea    0x0(%esi),%esi
 8050af0:	55                   	push   %ebp
 8050af1:	89 e5                	mov    %esp,%ebp
 8050af3:	57                   	push   %edi
 8050af4:	56                   	push   %esi
 8050af5:	53                   	push   %ebx
 8050af6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8050af9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8050afc:	8b 75 10             	mov    0x10(%ebp),%esi
 8050aff:	85 db                	test   %ebx,%ebx
 8050b01:	74 28                	je     0x8050b2b
 8050b03:	56                   	push   %esi
 8050b04:	57                   	push   %edi
 8050b05:	8b 03                	mov    (%ebx),%eax
 8050b07:	50                   	push   %eax
 8050b08:	e8 e3 ff ff ff       	call   0x8050af0
 8050b0d:	56                   	push   %esi
 8050b0e:	57                   	push   %edi
 8050b0f:	8b 43 04             	mov    0x4(%ebx),%eax
 8050b12:	50                   	push   %eax
 8050b13:	e8 d8 ff ff ff       	call   0x8050af0
 8050b18:	31 d2                	xor    %edx,%edx
 8050b1a:	8a 53 0c             	mov    0xc(%ebx),%dl
 8050b1d:	31 c0                	xor    %eax,%eax
 8050b1f:	8a 04 32             	mov    (%edx,%esi,1),%al
 8050b22:	39 c7                	cmp    %eax,%edi
 8050b24:	73 05                	jae    0x8050b2b
 8050b26:	89 f9                	mov    %edi,%ecx
 8050b28:	88 0c 32             	mov    %cl,(%edx,%esi,1)
 8050b2b:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8050b2e:	5b                   	pop    %ebx
 8050b2f:	5e                   	pop    %esi
 8050b30:	5f                   	pop    %edi
 8050b31:	89 ec                	mov    %ebp,%esp
 8050b33:	5d                   	pop    %ebp
 8050b34:	c3                   	ret    
 8050b35:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8050b40:	55                   	push   %ebp
 8050b41:	89 e5                	mov    %esp,%ebp
 8050b43:	56                   	push   %esi
 8050b44:	53                   	push   %ebx
 8050b45:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8050b48:	8b 75 0c             	mov    0xc(%ebp),%esi
 8050b4b:	85 f6                	test   %esi,%esi
 8050b4d:	75 07                	jne    0x8050b56
 8050b4f:	b8 01 00 00 00       	mov    $0x1,%eax
 8050b54:	eb 4b                	jmp    0x8050ba1
 8050b56:	8b 06                	mov    (%esi),%eax
 8050b58:	50                   	push   %eax
 8050b59:	53                   	push   %ebx
 8050b5a:	e8 e1 ff ff ff       	call   0x8050b40
 8050b5f:	83 c4 08             	add    $0x8,%esp
 8050b62:	85 c0                	test   %eax,%eax
 8050b64:	74 0e                	je     0x8050b74
 8050b66:	8b 46 04             	mov    0x4(%esi),%eax
 8050b69:	50                   	push   %eax
 8050b6a:	53                   	push   %ebx
 8050b6b:	e8 d0 ff ff ff       	call   0x8050b40
 8050b70:	85 c0                	test   %eax,%eax
 8050b72:	75 04                	jne    0x8050b78
 8050b74:	31 c0                	xor    %eax,%eax
 8050b76:	eb 29                	jmp    0x8050ba1
 8050b78:	85 db                	test   %ebx,%ebx
 8050b7a:	74 1b                	je     0x8050b97
 8050b7c:	8a 46 0c             	mov    0xc(%esi),%al
 8050b7f:	90                   	nop    
 8050b80:	8a 53 0c             	mov    0xc(%ebx),%dl
 8050b83:	38 d0                	cmp    %dl,%al
 8050b85:	74 10                	je     0x8050b97
 8050b87:	73 07                	jae    0x8050b90
 8050b89:	8b 1b                	mov    (%ebx),%ebx
 8050b8b:	eb 06                	jmp    0x8050b93
 8050b8d:	8d 76 00             	lea    0x0(%esi),%esi
 8050b90:	8b 5b 04             	mov    0x4(%ebx),%ebx
 8050b93:	85 db                	test   %ebx,%ebx
 8050b95:	75 e9                	jne    0x8050b80
 8050b97:	85 db                	test   %ebx,%ebx
 8050b99:	0f 95 c0             	setne  %al
 8050b9c:	25 ff 00 00 00       	and    $0xff,%eax
 8050ba1:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8050ba4:	5b                   	pop    %ebx
 8050ba5:	5e                   	pop    %esi
 8050ba6:	89 ec                	mov    %ebp,%esp
 8050ba8:	5d                   	pop    %ebp
 8050ba9:	c3                   	ret    
 8050baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050bb0:	55                   	push   %ebp
 8050bb1:	89 e5                	mov    %esp,%ebp
 8050bb3:	56                   	push   %esi
 8050bb4:	53                   	push   %ebx
 8050bb5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8050bb8:	8b 75 0c             	mov    0xc(%ebp),%esi
 8050bbb:	85 db                	test   %ebx,%ebx
 8050bbd:	74 1e                	je     0x8050bdd
 8050bbf:	56                   	push   %esi
 8050bc0:	8b 03                	mov    (%ebx),%eax
 8050bc2:	50                   	push   %eax
 8050bc3:	e8 e8 ff ff ff       	call   0x8050bb0
 8050bc8:	56                   	push   %esi
 8050bc9:	8b 43 04             	mov    0x4(%ebx),%eax
 8050bcc:	50                   	push   %eax
 8050bcd:	e8 de ff ff ff       	call   0x8050bb0
 8050bd2:	31 d2                	xor    %edx,%edx
 8050bd4:	8a 53 0c             	mov    0xc(%ebx),%dl
 8050bd7:	8b 43 08             	mov    0x8(%ebx),%eax
 8050bda:	89 04 96             	mov    %eax,(%esi,%edx,4)
 8050bdd:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8050be0:	5b                   	pop    %ebx
 8050be1:	5e                   	pop    %esi
 8050be2:	89 ec                	mov    %ebp,%esp
 8050be4:	5d                   	pop    %ebp
 8050be5:	c3                   	ret    
 8050be6:	8d 76 00             	lea    0x0(%esi),%esi
 8050be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8050bf0:	55                   	push   %ebp
 8050bf1:	89 e5                	mov    %esp,%ebp
 8050bf3:	81 ec 10 05 00 00    	sub    $0x510,%esp
 8050bf9:	57                   	push   %edi
 8050bfa:	56                   	push   %esi
 8050bfb:	53                   	push   %ebx
 8050bfc:	8b 7d 08             	mov    0x8(%ebp),%edi
 8050bff:	81 7f 34 ff 00 00 00 	cmpl   $0xff,0x34(%edi)
 8050c06:	7f 28                	jg     0x8050c30
 8050c08:	31 c9                	xor    %ecx,%ecx
 8050c0a:	8d 9d 00 ff ff ff    	lea    0xffffff00(%ebp),%ebx
 8050c10:	89 9d f4 fa ff ff    	mov    %ebx,0xfffffaf4(%ebp)
 8050c16:	89 da                	mov    %ebx,%edx
 8050c18:	8a 47 34             	mov    0x34(%edi),%al
 8050c1b:	88 04 11             	mov    %al,(%ecx,%edx,1)
 8050c1e:	41                   	inc    %ecx
 8050c1f:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050c25:	7e f1                	jle    0x8050c18
 8050c27:	eb 24                	jmp    0x8050c4d
 8050c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8050c30:	31 c9                	xor    %ecx,%ecx
 8050c32:	8d 9d 00 ff ff ff    	lea    0xffffff00(%ebp),%ebx
 8050c38:	89 9d f4 fa ff ff    	mov    %ebx,0xfffffaf4(%ebp)
 8050c3e:	89 d8                	mov    %ebx,%eax
 8050c40:	c6 04 01 ff          	movb   $0xff,(%ecx,%eax,1)
 8050c44:	41                   	inc    %ecx
 8050c45:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050c4b:	7e f3                	jle    0x8050c40
 8050c4d:	83 7f 2c 01          	cmpl   $0x1,0x2c(%edi)
 8050c51:	0f 85 29 01 00 00    	jne    0x8050d80
 8050c57:	83 bf 44 05 00 00 00 	cmpl   $0x0,0x544(%edi)
 8050c5e:	0f 85 1c 01 00 00    	jne    0x8050d80
 8050c64:	8b 77 34             	mov    0x34(%edi),%esi
 8050c67:	8b 57 0c             	mov    0xc(%edi),%edx
 8050c6a:	8b 47 10             	mov    0x10(%edi),%eax
 8050c6d:	29 d0                	sub    %edx,%eax
 8050c6f:	39 f0                	cmp    %esi,%eax
 8050c71:	7d 0a                	jge    0x8050c7d
 8050c73:	56                   	push   %esi
 8050c74:	57                   	push   %edi
 8050c75:	e8 82 85 ff ff       	call   0x80491fc
 8050c7a:	8b 57 0c             	mov    0xc(%edi),%edx
 8050c7d:	8d 04 16             	lea    (%esi,%edx,1),%eax
 8050c80:	89 47 0c             	mov    %eax,0xc(%edi)
 8050c83:	8b 77 08             	mov    0x8(%edi),%esi
 8050c86:	39 f0                	cmp    %esi,%eax
 8050c88:	75 04                	jne    0x8050c8e
 8050c8a:	80 4f 28 02          	orb    $0x2,0x28(%edi)
 8050c8e:	8b 47 18             	mov    0x18(%edi),%eax
 8050c91:	89 c2                	mov    %eax,%edx
 8050c93:	03 57 0c             	add    0xc(%edi),%edx
 8050c96:	f7 d0                	not    %eax
 8050c98:	21 c2                	and    %eax,%edx
 8050c9a:	89 57 0c             	mov    %edx,0xc(%edi)
 8050c9d:	8b 4f 04             	mov    0x4(%edi),%ecx
 8050ca0:	29 ca                	sub    %ecx,%edx
 8050ca2:	8b 5f 10             	mov    0x10(%edi),%ebx
 8050ca5:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050cab:	89 d8                	mov    %ebx,%eax
 8050cad:	29 c8                	sub    %ecx,%eax
 8050caf:	39 c2                	cmp    %eax,%edx
 8050cb1:	7e 03                	jle    0x8050cb6
 8050cb3:	89 5f 0c             	mov    %ebx,0xc(%edi)
 8050cb6:	8b 47 0c             	mov    0xc(%edi),%eax
 8050cb9:	89 47 08             	mov    %eax,0x8(%edi)
 8050cbc:	89 b7 3c 05 00 00    	mov    %esi,0x53c(%edi)
 8050cc2:	8b 4f 34             	mov    0x34(%edi),%ecx
 8050cc5:	49                   	dec    %ecx
 8050cc6:	8b 77 30             	mov    0x30(%edi),%esi
 8050cc9:	78 1d                	js     0x8050ce8
 8050ccb:	90                   	nop    
 8050ccc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050cd0:	8b 46 04             	mov    0x4(%esi),%eax
 8050cd3:	8b 97 3c 05 00 00    	mov    0x53c(%edi),%edx
 8050cd9:	8a 40 0c             	mov    0xc(%eax),%al
 8050cdc:	88 04 11             	mov    %al,(%ecx,%edx,1)
 8050cdf:	8b 46 04             	mov    0x4(%esi),%eax
 8050ce2:	8b 70 08             	mov    0x8(%eax),%esi
 8050ce5:	49                   	dec    %ecx
 8050ce6:	79 e8                	jns    0x8050cd0
 8050ce8:	31 c9                	xor    %ecx,%ecx
 8050cea:	8b 5f 34             	mov    0x34(%edi),%ebx
 8050ced:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050cf3:	39 d9                	cmp    %ebx,%ecx
 8050cf5:	7d 29                	jge    0x8050d20
 8050cf7:	8b b5 f4 fa ff ff    	mov    0xfffffaf4(%ebp),%esi
 8050cfd:	8d 76 00             	lea    0x0(%esi),%esi
 8050d00:	8b 87 3c 05 00 00    	mov    0x53c(%edi),%eax
 8050d06:	31 d2                	xor    %edx,%edx
 8050d08:	8a 5f 34             	mov    0x34(%edi),%bl
 8050d0b:	8a 14 01             	mov    (%ecx,%eax,1),%dl
 8050d0e:	88 c8                	mov    %cl,%al
 8050d10:	fe c0                	inc    %al
 8050d12:	28 c3                	sub    %al,%bl
 8050d14:	88 1c 32             	mov    %bl,(%edx,%esi,1)
 8050d17:	41                   	inc    %ecx
 8050d18:	3b 8d f0 fa ff ff    	cmp    0xfffffaf0(%ebp),%ecx
 8050d1e:	7c e0                	jl     0x8050d00
 8050d20:	8b 47 34             	mov    0x34(%edi),%eax
 8050d23:	89 87 40 05 00 00    	mov    %eax,0x540(%edi)
 8050d29:	31 c9                	xor    %ecx,%ecx
 8050d2b:	8d 50 ff             	lea    0xffffffff(%eax),%edx
 8050d2e:	39 d1                	cmp    %edx,%ecx
 8050d30:	0f 8d e6 01 00 00    	jge    0x8050f1c
 8050d36:	8b 9f 3c 05 00 00    	mov    0x53c(%edi),%ebx
 8050d3c:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050d42:	89 85 f8 fa ff ff    	mov    %eax,0xfffffaf8(%ebp)
 8050d48:	89 d6                	mov    %edx,%esi
 8050d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8050d50:	8b 95 f8 fa ff ff    	mov    0xfffffaf8(%ebp),%edx
 8050d56:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050d5c:	8a 44 13 ff          	mov    0xffffffff(%ebx,%edx,1),%al
 8050d60:	38 04 19             	cmp    %al,(%ecx,%ebx,1)
 8050d63:	75 0d                	jne    0x8050d72
 8050d65:	89 f3                	mov    %esi,%ebx
 8050d67:	29 cb                	sub    %ecx,%ebx
 8050d69:	89 9f 40 05 00 00    	mov    %ebx,0x540(%edi)
 8050d6f:	8b 57 34             	mov    0x34(%edi),%edx
 8050d72:	41                   	inc    %ecx
 8050d73:	8d 42 ff             	lea    0xffffffff(%edx),%eax
 8050d76:	39 c1                	cmp    %eax,%ecx
 8050d78:	7c d6                	jl     0x8050d50
 8050d7a:	e9 9d 01 00 00       	jmp    0x8050f1c
 8050d7f:	90                   	nop    
 8050d80:	8b 47 30             	mov    0x30(%edi),%eax
 8050d83:	89 85 fc fa ff ff    	mov    %eax,0xfffffafc(%ebp)
 8050d89:	89 c6                	mov    %eax,%esi
 8050d8b:	85 f6                	test   %esi,%esi
 8050d8d:	0f 84 c4 00 00 00    	je     0x8050e57
 8050d93:	8d 85 fc fa ff ff    	lea    0xfffffafc(%ebp),%eax
 8050d99:	50                   	push   %eax
 8050d9a:	8b 46 04             	mov    0x4(%esi),%eax
 8050d9d:	50                   	push   %eax
 8050d9e:	e8 8d fc ff ff       	call   0x8050a30
 8050da3:	8b 47 34             	mov    0x34(%edi),%eax
 8050da6:	89 46 18             	mov    %eax,0x18(%esi)
 8050da9:	8b 47 34             	mov    0x34(%edi),%eax
 8050dac:	89 46 1c             	mov    %eax,0x1c(%esi)
 8050daf:	8b 9d f4 fa ff ff    	mov    0xfffffaf4(%ebp),%ebx
 8050db5:	53                   	push   %ebx
 8050db6:	8b 46 14             	mov    0x14(%esi),%eax
 8050db9:	50                   	push   %eax
 8050dba:	8b 46 04             	mov    0x4(%esi),%eax
 8050dbd:	50                   	push   %eax
 8050dbe:	e8 2d fd ff ff       	call   0x8050af0
 8050dc3:	8b 47 30             	mov    0x30(%edi),%eax
 8050dc6:	50                   	push   %eax
 8050dc7:	8b 46 10             	mov    0x10(%esi),%eax
 8050dca:	50                   	push   %eax
 8050dcb:	8b 46 04             	mov    0x4(%esi),%eax
 8050dce:	50                   	push   %eax
 8050dcf:	e8 9c fc ff ff       	call   0x8050a70
 8050dd4:	8b 5e 10             	mov    0x10(%esi),%ebx
 8050dd7:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050ddd:	83 c4 20             	add    $0x20,%esp
 8050de0:	85 db                	test   %ebx,%ebx
 8050de2:	74 68                	je     0x8050e4c
 8050de4:	8b 46 04             	mov    0x4(%esi),%eax
 8050de7:	50                   	push   %eax
 8050de8:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050dee:	8b 43 04             	mov    0x4(%ebx),%eax
 8050df1:	50                   	push   %eax
 8050df2:	e8 49 fd ff ff       	call   0x8050b40
 8050df7:	83 c4 08             	add    $0x8,%esp
 8050dfa:	85 c0                	test   %eax,%eax
 8050dfc:	75 18                	jne    0x8050e16
 8050dfe:	8b 43 14             	mov    0x14(%ebx),%eax
 8050e01:	8b 5e 14             	mov    0x14(%esi),%ebx
 8050e04:	29 c3                	sub    %eax,%ebx
 8050e06:	89 d8                	mov    %ebx,%eax
 8050e08:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050e0e:	3b 43 18             	cmp    0x18(%ebx),%eax
 8050e11:	7d 03                	jge    0x8050e16
 8050e13:	89 43 18             	mov    %eax,0x18(%ebx)
 8050e16:	83 3e 00             	cmpl   $0x0,(%esi)
 8050e19:	74 1e                	je     0x8050e39
 8050e1b:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050e21:	8b 43 14             	mov    0x14(%ebx),%eax
 8050e24:	8b 5e 14             	mov    0x14(%esi),%ebx
 8050e27:	29 c3                	sub    %eax,%ebx
 8050e29:	89 d8                	mov    %ebx,%eax
 8050e2b:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050e31:	39 43 1c             	cmp    %eax,0x1c(%ebx)
 8050e34:	7e 03                	jle    0x8050e39
 8050e36:	89 43 1c             	mov    %eax,0x1c(%ebx)
 8050e39:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050e3f:	8b 5b 10             	mov    0x10(%ebx),%ebx
 8050e42:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050e48:	85 db                	test   %ebx,%ebx
 8050e4a:	75 98                	jne    0x8050de4
 8050e4c:	8b 76 0c             	mov    0xc(%esi),%esi
 8050e4f:	85 f6                	test   %esi,%esi
 8050e51:	0f 85 3c ff ff ff    	jne    0x8050d93
 8050e57:	8b 47 30             	mov    0x30(%edi),%eax
 8050e5a:	8b 70 0c             	mov    0xc(%eax),%esi
 8050e5d:	85 f6                	test   %esi,%esi
 8050e5f:	74 21                	je     0x8050e82
 8050e61:	8b 46 08             	mov    0x8(%esi),%eax
 8050e64:	8b 56 1c             	mov    0x1c(%esi),%edx
 8050e67:	8b 40 1c             	mov    0x1c(%eax),%eax
 8050e6a:	39 c2                	cmp    %eax,%edx
 8050e6c:	7e 05                	jle    0x8050e73
 8050e6e:	89 46 1c             	mov    %eax,0x1c(%esi)
 8050e71:	89 c2                	mov    %eax,%edx
 8050e73:	39 56 18             	cmp    %edx,0x18(%esi)
 8050e76:	7e 03                	jle    0x8050e7b
 8050e78:	89 56 18             	mov    %edx,0x18(%esi)
 8050e7b:	8b 76 0c             	mov    0xc(%esi),%esi
 8050e7e:	85 f6                	test   %esi,%esi
 8050e80:	75 df                	jne    0x8050e61
 8050e82:	31 c9                	xor    %ecx,%ecx
 8050e84:	8d 9d 00 fb ff ff    	lea    0xfffffb00(%ebp),%ebx
 8050e8a:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050e90:	89 d8                	mov    %ebx,%eax
 8050e92:	c7 04 88 00 00 00 00 	movl   $0x0,(%eax,%ecx,4)
 8050e99:	41                   	inc    %ecx
 8050e9a:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050ea0:	7e f0                	jle    0x8050e92
 8050ea2:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050ea8:	53                   	push   %ebx
 8050ea9:	8b 47 30             	mov    0x30(%edi),%eax
 8050eac:	8b 40 04             	mov    0x4(%eax),%eax
 8050eaf:	50                   	push   %eax
 8050eb0:	e8 fb fc ff ff       	call   0x8050bb0
 8050eb5:	8b 97 44 05 00 00    	mov    0x544(%edi),%edx
 8050ebb:	85 d2                	test   %edx,%edx
 8050ebd:	74 31                	je     0x8050ef0
 8050ebf:	31 c9                	xor    %ecx,%ecx
 8050ec1:	8d b7 3c 01 00 00    	lea    0x13c(%edi),%esi
 8050ec7:	89 9d f0 fa ff ff    	mov    %ebx,0xfffffaf0(%ebp)
 8050ecd:	8d 76 00             	lea    0x0(%esi),%esi
 8050ed0:	31 c0                	xor    %eax,%eax
 8050ed2:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050ed8:	8a 04 11             	mov    (%ecx,%edx,1),%al
 8050edb:	8b 04 83             	mov    (%ebx,%eax,4),%eax
 8050ede:	89 04 8e             	mov    %eax,(%esi,%ecx,4)
 8050ee1:	41                   	inc    %ecx
 8050ee2:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050ee8:	7e e6                	jle    0x8050ed0
 8050eea:	eb 30                	jmp    0x8050f1c
 8050eec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8050ef0:	31 c9                	xor    %ecx,%ecx
 8050ef2:	8d b7 3c 01 00 00    	lea    0x13c(%edi),%esi
 8050ef8:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050efe:	89 f6                	mov    %esi,%esi
 8050f00:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
 8050f07:	8b 9d f0 fa ff ff    	mov    0xfffffaf0(%ebp),%ebx
 8050f0d:	41                   	inc    %ecx
 8050f0e:	8b 04 1a             	mov    (%edx,%ebx,1),%eax
 8050f11:	89 04 32             	mov    %eax,(%edx,%esi,1)
 8050f14:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050f1a:	7e e4                	jle    0x8050f00
 8050f1c:	8b 97 44 05 00 00    	mov    0x544(%edi),%edx
 8050f22:	85 d2                	test   %edx,%edx
 8050f24:	74 21                	je     0x8050f47
 8050f26:	31 c9                	xor    %ecx,%ecx
 8050f28:	8d 77 3c             	lea    0x3c(%edi),%esi
 8050f2b:	8b bd f4 fa ff ff    	mov    0xfffffaf4(%ebp),%edi
 8050f31:	31 c0                	xor    %eax,%eax
 8050f33:	8a 04 11             	mov    (%ecx,%edx,1),%al
 8050f36:	8a 04 38             	mov    (%eax,%edi,1),%al
 8050f39:	88 04 31             	mov    %al,(%ecx,%esi,1)
 8050f3c:	41                   	inc    %ecx
 8050f3d:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050f43:	7e ec                	jle    0x8050f31
 8050f45:	eb 1a                	jmp    0x8050f61
 8050f47:	31 c9                	xor    %ecx,%ecx
 8050f49:	8d 77 3c             	lea    0x3c(%edi),%esi
 8050f4c:	8b 95 f4 fa ff ff    	mov    0xfffffaf4(%ebp),%edx
 8050f52:	8a 04 11             	mov    (%ecx,%edx,1),%al
 8050f55:	88 04 31             	mov    %al,(%ecx,%esi,1)
 8050f58:	41                   	inc    %ecx
 8050f59:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
 8050f5f:	7e f1                	jle    0x8050f52
 8050f61:	8d a5 e4 fa ff ff    	lea    0xfffffae4(%ebp),%esp
 8050f67:	31 c0                	xor    %eax,%eax
 8050f69:	5b                   	pop    %ebx
 8050f6a:	5e                   	pop    %esi
 8050f6b:	5f                   	pop    %edi
 8050f6c:	89 ec                	mov    %ebp,%esp
 8050f6e:	5d                   	pop    %ebp
 8050f6f:	c3                   	ret    
 8050f70:	55                   	push   %ebp
 8050f71:	89 e5                	mov    %esp,%ebp
 8050f73:	83 ec 18             	sub    $0x18,%esp
 8050f76:	57                   	push   %edi
 8050f77:	56                   	push   %esi
 8050f78:	53                   	push   %ebx
 8050f79:	8b 45 08             	mov    0x8(%ebp),%eax
 8050f7c:	8b 58 34             	mov    0x34(%eax),%ebx
 8050f7f:	89 5d e8             	mov    %ebx,0xffffffe8(%ebp)
 8050f82:	85 db                	test   %ebx,%ebx
 8050f84:	75 0a                	jne    0x8050f90
 8050f86:	8b 45 0c             	mov    0xc(%ebp),%eax
 8050f89:	e9 f0 01 00 00       	jmp    0x805117e
 8050f8e:	89 f6                	mov    %esi,%esi
 8050f90:	8b 7d 10             	mov    0x10(%ebp),%edi
 8050f93:	39 7d e8             	cmp    %edi,0xffffffe8(%ebp)
 8050f96:	0f 87 e0 01 00 00    	ja     0x805117c
 8050f9c:	83 7d e8 01          	cmpl   $0x1,0xffffffe8(%ebp)
 8050fa0:	75 1e                	jne    0x8050fc0
 8050fa2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8050fa5:	53                   	push   %ebx
 8050fa6:	8b 80 3c 05 00 00    	mov    0x53c(%eax),%eax
 8050fac:	0f be 00             	movsbl (%eax),%eax
 8050faf:	50                   	push   %eax
 8050fb0:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8050fb3:	57                   	push   %edi
 8050fb4:	e8 33 80 ff ff       	call   0x8048fec
 8050fb9:	e9 c0 01 00 00       	jmp    0x805117e
 8050fbe:	89 f6                	mov    %esi,%esi
 8050fc0:	8d 70 3c             	lea    0x3c(%eax),%esi
 8050fc3:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 8050fc6:	89 5d f8             	mov    %ebx,0xfffffff8(%ebp)
 8050fc9:	8b b8 3c 05 00 00    	mov    0x53c(%eax),%edi
 8050fcf:	01 7d f8             	add    %edi,0xfffffff8(%ebp)
 8050fd2:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8050fd5:	31 db                	xor    %ebx,%ebx
 8050fd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8050fda:	03 4d e8             	add    0xffffffe8(%ebp),%ecx
 8050fdd:	8a 5f fe             	mov    0xfffffffe(%edi),%bl
 8050fe0:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 8050fe3:	8b 80 40 05 00 00    	mov    0x540(%eax),%eax
 8050fe9:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 8050fec:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 8050fef:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 8050ff2:	c1 e0 02             	shl    $0x2,%eax
 8050ff5:	39 45 10             	cmp    %eax,0x10(%ebp)
 8050ff8:	0f 86 f8 00 00 00    	jbe    0x80510f6
 8050ffe:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8051001:	03 7d 10             	add    0x10(%ebp),%edi
 8051004:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
 8051007:	8d 04 43             	lea    (%ebx,%eax,2),%eax
 805100a:	29 c7                	sub    %eax,%edi
 805100c:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 805100f:	e9 d9 00 00 00       	jmp    0x80510ed
 8051014:	31 c0                	xor    %eax,%eax
 8051016:	8a 41 fe             	mov    0xfffffffe(%ecx),%al
 8051019:	3b 45 f4             	cmp    0xfffffff4(%ebp),%eax
 805101c:	75 3b                	jne    0x8051059
 805101e:	c7 45 ec 03 00 00 00 	movl   $0x3,0xffffffec(%ebp)
 8051025:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 8051028:	39 5d ec             	cmp    %ebx,0xffffffec(%ebp)
 805102b:	0f 8f 33 01 00 00    	jg     0x8051164
 8051031:	89 ca                	mov    %ecx,%edx
 8051033:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8051036:	2b 45 ec             	sub    0xffffffec(%ebp),%eax
 8051039:	2b 55 ec             	sub    0xffffffec(%ebp),%edx
 805103c:	8a 00                	mov    (%eax),%al
 805103e:	38 02                	cmp    %al,(%edx)
 8051040:	75 0b                	jne    0x805104d
 8051042:	ff 45 ec             	incl   0xffffffec(%ebp)
 8051045:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8051048:	39 7d ec             	cmp    %edi,0xffffffec(%ebp)
 805104b:	7e e4                	jle    0x8051031
 805104d:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 8051050:	39 5d ec             	cmp    %ebx,0xffffffec(%ebp)
 8051053:	0f 8f 0b 01 00 00    	jg     0x8051164
 8051059:	03 4d f0             	add    0xfffffff0(%ebp),%ecx
 805105c:	e9 8c 00 00 00       	jmp    0x80510ed
 8051061:	31 c0                	xor    %eax,%eax
 8051063:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051066:	31 d2                	xor    %edx,%edx
 8051068:	8a 14 30             	mov    (%eax,%esi,1),%dl
 805106b:	01 d1                	add    %edx,%ecx
 805106d:	31 c0                	xor    %eax,%eax
 805106f:	31 d2                	xor    %edx,%edx
 8051071:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051074:	8a 14 30             	mov    (%eax,%esi,1),%dl
 8051077:	01 d1                	add    %edx,%ecx
 8051079:	85 d2                	test   %edx,%edx
 805107b:	74 97                	je     0x8051014
 805107d:	31 c0                	xor    %eax,%eax
 805107f:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051082:	31 d2                	xor    %edx,%edx
 8051084:	8a 14 30             	mov    (%eax,%esi,1),%dl
 8051087:	01 d1                	add    %edx,%ecx
 8051089:	31 c0                	xor    %eax,%eax
 805108b:	31 d2                	xor    %edx,%edx
 805108d:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051090:	8a 14 30             	mov    (%eax,%esi,1),%dl
 8051093:	01 d1                	add    %edx,%ecx
 8051095:	31 c0                	xor    %eax,%eax
 8051097:	31 d2                	xor    %edx,%edx
 8051099:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 805109c:	8a 14 30             	mov    (%eax,%esi,1),%dl
 805109f:	01 d1                	add    %edx,%ecx
 80510a1:	85 d2                	test   %edx,%edx
 80510a3:	0f 84 6b ff ff ff    	je     0x8051014
 80510a9:	31 c0                	xor    %eax,%eax
 80510ab:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 80510ae:	31 d2                	xor    %edx,%edx
 80510b0:	8a 14 30             	mov    (%eax,%esi,1),%dl
 80510b3:	01 d1                	add    %edx,%ecx
 80510b5:	31 c0                	xor    %eax,%eax
 80510b7:	31 d2                	xor    %edx,%edx
 80510b9:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 80510bc:	8a 14 30             	mov    (%eax,%esi,1),%dl
 80510bf:	01 d1                	add    %edx,%ecx
 80510c1:	31 c0                	xor    %eax,%eax
 80510c3:	31 d2                	xor    %edx,%edx
 80510c5:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 80510c8:	8a 14 30             	mov    (%eax,%esi,1),%dl
 80510cb:	01 d1                	add    %edx,%ecx
 80510cd:	85 d2                	test   %edx,%edx
 80510cf:	0f 84 3f ff ff ff    	je     0x8051014
 80510d5:	31 c0                	xor    %eax,%eax
 80510d7:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 80510da:	31 d2                	xor    %edx,%edx
 80510dc:	8a 14 30             	mov    (%eax,%esi,1),%dl
 80510df:	01 d1                	add    %edx,%ecx
 80510e1:	31 c0                	xor    %eax,%eax
 80510e3:	31 d2                	xor    %edx,%edx
 80510e5:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 80510e8:	8a 14 30             	mov    (%eax,%esi,1),%dl
 80510eb:	01 d1                	add    %edx,%ecx
 80510ed:	3b 4d fc             	cmp    0xfffffffc(%ebp),%ecx
 80510f0:	0f 86 6b ff ff ff    	jbe    0x8051061
 80510f6:	8b 7d 0c             	mov    0xc(%ebp),%edi
 80510f9:	03 7d 10             	add    0x10(%ebp),%edi
 80510fc:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 80510ff:	31 c0                	xor    %eax,%eax
 8051101:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051104:	31 d2                	xor    %edx,%edx
 8051106:	8a 14 30             	mov    (%eax,%esi,1),%dl
 8051109:	89 f8                	mov    %edi,%eax
 805110b:	eb 69                	jmp    0x8051176
 805110d:	8d 76 00             	lea    0x0(%esi),%esi
 8051110:	01 d1                	add    %edx,%ecx
 8051112:	31 c0                	xor    %eax,%eax
 8051114:	31 d2                	xor    %edx,%edx
 8051116:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8051119:	8a 14 30             	mov    (%eax,%esi,1),%dl
 805111c:	85 d2                	test   %edx,%edx
 805111e:	75 53                	jne    0x8051173
 8051120:	31 c0                	xor    %eax,%eax
 8051122:	8a 41 fe             	mov    0xfffffffe(%ecx),%al
 8051125:	3b 45 f4             	cmp    0xfffffff4(%ebp),%eax
 8051128:	75 46                	jne    0x8051170
 805112a:	c7 45 ec 03 00 00 00 	movl   $0x3,0xffffffec(%ebp)
 8051131:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 8051134:	39 5d ec             	cmp    %ebx,0xffffffec(%ebp)
 8051137:	7f 2b                	jg     0x8051164
 8051139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8051140:	89 ca                	mov    %ecx,%edx
 8051142:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8051145:	2b 45 ec             	sub    0xffffffec(%ebp),%eax
 8051148:	2b 55 ec             	sub    0xffffffec(%ebp),%edx
 805114b:	8a 00                	mov    (%eax),%al
 805114d:	38 02                	cmp    %al,(%edx)
 805114f:	75 0b                	jne    0x805115c
 8051151:	ff 45 ec             	incl   0xffffffec(%ebp)
 8051154:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8051157:	39 7d ec             	cmp    %edi,0xffffffec(%ebp)
 805115a:	7e e4                	jle    0x8051140
 805115c:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 805115f:	39 5d ec             	cmp    %ebx,0xffffffec(%ebp)
 8051162:	7e 0c                	jle    0x8051170
 8051164:	2b 4d e8             	sub    0xffffffe8(%ebp),%ecx
 8051167:	89 c8                	mov    %ecx,%eax
 8051169:	eb 13                	jmp    0x805117e
 805116b:	90                   	nop    
 805116c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8051170:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 8051173:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8051176:	29 c8                	sub    %ecx,%eax
 8051178:	39 c2                	cmp    %eax,%edx
 805117a:	7e 94                	jle    0x8051110
 805117c:	31 c0                	xor    %eax,%eax
 805117e:	8d 65 dc             	lea    0xffffffdc(%ebp),%esp
 8051181:	5b                   	pop    %ebx
 8051182:	5e                   	pop    %esi
 8051183:	5f                   	pop    %edi
 8051184:	89 ec                	mov    %ebp,%esp
 8051186:	5d                   	pop    %ebp
 8051187:	c3                   	ret    
 8051188:	90                   	nop    
 8051189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8051190:	55                   	push   %ebp
 8051191:	89 e5                	mov    %esp,%ebp
 8051193:	83 ec 28             	sub    $0x28,%esp
 8051196:	57                   	push   %edi
 8051197:	56                   	push   %esi
 8051198:	53                   	push   %ebx
 8051199:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805119c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805119f:	8b 53 34             	mov    0x34(%ebx),%edx
 80511a2:	39 d1                	cmp    %edx,%ecx
 80511a4:	0f 82 6e 01 00 00    	jb     0x8051318
 80511aa:	8b 75 08             	mov    0x8(%ebp),%esi
 80511ad:	81 c6 3c 01 00 00    	add    $0x13c,%esi
 80511b3:	89 75 fc             	mov    %esi,0xfffffffc(%ebp)
 80511b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80511b9:	83 c3 3c             	add    $0x3c,%ebx
 80511bc:	89 5d e8             	mov    %ebx,0xffffffe8(%ebp)
 80511bf:	8b 75 08             	mov    0x8(%ebp),%esi
 80511c2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80511c5:	01 cb                	add    %ecx,%ebx
 80511c7:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 80511ca:	8b 7d 0c             	mov    0xc(%ebp),%edi
 80511cd:	89 55 d8             	mov    %edx,0xffffffd8(%ebp)
 80511d0:	8b b6 44 05 00 00    	mov    0x544(%esi),%esi
 80511d6:	89 75 e0             	mov    %esi,0xffffffe0(%ebp)
 80511d9:	85 d2                	test   %edx,%edx
 80511db:	75 13                	jne    0x80511f0
 80511dd:	8b 75 08             	mov    0x8(%ebp),%esi
 80511e0:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 80511e3:	8b 76 30             	mov    0x30(%esi),%esi
 80511e6:	89 75 f8             	mov    %esi,0xfffffff8(%ebp)
 80511e9:	e9 38 01 00 00       	jmp    0x8051326
 80511ee:	89 f6                	mov    %esi,%esi
 80511f0:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 80511f7:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 80511fa:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 8051201:	39 c1                	cmp    %eax,%ecx
 8051203:	72 0b                	jb     0x8051210
 8051205:	8b 75 f4             	mov    0xfffffff4(%ebp),%esi
 8051208:	89 75 e4             	mov    %esi,0xffffffe4(%ebp)
 805120b:	29 45 e4             	sub    %eax,0xffffffe4(%ebp)
 805120e:	eb 07                	jmp    0x8051217
 8051210:	c7 45 e4 00 00 00 00 	movl   $0x0,0xffffffe4(%ebp)
 8051217:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805121a:	2b 45 0c             	sub    0xc(%ebp),%eax
 805121d:	39 d0                	cmp    %edx,%eax
 805121f:	0f 8c f3 00 00 00    	jl     0x8051318
 8051225:	83 7d e4 00          	cmpl   $0x0,0xffffffe4(%ebp)
 8051229:	74 55                	je     0x8051280
 805122b:	3b 7d e4             	cmp    0xffffffe4(%ebp),%edi
 805122e:	77 50                	ja     0x8051280
 8051230:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 8051233:	8d 7c 1f ff          	lea    0xffffffff(%edi,%ebx,1),%edi
 8051237:	31 c0                	xor    %eax,%eax
 8051239:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 805123c:	eb 2d                	jmp    0x805126b
 805123e:	89 f6                	mov    %esi,%esi
 8051240:	3b 7d e4             	cmp    0xffffffe4(%ebp),%edi
 8051243:	73 34                	jae    0x8051279
 8051245:	03 7d d8             	add    0xffffffd8(%ebp),%edi
 8051248:	31 c0                	xor    %eax,%eax
 805124a:	8b 5d e8             	mov    0xffffffe8(%ebp),%ebx
 805124d:	89 de                	mov    %ebx,%esi
 805124f:	8a 07                	mov    (%edi),%al
 8051251:	8a 04 18             	mov    (%eax,%ebx,1),%al
 8051254:	25 ff 00 00 00       	and    $0xff,%eax
 8051259:	01 c7                	add    %eax,%edi
 805125b:	31 c0                	xor    %eax,%eax
 805125d:	8a 07                	mov    (%edi),%al
 805125f:	8a 04 18             	mov    (%eax,%ebx,1),%al
 8051262:	25 ff 00 00 00       	and    $0xff,%eax
 8051267:	01 c7                	add    %eax,%edi
 8051269:	31 c0                	xor    %eax,%eax
 805126b:	31 db                	xor    %ebx,%ebx
 805126d:	8a 07                	mov    (%edi),%al
 805126f:	8a 1c 30             	mov    (%eax,%esi,1),%bl
 8051272:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 8051275:	85 db                	test   %ebx,%ebx
 8051277:	75 c7                	jne    0x8051240
 8051279:	47                   	inc    %edi
 805127a:	eb 17                	jmp    0x8051293
 805127c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8051280:	03 7d d8             	add    0xffffffd8(%ebp),%edi
 8051283:	31 c0                	xor    %eax,%eax
 8051285:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 8051288:	31 db                	xor    %ebx,%ebx
 805128a:	8a 47 ff             	mov    0xffffffff(%edi),%al
 805128d:	8a 1c 30             	mov    (%eax,%esi,1),%bl
 8051290:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 8051293:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 8051297:	75 71                	jne    0x805130a
 8051299:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 805129c:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 805129f:	8d 4f ff             	lea    0xffffffff(%edi),%ecx
 80512a2:	eb 4a                	jmp    0x80512ee
 80512a4:	83 7d e0 00          	cmpl   $0x0,0xffffffe0(%ebp)
 80512a8:	74 16                	je     0x80512c0
 80512aa:	49                   	dec    %ecx
 80512ab:	31 c0                	xor    %eax,%eax
 80512ad:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 80512b0:	8a 01                	mov    (%ecx),%al
 80512b2:	8a 04 30             	mov    (%eax,%esi,1),%al
 80512b5:	88 45 df             	mov    %al,0xffffffdf(%ebp)
 80512b8:	eb 0c                	jmp    0x80512c6
 80512ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80512c0:	49                   	dec    %ecx
 80512c1:	8a 19                	mov    (%ecx),%bl
 80512c3:	88 5d df             	mov    %bl,0xffffffdf(%ebp)
 80512c6:	8b 42 04             	mov    0x4(%edx),%eax
 80512c9:	85 c0                	test   %eax,%eax
 80512cb:	74 37                	je     0x8051304
 80512cd:	8d 76 00             	lea    0x0(%esi),%esi
 80512d0:	8a 50 0c             	mov    0xc(%eax),%dl
 80512d3:	38 55 df             	cmp    %dl,0xffffffdf(%ebp)
 80512d6:	74 0f                	je     0x80512e7
 80512d8:	73 06                	jae    0x80512e0
 80512da:	8b 00                	mov    (%eax),%eax
 80512dc:	eb 05                	jmp    0x80512e3
 80512de:	89 f6                	mov    %esi,%esi
 80512e0:	8b 40 04             	mov    0x4(%eax),%eax
 80512e3:	85 c0                	test   %eax,%eax
 80512e5:	75 e9                	jne    0x80512d0
 80512e7:	85 c0                	test   %eax,%eax
 80512e9:	74 19                	je     0x8051304
 80512eb:	8b 50 08             	mov    0x8(%eax),%edx
 80512ee:	83 3a 00             	cmpl   $0x0,(%edx)
 80512f1:	74 06                	je     0x80512f9
 80512f3:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 80512f6:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 80512f9:	8b 5a 18             	mov    0x18(%edx),%ebx
 80512fc:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 80512ff:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
 8051302:	77 a0                	ja     0x80512a4
 8051304:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
 8051308:	75 1c                	jne    0x8051326
 805130a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805130d:	29 f8                	sub    %edi,%eax
 805130f:	3b 45 d8             	cmp    0xffffffd8(%ebp),%eax
 8051312:	0f 8d 0d ff ff ff    	jge    0x8051225
 8051318:	31 c0                	xor    %eax,%eax
 805131a:	e9 0a 01 00 00       	jmp    0x8051429
 805131f:	90                   	nop    
 8051320:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 8051323:	89 75 f0             	mov    %esi,0xfffffff0(%ebp)
 8051326:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8051329:	8b 5d 08             	mov    0x8(%ebp),%ebx
 805132c:	2b 45 f0             	sub    0xfffffff0(%ebp),%eax
 805132f:	8b 53 38             	mov    0x38(%ebx),%edx
 8051332:	39 d0                	cmp    %edx,%eax
 8051334:	7e 06                	jle    0x805133c
 8051336:	03 55 f0             	add    0xfffffff0(%ebp),%edx
 8051339:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
 805133c:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
 8051343:	c7 45 d8 01 00 00 00 	movl   $0x1,0xffffffd8(%ebp)
 805134a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805134d:	29 f8                	sub    %edi,%eax
 805134f:	83 f8 01             	cmp    $0x1,%eax
 8051352:	0f 8c a9 00 00 00    	jl     0x8051401
 8051358:	03 7d d8             	add    0xffffffd8(%ebp),%edi
 805135b:	31 c0                	xor    %eax,%eax
 805135d:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 8051360:	31 db                	xor    %ebx,%ebx
 8051362:	8a 47 ff             	mov    0xffffffff(%edi),%al
 8051365:	8a 1c 30             	mov    (%eax,%esi,1),%bl
 8051368:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 805136b:	85 db                	test   %ebx,%ebx
 805136d:	0f 85 80 00 00 00    	jne    0x80513f3
 8051373:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8051376:	8d 4f ff             	lea    0xffffffff(%edi),%ecx
 8051379:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 805137c:	85 d2                	test   %edx,%edx
 805137e:	74 6c                	je     0x80513ec
 8051380:	eb 3f                	jmp    0x80513c1
 8051382:	83 7d e0 00          	cmpl   $0x0,0xffffffe0(%ebp)
 8051386:	74 10                	je     0x8051398
 8051388:	49                   	dec    %ecx
 8051389:	31 c0                	xor    %eax,%eax
 805138b:	8b 75 e0             	mov    0xffffffe0(%ebp),%esi
 805138e:	8a 01                	mov    (%ecx),%al
 8051390:	8a 04 30             	mov    (%eax,%esi,1),%al
 8051393:	88 45 df             	mov    %al,0xffffffdf(%ebp)
 8051396:	eb 06                	jmp    0x805139e
 8051398:	49                   	dec    %ecx
 8051399:	8a 19                	mov    (%ecx),%bl
 805139b:	88 5d df             	mov    %bl,0xffffffdf(%ebp)
 805139e:	8b 42 04             	mov    0x4(%edx),%eax
 80513a1:	85 c0                	test   %eax,%eax
 80513a3:	74 37                	je     0x80513dc
 80513a5:	8a 50 0c             	mov    0xc(%eax),%dl
 80513a8:	38 55 df             	cmp    %dl,0xffffffdf(%ebp)
 80513ab:	74 0d                	je     0x80513ba
 80513ad:	73 04                	jae    0x80513b3
 80513af:	8b 00                	mov    (%eax),%eax
 80513b1:	eb 03                	jmp    0x80513b6
 80513b3:	8b 40 04             	mov    0x4(%eax),%eax
 80513b6:	85 c0                	test   %eax,%eax
 80513b8:	75 eb                	jne    0x80513a5
 80513ba:	85 c0                	test   %eax,%eax
 80513bc:	74 1e                	je     0x80513dc
 80513be:	8b 50 08             	mov    0x8(%eax),%edx
 80513c1:	83 3a 00             	cmpl   $0x0,(%edx)
 80513c4:	74 0b                	je     0x80513d1
 80513c6:	3b 4d f0             	cmp    0xfffffff0(%ebp),%ecx
 80513c9:	77 06                	ja     0x80513d1
 80513cb:	89 4d ec             	mov    %ecx,0xffffffec(%ebp)
 80513ce:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 80513d1:	8b 5a 18             	mov    0x18(%edx),%ebx
 80513d4:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 80513d7:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
 80513da:	77 a6                	ja     0x8051382
 80513dc:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
 80513e0:	0f 85 3a ff ff ff    	jne    0x8051320
 80513e6:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 80513ea:	75 07                	jne    0x80513f3
 80513ec:	c7 45 d8 01 00 00 00 	movl   $0x1,0xffffffd8(%ebp)
 80513f3:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80513f6:	29 f8                	sub    %edi,%eax
 80513f8:	3b 45 d8             	cmp    0xffffffd8(%ebp),%eax
 80513fb:	0f 8d 57 ff ff ff    	jge    0x8051358
 8051401:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 8051405:	74 1f                	je     0x8051426
 8051407:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 805140a:	8b 1e                	mov    (%esi),%ebx
 805140c:	8b 75 14             	mov    0x14(%ebp),%esi
 805140f:	c1 eb 01             	shr    $0x1,%ebx
 8051412:	89 1e                	mov    %ebx,(%esi)
 8051414:	8b 5d f0             	mov    0xfffffff0(%ebp),%ebx
 8051417:	89 5e 04             	mov    %ebx,0x4(%esi)
 805141a:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 805141d:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051420:	8b 46 14             	mov    0x14(%esi),%eax
 8051423:	89 43 08             	mov    %eax,0x8(%ebx)
 8051426:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 8051429:	8d 65 cc             	lea    0xffffffcc(%ebp),%esp
 805142c:	5b                   	pop    %ebx
 805142d:	5e                   	pop    %esi
 805142e:	5f                   	pop    %edi
 805142f:	89 ec                	mov    %ebp,%esp
 8051431:	5d                   	pop    %ebp
 8051432:	c3                   	ret    
 8051433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8051440:	55                   	push   %ebp
 8051441:	89 e5                	mov    %esp,%ebp
 8051443:	56                   	push   %esi
 8051444:	53                   	push   %ebx
 8051445:	8b 75 08             	mov    0x8(%ebp),%esi
 8051448:	8b 55 0c             	mov    0xc(%ebp),%edx
 805144b:	8b 45 10             	mov    0x10(%ebp),%eax
 805144e:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051451:	83 7e 2c 01          	cmpl   $0x1,0x2c(%esi)
 8051455:	75 2e                	jne    0x8051485
 8051457:	83 be 44 05 00 00 00 	cmpl   $0x0,0x544(%esi)
 805145e:	75 25                	jne    0x8051485
 8051460:	50                   	push   %eax
 8051461:	52                   	push   %edx
 8051462:	56                   	push   %esi
 8051463:	e8 08 fb ff ff       	call   0x8050f70
 8051468:	89 c2                	mov    %eax,%edx
 805146a:	85 db                	test   %ebx,%ebx
 805146c:	74 13                	je     0x8051481
 805146e:	85 d2                	test   %edx,%edx
 8051470:	74 0f                	je     0x8051481
 8051472:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 8051478:	89 53 04             	mov    %edx,0x4(%ebx)
 805147b:	8b 46 34             	mov    0x34(%esi),%eax
 805147e:	89 43 08             	mov    %eax,0x8(%ebx)
 8051481:	89 d0                	mov    %edx,%eax
 8051483:	eb 09                	jmp    0x805148e
 8051485:	53                   	push   %ebx
 8051486:	50                   	push   %eax
 8051487:	52                   	push   %edx
 8051488:	56                   	push   %esi
 8051489:	e8 02 fd ff ff       	call   0x8051190
 805148e:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8051491:	5b                   	pop    %ebx
 8051492:	5e                   	pop    %esi
 8051493:	89 ec                	mov    %ebp,%esp
 8051495:	5d                   	pop    %ebp
 8051496:	c3                   	ret    
 8051497:	89 f6                	mov    %esi,%esi
 8051499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 80514a0:	55                   	push   %ebp
 80514a1:	89 e5                	mov    %esp,%ebp
 80514a3:	31 c0                	xor    %eax,%eax
 80514a5:	53                   	push   %ebx
 80514a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80514a9:	6a 00                	push   $0x0
 80514ab:	53                   	push   %ebx
 80514ac:	e8 db 7b ff ff       	call   0x804908c
 80514b1:	83 c4 08             	add    $0x8,%esp
 80514b4:	53                   	push   %ebx
 80514b5:	e8 32 7d ff ff       	call   0x80491ec
 80514ba:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80514bd:	89 ec                	mov    %ebp,%esp
 80514bf:	5d                   	pop    %ebp
 80514c0:	c3                   	ret    
 80514c1:	90                   	nop    
 80514c2:	90                   	nop    
 80514c3:	90                   	nop    
 80514c4:	90                   	nop    
 80514c5:	90                   	nop    
 80514c6:	90                   	nop    
 80514c7:	90                   	nop    
 80514c8:	90                   	nop    
 80514c9:	90                   	nop    
 80514ca:	90                   	nop    
 80514cb:	90                   	nop    
 80514cc:	90                   	nop    
 80514cd:	90                   	nop    
 80514ce:	90                   	nop    
 80514cf:	90                   	nop    
 80514d0:	55                   	push   %ebp
 80514d1:	89 e5                	mov    %esp,%ebp
 80514d3:	57                   	push   %edi
 80514d4:	a1 84 b0 05 08       	mov    0x805b084,%eax
 80514d9:	85 c0                	test   %eax,%eax
 80514db:	75 3a                	jne    0x8051517
 80514dd:	ba 60 bb 05 08       	mov    $0x805bb60,%edx
 80514e2:	89 d7                	mov    %edx,%edi
 80514e4:	fc                   	cld    
 80514e5:	b9 40 00 00 00       	mov    $0x40,%ecx
 80514ea:	f3 ab                	repz stos %eax,%es:(%edi)
 80514ec:	31 c0                	xor    %eax,%eax
 80514ee:	8b 3d d4 b2 05 08    	mov    0x805b2d4,%edi
 80514f4:	f6 04 47 08          	testb  $0x8,(%edi,%eax,2)
 80514f8:	74 04                	je     0x80514fe
 80514fa:	c6 04 10 01          	movb   $0x1,(%eax,%edx,1)
 80514fe:	40                   	inc    %eax
 80514ff:	3d ff 00 00 00       	cmp    $0xff,%eax
 8051504:	7e ee                	jle    0x80514f4
 8051506:	c6 05 bf bb 05 08 01 	movb   $0x1,0x805bbbf
 805150d:	c7 05 84 b0 05 08 01 	movl   $0x1,0x805b084
 8051514:	00 00 00 
 8051517:	8b 7d fc             	mov    0xfffffffc(%ebp),%edi
 805151a:	89 ec                	mov    %ebp,%esp
 805151c:	5d                   	pop    %ebp
 805151d:	c3                   	ret    
 805151e:	89 f6                	mov    %esi,%esi
 8051520:	55                   	push   %ebp
 8051521:	89 e5                	mov    %esp,%ebp
 8051523:	8b 15 38 be 05 08    	mov    0x805be38,%edx
 8051529:	8b 45 08             	mov    0x8(%ebp),%eax
 805152c:	a3 38 be 05 08       	mov    %eax,0x805be38
 8051531:	89 d0                	mov    %edx,%eax
 8051533:	89 ec                	mov    %ebp,%esp
 8051535:	5d                   	pop    %ebp
 8051536:	c3                   	ret    
 8051537:	89 f6                	mov    %esi,%esi
 8051539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8051540:	55                   	push   %ebp
 8051541:	89 e5                	mov    %esp,%ebp
 8051543:	81 ec 58 01 00 00    	sub    $0x158,%esp
 8051549:	57                   	push   %edi
 805154a:	56                   	push   %esi
 805154b:	53                   	push   %ebx
 805154c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805154f:	89 8d ec fe ff ff    	mov    %ecx,0xfffffeec(%ebp)
 8051555:	89 8d d8 fe ff ff    	mov    %ecx,0xfffffed8(%ebp)
 805155b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 805155e:	01 9d d8 fe ff ff    	add    %ebx,0xfffffed8(%ebp)
 8051564:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051567:	c7 85 d0 fe ff ff 00 	movl   $0x0,0xfffffed0(%ebp)
 805156e:	00 00 00 
 8051571:	c7 85 cc fe ff ff 00 	movl   $0x0,0xfffffecc(%ebp)
 8051578:	00 00 00 
 805157b:	c7 85 c0 fe ff ff 00 	movl   $0x0,0xfffffec0(%ebp)
 8051582:	00 00 00 
 8051585:	c7 85 bc fe ff ff 00 	movl   $0x0,0xfffffebc(%ebp)
 805158c:	00 00 00 
 805158f:	8b 49 14             	mov    0x14(%ecx),%ecx
 8051592:	89 8d d4 fe ff ff    	mov    %ecx,0xfffffed4(%ebp)
 8051598:	68 80 02 00 00       	push   $0x280
 805159d:	e8 6a 7a ff ff       	call   0x804900c
 80515a2:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 80515a5:	83 c4 04             	add    $0x4,%esp
 80515a8:	85 c0                	test   %eax,%eax
 80515aa:	75 0a                	jne    0x80515b6
 80515ac:	b8 0c 00 00 00       	mov    $0xc,%eax
 80515b1:	e9 4c 2e 00 00       	jmp    0x8054402
 80515b6:	c7 45 f8 20 00 00 00 	movl   $0x20,0xfffffff8(%ebp)
 80515bd:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 80515c4:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80515c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80515ca:	89 4b 0c             	mov    %ecx,0xc(%ebx)
 80515cd:	80 63 1c 97          	andb   $0x97,0x1c(%ebx)
 80515d1:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 80515d8:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
 80515df:	e8 ec fe ff ff       	call   0x80514d0
 80515e4:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
 80515e8:	75 42                	jne    0x805162c
 80515ea:	8b 03                	mov    (%ebx),%eax
 80515ec:	85 c0                	test   %eax,%eax
 80515ee:	74 10                	je     0x8051600
 80515f0:	6a 20                	push   $0x20
 80515f2:	50                   	push   %eax
 80515f3:	e8 f4 7a ff ff       	call   0x80490ec
 80515f8:	89 03                	mov    %eax,(%ebx)
 80515fa:	83 c4 08             	add    $0x8,%esp
 80515fd:	eb 10                	jmp    0x805160f
 80515ff:	90                   	nop    
 8051600:	6a 20                	push   $0x20
 8051602:	e8 05 7a ff ff       	call   0x804900c
 8051607:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805160a:	83 c4 04             	add    $0x4,%esp
 805160d:	89 03                	mov    %eax,(%ebx)
 805160f:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051612:	83 39 00             	cmpl   $0x0,(%ecx)
 8051615:	75 0b                	jne    0x8051622
 8051617:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805161a:	50                   	push   %eax
 805161b:	e8 cc 7b ff ff       	call   0x80491ec
 8051620:	eb 8a                	jmp    0x80515ac
 8051622:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051625:	c7 43 04 20 00 00 00 	movl   $0x20,0x4(%ebx)
 805162c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805162f:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8051635:	8b 09                	mov    (%ecx),%ecx
 8051637:	89 8d dc fe ff ff    	mov    %ecx,0xfffffedc(%ebp)
 805163d:	89 8d c8 fe ff ff    	mov    %ecx,0xfffffec8(%ebp)
 8051643:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8051649:	0f 84 cf 2b 00 00    	je     0x805421e
 805164f:	90                   	nop    
 8051650:	8a 1a                	mov    (%edx),%bl
 8051652:	88 9d e8 fe ff ff    	mov    %bl,0xfffffee8(%ebp)
 8051658:	42                   	inc    %edx
 8051659:	89 95 ec fe ff ff    	mov    %edx,0xfffffeec(%ebp)
 805165f:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051666:	74 13                	je     0x805167b
 8051668:	31 c0                	xor    %eax,%eax
 805166a:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8051670:	88 d8                	mov    %bl,%al
 8051672:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8051675:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 805167b:	31 c0                	xor    %eax,%eax
 805167d:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8051683:	83 c0 f6             	add    $0xfffffff6,%eax
 8051686:	83 f8 72             	cmp    $0x72,%eax
 8051689:	0f 87 fd 28 00 00    	ja     0x8053f8c
 805168f:	ff 24 85 cc 96 05 08 	jmp    *0x80596cc(,%eax,4)
 8051696:	8b 45 08             	mov    0x8(%ebp),%eax
 8051699:	40                   	inc    %eax
 805169a:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 80516a0:	39 c2                	cmp    %eax,%edx
 80516a2:	74 1e                	je     0x80516c2
 80516a4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80516a7:	f6 c3 08             	test   $0x8,%bl
 80516aa:	75 16                	jne    0x80516c2
 80516ac:	53                   	push   %ebx
 80516ad:	52                   	push   %edx
 80516ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80516b1:	51                   	push   %ecx
 80516b2:	e8 19 2e 00 00       	call   0x80544d0
 80516b7:	83 c4 0c             	add    $0xc,%esp
 80516ba:	84 c0                	test   %al,%al
 80516bc:	0f 84 ca 28 00 00    	je     0x8053f8c
 80516c2:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80516c5:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80516cb:	8b 33                	mov    (%ebx),%esi
 80516cd:	29 f0                	sub    %esi,%eax
 80516cf:	40                   	inc    %eax
 80516d0:	8b 53 04             	mov    0x4(%ebx),%edx
 80516d3:	39 d0                	cmp    %edx,%eax
 80516d5:	0f 86 cf 00 00 00    	jbe    0x80517aa
 80516db:	90                   	nop    
 80516dc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80516e0:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 80516e6:	0f 84 07 2c 00 00    	je     0x80542f3
 80516ec:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80516ef:	89 d0                	mov    %edx,%eax
 80516f1:	01 d0                	add    %edx,%eax
 80516f3:	89 41 04             	mov    %eax,0x4(%ecx)
 80516f6:	3d 00 00 01 00       	cmp    $0x10000,%eax
 80516fb:	76 07                	jbe    0x8051704
 80516fd:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8051704:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051707:	8b 43 04             	mov    0x4(%ebx),%eax
 805170a:	50                   	push   %eax
 805170b:	8b 03                	mov    (%ebx),%eax
 805170d:	50                   	push   %eax
 805170e:	e8 d9 79 ff ff       	call   0x80490ec
 8051713:	89 c2                	mov    %eax,%edx
 8051715:	89 13                	mov    %edx,(%ebx)
 8051717:	83 c4 08             	add    $0x8,%esp
 805171a:	85 d2                	test   %edx,%edx
 805171c:	0f 84 8a fe ff ff    	je     0x80515ac
 8051722:	39 d6                	cmp    %edx,%esi
 8051724:	74 6b                	je     0x8051791
 8051726:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805172c:	29 f0                	sub    %esi,%eax
 805172e:	01 d0                	add    %edx,%eax
 8051730:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051736:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805173c:	29 f0                	sub    %esi,%eax
 805173e:	01 d0                	add    %edx,%eax
 8051740:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8051746:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805174d:	74 10                	je     0x805175f
 805174f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8051755:	29 f0                	sub    %esi,%eax
 8051757:	01 d0                	add    %edx,%eax
 8051759:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805175f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051766:	74 10                	je     0x8051778
 8051768:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805176e:	29 f0                	sub    %esi,%eax
 8051770:	01 d0                	add    %edx,%eax
 8051772:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8051778:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 805177f:	74 10                	je     0x8051791
 8051781:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8051787:	29 f0                	sub    %esi,%eax
 8051789:	01 c2                	add    %eax,%edx
 805178b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8051791:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051794:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805179a:	8b 31                	mov    (%ecx),%esi
 805179c:	29 f0                	sub    %esi,%eax
 805179e:	40                   	inc    %eax
 805179f:	8b 51 04             	mov    0x4(%ecx),%edx
 80517a2:	39 d0                	cmp    %edx,%eax
 80517a4:	0f 87 36 ff ff ff    	ja     0x80516e0
 80517aa:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80517b0:	c6 03 09             	movb   $0x9,(%ebx)
 80517b3:	e9 96 27 00 00       	jmp    0x8053f4e
 80517b8:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 80517be:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 80517c4:	0f 84 de 00 00 00    	je     0x80518a8
 80517ca:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80517cd:	f6 c1 08             	test   $0x8,%cl
 80517d0:	0f 85 d2 00 00 00    	jne    0x80518a8
 80517d6:	51                   	push   %ecx
 80517d7:	8b 9d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ebx
 80517dd:	53                   	push   %ebx
 80517de:	52                   	push   %edx
 80517df:	e8 3c 2d 00 00       	call   0x8054520
 80517e4:	83 c4 0c             	add    $0xc,%esp
 80517e7:	84 c0                	test   %al,%al
 80517e9:	0f 84 9d 27 00 00    	je     0x8053f8c
 80517ef:	e9 b4 00 00 00       	jmp    0x80518a8
 80517f4:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 80517fa:	0f 84 f3 2a 00 00    	je     0x80542f3
 8051800:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051803:	89 d0                	mov    %edx,%eax
 8051805:	01 d0                	add    %edx,%eax
 8051807:	89 43 04             	mov    %eax,0x4(%ebx)
 805180a:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805180f:	76 07                	jbe    0x8051818
 8051811:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8051818:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805181b:	8b 41 04             	mov    0x4(%ecx),%eax
 805181e:	50                   	push   %eax
 805181f:	8b 01                	mov    (%ecx),%eax
 8051821:	50                   	push   %eax
 8051822:	e8 c5 78 ff ff       	call   0x80490ec
 8051827:	89 c2                	mov    %eax,%edx
 8051829:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805182c:	83 c4 08             	add    $0x8,%esp
 805182f:	89 13                	mov    %edx,(%ebx)
 8051831:	85 d2                	test   %edx,%edx
 8051833:	0f 84 73 fd ff ff    	je     0x80515ac
 8051839:	39 d6                	cmp    %edx,%esi
 805183b:	74 6b                	je     0x80518a8
 805183d:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051843:	29 f0                	sub    %esi,%eax
 8051845:	01 d0                	add    %edx,%eax
 8051847:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 805184d:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051853:	29 f0                	sub    %esi,%eax
 8051855:	01 d0                	add    %edx,%eax
 8051857:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 805185d:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8051864:	74 10                	je     0x8051876
 8051866:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 805186c:	29 f0                	sub    %esi,%eax
 805186e:	01 d0                	add    %edx,%eax
 8051870:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8051876:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 805187d:	74 10                	je     0x805188f
 805187f:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051885:	29 f0                	sub    %esi,%eax
 8051887:	01 d0                	add    %edx,%eax
 8051889:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 805188f:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8051896:	74 10                	je     0x80518a8
 8051898:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 805189e:	29 f0                	sub    %esi,%eax
 80518a0:	01 c2                	add    %eax,%edx
 80518a2:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80518a8:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80518ab:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80518b1:	8b 31                	mov    (%ecx),%esi
 80518b3:	29 f0                	sub    %esi,%eax
 80518b5:	40                   	inc    %eax
 80518b6:	8b 51 04             	mov    0x4(%ecx),%edx
 80518b9:	39 d0                	cmp    %edx,%eax
 80518bb:	0f 87 33 ff ff ff    	ja     0x80517f4
 80518c1:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80518c7:	c6 03 0a             	movb   $0xa,(%ebx)
 80518ca:	e9 7f 26 00 00       	jmp    0x8053f4e
 80518cf:	90                   	nop    
 80518d0:	89 95 ec fe ff ff    	mov    %edx,0xfffffeec(%ebp)
 80518d6:	e9 49 01 00 00       	jmp    0x8051a24
 80518db:	90                   	nop    
 80518dc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80518e0:	f7 45 10 02 04 00 00 	testl  $0x402,0x10(%ebp)
 80518e7:	0f 85 9f 26 00 00    	jne    0x8053f8c
 80518ed:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 80518f4:	75 15                	jne    0x805190b
 80518f6:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80518f9:	f6 c1 20             	test   $0x20,%cl
 80518fc:	0f 85 b4 29 00 00    	jne    0x80542b6
 8051902:	f6 c1 10             	test   $0x10,%cl
 8051905:	0f 84 81 26 00 00    	je     0x8053f8c
 805190b:	c6 85 bb fe ff ff 00 	movb   $0x0,0xfffffebb(%ebp)
 8051912:	c6 85 ba fe ff ff 00 	movb   $0x0,0xfffffeba(%ebp)
 8051919:	31 ff                	xor    %edi,%edi
 805191b:	e9 c8 00 00 00       	jmp    0x80519e8
 8051920:	8a 1a                	mov    (%edx),%bl
 8051922:	88 9d e8 fe ff ff    	mov    %bl,0xfffffee8(%ebp)
 8051928:	8d 72 01             	lea    0x1(%edx),%esi
 805192b:	89 b5 ec fe ff ff    	mov    %esi,0xfffffeec(%ebp)
 8051931:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051938:	74 13                	je     0x805194d
 805193a:	31 c0                	xor    %eax,%eax
 805193c:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8051942:	88 d8                	mov    %bl,%al
 8051944:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8051947:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 805194d:	80 bd e8 fe ff ff 2a 	cmpb   $0x2a,0xfffffee8(%ebp)
 8051954:	0f 84 8e 00 00 00    	je     0x80519e8
 805195a:	f6 45 10 02          	testb  $0x2,0x10(%ebp)
 805195e:	75 14                	jne    0x8051974
 8051960:	80 bd e8 fe ff ff 2b 	cmpb   $0x2b,0xfffffee8(%ebp)
 8051967:	74 7f                	je     0x80519e8
 8051969:	80 bd e8 fe ff ff 3f 	cmpb   $0x3f,0xfffffee8(%ebp)
 8051970:	74 76                	je     0x80519e8
 8051972:	eb 6c                	jmp    0x80519e0
 8051974:	80 bd e8 fe ff ff 5c 	cmpb   $0x5c,0xfffffee8(%ebp)
 805197b:	75 63                	jne    0x80519e0
 805197d:	3b b5 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%esi
 8051983:	0f 84 55 0e 00 00    	je     0x80527de
 8051989:	8a 5a 01             	mov    0x1(%edx),%bl
 805198c:	88 9d e4 fe ff ff    	mov    %bl,0xfffffee4(%ebp)
 8051992:	8d 4a 02             	lea    0x2(%edx),%ecx
 8051995:	89 8d ec fe ff ff    	mov    %ecx,0xfffffeec(%ebp)
 805199b:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 80519a2:	74 13                	je     0x80519b7
 80519a4:	31 c0                	xor    %eax,%eax
 80519a6:	88 d8                	mov    %bl,%al
 80519a8:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 80519ae:	8a 04 18             	mov    (%eax,%ebx,1),%al
 80519b1:	88 85 e4 fe ff ff    	mov    %al,0xfffffee4(%ebp)
 80519b7:	80 bd e4 fe ff ff 2b 	cmpb   $0x2b,0xfffffee4(%ebp)
 80519be:	74 0d                	je     0x80519cd
 80519c0:	80 bd e4 fe ff ff 3f 	cmpb   $0x3f,0xfffffee4(%ebp)
 80519c7:	0f 85 03 ff ff ff    	jne    0x80518d0
 80519cd:	8a 8d e4 fe ff ff    	mov    0xfffffee4(%ebp),%cl
 80519d3:	88 8d e8 fe ff ff    	mov    %cl,0xfffffee8(%ebp)
 80519d9:	eb 0d                	jmp    0x80519e8
 80519db:	90                   	nop    
 80519dc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80519e0:	ff 8d ec fe ff ff    	decl   0xfffffeec(%ebp)
 80519e6:	eb 3c                	jmp    0x8051a24
 80519e8:	0f be 85 ba fe ff ff 	movsbl 0xfffffeba(%ebp),%eax
 80519ef:	80 bd e8 fe ff ff 2b 	cmpb   $0x2b,0xfffffee8(%ebp)
 80519f6:	74 02                	je     0x80519fa
 80519f8:	0c 01                	or     $0x1,%al
 80519fa:	88 85 ba fe ff ff    	mov    %al,0xfffffeba(%ebp)
 8051a00:	89 fb                	mov    %edi,%ebx
 8051a02:	0f be c3             	movsbl %bl,%eax
 8051a05:	80 bd e8 fe ff ff 3f 	cmpb   $0x3f,0xfffffee8(%ebp)
 8051a0c:	74 02                	je     0x8051a10
 8051a0e:	0c 01                	or     $0x1,%al
 8051a10:	89 c7                	mov    %eax,%edi
 8051a12:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8051a18:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8051a1e:	0f 85 fc fe ff ff    	jne    0x8051920
 8051a24:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051a2b:	0f 84 d9 27 00 00    	je     0x805420a
 8051a31:	89 f9                	mov    %edi,%ecx
 8051a33:	84 c9                	test   %cl,%cl
 8051a35:	0f 84 aa 02 00 00    	je     0x8051ce5
 8051a3b:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051a3e:	8b 33                	mov    (%ebx),%esi
 8051a40:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051a46:	29 f0                	sub    %esi,%eax
 8051a48:	83 c0 03             	add    $0x3,%eax
 8051a4b:	8b 53 04             	mov    0x4(%ebx),%edx
 8051a4e:	39 d0                	cmp    %edx,%eax
 8051a50:	0f 86 d2 00 00 00    	jbe    0x8051b28
 8051a56:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8051a5c:	0f 84 91 28 00 00    	je     0x80542f3
 8051a62:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051a65:	89 d0                	mov    %edx,%eax
 8051a67:	01 d0                	add    %edx,%eax
 8051a69:	89 41 04             	mov    %eax,0x4(%ecx)
 8051a6c:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8051a71:	76 0d                	jbe    0x8051a80
 8051a73:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8051a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051a80:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051a83:	8b 43 04             	mov    0x4(%ebx),%eax
 8051a86:	50                   	push   %eax
 8051a87:	8b 03                	mov    (%ebx),%eax
 8051a89:	50                   	push   %eax
 8051a8a:	e8 5d 76 ff ff       	call   0x80490ec
 8051a8f:	89 c2                	mov    %eax,%edx
 8051a91:	89 13                	mov    %edx,(%ebx)
 8051a93:	83 c4 08             	add    $0x8,%esp
 8051a96:	85 d2                	test   %edx,%edx
 8051a98:	0f 84 0e fb ff ff    	je     0x80515ac
 8051a9e:	39 d6                	cmp    %edx,%esi
 8051aa0:	74 6b                	je     0x8051b0d
 8051aa2:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051aa8:	29 f0                	sub    %esi,%eax
 8051aaa:	01 d0                	add    %edx,%eax
 8051aac:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051ab2:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051ab8:	29 f0                	sub    %esi,%eax
 8051aba:	01 d0                	add    %edx,%eax
 8051abc:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8051ac2:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8051ac9:	74 10                	je     0x8051adb
 8051acb:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8051ad1:	29 f0                	sub    %esi,%eax
 8051ad3:	01 d0                	add    %edx,%eax
 8051ad5:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8051adb:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051ae2:	74 10                	je     0x8051af4
 8051ae4:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051aea:	29 f0                	sub    %esi,%eax
 8051aec:	01 d0                	add    %edx,%eax
 8051aee:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8051af4:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8051afb:	74 10                	je     0x8051b0d
 8051afd:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8051b03:	29 f0                	sub    %esi,%eax
 8051b05:	01 c2                	add    %eax,%edx
 8051b07:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8051b0d:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051b10:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051b16:	8b 31                	mov    (%ecx),%esi
 8051b18:	29 f0                	sub    %esi,%eax
 8051b1a:	83 c0 03             	add    $0x3,%eax
 8051b1d:	8b 51 04             	mov    0x4(%ecx),%edx
 8051b20:	39 d0                	cmp    %edx,%eax
 8051b22:	0f 87 2e ff ff ff    	ja     0x8051a56
 8051b28:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8051b2e:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051b35:	74 11                	je     0x8051b48
 8051b37:	31 c0                	xor    %eax,%eax
 8051b39:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8051b3f:	8a 42 fe             	mov    0xfffffffe(%edx),%al
 8051b42:	0f be 34 18          	movsbl (%eax,%ebx,1),%esi
 8051b46:	eb 04                	jmp    0x8051b4c
 8051b48:	0f be 72 fe          	movsbl 0xfffffffe(%edx),%esi
 8051b4c:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051b53:	74 13                	je     0x8051b68
 8051b55:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8051b5b:	0f be 41 2e          	movsbl 0x2e(%ecx),%eax
 8051b5f:	39 c6                	cmp    %eax,%esi
 8051b61:	74 0e                	je     0x8051b71
 8051b63:	e9 98 00 00 00       	jmp    0x8051c00
 8051b68:	83 fe 2e             	cmp    $0x2e,%esi
 8051b6b:	0f 85 8f 00 00 00    	jne    0x8051c00
 8051b71:	80 bd ba fe ff ff 00 	cmpb   $0x0,0xfffffeba(%ebp)
 8051b78:	0f 84 82 00 00 00    	je     0x8051c00
 8051b7e:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8051b84:	73 7a                	jae    0x8051c00
 8051b86:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051b8d:	74 11                	je     0x8051ba0
 8051b8f:	31 c0                	xor    %eax,%eax
 8051b91:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8051b97:	8a 02                	mov    (%edx),%al
 8051b99:	0f be 14 18          	movsbl (%eax,%ebx,1),%edx
 8051b9d:	eb 04                	jmp    0x8051ba3
 8051b9f:	90                   	nop    
 8051ba0:	0f be 12             	movsbl (%edx),%edx
 8051ba3:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8051baa:	74 14                	je     0x8051bc0
 8051bac:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8051bb2:	0f be 41 0a          	movsbl 0xa(%ecx),%eax
 8051bb6:	39 c2                	cmp    %eax,%edx
 8051bb8:	74 0b                	je     0x8051bc5
 8051bba:	eb 44                	jmp    0x8051c00
 8051bbc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8051bc0:	83 fa 0a             	cmp    $0xa,%edx
 8051bc3:	75 3b                	jne    0x8051c00
 8051bc5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8051bc8:	f6 c3 40             	test   $0x40,%bl
 8051bcb:	75 33                	jne    0x8051c00
 8051bcd:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051bd3:	2b 85 dc fe ff ff    	sub    0xfffffedc(%ebp),%eax
 8051bd9:	83 c0 fd             	add    $0xfffffffd,%eax
 8051bdc:	50                   	push   %eax
 8051bdd:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8051be3:	51                   	push   %ecx
 8051be4:	6a 0d                	push   $0xd
 8051be6:	e8 25 28 00 00       	call   0x8054410
 8051beb:	c6 85 bb fe ff ff 01 	movb   $0x1,0xfffffebb(%ebp)
 8051bf2:	83 c4 0c             	add    $0xc,%esp
 8051bf5:	8b b5 dc fe ff ff    	mov    0xfffffedc(%ebp),%esi
 8051bfb:	83 c6 03             	add    $0x3,%esi
 8051bfe:	eb 26                	jmp    0x8051c26
 8051c00:	8b b5 dc fe ff ff    	mov    0xfffffedc(%ebp),%esi
 8051c06:	83 c6 03             	add    $0x3,%esi
 8051c09:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051c0f:	29 f0                	sub    %esi,%eax
 8051c11:	83 c0 fd             	add    $0xfffffffd,%eax
 8051c14:	50                   	push   %eax
 8051c15:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8051c1b:	53                   	push   %ebx
 8051c1c:	6a 12                	push   $0x12
 8051c1e:	e8 ed 27 00 00       	call   0x8054410
 8051c23:	83 c4 0c             	add    $0xc,%esp
 8051c26:	89 b5 dc fe ff ff    	mov    %esi,0xfffffedc(%ebp)
 8051c2c:	e9 b4 00 00 00       	jmp    0x8051ce5
 8051c31:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8051c37:	0f 84 b6 26 00 00    	je     0x80542f3
 8051c3d:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051c40:	89 d0                	mov    %edx,%eax
 8051c42:	01 d0                	add    %edx,%eax
 8051c44:	89 43 04             	mov    %eax,0x4(%ebx)
 8051c47:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8051c4c:	76 07                	jbe    0x8051c55
 8051c4e:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8051c55:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051c58:	8b 41 04             	mov    0x4(%ecx),%eax
 8051c5b:	50                   	push   %eax
 8051c5c:	8b 01                	mov    (%ecx),%eax
 8051c5e:	50                   	push   %eax
 8051c5f:	e8 88 74 ff ff       	call   0x80490ec
 8051c64:	89 c2                	mov    %eax,%edx
 8051c66:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051c69:	83 c4 08             	add    $0x8,%esp
 8051c6c:	89 13                	mov    %edx,(%ebx)
 8051c6e:	85 d2                	test   %edx,%edx
 8051c70:	0f 84 36 f9 ff ff    	je     0x80515ac
 8051c76:	39 d6                	cmp    %edx,%esi
 8051c78:	74 6b                	je     0x8051ce5
 8051c7a:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051c80:	29 f0                	sub    %esi,%eax
 8051c82:	01 d0                	add    %edx,%eax
 8051c84:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051c8a:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051c90:	29 f0                	sub    %esi,%eax
 8051c92:	01 d0                	add    %edx,%eax
 8051c94:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8051c9a:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8051ca1:	74 10                	je     0x8051cb3
 8051ca3:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8051ca9:	29 f0                	sub    %esi,%eax
 8051cab:	01 d0                	add    %edx,%eax
 8051cad:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8051cb3:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051cba:	74 10                	je     0x8051ccc
 8051cbc:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051cc2:	29 f0                	sub    %esi,%eax
 8051cc4:	01 d0                	add    %edx,%eax
 8051cc6:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8051ccc:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8051cd3:	74 10                	je     0x8051ce5
 8051cd5:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8051cdb:	29 f0                	sub    %esi,%eax
 8051cdd:	01 c2                	add    %eax,%edx
 8051cdf:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8051ce5:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051ce8:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051cee:	8b 31                	mov    (%ecx),%esi
 8051cf0:	29 f0                	sub    %esi,%eax
 8051cf2:	83 c0 03             	add    $0x3,%eax
 8051cf5:	8b 51 04             	mov    0x4(%ecx),%edx
 8051cf8:	39 d0                	cmp    %edx,%eax
 8051cfa:	0f 87 31 ff ff ff    	ja     0x8051c31
 8051d00:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8051d06:	53                   	push   %ebx
 8051d07:	89 d8                	mov    %ebx,%eax
 8051d09:	2b 85 cc fe ff ff    	sub    0xfffffecc(%ebp),%eax
 8051d0f:	50                   	push   %eax
 8051d10:	8b 8d cc fe ff ff    	mov    0xfffffecc(%ebp),%ecx
 8051d16:	51                   	push   %ecx
 8051d17:	80 bd bb fe ff ff 00 	cmpb   $0x0,0xfffffebb(%ebp)
 8051d1e:	74 07                	je     0x8051d27
 8051d20:	b8 10 00 00 00       	mov    $0x10,%eax
 8051d25:	eb 05                	jmp    0x8051d2c
 8051d27:	b8 0f 00 00 00       	mov    $0xf,%eax
 8051d2c:	50                   	push   %eax
 8051d2d:	e8 2e 27 00 00       	call   0x8054460
 8051d32:	c7 85 d0 fe ff ff 00 	movl   $0x0,0xfffffed0(%ebp)
 8051d39:	00 00 00 
 8051d3c:	83 85 dc fe ff ff 03 	addl   $0x3,0xfffffedc(%ebp)
 8051d43:	83 c4 10             	add    $0x10,%esp
 8051d46:	80 bd ba fe ff ff 00 	cmpb   $0x0,0xfffffeba(%ebp)
 8051d4d:	0f 85 b7 24 00 00    	jne    0x805420a
 8051d53:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051d56:	8b 33                	mov    (%ebx),%esi
 8051d58:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051d5e:	29 f0                	sub    %esi,%eax
 8051d60:	83 c0 03             	add    $0x3,%eax
 8051d63:	8b 53 04             	mov    0x4(%ebx),%edx
 8051d66:	39 d0                	cmp    %edx,%eax
 8051d68:	0f 86 ce 00 00 00    	jbe    0x8051e3c
 8051d6e:	89 f6                	mov    %esi,%esi
 8051d70:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8051d76:	0f 84 77 25 00 00    	je     0x80542f3
 8051d7c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051d7f:	89 d0                	mov    %edx,%eax
 8051d81:	01 d0                	add    %edx,%eax
 8051d83:	89 41 04             	mov    %eax,0x4(%ecx)
 8051d86:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8051d8b:	76 07                	jbe    0x8051d94
 8051d8d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8051d94:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051d97:	8b 43 04             	mov    0x4(%ebx),%eax
 8051d9a:	50                   	push   %eax
 8051d9b:	8b 03                	mov    (%ebx),%eax
 8051d9d:	50                   	push   %eax
 8051d9e:	e8 49 73 ff ff       	call   0x80490ec
 8051da3:	89 c2                	mov    %eax,%edx
 8051da5:	89 13                	mov    %edx,(%ebx)
 8051da7:	83 c4 08             	add    $0x8,%esp
 8051daa:	85 d2                	test   %edx,%edx
 8051dac:	0f 84 fa f7 ff ff    	je     0x80515ac
 8051db2:	39 d6                	cmp    %edx,%esi
 8051db4:	74 6b                	je     0x8051e21
 8051db6:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051dbc:	29 f0                	sub    %esi,%eax
 8051dbe:	01 d0                	add    %edx,%eax
 8051dc0:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051dc6:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051dcc:	29 f0                	sub    %esi,%eax
 8051dce:	01 d0                	add    %edx,%eax
 8051dd0:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8051dd6:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8051ddd:	74 10                	je     0x8051def
 8051ddf:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8051de5:	29 f0                	sub    %esi,%eax
 8051de7:	01 d0                	add    %edx,%eax
 8051de9:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8051def:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051df6:	74 10                	je     0x8051e08
 8051df8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051dfe:	29 f0                	sub    %esi,%eax
 8051e00:	01 d0                	add    %edx,%eax
 8051e02:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8051e08:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8051e0f:	74 10                	je     0x8051e21
 8051e11:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8051e17:	29 f0                	sub    %esi,%eax
 8051e19:	01 c2                	add    %eax,%edx
 8051e1b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8051e21:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051e24:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051e2a:	8b 31                	mov    (%ecx),%esi
 8051e2c:	29 f0                	sub    %esi,%eax
 8051e2e:	83 c0 03             	add    $0x3,%eax
 8051e31:	8b 51 04             	mov    0x4(%ecx),%edx
 8051e34:	39 d0                	cmp    %edx,%eax
 8051e36:	0f 87 34 ff ff ff    	ja     0x8051d70
 8051e3c:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8051e42:	53                   	push   %ebx
 8051e43:	6a 03                	push   $0x3
 8051e45:	8b 8d cc fe ff ff    	mov    0xfffffecc(%ebp),%ecx
 8051e4b:	51                   	push   %ecx
 8051e4c:	6a 13                	push   $0x13
 8051e4e:	e8 0d 26 00 00       	call   0x8054460
 8051e53:	83 c3 03             	add    $0x3,%ebx
 8051e56:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8051e5c:	83 c4 10             	add    $0x10,%esp
 8051e5f:	e9 a6 23 00 00       	jmp    0x805420a
 8051e64:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8051e6a:	89 9d cc fe ff ff    	mov    %ebx,0xfffffecc(%ebp)
 8051e70:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051e73:	89 d8                	mov    %ebx,%eax
 8051e75:	e9 c3 00 00 00       	jmp    0x8051f3d
 8051e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8051e80:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8051e86:	0f 84 67 24 00 00    	je     0x80542f3
 8051e8c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051e8f:	89 d0                	mov    %edx,%eax
 8051e91:	01 d0                	add    %edx,%eax
 8051e93:	89 43 04             	mov    %eax,0x4(%ebx)
 8051e96:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8051e9b:	76 07                	jbe    0x8051ea4
 8051e9d:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8051ea4:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051ea7:	8b 41 04             	mov    0x4(%ecx),%eax
 8051eaa:	50                   	push   %eax
 8051eab:	8b 01                	mov    (%ecx),%eax
 8051ead:	50                   	push   %eax
 8051eae:	e8 39 72 ff ff       	call   0x80490ec
 8051eb3:	89 c2                	mov    %eax,%edx
 8051eb5:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051eb8:	83 c4 08             	add    $0x8,%esp
 8051ebb:	89 13                	mov    %edx,(%ebx)
 8051ebd:	85 d2                	test   %edx,%edx
 8051ebf:	0f 84 e7 f6 ff ff    	je     0x80515ac
 8051ec5:	39 d6                	cmp    %edx,%esi
 8051ec7:	74 6b                	je     0x8051f34
 8051ec9:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051ecf:	29 f0                	sub    %esi,%eax
 8051ed1:	01 d0                	add    %edx,%eax
 8051ed3:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051ed9:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051edf:	29 f0                	sub    %esi,%eax
 8051ee1:	01 d0                	add    %edx,%eax
 8051ee3:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8051ee9:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8051ef0:	74 10                	je     0x8051f02
 8051ef2:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8051ef8:	29 f0                	sub    %esi,%eax
 8051efa:	01 d0                	add    %edx,%eax
 8051efc:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8051f02:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8051f09:	74 10                	je     0x8051f1b
 8051f0b:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8051f11:	29 f0                	sub    %esi,%eax
 8051f13:	01 d0                	add    %edx,%eax
 8051f15:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8051f1b:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8051f22:	74 10                	je     0x8051f34
 8051f24:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8051f2a:	29 f0                	sub    %esi,%eax
 8051f2c:	01 c2                	add    %eax,%edx
 8051f2e:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8051f34:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051f37:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051f3d:	8b 31                	mov    (%ecx),%esi
 8051f3f:	29 f0                	sub    %esi,%eax
 8051f41:	40                   	inc    %eax
 8051f42:	8b 51 04             	mov    0x4(%ecx),%edx
 8051f45:	39 d0                	cmp    %edx,%eax
 8051f47:	0f 87 33 ff ff ff    	ja     0x8051e80
 8051f4d:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8051f53:	c6 03 03             	movb   $0x3,(%ebx)
 8051f56:	e9 f3 1f 00 00       	jmp    0x8053f4e
 8051f5b:	90                   	nop    
 8051f5c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8051f60:	c6 85 b9 fe ff ff 00 	movb   $0x0,0xfffffeb9(%ebp)
 8051f67:	8b 8d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ecx
 8051f6d:	39 8d ec fe ff ff    	cmp    %ecx,0xfffffeec(%ebp)
 8051f73:	0f 84 17 23 00 00    	je     0x8054290
 8051f79:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051f7c:	8b 1b                	mov    (%ebx),%ebx
 8051f7e:	89 9d a8 fe ff ff    	mov    %ebx,0xfffffea8(%ebp)
 8051f84:	89 de                	mov    %ebx,%esi
 8051f86:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051f8c:	29 d8                	sub    %ebx,%eax
 8051f8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051f91:	83 c0 22             	add    $0x22,%eax
 8051f94:	8b 51 04             	mov    0x4(%ecx),%edx
 8051f97:	e9 d6 00 00 00       	jmp    0x8052072
 8051f9c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8051fa0:	81 ff 00 00 01 00    	cmp    $0x10000,%edi
 8051fa6:	0f 84 47 23 00 00    	je     0x80542f3
 8051fac:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051faf:	89 f8                	mov    %edi,%eax
 8051fb1:	01 f8                	add    %edi,%eax
 8051fb3:	89 43 04             	mov    %eax,0x4(%ebx)
 8051fb6:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8051fbb:	76 07                	jbe    0x8051fc4
 8051fbd:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8051fc4:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8051fc7:	8b 41 04             	mov    0x4(%ecx),%eax
 8051fca:	50                   	push   %eax
 8051fcb:	8b 01                	mov    (%ecx),%eax
 8051fcd:	50                   	push   %eax
 8051fce:	e8 19 71 ff ff       	call   0x80490ec
 8051fd3:	89 c2                	mov    %eax,%edx
 8051fd5:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8051fd8:	83 c4 08             	add    $0x8,%esp
 8051fdb:	89 13                	mov    %edx,(%ebx)
 8051fdd:	85 d2                	test   %edx,%edx
 8051fdf:	0f 84 c7 f5 ff ff    	je     0x80515ac
 8051fe5:	39 d6                	cmp    %edx,%esi
 8051fe7:	74 6b                	je     0x8052054
 8051fe9:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8051fef:	29 f0                	sub    %esi,%eax
 8051ff1:	01 d0                	add    %edx,%eax
 8051ff3:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8051ff9:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8051fff:	29 f0                	sub    %esi,%eax
 8052001:	01 d0                	add    %edx,%eax
 8052003:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052009:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052010:	74 10                	je     0x8052022
 8052012:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052018:	29 f0                	sub    %esi,%eax
 805201a:	01 d0                	add    %edx,%eax
 805201c:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052022:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052029:	74 10                	je     0x805203b
 805202b:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052031:	29 f0                	sub    %esi,%eax
 8052033:	01 d0                	add    %edx,%eax
 8052035:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 805203b:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052042:	74 10                	je     0x8052054
 8052044:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 805204a:	29 f0                	sub    %esi,%eax
 805204c:	01 c2                	add    %eax,%edx
 805204e:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052054:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052057:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805205d:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052060:	8b 09                	mov    (%ecx),%ecx
 8052062:	89 8d a8 fe ff ff    	mov    %ecx,0xfffffea8(%ebp)
 8052068:	89 ce                	mov    %ecx,%esi
 805206a:	29 c8                	sub    %ecx,%eax
 805206c:	83 c0 22             	add    $0x22,%eax
 805206f:	8b 53 04             	mov    0x4(%ebx),%edx
 8052072:	89 d7                	mov    %edx,%edi
 8052074:	39 d0                	cmp    %edx,%eax
 8052076:	0f 87 24 ff ff ff    	ja     0x8051fa0
 805207c:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8052082:	89 8d cc fe ff ff    	mov    %ecx,0xfffffecc(%ebp)
 8052088:	8b b5 a8 fe ff ff    	mov    0xfffffea8(%ebp),%esi
 805208e:	89 c8                	mov    %ecx,%eax
 8052090:	29 f0                	sub    %esi,%eax
 8052092:	40                   	inc    %eax
 8052093:	39 d0                	cmp    %edx,%eax
 8052095:	0f 86 d2 00 00 00    	jbe    0x805216d
 805209b:	90                   	nop    
 805209c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80520a0:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 80520a6:	0f 84 47 22 00 00    	je     0x80542f3
 80520ac:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80520af:	89 d0                	mov    %edx,%eax
 80520b1:	01 d0                	add    %edx,%eax
 80520b3:	89 43 04             	mov    %eax,0x4(%ebx)
 80520b6:	3d 00 00 01 00       	cmp    $0x10000,%eax
 80520bb:	76 07                	jbe    0x80520c4
 80520bd:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 80520c4:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80520c7:	8b 41 04             	mov    0x4(%ecx),%eax
 80520ca:	50                   	push   %eax
 80520cb:	8b 01                	mov    (%ecx),%eax
 80520cd:	50                   	push   %eax
 80520ce:	e8 19 70 ff ff       	call   0x80490ec
 80520d3:	89 c2                	mov    %eax,%edx
 80520d5:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80520d8:	83 c4 08             	add    $0x8,%esp
 80520db:	89 13                	mov    %edx,(%ebx)
 80520dd:	85 d2                	test   %edx,%edx
 80520df:	0f 84 c7 f4 ff ff    	je     0x80515ac
 80520e5:	39 d6                	cmp    %edx,%esi
 80520e7:	74 6b                	je     0x8052154
 80520e9:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80520ef:	29 f0                	sub    %esi,%eax
 80520f1:	01 d0                	add    %edx,%eax
 80520f3:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 80520f9:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 80520ff:	29 f0                	sub    %esi,%eax
 8052101:	01 d0                	add    %edx,%eax
 8052103:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052109:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052110:	74 10                	je     0x8052122
 8052112:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052118:	29 f0                	sub    %esi,%eax
 805211a:	01 d0                	add    %edx,%eax
 805211c:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052122:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052129:	74 10                	je     0x805213b
 805212b:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052131:	29 f0                	sub    %esi,%eax
 8052133:	01 d0                	add    %edx,%eax
 8052135:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 805213b:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052142:	74 10                	je     0x8052154
 8052144:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 805214a:	29 f0                	sub    %esi,%eax
 805214c:	01 c2                	add    %eax,%edx
 805214e:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052154:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052157:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805215d:	8b 31                	mov    (%ecx),%esi
 805215f:	29 f0                	sub    %esi,%eax
 8052161:	40                   	inc    %eax
 8052162:	8b 51 04             	mov    0x4(%ecx),%edx
 8052165:	39 d0                	cmp    %edx,%eax
 8052167:	0f 87 33 ff ff ff    	ja     0x80520a0
 805216d:	8b 95 dc fe ff ff    	mov    0xfffffedc(%ebp),%edx
 8052173:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 8052179:	ff 85 dc fe ff ff    	incl   0xfffffedc(%ebp)
 805217f:	80 38 5e             	cmpb   $0x5e,(%eax)
 8052182:	75 04                	jne    0x8052188
 8052184:	b0 05                	mov    $0x5,%al
 8052186:	eb 02                	jmp    0x805218a
 8052188:	b0 04                	mov    $0x4,%al
 805218a:	88 02                	mov    %al,(%edx)
 805218c:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8052192:	80 3a 5e             	cmpb   $0x5e,(%edx)
 8052195:	75 0b                	jne    0x80521a2
 8052197:	8d 42 01             	lea    0x1(%edx),%eax
 805219a:	89 85 ec fe ff ff    	mov    %eax,0xfffffeec(%ebp)
 80521a0:	89 c2                	mov    %eax,%edx
 80521a2:	89 95 e0 fe ff ff    	mov    %edx,0xfffffee0(%ebp)
 80521a8:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80521ab:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80521b1:	8b 33                	mov    (%ebx),%esi
 80521b3:	29 f0                	sub    %esi,%eax
 80521b5:	40                   	inc    %eax
 80521b6:	8b 53 04             	mov    0x4(%ebx),%edx
 80521b9:	39 d0                	cmp    %edx,%eax
 80521bb:	0f 86 ca 00 00 00    	jbe    0x805228b
 80521c1:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 80521c7:	0f 84 26 21 00 00    	je     0x80542f3
 80521cd:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80521d0:	89 d0                	mov    %edx,%eax
 80521d2:	01 d0                	add    %edx,%eax
 80521d4:	89 41 04             	mov    %eax,0x4(%ecx)
 80521d7:	3d 00 00 01 00       	cmp    $0x10000,%eax
 80521dc:	76 07                	jbe    0x80521e5
 80521de:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 80521e5:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80521e8:	8b 43 04             	mov    0x4(%ebx),%eax
 80521eb:	50                   	push   %eax
 80521ec:	8b 03                	mov    (%ebx),%eax
 80521ee:	50                   	push   %eax
 80521ef:	e8 f8 6e ff ff       	call   0x80490ec
 80521f4:	89 c2                	mov    %eax,%edx
 80521f6:	89 13                	mov    %edx,(%ebx)
 80521f8:	83 c4 08             	add    $0x8,%esp
 80521fb:	85 d2                	test   %edx,%edx
 80521fd:	0f 84 a9 f3 ff ff    	je     0x80515ac
 8052203:	39 d6                	cmp    %edx,%esi
 8052205:	74 6b                	je     0x8052272
 8052207:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805220d:	29 f0                	sub    %esi,%eax
 805220f:	01 d0                	add    %edx,%eax
 8052211:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052217:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805221d:	29 f0                	sub    %esi,%eax
 805221f:	01 d0                	add    %edx,%eax
 8052221:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052227:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805222e:	74 10                	je     0x8052240
 8052230:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052236:	29 f0                	sub    %esi,%eax
 8052238:	01 d0                	add    %edx,%eax
 805223a:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052240:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052247:	74 10                	je     0x8052259
 8052249:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805224f:	29 f0                	sub    %esi,%eax
 8052251:	01 d0                	add    %edx,%eax
 8052253:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052259:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052260:	74 10                	je     0x8052272
 8052262:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8052268:	29 f0                	sub    %esi,%eax
 805226a:	01 c2                	add    %eax,%edx
 805226c:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052272:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052275:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805227b:	8b 31                	mov    (%ecx),%esi
 805227d:	29 f0                	sub    %esi,%eax
 805227f:	40                   	inc    %eax
 8052280:	8b 51 04             	mov    0x4(%ecx),%edx
 8052283:	39 d0                	cmp    %edx,%eax
 8052285:	0f 87 36 ff ff ff    	ja     0x80521c1
 805228b:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052291:	c6 03 20             	movb   $0x20,(%ebx)
 8052294:	43                   	inc    %ebx
 8052295:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 805229b:	89 df                	mov    %ebx,%edi
 805229d:	31 c0                	xor    %eax,%eax
 805229f:	fc                   	cld    
 80522a0:	b9 08 00 00 00       	mov    $0x8,%ecx
 80522a5:	f3 ab                	repz stos %eax,%es:(%edi)
 80522a7:	80 7b fe 05          	cmpb   $0x5,0xfffffffe(%ebx)
 80522ab:	0f 85 a0 03 00 00    	jne    0x8052651
 80522b1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80522b4:	f6 c7 01             	test   $0x1,%bh
 80522b7:	0f 84 94 03 00 00    	je     0x8052651
 80522bd:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 80522c3:	80 49 01 04          	orb    $0x4,0x1(%ecx)
 80522c7:	e9 85 03 00 00       	jmp    0x8052651
 80522cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80522d0:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 80522d6:	80 bd b9 fe ff ff 00 	cmpb   $0x0,0xfffffeb9(%ebp)
 80522dd:	74 12                	je     0x80522f1
 80522df:	80 bd e8 fe ff ff 2d 	cmpb   $0x2d,0xfffffee8(%ebp)
 80522e6:	75 5a                	jne    0x8052342
 80522e8:	80 3a 5d             	cmpb   $0x5d,(%edx)
 80522eb:	0f 85 74 1f 00 00    	jne    0x8054265
 80522f1:	80 bd e8 fe ff ff 2d 	cmpb   $0x2d,0xfffffee8(%ebp)
 80522f8:	75 48                	jne    0x8052342
 80522fa:	8d 42 fe             	lea    0xfffffffe(%edx),%eax
 80522fd:	3b 45 08             	cmp    0x8(%ebp),%eax
 8052300:	72 06                	jb     0x8052308
 8052302:	80 7a fe 5b          	cmpb   $0x5b,0xfffffffe(%edx)
 8052306:	74 3a                	je     0x8052342
 8052308:	8d 42 fd             	lea    0xfffffffd(%edx),%eax
 805230b:	3b 45 08             	cmp    0x8(%ebp),%eax
 805230e:	72 0c                	jb     0x805231c
 8052310:	80 7a fd 5b          	cmpb   $0x5b,0xfffffffd(%edx)
 8052314:	75 06                	jne    0x805231c
 8052316:	80 7a fe 5e          	cmpb   $0x5e,0xfffffffe(%edx)
 805231a:	74 26                	je     0x8052342
 805231c:	80 3a 5d             	cmpb   $0x5d,(%edx)
 805231f:	74 21                	je     0x8052342
 8052321:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052327:	53                   	push   %ebx
 8052328:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805232b:	51                   	push   %ecx
 805232c:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8052332:	53                   	push   %ebx
 8052333:	8b 8d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ecx
 8052339:	51                   	push   %ecx
 805233a:	8d 85 ec fe ff ff    	lea    0xfffffeec(%ebp),%eax
 8052340:	eb 3e                	jmp    0x8052380
 8052342:	80 3a 2d             	cmpb   $0x2d,(%edx)
 8052345:	75 5c                	jne    0x80523a3
 8052347:	80 7a 01 5d          	cmpb   $0x5d,0x1(%edx)
 805234b:	74 56                	je     0x80523a3
 805234d:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8052353:	0f 84 77 1f 00 00    	je     0x80542d0
 8052359:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 805235f:	8d 85 ec fe ff ff    	lea    0xfffffeec(%ebp),%eax
 8052365:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 805236b:	53                   	push   %ebx
 805236c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805236f:	51                   	push   %ecx
 8052370:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8052376:	53                   	push   %ebx
 8052377:	8b 8d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ecx
 805237d:	51                   	push   %ecx
 805237e:	89 f6                	mov    %esi,%esi
 8052380:	50                   	push   %eax
 8052381:	e8 3a 22 00 00       	call   0x80545c0
 8052386:	89 c6                	mov    %eax,%esi
 8052388:	83 c4 14             	add    $0x14,%esp
 805238b:	85 f6                	test   %esi,%esi
 805238d:	0f 84 be 02 00 00    	je     0x8052651
 8052393:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8052396:	50                   	push   %eax
 8052397:	e8 50 6e ff ff       	call   0x80491ec
 805239c:	89 f0                	mov    %esi,%eax
 805239e:	e9 5f 20 00 00       	jmp    0x8054402
 80523a3:	f6 45 10 04          	testb  $0x4,0x10(%ebp)
 80523a7:	0f 84 73 02 00 00    	je     0x8052620
 80523ad:	80 bd e8 fe ff ff 5b 	cmpb   $0x5b,0xfffffee8(%ebp)
 80523b4:	0f 85 66 02 00 00    	jne    0x8052620
 80523ba:	80 3a 3a             	cmpb   $0x3a,(%edx)
 80523bd:	0f 85 5d 02 00 00    	jne    0x8052620
 80523c3:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 80523c9:	0f 84 01 1f 00 00    	je     0x80542d0
 80523cf:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 80523d5:	c6 85 e4 fe ff ff 00 	movb   $0x0,0xfffffee4(%ebp)
 80523dc:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 80523e2:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 80523e8:	0f 84 a2 1e 00 00    	je     0x8054290
 80523ee:	eb 1d                	jmp    0x805240d
 80523f0:	31 c0                	xor    %eax,%eax
 80523f2:	8a 85 e4 fe ff ff    	mov    0xfffffee4(%ebp),%al
 80523f8:	8a 9d e8 fe ff ff    	mov    0xfffffee8(%ebp),%bl
 80523fe:	88 1c 30             	mov    %bl,(%eax,%esi,1)
 8052401:	fe 85 e4 fe ff ff    	incb   0xfffffee4(%ebp)
 8052407:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 805240d:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8052413:	0f 84 b7 1e 00 00    	je     0x80542d0
 8052419:	8a 12                	mov    (%edx),%dl
 805241b:	88 95 e8 fe ff ff    	mov    %dl,0xfffffee8(%ebp)
 8052421:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8052427:	8d b5 f0 fe ff ff    	lea    0xfffffef0(%ebp),%esi
 805242d:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8052434:	74 1a                	je     0x8052450
 8052436:	31 c0                	xor    %eax,%eax
 8052438:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 805243e:	88 d0                	mov    %dl,%al
 8052440:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8052443:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8052449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8052450:	80 bd e8 fe ff ff 3a 	cmpb   $0x3a,0xfffffee8(%ebp)
 8052457:	75 0b                	jne    0x8052464
 8052459:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 805245f:	80 38 5d             	cmpb   $0x5d,(%eax)
 8052462:	74 12                	je     0x8052476
 8052464:	8b 9d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ebx
 805246a:	39 9d ec fe ff ff    	cmp    %ebx,0xfffffeec(%ebp)
 8052470:	0f 85 7a ff ff ff    	jne    0x80523f0
 8052476:	31 c0                	xor    %eax,%eax
 8052478:	8a 85 e4 fe ff ff    	mov    0xfffffee4(%ebp),%al
 805247e:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 8052482:	80 bd e8 fe ff ff 3a 	cmpb   $0x3a,0xfffffee8(%ebp)
 8052489:	0f 85 53 01 00 00    	jne    0x80525e2
 805248f:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 8052495:	80 38 5d             	cmpb   $0x5d,(%eax)
 8052498:	0f 85 44 01 00 00    	jne    0x80525e2
 805249e:	bf c0 96 05 08       	mov    $0x80596c0,%edi
 80524a3:	b8 06 00 00 00       	mov    $0x6,%eax
 80524a8:	89 c1                	mov    %eax,%ecx
 80524aa:	fc                   	cld    
 80524ab:	a8 00                	test   $0x0,%al
 80524ad:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 80524af:	0f 94 c3             	sete   %bl
 80524b2:	88 9d b8 fe ff ff    	mov    %bl,0xfffffeb8(%ebp)
 80524b8:	8d b5 f0 fe ff ff    	lea    0xfffffef0(%ebp),%esi
 80524be:	bf c6 96 05 08       	mov    $0x80596c6,%edi
 80524c3:	89 c1                	mov    %eax,%ecx
 80524c5:	fc                   	cld    
 80524c6:	a8 00                	test   $0x0,%al
 80524c8:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 80524ca:	0f 94 c3             	sete   %bl
 80524cd:	88 9d b7 fe ff ff    	mov    %bl,0xfffffeb7(%ebp)
 80524d3:	8d 85 f0 fe ff ff    	lea    0xfffffef0(%ebp),%eax
 80524d9:	50                   	push   %eax
 80524da:	e8 7d 6b ff ff       	call   0x804905c
 80524df:	89 c6                	mov    %eax,%esi
 80524e1:	83 c4 04             	add    $0x4,%esp
 80524e4:	85 f6                	test   %esi,%esi
 80524e6:	0f 84 8c 1d 00 00    	je     0x8054278
 80524ec:	8b 8d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ecx
 80524f2:	39 8d ec fe ff ff    	cmp    %ecx,0xfffffeec(%ebp)
 80524f8:	0f 84 d2 1d 00 00    	je     0x80542d0
 80524fe:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8052504:	8b 9d d8 fe ff ff    	mov    0xfffffed8(%ebp),%ebx
 805250a:	39 9d ec fe ff ff    	cmp    %ebx,0xfffffeec(%ebp)
 8052510:	0f 84 7a 1d 00 00    	je     0x8054290
 8052516:	c7 85 a8 fe ff ff 00 	movl   $0x0,0xfffffea8(%ebp)
 805251d:	00 00 00 
 8052520:	bf 01 00 00 00       	mov    $0x1,%edi
 8052525:	56                   	push   %esi
 8052526:	8b 8d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ecx
 805252c:	51                   	push   %ecx
 805252d:	e8 3a 6c ff ff       	call   0x804916c
 8052532:	83 c4 04             	add    $0x4,%esp
 8052535:	50                   	push   %eax
 8052536:	e8 b1 69 ff ff       	call   0x8048eec
 805253b:	83 c4 08             	add    $0x8,%esp
 805253e:	85 c0                	test   %eax,%eax
 8052540:	74 27                	je     0x8052569
 8052542:	8a 95 a8 fe ff ff    	mov    0xfffffea8(%ebp),%dl
 8052548:	88 d0                	mov    %dl,%al
 805254a:	c0 e8 03             	shr    $0x3,%al
 805254d:	31 db                	xor    %ebx,%ebx
 805254f:	88 c3                	mov    %al,%bl
 8052551:	83 e2 07             	and    $0x7,%edx
 8052554:	89 f8                	mov    %edi,%eax
 8052556:	89 d1                	mov    %edx,%ecx
 8052558:	d3 e0                	shl    %cl,%eax
 805255a:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8052560:	89 9d ac fe ff ff    	mov    %ebx,0xfffffeac(%ebp)
 8052566:	08 04 0b             	or     %al,(%ebx,%ecx,1)
 8052569:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8052570:	74 51                	je     0x80525c3
 8052572:	80 bd b7 fe ff ff 00 	cmpb   $0x0,0xfffffeb7(%ebp)
 8052579:	75 09                	jne    0x8052584
 805257b:	80 bd b8 fe ff ff 00 	cmpb   $0x0,0xfffffeb8(%ebp)
 8052582:	74 3f                	je     0x80525c3
 8052584:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8052589:	8b 9d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ebx
 805258f:	f6 44 58 01 03       	testb  $0x3,0x1(%eax,%ebx,2)
 8052594:	74 2d                	je     0x80525c3
 8052596:	8a 95 a8 fe ff ff    	mov    0xfffffea8(%ebp),%dl
 805259c:	88 d0                	mov    %dl,%al
 805259e:	c0 e8 03             	shr    $0x3,%al
 80525a1:	31 c9                	xor    %ecx,%ecx
 80525a3:	88 c1                	mov    %al,%cl
 80525a5:	89 8d ac fe ff ff    	mov    %ecx,0xfffffeac(%ebp)
 80525ab:	83 e2 07             	and    $0x7,%edx
 80525ae:	89 f8                	mov    %edi,%eax
 80525b0:	89 d1                	mov    %edx,%ecx
 80525b2:	d3 e0                	shl    %cl,%eax
 80525b4:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80525ba:	8b 8d ac fe ff ff    	mov    0xfffffeac(%ebp),%ecx
 80525c0:	08 04 19             	or     %al,(%ecx,%ebx,1)
 80525c3:	ff 85 a8 fe ff ff    	incl   0xfffffea8(%ebp)
 80525c9:	81 bd a8 fe ff ff ff 	cmpl   $0xff,0xfffffea8(%ebp)
 80525d0:	00 00 00 
 80525d3:	0f 8e 4c ff ff ff    	jle    0x8052525
 80525d9:	c6 85 b9 fe ff ff 01 	movb   $0x1,0xfffffeb9(%ebp)
 80525e0:	eb 6f                	jmp    0x8052651
 80525e2:	8a 9d e4 fe ff ff    	mov    0xfffffee4(%ebp),%bl
 80525e8:	80 fb ff             	cmp    $0xff,%bl
 80525eb:	74 18                	je     0x8052605
 80525ed:	8d 76 00             	lea    0x0(%esi),%esi
 80525f0:	ff 8d ec fe ff ff    	decl   0xfffffeec(%ebp)
 80525f6:	fe 8d e4 fe ff ff    	decb   0xfffffee4(%ebp)
 80525fc:	80 bd e4 fe ff ff ff 	cmpb   $0xff,0xfffffee4(%ebp)
 8052603:	75 eb                	jne    0x80525f0
 8052605:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 805260b:	80 49 0b 08          	orb    $0x8,0xb(%ecx)
 805260f:	80 49 07 04          	orb    $0x4,0x7(%ecx)
 8052613:	c6 85 b9 fe ff ff 00 	movb   $0x0,0xfffffeb9(%ebp)
 805261a:	eb 35                	jmp    0x8052651
 805261c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052620:	c6 85 b9 fe ff ff 00 	movb   $0x0,0xfffffeb9(%ebp)
 8052627:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 805262d:	c0 e8 03             	shr    $0x3,%al
 8052630:	31 d2                	xor    %edx,%edx
 8052632:	88 c2                	mov    %al,%dl
 8052634:	8a 9d e8 fe ff ff    	mov    0xfffffee8(%ebp),%bl
 805263a:	83 e3 07             	and    $0x7,%ebx
 805263d:	89 de                	mov    %ebx,%esi
 805263f:	b8 01 00 00 00       	mov    $0x1,%eax
 8052644:	89 f1                	mov    %esi,%ecx
 8052646:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 805264c:	d3 e0                	shl    %cl,%eax
 805264e:	08 04 1a             	or     %al,(%edx,%ebx,1)
 8052651:	8b b5 ec fe ff ff    	mov    0xfffffeec(%ebp),%esi
 8052657:	3b b5 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%esi
 805265d:	0f 84 2d 1c 00 00    	je     0x8054290
 8052663:	8a 0e                	mov    (%esi),%cl
 8052665:	88 8d e8 fe ff ff    	mov    %cl,0xfffffee8(%ebp)
 805266b:	8d 7e 01             	lea    0x1(%esi),%edi
 805266e:	89 bd ec fe ff ff    	mov    %edi,0xfffffeec(%ebp)
 8052674:	8b 55 10             	mov    0x10(%ebp),%edx
 8052677:	83 e2 01             	and    $0x1,%edx
 805267a:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8052681:	74 13                	je     0x8052696
 8052683:	31 c0                	xor    %eax,%eax
 8052685:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 805268b:	88 c8                	mov    %cl,%al
 805268d:	8a 04 18             	mov    (%eax,%ebx,1),%al
 8052690:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8052696:	85 d2                	test   %edx,%edx
 8052698:	74 66                	je     0x8052700
 805269a:	80 bd e8 fe ff ff 5c 	cmpb   $0x5c,0xfffffee8(%ebp)
 80526a1:	75 5d                	jne    0x8052700
 80526a3:	3b bd d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edi
 80526a9:	0f 84 2f 01 00 00    	je     0x80527de
 80526af:	8a 4e 01             	mov    0x1(%esi),%cl
 80526b2:	88 8d e4 fe ff ff    	mov    %cl,0xfffffee4(%ebp)
 80526b8:	83 c6 02             	add    $0x2,%esi
 80526bb:	89 b5 ec fe ff ff    	mov    %esi,0xfffffeec(%ebp)
 80526c1:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 80526c8:	74 16                	je     0x80526e0
 80526ca:	31 c0                	xor    %eax,%eax
 80526cc:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 80526d2:	88 c8                	mov    %cl,%al
 80526d4:	8a 04 18             	mov    (%eax,%ebx,1),%al
 80526d7:	88 85 e4 fe ff ff    	mov    %al,0xfffffee4(%ebp)
 80526dd:	8d 76 00             	lea    0x0(%esi),%esi
 80526e0:	8a 85 e4 fe ff ff    	mov    0xfffffee4(%ebp),%al
 80526e6:	c0 e8 03             	shr    $0x3,%al
 80526e9:	31 d2                	xor    %edx,%edx
 80526eb:	88 c2                	mov    %al,%dl
 80526ed:	8a 8d e4 fe ff ff    	mov    0xfffffee4(%ebp),%cl
 80526f3:	83 e1 07             	and    $0x7,%ecx
 80526f6:	b8 01 00 00 00       	mov    $0x1,%eax
 80526fb:	e9 46 ff ff ff       	jmp    0x8052646
 8052700:	80 bd e8 fe ff ff 5d 	cmpb   $0x5d,0xfffffee8(%ebp)
 8052707:	0f 85 c3 fb ff ff    	jne    0x80522d0
 805270d:	8b 85 e0 fe ff ff    	mov    0xfffffee0(%ebp),%eax
 8052713:	40                   	inc    %eax
 8052714:	39 85 ec fe ff ff    	cmp    %eax,0xfffffeec(%ebp)
 805271a:	0f 84 b0 fb ff ff    	je     0x80522d0
 8052720:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8052726:	8a 51 ff             	mov    0xffffffff(%ecx),%dl
 8052729:	eb 14                	jmp    0x805273f
 805272b:	90                   	nop    
 805272c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052730:	88 d3                	mov    %dl,%bl
 8052732:	fe cb                	dec    %bl
 8052734:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 805273a:	fe ca                	dec    %dl
 805273c:	88 59 ff             	mov    %bl,0xffffffff(%ecx)
 805273f:	84 d2                	test   %dl,%dl
 8052741:	74 0c                	je     0x805274f
 8052743:	31 c0                	xor    %eax,%eax
 8052745:	8a 41 ff             	mov    0xffffffff(%ecx),%al
 8052748:	80 7c 01 ff 00       	cmpb   $0x0,0xffffffff(%ecx,%eax,1)
 805274d:	74 e1                	je     0x8052730
 805274f:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052755:	31 c0                	xor    %eax,%eax
 8052757:	8a 43 ff             	mov    0xffffffff(%ebx),%al
 805275a:	01 c3                	add    %eax,%ebx
 805275c:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8052762:	e9 a3 1a 00 00       	jmp    0x805420a
 8052767:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805276a:	f6 c5 20             	test   $0x20,%ch
 805276d:	0f 85 b9 00 00 00    	jne    0x805282c
 8052773:	e9 14 18 00 00       	jmp    0x8053f8c
 8052778:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805277b:	f6 c7 20             	test   $0x20,%bh
 805277e:	0f 85 bf 02 00 00    	jne    0x8052a43
 8052784:	e9 03 18 00 00       	jmp    0x8053f8c
 8052789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8052790:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8052793:	f6 c5 08             	test   $0x8,%ch
 8052796:	0f 85 a0 05 00 00    	jne    0x8052d3c
 805279c:	e9 eb 17 00 00       	jmp    0x8053f8c
 80527a1:	66 83 7d 10 00       	cmpw   $0x0,0x10(%ebp)
 80527a6:	0f 8c 90 05 00 00    	jl     0x8052d3c
 80527ac:	e9 db 17 00 00       	jmp    0x8053f8c
 80527b1:	8b 45 10             	mov    0x10(%ebp),%eax
 80527b4:	25 00 12 00 00       	and    $0x1200,%eax
 80527b9:	3d 00 12 00 00       	cmp    $0x1200,%eax
 80527be:	0f 84 04 08 00 00    	je     0x8052fc8
 80527c4:	e9 c3 17 00 00       	jmp    0x8053f8c
 80527c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80527d0:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 80527d6:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 80527dc:	75 13                	jne    0x80527f1
 80527de:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80527e1:	50                   	push   %eax
 80527e2:	e8 05 6a ff ff       	call   0x80491ec
 80527e7:	b8 05 00 00 00       	mov    $0x5,%eax
 80527ec:	e9 11 1c 00 00       	jmp    0x8054402
 80527f1:	8a 00                	mov    (%eax),%al
 80527f3:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80527f9:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 80527ff:	31 c0                	xor    %eax,%eax
 8052801:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8052807:	83 c0 d9             	add    $0xffffffd9,%eax
 805280a:	83 f8 55             	cmp    $0x55,%eax
 805280d:	0f 87 59 17 00 00    	ja     0x8053f6c
 8052813:	ff 24 85 98 98 05 08 	jmp    *0x8059898(,%eax,4)
 805281a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8052820:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8052823:	f6 c7 20             	test   $0x20,%bh
 8052826:	0f 85 40 17 00 00    	jne    0x8053f6c
 805282c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805282f:	ff 41 18             	incl   0x18(%ecx)
 8052832:	ff 85 bc fe ff ff    	incl   0xfffffebc(%ebp)
 8052838:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 805283b:	3b 75 f8             	cmp    0xfffffff8(%ebp),%esi
 805283e:	75 2c                	jne    0x805286c
 8052840:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 8052847:	8d 04 70             	lea    (%eax,%esi,2),%eax
 805284a:	c1 e0 02             	shl    $0x2,%eax
 805284d:	50                   	push   %eax
 805284e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8052851:	50                   	push   %eax
 8052852:	e8 95 68 ff ff       	call   0x80490ec
 8052857:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 805285a:	83 c4 08             	add    $0x8,%esp
 805285d:	85 c0                	test   %eax,%eax
 805285f:	0f 84 47 ed ff ff    	je     0x80515ac
 8052865:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 8052869:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 805286c:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805286f:	8d 04 b6             	lea    (%esi,%esi,4),%eax
 8052872:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052875:	8b 8d c8 fe ff ff    	mov    0xfffffec8(%ebp),%ecx
 805287b:	2b 0b                	sub    (%ebx),%ecx
 805287d:	89 0c 82             	mov    %ecx,(%edx,%eax,4)
 8052880:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8052883:	8b 75 f4             	mov    0xfffffff4(%ebp),%esi
 8052886:	8d 04 80             	lea    (%eax,%eax,4),%eax
 8052889:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8052890:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052897:	74 0f                	je     0x80528a8
 8052899:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 805289f:	2b 03                	sub    (%ebx),%eax
 80528a1:	40                   	inc    %eax
 80528a2:	89 44 16 04          	mov    %eax,0x4(%esi,%edx,1)
 80528a6:	eb 08                	jmp    0x80528b0
 80528a8:	c7 44 16 04 00 00 00 	movl   $0x0,0x4(%esi,%edx,1)
 80528af:	00 
 80528b0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80528b3:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80528b6:	8d 04 80             	lea    (%eax,%eax,4),%eax
 80528b9:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80528bc:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 80528c2:	2b 0b                	sub    (%ebx),%ecx
 80528c4:	89 4c 82 0c          	mov    %ecx,0xc(%edx,%eax,4)
 80528c8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80528cb:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80528ce:	8d 04 80             	lea    (%eax,%eax,4),%eax
 80528d1:	8b 9d bc fe ff ff    	mov    0xfffffebc(%ebp),%ebx
 80528d7:	89 5c 82 10          	mov    %ebx,0x10(%edx,%eax,4)
 80528db:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 80528e1:	0f 87 02 01 00 00    	ja     0x80529e9
 80528e7:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80528ea:	8d 14 92             	lea    (%edx,%edx,4),%edx
 80528ed:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80528f3:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80528f6:	8b 5d f4             	mov    0xfffffff4(%ebp),%ebx
 80528f9:	2b 01                	sub    (%ecx),%eax
 80528fb:	83 c0 02             	add    $0x2,%eax
 80528fe:	89 44 93 08          	mov    %eax,0x8(%ebx,%edx,4)
 8052902:	8b 31                	mov    (%ecx),%esi
 8052904:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805290a:	e9 ad 00 00 00       	jmp    0x80529bc
 805290f:	90                   	nop    
 8052910:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8052916:	0f 84 d7 19 00 00    	je     0x80542f3
 805291c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805291f:	89 d0                	mov    %edx,%eax
 8052921:	01 d0                	add    %edx,%eax
 8052923:	89 41 04             	mov    %eax,0x4(%ecx)
 8052926:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805292b:	76 07                	jbe    0x8052934
 805292d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8052934:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052937:	8b 43 04             	mov    0x4(%ebx),%eax
 805293a:	50                   	push   %eax
 805293b:	8b 03                	mov    (%ebx),%eax
 805293d:	50                   	push   %eax
 805293e:	e8 a9 67 ff ff       	call   0x80490ec
 8052943:	89 c2                	mov    %eax,%edx
 8052945:	89 13                	mov    %edx,(%ebx)
 8052947:	83 c4 08             	add    $0x8,%esp
 805294a:	85 d2                	test   %edx,%edx
 805294c:	0f 84 5a ec ff ff    	je     0x80515ac
 8052952:	39 d6                	cmp    %edx,%esi
 8052954:	74 5b                	je     0x80529b1
 8052956:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805295c:	29 f0                	sub    %esi,%eax
 805295e:	01 d0                	add    %edx,%eax
 8052960:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052966:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805296d:	74 10                	je     0x805297f
 805296f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052975:	29 f0                	sub    %esi,%eax
 8052977:	01 d0                	add    %edx,%eax
 8052979:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805297f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052986:	74 10                	je     0x8052998
 8052988:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805298e:	29 f0                	sub    %esi,%eax
 8052990:	01 d0                	add    %edx,%eax
 8052992:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052998:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 805299f:	74 10                	je     0x80529b1
 80529a1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80529a7:	29 f0                	sub    %esi,%eax
 80529a9:	01 c2                	add    %eax,%edx
 80529ab:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80529b1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80529b4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80529ba:	8b 31                	mov    (%ecx),%esi
 80529bc:	29 f0                	sub    %esi,%eax
 80529be:	83 c0 03             	add    $0x3,%eax
 80529c1:	8b 51 04             	mov    0x4(%ecx),%edx
 80529c4:	39 d0                	cmp    %edx,%eax
 80529c6:	0f 87 44 ff ff ff    	ja     0x8052910
 80529cc:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80529d2:	c6 03 06             	movb   $0x6,(%ebx)
 80529d5:	43                   	inc    %ebx
 80529d6:	8a 8d bc fe ff ff    	mov    0xfffffebc(%ebp),%cl
 80529dc:	88 0b                	mov    %cl,(%ebx)
 80529de:	43                   	inc    %ebx
 80529df:	c6 03 00             	movb   $0x0,(%ebx)
 80529e2:	43                   	inc    %ebx
 80529e3:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 80529e9:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80529ec:	c7 85 c0 fe ff ff 00 	movl   $0x0,0xfffffec0(%ebp)
 80529f3:	00 00 00 
 80529f6:	c7 85 cc fe ff ff 00 	movl   $0x0,0xfffffecc(%ebp)
 80529fd:	00 00 00 
 8052a00:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052a06:	89 9d c8 fe ff ff    	mov    %ebx,0xfffffec8(%ebp)
 8052a0c:	c7 85 d0 fe ff ff 00 	movl   $0x0,0xfffffed0(%ebp)
 8052a13:	00 00 00 
 8052a16:	e9 ef 17 00 00       	jmp    0x805420a
 8052a1b:	90                   	nop    
 8052a1c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052a20:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8052a23:	f6 c5 20             	test   $0x20,%ch
 8052a26:	0f 85 40 15 00 00    	jne    0x8053f6c
 8052a2c:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8052a30:	75 11                	jne    0x8052a43
 8052a32:	f7 c1 00 00 02 00    	test   $0x20000,%ecx
 8052a38:	0f 85 2e 15 00 00    	jne    0x8053f6c
 8052a3e:	e9 3b 01 00 00       	jmp    0x8052b7e
 8052a43:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052a4a:	0f 84 18 01 00 00    	je     0x8052b68
 8052a50:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052a53:	8b 33                	mov    (%ebx),%esi
 8052a55:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052a5b:	29 f0                	sub    %esi,%eax
 8052a5d:	40                   	inc    %eax
 8052a5e:	8b 53 04             	mov    0x4(%ebx),%edx
 8052a61:	39 d0                	cmp    %edx,%eax
 8052a63:	0f 86 d1 00 00 00    	jbe    0x8052b3a
 8052a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8052a70:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8052a76:	0f 84 77 18 00 00    	je     0x80542f3
 8052a7c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052a7f:	89 d0                	mov    %edx,%eax
 8052a81:	01 d0                	add    %edx,%eax
 8052a83:	89 41 04             	mov    %eax,0x4(%ecx)
 8052a86:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8052a8b:	76 07                	jbe    0x8052a94
 8052a8d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8052a94:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052a97:	8b 43 04             	mov    0x4(%ebx),%eax
 8052a9a:	50                   	push   %eax
 8052a9b:	8b 03                	mov    (%ebx),%eax
 8052a9d:	50                   	push   %eax
 8052a9e:	e8 49 66 ff ff       	call   0x80490ec
 8052aa3:	89 c2                	mov    %eax,%edx
 8052aa5:	89 13                	mov    %edx,(%ebx)
 8052aa7:	83 c4 08             	add    $0x8,%esp
 8052aaa:	85 d2                	test   %edx,%edx
 8052aac:	0f 84 fa ea ff ff    	je     0x80515ac
 8052ab2:	39 d6                	cmp    %edx,%esi
 8052ab4:	74 6b                	je     0x8052b21
 8052ab6:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052abc:	29 f0                	sub    %esi,%eax
 8052abe:	01 d0                	add    %edx,%eax
 8052ac0:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052ac6:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8052acc:	29 f0                	sub    %esi,%eax
 8052ace:	01 d0                	add    %edx,%eax
 8052ad0:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052ad6:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052add:	74 10                	je     0x8052aef
 8052adf:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052ae5:	29 f0                	sub    %esi,%eax
 8052ae7:	01 d0                	add    %edx,%eax
 8052ae9:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052aef:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052af6:	74 10                	je     0x8052b08
 8052af8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052afe:	29 f0                	sub    %esi,%eax
 8052b00:	01 d0                	add    %edx,%eax
 8052b02:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052b08:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052b0f:	74 10                	je     0x8052b21
 8052b11:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8052b17:	29 f0                	sub    %esi,%eax
 8052b19:	01 c2                	add    %eax,%edx
 8052b1b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052b21:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052b24:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052b2a:	8b 31                	mov    (%ecx),%esi
 8052b2c:	29 f0                	sub    %esi,%eax
 8052b2e:	40                   	inc    %eax
 8052b2f:	8b 51 04             	mov    0x4(%ecx),%edx
 8052b32:	39 d0                	cmp    %edx,%eax
 8052b34:	0f 87 36 ff ff ff    	ja     0x8052a70
 8052b3a:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052b40:	c6 03 14             	movb   $0x14,(%ebx)
 8052b43:	43                   	inc    %ebx
 8052b44:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8052b4a:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052b50:	f7 d0                	not    %eax
 8052b52:	8d 44 03 fd          	lea    0xfffffffd(%ebx,%eax,1),%eax
 8052b56:	50                   	push   %eax
 8052b57:	8b 8d c0 fe ff ff    	mov    0xfffffec0(%ebp),%ecx
 8052b5d:	51                   	push   %ecx
 8052b5e:	6a 0e                	push   $0xe
 8052b60:	e8 ab 18 00 00       	call   0x8054410
 8052b65:	83 c4 0c             	add    $0xc,%esp
 8052b68:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8052b6b:	85 c0                	test   %eax,%eax
 8052b6d:	75 22                	jne    0x8052b91
 8052b6f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8052b72:	f7 c3 00 00 02 00    	test   $0x20000,%ebx
 8052b78:	0f 85 0e 14 00 00    	jne    0x8053f8c
 8052b7e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8052b81:	50                   	push   %eax
 8052b82:	e8 65 66 ff ff       	call   0x80491ec
 8052b87:	b8 10 00 00 00       	mov    $0x10,%eax
 8052b8c:	e9 71 18 00 00       	jmp    0x8054402
 8052b91:	8d 48 ff             	lea    0xffffffff(%eax),%ecx
 8052b94:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 8052b97:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8052b9a:	89 d7                	mov    %edx,%edi
 8052b9c:	8d 44 80 fb          	lea    0xfffffffb(%eax,%eax,4),%eax
 8052ba0:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052ba3:	c1 e0 02             	shl    $0x2,%eax
 8052ba6:	8b 1b                	mov    (%ebx),%ebx
 8052ba8:	89 9d a8 fe ff ff    	mov    %ebx,0xfffffea8(%ebp)
 8052bae:	89 de                	mov    %ebx,%esi
 8052bb0:	89 9d c8 fe ff ff    	mov    %ebx,0xfffffec8(%ebp)
 8052bb6:	8b 0c 02             	mov    (%edx,%eax,1),%ecx
 8052bb9:	01 8d c8 fe ff ff    	add    %ecx,0xfffffec8(%ebp)
 8052bbf:	8b 44 02 04          	mov    0x4(%edx,%eax,1),%eax
 8052bc3:	85 c0                	test   %eax,%eax
 8052bc5:	74 0c                	je     0x8052bd3
 8052bc7:	8d 44 18 ff          	lea    0xffffffff(%eax,%ebx,1),%eax
 8052bcb:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052bd1:	eb 0a                	jmp    0x8052bdd
 8052bd3:	c7 85 c0 fe ff ff 00 	movl   $0x0,0xfffffec0(%ebp)
 8052bda:	00 00 00 
 8052bdd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8052be0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 8052be3:	c1 e0 02             	shl    $0x2,%eax
 8052be6:	c7 85 d0 fe ff ff 00 	movl   $0x0,0xfffffed0(%ebp)
 8052bed:	00 00 00 
 8052bf0:	03 74 07 0c          	add    0xc(%edi,%eax,1),%esi
 8052bf4:	89 b5 cc fe ff ff    	mov    %esi,0xfffffecc(%ebp)
 8052bfa:	8b 74 07 10          	mov    0x10(%edi,%eax,1),%esi
 8052bfe:	81 fe ff 00 00 00    	cmp    $0xff,%esi
 8052c04:	0f 87 00 16 00 00    	ja     0x805420a
 8052c0a:	8b 54 02 08          	mov    0x8(%edx,%eax,1),%edx
 8052c0e:	01 95 a8 fe ff ff    	add    %edx,0xfffffea8(%ebp)
 8052c14:	8a 9d bc fe ff ff    	mov    0xfffffebc(%ebp),%bl
 8052c1a:	89 f1                	mov    %esi,%ecx
 8052c1c:	28 cb                	sub    %cl,%bl
 8052c1e:	8b 8d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ecx
 8052c24:	88 9d b6 fe ff ff    	mov    %bl,0xfffffeb6(%ebp)
 8052c2a:	88 19                	mov    %bl,(%ecx)
 8052c2c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052c2f:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052c35:	8b 3b                	mov    (%ebx),%edi
 8052c37:	29 f8                	sub    %edi,%eax
 8052c39:	83 c0 03             	add    $0x3,%eax
 8052c3c:	8b 53 04             	mov    0x4(%ebx),%edx
 8052c3f:	39 d0                	cmp    %edx,%eax
 8052c41:	0f 86 d1 00 00 00    	jbe    0x8052d18
 8052c47:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8052c4d:	0f 84 a0 16 00 00    	je     0x80542f3
 8052c53:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052c56:	89 d0                	mov    %edx,%eax
 8052c58:	01 d0                	add    %edx,%eax
 8052c5a:	89 41 04             	mov    %eax,0x4(%ecx)
 8052c5d:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8052c62:	76 0c                	jbe    0x8052c70
 8052c64:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8052c6b:	90                   	nop    
 8052c6c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052c70:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052c73:	8b 43 04             	mov    0x4(%ebx),%eax
 8052c76:	50                   	push   %eax
 8052c77:	8b 03                	mov    (%ebx),%eax
 8052c79:	50                   	push   %eax
 8052c7a:	e8 6d 64 ff ff       	call   0x80490ec
 8052c7f:	89 c2                	mov    %eax,%edx
 8052c81:	89 13                	mov    %edx,(%ebx)
 8052c83:	83 c4 08             	add    $0x8,%esp
 8052c86:	85 d2                	test   %edx,%edx
 8052c88:	0f 84 1e e9 ff ff    	je     0x80515ac
 8052c8e:	39 d7                	cmp    %edx,%edi
 8052c90:	74 6b                	je     0x8052cfd
 8052c92:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052c98:	29 f8                	sub    %edi,%eax
 8052c9a:	01 d0                	add    %edx,%eax
 8052c9c:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052ca2:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8052ca8:	29 f8                	sub    %edi,%eax
 8052caa:	01 d0                	add    %edx,%eax
 8052cac:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052cb2:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052cb9:	74 10                	je     0x8052ccb
 8052cbb:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052cc1:	29 f8                	sub    %edi,%eax
 8052cc3:	01 d0                	add    %edx,%eax
 8052cc5:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052ccb:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052cd2:	74 10                	je     0x8052ce4
 8052cd4:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052cda:	29 f8                	sub    %edi,%eax
 8052cdc:	01 d0                	add    %edx,%eax
 8052cde:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052ce4:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052ceb:	74 10                	je     0x8052cfd
 8052ced:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8052cf3:	29 f8                	sub    %edi,%eax
 8052cf5:	01 c2                	add    %eax,%edx
 8052cf7:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052cfd:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052d00:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052d06:	8b 39                	mov    (%ecx),%edi
 8052d08:	29 f8                	sub    %edi,%eax
 8052d0a:	83 c0 03             	add    $0x3,%eax
 8052d0d:	8b 51 04             	mov    0x4(%ecx),%edx
 8052d10:	39 d0                	cmp    %edx,%eax
 8052d12:	0f 87 2f ff ff ff    	ja     0x8052c47
 8052d18:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052d1e:	c6 03 07             	movb   $0x7,(%ebx)
 8052d21:	43                   	inc    %ebx
 8052d22:	89 f1                	mov    %esi,%ecx
 8052d24:	88 0b                	mov    %cl,(%ebx)
 8052d26:	43                   	inc    %ebx
 8052d27:	8a 8d b6 fe ff ff    	mov    0xfffffeb6(%ebp),%cl
 8052d2d:	e9 1a 12 00 00       	jmp    0x8053f4c
 8052d32:	f6 45 11 84          	testb  $0x84,0x11(%ebp)
 8052d36:	0f 85 30 12 00 00    	jne    0x8053f6c
 8052d3c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8052d3f:	f6 c7 04             	test   $0x4,%bh
 8052d42:	0f 85 44 12 00 00    	jne    0x8053f8c
 8052d48:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052d4b:	8b 31                	mov    (%ecx),%esi
 8052d4d:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052d53:	e9 c3 00 00 00       	jmp    0x8052e1b
 8052d58:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8052d5e:	0f 84 8f 15 00 00    	je     0x80542f3
 8052d64:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052d67:	89 d0                	mov    %edx,%eax
 8052d69:	01 d0                	add    %edx,%eax
 8052d6b:	89 43 04             	mov    %eax,0x4(%ebx)
 8052d6e:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8052d73:	76 0b                	jbe    0x8052d80
 8052d75:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8052d7c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052d80:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052d83:	8b 41 04             	mov    0x4(%ecx),%eax
 8052d86:	50                   	push   %eax
 8052d87:	8b 01                	mov    (%ecx),%eax
 8052d89:	50                   	push   %eax
 8052d8a:	e8 5d 63 ff ff       	call   0x80490ec
 8052d8f:	89 c2                	mov    %eax,%edx
 8052d91:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052d94:	83 c4 08             	add    $0x8,%esp
 8052d97:	89 13                	mov    %edx,(%ebx)
 8052d99:	85 d2                	test   %edx,%edx
 8052d9b:	0f 84 0b e8 ff ff    	je     0x80515ac
 8052da1:	39 d6                	cmp    %edx,%esi
 8052da3:	74 6b                	je     0x8052e10
 8052da5:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052dab:	29 f0                	sub    %esi,%eax
 8052dad:	01 d0                	add    %edx,%eax
 8052daf:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052db5:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8052dbb:	29 f0                	sub    %esi,%eax
 8052dbd:	01 d0                	add    %edx,%eax
 8052dbf:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8052dc5:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052dcc:	74 10                	je     0x8052dde
 8052dce:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052dd4:	29 f0                	sub    %esi,%eax
 8052dd6:	01 d0                	add    %edx,%eax
 8052dd8:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052dde:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052de5:	74 10                	je     0x8052df7
 8052de7:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052ded:	29 f0                	sub    %esi,%eax
 8052def:	01 d0                	add    %edx,%eax
 8052df1:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052df7:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052dfe:	74 10                	je     0x8052e10
 8052e00:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8052e06:	29 f0                	sub    %esi,%eax
 8052e08:	01 c2                	add    %eax,%edx
 8052e0a:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052e10:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052e13:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052e19:	8b 31                	mov    (%ecx),%esi
 8052e1b:	29 f0                	sub    %esi,%eax
 8052e1d:	83 c0 03             	add    $0x3,%eax
 8052e20:	8b 51 04             	mov    0x4(%ecx),%edx
 8052e23:	39 d0                	cmp    %edx,%eax
 8052e25:	0f 87 2d ff ff ff    	ja     0x8052d58
 8052e2b:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052e31:	53                   	push   %ebx
 8052e32:	89 d8                	mov    %ebx,%eax
 8052e34:	2b 85 c8 fe ff ff    	sub    0xfffffec8(%ebp),%eax
 8052e3a:	83 c0 03             	add    $0x3,%eax
 8052e3d:	50                   	push   %eax
 8052e3e:	8b 8d c8 fe ff ff    	mov    0xfffffec8(%ebp),%ecx
 8052e44:	51                   	push   %ecx
 8052e45:	6a 0f                	push   $0xf
 8052e47:	e8 14 16 00 00       	call   0x8054460
 8052e4c:	c7 85 d0 fe ff ff 00 	movl   $0x0,0xfffffed0(%ebp)
 8052e53:	00 00 00 
 8052e56:	83 c3 03             	add    $0x3,%ebx
 8052e59:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8052e5f:	83 c4 10             	add    $0x10,%esp
 8052e62:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052e69:	74 1d                	je     0x8052e88
 8052e6b:	89 d8                	mov    %ebx,%eax
 8052e6d:	2b 85 c0 fe ff ff    	sub    0xfffffec0(%ebp),%eax
 8052e73:	83 c0 fd             	add    $0xfffffffd,%eax
 8052e76:	50                   	push   %eax
 8052e77:	8b 9d c0 fe ff ff    	mov    0xfffffec0(%ebp),%ebx
 8052e7d:	53                   	push   %ebx
 8052e7e:	6a 0e                	push   $0xe
 8052e80:	e8 8b 15 00 00       	call   0x8054410
 8052e85:	83 c4 0c             	add    $0xc,%esp
 8052e88:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8052e8e:	89 8d c0 fe ff ff    	mov    %ecx,0xfffffec0(%ebp)
 8052e94:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052e97:	89 c8                	mov    %ecx,%eax
 8052e99:	8b 33                	mov    (%ebx),%esi
 8052e9b:	29 f0                	sub    %esi,%eax
 8052e9d:	83 c0 03             	add    $0x3,%eax
 8052ea0:	8b 53 04             	mov    0x4(%ebx),%edx
 8052ea3:	39 d0                	cmp    %edx,%eax
 8052ea5:	0f 86 c1 00 00 00    	jbe    0x8052f6c
 8052eab:	90                   	nop    
 8052eac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8052eb0:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8052eb6:	0f 84 37 14 00 00    	je     0x80542f3
 8052ebc:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052ebf:	89 d0                	mov    %edx,%eax
 8052ec1:	01 d0                	add    %edx,%eax
 8052ec3:	89 41 04             	mov    %eax,0x4(%ecx)
 8052ec6:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8052ecb:	76 07                	jbe    0x8052ed4
 8052ecd:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8052ed4:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8052ed7:	8b 43 04             	mov    0x4(%ebx),%eax
 8052eda:	50                   	push   %eax
 8052edb:	8b 03                	mov    (%ebx),%eax
 8052edd:	50                   	push   %eax
 8052ede:	e8 09 62 ff ff       	call   0x80490ec
 8052ee3:	89 c2                	mov    %eax,%edx
 8052ee5:	89 13                	mov    %edx,(%ebx)
 8052ee7:	83 c4 08             	add    $0x8,%esp
 8052eea:	85 d2                	test   %edx,%edx
 8052eec:	0f 84 ba e6 ff ff    	je     0x80515ac
 8052ef2:	39 d6                	cmp    %edx,%esi
 8052ef4:	74 5b                	je     0x8052f51
 8052ef6:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052efc:	29 f0                	sub    %esi,%eax
 8052efe:	01 d0                	add    %edx,%eax
 8052f00:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8052f06:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8052f0d:	74 10                	je     0x8052f1f
 8052f0f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8052f15:	29 f0                	sub    %esi,%eax
 8052f17:	01 d0                	add    %edx,%eax
 8052f19:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8052f1f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8052f26:	74 10                	je     0x8052f38
 8052f28:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8052f2e:	29 f0                	sub    %esi,%eax
 8052f30:	01 d0                	add    %edx,%eax
 8052f32:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8052f38:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8052f3f:	74 10                	je     0x8052f51
 8052f41:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8052f47:	29 f0                	sub    %esi,%eax
 8052f49:	01 c2                	add    %eax,%edx
 8052f4b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8052f51:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8052f54:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8052f5a:	8b 31                	mov    (%ecx),%esi
 8052f5c:	29 f0                	sub    %esi,%eax
 8052f5e:	83 c0 03             	add    $0x3,%eax
 8052f61:	8b 51 04             	mov    0x4(%ecx),%edx
 8052f64:	39 d0                	cmp    %edx,%eax
 8052f66:	0f 87 44 ff ff ff    	ja     0x8052eb0
 8052f6c:	83 85 dc fe ff ff 03 	addl   $0x3,0xfffffedc(%ebp)
 8052f73:	c7 85 cc fe ff ff 00 	movl   $0x0,0xfffffecc(%ebp)
 8052f7a:	00 00 00 
 8052f7d:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8052f83:	89 9d c8 fe ff ff    	mov    %ebx,0xfffffec8(%ebp)
 8052f89:	e9 7c 12 00 00       	jmp    0x805420a
 8052f8e:	89 f6                	mov    %esi,%esi
 8052f90:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8052f93:	f6 c5 02             	test   $0x2,%ch
 8052f96:	0f 84 d0 0f 00 00    	je     0x8053f6c
 8052f9c:	89 c8                	mov    %ecx,%eax
 8052f9e:	25 00 12 00 00       	and    $0x1200,%eax
 8052fa3:	3d 00 12 00 00       	cmp    $0x1200,%eax
 8052fa8:	0f 84 be 0f 00 00    	je     0x8053f6c
 8052fae:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8052fb4:	8d 42 fe             	lea    0xfffffffe(%edx),%eax
 8052fb7:	3b 45 08             	cmp    0x8(%ebp),%eax
 8052fba:	75 0c                	jne    0x8052fc8
 8052fbc:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8052fc2:	0f 84 a4 0f 00 00    	je     0x8053f6c
 8052fc8:	c7 85 a8 fe ff ff ff 	movl   $0xffffffff,0xfffffea8(%ebp)
 8052fcf:	ff ff ff 
 8052fd2:	8b bd a8 fe ff ff    	mov    0xfffffea8(%ebp),%edi
 8052fd8:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 8052fde:	8d 58 ff             	lea    0xffffffff(%eax),%ebx
 8052fe1:	89 9d c4 fe ff ff    	mov    %ebx,0xfffffec4(%ebp)
 8052fe7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8052fea:	89 8d ac fe ff ff    	mov    %ecx,0xfffffeac(%ebp)
 8052ff0:	81 a5 ac fe ff ff 00 	andl   $0x1000,0xfffffeac(%ebp)
 8052ff7:	10 00 00 
 8052ffa:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 8053000:	75 12                	jne    0x8053014
 8053002:	83 bd ac fe ff ff 00 	cmpl   $0x0,0xfffffeac(%ebp)
 8053009:	0f 85 61 05 00 00    	jne    0x8053570
 805300f:	e9 8f 12 00 00       	jmp    0x80542a3
 8053014:	8a 00                	mov    (%eax),%al
 8053016:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 805301c:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8053022:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8053029:	74 17                	je     0x8053042
 805302b:	31 c0                	xor    %eax,%eax
 805302d:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8053033:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8053039:	8a 04 18             	mov    (%eax,%ebx,1),%al
 805303c:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053042:	31 d2                	xor    %edx,%edx
 8053044:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8053049:	8a 95 e8 fe ff ff    	mov    0xfffffee8(%ebp),%dl
 805304f:	f6 44 50 01 08       	testb  $0x8,0x1(%eax,%edx,2)
 8053054:	74 5a                	je     0x80530b0
 8053056:	89 c6                	mov    %eax,%esi
 8053058:	85 ff                	test   %edi,%edi
 805305a:	7d 02                	jge    0x805305e
 805305c:	31 ff                	xor    %edi,%edi
 805305e:	8d 04 bf             	lea    (%edi,%edi,4),%eax
 8053061:	8d 7c 42 d0          	lea    0xffffffd0(%edx,%eax,2),%edi
 8053065:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 805306b:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 8053071:	74 3d                	je     0x80530b0
 8053073:	8a 00                	mov    (%eax),%al
 8053075:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 805307b:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8053081:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8053088:	74 17                	je     0x80530a1
 805308a:	31 c0                	xor    %eax,%eax
 805308c:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8053092:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8053098:	8a 04 08             	mov    (%eax,%ecx,1),%al
 805309b:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80530a1:	31 d2                	xor    %edx,%edx
 80530a3:	8a 95 e8 fe ff ff    	mov    0xfffffee8(%ebp),%dl
 80530a9:	f6 44 56 01 08       	testb  $0x8,0x1(%esi,%edx,2)
 80530ae:	75 a8                	jne    0x8053058
 80530b0:	80 bd e8 fe ff ff 2c 	cmpb   $0x2c,0xfffffee8(%ebp)
 80530b7:	0f 85 e3 00 00 00    	jne    0x80531a0
 80530bd:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 80530c3:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 80530c9:	0f 84 ba 00 00 00    	je     0x8053189
 80530cf:	8a 00                	mov    (%eax),%al
 80530d1:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80530d7:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 80530dd:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 80530e4:	74 1a                	je     0x8053100
 80530e6:	31 c0                	xor    %eax,%eax
 80530e8:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 80530ee:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 80530f4:	8a 04 18             	mov    (%eax,%ebx,1),%al
 80530f7:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80530fd:	8d 76 00             	lea    0x0(%esi),%esi
 8053100:	31 d2                	xor    %edx,%edx
 8053102:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8053107:	8a 95 e8 fe ff ff    	mov    0xfffffee8(%ebp),%dl
 805310d:	f6 44 50 01 08       	testb  $0x8,0x1(%eax,%edx,2)
 8053112:	74 75                	je     0x8053189
 8053114:	89 c6                	mov    %eax,%esi
 8053116:	83 bd a8 fe ff ff 00 	cmpl   $0x0,0xfffffea8(%ebp)
 805311d:	7d 0a                	jge    0x8053129
 805311f:	c7 85 a8 fe ff ff 00 	movl   $0x0,0xfffffea8(%ebp)
 8053126:	00 00 00 
 8053129:	8b 8d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ecx
 805312f:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
 8053132:	8d 54 42 d0          	lea    0xffffffd0(%edx,%eax,2),%edx
 8053136:	89 95 a8 fe ff ff    	mov    %edx,0xfffffea8(%ebp)
 805313c:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 8053142:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 8053148:	74 3f                	je     0x8053189
 805314a:	8a 00                	mov    (%eax),%al
 805314c:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053152:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8053158:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 805315f:	74 17                	je     0x8053178
 8053161:	31 c0                	xor    %eax,%eax
 8053163:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 8053169:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 805316f:	8a 04 18             	mov    (%eax,%ebx,1),%al
 8053172:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053178:	31 c0                	xor    %eax,%eax
 805317a:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8053180:	89 c2                	mov    %eax,%edx
 8053182:	f6 44 56 01 08       	testb  $0x8,0x1(%esi,%edx,2)
 8053187:	75 8d                	jne    0x8053116
 8053189:	83 bd a8 fe ff ff 00 	cmpl   $0x0,0xfffffea8(%ebp)
 8053190:	7d 14                	jge    0x80531a6
 8053192:	c7 85 a8 fe ff ff ff 	movl   $0x7fff,0xfffffea8(%ebp)
 8053199:	7f 00 00 
 805319c:	eb 08                	jmp    0x80531a6
 805319e:	89 f6                	mov    %esi,%esi
 80531a0:	89 bd a8 fe ff ff    	mov    %edi,0xfffffea8(%ebp)
 80531a6:	85 ff                	test   %edi,%edi
 80531a8:	7c 73                	jl     0x805321d
 80531aa:	81 bd a8 fe ff ff ff 	cmpl   $0x7fff,0xfffffea8(%ebp)
 80531b1:	7f 00 00 
 80531b4:	7f 67                	jg     0x805321d
 80531b6:	3b bd a8 fe ff ff    	cmp    0xfffffea8(%ebp),%edi
 80531bc:	7f 5f                	jg     0x805321d
 80531be:	83 bd ac fe ff ff 00 	cmpl   $0x0,0xfffffeac(%ebp)
 80531c5:	75 4d                	jne    0x8053214
 80531c7:	80 bd e8 fe ff ff 5c 	cmpb   $0x5c,0xfffffee8(%ebp)
 80531ce:	0f 85 cf 10 00 00    	jne    0x80542a3
 80531d4:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 80531da:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 80531e0:	0f 84 ea 10 00 00    	je     0x80542d0
 80531e6:	8a 00                	mov    (%eax),%al
 80531e8:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80531ee:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 80531f4:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 80531fb:	74 17                	je     0x8053214
 80531fd:	31 c0                	xor    %eax,%eax
 80531ff:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8053205:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 805320b:	8a 04 08             	mov    (%eax,%ecx,1),%al
 805320e:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053214:	80 bd e8 fe ff ff 7d 	cmpb   $0x7d,0xfffffee8(%ebp)
 805321b:	74 23                	je     0x8053240
 805321d:	83 bd ac fe ff ff 00 	cmpl   $0x0,0xfffffeac(%ebp)
 8053224:	0f 85 46 03 00 00    	jne    0x8053570
 805322a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805322d:	50                   	push   %eax
 805322e:	e8 b9 5f ff ff       	call   0x80491ec
 8053233:	b8 0a 00 00 00       	mov    $0xa,%eax
 8053238:	e9 c5 11 00 00       	jmp    0x8054402
 805323d:	8d 76 00             	lea    0x0(%esi),%esi
 8053240:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053247:	75 21                	jne    0x805326a
 8053249:	8b 5d 10             	mov    0x10(%ebp),%ebx
 805324c:	f6 c3 20             	test   $0x20,%bl
 805324f:	0f 85 61 10 00 00    	jne    0x80542b6
 8053255:	f6 c3 10             	test   $0x10,%bl
 8053258:	0f 84 12 03 00 00    	je     0x8053570
 805325e:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8053264:	89 8d cc fe ff ff    	mov    %ecx,0xfffffecc(%ebp)
 805326a:	83 bd a8 fe ff ff 00 	cmpl   $0x0,0xfffffea8(%ebp)
 8053271:	0f 85 19 01 00 00    	jne    0x8053390
 8053277:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805327a:	8b 33                	mov    (%ebx),%esi
 805327c:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053282:	29 f0                	sub    %esi,%eax
 8053284:	83 c0 03             	add    $0x3,%eax
 8053287:	8b 53 04             	mov    0x4(%ebx),%edx
 805328a:	39 d0                	cmp    %edx,%eax
 805328c:	0f 86 cc 00 00 00    	jbe    0x805335e
 8053292:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053298:	0f 84 55 10 00 00    	je     0x80542f3
 805329e:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80532a1:	89 d0                	mov    %edx,%eax
 80532a3:	01 d0                	add    %edx,%eax
 80532a5:	89 41 04             	mov    %eax,0x4(%ecx)
 80532a8:	3d 00 00 01 00       	cmp    $0x10000,%eax
 80532ad:	76 07                	jbe    0x80532b6
 80532af:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 80532b6:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80532b9:	8b 43 04             	mov    0x4(%ebx),%eax
 80532bc:	50                   	push   %eax
 80532bd:	8b 03                	mov    (%ebx),%eax
 80532bf:	50                   	push   %eax
 80532c0:	e8 27 5e ff ff       	call   0x80490ec
 80532c5:	89 c2                	mov    %eax,%edx
 80532c7:	89 13                	mov    %edx,(%ebx)
 80532c9:	83 c4 08             	add    $0x8,%esp
 80532cc:	85 d2                	test   %edx,%edx
 80532ce:	0f 84 d8 e2 ff ff    	je     0x80515ac
 80532d4:	39 d6                	cmp    %edx,%esi
 80532d6:	74 6b                	je     0x8053343
 80532d8:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80532de:	29 f0                	sub    %esi,%eax
 80532e0:	01 d0                	add    %edx,%eax
 80532e2:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 80532e8:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 80532ee:	29 f0                	sub    %esi,%eax
 80532f0:	01 d0                	add    %edx,%eax
 80532f2:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 80532f8:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 80532ff:	74 10                	je     0x8053311
 8053301:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053307:	29 f0                	sub    %esi,%eax
 8053309:	01 d0                	add    %edx,%eax
 805330b:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053311:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053318:	74 10                	je     0x805332a
 805331a:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053320:	29 f0                	sub    %esi,%eax
 8053322:	01 d0                	add    %edx,%eax
 8053324:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 805332a:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053331:	74 10                	je     0x8053343
 8053333:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053339:	29 f0                	sub    %esi,%eax
 805333b:	01 c2                	add    %eax,%edx
 805333d:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053343:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053346:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805334c:	8b 31                	mov    (%ecx),%esi
 805334e:	29 f0                	sub    %esi,%eax
 8053350:	83 c0 03             	add    $0x3,%eax
 8053353:	8b 51 04             	mov    0x4(%ecx),%edx
 8053356:	39 d0                	cmp    %edx,%eax
 8053358:	0f 87 34 ff ff ff    	ja     0x8053292
 805335e:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053364:	53                   	push   %ebx
 8053365:	89 d8                	mov    %ebx,%eax
 8053367:	2b 85 cc fe ff ff    	sub    0xfffffecc(%ebp),%eax
 805336d:	50                   	push   %eax
 805336e:	8b 8d cc fe ff ff    	mov    0xfffffecc(%ebp),%ecx
 8053374:	51                   	push   %ecx
 8053375:	6a 0d                	push   $0xd
 8053377:	e8 e4 10 00 00       	call   0x8054460
 805337c:	83 c3 03             	add    $0x3,%ebx
 805337f:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8053385:	83 c4 10             	add    $0x10,%esp
 8053388:	e9 7f f6 ff ff       	jmp    0x8052a0c
 805338d:	8d 76 00             	lea    0x0(%esi),%esi
 8053390:	83 bd a8 fe ff ff 01 	cmpl   $0x1,0xfffffea8(%ebp)
 8053397:	7e 0c                	jle    0x80533a5
 8053399:	c7 85 b0 fe ff ff 14 	movl   $0x14,0xfffffeb0(%ebp)
 80533a0:	00 00 00 
 80533a3:	eb 0a                	jmp    0x80533af
 80533a5:	c7 85 b0 fe ff ff 0a 	movl   $0xa,0xfffffeb0(%ebp)
 80533ac:	00 00 00 
 80533af:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80533b2:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80533b8:	8b 33                	mov    (%ebx),%esi
 80533ba:	29 f0                	sub    %esi,%eax
 80533bc:	03 85 b0 fe ff ff    	add    0xfffffeb0(%ebp),%eax
 80533c2:	8b 53 04             	mov    0x4(%ebx),%edx
 80533c5:	39 d0                	cmp    %edx,%eax
 80533c7:	0f 86 d2 00 00 00    	jbe    0x805349f
 80533cd:	8d 76 00             	lea    0x0(%esi),%esi
 80533d0:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 80533d6:	0f 84 17 0f 00 00    	je     0x80542f3
 80533dc:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80533df:	89 d0                	mov    %edx,%eax
 80533e1:	01 d0                	add    %edx,%eax
 80533e3:	89 41 04             	mov    %eax,0x4(%ecx)
 80533e6:	3d 00 00 01 00       	cmp    $0x10000,%eax
 80533eb:	76 07                	jbe    0x80533f4
 80533ed:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 80533f4:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80533f7:	8b 43 04             	mov    0x4(%ebx),%eax
 80533fa:	50                   	push   %eax
 80533fb:	8b 03                	mov    (%ebx),%eax
 80533fd:	50                   	push   %eax
 80533fe:	e8 e9 5c ff ff       	call   0x80490ec
 8053403:	89 c2                	mov    %eax,%edx
 8053405:	89 13                	mov    %edx,(%ebx)
 8053407:	83 c4 08             	add    $0x8,%esp
 805340a:	85 d2                	test   %edx,%edx
 805340c:	0f 84 9a e1 ff ff    	je     0x80515ac
 8053412:	39 d6                	cmp    %edx,%esi
 8053414:	74 6b                	je     0x8053481
 8053416:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805341c:	29 f0                	sub    %esi,%eax
 805341e:	01 d0                	add    %edx,%eax
 8053420:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053426:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805342c:	29 f0                	sub    %esi,%eax
 805342e:	01 d0                	add    %edx,%eax
 8053430:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053436:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805343d:	74 10                	je     0x805344f
 805343f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053445:	29 f0                	sub    %esi,%eax
 8053447:	01 d0                	add    %edx,%eax
 8053449:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805344f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053456:	74 10                	je     0x8053468
 8053458:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805345e:	29 f0                	sub    %esi,%eax
 8053460:	01 d0                	add    %edx,%eax
 8053462:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053468:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 805346f:	74 10                	je     0x8053481
 8053471:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053477:	29 f0                	sub    %esi,%eax
 8053479:	01 c2                	add    %eax,%edx
 805347b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053481:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053484:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805348a:	8b 31                	mov    (%ecx),%esi
 805348c:	29 f0                	sub    %esi,%eax
 805348e:	03 85 b0 fe ff ff    	add    0xfffffeb0(%ebp),%eax
 8053494:	8b 51 04             	mov    0x4(%ecx),%edx
 8053497:	39 d0                	cmp    %edx,%eax
 8053499:	0f 87 31 ff ff ff    	ja     0x80533d0
 805349f:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80534a5:	53                   	push   %ebx
 80534a6:	89 de                	mov    %ebx,%esi
 80534a8:	57                   	push   %edi
 80534a9:	83 c6 05             	add    $0x5,%esi
 80534ac:	83 bd a8 fe ff ff 01 	cmpl   $0x1,0xfffffea8(%ebp)
 80534b3:	7e 0d                	jle    0x80534c2
 80534b5:	89 f0                	mov    %esi,%eax
 80534b7:	2b 85 cc fe ff ff    	sub    0xfffffecc(%ebp),%eax
 80534bd:	83 c0 02             	add    $0x2,%eax
 80534c0:	eb 0b                	jmp    0x80534cd
 80534c2:	89 f0                	mov    %esi,%eax
 80534c4:	2b 85 cc fe ff ff    	sub    0xfffffecc(%ebp),%eax
 80534ca:	83 c0 fd             	add    $0xfffffffd,%eax
 80534cd:	50                   	push   %eax
 80534ce:	8b 8d cc fe ff ff    	mov    0xfffffecc(%ebp),%ecx
 80534d4:	51                   	push   %ecx
 80534d5:	6a 15                	push   $0x15
 80534d7:	e8 b4 0f 00 00       	call   0x8054490
 80534dc:	89 b5 dc fe ff ff    	mov    %esi,0xfffffedc(%ebp)
 80534e2:	56                   	push   %esi
 80534e3:	57                   	push   %edi
 80534e4:	6a 05                	push   $0x5
 80534e6:	8b 9d cc fe ff ff    	mov    0xfffffecc(%ebp),%ebx
 80534ec:	53                   	push   %ebx
 80534ed:	6a 17                	push   $0x17
 80534ef:	e8 9c 0f 00 00       	call   0x8054490
 80534f4:	83 85 dc fe ff ff 05 	addl   $0x5,0xfffffedc(%ebp)
 80534fb:	83 c4 28             	add    $0x28,%esp
 80534fe:	83 bd a8 fe ff ff 01 	cmpl   $0x1,0xfffffea8(%ebp)
 8053505:	0f 8e 01 f5 ff ff    	jle    0x8052a0c
 805350b:	8b 8d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ecx
 8053511:	49                   	dec    %ecx
 8053512:	89 8d a8 fe ff ff    	mov    %ecx,0xfffffea8(%ebp)
 8053518:	51                   	push   %ecx
 8053519:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805351f:	2b 85 dc fe ff ff    	sub    0xfffffedc(%ebp),%eax
 8053525:	83 c0 02             	add    $0x2,%eax
 8053528:	50                   	push   %eax
 8053529:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 805352f:	53                   	push   %ebx
 8053530:	6a 16                	push   $0x16
 8053532:	e8 f9 0e 00 00       	call   0x8054430
 8053537:	83 c3 05             	add    $0x5,%ebx
 805353a:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8053540:	53                   	push   %ebx
 8053541:	8b 8d a8 fe ff ff    	mov    0xfffffea8(%ebp),%ecx
 8053547:	89 d8                	mov    %ebx,%eax
 8053549:	51                   	push   %ecx
 805354a:	2b 85 cc fe ff ff    	sub    0xfffffecc(%ebp),%eax
 8053550:	50                   	push   %eax
 8053551:	8b 9d cc fe ff ff    	mov    0xfffffecc(%ebp),%ebx
 8053557:	53                   	push   %ebx
 8053558:	6a 17                	push   $0x17
 805355a:	e8 31 0f 00 00       	call   0x8054490
 805355f:	83 85 dc fe ff ff 05 	addl   $0x5,0xfffffedc(%ebp)
 8053566:	83 c4 24             	add    $0x24,%esp
 8053569:	e9 9e f4 ff ff       	jmp    0x8052a0c
 805356e:	89 f6                	mov    %esi,%esi
 8053570:	8b 8d c4 fe ff ff    	mov    0xfffffec4(%ebp),%ecx
 8053576:	89 8d ec fe ff ff    	mov    %ecx,0xfffffeec(%ebp)
 805357c:	89 c8                	mov    %ecx,%eax
 805357e:	3b 85 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%eax
 8053584:	0f 84 46 0d 00 00    	je     0x80542d0
 805358a:	8a 00                	mov    (%eax),%al
 805358c:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053592:	ff 85 ec fe ff ff    	incl   0xfffffeec(%ebp)
 8053598:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 805359f:	74 17                	je     0x80535b8
 80535a1:	31 c0                	xor    %eax,%eax
 80535a3:	8b 9d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ebx
 80535a9:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 80535af:	8a 04 18             	mov    (%eax,%ebx,1),%al
 80535b2:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 80535b8:	83 bd ac fe ff ff 00 	cmpl   $0x0,0xfffffeac(%ebp)
 80535bf:	0f 85 c7 09 00 00    	jne    0x8053f8c
 80535c5:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 80535cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 80535ce:	0f 86 b8 09 00 00    	jbe    0x8053f8c
 80535d4:	80 78 ff 5c          	cmpb   $0x5c,0xffffffff(%eax)
 80535d8:	0f 84 8e 09 00 00    	je     0x8053f6c
 80535de:	e9 a9 09 00 00       	jmp    0x8053f8c
 80535e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80535e6:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 80535ec:	0f 85 9a 09 00 00    	jne    0x8053f8c
 80535f2:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80535f8:	89 9d cc fe ff ff    	mov    %ebx,0xfffffecc(%ebp)
 80535fe:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053601:	89 d8                	mov    %ebx,%eax
 8053603:	e9 c1 00 00 00       	jmp    0x80536c9
 8053608:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 805360e:	0f 84 df 0c 00 00    	je     0x80542f3
 8053614:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053617:	89 d0                	mov    %edx,%eax
 8053619:	01 d0                	add    %edx,%eax
 805361b:	89 43 04             	mov    %eax,0x4(%ebx)
 805361e:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053623:	76 0b                	jbe    0x8053630
 8053625:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 805362c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8053630:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053633:	8b 41 04             	mov    0x4(%ecx),%eax
 8053636:	50                   	push   %eax
 8053637:	8b 01                	mov    (%ecx),%eax
 8053639:	50                   	push   %eax
 805363a:	e8 ad 5a ff ff       	call   0x80490ec
 805363f:	89 c2                	mov    %eax,%edx
 8053641:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053644:	83 c4 08             	add    $0x8,%esp
 8053647:	89 13                	mov    %edx,(%ebx)
 8053649:	85 d2                	test   %edx,%edx
 805364b:	0f 84 5b df ff ff    	je     0x80515ac
 8053651:	39 d6                	cmp    %edx,%esi
 8053653:	74 6b                	je     0x80536c0
 8053655:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805365b:	29 f0                	sub    %esi,%eax
 805365d:	01 d0                	add    %edx,%eax
 805365f:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053665:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805366b:	29 f0                	sub    %esi,%eax
 805366d:	01 d0                	add    %edx,%eax
 805366f:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053675:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805367c:	74 10                	je     0x805368e
 805367e:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053684:	29 f0                	sub    %esi,%eax
 8053686:	01 d0                	add    %edx,%eax
 8053688:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805368e:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053695:	74 10                	je     0x80536a7
 8053697:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805369d:	29 f0                	sub    %esi,%eax
 805369f:	01 d0                	add    %edx,%eax
 80536a1:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80536a7:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80536ae:	74 10                	je     0x80536c0
 80536b0:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80536b6:	29 f0                	sub    %esi,%eax
 80536b8:	01 c2                	add    %eax,%edx
 80536ba:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80536c0:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80536c3:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80536c9:	8b 31                	mov    (%ecx),%esi
 80536cb:	29 f0                	sub    %esi,%eax
 80536cd:	40                   	inc    %eax
 80536ce:	8b 51 04             	mov    0x4(%ecx),%edx
 80536d1:	39 d0                	cmp    %edx,%eax
 80536d3:	0f 87 2f ff ff ff    	ja     0x8053608
 80536d9:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80536df:	c6 03 18             	movb   $0x18,(%ebx)
 80536e2:	e9 67 08 00 00       	jmp    0x8053f4e
 80536e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80536ea:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 80536f0:	0f 85 96 08 00 00    	jne    0x8053f8c
 80536f6:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80536fc:	89 9d cc fe ff ff    	mov    %ebx,0xfffffecc(%ebp)
 8053702:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053705:	89 d8                	mov    %ebx,%eax
 8053707:	e9 c1 00 00 00       	jmp    0x80537cd
 805370c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8053710:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053716:	0f 84 d7 0b 00 00    	je     0x80542f3
 805371c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805371f:	89 d0                	mov    %edx,%eax
 8053721:	01 d0                	add    %edx,%eax
 8053723:	89 43 04             	mov    %eax,0x4(%ebx)
 8053726:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805372b:	76 07                	jbe    0x8053734
 805372d:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8053734:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053737:	8b 41 04             	mov    0x4(%ecx),%eax
 805373a:	50                   	push   %eax
 805373b:	8b 01                	mov    (%ecx),%eax
 805373d:	50                   	push   %eax
 805373e:	e8 a9 59 ff ff       	call   0x80490ec
 8053743:	89 c2                	mov    %eax,%edx
 8053745:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053748:	83 c4 08             	add    $0x8,%esp
 805374b:	89 13                	mov    %edx,(%ebx)
 805374d:	85 d2                	test   %edx,%edx
 805374f:	0f 84 57 de ff ff    	je     0x80515ac
 8053755:	39 d6                	cmp    %edx,%esi
 8053757:	74 6b                	je     0x80537c4
 8053759:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805375f:	29 f0                	sub    %esi,%eax
 8053761:	01 d0                	add    %edx,%eax
 8053763:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053769:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805376f:	29 f0                	sub    %esi,%eax
 8053771:	01 d0                	add    %edx,%eax
 8053773:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053779:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053780:	74 10                	je     0x8053792
 8053782:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053788:	29 f0                	sub    %esi,%eax
 805378a:	01 d0                	add    %edx,%eax
 805378c:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053792:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053799:	74 10                	je     0x80537ab
 805379b:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 80537a1:	29 f0                	sub    %esi,%eax
 80537a3:	01 d0                	add    %edx,%eax
 80537a5:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80537ab:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80537b2:	74 10                	je     0x80537c4
 80537b4:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80537ba:	29 f0                	sub    %esi,%eax
 80537bc:	01 c2                	add    %eax,%edx
 80537be:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80537c4:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80537c7:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80537cd:	8b 31                	mov    (%ecx),%esi
 80537cf:	29 f0                	sub    %esi,%eax
 80537d1:	40                   	inc    %eax
 80537d2:	8b 51 04             	mov    0x4(%ecx),%edx
 80537d5:	39 d0                	cmp    %edx,%eax
 80537d7:	0f 87 33 ff ff ff    	ja     0x8053710
 80537dd:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80537e3:	c6 03 19             	movb   $0x19,(%ebx)
 80537e6:	e9 63 07 00 00       	jmp    0x8053f4e
 80537eb:	90                   	nop    
 80537ec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80537f0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80537f3:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 80537f9:	0f 85 8d 07 00 00    	jne    0x8053f8c
 80537ff:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053802:	8b 33                	mov    (%ebx),%esi
 8053804:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805380a:	29 f0                	sub    %esi,%eax
 805380c:	40                   	inc    %eax
 805380d:	8b 53 04             	mov    0x4(%ebx),%edx
 8053810:	39 d0                	cmp    %edx,%eax
 8053812:	0f 86 ce 00 00 00    	jbe    0x80538e6
 8053818:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 805381e:	0f 84 cf 0a 00 00    	je     0x80542f3
 8053824:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053827:	89 d0                	mov    %edx,%eax
 8053829:	01 d0                	add    %edx,%eax
 805382b:	89 41 04             	mov    %eax,0x4(%ecx)
 805382e:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053833:	76 0b                	jbe    0x8053840
 8053835:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 805383c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8053840:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053843:	8b 43 04             	mov    0x4(%ebx),%eax
 8053846:	50                   	push   %eax
 8053847:	8b 03                	mov    (%ebx),%eax
 8053849:	50                   	push   %eax
 805384a:	e8 9d 58 ff ff       	call   0x80490ec
 805384f:	89 c2                	mov    %eax,%edx
 8053851:	89 13                	mov    %edx,(%ebx)
 8053853:	83 c4 08             	add    $0x8,%esp
 8053856:	85 d2                	test   %edx,%edx
 8053858:	0f 84 4e dd ff ff    	je     0x80515ac
 805385e:	39 d6                	cmp    %edx,%esi
 8053860:	74 6b                	je     0x80538cd
 8053862:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053868:	29 f0                	sub    %esi,%eax
 805386a:	01 d0                	add    %edx,%eax
 805386c:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053872:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053878:	29 f0                	sub    %esi,%eax
 805387a:	01 d0                	add    %edx,%eax
 805387c:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053882:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053889:	74 10                	je     0x805389b
 805388b:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053891:	29 f0                	sub    %esi,%eax
 8053893:	01 d0                	add    %edx,%eax
 8053895:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805389b:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 80538a2:	74 10                	je     0x80538b4
 80538a4:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 80538aa:	29 f0                	sub    %esi,%eax
 80538ac:	01 d0                	add    %edx,%eax
 80538ae:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80538b4:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80538bb:	74 10                	je     0x80538cd
 80538bd:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80538c3:	29 f0                	sub    %esi,%eax
 80538c5:	01 c2                	add    %eax,%edx
 80538c7:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80538cd:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80538d0:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80538d6:	8b 31                	mov    (%ecx),%esi
 80538d8:	29 f0                	sub    %esi,%eax
 80538da:	40                   	inc    %eax
 80538db:	8b 51 04             	mov    0x4(%ecx),%edx
 80538de:	39 d0                	cmp    %edx,%eax
 80538e0:	0f 87 32 ff ff ff    	ja     0x8053818
 80538e6:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80538ec:	c6 03 1a             	movb   $0x1a,(%ebx)
 80538ef:	e9 5a 06 00 00       	jmp    0x8053f4e
 80538f4:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80538f7:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 80538fd:	0f 85 89 06 00 00    	jne    0x8053f8c
 8053903:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053906:	8b 33                	mov    (%ebx),%esi
 8053908:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805390e:	29 f0                	sub    %esi,%eax
 8053910:	40                   	inc    %eax
 8053911:	8b 53 04             	mov    0x4(%ebx),%edx
 8053914:	39 d0                	cmp    %edx,%eax
 8053916:	0f 86 ce 00 00 00    	jbe    0x80539ea
 805391c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8053920:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053926:	0f 84 c7 09 00 00    	je     0x80542f3
 805392c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805392f:	89 d0                	mov    %edx,%eax
 8053931:	01 d0                	add    %edx,%eax
 8053933:	89 41 04             	mov    %eax,0x4(%ecx)
 8053936:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805393b:	76 07                	jbe    0x8053944
 805393d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053944:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053947:	8b 43 04             	mov    0x4(%ebx),%eax
 805394a:	50                   	push   %eax
 805394b:	8b 03                	mov    (%ebx),%eax
 805394d:	50                   	push   %eax
 805394e:	e8 99 57 ff ff       	call   0x80490ec
 8053953:	89 c2                	mov    %eax,%edx
 8053955:	89 13                	mov    %edx,(%ebx)
 8053957:	83 c4 08             	add    $0x8,%esp
 805395a:	85 d2                	test   %edx,%edx
 805395c:	0f 84 4a dc ff ff    	je     0x80515ac
 8053962:	39 d6                	cmp    %edx,%esi
 8053964:	74 6b                	je     0x80539d1
 8053966:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805396c:	29 f0                	sub    %esi,%eax
 805396e:	01 d0                	add    %edx,%eax
 8053970:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053976:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805397c:	29 f0                	sub    %esi,%eax
 805397e:	01 d0                	add    %edx,%eax
 8053980:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053986:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805398d:	74 10                	je     0x805399f
 805398f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053995:	29 f0                	sub    %esi,%eax
 8053997:	01 d0                	add    %edx,%eax
 8053999:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805399f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 80539a6:	74 10                	je     0x80539b8
 80539a8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 80539ae:	29 f0                	sub    %esi,%eax
 80539b0:	01 d0                	add    %edx,%eax
 80539b2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80539b8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80539bf:	74 10                	je     0x80539d1
 80539c1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80539c7:	29 f0                	sub    %esi,%eax
 80539c9:	01 c2                	add    %eax,%edx
 80539cb:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80539d1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80539d4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80539da:	8b 31                	mov    (%ecx),%esi
 80539dc:	29 f0                	sub    %esi,%eax
 80539de:	40                   	inc    %eax
 80539df:	8b 51 04             	mov    0x4(%ecx),%edx
 80539e2:	39 d0                	cmp    %edx,%eax
 80539e4:	0f 87 36 ff ff ff    	ja     0x8053920
 80539ea:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80539f0:	c6 03 1b             	movb   $0x1b,(%ebx)
 80539f3:	e9 56 05 00 00       	jmp    0x8053f4e
 80539f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 80539fb:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 8053a01:	0f 85 85 05 00 00    	jne    0x8053f8c
 8053a07:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053a0a:	8b 33                	mov    (%ebx),%esi
 8053a0c:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053a12:	29 f0                	sub    %esi,%eax
 8053a14:	40                   	inc    %eax
 8053a15:	8b 53 04             	mov    0x4(%ebx),%edx
 8053a18:	39 d0                	cmp    %edx,%eax
 8053a1a:	0f 86 ca 00 00 00    	jbe    0x8053aea
 8053a20:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053a26:	0f 84 c7 08 00 00    	je     0x80542f3
 8053a2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053a2f:	89 d0                	mov    %edx,%eax
 8053a31:	01 d0                	add    %edx,%eax
 8053a33:	89 41 04             	mov    %eax,0x4(%ecx)
 8053a36:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053a3b:	76 07                	jbe    0x8053a44
 8053a3d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053a44:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053a47:	8b 43 04             	mov    0x4(%ebx),%eax
 8053a4a:	50                   	push   %eax
 8053a4b:	8b 03                	mov    (%ebx),%eax
 8053a4d:	50                   	push   %eax
 8053a4e:	e8 99 56 ff ff       	call   0x80490ec
 8053a53:	89 c2                	mov    %eax,%edx
 8053a55:	89 13                	mov    %edx,(%ebx)
 8053a57:	83 c4 08             	add    $0x8,%esp
 8053a5a:	85 d2                	test   %edx,%edx
 8053a5c:	0f 84 4a db ff ff    	je     0x80515ac
 8053a62:	39 d6                	cmp    %edx,%esi
 8053a64:	74 6b                	je     0x8053ad1
 8053a66:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053a6c:	29 f0                	sub    %esi,%eax
 8053a6e:	01 d0                	add    %edx,%eax
 8053a70:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053a76:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053a7c:	29 f0                	sub    %esi,%eax
 8053a7e:	01 d0                	add    %edx,%eax
 8053a80:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053a86:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053a8d:	74 10                	je     0x8053a9f
 8053a8f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053a95:	29 f0                	sub    %esi,%eax
 8053a97:	01 d0                	add    %edx,%eax
 8053a99:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053a9f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053aa6:	74 10                	je     0x8053ab8
 8053aa8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053aae:	29 f0                	sub    %esi,%eax
 8053ab0:	01 d0                	add    %edx,%eax
 8053ab2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053ab8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053abf:	74 10                	je     0x8053ad1
 8053ac1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053ac7:	29 f0                	sub    %esi,%eax
 8053ac9:	01 c2                	add    %eax,%edx
 8053acb:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053ad1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053ad4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053ada:	8b 31                	mov    (%ecx),%esi
 8053adc:	29 f0                	sub    %esi,%eax
 8053ade:	40                   	inc    %eax
 8053adf:	8b 51 04             	mov    0x4(%ecx),%edx
 8053ae2:	39 d0                	cmp    %edx,%eax
 8053ae4:	0f 87 36 ff ff ff    	ja     0x8053a20
 8053aea:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053af0:	c6 03 1c             	movb   $0x1c,(%ebx)
 8053af3:	e9 56 04 00 00       	jmp    0x8053f4e
 8053af8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053afb:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 8053b01:	0f 85 85 04 00 00    	jne    0x8053f8c
 8053b07:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053b0a:	8b 33                	mov    (%ebx),%esi
 8053b0c:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053b12:	29 f0                	sub    %esi,%eax
 8053b14:	40                   	inc    %eax
 8053b15:	8b 53 04             	mov    0x4(%ebx),%edx
 8053b18:	39 d0                	cmp    %edx,%eax
 8053b1a:	0f 86 ca 00 00 00    	jbe    0x8053bea
 8053b20:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053b26:	0f 84 c7 07 00 00    	je     0x80542f3
 8053b2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053b2f:	89 d0                	mov    %edx,%eax
 8053b31:	01 d0                	add    %edx,%eax
 8053b33:	89 41 04             	mov    %eax,0x4(%ecx)
 8053b36:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053b3b:	76 07                	jbe    0x8053b44
 8053b3d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053b44:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053b47:	8b 43 04             	mov    0x4(%ebx),%eax
 8053b4a:	50                   	push   %eax
 8053b4b:	8b 03                	mov    (%ebx),%eax
 8053b4d:	50                   	push   %eax
 8053b4e:	e8 99 55 ff ff       	call   0x80490ec
 8053b53:	89 c2                	mov    %eax,%edx
 8053b55:	89 13                	mov    %edx,(%ebx)
 8053b57:	83 c4 08             	add    $0x8,%esp
 8053b5a:	85 d2                	test   %edx,%edx
 8053b5c:	0f 84 4a da ff ff    	je     0x80515ac
 8053b62:	39 d6                	cmp    %edx,%esi
 8053b64:	74 6b                	je     0x8053bd1
 8053b66:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053b6c:	29 f0                	sub    %esi,%eax
 8053b6e:	01 d0                	add    %edx,%eax
 8053b70:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053b76:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053b7c:	29 f0                	sub    %esi,%eax
 8053b7e:	01 d0                	add    %edx,%eax
 8053b80:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053b86:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053b8d:	74 10                	je     0x8053b9f
 8053b8f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053b95:	29 f0                	sub    %esi,%eax
 8053b97:	01 d0                	add    %edx,%eax
 8053b99:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053b9f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053ba6:	74 10                	je     0x8053bb8
 8053ba8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053bae:	29 f0                	sub    %esi,%eax
 8053bb0:	01 d0                	add    %edx,%eax
 8053bb2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053bb8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053bbf:	74 10                	je     0x8053bd1
 8053bc1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053bc7:	29 f0                	sub    %esi,%eax
 8053bc9:	01 c2                	add    %eax,%edx
 8053bcb:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053bd1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053bd4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053bda:	8b 31                	mov    (%ecx),%esi
 8053bdc:	29 f0                	sub    %esi,%eax
 8053bde:	40                   	inc    %eax
 8053bdf:	8b 51 04             	mov    0x4(%ecx),%edx
 8053be2:	39 d0                	cmp    %edx,%eax
 8053be4:	0f 87 36 ff ff ff    	ja     0x8053b20
 8053bea:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053bf0:	c6 03 1d             	movb   $0x1d,(%ebx)
 8053bf3:	e9 56 03 00 00       	jmp    0x8053f4e
 8053bf8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053bfb:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 8053c01:	0f 85 85 03 00 00    	jne    0x8053f8c
 8053c07:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053c0a:	8b 33                	mov    (%ebx),%esi
 8053c0c:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053c12:	29 f0                	sub    %esi,%eax
 8053c14:	40                   	inc    %eax
 8053c15:	8b 53 04             	mov    0x4(%ebx),%edx
 8053c18:	39 d0                	cmp    %edx,%eax
 8053c1a:	0f 86 ca 00 00 00    	jbe    0x8053cea
 8053c20:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053c26:	0f 84 c7 06 00 00    	je     0x80542f3
 8053c2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053c2f:	89 d0                	mov    %edx,%eax
 8053c31:	01 d0                	add    %edx,%eax
 8053c33:	89 41 04             	mov    %eax,0x4(%ecx)
 8053c36:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053c3b:	76 07                	jbe    0x8053c44
 8053c3d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053c44:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053c47:	8b 43 04             	mov    0x4(%ebx),%eax
 8053c4a:	50                   	push   %eax
 8053c4b:	8b 03                	mov    (%ebx),%eax
 8053c4d:	50                   	push   %eax
 8053c4e:	e8 99 54 ff ff       	call   0x80490ec
 8053c53:	89 c2                	mov    %eax,%edx
 8053c55:	89 13                	mov    %edx,(%ebx)
 8053c57:	83 c4 08             	add    $0x8,%esp
 8053c5a:	85 d2                	test   %edx,%edx
 8053c5c:	0f 84 4a d9 ff ff    	je     0x80515ac
 8053c62:	39 d6                	cmp    %edx,%esi
 8053c64:	74 6b                	je     0x8053cd1
 8053c66:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053c6c:	29 f0                	sub    %esi,%eax
 8053c6e:	01 d0                	add    %edx,%eax
 8053c70:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053c76:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053c7c:	29 f0                	sub    %esi,%eax
 8053c7e:	01 d0                	add    %edx,%eax
 8053c80:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053c86:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053c8d:	74 10                	je     0x8053c9f
 8053c8f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053c95:	29 f0                	sub    %esi,%eax
 8053c97:	01 d0                	add    %edx,%eax
 8053c99:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053c9f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053ca6:	74 10                	je     0x8053cb8
 8053ca8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053cae:	29 f0                	sub    %esi,%eax
 8053cb0:	01 d0                	add    %edx,%eax
 8053cb2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053cb8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053cbf:	74 10                	je     0x8053cd1
 8053cc1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053cc7:	29 f0                	sub    %esi,%eax
 8053cc9:	01 c2                	add    %eax,%edx
 8053ccb:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053cd1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053cd4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053cda:	8b 31                	mov    (%ecx),%esi
 8053cdc:	29 f0                	sub    %esi,%eax
 8053cde:	40                   	inc    %eax
 8053cdf:	8b 51 04             	mov    0x4(%ecx),%edx
 8053ce2:	39 d0                	cmp    %edx,%eax
 8053ce4:	0f 87 36 ff ff ff    	ja     0x8053c20
 8053cea:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053cf0:	c6 03 0b             	movb   $0xb,(%ebx)
 8053cf3:	e9 56 02 00 00       	jmp    0x8053f4e
 8053cf8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053cfb:	f7 c1 00 00 08 00    	test   $0x80000,%ecx
 8053d01:	0f 85 85 02 00 00    	jne    0x8053f8c
 8053d07:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053d0a:	8b 33                	mov    (%ebx),%esi
 8053d0c:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053d12:	29 f0                	sub    %esi,%eax
 8053d14:	40                   	inc    %eax
 8053d15:	8b 53 04             	mov    0x4(%ebx),%edx
 8053d18:	39 d0                	cmp    %edx,%eax
 8053d1a:	0f 86 ca 00 00 00    	jbe    0x8053dea
 8053d20:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053d26:	0f 84 c7 05 00 00    	je     0x80542f3
 8053d2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053d2f:	89 d0                	mov    %edx,%eax
 8053d31:	01 d0                	add    %edx,%eax
 8053d33:	89 41 04             	mov    %eax,0x4(%ecx)
 8053d36:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053d3b:	76 07                	jbe    0x8053d44
 8053d3d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053d44:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053d47:	8b 43 04             	mov    0x4(%ebx),%eax
 8053d4a:	50                   	push   %eax
 8053d4b:	8b 03                	mov    (%ebx),%eax
 8053d4d:	50                   	push   %eax
 8053d4e:	e8 99 53 ff ff       	call   0x80490ec
 8053d53:	89 c2                	mov    %eax,%edx
 8053d55:	89 13                	mov    %edx,(%ebx)
 8053d57:	83 c4 08             	add    $0x8,%esp
 8053d5a:	85 d2                	test   %edx,%edx
 8053d5c:	0f 84 4a d8 ff ff    	je     0x80515ac
 8053d62:	39 d6                	cmp    %edx,%esi
 8053d64:	74 6b                	je     0x8053dd1
 8053d66:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053d6c:	29 f0                	sub    %esi,%eax
 8053d6e:	01 d0                	add    %edx,%eax
 8053d70:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053d76:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053d7c:	29 f0                	sub    %esi,%eax
 8053d7e:	01 d0                	add    %edx,%eax
 8053d80:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053d86:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053d8d:	74 10                	je     0x8053d9f
 8053d8f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053d95:	29 f0                	sub    %esi,%eax
 8053d97:	01 d0                	add    %edx,%eax
 8053d99:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053d9f:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053da6:	74 10                	je     0x8053db8
 8053da8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053dae:	29 f0                	sub    %esi,%eax
 8053db0:	01 d0                	add    %edx,%eax
 8053db2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053db8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053dbf:	74 10                	je     0x8053dd1
 8053dc1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053dc7:	29 f0                	sub    %esi,%eax
 8053dc9:	01 c2                	add    %eax,%edx
 8053dcb:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053dd1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053dd4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053dda:	8b 31                	mov    (%ecx),%esi
 8053ddc:	29 f0                	sub    %esi,%eax
 8053dde:	40                   	inc    %eax
 8053ddf:	8b 51 04             	mov    0x4(%ecx),%edx
 8053de2:	39 d0                	cmp    %edx,%eax
 8053de4:	0f 87 36 ff ff ff    	ja     0x8053d20
 8053dea:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053df0:	c6 03 0c             	movb   $0xc,(%ebx)
 8053df3:	e9 56 01 00 00       	jmp    0x8053f4e
 8053df8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053dfb:	f6 c5 40             	test   $0x40,%ch
 8053dfe:	0f 85 88 01 00 00    	jne    0x8053f8c
 8053e04:	8a 9d e8 fe ff ff    	mov    0xfffffee8(%ebp),%bl
 8053e0a:	88 9d e4 fe ff ff    	mov    %bl,0xfffffee4(%ebp)
 8053e10:	80 85 e4 fe ff ff d0 	addb   $0xd0,0xfffffee4(%ebp)
 8053e17:	31 c0                	xor    %eax,%eax
 8053e19:	8a 85 e4 fe ff ff    	mov    0xfffffee4(%ebp),%al
 8053e1f:	3b 85 bc fe ff ff    	cmp    0xfffffebc(%ebp),%eax
 8053e25:	0f 87 b5 04 00 00    	ja     0x80542e0
 8053e2b:	50                   	push   %eax
 8053e2c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8053e2f:	50                   	push   %eax
 8053e30:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8053e33:	50                   	push   %eax
 8053e34:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8053e37:	50                   	push   %eax
 8053e38:	e8 53 07 00 00       	call   0x8054590
 8053e3d:	83 c4 10             	add    $0x10,%esp
 8053e40:	84 c0                	test   %al,%al
 8053e42:	0f 85 44 01 00 00    	jne    0x8053f8c
 8053e48:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 8053e4e:	89 8d cc fe ff ff    	mov    %ecx,0xfffffecc(%ebp)
 8053e54:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053e57:	89 c8                	mov    %ecx,%eax
 8053e59:	8b 33                	mov    (%ebx),%esi
 8053e5b:	29 f0                	sub    %esi,%eax
 8053e5d:	83 c0 02             	add    $0x2,%eax
 8053e60:	8b 53 04             	mov    0x4(%ebx),%edx
 8053e63:	39 d0                	cmp    %edx,%eax
 8053e65:	0f 86 d1 00 00 00    	jbe    0x8053f3c
 8053e6b:	90                   	nop    
 8053e6c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8053e70:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8053e76:	0f 84 77 04 00 00    	je     0x80542f3
 8053e7c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053e7f:	89 d0                	mov    %edx,%eax
 8053e81:	01 d0                	add    %edx,%eax
 8053e83:	89 41 04             	mov    %eax,0x4(%ecx)
 8053e86:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8053e8b:	76 07                	jbe    0x8053e94
 8053e8d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8053e94:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8053e97:	8b 43 04             	mov    0x4(%ebx),%eax
 8053e9a:	50                   	push   %eax
 8053e9b:	8b 03                	mov    (%ebx),%eax
 8053e9d:	50                   	push   %eax
 8053e9e:	e8 49 52 ff ff       	call   0x80490ec
 8053ea3:	89 c2                	mov    %eax,%edx
 8053ea5:	89 13                	mov    %edx,(%ebx)
 8053ea7:	83 c4 08             	add    $0x8,%esp
 8053eaa:	85 d2                	test   %edx,%edx
 8053eac:	0f 84 fa d6 ff ff    	je     0x80515ac
 8053eb2:	39 d6                	cmp    %edx,%esi
 8053eb4:	74 6b                	je     0x8053f21
 8053eb6:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053ebc:	29 f0                	sub    %esi,%eax
 8053ebe:	01 d0                	add    %edx,%eax
 8053ec0:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8053ec6:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 8053ecc:	29 f0                	sub    %esi,%eax
 8053ece:	01 d0                	add    %edx,%eax
 8053ed0:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8053ed6:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8053edd:	74 10                	je     0x8053eef
 8053edf:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8053ee5:	29 f0                	sub    %esi,%eax
 8053ee7:	01 d0                	add    %edx,%eax
 8053ee9:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 8053eef:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8053ef6:	74 10                	je     0x8053f08
 8053ef8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 8053efe:	29 f0                	sub    %esi,%eax
 8053f00:	01 d0                	add    %edx,%eax
 8053f02:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 8053f08:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053f0f:	74 10                	je     0x8053f21
 8053f11:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 8053f17:	29 f0                	sub    %esi,%eax
 8053f19:	01 c2                	add    %eax,%edx
 8053f1b:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 8053f21:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8053f24:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 8053f2a:	8b 31                	mov    (%ecx),%esi
 8053f2c:	29 f0                	sub    %esi,%eax
 8053f2e:	83 c0 02             	add    $0x2,%eax
 8053f31:	8b 51 04             	mov    0x4(%ecx),%edx
 8053f34:	39 d0                	cmp    %edx,%eax
 8053f36:	0f 87 34 ff ff ff    	ja     0x8053e70
 8053f3c:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8053f42:	c6 03 08             	movb   $0x8,(%ebx)
 8053f45:	43                   	inc    %ebx
 8053f46:	8a 8d e4 fe ff ff    	mov    0xfffffee4(%ebp),%cl
 8053f4c:	88 0b                	mov    %cl,(%ebx)
 8053f4e:	43                   	inc    %ebx
 8053f4f:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8053f55:	e9 b0 02 00 00       	jmp    0x805420a
 8053f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8053f60:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8053f63:	f6 c3 02             	test   $0x2,%bl
 8053f66:	0f 85 81 d9 ff ff    	jne    0x80518ed
 8053f6c:	83 bd d4 fe ff ff 00 	cmpl   $0x0,0xfffffed4(%ebp)
 8053f73:	74 17                	je     0x8053f8c
 8053f75:	31 c0                	xor    %eax,%eax
 8053f77:	8b 8d d4 fe ff ff    	mov    0xfffffed4(%ebp),%ecx
 8053f7d:	8a 85 e8 fe ff ff    	mov    0xfffffee8(%ebp),%al
 8053f83:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8053f86:	88 85 e8 fe ff ff    	mov    %al,0xfffffee8(%ebp)
 8053f8c:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 8053f93:	74 72                	je     0x8054007
 8053f95:	8b 9d d0 fe ff ff    	mov    0xfffffed0(%ebp),%ebx
 8053f9b:	31 c0                	xor    %eax,%eax
 8053f9d:	8a 03                	mov    (%ebx),%al
 8053f9f:	8d 44 18 01          	lea    0x1(%eax,%ebx,1),%eax
 8053fa3:	3b 85 dc fe ff ff    	cmp    0xfffffedc(%ebp),%eax
 8053fa9:	75 5c                	jne    0x8054007
 8053fab:	80 3b ff             	cmpb   $0xff,(%ebx)
 8053fae:	74 57                	je     0x8054007
 8053fb0:	8b 95 ec fe ff ff    	mov    0xfffffeec(%ebp),%edx
 8053fb6:	89 d6                	mov    %edx,%esi
 8053fb8:	8a 02                	mov    (%edx),%al
 8053fba:	3c 2a                	cmp    $0x2a,%al
 8053fbc:	74 49                	je     0x8054007
 8053fbe:	3c 5e                	cmp    $0x5e,%al
 8053fc0:	74 45                	je     0x8054007
 8053fc2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8053fc5:	f6 c1 02             	test   $0x2,%cl
 8053fc8:	74 07                	je     0x8053fd1
 8053fca:	3c 5c                	cmp    $0x5c,%al
 8053fcc:	75 0b                	jne    0x8053fd9
 8053fce:	8a 42 01             	mov    0x1(%edx),%al
 8053fd1:	3c 2b                	cmp    $0x2b,%al
 8053fd3:	74 32                	je     0x8054007
 8053fd5:	3c 3f                	cmp    $0x3f,%al
 8053fd7:	74 2e                	je     0x8054007
 8053fd9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8053fdc:	f6 c7 02             	test   $0x2,%bh
 8053fdf:	0f 84 ef 01 00 00    	je     0x80541d4
 8053fe5:	f6 c7 10             	test   $0x10,%bh
 8053fe8:	74 0a                	je     0x8053ff4
 8053fea:	80 3e 7b             	cmpb   $0x7b,(%esi)
 8053fed:	74 18                	je     0x8054007
 8053fef:	e9 e0 01 00 00       	jmp    0x80541d4
 8053ff4:	80 3e 5c             	cmpb   $0x5c,(%esi)
 8053ff7:	0f 85 d7 01 00 00    	jne    0x80541d4
 8053ffd:	80 7a 01 7b          	cmpb   $0x7b,0x1(%edx)
 8054001:	0f 85 cd 01 00 00    	jne    0x80541d4
 8054007:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 805400d:	89 8d cc fe ff ff    	mov    %ecx,0xfffffecc(%ebp)
 8054013:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054016:	89 c8                	mov    %ecx,%eax
 8054018:	8b 33                	mov    (%ebx),%esi
 805401a:	29 f0                	sub    %esi,%eax
 805401c:	83 c0 02             	add    $0x2,%eax
 805401f:	8b 53 04             	mov    0x4(%ebx),%edx
 8054022:	39 d0                	cmp    %edx,%eax
 8054024:	0f 86 d2 00 00 00    	jbe    0x80540fc
 805402a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8054030:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8054036:	0f 84 b7 02 00 00    	je     0x80542f3
 805403c:	8b 4d 14             	mov    0x14(%ebp),%ecx
 805403f:	89 d0                	mov    %edx,%eax
 8054041:	01 d0                	add    %edx,%eax
 8054043:	89 41 04             	mov    %eax,0x4(%ecx)
 8054046:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805404b:	76 07                	jbe    0x8054054
 805404d:	c7 41 04 00 00 01 00 	movl   $0x10000,0x4(%ecx)
 8054054:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054057:	8b 43 04             	mov    0x4(%ebx),%eax
 805405a:	50                   	push   %eax
 805405b:	8b 03                	mov    (%ebx),%eax
 805405d:	50                   	push   %eax
 805405e:	e8 89 50 ff ff       	call   0x80490ec
 8054063:	89 c2                	mov    %eax,%edx
 8054065:	89 13                	mov    %edx,(%ebx)
 8054067:	83 c4 08             	add    $0x8,%esp
 805406a:	85 d2                	test   %edx,%edx
 805406c:	0f 84 3a d5 ff ff    	je     0x80515ac
 8054072:	39 d6                	cmp    %edx,%esi
 8054074:	74 6b                	je     0x80540e1
 8054076:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805407c:	29 f0                	sub    %esi,%eax
 805407e:	01 d0                	add    %edx,%eax
 8054080:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8054086:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805408c:	29 f0                	sub    %esi,%eax
 805408e:	01 d0                	add    %edx,%eax
 8054090:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8054096:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805409d:	74 10                	je     0x80540af
 805409f:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 80540a5:	29 f0                	sub    %esi,%eax
 80540a7:	01 d0                	add    %edx,%eax
 80540a9:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 80540af:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 80540b6:	74 10                	je     0x80540c8
 80540b8:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 80540be:	29 f0                	sub    %esi,%eax
 80540c0:	01 d0                	add    %edx,%eax
 80540c2:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80540c8:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80540cf:	74 10                	je     0x80540e1
 80540d1:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80540d7:	29 f0                	sub    %esi,%eax
 80540d9:	01 c2                	add    %eax,%edx
 80540db:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80540e1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80540e4:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80540ea:	8b 31                	mov    (%ecx),%esi
 80540ec:	29 f0                	sub    %esi,%eax
 80540ee:	83 c0 02             	add    $0x2,%eax
 80540f1:	8b 51 04             	mov    0x4(%ecx),%edx
 80540f4:	39 d0                	cmp    %edx,%eax
 80540f6:	0f 87 34 ff ff ff    	ja     0x8054030
 80540fc:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 8054102:	c6 03 02             	movb   $0x2,(%ebx)
 8054105:	43                   	inc    %ebx
 8054106:	c6 03 00             	movb   $0x0,(%ebx)
 8054109:	43                   	inc    %ebx
 805410a:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 8054110:	4b                   	dec    %ebx
 8054111:	89 9d d0 fe ff ff    	mov    %ebx,0xfffffed0(%ebp)
 8054117:	e9 b8 00 00 00       	jmp    0x80541d4
 805411c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054120:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8054126:	0f 84 c7 01 00 00    	je     0x80542f3
 805412c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805412f:	89 d0                	mov    %edx,%eax
 8054131:	01 d0                	add    %edx,%eax
 8054133:	89 43 04             	mov    %eax,0x4(%ebx)
 8054136:	3d 00 00 01 00       	cmp    $0x10000,%eax
 805413b:	76 07                	jbe    0x8054144
 805413d:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8054144:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054147:	8b 41 04             	mov    0x4(%ecx),%eax
 805414a:	50                   	push   %eax
 805414b:	8b 01                	mov    (%ecx),%eax
 805414d:	50                   	push   %eax
 805414e:	e8 99 4f ff ff       	call   0x80490ec
 8054153:	89 c2                	mov    %eax,%edx
 8054155:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054158:	83 c4 08             	add    $0x8,%esp
 805415b:	89 13                	mov    %edx,(%ebx)
 805415d:	85 d2                	test   %edx,%edx
 805415f:	0f 84 47 d4 ff ff    	je     0x80515ac
 8054165:	39 d6                	cmp    %edx,%esi
 8054167:	74 6b                	je     0x80541d4
 8054169:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805416f:	29 f0                	sub    %esi,%eax
 8054171:	01 d0                	add    %edx,%eax
 8054173:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8054179:	8b 85 c8 fe ff ff    	mov    0xfffffec8(%ebp),%eax
 805417f:	29 f0                	sub    %esi,%eax
 8054181:	01 d0                	add    %edx,%eax
 8054183:	89 85 c8 fe ff ff    	mov    %eax,0xfffffec8(%ebp)
 8054189:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8054190:	74 10                	je     0x80541a2
 8054192:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8054198:	29 f0                	sub    %esi,%eax
 805419a:	01 d0                	add    %edx,%eax
 805419c:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 80541a2:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 80541a9:	74 10                	je     0x80541bb
 80541ab:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 80541b1:	29 f0                	sub    %esi,%eax
 80541b3:	01 d0                	add    %edx,%eax
 80541b5:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80541bb:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80541c2:	74 10                	je     0x80541d4
 80541c4:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80541ca:	29 f0                	sub    %esi,%eax
 80541cc:	01 c2                	add    %eax,%edx
 80541ce:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80541d4:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80541d7:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80541dd:	8b 31                	mov    (%ecx),%esi
 80541df:	29 f0                	sub    %esi,%eax
 80541e1:	40                   	inc    %eax
 80541e2:	8b 51 04             	mov    0x4(%ecx),%edx
 80541e5:	39 d0                	cmp    %edx,%eax
 80541e7:	0f 87 33 ff ff ff    	ja     0x8054120
 80541ed:	8b 8d dc fe ff ff    	mov    0xfffffedc(%ebp),%ecx
 80541f3:	8a 9d e8 fe ff ff    	mov    0xfffffee8(%ebp),%bl
 80541f9:	88 19                	mov    %bl,(%ecx)
 80541fb:	41                   	inc    %ecx
 80541fc:	89 8d dc fe ff ff    	mov    %ecx,0xfffffedc(%ebp)
 8054202:	8b 9d d0 fe ff ff    	mov    0xfffffed0(%ebp),%ebx
 8054208:	fe 03                	incb   (%ebx)
 805420a:	8b 85 ec fe ff ff    	mov    0xfffffeec(%ebp),%eax
 8054210:	89 c2                	mov    %eax,%edx
 8054212:	3b 95 d8 fe ff ff    	cmp    0xfffffed8(%ebp),%edx
 8054218:	0f 85 32 d4 ff ff    	jne    0x8051650
 805421e:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 8054225:	74 21                	je     0x8054248
 8054227:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805422d:	2b 85 c0 fe ff ff    	sub    0xfffffec0(%ebp),%eax
 8054233:	83 c0 fd             	add    $0xfffffffd,%eax
 8054236:	50                   	push   %eax
 8054237:	8b 8d c0 fe ff ff    	mov    0xfffffec0(%ebp),%ecx
 805423d:	51                   	push   %ecx
 805423e:	6a 0e                	push   $0xe
 8054240:	e8 cb 01 00 00       	call   0x8054410
 8054245:	83 c4 0c             	add    $0xc,%esp
 8054248:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 805424c:	0f 84 ae 00 00 00    	je     0x8054300
 8054252:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054255:	50                   	push   %eax
 8054256:	e8 91 4f ff ff       	call   0x80491ec
 805425b:	b8 08 00 00 00       	mov    $0x8,%eax
 8054260:	e9 9d 01 00 00       	jmp    0x8054402
 8054265:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054268:	50                   	push   %eax
 8054269:	e8 7e 4f ff ff       	call   0x80491ec
 805426e:	b8 0b 00 00 00       	mov    $0xb,%eax
 8054273:	e9 8a 01 00 00       	jmp    0x8054402
 8054278:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805427b:	50                   	push   %eax
 805427c:	e8 6b 4f ff ff       	call   0x80491ec
 8054281:	b8 04 00 00 00       	mov    $0x4,%eax
 8054286:	e9 77 01 00 00       	jmp    0x8054402
 805428b:	90                   	nop    
 805428c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054290:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054293:	50                   	push   %eax
 8054294:	e8 53 4f ff ff       	call   0x80491ec
 8054299:	b8 07 00 00 00       	mov    $0x7,%eax
 805429e:	e9 5f 01 00 00       	jmp    0x8054402
 80542a3:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80542a6:	50                   	push   %eax
 80542a7:	e8 40 4f ff ff       	call   0x80491ec
 80542ac:	b8 09 00 00 00       	mov    $0x9,%eax
 80542b1:	e9 4c 01 00 00       	jmp    0x8054402
 80542b6:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80542b9:	50                   	push   %eax
 80542ba:	e8 2d 4f ff ff       	call   0x80491ec
 80542bf:	b8 0d 00 00 00       	mov    $0xd,%eax
 80542c4:	e9 39 01 00 00       	jmp    0x8054402
 80542c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80542d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 80542d5:	e9 28 01 00 00       	jmp    0x8054402
 80542da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80542e0:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80542e3:	50                   	push   %eax
 80542e4:	e8 03 4f ff ff       	call   0x80491ec
 80542e9:	b8 06 00 00 00       	mov    $0x6,%eax
 80542ee:	e9 0f 01 00 00       	jmp    0x8054402
 80542f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 80542f8:	e9 05 01 00 00       	jmp    0x8054402
 80542fd:	8d 76 00             	lea    0x0(%esi),%esi
 8054300:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8054303:	f7 c3 00 00 04 00    	test   $0x40000,%ebx
 8054309:	0f 84 da 00 00 00    	je     0x80543e9
 805430f:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054312:	8b 31                	mov    (%ecx),%esi
 8054314:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805431a:	e9 ac 00 00 00       	jmp    0x80543cb
 805431f:	90                   	nop    
 8054320:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
 8054326:	74 cb                	je     0x80542f3
 8054328:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805432b:	89 d0                	mov    %edx,%eax
 805432d:	01 d0                	add    %edx,%eax
 805432f:	89 43 04             	mov    %eax,0x4(%ebx)
 8054332:	3d 00 00 01 00       	cmp    $0x10000,%eax
 8054337:	76 07                	jbe    0x8054340
 8054339:	c7 43 04 00 00 01 00 	movl   $0x10000,0x4(%ebx)
 8054340:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054343:	8b 41 04             	mov    0x4(%ecx),%eax
 8054346:	50                   	push   %eax
 8054347:	8b 01                	mov    (%ecx),%eax
 8054349:	50                   	push   %eax
 805434a:	e8 9d 4d ff ff       	call   0x80490ec
 805434f:	89 c2                	mov    %eax,%edx
 8054351:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054354:	83 c4 08             	add    $0x8,%esp
 8054357:	89 13                	mov    %edx,(%ebx)
 8054359:	85 d2                	test   %edx,%edx
 805435b:	0f 84 4b d2 ff ff    	je     0x80515ac
 8054361:	39 d6                	cmp    %edx,%esi
 8054363:	74 5b                	je     0x80543c0
 8054365:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 805436b:	29 f0                	sub    %esi,%eax
 805436d:	01 d0                	add    %edx,%eax
 805436f:	89 85 dc fe ff ff    	mov    %eax,0xfffffedc(%ebp)
 8054375:	83 bd c0 fe ff ff 00 	cmpl   $0x0,0xfffffec0(%ebp)
 805437c:	74 10                	je     0x805438e
 805437e:	8b 85 c0 fe ff ff    	mov    0xfffffec0(%ebp),%eax
 8054384:	29 f0                	sub    %esi,%eax
 8054386:	01 d0                	add    %edx,%eax
 8054388:	89 85 c0 fe ff ff    	mov    %eax,0xfffffec0(%ebp)
 805438e:	83 bd cc fe ff ff 00 	cmpl   $0x0,0xfffffecc(%ebp)
 8054395:	74 10                	je     0x80543a7
 8054397:	8b 85 cc fe ff ff    	mov    0xfffffecc(%ebp),%eax
 805439d:	29 f0                	sub    %esi,%eax
 805439f:	01 d0                	add    %edx,%eax
 80543a1:	89 85 cc fe ff ff    	mov    %eax,0xfffffecc(%ebp)
 80543a7:	83 bd d0 fe ff ff 00 	cmpl   $0x0,0xfffffed0(%ebp)
 80543ae:	74 10                	je     0x80543c0
 80543b0:	8b 85 d0 fe ff ff    	mov    0xfffffed0(%ebp),%eax
 80543b6:	29 f0                	sub    %esi,%eax
 80543b8:	01 c2                	add    %eax,%edx
 80543ba:	89 95 d0 fe ff ff    	mov    %edx,0xfffffed0(%ebp)
 80543c0:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80543c3:	8b 85 dc fe ff ff    	mov    0xfffffedc(%ebp),%eax
 80543c9:	8b 31                	mov    (%ecx),%esi
 80543cb:	29 f0                	sub    %esi,%eax
 80543cd:	40                   	inc    %eax
 80543ce:	8b 51 04             	mov    0x4(%ecx),%edx
 80543d1:	39 d0                	cmp    %edx,%eax
 80543d3:	0f 87 47 ff ff ff    	ja     0x8054320
 80543d9:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80543df:	c6 03 01             	movb   $0x1,(%ebx)
 80543e2:	43                   	inc    %ebx
 80543e3:	89 9d dc fe ff ff    	mov    %ebx,0xfffffedc(%ebp)
 80543e9:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80543ec:	50                   	push   %eax
 80543ed:	e8 fa 4d ff ff       	call   0x80491ec
 80543f2:	8b 4d 14             	mov    0x14(%ebp),%ecx
 80543f5:	8b 9d dc fe ff ff    	mov    0xfffffedc(%ebp),%ebx
 80543fb:	31 c0                	xor    %eax,%eax
 80543fd:	2b 19                	sub    (%ecx),%ebx
 80543ff:	89 59 08             	mov    %ebx,0x8(%ecx)
 8054402:	8d a5 9c fe ff ff    	lea    0xfffffe9c(%ebp),%esp
 8054408:	5b                   	pop    %ebx
 8054409:	5e                   	pop    %esi
 805440a:	5f                   	pop    %edi
 805440b:	89 ec                	mov    %ebp,%esp
 805440d:	5d                   	pop    %ebp
 805440e:	c3                   	ret    
 805440f:	90                   	nop    
 8054410:	55                   	push   %ebp
 8054411:	89 e5                	mov    %esp,%ebp
 8054413:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054416:	8b 55 0c             	mov    0xc(%ebp),%edx
 8054419:	8b 45 10             	mov    0x10(%ebp),%eax
 805441c:	88 0a                	mov    %cl,(%edx)
 805441e:	88 42 01             	mov    %al,0x1(%edx)
 8054421:	c1 f8 08             	sar    $0x8,%eax
 8054424:	88 42 02             	mov    %al,0x2(%edx)
 8054427:	89 ec                	mov    %ebp,%esp
 8054429:	5d                   	pop    %ebp
 805442a:	c3                   	ret    
 805442b:	90                   	nop    
 805442c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054430:	55                   	push   %ebp
 8054431:	89 e5                	mov    %esp,%ebp
 8054433:	53                   	push   %ebx
 8054434:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8054437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 805443a:	8b 45 10             	mov    0x10(%ebp),%eax
 805443d:	8b 55 14             	mov    0x14(%ebp),%edx
 8054440:	88 19                	mov    %bl,(%ecx)
 8054442:	88 41 01             	mov    %al,0x1(%ecx)
 8054445:	c1 f8 08             	sar    $0x8,%eax
 8054448:	88 41 02             	mov    %al,0x2(%ecx)
 805444b:	88 51 03             	mov    %dl,0x3(%ecx)
 805444e:	c1 fa 08             	sar    $0x8,%edx
 8054451:	88 51 04             	mov    %dl,0x4(%ecx)
 8054454:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8054457:	89 ec                	mov    %ebp,%esp
 8054459:	5d                   	pop    %ebp
 805445a:	c3                   	ret    
 805445b:	90                   	nop    
 805445c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054460:	55                   	push   %ebp
 8054461:	89 e5                	mov    %esp,%ebp
 8054463:	53                   	push   %ebx
 8054464:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054467:	8b 55 14             	mov    0x14(%ebp),%edx
 805446a:	8d 4a 03             	lea    0x3(%edx),%ecx
 805446d:	39 da                	cmp    %ebx,%edx
 805446f:	74 0a                	je     0x805447b
 8054471:	4a                   	dec    %edx
 8054472:	49                   	dec    %ecx
 8054473:	8a 02                	mov    (%edx),%al
 8054475:	88 01                	mov    %al,(%ecx)
 8054477:	39 da                	cmp    %ebx,%edx
 8054479:	75 f6                	jne    0x8054471
 805447b:	8b 45 10             	mov    0x10(%ebp),%eax
 805447e:	50                   	push   %eax
 805447f:	53                   	push   %ebx
 8054480:	8b 45 08             	mov    0x8(%ebp),%eax
 8054483:	50                   	push   %eax
 8054484:	e8 87 ff ff ff       	call   0x8054410
 8054489:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 805448c:	89 ec                	mov    %ebp,%esp
 805448e:	5d                   	pop    %ebp
 805448f:	c3                   	ret    
 8054490:	55                   	push   %ebp
 8054491:	89 e5                	mov    %esp,%ebp
 8054493:	53                   	push   %ebx
 8054494:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054497:	8b 55 18             	mov    0x18(%ebp),%edx
 805449a:	8d 4a 05             	lea    0x5(%edx),%ecx
 805449d:	39 da                	cmp    %ebx,%edx
 805449f:	74 0a                	je     0x80544ab
 80544a1:	4a                   	dec    %edx
 80544a2:	49                   	dec    %ecx
 80544a3:	8a 02                	mov    (%edx),%al
 80544a5:	88 01                	mov    %al,(%ecx)
 80544a7:	39 da                	cmp    %ebx,%edx
 80544a9:	75 f6                	jne    0x80544a1
 80544ab:	8b 45 14             	mov    0x14(%ebp),%eax
 80544ae:	50                   	push   %eax
 80544af:	8b 45 10             	mov    0x10(%ebp),%eax
 80544b2:	50                   	push   %eax
 80544b3:	53                   	push   %ebx
 80544b4:	8b 45 08             	mov    0x8(%ebp),%eax
 80544b7:	50                   	push   %eax
 80544b8:	e8 73 ff ff ff       	call   0x8054430
 80544bd:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80544c0:	89 ec                	mov    %ebp,%esp
 80544c2:	5d                   	pop    %ebp
 80544c3:	c3                   	ret    
 80544c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80544ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 80544d0:	55                   	push   %ebp
 80544d1:	89 e5                	mov    %esp,%ebp
 80544d3:	31 d2                	xor    %edx,%edx
 80544d5:	53                   	push   %ebx
 80544d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80544d9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 80544dc:	8d 41 fe             	lea    0xfffffffe(%ecx),%eax
 80544df:	3b 45 08             	cmp    0x8(%ebp),%eax
 80544e2:	76 07                	jbe    0x80544eb
 80544e4:	80 78 ff 5c          	cmpb   $0x5c,0xffffffff(%eax)
 80544e8:	0f 94 c2             	sete   %dl
 80544eb:	31 c0                	xor    %eax,%eax
 80544ed:	8a 49 fe             	mov    0xfffffffe(%ecx),%cl
 80544f0:	80 f9 28             	cmp    $0x28,%cl
 80544f3:	75 09                	jne    0x80544fe
 80544f5:	f6 c7 20             	test   $0x20,%bh
 80544f8:	75 12                	jne    0x805450c
 80544fa:	84 d2                	test   %dl,%dl
 80544fc:	75 0e                	jne    0x805450c
 80544fe:	80 f9 7c             	cmp    $0x7c,%cl
 8054501:	75 0e                	jne    0x8054511
 8054503:	66 85 db             	test   %bx,%bx
 8054506:	7c 04                	jl     0x805450c
 8054508:	84 d2                	test   %dl,%dl
 805450a:	74 05                	je     0x8054511
 805450c:	b8 01 00 00 00       	mov    $0x1,%eax
 8054511:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8054514:	89 ec                	mov    %ebp,%esp
 8054516:	5d                   	pop    %ebp
 8054517:	c3                   	ret    
 8054518:	90                   	nop    
 8054519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054520:	55                   	push   %ebp
 8054521:	89 e5                	mov    %esp,%ebp
 8054523:	56                   	push   %esi
 8054524:	53                   	push   %ebx
 8054525:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054528:	8b 75 10             	mov    0x10(%ebp),%esi
 805452b:	80 39 5c             	cmpb   $0x5c,(%ecx)
 805452e:	0f 94 c3             	sete   %bl
 8054531:	8d 41 01             	lea    0x1(%ecx),%eax
 8054534:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8054537:	73 07                	jae    0x8054540
 8054539:	89 c2                	mov    %eax,%edx
 805453b:	eb 05                	jmp    0x8054542
 805453d:	8d 76 00             	lea    0x0(%esi),%esi
 8054540:	31 d2                	xor    %edx,%edx
 8054542:	31 c0                	xor    %eax,%eax
 8054544:	f7 c6 00 20 00 00    	test   $0x2000,%esi
 805454a:	74 07                	je     0x8054553
 805454c:	80 39 29             	cmpb   $0x29,(%ecx)
 805454f:	74 2c                	je     0x805457d
 8054551:	eb 0d                	jmp    0x8054560
 8054553:	84 db                	test   %bl,%bl
 8054555:	74 09                	je     0x8054560
 8054557:	85 d2                	test   %edx,%edx
 8054559:	74 05                	je     0x8054560
 805455b:	80 3a 29             	cmpb   $0x29,(%edx)
 805455e:	74 1d                	je     0x805457d
 8054560:	66 85 f6             	test   %si,%si
 8054563:	7d 0b                	jge    0x8054570
 8054565:	80 39 7c             	cmpb   $0x7c,(%ecx)
 8054568:	74 13                	je     0x805457d
 805456a:	eb 16                	jmp    0x8054582
 805456c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054570:	84 db                	test   %bl,%bl
 8054572:	74 0e                	je     0x8054582
 8054574:	85 d2                	test   %edx,%edx
 8054576:	74 0a                	je     0x8054582
 8054578:	80 3a 7c             	cmpb   $0x7c,(%edx)
 805457b:	75 05                	jne    0x8054582
 805457d:	b8 01 00 00 00       	mov    $0x1,%eax
 8054582:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8054585:	5b                   	pop    %ebx
 8054586:	5e                   	pop    %esi
 8054587:	89 ec                	mov    %ebp,%esp
 8054589:	5d                   	pop    %ebp
 805458a:	c3                   	ret    
 805458b:	90                   	nop    
 805458c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054590:	55                   	push   %ebp
 8054591:	89 e5                	mov    %esp,%ebp
 8054593:	53                   	push   %ebx
 8054594:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054597:	8b 55 10             	mov    0x10(%ebp),%edx
 805459a:	4a                   	dec    %edx
 805459b:	78 16                	js     0x80545b3
 805459d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80545a0:	8d 04 92             	lea    (%edx,%edx,4),%eax
 80545a3:	39 5c 81 10          	cmp    %ebx,0x10(%ecx,%eax,4)
 80545a7:	75 07                	jne    0x80545b0
 80545a9:	b8 01 00 00 00       	mov    $0x1,%eax
 80545ae:	eb 05                	jmp    0x80545b5
 80545b0:	4a                   	dec    %edx
 80545b1:	79 ed                	jns    0x80545a0
 80545b3:	31 c0                	xor    %eax,%eax
 80545b5:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80545b8:	89 ec                	mov    %ebp,%esp
 80545ba:	5d                   	pop    %ebp
 80545bb:	c3                   	ret    
 80545bc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80545c0:	55                   	push   %ebp
 80545c1:	89 e5                	mov    %esp,%ebp
 80545c3:	83 ec 04             	sub    $0x4,%esp
 80545c6:	57                   	push   %edi
 80545c7:	56                   	push   %esi
 80545c8:	53                   	push   %ebx
 80545c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80545cc:	8b 03                	mov    (%ebx),%eax
 80545ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 80545d1:	75 0d                	jne    0x80545e0
 80545d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 80545d8:	e9 a8 00 00 00       	jmp    0x8054685
 80545dd:	8d 76 00             	lea    0x0(%esi),%esi
 80545e0:	31 d2                	xor    %edx,%edx
 80545e2:	8a 50 fe             	mov    0xfffffffe(%eax),%dl
 80545e5:	31 c9                	xor    %ecx,%ecx
 80545e7:	8a 08                	mov    (%eax),%cl
 80545e9:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 80545ec:	40                   	inc    %eax
 80545ed:	89 03                	mov    %eax,(%ebx)
 80545ef:	39 ca                	cmp    %ecx,%edx
 80545f1:	76 0f                	jbe    0x8054602
 80545f3:	8b 45 14             	mov    0x14(%ebp),%eax
 80545f6:	a9 00 00 01 00       	test   $0x10000,%eax
 80545fb:	75 d6                	jne    0x80545d3
 80545fd:	e9 81 00 00 00       	jmp    0x8054683
 8054602:	89 d7                	mov    %edx,%edi
 8054604:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054608:	74 16                	je     0x8054620
 805460a:	89 fa                	mov    %edi,%edx
 805460c:	81 e2 ff 00 00 00    	and    $0xff,%edx
 8054612:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054615:	31 c0                	xor    %eax,%eax
 8054617:	8a 04 0a             	mov    (%edx,%ecx,1),%al
 805461a:	eb 0e                	jmp    0x805462a
 805461c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054620:	89 fa                	mov    %edi,%edx
 8054622:	81 e2 ff 00 00 00    	and    $0xff,%edx
 8054628:	89 d0                	mov    %edx,%eax
 805462a:	c1 f8 03             	sar    $0x3,%eax
 805462d:	8b 5d 18             	mov    0x18(%ebp),%ebx
 8054630:	01 c3                	add    %eax,%ebx
 8054632:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054636:	74 0a                	je     0x8054642
 8054638:	8b 4d 10             	mov    0x10(%ebp),%ecx
 805463b:	31 c0                	xor    %eax,%eax
 805463d:	8a 04 0a             	mov    (%edx,%ecx,1),%al
 8054640:	eb 02                	jmp    0x8054644
 8054642:	89 d0                	mov    %edx,%eax
 8054644:	c1 f8 03             	sar    $0x3,%eax
 8054647:	03 45 18             	add    0x18(%ebp),%eax
 805464a:	0f b6 30             	movzbl (%eax),%esi
 805464d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054651:	74 15                	je     0x8054668
 8054653:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054656:	8a 14 0a             	mov    (%edx,%ecx,1),%dl
 8054659:	81 e2 ff 00 00 00    	and    $0xff,%edx
 805465f:	89 d0                	mov    %edx,%eax
 8054661:	25 f8 01 00 00       	and    $0x1f8,%eax
 8054666:	eb 04                	jmp    0x805466c
 8054668:	89 d0                	mov    %edx,%eax
 805466a:	24 f8                	and    $0xf8,%al
 805466c:	29 c2                	sub    %eax,%edx
 805466e:	b8 01 00 00 00       	mov    $0x1,%eax
 8054673:	89 d1                	mov    %edx,%ecx
 8054675:	d3 e0                	shl    %cl,%eax
 8054677:	89 f1                	mov    %esi,%ecx
 8054679:	08 c1                	or     %al,%cl
 805467b:	88 0b                	mov    %cl,(%ebx)
 805467d:	47                   	inc    %edi
 805467e:	3b 7d fc             	cmp    0xfffffffc(%ebp),%edi
 8054681:	76 81                	jbe    0x8054604
 8054683:	31 c0                	xor    %eax,%eax
 8054685:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 8054688:	5b                   	pop    %ebx
 8054689:	5e                   	pop    %esi
 805468a:	5f                   	pop    %edi
 805468b:	89 ec                	mov    %ebp,%esp
 805468d:	5d                   	pop    %ebp
 805468e:	c3                   	ret    
 805468f:	90                   	nop    
 8054690:	55                   	push   %ebp
 8054691:	89 e5                	mov    %esp,%ebp
 8054693:	83 ec 20             	sub    $0x20,%esp
 8054696:	57                   	push   %edi
 8054697:	56                   	push   %esi
 8054698:	53                   	push   %ebx
 8054699:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805469c:	8b 7d 08             	mov    0x8(%ebp),%edi
 805469f:	c6 45 e8 01          	movb   $0x1,0xffffffe8(%ebp)
 80546a3:	c6 45 e7 00          	movb   $0x0,0xffffffe7(%ebp)
 80546a7:	8b 49 10             	mov    0x10(%ecx),%ecx
 80546aa:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 80546ad:	8b 37                	mov    (%edi),%esi
 80546af:	89 75 ec             	mov    %esi,0xffffffec(%ebp)
 80546b2:	8b 4f 08             	mov    0x8(%edi),%ecx
 80546b5:	01 4d ec             	add    %ecx,0xffffffec(%ebp)
 80546b8:	83 c4 ec             	add    $0xffffffec,%esp
 80546bb:	89 65 f4             	mov    %esp,0xfffffff4(%ebp)
 80546be:	c7 45 f8 05 00 00 00 	movl   $0x5,0xfffffff8(%ebp)
 80546c5:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 80546cc:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 80546cf:	89 d7                	mov    %edx,%edi
 80546d1:	31 c0                	xor    %eax,%eax
 80546d3:	fc                   	cld    
 80546d4:	b9 40 00 00 00       	mov    $0x40,%ecx
 80546d9:	f3 ab                	repz stos %eax,%es:(%edi)
 80546db:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80546de:	8a 41 1c             	mov    0x1c(%ecx),%al
 80546e1:	0c 08                	or     $0x8,%al
 80546e3:	24 fe                	and    $0xfe,%al
 80546e5:	88 41 1c             	mov    %al,0x1c(%ecx)
 80546e8:	3b 75 ec             	cmp    0xffffffec(%ebp),%esi
 80546eb:	74 05                	je     0x80546f2
 80546ed:	80 3e 01             	cmpb   $0x1,(%esi)
 80546f0:	75 3e                	jne    0x8054730
 80546f2:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80546f5:	8b 7d 08             	mov    0x8(%ebp),%edi
 80546f8:	31 c0                	xor    %eax,%eax
 80546fa:	8a 47 1c             	mov    0x1c(%edi),%al
 80546fd:	85 db                	test   %ebx,%ebx
 80546ff:	0f 84 fb 02 00 00    	je     0x8054a00
 8054705:	8a 4d e8             	mov    0xffffffe8(%ebp),%cl
 8054708:	09 c8                	or     %ecx,%eax
 805470a:	24 01                	and    $0x1,%al
 805470c:	8a 57 1c             	mov    0x1c(%edi),%dl
 805470f:	80 e2 fe             	and    $0xfe,%dl
 8054712:	08 c2                	or     %al,%dl
 8054714:	88 57 1c             	mov    %dl,0x1c(%edi)
 8054717:	c6 45 e8 01          	movb   $0x1,0xffffffe8(%ebp)
 805471b:	8d 7b ff             	lea    0xffffffff(%ebx),%edi
 805471e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054721:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 8054724:	8b 74 98 fc          	mov    0xfffffffc(%eax,%ebx,4),%esi
 8054728:	eb be                	jmp    0x80546e8
 805472a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8054730:	31 c0                	xor    %eax,%eax
 8054732:	8a 06                	mov    (%esi),%al
 8054734:	46                   	inc    %esi
 8054735:	83 f8 1d             	cmp    $0x1d,%eax
 8054738:	0f 87 aa 02 00 00    	ja     0x80549e8
 805473e:	ff 24 85 f0 99 05 08 	jmp    *0x80599f0(,%eax,4)
 8054745:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054748:	80 49 1c 01          	orb    $0x1,0x1c(%ecx)
 805474c:	e9 c6 02 00 00       	jmp    0x8054a17
 8054751:	31 c0                	xor    %eax,%eax
 8054753:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8054756:	8a 46 01             	mov    0x1(%esi),%al
 8054759:	c6 04 38 01          	movb   $0x1,(%eax,%edi,1)
 805475d:	e9 8e 02 00 00       	jmp    0x80549f0
 8054762:	31 c0                	xor    %eax,%eax
 8054764:	8a 06                	mov    (%esi),%al
 8054766:	8d 1c c5 ff ff ff ff 	lea    0xffffffff(,%eax,8),%ebx
 805476d:	46                   	inc    %esi
 805476e:	85 db                	test   %ebx,%ebx
 8054770:	0f 8c 7a 02 00 00    	jl     0x80549f0
 8054776:	89 d8                	mov    %ebx,%eax
 8054778:	85 db                	test   %ebx,%ebx
 805477a:	7d 03                	jge    0x805477f
 805477c:	8d 43 07             	lea    0x7(%ebx),%eax
 805477f:	c1 f8 03             	sar    $0x3,%eax
 8054782:	31 c9                	xor    %ecx,%ecx
 8054784:	89 da                	mov    %ebx,%edx
 8054786:	8a 0c 30             	mov    (%eax,%esi,1),%cl
 8054789:	c1 e0 03             	shl    $0x3,%eax
 805478c:	29 c2                	sub    %eax,%edx
 805478e:	0f a3 d1             	bt     %edx,%ecx
 8054791:	73 07                	jae    0x805479a
 8054793:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8054796:	c6 04 0b 01          	movb   $0x1,(%ebx,%ecx,1)
 805479a:	4b                   	dec    %ebx
 805479b:	79 d9                	jns    0x8054776
 805479d:	e9 4e 02 00 00       	jmp    0x80549f0
 80547a2:	31 c0                	xor    %eax,%eax
 80547a4:	8a 06                	mov    (%esi),%al
 80547a6:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
 80547ad:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 80547b3:	7f 10                	jg     0x80547c5
 80547b5:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 80547b8:	c6 04 3b 01          	movb   $0x1,(%ebx,%edi,1)
 80547bc:	43                   	inc    %ebx
 80547bd:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 80547c3:	7e f0                	jle    0x80547b5
 80547c5:	31 c0                	xor    %eax,%eax
 80547c7:	8a 06                	mov    (%esi),%al
 80547c9:	8d 1c c5 ff ff ff ff 	lea    0xffffffff(,%eax,8),%ebx
 80547d0:	46                   	inc    %esi
 80547d1:	85 db                	test   %ebx,%ebx
 80547d3:	0f 8c 17 02 00 00    	jl     0x80549f0
 80547d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80547e0:	89 d8                	mov    %ebx,%eax
 80547e2:	85 db                	test   %ebx,%ebx
 80547e4:	7d 03                	jge    0x80547e9
 80547e6:	8d 43 07             	lea    0x7(%ebx),%eax
 80547e9:	c1 f8 03             	sar    $0x3,%eax
 80547ec:	31 c9                	xor    %ecx,%ecx
 80547ee:	89 da                	mov    %ebx,%edx
 80547f0:	8a 0c 30             	mov    (%eax,%esi,1),%cl
 80547f3:	c1 e0 03             	shl    $0x3,%eax
 80547f6:	29 c2                	sub    %eax,%edx
 80547f8:	0f a3 d1             	bt     %edx,%ecx
 80547fb:	72 07                	jb     0x8054804
 80547fd:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8054800:	c6 04 0b 01          	movb   $0x1,(%ebx,%ecx,1)
 8054804:	4b                   	dec    %ebx
 8054805:	79 d9                	jns    0x80547e0
 8054807:	e9 e4 01 00 00       	jmp    0x80549f0
 805480c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054810:	31 db                	xor    %ebx,%ebx
 8054812:	ba 60 bb 05 08       	mov    $0x805bb60,%edx
 8054817:	89 d8                	mov    %ebx,%eax
 8054819:	25 ff 00 00 00       	and    $0xff,%eax
 805481e:	80 3c 10 01          	cmpb   $0x1,(%eax,%edx,1)
 8054822:	75 07                	jne    0x805482b
 8054824:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8054827:	c6 04 3b 01          	movb   $0x1,(%ebx,%edi,1)
 805482b:	43                   	inc    %ebx
 805482c:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 8054832:	7e e3                	jle    0x8054817
 8054834:	e9 b7 01 00 00       	jmp    0x80549f0
 8054839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054840:	31 db                	xor    %ebx,%ebx
 8054842:	ba 60 bb 05 08       	mov    $0x805bb60,%edx
 8054847:	89 d8                	mov    %ebx,%eax
 8054849:	25 ff 00 00 00       	and    $0xff,%eax
 805484e:	80 3c 10 01          	cmpb   $0x1,(%eax,%edx,1)
 8054852:	74 07                	je     0x805485b
 8054854:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8054857:	c6 04 0b 01          	movb   $0x1,(%ebx,%ecx,1)
 805485b:	43                   	inc    %ebx
 805485c:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 8054862:	7e e3                	jle    0x8054847
 8054864:	e9 87 01 00 00       	jmp    0x80549f0
 8054869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054870:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8054873:	31 db                	xor    %ebx,%ebx
 8054875:	0f be 47 0a          	movsbl 0xa(%edi),%eax
 8054879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054880:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8054883:	c6 04 0b 01          	movb   $0x1,(%ebx,%ecx,1)
 8054887:	43                   	inc    %ebx
 8054888:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
 805488e:	7e f0                	jle    0x8054880
 8054890:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054893:	f6 47 0c 40          	testb  $0x40,0xc(%edi)
 8054897:	75 08                	jne    0x80548a1
 8054899:	88 41 0a             	mov    %al,0xa(%ecx)
 805489c:	e9 4f 01 00 00       	jmp    0x80549f0
 80548a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80548a4:	f6 41 1c 01          	testb  $0x1,0x1c(%ecx)
 80548a8:	0f 85 69 01 00 00    	jne    0x8054a17
 80548ae:	e9 3d 01 00 00       	jmp    0x80549f0
 80548b3:	31 db                	xor    %ebx,%ebx
 80548b5:	8a 1e                	mov    (%esi),%bl
 80548b7:	0f be 46 01          	movsbl 0x1(%esi),%eax
 80548bb:	c1 e0 08             	shl    $0x8,%eax
 80548be:	01 c3                	add    %eax,%ebx
 80548c0:	8d 74 33 02          	lea    0x2(%ebx,%esi,1),%esi
 80548c4:	85 db                	test   %ebx,%ebx
 80548c6:	0f 8f 1c fe ff ff    	jg     0x80546e8
 80548cc:	8a 06                	mov    (%esi),%al
 80548ce:	3c 0f                	cmp    $0xf,%al
 80548d0:	74 0e                	je     0x80548e0
 80548d2:	3c 15                	cmp    $0x15,%al
 80548d4:	0f 85 0e fe ff ff    	jne    0x80546e8
 80548da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80548e0:	46                   	inc    %esi
 80548e1:	31 db                	xor    %ebx,%ebx
 80548e3:	8a 1e                	mov    (%esi),%bl
 80548e5:	0f be 46 01          	movsbl 0x1(%esi),%eax
 80548e9:	c1 e0 08             	shl    $0x8,%eax
 80548ec:	01 c3                	add    %eax,%ebx
 80548ee:	8d 74 33 02          	lea    0x2(%ebx,%esi,1),%esi
 80548f2:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80548f5:	85 d2                	test   %edx,%edx
 80548f7:	0f 84 eb fd ff ff    	je     0x80546e8
 80548fd:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054900:	39 74 90 fc          	cmp    %esi,0xfffffffc(%eax,%edx,4)
 8054904:	0f 85 de fd ff ff    	jne    0x80546e8
 805490a:	4a                   	dec    %edx
 805490b:	89 55 fc             	mov    %edx,0xfffffffc(%ebp)
 805490e:	e9 d5 fd ff ff       	jmp    0x80546e8
 8054913:	31 db                	xor    %ebx,%ebx
 8054915:	8a 1e                	mov    (%esi),%bl
 8054917:	0f be 46 01          	movsbl 0x1(%esi),%eax
 805491b:	c1 e0 08             	shl    $0x8,%eax
 805491e:	01 c3                	add    %eax,%ebx
 8054920:	83 c6 02             	add    $0x2,%esi
 8054923:	01 f3                	add    %esi,%ebx
 8054925:	89 5d e0             	mov    %ebx,0xffffffe0(%ebp)
 8054928:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805492b:	39 fb                	cmp    %edi,%ebx
 805492d:	73 61                	jae    0x8054990
 805492f:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8054932:	3b 5d f8             	cmp    0xfffffff8(%ebp),%ebx
 8054935:	75 3d                	jne    0x8054974
 8054937:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 805493c:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 805493f:	8d 14 50             	lea    (%eax,%edx,2),%edx
 8054942:	39 d3                	cmp    %edx,%ebx
 8054944:	77 3c                	ja     0x8054982
 8054946:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 805494d:	29 c4                	sub    %eax,%esp
 805494f:	89 e1                	mov    %esp,%ecx
 8054951:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8054954:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 805495b:	50                   	push   %eax
 805495c:	52                   	push   %edx
 805495d:	51                   	push   %ecx
 805495e:	e8 b9 47 ff ff       	call   0x804911c
 8054963:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 8054966:	83 c4 0c             	add    $0xc,%esp
 8054969:	85 c0                	test   %eax,%eax
 805496b:	74 15                	je     0x8054982
 805496d:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 8054971:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8054974:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8054977:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 805497a:	89 0c 98             	mov    %ecx,(%eax,%ebx,4)
 805497d:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8054980:	eb 15                	jmp    0x8054997
 8054982:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 8054987:	e9 8d 00 00 00       	jmp    0x8054a19
 805498c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054990:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054993:	80 4f 1c 01          	orb    $0x1,0x1c(%edi)
 8054997:	80 7d e7 00          	cmpb   $0x0,0xffffffe7(%ebp)
 805499b:	0f 84 47 fd ff ff    	je     0x80546e8
 80549a1:	83 c6 02             	add    $0x2,%esi
 80549a4:	c6 45 e7 00          	movb   $0x0,0xffffffe7(%ebp)
 80549a8:	e9 3b fd ff ff       	jmp    0x80546e8
 80549ad:	8d 76 00             	lea    0x0(%esi),%esi
 80549b0:	83 c6 02             	add    $0x2,%esi
 80549b3:	31 d2                	xor    %edx,%edx
 80549b5:	8a 16                	mov    (%esi),%dl
 80549b7:	0f be 46 01          	movsbl 0x1(%esi),%eax
 80549bb:	c1 e0 08             	shl    $0x8,%eax
 80549be:	01 c2                	add    %eax,%edx
 80549c0:	83 c6 02             	add    $0x2,%esi
 80549c3:	85 d2                	test   %edx,%edx
 80549c5:	0f 85 1d fd ff ff    	jne    0x80546e8
 80549cb:	83 c6 fc             	add    $0xfffffffc,%esi
 80549ce:	c6 45 e7 01          	movb   $0x1,0xffffffe7(%ebp)
 80549d2:	e9 3c ff ff ff       	jmp    0x8054913
 80549d7:	83 c6 04             	add    $0x4,%esi
 80549da:	e9 09 fd ff ff       	jmp    0x80546e8
 80549df:	90                   	nop    
 80549e0:	83 c6 02             	add    $0x2,%esi
 80549e3:	e9 00 fd ff ff       	jmp    0x80546e8
 80549e8:	e8 5f 46 ff ff       	call   0x804904c
 80549ed:	8d 76 00             	lea    0x0(%esi),%esi
 80549f0:	c6 45 e8 00          	movb   $0x0,0xffffffe8(%ebp)
 80549f4:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
 80549f7:	e9 ec fc ff ff       	jmp    0x80546e8
 80549fc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054a00:	8a 4d e8             	mov    0xffffffe8(%ebp),%cl
 8054a03:	09 c8                	or     %ecx,%eax
 8054a05:	88 c2                	mov    %al,%dl
 8054a07:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054a0a:	80 e2 01             	and    $0x1,%dl
 8054a0d:	8a 47 1c             	mov    0x1c(%edi),%al
 8054a10:	24 fe                	and    $0xfe,%al
 8054a12:	08 d0                	or     %dl,%al
 8054a14:	88 47 1c             	mov    %al,0x1c(%edi)
 8054a17:	31 c0                	xor    %eax,%eax
 8054a19:	8d 65 d4             	lea    0xffffffd4(%ebp),%esp
 8054a1c:	5b                   	pop    %ebx
 8054a1d:	5e                   	pop    %esi
 8054a1e:	5f                   	pop    %edi
 8054a1f:	89 ec                	mov    %ebp,%esp
 8054a21:	5d                   	pop    %ebp
 8054a22:	c3                   	ret    
 8054a23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8054a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8054a30:	55                   	push   %ebp
 8054a31:	89 e5                	mov    %esp,%ebp
 8054a33:	53                   	push   %ebx
 8054a34:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054a37:	8b 55 0c             	mov    0xc(%ebp),%edx
 8054a3a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8054a3d:	85 db                	test   %ebx,%ebx
 8054a3f:	74 1f                	je     0x8054a60
 8054a41:	8a 41 1c             	mov    0x1c(%ecx),%al
 8054a44:	24 f9                	and    $0xf9,%al
 8054a46:	0c 02                	or     $0x2,%al
 8054a48:	88 41 1c             	mov    %al,0x1c(%ecx)
 8054a4b:	89 1a                	mov    %ebx,(%edx)
 8054a4d:	8b 45 14             	mov    0x14(%ebp),%eax
 8054a50:	89 42 04             	mov    %eax,0x4(%edx)
 8054a53:	8b 45 18             	mov    0x18(%ebp),%eax
 8054a56:	89 42 08             	mov    %eax,0x8(%edx)
 8054a59:	eb 1d                	jmp    0x8054a78
 8054a5b:	90                   	nop    
 8054a5c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054a60:	80 61 1c f9          	andb   $0xf9,0x1c(%ecx)
 8054a64:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
 8054a6a:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8054a71:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
 8054a78:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8054a7b:	89 ec                	mov    %ebp,%esp
 8054a7d:	5d                   	pop    %ebp
 8054a7e:	c3                   	ret    
 8054a7f:	90                   	nop    
 8054a80:	55                   	push   %ebp
 8054a81:	89 e5                	mov    %esp,%ebp
 8054a83:	57                   	push   %edi
 8054a84:	56                   	push   %esi
 8054a85:	53                   	push   %ebx
 8054a86:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054a89:	8b 75 0c             	mov    0xc(%ebp),%esi
 8054a8c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054a8f:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054a92:	8b 55 18             	mov    0x18(%ebp),%edx
 8054a95:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8054a98:	51                   	push   %ecx
 8054a99:	50                   	push   %eax
 8054a9a:	52                   	push   %edx
 8054a9b:	53                   	push   %ebx
 8054a9c:	51                   	push   %ecx
 8054a9d:	56                   	push   %esi
 8054a9e:	6a 00                	push   $0x0
 8054aa0:	6a 00                	push   $0x0
 8054aa2:	57                   	push   %edi
 8054aa3:	e8 18 00 00 00       	call   0x8054ac0
 8054aa8:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8054aab:	5b                   	pop    %ebx
 8054aac:	5e                   	pop    %esi
 8054aad:	5f                   	pop    %edi
 8054aae:	89 ec                	mov    %ebp,%esp
 8054ab0:	5d                   	pop    %ebp
 8054ab1:	c3                   	ret    
 8054ab2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8054ac0:	55                   	push   %ebp
 8054ac1:	89 e5                	mov    %esp,%ebp
 8054ac3:	83 ec 10             	sub    $0x10,%esp
 8054ac6:	57                   	push   %edi
 8054ac7:	56                   	push   %esi
 8054ac8:	53                   	push   %ebx
 8054ac9:	8b 75 1c             	mov    0x1c(%ebp),%esi
 8054acc:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8054acf:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054ad2:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 8054ad5:	8b 79 10             	mov    0x10(%ecx),%edi
 8054ad8:	8b 49 14             	mov    0x14(%ecx),%ecx
 8054adb:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 8054ade:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054ae1:	03 4d 18             	add    0x18(%ebp),%ecx
 8054ae4:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 8054ae7:	85 f6                	test   %esi,%esi
 8054ae9:	0f 8c a3 01 00 00    	jl     0x8054c92
 8054aef:	39 ce                	cmp    %ecx,%esi
 8054af1:	0f 8f 9b 01 00 00    	jg     0x8054c92
 8054af7:	85 c0                	test   %eax,%eax
 8054af9:	7d 06                	jge    0x8054b01
 8054afb:	89 f3                	mov    %esi,%ebx
 8054afd:	f7 db                	neg    %ebx
 8054aff:	eb 0a                	jmp    0x8054b0b
 8054b01:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
 8054b04:	7e 05                	jle    0x8054b0b
 8054b06:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 8054b09:	29 f3                	sub    %esi,%ebx
 8054b0b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054b0e:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 8054b12:	74 23                	je     0x8054b37
 8054b14:	85 db                	test   %ebx,%ebx
 8054b16:	7e 1f                	jle    0x8054b37
 8054b18:	8b 01                	mov    (%ecx),%eax
 8054b1a:	8a 00                	mov    (%eax),%al
 8054b1c:	3c 0b                	cmp    $0xb,%al
 8054b1e:	74 0a                	je     0x8054b2a
 8054b20:	3c 09                	cmp    $0x9,%al
 8054b22:	75 13                	jne    0x8054b37
 8054b24:	f6 41 1c 80          	testb  $0x80,0x1c(%ecx)
 8054b28:	75 0d                	jne    0x8054b37
 8054b2a:	85 f6                	test   %esi,%esi
 8054b2c:	0f 8f 60 01 00 00    	jg     0x8054c92
 8054b32:	bb 01 00 00 00       	mov    $0x1,%ebx
 8054b37:	85 ff                	test   %edi,%edi
 8054b39:	74 2f                	je     0x8054b6a
 8054b3b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054b3e:	f6 41 1c 08          	testb  $0x8,0x1c(%ecx)
 8054b42:	75 26                	jne    0x8054b6a
 8054b44:	51                   	push   %ecx
 8054b45:	e8 46 fb ff ff       	call   0x8054690
 8054b4a:	83 c4 04             	add    $0x4,%esp
 8054b4d:	83 f8 fe             	cmp    $0xfffffffe,%eax
 8054b50:	75 18                	jne    0x8054b6a
 8054b52:	e9 40 01 00 00       	jmp    0x8054c97
 8054b57:	89 f0                	mov    %esi,%eax
 8054b59:	e9 39 01 00 00       	jmp    0x8054c97
 8054b5e:	89 f6                	mov    %esi,%esi
 8054b60:	85 db                	test   %ebx,%ebx
 8054b62:	7e 04                	jle    0x8054b68
 8054b64:	4b                   	dec    %ebx
 8054b65:	46                   	inc    %esi
 8054b66:	eb 02                	jmp    0x8054b6a
 8054b68:	43                   	inc    %ebx
 8054b69:	4e                   	dec    %esi
 8054b6a:	85 ff                	test   %edi,%edi
 8054b6c:	0f 84 d0 00 00 00    	je     0x8054c42
 8054b72:	3b 75 f8             	cmp    0xfffffff8(%ebp),%esi
 8054b75:	0f 8d c7 00 00 00    	jge    0x8054c42
 8054b7b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054b7e:	f6 41 1c 01          	testb  $0x1,0x1c(%ecx)
 8054b82:	0f 85 ba 00 00 00    	jne    0x8054c42
 8054b88:	85 db                	test   %ebx,%ebx
 8054b8a:	7e 74                	jle    0x8054c00
 8054b8c:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 8054b93:	89 5d f4             	mov    %ebx,0xfffffff4(%ebp)
 8054b96:	3b 75 10             	cmp    0x10(%ebp),%esi
 8054b99:	7c 0b                	jl     0x8054ba6
 8054b9b:	8b 45 14             	mov    0x14(%ebp),%eax
 8054b9e:	2b 45 10             	sub    0x10(%ebp),%eax
 8054ba1:	8d 14 06             	lea    (%esi,%eax,1),%edx
 8054ba4:	eb 18                	jmp    0x8054bbe
 8054ba6:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 8054ba9:	3b 45 10             	cmp    0x10(%ebp),%eax
 8054bac:	7c 0b                	jl     0x8054bb9
 8054bae:	8b 45 10             	mov    0x10(%ebp),%eax
 8054bb1:	29 f0                	sub    %esi,%eax
 8054bb3:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 8054bb6:	29 45 f0             	sub    %eax,0xfffffff0(%ebp)
 8054bb9:	8b 55 0c             	mov    0xc(%ebp),%edx
 8054bbc:	01 f2                	add    %esi,%edx
 8054bbe:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8054bc2:	74 1f                	je     0x8054be3
 8054bc4:	3b 5d f0             	cmp    0xfffffff0(%ebp),%ebx
 8054bc7:	7e 2a                	jle    0x8054bf3
 8054bc9:	31 c0                	xor    %eax,%eax
 8054bcb:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8054bce:	8a 02                	mov    (%edx),%al
 8054bd0:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8054bd3:	25 ff 00 00 00       	and    $0xff,%eax
 8054bd8:	42                   	inc    %edx
 8054bd9:	80 3c 38 00          	cmpb   $0x0,(%eax,%edi,1)
 8054bdd:	75 14                	jne    0x8054bf3
 8054bdf:	4b                   	dec    %ebx
 8054be0:	eb e2                	jmp    0x8054bc4
 8054be2:	4b                   	dec    %ebx
 8054be3:	3b 5d f0             	cmp    0xfffffff0(%ebp),%ebx
 8054be6:	7e 0b                	jle    0x8054bf3
 8054be8:	31 c0                	xor    %eax,%eax
 8054bea:	8a 02                	mov    (%edx),%al
 8054bec:	42                   	inc    %edx
 8054bed:	80 3c 38 00          	cmpb   $0x0,(%eax,%edi,1)
 8054bf1:	74 ef                	je     0x8054be2
 8054bf3:	29 5d f4             	sub    %ebx,0xfffffff4(%ebp)
 8054bf6:	03 75 f4             	add    0xfffffff4(%ebp),%esi
 8054bf9:	eb 47                	jmp    0x8054c42
 8054bfb:	90                   	nop    
 8054bfc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054c00:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054c04:	74 05                	je     0x8054c0b
 8054c06:	3b 75 10             	cmp    0x10(%ebp),%esi
 8054c09:	7c 0d                	jl     0x8054c18
 8054c0b:	89 f0                	mov    %esi,%eax
 8054c0d:	2b 45 10             	sub    0x10(%ebp),%eax
 8054c10:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054c13:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8054c16:	eb 06                	jmp    0x8054c1e
 8054c18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8054c1b:	8a 04 0e             	mov    (%esi,%ecx,1),%al
 8054c1e:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8054c22:	74 12                	je     0x8054c36
 8054c24:	25 ff 00 00 00       	and    $0xff,%eax
 8054c29:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8054c2c:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8054c2f:	25 ff 00 00 00       	and    $0xff,%eax
 8054c34:	eb 05                	jmp    0x8054c3b
 8054c36:	25 ff 00 00 00       	and    $0xff,%eax
 8054c3b:	01 f8                	add    %edi,%eax
 8054c3d:	80 38 00             	cmpb   $0x0,(%eax)
 8054c40:	74 48                	je     0x8054c8a
 8054c42:	85 db                	test   %ebx,%ebx
 8054c44:	7c 12                	jl     0x8054c58
 8054c46:	3b 75 f8             	cmp    0xfffffff8(%ebp),%esi
 8054c49:	75 0d                	jne    0x8054c58
 8054c4b:	85 ff                	test   %edi,%edi
 8054c4d:	74 09                	je     0x8054c58
 8054c4f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054c52:	f6 41 1c 01          	testb  $0x1,0x1c(%ecx)
 8054c56:	74 3a                	je     0x8054c92
 8054c58:	8b 4d 28             	mov    0x28(%ebp),%ecx
 8054c5b:	51                   	push   %ecx
 8054c5c:	8b 4d 24             	mov    0x24(%ebp),%ecx
 8054c5f:	51                   	push   %ecx
 8054c60:	56                   	push   %esi
 8054c61:	8b 4d 18             	mov    0x18(%ebp),%ecx
 8054c64:	51                   	push   %ecx
 8054c65:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054c68:	51                   	push   %ecx
 8054c69:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8054c6c:	51                   	push   %ecx
 8054c6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8054c70:	51                   	push   %ecx
 8054c71:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8054c74:	51                   	push   %ecx
 8054c75:	e8 a6 00 00 00       	call   0x8054d20
 8054c7a:	83 c4 20             	add    $0x20,%esp
 8054c7d:	85 c0                	test   %eax,%eax
 8054c7f:	0f 8d d2 fe ff ff    	jge    0x8054b57
 8054c85:	83 f8 fe             	cmp    $0xfffffffe,%eax
 8054c88:	74 0d                	je     0x8054c97
 8054c8a:	85 db                	test   %ebx,%ebx
 8054c8c:	0f 85 ce fe ff ff    	jne    0x8054b60
 8054c92:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8054c97:	8d 65 e4             	lea    0xffffffe4(%ebp),%esp
 8054c9a:	5b                   	pop    %ebx
 8054c9b:	5e                   	pop    %esi
 8054c9c:	5f                   	pop    %edi
 8054c9d:	89 ec                	mov    %ebp,%esp
 8054c9f:	5d                   	pop    %ebp
 8054ca0:	c3                   	ret    
 8054ca1:	eb 0d                	jmp    0x8054cb0
 8054ca3:	90                   	nop    
 8054ca4:	90                   	nop    
 8054ca5:	90                   	nop    
 8054ca6:	90                   	nop    
 8054ca7:	90                   	nop    
 8054ca8:	90                   	nop    
 8054ca9:	90                   	nop    
 8054caa:	90                   	nop    
 8054cab:	90                   	nop    
 8054cac:	90                   	nop    
 8054cad:	90                   	nop    
 8054cae:	90                   	nop    
 8054caf:	90                   	nop    
 8054cb0:	55                   	push   %ebp
 8054cb1:	89 e5                	mov    %esp,%ebp
 8054cb3:	56                   	push   %esi
 8054cb4:	53                   	push   %ebx
 8054cb5:	8b 75 08             	mov    0x8(%ebp),%esi
 8054cb8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054cbb:	8b 55 10             	mov    0x10(%ebp),%edx
 8054cbe:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8054cc1:	8b 45 18             	mov    0x18(%ebp),%eax
 8054cc4:	52                   	push   %edx
 8054cc5:	50                   	push   %eax
 8054cc6:	51                   	push   %ecx
 8054cc7:	52                   	push   %edx
 8054cc8:	53                   	push   %ebx
 8054cc9:	6a 00                	push   $0x0
 8054ccb:	6a 00                	push   $0x0
 8054ccd:	56                   	push   %esi
 8054cce:	e8 4d 00 00 00       	call   0x8054d20
 8054cd3:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8054cd6:	5b                   	pop    %ebx
 8054cd7:	5e                   	pop    %esi
 8054cd8:	89 ec                	mov    %ebp,%esp
 8054cda:	5d                   	pop    %ebp
 8054cdb:	c3                   	ret    
 8054cdc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054ce0:	55                   	push   %ebp
 8054ce1:	89 e5                	mov    %esp,%ebp
 8054ce3:	57                   	push   %edi
 8054ce4:	56                   	push   %esi
 8054ce5:	53                   	push   %ebx
 8054ce6:	8b 7d 10             	mov    0x10(%ebp),%edi
 8054ce9:	8b 75 14             	mov    0x14(%ebp),%esi
 8054cec:	8b 5d 18             	mov    0x18(%ebp),%ebx
 8054cef:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
 8054cf2:	8b 45 24             	mov    0x24(%ebp),%eax
 8054cf5:	50                   	push   %eax
 8054cf6:	8b 55 20             	mov    0x20(%ebp),%edx
 8054cf9:	52                   	push   %edx
 8054cfa:	51                   	push   %ecx
 8054cfb:	53                   	push   %ebx
 8054cfc:	56                   	push   %esi
 8054cfd:	57                   	push   %edi
 8054cfe:	8b 55 0c             	mov    0xc(%ebp),%edx
 8054d01:	52                   	push   %edx
 8054d02:	8b 55 08             	mov    0x8(%ebp),%edx
 8054d05:	52                   	push   %edx
 8054d06:	e8 15 00 00 00       	call   0x8054d20
 8054d0b:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8054d0e:	5b                   	pop    %ebx
 8054d0f:	5e                   	pop    %esi
 8054d10:	5f                   	pop    %edi
 8054d11:	89 ec                	mov    %ebp,%esp
 8054d13:	5d                   	pop    %ebp
 8054d14:	c3                   	ret    
 8054d15:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8054d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8054d20:	55                   	push   %ebp
 8054d21:	89 e5                	mov    %esp,%ebp
 8054d23:	81 ec a4 00 00 00    	sub    $0xa4,%esp
 8054d29:	57                   	push   %edi
 8054d2a:	56                   	push   %esi
 8054d2b:	53                   	push   %ebx
 8054d2c:	8b 4d 24             	mov    0x24(%ebp),%ecx
 8054d2f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8054d32:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054d35:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
 8054d3c:	c7 45 c0 01 01 00 00 	movl   $0x101,0xffffffc0(%ebp)
 8054d43:	c7 45 bc 00 01 00 00 	movl   $0x100,0xffffffbc(%ebp)
 8054d4a:	c7 45 a4 00 00 00 00 	movl   $0x0,0xffffffa4(%ebp)
 8054d51:	c7 45 98 00 00 00 00 	movl   $0x0,0xffffff98(%ebp)
 8054d58:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
 8054d5f:	8b 1b                	mov    (%ebx),%ebx
 8054d61:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8054d64:	89 5d d0             	mov    %ebx,0xffffffd0(%ebp)
 8054d67:	8b 7f 08             	mov    0x8(%edi),%edi
 8054d6a:	01 7d d0             	add    %edi,0xffffffd0(%ebp)
 8054d6d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8054d70:	8b 7d 08             	mov    0x8(%ebp),%edi
 8054d73:	8b 5b 14             	mov    0x14(%ebx),%ebx
 8054d76:	89 5d c8             	mov    %ebx,0xffffffc8(%ebp)
 8054d79:	8b 47 18             	mov    0x18(%edi),%eax
 8054d7c:	8d 58 01             	lea    0x1(%eax),%ebx
 8054d7f:	89 5d c4             	mov    %ebx,0xffffffc4(%ebp)
 8054d82:	83 c4 ec             	add    $0xffffffec,%esp
 8054d85:	89 65 f4             	mov    %esp,0xfffffff4(%ebp)
 8054d88:	c7 45 f8 05 00 00 00 	movl   $0x5,0xfffffff8(%ebp)
 8054d8f:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 8054d96:	85 c0                	test   %eax,%eax
 8054d98:	0f 84 85 00 00 00    	je     0x8054e23
 8054d9e:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 8054da5:	29 c4                	sub    %eax,%esp
 8054da7:	89 65 b8             	mov    %esp,0xffffffb8(%ebp)
 8054daa:	29 c4                	sub    %eax,%esp
 8054dac:	89 65 b4             	mov    %esp,0xffffffb4(%ebp)
 8054daf:	29 c4                	sub    %eax,%esp
 8054db1:	89 65 b0             	mov    %esp,0xffffffb0(%ebp)
 8054db4:	29 c4                	sub    %eax,%esp
 8054db6:	89 65 ac             	mov    %esp,0xffffffac(%ebp)
 8054db9:	29 c4                	sub    %eax,%esp
 8054dbb:	89 65 a0             	mov    %esp,0xffffffa0(%ebp)
 8054dbe:	29 c4                	sub    %eax,%esp
 8054dc0:	89 65 9c             	mov    %esp,0xffffff9c(%ebp)
 8054dc3:	29 c4                	sub    %eax,%esp
 8054dc5:	89 65 a8             	mov    %esp,0xffffffa8(%ebp)
 8054dc8:	29 c4                	sub    %eax,%esp
 8054dca:	89 65 90             	mov    %esp,0xffffff90(%ebp)
 8054dcd:	29 c4                	sub    %eax,%esp
 8054dcf:	89 65 8c             	mov    %esp,0xffffff8c(%ebp)
 8054dd2:	83 7d b8 00          	cmpl   $0x0,0xffffffb8(%ebp)
 8054dd6:	0f 84 d4 14 00 00    	je     0x80562b0
 8054ddc:	83 7d b4 00          	cmpl   $0x0,0xffffffb4(%ebp)
 8054de0:	0f 84 ca 14 00 00    	je     0x80562b0
 8054de6:	83 7d b0 00          	cmpl   $0x0,0xffffffb0(%ebp)
 8054dea:	0f 84 c0 14 00 00    	je     0x80562b0
 8054df0:	83 7d ac 00          	cmpl   $0x0,0xffffffac(%ebp)
 8054df4:	0f 84 b6 14 00 00    	je     0x80562b0
 8054dfa:	83 7d a8 00          	cmpl   $0x0,0xffffffa8(%ebp)
 8054dfe:	0f 84 ac 14 00 00    	je     0x80562b0
 8054e04:	83 7d a0 00          	cmpl   $0x0,0xffffffa0(%ebp)
 8054e08:	0f 84 a2 14 00 00    	je     0x80562b0
 8054e0e:	83 7d 9c 00          	cmpl   $0x0,0xffffff9c(%ebp)
 8054e12:	0f 84 98 14 00 00    	je     0x80562b0
 8054e18:	83 7d 90 00          	cmpl   $0x0,0xffffff90(%ebp)
 8054e1c:	75 44                	jne    0x8054e62
 8054e1e:	e9 8d 14 00 00       	jmp    0x80562b0
 8054e23:	c7 45 90 00 00 00 00 	movl   $0x0,0xffffff90(%ebp)
 8054e2a:	c7 45 9c 00 00 00 00 	movl   $0x0,0xffffff9c(%ebp)
 8054e31:	c7 45 a0 00 00 00 00 	movl   $0x0,0xffffffa0(%ebp)
 8054e38:	c7 45 ac 00 00 00 00 	movl   $0x0,0xffffffac(%ebp)
 8054e3f:	c7 45 b0 00 00 00 00 	movl   $0x0,0xffffffb0(%ebp)
 8054e46:	c7 45 b4 00 00 00 00 	movl   $0x0,0xffffffb4(%ebp)
 8054e4d:	c7 45 b8 00 00 00 00 	movl   $0x0,0xffffffb8(%ebp)
 8054e54:	c7 45 8c 00 00 00 00 	movl   $0x0,0xffffff8c(%ebp)
 8054e5b:	c7 45 a8 00 00 00 00 	movl   $0x0,0xffffffa8(%ebp)
 8054e62:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
 8054e66:	0f 8c 04 1b 00 00    	jl     0x8056970
 8054e6c:	8b 45 10             	mov    0x10(%ebp),%eax
 8054e6f:	03 45 18             	add    0x18(%ebp),%eax
 8054e72:	39 45 1c             	cmp    %eax,0x1c(%ebp)
 8054e75:	0f 8f f5 1a 00 00    	jg     0x8056970
 8054e7b:	c7 85 60 ff ff ff 01 	movl   $0x1,0xffffff60(%ebp)
 8054e82:	00 00 00 
 8054e85:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 8054e88:	39 bd 60 ff ff ff    	cmp    %edi,0xffffff60(%ebp)
 8054e8e:	73 3e                	jae    0x8054ece
 8054e90:	ba 60 bc 05 08       	mov    $0x805bc60,%edx
 8054e95:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 8054e9b:	8b 7d ac             	mov    0xffffffac(%ebp),%edi
 8054e9e:	89 14 9f             	mov    %edx,(%edi,%ebx,4)
 8054ea1:	8b 7d b0             	mov    0xffffffb0(%ebp),%edi
 8054ea4:	89 14 9f             	mov    %edx,(%edi,%ebx,4)
 8054ea7:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8054eaa:	89 14 9f             	mov    %edx,(%edi,%ebx,4)
 8054ead:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 8054eb0:	89 14 9f             	mov    %edx,(%edi,%ebx,4)
 8054eb3:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8054eb6:	8a 04 9f             	mov    (%edi,%ebx,4),%al
 8054eb9:	0c 03                	or     $0x3,%al
 8054ebb:	24 e3                	and    $0xe3,%al
 8054ebd:	88 04 9f             	mov    %al,(%edi,%ebx,4)
 8054ec0:	43                   	inc    %ebx
 8054ec1:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8054ec7:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 8054eca:	39 fb                	cmp    %edi,%ebx
 8054ecc:	72 c7                	jb     0x8054e95
 8054ece:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8054ed2:	75 20                	jne    0x8054ef4
 8054ed4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8054ed8:	74 1a                	je     0x8054ef4
 8054eda:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054edd:	89 5d 14             	mov    %ebx,0x14(%ebp)
 8054ee0:	8b 7d 10             	mov    0x10(%ebp),%edi
 8054ee3:	89 7d 18             	mov    %edi,0x18(%ebp)
 8054ee6:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
 8054eed:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
 8054ef4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054ef7:	03 5d 10             	add    0x10(%ebp),%ebx
 8054efa:	89 5d ec             	mov    %ebx,0xffffffec(%ebp)
 8054efd:	8b 7d 14             	mov    0x14(%ebp),%edi
 8054f00:	03 7d 18             	add    0x18(%ebp),%edi
 8054f03:	89 7d e8             	mov    %edi,0xffffffe8(%ebp)
 8054f06:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 8054f09:	7f 15                	jg     0x8054f20
 8054f0b:	03 4d 0c             	add    0xc(%ebp),%ecx
 8054f0e:	89 4d e4             	mov    %ecx,0xffffffe4(%ebp)
 8054f11:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054f14:	89 5d e0             	mov    %ebx,0xffffffe0(%ebp)
 8054f17:	eb 18                	jmp    0x8054f31
 8054f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8054f20:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8054f23:	89 7d e4             	mov    %edi,0xffffffe4(%ebp)
 8054f26:	03 4d 14             	add    0x14(%ebp),%ecx
 8054f29:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8054f2c:	29 d9                	sub    %ebx,%ecx
 8054f2e:	89 4d e0             	mov    %ecx,0xffffffe0(%ebp)
 8054f31:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054f35:	7e 19                	jle    0x8054f50
 8054f37:	8b 7d 10             	mov    0x10(%ebp),%edi
 8054f3a:	39 7d 1c             	cmp    %edi,0x1c(%ebp)
 8054f3d:	7f 11                	jg     0x8054f50
 8054f3f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8054f42:	03 5d 1c             	add    0x1c(%ebp),%ebx
 8054f45:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8054f48:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 8054f4b:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 8054f4e:	eb 14                	jmp    0x8054f64
 8054f50:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8054f53:	03 5d 1c             	add    0x1c(%ebp),%ebx
 8054f56:	8b 7d 10             	mov    0x10(%ebp),%edi
 8054f59:	29 fb                	sub    %edi,%ebx
 8054f5b:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8054f5e:	8b 5d e0             	mov    0xffffffe0(%ebp),%ebx
 8054f61:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 8054f64:	8b 7d d0             	mov    0xffffffd0(%ebp),%edi
 8054f67:	39 7d d4             	cmp    %edi,0xffffffd4(%ebp)
 8054f6a:	0f 85 75 03 00 00    	jne    0x80552e5
 8054f70:	8b 5d e0             	mov    0xffffffe0(%ebp),%ebx
 8054f73:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8054f76:	0f 84 12 01 00 00    	je     0x805508e
 8054f7c:	31 d2                	xor    %edx,%edx
 8054f7e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8054f82:	74 0f                	je     0x8054f93
 8054f84:	8b 7d 98             	mov    0xffffff98(%ebp),%edi
 8054f87:	39 7d 0c             	cmp    %edi,0xc(%ebp)
 8054f8a:	77 07                	ja     0x8054f93
 8054f8c:	8b 5d ec             	mov    0xffffffec(%ebp),%ebx
 8054f8f:	39 df                	cmp    %ebx,%edi
 8054f91:	76 02                	jbe    0x8054f95
 8054f93:	b2 01                	mov    $0x1,%dl
 8054f95:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 8054f98:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 8054f9b:	0f 94 c0             	sete   %al
 8054f9e:	38 c2                	cmp    %al,%dl
 8054fa0:	74 0e                	je     0x8054fb0
 8054fa2:	8b 5d 98             	mov    0xffffff98(%ebp),%ebx
 8054fa5:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8054fa8:	0f 97 c0             	seta   %al
 8054fab:	eb 0c                	jmp    0x8054fb9
 8054fad:	8d 76 00             	lea    0x0(%esi),%esi
 8054fb0:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 8054fb3:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 8054fb6:	0f 95 c0             	setne  %al
 8054fb9:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8054fbd:	74 62                	je     0x8055021
 8054fbf:	83 7d a4 00          	cmpl   $0x0,0xffffffa4(%ebp)
 8054fc3:	74 08                	je     0x8054fcd
 8054fc5:	84 c0                	test   %al,%al
 8054fc7:	0f 84 68 18 00 00    	je     0x8056835
 8054fcd:	c7 45 a4 01 00 00 00 	movl   $0x1,0xffffffa4(%ebp)
 8054fd4:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8054fd7:	89 5d 98             	mov    %ebx,0xffffff98(%ebp)
 8054fda:	c7 85 60 ff ff ff 01 	movl   $0x1,0xffffff60(%ebp)
 8054fe1:	00 00 00 
 8054fe4:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 8054fe7:	39 7d a4             	cmp    %edi,0xffffffa4(%ebp)
 8054fea:	0f 83 45 18 00 00    	jae    0x8056835
 8054ff0:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 8054ff6:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 8054ff9:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 8054ffc:	8b 7d a0             	mov    0xffffffa0(%ebp),%edi
 8054fff:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
 8055002:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8055005:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 8055008:	8b 7d 9c             	mov    0xffffff9c(%ebp),%edi
 805500b:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
 805500e:	43                   	inc    %ebx
 805500f:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055015:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 8055018:	39 fb                	cmp    %edi,%ebx
 805501a:	72 d4                	jb     0x8054ff0
 805501c:	e9 14 18 00 00       	jmp    0x8056835
 8055021:	83 7d a4 00          	cmpl   $0x0,0xffffffa4(%ebp)
 8055025:	74 67                	je     0x805508e
 8055027:	84 c0                	test   %al,%al
 8055029:	75 63                	jne    0x805508e
 805502b:	8b 5d 98             	mov    0xffffff98(%ebp),%ebx
 805502e:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8055031:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8055034:	39 fb                	cmp    %edi,%ebx
 8055036:	72 0f                	jb     0x8055047
 8055038:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805503b:	39 fb                	cmp    %edi,%ebx
 805503d:	77 08                	ja     0x8055047
 805503f:	8b 5d e4             	mov    0xffffffe4(%ebp),%ebx
 8055042:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 8055045:	eb 06                	jmp    0x805504d
 8055047:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 805504a:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 805504d:	c7 85 60 ff ff ff 01 	movl   $0x1,0xffffff60(%ebp)
 8055054:	00 00 00 
 8055057:	8b 5d c4             	mov    0xffffffc4(%ebp),%ebx
 805505a:	39 9d 60 ff ff ff    	cmp    %ebx,0xffffff60(%ebp)
 8055060:	73 2c                	jae    0x805508e
 8055062:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055068:	8b 5d a0             	mov    0xffffffa0(%ebp),%ebx
 805506b:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 805506e:	8b 5d b8             	mov    0xffffffb8(%ebp),%ebx
 8055071:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
 8055074:	8b 5d 9c             	mov    0xffffff9c(%ebp),%ebx
 8055077:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 805507a:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 805507d:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
 8055080:	47                   	inc    %edi
 8055081:	89 bd 60 ff ff ff    	mov    %edi,0xffffff60(%ebp)
 8055087:	8b 5d c4             	mov    0xffffffc4(%ebp),%ebx
 805508a:	39 df                	cmp    %ebx,%edi
 805508c:	72 d4                	jb     0x8055062
 805508e:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
 8055092:	0f 84 20 02 00 00    	je     0x80552b8
 8055098:	8b 7d 08             	mov    0x8(%ebp),%edi
 805509b:	8a 47 1c             	mov    0x1c(%edi),%al
 805509e:	a8 10                	test   $0x10,%al
 80550a0:	0f 85 12 02 00 00    	jne    0x80552b8
 80550a6:	c0 e8 01             	shr    $0x1,%al
 80550a9:	83 e0 03             	and    $0x3,%eax
 80550ac:	75 66                	jne    0x8055114
 80550ae:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 80550b1:	40                   	inc    %eax
 80550b2:	83 f8 1d             	cmp    $0x1d,%eax
 80550b5:	76 09                	jbe    0x80550c0
 80550b7:	8b 5d 20             	mov    0x20(%ebp),%ebx
 80550ba:	89 03                	mov    %eax,(%ebx)
 80550bc:	eb 0b                	jmp    0x80550c9
 80550be:	89 f6                	mov    %esi,%esi
 80550c0:	8b 7d 20             	mov    0x20(%ebp),%edi
 80550c3:	c7 07 1e 00 00 00    	movl   $0x1e,(%edi)
 80550c9:	8b 5d 20             	mov    0x20(%ebp),%ebx
 80550cc:	8b 1b                	mov    (%ebx),%ebx
 80550ce:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 80550d5:	50                   	push   %eax
 80550d6:	e8 31 3f ff ff       	call   0x804900c
 80550db:	8b 7d 20             	mov    0x20(%ebp),%edi
 80550de:	89 47 04             	mov    %eax,0x4(%edi)
 80550e1:	8b 1f                	mov    (%edi),%ebx
 80550e3:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 80550ea:	50                   	push   %eax
 80550eb:	e8 1c 3f ff ff       	call   0x804900c
 80550f0:	89 47 08             	mov    %eax,0x8(%edi)
 80550f3:	83 7f 04 00          	cmpl   $0x0,0x4(%edi)
 80550f7:	0f 84 b3 11 00 00    	je     0x80562b0
 80550fd:	85 c0                	test   %eax,%eax
 80550ff:	0f 84 ab 11 00 00    	je     0x80562b0
 8055105:	8b 7d 08             	mov    0x8(%ebp),%edi
 8055108:	8a 47 1c             	mov    0x1c(%edi),%al
 805510b:	24 f9                	and    $0xf9,%al
 805510d:	0c 02                	or     $0x2,%al
 805510f:	88 47 1c             	mov    %al,0x1c(%edi)
 8055112:	eb 4c                	jmp    0x8055160
 8055114:	83 f8 01             	cmp    $0x1,%eax
 8055117:	75 47                	jne    0x8055160
 8055119:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 805511c:	8b 5d 20             	mov    0x20(%ebp),%ebx
 805511f:	40                   	inc    %eax
 8055120:	39 03                	cmp    %eax,(%ebx)
 8055122:	73 3c                	jae    0x8055160
 8055124:	89 03                	mov    %eax,(%ebx)
 8055126:	c1 e0 02             	shl    $0x2,%eax
 8055129:	50                   	push   %eax
 805512a:	8b 43 04             	mov    0x4(%ebx),%eax
 805512d:	50                   	push   %eax
 805512e:	e8 b9 3f ff ff       	call   0x80490ec
 8055133:	89 43 04             	mov    %eax,0x4(%ebx)
 8055136:	8b 3b                	mov    (%ebx),%edi
 8055138:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 805513f:	50                   	push   %eax
 8055140:	8b 43 08             	mov    0x8(%ebx),%eax
 8055143:	50                   	push   %eax
 8055144:	e8 a3 3f ff ff       	call   0x80490ec
 8055149:	89 43 08             	mov    %eax,0x8(%ebx)
 805514c:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
 8055150:	0f 84 5a 11 00 00    	je     0x80562b0
 8055156:	85 c0                	test   %eax,%eax
 8055158:	0f 84 52 11 00 00    	je     0x80562b0
 805515e:	89 f6                	mov    %esi,%esi
 8055160:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8055163:	8b 13                	mov    (%ebx),%edx
 8055165:	85 d2                	test   %edx,%edx
 8055167:	74 37                	je     0x80551a0
 8055169:	8b 43 04             	mov    0x4(%ebx),%eax
 805516c:	8b 7d 1c             	mov    0x1c(%ebp),%edi
 805516f:	89 38                	mov    %edi,(%eax)
 8055171:	8b 53 08             	mov    0x8(%ebx),%edx
 8055174:	8b 5d e4             	mov    0xffffffe4(%ebp),%ebx
 8055177:	39 5d d8             	cmp    %ebx,0xffffffd8(%ebp)
 805517a:	75 14                	jne    0x8055190
 805517c:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 805517f:	2b 7d 0c             	sub    0xc(%ebp),%edi
 8055182:	89 3a                	mov    %edi,(%edx)
 8055184:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8055187:	8b 13                	mov    (%ebx),%edx
 8055189:	eb 15                	jmp    0x80551a0
 805518b:	90                   	nop    
 805518c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055190:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 8055193:	2b 45 14             	sub    0x14(%ebp),%eax
 8055196:	03 45 10             	add    0x10(%ebp),%eax
 8055199:	89 02                	mov    %eax,(%edx)
 805519b:	8b 7d 20             	mov    0x20(%ebp),%edi
 805519e:	8b 17                	mov    (%edi),%edx
 80551a0:	c7 85 60 ff ff ff 01 	movl   $0x1,0xffffff60(%ebp)
 80551a7:	00 00 00 
 80551aa:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 80551ad:	e9 b7 00 00 00       	jmp    0x8055269
 80551b2:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 80551b8:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80551bb:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 80551be:	8b 5d 20             	mov    0x20(%ebp),%ebx
 80551c1:	8b 53 04             	mov    0x4(%ebx),%edx
 80551c4:	3d 60 bc 05 08       	cmp    $0x805bc60,%eax
 80551c9:	74 12                	je     0x80551dd
 80551cb:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 80551d1:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 80551d4:	81 3c bb 60 bc 05 08 	cmpl   $0x805bc60,(%ebx,%edi,4)
 80551db:	75 23                	jne    0x8055200
 80551dd:	8b 7d 20             	mov    0x20(%ebp),%edi
 80551e0:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 80551e6:	8b 47 08             	mov    0x8(%edi),%eax
 80551e9:	c7 04 98 ff ff ff ff 	movl   $0xffffffff,(%eax,%ebx,4)
 80551f0:	c7 04 9a ff ff ff ff 	movl   $0xffffffff,(%edx,%ebx,4)
 80551f7:	eb 65                	jmp    0x805525e
 80551f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8055200:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8055204:	74 0e                	je     0x8055214
 8055206:	39 45 0c             	cmp    %eax,0xc(%ebp)
 8055209:	77 09                	ja     0x8055214
 805520b:	39 c8                	cmp    %ecx,%eax
 805520d:	77 05                	ja     0x8055214
 805520f:	2b 45 0c             	sub    0xc(%ebp),%eax
 8055212:	eb 06                	jmp    0x805521a
 8055214:	2b 45 14             	sub    0x14(%ebp),%eax
 8055217:	03 45 10             	add    0x10(%ebp),%eax
 805521a:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055220:	89 04 ba             	mov    %eax,(%edx,%edi,4)
 8055223:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8055226:	8b 53 08             	mov    0x8(%ebx),%edx
 8055229:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 805522d:	74 14                	je     0x8055243
 805522f:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 8055232:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 8055235:	39 45 0c             	cmp    %eax,0xc(%ebp)
 8055238:	77 09                	ja     0x8055243
 805523a:	39 c8                	cmp    %ecx,%eax
 805523c:	77 05                	ja     0x8055243
 805523e:	2b 45 0c             	sub    0xc(%ebp),%eax
 8055241:	eb 12                	jmp    0x8055255
 8055243:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055249:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 805524c:	8b 04 bb             	mov    (%ebx,%edi,4),%eax
 805524f:	2b 45 14             	sub    0x14(%ebp),%eax
 8055252:	03 45 10             	add    0x10(%ebp),%eax
 8055255:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 805525b:	89 04 ba             	mov    %eax,(%edx,%edi,4)
 805525e:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8055261:	ff 85 60 ff ff ff    	incl   0xffffff60(%ebp)
 8055267:	8b 13                	mov    (%ebx),%edx
 8055269:	89 d0                	mov    %edx,%eax
 805526b:	3b 55 c4             	cmp    0xffffffc4(%ebp),%edx
 805526e:	76 03                	jbe    0x8055273
 8055270:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
 8055273:	39 85 60 ff ff ff    	cmp    %eax,0xffffff60(%ebp)
 8055279:	0f 82 33 ff ff ff    	jb     0x80551b2
 805527f:	8b 7d c4             	mov    0xffffffc4(%ebp),%edi
 8055282:	89 bd 60 ff ff ff    	mov    %edi,0xffffff60(%ebp)
 8055288:	39 d7                	cmp    %edx,%edi
 805528a:	73 2c                	jae    0x80552b8
 805528c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055290:	8b 5d 20             	mov    0x20(%ebp),%ebx
 8055293:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055299:	8b 43 08             	mov    0x8(%ebx),%eax
 805529c:	8b 53 04             	mov    0x4(%ebx),%edx
 805529f:	c7 04 b8 ff ff ff ff 	movl   $0xffffffff,(%eax,%edi,4)
 80552a6:	c7 04 ba ff ff ff ff 	movl   $0xffffffff,(%edx,%edi,4)
 80552ad:	47                   	inc    %edi
 80552ae:	89 bd 60 ff ff ff    	mov    %edi,0xffffff60(%ebp)
 80552b4:	3b 3b                	cmp    (%ebx),%edi
 80552b6:	72 d8                	jb     0x8055290
 80552b8:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 80552bb:	2b 45 1c             	sub    0x1c(%ebp),%eax
 80552be:	8b 5d e4             	mov    0xffffffe4(%ebp),%ebx
 80552c1:	39 5d d8             	cmp    %ebx,0xffffffd8(%ebp)
 80552c4:	74 0b                	je     0x80552d1
 80552c6:	8b 7d 10             	mov    0x10(%ebp),%edi
 80552c9:	29 7d 14             	sub    %edi,0x14(%ebp)
 80552cc:	2b 45 14             	sub    0x14(%ebp),%eax
 80552cf:	eb 03                	jmp    0x80552d4
 80552d1:	2b 45 0c             	sub    0xc(%ebp),%eax
 80552d4:	89 85 60 ff ff ff    	mov    %eax,0xffffff60(%ebp)
 80552da:	8b 85 60 ff ff ff    	mov    0xffffff60(%ebp),%eax
 80552e0:	e9 90 16 00 00       	jmp    0x8056975
 80552e5:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 80552e8:	31 c0                	xor    %eax,%eax
 80552ea:	8a 03                	mov    (%ebx),%al
 80552ec:	43                   	inc    %ebx
 80552ed:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 80552f0:	83 f8 1d             	cmp    $0x1d,%eax
 80552f3:	0f 87 37 15 00 00    	ja     0x8056830
 80552f9:	ff 24 85 68 9a 05 08 	jmp    *0x8059a68(,%eax,4)
 8055300:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055303:	31 db                	xor    %ebx,%ebx
 8055305:	8a 1f                	mov    (%edi),%bl
 8055307:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 805530d:	47                   	inc    %edi
 805530e:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8055311:	83 7d c8 00          	cmpl   $0x0,0xffffffc8(%ebp)
 8055315:	74 4c                	je     0x8055363
 8055317:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 805531a:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 805531d:	75 1a                	jne    0x8055339
 805531f:	90                   	nop    
 8055320:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 8055323:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 8055326:	0f 84 09 15 00 00    	je     0x8056835
 805532c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805532f:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8055332:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 8055335:	39 fb                	cmp    %edi,%ebx
 8055337:	74 e7                	je     0x8055320
 8055339:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 805533c:	31 d2                	xor    %edx,%edx
 805533e:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 8055341:	8a 17                	mov    (%edi),%dl
 8055343:	8a 03                	mov    (%ebx),%al
 8055345:	43                   	inc    %ebx
 8055346:	47                   	inc    %edi
 8055347:	89 7d dc             	mov    %edi,0xffffffdc(%ebp)
 805534a:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 805534d:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8055350:	38 04 3a             	cmp    %al,(%edx,%edi,1)
 8055353:	0f 85 dc 14 00 00    	jne    0x8056835
 8055359:	ff 8d 60 ff ff ff    	decl   0xffffff60(%ebp)
 805535f:	75 b6                	jne    0x8055317
 8055361:	eb 48                	jmp    0x80553ab
 8055363:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 8055366:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8055369:	75 1e                	jne    0x8055389
 805536b:	90                   	nop    
 805536c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055370:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 8055373:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 8055376:	0f 84 b9 14 00 00    	je     0x8056835
 805537c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805537f:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8055382:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 8055385:	39 fb                	cmp    %edi,%ebx
 8055387:	74 e7                	je     0x8055370
 8055389:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 805538c:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 805538f:	8a 17                	mov    (%edi),%dl
 8055391:	8a 03                	mov    (%ebx),%al
 8055393:	43                   	inc    %ebx
 8055394:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8055397:	47                   	inc    %edi
 8055398:	89 7d dc             	mov    %edi,0xffffffdc(%ebp)
 805539b:	38 c2                	cmp    %al,%dl
 805539d:	0f 85 92 14 00 00    	jne    0x8056835
 80553a3:	ff 8d 60 ff ff ff    	decl   0xffffff60(%ebp)
 80553a9:	75 b8                	jne    0x8055363
 80553ab:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 80553af:	0f 85 af fb ff ff    	jne    0x8054f64
 80553b5:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 80553bc:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 80553bf:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 80553c2:	39 d8                	cmp    %ebx,%eax
 80553c4:	0f 87 9a fb ff ff    	ja     0x8054f64
 80553ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80553d0:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80553d3:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 80553d7:	40                   	inc    %eax
 80553d8:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 80553db:	76 f3                	jbe    0x80553d0
 80553dd:	e9 82 fb ff ff       	jmp    0x8054f64
 80553e2:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 80553e5:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 80553e8:	75 1f                	jne    0x8055409
 80553ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80553f0:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 80553f3:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 80553f6:	0f 84 39 14 00 00    	je     0x8056835
 80553fc:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80553ff:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8055402:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 8055405:	39 fb                	cmp    %edi,%ebx
 8055407:	74 e7                	je     0x80553f0
 8055409:	8b 7d 08             	mov    0x8(%ebp),%edi
 805540c:	f6 47 0c 40          	testb  $0x40,0xc(%edi)
 8055410:	75 2a                	jne    0x805543c
 8055412:	83 7d c8 00          	cmpl   $0x0,0xffffffc8(%ebp)
 8055416:	74 18                	je     0x8055430
 8055418:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 805541b:	31 c0                	xor    %eax,%eax
 805541d:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 8055420:	8a 03                	mov    (%ebx),%al
 8055422:	80 3c 38 0a          	cmpb   $0xa,(%eax,%edi,1)
 8055426:	0f 84 09 14 00 00    	je     0x8056835
 805542c:	eb 0e                	jmp    0x805543c
 805542e:	89 f6                	mov    %esi,%esi
 8055430:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8055433:	80 3b 0a             	cmpb   $0xa,(%ebx)
 8055436:	0f 84 f9 13 00 00    	je     0x8056835
 805543c:	8b 7d 08             	mov    0x8(%ebp),%edi
 805543f:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
 8055443:	7d 27                	jge    0x805546c
 8055445:	83 7d c8 00          	cmpl   $0x0,0xffffffc8(%ebp)
 8055449:	74 15                	je     0x8055460
 805544b:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 805544e:	31 c0                	xor    %eax,%eax
 8055450:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 8055453:	8a 03                	mov    (%ebx),%al
 8055455:	80 3c 38 00          	cmpb   $0x0,(%eax,%edi,1)
 8055459:	75 11                	jne    0x805546c
 805545b:	e9 d5 13 00 00       	jmp    0x8056835
 8055460:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8055463:	80 3b 00             	cmpb   $0x0,(%ebx)
 8055466:	0f 84 c9 13 00 00    	je     0x8056835
 805546c:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 8055470:	0f 85 ab 13 00 00    	jne    0x8056821
 8055476:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 805547d:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 8055480:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055483:	39 d8                	cmp    %ebx,%eax
 8055485:	0f 87 96 13 00 00    	ja     0x8056821
 805548b:	90                   	nop    
 805548c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055490:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8055493:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 8055497:	40                   	inc    %eax
 8055498:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 805549b:	76 f3                	jbe    0x8055490
 805549d:	e9 7f 13 00 00       	jmp    0x8056821
 80554a2:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 80554a5:	80 7b ff 05          	cmpb   $0x5,0xffffffff(%ebx)
 80554a9:	0f 94 c3             	sete   %bl
 80554ac:	88 5d 8b             	mov    %bl,0xffffff8b(%ebp)
 80554af:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 80554b2:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 80554b5:	75 19                	jne    0x80554d0
 80554b7:	8b 5d e0             	mov    0xffffffe0(%ebp),%ebx
 80554ba:	39 5d d8             	cmp    %ebx,0xffffffd8(%ebp)
 80554bd:	0f 84 72 13 00 00    	je     0x8056835
 80554c3:	8b 7d 14             	mov    0x14(%ebp),%edi
 80554c6:	89 7d dc             	mov    %edi,0xffffffdc(%ebp)
 80554c9:	89 5d d8             	mov    %ebx,0xffffffd8(%ebp)
 80554cc:	39 df                	cmp    %ebx,%edi
 80554ce:	74 e7                	je     0x80554b7
 80554d0:	83 7d c8 00          	cmpl   $0x0,0xffffffc8(%ebp)
 80554d4:	74 11                	je     0x80554e7
 80554d6:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80554d9:	31 c0                	xor    %eax,%eax
 80554db:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 80554de:	8a 03                	mov    (%ebx),%al
 80554e0:	8a 04 38             	mov    (%eax,%edi,1),%al
 80554e3:	89 c6                	mov    %eax,%esi
 80554e5:	eb 07                	jmp    0x80554ee
 80554e7:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80554ea:	8a 1b                	mov    (%ebx),%bl
 80554ec:	89 de                	mov    %ebx,%esi
 80554ee:	89 f2                	mov    %esi,%edx
 80554f0:	81 e2 ff 00 00 00    	and    $0xff,%edx
 80554f6:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80554f9:	31 c9                	xor    %ecx,%ecx
 80554fb:	8a 0f                	mov    (%edi),%cl
 80554fd:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 8055504:	39 c2                	cmp    %eax,%edx
 8055506:	73 1e                	jae    0x8055526
 8055508:	89 f0                	mov    %esi,%eax
 805550a:	c0 e8 03             	shr    $0x3,%al
 805550d:	25 ff 00 00 00       	and    $0xff,%eax
 8055512:	31 d2                	xor    %edx,%edx
 8055514:	8a 54 07 01          	mov    0x1(%edi,%eax,1),%dl
 8055518:	89 f0                	mov    %esi,%eax
 805551a:	83 e0 07             	and    $0x7,%eax
 805551d:	0f a3 c2             	bt     %eax,%edx
 8055520:	73 04                	jae    0x8055526
 8055522:	80 75 8b 01          	xorb   $0x1,0xffffff8b(%ebp)
 8055526:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 8055529:	8d 4c 0b 01          	lea    0x1(%ebx,%ecx,1),%ecx
 805552d:	89 4d d4             	mov    %ecx,0xffffffd4(%ebp)
 8055530:	80 7d 8b 00          	cmpb   $0x0,0xffffff8b(%ebp)
 8055534:	0f 84 fb 12 00 00    	je     0x8056835
 805553a:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 805553e:	0f 85 dd 12 00 00    	jne    0x8056821
 8055544:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 805554b:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 805554e:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055551:	39 d8                	cmp    %ebx,%eax
 8055553:	0f 87 c8 12 00 00    	ja     0x8056821
 8055559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8055560:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8055563:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 8055567:	40                   	inc    %eax
 8055568:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 805556b:	76 f3                	jbe    0x8055560
 805556d:	e9 af 12 00 00       	jmp    0x8056821
 8055572:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 8055575:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 8055578:	31 c9                	xor    %ecx,%ecx
 805557a:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 805557d:	31 c0                	xor    %eax,%eax
 805557f:	8a 0b                	mov    (%ebx),%cl
 8055581:	8a 04 8f             	mov    (%edi,%ecx,4),%al
 8055584:	83 e0 03             	and    $0x3,%eax
 8055587:	83 f8 03             	cmp    $0x3,%eax
 805558a:	75 2e                	jne    0x80555ba
 805558c:	57                   	push   %edi
 805558d:	8b 5d d0             	mov    0xffffffd0(%ebp),%ebx
 8055590:	53                   	push   %ebx
 8055591:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
 8055594:	50                   	push   %eax
 8055595:	e8 f6 13 00 00       	call   0x8056990
 805559a:	88 c1                	mov    %al,%cl
 805559c:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 805559f:	31 d2                	xor    %edx,%edx
 80555a1:	80 e1 03             	and    $0x3,%cl
 80555a4:	8b 5d a8             	mov    0xffffffa8(%ebp),%ebx
 80555a7:	83 c4 0c             	add    $0xc,%esp
 80555aa:	8a 17                	mov    (%edi),%dl
 80555ac:	8a 04 93             	mov    (%ebx,%edx,4),%al
 80555af:	24 fc                	and    $0xfc,%al
 80555b1:	08 c8                	or     %cl,%al
 80555b3:	88 04 93             	mov    %al,(%ebx,%edx,4)
 80555b6:	31 c9                	xor    %ecx,%ecx
 80555b8:	8a 0f                	mov    (%edi),%cl
 80555ba:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80555bd:	f6 04 8f 03          	testb  $0x3,(%edi,%ecx,4)
 80555c1:	74 12                	je     0x80555d5
 80555c3:	8b 5d b8             	mov    0xffffffb8(%ebp),%ebx
 80555c6:	8b 04 8b             	mov    (%ebx,%ecx,4),%eax
 80555c9:	3d 60 bc 05 08       	cmp    $0x805bc60,%eax
 80555ce:	75 0b                	jne    0x80555db
 80555d0:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 80555d3:	eb 06                	jmp    0x80555db
 80555d5:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80555d8:	8b 04 8f             	mov    (%edi,%ecx,4),%eax
 80555db:	8b 5d b0             	mov    0xffffffb0(%ebp),%ebx
 80555de:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 80555e1:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80555e4:	31 c0                	xor    %eax,%eax
 80555e6:	8b 5d b8             	mov    0xffffffb8(%ebp),%ebx
 80555e9:	8a 07                	mov    (%edi),%al
 80555eb:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 80555ee:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
 80555f1:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 80555f4:	31 c0                	xor    %eax,%eax
 80555f6:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80555f9:	8a 03                	mov    (%ebx),%al
 80555fb:	80 0c 87 04          	orb    $0x4,(%edi,%eax,4)
 80555ff:	31 c0                	xor    %eax,%eax
 8055601:	8a 03                	mov    (%ebx),%al
 8055603:	80 24 87 f7          	andb   $0xf7,(%edi,%eax,4)
 8055607:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
 805560e:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055611:	31 db                	xor    %ebx,%ebx
 8055613:	8a 1f                	mov    (%edi),%bl
 8055615:	89 5d bc             	mov    %ebx,0xffffffbc(%ebp)
 8055618:	81 7d c0 01 01 00 00 	cmpl   $0x101,0xffffffc0(%ebp)
 805561f:	75 03                	jne    0x8055624
 8055621:	89 5d c0             	mov    %ebx,0xffffffc0(%ebp)
 8055624:	83 45 d4 02          	addl   $0x2,0xffffffd4(%ebp)
 8055628:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 805562b:	89 5d cc             	mov    %ebx,0xffffffcc(%ebp)
 805562e:	e9 31 f9 ff ff       	jmp    0x8054f64
 8055633:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055636:	31 d2                	xor    %edx,%edx
 8055638:	8b 5d a8             	mov    0xffffffa8(%ebp),%ebx
 805563b:	8a 17                	mov    (%edi),%dl
 805563d:	f6 04 93 03          	testb  $0x3,(%ebx,%edx,4)
 8055641:	74 12                	je     0x8055655
 8055643:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8055646:	8b 04 97             	mov    (%edi,%edx,4),%eax
 8055649:	3d 60 bc 05 08       	cmp    $0x805bc60,%eax
 805564e:	75 0b                	jne    0x805565b
 8055650:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 8055653:	eb 06                	jmp    0x805565b
 8055655:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 8055658:	8b 04 93             	mov    (%ebx,%edx,4),%eax
 805565b:	8b 7d ac             	mov    0xffffffac(%ebp),%edi
 805565e:	89 04 97             	mov    %eax,(%edi,%edx,4)
 8055661:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 8055664:	31 c0                	xor    %eax,%eax
 8055666:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8055669:	8a 03                	mov    (%ebx),%al
 805566b:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 805566e:	89 1c 87             	mov    %ebx,(%edi,%eax,4)
 8055671:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055674:	31 c0                	xor    %eax,%eax
 8055676:	8b 5d a8             	mov    0xffffffa8(%ebp),%ebx
 8055679:	8a 07                	mov    (%edi),%al
 805567b:	80 24 83 fb          	andb   $0xfb,(%ebx,%eax,4)
 805567f:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
 8055686:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055689:	39 5d c0             	cmp    %ebx,0xffffffc0(%ebp)
 805568c:	74 2b                	je     0x80556b9
 805568e:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055691:	8a 0f                	mov    (%edi),%cl
 8055693:	fe c9                	dec    %cl
 8055695:	74 22                	je     0x80556b9
 8055697:	31 c0                	xor    %eax,%eax
 8055699:	8b 5d a8             	mov    0xffffffa8(%ebp),%ebx
 805569c:	88 c8                	mov    %cl,%al
 805569e:	f6 04 83 04          	testb  $0x4,(%ebx,%eax,4)
 80556a2:	75 11                	jne    0x80556b5
 80556a4:	fe c9                	dec    %cl
 80556a6:	74 11                	je     0x80556b9
 80556a8:	31 c0                	xor    %eax,%eax
 80556aa:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80556ad:	88 c8                	mov    %cl,%al
 80556af:	f6 04 87 04          	testb  $0x4,(%edi,%eax,4)
 80556b3:	74 ef                	je     0x80556a4
 80556b5:	84 c9                	test   %cl,%cl
 80556b7:	75 17                	jne    0x80556d0
 80556b9:	c7 45 c0 01 01 00 00 	movl   $0x101,0xffffffc0(%ebp)
 80556c0:	c7 45 bc 00 01 00 00 	movl   $0x100,0xffffffbc(%ebp)
 80556c7:	eb 0a                	jmp    0x80556d3
 80556c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80556d0:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 80556d3:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 80556d6:	31 c0                	xor    %eax,%eax
 80556d8:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80556db:	8a 03                	mov    (%ebx),%al
 80556dd:	f6 04 87 08          	testb  $0x8,(%edi,%eax,4)
 80556e1:	74 0c                	je     0x80556ef
 80556e3:	89 d8                	mov    %ebx,%eax
 80556e5:	48                   	dec    %eax
 80556e6:	39 45 cc             	cmp    %eax,0xffffffcc(%ebp)
 80556e9:	0f 85 31 02 00 00    	jne    0x8055920
 80556ef:	8b 45 d4             	mov    0xffffffd4(%ebp),%eax
 80556f2:	83 c0 02             	add    $0x2,%eax
 80556f5:	3b 45 d0             	cmp    0xffffffd0(%ebp),%eax
 80556f8:	0f 83 22 02 00 00    	jae    0x8055920
 80556fe:	31 c9                	xor    %ecx,%ecx
 8055700:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 8055703:	c7 85 60 ff ff ff 00 	movl   $0x0,0xffffff60(%ebp)
 805570a:	00 00 00 
 805570d:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 8055710:	ff 45 f0             	incl   0xfffffff0(%ebp)
 8055713:	8a 43 02             	mov    0x2(%ebx),%al
 8055716:	3c 13                	cmp    $0x13,%al
 8055718:	77 0a                	ja     0x8055724
 805571a:	3c 11                	cmp    $0x11,%al
 805571c:	73 0c                	jae    0x805572a
 805571e:	3c 0d                	cmp    $0xd,%al
 8055720:	74 08                	je     0x805572a
 8055722:	eb 2c                	jmp    0x8055750
 8055724:	3c 16                	cmp    $0x16,%al
 8055726:	75 28                	jne    0x8055750
 8055728:	b1 01                	mov    $0x1,%cl
 805572a:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 805572d:	31 db                	xor    %ebx,%ebx
 805572f:	8a 1a                	mov    (%edx),%bl
 8055731:	0f be 42 01          	movsbl 0x1(%edx),%eax
 8055735:	c1 e0 08             	shl    $0x8,%eax
 8055738:	01 c3                	add    %eax,%ebx
 805573a:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055740:	8d 7a 02             	lea    0x2(%edx),%edi
 8055743:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 8055746:	84 c9                	test   %cl,%cl
 8055748:	74 06                	je     0x8055750
 805574a:	83 c2 04             	add    $0x4,%edx
 805574d:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 8055750:	8b 95 60 ff ff ff    	mov    0xffffff60(%ebp),%edx
 8055756:	03 55 f0             	add    0xfffffff0(%ebp),%edx
 8055759:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 805575c:	83 bd 60 ff ff ff 00 	cmpl   $0x0,0xffffff60(%ebp)
 8055763:	0f 8d b7 01 00 00    	jge    0x8055920
 8055769:	80 3a 0f             	cmpb   $0xf,(%edx)
 805576c:	0f 85 ae 01 00 00    	jne    0x8055920
 8055772:	80 7a 03 06          	cmpb   $0x6,0x3(%edx)
 8055776:	0f 85 a4 01 00 00    	jne    0x8055920
 805577c:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 805577f:	8a 03                	mov    (%ebx),%al
 8055781:	38 42 04             	cmp    %al,0x4(%edx)
 8055784:	0f 85 96 01 00 00    	jne    0x8055920
 805578a:	31 d2                	xor    %edx,%edx
 805578c:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 805578f:	8a 13                	mov    (%ebx),%dl
 8055791:	8a 04 97             	mov    (%edi,%edx,4),%al
 8055794:	a8 10                	test   $0x10,%al
 8055796:	74 47                	je     0x80557df
 8055798:	24 ef                	and    $0xef,%al
 805579a:	88 04 97             	mov    %al,(%edi,%edx,4)
 805579d:	31 c9                	xor    %ecx,%ecx
 805579f:	8a 0b                	mov    (%ebx),%cl
 80557a1:	31 c0                	xor    %eax,%eax
 80557a3:	8a 43 01             	mov    0x1(%ebx),%al
 80557a6:	01 c8                	add    %ecx,%eax
 80557a8:	39 c1                	cmp    %eax,%ecx
 80557aa:	73 33                	jae    0x80557df
 80557ac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80557b0:	8b 5d b0             	mov    0xffffffb0(%ebp),%ebx
 80557b3:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80557b6:	8b 04 8b             	mov    (%ebx,%ecx,4),%eax
 80557b9:	89 04 8f             	mov    %eax,(%edi,%ecx,4)
 80557bc:	8b 5d ac             	mov    0xffffffac(%ebp),%ebx
 80557bf:	8b 14 8b             	mov    (%ebx,%ecx,4),%edx
 80557c2:	39 c2                	cmp    %eax,%edx
 80557c4:	72 06                	jb     0x80557cc
 80557c6:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 80557c9:	89 14 8f             	mov    %edx,(%edi,%ecx,4)
 80557cc:	41                   	inc    %ecx
 80557cd:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 80557d0:	31 c0                	xor    %eax,%eax
 80557d2:	31 d2                	xor    %edx,%edx
 80557d4:	8a 03                	mov    (%ebx),%al
 80557d6:	8a 53 01             	mov    0x1(%ebx),%dl
 80557d9:	01 d0                	add    %edx,%eax
 80557db:	39 c1                	cmp    %eax,%ecx
 80557dd:	72 d1                	jb     0x80557b0
 80557df:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 80557e2:	8d 7a 01             	lea    0x1(%edx),%edi
 80557e5:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 80557e8:	31 db                	xor    %ebx,%ebx
 80557ea:	8a 5a 01             	mov    0x1(%edx),%bl
 80557ed:	0f be 42 02          	movsbl 0x2(%edx),%eax
 80557f1:	c1 e0 08             	shl    $0x8,%eax
 80557f4:	01 c3                	add    %eax,%ebx
 80557f6:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 80557fc:	83 c2 03             	add    $0x3,%edx
 80557ff:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 8055802:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8055805:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 805580b:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 805580e:	89 fa                	mov    %edi,%edx
 8055810:	29 ca                	sub    %ecx,%edx
 8055812:	8b 45 bc             	mov    0xffffffbc(%ebp),%eax
 8055815:	2b 45 c0             	sub    0xffffffc0(%ebp),%eax
 8055818:	8d 70 01             	lea    0x1(%eax),%esi
 805581b:	89 f3                	mov    %esi,%ebx
 805581d:	01 f3                	add    %esi,%ebx
 805581f:	89 9d 6c ff ff ff    	mov    %ebx,0xffffff6c(%ebp)
 8055825:	8d 44 1e 04          	lea    0x4(%esi,%ebx,1),%eax
 8055829:	39 c2                	cmp    %eax,%edx
 805582b:	73 63                	jae    0x8055890
 805582d:	89 c6                	mov    %eax,%esi
 805582f:	90                   	nop    
 8055830:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 8055835:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 8055838:	8d 14 50             	lea    (%eax,%edx,2),%edx
 805583b:	39 95 5c ff ff ff    	cmp    %edx,0xffffff5c(%ebp)
 8055841:	0f 87 69 0a 00 00    	ja     0x80562b0
 8055847:	8b bd 5c ff ff ff    	mov    0xffffff5c(%ebp),%edi
 805584d:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 8055854:	29 c4                	sub    %eax,%esp
 8055856:	89 e1                	mov    %esp,%ecx
 8055858:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805585b:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 8055862:	50                   	push   %eax
 8055863:	52                   	push   %edx
 8055864:	51                   	push   %ecx
 8055865:	e8 b2 38 ff ff       	call   0x804911c
 805586a:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 805586d:	83 c4 0c             	add    $0xc,%esp
 8055870:	85 c0                	test   %eax,%eax
 8055872:	0f 84 38 0a 00 00    	je     0x80562b0
 8055878:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 805587c:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 805587f:	89 9d 5c ff ff ff    	mov    %ebx,0xffffff5c(%ebp)
 8055885:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055888:	89 d8                	mov    %ebx,%eax
 805588a:	29 c8                	sub    %ecx,%eax
 805588c:	39 f0                	cmp    %esi,%eax
 805588e:	72 a0                	jb     0x8055830
 8055890:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 8055893:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055896:	39 de                	cmp    %ebx,%esi
 8055898:	77 42                	ja     0x80558dc
 805589a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80558a0:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80558a3:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80558a6:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 80558a9:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80558ac:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80558af:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80558b2:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 80558b5:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80558b8:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 80558bb:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80558be:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80558c1:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80558c4:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80558c7:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80558ca:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 80558cd:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80558d0:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80558d3:	46                   	inc    %esi
 80558d4:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80558d7:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 80558da:	76 c4                	jbe    0x80558a0
 80558dc:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80558df:	8b 5d c0             	mov    0xffffffc0(%ebp),%ebx
 80558e2:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 80558e5:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80558e8:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80558eb:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80558ee:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 80558f1:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 80558f4:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80558f7:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80558fa:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80558fd:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055903:	03 7d f0             	add    0xfffffff0(%ebp),%edi
 8055906:	89 3c 90             	mov    %edi,(%eax,%edx,4)
 8055909:	ff 45 fc             	incl   0xfffffffc(%ebp)
 805590c:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805590f:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055912:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8055915:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8055918:	ff 45 fc             	incl   0xfffffffc(%ebp)
 805591b:	e9 15 0f 00 00       	jmp    0x8056835
 8055920:	83 45 d4 02          	addl   $0x2,0xffffffd4(%ebp)
 8055924:	e9 3b f6 ff ff       	jmp    0x8054f64
 8055929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8055930:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055933:	31 db                	xor    %ebx,%ebx
 8055935:	8a 1f                	mov    (%edi),%bl
 8055937:	47                   	inc    %edi
 8055938:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 805593b:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 805593e:	89 9d 7c ff ff ff    	mov    %ebx,0xffffff7c(%ebp)
 8055944:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 8055947:	3d 60 bc 05 08       	cmp    $0x805bc60,%eax
 805594c:	0f 84 e3 0e 00 00    	je     0x8056835
 8055952:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8055955:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
 8055958:	89 d6                	mov    %edx,%esi
 805595a:	81 fa 60 bc 05 08    	cmp    $0x805bc60,%edx
 8055960:	0f 84 cf 0e 00 00    	je     0x8056835
 8055966:	89 45 84             	mov    %eax,0xffffff84(%ebp)
 8055969:	31 c9                	xor    %ecx,%ecx
 805596b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 805596f:	74 0c                	je     0x805597d
 8055971:	39 45 0c             	cmp    %eax,0xc(%ebp)
 8055974:	77 07                	ja     0x805597d
 8055976:	8b 5d ec             	mov    0xffffffec(%ebp),%ebx
 8055979:	39 d8                	cmp    %ebx,%eax
 805597b:	76 05                	jbe    0x8055982
 805597d:	b9 01 00 00 00       	mov    $0x1,%ecx
 8055982:	31 c0                	xor    %eax,%eax
 8055984:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8055988:	74 10                	je     0x805599a
 805598a:	39 55 0c             	cmp    %edx,0xc(%ebp)
 805598d:	77 0b                	ja     0x805599a
 805598f:	3b 75 ec             	cmp    0xffffffec(%ebp),%esi
 8055992:	0f 96 c0             	setbe  %al
 8055995:	25 ff 00 00 00       	and    $0xff,%eax
 805599a:	39 c1                	cmp    %eax,%ecx
 805599c:	74 08                	je     0x80559a6
 805599e:	89 55 80             	mov    %edx,0xffffff80(%ebp)
 80559a1:	e9 d7 00 00 00       	jmp    0x8055a7d
 80559a6:	8b 7d e4             	mov    0xffffffe4(%ebp),%edi
 80559a9:	89 7d 80             	mov    %edi,0xffffff80(%ebp)
 80559ac:	e9 cc 00 00 00       	jmp    0x8055a7d
 80559b1:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 80559b4:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 80559b7:	75 20                	jne    0x80559d9
 80559b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80559c0:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 80559c3:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 80559c6:	0f 84 69 0e 00 00    	je     0x8056835
 80559cc:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80559cf:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 80559d2:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 80559d5:	39 fb                	cmp    %edi,%ebx
 80559d7:	74 e7                	je     0x80559c0
 80559d9:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 80559dc:	89 bd 60 ff ff ff    	mov    %edi,0xffffff60(%ebp)
 80559e2:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80559e5:	29 9d 60 ff ff ff    	sub    %ebx,0xffffff60(%ebp)
 80559eb:	8b 45 80             	mov    0xffffff80(%ebp),%eax
 80559ee:	2b 45 84             	sub    0xffffff84(%ebp),%eax
 80559f1:	39 85 60 ff ff ff    	cmp    %eax,0xffffff60(%ebp)
 80559f7:	7e 06                	jle    0x80559ff
 80559f9:	89 85 60 ff ff ff    	mov    %eax,0xffffff60(%ebp)
 80559ff:	83 7d c8 00          	cmpl   $0x0,0xffffffc8(%ebp)
 8055a03:	74 2b                	je     0x8055a30
 8055a05:	8b 7d c8             	mov    0xffffffc8(%ebp),%edi
 8055a08:	57                   	push   %edi
 8055a09:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 8055a0f:	53                   	push   %ebx
 8055a10:	8b 7d 84             	mov    0xffffff84(%ebp),%edi
 8055a13:	57                   	push   %edi
 8055a14:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8055a17:	53                   	push   %ebx
 8055a18:	e8 f3 11 00 00       	call   0x8056c10
 8055a1d:	83 c4 10             	add    $0x10,%esp
 8055a20:	85 c0                	test   %eax,%eax
 8055a22:	0f 85 0d 0e 00 00    	jne    0x8056835
 8055a28:	eb 1d                	jmp    0x8055a47
 8055a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8055a30:	8b 75 dc             	mov    0xffffffdc(%ebp),%esi
 8055a33:	8b 7d 84             	mov    0xffffff84(%ebp),%edi
 8055a36:	8b 8d 60 ff ff ff    	mov    0xffffff60(%ebp),%ecx
 8055a3c:	fc                   	cld    
 8055a3d:	a8 00                	test   $0x0,%al
 8055a3f:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 8055a41:	0f 85 ee 0d 00 00    	jne    0x8056835
 8055a47:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055a4d:	01 7d dc             	add    %edi,0xffffffdc(%ebp)
 8055a50:	01 7d 84             	add    %edi,0xffffff84(%ebp)
 8055a53:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 8055a57:	75 24                	jne    0x8055a7d
 8055a59:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 8055a60:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 8055a63:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055a66:	39 d8                	cmp    %ebx,%eax
 8055a68:	77 13                	ja     0x8055a7d
 8055a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8055a70:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8055a73:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 8055a77:	40                   	inc    %eax
 8055a78:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 8055a7b:	76 f3                	jbe    0x8055a70
 8055a7d:	8b 5d 80             	mov    0xffffff80(%ebp),%ebx
 8055a80:	39 5d 84             	cmp    %ebx,0xffffff84(%ebp)
 8055a83:	0f 85 28 ff ff ff    	jne    0x80559b1
 8055a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8055a90:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 8055a93:	39 7d 80             	cmp    %edi,0xffffff80(%ebp)
 8055a96:	74 1e                	je     0x8055ab6
 8055a98:	8b 9d 7c ff ff ff    	mov    0xffffff7c(%ebp),%ebx
 8055a9e:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8055aa1:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
 8055aa4:	39 45 80             	cmp    %eax,0xffffff80(%ebp)
 8055aa7:	74 0d                	je     0x8055ab6
 8055aa9:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8055aac:	89 5d 84             	mov    %ebx,0xffffff84(%ebp)
 8055aaf:	89 45 80             	mov    %eax,0xffffff80(%ebp)
 8055ab2:	39 c3                	cmp    %eax,%ebx
 8055ab4:	74 da                	je     0x8055a90
 8055ab6:	8b 7d 80             	mov    0xffffff80(%ebp),%edi
 8055ab9:	39 7d 84             	cmp    %edi,0xffffff84(%ebp)
 8055abc:	0f 85 ef fe ff ff    	jne    0x80559b1
 8055ac2:	e9 9d f4 ff ff       	jmp    0x8054f64
 8055ac7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8055acb:	74 0a                	je     0x8055ad7
 8055acd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8055ad0:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8055ad3:	74 10                	je     0x8055ae5
 8055ad5:	eb 08                	jmp    0x8055adf
 8055ad7:	8b 7d 14             	mov    0x14(%ebp),%edi
 8055ada:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8055add:	74 06                	je     0x8055ae5
 8055adf:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8055ae3:	75 12                	jne    0x8055af7
 8055ae5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8055ae8:	f6 43 1c 20          	testb  $0x20,0x1c(%ebx)
 8055aec:	0f 84 72 f4 ff ff    	je     0x8054f64
 8055af2:	e9 3e 0d 00 00       	jmp    0x8056835
 8055af7:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 8055afa:	80 7f ff 0a          	cmpb   $0xa,0xffffffff(%edi)
 8055afe:	0f 85 31 0d 00 00    	jne    0x8056835
 8055b04:	eb 3b                	jmp    0x8055b41
 8055b06:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8055b09:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8055b0c:	75 12                	jne    0x8055b20
 8055b0e:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8055b11:	f6 43 1c 40          	testb  $0x40,0x1c(%ebx)
 8055b15:	0f 84 49 f4 ff ff    	je     0x8054f64
 8055b1b:	e9 15 0d 00 00       	jmp    0x8056835
 8055b20:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8055b23:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8055b26:	75 0d                	jne    0x8055b35
 8055b28:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8055b2b:	80 3b 0a             	cmpb   $0xa,(%ebx)
 8055b2e:	74 11                	je     0x8055b41
 8055b30:	e9 00 0d 00 00       	jmp    0x8056835
 8055b35:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 8055b38:	80 3f 0a             	cmpb   $0xa,(%edi)
 8055b3b:	0f 85 f4 0c 00 00    	jne    0x8056835
 8055b41:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8055b44:	f6 43 1c 80          	testb  $0x80,0x1c(%ebx)
 8055b48:	0f 85 16 f4 ff ff    	jne    0x8054f64
 8055b4e:	e9 e2 0c 00 00       	jmp    0x8056835
 8055b53:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8055b57:	74 0e                	je     0x8055b67
 8055b59:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8055b5c:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8055b5f:	0f 84 ff f3 ff ff    	je     0x8054f64
 8055b65:	eb 0c                	jmp    0x8055b73
 8055b67:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8055b6a:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8055b6d:	0f 84 f1 f3 ff ff    	je     0x8054f64
 8055b73:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8055b77:	0f 85 b8 0c 00 00    	jne    0x8056835
 8055b7d:	e9 e2 f3 ff ff       	jmp    0x8054f64
 8055b82:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055b85:	31 db                	xor    %ebx,%ebx
 8055b87:	8a 1f                	mov    (%edi),%bl
 8055b89:	0f be 47 01          	movsbl 0x1(%edi),%eax
 8055b8d:	c1 e0 08             	shl    $0x8,%eax
 8055b90:	01 c3                	add    %eax,%ebx
 8055b92:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055b98:	83 c7 02             	add    $0x2,%edi
 8055b9b:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8055b9e:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 8055ba1:	89 9d 5c ff ff ff    	mov    %ebx,0xffffff5c(%ebp)
 8055ba7:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055baa:	89 da                	mov    %ebx,%edx
 8055bac:	29 ca                	sub    %ecx,%edx
 8055bae:	8b 45 bc             	mov    0xffffffbc(%ebp),%eax
 8055bb1:	2b 45 c0             	sub    0xffffffc0(%ebp),%eax
 8055bb4:	8d 70 01             	lea    0x1(%eax),%esi
 8055bb7:	89 f7                	mov    %esi,%edi
 8055bb9:	01 f7                	add    %esi,%edi
 8055bbb:	89 bd 68 ff ff ff    	mov    %edi,0xffffff68(%ebp)
 8055bc1:	8d 44 3e 04          	lea    0x4(%esi,%edi,1),%eax
 8055bc5:	39 c2                	cmp    %eax,%edx
 8055bc7:	73 67                	jae    0x8055c30
 8055bc9:	89 c6                	mov    %eax,%esi
 8055bcb:	90                   	nop    
 8055bcc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055bd0:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 8055bd5:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 8055bd8:	8d 14 50             	lea    (%eax,%edx,2),%edx
 8055bdb:	39 95 5c ff ff ff    	cmp    %edx,0xffffff5c(%ebp)
 8055be1:	0f 87 c9 06 00 00    	ja     0x80562b0
 8055be7:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8055bed:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8055bf4:	29 c4                	sub    %eax,%esp
 8055bf6:	89 e1                	mov    %esp,%ecx
 8055bf8:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055bfb:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
 8055c02:	50                   	push   %eax
 8055c03:	52                   	push   %edx
 8055c04:	51                   	push   %ecx
 8055c05:	e8 12 35 ff ff       	call   0x804911c
 8055c0a:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 8055c0d:	83 c4 0c             	add    $0xc,%esp
 8055c10:	85 c0                	test   %eax,%eax
 8055c12:	0f 84 98 06 00 00    	je     0x80562b0
 8055c18:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 8055c1c:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8055c1f:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 8055c25:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055c28:	89 f8                	mov    %edi,%eax
 8055c2a:	29 c8                	sub    %ecx,%eax
 8055c2c:	39 f0                	cmp    %esi,%eax
 8055c2e:	72 a0                	jb     0x8055bd0
 8055c30:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 8055c33:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055c36:	39 de                	cmp    %ebx,%esi
 8055c38:	77 42                	ja     0x8055c7c
 8055c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8055c40:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 8055c43:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055c46:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 8055c49:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055c4c:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055c4f:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055c52:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 8055c55:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055c58:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 8055c5b:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055c5e:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055c61:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055c64:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8055c67:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055c6a:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 8055c6d:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055c70:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055c73:	46                   	inc    %esi
 8055c74:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055c77:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 8055c7a:	76 c4                	jbe    0x8055c40
 8055c7c:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055c7f:	8b 5d c0             	mov    0xffffffc0(%ebp),%ebx
 8055c82:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 8055c85:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055c88:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8055c8b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055c8e:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055c91:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8055c94:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055c97:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8055c9a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055c9d:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055ca3:	03 7d d4             	add    0xffffffd4(%ebp),%edi
 8055ca6:	89 3c 90             	mov    %edi,(%eax,%edx,4)
 8055ca9:	e9 96 06 00 00       	jmp    0x8056344
 8055cae:	89 f6                	mov    %esi,%esi
 8055cb0:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055cb3:	31 db                	xor    %ebx,%ebx
 8055cb5:	8a 1f                	mov    (%edi),%bl
 8055cb7:	0f be 47 01          	movsbl 0x1(%edi),%eax
 8055cbb:	c1 e0 08             	shl    $0x8,%eax
 8055cbe:	01 c3                	add    %eax,%ebx
 8055cc0:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055cc6:	83 c7 02             	add    $0x2,%edi
 8055cc9:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8055ccc:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 8055ccf:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 8055cd5:	89 f8                	mov    %edi,%eax
 8055cd7:	8b 5d d0             	mov    0xffffffd0(%ebp),%ebx
 8055cda:	39 df                	cmp    %ebx,%edi
 8055cdc:	73 50                	jae    0x8055d2e
 8055cde:	80 3f 00             	cmpb   $0x0,(%edi)
 8055ce1:	75 1a                	jne    0x8055cfd
 8055ce3:	8d 78 01             	lea    0x1(%eax),%edi
 8055ce6:	89 7d f0             	mov    %edi,0xfffffff0(%ebp)
 8055ce9:	89 f8                	mov    %edi,%eax
 8055ceb:	89 85 5c ff ff ff    	mov    %eax,0xffffff5c(%ebp)
 8055cf1:	8b 5d d0             	mov    0xffffffd0(%ebp),%ebx
 8055cf4:	39 d8                	cmp    %ebx,%eax
 8055cf6:	73 36                	jae    0x8055d2e
 8055cf8:	80 38 00             	cmpb   $0x0,(%eax)
 8055cfb:	74 e6                	je     0x8055ce3
 8055cfd:	8b 7d d0             	mov    0xffffffd0(%ebp),%edi
 8055d00:	39 bd 5c ff ff ff    	cmp    %edi,0xffffff5c(%ebp)
 8055d06:	73 26                	jae    0x8055d2e
 8055d08:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8055d0e:	80 3b 06             	cmpb   $0x6,(%ebx)
 8055d11:	75 1b                	jne    0x8055d2e
 8055d13:	31 d2                	xor    %edx,%edx
 8055d15:	8a 53 01             	mov    0x1(%ebx),%dl
 8055d18:	31 c0                	xor    %eax,%eax
 8055d1a:	8a 43 02             	mov    0x2(%ebx),%al
 8055d1d:	01 d0                	add    %edx,%eax
 8055d1f:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 8055d22:	81 7d c0 01 01 00 00 	cmpl   $0x101,0xffffffc0(%ebp)
 8055d29:	75 03                	jne    0x8055d2e
 8055d2b:	89 55 c0             	mov    %edx,0xffffffc0(%ebp)
 8055d2e:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8055d31:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 8055d37:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055d3a:	89 f8                	mov    %edi,%eax
 8055d3c:	29 c8                	sub    %ecx,%eax
 8055d3e:	8b 55 bc             	mov    0xffffffbc(%ebp),%edx
 8055d41:	2b 55 c0             	sub    0xffffffc0(%ebp),%edx
 8055d44:	8d 72 01             	lea    0x1(%edx),%esi
 8055d47:	89 f3                	mov    %esi,%ebx
 8055d49:	01 f3                	add    %esi,%ebx
 8055d4b:	89 9d 64 ff ff ff    	mov    %ebx,0xffffff64(%ebp)
 8055d51:	8d 54 1e 04          	lea    0x4(%esi,%ebx,1),%edx
 8055d55:	39 d0                	cmp    %edx,%eax
 8055d57:	73 67                	jae    0x8055dc0
 8055d59:	89 d6                	mov    %edx,%esi
 8055d5b:	90                   	nop    
 8055d5c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8055d60:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 8055d65:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 8055d68:	8d 14 50             	lea    (%eax,%edx,2),%edx
 8055d6b:	39 95 5c ff ff ff    	cmp    %edx,0xffffff5c(%ebp)
 8055d71:	0f 87 39 05 00 00    	ja     0x80562b0
 8055d77:	8b bd 5c ff ff ff    	mov    0xffffff5c(%ebp),%edi
 8055d7d:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 8055d84:	29 c4                	sub    %eax,%esp
 8055d86:	89 e1                	mov    %esp,%ecx
 8055d88:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055d8b:	8d 04 bd 00 00 00 00 	lea    0x0(,%edi,4),%eax
 8055d92:	50                   	push   %eax
 8055d93:	52                   	push   %edx
 8055d94:	51                   	push   %ecx
 8055d95:	e8 82 33 ff ff       	call   0x804911c
 8055d9a:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 8055d9d:	83 c4 0c             	add    $0xc,%esp
 8055da0:	85 c0                	test   %eax,%eax
 8055da2:	0f 84 08 05 00 00    	je     0x80562b0
 8055da8:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 8055dac:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 8055daf:	89 9d 5c ff ff ff    	mov    %ebx,0xffffff5c(%ebp)
 8055db5:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055db8:	89 d8                	mov    %ebx,%eax
 8055dba:	29 c8                	sub    %ecx,%eax
 8055dbc:	39 f0                	cmp    %esi,%eax
 8055dbe:	72 a0                	jb     0x8055d60
 8055dc0:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 8055dc3:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055dc6:	39 de                	cmp    %ebx,%esi
 8055dc8:	77 42                	ja     0x8055e0c
 8055dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8055dd0:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 8055dd3:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055dd6:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 8055dd9:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055ddc:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055ddf:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055de2:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 8055de5:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055de8:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 8055deb:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055dee:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055df1:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055df4:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8055df7:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8055dfa:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 8055dfd:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8055e00:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055e03:	46                   	inc    %esi
 8055e04:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8055e07:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 8055e0a:	76 c4                	jbe    0x8055dd0
 8055e0c:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055e0f:	8b 5d c0             	mov    0xffffffc0(%ebp),%ebx
 8055e12:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 8055e15:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055e18:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8055e1b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055e1e:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8055e21:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8055e24:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055e27:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8055e2a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055e2d:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055e33:	03 7d d4             	add    0xffffffd4(%ebp),%edi
 8055e36:	89 3c 90             	mov    %edi,(%eax,%edx,4)
 8055e39:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055e3c:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8055e3f:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8055e42:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8055e45:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8055e48:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8055e4b:	e9 14 f1 ff ff       	jmp    0x8054f64
 8055e50:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8055e53:	31 db                	xor    %ebx,%ebx
 8055e55:	8a 1f                	mov    (%edi),%bl
 8055e57:	0f be 47 01          	movsbl 0x1(%edi),%eax
 8055e5b:	c1 e0 08             	shl    $0x8,%eax
 8055e5e:	01 c3                	add    %eax,%ebx
 8055e60:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055e66:	83 c7 02             	add    $0x2,%edi
 8055e69:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8055e6c:	89 fe                	mov    %edi,%esi
 8055e6e:	89 f6                	mov    %esi,%esi
 8055e70:	8d 46 02             	lea    0x2(%esi),%eax
 8055e73:	3b 45 d0             	cmp    0xffffffd0(%ebp),%eax
 8055e76:	73 0d                	jae    0x8055e85
 8055e78:	8a 06                	mov    (%esi),%al
 8055e7a:	04 fa                	add    $0xfa,%al
 8055e7c:	3c 01                	cmp    $0x1,%al
 8055e7e:	77 05                	ja     0x8055e85
 8055e80:	83 c6 03             	add    $0x3,%esi
 8055e83:	eb eb                	jmp    0x8055e70
 8055e85:	8d 46 06             	lea    0x6(%esi),%eax
 8055e88:	3b 45 d0             	cmp    0xffffffd0(%ebp),%eax
 8055e8b:	73 09                	jae    0x8055e96
 8055e8d:	80 3e 13             	cmpb   $0x13,(%esi)
 8055e90:	75 04                	jne    0x8055e96
 8055e92:	89 c6                	mov    %eax,%esi
 8055e94:	eb da                	jmp    0x8055e70
 8055e96:	8b 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%ebx
 8055e9c:	03 5d d4             	add    0xffffffd4(%ebp),%ebx
 8055e9f:	89 5d f0             	mov    %ebx,0xfffffff0(%ebp)
 8055ea2:	3b 75 d0             	cmp    0xffffffd0(%ebp),%esi
 8055ea5:	0f 84 64 01 00 00    	je     0x805600f
 8055eab:	8a 06                	mov    (%esi),%al
 8055ead:	3c 02                	cmp    $0x2,%al
 8055eaf:	74 15                	je     0x8055ec6
 8055eb1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8055eb4:	f6 43 1c 80          	testb  $0x80,0x1c(%ebx)
 8055eb8:	0f 84 92 00 00 00    	je     0x8055f50
 8055ebe:	3c 0a                	cmp    $0xa,%al
 8055ec0:	0f 85 8a 00 00 00    	jne    0x8055f50
 8055ec6:	3c 0a                	cmp    $0xa,%al
 8055ec8:	74 07                	je     0x8055ed1
 8055eca:	8a 5e 02             	mov    0x2(%esi),%bl
 8055ecd:	89 de                	mov    %ebx,%esi
 8055ecf:	eb 05                	jmp    0x8055ed6
 8055ed1:	be 0a 00 00 00       	mov    $0xa,%esi
 8055ed6:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8055ed9:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 8055edf:	89 f8                	mov    %edi,%eax
 8055ee1:	80 7f 03 02          	cmpb   $0x2,0x3(%edi)
 8055ee5:	75 0b                	jne    0x8055ef2
 8055ee7:	89 f3                	mov    %esi,%ebx
 8055ee9:	38 5f 05             	cmp    %bl,0x5(%edi)
 8055eec:	0f 85 1d 01 00 00    	jne    0x805600f
 8055ef2:	8a 50 03             	mov    0x3(%eax),%dl
 8055ef5:	88 d0                	mov    %dl,%al
 8055ef7:	04 fc                	add    $0xfc,%al
 8055ef9:	3c 01                	cmp    $0x1,%al
 8055efb:	0f 87 6e 01 00 00    	ja     0x805606f
 8055f01:	80 fa 05             	cmp    $0x5,%dl
 8055f04:	0f 94 c0             	sete   %al
 8055f07:	31 c9                	xor    %ecx,%ecx
 8055f09:	88 c1                	mov    %al,%cl
 8055f0b:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8055f11:	31 c0                	xor    %eax,%eax
 8055f13:	8a 43 04             	mov    0x4(%ebx),%al
 8055f16:	c1 e0 03             	shl    $0x3,%eax
 8055f19:	89 f3                	mov    %esi,%ebx
 8055f1b:	38 c3                	cmp    %al,%bl
 8055f1d:	73 23                	jae    0x8055f42
 8055f1f:	89 f0                	mov    %esi,%eax
 8055f21:	c0 e8 03             	shr    $0x3,%al
 8055f24:	25 ff 00 00 00       	and    $0xff,%eax
 8055f29:	8b bd 5c ff ff ff    	mov    0xffffff5c(%ebp),%edi
 8055f2f:	31 d2                	xor    %edx,%edx
 8055f31:	8a 54 07 05          	mov    0x5(%edi,%eax,1),%dl
 8055f35:	89 f0                	mov    %esi,%eax
 8055f37:	83 e0 07             	and    $0x7,%eax
 8055f3a:	0f a3 c2             	bt     %eax,%edx
 8055f3d:	73 03                	jae    0x8055f42
 8055f3f:	83 f1 01             	xor    $0x1,%ecx
 8055f42:	85 c9                	test   %ecx,%ecx
 8055f44:	0f 85 25 01 00 00    	jne    0x805606f
 8055f4a:	e9 19 01 00 00       	jmp    0x8056068
 8055f4f:	90                   	nop    
 8055f50:	3c 04                	cmp    $0x4,%al
 8055f52:	0f 85 17 01 00 00    	jne    0x805606f
 8055f58:	8b 7d f0             	mov    0xfffffff0(%ebp),%edi
 8055f5b:	89 bd 60 ff ff ff    	mov    %edi,0xffffff60(%ebp)
 8055f61:	89 bd 5c ff ff ff    	mov    %edi,0xffffff5c(%ebp)
 8055f67:	80 7f 03 02          	cmpb   $0x2,0x3(%edi)
 8055f6b:	75 36                	jne    0x8055fa3
 8055f6d:	31 c0                	xor    %eax,%eax
 8055f6f:	8a 46 01             	mov    0x1(%esi),%al
 8055f72:	c1 e0 03             	shl    $0x3,%eax
 8055f75:	31 d2                	xor    %edx,%edx
 8055f77:	8a 57 05             	mov    0x5(%edi),%dl
 8055f7a:	39 d0                	cmp    %edx,%eax
 8055f7c:	0f 8e e6 00 00 00    	jle    0x8056068
 8055f82:	8a 4f 05             	mov    0x5(%edi),%cl
 8055f85:	88 c8                	mov    %cl,%al
 8055f87:	c0 e8 03             	shr    $0x3,%al
 8055f8a:	25 ff 00 00 00       	and    $0xff,%eax
 8055f8f:	31 d2                	xor    %edx,%edx
 8055f91:	8a 54 06 02          	mov    0x2(%esi,%eax,1),%dl
 8055f95:	89 c8                	mov    %ecx,%eax
 8055f97:	83 e0 07             	and    $0x7,%eax
 8055f9a:	0f a3 c2             	bt     %eax,%edx
 8055f9d:	0f 83 c5 00 00 00    	jae    0x8056068
 8055fa3:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8055fa9:	8a 47 03             	mov    0x3(%edi),%al
 8055fac:	3c 05                	cmp    $0x5,%al
 8055fae:	75 68                	jne    0x8056018
 8055fb0:	31 c9                	xor    %ecx,%ecx
 8055fb2:	31 db                	xor    %ebx,%ebx
 8055fb4:	8a 5e 01             	mov    0x1(%esi),%bl
 8055fb7:	89 9d 70 ff ff ff    	mov    %ebx,0xffffff70(%ebp)
 8055fbd:	39 d9                	cmp    %ebx,%ecx
 8055fbf:	7d 46                	jge    0x8056007
 8055fc1:	89 bd 78 ff ff ff    	mov    %edi,0xffffff78(%ebp)
 8055fc7:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8055fcd:	8d 76 00             	lea    0x0(%esi),%esi
 8055fd0:	80 7c 0e 02 00       	cmpb   $0x0,0x2(%esi,%ecx,1)
 8055fd5:	74 27                	je     0x8055ffe
 8055fd7:	8b bd 78 ff ff ff    	mov    0xffffff78(%ebp),%edi
 8055fdd:	31 c0                	xor    %eax,%eax
 8055fdf:	8a 47 04             	mov    0x4(%edi),%al
 8055fe2:	39 c1                	cmp    %eax,%ecx
 8055fe4:	7d 21                	jge    0x8056007
 8055fe6:	31 d2                	xor    %edx,%edx
 8055fe8:	8a 54 0e 02          	mov    0x2(%esi,%ecx,1),%dl
 8055fec:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8055ff2:	31 c0                	xor    %eax,%eax
 8055ff4:	8a 44 0b 05          	mov    0x5(%ebx,%ecx,1),%al
 8055ff8:	f7 d0                	not    %eax
 8055ffa:	85 c2                	test   %eax,%edx
 8055ffc:	75 09                	jne    0x8056007
 8055ffe:	41                   	inc    %ecx
 8055fff:	3b 8d 60 ff ff ff    	cmp    0xffffff60(%ebp),%ecx
 8056005:	7c c9                	jl     0x8055fd0
 8056007:	3b 8d 70 ff ff ff    	cmp    0xffffff70(%ebp),%ecx
 805600d:	75 60                	jne    0x805606f
 805600f:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8056012:	c6 47 fd 11          	movb   $0x11,0xfffffffd(%edi)
 8056016:	eb 57                	jmp    0x805606f
 8056018:	3c 04                	cmp    $0x4,%al
 805601a:	75 53                	jne    0x805606f
 805601c:	31 d2                	xor    %edx,%edx
 805601e:	31 c9                	xor    %ecx,%ecx
 8056020:	8a 4e 01             	mov    0x1(%esi),%cl
 8056023:	39 ca                	cmp    %ecx,%edx
 8056025:	7d 2e                	jge    0x8056055
 8056027:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 805602d:	31 db                	xor    %ebx,%ebx
 805602f:	8a 5f 04             	mov    0x4(%edi),%bl
 8056032:	89 9d 74 ff ff ff    	mov    %ebx,0xffffff74(%ebp)
 8056038:	3b 95 74 ff ff ff    	cmp    0xffffff74(%ebp),%edx
 805603e:	7d 15                	jge    0x8056055
 8056040:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8056046:	8a 44 16 02          	mov    0x2(%esi,%edx,1),%al
 805604a:	22 44 13 05          	and    0x5(%ebx,%edx,1),%al
 805604e:	75 05                	jne    0x8056055
 8056050:	42                   	inc    %edx
 8056051:	39 ca                	cmp    %ecx,%edx
 8056053:	7c e3                	jl     0x8056038
 8056055:	39 ca                	cmp    %ecx,%edx
 8056057:	74 0f                	je     0x8056068
 8056059:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 805605f:	31 c0                	xor    %eax,%eax
 8056061:	8a 47 04             	mov    0x4(%edi),%al
 8056064:	39 c2                	cmp    %eax,%edx
 8056066:	75 07                	jne    0x805606f
 8056068:	8b 5d d4             	mov    0xffffffd4(%ebp),%ebx
 805606b:	c6 43 fd 11          	movb   $0x11,0xfffffffd(%ebx)
 805606f:	83 45 d4 fe          	addl   $0xfffffffe,0xffffffd4(%ebp)
 8056073:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8056076:	80 7f ff 11          	cmpb   $0x11,0xffffffff(%edi)
 805607a:	74 06                	je     0x8056082
 805607c:	c6 47 ff 0d          	movb   $0xd,0xffffffff(%edi)
 8056080:	eb 75                	jmp    0x80560f7
 8056082:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056085:	8d 58 ff             	lea    0xffffffff(%eax),%ebx
 8056088:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 805608b:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805608e:	8d 78 fd             	lea    0xfffffffd(%eax),%edi
 8056091:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 8056094:	8d 58 fc             	lea    0xfffffffc(%eax),%ebx
 8056097:	8b 4c 82 f4          	mov    0xfffffff4(%edx,%eax,4),%ecx
 805609b:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 805609e:	8b 74 82 f0          	mov    0xfffffff0(%edx,%eax,4),%esi
 80560a2:	39 f1                	cmp    %esi,%ecx
 80560a4:	72 4a                	jb     0x80560f0
 80560a6:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80560a9:	8d 7a ff             	lea    0xffffffff(%edx),%edi
 80560ac:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 80560af:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80560b2:	8b 5d 8c             	mov    0xffffff8c(%ebp),%ebx
 80560b5:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 80560b9:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 80560bc:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80560bf:	8d 7a ff             	lea    0xffffffff(%edx),%edi
 80560c2:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 80560c5:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80560c8:	8b 5d 90             	mov    0xffffff90(%ebp),%ebx
 80560cb:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 80560cf:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 80560d2:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80560d5:	8d 7a ff             	lea    0xffffffff(%edx),%edi
 80560d8:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80560db:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 80560de:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 80560e2:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 80560e5:	49                   	dec    %ecx
 80560e6:	39 f1                	cmp    %esi,%ecx
 80560e8:	73 bc                	jae    0x80560a6
 80560ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80560f0:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
 80560f7:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80560fa:	31 db                	xor    %ebx,%ebx
 80560fc:	8a 1f                	mov    (%edi),%bl
 80560fe:	0f be 47 01          	movsbl 0x1(%edi),%eax
 8056102:	c1 e0 08             	shl    $0x8,%eax
 8056105:	01 c3                	add    %eax,%ebx
 8056107:	8d 5c 3b 02          	lea    0x2(%ebx,%edi,1),%ebx
 805610b:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 805610e:	e9 51 ee ff ff       	jmp    0x8054f64
 8056113:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 8056116:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056119:	89 f0                	mov    %esi,%eax
 805611b:	29 c8                	sub    %ecx,%eax
 805611d:	8b 55 bc             	mov    0xffffffbc(%ebp),%edx
 8056120:	2b 55 c0             	sub    0xffffffc0(%ebp),%edx
 8056123:	42                   	inc    %edx
 8056124:	89 95 60 ff ff ff    	mov    %edx,0xffffff60(%ebp)
 805612a:	01 d2                	add    %edx,%edx
 805612c:	89 95 5c ff ff ff    	mov    %edx,0xffffff5c(%ebp)
 8056132:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8056138:	8d 54 17 04          	lea    0x4(%edi,%edx,1),%edx
 805613c:	39 d0                	cmp    %edx,%eax
 805613e:	73 64                	jae    0x80561a4
 8056140:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8056146:	8d 5c 1f 04          	lea    0x4(%edi,%ebx,1),%ebx
 805614a:	89 9d 5c ff ff ff    	mov    %ebx,0xffffff5c(%ebp)
 8056150:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 8056155:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 8056158:	8d 14 50             	lea    (%eax,%edx,2),%edx
 805615b:	39 d6                	cmp    %edx,%esi
 805615d:	0f 87 4d 01 00 00    	ja     0x80562b0
 8056163:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 805616a:	29 c4                	sub    %eax,%esp
 805616c:	89 e1                	mov    %esp,%ecx
 805616e:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 8056171:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 8056178:	50                   	push   %eax
 8056179:	52                   	push   %edx
 805617a:	51                   	push   %ecx
 805617b:	e8 9c 2f ff ff       	call   0x804911c
 8056180:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 8056183:	83 c4 0c             	add    $0xc,%esp
 8056186:	85 c0                	test   %eax,%eax
 8056188:	0f 84 22 01 00 00    	je     0x80562b0
 805618e:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 8056192:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 8056195:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056198:	89 f0                	mov    %esi,%eax
 805619a:	29 c8                	sub    %ecx,%eax
 805619c:	3b 85 5c ff ff ff    	cmp    0xffffff5c(%ebp),%eax
 80561a2:	72 ac                	jb     0x8056150
 80561a4:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 80561a7:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 80561aa:	39 de                	cmp    %ebx,%esi
 80561ac:	77 3e                	ja     0x80561ec
 80561ae:	89 f6                	mov    %esi,%esi
 80561b0:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80561b3:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80561b6:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 80561b9:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80561bc:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80561bf:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80561c2:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 80561c5:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80561c8:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 80561cb:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80561ce:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80561d1:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80561d4:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 80561d7:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80561da:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 80561dd:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80561e0:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80561e3:	46                   	inc    %esi
 80561e4:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80561e7:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 80561ea:	76 c4                	jbe    0x80561b0
 80561ec:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80561ef:	8b 5d c0             	mov    0xffffffc0(%ebp),%ebx
 80561f2:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 80561f5:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80561f8:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80561fb:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80561fe:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8056201:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8056204:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056207:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805620a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805620d:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
 8056214:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056217:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805621a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805621d:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
 8056224:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056227:	e9 cb fe ff ff       	jmp    0x80560f7
 805622c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056230:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 8056233:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056236:	89 f0                	mov    %esi,%eax
 8056238:	29 c8                	sub    %ecx,%eax
 805623a:	8b 55 bc             	mov    0xffffffbc(%ebp),%edx
 805623d:	2b 55 c0             	sub    0xffffffc0(%ebp),%edx
 8056240:	42                   	inc    %edx
 8056241:	89 95 60 ff ff ff    	mov    %edx,0xffffff60(%ebp)
 8056247:	01 d2                	add    %edx,%edx
 8056249:	89 95 5c ff ff ff    	mov    %edx,0xffffff5c(%ebp)
 805624f:	8b bd 60 ff ff ff    	mov    0xffffff60(%ebp),%edi
 8056255:	8d 54 17 04          	lea    0x4(%edi,%edx,1),%edx
 8056259:	39 d0                	cmp    %edx,%eax
 805625b:	73 75                	jae    0x80562d2
 805625d:	8b 9d 5c ff ff ff    	mov    0xffffff5c(%ebp),%ebx
 8056263:	8d 5c 1f 04          	lea    0x4(%edi,%ebx,1),%ebx
 8056267:	89 9d 5c ff ff ff    	mov    %ebx,0xffffff5c(%ebp)
 805626d:	8d 76 00             	lea    0x0(%esi),%esi
 8056270:	a1 cc b0 05 08       	mov    0x805b0cc,%eax
 8056275:	8d 14 c0             	lea    (%eax,%eax,8),%edx
 8056278:	8d 14 50             	lea    (%eax,%edx,2),%edx
 805627b:	39 d6                	cmp    %edx,%esi
 805627d:	77 31                	ja     0x80562b0
 805627f:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 8056286:	29 c4                	sub    %eax,%esp
 8056288:	89 e1                	mov    %esp,%ecx
 805628a:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805628d:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 8056294:	50                   	push   %eax
 8056295:	52                   	push   %edx
 8056296:	51                   	push   %ecx
 8056297:	e8 80 2e ff ff       	call   0x804911c
 805629c:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 805629f:	83 c4 0c             	add    $0xc,%esp
 80562a2:	85 c0                	test   %eax,%eax
 80562a4:	74 0a                	je     0x80562b0
 80562a6:	c1 65 f8 01          	shll   $0x1,0xfffffff8(%ebp)
 80562aa:	eb 14                	jmp    0x80562c0
 80562ac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80562b0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 80562b5:	e9 bb 06 00 00       	jmp    0x8056975
 80562ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80562c0:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 80562c3:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80562c6:	89 f0                	mov    %esi,%eax
 80562c8:	29 c8                	sub    %ecx,%eax
 80562ca:	3b 85 5c ff ff ff    	cmp    0xffffff5c(%ebp),%eax
 80562d0:	72 9e                	jb     0x8056270
 80562d2:	8b 75 c0             	mov    0xffffffc0(%ebp),%esi
 80562d5:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 80562d8:	39 de                	cmp    %ebx,%esi
 80562da:	77 40                	ja     0x805631c
 80562dc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80562e0:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80562e3:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80562e6:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 80562e9:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80562ec:	ff 45 fc             	incl   0xfffffffc(%ebp)
 80562ef:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 80562f2:	8b 5d b4             	mov    0xffffffb4(%ebp),%ebx
 80562f5:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 80562f8:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
 80562fb:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 80562fe:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056301:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056304:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8056307:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
 805630a:	8b 04 b7             	mov    (%edi,%esi,4),%eax
 805630d:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 8056310:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056313:	46                   	inc    %esi
 8056314:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056317:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 805631a:	76 c4                	jbe    0x80562e0
 805631c:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805631f:	8b 5d c0             	mov    0xffffffc0(%ebp),%ebx
 8056322:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
 8056325:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056328:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805632b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805632e:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8056331:	89 1c 90             	mov    %ebx,(%eax,%edx,4)
 8056334:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056337:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805633a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805633d:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
 8056344:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056347:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805634a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805634d:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
 8056354:	ff 45 fc             	incl   0xfffffffc(%ebp)
 8056357:	e9 08 ec ff ff       	jmp    0x8054f64
 805635c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056360:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8056363:	31 db                	xor    %ebx,%ebx
 8056365:	8a 5f 02             	mov    0x2(%edi),%bl
 8056368:	0f be 47 03          	movsbl 0x3(%edi),%eax
 805636c:	c1 e0 08             	shl    $0x8,%eax
 805636f:	01 c3                	add    %eax,%ebx
 8056371:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8056377:	85 db                	test   %ebx,%ebx
 8056379:	7e 2d                	jle    0x80563a8
 805637b:	4b                   	dec    %ebx
 805637c:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 8056382:	83 c7 02             	add    $0x2,%edi
 8056385:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 805638b:	88 1f                	mov    %bl,(%edi)
 805638d:	c1 bd 60 ff ff ff 08 	sarl   $0x8,0xffffff60(%ebp)
 8056394:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 805639a:	88 5f 01             	mov    %bl,0x1(%edi)
 805639d:	83 c7 02             	add    $0x2,%edi
 80563a0:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 80563a3:	e9 bc eb ff ff       	jmp    0x8054f64
 80563a8:	83 bd 60 ff ff ff 00 	cmpl   $0x0,0xffffff60(%ebp)
 80563af:	0f 85 af eb ff ff    	jne    0x8054f64
 80563b5:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80563b8:	c6 47 02 00          	movb   $0x0,0x2(%edi)
 80563bc:	c6 47 03 00          	movb   $0x0,0x3(%edi)
 80563c0:	e9 eb f8 ff ff       	jmp    0x8055cb0
 80563c5:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80563c8:	31 db                	xor    %ebx,%ebx
 80563ca:	8a 5f 02             	mov    0x2(%edi),%bl
 80563cd:	0f be 47 03          	movsbl 0x3(%edi),%eax
 80563d1:	c1 e0 08             	shl    $0x8,%eax
 80563d4:	01 c3                	add    %eax,%ebx
 80563d6:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 80563dc:	74 25                	je     0x8056403
 80563de:	4b                   	dec    %ebx
 80563df:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 80563e5:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 80563eb:	88 5f 02             	mov    %bl,0x2(%edi)
 80563ee:	c1 bd 60 ff ff ff 08 	sarl   $0x8,0xffffff60(%ebp)
 80563f5:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 80563fb:	88 5f 03             	mov    %bl,0x3(%edi)
 80563fe:	e9 f4 fc ff ff       	jmp    0x80560f7
 8056403:	83 45 d4 04          	addl   $0x4,0xffffffd4(%ebp)
 8056407:	e9 58 eb ff ff       	jmp    0x8054f64
 805640c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056410:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8056413:	31 db                	xor    %ebx,%ebx
 8056415:	8a 1f                	mov    (%edi),%bl
 8056417:	0f be 47 01          	movsbl 0x1(%edi),%eax
 805641b:	c1 e0 08             	shl    $0x8,%eax
 805641e:	01 c3                	add    %eax,%ebx
 8056420:	83 c7 02             	add    $0x2,%edi
 8056423:	89 fa                	mov    %edi,%edx
 8056425:	01 da                	add    %ebx,%edx
 8056427:	89 55 f0             	mov    %edx,0xfffffff0(%ebp)
 805642a:	31 db                	xor    %ebx,%ebx
 805642c:	8a 1f                	mov    (%edi),%bl
 805642e:	0f be 47 01          	movsbl 0x1(%edi),%eax
 8056432:	c1 e0 08             	shl    $0x8,%eax
 8056435:	01 c3                	add    %eax,%ebx
 8056437:	89 9d 60 ff ff ff    	mov    %ebx,0xffffff60(%ebp)
 805643d:	83 c7 02             	add    $0x2,%edi
 8056440:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8056443:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 8056449:	88 1a                	mov    %bl,(%edx)
 805644b:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 805644e:	c1 bd 60 ff ff ff 08 	sarl   $0x8,0xffffff60(%ebp)
 8056455:	8a 9d 60 ff ff ff    	mov    0xffffff60(%ebp),%bl
 805645b:	88 58 01             	mov    %bl,0x1(%eax)
 805645e:	e9 01 eb ff ff       	jmp    0x8054f64
 8056463:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8056467:	74 0e                	je     0x8056477
 8056469:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805646c:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 805646f:	0f 84 ef ea ff ff    	je     0x8054f64
 8056475:	eb 0c                	jmp    0x8056483
 8056477:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805647a:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 805647d:	0f 84 e1 ea ff ff    	je     0x8054f64
 8056483:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8056487:	0f 84 d7 ea ff ff    	je     0x8054f64
 805648d:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8056490:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056493:	0f 84 cb ea ff ff    	je     0x8054f64
 8056499:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 805649c:	4a                   	dec    %edx
 805649d:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 80564a2:	3b 55 ec             	cmp    0xffffffec(%ebp),%edx
 80564a5:	75 09                	jne    0x80564b0
 80564a7:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80564aa:	31 c0                	xor    %eax,%eax
 80564ac:	8a 03                	mov    (%ebx),%al
 80564ae:	eb 1a                	jmp    0x80564ca
 80564b0:	8b 45 14             	mov    0x14(%ebp),%eax
 80564b3:	48                   	dec    %eax
 80564b4:	39 c2                	cmp    %eax,%edx
 80564b6:	75 0a                	jne    0x80564c2
 80564b8:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80564bb:	31 c0                	xor    %eax,%eax
 80564bd:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80564c0:	eb 08                	jmp    0x80564ca
 80564c2:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80564c5:	31 c0                	xor    %eax,%eax
 80564c7:	8a 43 ff             	mov    0xffffffff(%ebx),%al
 80564ca:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80564ce:	0f 94 c2             	sete   %dl
 80564d1:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80564d4:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 80564d7:	75 07                	jne    0x80564e0
 80564d9:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80564dc:	eb 18                	jmp    0x80564f6
 80564de:	89 f6                	mov    %esi,%esi
 80564e0:	8b 45 14             	mov    0x14(%ebp),%eax
 80564e3:	48                   	dec    %eax
 80564e4:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 80564e7:	75 0a                	jne    0x80564f3
 80564e9:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80564ec:	31 c0                	xor    %eax,%eax
 80564ee:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80564f1:	eb 07                	jmp    0x80564fa
 80564f3:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80564f6:	31 c0                	xor    %eax,%eax
 80564f8:	8a 03                	mov    (%ebx),%al
 80564fa:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80564fe:	0f 94 c0             	sete   %al
 8056501:	38 c2                	cmp    %al,%dl
 8056503:	0f 85 5b ea ff ff    	jne    0x8054f64
 8056509:	e9 27 03 00 00       	jmp    0x8056835
 805650e:	89 f6                	mov    %esi,%esi
 8056510:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8056514:	74 0e                	je     0x8056524
 8056516:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8056519:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 805651c:	0f 84 13 03 00 00    	je     0x8056835
 8056522:	eb 0c                	jmp    0x8056530
 8056524:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8056527:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 805652a:	0f 84 05 03 00 00    	je     0x8056835
 8056530:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8056534:	0f 84 fb 02 00 00    	je     0x8056835
 805653a:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 805653d:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056540:	0f 84 ef 02 00 00    	je     0x8056835
 8056546:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 8056549:	4a                   	dec    %edx
 805654a:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 805654f:	3b 55 ec             	cmp    0xffffffec(%ebp),%edx
 8056552:	75 0c                	jne    0x8056560
 8056554:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8056557:	31 c0                	xor    %eax,%eax
 8056559:	8a 03                	mov    (%ebx),%al
 805655b:	eb 1d                	jmp    0x805657a
 805655d:	8d 76 00             	lea    0x0(%esi),%esi
 8056560:	8b 45 14             	mov    0x14(%ebp),%eax
 8056563:	48                   	dec    %eax
 8056564:	39 c2                	cmp    %eax,%edx
 8056566:	75 0a                	jne    0x8056572
 8056568:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805656b:	31 c0                	xor    %eax,%eax
 805656d:	8a 47 ff             	mov    0xffffffff(%edi),%al
 8056570:	eb 08                	jmp    0x805657a
 8056572:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8056575:	31 c0                	xor    %eax,%eax
 8056577:	8a 43 ff             	mov    0xffffffff(%ebx),%al
 805657a:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 805657e:	0f 94 c2             	sete   %dl
 8056581:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8056584:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056587:	75 07                	jne    0x8056590
 8056589:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805658c:	eb 18                	jmp    0x80565a6
 805658e:	89 f6                	mov    %esi,%esi
 8056590:	8b 45 14             	mov    0x14(%ebp),%eax
 8056593:	48                   	dec    %eax
 8056594:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 8056597:	75 0a                	jne    0x80565a3
 8056599:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805659c:	31 c0                	xor    %eax,%eax
 805659e:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80565a1:	eb 07                	jmp    0x80565aa
 80565a3:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80565a6:	31 c0                	xor    %eax,%eax
 80565a8:	8a 03                	mov    (%ebx),%al
 80565aa:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80565ae:	0f 94 c0             	sete   %al
 80565b1:	38 c2                	cmp    %al,%dl
 80565b3:	0f 85 7c 02 00 00    	jne    0x8056835
 80565b9:	e9 a6 e9 ff ff       	jmp    0x8054f64
 80565be:	89 f6                	mov    %esi,%esi
 80565c0:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 80565c5:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80565c8:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 80565cb:	75 05                	jne    0x80565d2
 80565cd:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80565d0:	eb 16                	jmp    0x80565e8
 80565d2:	8b 45 14             	mov    0x14(%ebp),%eax
 80565d5:	48                   	dec    %eax
 80565d6:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 80565d9:	75 0a                	jne    0x80565e5
 80565db:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80565de:	31 c0                	xor    %eax,%eax
 80565e0:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80565e3:	eb 07                	jmp    0x80565ec
 80565e5:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80565e8:	31 c0                	xor    %eax,%eax
 80565ea:	8a 03                	mov    (%ebx),%al
 80565ec:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80565f0:	0f 85 3f 02 00 00    	jne    0x8056835
 80565f6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80565fa:	74 14                	je     0x8056610
 80565fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
 80565ff:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056602:	0f 84 5c e9 ff ff    	je     0x8054f64
 8056608:	eb 12                	jmp    0x805661c
 805660a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056610:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8056613:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8056616:	0f 84 48 e9 ff ff    	je     0x8054f64
 805661c:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8056620:	0f 84 3e e9 ff ff    	je     0x8054f64
 8056626:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 8056629:	4a                   	dec    %edx
 805662a:	3b 55 ec             	cmp    0xffffffec(%ebp),%edx
 805662d:	75 09                	jne    0x8056638
 805662f:	8b 7d 14             	mov    0x14(%ebp),%edi
 8056632:	31 c0                	xor    %eax,%eax
 8056634:	8a 07                	mov    (%edi),%al
 8056636:	eb 20                	jmp    0x8056658
 8056638:	8b 45 14             	mov    0x14(%ebp),%eax
 805663b:	48                   	dec    %eax
 805663c:	39 c2                	cmp    %eax,%edx
 805663e:	75 10                	jne    0x8056650
 8056640:	8b 5d ec             	mov    0xffffffec(%ebp),%ebx
 8056643:	31 c0                	xor    %eax,%eax
 8056645:	8a 43 ff             	mov    0xffffffff(%ebx),%al
 8056648:	eb 0e                	jmp    0x8056658
 805664a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056650:	8b 7d dc             	mov    0xffffffdc(%ebp),%edi
 8056653:	31 c0                	xor    %eax,%eax
 8056655:	8a 47 ff             	mov    0xffffffff(%edi),%al
 8056658:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 805665c:	0f 85 02 e9 ff ff    	jne    0x8054f64
 8056662:	e9 ce 01 00 00       	jmp    0x8056835
 8056667:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 805666b:	74 13                	je     0x8056680
 805666d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8056670:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8056673:	75 17                	jne    0x805668c
 8056675:	e9 bb 01 00 00       	jmp    0x8056835
 805667a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056680:	8b 7d 14             	mov    0x14(%ebp),%edi
 8056683:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056686:	0f 84 a9 01 00 00    	je     0x8056835
 805668c:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
 8056690:	0f 84 9f 01 00 00    	je     0x8056835
 8056696:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 8056699:	4a                   	dec    %edx
 805669a:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 805669f:	3b 55 ec             	cmp    0xffffffec(%ebp),%edx
 80566a2:	75 0c                	jne    0x80566b0
 80566a4:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80566a7:	31 c0                	xor    %eax,%eax
 80566a9:	8a 03                	mov    (%ebx),%al
 80566ab:	eb 1d                	jmp    0x80566ca
 80566ad:	8d 76 00             	lea    0x0(%esi),%esi
 80566b0:	8b 45 14             	mov    0x14(%ebp),%eax
 80566b3:	48                   	dec    %eax
 80566b4:	39 c2                	cmp    %eax,%edx
 80566b6:	75 0a                	jne    0x80566c2
 80566b8:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80566bb:	31 c0                	xor    %eax,%eax
 80566bd:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80566c0:	eb 08                	jmp    0x80566ca
 80566c2:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80566c5:	31 c0                	xor    %eax,%eax
 80566c7:	8a 43 ff             	mov    0xffffffff(%ebx),%al
 80566ca:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80566ce:	0f 85 61 01 00 00    	jne    0x8056835
 80566d4:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80566d7:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 80566da:	75 05                	jne    0x80566e1
 80566dc:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80566df:	eb 16                	jmp    0x80566f7
 80566e1:	8b 45 14             	mov    0x14(%ebp),%eax
 80566e4:	48                   	dec    %eax
 80566e5:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 80566e8:	75 0a                	jne    0x80566f4
 80566ea:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80566ed:	31 c0                	xor    %eax,%eax
 80566ef:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80566f2:	eb 07                	jmp    0x80566fb
 80566f4:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80566f7:	31 c0                	xor    %eax,%eax
 80566f9:	8a 03                	mov    (%ebx),%al
 80566fb:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80566ff:	0f 85 5f e8 ff ff    	jne    0x8054f64
 8056705:	8b 7d e8             	mov    0xffffffe8(%ebp),%edi
 8056708:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 805670b:	0f 84 53 e8 ff ff    	je     0x8054f64
 8056711:	e9 1f 01 00 00       	jmp    0x8056835
 8056716:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 8056719:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 805671c:	75 1b                	jne    0x8056739
 805671e:	89 f6                	mov    %esi,%esi
 8056720:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 8056723:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 8056726:	0f 84 09 01 00 00    	je     0x8056835
 805672c:	8b 5d 14             	mov    0x14(%ebp),%ebx
 805672f:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 8056732:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 8056735:	39 fb                	cmp    %edi,%ebx
 8056737:	74 e7                	je     0x8056720
 8056739:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 805673e:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8056741:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 8056744:	75 0a                	jne    0x8056750
 8056746:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8056749:	eb 1b                	jmp    0x8056766
 805674b:	90                   	nop    
 805674c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056750:	8b 45 14             	mov    0x14(%ebp),%eax
 8056753:	48                   	dec    %eax
 8056754:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 8056757:	75 0a                	jne    0x8056763
 8056759:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805675c:	31 c0                	xor    %eax,%eax
 805675e:	8a 47 ff             	mov    0xffffffff(%edi),%al
 8056761:	eb 07                	jmp    0x805676a
 8056763:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 8056766:	31 c0                	xor    %eax,%eax
 8056768:	8a 03                	mov    (%ebx),%al
 805676a:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 805676e:	0f 85 c1 00 00 00    	jne    0x8056835
 8056774:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 8056778:	0f 85 a3 00 00 00    	jne    0x8056821
 805677e:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 8056785:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 8056788:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 805678b:	39 d8                	cmp    %ebx,%eax
 805678d:	0f 87 8e 00 00 00    	ja     0x8056821
 8056793:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8056796:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 805679a:	40                   	inc    %eax
 805679b:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 805679e:	76 f3                	jbe    0x8056793
 80567a0:	eb 7f                	jmp    0x8056821
 80567a2:	8b 5d d8             	mov    0xffffffd8(%ebp),%ebx
 80567a5:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 80567a8:	75 1b                	jne    0x80567c5
 80567aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80567b0:	8b 7d e0             	mov    0xffffffe0(%ebp),%edi
 80567b3:	39 7d d8             	cmp    %edi,0xffffffd8(%ebp)
 80567b6:	74 7d                	je     0x8056835
 80567b8:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80567bb:	89 5d dc             	mov    %ebx,0xffffffdc(%ebp)
 80567be:	89 7d d8             	mov    %edi,0xffffffd8(%ebp)
 80567c1:	39 fb                	cmp    %edi,%ebx
 80567c3:	74 eb                	je     0x80567b0
 80567c5:	b9 60 bb 05 08       	mov    $0x805bb60,%ecx
 80567ca:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80567cd:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 80567d0:	75 05                	jne    0x80567d7
 80567d2:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80567d5:	eb 1c                	jmp    0x80567f3
 80567d7:	8b 45 14             	mov    0x14(%ebp),%eax
 80567da:	48                   	dec    %eax
 80567db:	39 45 dc             	cmp    %eax,0xffffffdc(%ebp)
 80567de:	75 10                	jne    0x80567f0
 80567e0:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 80567e3:	31 c0                	xor    %eax,%eax
 80567e5:	8a 47 ff             	mov    0xffffffff(%edi),%al
 80567e8:	eb 0d                	jmp    0x80567f7
 80567ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80567f0:	8b 5d dc             	mov    0xffffffdc(%ebp),%ebx
 80567f3:	31 c0                	xor    %eax,%eax
 80567f5:	8a 03                	mov    (%ebx),%al
 80567f7:	80 3c 08 01          	cmpb   $0x1,(%eax,%ecx,1)
 80567fb:	74 38                	je     0x8056835
 80567fd:	83 7d 94 00          	cmpl   $0x0,0xffffff94(%ebp)
 8056801:	75 1e                	jne    0x8056821
 8056803:	c7 45 94 01 00 00 00 	movl   $0x1,0xffffff94(%ebp)
 805680a:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
 805680d:	8b 5d bc             	mov    0xffffffbc(%ebp),%ebx
 8056810:	39 d8                	cmp    %ebx,%eax
 8056812:	77 0d                	ja     0x8056821
 8056814:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8056817:	80 0c 87 18          	orb    $0x18,(%edi,%eax,4)
 805681b:	40                   	inc    %eax
 805681c:	3b 45 bc             	cmp    0xffffffbc(%ebp),%eax
 805681f:	76 f3                	jbe    0x8056814
 8056821:	ff 45 dc             	incl   0xffffffdc(%ebp)
 8056824:	e9 3b e7 ff ff       	jmp    0x8054f64
 8056829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8056830:	e8 17 28 ff ff       	call   0x804904c
 8056835:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056838:	85 c0                	test   %eax,%eax
 805683a:	0f 84 20 01 00 00    	je     0x8056960
 8056840:	8d 58 ff             	lea    0xffffffff(%eax),%ebx
 8056843:	8b 4d f4             	mov    0xfffffff4(%ebp),%ecx
 8056846:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 8056849:	8b 54 81 fc          	mov    0xfffffffc(%ecx,%eax,4),%edx
 805684d:	85 d2                	test   %edx,%edx
 805684f:	74 03                	je     0x8056854
 8056851:	89 55 dc             	mov    %edx,0xffffffdc(%ebp)
 8056854:	8d 78 fe             	lea    0xfffffffe(%eax),%edi
 8056857:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 805685a:	8b 5c 81 f8          	mov    0xfffffff8(%ecx,%eax,4),%ebx
 805685e:	89 5d d4             	mov    %ebx,0xffffffd4(%ebp)
 8056861:	8d 78 fd             	lea    0xfffffffd(%eax),%edi
 8056864:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 8056867:	8b 5c 81 f4          	mov    0xfffffff4(%ecx,%eax,4),%ebx
 805686b:	89 5d bc             	mov    %ebx,0xffffffbc(%ebp)
 805686e:	8d 78 fc             	lea    0xfffffffc(%eax),%edi
 8056871:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 8056874:	8b 44 81 f0          	mov    0xfffffff0(%ecx,%eax,4),%eax
 8056878:	89 45 c0             	mov    %eax,0xffffffc0(%ebp)
 805687b:	89 d9                	mov    %ebx,%ecx
 805687d:	39 c1                	cmp    %eax,%ecx
 805687f:	72 4f                	jb     0x80568d0
 8056881:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8056884:	8d 5a ff             	lea    0xffffffff(%edx),%ebx
 8056887:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 805688a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 805688d:	8b 7d a8             	mov    0xffffffa8(%ebp),%edi
 8056890:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 8056894:	89 04 8f             	mov    %eax,(%edi,%ecx,4)
 8056897:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 805689a:	8d 5a ff             	lea    0xffffffff(%edx),%ebx
 805689d:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 80568a0:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80568a3:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 80568a6:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 80568aa:	89 04 8f             	mov    %eax,(%edi,%ecx,4)
 80568ad:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 80568b0:	8d 5a ff             	lea    0xffffffff(%edx),%ebx
 80568b3:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 80568b6:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80568b9:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 80568bc:	8b 44 90 fc          	mov    0xfffffffc(%eax,%edx,4),%eax
 80568c0:	89 04 8f             	mov    %eax,(%edi,%ecx,4)
 80568c3:	49                   	dec    %ecx
 80568c4:	3b 4d c0             	cmp    0xffffffc0(%ebp),%ecx
 80568c7:	73 b8                	jae    0x8056881
 80568c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80568d0:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
 80568d7:	83 7d d4 00          	cmpl   $0x0,0xffffffd4(%ebp)
 80568db:	0f 84 54 ff ff ff    	je     0x8056835
 80568e1:	8b 5d d0             	mov    0xffffffd0(%ebp),%ebx
 80568e4:	39 5d d4             	cmp    %ebx,0xffffffd4(%ebp)
 80568e7:	73 54                	jae    0x805693d
 80568e9:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 80568ec:	31 d2                	xor    %edx,%edx
 80568ee:	8a 07                	mov    (%edi),%al
 80568f0:	3c 12                	cmp    $0x12,%al
 80568f2:	77 0c                	ja     0x8056900
 80568f4:	3c 11                	cmp    $0x11,%al
 80568f6:	73 0e                	jae    0x8056906
 80568f8:	3c 0d                	cmp    $0xd,%al
 80568fa:	74 0a                	je     0x8056906
 80568fc:	eb 3f                	jmp    0x805693d
 80568fe:	89 f6                	mov    %esi,%esi
 8056900:	3c 16                	cmp    $0x16,%al
 8056902:	75 39                	jne    0x805693d
 8056904:	b2 01                	mov    $0x1,%dl
 8056906:	8b 45 d4             	mov    0xffffffd4(%ebp),%eax
 8056909:	40                   	inc    %eax
 805690a:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 805690d:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8056910:	31 db                	xor    %ebx,%ebx
 8056912:	0f be 40 01          	movsbl 0x1(%eax),%eax
 8056916:	c1 e0 08             	shl    $0x8,%eax
 8056919:	8a 5f 01             	mov    0x1(%edi),%bl
 805691c:	01 c3                	add    %eax,%ebx
 805691e:	8d 44 3b 03          	lea    0x3(%ebx,%edi,1),%eax
 8056922:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 8056925:	84 d2                	test   %dl,%dl
 8056927:	74 0b                	je     0x8056934
 8056929:	80 38 15             	cmpb   $0x15,(%eax)
 805692c:	0f 84 03 ff ff ff    	je     0x8056835
 8056932:	eb 09                	jmp    0x805693d
 8056934:	80 38 0f             	cmpb   $0xf,(%eax)
 8056937:	0f 84 f8 fe ff ff    	je     0x8056835
 805693d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8056940:	39 5d dc             	cmp    %ebx,0xffffffdc(%ebp)
 8056943:	0f 82 1b e6 ff ff    	jb     0x8054f64
 8056949:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 805694c:	39 7d dc             	cmp    %edi,0xffffffdc(%ebp)
 805694f:	0f 87 0f e6 ff ff    	ja     0x8054f64
 8056955:	8b 5d e4             	mov    0xffffffe4(%ebp),%ebx
 8056958:	e9 04 e6 ff ff       	jmp    0x8054f61
 805695d:	8d 76 00             	lea    0x0(%esi),%esi
 8056960:	83 7d a4 00          	cmpl   $0x0,0xffffffa4(%ebp)
 8056964:	0f 85 c1 e6 ff ff    	jne    0x805502b
 805696a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056970:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8056975:	8d a5 50 ff ff ff    	lea    0xffffff50(%ebp),%esp
 805697b:	5b                   	pop    %ebx
 805697c:	5e                   	pop    %esi
 805697d:	5f                   	pop    %edi
 805697e:	89 ec                	mov    %ebp,%esp
 8056980:	5d                   	pop    %ebp
 8056981:	c3                   	ret    
 8056982:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8056989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8056990:	55                   	push   %ebp
 8056991:	89 e5                	mov    %esp,%ebp
 8056993:	83 ec 04             	sub    $0x4,%esp
 8056996:	57                   	push   %edi
 8056997:	56                   	push   %esi
 8056998:	53                   	push   %ebx
 8056999:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805699c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 805699f:	8b 75 10             	mov    0x10(%ebp),%esi
 80569a2:	8b 01                	mov    (%ecx),%eax
 80569a4:	83 c0 02             	add    $0x2,%eax
 80569a7:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 80569aa:	89 c2                	mov    %eax,%edx
 80569ac:	39 fa                	cmp    %edi,%edx
 80569ae:	0f 83 e9 00 00 00    	jae    0x8056a9d
 80569b4:	8a 02                	mov    (%edx),%al
 80569b6:	3c 07                	cmp    $0x7,%al
 80569b8:	0f 84 b2 00 00 00    	je     0x8056a70
 80569be:	3c 0f                	cmp    $0xf,%al
 80569c0:	0f 85 ba 00 00 00    	jne    0x8056a80
 80569c6:	8d 42 01             	lea    0x1(%edx),%eax
 80569c9:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 80569cc:	31 db                	xor    %ebx,%ebx
 80569ce:	8a 5a 01             	mov    0x1(%edx),%bl
 80569d1:	0f be 40 01          	movsbl 0x1(%eax),%eax
 80569d5:	c1 e0 08             	shl    $0x8,%eax
 80569d8:	83 c2 03             	add    $0x3,%edx
 80569db:	89 55 fc             	mov    %edx,0xfffffffc(%ebp)
 80569de:	01 c3                	add    %eax,%ebx
 80569e0:	0f 88 ac 00 00 00    	js     0x8056a92
 80569e6:	80 7c 1a fd 0e       	cmpb   $0xe,0xfffffffd(%edx,%ebx,1)
 80569eb:	75 57                	jne    0x8056a44
 80569ed:	8d 76 00             	lea    0x0(%esi),%esi
 80569f0:	56                   	push   %esi
 80569f1:	8d 44 13 fd          	lea    0xfffffffd(%ebx,%edx,1),%eax
 80569f5:	50                   	push   %eax
 80569f6:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80569f9:	50                   	push   %eax
 80569fa:	e8 b1 00 00 00       	call   0x8056ab0
 80569ff:	83 c4 0c             	add    $0xc,%esp
 8056a02:	84 c0                	test   %al,%al
 8056a04:	0f 84 93 00 00 00    	je     0x8056a9d
 8056a0a:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056a0d:	01 d8                	add    %ebx,%eax
 8056a0f:	89 c2                	mov    %eax,%edx
 8056a11:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056a14:	80 3a 0f             	cmpb   $0xf,(%edx)
 8056a17:	75 2b                	jne    0x8056a44
 8056a19:	8d 42 01             	lea    0x1(%edx),%eax
 8056a1c:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056a1f:	31 db                	xor    %ebx,%ebx
 8056a21:	8a 5a 01             	mov    0x1(%edx),%bl
 8056a24:	0f be 40 01          	movsbl 0x1(%eax),%eax
 8056a28:	c1 e0 08             	shl    $0x8,%eax
 8056a2b:	01 c3                	add    %eax,%ebx
 8056a2d:	8d 42 03             	lea    0x3(%edx),%eax
 8056a30:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056a33:	89 c2                	mov    %eax,%edx
 8056a35:	80 7c 1a fd 0e       	cmpb   $0xe,0xfffffffd(%edx,%ebx,1)
 8056a3a:	74 b4                	je     0x80569f0
 8056a3c:	8d 42 fd             	lea    0xfffffffd(%edx),%eax
 8056a3f:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056a42:	89 c2                	mov    %eax,%edx
 8056a44:	31 db                	xor    %ebx,%ebx
 8056a46:	8a 5a fe             	mov    0xfffffffe(%edx),%bl
 8056a49:	0f be 42 ff          	movsbl 0xffffffff(%edx),%eax
 8056a4d:	c1 e0 08             	shl    $0x8,%eax
 8056a50:	01 c3                	add    %eax,%ebx
 8056a52:	56                   	push   %esi
 8056a53:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8056a56:	8d 04 13             	lea    (%ebx,%edx,1),%eax
 8056a59:	50                   	push   %eax
 8056a5a:	52                   	push   %edx
 8056a5b:	e8 50 00 00 00       	call   0x8056ab0
 8056a60:	83 c4 0c             	add    $0xc,%esp
 8056a63:	84 c0                	test   %al,%al
 8056a65:	74 36                	je     0x8056a9d
 8056a67:	01 5d fc             	add    %ebx,0xfffffffc(%ebp)
 8056a6a:	eb 26                	jmp    0x8056a92
 8056a6c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056a70:	83 c2 02             	add    $0x2,%edx
 8056a73:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8056a76:	b8 01 00 00 00       	mov    $0x1,%eax
 8056a7b:	89 11                	mov    %edx,(%ecx)
 8056a7d:	eb 20                	jmp    0x8056a9f
 8056a7f:	90                   	nop    
 8056a80:	56                   	push   %esi
 8056a81:	57                   	push   %edi
 8056a82:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8056a85:	50                   	push   %eax
 8056a86:	e8 95 00 00 00       	call   0x8056b20
 8056a8b:	83 c4 0c             	add    $0xc,%esp
 8056a8e:	84 c0                	test   %al,%al
 8056a90:	74 0b                	je     0x8056a9d
 8056a92:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8056a95:	39 fa                	cmp    %edi,%edx
 8056a97:	0f 82 17 ff ff ff    	jb     0x80569b4
 8056a9d:	31 c0                	xor    %eax,%eax
 8056a9f:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 8056aa2:	5b                   	pop    %ebx
 8056aa3:	5e                   	pop    %esi
 8056aa4:	5f                   	pop    %edi
 8056aa5:	89 ec                	mov    %ebp,%esp
 8056aa7:	5d                   	pop    %ebp
 8056aa8:	c3                   	ret    
 8056aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8056ab0:	55                   	push   %ebp
 8056ab1:	89 e5                	mov    %esp,%ebp
 8056ab3:	83 ec 04             	sub    $0x4,%esp
 8056ab6:	56                   	push   %esi
 8056ab7:	53                   	push   %ebx
 8056ab8:	8b 45 08             	mov    0x8(%ebp),%eax
 8056abb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8056abe:	8b 75 10             	mov    0x10(%ebp),%esi
 8056ac1:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056ac4:	89 c1                	mov    %eax,%ecx
 8056ac6:	39 d9                	cmp    %ebx,%ecx
 8056ac8:	73 48                	jae    0x8056b12
 8056aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056ad0:	80 39 0f             	cmpb   $0xf,(%ecx)
 8056ad3:	74 1b                	je     0x8056af0
 8056ad5:	56                   	push   %esi
 8056ad6:	53                   	push   %ebx
 8056ad7:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8056ada:	50                   	push   %eax
 8056adb:	e8 40 00 00 00       	call   0x8056b20
 8056ae0:	83 c4 0c             	add    $0xc,%esp
 8056ae3:	84 c0                	test   %al,%al
 8056ae5:	75 24                	jne    0x8056b0b
 8056ae7:	31 c0                	xor    %eax,%eax
 8056ae9:	eb 2c                	jmp    0x8056b17
 8056aeb:	90                   	nop    
 8056aec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056af0:	8d 41 01             	lea    0x1(%ecx),%eax
 8056af3:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056af6:	31 d2                	xor    %edx,%edx
 8056af8:	8a 51 01             	mov    0x1(%ecx),%dl
 8056afb:	0f be 40 01          	movsbl 0x1(%eax),%eax
 8056aff:	c1 e0 08             	shl    $0x8,%eax
 8056b02:	01 c2                	add    %eax,%edx
 8056b04:	8d 44 0a 03          	lea    0x3(%edx,%ecx,1),%eax
 8056b08:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056b0b:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056b0e:	39 d9                	cmp    %ebx,%ecx
 8056b10:	72 be                	jb     0x8056ad0
 8056b12:	b8 01 00 00 00       	mov    $0x1,%eax
 8056b17:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8056b1a:	5b                   	pop    %ebx
 8056b1b:	5e                   	pop    %esi
 8056b1c:	89 ec                	mov    %ebp,%esp
 8056b1e:	5d                   	pop    %ebp
 8056b1f:	c3                   	ret    
 8056b20:	55                   	push   %ebp
 8056b21:	89 e5                	mov    %esp,%ebp
 8056b23:	83 ec 04             	sub    $0x4,%esp
 8056b26:	57                   	push   %edi
 8056b27:	56                   	push   %esi
 8056b28:	31 d2                	xor    %edx,%edx
 8056b2a:	53                   	push   %ebx
 8056b2b:	8b 7d 08             	mov    0x8(%ebp),%edi
 8056b2e:	8b 75 10             	mov    0x10(%ebp),%esi
 8056b31:	8b 07                	mov    (%edi),%eax
 8056b33:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056b36:	8a 10                	mov    (%eax),%dl
 8056b38:	40                   	inc    %eax
 8056b39:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056b3c:	83 fa 1d             	cmp    $0x1d,%edx
 8056b3f:	77 3e                	ja     0x8056b7f
 8056b41:	ff 24 95 e0 9a 05 08 	jmp    *0x8059ae0(,%edx,4)
 8056b48:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056b4b:	31 db                	xor    %ebx,%ebx
 8056b4d:	8a 18                	mov    (%eax),%bl
 8056b4f:	56                   	push   %esi
 8056b50:	8b 45 0c             	mov    0xc(%ebp),%eax
 8056b53:	50                   	push   %eax
 8056b54:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8056b57:	50                   	push   %eax
 8056b58:	e8 33 fe ff ff       	call   0x8056990
 8056b5d:	88 c1                	mov    %al,%cl
 8056b5f:	31 c0                	xor    %eax,%eax
 8056b61:	8a 04 9e             	mov    (%esi,%ebx,4),%al
 8056b64:	83 e0 03             	and    $0x3,%eax
 8056b67:	83 f8 03             	cmp    $0x3,%eax
 8056b6a:	75 0f                	jne    0x8056b7b
 8056b6c:	88 ca                	mov    %cl,%dl
 8056b6e:	80 e2 03             	and    $0x3,%dl
 8056b71:	8a 04 9e             	mov    (%esi,%ebx,4),%al
 8056b74:	24 fc                	and    $0xfc,%al
 8056b76:	08 d0                	or     %dl,%al
 8056b78:	88 04 9e             	mov    %al,(%esi,%ebx,4)
 8056b7b:	84 c9                	test   %cl,%cl
 8056b7d:	75 79                	jne    0x8056bf8
 8056b7f:	31 c0                	xor    %eax,%eax
 8056b81:	e9 7f 00 00 00       	jmp    0x8056c05
 8056b86:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056b89:	31 c9                	xor    %ecx,%ecx
 8056b8b:	8a 08                	mov    (%eax),%cl
 8056b8d:	0f be 50 01          	movsbl 0x1(%eax),%edx
 8056b91:	c1 e2 08             	shl    $0x8,%edx
 8056b94:	83 c0 02             	add    $0x2,%eax
 8056b97:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056b9a:	01 d1                	add    %edx,%ecx
 8056b9c:	78 e1                	js     0x8056b7f
 8056b9e:	01 c8                	add    %ecx,%eax
 8056ba0:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056ba3:	eb 53                	jmp    0x8056bf8
 8056ba5:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8056ba8:	8d 5a 02             	lea    0x2(%edx),%ebx
 8056bab:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 8056bae:	31 c9                	xor    %ecx,%ecx
 8056bb0:	8a 4a 02             	mov    0x2(%edx),%cl
 8056bb3:	0f be 43 01          	movsbl 0x1(%ebx),%eax
 8056bb7:	c1 e0 08             	shl    $0x8,%eax
 8056bba:	01 c1                	add    %eax,%ecx
 8056bbc:	8d 7a 04             	lea    0x4(%edx),%edi
 8056bbf:	89 7d fc             	mov    %edi,0xfffffffc(%ebp)
 8056bc2:	85 c9                	test   %ecx,%ecx
 8056bc4:	75 b9                	jne    0x8056b7f
 8056bc6:	89 55 fc             	mov    %edx,0xfffffffc(%ebp)
 8056bc9:	31 c9                	xor    %ecx,%ecx
 8056bcb:	8a 0a                	mov    (%edx),%cl
 8056bcd:	0f be 42 01          	movsbl 0x1(%edx),%eax
 8056bd1:	c1 e0 08             	shl    $0x8,%eax
 8056bd4:	01 c1                	add    %eax,%ecx
 8056bd6:	01 cb                	add    %ecx,%ebx
 8056bd8:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 8056bdb:	eb 1b                	jmp    0x8056bf8
 8056bdd:	8d 76 00             	lea    0x0(%esi),%esi
 8056be0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056be3:	8a 00                	mov    (%eax),%al
 8056be5:	25 ff 00 00 00       	and    $0xff,%eax
 8056bea:	f6 04 86 03          	testb  $0x3,(%esi,%eax,4)
 8056bee:	75 08                	jne    0x8056bf8
 8056bf0:	eb 8d                	jmp    0x8056b7f
 8056bf2:	83 45 fc 04          	addl   $0x4,0xfffffffc(%ebp)
 8056bf6:	eb 87                	jmp    0x8056b7f
 8056bf8:	8b 7d 08             	mov    0x8(%ebp),%edi
 8056bfb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8056bfe:	89 07                	mov    %eax,(%edi)
 8056c00:	b8 01 00 00 00       	mov    $0x1,%eax
 8056c05:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 8056c08:	5b                   	pop    %ebx
 8056c09:	5e                   	pop    %esi
 8056c0a:	5f                   	pop    %edi
 8056c0b:	89 ec                	mov    %ebp,%esp
 8056c0d:	5d                   	pop    %ebp
 8056c0e:	c3                   	ret    
 8056c0f:	90                   	nop    
 8056c10:	55                   	push   %ebp
 8056c11:	89 e5                	mov    %esp,%ebp
 8056c13:	57                   	push   %edi
 8056c14:	56                   	push   %esi
 8056c15:	53                   	push   %ebx
 8056c16:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8056c19:	8b 7d 14             	mov    0x14(%ebp),%edi
 8056c1c:	8b 75 08             	mov    0x8(%ebp),%esi
 8056c1f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8056c22:	85 c9                	test   %ecx,%ecx
 8056c24:	74 1d                	je     0x8056c43
 8056c26:	31 c0                	xor    %eax,%eax
 8056c28:	8a 06                	mov    (%esi),%al
 8056c2a:	31 d2                	xor    %edx,%edx
 8056c2c:	8a 13                	mov    (%ebx),%dl
 8056c2e:	8a 14 3a             	mov    (%edx,%edi,1),%dl
 8056c31:	43                   	inc    %ebx
 8056c32:	46                   	inc    %esi
 8056c33:	38 14 38             	cmp    %dl,(%eax,%edi,1)
 8056c36:	74 08                	je     0x8056c40
 8056c38:	b8 01 00 00 00       	mov    $0x1,%eax
 8056c3d:	eb 06                	jmp    0x8056c45
 8056c3f:	90                   	nop    
 8056c40:	49                   	dec    %ecx
 8056c41:	75 e3                	jne    0x8056c26
 8056c43:	31 c0                	xor    %eax,%eax
 8056c45:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8056c48:	5b                   	pop    %ebx
 8056c49:	5e                   	pop    %esi
 8056c4a:	5f                   	pop    %edi
 8056c4b:	89 ec                	mov    %ebp,%esp
 8056c4d:	5d                   	pop    %ebp
 8056c4e:	c3                   	ret    
 8056c4f:	90                   	nop    
 8056c50:	55                   	push   %ebp
 8056c51:	89 e5                	mov    %esp,%ebp
 8056c53:	53                   	push   %ebx
 8056c54:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8056c57:	8b 45 10             	mov    0x10(%ebp),%eax
 8056c5a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8056c5d:	8a 50 1c             	mov    0x1c(%eax),%dl
 8056c60:	80 e2 e9             	and    $0xe9,%dl
 8056c63:	80 ca 80             	or     $0x80,%dl
 8056c66:	88 50 1c             	mov    %dl,0x1c(%eax)
 8056c69:	50                   	push   %eax
 8056c6a:	a1 38 be 05 08       	mov    0x805be38,%eax
 8056c6f:	50                   	push   %eax
 8056c70:	51                   	push   %ecx
 8056c71:	53                   	push   %ebx
 8056c72:	e8 c9 a8 ff ff       	call   0x8051540
 8056c77:	83 c4 10             	add    $0x10,%esp
 8056c7a:	85 c0                	test   %eax,%eax
 8056c7c:	75 04                	jne    0x8056c82
 8056c7e:	31 c0                	xor    %eax,%eax
 8056c80:	eb 11                	jmp    0x8056c93
 8056c82:	6a 05                	push   $0x5
 8056c84:	8b 04 85 88 b0 05 08 	mov    0x805b088(,%eax,4),%eax
 8056c8b:	50                   	push   %eax
 8056c8c:	6a 00                	push   $0x0
 8056c8e:	e8 29 25 ff ff       	call   0x80491bc
 8056c93:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8056c96:	89 ec                	mov    %ebp,%esp
 8056c98:	5d                   	pop    %ebp
 8056c99:	c3                   	ret    
 8056c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8056ca0:	55                   	push   %ebp
 8056ca1:	89 e5                	mov    %esp,%ebp
 8056ca3:	83 ec 04             	sub    $0x4,%esp
 8056ca6:	57                   	push   %edi
 8056ca7:	56                   	push   %esi
 8056ca8:	53                   	push   %ebx
 8056ca9:	8b 75 08             	mov    0x8(%ebp),%esi
 8056cac:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8056caf:	f6 c3 01             	test   $0x1,%bl
 8056cb2:	74 0c                	je     0x8056cc0
 8056cb4:	bf dc b2 03 00       	mov    $0x3b2dc,%edi
 8056cb9:	eb 0a                	jmp    0x8056cc5
 8056cbb:	90                   	nop    
 8056cbc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056cc0:	bf c6 02 01 00       	mov    $0x102c6,%edi
 8056cc5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
 8056ccb:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
 8056cd2:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
 8056cd9:	68 00 01 00 00       	push   $0x100
 8056cde:	e8 29 23 ff ff       	call   0x804900c
 8056ce3:	89 46 10             	mov    %eax,0x10(%esi)
 8056ce6:	83 c4 04             	add    $0x4,%esp
 8056ce9:	f6 c3 02             	test   $0x2,%bl
 8056cec:	74 69                	je     0x8056d57
 8056cee:	68 00 01 00 00       	push   $0x100
 8056cf3:	e8 14 23 ff ff       	call   0x804900c
 8056cf8:	89 46 14             	mov    %eax,0x14(%esi)
 8056cfb:	83 c4 04             	add    $0x4,%esp
 8056cfe:	85 c0                	test   %eax,%eax
 8056d00:	75 0e                	jne    0x8056d10
 8056d02:	b8 0c 00 00 00       	mov    $0xc,%eax
 8056d07:	e9 09 01 00 00       	jmp    0x8056e15
 8056d0c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056d10:	31 d2                	xor    %edx,%edx
 8056d12:	8b 4e 14             	mov    0x14(%esi),%ecx
 8056d15:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 8056d18:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8056d1d:	f6 44 50 01 01       	testb  $0x1,0x1(%eax,%edx,2)
 8056d22:	74 20                	je     0x8056d44
 8056d24:	8d 82 80 00 00 00    	lea    0x80(%edx),%eax
 8056d2a:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 8056d2f:	77 0f                	ja     0x8056d40
 8056d31:	a1 c0 b2 05 08       	mov    0x805b2c0,%eax
 8056d36:	8b 04 90             	mov    (%eax,%edx,4),%eax
 8056d39:	eb 0b                	jmp    0x8056d46
 8056d3b:	90                   	nop    
 8056d3c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8056d40:	89 d0                	mov    %edx,%eax
 8056d42:	eb 02                	jmp    0x8056d46
 8056d44:	88 d0                	mov    %dl,%al
 8056d46:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
 8056d49:	88 04 0a             	mov    %al,(%edx,%ecx,1)
 8056d4c:	42                   	inc    %edx
 8056d4d:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 8056d53:	76 bd                	jbe    0x8056d12
 8056d55:	eb 07                	jmp    0x8056d5e
 8056d57:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
 8056d5e:	f6 c3 04             	test   $0x4,%bl
 8056d61:	74 0f                	je     0x8056d72
 8056d63:	83 e7 bf             	and    $0xffffffbf,%edi
 8056d66:	81 cf 00 01 00 00    	or     $0x100,%edi
 8056d6c:	80 4e 1c 80          	orb    $0x80,0x1c(%esi)
 8056d70:	eb 04                	jmp    0x8056d76
 8056d72:	80 66 1c 7f          	andb   $0x7f,0x1c(%esi)
 8056d76:	c1 eb 03             	shr    $0x3,%ebx
 8056d79:	88 d8                	mov    %bl,%al
 8056d7b:	24 01                	and    $0x1,%al
 8056d7d:	c0 e0 04             	shl    $0x4,%al
 8056d80:	8a 56 1c             	mov    0x1c(%esi),%dl
 8056d83:	80 e2 ef             	and    $0xef,%dl
 8056d86:	08 c2                	or     %al,%dl
 8056d88:	88 56 1c             	mov    %dl,0x1c(%esi)
 8056d8b:	56                   	push   %esi
 8056d8c:	57                   	push   %edi
 8056d8d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8056d90:	89 d0                	mov    %edx,%eax
 8056d92:	83 e2 03             	and    $0x3,%edx
 8056d95:	74 16                	je     0x8056dad
 8056d97:	7a 0f                	jp     0x8056da8
 8056d99:	83 fa 02             	cmp    $0x2,%edx
 8056d9c:	74 05                	je     0x8056da3
 8056d9e:	38 30                	cmp    %dh,(%eax)
 8056da0:	74 2d                	je     0x8056dcf
 8056da2:	40                   	inc    %eax
 8056da3:	38 30                	cmp    %dh,(%eax)
 8056da5:	74 28                	je     0x8056dcf
 8056da7:	40                   	inc    %eax
 8056da8:	38 30                	cmp    %dh,(%eax)
 8056daa:	74 23                	je     0x8056dcf
 8056dac:	40                   	inc    %eax
 8056dad:	8b 10                	mov    (%eax),%edx
 8056daf:	84 d2                	test   %dl,%dl
 8056db1:	74 1c                	je     0x8056dcf
 8056db3:	84 f6                	test   %dh,%dh
 8056db5:	74 17                	je     0x8056dce
 8056db7:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 8056dbd:	74 0e                	je     0x8056dcd
 8056dbf:	83 c0 04             	add    $0x4,%eax
 8056dc2:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 8056dc8:	75 e3                	jne    0x8056dad
 8056dca:	83 e8 03             	sub    $0x3,%eax
 8056dcd:	40                   	inc    %eax
 8056dce:	40                   	inc    %eax
 8056dcf:	2b 45 0c             	sub    0xc(%ebp),%eax
 8056dd2:	50                   	push   %eax
 8056dd3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8056dd6:	51                   	push   %ecx
 8056dd7:	e8 64 a7 ff ff       	call   0x8051540
 8056ddc:	89 c3                	mov    %eax,%ebx
 8056dde:	83 c4 10             	add    $0x10,%esp
 8056de1:	83 fb 10             	cmp    $0x10,%ebx
 8056de4:	75 05                	jne    0x8056deb
 8056de6:	bb 08 00 00 00       	mov    $0x8,%ebx
 8056deb:	85 db                	test   %ebx,%ebx
 8056ded:	75 24                	jne    0x8056e13
 8056def:	83 7e 10 00          	cmpl   $0x0,0x10(%esi)
 8056df3:	74 1e                	je     0x8056e13
 8056df5:	56                   	push   %esi
 8056df6:	e8 95 d8 ff ff       	call   0x8054690
 8056dfb:	83 c4 04             	add    $0x4,%esp
 8056dfe:	83 f8 fe             	cmp    $0xfffffffe,%eax
 8056e01:	75 10                	jne    0x8056e13
 8056e03:	8b 46 10             	mov    0x10(%esi),%eax
 8056e06:	50                   	push   %eax
 8056e07:	e8 e0 23 ff ff       	call   0x80491ec
 8056e0c:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
 8056e13:	89 d8                	mov    %ebx,%eax
 8056e15:	8d 65 f0             	lea    0xfffffff0(%ebp),%esp
 8056e18:	5b                   	pop    %ebx
 8056e19:	5e                   	pop    %esi
 8056e1a:	5f                   	pop    %edi
 8056e1b:	89 ec                	mov    %ebp,%esp
 8056e1d:	5d                   	pop    %ebp
 8056e1e:	c3                   	ret    
 8056e1f:	90                   	nop    
 8056e20:	55                   	push   %ebp
 8056e21:	89 e5                	mov    %esp,%ebp
 8056e23:	83 ec 34             	sub    $0x34,%esp
 8056e26:	57                   	push   %edi
 8056e27:	56                   	push   %esi
 8056e28:	53                   	push   %ebx
 8056e29:	8b 45 0c             	mov    0xc(%ebp),%eax
 8056e2c:	89 c3                	mov    %eax,%ebx
 8056e2e:	8b 75 08             	mov    0x8(%ebp),%esi
 8056e31:	83 e0 03             	and    $0x3,%eax
 8056e34:	74 16                	je     0x8056e4c
 8056e36:	7a 0f                	jp     0x8056e47
 8056e38:	83 f8 02             	cmp    $0x2,%eax
 8056e3b:	74 05                	je     0x8056e42
 8056e3d:	38 23                	cmp    %ah,(%ebx)
 8056e3f:	74 2b                	je     0x8056e6c
 8056e41:	43                   	inc    %ebx
 8056e42:	38 23                	cmp    %ah,(%ebx)
 8056e44:	74 26                	je     0x8056e6c
 8056e46:	43                   	inc    %ebx
 8056e47:	38 23                	cmp    %ah,(%ebx)
 8056e49:	74 21                	je     0x8056e6c
 8056e4b:	43                   	inc    %ebx
 8056e4c:	8b 03                	mov    (%ebx),%eax
 8056e4e:	84 c0                	test   %al,%al
 8056e50:	74 1a                	je     0x8056e6c
 8056e52:	84 e4                	test   %ah,%ah
 8056e54:	74 15                	je     0x8056e6b
 8056e56:	a9 00 00 ff 00       	test   $0xff0000,%eax
 8056e5b:	74 0d                	je     0x8056e6a
 8056e5d:	83 c3 04             	add    $0x4,%ebx
 8056e60:	a9 00 00 00 ff       	test   $0xff000000,%eax
 8056e65:	75 e5                	jne    0x8056e4c
 8056e67:	83 eb 03             	sub    $0x3,%ebx
 8056e6a:	43                   	inc    %ebx
 8056e6b:	43                   	inc    %ebx
 8056e6c:	2b 5d 0c             	sub    0xc(%ebp),%ebx
 8056e6f:	c6 45 d3 00          	movb   $0x0,0xffffffd3(%ebp)
 8056e73:	f6 46 1c 10          	testb  $0x10,0x1c(%esi)
 8056e77:	75 0a                	jne    0x8056e83
 8056e79:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8056e7d:	0f 95 c1             	setne  %cl
 8056e80:	88 4d d3             	mov    %cl,0xffffffd3(%ebp)
 8056e83:	8d 4d d4             	lea    0xffffffd4(%ebp),%ecx
 8056e86:	89 cf                	mov    %ecx,%edi
 8056e88:	89 4d cc             	mov    %ecx,0xffffffcc(%ebp)
 8056e8b:	fc                   	cld    
 8056e8c:	b9 08 00 00 00       	mov    $0x8,%ecx
 8056e91:	f3 a5                	repz movsl %ds:(%esi),%es:(%edi)
 8056e93:	8a 55 18             	mov    0x18(%ebp),%dl
 8056e96:	80 e2 01             	and    $0x1,%dl
 8056e99:	c0 e2 05             	shl    $0x5,%dl
 8056e9c:	8a 45 f0             	mov    0xfffffff0(%ebp),%al
 8056e9f:	24 df                	and    $0xdf,%al
 8056ea1:	08 d0                	or     %dl,%al
 8056ea3:	c1 6d 18 01          	shrl   $0x1,0x18(%ebp)
 8056ea7:	8a 55 18             	mov    0x18(%ebp),%dl
 8056eaa:	80 e2 01             	and    $0x1,%dl
 8056ead:	c0 e2 06             	shl    $0x6,%dl
 8056eb0:	24 bf                	and    $0xbf,%al
 8056eb2:	08 d0                	or     %dl,%al
 8056eb4:	24 f9                	and    $0xf9,%al
 8056eb6:	0c 04                	or     $0x4,%al
 8056eb8:	88 45 f0             	mov    %al,0xfffffff0(%ebp)
 8056ebb:	80 7d d3 00          	cmpb   $0x0,0xffffffd3(%ebp)
 8056ebf:	74 32                	je     0x8056ef3
 8056ec1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8056ec4:	89 4d f4             	mov    %ecx,0xfffffff4(%ebp)
 8056ec7:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 8056ece:	50                   	push   %eax
 8056ecf:	e8 38 21 ff ff       	call   0x804900c
 8056ed4:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 8056ed7:	83 c4 04             	add    $0x4,%esp
 8056eda:	85 c0                	test   %eax,%eax
 8056edc:	75 07                	jne    0x8056ee5
 8056ede:	b8 01 00 00 00       	mov    $0x1,%eax
 8056ee3:	eb 62                	jmp    0x8056f47
 8056ee5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8056ee8:	8d 04 88             	lea    (%eax,%ecx,4),%eax
 8056eeb:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8056eee:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 8056ef1:	eb 02                	jmp    0x8056ef5
 8056ef3:	31 c0                	xor    %eax,%eax
 8056ef5:	50                   	push   %eax
 8056ef6:	53                   	push   %ebx
 8056ef7:	6a 00                	push   $0x0
 8056ef9:	53                   	push   %ebx
 8056efa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8056efd:	51                   	push   %ecx
 8056efe:	8b 4d cc             	mov    0xffffffcc(%ebp),%ecx
 8056f01:	51                   	push   %ecx
 8056f02:	e8 79 db ff ff       	call   0x8054a80
 8056f07:	89 c6                	mov    %eax,%esi
 8056f09:	83 c4 18             	add    $0x18,%esp
 8056f0c:	80 7d d3 00          	cmpb   $0x0,0xffffffd3(%ebp)
 8056f10:	74 30                	je     0x8056f42
 8056f12:	85 f6                	test   %esi,%esi
 8056f14:	7c 23                	jl     0x8056f39
 8056f16:	31 d2                	xor    %edx,%edx
 8056f18:	3b 55 10             	cmp    0x10(%ebp),%edx
 8056f1b:	73 1c                	jae    0x8056f39
 8056f1d:	8b 7d f8             	mov    0xfffffff8(%ebp),%edi
 8056f20:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8056f23:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8056f26:	8b 04 97             	mov    (%edi,%edx,4),%eax
 8056f29:	89 04 d1             	mov    %eax,(%ecx,%edx,8)
 8056f2c:	8b 04 93             	mov    (%ebx,%edx,4),%eax
 8056f2f:	89 44 d1 04          	mov    %eax,0x4(%ecx,%edx,8)
 8056f33:	42                   	inc    %edx
 8056f34:	3b 55 10             	cmp    0x10(%ebp),%edx
 8056f37:	72 ea                	jb     0x8056f23
 8056f39:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8056f3c:	50                   	push   %eax
 8056f3d:	e8 aa 22 ff ff       	call   0x80491ec
 8056f42:	c1 ee 1f             	shr    $0x1f,%esi
 8056f45:	89 f0                	mov    %esi,%eax
 8056f47:	8d 65 c0             	lea    0xffffffc0(%ebp),%esp
 8056f4a:	5b                   	pop    %ebx
 8056f4b:	5e                   	pop    %esi
 8056f4c:	5f                   	pop    %edi
 8056f4d:	89 ec                	mov    %ebp,%esp
 8056f4f:	5d                   	pop    %ebp
 8056f50:	c3                   	ret    
 8056f51:	eb 0d                	jmp    0x8056f60
 8056f53:	90                   	nop    
 8056f54:	90                   	nop    
 8056f55:	90                   	nop    
 8056f56:	90                   	nop    
 8056f57:	90                   	nop    
 8056f58:	90                   	nop    
 8056f59:	90                   	nop    
 8056f5a:	90                   	nop    
 8056f5b:	90                   	nop    
 8056f5c:	90                   	nop    
 8056f5d:	90                   	nop    
 8056f5e:	90                   	nop    
 8056f5f:	90                   	nop    
 8056f60:	55                   	push   %ebp
 8056f61:	89 e5                	mov    %esp,%ebp
 8056f63:	57                   	push   %edi
 8056f64:	56                   	push   %esi
 8056f65:	53                   	push   %ebx
 8056f66:	8b 45 08             	mov    0x8(%ebp),%eax
 8056f69:	8b 7d 10             	mov    0x10(%ebp),%edi
 8056f6c:	8b 75 14             	mov    0x14(%ebp),%esi
 8056f6f:	83 f8 10             	cmp    $0x10,%eax
 8056f72:	76 0c                	jbe    0x8056f80
 8056f74:	e8 d3 20 ff ff       	call   0x804904c
 8056f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8056f80:	6a 05                	push   $0x5
 8056f82:	8b 04 85 88 b0 05 08 	mov    0x805b088(,%eax,4),%eax
 8056f89:	50                   	push   %eax
 8056f8a:	6a 00                	push   $0x0
 8056f8c:	e8 2b 22 ff ff       	call   0x80491bc
 8056f91:	83 c4 0c             	add    $0xc,%esp
 8056f94:	89 c1                	mov    %eax,%ecx
 8056f96:	89 ca                	mov    %ecx,%edx
 8056f98:	83 e2 03             	and    $0x3,%edx
 8056f9b:	74 16                	je     0x8056fb3
 8056f9d:	7a 0f                	jp     0x8056fae
 8056f9f:	83 fa 02             	cmp    $0x2,%edx
 8056fa2:	74 05                	je     0x8056fa9
 8056fa4:	38 30                	cmp    %dh,(%eax)
 8056fa6:	74 2d                	je     0x8056fd5
 8056fa8:	40                   	inc    %eax
 8056fa9:	38 30                	cmp    %dh,(%eax)
 8056fab:	74 28                	je     0x8056fd5
 8056fad:	40                   	inc    %eax
 8056fae:	38 30                	cmp    %dh,(%eax)
 8056fb0:	74 23                	je     0x8056fd5
 8056fb2:	40                   	inc    %eax
 8056fb3:	8b 10                	mov    (%eax),%edx
 8056fb5:	84 d2                	test   %dl,%dl
 8056fb7:	74 1c                	je     0x8056fd5
 8056fb9:	84 f6                	test   %dh,%dh
 8056fbb:	74 17                	je     0x8056fd4
 8056fbd:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 8056fc3:	74 0e                	je     0x8056fd3
 8056fc5:	83 c0 04             	add    $0x4,%eax
 8056fc8:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 8056fce:	75 e3                	jne    0x8056fb3
 8056fd0:	83 e8 03             	sub    $0x3,%eax
 8056fd3:	40                   	inc    %eax
 8056fd4:	40                   	inc    %eax
 8056fd5:	29 c8                	sub    %ecx,%eax
 8056fd7:	8d 58 01             	lea    0x1(%eax),%ebx
 8056fda:	85 f6                	test   %esi,%esi
 8056fdc:	74 1e                	je     0x8056ffc
 8056fde:	39 f3                	cmp    %esi,%ebx
 8056fe0:	76 12                	jbe    0x8056ff4
 8056fe2:	8d 46 ff             	lea    0xffffffff(%esi),%eax
 8056fe5:	50                   	push   %eax
 8056fe6:	51                   	push   %ecx
 8056fe7:	57                   	push   %edi
 8056fe8:	e8 2f 21 ff ff       	call   0x804911c
 8056fed:	c6 44 37 ff 00       	movb   $0x0,0xffffffff(%edi,%esi,1)
 8056ff2:	eb 08                	jmp    0x8056ffc
 8056ff4:	53                   	push   %ebx
 8056ff5:	51                   	push   %ecx
 8056ff6:	57                   	push   %edi
 8056ff7:	e8 20 21 ff ff       	call   0x804911c
 8056ffc:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8056fff:	89 d8                	mov    %ebx,%eax
 8057001:	5b                   	pop    %ebx
 8057002:	5e                   	pop    %esi
 8057003:	5f                   	pop    %edi
 8057004:	89 ec                	mov    %ebp,%esp
 8057006:	5d                   	pop    %ebp
 8057007:	c3                   	ret    
 8057008:	90                   	nop    
 8057009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8057010:	55                   	push   %ebp
 8057011:	89 e5                	mov    %esp,%ebp
 8057013:	53                   	push   %ebx
 8057014:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8057017:	8b 03                	mov    (%ebx),%eax
 8057019:	85 c0                	test   %eax,%eax
 805701b:	74 09                	je     0x8057026
 805701d:	50                   	push   %eax
 805701e:	e8 c9 21 ff ff       	call   0x80491ec
 8057023:	83 c4 04             	add    $0x4,%esp
 8057026:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
 805702c:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
 8057033:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 805703a:	8b 43 10             	mov    0x10(%ebx),%eax
 805703d:	85 c0                	test   %eax,%eax
 805703f:	74 09                	je     0x805704a
 8057041:	50                   	push   %eax
 8057042:	e8 a5 21 ff ff       	call   0x80491ec
 8057047:	83 c4 04             	add    $0x4,%esp
 805704a:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 8057051:	80 63 1c f7          	andb   $0xf7,0x1c(%ebx)
 8057055:	8b 43 14             	mov    0x14(%ebx),%eax
 8057058:	85 c0                	test   %eax,%eax
 805705a:	74 06                	je     0x8057062
 805705c:	50                   	push   %eax
 805705d:	e8 8a 21 ff ff       	call   0x80491ec
 8057062:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 8057069:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 805706c:	89 ec                	mov    %ebp,%esp
 805706e:	5d                   	pop    %ebp
 805706f:	c3                   	ret    
 8057070:	55                   	push   %ebp
 8057071:	89 e5                	mov    %esp,%ebp
 8057073:	83 ec 0c             	sub    $0xc,%esp
 8057076:	57                   	push   %edi
 8057077:	56                   	push   %esi
 8057078:	53                   	push   %ebx
 8057079:	8b 45 08             	mov    0x8(%ebp),%eax
 805707c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805707f:	50                   	push   %eax
 8057080:	e8 27 21 ff ff       	call   0x80491ac
 8057085:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8057088:	83 c4 04             	add    $0x4,%esp
 805708b:	85 c0                	test   %eax,%eax
 805708d:	0f 84 16 01 00 00    	je     0x80571a9
 8057093:	57                   	push   %edi
 8057094:	e8 73 1f ff ff       	call   0x804900c
 8057099:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 805709c:	83 c4 04             	add    $0x4,%esp
 805709f:	85 c0                	test   %eax,%eax
 80570a1:	75 0e                	jne    0x80570b1
 80570a3:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80570a6:	53                   	push   %ebx
 80570a7:	e8 f0 20 ff ff       	call   0x804919c
 80570ac:	e9 f8 00 00 00       	jmp    0x80571a9
 80570b1:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 80570b4:	e9 ab 00 00 00       	jmp    0x8057164
 80570b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80570c0:	80 78 0f 2e          	cmpb   $0x2e,0xf(%eax)
 80570c4:	75 15                	jne    0x80570db
 80570c6:	80 78 10 00          	cmpb   $0x0,0x10(%eax)
 80570ca:	0f 84 94 00 00 00    	je     0x8057164
 80570d0:	66 83 78 10 2e       	cmpw   $0x2e,0x10(%eax)
 80570d5:	0f 84 89 00 00 00    	je     0x8057164
 80570db:	89 f1                	mov    %esi,%ecx
 80570dd:	2b 4d f8             	sub    0xfffffff8(%ebp),%ecx
 80570e0:	83 c0 0f             	add    $0xf,%eax
 80570e3:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 80570e6:	89 c2                	mov    %eax,%edx
 80570e8:	83 e2 03             	and    $0x3,%edx
 80570eb:	74 16                	je     0x8057103
 80570ed:	7a 0f                	jp     0x80570fe
 80570ef:	83 fa 02             	cmp    $0x2,%edx
 80570f2:	74 05                	je     0x80570f9
 80570f4:	38 30                	cmp    %dh,(%eax)
 80570f6:	74 2d                	je     0x8057125
 80570f8:	40                   	inc    %eax
 80570f9:	38 30                	cmp    %dh,(%eax)
 80570fb:	74 28                	je     0x8057125
 80570fd:	40                   	inc    %eax
 80570fe:	38 30                	cmp    %dh,(%eax)
 8057100:	74 23                	je     0x8057125
 8057102:	40                   	inc    %eax
 8057103:	8b 10                	mov    (%eax),%edx
 8057105:	84 d2                	test   %dl,%dl
 8057107:	74 1c                	je     0x8057125
 8057109:	84 f6                	test   %dh,%dh
 805710b:	74 17                	je     0x8057124
 805710d:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 8057113:	74 0e                	je     0x8057123
 8057115:	83 c0 04             	add    $0x4,%eax
 8057118:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 805711e:	75 e3                	jne    0x8057103
 8057120:	83 e8 03             	sub    $0x3,%eax
 8057123:	40                   	inc    %eax
 8057124:	40                   	inc    %eax
 8057125:	2b 45 f4             	sub    0xfffffff4(%ebp),%eax
 8057128:	8d 44 08 02          	lea    0x2(%eax,%ecx,1),%eax
 805712c:	39 f8                	cmp    %edi,%eax
 805712e:	76 24                	jbe    0x8057154
 8057130:	81 c7 00 04 00 00    	add    $0x400,%edi
 8057136:	39 f8                	cmp    %edi,%eax
 8057138:	77 f6                	ja     0x8057130
 805713a:	57                   	push   %edi
 805713b:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 805713e:	53                   	push   %ebx
 805713f:	e8 a8 1f ff ff       	call   0x80490ec
 8057144:	89 c2                	mov    %eax,%edx
 8057146:	83 c4 08             	add    $0x8,%esp
 8057149:	85 d2                	test   %edx,%edx
 805714b:	74 43                	je     0x8057190
 805714d:	29 d8                	sub    %ebx,%eax
 805714f:	01 c6                	add    %eax,%esi
 8057151:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 8057154:	8b 5d f4             	mov    0xfffffff4(%ebp),%ebx
 8057157:	53                   	push   %ebx
 8057158:	56                   	push   %esi
 8057159:	e8 5e 1f ff ff       	call   0x80490bc
 805715e:	8d 70 01             	lea    0x1(%eax),%esi
 8057161:	83 c4 08             	add    $0x8,%esp
 8057164:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8057167:	53                   	push   %ebx
 8057168:	e8 ef 1f ff ff       	call   0x804915c
 805716d:	83 c4 04             	add    $0x4,%esp
 8057170:	85 c0                	test   %eax,%eax
 8057172:	0f 85 48 ff ff ff    	jne    0x80570c0
 8057178:	c6 06 00             	movb   $0x0,(%esi)
 805717b:	53                   	push   %ebx
 805717c:	e8 1b 20 ff ff       	call   0x804919c
 8057181:	83 c4 04             	add    $0x4,%esp
 8057184:	85 c0                	test   %eax,%eax
 8057186:	75 18                	jne    0x80571a0
 8057188:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 805718b:	eb 1e                	jmp    0x80571ab
 805718d:	8d 76 00             	lea    0x0(%esi),%esi
 8057190:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8057193:	53                   	push   %ebx
 8057194:	e8 03 20 ff ff       	call   0x804919c
 8057199:	eb 0e                	jmp    0x80571a9
 805719b:	90                   	nop    
 805719c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80571a0:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 80571a3:	53                   	push   %ebx
 80571a4:	e8 43 20 ff ff       	call   0x80491ec
 80571a9:	31 c0                	xor    %eax,%eax
 80571ab:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 80571ae:	5b                   	pop    %ebx
 80571af:	5e                   	pop    %esi
 80571b0:	5f                   	pop    %edi
 80571b1:	89 ec                	mov    %ebp,%esp
 80571b3:	5d                   	pop    %ebp
 80571b4:	c3                   	ret    
 80571b5:	90                   	nop    
 80571b6:	90                   	nop    
 80571b7:	90                   	nop    
 80571b8:	90                   	nop    
 80571b9:	90                   	nop    
 80571ba:	90                   	nop    
 80571bb:	90                   	nop    
 80571bc:	90                   	nop    
 80571bd:	90                   	nop    
 80571be:	90                   	nop    
 80571bf:	90                   	nop    
 80571c0:	55                   	push   %ebp
 80571c1:	89 e5                	mov    %esp,%ebp
 80571c3:	8b 45 08             	mov    0x8(%ebp),%eax
 80571c6:	6a 00                	push   $0x0
 80571c8:	50                   	push   %eax
 80571c9:	e8 82 21 ff ff       	call   0x8049350
 80571ce:	89 f6                	mov    %esi,%esi
 80571d0:	55                   	push   %ebp
 80571d1:	89 e5                	mov    %esp,%ebp
 80571d3:	56                   	push   %esi
 80571d4:	53                   	push   %ebx
 80571d5:	83 3d 34 be 05 08 00 	cmpl   $0x0,0x805be34
 80571dc:	74 44                	je     0x8057222
 80571de:	31 d2                	xor    %edx,%edx
 80571e0:	be 80 bc 05 08       	mov    $0x805bc80,%esi
 80571e5:	8b 1d d4 b2 05 08    	mov    0x805b2d4,%ebx
 80571eb:	8b 0d c0 b2 05 08    	mov    0x805b2c0,%ecx
 80571f1:	f6 44 53 01 01       	testb  $0x1,0x1(%ebx,%edx,2)
 80571f6:	74 1c                	je     0x8057214
 80571f8:	8d 82 80 00 00 00    	lea    0x80(%edx),%eax
 80571fe:	3d 7f 01 00 00       	cmp    $0x17f,%eax
 8057203:	77 0b                	ja     0x8057210
 8057205:	8b 04 91             	mov    (%ecx,%edx,4),%eax
 8057208:	eb 0c                	jmp    0x8057216
 805720a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8057210:	89 d0                	mov    %edx,%eax
 8057212:	eb 02                	jmp    0x8057216
 8057214:	88 d0                	mov    %dl,%al
 8057216:	88 04 32             	mov    %al,(%edx,%esi,1)
 8057219:	42                   	inc    %edx
 805721a:	81 fa ff 00 00 00    	cmp    $0xff,%edx
 8057220:	7e cf                	jle    0x80571f1
 8057222:	83 3d 34 be 05 08 00 	cmpl   $0x0,0x805be34
 8057229:	74 07                	je     0x8057232
 805722b:	b8 80 bc 05 08       	mov    $0x805bc80,%eax
 8057230:	eb 02                	jmp    0x8057234
 8057232:	31 c0                	xor    %eax,%eax
 8057234:	50                   	push   %eax
 8057235:	e8 b6 91 ff ff       	call   0x80503f0
 805723a:	a3 20 be 05 08       	mov    %eax,0x805be20
 805723f:	83 c4 04             	add    $0x4,%esp
 8057242:	85 c0                	test   %eax,%eax
 8057244:	75 0c                	jne    0x8057252
 8057246:	6a 00                	push   $0x0
 8057248:	68 75 9b 05 08       	push   $0x8059b75
 805724d:	e8 fe 20 ff ff       	call   0x8049350
 8057252:	8d 65 f8             	lea    0xfffffff8(%ebp),%esp
 8057255:	5b                   	pop    %ebx
 8057256:	5e                   	pop    %esi
 8057257:	89 ec                	mov    %ebp,%esp
 8057259:	5d                   	pop    %ebp
 805725a:	c3                   	ret    
 805725b:	90                   	nop    
 805725c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8057260:	55                   	push   %ebp
 8057261:	89 e5                	mov    %esp,%ebp
 8057263:	53                   	push   %ebx
 8057264:	83 3d f4 bd 05 08 00 	cmpl   $0x0,0x805bdf4
 805726b:	0f 84 20 01 00 00    	je     0x8057391
 8057271:	e8 5a ff ff ff       	call   0x80571d0
 8057276:	8b 1d f4 bd 05 08    	mov    0x805bdf4,%ebx
 805727c:	85 db                	test   %ebx,%ebx
 805727e:	74 77                	je     0x80572f7
 8057280:	83 3b 00             	cmpl   $0x0,(%ebx)
 8057283:	74 6b                	je     0x80572f0
 8057285:	ff 05 24 be 05 08    	incl   0x805be24
 805728b:	8b 53 04             	mov    0x4(%ebx),%edx
 805728e:	89 d0                	mov    %edx,%eax
 8057290:	89 d1                	mov    %edx,%ecx
 8057292:	83 e1 03             	and    $0x3,%ecx
 8057295:	74 16                	je     0x80572ad
 8057297:	7a 0f                	jp     0x80572a8
 8057299:	83 f9 02             	cmp    $0x2,%ecx
 805729c:	74 05                	je     0x80572a3
 805729e:	38 28                	cmp    %ch,(%eax)
 80572a0:	74 2d                	je     0x80572cf
 80572a2:	40                   	inc    %eax
 80572a3:	38 28                	cmp    %ch,(%eax)
 80572a5:	74 28                	je     0x80572cf
 80572a7:	40                   	inc    %eax
 80572a8:	38 28                	cmp    %ch,(%eax)
 80572aa:	74 23                	je     0x80572cf
 80572ac:	40                   	inc    %eax
 80572ad:	8b 08                	mov    (%eax),%ecx
 80572af:	84 c9                	test   %cl,%cl
 80572b1:	74 1c                	je     0x80572cf
 80572b3:	84 ed                	test   %ch,%ch
 80572b5:	74 17                	je     0x80572ce
 80572b7:	f7 c1 00 00 ff 00    	test   $0xff0000,%ecx
 80572bd:	74 0e                	je     0x80572cd
 80572bf:	83 c0 04             	add    $0x4,%eax
 80572c2:	f7 c1 00 00 00 ff    	test   $0xff000000,%ecx
 80572c8:	75 e3                	jne    0x80572ad
 80572ca:	83 e8 03             	sub    $0x3,%eax
 80572cd:	40                   	inc    %eax
 80572ce:	40                   	inc    %eax
 80572cf:	29 d0                	sub    %edx,%eax
 80572d1:	50                   	push   %eax
 80572d2:	8b 43 04             	mov    0x4(%ebx),%eax
 80572d5:	50                   	push   %eax
 80572d6:	a1 20 be 05 08       	mov    0x805be20,%eax
 80572db:	50                   	push   %eax
 80572dc:	e8 2f 92 ff ff       	call   0x8050510
 80572e1:	83 c4 0c             	add    $0xc,%esp
 80572e4:	85 c0                	test   %eax,%eax
 80572e6:	74 08                	je     0x80572f0
 80572e8:	6a 00                	push   $0x0
 80572ea:	50                   	push   %eax
 80572eb:	e8 60 20 ff ff       	call   0x8049350
 80572f0:	8b 5b 08             	mov    0x8(%ebx),%ebx
 80572f3:	85 db                	test   %ebx,%ebx
 80572f5:	75 89                	jne    0x8057280
 80572f7:	8b 1d f4 bd 05 08    	mov    0x805bdf4,%ebx
 80572fd:	85 db                	test   %ebx,%ebx
 80572ff:	74 76                	je     0x8057377
 8057301:	83 3b 00             	cmpl   $0x0,(%ebx)
 8057304:	75 6a                	jne    0x8057370
 8057306:	8b 53 04             	mov    0x4(%ebx),%edx
 8057309:	89 d0                	mov    %edx,%eax
 805730b:	89 d1                	mov    %edx,%ecx
 805730d:	83 e1 03             	and    $0x3,%ecx
 8057310:	74 16                	je     0x8057328
 8057312:	7a 0f                	jp     0x8057323
 8057314:	83 f9 02             	cmp    $0x2,%ecx
 8057317:	74 05                	je     0x805731e
 8057319:	38 28                	cmp    %ch,(%eax)
 805731b:	74 2d                	je     0x805734a
 805731d:	40                   	inc    %eax
 805731e:	38 28                	cmp    %ch,(%eax)
 8057320:	74 28                	je     0x805734a
 8057322:	40                   	inc    %eax
 8057323:	38 28                	cmp    %ch,(%eax)
 8057325:	74 23                	je     0x805734a
 8057327:	40                   	inc    %eax
 8057328:	8b 08                	mov    (%eax),%ecx
 805732a:	84 c9                	test   %cl,%cl
 805732c:	74 1c                	je     0x805734a
 805732e:	84 ed                	test   %ch,%ch
 8057330:	74 17                	je     0x8057349
 8057332:	f7 c1 00 00 ff 00    	test   $0xff0000,%ecx
 8057338:	74 0e                	je     0x8057348
 805733a:	83 c0 04             	add    $0x4,%eax
 805733d:	f7 c1 00 00 00 ff    	test   $0xff000000,%ecx
 8057343:	75 e3                	jne    0x8057328
 8057345:	83 e8 03             	sub    $0x3,%eax
 8057348:	40                   	inc    %eax
 8057349:	40                   	inc    %eax
 805734a:	29 d0                	sub    %edx,%eax
 805734c:	50                   	push   %eax
 805734d:	8b 43 04             	mov    0x4(%ebx),%eax
 8057350:	50                   	push   %eax
 8057351:	a1 20 be 05 08       	mov    0x805be20,%eax
 8057356:	50                   	push   %eax
 8057357:	e8 b4 91 ff ff       	call   0x8050510
 805735c:	83 c4 0c             	add    $0xc,%esp
 805735f:	85 c0                	test   %eax,%eax
 8057361:	74 0d                	je     0x8057370
 8057363:	6a 00                	push   $0x0
 8057365:	50                   	push   %eax
 8057366:	e8 e5 1f ff ff       	call   0x8049350
 805736b:	90                   	nop    
 805736c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8057370:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8057373:	85 db                	test   %ebx,%ebx
 8057375:	75 8a                	jne    0x8057301
 8057377:	a1 20 be 05 08       	mov    0x805be20,%eax
 805737c:	50                   	push   %eax
 805737d:	e8 6e 98 ff ff       	call   0x8050bf0
 8057382:	83 c4 04             	add    $0x4,%esp
 8057385:	85 c0                	test   %eax,%eax
 8057387:	74 08                	je     0x8057391
 8057389:	6a 00                	push   $0x0
 805738b:	50                   	push   %eax
 805738c:	e8 bf 1f ff ff       	call   0x8049350
 8057391:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8057394:	89 ec                	mov    %ebp,%esp
 8057396:	5d                   	pop    %ebp
 8057397:	c3                   	ret    
 8057398:	90                   	nop    
 8057399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80573a0:	55                   	push   %ebp
 80573a1:	89 e5                	mov    %esp,%ebp
 80573a3:	57                   	push   %edi
 80573a4:	56                   	push   %esi
 80573a5:	53                   	push   %ebx
 80573a6:	8b 7d 0c             	mov    0xc(%ebp),%edi
 80573a9:	68 06 0b 00 00       	push   $0xb06
 80573ae:	e8 6d a1 ff ff       	call   0x8051520
 80573b3:	31 c0                	xor    %eax,%eax
 80573b5:	a0 2c be 05 08       	mov    0x805be2c,%al
 80573ba:	50                   	push   %eax
 80573bb:	a1 34 be 05 08       	mov    0x805be34,%eax
 80573c0:	50                   	push   %eax
 80573c1:	68 06 0b 00 00       	push   $0xb06
 80573c6:	e8 65 45 ff ff       	call   0x804b930
 80573cb:	68 00 be 05 08       	push   $0x805be00
 80573d0:	57                   	push   %edi
 80573d1:	8b 55 08             	mov    0x8(%ebp),%edx
 80573d4:	52                   	push   %edx
 80573d5:	e8 76 f8 ff ff       	call   0x8056c50
 80573da:	83 c4 1c             	add    $0x1c,%esp
 80573dd:	85 c0                	test   %eax,%eax
 80573df:	74 0f                	je     0x80573f0
 80573e1:	6a 00                	push   $0x0
 80573e3:	50                   	push   %eax
 80573e4:	e8 67 1f ff ff       	call   0x8049350
 80573e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80573f0:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 80573f7:	75 0d                	jne    0x8057406
 80573f9:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 8057400:	0f 84 0b 01 00 00    	je     0x8057511
 8057406:	8d 47 32             	lea    0x32(%edi),%eax
 8057409:	50                   	push   %eax
 805740a:	e8 fd 1b ff ff       	call   0x804900c
 805740f:	89 c6                	mov    %eax,%esi
 8057411:	83 c4 04             	add    $0x4,%esp
 8057414:	c6 06 00             	movb   $0x0,(%esi)
 8057417:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 805741e:	74 06                	je     0x8057426
 8057420:	c7 06 5e 5c 28 00    	movl   $0x285c5e,(%esi)
 8057426:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 805742d:	74 10                	je     0x805743f
 805742f:	6a 17                	push   $0x17
 8057431:	68 8b 9b 05 08       	push   $0x8059b8b
 8057436:	56                   	push   %esi
 8057437:	e8 e0 1c ff ff       	call   0x804911c
 805743c:	83 c4 0c             	add    $0xc,%esp
 805743f:	89 f3                	mov    %esi,%ebx
 8057441:	89 f0                	mov    %esi,%eax
 8057443:	83 e0 03             	and    $0x3,%eax
 8057446:	74 16                	je     0x805745e
 8057448:	7a 0f                	jp     0x8057459
 805744a:	83 f8 02             	cmp    $0x2,%eax
 805744d:	74 05                	je     0x8057454
 805744f:	38 23                	cmp    %ah,(%ebx)
 8057451:	74 2b                	je     0x805747e
 8057453:	43                   	inc    %ebx
 8057454:	38 23                	cmp    %ah,(%ebx)
 8057456:	74 26                	je     0x805747e
 8057458:	43                   	inc    %ebx
 8057459:	38 23                	cmp    %ah,(%ebx)
 805745b:	74 21                	je     0x805747e
 805745d:	43                   	inc    %ebx
 805745e:	8b 03                	mov    (%ebx),%eax
 8057460:	84 c0                	test   %al,%al
 8057462:	74 1a                	je     0x805747e
 8057464:	84 e4                	test   %ah,%ah
 8057466:	74 15                	je     0x805747d
 8057468:	a9 00 00 ff 00       	test   $0xff0000,%eax
 805746d:	74 0d                	je     0x805747c
 805746f:	83 c3 04             	add    $0x4,%ebx
 8057472:	a9 00 00 00 ff       	test   $0xff000000,%eax
 8057477:	75 e5                	jne    0x805745e
 8057479:	83 eb 03             	sub    $0x3,%ebx
 805747c:	43                   	inc    %ebx
 805747d:	43                   	inc    %ebx
 805747e:	29 f3                	sub    %esi,%ebx
 8057480:	57                   	push   %edi
 8057481:	8b 55 08             	mov    0x8(%ebp),%edx
 8057484:	52                   	push   %edx
 8057485:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 8057488:	50                   	push   %eax
 8057489:	e8 8e 1c ff ff       	call   0x804911c
 805748e:	01 fb                	add    %edi,%ebx
 8057490:	83 c4 0c             	add    $0xc,%esp
 8057493:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 805749a:	74 13                	je     0x80574af
 805749c:	6a 17                	push   $0x17
 805749e:	68 a2 9b 05 08       	push   $0x8059ba2
 80574a3:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
 80574a6:	51                   	push   %ecx
 80574a7:	e8 70 1c ff ff       	call   0x804911c
 80574ac:	83 c4 0c             	add    $0xc,%esp
 80574af:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
 80574b2:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 80574b9:	74 06                	je     0x80574c1
 80574bb:	c7 01 5c 29 24 00    	movl   $0x24295c,(%ecx)
 80574c1:	89 c8                	mov    %ecx,%eax
 80574c3:	89 ca                	mov    %ecx,%edx
 80574c5:	83 e2 03             	and    $0x3,%edx
 80574c8:	74 16                	je     0x80574e0
 80574ca:	7a 0f                	jp     0x80574db
 80574cc:	83 fa 02             	cmp    $0x2,%edx
 80574cf:	74 05                	je     0x80574d6
 80574d1:	38 30                	cmp    %dh,(%eax)
 80574d3:	74 2d                	je     0x8057502
 80574d5:	40                   	inc    %eax
 80574d6:	38 30                	cmp    %dh,(%eax)
 80574d8:	74 28                	je     0x8057502
 80574da:	40                   	inc    %eax
 80574db:	38 30                	cmp    %dh,(%eax)
 80574dd:	74 23                	je     0x8057502
 80574df:	40                   	inc    %eax
 80574e0:	8b 10                	mov    (%eax),%edx
 80574e2:	84 d2                	test   %dl,%dl
 80574e4:	74 1c                	je     0x8057502
 80574e6:	84 f6                	test   %dh,%dh
 80574e8:	74 17                	je     0x8057501
 80574ea:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 80574f0:	74 0e                	je     0x8057500
 80574f2:	83 c0 04             	add    $0x4,%eax
 80574f5:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 80574fb:	75 e3                	jne    0x80574e0
 80574fd:	83 e8 03             	sub    $0x3,%eax
 8057500:	40                   	inc    %eax
 8057501:	40                   	inc    %eax
 8057502:	6a 01                	push   $0x1
 8057504:	29 c8                	sub    %ecx,%eax
 8057506:	68 a0 bd 05 08       	push   $0x805bda0
 805750b:	01 c3                	add    %eax,%ebx
 805750d:	53                   	push   %ebx
 805750e:	56                   	push   %esi
 805750f:	eb 0c                	jmp    0x805751d
 8057511:	6a 01                	push   $0x1
 8057513:	68 a0 bd 05 08       	push   $0x805bda0
 8057518:	57                   	push   %edi
 8057519:	8b 55 08             	mov    0x8(%ebp),%edx
 805751c:	52                   	push   %edx
 805751d:	e8 ce 7f ff ff       	call   0x804f4f0
 8057522:	83 c4 10             	add    $0x10,%esp
 8057525:	e8 36 fd ff ff       	call   0x8057260
 805752a:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 805752d:	5b                   	pop    %ebx
 805752e:	5e                   	pop    %esi
 805752f:	5f                   	pop    %edi
 8057530:	89 ec                	mov    %ebp,%esp
 8057532:	5d                   	pop    %ebp
 8057533:	c3                   	ret    
 8057534:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 805753a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
 8057540:	55                   	push   %ebp
 8057541:	89 e5                	mov    %esp,%ebp
 8057543:	57                   	push   %edi
 8057544:	56                   	push   %esi
 8057545:	53                   	push   %ebx
 8057546:	8b 15 3c be 05 08    	mov    0x805be3c,%edx
 805754c:	31 c0                	xor    %eax,%eax
 805754e:	8a 02                	mov    (%edx),%al
 8057550:	83 c0 9f             	add    $0xffffff9f,%eax
 8057553:	75 19                	jne    0x805756e
 8057555:	31 c0                	xor    %eax,%eax
 8057557:	8a 42 01             	mov    0x1(%edx),%al
 805755a:	83 c0 89             	add    $0xffffff89,%eax
 805755d:	75 0f                	jne    0x805756e
 805755f:	31 c0                	xor    %eax,%eax
 8057561:	8a 42 02             	mov    0x2(%edx),%al
 8057564:	83 c0 95             	add    $0xffffff95,%eax
 8057567:	75 05                	jne    0x805756e
 8057569:	31 c0                	xor    %eax,%eax
 805756b:	8a 42 03             	mov    0x3(%edx),%al
 805756e:	85 c0                	test   %eax,%eax
 8057570:	75 1f                	jne    0x8057591
 8057572:	68 c9 e0 0b 00       	push   $0xbe0c9
 8057577:	e8 a4 9f ff ff       	call   0x8051520
 805757c:	31 c0                	xor    %eax,%eax
 805757e:	a0 2c be 05 08       	mov    0x805be2c,%al
 8057583:	50                   	push   %eax
 8057584:	a1 34 be 05 08       	mov    0x805be34,%eax
 8057589:	50                   	push   %eax
 805758a:	68 c9 e0 0b 00       	push   $0xbe0c9
 805758f:	eb 1d                	jmp    0x80575ae
 8057591:	68 1c bb 00 00       	push   $0xbb1c
 8057596:	e8 85 9f ff ff       	call   0x8051520
 805759b:	31 c0                	xor    %eax,%eax
 805759d:	a0 2c be 05 08       	mov    0x805be2c,%al
 80575a2:	50                   	push   %eax
 80575a3:	a1 34 be 05 08       	mov    0x805be34,%eax
 80575a8:	50                   	push   %eax
 80575a9:	68 1c bb 00 00       	push   $0xbb1c
 80575ae:	e8 7d 43 ff ff       	call   0x804b930
 80575b3:	83 c4 10             	add    $0x10,%esp
 80575b6:	68 00 be 05 08       	push   $0x805be00
 80575bb:	8b 7d 0c             	mov    0xc(%ebp),%edi
 80575be:	57                   	push   %edi
 80575bf:	8b 7d 08             	mov    0x8(%ebp),%edi
 80575c2:	57                   	push   %edi
 80575c3:	e8 88 f6 ff ff       	call   0x8056c50
 80575c8:	83 c4 0c             	add    $0xc,%esp
 80575cb:	85 c0                	test   %eax,%eax
 80575cd:	74 08                	je     0x80575d7
 80575cf:	6a 00                	push   $0x0
 80575d1:	50                   	push   %eax
 80575d2:	e8 79 1d ff ff       	call   0x8049350
 80575d7:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 80575de:	75 0d                	jne    0x80575ed
 80575e0:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 80575e7:	0f 84 18 01 00 00    	je     0x8057705
 80575ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 80575f0:	83 c0 32             	add    $0x32,%eax
 80575f3:	50                   	push   %eax
 80575f4:	e8 13 1a ff ff       	call   0x804900c
 80575f9:	89 c6                	mov    %eax,%esi
 80575fb:	83 c4 04             	add    $0x4,%esp
 80575fe:	c6 06 00             	movb   $0x0,(%esi)
 8057601:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 8057608:	74 09                	je     0x8057613
 805760a:	66 c7 06 5e 28       	movw   $0x285e,(%esi)
 805760f:	c6 46 02 00          	movb   $0x0,0x2(%esi)
 8057613:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 805761a:	74 10                	je     0x805762c
 805761c:	6a 13                	push   $0x13
 805761e:	68 c0 9b 05 08       	push   $0x8059bc0
 8057623:	56                   	push   %esi
 8057624:	e8 f3 1a ff ff       	call   0x804911c
 8057629:	83 c4 0c             	add    $0xc,%esp
 805762c:	89 f0                	mov    %esi,%eax
 805762e:	89 f3                	mov    %esi,%ebx
 8057630:	8b 7d 0c             	mov    0xc(%ebp),%edi
 8057633:	83 e0 03             	and    $0x3,%eax
 8057636:	74 16                	je     0x805764e
 8057638:	7a 0f                	jp     0x8057649
 805763a:	83 f8 02             	cmp    $0x2,%eax
 805763d:	74 05                	je     0x8057644
 805763f:	38 23                	cmp    %ah,(%ebx)
 8057641:	74 2b                	je     0x805766e
 8057643:	43                   	inc    %ebx
 8057644:	38 23                	cmp    %ah,(%ebx)
 8057646:	74 26                	je     0x805766e
 8057648:	43                   	inc    %ebx
 8057649:	38 23                	cmp    %ah,(%ebx)
 805764b:	74 21                	je     0x805766e
 805764d:	43                   	inc    %ebx
 805764e:	8b 03                	mov    (%ebx),%eax
 8057650:	84 c0                	test   %al,%al
 8057652:	74 1a                	je     0x805766e
 8057654:	84 e4                	test   %ah,%ah
 8057656:	74 15                	je     0x805766d
 8057658:	a9 00 00 ff 00       	test   $0xff0000,%eax
 805765d:	74 0d                	je     0x805766c
 805765f:	83 c3 04             	add    $0x4,%ebx
 8057662:	a9 00 00 00 ff       	test   $0xff000000,%eax
 8057667:	75 e5                	jne    0x805764e
 8057669:	83 eb 03             	sub    $0x3,%ebx
 805766c:	43                   	inc    %ebx
 805766d:	43                   	inc    %ebx
 805766e:	29 f3                	sub    %esi,%ebx
 8057670:	57                   	push   %edi
 8057671:	8b 7d 08             	mov    0x8(%ebp),%edi
 8057674:	57                   	push   %edi
 8057675:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 8057678:	50                   	push   %eax
 8057679:	e8 9e 1a ff ff       	call   0x804911c
 805767e:	03 5d 0c             	add    0xc(%ebp),%ebx
 8057681:	83 c4 0c             	add    $0xc,%esp
 8057684:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 805768b:	74 13                	je     0x80576a0
 805768d:	6a 13                	push   $0x13
 805768f:	68 d3 9b 05 08       	push   $0x8059bd3
 8057694:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
 8057697:	51                   	push   %ecx
 8057698:	e8 7f 1a ff ff       	call   0x804911c
 805769d:	83 c4 0c             	add    $0xc,%esp
 80576a0:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
 80576a3:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 80576aa:	74 09                	je     0x80576b5
 80576ac:	66 c7 01 29 24       	movw   $0x2429,(%ecx)
 80576b1:	c6 41 02 00          	movb   $0x0,0x2(%ecx)
 80576b5:	89 c8                	mov    %ecx,%eax
 80576b7:	89 ca                	mov    %ecx,%edx
 80576b9:	83 e2 03             	and    $0x3,%edx
 80576bc:	74 16                	je     0x80576d4
 80576be:	7a 0f                	jp     0x80576cf
 80576c0:	83 fa 02             	cmp    $0x2,%edx
 80576c3:	74 05                	je     0x80576ca
 80576c5:	38 30                	cmp    %dh,(%eax)
 80576c7:	74 2d                	je     0x80576f6
 80576c9:	40                   	inc    %eax
 80576ca:	38 30                	cmp    %dh,(%eax)
 80576cc:	74 28                	je     0x80576f6
 80576ce:	40                   	inc    %eax
 80576cf:	38 30                	cmp    %dh,(%eax)
 80576d1:	74 23                	je     0x80576f6
 80576d3:	40                   	inc    %eax
 80576d4:	8b 10                	mov    (%eax),%edx
 80576d6:	84 d2                	test   %dl,%dl
 80576d8:	74 1c                	je     0x80576f6
 80576da:	84 f6                	test   %dh,%dh
 80576dc:	74 17                	je     0x80576f5
 80576de:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 80576e4:	74 0e                	je     0x80576f4
 80576e6:	83 c0 04             	add    $0x4,%eax
 80576e9:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 80576ef:	75 e3                	jne    0x80576d4
 80576f1:	83 e8 03             	sub    $0x3,%eax
 80576f4:	40                   	inc    %eax
 80576f5:	40                   	inc    %eax
 80576f6:	6a 01                	push   $0x1
 80576f8:	29 c8                	sub    %ecx,%eax
 80576fa:	68 a0 bd 05 08       	push   $0x805bda0
 80576ff:	01 c3                	add    %eax,%ebx
 8057701:	53                   	push   %ebx
 8057702:	56                   	push   %esi
 8057703:	eb 0f                	jmp    0x8057714
 8057705:	6a 01                	push   $0x1
 8057707:	68 a0 bd 05 08       	push   $0x805bda0
 805770c:	8b 7d 0c             	mov    0xc(%ebp),%edi
 805770f:	57                   	push   %edi
 8057710:	8b 7d 08             	mov    0x8(%ebp),%edi
 8057713:	57                   	push   %edi
 8057714:	e8 d7 7d ff ff       	call   0x804f4f0
 8057719:	83 c4 10             	add    $0x10,%esp
 805771c:	e8 3f fb ff ff       	call   0x8057260
 8057721:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8057724:	5b                   	pop    %ebx
 8057725:	5e                   	pop    %esi
 8057726:	5f                   	pop    %edi
 8057727:	89 ec                	mov    %ebp,%esp
 8057729:	5d                   	pop    %ebp
 805772a:	c3                   	ret    
 805772b:	90                   	nop    
 805772c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8057730:	55                   	push   %ebp
 8057731:	89 e5                	mov    %esp,%ebp
 8057733:	83 ec 2c             	sub    $0x2c,%esp
 8057736:	57                   	push   %edi
 8057737:	56                   	push   %esi
 8057738:	53                   	push   %ebx
 8057739:	8a 15 2c be 05 08    	mov    0x805be2c,%dl
 805773f:	88 55 e7             	mov    %dl,0xffffffe7(%ebp)
 8057742:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8057745:	89 4d ec             	mov    %ecx,0xffffffec(%ebp)
 8057748:	8b 55 0c             	mov    0xc(%ebp),%edx
 805774b:	01 55 ec             	add    %edx,0xffffffec(%ebp)
 805774e:	89 ce                	mov    %ecx,%esi
 8057750:	3b 75 ec             	cmp    0xffffffec(%ebp),%esi
 8057753:	0f 83 39 02 00 00    	jae    0x8057992
 8057759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8057760:	8b 1d 20 be 05 08    	mov    0x805be20,%ebx
 8057766:	85 db                	test   %ebx,%ebx
 8057768:	0f 84 92 00 00 00    	je     0x8057800
 805776e:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 8057771:	50                   	push   %eax
 8057772:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 8057775:	29 f0                	sub    %esi,%eax
 8057777:	50                   	push   %eax
 8057778:	56                   	push   %esi
 8057779:	53                   	push   %ebx
 805777a:	e8 c1 9c ff ff       	call   0x8051440
 805777f:	89 c6                	mov    %eax,%esi
 8057781:	83 c4 10             	add    $0x10,%esp
 8057784:	85 f6                	test   %esi,%esi
 8057786:	0f 84 06 02 00 00    	je     0x8057992
 805778c:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 805778f:	29 f0                	sub    %esi,%eax
 8057791:	50                   	push   %eax
 8057792:	0f be 45 e7          	movsbl 0xffffffe7(%ebp),%eax
 8057796:	50                   	push   %eax
 8057797:	56                   	push   %esi
 8057798:	e8 4f 18 ff ff       	call   0x8048fec
 805779d:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
 80577a0:	83 c4 0c             	add    $0xc,%esp
 80577a3:	85 c0                	test   %eax,%eax
 80577a5:	75 12                	jne    0x80577b9
 80577a7:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 80577aa:	89 4d e8             	mov    %ecx,0xffffffe8(%ebp)
 80577ad:	eb 0a                	jmp    0x80577b9
 80577af:	90                   	nop    
 80577b0:	8a 55 e7             	mov    0xffffffe7(%ebp),%dl
 80577b3:	38 56 ff             	cmp    %dl,0xffffffff(%esi)
 80577b6:	74 06                	je     0x80577be
 80577b8:	4e                   	dec    %esi
 80577b9:	3b 75 08             	cmp    0x8(%ebp),%esi
 80577bc:	77 f2                	ja     0x80577b0
 80577be:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 80577c1:	a1 24 be 05 08       	mov    0x805be24,%eax
 80577c6:	8a 19                	mov    (%ecx),%bl
 80577c8:	39 45 f4             	cmp    %eax,0xfffffff4(%ebp)
 80577cb:	0f 8c c5 01 00 00    	jl     0x8057996
 80577d1:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
 80577d4:	50                   	push   %eax
 80577d5:	6a 00                	push   $0x0
 80577d7:	6a 00                	push   $0x0
 80577d9:	51                   	push   %ecx
 80577da:	56                   	push   %esi
 80577db:	68 a0 bd 05 08       	push   $0x805bda0
 80577e0:	e8 db 7a ff ff       	call   0x804f2c0
 80577e5:	83 c4 18             	add    $0x18,%esp
 80577e8:	85 c0                	test   %eax,%eax
 80577ea:	75 0a                	jne    0x80577f6
 80577ec:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
 80577ef:	88 1a                	mov    %bl,(%edx)
 80577f1:	e9 8c 01 00 00       	jmp    0x8057982
 80577f6:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 80577f9:	88 19                	mov    %bl,(%ecx)
 80577fb:	eb 61                	jmp    0x805785e
 80577fd:	8d 76 00             	lea    0x0(%esi),%esi
 8057800:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8057803:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
 8057806:	8a 1a                	mov    (%edx),%bl
 8057808:	50                   	push   %eax
 8057809:	6a 00                	push   $0x0
 805780b:	6a 00                	push   $0x0
 805780d:	52                   	push   %edx
 805780e:	56                   	push   %esi
 805780f:	68 a0 bd 05 08       	push   $0x805bda0
 8057814:	e8 a7 7a ff ff       	call   0x804f2c0
 8057819:	89 c6                	mov    %eax,%esi
 805781b:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 805781e:	83 c4 18             	add    $0x18,%esp
 8057821:	88 19                	mov    %bl,(%ecx)
 8057823:	85 f6                	test   %esi,%esi
 8057825:	0f 84 67 01 00 00    	je     0x8057992
 805782b:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 805782e:	29 f0                	sub    %esi,%eax
 8057830:	50                   	push   %eax
 8057831:	0f be 45 e7          	movsbl 0xffffffe7(%ebp),%eax
 8057835:	50                   	push   %eax
 8057836:	56                   	push   %esi
 8057837:	e8 b0 17 ff ff       	call   0x8048fec
 805783c:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
 805783f:	83 c4 0c             	add    $0xc,%esp
 8057842:	85 c0                	test   %eax,%eax
 8057844:	75 13                	jne    0x8057859
 8057846:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8057849:	89 55 e8             	mov    %edx,0xffffffe8(%ebp)
 805784c:	eb 0b                	jmp    0x8057859
 805784e:	89 f6                	mov    %esi,%esi
 8057850:	8a 4d e7             	mov    0xffffffe7(%ebp),%cl
 8057853:	38 4e ff             	cmp    %cl,0xffffffff(%esi)
 8057856:	74 06                	je     0x805785e
 8057858:	4e                   	dec    %esi
 8057859:	3b 75 08             	cmp    0x8(%ebp),%esi
 805785c:	77 f2                	ja     0x8057850
 805785e:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
 8057862:	0f 84 2e 01 00 00    	je     0x8057996
 8057868:	80 25 1c be 05 08 bf 	andb   $0xbf,0x805be1c
 805786f:	68 80 bd 05 08       	push   $0x805bd80
 8057874:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
 8057877:	89 55 dc             	mov    %edx,0xffffffdc(%ebp)
 805787a:	29 75 dc             	sub    %esi,0xffffffdc(%ebp)
 805787d:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 8057880:	89 4d e0             	mov    %ecx,0xffffffe0(%ebp)
 8057883:	51                   	push   %ecx
 8057884:	6a 00                	push   $0x0
 8057886:	51                   	push   %ecx
 8057887:	56                   	push   %esi
 8057888:	68 00 be 05 08       	push   $0x805be00
 805788d:	e8 ee d1 ff ff       	call   0x8054a80
 8057892:	89 c3                	mov    %eax,%ebx
 8057894:	83 c4 18             	add    $0x18,%esp
 8057897:	85 db                	test   %ebx,%ebx
 8057899:	0f 8c e3 00 00 00    	jl     0x8057982
 805789f:	a1 88 bd 05 08       	mov    0x805bd88,%eax
 80578a4:	8b 38                	mov    (%eax),%edi
 80578a6:	29 df                	sub    %ebx,%edi
 80578a8:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 80578af:	75 0f                	jne    0x80578c0
 80578b1:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 80578b8:	0f 84 d8 00 00 00    	je     0x8057996
 80578be:	eb 09                	jmp    0x80578c9
 80578c0:	3b 7d dc             	cmp    0xffffffdc(%ebp),%edi
 80578c3:	0f 84 cd 00 00 00    	je     0x8057996
 80578c9:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 80578d0:	0f 84 ac 00 00 00    	je     0x8057982
 80578d6:	85 db                	test   %ebx,%ebx
 80578d8:	0f 8c a4 00 00 00    	jl     0x8057982
 80578de:	74 18                	je     0x80578f8
 80578e0:	31 d2                	xor    %edx,%edx
 80578e2:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 80578e7:	8a 54 1e ff          	mov    0xffffffff(%esi,%ebx,1),%dl
 80578eb:	f6 04 50 08          	testb  $0x8,(%eax,%edx,2)
 80578ef:	75 2c                	jne    0x805791d
 80578f1:	80 7c 1e ff 5f       	cmpb   $0x5f,0xffffffff(%esi,%ebx,1)
 80578f6:	74 25                	je     0x805791d
 80578f8:	3b 7d e0             	cmp    0xffffffe0(%ebp),%edi
 80578fb:	0f 84 95 00 00 00    	je     0x8057996
 8057901:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
 8057904:	89 55 d8             	mov    %edx,0xffffffd8(%ebp)
 8057907:	31 c9                	xor    %ecx,%ecx
 8057909:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 805790e:	8a 0c 32             	mov    (%edx,%esi,1),%cl
 8057911:	f6 04 48 08          	testb  $0x8,(%eax,%ecx,2)
 8057915:	75 06                	jne    0x805791d
 8057917:	80 3c 32 5f          	cmpb   $0x5f,(%edx,%esi,1)
 805791b:	75 79                	jne    0x8057996
 805791d:	85 ff                	test   %edi,%edi
 805791f:	7e 26                	jle    0x8057947
 8057921:	80 0d 1c be 05 08 40 	orb    $0x40,0x805be1c
 8057928:	68 80 bd 05 08       	push   $0x805bd80
 805792d:	53                   	push   %ebx
 805792e:	8d 44 3b ff          	lea    0xffffffff(%ebx,%edi,1),%eax
 8057932:	50                   	push   %eax
 8057933:	56                   	push   %esi
 8057934:	68 00 be 05 08       	push   $0x805be00
 8057939:	e8 72 d3 ff ff       	call   0x8054cb0
 805793e:	89 c7                	mov    %eax,%edi
 8057940:	83 c4 14             	add    $0x14,%esp
 8057943:	85 ff                	test   %edi,%edi
 8057945:	7f 8f                	jg     0x80578d6
 8057947:	3b 5d e0             	cmp    0xffffffe0(%ebp),%ebx
 805794a:	74 36                	je     0x8057982
 805794c:	43                   	inc    %ebx
 805794d:	80 25 1c be 05 08 bf 	andb   $0xbf,0x805be1c
 8057954:	68 80 bd 05 08       	push   $0x805bd80
 8057959:	8b 45 dc             	mov    0xffffffdc(%ebp),%eax
 805795c:	29 d8                	sub    %ebx,%eax
 805795e:	50                   	push   %eax
 805795f:	53                   	push   %ebx
 8057960:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 8057963:	52                   	push   %edx
 8057964:	56                   	push   %esi
 8057965:	68 00 be 05 08       	push   $0x805be00
 805796a:	e8 11 d1 ff ff       	call   0x8054a80
 805796f:	89 c3                	mov    %eax,%ebx
 8057971:	a1 88 bd 05 08       	mov    0x805bd88,%eax
 8057976:	83 c4 18             	add    $0x18,%esp
 8057979:	8b 38                	mov    (%eax),%edi
 805797b:	29 df                	sub    %ebx,%edi
 805797d:	e9 54 ff ff ff       	jmp    0x80578d6
 8057982:	8b 75 e8             	mov    0xffffffe8(%ebp),%esi
 8057985:	46                   	inc    %esi
 8057986:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
 8057989:	39 4d e8             	cmp    %ecx,0xffffffe8(%ebp)
 805798c:	0f 82 ce fd ff ff    	jb     0x8057760
 8057992:	31 c0                	xor    %eax,%eax
 8057994:	eb 17                	jmp    0x80579ad
 8057996:	8b 55 10             	mov    0x10(%ebp),%edx
 8057999:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 805799c:	89 0a                	mov    %ecx,(%edx)
 805799e:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 80579a1:	39 d1                	cmp    %edx,%ecx
 80579a3:	73 06                	jae    0x80579ab
 80579a5:	41                   	inc    %ecx
 80579a6:	8b 55 10             	mov    0x10(%ebp),%edx
 80579a9:	89 0a                	mov    %ecx,(%edx)
 80579ab:	89 f0                	mov    %esi,%eax
 80579ad:	8d 65 c8             	lea    0xffffffc8(%ebp),%esp
 80579b0:	5b                   	pop    %ebx
 80579b1:	5e                   	pop    %esi
 80579b2:	5f                   	pop    %edi
 80579b3:	89 ec                	mov    %ebp,%esp
 80579b5:	5d                   	pop    %ebp
 80579b6:	c3                   	ret    
 80579b7:	89 f6                	mov    %esi,%esi
 80579b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 80579c0:	55                   	push   %ebp
 80579c1:	89 e5                	mov    %esp,%ebp
 80579c3:	57                   	push   %edi
 80579c4:	56                   	push   %esi
 80579c5:	53                   	push   %ebx
 80579c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80579c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 80579cc:	e8 ff f7 ff ff       	call   0x80571d0
 80579d1:	89 da                	mov    %ebx,%edx
 80579d3:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
 80579d6:	89 df                	mov    %ebx,%edi
 80579d8:	89 d6                	mov    %edx,%esi
 80579da:	39 fa                	cmp    %edi,%edx
 80579dc:	73 0c                	jae    0x80579ea
 80579de:	89 f6                	mov    %esi,%esi
 80579e0:	80 3e 0a             	cmpb   $0xa,(%esi)
 80579e3:	74 05                	je     0x80579ea
 80579e5:	46                   	inc    %esi
 80579e6:	39 de                	cmp    %ebx,%esi
 80579e8:	72 f6                	jb     0x80579e0
 80579ea:	89 f0                	mov    %esi,%eax
 80579ec:	29 d0                	sub    %edx,%eax
 80579ee:	50                   	push   %eax
 80579ef:	52                   	push   %edx
 80579f0:	a1 20 be 05 08       	mov    0x805be20,%eax
 80579f5:	50                   	push   %eax
 80579f6:	e8 15 8b ff ff       	call   0x8050510
 80579fb:	83 c4 0c             	add    $0xc,%esp
 80579fe:	85 c0                	test   %eax,%eax
 8057a00:	74 0e                	je     0x8057a10
 8057a02:	6a 00                	push   $0x0
 8057a04:	50                   	push   %eax
 8057a05:	e8 46 19 ff ff       	call   0x8049350
 8057a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8057a10:	39 de                	cmp    %ebx,%esi
 8057a12:	73 01                	jae    0x8057a15
 8057a14:	46                   	inc    %esi
 8057a15:	89 f2                	mov    %esi,%edx
 8057a17:	39 da                	cmp    %ebx,%edx
 8057a19:	72 bd                	jb     0x80579d8
 8057a1b:	a1 20 be 05 08       	mov    0x805be20,%eax
 8057a20:	50                   	push   %eax
 8057a21:	e8 ca 91 ff ff       	call   0x8050bf0
 8057a26:	83 c4 04             	add    $0x4,%esp
 8057a29:	85 c0                	test   %eax,%eax
 8057a2b:	74 08                	je     0x8057a35
 8057a2d:	6a 00                	push   $0x0
 8057a2f:	50                   	push   %eax
 8057a30:	e8 1b 19 ff ff       	call   0x8049350
 8057a35:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
 8057a38:	5b                   	pop    %ebx
 8057a39:	5e                   	pop    %esi
 8057a3a:	5f                   	pop    %edi
 8057a3b:	89 ec                	mov    %ebp,%esp
 8057a3d:	5d                   	pop    %ebp
 8057a3e:	c3                   	ret    
 8057a3f:	90                   	nop    
 8057a40:	55                   	push   %ebp
 8057a41:	89 e5                	mov    %esp,%ebp
 8057a43:	83 ec 18             	sub    $0x18,%esp
 8057a46:	57                   	push   %edi
 8057a47:	56                   	push   %esi
 8057a48:	53                   	push   %ebx
 8057a49:	8a 15 2c be 05 08    	mov    0x805be2c,%dl
 8057a4f:	88 55 f3             	mov    %dl,0xfffffff3(%ebp)
 8057a52:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8057a55:	89 d8                	mov    %ebx,%eax
 8057a57:	03 45 0c             	add    0xc(%ebp),%eax
 8057a5a:	39 c3                	cmp    %eax,%ebx
 8057a5c:	0f 87 ee 00 00 00    	ja     0x8057b50
 8057a62:	8d 55 f4             	lea    0xfffffff4(%ebp),%edx
 8057a65:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8057a68:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
 8057a6b:	89 c7                	mov    %eax,%edi
 8057a6d:	8d 76 00             	lea    0x0(%esi),%esi
 8057a70:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8057a73:	52                   	push   %edx
 8057a74:	89 f8                	mov    %edi,%eax
 8057a76:	29 d8                	sub    %ebx,%eax
 8057a78:	50                   	push   %eax
 8057a79:	53                   	push   %ebx
 8057a7a:	a1 20 be 05 08       	mov    0x805be20,%eax
 8057a7f:	50                   	push   %eax
 8057a80:	e8 bb 99 ff ff       	call   0x8051440
 8057a85:	89 c3                	mov    %eax,%ebx
 8057a87:	83 c4 10             	add    $0x10,%esp
 8057a8a:	85 db                	test   %ebx,%ebx
 8057a8c:	0f 84 be 00 00 00    	je     0x8057b50
 8057a92:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 8057a95:	83 3d 28 be 05 08 00 	cmpl   $0x0,0x805be28
 8057a9c:	74 22                	je     0x8057ac0
 8057a9e:	3b 5d 08             	cmp    0x8(%ebp),%ebx
 8057aa1:	76 08                	jbe    0x8057aab
 8057aa3:	8a 55 f3             	mov    0xfffffff3(%ebp),%dl
 8057aa6:	38 53 ff             	cmp    %dl,0xffffffff(%ebx)
 8057aa9:	75 7c                	jne    0x8057b27
 8057aab:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
 8057aae:	39 f8                	cmp    %edi,%eax
 8057ab0:	0f 83 7c 00 00 00    	jae    0x8057b32
 8057ab6:	8a 55 f3             	mov    0xfffffff3(%ebp),%dl
 8057ab9:	38 10                	cmp    %dl,(%eax)
 8057abb:	75 6a                	jne    0x8057b27
 8057abd:	eb 73                	jmp    0x8057b32
 8057abf:	90                   	nop    
 8057ac0:	83 3d 30 be 05 08 00 	cmpl   $0x0,0x805be30
 8057ac7:	74 69                	je     0x8057b32
 8057ac9:	89 d9                	mov    %ebx,%ecx
 8057acb:	85 f6                	test   %esi,%esi
 8057acd:	74 58                	je     0x8057b27
 8057acf:	90                   	nop    
 8057ad0:	85 c9                	test   %ecx,%ecx
 8057ad2:	74 53                	je     0x8057b27
 8057ad4:	3b 4d 08             	cmp    0x8(%ebp),%ecx
 8057ad7:	76 16                	jbe    0x8057aef
 8057ad9:	31 d2                	xor    %edx,%edx
 8057adb:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8057ae0:	8a 51 ff             	mov    0xffffffff(%ecx),%dl
 8057ae3:	f6 04 50 08          	testb  $0x8,(%eax,%edx,2)
 8057ae7:	75 3e                	jne    0x8057b27
 8057ae9:	80 79 ff 5f          	cmpb   $0x5f,0xffffffff(%ecx)
 8057aed:	74 38                	je     0x8057b27
 8057aef:	01 f1                	add    %esi,%ecx
 8057af1:	39 f9                	cmp    %edi,%ecx
 8057af3:	73 3d                	jae    0x8057b32
 8057af5:	31 d2                	xor    %edx,%edx
 8057af7:	a1 d4 b2 05 08       	mov    0x805b2d4,%eax
 8057afc:	8a 11                	mov    (%ecx),%dl
 8057afe:	f6 04 50 08          	testb  $0x8,(%eax,%edx,2)
 8057b02:	75 05                	jne    0x8057b09
 8057b04:	80 39 5f             	cmpb   $0x5f,(%ecx)
 8057b07:	75 29                	jne    0x8057b32
 8057b09:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8057b0c:	52                   	push   %edx
 8057b0d:	4e                   	dec    %esi
 8057b0e:	56                   	push   %esi
 8057b0f:	53                   	push   %ebx
 8057b10:	a1 20 be 05 08       	mov    0x805be20,%eax
 8057b15:	50                   	push   %eax
 8057b16:	e8 25 99 ff ff       	call   0x8051440
 8057b1b:	89 c1                	mov    %eax,%ecx
 8057b1d:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 8057b20:	83 c4 10             	add    $0x10,%esp
 8057b23:	85 f6                	test   %esi,%esi
 8057b25:	75 a9                	jne    0x8057ad0
 8057b27:	43                   	inc    %ebx
 8057b28:	39 fb                	cmp    %edi,%ebx
 8057b2a:	0f 86 40 ff ff ff    	jbe    0x8057a70
 8057b30:	eb 1e                	jmp    0x8057b50
 8057b32:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
 8057b35:	29 d7                	sub    %edx,%edi
 8057b37:	57                   	push   %edi
 8057b38:	0f be 45 f3          	movsbl 0xfffffff3(%ebp),%eax
 8057b3c:	50                   	push   %eax
 8057b3d:	52                   	push   %edx
 8057b3e:	e8 a9 14 ff ff       	call   0x8048fec
 8057b43:	89 c1                	mov    %eax,%ecx
 8057b45:	85 c9                	test   %ecx,%ecx
 8057b47:	74 0b                	je     0x8057b54
 8057b49:	41                   	inc    %ecx
 8057b4a:	eb 0b                	jmp    0x8057b57
 8057b4c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8057b50:	31 c0                	xor    %eax,%eax
 8057b52:	eb 1b                	jmp    0x8057b6f
 8057b54:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 8057b57:	8b 45 10             	mov    0x10(%ebp),%eax
 8057b5a:	89 08                	mov    %ecx,(%eax)
 8057b5c:	3b 5d 08             	cmp    0x8(%ebp),%ebx
 8057b5f:	76 0c                	jbe    0x8057b6d
 8057b61:	80 7b ff 0a          	cmpb   $0xa,0xffffffff(%ebx)
 8057b65:	74 06                	je     0x8057b6d
 8057b67:	4b                   	dec    %ebx
 8057b68:	3b 5d 08             	cmp    0x8(%ebp),%ebx
 8057b6b:	77 f4                	ja     0x8057b61
 8057b6d:	89 d8                	mov    %ebx,%eax
 8057b6f:	8d 65 dc             	lea    0xffffffdc(%ebp),%esp
 8057b72:	5b                   	pop    %ebx
 8057b73:	5e                   	pop    %esi
 8057b74:	5f                   	pop    %edi
 8057b75:	89 ec                	mov    %ebp,%esp
 8057b77:	5d                   	pop    %ebp
 8057b78:	c3                   	ret    
 8057b79:	90                   	nop    
 8057b7a:	90                   	nop    
 8057b7b:	90                   	nop    
 8057b7c:	90                   	nop    
 8057b7d:	90                   	nop    
 8057b7e:	90                   	nop    
 8057b7f:	90                   	nop    
 8057b80:	55                   	push   %ebp
 8057b81:	89 e5                	mov    %esp,%ebp
 8057b83:	83 ec 44             	sub    $0x44,%esp
 8057b86:	57                   	push   %edi
 8057b87:	56                   	push   %esi
 8057b88:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 8057b8f:	8b 45 08             	mov    0x8(%ebp),%eax
 8057b92:	8b 55 0c             	mov    0xc(%ebp),%edx
 8057b95:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 8057b98:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 8057b9b:	8b 55 10             	mov    0x10(%ebp),%edx
 8057b9e:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8057ba1:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8057ba4:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 8057ba7:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 8057bab:	7d 2a                	jge    0x8057bd7
 8057bad:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,0xfffffffc(%ebp)
 8057bb4:	8b 4d f4             	mov    0xfffffff4(%ebp),%ecx
 8057bb7:	f7 d9                	neg    %ecx
 8057bb9:	89 4d c4             	mov    %ecx,0xffffffc4(%ebp)
 8057bbc:	89 ce                	mov    %ecx,%esi
 8057bbe:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8057bc1:	f7 d8                	neg    %eax
 8057bc3:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 8057bc6:	85 c9                	test   %ecx,%ecx
 8057bc8:	74 04                	je     0x8057bce
 8057bca:	48                   	dec    %eax
 8057bcb:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 8057bce:	8b 7d bc             	mov    0xffffffbc(%ebp),%edi
 8057bd1:	89 75 f4             	mov    %esi,0xfffffff4(%ebp)
 8057bd4:	89 7d f8             	mov    %edi,0xfffffff8(%ebp)
 8057bd7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 8057bdb:	7d 24                	jge    0x8057c01
 8057bdd:	f7 55 fc             	notl   0xfffffffc(%ebp)
 8057be0:	8b 45 10             	mov    0x10(%ebp),%eax
 8057be3:	f7 d8                	neg    %eax
 8057be5:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
 8057be8:	8b 75 14             	mov    0x14(%ebp),%esi
 8057beb:	f7 de                	neg    %esi
 8057bed:	85 c0                	test   %eax,%eax
 8057bef:	74 01                	je     0x8057bf2
 8057bf1:	4e                   	dec    %esi
 8057bf2:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 8057bf5:	8b 55 e4             	mov    0xffffffe4(%ebp),%edx
 8057bf8:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 8057bfb:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8057bfe:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 8057c01:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8057c04:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
 8057c07:	89 4d bc             	mov    %ecx,0xffffffbc(%ebp)
 8057c0a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 8057c0d:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
 8057c10:	8b 75 f8             	mov    0xfffffff8(%ebp),%esi
 8057c13:	85 c9                	test   %ecx,%ecx
 8057c15:	75 39                	jne    0x8057c50
 8057c17:	39 f7                	cmp    %esi,%edi
 8057c19:	76 0c                	jbe    0x8057c27
 8057c1b:	89 f2                	mov    %esi,%edx
 8057c1d:	f7 f7                	div    %edi,%eax
 8057c1f:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 8057c22:	e9 c9 00 00 00       	jmp    0x8057cf0
 8057c27:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
 8057c2b:	75 0b                	jne    0x8057c38
 8057c2d:	b8 01 00 00 00       	mov    $0x1,%eax
 8057c32:	31 d2                	xor    %edx,%edx
 8057c34:	f7 f7                	div    %edi,%eax
 8057c36:	89 c7                	mov    %eax,%edi
 8057c38:	89 f0                	mov    %esi,%eax
 8057c3a:	31 d2                	xor    %edx,%edx
 8057c3c:	f7 f7                	div    %edi,%eax
 8057c3e:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 8057c41:	89 d6                	mov    %edx,%esi
 8057c43:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
 8057c46:	f7 f7                	div    %edi,%eax
 8057c48:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 8057c4b:	e9 a7 00 00 00       	jmp    0x8057cf7
 8057c50:	39 75 bc             	cmp    %esi,0xffffffbc(%ebp)
 8057c53:	76 0c                	jbe    0x8057c61
 8057c55:	c7 45 c4 00 00 00 00 	movl   $0x0,0xffffffc4(%ebp)
 8057c5c:	e9 8f 00 00 00       	jmp    0x8057cf0
 8057c61:	0f bd 55 bc          	bsr    0xffffffbc(%ebp),%edx
 8057c65:	83 f2 1f             	xor    $0x1f,%edx
 8057c68:	89 55 c0             	mov    %edx,0xffffffc0(%ebp)
 8057c6b:	75 13                	jne    0x8057c80
 8057c6d:	3b 75 bc             	cmp    0xffffffbc(%ebp),%esi
 8057c70:	77 05                	ja     0x8057c77
 8057c72:	39 7d e0             	cmp    %edi,0xffffffe0(%ebp)
 8057c75:	72 de                	jb     0x8057c55
 8057c77:	c7 45 c4 01 00 00 00 	movl   $0x1,0xffffffc4(%ebp)
 8057c7e:	eb 70                	jmp    0x8057cf0
 8057c80:	c7 45 dc 20 00 00 00 	movl   $0x20,0xffffffdc(%ebp)
 8057c87:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 8057c8a:	29 4d dc             	sub    %ecx,0xffffffdc(%ebp)
 8057c8d:	8b 45 bc             	mov    0xffffffbc(%ebp),%eax
 8057c90:	d3 e0                	shl    %cl,%eax
 8057c92:	89 7d bc             	mov    %edi,0xffffffbc(%ebp)
 8057c95:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 8057c98:	d3 6d bc             	shrl   %cl,0xffffffbc(%ebp)
 8057c9b:	8b 55 bc             	mov    0xffffffbc(%ebp),%edx
 8057c9e:	09 d0                	or     %edx,%eax
 8057ca0:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 8057ca3:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 8057ca6:	d3 e7                	shl    %cl,%edi
 8057ca8:	89 75 d8             	mov    %esi,0xffffffd8(%ebp)
 8057cab:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 8057cae:	d3 6d d8             	shrl   %cl,0xffffffd8(%ebp)
 8057cb1:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 8057cb4:	d3 e6                	shl    %cl,%esi
 8057cb6:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
 8057cb9:	89 45 bc             	mov    %eax,0xffffffbc(%ebp)
 8057cbc:	8b 4d dc             	mov    0xffffffdc(%ebp),%ecx
 8057cbf:	d3 6d bc             	shrl   %cl,0xffffffbc(%ebp)
 8057cc2:	0b 75 bc             	or     0xffffffbc(%ebp),%esi
 8057cc5:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 8057cc8:	d3 e0                	shl    %cl,%eax
 8057cca:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
 8057ccd:	89 f0                	mov    %esi,%eax
 8057ccf:	8b 55 d8             	mov    0xffffffd8(%ebp),%edx
 8057cd2:	f7 75 c4             	div    0xffffffc4(%ebp),%eax
 8057cd5:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 8057cd8:	89 55 bc             	mov    %edx,0xffffffbc(%ebp)
 8057cdb:	f7 e7                	mul    %edi,%eax
 8057cdd:	89 c6                	mov    %eax,%esi
 8057cdf:	89 d7                	mov    %edx,%edi
 8057ce1:	3b 7d bc             	cmp    0xffffffbc(%ebp),%edi
 8057ce4:	77 07                	ja     0x8057ced
 8057ce6:	75 08                	jne    0x8057cf0
 8057ce8:	3b 75 e0             	cmp    0xffffffe0(%ebp),%esi
 8057ceb:	76 03                	jbe    0x8057cf0
 8057ced:	ff 4d c4             	decl   0xffffffc4(%ebp)
 8057cf0:	c7 45 bc 00 00 00 00 	movl   $0x0,0xffffffbc(%ebp)
 8057cf7:	8b 4d c4             	mov    0xffffffc4(%ebp),%ecx
 8057cfa:	89 4d d0             	mov    %ecx,0xffffffd0(%ebp)
 8057cfd:	8b 45 bc             	mov    0xffffffbc(%ebp),%eax
 8057d00:	89 45 d4             	mov    %eax,0xffffffd4(%ebp)
 8057d03:	8b 75 d0             	mov    0xffffffd0(%ebp),%esi
 8057d06:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8057d09:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
 8057d0d:	74 19                	je     0x8057d28
 8057d0f:	89 f0                	mov    %esi,%eax
 8057d11:	f7 d8                	neg    %eax
 8057d13:	89 45 c8             	mov    %eax,0xffffffc8(%ebp)
 8057d16:	89 fe                	mov    %edi,%esi
 8057d18:	f7 de                	neg    %esi
 8057d1a:	85 c0                	test   %eax,%eax
 8057d1c:	74 01                	je     0x8057d1f
 8057d1e:	4e                   	dec    %esi
 8057d1f:	89 75 cc             	mov    %esi,0xffffffcc(%ebp)
 8057d22:	8b 75 c8             	mov    0xffffffc8(%ebp),%esi
 8057d25:	8b 7d cc             	mov    0xffffffcc(%ebp),%edi
 8057d28:	89 f0                	mov    %esi,%eax
 8057d2a:	89 fa                	mov    %edi,%edx
 8057d2c:	8d 65 b4             	lea    0xffffffb4(%ebp),%esp
 8057d2f:	5e                   	pop    %esi
 8057d30:	5f                   	pop    %edi
 8057d31:	c9                   	leave  
 8057d32:	c3                   	ret    
 8057d33:	90                   	nop    
 8057d34:	90                   	nop    
 8057d35:	90                   	nop    
 8057d36:	90                   	nop    
 8057d37:	90                   	nop    
 8057d38:	90                   	nop    
 8057d39:	90                   	nop    
 8057d3a:	90                   	nop    
 8057d3b:	90                   	nop    
 8057d3c:	90                   	nop    
 8057d3d:	90                   	nop    
 8057d3e:	90                   	nop    
 8057d3f:	90                   	nop    
 8057d40:	55                   	push   %ebp
 8057d41:	89 e5                	mov    %esp,%ebp
 8057d43:	83 ec 54             	sub    $0x54,%esp
 8057d46:	57                   	push   %edi
 8057d47:	56                   	push   %esi
 8057d48:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
 8057d4f:	8b 55 08             	mov    0x8(%ebp),%edx
 8057d52:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8057d55:	89 55 ac             	mov    %edx,0xffffffac(%ebp)
 8057d58:	89 4d b0             	mov    %ecx,0xffffffb0(%ebp)
 8057d5b:	8b 55 10             	mov    0x10(%ebp),%edx
 8057d5e:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8057d61:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8057d64:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 8057d67:	83 7d b0 00          	cmpl   $0x0,0xffffffb0(%ebp)
 8057d6b:	7d 28                	jge    0x8057d95
 8057d6d:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,0xfffffff4(%ebp)
 8057d74:	8b 45 ac             	mov    0xffffffac(%ebp),%eax
 8057d77:	f7 d8                	neg    %eax
 8057d79:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
 8057d7c:	8b 75 b0             	mov    0xffffffb0(%ebp),%esi
 8057d7f:	f7 de                	neg    %esi
 8057d81:	85 c0                	test   %eax,%eax
 8057d83:	74 01                	je     0x8057d86
 8057d85:	4e                   	dec    %esi
 8057d86:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 8057d89:	8b 55 e4             	mov    0xffffffe4(%ebp),%edx
 8057d8c:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 8057d8f:	89 55 ac             	mov    %edx,0xffffffac(%ebp)
 8057d92:	89 4d b0             	mov    %ecx,0xffffffb0(%ebp)
 8057d95:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 8057d99:	7d 2a                	jge    0x8057dc5
 8057d9b:	8b 45 10             	mov    0x10(%ebp),%eax
 8057d9e:	f7 d8                	neg    %eax
 8057da0:	89 45 dc             	mov    %eax,0xffffffdc(%ebp)
 8057da3:	8b 4d 14             	mov    0x14(%ebp),%ecx
 8057da6:	f7 d9                	neg    %ecx
 8057da8:	89 4d b4             	mov    %ecx,0xffffffb4(%ebp)
 8057dab:	85 c0                	test   %eax,%eax
 8057dad:	74 04                	je     0x8057db3
 8057daf:	49                   	dec    %ecx
 8057db0:	89 4d b4             	mov    %ecx,0xffffffb4(%ebp)
 8057db3:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8057db6:	89 7d e0             	mov    %edi,0xffffffe0(%ebp)
 8057db9:	8b 55 dc             	mov    0xffffffdc(%ebp),%edx
 8057dbc:	8b 4d e0             	mov    0xffffffe0(%ebp),%ecx
 8057dbf:	89 55 ec             	mov    %edx,0xffffffec(%ebp)
 8057dc2:	89 4d f0             	mov    %ecx,0xfffffff0(%ebp)
 8057dc5:	8d 4d f8             	lea    0xfffffff8(%ebp),%ecx
 8057dc8:	89 4d d8             	mov    %ecx,0xffffffd8(%ebp)
 8057dcb:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
 8057dce:	89 7d d4             	mov    %edi,0xffffffd4(%ebp)
 8057dd1:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 8057dd4:	89 55 d0             	mov    %edx,0xffffffd0(%ebp)
 8057dd7:	8b 55 ac             	mov    0xffffffac(%ebp),%edx
 8057dda:	89 55 cc             	mov    %edx,0xffffffcc(%ebp)
 8057ddd:	8b 4d b0             	mov    0xffffffb0(%ebp),%ecx
 8057de0:	89 4d b4             	mov    %ecx,0xffffffb4(%ebp)
 8057de3:	83 7d d0 00          	cmpl   $0x0,0xffffffd0(%ebp)
 8057de7:	75 4f                	jne    0x8057e38
 8057de9:	39 cf                	cmp    %ecx,%edi
 8057deb:	76 08                	jbe    0x8057df5
 8057ded:	89 d0                	mov    %edx,%eax
 8057def:	89 ca                	mov    %ecx,%edx
 8057df1:	f7 f7                	div    %edi,%eax
 8057df3:	eb 24                	jmp    0x8057e19
 8057df5:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
 8057df9:	75 0d                	jne    0x8057e08
 8057dfb:	b8 01 00 00 00       	mov    $0x1,%eax
 8057e00:	31 d2                	xor    %edx,%edx
 8057e02:	f7 75 d4             	div    0xffffffd4(%ebp),%eax
 8057e05:	89 45 d4             	mov    %eax,0xffffffd4(%ebp)
 8057e08:	8b 45 b4             	mov    0xffffffb4(%ebp),%eax
 8057e0b:	31 d2                	xor    %edx,%edx
 8057e0d:	f7 75 d4             	div    0xffffffd4(%ebp),%eax
 8057e10:	89 55 b4             	mov    %edx,0xffffffb4(%ebp)
 8057e13:	8b 45 cc             	mov    0xffffffcc(%ebp),%eax
 8057e16:	f7 75 d4             	div    0xffffffd4(%ebp),%eax
 8057e19:	89 55 cc             	mov    %edx,0xffffffcc(%ebp)
 8057e1c:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 8057e20:	0f 84 30 01 00 00    	je     0x8057f56
 8057e26:	8b 55 cc             	mov    0xffffffcc(%ebp),%edx
 8057e29:	89 55 c4             	mov    %edx,0xffffffc4(%ebp)
 8057e2c:	c7 45 c8 00 00 00 00 	movl   $0x0,0xffffffc8(%ebp)
 8057e33:	e9 10 01 00 00       	jmp    0x8057f48
 8057e38:	8b 55 b4             	mov    0xffffffb4(%ebp),%edx
 8057e3b:	39 55 d0             	cmp    %edx,0xffffffd0(%ebp)
 8057e3e:	76 20                	jbe    0x8057e60
 8057e40:	8b 4d ac             	mov    0xffffffac(%ebp),%ecx
 8057e43:	89 4d c4             	mov    %ecx,0xffffffc4(%ebp)
 8057e46:	89 55 c8             	mov    %edx,0xffffffc8(%ebp)
 8057e49:	8b 55 c4             	mov    0xffffffc4(%ebp),%edx
 8057e4c:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 8057e4f:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 8057e52:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 8057e55:	e9 fc 00 00 00       	jmp    0x8057f56
 8057e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8057e60:	0f bd 75 d0          	bsr    0xffffffd0(%ebp),%esi
 8057e64:	83 f6 1f             	xor    $0x1f,%esi
 8057e67:	75 47                	jne    0x8057eb0
 8057e69:	8b 4d d0             	mov    0xffffffd0(%ebp),%ecx
 8057e6c:	39 4d b4             	cmp    %ecx,0xffffffb4(%ebp)
 8057e6f:	77 0f                	ja     0x8057e80
 8057e71:	8b 7d d4             	mov    0xffffffd4(%ebp),%edi
 8057e74:	39 7d cc             	cmp    %edi,0xffffffcc(%ebp)
 8057e77:	72 19                	jb     0x8057e92
 8057e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8057e80:	8b 4d b4             	mov    0xffffffb4(%ebp),%ecx
 8057e83:	8b 55 cc             	mov    0xffffffcc(%ebp),%edx
 8057e86:	2b 55 d4             	sub    0xffffffd4(%ebp),%edx
 8057e89:	1b 4d d0             	sbb    0xffffffd0(%ebp),%ecx
 8057e8c:	89 4d b4             	mov    %ecx,0xffffffb4(%ebp)
 8057e8f:	89 55 cc             	mov    %edx,0xffffffcc(%ebp)
 8057e92:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 8057e96:	0f 84 ba 00 00 00    	je     0x8057f56
 8057e9c:	8b 55 cc             	mov    0xffffffcc(%ebp),%edx
 8057e9f:	89 55 c4             	mov    %edx,0xffffffc4(%ebp)
 8057ea2:	8b 4d b4             	mov    0xffffffb4(%ebp),%ecx
 8057ea5:	89 4d c8             	mov    %ecx,0xffffffc8(%ebp)
 8057ea8:	e9 9b 00 00 00       	jmp    0x8057f48
 8057ead:	8d 76 00             	lea    0x0(%esi),%esi
 8057eb0:	c7 45 ac 20 00 00 00 	movl   $0x20,0xffffffac(%ebp)
 8057eb7:	29 75 ac             	sub    %esi,0xffffffac(%ebp)
 8057eba:	89 f1                	mov    %esi,%ecx
 8057ebc:	d3 65 d0             	shll   %cl,0xffffffd0(%ebp)
 8057ebf:	8b 45 d4             	mov    0xffffffd4(%ebp),%eax
 8057ec2:	8b 4d ac             	mov    0xffffffac(%ebp),%ecx
 8057ec5:	d3 e8                	shr    %cl,%eax
 8057ec7:	09 45 d0             	or     %eax,0xffffffd0(%ebp)
 8057eca:	89 f1                	mov    %esi,%ecx
 8057ecc:	d3 65 d4             	shll   %cl,0xffffffd4(%ebp)
 8057ecf:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8057ed2:	89 7d b8             	mov    %edi,0xffffffb8(%ebp)
 8057ed5:	8b 4d ac             	mov    0xffffffac(%ebp),%ecx
 8057ed8:	d3 6d b8             	shrl   %cl,0xffffffb8(%ebp)
 8057edb:	89 f1                	mov    %esi,%ecx
 8057edd:	d3 e7                	shl    %cl,%edi
 8057edf:	8b 45 cc             	mov    0xffffffcc(%ebp),%eax
 8057ee2:	8b 4d ac             	mov    0xffffffac(%ebp),%ecx
 8057ee5:	d3 e8                	shr    %cl,%eax
 8057ee7:	09 c7                	or     %eax,%edi
 8057ee9:	89 7d b4             	mov    %edi,0xffffffb4(%ebp)
 8057eec:	89 f1                	mov    %esi,%ecx
 8057eee:	d3 65 cc             	shll   %cl,0xffffffcc(%ebp)
 8057ef1:	89 f8                	mov    %edi,%eax
 8057ef3:	8b 55 b8             	mov    0xffffffb8(%ebp),%edx
 8057ef6:	f7 75 d0             	div    0xffffffd0(%ebp),%eax
 8057ef9:	89 55 b4             	mov    %edx,0xffffffb4(%ebp)
 8057efc:	f7 65 d4             	mul    0xffffffd4(%ebp),%eax
 8057eff:	89 55 b8             	mov    %edx,0xffffffb8(%ebp)
 8057f02:	8b 4d b4             	mov    0xffffffb4(%ebp),%ecx
 8057f05:	39 ca                	cmp    %ecx,%edx
 8057f07:	77 07                	ja     0x8057f10
 8057f09:	75 11                	jne    0x8057f1c
 8057f0b:	3b 45 cc             	cmp    0xffffffcc(%ebp),%eax
 8057f0e:	76 0c                	jbe    0x8057f1c
 8057f10:	8b 7d b8             	mov    0xffffffb8(%ebp),%edi
 8057f13:	2b 45 d4             	sub    0xffffffd4(%ebp),%eax
 8057f16:	1b 7d d0             	sbb    0xffffffd0(%ebp),%edi
 8057f19:	89 7d b8             	mov    %edi,0xffffffb8(%ebp)
 8057f1c:	83 7d d8 00          	cmpl   $0x0,0xffffffd8(%ebp)
 8057f20:	74 34                	je     0x8057f56
 8057f22:	8b 4d b4             	mov    0xffffffb4(%ebp),%ecx
 8057f25:	8b 55 cc             	mov    0xffffffcc(%ebp),%edx
 8057f28:	29 c2                	sub    %eax,%edx
 8057f2a:	1b 4d b8             	sbb    0xffffffb8(%ebp),%ecx
 8057f2d:	89 4d b4             	mov    %ecx,0xffffffb4(%ebp)
 8057f30:	89 c8                	mov    %ecx,%eax
 8057f32:	8b 4d ac             	mov    0xffffffac(%ebp),%ecx
 8057f35:	d3 e0                	shl    %cl,%eax
 8057f37:	89 f1                	mov    %esi,%ecx
 8057f39:	d3 ea                	shr    %cl,%edx
 8057f3b:	09 d0                	or     %edx,%eax
 8057f3d:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
 8057f40:	8b 7d b4             	mov    0xffffffb4(%ebp),%edi
 8057f43:	d3 ef                	shr    %cl,%edi
 8057f45:	89 7d c8             	mov    %edi,0xffffffc8(%ebp)
 8057f48:	8b 55 c4             	mov    0xffffffc4(%ebp),%edx
 8057f4b:	8b 4d c8             	mov    0xffffffc8(%ebp),%ecx
 8057f4e:	8b 7d d8             	mov    0xffffffd8(%ebp),%edi
 8057f51:	89 17                	mov    %edx,(%edi)
 8057f53:	89 4f 04             	mov    %ecx,0x4(%edi)
 8057f56:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
 8057f5a:	74 25                	je     0x8057f81
 8057f5c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8057f5f:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8057f62:	89 c1                	mov    %eax,%ecx
 8057f64:	f7 d9                	neg    %ecx
 8057f66:	89 4d bc             	mov    %ecx,0xffffffbc(%ebp)
 8057f69:	89 d0                	mov    %edx,%eax
 8057f6b:	f7 d8                	neg    %eax
 8057f6d:	85 c9                	test   %ecx,%ecx
 8057f6f:	74 01                	je     0x8057f72
 8057f71:	48                   	dec    %eax
 8057f72:	89 45 c0             	mov    %eax,0xffffffc0(%ebp)
 8057f75:	8b 55 bc             	mov    0xffffffbc(%ebp),%edx
 8057f78:	8b 4d c0             	mov    0xffffffc0(%ebp),%ecx
 8057f7b:	89 55 f8             	mov    %edx,0xfffffff8(%ebp)
 8057f7e:	89 4d fc             	mov    %ecx,0xfffffffc(%ebp)
 8057f81:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8057f84:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
 8057f87:	8d 65 a4             	lea    0xffffffa4(%ebp),%esp
 8057f8a:	5e                   	pop    %esi
 8057f8b:	5f                   	pop    %edi
 8057f8c:	c9                   	leave  
 8057f8d:	c3                   	ret    
 8057f8e:	90                   	nop    
 8057f8f:	90                   	nop    
 8057f90:	55                   	push   %ebp
 8057f91:	89 e5                	mov    %esp,%ebp
 8057f93:	53                   	push   %ebx
 8057f94:	bb 1c b1 05 08       	mov    $0x805b11c,%ebx
 8057f99:	83 3d 1c b1 05 08 ff 	cmpl   $0xffffffff,0x805b11c
 8057fa0:	74 0c                	je     0x8057fae
 8057fa2:	8b 03                	mov    (%ebx),%eax
 8057fa4:	ff d0                	call   *%eax
 8057fa6:	83 c3 fc             	add    $0xfffffffc,%ebx
 8057fa9:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 8057fac:	75 f4                	jne    0x8057fa2
 8057fae:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8057fb1:	c9                   	leave  
 8057fb2:	c3                   	ret    
 8057fb3:	90                   	nop    
 8057fb4:	55                   	push   %ebp
 8057fb5:	89 e5                	mov    %esp,%ebp
 8057fb7:	c9                   	leave  
 8057fb8:	c3                   	ret    
 8057fb9:	90                   	nop    
 8057fba:	90                   	nop    
 8057fbb:	90                   	nop    
Disassembly of section .fini:

08057fbc <.fini>:
 8057fbc:	55                   	push   %ebp
 8057fbd:	89 e5                	mov    %esp,%ebp
 8057fbf:	53                   	push   %ebx
 8057fc0:	e8 00 00 00 00       	call   0x8057fc5
 8057fc5:	5b                   	pop    %ebx
 8057fc6:	81 c3 67 31 00 00    	add    $0x3167,%ebx
 8057fcc:	e8 9f 12 ff ff       	call   0x8049270
 8057fd1:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8057fd4:	c9                   	leave  
 8057fd5:	c3                   	ret    
