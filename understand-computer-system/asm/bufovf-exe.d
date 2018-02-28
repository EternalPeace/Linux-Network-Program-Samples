
bufovf:     file format elf32-i386

Disassembly of section .init:

08048338 <_init>:
 8048338:	55                   	push   %ebp
 8048339:	89 e5                	mov    %esp,%ebp
 804833b:	83 ec 08             	sub    $0x8,%esp
 804833e:	e8 91 00 00 00       	call   80483d4 <call_gmon_start>
 8048343:	90                   	nop    
 8048344:	e8 17 01 00 00       	call   8048460 <frame_dummy>
 8048349:	e8 32 02 00 00       	call   8048580 <__do_global_ctors_aux>
 804834e:	c9                   	leave  
 804834f:	c3                   	ret    
Disassembly of section .plt:

08048350 <.plt>:
 8048350:	ff 35 08 96 04 08    	pushl  0x8049608
 8048356:	ff 25 0c 96 04 08    	jmp    *0x804960c
 804835c:	00 00                	add    %al,(%eax)
 804835e:	00 00                	add    %al,(%eax)
 8048360:	ff 25 10 96 04 08    	jmp    *0x8049610
 8048366:	68 00 00 00 00       	push   $0x0
 804836b:	e9 e0 ff ff ff       	jmp    8048350 <_init+0x18>
 8048370:	ff 25 14 96 04 08    	jmp    *0x8049614
 8048376:	68 08 00 00 00       	push   $0x8
 804837b:	e9 d0 ff ff ff       	jmp    8048350 <_init+0x18>
 8048380:	ff 25 18 96 04 08    	jmp    *0x8049618
 8048386:	68 10 00 00 00       	push   $0x10
 804838b:	e9 c0 ff ff ff       	jmp    8048350 <_init+0x18>
 8048390:	ff 25 1c 96 04 08    	jmp    *0x804961c
 8048396:	68 18 00 00 00       	push   $0x18
 804839b:	e9 b0 ff ff ff       	jmp    8048350 <_init+0x18>
 80483a0:	ff 25 20 96 04 08    	jmp    *0x8049620
 80483a6:	68 20 00 00 00       	push   $0x20
 80483ab:	e9 a0 ff ff ff       	jmp    8048350 <_init+0x18>
Disassembly of section .text:

080483b0 <_start>:
 80483b0:	31 ed                	xor    %ebp,%ebp
 80483b2:	5e                   	pop    %esi
 80483b3:	89 e1                	mov    %esp,%ecx
 80483b5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483b8:	50                   	push   %eax
 80483b9:	54                   	push   %esp
 80483ba:	52                   	push   %edx
 80483bb:	68 b0 85 04 08       	push   $0x80485b0
 80483c0:	68 38 83 04 08       	push   $0x8048338
 80483c5:	51                   	push   %ecx
 80483c6:	56                   	push   %esi
 80483c7:	68 50 85 04 08       	push   $0x8048550
 80483cc:	e8 bf ff ff ff       	call   8048390 <_init+0x58>
 80483d1:	f4                   	hlt    
 80483d2:	89 f6                	mov    %esi,%esi

080483d4 <call_gmon_start>:
 80483d4:	55                   	push   %ebp
 80483d5:	89 e5                	mov    %esp,%ebp
 80483d7:	53                   	push   %ebx
 80483d8:	50                   	push   %eax
 80483d9:	e8 00 00 00 00       	call   80483de <call_gmon_start+0xa>
 80483de:	5b                   	pop    %ebx
 80483df:	81 c3 26 12 00 00    	add    $0x1226,%ebx
 80483e5:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
 80483eb:	85 c0                	test   %eax,%eax
 80483ed:	74 02                	je     80483f1 <call_gmon_start+0x1d>
 80483ef:	ff d0                	call   *%eax
 80483f1:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80483f4:	c9                   	leave  
 80483f5:	c3                   	ret    
 80483f6:	89 f6                	mov    %esi,%esi
 80483f8:	90                   	nop    
 80483f9:	90                   	nop    
 80483fa:	90                   	nop    
 80483fb:	90                   	nop    
 80483fc:	90                   	nop    
 80483fd:	90                   	nop    
 80483fe:	90                   	nop    
 80483ff:	90                   	nop    

08048400 <__do_global_dtors_aux>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	83 ec 08             	sub    $0x8,%esp
 8048406:	80 3d d0 96 04 08 00 	cmpb   $0x0,0x80496d0
 804840d:	75 42                	jne    8048451 <__do_global_dtors_aux+0x51>
 804840f:	a1 e8 95 04 08       	mov    0x80495e8,%eax
 8048414:	8b 10                	mov    (%eax),%edx
 8048416:	85 d2                	test   %edx,%edx
 8048418:	74 1b                	je     8048435 <__do_global_dtors_aux+0x35>
 804841a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048420:	83 c0 04             	add    $0x4,%eax
 8048423:	a3 e8 95 04 08       	mov    %eax,0x80495e8
 8048428:	ff d2                	call   *%edx
 804842a:	a1 e8 95 04 08       	mov    0x80495e8,%eax
 804842f:	8b 10                	mov    (%eax),%edx
 8048431:	85 d2                	test   %edx,%edx
 8048433:	75 eb                	jne    8048420 <__do_global_dtors_aux+0x20>
 8048435:	b8 00 00 00 00       	mov    $0x0,%eax
 804843a:	85 c0                	test   %eax,%eax
 804843c:	74 0c                	je     804844a <__do_global_dtors_aux+0x4a>
 804843e:	c7 04 24 f0 95 04 08 	movl   $0x80495f0,(%esp,1)
 8048445:	e8 b6 7b fb f7       	call   0 <_init-0x8048338>
 804844a:	c6 05 d0 96 04 08 01 	movb   $0x1,0x80496d0
 8048451:	c9                   	leave  
 8048452:	c3                   	ret    
 8048453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

08048460 <frame_dummy>:
 8048460:	55                   	push   %ebp
 8048461:	b8 00 00 00 00       	mov    $0x0,%eax
 8048466:	89 e5                	mov    %esp,%ebp
 8048468:	e8 00 00 00 00       	call   804846d <frame_dummy+0xd>
 804846d:	5a                   	pop    %edx
 804846e:	81 c2 97 11 00 00    	add    $0x1197,%edx
 8048474:	83 ec 18             	sub    $0x18,%esp
 8048477:	85 c0                	test   %eax,%eax
 8048479:	74 20                	je     804849b <frame_dummy+0x3b>
 804847b:	89 54 24 0c          	mov    %edx,0xc(%esp,1)
 804847f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp,1)
 8048486:	00 
 8048487:	c7 44 24 04 d4 96 04 	movl   $0x80496d4,0x4(%esp,1)
 804848e:	08 
 804848f:	c7 04 24 f0 95 04 08 	movl   $0x80495f0,(%esp,1)
 8048496:	e8 65 7b fb f7       	call   0 <_init-0x8048338>
 804849b:	a1 ec 95 04 08       	mov    0x80495ec,%eax
 80484a0:	85 c0                	test   %eax,%eax
 80484a2:	74 15                	je     80484b9 <frame_dummy+0x59>
 80484a4:	b8 00 00 00 00       	mov    $0x0,%eax
 80484a9:	85 c0                	test   %eax,%eax
 80484ab:	74 0c                	je     80484b9 <frame_dummy+0x59>
 80484ad:	c7 04 24 ec 95 04 08 	movl   $0x80495ec,(%esp,1)
 80484b4:	e8 47 7b fb f7       	call   0 <_init-0x8048338>
 80484b9:	89 ec                	mov    %ebp,%esp
 80484bb:	5d                   	pop    %ebp
 80484bc:	c3                   	ret    
 80484bd:	8d 76 00             	lea    0x0(%esi),%esi

080484c0 <strlen>:
 80484c0:	55                   	push   %ebp
 80484c1:	89 e5                	mov    %esp,%ebp
 80484c3:	8b 55 08             	mov    0x8(%ebp),%edx
 80484c6:	31 c9                	xor    %ecx,%ecx
 80484c8:	0f b6 02             	movzbl (%edx),%eax
 80484cb:	42                   	inc    %edx
 80484cc:	84 c0                	test   %al,%al
 80484ce:	74 09                	je     80484d9 <strlen+0x19>
 80484d0:	0f b6 02             	movzbl (%edx),%eax
 80484d3:	41                   	inc    %ecx
 80484d4:	42                   	inc    %edx
 80484d5:	84 c0                	test   %al,%al
 80484d7:	75 f7                	jne    80484d0 <strlen+0x10>
 80484d9:	5d                   	pop    %ebp
 80484da:	89 c8                	mov    %ecx,%eax
 80484dc:	c3                   	ret    
 80484dd:	8d 76 00             	lea    0x0(%esi),%esi

080484e0 <strcpy>:
 80484e0:	55                   	push   %ebp
 80484e1:	89 e5                	mov    %esp,%ebp
 80484e3:	53                   	push   %ebx
 80484e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80484e7:	8b 55 0c             	mov    0xc(%ebp),%edx
 80484ea:	89 cb                	mov    %ecx,%ebx
 80484ec:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80484f0:	0f b6 02             	movzbl (%edx),%eax
 80484f3:	42                   	inc    %edx
 80484f4:	88 01                	mov    %al,(%ecx)
 80484f6:	41                   	inc    %ecx
 80484f7:	84 c0                	test   %al,%al
 80484f9:	75 f5                	jne    80484f0 <strcpy+0x10>
 80484fb:	89 d8                	mov    %ebx,%eax
 80484fd:	5b                   	pop    %ebx
 80484fe:	5d                   	pop    %ebp
 80484ff:	c3                   	ret    

08048500 <getline>:
 8048500:	55                   	push   %ebp
 8048501:	89 e5                	mov    %esp,%ebp
 8048503:	83 ec 18             	sub    $0x18,%esp
 8048506:	89 5d f8             	mov    %ebx,0xfffffff8(%ebp)
 8048509:	8d 5d f0             	lea    0xfffffff0(%ebp),%ebx
 804850c:	89 75 fc             	mov    %esi,0xfffffffc(%ebp)
 804850f:	89 1c 24             	mov    %ebx,(%esp,1)
 8048512:	e8 49 fe ff ff       	call   8048360 <_init+0x28>
 8048517:	89 1c 24             	mov    %ebx,(%esp,1)
 804851a:	e8 a1 ff ff ff       	call   80484c0 <strlen>
 804851f:	89 04 24             	mov    %eax,(%esp,1)
 8048522:	e8 59 fe ff ff       	call   8048380 <_init+0x48>
 8048527:	89 04 24             	mov    %eax,(%esp,1)
 804852a:	89 c6                	mov    %eax,%esi
 804852c:	89 5c 24 04          	mov    %ebx,0x4(%esp,1)
 8048530:	e8 ab ff ff ff       	call   80484e0 <strcpy>
 8048535:	8b 5d f8             	mov    0xfffffff8(%ebp),%ebx
 8048538:	89 f0                	mov    %esi,%eax
 804853a:	8b 75 fc             	mov    0xfffffffc(%ebp),%esi
 804853d:	89 ec                	mov    %ebp,%esp
 804853f:	5d                   	pop    %ebp
 8048540:	c3                   	ret    
 8048541:	eb 0d                	jmp    8048550 <main>
 8048543:	90                   	nop    
 8048544:	90                   	nop    
 8048545:	90                   	nop    
 8048546:	90                   	nop    
 8048547:	90                   	nop    
 8048548:	90                   	nop    
 8048549:	90                   	nop    
 804854a:	90                   	nop    
 804854b:	90                   	nop    
 804854c:	90                   	nop    
 804854d:	90                   	nop    
 804854e:	90                   	nop    
 804854f:	90                   	nop    

08048550 <main>:
 8048550:	55                   	push   %ebp
 8048551:	89 e5                	mov    %esp,%ebp
 8048553:	83 ec 08             	sub    $0x8,%esp
 8048556:	83 e4 f0             	and    $0xfffffff0,%esp
 8048559:	c7 04 24 d8 85 04 08 	movl   $0x80485d8,(%esp,1)
 8048560:	e8 3b fe ff ff       	call   80483a0 <_init+0x68>
 8048565:	e8 96 ff ff ff       	call   8048500 <getline>
 804856a:	89 04 24             	mov    %eax,(%esp,1)
 804856d:	e8 fe fd ff ff       	call   8048370 <_init+0x38>
 8048572:	89 ec                	mov    %ebp,%esp
 8048574:	31 c0                	xor    %eax,%eax
 8048576:	5d                   	pop    %ebp
 8048577:	c3                   	ret    
 8048578:	90                   	nop    
 8048579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi

08048580 <__do_global_ctors_aux>:
 8048580:	55                   	push   %ebp
 8048581:	89 e5                	mov    %esp,%ebp
 8048583:	53                   	push   %ebx
 8048584:	83 ec 04             	sub    $0x4,%esp
 8048587:	a1 f4 95 04 08       	mov    0x80495f4,%eax
 804858c:	bb f4 95 04 08       	mov    $0x80495f4,%ebx
 8048591:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048594:	74 16                	je     80485ac <__do_global_ctors_aux+0x2c>
 8048596:	8d 76 00             	lea    0x0(%esi),%esi
 8048599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 80485a0:	83 eb 04             	sub    $0x4,%ebx
 80485a3:	ff d0                	call   *%eax
 80485a5:	8b 03                	mov    (%ebx),%eax
 80485a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485aa:	75 f4                	jne    80485a0 <__do_global_ctors_aux+0x20>
 80485ac:	58                   	pop    %eax
 80485ad:	5b                   	pop    %ebx
 80485ae:	5d                   	pop    %ebp
 80485af:	c3                   	ret    
Disassembly of section .fini:

080485b0 <_fini>:
 80485b0:	55                   	push   %ebp
 80485b1:	89 e5                	mov    %esp,%ebp
 80485b3:	53                   	push   %ebx
 80485b4:	52                   	push   %edx
 80485b5:	e8 00 00 00 00       	call   80485ba <gcc2_compiled.+0xa>
 80485ba:	5b                   	pop    %ebx
 80485bb:	81 c3 4a 10 00 00    	add    $0x104a,%ebx
 80485c1:	8d 76 00             	lea    0x0(%esi),%esi
 80485c4:	e8 37 fe ff ff       	call   8048400 <__do_global_dtors_aux>
 80485c9:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80485cc:	c9                   	leave  
 80485cd:	c3                   	ret    
