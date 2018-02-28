
eg-dis:     file format elf64-x86-64

Disassembly of section .init:

0000000000400370 <_init>:
  400370:	48 83 ec 08          	sub    $0x8,%rsp
  400374:	e8 63 00 00 00       	callq  4003dc <call_gmon_start>
  400379:	e8 c2 00 00 00       	callq  400440 <frame_dummy>
  40037e:	e8 cd 01 00 00       	callq  400550 <__do_global_ctors_aux>
  400383:	48 83 c4 08          	add    $0x8,%rsp
  400387:	c3                   	retq   
Disassembly of section .plt:

0000000000400388 <__libc_start_main@plt-0x10>:
  400388:	ff 35 ba 04 10 00    	pushq  1049786(%rip)        # 500848 <_GLOBAL_OFFSET_TABLE_+0x8>
  40038e:	ff 25 bc 04 10 00    	jmpq   *1049788(%rip)        # 500850 <_GLOBAL_OFFSET_TABLE_+0x10>
  400394:	90                   	nop    
  400395:	90                   	nop    
  400396:	90                   	nop    
  400397:	90                   	nop    

0000000000400398 <__libc_start_main@plt>:
  400398:	ff 25 ba 04 10 00    	jmpq   *1049786(%rip)        # 500858 <_GLOBAL_OFFSET_TABLE_+0x18>
  40039e:	68 00 00 00 00       	pushq  $0x0
  4003a3:	e9 e0 ff ff ff       	jmpq   400388 <_init+0x18>
Disassembly of section .text:

00000000004003b0 <_start>:
  4003b0:	48 31 ed             	xor    %rbp,%rbp
  4003b3:	49 89 d1             	mov    %rdx,%r9
  4003b6:	5e                   	pop    %rsi
  4003b7:	48 89 e2             	mov    %rsp,%rdx
  4003ba:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4003be:	50                   	push   %rax
  4003bf:	54                   	push   %rsp
  4003c0:	49 c7 c0 10 05 40 00 	mov    $0x400510,%r8
  4003c7:	48 c7 c1 b0 04 40 00 	mov    $0x4004b0,%rcx
  4003ce:	48 c7 c7 90 04 40 00 	mov    $0x400490,%rdi
  4003d5:	e8 be ff ff ff       	callq  400398 <__libc_start_main@plt>
  4003da:	f4                   	hlt    
  4003db:	90                   	nop    

00000000004003dc <call_gmon_start>:
  4003dc:	48 83 ec 08          	sub    $0x8,%rsp
  4003e0:	48 8b 05 51 04 10 00 	mov    1049681(%rip),%rax        # 500838 <_DYNAMIC+0x190>
  4003e7:	48 85 c0             	test   %rax,%rax
  4003ea:	74 02                	je     4003ee <call_gmon_start+0x12>
  4003ec:	ff d0                	callq  *%eax
  4003ee:	48 83 c4 08          	add    $0x8,%rsp
  4003f2:	c3                   	retq   
  4003f3:	90                   	nop    
  4003f4:	90                   	nop    
  4003f5:	90                   	nop    
  4003f6:	90                   	nop    
  4003f7:	90                   	nop    
  4003f8:	90                   	nop    
  4003f9:	90                   	nop    
  4003fa:	90                   	nop    
  4003fb:	90                   	nop    
  4003fc:	90                   	nop    
  4003fd:	90                   	nop    
  4003fe:	90                   	nop    
  4003ff:	90                   	nop    

0000000000400400 <__do_global_dtors_aux>:
  400400:	80 3d 71 04 10 00 00 	cmpb   $0x0,1049713(%rip)        # 500878 <__bss_start>
  400407:	55                   	push   %rbp
  400408:	48 89 e5             	mov    %rsp,%rbp
  40040b:	74 10                	je     40041d <__do_global_dtors_aux+0x1d>
  40040d:	eb 24                	jmp    400433 <__do_global_dtors_aux+0x33>
  40040f:	90                   	nop    
  400410:	48 83 c0 08          	add    $0x8,%rax
  400414:	48 89 05 55 04 10 00 	mov    %rax,1049685(%rip)        # 500870 <p.0>
  40041b:	ff d2                	callq  *%edx
  40041d:	48 8b 05 4c 04 10 00 	mov    1049676(%rip),%rax        # 500870 <p.0>
  400424:	48 8b 10             	mov    (%rax),%rdx
  400427:	48 85 d2             	test   %rdx,%rdx
  40042a:	75 e4                	jne    400410 <__do_global_dtors_aux+0x10>
  40042c:	c6 05 45 04 10 00 01 	movb   $0x1,1049669(%rip)        # 500878 <__bss_start>
  400433:	c9                   	leaveq 
  400434:	c3                   	retq   
  400435:	66                   	data16
  400436:	66                   	data16
  400437:	66                   	data16
  400438:	90                   	nop    
  400439:	66                   	data16
  40043a:	66                   	data16
  40043b:	66                   	data16
  40043c:	90                   	nop    
  40043d:	66                   	data16
  40043e:	66                   	data16
  40043f:	90                   	nop    

0000000000400440 <frame_dummy>:
  400440:	55                   	push   %rbp
  400441:	48 83 3d 57 02 10 00 	cmpq   $0x0,1049175(%rip)        # 5006a0 <__JCR_END__>
  400448:	00 
  400449:	48 89 e5             	mov    %rsp,%rbp
  40044c:	74 16                	je     400464 <frame_dummy+0x24>
  40044e:	b8 00 00 00 00       	mov    $0x0,%eax
  400453:	48 85 c0             	test   %rax,%rax
  400456:	74 0c                	je     400464 <frame_dummy+0x24>
  400458:	bf a0 06 50 00       	mov    $0x5006a0,%edi
  40045d:	49 89 c3             	mov    %rax,%r11
  400460:	c9                   	leaveq 
  400461:	41 ff e3             	jmpq   *%r11d
  400464:	c9                   	leaveq 
  400465:	c3                   	retq   
  400466:	90                   	nop    
  400467:	90                   	nop    
  400468:	90                   	nop    
  400469:	90                   	nop    
  40046a:	90                   	nop    
  40046b:	90                   	nop    
  40046c:	90                   	nop    
  40046d:	90                   	nop    
  40046e:	90                   	nop    
  40046f:	90                   	nop    

0000000000400470 <proc>:
  400470:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  400477:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40047b:	89 47 1c             	mov    %eax,0x1c(%rdi)
  40047e:	8b 47 18             	mov    0x18(%rdi),%eax
  400481:	48 81 c4 10 01 00 00 	add    $0x110,%rsp
  400488:	c3                   	retq   
  400489:	66                   	data16
  40048a:	66                   	data16
  40048b:	66                   	data16
  40048c:	90                   	nop    
  40048d:	66                   	data16
  40048e:	66                   	data16
  40048f:	90                   	nop    

0000000000400490 <main>:
  400490:	48 83 ec 38          	sub    $0x38,%rsp
  400494:	ba 07 00 00 00       	mov    $0x7,%edx
  400499:	be 05 00 00 00       	mov    $0x5,%esi
  40049e:	48 89 e7             	mov    %rsp,%rdi
  4004a1:	e8 ca ff ff ff       	callq  400470 <proc>
  4004a6:	48 83 c4 38          	add    $0x38,%rsp
  4004aa:	c3                   	retq   
  4004ab:	90                   	nop    
  4004ac:	90                   	nop    
  4004ad:	90                   	nop    
  4004ae:	90                   	nop    
  4004af:	90                   	nop    

00000000004004b0 <__libc_csu_init>:
  4004b0:	48 89 5c 24 e8       	mov    %rbx,0xffffffffffffffe8(%rsp)
  4004b5:	4c 89 64 24 f8       	mov    %r12,0xfffffffffffffff8(%rsp)
  4004ba:	4c 8d 25 bf 01 10 00 	lea    1049023(%rip),%r12        # 500680 <__fini_array_end>
  4004c1:	48 89 6c 24 f0       	mov    %rbp,0xfffffffffffffff0(%rsp)
  4004c6:	48 83 ec 18          	sub    $0x18,%rsp
  4004ca:	31 db                	xor    %ebx,%ebx
  4004cc:	e8 9f fe ff ff       	callq  400370 <_init>
  4004d1:	48 8d 05 a8 01 10 00 	lea    1049000(%rip),%rax        # 500680 <__fini_array_end>
  4004d8:	4c 29 e0             	sub    %r12,%rax
  4004db:	48 c1 f8 03          	sar    $0x3,%rax
  4004df:	48 39 c3             	cmp    %rax,%rbx
  4004e2:	73 0f                	jae    4004f3 <__libc_csu_init+0x43>
  4004e4:	48 89 c5             	mov    %rax,%rbp
  4004e7:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4004eb:	48 ff c3             	inc    %rbx
  4004ee:	48 39 eb             	cmp    %rbp,%rbx
  4004f1:	72 f4                	jb     4004e7 <__libc_csu_init+0x37>
  4004f3:	48 8b 1c 24          	mov    (%rsp),%rbx
  4004f7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  4004fc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  400501:	48 83 c4 18          	add    $0x18,%rsp
  400505:	c3                   	retq   
  400506:	66                   	data16
  400507:	66                   	data16
  400508:	66                   	data16
  400509:	90                   	nop    
  40050a:	66                   	data16
  40050b:	66                   	data16
  40050c:	90                   	nop    
  40050d:	66                   	data16
  40050e:	66                   	data16
  40050f:	90                   	nop    

0000000000400510 <__libc_csu_fini>:
  400510:	55                   	push   %rbp
  400511:	48 8d 05 68 01 10 00 	lea    1048936(%rip),%rax        # 500680 <__fini_array_end>
  400518:	48 8d 2d 61 01 10 00 	lea    1048929(%rip),%rbp        # 500680 <__fini_array_end>
  40051f:	48 29 e8             	sub    %rbp,%rax
  400522:	53                   	push   %rbx
  400523:	48 c1 f8 03          	sar    $0x3,%rax
  400527:	48 8d 58 ff          	lea    0xffffffffffffffff(%rax),%rbx
  40052b:	48 83 ec 08          	sub    $0x8,%rsp
  40052f:	eb 07                	jmp    400538 <__libc_csu_fini+0x28>
  400531:	ff 54 dd 00          	callq  *0x0(%rbp,%rbx,8)
  400535:	48 ff cb             	dec    %rbx
  400538:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
  40053c:	75 f3                	jne    400531 <__libc_csu_fini+0x21>
  40053e:	48 83 c4 08          	add    $0x8,%rsp
  400542:	5b                   	pop    %rbx
  400543:	5d                   	pop    %rbp
  400544:	e9 3f 00 00 00       	jmpq   400588 <_fini>
  400549:	90                   	nop    
  40054a:	90                   	nop    
  40054b:	90                   	nop    
  40054c:	90                   	nop    
  40054d:	90                   	nop    
  40054e:	90                   	nop    
  40054f:	90                   	nop    

0000000000400550 <__do_global_ctors_aux>:
  400550:	55                   	push   %rbp
  400551:	48 89 e5             	mov    %rsp,%rbp
  400554:	53                   	push   %rbx
  400555:	48 c7 c3 80 06 50 00 	mov    $0x500680,%rbx
  40055c:	48 83 ec 08          	sub    $0x8,%rsp
  400560:	48 8b 05 19 01 10 00 	mov    1048857(%rip),%rax        # 500680 <__fini_array_end>
  400567:	eb 10                	jmp    400579 <__do_global_ctors_aux+0x29>
  400569:	66                   	data16
  40056a:	66                   	data16
  40056b:	66                   	data16
  40056c:	90                   	nop    
  40056d:	66                   	data16
  40056e:	66                   	data16
  40056f:	90                   	nop    
  400570:	48 83 eb 08          	sub    $0x8,%rbx
  400574:	ff d0                	callq  *%eax
  400576:	48 8b 03             	mov    (%rbx),%rax
  400579:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40057d:	75 f1                	jne    400570 <__do_global_ctors_aux+0x20>
  40057f:	48 83 c4 08          	add    $0x8,%rsp
  400583:	5b                   	pop    %rbx
  400584:	c9                   	leaveq 
  400585:	c3                   	retq   
  400586:	90                   	nop    
  400587:	90                   	nop    
Disassembly of section .fini:

0000000000400588 <_fini>:
  400588:	48 83 ec 08          	sub    $0x8,%rsp
  40058c:	e8 6f fe ff ff       	callq  400400 <__do_global_dtors_aux>
  400591:	48 83 c4 08          	add    $0x8,%rsp
  400595:	c3                   	retq   
