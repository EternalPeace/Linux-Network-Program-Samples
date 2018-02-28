
pointer:     file format elf32-i386

Disassembly of section .init:

08048298 <_init>:
 8048298:	55                   	push   %ebp
 8048299:	89 e5                	mov    %esp,%ebp
 804829b:	83 ec 08             	sub    $0x8,%esp
 804829e:	e8 71 00 00 00       	call   8048314 <call_gmon_start>
 80482a3:	90                   	nop    
 80482a4:	e8 f7 00 00 00       	call   80483a0 <frame_dummy>
 80482a9:	e8 82 02 00 00       	call   8048530 <__do_global_ctors_aux>
 80482ae:	c9                   	leave  
 80482af:	c3                   	ret    
Disassembly of section .plt:

080482b0 <.plt>:
 80482b0:	ff 35 8c 96 04 08    	pushl  0x804968c
 80482b6:	ff 25 90 96 04 08    	jmp    *0x8049690
 80482bc:	00 00                	add    %al,(%eax)
 80482be:	00 00                	add    %al,(%eax)
 80482c0:	ff 25 94 96 04 08    	jmp    *0x8049694
 80482c6:	68 00 00 00 00       	push   $0x0
 80482cb:	e9 e0 ff ff ff       	jmp    80482b0 <_init+0x18>
 80482d0:	ff 25 98 96 04 08    	jmp    *0x8049698
 80482d6:	68 08 00 00 00       	push   $0x8
 80482db:	e9 d0 ff ff ff       	jmp    80482b0 <_init+0x18>
 80482e0:	ff 25 9c 96 04 08    	jmp    *0x804969c
 80482e6:	68 10 00 00 00       	push   $0x10
 80482eb:	e9 c0 ff ff ff       	jmp    80482b0 <_init+0x18>
Disassembly of section .text:

080482f0 <_start>:
 80482f0:	31 ed                	xor    %ebp,%ebp
 80482f2:	5e                   	pop    %esi
 80482f3:	89 e1                	mov    %esp,%ecx
 80482f5:	83 e4 f0             	and    $0xfffffff0,%esp
 80482f8:	50                   	push   %eax
 80482f9:	54                   	push   %esp
 80482fa:	52                   	push   %edx
 80482fb:	68 60 85 04 08       	push   $0x8048560
 8048300:	68 98 82 04 08       	push   $0x8048298
 8048305:	51                   	push   %ecx
 8048306:	56                   	push   %esi
 8048307:	68 00 85 04 08       	push   $0x8048500
 804830c:	e8 bf ff ff ff       	call   80482d0 <_init+0x38>
 8048311:	f4                   	hlt    
 8048312:	89 f6                	mov    %esi,%esi

08048314 <call_gmon_start>:
 8048314:	55                   	push   %ebp
 8048315:	89 e5                	mov    %esp,%ebp
 8048317:	53                   	push   %ebx
 8048318:	50                   	push   %eax
 8048319:	e8 00 00 00 00       	call   804831e <call_gmon_start+0xa>
 804831e:	5b                   	pop    %ebx
 804831f:	81 c3 6a 13 00 00    	add    $0x136a,%ebx
 8048325:	8b 83 18 00 00 00    	mov    0x18(%ebx),%eax
 804832b:	85 c0                	test   %eax,%eax
 804832d:	74 02                	je     8048331 <call_gmon_start+0x1d>
 804832f:	ff d0                	call   *%eax
 8048331:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8048334:	c9                   	leave  
 8048335:	c3                   	ret    
 8048336:	89 f6                	mov    %esi,%esi
 8048338:	90                   	nop    
 8048339:	90                   	nop    
 804833a:	90                   	nop    
 804833b:	90                   	nop    
 804833c:	90                   	nop    
 804833d:	90                   	nop    
 804833e:	90                   	nop    
 804833f:	90                   	nop    

08048340 <__do_global_dtors_aux>:
 8048340:	55                   	push   %ebp
 8048341:	89 e5                	mov    %esp,%ebp
 8048343:	83 ec 08             	sub    $0x8,%esp
 8048346:	80 3d 4c 97 04 08 00 	cmpb   $0x0,0x804974c
 804834d:	75 42                	jne    8048391 <__do_global_dtors_aux+0x51>
 804834f:	a1 68 96 04 08       	mov    0x8049668,%eax
 8048354:	8b 10                	mov    (%eax),%edx
 8048356:	85 d2                	test   %edx,%edx
 8048358:	74 1b                	je     8048375 <__do_global_dtors_aux+0x35>
 804835a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048360:	83 c0 04             	add    $0x4,%eax
 8048363:	a3 68 96 04 08       	mov    %eax,0x8049668
 8048368:	ff d2                	call   *%edx
 804836a:	a1 68 96 04 08       	mov    0x8049668,%eax
 804836f:	8b 10                	mov    (%eax),%edx
 8048371:	85 d2                	test   %edx,%edx
 8048373:	75 eb                	jne    8048360 <__do_global_dtors_aux+0x20>
 8048375:	b8 00 00 00 00       	mov    $0x0,%eax
 804837a:	85 c0                	test   %eax,%eax
 804837c:	74 0c                	je     804838a <__do_global_dtors_aux+0x4a>
 804837e:	c7 04 24 74 96 04 08 	movl   $0x8049674,(%esp,1)
 8048385:	e8 76 7c fb f7       	call   0 <_init-0x8048298>
 804838a:	c6 05 4c 97 04 08 01 	movb   $0x1,0x804974c
 8048391:	c9                   	leave  
 8048392:	c3                   	ret    
 8048393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi

080483a0 <frame_dummy>:
 80483a0:	55                   	push   %ebp
 80483a1:	b8 00 00 00 00       	mov    $0x0,%eax
 80483a6:	89 e5                	mov    %esp,%ebp
 80483a8:	e8 00 00 00 00       	call   80483ad <frame_dummy+0xd>
 80483ad:	5a                   	pop    %edx
 80483ae:	81 c2 db 12 00 00    	add    $0x12db,%edx
 80483b4:	83 ec 18             	sub    $0x18,%esp
 80483b7:	85 c0                	test   %eax,%eax
 80483b9:	74 20                	je     80483db <frame_dummy+0x3b>
 80483bb:	89 54 24 0c          	mov    %edx,0xc(%esp,1)
 80483bf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp,1)
 80483c6:	00 
 80483c7:	c7 44 24 04 50 97 04 	movl   $0x8049750,0x4(%esp,1)
 80483ce:	08 
 80483cf:	c7 04 24 74 96 04 08 	movl   $0x8049674,(%esp,1)
 80483d6:	e8 25 7c fb f7       	call   0 <_init-0x8048298>
 80483db:	a1 70 96 04 08       	mov    0x8049670,%eax
 80483e0:	85 c0                	test   %eax,%eax
 80483e2:	74 15                	je     80483f9 <frame_dummy+0x59>
 80483e4:	b8 00 00 00 00       	mov    $0x0,%eax
 80483e9:	85 c0                	test   %eax,%eax
 80483eb:	74 0c                	je     80483f9 <frame_dummy+0x59>
 80483ed:	c7 04 24 70 96 04 08 	movl   $0x8049670,(%esp,1)
 80483f4:	e8 07 7c fb f7       	call   0 <_init-0x8048298>
 80483f9:	89 ec                	mov    %ebp,%esp
 80483fb:	5d                   	pop    %ebp
 80483fc:	c3                   	ret    
 80483fd:	8d 76 00             	lea    0x0(%esi),%esi

08048400 <fun>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	56                   	push   %esi
 8048404:	53                   	push   %ebx
 8048405:	83 ec 20             	sub    $0x20,%esp
 8048408:	c6 45 f4 61          	movb   $0x61,0xfffffff4(%ebp)
 804840c:	8b 75 08             	mov    0x8(%ebp),%esi
 804840f:	c7 45 f0 01 00 00 00 	movl   $0x1,0xfffffff0(%ebp)
 8048416:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp,1)
 804841d:	e8 9e fe ff ff       	call   80482c0 <_init+0x28>
 8048422:	89 75 e8             	mov    %esi,0xffffffe8(%ebp)
 8048425:	89 c3                	mov    %eax,%ebx
 8048427:	0f b6 45 f4          	movzbl 0xfffffff4(%ebp),%eax
 804842b:	c7 45 ec 6c 96 04 08 	movl   $0x804966c,0xffffffec(%ebp)
 8048432:	fe c0                	inc    %al
 8048434:	88 03                	mov    %al,(%ebx)
 8048436:	8b 06                	mov    (%esi),%eax
 8048438:	c7 04 24 a0 85 04 08 	movl   $0x80485a0,(%esp,1)
 804843f:	89 74 24 08          	mov    %esi,0x8(%esp,1)
 8048443:	89 44 24 0c          	mov    %eax,0xc(%esp,1)
 8048447:	8d 45 e8             	lea    0xffffffe8(%ebp),%eax
 804844a:	89 44 24 04          	mov    %eax,0x4(%esp,1)
 804844e:	e8 8d fe ff ff       	call   80482e0 <_init+0x48>
 8048453:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
 8048456:	8b 02                	mov    (%edx),%eax
 8048458:	c7 04 24 e0 85 04 08 	movl   $0x80485e0,(%esp,1)
 804845f:	89 54 24 08          	mov    %edx,0x8(%esp,1)
 8048463:	89 44 24 0c          	mov    %eax,0xc(%esp,1)
 8048467:	8d 45 ec             	lea    0xffffffec(%ebp),%eax
 804846a:	89 44 24 04          	mov    %eax,0x4(%esp,1)
 804846e:	e8 6d fe ff ff       	call   80482e0 <_init+0x48>
 8048473:	0f be 45 f4          	movsbl 0xfffffff4(%ebp),%eax
 8048477:	c7 04 24 08 86 04 08 	movl   $0x8048608,(%esp,1)
 804847e:	89 44 24 08          	mov    %eax,0x8(%esp,1)
 8048482:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 8048485:	89 44 24 04          	mov    %eax,0x4(%esp,1)
 8048489:	e8 52 fe ff ff       	call   80482e0 <_init+0x48>
 804848e:	0f be 03             	movsbl (%ebx),%eax
 8048491:	89 5c 24 04          	mov    %ebx,0x4(%esp,1)
 8048495:	c7 04 24 24 86 04 08 	movl   $0x8048624,(%esp,1)
 804849c:	89 44 24 08          	mov    %eax,0x8(%esp,1)
 80484a0:	e8 3b fe ff ff       	call   80482e0 <_init+0x48>
 80484a5:	c7 44 24 04 00 84 04 	movl   $0x8048400,0x4(%esp,1)
 80484ac:	08 
 80484ad:	c7 04 24 41 86 04 08 	movl   $0x8048641,(%esp,1)
 80484b4:	e8 27 fe ff ff       	call   80482e0 <_init+0x48>
 80484b9:	8b 06                	mov    (%esi),%eax
 80484bb:	48                   	dec    %eax
 80484bc:	85 c0                	test   %eax,%eax
 80484be:	89 06                	mov    %eax,(%esi)
 80484c0:	7e 08                	jle    80484ca <fun+0xca>
 80484c2:	89 34 24             	mov    %esi,(%esp,1)
 80484c5:	e8 36 ff ff ff       	call   8048400 <fun>
 80484ca:	83 c4 20             	add    $0x20,%esp
 80484cd:	5b                   	pop    %ebx
 80484ce:	5e                   	pop    %esi
 80484cf:	5d                   	pop    %ebp
 80484d0:	c3                   	ret    
 80484d1:	eb 0d                	jmp    80484e0 <test>
 80484d3:	90                   	nop    
 80484d4:	90                   	nop    
 80484d5:	90                   	nop    
 80484d6:	90                   	nop    
 80484d7:	90                   	nop    
 80484d8:	90                   	nop    
 80484d9:	90                   	nop    
 80484da:	90                   	nop    
 80484db:	90                   	nop    
 80484dc:	90                   	nop    
 80484dd:	90                   	nop    
 80484de:	90                   	nop    
 80484df:	90                   	nop    

080484e0 <test>:
 80484e0:	55                   	push   %ebp
 80484e1:	89 e5                	mov    %esp,%ebp
 80484e3:	83 ec 08             	sub    $0x8,%esp
 80484e6:	c7 45 fc 02 00 00 00 	movl   $0x2,0xfffffffc(%ebp)
 80484ed:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 80484f0:	89 04 24             	mov    %eax,(%esp,1)
 80484f3:	e8 08 ff ff ff       	call   8048400 <fun>
 80484f8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80484fb:	89 ec                	mov    %ebp,%esp
 80484fd:	5d                   	pop    %ebp
 80484fe:	c3                   	ret    
 80484ff:	90                   	nop    

08048500 <main>:
 8048500:	55                   	push   %ebp
 8048501:	89 e5                	mov    %esp,%ebp
 8048503:	83 ec 48             	sub    $0x48,%esp
 8048506:	8d 45 b8             	lea    0xffffffb8(%ebp),%eax
 8048509:	25 ff 0f 00 00       	and    $0xfff,%eax
 804850e:	83 c0 0f             	add    $0xf,%eax
 8048511:	25 f0 1f 00 00       	and    $0x1ff0,%eax
 8048516:	83 e4 f0             	and    $0xfffffff0,%esp
 8048519:	29 c4                	sub    %eax,%esp
 804851b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp,1)
 8048522:	e8 b9 ff ff ff       	call   80484e0 <test>
 8048527:	89 ec                	mov    %ebp,%esp
 8048529:	5d                   	pop    %ebp
 804852a:	c3                   	ret    
 804852b:	90                   	nop    
 804852c:	8d 74 26 00          	lea    0x0(%esi,1),%esi

08048530 <__do_global_ctors_aux>:
 8048530:	55                   	push   %ebp
 8048531:	89 e5                	mov    %esp,%ebp
 8048533:	53                   	push   %ebx
 8048534:	83 ec 04             	sub    $0x4,%esp
 8048537:	a1 78 96 04 08       	mov    0x8049678,%eax
 804853c:	bb 78 96 04 08       	mov    $0x8049678,%ebx
 8048541:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048544:	74 16                	je     804855c <__do_global_ctors_aux+0x2c>
 8048546:	8d 76 00             	lea    0x0(%esi),%esi
 8048549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
 8048550:	83 eb 04             	sub    $0x4,%ebx
 8048553:	ff d0                	call   *%eax
 8048555:	8b 03                	mov    (%ebx),%eax
 8048557:	83 f8 ff             	cmp    $0xffffffff,%eax
 804855a:	75 f4                	jne    8048550 <__do_global_ctors_aux+0x20>
 804855c:	58                   	pop    %eax
 804855d:	5b                   	pop    %ebx
 804855e:	5d                   	pop    %ebp
 804855f:	c3                   	ret    
Disassembly of section .fini:

08048560 <_fini>:
 8048560:	55                   	push   %ebp
 8048561:	89 e5                	mov    %esp,%ebp
 8048563:	53                   	push   %ebx
 8048564:	52                   	push   %edx
 8048565:	e8 00 00 00 00       	call   804856a <gcc2_compiled.+0xa>
 804856a:	5b                   	pop    %ebx
 804856b:	81 c3 1e 11 00 00    	add    $0x111e,%ebx
 8048571:	8d 76 00             	lea    0x0(%esi),%esi
 8048574:	e8 c7 fd ff ff       	call   8048340 <__do_global_dtors_aux>
 8048579:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804857c:	c9                   	leave  
 804857d:	c3                   	ret    
