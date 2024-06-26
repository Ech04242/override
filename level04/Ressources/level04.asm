0804868f <prog_timeout>:
 804868f:	55                   	push   ebp
 8048690:	89 e5                	mov    ebp,esp
 8048692:	b8 01 00 00 00       	mov    eax,0x1
 8048697:	bb 01 00 00 00       	mov    ebx,0x1
 804869c:	cd 80                	int    0x80
 804869e:	5d                   	pop    ebp
 804869f:	c3                   	ret    

080486a0 <enable_timeout_cons>:
 80486a0:	55                   	push   ebp
 80486a1:	89 e5                	mov    ebp,esp
 80486a3:	83 ec 18             	sub    esp,0x18
 80486a6:	c7 44 24 04 8f 86 04 	mov    DWORD PTR [esp+0x4],0x804868f
 80486ad:	08 
 80486ae:	c7 04 24 0e 00 00 00 	mov    DWORD PTR [esp],0xe
 80486b5:	e8 16 fe ff ff       	call   80484d0 <signal@plt>
 80486ba:	c7 04 24 3c 00 00 00 	mov    DWORD PTR [esp],0x3c
 80486c1:	e8 1a fe ff ff       	call   80484e0 <alarm@plt>
 80486c6:	c9                   	leave  
 80486c7:	c3                   	ret    

080486c8 <main>:
 80486c8:	55                   	push   ebp
 80486c9:	89 e5                	mov    ebp,esp
 80486cb:	57                   	push   edi
 80486cc:	53                   	push   ebx
 80486cd:	83 e4 f0             	and    esp,0xfffffff0
 80486d0:	81 ec b0 00 00 00    	sub    esp,0xb0
 80486d6:	e8 75 fe ff ff       	call   8048550 <fork@plt>
 80486db:	89 84 24 ac 00 00 00 	mov    DWORD PTR [esp+0xac],eax
 80486e2:	8d 5c 24 20          	lea    ebx,[esp+0x20]
 80486e6:	b8 00 00 00 00       	mov    eax,0x0
 80486eb:	ba 20 00 00 00       	mov    edx,0x20
 80486f0:	89 df                	mov    edi,ebx
 80486f2:	89 d1                	mov    ecx,edx
 80486f4:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 80486f6:	c7 84 24 a8 00 00 00 	mov    DWORD PTR [esp+0xa8],0x0
 80486fd:	00 00 00 00 
 8048701:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
 8048708:	00 
 8048709:	83 bc 24 ac 00 00 00 	cmp    DWORD PTR [esp+0xac],0x0
 8048710:	00 
 8048711:	75 56                	jne    8048769 <main+0xa1>
 8048713:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
 804871a:	00 
 804871b:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 8048722:	e8 19 fe ff ff       	call   8048540 <prctl@plt>
 8048727:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 804872e:	00 
 804872f:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
 8048736:	00 
 8048737:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 804873e:	00 
 804873f:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 8048746:	e8 25 fe ff ff       	call   8048570 <ptrace@plt>
 804874b:	c7 04 24 03 89 04 08 	mov    DWORD PTR [esp],0x8048903
 8048752:	e8 a9 fd ff ff       	call   8048500 <puts@plt>
 8048757:	8d 44 24 20          	lea    eax,[esp+0x20]
 804875b:	89 04 24             	mov    DWORD PTR [esp],eax
 804875e:	e8 4d fd ff ff       	call   80484b0 <gets@plt>
 8048763:	e9 b2 00 00 00       	jmp    804881a <main+0x152>
 8048768:	90                   	nop
 8048769:	8d 44 24 1c          	lea    eax,[esp+0x1c]
 804876d:	89 04 24             	mov    DWORD PTR [esp],eax
 8048770:	e8 7b fd ff ff       	call   80484f0 <wait@plt>
 8048775:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 8048779:	89 84 24 a0 00 00 00 	mov    DWORD PTR [esp+0xa0],eax
 8048780:	8b 84 24 a0 00 00 00 	mov    eax,DWORD PTR [esp+0xa0]
 8048787:	83 e0 7f             	and    eax,0x7f
 804878a:	85 c0                	test   eax,eax
 804878c:	74 1e                	je     80487ac <main+0xe4>
 804878e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 8048792:	89 84 24 a4 00 00 00 	mov    DWORD PTR [esp+0xa4],eax
 8048799:	8b 84 24 a4 00 00 00 	mov    eax,DWORD PTR [esp+0xa4]
 80487a0:	83 e0 7f             	and    eax,0x7f
 80487a3:	83 c0 01             	add    eax,0x1
 80487a6:	d0 f8                	sar    al,1
 80487a8:	84 c0                	test   al,al
 80487aa:	7e 0e                	jle    80487ba <main+0xf2>
 80487ac:	c7 04 24 1d 89 04 08 	mov    DWORD PTR [esp],0x804891d
 80487b3:	e8 48 fd ff ff       	call   8048500 <puts@plt>
 80487b8:	eb 60                	jmp    804881a <main+0x152>
 80487ba:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 80487c1:	00 
 80487c2:	c7 44 24 08 2c 00 00 	mov    DWORD PTR [esp+0x8],0x2c
 80487c9:	00 
 80487ca:	8b 84 24 ac 00 00 00 	mov    eax,DWORD PTR [esp+0xac]
 80487d1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80487d5:	c7 04 24 03 00 00 00 	mov    DWORD PTR [esp],0x3
 80487dc:	e8 8f fd ff ff       	call   8048570 <ptrace@plt>
 80487e1:	89 84 24 a8 00 00 00 	mov    DWORD PTR [esp+0xa8],eax
 80487e8:	83 bc 24 a8 00 00 00 	cmp    DWORD PTR [esp+0xa8],0xb
 80487ef:	0b 
 80487f0:	0f 85 72 ff ff ff    	jne    8048768 <main+0xa0>
 80487f6:	c7 04 24 31 89 04 08 	mov    DWORD PTR [esp],0x8048931
 80487fd:	e8 fe fc ff ff       	call   8048500 <puts@plt>
 8048802:	c7 44 24 04 09 00 00 	mov    DWORD PTR [esp+0x4],0x9
 8048809:	00 
 804880a:	8b 84 24 ac 00 00 00 	mov    eax,DWORD PTR [esp+0xac]
 8048811:	89 04 24             	mov    DWORD PTR [esp],eax
 8048814:	e8 07 fd ff ff       	call   8048520 <kill@plt>
 8048819:	90                   	nop
 804881a:	b8 00 00 00 00       	mov    eax,0x0
 804881f:	8d 65 f8             	lea    esp,[ebp-0x8]
 8048822:	5b                   	pop    ebx
 8048823:	5f                   	pop    edi
 8048824:	5d                   	pop    ebp
 8048825:	c3                   	ret    
 8048826:	90                   	nop
 8048827:	90                   	nop
 8048828:	90                   	nop
 8048829:	90                   	nop
 804882a:	90                   	nop
 804882b:	90                   	nop
 804882c:	90                   	nop
 804882d:	90                   	nop
 804882e:	90                   	nop
 804882f:	90                   	nop