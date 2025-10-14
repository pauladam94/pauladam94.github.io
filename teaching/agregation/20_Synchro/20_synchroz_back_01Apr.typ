#import "../../utils/tableau.typ" : tableau, dev, recap, item, authors
#import "@preview/cetz:0.3.4" : *
#show : tableau

/// Codly Stuff
#show: codly-init.with()
#codly(
  languages: (sql: (name: "SQL", color: orange, icon: none)),
  inset: 0.2em,
  display-icon: false,
  display-name: false,
)
/// Codly Stuff

= Problèmes et stratégies de cohérence et de synchronisation

== Contexte @TOR[Chap 14]
#item("Définition")[Un Fil d'exécution][
  est une partie de programme en exécution. Il comprend donc la pile et le compteur d'instruction. Les données et le code étant partagées entre tous les fils d'exécutions d'un même programme.
]

#item("Définition")[Ressource partagée][
  
]


#item("Remarque", show-title: true)[Concurrence, ordonnancement entrelacement.][
Sur un ordinateur, des milliers de fils d'exécutions s'exécutent en même temps en concurrence. Cette exécution "parallèle" est simulée par l'entrelacement d'exécution à la suite de fils. L'ordonnanceur interrompt des fils (préemption) pour en choisir un autre à relancer. On appelle ce passage commutation de contexte. 

]


/*
#dev[
  #item("Exemple")[Le Tri Fusion][
    est un algorithme classique de tri qui peut être facilement parallélisé. En effet on lancera chaque thread pour opérer sur les parties séparées d'un tableau.
  ]
]
*/

=== Conditions de courses (ou de compétition) @RAY[1.2.3]

#item("Définition")[Conditions de courses][
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
  image("raynal_interleaving.png")
)
]

#item("Remarque")[Non-déterminisme de l'exécution][
Le résultat de l'entrelacement d'instructions provoque du non-déterminisme. En effet, des facteurs extérieurs peuvent influer sur des courses, comme l'ordonnanceur du noyau.
]

=== Problème de cohérence et de synchronisations @RAY[1.2.4]

#item("Problème")[Un rendez-vous][
  ou barrière de synchronisation est un ensemble de "point de contrôle", un par file d'exécution. Chaque fil a le droit de dépasser ce point de contrôle dans le code quand tous les fils ont atteint leur point de contrôle.
]

#item("Problème")[Le problème du producteur-consommateur][
  consistes-en le fait d'assurer que toutes les données récupérées par un "consommateur" ont été produites par un "consommateur", chaque donnée doit aussi être traitée exactement une fois.
]

#grid(
  columns: (60%, 40%), column-gutter: 10pt,
 item("Exemple")[La préservation de certains invariants][
  nous permet de formaliser le problème du *producteur consommateur*. Avec $p$, $c$ et $k$ respectivement le nombre d'éléments produit, consommé et la taille du buffer utilisé.
  On doit toujours avoir $0 <= c <= p <= c + k$.
],
 align(horizon,
  stack(spacing: 1em,
    image("raynal_invariants.png", width: 100%),
    align(center, [@RAY[Fig 1.3]])
  )
 )
)

@NAN
#item("Remarque")[][Le problème du producteur-consommateur porte sur la cohérence des données produites et consommées alors que le problème du rendez-vous porte sur la synchronisation sans données partagées.]


== Le problème de l'exclusion mutuelle @RAY[1.3]

=== Les propriétés de sûretés et de vivacité @RAY[1.3.1]

#item("Définition")[Section critique][
Une section critique est un ensemble de sections de code, qui, pour des raisons de cohérence, ne doivent être exécuté que par un seul fil d'exécution à la fois.
]

#item("Définition")[Le problème de l'exclusion mutuelle][
consiste à créer deux algorithmes, *l'algorithme d'entrée* et *l'algorithme de sortie*, pour acquérir (resp relâcher) une section critique et qui, lorsqu'ils encadrent une section critique, assurent sa sûreté et sa vivacité.
]

#item("Définition")[Les propriétés de sûretés (safety)][
consistent à énoncer que rien de mal ne va jamais arriver. Elles peuvent être exprimées comme des invariants.
]

#item("Propriété")[L'Exclusion-mutuelle][
énonce une propriété de sureté, pour une section de code fixée, qu'au plus un fil d'exécution ne peut avoir acquit la section à la fois. 
]

#item("Définition")[Les propriétés de vivacité][(liveness)
consistent à énoncer que quelque chose de bien finira par arriver.
]

#item("Propriété")[Sans-famine][
énonce que si un fil d'exécution veut acquérir une section critique, ce fil finira par l'acquérir.
]

#item("Propriété")[Sans-interblocage][
énonce que si un fil d'exécution acquiert une section critique, alors, il finira par la relâcher. 
]

#item("Remarque")[][Sans-famine implique sans-interblocage.]

#item("Problème")[Le problème de l'exclusion mutuelle][
consiste, pour nos deux algorithmes, à assurer les propriétés suivantes :
- Propriété de sûreté: exclusion-mutuelle
- Propriété de vivacité: sans-famine
]

=== Les Verrous (Mutex) @RAY[1.3.2]

#item("Définition")[Un Verrou][est un objet partagé muni des opérations acquérir `lock()` et relâcher `unlock()` qui résout le problème de l'exclusion mutuelle.  
]

//#item("Figure")[Spécification séquentielle du verrou][
//#align(center, image("lock.png", width: 30%))
//]

#item("Implémentation C ")[@TOR[Chap 14] API pthread (`pthread.h`)][
```c
int pthread_mutex_lock(pthread_mutex_t *verrou);
int pthread_mutex_unlock(pthread_mutex_t *verrou);
```
]
#item("Implémentation OCaml")[@TOR[Chap 14] Le module `Mutex` :][
```OCaml
val Mutex.create : unit -> Mutex.t
val Mutex.lock : Mutex.t -> unit
val Mutex.unlock : Mutex.t -> unit
```
]

== Implémentations Verrous @RAY[1.3.3, 2]

// #item("Remarque")[Différentes implémentations en fonction du contexte][
//  On distingue trois familles d'implémentation de verrous :
//  - registre avec lecture et écriture atomique
//  - primitive matériel spécialié
//  - mutex sans atomicité sousajacente
// ]

=== Implémentation avec registre atomique @RAY[2.1]

#item("Définition")[Une opération est dite atomique][
  si sont exécution apparaît comment étant faite de façon instantanée.
]
#item("Définition")[Un registre partagé][
  est une donnée partagée qui peut être écrite et lu par plusieurs files d'exécutions.
]
#item("Définition")[][
  Un registre partagé est dit *atomique* s'il les opérations de lecture et écriture sont atomiques. 
]

#item("Remarque")[L'atomicité est importante][
  car elle permet d'assurer qu'un raisonnement séquentiel va rester correct. Notamment, on remarque que la composition d'objet atomique est toujours atomique, ce qui simplifie les raisonnements.
]

#item("Implémentation")[Algorithme de Péterson P_0 et P_1][
#grid(columns: (60%, 1fr), column-gutter: 1em,
```python
fonction lock(i):
  flag[i] <- "up"
  after_you <- i
  attendre que (flag[1-i] != "down") 
    ou que (after_you == i)
```,
```python
fonction unlock(i):
  flag[i] <- "down"
```
)
]
#item("Remarque")[L'attente active][
  consiste à attendre. On l'écrire par une boucle while sur la condition voulu comme fait par l'algorithme de Peterson.
]



#item("Remarque")[][
  Les variables `flag` et `after_you` sont supposés atomiques.
 L'algorithme de Peterson permet d'implémenter une section critique avec attente active avec cette supposition.  
]

=== Implémentation à l'aide de primitives spécialisées @RAY[2.2]

#item("Définition")[Primitives Test&Set.][
Si `X` est un registre partagé initialisé à 1, les opérations atomiques de Test&Set sont `X`.*test&set()* qui met `X` à 0 et renvoie sa valeur précédente et `X`.*reset()* met $1$ dans `X`.
]

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

#item("Implémentation")[Test&Set sans-famine][
On introduit, en plus de la solution précédente, un mécanisme de tour, assurant un partage du verrou entre les fils.
]

#item("Remarque")[][
Il existe d'autres primitives atomiques comme Compare&Swap, Swap ou encore Fetch&Add.
]

=== Implémentation sans atomicité @RAY[2.3]

#grid(columns: (68%, 1fr), column-gutter: 1.5em,
dev[
#item("Implémentation")[Algorithme de la Boulangerie de Lamport][
```python
fonction lock(me):
  machine_ticket[me] <- up
  ticket[me] <- 1 + max{ticket[other]}  
  machine_ticket[me] <- down
  pour tout autre:
    attendre que (machine_ticket[autre] == down)
    attendre que ((ticket[autre] == 0)
    ou que (ticket[me], me) < (ticket[autre], autre))
```
]
],

item("Remarque")[][
Les algorithmes précédents perdent leur correction lorsque le processeur/compilateur réordonnance les instructions.
]
)


== Objets concurrents avancés

=== Rendre une structure thread-safe @NAN

#dev[
#item("Exemple")[Une structure de données][
  est dit concurrence compatible (thread safe) si lorsqu'appelé dans un contexte concurrent elle conservent ses invariants.
]

#item("Exemple")[L'implémentation de *malloc*][
  dans la `libc` est apte à la concurrence.
]
#item("Exemple")[][
  Pour une liste chainée dans un contexte concurrent différente approche sont possibles. On utilisera un #text(red)[verrou global] sur toute la structure, des #text(green)[verrous individuels] pour chaque maillon ou on pourra #text(blue)[forcer un ordre] dans le verrouillage des verrous.
]

#item("Schémas")[Visualisation des verrous sur une liste chainée.][
#align(center, canvas(length: 1em, {
  import draw: *
  
  let t = (3, 2, 1, 6, 4)
  let w = 1
  let x(i) = { i * 5 }
  
  let lock((x, y), c) = {
    let w_lock = 0.4
    rect((x, y), (rel: (-w_lock, w_lock)),
      fill: black,
      radius: w_lock / 10,
      stroke: black,
    )
    bezier(
      (x - w_lock, y + w_lock),
      (x, y + w_lock),
      (x - w_lock, y + w_lock * 2),
      (x, y + w_lock * 2),
      stroke: w_lock * 2pt + black
    )
  }
  

  // circle((0, 0), radius: 0.2)
  for i in range(5) {
    rect((x(i), 0), (rel : (w, -w)), name: str(i))
    content((x(i) + w/2, -w/2), [#t.at(i)])
  }
  for i in range(4) {
    line(str(i), str(i + 1), mark: (end : ">"))
  }

  rect((-w, w), (rel: (x(t.len()) - 2 * w, - w * 3)), stroke: (paint: red, thickness: 1pt, dash: "dashed"))

  lock((-1.25, 0.2))[🔒]

  for i in range(5) {
    rect((x(i) - w / 2, w / 2), (rel: (w * 2, - w * 2)), stroke: (paint: green, thickness: 1pt, dash: "solid"))
    lock((x(i) + w * 2.1, w * 0.1))[🔒]
  }

  for i in range(4) {
    bezier(
      (x(i) + w / 2, -w * 1.5),
      (x(i + 1) + w / 2, - w - w / 2),
      ((x(i) + x(i + 1) + w) / 2, -w * 4),
      mark: (end: ">"), stroke: blue)
  }

}))
]
]

=== Construction d'un Sémaphore @RAY[3.2.3]

#item("Définition")[Sémaphore][Une sémaphore $S$ est un compteur partagé muni de la spécification suivante
- $S$ est initialisé avec $s_0 >= 0$
- $S$ est toujours positif
- l'opération atomique $S".down()"$ décrémente $S$ de 1 (bloquant tant que $S=0$)
- l'opération atomique $S".up()"$ incrémente $S$ de 1
]

#item("Implémentation C")[@TOR[Chap 14] API PTHREAD `semaphore.h`][
```C
int sem_wait(sem_t *s);
int sem_post(sem_t* s);
```
]

#item("Implémentation OCaml")[@TOR[Chap 14] Le module `Semaphore`][
```OCaml
val Semaphore.make : int -> Semaphore.t
val Semaphore.acquire : Semaphore.t -> unit
val Semaphore.release : Semaphore.t -> unit
```
]

#item("Problème")[@RAY[3.2.4] Lecteur-rédacteur][consiste à permettre à plusieurs fils d'accéder en même temps à un fichier en lecture tout en assurant à un fil en écriture qu'il est le seul à disposer du fichier.
]

=== Le dinner des philosophes @TOR[Chap 14]

#dev[
#grid(columns: (85%, 1fr),

item("Probleme")[Le dinner des philosophes][
  est un problème classique de coordination. Une assemblée de philosophe se regroupe autour d'une table pour manger et partagent leur couvert avec leur voisin. Pour manger ils doivent avoir accès aux deux couverts. L'objectif étant de les faire manger en un temps minimal.
],
image("diner_philosophe_tortue_chap14.png", width: 60pt)
)

#item("Remarque")[Une stratégie naïve][
  consiste à utiliser un même mutex sur tous les couverts. Cependant qu'un seul philosophe à la fois peut alors manger au même moment.
]
]
#recap()

===== Remarque
- dans le @RAY on traduira "processus" par "fil d'exécution" d'après la définition en début de livre
- cette leçon est plus théorique que la leçon 18.
- cohérence (spatiale) mémoire != Synchronisation (Temporelle)
- structure thread safe @OSTEP
- tri Fusion Multithread @COR3
Le développement tri-fusion mutithread peut-être inséré dans l'introduction.
#dev[
  #item("Exemple")[Le Tri Fusion][
    est un algorithme classique de tri qui peut être facilement parallélisé. En effet on lancera chaque thread pour opérer sur les parties séparées d'un tableau.
  ]
]

- essayer de ne pas faire un catalogue

#bibliography(read("../bib.yaml", encoding: none))

#authors[Alexis Hamon & Paul Adam]
