### level05

Cet exercice est assez simple une fois le code source recomposé.
Il demande un login et le serial number associé, dans le code il va calculer le serial number pour vérifier s'il est bon.
On a donc extrait cette partie du code dans un fichier qui va demander un login et afficher le serial number associé.

On compile et exécute script.c en lui donnant un login, on va mettre "username" (le login doit faire au moins 6 caractères).

Le résultat est : 6234463.

Il ne reste plus qu'à passer ces arguments à level06 et exécuter : cat /home/users/level07/.pass
Voici une commande qui fait tout cela :

```bash
(python -c 'print "username"'; python -c 'print "6234463"'; python -c 'print "cat /home/users/level07/.pass"'; cat) | ./level06
```