0x8048494 <main>        push%ebp
0x8048495 <main+1>      mov%esp,%ebp
0x8048497 <main+3>      and$0xfffffff0,%esp
0x804849a <main+6>      sub$0x20,%esp
0x804849d <main+9>      movl$0x80485f0,(%esp)
0x80484a4 <main+16>     call0x8048390<puts@plt>
0x80484a9 <main+21>     movl$0x8048614,(%esp)
0x80484b0 <main+28>     call0x8048390<puts@plt>
0x80484b5 <main+33>     movl$0x80485f0,(%esp)
0x80484bc <main+40>     call0x8048390<puts@plt>
0x80484c1 <main+45>     mov$0x804862c,%eax
0x80484c6 <main+50>     mov%eax,(%esp)
0x80484c9 <main+53>     call0x8048380<printf@plt>
0x80484ce <main+58>     mov$0x8048636,%eax
0x80484d3 <main+63>     lea0x1c(%esp),%edx
0x80484d7 <main+67>     mov%edx,0x4(%esp)
0x80484db <main+71>     mov%eax,(%esp)
0x80484de <main+74>     call0x80483d0<__isoc99_scanf@plt>
0x80484e3 <main+79>     mov0x1c(%esp),%eax
0x80484e7 <main+83>     cmp$0x149c,%eax
0x80484ec <main+88>     jne0x804850d<main+121>
0x80484ee <main+90>     movl$0x8048639,(%esp)
0x80484f5 <main+97>     call0x8048390<puts@plt>
0x80484fa <main+102>    movl$0x8048649,(%esp)
0x8048501 <main+109>    call0x80483a0<system@plt>
0x8048506 <main+114>    mov$0x0,%eax
0x804850b <main+119>    jmp0x804851e<main+138>
0x804850d <main+121>    movl$0x8048651,(%esp)
0x8048514 <main+128>    call0x8048390<puts@plt>
0x8048519 <main+133>    mov$0x1,%eax
0x804851e <main+138>    leave
0x804851f <main+139>    ret