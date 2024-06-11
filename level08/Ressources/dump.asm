00000000004008c4 <log_wrapper>:
  4008c4:	55                   	push   rbp
  4008c5:	48 89 e5             	mov    rbp,rsp
  4008c8:	48 81 ec 30 01 00 00 	sub    rsp,0x130
  4008cf:	48 89 bd e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rdi
  4008d6:	48 89 b5 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rsi
  4008dd:	48 89 95 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rdx
  4008e4:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4008eb:	00 00 
  4008ed:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4008f1:	31 c0                	xor    eax,eax
  4008f3:	48 8b 95 e0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x120]
  4008fa:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400901:	48 89 d6             	mov    rsi,rdx
  400904:	48 89 c7             	mov    rdi,rax
  400907:	e8 e4 fd ff ff       	call   4006f0 <strcpy@plt>
  40090c:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
  400913:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  40091a:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0xffffffffffffffff
  400921:	ff ff ff ff 
  400925:	48 89 c2             	mov    rdx,rax
  400928:	b8 00 00 00 00       	mov    eax,0x0
  40092d:	48 8b 8d d0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x130]
  400934:	48 89 d7             	mov    rdi,rdx
  400937:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  400939:	48 89 c8             	mov    rax,rcx
  40093c:	48 f7 d0             	not    rax
  40093f:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400943:	b8 fe 00 00 00       	mov    eax,0xfe
  400948:	49 89 c0             	mov    r8,rax
  40094b:	49 29 d0             	sub    r8,rdx
  40094e:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400955:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0xffffffffffffffff
  40095c:	ff ff ff ff 
  400960:	48 89 c2             	mov    rdx,rax
  400963:	b8 00 00 00 00       	mov    eax,0x0
  400968:	48 8b 8d d0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x130]
  40096f:	48 89 d7             	mov    rdi,rdx
  400972:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  400974:	48 89 c8             	mov    rax,rcx
  400977:	48 f7 d0             	not    rax
  40097a:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  40097e:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400985:	48 01 d0             	add    rax,rdx
  400988:	48 89 f2             	mov    rdx,rsi
  40098b:	4c 89 c6             	mov    rsi,r8
  40098e:	48 89 c7             	mov    rdi,rax
  400991:	b8 00 00 00 00       	mov    eax,0x0
  400996:	e8 a5 fd ff ff       	call   400740 <snprintf@plt>
  40099b:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  4009a2:	be 4c 0d 40 00       	mov    esi,0x400d4c
  4009a7:	48 89 c7             	mov    rdi,rax
  4009aa:	e8 d1 fd ff ff       	call   400780 <strcspn@plt>
  4009af:	c6 84 05 f0 fe ff ff 	mov    BYTE PTR [rbp+rax*1-0x110],0x0
  4009b6:	00 
  4009b7:	b9 4e 0d 40 00       	mov    ecx,0x400d4e
  4009bc:	48 8d 95 f0 fe ff ff 	lea    rdx,[rbp-0x110]
  4009c3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  4009ca:	48 89 ce             	mov    rsi,rcx
  4009cd:	48 89 c7             	mov    rdi,rax
  4009d0:	b8 00 00 00 00       	mov    eax,0x0
  4009d5:	e8 c6 fd ff ff       	call   4007a0 <fprintf@plt>
  4009da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4009de:	64 48 33 04 25 28 00 	xor    rax,QWORD PTR fs:0x28
  4009e5:	00 00 
  4009e7:	74 05                	je     4009ee <log_wrapper+0x12a>
  4009e9:	e8 32 fd ff ff       	call   400720 <__stack_chk_fail@plt>
  4009ee:	c9                   	leave  
  4009ef:	c3                   	ret    

00000000004009f0 <main>:
  4009f0:	55                   	push   rbp
  4009f1:	48 89 e5             	mov    rbp,rsp
  4009f4:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  4009fb:	89 bd 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],edi
  400a01:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  400a08:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  400a0f:	00 00 
  400a11:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400a15:	31 c0                	xor    eax,eax
  400a17:	c6 45 8f ff          	mov    BYTE PTR [rbp-0x71],0xff
  400a1b:	c7 45 88 ff ff ff ff 	mov    DWORD PTR [rbp-0x78],0xffffffff
  400a22:	83 bd 6c ff ff ff 02 	cmp    DWORD PTR [rbp-0x94],0x2
  400a29:	74 1f                	je     400a4a <main+0x5a>
  400a2b:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400a32:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400a35:	b8 57 0d 40 00       	mov    eax,0x400d57
  400a3a:	48 89 d6             	mov    rsi,rdx
  400a3d:	48 89 c7             	mov    rdi,rax
  400a40:	b8 00 00 00 00       	mov    eax,0x0
  400a45:	e8 e6 fc ff ff       	call   400730 <printf@plt>
  400a4a:	ba 6b 0d 40 00       	mov    edx,0x400d6b
  400a4f:	b8 6d 0d 40 00       	mov    eax,0x400d6d
  400a54:	48 89 d6             	mov    rsi,rdx
  400a57:	48 89 c7             	mov    rdi,rax
  400a5a:	e8 61 fd ff ff       	call   4007c0 <fopen@plt>
  400a5f:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  400a66:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
  400a6d:	00 
  400a6e:	75 21                	jne    400a91 <main+0xa1>
  400a70:	b8 7c 0d 40 00       	mov    eax,0x400d7c
  400a75:	be 6d 0d 40 00       	mov    esi,0x400d6d
  400a7a:	48 89 c7             	mov    rdi,rax
  400a7d:	b8 00 00 00 00       	mov    eax,0x0
  400a82:	e8 a9 fc ff ff       	call   400730 <printf@plt>
  400a87:	bf 01 00 00 00       	mov    edi,0x1
  400a8c:	e8 3f fd ff ff       	call   4007d0 <exit@plt>
  400a91:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400a98:	48 83 c0 08          	add    rax,0x8
  400a9c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400a9f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  400aa6:	be 96 0d 40 00       	mov    esi,0x400d96
  400aab:	48 89 c7             	mov    rdi,rax
  400aae:	e8 11 fe ff ff       	call   4008c4 <log_wrapper>
  400ab3:	ba a9 0d 40 00       	mov    edx,0x400da9
  400ab8:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400abf:	48 83 c0 08          	add    rax,0x8
  400ac3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  400ac6:	48 89 d6             	mov    rsi,rdx
  400ac9:	48 89 c7             	mov    rdi,rax
  400acc:	e8 ef fc ff ff       	call   4007c0 <fopen@plt>
  400ad1:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  400ad5:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  400ada:	75 2d                	jne    400b09 <main+0x119>
  400adc:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400ae3:	48 83 c0 08          	add    rax,0x8
  400ae7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400aea:	b8 7c 0d 40 00       	mov    eax,0x400d7c
  400aef:	48 89 d6             	mov    rsi,rdx
  400af2:	48 89 c7             	mov    rdi,rax
  400af5:	b8 00 00 00 00       	mov    eax,0x0
  400afa:	e8 31 fc ff ff       	call   400730 <printf@plt>
  400aff:	bf 01 00 00 00       	mov    edi,0x1
  400b04:	e8 c7 fc ff ff       	call   4007d0 <exit@plt>
  400b09:	ba ab 0d 40 00       	mov    edx,0x400dab
  400b0e:	48 8d 45 90          	lea    rax,[rbp-0x70]
  400b12:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
  400b15:	48 89 08             	mov    QWORD PTR [rax],rcx
  400b18:	0f b7 4a 08          	movzx  ecx,WORD PTR [rdx+0x8]
  400b1c:	66 89 48 08          	mov    WORD PTR [rax+0x8],cx
  400b20:	0f b6 52 0a          	movzx  edx,BYTE PTR [rdx+0xa]
  400b24:	88 50 0a             	mov    BYTE PTR [rax+0xa],dl
  400b27:	48 8d 45 90          	lea    rax,[rbp-0x70]
  400b2b:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0xffffffffffffffff
  400b32:	ff ff ff ff 
  400b36:	48 89 c2             	mov    rdx,rax
  400b39:	b8 00 00 00 00       	mov    eax,0x0
  400b3e:	48 8b 8d 58 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa8]
  400b45:	48 89 d7             	mov    rdi,rdx
  400b48:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  400b4a:	48 89 c8             	mov    rax,rcx
  400b4d:	48 f7 d0             	not    rax
  400b50:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400b54:	b8 63 00 00 00       	mov    eax,0x63
  400b59:	48 89 c1             	mov    rcx,rax
  400b5c:	48 29 d1             	sub    rcx,rdx
  400b5f:	48 89 ca             	mov    rdx,rcx
  400b62:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400b69:	48 83 c0 08          	add    rax,0x8
  400b6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  400b70:	48 89 c1             	mov    rcx,rax
  400b73:	48 8d 45 90          	lea    rax,[rbp-0x70]
  400b77:	48 89 ce             	mov    rsi,rcx
  400b7a:	48 89 c7             	mov    rdi,rax
  400b7d:	e8 ce fb ff ff       	call   400750 <strncat@plt>
  400b82:	48 8d 45 90          	lea    rax,[rbp-0x70]
  400b86:	ba b0 01 00 00       	mov    edx,0x1b0
  400b8b:	be c1 00 00 00       	mov    esi,0xc1
  400b90:	48 89 c7             	mov    rdi,rax
  400b93:	b8 00 00 00 00       	mov    eax,0x0
  400b98:	e8 13 fc ff ff       	call   4007b0 <open@plt>
  400b9d:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
  400ba0:	83 7d 88 00          	cmp    DWORD PTR [rbp-0x78],0x0
  400ba4:	79 47                	jns    400bed <main+0x1fd>
  400ba6:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400bad:	48 83 c0 08          	add    rax,0x8
  400bb1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400bb4:	b8 b6 0d 40 00       	mov    eax,0x400db6
  400bb9:	be ab 0d 40 00       	mov    esi,0x400dab
  400bbe:	48 89 c7             	mov    rdi,rax
  400bc1:	b8 00 00 00 00       	mov    eax,0x0
  400bc6:	e8 65 fb ff ff       	call   400730 <printf@plt>
  400bcb:	bf 01 00 00 00       	mov    edi,0x1
  400bd0:	e8 fb fb ff ff       	call   4007d0 <exit@plt>
  400bd5:	48 8d 4d 8f          	lea    rcx,[rbp-0x71]
  400bd9:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  400bdc:	ba 01 00 00 00       	mov    edx,0x1
  400be1:	48 89 ce             	mov    rsi,rcx
  400be4:	89 c7                	mov    edi,eax
  400be6:	e8 15 fb ff ff       	call   400700 <write@plt>
  400beb:	eb 01                	jmp    400bee <main+0x1fe>
  400bed:	90                   	nop
  400bee:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  400bf2:	48 89 c7             	mov    rdi,rax
  400bf5:	e8 66 fb ff ff       	call   400760 <fgetc@plt>
  400bfa:	88 45 8f             	mov    BYTE PTR [rbp-0x71],al
  400bfd:	0f b6 45 8f          	movzx  eax,BYTE PTR [rbp-0x71]
  400c01:	3c ff                	cmp    al,0xff
  400c03:	75 d0                	jne    400bd5 <main+0x1e5>
  400c05:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  400c0c:	48 83 c0 08          	add    rax,0x8
  400c10:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400c13:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  400c1a:	be d2 0d 40 00       	mov    esi,0x400dd2
  400c1f:	48 89 c7             	mov    rdi,rax
  400c22:	e8 9d fc ff ff       	call   4008c4 <log_wrapper>
  400c27:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  400c2b:	48 89 c7             	mov    rdi,rax
  400c2e:	e8 dd fa ff ff       	call   400710 <fclose@plt>
  400c33:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  400c36:	89 c7                	mov    edi,eax
  400c38:	e8 33 fb ff ff       	call   400770 <close@plt>
  400c3d:	b8 00 00 00 00       	mov    eax,0x0
  400c42:	48 8b 7d f8          	mov    rdi,QWORD PTR [rbp-0x8]
  400c46:	64 48 33 3c 25 28 00 	xor    rdi,QWORD PTR fs:0x28
  400c4d:	00 00 
  400c4f:	74 05                	je     400c56 <main+0x266>
  400c51:	e8 ca fa ff ff       	call   400720 <__stack_chk_fail@plt>
  400c56:	c9                   	leave  
  400c57:	c3                   	ret    
  400c58:	90                   	nop
  400c59:	90                   	nop
  400c5a:	90                   	nop
  400c5b:	90                   	nop
  400c5c:	90                   	nop
  400c5d:	90                   	nop
  400c5e:	90                   	nop
  400c5f:	90                   	nop