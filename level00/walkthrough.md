### level00

Le premier exercice est plutôt simple, après avoir reconstitué le code source nous observons cette ligne.

```c
if (password != 5276)
```

Nous allons donc insérer le password 5276 afin d'accéder au mot de passe.

```bash
level00@OverRide:~$ (python -c 'print "5276"' && python -c 'print "cat /home/users/level01/.pass"') | ./level00 
***********************************
* 	     -Level00 -		  *
***********************************
Password:
Authenticated!
uSq2ehEGT6c9S24zbshexZQBXUGrncxn5sD5QfGL
```
