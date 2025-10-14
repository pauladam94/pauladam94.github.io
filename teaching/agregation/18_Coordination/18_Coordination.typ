#import "../../deps.typ" : *
#show : tableau

// CODLY
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(languages: codly-languages)
#codly(number-format: none)

#set text(lang: "fr")

= Gestion et coordination de multiples fils d'exécution.

== Processus

=== Concurrence

#item("Définition")[Processus@TOR[14.2]][
  Un processus est un programme en exécution caractérisé par son code, registres, les ressources qu’il utilise et l’ensemble de la mémoire allouée a pour exécution, la pile et le tas. Un nombre unique l'identifie: il s'agit du *pid*.
]

#item("Remarque")[][
Il y a bien plus de processus s'exécutant sur un ordinateur que de cœurs de calculs disponibles `ps -a -u -x`. Il faut donc gérer le partage de ces cœurs de calculs entre les processus.
]

#item("Définition")[Mémoire d'un processus@TOR[2.2.2]][
  La mémoire d'un processus est principalement divisée en quatre parties:
  - La *section texte .data* contenant le code exécutable
  - La *section donnée .rodata .bss* contenant les variables globales ou statiques
  - Le *tas* contenant les données allouées dynamiquement
  - La *pile* contenant les variables locales et les cadres des fonctions
]

#grid(
  columns: (17em, auto), column-gutter: 1em,
  row-gutter: 0em,
grid.cell({
item("Définition")[Fil d'exécution][
  Aussi appelé *Thread*, c'est un sous-processus exécutant une partie du programme du processus père. Dans le cas de multiple fils d'exécution, la mémoire est partagée, et l'on parle dans ce cas de processus à *multiples fils d'exécution*.
]
}),
grid.cell({
  image("multithread_process.png", width: 100%)
})
)

#item("Exemple")[][
  C'est le cas du navigateur web qui utilise plusieurs fils d'exécutions pour la réception, l'envoie, l'affichage de la page.
]

#item("Définition")[Concurrence @TOR[14.1]][
  Deux fils d'exécutions sont dits en concurrence lorsqu'ils sont exécutés en entrelacement, quelques étapes de l'un sont alors effectuées avant quelques étapes de l'autre.
]

=== Parallélisme

#item("Définition")[Processeur multicœur][
  Dans le but d'améliorer les performances, plusieurs cœurs, permettant l'exécution simultanée de plusieurs fils d'exécution, peuvent être disposés sur un même puce CPU.
]

#item("Définition")[Parallélismes @TOR[14.1]][
  Sur un système possédant plusieurs cœurs, le parallélisme entre deux processus signifie l'assignation des fils d'exécutions sur des cœurs distincts.
]

#item("Définition")[Ordonnanceur @TOR[2.3]][
  L'ordonnanceur est un composant du noyau dont le rôle est de gérer la ressource qu'est le temps processeur en donnant/enlevant l'accès à un cœur par un fil d'exécution. 
]

#grid(
  columns: (15em, auto), column-gutter: 1em,
  row-gutter: 0em,
grid.cell({
  image("concurrent.png", width: 100%)
}),
grid.cell({
  image("parallel.png", width: 100%)
})
)


#dev[
#item("Exemple")[Tri fusion][
  Le tri fusion peut être implémenté à l'aide de multiples fils d'exécutions. Pour ce faire, diviser le tableau en deux créé un nouveau fil d'exécution et la fusion termine un ancien fil d'exécution.
]
]

#item("Définition")[Appel système][
  Il s'agit d'une instruction dont le but est de permettre à un programme de passer temporairement en mode noyau dans l'objectif d'effectuer une instruction privilégiée.
]

#dev[
#item("Exemple")[Invite de Commande][
L'explication du fonctionnement d'une invite de commande simple à l'aide d'appels systèmes.  
]
]

== Gestion de fil d'exécution

=== Modes d'exécutions

#item("Définition")[@OSC[21.3]][
  L'exécution d'un programme peut s'effectuer selon deux modes possibles :
  - *Utilisateur*, limité sur certaines instructions privilégiées
  - *Noyau*, sans aucune restriction de permission
]


/*
#item("Définition")[Fil d'exécution utilisateur @OSC[4.3]][
  Il s'agit des fils d'exécutions en mode utilisateur et donc indépendamment du noyau.
]

#item("Définition")[Fil d'exécution noyau][
  À l'inverse, un Fil d'exécution noyau est exécuté et géré par ce dernier.
]
*/
=== Modèles de multiples fils d'exécution

#item("Remarque")[@OSC[4.3.1]][
  Chaque appel associe un fil d'exécution utilisateur à, au moins, un fil noyau. Il y a alors plusieurs méthodes possibles : 
]

#grid(
  columns: (21em, auto), column-gutter: 1em,
  row-gutter: 0em,
grid.cell({
item("Définition")[Association multiple][
  La première méthode est d'associer plusieurs fils d'exécutions utilisateurs à un unique fil d'exécution noyau.
]
}),
grid.cell({
  image("ToOne.png", width: 100%)
})
)

#grid(
  columns: (21em, auto), column-gutter: 1em,
  row-gutter: 0em,
grid.cell({
item("Définition")[Association individuelle][
  Cette deuxième méthode associe un unique fil noyau à chaque fil d'exécution utilisateur.
]
}),
grid.cell({
  image("OneOne.png", width: 100%)
})
)

#grid(
  columns: (21em, auto), column-gutter: 1em,
  row-gutter: 0em,
grid.cell({
item("Définition")[Association hybride][
  Enfin, une solution hybride propose une association plus complexe où plusieurs fils d'exécutions utilisateurs sont associés à plusieurs fils d'exécutions noyaux.
]
}),
grid.cell({
  image("ToMany.png", width: 100%)
})
)

#item("Remarque")[][
  Chacune a ces avantages et inconvénients :
  - L'association multiple est facile d'utilisation, mais peu efficace en pratique, car limitée à la concurrence.
  - L'association individuelle est plus efficace, mais amène plus de problèmes de synchronisation (registres non atomiques).
  - L'association hybride est flexible et dynamique et répond à tous les besoins, mais est difficile à implémenter
]

#item("Remarque")[][
  En pratique, l'association individuelle est la plus couramment utilisée.
]



=== Problèmes en absence de coordination @RAY[1.2.3]

#item("Définition")[Conditions de compétition][
Ce type d'interaction arrive lorsqu'un résultat dépends de la course de vitesse entre fils d'exécution pour exécuter des instructions. Généralement, lors de l'accès à une ressource partagée.
]


#item("Exemple")[Exemple d'entrelacement][
  //#footnote[Fig 1.2 @RAY à traduire. Remplacer disk.write par disk.read.]
#grid(
  columns: (50%, 50%), column-gutter: 10pt,
align(horizon)[```python
fonction lire_disque(pos):
  deplacer_tete_lecture(pos)
  r <- lire()
  renvoie r
```],
  image("../20_Synchro/raynal_interleaving.png")
)
]

#item("Remarque")[Non-déterminisme de l'exécution][
Le résultat de l'entrelacement d'instructions provoque du non-déterminisme. En effet, des facteurs extérieurs peuvent influer sur des courses, comme l'ordonnanceur du noyau.
]

#item("Problème")[Le problème du producteur-consommateur][
  consistes-en le fait d'assurer que toutes les données récupérées par un "consommateur" ont été produites par un "consommateur", chaque donnée doit aussi être traitée exactement une fois.
]

#item("Définition")[Section critique @RAY[1.3.1]][
Une section critique est un ensemble de sections de code, qui, pour des raisons de cohérence, ne doivent être exécuté que par un seul fil d'exécution à la fois.
]

#item("Définition")[Le problème de l'exclusion mutuelle][
consiste à créer deux algorithmes, *l'algorithme d'entrée* et *l'algorithme de sortie*, pour acquérir (resp relâcher) une section critique et qui, lorsqu'ils encadrent une section critique, assurent sa sûreté et sa vivacité.
]

#item("Propriété")[Famine][se produit lorsqu'un fil d'exécution qui attend une section critique attend indéfiniment. 
]

#item("Propriété")[Interblocage][se produit quand les attentes de sections critiques de plusieurs fils d'exécutions forment un cycle, bloquant tout progrès de ces derniers.
]

== Primitives de synchronisation

=== Les Verrous (Mutex) @RAY[1.3.2]

#item("Définition")[Un Verrou][est un objet partagé muni des procédures acquérir `lock()` et relâcher `unlock()` qui résout le problème de l'exclusion mutuelle.  
]


==== Implémentation avec registre atomique @RAY[2.1]

#item("Définition")[Une opération est dite atomique][
  si son exécution apparaît comment étant faite de façon instantanée.
]
#item("Définition")[Un registre partagé][
  est une donnée partagée qui peut être écrite et lue par plusieurs files d'exécutions.
]
#item("Définition")[][
  Un registre partagé est dit *atomique* si les opérations de lecture et écriture sont atomiques. 
]

#item("Remarque")[L'atomicité est importante][
  car elle permet d'assurer qu'un raisonnement séquentiel va rester correct. Notamment, on remarque que la composition d'objets atomiques est toujours atomique, ce qui simplifie les raisonnements.
]


#dev[
#item("Implémentation")[Algorithme de Péterson][
/*
#grid(columns: (63%, 1fr), column-gutter: 1em,
```python
fonction lock(i):
  flag[i] <- "up"
  after_you <- i
  attendre que (flag[1 - i] != "down")
        ou que (after_you == i)
```,
```python
fonction unlock(i):
  flag[i] <- "down"
```
)
*/
]

]

#item("Remarque")[L'attente active][
  consiste à attendre sans arrêter les calculs. On l'écrit par une boucle `while` sur la condition voulue, comme fait par l'algorithme de Peterson.
]

==== Implémentation à l'aide de primitives spécialisées @RAY[2.2]

#item("Définition")[Primitives Test&Set.][
Si `X` est un registre partagé initialisé à 1, les opérations atomiques de Test&Set sont `X`.*test&set()* qui met `X` à 0 et renvoie sa valeur précédente et `X`.*reset()* met $1$ dans `X`.
]

#item("Implémentation")[Test & Set][
  On peut implémenter un verrou à l'aide de ces primitives.
]


/*
#item("Implémentation")[Test & Set sans-interblocage uniquement][
  #grid(columns: (50%, 1fr), column-gutter: 1em,
```python
fonction lock(X):
  r <- 1
  tant que (r == 1) faire
    r <- X.test&set()
```,
```python
fonction unlock(X):
  X.reset()
```
)
]
*/
==== Implémentation sans atomicité @RAY[2.3]


#dev[
// #grid(columns: (68%, 1fr), column-gutter: 1.5em)
#item("Implémentation")[Algorithme de la Boulangerie de Lamport][
```python
fonction lock(me):
  machine_ticket[me] <- up
  ticket[me] <- 1 + max {ticket[autre]}  
  machine_ticket[me] <- down
  pour tout autre:
    attendre que (machine_ticket[autre] == down)
    attendre que ((ticket[autre] == 0)
    ou que (ticket[me], me) < (ticket[autre], autre))
```
]
]

#item("Remarque")[][
Les algorithmes précédents perdent leur correction lorsque le processeur/compilateur réordonne les instructions.
]

==== Implémentation via Bibliothèques @TOR[Chap 14] 

#item("Implémentation C ")[API PTHREAD d'exécution (`pthread.h`)][
```C
int pthread_mutex_lock(pthread_t *verrou);
int pthread_mutex_unlock(pthread_mutex_t *verrou);
```
]

#item("Implémentation OCaml")[Le module `Mutex` :][
```OCaml
val Mutex.create : unit -> Mutex.t
val Mutex.lock : Mutex.t -> unit
val Mutex.unlock : Mutex.t -> unit
```
]


#item("Remarque")[Implémentation sans attente active][
Les implémentations des bibliothèques utilisent le noyau afin de réveiller des fils d'exécution au relâchement du verrou, sans attente active.
]

=== Construction d'un Sémaphore @RAY[3.2.3]

#grid(columns: (85%, 1fr),

item("Probleme")[Le dîner des philosophes @TOR[Chap 14]][
  est un problème classique de coordination. Une assemblée de philosophe se regroupe autour d'une table pour manger et partagent leur couvert avec leur voisin. Pour manger ils doivent avoir accès aux deux couverts. L'objectif étant de les faire manger en un temps minimal.
],
image("../20_Synchro/diner_philosophe_tortue_chap14.png", width: 60pt)
)


#item("Définition")[Sémaphore][Une sémaphore $S$ est un compteur partagé muni de la spécification suivante
- $S$ est initialisé avec $s_0 >= 0$
- $S$ est toujours positif
- l'opération atomique $S".down()"$ décrémente $S$ de 1 (bloquant tant que $S=0$)
- l'opération atomique $S".up()"$ incrémente $S$ de 1
]

#item("Résolution")[Problème du dîner des philosophes][
à l'aide des opérations $S".down()"$ et $S".up()"$ des sémaphores.
]

#item("Résolution")[Problème du producteur-consommateur][
]
/*
#item("Implémentation C")[@TOR[Chap 14] API PTHREAD `semaphore.h`][
```C
int sem_wait(sem_t *s);
int sem_post(sem_t* s);
```
]
*/
/*
#item("Implémentation OCaml")[@TOR[Chap 14] Le module `Semaphore`][
```OCaml
val Semaphore.make : int -> Semaphore.t
val Semaphore.acquire : Semaphore.t -> unit
val Semaphore.release : Semaphore.t -> unit
```
]
*/




#recap()

#colbreak()

===== Au programme
#item("Programme")[][
- Prepa :
  - Notions de processus
  - Notions de fils d'éxécution
  - Les concepts sont illustrés sur des schémas de synchronisation classiques : rendez-vous, producteur-consommateur. Les étudiants sont également sensibilisés au non-déterminisme et aux problèmes d’interblocage et d’équité d’accès, illustrables sur le problème classique du dîner des philosophes.
- Complémentaire : Concurrence : modèles de cohérence (forte, faible, PRAM et au relâchement) et d’équité. Construction des mutex et sémaphores à partir des instructions atomiques test and set. Schéma lecteurs rédacteurs.
]

/*
== Commentaire

- Revoir la def de condition de courses
- Rajouter exemple condition de course
- Rajouter de la motivation à l'introduction
- Rajouter defs Famine et interblocage
- Rajouter Test&Set
- Attente active et alternatives
  Linux et ordonnanceur contre attente active
*/


#bibliography(read("../bib.yaml", encoding: none))

#authors[Adrien Decosse & Alexis Hamon]
