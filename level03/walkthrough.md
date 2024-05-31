### level03

Nous nous retrouvons ici avec une fonction test, et un appel avec ces paramètres :

```c
  test(userInput, 322424845);
```

Au départ de ce test, nous avons une différence entre ``322424845`` et l'entrée de l'utilisateur.

Il y a un switch case du résultat pour les valeurs : ``1->9 || 16->21``
Si le résultat n'est pas dans ces valeurs, la fonction decrypt est appelée avec une valeur random, sinon il envoie le résultat.
On va donc tester les 15 valeurs possibles avec 2 boucles for :

```bash
for i in {1..9}; do (python -c "print(322424845 - $i)") | ./level03; echo $i; done
for i in {16..21}; do (python -c "print(322424845 - $i)") | ./level03; echo $i; done
```

On note qu'il ne dit pas "Invalid Password" avec la valeur 322424845 - 18, ce qui donne 322424827.
Note commande finale est donc :

```bash
(python -c "print(322424827)"; python -c 'print "cat /home/users/level04/.pass"') | ./level03
```
