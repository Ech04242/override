0x80486c8 <main>            push%ebp
0x80486c9 <main+1>          mov%esp,%ebp
0x80486cb <main+3>          push%edi
0x80486cc <main+4>          push%ebx
0x80486cd <main+5>          and$0xfffffff0,%esp
0x80486d0 <main+8>          sub$0xb0,%esp
0x80486d6 <main+14>         call0x8048550<fork@plt>
0x80486db <main+19>         mov%eax,0xac(%esp)
0x80486e2 <main+26>         lea0x20(%esp),%ebx
0x80486e6 <main+30>         mov$0x0,%eax
0x80486eb <main+35>         mov$0x20,%edx
0x80486f0 <main+40>         mov%ebx,%edi
0x80486f2 <main+42>         mov%edx,%ecx
0x80486f4 <main+44>         repstos%eax,%es:(%edi)
0x80486f6 <main+46>         movl$0x0,0xa8(%esp)
0x8048701 <main+57>         movl$0x0,0x1c(%esp)
0x8048709 <main+65>         cmpl$0x0,0xac(%esp)
0x8048711 <main+73>         jne0x8048769<main+161>
0x8048713 <main+75>         movl$0x1,0x4(%esp)
0x804871b <main+83>         movl$0x1,(%esp)
0x8048722 <main+90>         call0x8048540<prctl@plt>
0x8048727 <main+95>         movl$0x0,0xc(%esp)
0x804872f <main+103>        movl$0x0,0x8(%esp)
0x8048737 <main+111>        movl$0x0,0x4(%esp)
0x804873f <main+119>        movl$0x0,(%esp)
0x8048746 <main+126>        call0x8048570<ptrace@plt>
0x804874b <main+131>        movl$0x8048903,(%esp)
0x8048752 <main+138>        call0x8048500<puts@plt>
0x8048757 <main+143>        lea0x20(%esp),%eax
0x804875b <main+147>        mov%eax,(%esp)
0x804875e <main+150>        call0x80484b0<gets@plt>
0x8048763 <main+155>        jmp0x804881a<main+338>
0x8048768 <main+160>        nop
0x8048769 <main+161>        lea0x1c(%esp),%eax
0x804876d <main+165>        mov%eax,(%esp)
0x8048770 <main+168>        call0x80484f0<wait@plt>
0x8048770 <main+168>        call0x80484f0<wait@plt>
0x8048775 <main+173>        mov0x1c(%esp),%eax
0x8048779 <main+177>        mov%eax,0xa0(%esp)
0x8048780 <main+184>        mov0xa0(%esp),%eax
0x8048787 <main+191>        and$0x7f,%eax
0x804878a <main+194>        test%eax,%eax
0x804878c <main+196>        je0x80487ac<main+228>
0x804878e <main+198>        mov0x1c(%esp),%eax
0x8048792 <main+202>        mov%eax,0xa4(%esp)
0x8048799 <main+209>        mov0xa4(%esp),%eax
0x80487a0 <main+216>        and$0x7f,%eax
0x80487a3 <main+219>        add$0x1,%eax
0x80487a6 <main+222>        sar%al
0x80487a8 <main+224>        test%al,%al
0x80487aa <main+226>        jle0x80487ba<main+242>
0x80487ac <main+228>        movl$0x804891d,(%esp)
0x80487b3 <main+235>        call0x8048500<puts@plt>
0x80487b8 <main+240>        jmp0x804881a<main+338>
0x80487ba <main+242>        movl$0x0,0xc(%esp)
0x80487c2 <main+250>        movl$0x2c,0x8(%esp)
0x80487ca <main+258>        mov0xac(%esp),%eax
0x80487d1 <main+265>        mov%eax,0x4(%esp)
0x80487d5 <main+269>        movl$0x3,(%esp)
0x80487dc <main+276>        call0x8048570<ptrace@plt>
0x80487e1 <main+281>        mov%eax,0xa8(%esp)
0x80487e8 <main+288>        cmpl$0xb,0xa8(%esp)
0x80487f0 <main+296>        jne0x8048768<main+160>
0x80487f6 <main+302>        movl$0x8048931,(%esp)
0x80487fd <main+309>        call0x8048500<puts@plt>
0x8048802 <main+314>        movl$0x9,0x4(%esp)
0x804880a <main+322>        mov0xac(%esp),%eax
0x8048811 <main+329>        mov%eax,(%esp)
0x8048814 <main+332>        call0x8048520<kill@plt>
0x8048819 <main+337>        nop
0x804881a <main+338>        mov$0x0,%eax
0x804881f <main+343>        lea-0x8(%ebp),%esp
0x8048822 <main+346>        pop%ebx
0x8048823 <main+347>        pop%edi
0x8048824 <main+348>        pop%ebp
0x8048825 <main+349>        ret

0x804868f <prog_timeout>        push%ebp
0x8048690 <prog_timeout+1>      mov%esp,%ebp
0x8048692 <prog_timeout+3>      mov$0x1,%eax
0x8048697 <prog_timeout+8>      mov$0x1,%ebx
0x804869c <prog_timeout+13>     int$0x80
0x804869e <prog_timeout+15>     pop%ebp
0x804869f <prog_timeout+16>     ret



0x80486a0 <enable_timeout_cons>     push%ebp
0x80486a1 <enable_timeout_cons+1>   mov%esp,%ebp
0x80486a3 <enable_timeout_cons+3>   sub$0x18,%esp
0x80486a6 <enable_timeout_cons+6>   movl$0x804868f,0x4(%esp)
0x80486ae <enable_timeout_cons+14>  movl$0xe,(%esp)
0x80486b5 <enable_timeout_cons+21>  call0x80484d0<signal@plt>
0x80486ba <enable_timeout_cons+26>  movl$0x3c,(%esp)
0x80486c1 <enable_timeout_cons+33>  call0x80484e0<alarm@plt>
0x80486c6 <enable_timeout_cons+38>  leave
0x80486c7 <enable_timeout_cons+39>  ret