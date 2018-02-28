
exe-data:     file format elf32-i386

Disassembly of section .init:

080483e4 <_init>:
 80483e4:	55                   	push   %ebp
 80483e5:	89 e5                	mov    %esp,%ebp
 80483e7:	83 ec 08             	sub    $0x8,%esp
 80483ea:	e8 e5 00 00 00       	call   80484d4 <call_gmon_start>
 80483ef:	90                   	nop    
 80483f0:	e8 8b 01 00 00       	call   8048580 <frame_dummy>
 80483f5:	e8 96 05 00 00       	call   8048990 <__do_global_ctors_aux>
 80483fa:	c9                   	leave  
 80483fb:	c3                   	ret    
Disassembly of section .plt:

080483fc <.plt>:
 80483fc:	ff 35 68 9b 04 08    	pushl  0x8049b68
 8048402:	ff 25 6c 9b 04 08    	jmp    *0x8049b6c
 8048408:	00 00                	add    %al,(%eax)
 804840a:	00 00                	add    %al,(%eax)
 804840c:	ff 25 70 9b 04 08    	jmp    *0x8049b70
 8048412:	68 00 00 00 00       	push   $0x0
 8048417:	e9 e0 ff ff ff       	jmp    80483fc <_init+0x18>
 804841c:	ff 25 74 9b 04 08    	jmp    *0x8049b74
 8048422:	68 08 00 00 00       	push   $0x8
 8048427:	e9 d0 ff ff ff       	jmp    80483fc <_init+0x18>
 804842c:	ff 25 78 9b 04 08    	jmp    *0x8049b78
 8048432:	68 10 00 00 00       	push   $0x10
 8048437:	e9 c0 ff ff ff       	jmp    80483fc <_init+0x18>
 804843c:	ff 25 7c 9b 04 08    	jmp    *0x8049b7c
 8048442:	68 18 00 00 00       	push   $0x18
 8048447:	e9 b0 ff ff ff       	jmp    80483fc <_init+0x18>
 804844c:	ff 25 80 9b 04 08    	jmp    *0x8049b80
 8048452:	68 20 00 00 00       	push   $0x20
 8048457:	e9 a0 ff ff ff       	jmp    80483fc <_init+0x18>
 804845c:	ff 25 84 9b 04 08    	jmp    *0x8049b84
 8048462:	68 28 00 00 00       	push   $0x28
 8048467:	e9 90 ff ff ff       	jmp    80483fc <_init+0x18>
 804846c:	ff 25 88 9b 04 08    	jmp    *0x8049b88
 8048472:	68 30 00 00 00       	push   $0x30
 8048477:	e9 80 ff ff ff       	jmp    80483fc <_init+0x18>
 804847c:	ff 25 8c 9b 04 08    	jmp    *0x8049b8c
 8048482:	68 38 00 00 00       	push   $0x38
 8048487:	e9 70 ff ff ff       	jmp    80483fc <_init+0x18>
 804848c:	ff 25 90 9b 04 08    	jmp    *0x8049b90
 8048492:	68 40 00 00 00       	push   $0x40
 8048497:	e9 60 ff ff ff       	jmp    80483fc <_init+0x18>
 804849c:	ff 25 94 9b 04 08    	jmp    *0x8049b94
 80484a2:	68 48 00 00 00       	push   $0x48
 80484a7:	e9 50 ff ff ff       	jmp    80483fc <_init+0x18>
Disassembly of section .text:

080484b0 <_start>:
 80484b0:	31 ed                	xor    %ebp,%ebp
 80484b2:	5e                   	pop    %esi
 80484b3:	89 e1                	mov    %esp,%ecx
 80484b5:	83 e4 f0             	and    $0xfffffff0,%esp
 80484b8:	50                   	push   %eax
 80484b9:	54                   	push   %esp
 80484ba:	52                   	push   %edx
 80484bb:	68 f0 89 04 08       	push   $0x80489f0
 80484c0:	68 e4 83 04 08       	push   $0x80483e4
 80484c5:	51                   	push   %ecx
 80484c6:	56                   	push   %esi
 80484c7:	68 d0 87 04 08       	push   $0x80487d0
 80484cc:	e8 8b ff ff ff       	call   804845c <_init+0x78>
 80484d1:	f4                   	hlt    
 80484d2:	89 f6                	mov    %esi,%esi

080484d4 <call_gmon_start>:
 80484d4:	55                   	push   %ebp
 80484d5:	89 e5                	mov    %esp,%ebp
 80484d7:	53                   	push   %ebx
 80484d8:	50                   	push   %eax
 80484d9:	e8 00 00 00 00       	call   80484de <call_gmon_start+0xa>
 80484de:	5b                   	pop    %ebx
 80484df:	81 c3 86 16 00 00    	add    $0x1686,%ebx
 80484e5:	8b 83 34 00 00 00    	mov    0x34(%ebx),%eax
 80484eb:	85 c0                	test   %eax,%eax
 80484ed:	74 02                	je     80484f1 <call_gmon_start+0x1d>
 80484ef:	ff d0                	call   *%eax
 80484f1:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80484f4:	c9                   	leave  
 80484f5:	c3                   	ret    
 80484f6:	89 f6                	mov    %esi,%esi
 80484f8:	90                   	nop    
 80484f9:	90                   	nop    
 80484fa:	90                   	nop    
 80484fb:	90                   	nop    
 80484fc:	90                   	nop    
 80484fd:	90                   	nop    
 80484fe:	90                   	nop    
 80484ff:	90                   	nop    

08048500 <__do_global_dtors_aux>:
 8048500:	55                   	push   %ebp
 8048501:	89 e5                	mov    %esp,%ebp
 8048503:	83 ec 08             	sub    $0x8,%esp
 8048506:	83 3d 44 9c 04 08 00 	cmpl   $0x0,0x8049c44
 804850d:	74 02                	je     8048511 <__do_global_dtors_aux+0x11>
 804850f:	eb 52                	jmp    8048563 <__do_global_dtors_aux+0x63>
 8048511:	90                   	nop    
 8048512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8048519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8048520:	a1 28 9b 04 08       	mov    0x8049b28,%eax
 8048525:	8b 00                	mov    (%eax),%eax
 8048527:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804852a:	85 c0                	test   %eax,%eax
 804852c:	75 02                	jne    8048530 <__do_global_dtors_aux+0x30>
 804852e:	eb 10                	jmp    8048540 <__do_global_dtors_aux+0x40>
 8048530:	83 05 28 9b 04 08 04 	addl   $0x4,0x8049b28
 8048537:	ff 55 fc             	call   *0xfffffffc(%ebp)
 804853a:	eb e4                	jmp    8048520 <__do_global_dtors_aux+0x20>
 804853c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048540:	b8 00 00 00 00       	mov    $0x0,%eax
 8048545:	85 c0                	test   %eax,%eax
 8048547:	74 10                	je     8048559 <__do_global_dtors_aux+0x59>
 8048549:	83 ec 0c             	sub    $0xc,%esp
 804854c:	68 50 9b 04 08       	push   $0x8049b50
 8048551:	e8 aa 7a fb f7       	call   0 <_init-0x80483e4>
 8048556:	83 c4 10             	add    $0x10,%esp
 8048559:	c7 05 44 9c 04 08 01 	movl   $0x1,0x8049c44
 8048560:	00 00 00 
 8048563:	89 ec                	mov    %ebp,%esp
 8048565:	5d                   	pop    %ebp
 8048566:	c3                   	ret    
 8048567:	89 f6                	mov    %esi,%esi
 8048569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

08048570 <fini_dummy>:
 8048570:	55                   	push   %ebp
 8048571:	89 e5                	mov    %esp,%ebp
 8048573:	83 ec 08             	sub    $0x8,%esp
 8048576:	89 ec                	mov    %ebp,%esp
 8048578:	5d                   	pop    %ebp
 8048579:	c3                   	ret    
 804857a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048580 <frame_dummy>:
 8048580:	55                   	push   %ebp
 8048581:	89 e5                	mov    %esp,%ebp
 8048583:	83 ec 08             	sub    $0x8,%esp
 8048586:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 804858d:	e8 00 00 00 00       	call   8048592 <frame_dummy+0x12>
 8048592:	5a                   	pop    %edx
 8048593:	81 c2 d2 15 00 00    	add    $0x15d2,%edx
 8048599:	89 d0                	mov    %edx,%eax
 804859b:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 804859e:	b8 00 00 00 00       	mov    $0x0,%eax
 80485a3:	85 c0                	test   %eax,%eax
 80485a5:	74 18                	je     80485bf <frame_dummy+0x3f>
 80485a7:	ff 75 f8             	pushl  0xfffffff8(%ebp)
 80485aa:	ff 75 fc             	pushl  0xfffffffc(%ebp)
 80485ad:	68 48 9c 04 08       	push   $0x8049c48
 80485b2:	68 50 9b 04 08       	push   $0x8049b50
 80485b7:	e8 44 7a fb f7       	call   0 <_init-0x80483e4>
 80485bc:	83 c4 10             	add    $0x10,%esp
 80485bf:	89 ec                	mov    %ebp,%esp
 80485c1:	5d                   	pop    %ebp
 80485c2:	c3                   	ret    
 80485c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80485c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

080485d0 <init_dummy>:
 80485d0:	55                   	push   %ebp
 80485d1:	89 e5                	mov    %esp,%ebp
 80485d3:	83 ec 08             	sub    $0x8,%esp
 80485d6:	89 ec                	mov    %ebp,%esp
 80485d8:	5d                   	pop    %ebp
 80485d9:	c3                   	ret    
 80485da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

080485e0 <function_cpy>:
 80485e0:	55                   	push   %ebp
 80485e1:	89 e5                	mov    %esp,%ebp
 80485e3:	83 ec 14             	sub    $0x14,%esp
 80485e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80485e9:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 80485ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 80485ef:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
 80485f2:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 80485f9:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 8048600:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8048603:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048606:	7d 48                	jge    8048650 <function_cpy+0x70>
 8048608:	83 7d f0 01          	cmpl   $0x1,0xfffffff0(%ebp)
 804860c:	7e 02                	jle    8048610 <function_cpy+0x30>
 804860e:	eb 40                	jmp    8048650 <function_cpy+0x70>
 8048610:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8048613:	03 45 f4             	add    0xfffffff4(%ebp),%eax
 8048616:	0f b6 00             	movzbl (%eax),%eax
 8048619:	88 45 ef             	mov    %al,0xffffffef(%ebp)
 804861c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 804861f:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
 8048622:	01 c2                	add    %eax,%edx
 8048624:	0f b6 45 ef          	movzbl 0xffffffef(%ebp),%eax
 8048628:	88 02                	mov    %al,(%edx)
 804862a:	0f b6 55 ef          	movzbl 0xffffffef(%ebp),%edx
 804862e:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 8048631:	3a 90 30 9b 04 08    	cmp    0x8049b30(%eax),%dl
 8048637:	75 07                	jne    8048640 <function_cpy+0x60>
 8048639:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
 804863c:	ff 00                	incl   (%eax)
 804863e:	eb 07                	jmp    8048647 <function_cpy+0x67>
 8048640:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 8048647:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 804864a:	ff 00                	incl   (%eax)
 804864c:	eb b2                	jmp    8048600 <function_cpy+0x20>
 804864e:	89 f6                	mov    %esi,%esi
 8048650:	83 7d f0 02          	cmpl   $0x2,0xfffffff0(%ebp)
 8048654:	75 0a                	jne    8048660 <function_cpy+0x80>
 8048656:	8b 45 08             	mov    0x8(%ebp),%eax
 8048659:	eb 0a                	jmp    8048665 <function_cpy+0x85>
 804865b:	90                   	nop    
 804865c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048660:	b8 00 00 00 00       	mov    $0x0,%eax
 8048665:	89 ec                	mov    %ebp,%esp
 8048667:	5d                   	pop    %ebp
 8048668:	c3                   	ret    
 8048669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi

08048670 <plus1>:
 8048670:	55                   	push   %ebp
 8048671:	89 e5                	mov    %esp,%ebp
 8048673:	8b 45 08             	mov    0x8(%ebp),%eax
 8048676:	40                   	inc    %eax
 8048677:	5d                   	pop    %ebp
 8048678:	c3                   	ret    
 8048679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi

08048680 <minusx>:
 8048680:	55                   	push   %ebp
 8048681:	89 e5                	mov    %esp,%ebp
 8048683:	8b 45 08             	mov    0x8(%ebp),%eax
 8048686:	f7 d8                	neg    %eax
 8048688:	5d                   	pop    %ebp
 8048689:	c3                   	ret    
 804868a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048690 <absval>:
 8048690:	55                   	push   %ebp
 8048691:	89 e5                	mov    %esp,%ebp
 8048693:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048697:	79 07                	jns    80486a0 <absval+0x10>
 8048699:	8b 45 08             	mov    0x8(%ebp),%eax
 804869c:	f7 d8                	neg    %eax
 804869e:	eb 03                	jmp    80486a3 <absval+0x13>
 80486a0:	8b 45 08             	mov    0x8(%ebp),%eax
 80486a3:	5d                   	pop    %ebp
 80486a4:	c3                   	ret    
 80486a5:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80486a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

080486b0 <test_function>:
 80486b0:	55                   	push   %ebp
 80486b1:	89 e5                	mov    %esp,%ebp
 80486b3:	83 ec 38             	sub    $0x38,%esp
 80486b6:	83 ec 08             	sub    $0x8,%esp
 80486b9:	6a 01                	push   $0x1
 80486bb:	6a 14                	push   $0x14
 80486bd:	e8 da fd ff ff       	call   804849c <_init+0xb8>
 80486c2:	83 c4 10             	add    $0x10,%esp
 80486c5:	89 45 d4             	mov    %eax,0xffffffd4(%ebp)
 80486c8:	8b 45 10             	mov    0x10(%ebp),%eax
 80486cb:	89 45 c8             	mov    %eax,0xffffffc8(%ebp)
 80486ce:	83 7d c8 01          	cmpl   $0x1,0xffffffc8(%ebp)
 80486d2:	74 2d                	je     8048701 <test_function+0x51>
 80486d4:	83 7d c8 01          	cmpl   $0x1,0xffffffc8(%ebp)
 80486d8:	72 0e                	jb     80486e8 <test_function+0x38>
 80486da:	83 7d c8 02          	cmpl   $0x2,0xffffffc8(%ebp)
 80486de:	74 40                	je     8048720 <test_function+0x70>
 80486e0:	83 7d c8 03          	cmpl   $0x3,0xffffffc8(%ebp)
 80486e4:	74 5a                	je     8048740 <test_function+0x90>
 80486e6:	eb 58                	jmp    8048740 <test_function+0x90>
 80486e8:	83 ec 04             	sub    $0x4,%esp
 80486eb:	6a 14                	push   $0x14
 80486ed:	ff 75 08             	pushl  0x8(%ebp)
 80486f0:	8d 45 d8             	lea    0xffffffd8(%ebp),%eax
 80486f3:	50                   	push   %eax
 80486f4:	e8 e7 fe ff ff       	call   80485e0 <function_cpy>
 80486f9:	83 c4 10             	add    $0x10,%esp
 80486fc:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
 80486ff:	eb 45                	jmp    8048746 <test_function+0x96>
 8048701:	83 ec 04             	sub    $0x4,%esp
 8048704:	6a 14                	push   $0x14
 8048706:	ff 75 08             	pushl  0x8(%ebp)
 8048709:	ff 75 d4             	pushl  0xffffffd4(%ebp)
 804870c:	e8 cf fe ff ff       	call   80485e0 <function_cpy>
 8048711:	83 c4 10             	add    $0x10,%esp
 8048714:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
 8048717:	eb 2d                	jmp    8048746 <test_function+0x96>
 8048719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8048720:	83 ec 04             	sub    $0x4,%esp
 8048723:	6a 14                	push   $0x14
 8048725:	ff 75 08             	pushl  0x8(%ebp)
 8048728:	68 60 9c 04 08       	push   $0x8049c60
 804872d:	e8 ae fe ff ff       	call   80485e0 <function_cpy>
 8048732:	83 c4 10             	add    $0x10,%esp
 8048735:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
 8048738:	eb 0c                	jmp    8048746 <test_function+0x96>
 804873a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048740:	8b 45 08             	mov    0x8(%ebp),%eax
 8048743:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
 8048746:	83 7d d0 00          	cmpl   $0x0,0xffffffd0(%ebp)
 804874a:	75 24                	jne    8048770 <test_function+0xc0>
 804874c:	83 ec 08             	sub    $0x8,%esp
 804874f:	68 60 8a 04 08       	push   $0x8048a60
 8048754:	ff 35 3c 9c 04 08    	pushl  0x8049c3c
 804875a:	e8 cd fc ff ff       	call   804842c <_init+0x48>
 804875f:	83 c4 10             	add    $0x10,%esp
 8048762:	83 ec 0c             	sub    $0xc,%esp
 8048765:	6a 01                	push   $0x1
 8048767:	e8 20 fd ff ff       	call   804848c <_init+0xa8>
 804876c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048770:	ff 75 d0             	pushl  0xffffffd0(%ebp)
 8048773:	ff 75 08             	pushl  0x8(%ebp)
 8048776:	68 88 8a 04 08       	push   $0x8048a88
 804877b:	ff 35 3c 9c 04 08    	pushl  0x8049c3c
 8048781:	e8 a6 fc ff ff       	call   804842c <_init+0x48>
 8048786:	83 c4 10             	add    $0x10,%esp
 8048789:	83 ec 0c             	sub    $0xc,%esp
 804878c:	ff 75 0c             	pushl  0xc(%ebp)
 804878f:	ff 55 d0             	call   *0xffffffd0(%ebp)
 8048792:	83 c4 10             	add    $0x10,%esp
 8048795:	89 45 cc             	mov    %eax,0xffffffcc(%ebp)
 8048798:	8b 45 cc             	mov    0xffffffcc(%ebp),%eax
 804879b:	89 ec                	mov    %ebp,%esp
 804879d:	5d                   	pop    %ebp
 804879e:	c3                   	ret    
 804879f:	90                   	nop    

080487a0 <usage>:
 80487a0:	55                   	push   %ebp
 80487a1:	89 e5                	mov    %esp,%ebp
 80487a3:	83 ec 08             	sub    $0x8,%esp
 80487a6:	83 ec 04             	sub    $0x4,%esp
 80487a9:	ff 75 08             	pushl  0x8(%ebp)
 80487ac:	68 c0 8a 04 08       	push   $0x8048ac0
 80487b1:	ff 35 40 9c 04 08    	pushl  0x8049c40
 80487b7:	e8 70 fc ff ff       	call   804842c <_init+0x48>
 80487bc:	83 c4 10             	add    $0x10,%esp
 80487bf:	83 ec 0c             	sub    $0xc,%esp
 80487c2:	6a 00                	push   $0x0
 80487c4:	e8 c3 fc ff ff       	call   804848c <_init+0xa8>
 80487c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi

080487d0 <main>:
 80487d0:	55                   	push   %ebp
 80487d1:	89 e5                	mov    %esp,%ebp
 80487d3:	83 ec 28             	sub    $0x28,%esp
 80487d6:	83 e4 f0             	and    $0xfffffff0,%esp
 80487d9:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
 80487e0:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
 80487e7:	a1 34 9b 04 08       	mov    0x8049b34,%eax
 80487ec:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 80487ef:	c7 45 ec 03 00 00 00 	movl   $0x3,0xffffffec(%ebp)
 80487f6:	c7 45 e8 f3 8a 04 08 	movl   $0x8048af3,0xffffffe8(%ebp)
 80487fd:	83 7d 08 04          	cmpl   $0x4,0x8(%ebp)
 8048801:	74 10                	je     8048813 <main+0x43>
 8048803:	83 ec 0c             	sub    $0xc,%esp
 8048806:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048809:	ff 30                	pushl  (%eax)
 804880b:	e8 90 ff ff ff       	call   80487a0 <usage>
 8048810:	83 c4 10             	add    $0x10,%esp
 8048813:	c7 45 e4 00 00 00 00 	movl   $0x0,0xffffffe4(%ebp)
 804881a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048820:	83 7d e4 02          	cmpl   $0x2,0xffffffe4(%ebp)
 8048824:	7f 4a                	jg     8048870 <main+0xa0>
 8048826:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
 804882a:	75 44                	jne    8048870 <main+0xa0>
 804882c:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 804882f:	c1 e0 02             	shl    $0x2,%eax
 8048832:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048835:	83 c2 04             	add    $0x4,%edx
 8048838:	83 ec 08             	sub    $0x8,%esp
 804883b:	ff b0 40 9b 04 08    	pushl  0x8049b40(%eax)
 8048841:	ff 32                	pushl  (%edx)
 8048843:	e8 d4 fb ff ff       	call   804841c <_init+0x38>
 8048848:	83 c4 10             	add    $0x10,%esp
 804884b:	85 c0                	test   %eax,%eax
 804884d:	75 16                	jne    8048865 <main+0x95>
 804884f:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 8048852:	c1 e0 02             	shl    $0x2,%eax
 8048855:	8b 80 34 9b 04 08    	mov    0x8049b34(%eax),%eax
 804885b:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 804885e:	c7 45 f4 01 00 00 00 	movl   $0x1,0xfffffff4(%ebp)
 8048865:	8d 45 e4             	lea    0xffffffe4(%ebp),%eax
 8048868:	ff 00                	incl   (%eax)
 804886a:	eb b4                	jmp    8048820 <main+0x50>
 804886c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048870:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
 8048874:	75 10                	jne    8048886 <main+0xb6>
 8048876:	83 ec 0c             	sub    $0xc,%esp
 8048879:	8b 45 0c             	mov    0xc(%ebp),%eax
 804887c:	ff 30                	pushl  (%eax)
 804887e:	e8 1d ff ff ff       	call   80487a0 <usage>
 8048883:	83 c4 10             	add    $0x10,%esp
 8048886:	83 ec 04             	sub    $0x4,%esp
 8048889:	6a 00                	push   $0x0
 804888b:	6a 00                	push   $0x0
 804888d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048890:	83 c0 08             	add    $0x8,%eax
 8048893:	ff 30                	pushl  (%eax)
 8048895:	e8 b2 fb ff ff       	call   804844c <_init+0x68>
 804889a:	83 c4 10             	add    $0x10,%esp
 804889d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 80488a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488a3:	83 c0 0c             	add    $0xc,%eax
 80488a6:	8b 00                	mov    (%eax),%eax
 80488a8:	80 38 2d             	cmpb   $0x2d,(%eax)
 80488ab:	74 10                	je     80488bd <main+0xed>
 80488ad:	83 ec 0c             	sub    $0xc,%esp
 80488b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488b3:	ff 30                	pushl  (%eax)
 80488b5:	e8 e6 fe ff ff       	call   80487a0 <usage>
 80488ba:	83 c4 10             	add    $0x10,%esp
 80488bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488c0:	83 c0 0c             	add    $0xc,%eax
 80488c3:	8b 00                	mov    (%eax),%eax
 80488c5:	40                   	inc    %eax
 80488c6:	0f b6 00             	movzbl (%eax),%eax
 80488c9:	88 45 df             	mov    %al,0xffffffdf(%ebp)
 80488cc:	80 7d df 67          	cmpb   $0x67,0xffffffdf(%ebp)
 80488d0:	74 3e                	je     8048910 <main+0x140>
 80488d2:	80 7d df 67          	cmpb   $0x67,0xffffffdf(%ebp)
 80488d6:	7f 08                	jg     80488e0 <main+0x110>
 80488d8:	80 7d df 63          	cmpb   $0x63,0xffffffdf(%ebp)
 80488dc:	74 42                	je     8048920 <main+0x150>
 80488de:	eb 50                	jmp    8048930 <main+0x160>
 80488e0:	80 7d df 68          	cmpb   $0x68,0xffffffdf(%ebp)
 80488e4:	74 0a                	je     80488f0 <main+0x120>
 80488e6:	80 7d df 73          	cmpb   $0x73,0xffffffdf(%ebp)
 80488ea:	74 14                	je     8048900 <main+0x130>
 80488ec:	eb 42                	jmp    8048930 <main+0x160>
 80488ee:	89 f6                	mov    %esi,%esi
 80488f0:	c7 45 ec 01 00 00 00 	movl   $0x1,0xffffffec(%ebp)
 80488f7:	c7 45 e8 f9 8a 04 08 	movl   $0x8048af9,0xffffffe8(%ebp)
 80488fe:	eb 40                	jmp    8048940 <main+0x170>
 8048900:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
 8048907:	c7 45 e8 f3 8a 04 08 	movl   $0x8048af3,0xffffffe8(%ebp)
 804890e:	eb 30                	jmp    8048940 <main+0x170>
 8048910:	c7 45 ec 02 00 00 00 	movl   $0x2,0xffffffec(%ebp)
 8048917:	c7 45 e8 fe 8a 04 08 	movl   $0x8048afe,0xffffffe8(%ebp)
 804891e:	eb 20                	jmp    8048940 <main+0x170>
 8048920:	c7 45 ec 03 00 00 00 	movl   $0x3,0xffffffec(%ebp)
 8048927:	c7 45 e8 05 8b 04 08 	movl   $0x8048b05,0xffffffe8(%ebp)
 804892e:	eb 10                	jmp    8048940 <main+0x170>
 8048930:	83 ec 0c             	sub    $0xc,%esp
 8048933:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048936:	ff 30                	pushl  (%eax)
 8048938:	e8 63 fe ff ff       	call   80487a0 <usage>
 804893d:	83 c4 10             	add    $0x10,%esp
 8048940:	83 ec 04             	sub    $0x4,%esp
 8048943:	ff 75 ec             	pushl  0xffffffec(%ebp)
 8048946:	ff 75 fc             	pushl  0xfffffffc(%ebp)
 8048949:	ff 75 f0             	pushl  0xfffffff0(%ebp)
 804894c:	e8 5f fd ff ff       	call   80486b0 <test_function>
 8048951:	83 c4 10             	add    $0x10,%esp
 8048954:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
 8048957:	83 ec 0c             	sub    $0xc,%esp
 804895a:	ff 75 f8             	pushl  0xfffffff8(%ebp)
 804895d:	ff 75 fc             	pushl  0xfffffffc(%ebp)
 8048960:	ff 75 e8             	pushl  0xffffffe8(%ebp)
 8048963:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048966:	83 c0 04             	add    $0x4,%eax
 8048969:	ff 30                	pushl  (%eax)
 804896b:	68 0a 8b 04 08       	push   $0x8048b0a
 8048970:	e8 f7 fa ff ff       	call   804846c <_init+0x88>
 8048975:	83 c4 20             	add    $0x20,%esp
 8048978:	b8 00 00 00 00       	mov    $0x0,%eax
 804897d:	89 ec                	mov    %ebp,%esp
 804897f:	5d                   	pop    %ebp
 8048980:	c3                   	ret    
 8048981:	eb 0d                	jmp    8048990 <__do_global_ctors_aux>
 8048983:	90                   	nop    
 8048984:	90                   	nop    
 8048985:	90                   	nop    
 8048986:	90                   	nop    
 8048987:	90                   	nop    
 8048988:	90                   	nop    
 8048989:	90                   	nop    
 804898a:	90                   	nop    
 804898b:	90                   	nop    
 804898c:	90                   	nop    
 804898d:	90                   	nop    
 804898e:	90                   	nop    
 804898f:	90                   	nop    

08048990 <__do_global_ctors_aux>:
 8048990:	55                   	push   %ebp
 8048991:	89 e5                	mov    %esp,%ebp
 8048993:	83 ec 08             	sub    $0x8,%esp
 8048996:	b8 58 9b 04 08       	mov    $0x8049b58,%eax
 804899b:	83 e8 04             	sub    $0x4,%eax
 804899e:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 80489a1:	eb 0d                	jmp    80489b0 <__do_global_ctors_aux+0x20>
 80489a3:	90                   	nop    
 80489a4:	90                   	nop    
 80489a5:	90                   	nop    
 80489a6:	90                   	nop    
 80489a7:	90                   	nop    
 80489a8:	90                   	nop    
 80489a9:	90                   	nop    
 80489aa:	90                   	nop    
 80489ab:	90                   	nop    
 80489ac:	90                   	nop    
 80489ad:	90                   	nop    
 80489ae:	90                   	nop    
 80489af:	90                   	nop    
 80489b0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80489b3:	83 38 ff             	cmpl   $0xffffffff,(%eax)
 80489b6:	75 08                	jne    80489c0 <__do_global_ctors_aux+0x30>
 80489b8:	eb 16                	jmp    80489d0 <__do_global_ctors_aux+0x40>
 80489ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80489c0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80489c3:	8b 00                	mov    (%eax),%eax
 80489c5:	ff d0                	call   *%eax
 80489c7:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 80489ca:	83 28 04             	subl   $0x4,(%eax)
 80489cd:	eb e1                	jmp    80489b0 <__do_global_ctors_aux+0x20>
 80489cf:	90                   	nop    
 80489d0:	89 ec                	mov    %ebp,%esp
 80489d2:	5d                   	pop    %ebp
 80489d3:	c3                   	ret    
 80489d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80489da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

080489e0 <init_dummy>:
 80489e0:	55                   	push   %ebp
 80489e1:	89 e5                	mov    %esp,%ebp
 80489e3:	83 ec 08             	sub    $0x8,%esp
 80489e6:	89 ec                	mov    %ebp,%esp
 80489e8:	5d                   	pop    %ebp
 80489e9:	c3                   	ret    
 80489ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
Disassembly of section .fini:

080489f0 <_fini>:
 80489f0:	55                   	push   %ebp
 80489f1:	89 e5                	mov    %esp,%ebp
 80489f3:	53                   	push   %ebx
 80489f4:	52                   	push   %edx
 80489f5:	e8 00 00 00 00       	call   80489fa <gcc2_compiled.+0xa>
 80489fa:	5b                   	pop    %ebx
 80489fb:	81 c3 6a 11 00 00    	add    $0x116a,%ebx
 8048a01:	8d 76 00             	lea    0x0(%esi),%esi
 8048a04:	e8 f7 fa ff ff       	call   8048500 <__do_global_dtors_aux>
 8048a09:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8048a0c:	c9                   	leave  
 8048a0d:	c3                   	ret    
