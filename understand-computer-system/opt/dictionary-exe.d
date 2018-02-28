
dictionary:     file format elf32-i386

Disassembly of section .init:

0804859c <_init>:
 804859c:	55                   	push   %ebp
 804859d:	89 e5                	mov    %esp,%ebp
 804859f:	53                   	push   %ebx
 80485a0:	e8 00 00 00 00       	call   80485a5 <_init+0x9>
 80485a5:	5b                   	pop    %ebx
 80485a6:	81 c3 7b 27 00 00    	add    $0x277b,%ebx
 80485ac:	83 bb 58 00 00 00 00 	cmpl   $0x0,0x58(%ebx)
 80485b3:	74 05                	je     80485ba <_init+0x1e>
 80485b5:	e8 46 7a fb f7       	call   0 <_init-0x804859c>
 80485ba:	89 f6                	mov    %esi,%esi
 80485bc:	e8 df 01 00 00       	call   80487a0 <frame_dummy>
 80485c1:	e8 5a 12 00 00       	call   8049820 <__do_global_ctors_aux>
 80485c6:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80485c9:	c9                   	leave  
 80485ca:	c3                   	ret    
Disassembly of section .plt:

080485cc <.plt>:
 80485cc:	ff 35 24 ad 04 08    	pushl  0x804ad24
 80485d2:	ff 25 28 ad 04 08    	jmp    *0x804ad28
 80485d8:	00 00                	add    %al,(%eax)
 80485da:	00 00                	add    %al,(%eax)
 80485dc:	ff 25 2c ad 04 08    	jmp    *0x804ad2c
 80485e2:	68 00 00 00 00       	push   $0x0
 80485e7:	e9 e0 ff ff ff       	jmp    80485cc <_init+0x30>
 80485ec:	ff 25 30 ad 04 08    	jmp    *0x804ad30
 80485f2:	68 08 00 00 00       	push   $0x8
 80485f7:	e9 d0 ff ff ff       	jmp    80485cc <_init+0x30>
 80485fc:	ff 25 34 ad 04 08    	jmp    *0x804ad34
 8048602:	68 10 00 00 00       	push   $0x10
 8048607:	e9 c0 ff ff ff       	jmp    80485cc <_init+0x30>
 804860c:	ff 25 38 ad 04 08    	jmp    *0x804ad38
 8048612:	68 18 00 00 00       	push   $0x18
 8048617:	e9 b0 ff ff ff       	jmp    80485cc <_init+0x30>
 804861c:	ff 25 3c ad 04 08    	jmp    *0x804ad3c
 8048622:	68 20 00 00 00       	push   $0x20
 8048627:	e9 a0 ff ff ff       	jmp    80485cc <_init+0x30>
 804862c:	ff 25 40 ad 04 08    	jmp    *0x804ad40
 8048632:	68 28 00 00 00       	push   $0x28
 8048637:	e9 90 ff ff ff       	jmp    80485cc <_init+0x30>
 804863c:	ff 25 44 ad 04 08    	jmp    *0x804ad44
 8048642:	68 30 00 00 00       	push   $0x30
 8048647:	e9 80 ff ff ff       	jmp    80485cc <_init+0x30>
 804864c:	ff 25 48 ad 04 08    	jmp    *0x804ad48
 8048652:	68 38 00 00 00       	push   $0x38
 8048657:	e9 70 ff ff ff       	jmp    80485cc <_init+0x30>
 804865c:	ff 25 4c ad 04 08    	jmp    *0x804ad4c
 8048662:	68 40 00 00 00       	push   $0x40
 8048667:	e9 60 ff ff ff       	jmp    80485cc <_init+0x30>
 804866c:	ff 25 50 ad 04 08    	jmp    *0x804ad50
 8048672:	68 48 00 00 00       	push   $0x48
 8048677:	e9 50 ff ff ff       	jmp    80485cc <_init+0x30>
 804867c:	ff 25 54 ad 04 08    	jmp    *0x804ad54
 8048682:	68 50 00 00 00       	push   $0x50
 8048687:	e9 40 ff ff ff       	jmp    80485cc <_init+0x30>
 804868c:	ff 25 58 ad 04 08    	jmp    *0x804ad58
 8048692:	68 58 00 00 00       	push   $0x58
 8048697:	e9 30 ff ff ff       	jmp    80485cc <_init+0x30>
 804869c:	ff 25 5c ad 04 08    	jmp    *0x804ad5c
 80486a2:	68 60 00 00 00       	push   $0x60
 80486a7:	e9 20 ff ff ff       	jmp    80485cc <_init+0x30>
 80486ac:	ff 25 60 ad 04 08    	jmp    *0x804ad60
 80486b2:	68 68 00 00 00       	push   $0x68
 80486b7:	e9 10 ff ff ff       	jmp    80485cc <_init+0x30>
 80486bc:	ff 25 64 ad 04 08    	jmp    *0x804ad64
 80486c2:	68 70 00 00 00       	push   $0x70
 80486c7:	e9 00 ff ff ff       	jmp    80485cc <_init+0x30>
 80486cc:	ff 25 68 ad 04 08    	jmp    *0x804ad68
 80486d2:	68 78 00 00 00       	push   $0x78
 80486d7:	e9 f0 fe ff ff       	jmp    80485cc <_init+0x30>
 80486dc:	ff 25 6c ad 04 08    	jmp    *0x804ad6c
 80486e2:	68 80 00 00 00       	push   $0x80
 80486e7:	e9 e0 fe ff ff       	jmp    80485cc <_init+0x30>
 80486ec:	ff 25 70 ad 04 08    	jmp    *0x804ad70
 80486f2:	68 88 00 00 00       	push   $0x88
 80486f7:	e9 d0 fe ff ff       	jmp    80485cc <_init+0x30>
 80486fc:	ff 25 74 ad 04 08    	jmp    *0x804ad74
 8048702:	68 90 00 00 00       	push   $0x90
 8048707:	e9 c0 fe ff ff       	jmp    80485cc <_init+0x30>
Disassembly of section .text:

08048710 <_start>:
 8048710:	31 ed                	xor    %ebp,%ebp
 8048712:	5e                   	pop    %esi
 8048713:	89 e1                	mov    %esp,%ecx
 8048715:	83 e4 f8             	and    $0xfffffff8,%esp
 8048718:	50                   	push   %eax
 8048719:	54                   	push   %esp
 804871a:	52                   	push   %edx
 804871b:	68 54 98 04 08       	push   $0x8049854
 8048720:	68 9c 85 04 08       	push   $0x804859c
 8048725:	51                   	push   %ecx
 8048726:	56                   	push   %esi
 8048727:	68 d4 8e 04 08       	push   $0x8048ed4
 804872c:	e8 3b ff ff ff       	call   804866c <_init+0xd0>
 8048731:	f4                   	hlt    
 8048732:	90                   	nop    
 8048733:	90                   	nop    

08048734 <gcc2_compiled.>:
 8048734:	90 90 90 90 90 90 90 90 90 90 90 90                 ............

08048740 <__do_global_dtors_aux>:
 8048740:	55                   	push   %ebp
 8048741:	89 e5                	mov    %esp,%ebp
 8048743:	83 ec 08             	sub    $0x8,%esp
 8048746:	83 3d ac ac 04 08 00 	cmpl   $0x0,0x804acac
 804874d:	75 3e                	jne    804878d <__do_global_dtors_aux+0x4d>
 804874f:	eb 12                	jmp    8048763 <__do_global_dtors_aux+0x23>
 8048751:	a1 a8 ac 04 08       	mov    0x804aca8,%eax
 8048756:	8d 50 04             	lea    0x4(%eax),%edx
 8048759:	89 15 a8 ac 04 08    	mov    %edx,0x804aca8
 804875f:	8b 00                	mov    (%eax),%eax
 8048761:	ff d0                	call   *%eax
 8048763:	a1 a8 ac 04 08       	mov    0x804aca8,%eax
 8048768:	83 38 00             	cmpl   $0x0,(%eax)
 804876b:	75 e4                	jne    8048751 <__do_global_dtors_aux+0x11>
 804876d:	b8 3c 86 04 08       	mov    $0x804863c,%eax
 8048772:	85 c0                	test   %eax,%eax
 8048774:	74 0d                	je     8048783 <__do_global_dtors_aux+0x43>
 8048776:	83 c4 f4             	add    $0xfffffff4,%esp
 8048779:	68 0c ad 04 08       	push   $0x804ad0c
 804877e:	e8 b9 fe ff ff       	call   804863c <_init+0xa0>
 8048783:	c7 05 ac ac 04 08 01 	movl   $0x1,0x804acac
 804878a:	00 00 00 
 804878d:	89 ec                	mov    %ebp,%esp
 804878f:	5d                   	pop    %ebp
 8048790:	c3                   	ret    
 8048791:	8d 76 00             	lea    0x0(%esi),%esi

08048794 <fini_dummy>:
 8048794:	55                   	push   %ebp
 8048795:	89 e5                	mov    %esp,%ebp
 8048797:	83 ec 08             	sub    $0x8,%esp
 804879a:	89 ec                	mov    %ebp,%esp
 804879c:	5d                   	pop    %ebp
 804879d:	c3                   	ret    
 804879e:	89 f6                	mov    %esi,%esi

080487a0 <frame_dummy>:
 80487a0:	55                   	push   %ebp
 80487a1:	89 e5                	mov    %esp,%ebp
 80487a3:	83 ec 08             	sub    $0x8,%esp
 80487a6:	b8 dc 85 04 08       	mov    $0x80485dc,%eax
 80487ab:	85 c0                	test   %eax,%eax
 80487ad:	74 12                	je     80487c1 <frame_dummy+0x21>
 80487af:	83 c4 f8             	add    $0xfffffff8,%esp
 80487b2:	68 2c ae 04 08       	push   $0x804ae2c
 80487b7:	68 0c ad 04 08       	push   $0x804ad0c
 80487bc:	e8 1b fe ff ff       	call   80485dc <_init+0x40>
 80487c1:	89 ec                	mov    %ebp,%esp
 80487c3:	5d                   	pop    %ebp
 80487c4:	c3                   	ret    
 80487c5:	8d 76 00             	lea    0x0(%esi),%esi

080487c8 <init_dummy>:
 80487c8:	55                   	push   %ebp
 80487c9:	89 e5                	mov    %esp,%ebp
 80487cb:	83 ec 08             	sub    $0x8,%esp
 80487ce:	89 ec                	mov    %ebp,%esp
 80487d0:	5d                   	pop    %ebp
 80487d1:	c3                   	ret    
 80487d2:	90                   	nop    
 80487d3:	90                   	nop    
 80487d4:	90                   	nop    
 80487d5:	90                   	nop    
 80487d6:	90                   	nop    
 80487d7:	90                   	nop    
 80487d8:	90                   	nop    
 80487d9:	90                   	nop    
 80487da:	90                   	nop    
 80487db:	90                   	nop    
 80487dc:	90                   	nop    
 80487dd:	90                   	nop    
 80487de:	90                   	nop    
 80487df:	90                   	nop    

080487e0 <lower1>:
 80487e0:	55                   	push   %ebp
 80487e1:	89 e5                	mov    %esp,%ebp
 80487e3:	53                   	push   %ebx
 80487e4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80487e7:	89 da                	mov    %ebx,%edx
 80487e9:	89 d8                	mov    %ebx,%eax
 80487eb:	83 e2 03             	and    $0x3,%edx
 80487ee:	74 16                	je     8048806 <lower1+0x26>
 80487f0:	7a 0f                	jp     8048801 <lower1+0x21>
 80487f2:	83 fa 02             	cmp    $0x2,%edx
 80487f5:	74 05                	je     80487fc <lower1+0x1c>
 80487f7:	38 30                	cmp    %dh,(%eax)
 80487f9:	74 2d                	je     8048828 <lower1+0x48>
 80487fb:	40                   	inc    %eax
 80487fc:	38 30                	cmp    %dh,(%eax)
 80487fe:	74 28                	je     8048828 <lower1+0x48>
 8048800:	40                   	inc    %eax
 8048801:	38 30                	cmp    %dh,(%eax)
 8048803:	74 23                	je     8048828 <lower1+0x48>
 8048805:	40                   	inc    %eax
 8048806:	8b 10                	mov    (%eax),%edx
 8048808:	84 d2                	test   %dl,%dl
 804880a:	74 1c                	je     8048828 <lower1+0x48>
 804880c:	84 f6                	test   %dh,%dh
 804880e:	74 17                	je     8048827 <lower1+0x47>
 8048810:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 8048816:	74 0e                	je     8048826 <lower1+0x46>
 8048818:	83 c0 04             	add    $0x4,%eax
 804881b:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 8048821:	75 e3                	jne    8048806 <lower1+0x26>
 8048823:	83 e8 03             	sub    $0x3,%eax
 8048826:	40                   	inc    %eax
 8048827:	40                   	inc    %eax
 8048828:	31 c9                	xor    %ecx,%ecx
 804882a:	39 d8                	cmp    %ebx,%eax
 804882c:	74 5a                	je     8048888 <lower1+0xa8>
 804882e:	89 f6                	mov    %esi,%esi
 8048830:	8a 14 19             	mov    (%ecx,%ebx,1),%dl
 8048833:	8d 42 bf             	lea    0xffffffbf(%edx),%eax
 8048836:	3c 19                	cmp    $0x19,%al
 8048838:	77 06                	ja     8048840 <lower1+0x60>
 804883a:	80 c2 20             	add    $0x20,%dl
 804883d:	88 14 19             	mov    %dl,(%ecx,%ebx,1)
 8048840:	41                   	inc    %ecx
 8048841:	89 da                	mov    %ebx,%edx
 8048843:	89 d8                	mov    %ebx,%eax
 8048845:	83 e2 03             	and    $0x3,%edx
 8048848:	74 16                	je     8048860 <lower1+0x80>
 804884a:	7a 0f                	jp     804885b <lower1+0x7b>
 804884c:	83 fa 02             	cmp    $0x2,%edx
 804884f:	74 05                	je     8048856 <lower1+0x76>
 8048851:	38 30                	cmp    %dh,(%eax)
 8048853:	74 2d                	je     8048882 <lower1+0xa2>
 8048855:	40                   	inc    %eax
 8048856:	38 30                	cmp    %dh,(%eax)
 8048858:	74 28                	je     8048882 <lower1+0xa2>
 804885a:	40                   	inc    %eax
 804885b:	38 30                	cmp    %dh,(%eax)
 804885d:	74 23                	je     8048882 <lower1+0xa2>
 804885f:	40                   	inc    %eax
 8048860:	8b 10                	mov    (%eax),%edx
 8048862:	84 d2                	test   %dl,%dl
 8048864:	74 1c                	je     8048882 <lower1+0xa2>
 8048866:	84 f6                	test   %dh,%dh
 8048868:	74 17                	je     8048881 <lower1+0xa1>
 804886a:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 8048870:	74 0e                	je     8048880 <lower1+0xa0>
 8048872:	83 c0 04             	add    $0x4,%eax
 8048875:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 804887b:	75 e3                	jne    8048860 <lower1+0x80>
 804887d:	83 e8 03             	sub    $0x3,%eax
 8048880:	40                   	inc    %eax
 8048881:	40                   	inc    %eax
 8048882:	29 d8                	sub    %ebx,%eax
 8048884:	39 c1                	cmp    %eax,%ecx
 8048886:	72 a8                	jb     8048830 <lower1+0x50>
 8048888:	5b                   	pop    %ebx
 8048889:	89 ec                	mov    %ebp,%esp
 804888b:	5d                   	pop    %ebp
 804888c:	c3                   	ret    
 804888d:	8d 76 00             	lea    0x0(%esi),%esi

08048890 <lower2>:
 8048890:	55                   	push   %ebp
 8048891:	89 e5                	mov    %esp,%ebp
 8048893:	56                   	push   %esi
 8048894:	53                   	push   %ebx
 8048895:	8b 75 08             	mov    0x8(%ebp),%esi
 8048898:	89 f0                	mov    %esi,%eax
 804889a:	89 f3                	mov    %esi,%ebx
 804889c:	83 e0 03             	and    $0x3,%eax
 804889f:	74 16                	je     80488b7 <lower2+0x27>
 80488a1:	7a 0f                	jp     80488b2 <lower2+0x22>
 80488a3:	83 f8 02             	cmp    $0x2,%eax
 80488a6:	74 05                	je     80488ad <lower2+0x1d>
 80488a8:	38 23                	cmp    %ah,(%ebx)
 80488aa:	74 2b                	je     80488d7 <lower2+0x47>
 80488ac:	43                   	inc    %ebx
 80488ad:	38 23                	cmp    %ah,(%ebx)
 80488af:	74 26                	je     80488d7 <lower2+0x47>
 80488b1:	43                   	inc    %ebx
 80488b2:	38 23                	cmp    %ah,(%ebx)
 80488b4:	74 21                	je     80488d7 <lower2+0x47>
 80488b6:	43                   	inc    %ebx
 80488b7:	8b 03                	mov    (%ebx),%eax
 80488b9:	84 c0                	test   %al,%al
 80488bb:	74 1a                	je     80488d7 <lower2+0x47>
 80488bd:	84 e4                	test   %ah,%ah
 80488bf:	74 15                	je     80488d6 <lower2+0x46>
 80488c1:	a9 00 00 ff 00       	test   $0xff0000,%eax
 80488c6:	74 0d                	je     80488d5 <lower2+0x45>
 80488c8:	83 c3 04             	add    $0x4,%ebx
 80488cb:	a9 00 00 00 ff       	test   $0xff000000,%eax
 80488d0:	75 e5                	jne    80488b7 <lower2+0x27>
 80488d2:	83 eb 03             	sub    $0x3,%ebx
 80488d5:	43                   	inc    %ebx
 80488d6:	43                   	inc    %ebx
 80488d7:	29 f3                	sub    %esi,%ebx
 80488d9:	31 c9                	xor    %ecx,%ecx
 80488db:	39 d9                	cmp    %ebx,%ecx
 80488dd:	7d 16                	jge    80488f5 <lower2+0x65>
 80488df:	90                   	nop    
 80488e0:	8a 14 31             	mov    (%ecx,%esi,1),%dl
 80488e3:	8d 42 bf             	lea    0xffffffbf(%edx),%eax
 80488e6:	3c 19                	cmp    $0x19,%al
 80488e8:	77 06                	ja     80488f0 <lower2+0x60>
 80488ea:	80 c2 20             	add    $0x20,%dl
 80488ed:	88 14 31             	mov    %dl,(%ecx,%esi,1)
 80488f0:	41                   	inc    %ecx
 80488f1:	39 d9                	cmp    %ebx,%ecx
 80488f3:	7c eb                	jl     80488e0 <lower2+0x50>
 80488f5:	5b                   	pop    %ebx
 80488f6:	5e                   	pop    %esi
 80488f7:	89 ec                	mov    %ebp,%esp
 80488f9:	5d                   	pop    %ebp
 80488fa:	c3                   	ret    
 80488fb:	90                   	nop    

080488fc <strlen>:
 80488fc:	55                   	push   %ebp
 80488fd:	89 e5                	mov    %esp,%ebp
 80488ff:	8b 55 08             	mov    0x8(%ebp),%edx
 8048902:	31 c0                	xor    %eax,%eax
 8048904:	80 3a 00             	cmpb   $0x0,(%edx)
 8048907:	74 0e                	je     8048917 <strlen+0x1b>
 8048909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8048910:	42                   	inc    %edx
 8048911:	40                   	inc    %eax
 8048912:	80 3a 00             	cmpb   $0x0,(%edx)
 8048915:	75 f9                	jne    8048910 <strlen+0x14>
 8048917:	89 ec                	mov    %ebp,%esp
 8048919:	5d                   	pop    %ebp
 804891a:	c3                   	ret    
 804891b:	90                   	nop    

0804891c <new_table>:
 804891c:	55                   	push   %ebp
 804891d:	89 e5                	mov    %esp,%ebp
 804891f:	83 ec 08             	sub    $0x8,%esp
 8048922:	8b 45 08             	mov    0x8(%ebp),%eax
 8048925:	a3 40 b7 04 08       	mov    %eax,0x804b740
 804892a:	83 c4 f8             	add    $0xfffffff8,%esp
 804892d:	6a 04                	push   $0x4
 804892f:	50                   	push   %eax
 8048930:	e8 77 fd ff ff       	call   80486ac <_init+0x110>
 8048935:	a3 20 b3 04 08       	mov    %eax,0x804b320
 804893a:	83 c4 10             	add    $0x10,%esp
 804893d:	85 c0                	test   %eax,%eax
 804893f:	75 1f                	jne    8048960 <new_table+0x44>
 8048941:	83 c4 f8             	add    $0xfffffff8,%esp
 8048944:	68 c0 98 04 08       	push   $0x80498c0
 8048949:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 804894e:	50                   	push   %eax
 804894f:	e8 a8 fc ff ff       	call   80485fc <_init+0x60>
 8048954:	83 c4 f4             	add    $0xfffffff4,%esp
 8048957:	6a 01                	push   $0x1
 8048959:	e8 3e fd ff ff       	call   804869c <_init+0x100>
 804895e:	89 f6                	mov    %esi,%esi
 8048960:	89 ec                	mov    %ebp,%esp
 8048962:	5d                   	pop    %ebp
 8048963:	c3                   	ret    

08048964 <new_ele>:
 8048964:	55                   	push   %ebp
 8048965:	89 e5                	mov    %esp,%ebp
 8048967:	83 ec 08             	sub    $0x8,%esp
 804896a:	83 c4 f4             	add    $0xfffffff4,%esp
 804896d:	6a 0c                	push   $0xc
 804896f:	e8 a8 fc ff ff       	call   804861c <_init+0x80>
 8048974:	89 c2                	mov    %eax,%edx
 8048976:	83 c4 10             	add    $0x10,%esp
 8048979:	85 d2                	test   %edx,%edx
 804897b:	75 23                	jne    80489a0 <new_ele+0x3c>
 804897d:	83 c4 f8             	add    $0xfffffff8,%esp
 8048980:	68 00 99 04 08       	push   $0x8049900
 8048985:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 804898a:	50                   	push   %eax
 804898b:	e8 6c fc ff ff       	call   80485fc <_init+0x60>
 8048990:	83 c4 f4             	add    $0xfffffff4,%esp
 8048993:	6a 01                	push   $0x1
 8048995:	e8 02 fd ff ff       	call   804869c <_init+0x100>
 804899a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80489a0:	8b 45 08             	mov    0x8(%ebp),%eax
 80489a3:	89 02                	mov    %eax,(%edx)
 80489a5:	c7 42 04 01 00 00 00 	movl   $0x1,0x4(%edx)
 80489ac:	89 d0                	mov    %edx,%eax
 80489ae:	89 ec                	mov    %ebp,%esp
 80489b0:	5d                   	pop    %ebp
 80489b1:	c3                   	ret    
 80489b2:	89 f6                	mov    %esi,%esi

080489b4 <h_mod>:
 80489b4:	55                   	push   %ebp
 80489b5:	89 e5                	mov    %esp,%ebp
 80489b7:	56                   	push   %esi
 80489b8:	53                   	push   %ebx
 80489b9:	8b 75 08             	mov    0x8(%ebp),%esi
 80489bc:	31 db                	xor    %ebx,%ebx
 80489be:	0f be 06             	movsbl (%esi),%eax
 80489c1:	46                   	inc    %esi
 80489c2:	85 c0                	test   %eax,%eax
 80489c4:	74 1d                	je     80489e3 <h_mod+0x2f>
 80489c6:	8b 0d 40 b7 04 08    	mov    0x804b740,%ecx
 80489cc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80489d0:	c1 e3 07             	shl    $0x7,%ebx
 80489d3:	01 d8                	add    %ebx,%eax
 80489d5:	31 d2                	xor    %edx,%edx
 80489d7:	f7 f1                	div    %ecx,%eax
 80489d9:	89 d3                	mov    %edx,%ebx
 80489db:	0f be 06             	movsbl (%esi),%eax
 80489de:	46                   	inc    %esi
 80489df:	85 c0                	test   %eax,%eax
 80489e1:	75 ed                	jne    80489d0 <h_mod+0x1c>
 80489e3:	89 d8                	mov    %ebx,%eax
 80489e5:	5b                   	pop    %ebx
 80489e6:	5e                   	pop    %esi
 80489e7:	89 ec                	mov    %ebp,%esp
 80489e9:	5d                   	pop    %ebp
 80489ea:	c3                   	ret    
 80489eb:	90                   	nop    

080489ec <h_add>:
 80489ec:	55                   	push   %ebp
 80489ed:	89 e5                	mov    %esp,%ebp
 80489ef:	53                   	push   %ebx
 80489f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80489f3:	8b 1d 40 b7 04 08    	mov    0x804b740,%ebx
 80489f9:	31 c0                	xor    %eax,%eax
 80489fb:	eb 05                	jmp    8048a02 <h_add+0x16>
 80489fd:	8d 76 00             	lea    0x0(%esi),%esi
 8048a00:	01 d0                	add    %edx,%eax
 8048a02:	0f be 11             	movsbl (%ecx),%edx
 8048a05:	41                   	inc    %ecx
 8048a06:	85 d2                	test   %edx,%edx
 8048a08:	75 f6                	jne    8048a00 <h_add+0x14>
 8048a0a:	31 d2                	xor    %edx,%edx
 8048a0c:	f7 f3                	div    %ebx,%eax
 8048a0e:	89 d0                	mov    %edx,%eax
 8048a10:	5b                   	pop    %ebx
 8048a11:	89 ec                	mov    %ebp,%esp
 8048a13:	5d                   	pop    %ebp
 8048a14:	c3                   	ret    
 8048a15:	8d 76 00             	lea    0x0(%esi),%esi

08048a18 <h_xor>:
 8048a18:	55                   	push   %ebp
 8048a19:	89 e5                	mov    %esp,%ebp
 8048a1b:	53                   	push   %ebx
 8048a1c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048a1f:	8b 1d 40 b7 04 08    	mov    0x804b740,%ebx
 8048a25:	31 c0                	xor    %eax,%eax
 8048a27:	eb 11                	jmp    8048a3a <h_xor+0x22>
 8048a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8048a30:	31 c2                	xor    %eax,%edx
 8048a32:	c1 e2 04             	shl    $0x4,%edx
 8048a35:	c1 e8 1c             	shr    $0x1c,%eax
 8048a38:	09 d0                	or     %edx,%eax
 8048a3a:	0f be 11             	movsbl (%ecx),%edx
 8048a3d:	41                   	inc    %ecx
 8048a3e:	85 d2                	test   %edx,%edx
 8048a40:	75 ee                	jne    8048a30 <h_xor+0x18>
 8048a42:	31 d2                	xor    %edx,%edx
 8048a44:	f7 f3                	div    %ebx,%eax
 8048a46:	89 d0                	mov    %edx,%eax
 8048a48:	5b                   	pop    %ebx
 8048a49:	89 ec                	mov    %ebp,%esp
 8048a4b:	5d                   	pop    %ebp
 8048a4c:	c3                   	ret    
 8048a4d:	8d 76 00             	lea    0x0(%esi),%esi

08048a50 <save_string>:
 8048a50:	55                   	push   %ebp
 8048a51:	89 e5                	mov    %esp,%ebp
 8048a53:	83 ec 10             	sub    $0x10,%esp
 8048a56:	56                   	push   %esi
 8048a57:	53                   	push   %ebx
 8048a58:	8b 75 08             	mov    0x8(%ebp),%esi
 8048a5b:	83 c4 f4             	add    $0xfffffff4,%esp
 8048a5e:	83 c4 f4             	add    $0xfffffff4,%esp
 8048a61:	56                   	push   %esi
 8048a62:	e8 95 fe ff ff       	call   80488fc <strlen>
 8048a67:	40                   	inc    %eax
 8048a68:	50                   	push   %eax
 8048a69:	e8 ae fb ff ff       	call   804861c <_init+0x80>
 8048a6e:	89 c3                	mov    %eax,%ebx
 8048a70:	83 c4 20             	add    $0x20,%esp
 8048a73:	85 db                	test   %ebx,%ebx
 8048a75:	75 1d                	jne    8048a94 <save_string+0x44>
 8048a77:	83 c4 f8             	add    $0xfffffff8,%esp
 8048a7a:	68 40 99 04 08       	push   $0x8049940
 8048a7f:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8048a84:	50                   	push   %eax
 8048a85:	e8 72 fb ff ff       	call   80485fc <_init+0x60>
 8048a8a:	83 c4 f4             	add    $0xfffffff4,%esp
 8048a8d:	6a 01                	push   $0x1
 8048a8f:	e8 08 fc ff ff       	call   804869c <_init+0x100>
 8048a94:	83 c4 f8             	add    $0xfffffff8,%esp
 8048a97:	56                   	push   %esi
 8048a98:	53                   	push   %ebx
 8048a99:	e8 5e fc ff ff       	call   80486fc <_init+0x160>
 8048a9e:	89 d8                	mov    %ebx,%eax
 8048aa0:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048aa3:	5b                   	pop    %ebx
 8048aa4:	5e                   	pop    %esi
 8048aa5:	89 ec                	mov    %ebp,%esp
 8048aa7:	5d                   	pop    %ebp
 8048aa8:	c3                   	ret    
 8048aa9:	8d 76 00             	lea    0x0(%esi),%esi

08048aac <find_ele_rec>:
 8048aac:	55                   	push   %ebp
 8048aad:	89 e5                	mov    %esp,%ebp
 8048aaf:	83 ec 10             	sub    $0x10,%esp
 8048ab2:	56                   	push   %esi
 8048ab3:	53                   	push   %ebx
 8048ab4:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048ab7:	8b 75 0c             	mov    0xc(%ebp),%esi
 8048aba:	85 db                	test   %ebx,%ebx
 8048abc:	75 1a                	jne    8048ad8 <find_ele_rec+0x2c>
 8048abe:	ff 05 b4 ac 04 08    	incl   0x804acb4
 8048ac4:	83 c4 f4             	add    $0xfffffff4,%esp
 8048ac7:	83 c4 f4             	add    $0xfffffff4,%esp
 8048aca:	56                   	push   %esi
 8048acb:	e8 80 ff ff ff       	call   8048a50 <save_string>
 8048ad0:	50                   	push   %eax
 8048ad1:	e8 8e fe ff ff       	call   8048964 <new_ele>
 8048ad6:	eb 4a                	jmp    8048b22 <find_ele_rec+0x76>
 8048ad8:	8b 03                	mov    (%ebx),%eax
 8048ada:	83 c4 f8             	add    $0xfffffff8,%esp
 8048add:	50                   	push   %eax
 8048ade:	56                   	push   %esi
 8048adf:	e8 08 fb ff ff       	call   80485ec <_init+0x50>
 8048ae4:	83 c4 10             	add    $0x10,%esp
 8048ae7:	85 c0                	test   %eax,%eax
 8048ae9:	75 25                	jne    8048b10 <find_ele_rec+0x64>
 8048aeb:	8b 43 04             	mov    0x4(%ebx),%eax
 8048aee:	8d 50 01             	lea    0x1(%eax),%edx
 8048af1:	89 53 04             	mov    %edx,0x4(%ebx)
 8048af4:	89 d0                	mov    %edx,%eax
 8048af6:	3b 05 b8 ac 04 08    	cmp    0x804acb8,%eax
 8048afc:	7e 22                	jle    8048b20 <find_ele_rec+0x74>
 8048afe:	a3 b8 ac 04 08       	mov    %eax,0x804acb8
 8048b03:	8b 03                	mov    (%ebx),%eax
 8048b05:	a3 bc ac 04 08       	mov    %eax,0x804acbc
 8048b0a:	eb 14                	jmp    8048b20 <find_ele_rec+0x74>
 8048b0c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048b10:	83 c4 f8             	add    $0xfffffff8,%esp
 8048b13:	56                   	push   %esi
 8048b14:	8b 43 08             	mov    0x8(%ebx),%eax
 8048b17:	50                   	push   %eax
 8048b18:	e8 8f ff ff ff       	call   8048aac <find_ele_rec>
 8048b1d:	89 43 08             	mov    %eax,0x8(%ebx)
 8048b20:	89 d8                	mov    %ebx,%eax
 8048b22:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048b25:	5b                   	pop    %ebx
 8048b26:	5e                   	pop    %esi
 8048b27:	89 ec                	mov    %ebp,%esp
 8048b29:	5d                   	pop    %ebp
 8048b2a:	c3                   	ret    
 8048b2b:	90                   	nop    

08048b2c <find_ele_iter_f>:
 8048b2c:	55                   	push   %ebp
 8048b2d:	89 e5                	mov    %esp,%ebp
 8048b2f:	83 ec 0c             	sub    $0xc,%esp
 8048b32:	57                   	push   %edi
 8048b33:	56                   	push   %esi
 8048b34:	53                   	push   %ebx
 8048b35:	8b 7d 08             	mov    0x8(%ebp),%edi
 8048b38:	89 fb                	mov    %edi,%ebx
 8048b3a:	85 db                	test   %ebx,%ebx
 8048b3c:	74 41                	je     8048b7f <find_ele_iter_f+0x53>
 8048b3e:	89 f6                	mov    %esi,%esi
 8048b40:	8b 33                	mov    (%ebx),%esi
 8048b42:	83 c4 f8             	add    $0xfffffff8,%esp
 8048b45:	56                   	push   %esi
 8048b46:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b49:	50                   	push   %eax
 8048b4a:	e8 9d fa ff ff       	call   80485ec <_init+0x50>
 8048b4f:	83 c4 10             	add    $0x10,%esp
 8048b52:	85 c0                	test   %eax,%eax
 8048b54:	75 22                	jne    8048b78 <find_ele_iter_f+0x4c>
 8048b56:	8b 43 04             	mov    0x4(%ebx),%eax
 8048b59:	8d 50 01             	lea    0x1(%eax),%edx
 8048b5c:	89 53 04             	mov    %edx,0x4(%ebx)
 8048b5f:	89 d0                	mov    %edx,%eax
 8048b61:	3b 05 b8 ac 04 08    	cmp    0x804acb8,%eax
 8048b67:	7e 0b                	jle    8048b74 <find_ele_iter_f+0x48>
 8048b69:	a3 b8 ac 04 08       	mov    %eax,0x804acb8
 8048b6e:	89 35 bc ac 04 08    	mov    %esi,0x804acbc
 8048b74:	89 f8                	mov    %edi,%eax
 8048b76:	eb 27                	jmp    8048b9f <find_ele_iter_f+0x73>
 8048b78:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8048b7b:	85 db                	test   %ebx,%ebx
 8048b7d:	75 c1                	jne    8048b40 <find_ele_iter_f+0x14>
 8048b7f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b82:	83 c4 f4             	add    $0xfffffff4,%esp
 8048b85:	83 c4 f4             	add    $0xfffffff4,%esp
 8048b88:	50                   	push   %eax
 8048b89:	e8 c2 fe ff ff       	call   8048a50 <save_string>
 8048b8e:	50                   	push   %eax
 8048b8f:	e8 d0 fd ff ff       	call   8048964 <new_ele>
 8048b94:	89 c3                	mov    %eax,%ebx
 8048b96:	ff 05 b4 ac 04 08    	incl   0x804acb4
 8048b9c:	89 7b 08             	mov    %edi,0x8(%ebx)
 8048b9f:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048ba2:	5b                   	pop    %ebx
 8048ba3:	5e                   	pop    %esi
 8048ba4:	5f                   	pop    %edi
 8048ba5:	89 ec                	mov    %ebp,%esp
 8048ba7:	5d                   	pop    %ebp
 8048ba8:	c3                   	ret    
 8048ba9:	8d 76 00             	lea    0x0(%esi),%esi

08048bac <find_ele_iter_r>:
 8048bac:	55                   	push   %ebp
 8048bad:	89 e5                	mov    %esp,%ebp
 8048baf:	83 ec 0c             	sub    $0xc,%esp
 8048bb2:	57                   	push   %edi
 8048bb3:	56                   	push   %esi
 8048bb4:	53                   	push   %ebx
 8048bb5:	8b 7d 08             	mov    0x8(%ebp),%edi
 8048bb8:	31 f6                	xor    %esi,%esi
 8048bba:	89 fb                	mov    %edi,%ebx
 8048bbc:	85 ff                	test   %edi,%edi
 8048bbe:	74 3f                	je     8048bff <find_ele_iter_r+0x53>
 8048bc0:	8b 33                	mov    (%ebx),%esi
 8048bc2:	83 c4 f8             	add    $0xfffffff8,%esp
 8048bc5:	56                   	push   %esi
 8048bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bc9:	50                   	push   %eax
 8048bca:	e8 1d fa ff ff       	call   80485ec <_init+0x50>
 8048bcf:	83 c4 10             	add    $0x10,%esp
 8048bd2:	85 c0                	test   %eax,%eax
 8048bd4:	75 20                	jne    8048bf6 <find_ele_iter_r+0x4a>
 8048bd6:	8b 43 04             	mov    0x4(%ebx),%eax
 8048bd9:	8d 50 01             	lea    0x1(%eax),%edx
 8048bdc:	89 53 04             	mov    %edx,0x4(%ebx)
 8048bdf:	89 d0                	mov    %edx,%eax
 8048be1:	3b 05 b8 ac 04 08    	cmp    0x804acb8,%eax
 8048be7:	7e 41                	jle    8048c2a <find_ele_iter_r+0x7e>
 8048be9:	a3 b8 ac 04 08       	mov    %eax,0x804acb8
 8048bee:	89 35 bc ac 04 08    	mov    %esi,0x804acbc
 8048bf4:	eb 34                	jmp    8048c2a <find_ele_iter_r+0x7e>
 8048bf6:	89 de                	mov    %ebx,%esi
 8048bf8:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8048bfb:	85 db                	test   %ebx,%ebx
 8048bfd:	75 c1                	jne    8048bc0 <find_ele_iter_r+0x14>
 8048bff:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c02:	83 c4 f4             	add    $0xfffffff4,%esp
 8048c05:	83 c4 f4             	add    $0xfffffff4,%esp
 8048c08:	50                   	push   %eax
 8048c09:	e8 42 fe ff ff       	call   8048a50 <save_string>
 8048c0e:	50                   	push   %eax
 8048c0f:	e8 50 fd ff ff       	call   8048964 <new_ele>
 8048c14:	89 c3                	mov    %eax,%ebx
 8048c16:	ff 05 b4 ac 04 08    	incl   0x804acb4
 8048c1c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8048c23:	85 f6                	test   %esi,%esi
 8048c25:	74 05                	je     8048c2c <find_ele_iter_r+0x80>
 8048c27:	89 5e 08             	mov    %ebx,0x8(%esi)
 8048c2a:	89 f8                	mov    %edi,%eax
 8048c2c:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048c2f:	5b                   	pop    %ebx
 8048c30:	5e                   	pop    %esi
 8048c31:	5f                   	pop    %edi
 8048c32:	89 ec                	mov    %ebp,%esp
 8048c34:	5d                   	pop    %ebp
 8048c35:	c3                   	ret    
 8048c36:	89 f6                	mov    %esi,%esi

08048c38 <compare_ele>:
 8048c38:	55                   	push   %ebp
 8048c39:	89 e5                	mov    %esp,%ebp
 8048c3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c3e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c41:	89 ec                	mov    %ebp,%esp
 8048c43:	8b 00                	mov    (%eax),%eax
 8048c45:	8b 12                	mov    (%edx),%edx
 8048c47:	5d                   	pop    %ebp
 8048c48:	8b 40 04             	mov    0x4(%eax),%eax
 8048c4b:	8b 52 04             	mov    0x4(%edx),%edx
 8048c4e:	29 c2                	sub    %eax,%edx
 8048c50:	89 d0                	mov    %edx,%eax
 8048c52:	c3                   	ret    
 8048c53:	90                   	nop    

08048c54 <sort_words>:
 8048c54:	55                   	push   %ebp
 8048c55:	89 e5                	mov    %esp,%ebp
 8048c57:	83 ec 1c             	sub    $0x1c,%esp
 8048c5a:	57                   	push   %edi
 8048c5b:	56                   	push   %esi
 8048c5c:	53                   	push   %ebx
 8048c5d:	83 c4 f8             	add    $0xfffffff8,%esp
 8048c60:	6a 04                	push   $0x4
 8048c62:	a1 b4 ac 04 08       	mov    0x804acb4,%eax
 8048c67:	50                   	push   %eax
 8048c68:	e8 3f fa ff ff       	call   80486ac <_init+0x110>
 8048c6d:	89 c3                	mov    %eax,%ebx
 8048c6f:	31 ff                	xor    %edi,%edi
 8048c71:	31 c9                	xor    %ecx,%ecx
 8048c73:	83 c4 10             	add    $0x10,%esp
 8048c76:	83 3d 40 b7 04 08 00 	cmpl   $0x0,0x804b740
 8048c7d:	7e 60                	jle    8048cdf <sort_words+0x8b>
 8048c7f:	90                   	nop    
 8048c80:	a1 20 b3 04 08       	mov    0x804b320,%eax
 8048c85:	8b 14 88             	mov    (%eax,%ecx,4),%edx
 8048c88:	41                   	inc    %ecx
 8048c89:	89 4d f8             	mov    %ecx,0xfffffff8(%ebp)
 8048c8c:	85 d2                	test   %edx,%edx
 8048c8e:	74 44                	je     8048cd4 <sort_words+0x80>
 8048c90:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048c94:	74 0a                	je     8048ca0 <sort_words+0x4c>
 8048c96:	89 14 bb             	mov    %edx,(%ebx,%edi,4)
 8048c99:	8d 77 01             	lea    0x1(%edi),%esi
 8048c9c:	eb 2d                	jmp    8048ccb <sort_words+0x77>
 8048c9e:	89 f6                	mov    %esi,%esi
 8048ca0:	89 f9                	mov    %edi,%ecx
 8048ca2:	8d 77 01             	lea    0x1(%edi),%esi
 8048ca5:	85 ff                	test   %edi,%edi
 8048ca7:	7e 1f                	jle    8048cc8 <sort_words+0x74>
 8048ca9:	8b 44 bb fc          	mov    0xfffffffc(%ebx,%edi,4),%eax
 8048cad:	eb 11                	jmp    8048cc0 <sort_words+0x6c>
 8048caf:	90                   	nop    
 8048cb0:	8b 44 8b fc          	mov    0xfffffffc(%ebx,%ecx,4),%eax
 8048cb4:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
 8048cb7:	49                   	dec    %ecx
 8048cb8:	85 c9                	test   %ecx,%ecx
 8048cba:	7e 0c                	jle    8048cc8 <sort_words+0x74>
 8048cbc:	8b 44 8b fc          	mov    0xfffffffc(%ebx,%ecx,4),%eax
 8048cc0:	8b 40 04             	mov    0x4(%eax),%eax
 8048cc3:	39 42 04             	cmp    %eax,0x4(%edx)
 8048cc6:	7f e8                	jg     8048cb0 <sort_words+0x5c>
 8048cc8:	89 14 8b             	mov    %edx,(%ebx,%ecx,4)
 8048ccb:	8b 52 08             	mov    0x8(%edx),%edx
 8048cce:	89 f7                	mov    %esi,%edi
 8048cd0:	85 d2                	test   %edx,%edx
 8048cd2:	75 bc                	jne    8048c90 <sort_words+0x3c>
 8048cd4:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
 8048cd7:	3b 0d 40 b7 04 08    	cmp    0x804b740,%ecx
 8048cdd:	7c a1                	jl     8048c80 <sort_words+0x2c>
 8048cdf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048ce3:	74 11                	je     8048cf6 <sort_words+0xa2>
 8048ce5:	68 38 8c 04 08       	push   $0x8048c38
 8048cea:	6a 04                	push   $0x4
 8048cec:	57                   	push   %edi
 8048ced:	53                   	push   %ebx
 8048cee:	e8 69 f9 ff ff       	call   804865c <_init+0xc0>
 8048cf3:	83 c4 10             	add    $0x10,%esp
 8048cf6:	8b 03                	mov    (%ebx),%eax
 8048cf8:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 8048cfb:	31 c9                	xor    %ecx,%ecx
 8048cfd:	8d 77 ff             	lea    0xffffffff(%edi),%esi
 8048d00:	39 f1                	cmp    %esi,%ecx
 8048d02:	7d 0f                	jge    8048d13 <sort_words+0xbf>
 8048d04:	8b 14 8b             	mov    (%ebx,%ecx,4),%edx
 8048d07:	8b 44 8b 04          	mov    0x4(%ebx,%ecx,4),%eax
 8048d0b:	89 42 08             	mov    %eax,0x8(%edx)
 8048d0e:	41                   	inc    %ecx
 8048d0f:	39 f1                	cmp    %esi,%ecx
 8048d11:	7c f1                	jl     8048d04 <sort_words+0xb0>
 8048d13:	8b 44 bb fc          	mov    0xfffffffc(%ebx,%edi,4),%eax
 8048d17:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8048d1e:	83 c4 f4             	add    $0xfffffff4,%esp
 8048d21:	53                   	push   %ebx
 8048d22:	e8 a5 f9 ff ff       	call   80486cc <_init+0x130>
 8048d27:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8048d2a:	8d 65 d8             	lea    0xffffffd8(%ebp),%esp
 8048d2d:	5b                   	pop    %ebx
 8048d2e:	5e                   	pop    %esi
 8048d2f:	5f                   	pop    %edi
 8048d30:	89 ec                	mov    %ebp,%esp
 8048d32:	5d                   	pop    %ebp
 8048d33:	c3                   	ret    

08048d34 <insert_string>:
 8048d34:	55                   	push   %ebp
 8048d35:	89 e5                	mov    %esp,%ebp
 8048d37:	83 ec 0c             	sub    $0xc,%esp
 8048d3a:	57                   	push   %edi
 8048d3b:	56                   	push   %esi
 8048d3c:	53                   	push   %ebx
 8048d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048d40:	8b 75 0c             	mov    0xc(%ebp),%esi
 8048d43:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d46:	8b 7d 14             	mov    0x14(%ebp),%edi
 8048d49:	83 c4 f4             	add    $0xfffffff4,%esp
 8048d4c:	53                   	push   %ebx
 8048d4d:	ff d0                	call   *%eax
 8048d4f:	83 c4 f4             	add    $0xfffffff4,%esp
 8048d52:	53                   	push   %ebx
 8048d53:	ff d6                	call   *%esi
 8048d55:	89 c6                	mov    %eax,%esi
 8048d57:	83 c4 20             	add    $0x20,%esp
 8048d5a:	83 c4 f8             	add    $0xfffffff8,%esp
 8048d5d:	53                   	push   %ebx
 8048d5e:	a1 20 b3 04 08       	mov    0x804b320,%eax
 8048d63:	8b 04 b0             	mov    (%eax,%esi,4),%eax
 8048d66:	50                   	push   %eax
 8048d67:	ff d7                	call   *%edi
 8048d69:	89 c2                	mov    %eax,%edx
 8048d6b:	a1 20 b3 04 08       	mov    0x804b320,%eax
 8048d70:	89 14 b0             	mov    %edx,(%eax,%esi,4)
 8048d73:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048d76:	5b                   	pop    %ebx
 8048d77:	5e                   	pop    %esi
 8048d78:	5f                   	pop    %edi
 8048d79:	89 ec                	mov    %ebp,%esp
 8048d7b:	5d                   	pop    %ebp
 8048d7c:	c3                   	ret    
 8048d7d:	8d 76 00             	lea    0x0(%esi),%esi

08048d80 <init_token>:
 8048d80:	55                   	push   %ebp
 8048d81:	89 e5                	mov    %esp,%ebp
 8048d83:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d86:	c7 05 00 ad 04 08 00 	movl   $0x0,0x804ad00
 8048d8d:	00 00 00 
 8048d90:	a3 24 b3 04 08       	mov    %eax,0x804b324
 8048d95:	89 ec                	mov    %ebp,%esp
 8048d97:	5d                   	pop    %ebp
 8048d98:	c3                   	ret    
 8048d99:	8d 76 00             	lea    0x0(%esi),%esi

08048d9c <get_token>:
 8048d9c:	55                   	push   %ebp
 8048d9d:	89 e5                	mov    %esp,%ebp
 8048d9f:	83 ec 08             	sub    $0x8,%esp
 8048da2:	83 3d 00 ad 04 08 00 	cmpl   $0x0,0x804ad00
 8048da9:	74 17                	je     8048dc2 <get_token+0x26>
 8048dab:	a1 04 ad 04 08       	mov    0x804ad04,%eax
 8048db0:	83 c4 f8             	add    $0xfffffff8,%esp
 8048db3:	50                   	push   %eax
 8048db4:	6a 00                	push   $0x0
 8048db6:	e8 31 f9 ff ff       	call   80486ec <_init+0x150>
 8048dbb:	83 c4 10             	add    $0x10,%esp
 8048dbe:	85 c0                	test   %eax,%eax
 8048dc0:	75 47                	jne    8048e09 <get_token+0x6d>
 8048dc2:	a1 24 b3 04 08       	mov    0x804b324,%eax
 8048dc7:	83 c4 fc             	add    $0xfffffffc,%esp
 8048dca:	50                   	push   %eax
 8048dcb:	68 00 04 00 00       	push   $0x400
 8048dd0:	68 40 b3 04 08       	push   $0x804b340
 8048dd5:	e8 72 f8 ff ff       	call   804864c <_init+0xb0>
 8048dda:	83 c4 10             	add    $0x10,%esp
 8048ddd:	85 c0                	test   %eax,%eax
 8048ddf:	75 04                	jne    8048de5 <get_token+0x49>
 8048de1:	31 c0                	xor    %eax,%eax
 8048de3:	eb 2a                	jmp    8048e0f <get_token+0x73>
 8048de5:	a1 04 ad 04 08       	mov    0x804ad04,%eax
 8048dea:	c7 05 00 ad 04 08 01 	movl   $0x1,0x804ad00
 8048df1:	00 00 00 
 8048df4:	83 c4 f8             	add    $0xfffffff8,%esp
 8048df7:	50                   	push   %eax
 8048df8:	68 40 b3 04 08       	push   $0x804b340
 8048dfd:	e8 ea f8 ff ff       	call   80486ec <_init+0x150>
 8048e02:	83 c4 10             	add    $0x10,%esp
 8048e05:	85 c0                	test   %eax,%eax
 8048e07:	74 99                	je     8048da2 <get_token+0x6>
 8048e09:	ff 05 b0 ac 04 08    	incl   0x804acb0
 8048e0f:	89 ec                	mov    %ebp,%esp
 8048e11:	5d                   	pop    %ebp
 8048e12:	c3                   	ret    
 8048e13:	90                   	nop    

08048e14 <word_freq>:
 8048e14:	55                   	push   %ebp
 8048e15:	89 e5                	mov    %esp,%ebp
 8048e17:	83 ec 0c             	sub    $0xc,%esp
 8048e1a:	57                   	push   %edi
 8048e1b:	56                   	push   %esi
 8048e1c:	53                   	push   %ebx
 8048e1d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e20:	8b 75 0c             	mov    0xc(%ebp),%esi
 8048e23:	8b 5d 10             	mov    0x10(%ebp),%ebx
 8048e26:	8b 7d 20             	mov    0x20(%ebp),%edi
 8048e29:	83 c4 f4             	add    $0xfffffff4,%esp
 8048e2c:	50                   	push   %eax
 8048e2d:	e8 4e ff ff ff       	call   8048d80 <init_token>
 8048e32:	83 c4 f4             	add    $0xfffffff4,%esp
 8048e35:	53                   	push   %ebx
 8048e36:	e8 e1 fa ff ff       	call   804891c <new_table>
 8048e3b:	83 c4 20             	add    $0x20,%esp
 8048e3e:	eb 12                	jmp    8048e52 <word_freq+0x3e>
 8048e40:	57                   	push   %edi
 8048e41:	8b 55 1c             	mov    0x1c(%ebp),%edx
 8048e44:	52                   	push   %edx
 8048e45:	8b 55 18             	mov    0x18(%ebp),%edx
 8048e48:	52                   	push   %edx
 8048e49:	50                   	push   %eax
 8048e4a:	e8 e5 fe ff ff       	call   8048d34 <insert_string>
 8048e4f:	83 c4 10             	add    $0x10,%esp
 8048e52:	e8 45 ff ff ff       	call   8048d9c <get_token>
 8048e57:	85 c0                	test   %eax,%eax
 8048e59:	75 e5                	jne    8048e40 <word_freq+0x2c>
 8048e5b:	85 f6                	test   %esi,%esi
 8048e5d:	7e 44                	jle    8048ea3 <word_freq+0x8f>
 8048e5f:	8b 45 14             	mov    0x14(%ebp),%eax
 8048e62:	83 c4 f4             	add    $0xfffffff4,%esp
 8048e65:	50                   	push   %eax
 8048e66:	e8 e9 fd ff ff       	call   8048c54 <sort_words>
 8048e6b:	89 c3                	mov    %eax,%ebx
 8048e6d:	83 c4 10             	add    $0x10,%esp
 8048e70:	85 db                	test   %ebx,%ebx
 8048e72:	74 2f                	je     8048ea3 <word_freq+0x8f>
 8048e74:	83 ee 01             	sub    $0x1,%esi
 8048e77:	72 2a                	jb     8048ea3 <word_freq+0x8f>
 8048e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 8048e80:	8b 03                	mov    (%ebx),%eax
 8048e82:	83 c4 fc             	add    $0xfffffffc,%esp
 8048e85:	50                   	push   %eax
 8048e86:	8b 43 04             	mov    0x4(%ebx),%eax
 8048e89:	50                   	push   %eax
 8048e8a:	68 ad 99 04 08       	push   $0x80499ad
 8048e8f:	e8 e8 f7 ff ff       	call   804867c <_init+0xe0>
 8048e94:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8048e97:	83 c4 10             	add    $0x10,%esp
 8048e9a:	85 db                	test   %ebx,%ebx
 8048e9c:	74 05                	je     8048ea3 <word_freq+0x8f>
 8048e9e:	83 ee 01             	sub    $0x1,%esi
 8048ea1:	73 dd                	jae    8048e80 <word_freq+0x6c>
 8048ea3:	a1 bc ac 04 08       	mov    0x804acbc,%eax
 8048ea8:	83 c4 f4             	add    $0xfffffff4,%esp
 8048eab:	50                   	push   %eax
 8048eac:	a1 b8 ac 04 08       	mov    0x804acb8,%eax
 8048eb1:	50                   	push   %eax
 8048eb2:	a1 b4 ac 04 08       	mov    0x804acb4,%eax
 8048eb7:	50                   	push   %eax
 8048eb8:	a1 b0 ac 04 08       	mov    0x804acb0,%eax
 8048ebd:	50                   	push   %eax
 8048ebe:	68 c0 99 04 08       	push   $0x80499c0
 8048ec3:	e8 b4 f7 ff ff       	call   804867c <_init+0xe0>
 8048ec8:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 8048ecb:	5b                   	pop    %ebx
 8048ecc:	5e                   	pop    %esi
 8048ecd:	5f                   	pop    %edi
 8048ece:	89 ec                	mov    %ebp,%esp
 8048ed0:	5d                   	pop    %ebp
 8048ed1:	c3                   	ret    
 8048ed2:	89 f6                	mov    %esi,%esi

08048ed4 <main>:
 8048ed4:	55                   	push   %ebp
 8048ed5:	89 e5                	mov    %esp,%ebp
 8048ed7:	83 ec 2c             	sub    $0x2c,%esp
 8048eda:	57                   	push   %edi
 8048edb:	56                   	push   %esi
 8048edc:	53                   	push   %ebx
 8048edd:	8b 75 08             	mov    0x8(%ebp),%esi
 8048ee0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048ee3:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 8048eea:	c7 45 f4 00 04 00 00 	movl   $0x400,0xfffffff4(%ebp)
 8048ef1:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
 8048ef8:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
 8048eff:	c7 45 e8 00 00 00 00 	movl   $0x0,0xffffffe8(%ebp)
 8048f06:	c7 45 e4 00 00 00 00 	movl   $0x0,0xffffffe4(%ebp)
 8048f0d:	c7 45 e0 00 00 00 00 	movl   $0x0,0xffffffe0(%ebp)
 8048f14:	8b 3d 28 ae 04 08    	mov    0x804ae28,%edi
 8048f1a:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f1d:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
 8048f20:	50                   	push   %eax
 8048f21:	68 ef 99 04 08       	push   $0x80499ef
 8048f26:	e8 05 04 00 00       	call   8049330 <add_int_option>
 8048f2b:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f2e:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 8048f31:	50                   	push   %eax
 8048f32:	68 f7 99 04 08       	push   $0x80499f7
 8048f37:	e8 f4 03 00 00       	call   8049330 <add_int_option>
 8048f3c:	83 c4 20             	add    $0x20,%esp
 8048f3f:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f42:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
 8048f45:	50                   	push   %eax
 8048f46:	68 fc 99 04 08       	push   $0x80499fc
 8048f4b:	e8 e0 03 00 00       	call   8049330 <add_int_option>
 8048f50:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f53:	8d 45 ec             	lea    0xffffffec(%ebp),%eax
 8048f56:	50                   	push   %eax
 8048f57:	68 01 9a 04 08       	push   $0x8049a01
 8048f5c:	e8 cf 03 00 00       	call   8049330 <add_int_option>
 8048f61:	83 c4 20             	add    $0x20,%esp
 8048f64:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f67:	8d 45 e8             	lea    0xffffffe8(%ebp),%eax
 8048f6a:	50                   	push   %eax
 8048f6b:	68 07 9a 04 08       	push   $0x8049a07
 8048f70:	e8 bb 03 00 00       	call   8049330 <add_int_option>
 8048f75:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f78:	8d 45 e4             	lea    0xffffffe4(%ebp),%eax
 8048f7b:	50                   	push   %eax
 8048f7c:	68 0c 9a 04 08       	push   $0x8049a0c
 8048f81:	e8 aa 03 00 00       	call   8049330 <add_int_option>
 8048f86:	83 c4 20             	add    $0x20,%esp
 8048f89:	83 c4 f8             	add    $0xfffffff8,%esp
 8048f8c:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
 8048f8f:	50                   	push   %eax
 8048f90:	68 16 9a 04 08       	push   $0x8049a16
 8048f95:	e8 06 04 00 00       	call   80493a0 <add_string_option>
 8048f9a:	83 c4 fc             	add    $0xfffffffc,%esp
 8048f9d:	6a 00                	push   $0x0
 8048f9f:	53                   	push   %ebx
 8048fa0:	56                   	push   %esi
 8048fa1:	e8 32 04 00 00       	call   80493d8 <parse_options>
 8048fa6:	a1 20 ae 04 08       	mov    0x804ae20,%eax
 8048fab:	83 c4 20             	add    $0x20,%esp
 8048fae:	83 c4 f4             	add    $0xfffffff4,%esp
 8048fb1:	50                   	push   %eax
 8048fb2:	e8 c5 07 00 00       	call   804977c <show_options>
 8048fb7:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 8048fba:	c1 e0 02             	shl    $0x2,%eax
 8048fbd:	8b 80 c8 ac 04 08    	mov    0x804acc8(%eax),%eax
 8048fc3:	83 c4 f8             	add    $0xfffffff8,%esp
 8048fc6:	50                   	push   %eax
 8048fc7:	68 1b 9a 04 08       	push   $0x8049a1b
 8048fcc:	e8 ab f6 ff ff       	call   804867c <_init+0xe0>
 8048fd1:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 8048fd4:	c1 e0 02             	shl    $0x2,%eax
 8048fd7:	8b 80 dc ac 04 08    	mov    0x804acdc(%eax),%eax
 8048fdd:	83 c4 20             	add    $0x20,%esp
 8048fe0:	83 c4 f8             	add    $0xfffffff8,%esp
 8048fe3:	50                   	push   %eax
 8048fe4:	68 33 9a 04 08       	push   $0x8049a33
 8048fe9:	e8 8e f6 ff ff       	call   804867c <_init+0xe0>
 8048fee:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
 8048ff1:	c1 e0 02             	shl    $0x2,%eax
 8048ff4:	8b 80 f4 ac 04 08    	mov    0x804acf4(%eax),%eax
 8048ffa:	83 c4 f8             	add    $0xfffffff8,%esp
 8048ffd:	50                   	push   %eax
 8048ffe:	68 45 9a 04 08       	push   $0x8049a45
 8049003:	e8 74 f6 ff ff       	call   804867c <_init+0xe0>
 8049008:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 804900b:	83 c4 20             	add    $0x20,%esp
 804900e:	83 f8 02             	cmp    $0x2,%eax
 8049011:	76 1e                	jbe    8049031 <main+0x15d>
 8049013:	83 c4 fc             	add    $0xfffffffc,%esp
 8049016:	50                   	push   %eax
 8049017:	68 60 9a 04 08       	push   $0x8049a60
 804901c:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049021:	50                   	push   %eax
 8049022:	e8 d5 f5 ff ff       	call   80485fc <_init+0x60>
 8049027:	83 c4 f4             	add    $0xfffffff4,%esp
 804902a:	6a 01                	push   $0x1
 804902c:	e8 6b f6 ff ff       	call   804869c <_init+0x100>
 8049031:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 8049034:	83 f8 01             	cmp    $0x1,%eax
 8049037:	76 1e                	jbe    8049057 <main+0x183>
 8049039:	83 c4 fc             	add    $0xfffffffc,%esp
 804903c:	50                   	push   %eax
 804903d:	68 80 9a 04 08       	push   $0x8049a80
 8049042:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049047:	50                   	push   %eax
 8049048:	e8 af f5 ff ff       	call   80485fc <_init+0x60>
 804904d:	83 c4 f4             	add    $0xfffffff4,%esp
 8049050:	6a 01                	push   $0x1
 8049052:	e8 45 f6 ff ff       	call   804869c <_init+0x100>
 8049057:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
 804905a:	83 f8 02             	cmp    $0x2,%eax
 804905d:	76 21                	jbe    8049080 <main+0x1ac>
 804905f:	83 c4 fc             	add    $0xfffffffc,%esp
 8049062:	50                   	push   %eax
 8049063:	68 c0 9a 04 08       	push   $0x8049ac0
 8049068:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 804906d:	50                   	push   %eax
 804906e:	e8 89 f5 ff ff       	call   80485fc <_init+0x60>
 8049073:	83 c4 f4             	add    $0xfffffff4,%esp
 8049076:	6a 01                	push   $0x1
 8049078:	e8 1f f6 ff ff       	call   804869c <_init+0x100>
 804907d:	8d 76 00             	lea    0x0(%esi),%esi
 8049080:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
 8049083:	85 c0                	test   %eax,%eax
 8049085:	74 39                	je     80490c0 <main+0x1ec>
 8049087:	83 c4 f8             	add    $0xfffffff8,%esp
 804908a:	68 e0 9a 04 08       	push   $0x8049ae0
 804908f:	50                   	push   %eax
 8049090:	e8 47 f6 ff ff       	call   80486dc <_init+0x140>
 8049095:	89 c7                	mov    %eax,%edi
 8049097:	83 c4 10             	add    $0x10,%esp
 804909a:	85 ff                	test   %edi,%edi
 804909c:	75 22                	jne    80490c0 <main+0x1ec>
 804909e:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
 80490a1:	83 c4 fc             	add    $0xfffffffc,%esp
 80490a4:	50                   	push   %eax
 80490a5:	68 e2 9a 04 08       	push   $0x8049ae2
 80490aa:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80490af:	50                   	push   %eax
 80490b0:	e8 47 f5 ff ff       	call   80485fc <_init+0x60>
 80490b5:	83 c4 f4             	add    $0xfffffff4,%esp
 80490b8:	6a 01                	push   $0x1
 80490ba:	e8 dd f5 ff ff       	call   804869c <_init+0x100>
 80490bf:	90                   	nop    
 80490c0:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
 80490c3:	c1 e0 02             	shl    $0x2,%eax
 80490c6:	8b 80 e8 ac 04 08    	mov    0x804ace8(%eax),%eax
 80490cc:	83 c4 fc             	add    $0xfffffffc,%esp
 80490cf:	50                   	push   %eax
 80490d0:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
 80490d3:	c1 e0 02             	shl    $0x2,%eax
 80490d6:	8b 80 c0 ac 04 08    	mov    0x804acc0(%eax),%eax
 80490dc:	50                   	push   %eax
 80490dd:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
 80490e0:	c1 e0 02             	shl    $0x2,%eax
 80490e3:	8b 80 d0 ac 04 08    	mov    0x804acd0(%eax),%eax
 80490e9:	50                   	push   %eax
 80490ea:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 80490ed:	50                   	push   %eax
 80490ee:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
 80490f1:	50                   	push   %eax
 80490f2:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 80490f5:	50                   	push   %eax
 80490f6:	57                   	push   %edi
 80490f7:	e8 18 fd ff ff       	call   8048e14 <word_freq>
 80490fc:	83 c4 20             	add    $0x20,%esp
 80490ff:	83 c4 fc             	add    $0xfffffffc,%esp
 8049102:	e8 05 f5 ff ff       	call   804860c <_init+0x70>
 8049107:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
 804910a:	db 45 fc             	fildl  0xfffffffc(%ebp)
 804910d:	dc 35 18 9b 04 08    	fdivl  0x8049b18
 8049113:	83 ec 08             	sub    $0x8,%esp
 8049116:	dd 1c 24             	fstpl  (%esp,1)
 8049119:	68 fb 9a 04 08       	push   $0x8049afb
 804911e:	e8 59 f5 ff ff       	call   804867c <_init+0xe0>
 8049123:	83 c4 f4             	add    $0xfffffff4,%esp
 8049126:	57                   	push   %edi
 8049127:	e8 60 f5 ff ff       	call   804868c <_init+0xf0>
 804912c:	31 c0                	xor    %eax,%eax
 804912e:	8d 65 c8             	lea    0xffffffc8(%ebp),%esp
 8049131:	5b                   	pop    %ebx
 8049132:	5e                   	pop    %esi
 8049133:	5f                   	pop    %edi
 8049134:	89 ec                	mov    %ebp,%esp
 8049136:	5d                   	pop    %ebp
 8049137:	c3                   	ret    
 8049138:	90                   	nop    
 8049139:	90                   	nop    
 804913a:	90                   	nop    
 804913b:	90                   	nop    
 804913c:	90                   	nop    
 804913d:	90                   	nop    
 804913e:	90                   	nop    
 804913f:	90                   	nop    

08049140 <match_length>:
 8049140:	55                   	push   %ebp
 8049141:	89 e5                	mov    %esp,%ebp
 8049143:	53                   	push   %ebx
 8049144:	8b 45 08             	mov    0x8(%ebp),%eax
 8049147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804914a:	31 db                	xor    %ebx,%ebx
 804914c:	8a 10                	mov    (%eax),%dl
 804914e:	3a 11                	cmp    (%ecx),%dl
 8049150:	75 1b                	jne    804916d <match_length+0x2d>
 8049152:	bb 01 00 00 00       	mov    $0x1,%ebx
 8049157:	84 d2                	test   %dl,%dl
 8049159:	74 12                	je     804916d <match_length+0x2d>
 804915b:	90                   	nop    
 804915c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049160:	40                   	inc    %eax
 8049161:	41                   	inc    %ecx
 8049162:	8a 10                	mov    (%eax),%dl
 8049164:	3a 11                	cmp    (%ecx),%dl
 8049166:	75 05                	jne    804916d <match_length+0x2d>
 8049168:	43                   	inc    %ebx
 8049169:	84 d2                	test   %dl,%dl
 804916b:	75 f3                	jne    8049160 <match_length+0x20>
 804916d:	89 d8                	mov    %ebx,%eax
 804916f:	5b                   	pop    %ebx
 8049170:	89 ec                	mov    %ebp,%esp
 8049172:	5d                   	pop    %ebp
 8049173:	c3                   	ret    

08049174 <usage>:
 8049174:	55                   	push   %ebp
 8049175:	89 e5                	mov    %esp,%ebp
 8049177:	83 ec 0c             	sub    $0xc,%esp
 804917a:	57                   	push   %edi
 804917b:	56                   	push   %esi
 804917c:	53                   	push   %ebx
 804917d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049180:	83 c4 fc             	add    $0xfffffffc,%esp
 8049183:	50                   	push   %eax
 8049184:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049189:	68 20 9b 04 08       	push   $0x8049b20
 804918e:	50                   	push   %eax
 804918f:	e8 68 f4 ff ff       	call   80485fc <_init+0x60>
 8049194:	31 f6                	xor    %esi,%esi
 8049196:	83 c4 10             	add    $0x10,%esp
 8049199:	bf 60 ae 04 08       	mov    $0x804ae60,%edi
 804919e:	3b 35 08 ad 04 08    	cmp    0x804ad08,%esi
 80491a4:	0f 8d 96 00 00 00    	jge    8049240 <usage+0xcc>
 80491aa:	31 db                	xor    %ebx,%ebx
 80491ac:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 80491b0:	8b 83 64 ae 04 08    	mov    0x804ae64(%ebx),%eax
 80491b6:	83 f8 01             	cmp    $0x1,%eax
 80491b9:	74 25                	je     80491e0 <usage+0x6c>
 80491bb:	72 07                	jb     80491c4 <usage+0x50>
 80491bd:	83 f8 02             	cmp    $0x2,%eax
 80491c0:	74 4e                	je     8049210 <usage+0x9c>
 80491c2:	eb 6c                	jmp    8049230 <usage+0xbc>
 80491c4:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 80491ca:	8b 00                	mov    (%eax),%eax
 80491cc:	50                   	push   %eax
 80491cd:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
 80491d0:	50                   	push   %eax
 80491d1:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80491d6:	68 2a 9b 04 08       	push   $0x8049b2a
 80491db:	eb 4a                	jmp    8049227 <usage+0xb3>
 80491dd:	8d 76 00             	lea    0x0(%esi),%esi
 80491e0:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 80491e6:	83 c4 f4             	add    $0xfffffff4,%esp
 80491e9:	83 ec 08             	sub    $0x8,%esp
 80491ec:	dd 00                	fldl   (%eax)
 80491ee:	dd 1c 24             	fstpl  (%esp,1)
 80491f1:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
 80491f4:	50                   	push   %eax
 80491f5:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80491fa:	68 36 9b 04 08       	push   $0x8049b36
 80491ff:	50                   	push   %eax
 8049200:	e8 f7 f3 ff ff       	call   80485fc <_init+0x60>
 8049205:	83 c4 20             	add    $0x20,%esp
 8049208:	eb 26                	jmp    8049230 <usage+0xbc>
 804920a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049210:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 8049216:	8b 00                	mov    (%eax),%eax
 8049218:	50                   	push   %eax
 8049219:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
 804921c:	50                   	push   %eax
 804921d:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049222:	68 44 9b 04 08       	push   $0x8049b44
 8049227:	50                   	push   %eax
 8049228:	e8 cf f3 ff ff       	call   80485fc <_init+0x60>
 804922d:	83 c4 10             	add    $0x10,%esp
 8049230:	83 c3 0c             	add    $0xc,%ebx
 8049233:	46                   	inc    %esi
 8049234:	3b 35 08 ad 04 08    	cmp    0x804ad08,%esi
 804923a:	0f 8c 70 ff ff ff    	jl     80491b0 <usage+0x3c>
 8049240:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049245:	83 c4 f8             	add    $0xfffffff8,%esp
 8049248:	68 50 9b 04 08       	push   $0x8049b50
 804924d:	50                   	push   %eax
 804924e:	e8 a9 f3 ff ff       	call   80485fc <_init+0x60>
 8049253:	83 c4 f4             	add    $0xfffffff4,%esp
 8049256:	6a 01                	push   $0x1
 8049258:	e8 3f f4 ff ff       	call   804869c <_init+0x100>
 804925d:	8d 76 00             	lea    0x0(%esi),%esi

08049260 <find_option>:
 8049260:	55                   	push   %ebp
 8049261:	89 e5                	mov    %esp,%ebp
 8049263:	83 ec 1c             	sub    $0x1c,%esp
 8049266:	57                   	push   %edi
 8049267:	56                   	push   %esi
 8049268:	53                   	push   %ebx
 8049269:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 8049270:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
 8049273:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,0xfffffffc(%ebp)
 804927a:	31 f6                	xor    %esi,%esi
 804927c:	31 db                	xor    %ebx,%ebx
 804927e:	3b 05 08 ad 04 08    	cmp    0x804ad08,%eax
 8049284:	7d 49                	jge    80492cf <find_option+0x6f>
 8049286:	bf 60 ae 04 08       	mov    $0x804ae60,%edi
 804928b:	90                   	nop    
 804928c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049290:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049293:	83 c4 f8             	add    $0xfffffff8,%esp
 8049296:	50                   	push   %eax
 8049297:	8b 07                	mov    (%edi),%eax
 8049299:	50                   	push   %eax
 804929a:	e8 a1 fe ff ff       	call   8049140 <match_length>
 804929f:	83 c4 10             	add    $0x10,%esp
 80492a2:	39 f0                	cmp    %esi,%eax
 80492a4:	7e 0e                	jle    80492b4 <find_option+0x54>
 80492a6:	89 5d fc             	mov    %ebx,0xfffffffc(%ebp)
 80492a9:	89 c6                	mov    %eax,%esi
 80492ab:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
 80492b2:	eb 0f                	jmp    80492c3 <find_option+0x63>
 80492b4:	85 c0                	test   %eax,%eax
 80492b6:	7e 0b                	jle    80492c3 <find_option+0x63>
 80492b8:	39 f0                	cmp    %esi,%eax
 80492ba:	75 07                	jne    80492c3 <find_option+0x63>
 80492bc:	c7 45 f8 01 00 00 00 	movl   $0x1,0xfffffff8(%ebp)
 80492c3:	83 c7 0c             	add    $0xc,%edi
 80492c6:	43                   	inc    %ebx
 80492c7:	3b 1d 08 ad 04 08    	cmp    0x804ad08,%ebx
 80492cd:	7c c1                	jl     8049290 <find_option+0x30>
 80492cf:	85 f6                	test   %esi,%esi
 80492d1:	75 25                	jne    80492f8 <find_option+0x98>
 80492d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492d6:	83 c4 fc             	add    $0xfffffffc,%esp
 80492d9:	50                   	push   %eax
 80492da:	68 60 9b 04 08       	push   $0x8049b60
 80492df:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80492e4:	50                   	push   %eax
 80492e5:	e8 12 f3 ff ff       	call   80485fc <_init+0x60>
 80492ea:	8b 45 08             	mov    0x8(%ebp),%eax
 80492ed:	83 c4 f4             	add    $0xfffffff4,%esp
 80492f0:	50                   	push   %eax
 80492f1:	e8 7e fe ff ff       	call   8049174 <usage>
 80492f6:	eb 29                	jmp    8049321 <find_option+0xc1>
 80492f8:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
 80492fc:	74 23                	je     8049321 <find_option+0xc1>
 80492fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049301:	83 c4 fc             	add    $0xfffffffc,%esp
 8049304:	50                   	push   %eax
 8049305:	68 7f 9b 04 08       	push   $0x8049b7f
 804930a:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 804930f:	50                   	push   %eax
 8049310:	e8 e7 f2 ff ff       	call   80485fc <_init+0x60>
 8049315:	8b 45 08             	mov    0x8(%ebp),%eax
 8049318:	83 c4 f4             	add    $0xfffffff4,%esp
 804931b:	50                   	push   %eax
 804931c:	e8 53 fe ff ff       	call   8049174 <usage>
 8049321:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 8049324:	8d 65 d8             	lea    0xffffffd8(%ebp),%esp
 8049327:	5b                   	pop    %ebx
 8049328:	5e                   	pop    %esi
 8049329:	5f                   	pop    %edi
 804932a:	89 ec                	mov    %ebp,%esp
 804932c:	5d                   	pop    %ebp
 804932d:	c3                   	ret    
 804932e:	89 f6                	mov    %esi,%esi

08049330 <add_int_option>:
 8049330:	55                   	push   %ebp
 8049331:	89 e5                	mov    %esp,%ebp
 8049333:	53                   	push   %ebx
 8049334:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049337:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804933a:	8b 15 08 ad 04 08    	mov    0x804ad08,%edx
 8049340:	8d 04 52             	lea    (%edx,%edx,2),%eax
 8049343:	c1 e0 02             	shl    $0x2,%eax
 8049346:	89 88 60 ae 04 08    	mov    %ecx,0x804ae60(%eax)
 804934c:	c7 80 64 ae 04 08 00 	movl   $0x0,0x804ae64(%eax)
 8049353:	00 00 00 
 8049356:	89 98 68 ae 04 08    	mov    %ebx,0x804ae68(%eax)
 804935c:	42                   	inc    %edx
 804935d:	89 15 08 ad 04 08    	mov    %edx,0x804ad08
 8049363:	5b                   	pop    %ebx
 8049364:	89 ec                	mov    %ebp,%esp
 8049366:	5d                   	pop    %ebp
 8049367:	c3                   	ret    

08049368 <add_double_option>:
 8049368:	55                   	push   %ebp
 8049369:	89 e5                	mov    %esp,%ebp
 804936b:	53                   	push   %ebx
 804936c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804936f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049372:	8b 15 08 ad 04 08    	mov    0x804ad08,%edx
 8049378:	8d 04 52             	lea    (%edx,%edx,2),%eax
 804937b:	c1 e0 02             	shl    $0x2,%eax
 804937e:	89 88 60 ae 04 08    	mov    %ecx,0x804ae60(%eax)
 8049384:	c7 80 64 ae 04 08 01 	movl   $0x1,0x804ae64(%eax)
 804938b:	00 00 00 
 804938e:	89 98 68 ae 04 08    	mov    %ebx,0x804ae68(%eax)
 8049394:	42                   	inc    %edx
 8049395:	89 15 08 ad 04 08    	mov    %edx,0x804ad08
 804939b:	5b                   	pop    %ebx
 804939c:	89 ec                	mov    %ebp,%esp
 804939e:	5d                   	pop    %ebp
 804939f:	c3                   	ret    

080493a0 <add_string_option>:
 80493a0:	55                   	push   %ebp
 80493a1:	89 e5                	mov    %esp,%ebp
 80493a3:	53                   	push   %ebx
 80493a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80493a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 80493aa:	8b 15 08 ad 04 08    	mov    0x804ad08,%edx
 80493b0:	8d 04 52             	lea    (%edx,%edx,2),%eax
 80493b3:	c1 e0 02             	shl    $0x2,%eax
 80493b6:	89 88 60 ae 04 08    	mov    %ecx,0x804ae60(%eax)
 80493bc:	c7 80 64 ae 04 08 02 	movl   $0x2,0x804ae64(%eax)
 80493c3:	00 00 00 
 80493c6:	89 98 68 ae 04 08    	mov    %ebx,0x804ae68(%eax)
 80493cc:	42                   	inc    %edx
 80493cd:	89 15 08 ad 04 08    	mov    %edx,0x804ad08
 80493d3:	5b                   	pop    %ebx
 80493d4:	89 ec                	mov    %ebp,%esp
 80493d6:	5d                   	pop    %ebp
 80493d7:	c3                   	ret    

080493d8 <parse_options>:
 80493d8:	55                   	push   %ebp
 80493d9:	89 e5                	mov    %esp,%ebp
 80493db:	83 ec 2c             	sub    $0x2c,%esp
 80493de:	57                   	push   %edi
 80493df:	56                   	push   %esi
 80493e0:	53                   	push   %ebx
 80493e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80493e4:	c7 45 e8 00 00 00 00 	movl   $0x0,0xffffffe8(%ebp)
 80493eb:	bf 01 00 00 00       	mov    $0x1,%edi
 80493f0:	8b 00                	mov    (%eax),%eax
 80493f2:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
 80493f5:	3b 7d 08             	cmp    0x8(%ebp),%edi
 80493f8:	0f 8d 84 01 00 00    	jge    8049582 <parse_options+0x1aa>
 80493fe:	89 f6                	mov    %esi,%esi
 8049400:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049403:	8b 04 ba             	mov    (%edx,%edi,4),%eax
 8049406:	80 38 2d             	cmpb   $0x2d,(%eax)
 8049409:	74 17                	je     8049422 <parse_options+0x4a>
 804940b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804940f:	74 09                	je     804941a <parse_options+0x42>
 8049411:	8b 4d e8             	mov    0xffffffe8(%ebp),%ecx
 8049414:	8b 55 10             	mov    0x10(%ebp),%edx
 8049417:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
 804941a:	ff 45 e8             	incl   0xffffffe8(%ebp)
 804941d:	e9 56 01 00 00       	jmp    8049578 <parse_options+0x1a0>
 8049422:	83 c4 f8             	add    $0xfffffff8,%esp
 8049425:	40                   	inc    %eax
 8049426:	50                   	push   %eax
 8049427:	8b 4d e4             	mov    0xffffffe4(%ebp),%ecx
 804942a:	51                   	push   %ecx
 804942b:	e8 30 fe ff ff       	call   8049260 <find_option>
 8049430:	89 c3                	mov    %eax,%ebx
 8049432:	47                   	inc    %edi
 8049433:	83 c4 10             	add    $0x10,%esp
 8049436:	3b 7d 08             	cmp    0x8(%ebp),%edi
 8049439:	7c 2d                	jl     8049468 <parse_options+0x90>
 804943b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 804943e:	8b 04 85 60 ae 04 08 	mov    0x804ae60(,%eax,4),%eax
 8049445:	83 c4 fc             	add    $0xfffffffc,%esp
 8049448:	50                   	push   %eax
 8049449:	68 97 9b 04 08       	push   $0x8049b97
 804944e:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049453:	50                   	push   %eax
 8049454:	e8 a3 f1 ff ff       	call   80485fc <_init+0x60>
 8049459:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 804945c:	83 c4 f4             	add    $0xfffffff4,%esp
 804945f:	50                   	push   %eax
 8049460:	e8 0f fd ff ff       	call   8049174 <usage>
 8049465:	83 c4 20             	add    $0x20,%esp
 8049468:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 804946b:	8d 34 85 00 00 00 00 	lea    0x0(,%eax,4),%esi
 8049472:	8b 86 64 ae 04 08    	mov    0x804ae64(%esi),%eax
 8049478:	83 f8 01             	cmp    $0x1,%eax
 804947b:	74 68                	je     80494e5 <parse_options+0x10d>
 804947d:	72 11                	jb     8049490 <parse_options+0xb8>
 804947f:	83 f8 02             	cmp    $0x2,%eax
 8049482:	0f 84 b8 00 00 00    	je     8049540 <parse_options+0x168>
 8049488:	e9 c3 00 00 00       	jmp    8049550 <parse_options+0x178>
 804948d:	8d 76 00             	lea    0x0(%esi),%esi
 8049490:	8b 86 68 ae 04 08    	mov    0x804ae68(%esi),%eax
 8049496:	83 c4 fc             	add    $0xfffffffc,%esp
 8049499:	50                   	push   %eax
 804949a:	68 b4 9b 04 08       	push   $0x8049bb4
 804949f:	8b 55 0c             	mov    0xc(%ebp),%edx
 80494a2:	8b 04 ba             	mov    (%edx,%edi,4),%eax
 80494a5:	50                   	push   %eax
 80494a6:	e8 11 f2 ff ff       	call   80486bc <_init+0x120>
 80494ab:	83 c4 10             	add    $0x10,%esp
 80494ae:	83 f8 01             	cmp    $0x1,%eax
 80494b1:	0f 84 c1 00 00 00    	je     8049578 <parse_options+0x1a0>
 80494b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 80494ba:	83 c4 fc             	add    $0xfffffffc,%esp
 80494bd:	8b 04 b9             	mov    (%ecx,%edi,4),%eax
 80494c0:	50                   	push   %eax
 80494c1:	68 c0 9b 04 08       	push   $0x8049bc0
 80494c6:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80494cb:	50                   	push   %eax
 80494cc:	e8 2b f1 ff ff       	call   80485fc <_init+0x60>
 80494d1:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 80494d4:	83 c4 f4             	add    $0xfffffff4,%esp
 80494d7:	50                   	push   %eax
 80494d8:	e8 97 fc ff ff       	call   8049174 <usage>
 80494dd:	83 c4 20             	add    $0x20,%esp
 80494e0:	e9 93 00 00 00       	jmp    8049578 <parse_options+0x1a0>
 80494e5:	83 c4 fc             	add    $0xfffffffc,%esp
 80494e8:	8d 45 ec             	lea    0xffffffec(%ebp),%eax
 80494eb:	50                   	push   %eax
 80494ec:	68 e6 9b 04 08       	push   $0x8049be6
 80494f1:	8b 55 0c             	mov    0xc(%ebp),%edx
 80494f4:	8b 04 ba             	mov    (%edx,%edi,4),%eax
 80494f7:	50                   	push   %eax
 80494f8:	e8 bf f1 ff ff       	call   80486bc <_init+0x120>
 80494fd:	83 c4 10             	add    $0x10,%esp
 8049500:	83 f8 01             	cmp    $0x1,%eax
 8049503:	74 29                	je     804952e <parse_options+0x156>
 8049505:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8049508:	83 c4 fc             	add    $0xfffffffc,%esp
 804950b:	8b 04 b9             	mov    (%ecx,%edi,4),%eax
 804950e:	50                   	push   %eax
 804950f:	68 00 9c 04 08       	push   $0x8049c00
 8049514:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049519:	50                   	push   %eax
 804951a:	e8 dd f0 ff ff       	call   80485fc <_init+0x60>
 804951f:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
 8049522:	83 c4 f4             	add    $0xfffffff4,%esp
 8049525:	50                   	push   %eax
 8049526:	e8 49 fc ff ff       	call   8049174 <usage>
 804952b:	83 c4 20             	add    $0x20,%esp
 804952e:	8b 86 68 ae 04 08    	mov    0x804ae68(%esi),%eax
 8049534:	d9 45 ec             	flds   0xffffffec(%ebp)
 8049537:	dd 18                	fstpl  (%eax)
 8049539:	eb 3d                	jmp    8049578 <parse_options+0x1a0>
 804953b:	90                   	nop    
 804953c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8049540:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8049543:	8b 96 68 ae 04 08    	mov    0x804ae68(%esi),%edx
 8049549:	8b 04 b9             	mov    (%ecx,%edi,4),%eax
 804954c:	89 02                	mov    %eax,(%edx)
 804954e:	eb 28                	jmp    8049578 <parse_options+0x1a0>
 8049550:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 8049553:	8b 04 85 64 ae 04 08 	mov    0x804ae64(,%eax,4),%eax
 804955a:	83 c4 fc             	add    $0xfffffffc,%esp
 804955d:	50                   	push   %eax
 804955e:	68 40 9c 04 08       	push   $0x8049c40
 8049563:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049568:	50                   	push   %eax
 8049569:	e8 8e f0 ff ff       	call   80485fc <_init+0x60>
 804956e:	83 c4 f4             	add    $0xfffffff4,%esp
 8049571:	6a 01                	push   $0x1
 8049573:	e8 24 f1 ff ff       	call   804869c <_init+0x100>
 8049578:	47                   	inc    %edi
 8049579:	3b 7d 08             	cmp    0x8(%ebp),%edi
 804957c:	0f 8c 7e fe ff ff    	jl     8049400 <parse_options+0x28>
 8049582:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
 8049585:	8d 65 c8             	lea    0xffffffc8(%ebp),%esp
 8049588:	5b                   	pop    %ebx
 8049589:	5e                   	pop    %esi
 804958a:	5f                   	pop    %edi
 804958b:	89 ec                	mov    %ebp,%esp
 804958d:	5d                   	pop    %ebp
 804958e:	c3                   	ret    
 804958f:	90                   	nop    

08049590 <strsave>:
 8049590:	55                   	push   %ebp
 8049591:	89 e5                	mov    %esp,%ebp
 8049593:	83 ec 10             	sub    $0x10,%esp
 8049596:	56                   	push   %esi
 8049597:	53                   	push   %ebx
 8049598:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804959b:	83 c4 f4             	add    $0xfffffff4,%esp
 804959e:	89 da                	mov    %ebx,%edx
 80495a0:	89 d8                	mov    %ebx,%eax
 80495a2:	83 e2 03             	and    $0x3,%edx
 80495a5:	74 16                	je     80495bd <strsave+0x2d>
 80495a7:	7a 0f                	jp     80495b8 <strsave+0x28>
 80495a9:	83 fa 02             	cmp    $0x2,%edx
 80495ac:	74 05                	je     80495b3 <strsave+0x23>
 80495ae:	38 30                	cmp    %dh,(%eax)
 80495b0:	74 2d                	je     80495df <strsave+0x4f>
 80495b2:	40                   	inc    %eax
 80495b3:	38 30                	cmp    %dh,(%eax)
 80495b5:	74 28                	je     80495df <strsave+0x4f>
 80495b7:	40                   	inc    %eax
 80495b8:	38 30                	cmp    %dh,(%eax)
 80495ba:	74 23                	je     80495df <strsave+0x4f>
 80495bc:	40                   	inc    %eax
 80495bd:	8b 10                	mov    (%eax),%edx
 80495bf:	84 d2                	test   %dl,%dl
 80495c1:	74 1c                	je     80495df <strsave+0x4f>
 80495c3:	84 f6                	test   %dh,%dh
 80495c5:	74 17                	je     80495de <strsave+0x4e>
 80495c7:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
 80495cd:	74 0e                	je     80495dd <strsave+0x4d>
 80495cf:	83 c0 04             	add    $0x4,%eax
 80495d2:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
 80495d8:	75 e3                	jne    80495bd <strsave+0x2d>
 80495da:	83 e8 03             	sub    $0x3,%eax
 80495dd:	40                   	inc    %eax
 80495de:	40                   	inc    %eax
 80495df:	29 d8                	sub    %ebx,%eax
 80495e1:	40                   	inc    %eax
 80495e2:	50                   	push   %eax
 80495e3:	e8 34 f0 ff ff       	call   804861c <_init+0x80>
 80495e8:	89 c6                	mov    %eax,%esi
 80495ea:	83 c4 f8             	add    $0xfffffff8,%esp
 80495ed:	53                   	push   %ebx
 80495ee:	56                   	push   %esi
 80495ef:	e8 08 f1 ff ff       	call   80486fc <_init+0x160>
 80495f4:	89 f0                	mov    %esi,%eax
 80495f6:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 80495f9:	5b                   	pop    %ebx
 80495fa:	5e                   	pop    %esi
 80495fb:	89 ec                	mov    %ebp,%esp
 80495fd:	5d                   	pop    %ebp
 80495fe:	c3                   	ret    
 80495ff:	90                   	nop    

08049600 <parse_option_file>:
 8049600:	55                   	push   %ebp
 8049601:	89 e5                	mov    %esp,%ebp
 8049603:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 8049609:	57                   	push   %edi
 804960a:	56                   	push   %esi
 804960b:	53                   	push   %ebx
 804960c:	8b 7d 08             	mov    0x8(%ebp),%edi
 804960f:	8d 75 98             	lea    0xffffff98(%ebp),%esi
 8049612:	8d 45 cc             	lea    0xffffffcc(%ebp),%eax
 8049615:	89 45 80             	mov    %eax,0xffffff80(%ebp)
 8049618:	e9 33 01 00 00       	jmp    8049750 <parse_option_file+0x150>
 804961d:	8d 76 00             	lea    0x0(%esi),%esi
 8049620:	80 7d cc 2d          	cmpb   $0x2d,0xffffffcc(%ebp)
 8049624:	74 23                	je     8049649 <parse_option_file+0x49>
 8049626:	8b 45 80             	mov    0xffffff80(%ebp),%eax
 8049629:	83 c4 fc             	add    $0xfffffffc,%esp
 804962c:	50                   	push   %eax
 804962d:	68 72 9c 04 08       	push   $0x8049c72
 8049632:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049637:	50                   	push   %eax
 8049638:	e8 bf ef ff ff       	call   80485fc <_init+0x60>
 804963d:	83 c4 f4             	add    $0xfffffff4,%esp
 8049640:	57                   	push   %edi
 8049641:	e8 2e fb ff ff       	call   8049174 <usage>
 8049646:	83 c4 20             	add    $0x20,%esp
 8049649:	83 c4 f8             	add    $0xfffffff8,%esp
 804964c:	8d 45 cd             	lea    0xffffffcd(%ebp),%eax
 804964f:	50                   	push   %eax
 8049650:	57                   	push   %edi
 8049651:	e8 0a fc ff ff       	call   8049260 <find_option>
 8049656:	89 c2                	mov    %eax,%edx
 8049658:	8d 04 52             	lea    (%edx,%edx,2),%eax
 804965b:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
 8049662:	8b 83 64 ae 04 08    	mov    0x804ae64(%ebx),%eax
 8049668:	83 c4 10             	add    $0x10,%esp
 804966b:	83 f8 01             	cmp    $0x1,%eax
 804966e:	74 56                	je     80496c6 <parse_option_file+0xc6>
 8049670:	72 0e                	jb     8049680 <parse_option_file+0x80>
 8049672:	83 f8 02             	cmp    $0x2,%eax
 8049675:	0f 84 95 00 00 00    	je     8049710 <parse_option_file+0x110>
 804967b:	e9 a8 00 00 00       	jmp    8049728 <parse_option_file+0x128>
 8049680:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 8049686:	83 c4 fc             	add    $0xfffffffc,%esp
 8049689:	50                   	push   %eax
 804968a:	68 b4 9b 04 08       	push   $0x8049bb4
 804968f:	56                   	push   %esi
 8049690:	e8 27 f0 ff ff       	call   80486bc <_init+0x120>
 8049695:	83 c4 10             	add    $0x10,%esp
 8049698:	83 f8 01             	cmp    $0x1,%eax
 804969b:	0f 84 af 00 00 00    	je     8049750 <parse_option_file+0x150>
 80496a1:	83 c4 fc             	add    $0xfffffffc,%esp
 80496a4:	56                   	push   %esi
 80496a5:	68 c0 9b 04 08       	push   $0x8049bc0
 80496aa:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80496af:	50                   	push   %eax
 80496b0:	e8 47 ef ff ff       	call   80485fc <_init+0x60>
 80496b5:	83 c4 f4             	add    $0xfffffff4,%esp
 80496b8:	57                   	push   %edi
 80496b9:	e8 b6 fa ff ff       	call   8049174 <usage>
 80496be:	83 c4 20             	add    $0x20,%esp
 80496c1:	e9 8a 00 00 00       	jmp    8049750 <parse_option_file+0x150>
 80496c6:	83 c4 fc             	add    $0xfffffffc,%esp
 80496c9:	8d 45 84             	lea    0xffffff84(%ebp),%eax
 80496cc:	50                   	push   %eax
 80496cd:	68 e6 9b 04 08       	push   $0x8049be6
 80496d2:	56                   	push   %esi
 80496d3:	e8 e4 ef ff ff       	call   80486bc <_init+0x120>
 80496d8:	83 c4 10             	add    $0x10,%esp
 80496db:	83 f8 01             	cmp    $0x1,%eax
 80496de:	74 20                	je     8049700 <parse_option_file+0x100>
 80496e0:	83 c4 fc             	add    $0xfffffffc,%esp
 80496e3:	56                   	push   %esi
 80496e4:	68 00 9c 04 08       	push   $0x8049c00
 80496e9:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 80496ee:	50                   	push   %eax
 80496ef:	e8 08 ef ff ff       	call   80485fc <_init+0x60>
 80496f4:	83 c4 f4             	add    $0xfffffff4,%esp
 80496f7:	57                   	push   %edi
 80496f8:	e8 77 fa ff ff       	call   8049174 <usage>
 80496fd:	83 c4 20             	add    $0x20,%esp
 8049700:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 8049706:	d9 45 84             	flds   0xffffff84(%ebp)
 8049709:	dd 18                	fstpl  (%eax)
 804970b:	eb 43                	jmp    8049750 <parse_option_file+0x150>
 804970d:	8d 76 00             	lea    0x0(%esi),%esi
 8049710:	83 c4 f4             	add    $0xfffffff4,%esp
 8049713:	56                   	push   %esi
 8049714:	e8 77 fe ff ff       	call   8049590 <strsave>
 8049719:	89 c2                	mov    %eax,%edx
 804971b:	8b 83 68 ae 04 08    	mov    0x804ae68(%ebx),%eax
 8049721:	89 10                	mov    %edx,(%eax)
 8049723:	83 c4 10             	add    $0x10,%esp
 8049726:	eb 28                	jmp    8049750 <parse_option_file+0x150>
 8049728:	8d 04 52             	lea    (%edx,%edx,2),%eax
 804972b:	8b 04 85 64 ae 04 08 	mov    0x804ae64(,%eax,4),%eax
 8049732:	83 c4 fc             	add    $0xfffffffc,%esp
 8049735:	50                   	push   %eax
 8049736:	68 40 9c 04 08       	push   $0x8049c40
 804973b:	a1 24 ae 04 08       	mov    0x804ae24,%eax
 8049740:	50                   	push   %eax
 8049741:	e8 b6 ee ff ff       	call   80485fc <_init+0x60>
 8049746:	83 c4 f4             	add    $0xfffffff4,%esp
 8049749:	6a 01                	push   $0x1
 804974b:	e8 4c ef ff ff       	call   804869c <_init+0x100>
 8049750:	56                   	push   %esi
 8049751:	8b 45 80             	mov    0xffffff80(%ebp),%eax
 8049754:	50                   	push   %eax
 8049755:	68 6c 9c 04 08       	push   $0x8049c6c
 804975a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804975d:	50                   	push   %eax
 804975e:	e8 c9 ee ff ff       	call   804862c <_init+0x90>
 8049763:	83 c4 10             	add    $0x10,%esp
 8049766:	83 f8 02             	cmp    $0x2,%eax
 8049769:	0f 84 b1 fe ff ff    	je     8049620 <parse_option_file+0x20>
 804976f:	8d a5 68 ff ff ff    	lea    0xffffff68(%ebp),%esp
 8049775:	5b                   	pop    %ebx
 8049776:	5e                   	pop    %esi
 8049777:	5f                   	pop    %edi
 8049778:	89 ec                	mov    %ebp,%esp
 804977a:	5d                   	pop    %ebp
 804977b:	c3                   	ret    

0804977c <show_options>:
 804977c:	55                   	push   %ebp
 804977d:	89 e5                	mov    %esp,%ebp
 804977f:	83 ec 0c             	sub    $0xc,%esp
 8049782:	57                   	push   %edi
 8049783:	56                   	push   %esi
 8049784:	53                   	push   %ebx
 8049785:	8b 7d 08             	mov    0x8(%ebp),%edi
 8049788:	31 f6                	xor    %esi,%esi
 804978a:	3b 35 08 ad 04 08    	cmp    0x804ad08,%esi
 8049790:	7d 75                	jge    8049807 <show_options+0x8b>
 8049792:	bb 60 ae 04 08       	mov    $0x804ae60,%ebx
 8049797:	8b 43 04             	mov    0x4(%ebx),%eax
 804979a:	83 f8 01             	cmp    $0x1,%eax
 804979d:	74 19                	je     80497b8 <show_options+0x3c>
 804979f:	72 07                	jb     80497a8 <show_options+0x2c>
 80497a1:	83 f8 02             	cmp    $0x2,%eax
 80497a4:	74 3a                	je     80497e0 <show_options+0x64>
 80497a6:	eb 53                	jmp    80497fb <show_options+0x7f>
 80497a8:	8b 43 08             	mov    0x8(%ebx),%eax
 80497ab:	8b 00                	mov    (%eax),%eax
 80497ad:	50                   	push   %eax
 80497ae:	8b 03                	mov    (%ebx),%eax
 80497b0:	50                   	push   %eax
 80497b1:	68 8f 9c 04 08       	push   $0x8049c8f
 80497b6:	eb 3a                	jmp    80497f2 <show_options+0x76>
 80497b8:	8b 43 08             	mov    0x8(%ebx),%eax
 80497bb:	83 c4 f4             	add    $0xfffffff4,%esp
 80497be:	83 ec 08             	sub    $0x8,%esp
 80497c1:	dd 00                	fldl   (%eax)
 80497c3:	dd 1c 24             	fstpl  (%esp,1)
 80497c6:	8b 03                	mov    (%ebx),%eax
 80497c8:	50                   	push   %eax
 80497c9:	68 96 9c 04 08       	push   $0x8049c96
 80497ce:	57                   	push   %edi
 80497cf:	e8 28 ee ff ff       	call   80485fc <_init+0x60>
 80497d4:	83 c4 20             	add    $0x20,%esp
 80497d7:	eb 22                	jmp    80497fb <show_options+0x7f>
 80497d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,1),%esi
 80497e0:	8b 43 08             	mov    0x8(%ebx),%eax
 80497e3:	8b 00                	mov    (%eax),%eax
 80497e5:	85 c0                	test   %eax,%eax
 80497e7:	74 12                	je     80497fb <show_options+0x7f>
 80497e9:	50                   	push   %eax
 80497ea:	8b 03                	mov    (%ebx),%eax
 80497ec:	50                   	push   %eax
 80497ed:	68 9d 9c 04 08       	push   $0x8049c9d
 80497f2:	57                   	push   %edi
 80497f3:	e8 04 ee ff ff       	call   80485fc <_init+0x60>
 80497f8:	83 c4 10             	add    $0x10,%esp
 80497fb:	83 c3 0c             	add    $0xc,%ebx
 80497fe:	46                   	inc    %esi
 80497ff:	3b 35 08 ad 04 08    	cmp    0x804ad08,%esi
 8049805:	7c 90                	jl     8049797 <show_options+0x1b>
 8049807:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 804980a:	5b                   	pop    %ebx
 804980b:	5e                   	pop    %esi
 804980c:	5f                   	pop    %edi
 804980d:	89 ec                	mov    %ebp,%esp
 804980f:	5d                   	pop    %ebp
 8049810:	c3                   	ret    
 8049811:	90                   	nop    
 8049812:	90                   	nop    
 8049813:	90                   	nop    
 8049814:	90                   	nop    
 8049815:	90                   	nop    
 8049816:	90                   	nop    
 8049817:	90                   	nop    
 8049818:	90                   	nop    
 8049819:	90                   	nop    
 804981a:	90                   	nop    
 804981b:	90                   	nop    
 804981c:	90                   	nop    
 804981d:	90                   	nop    
 804981e:	90                   	nop    
 804981f:	90                   	nop    

08049820 <__do_global_ctors_aux>:
 8049820:	55                   	push   %ebp
 8049821:	89 e5                	mov    %esp,%ebp
 8049823:	83 ec 14             	sub    $0x14,%esp
 8049826:	53                   	push   %ebx
 8049827:	bb 10 ad 04 08       	mov    $0x804ad10,%ebx
 804982c:	83 3d 10 ad 04 08 ff 	cmpl   $0xffffffff,0x804ad10
 8049833:	74 0c                	je     8049841 <__do_global_ctors_aux+0x21>
 8049835:	8b 03                	mov    (%ebx),%eax
 8049837:	ff d0                	call   *%eax
 8049839:	83 c3 fc             	add    $0xfffffffc,%ebx
 804983c:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 804983f:	75 f4                	jne    8049835 <__do_global_ctors_aux+0x15>
 8049841:	5b                   	pop    %ebx
 8049842:	89 ec                	mov    %ebp,%esp
 8049844:	5d                   	pop    %ebp
 8049845:	c3                   	ret    
 8049846:	89 f6                	mov    %esi,%esi

08049848 <init_dummy>:
 8049848:	55                   	push   %ebp
 8049849:	89 e5                	mov    %esp,%ebp
 804984b:	83 ec 08             	sub    $0x8,%esp
 804984e:	89 ec                	mov    %ebp,%esp
 8049850:	5d                   	pop    %ebp
 8049851:	c3                   	ret    
 8049852:	90                   	nop    
 8049853:	90                   	nop    
Disassembly of section .fini:

08049854 <_fini>:
 8049854:	55                   	push   %ebp
 8049855:	89 e5                	mov    %esp,%ebp
 8049857:	53                   	push   %ebx
 8049858:	e8 00 00 00 00       	call   804985d <_etext+0x9>
 804985d:	5b                   	pop    %ebx
 804985e:	81 c3 c3 14 00 00    	add    $0x14c3,%ebx
 8049864:	e8 d7 ee ff ff       	call   8048740 <__do_global_dtors_aux>
 8049869:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804986c:	c9                   	leave  
 804986d:	c3                   	ret    
