#import "../../deps.typ" : *
#show : tableau

= Implémentations et application des piles, files et files de priorité

== Définitions @TOR @NSIT[7]


#grid(columns:(85%, 1fr), column-gutter: 1em,
[
#item("Définition")[Une pile][
  est une structure de données munie des opérations _empiler_, _dépiler_ et _test_vide_ qui respectivement ajoute un élément, enlève l'élément ajouté en #underline[dernier] de la pile et vérifier si la pile est vide.
]

#item("Définition")[Une file][
  est une structure de données munie des opérations _enfiler_, _défiler_ et _test_vide_ qui respectivement ajoute un élément, enlève l'élément ajouté en #underline[premier] dans la file et teste si la file est vide.
]

#item("Remarque")[DEPS et PEPS][
  désignant respectivement _Dernier Entrée Premier Sortie_ et _Premier Entrée Premier Sortie_ sont des types de structures de données. Une pile est de type DEPS tandis qu'un file est de type PEPS. 
]
],
stack(dir: ttb, spacing: 1em,
align(center, canvas(length: 1em, {
  import draw: *
  for i in range(6) {
    circle((0, i * 0.8), fill: white, radius: (1.3, 0.7))
  }
  set-style(mark: (end: "straight"))
  bezier((0.25, 4), (2, 5), (1, 5))
  bezier((-2.5, 5), (-0.25, 4), (-1.5, 5))
  content((0, 5.5), [DEPS])
})),
align(center, canvas(length: 1em, {
  import draw: *
  for i in range(6) {
    circle((0, i * 0.8), fill: white, radius: (1.3, 0.7))
  }
  set-style(mark: (end: "straight"))
  bezier((0, 4), (2, 5), (1, 5))
  bezier((-2, -1.5), (0, -0.7), (-0.7, -1.5))
  content((0, 5.5), [PEPS])
}))
)
)





#item("Définition")[Une file de priorité][
  est une structure de donnée munie des opérations _enfiler_, _défiler_max_ et _test_vide_ qui respectivement ajoute un élément avec sa priorité associé, enlève l'élément de priorité maximale et teste si la file est vide.
]

#item("Remarque")[D'autres opérations sur les files de priorités][
  sont possibles. Certains algorithmes peuvent nécessiter le changement de priorité, l'accès à l'élément de plus grande priorité, le nombre d'éléments dans la structure etc..
]

#item("Remarque")[][
  L'interface de ces structures de données pour le programmeurs peut se faire de deux manières :
  - Avec des structures mutables, les fonctions `enfiler` et `empiler` sont de type de retour `unit` ou `void`.
  - Avec des structures immutables, les fonctions enfiler et empiler renvoient alors une nouvelle structure de donnée avec le changement désiré.
]

== Implémentations

=== Implémentation à l'aide des tableaux

#grid(columns: (75%, 1fr), column-gutter: 1em,
item("Implémentation")[Une pile][
  peut être implémenté par un tableau et un indice de fin de pile. Cependant, cette pile est de taille bornée.
],
align(center, image("pile_shemas.png")))

#grid(columns: (75%, 1fr), column-gutter: 1em,
item("Implémentation")[Une file][
  peut être implémenté par un tableau, un indice de début et de fin de file, en considérant le tableau de façon cyclique. Cependant, cette file est de taille bornée.
],
align(center, image("shemas_file.png")))

#item("Implémentation")[Une file de priorité][
  peut être implémenté par un tableau, soit en conservant le tableau trié à l'insertion, soit en sélectionnant l'élément de plus grand priorité au défilement.
]

#item("Définition")[Un tas binaire max][
  est un arbre binaire presque complet à gauche tel que chaque noeud du tas est plsu grand que ses fils. Par conséquent, le plus grand élément d'un tas max est sa racine.
]

#item("Remarque")[La notation de Sosa Stradonitz][
  permet d'implémenter un tas sous la forme d'un tableau $T$ avec $T[0]$ la racine et si $i$ est l'indice d'un noeud, alors $2i + 1$ est $2i + 2$ sont ses fils gauches et droits s'ils existent et $floor(i / 2)$ est son parent si $i$ n'est pas la racine.
]

#item("Définition")[Le tamisage][
  est un principe utilisé pour les opérations sur un tas. Il prend un arbre binaire presque complet $T$ qui est un tas sauf éventuellement à l'indice $i$ et qui fait remonter (`tasser_ascendant`) lorsque $i$ est plus grand que sont parent ou descendre (`tasser_descendant`) lorsque $i$ est le plus petit qu'un de ses fils afin de transformer $T$ en tas.
]

#grid(columns: (45%, 55%), column-gutter: 0.2em,
```python
tasser_ascendant(T, i) :
  Si i != 0 et T[i] > T[i//2]:
    T[i],T[i//2] = T[i//2],T[i]
    tasser_ascendant( T, i//2)
```,
```python
tasser_descendant(T, i):
  k = i
  si 2i+1 < T.taille et T[k] < T[2i+1]:
    k = 2i+1
  si 2i+2 < T.taille et T[k] < T[2i+1]:
    k = 2i+2
  si k != i:
    T[i], T[k] = T[k], T[i]
    tasser_descendant(T, k)
```
)


#item("Implémentation")[Une file de priorité][
  peut être implémenté en utilisant les opérations de tamisage sur les tas. On peut alors implémentér les fontions `inserer` et `extraire_max`.
]

#grid(columns: (50%, 50%), column-gutter: 1em,
```python
inserer(T, e):
  T.taille = T.taille + 1
  T[T.taille - 1] = e
  tasser_ascendant(T, T.taille - 1)
```,
```python
extraire_max(T):
  m = T[0]
  T[0] = T[T.taille - 1]
  T.taille = T.taille - 1
  tasser_descendant(T ,0)
  renvoyer m
```)

Si on veut des strutures de taille variables il faut utiliser d'autres méthodes d'implémentation.

=== Implémentation à l'aide de tableaux dynamiques

#item("Implémentation")[Une pile][
  peut être implémenté à l'aide d'un tableau dynamique et d'un indice de fin de pile.
]

#item("Implémentation")[Une file][
  peut être implémenté à l'aide d'un tableau dynamique, un indice de début et de fin de file. On veillera, lors du changement de la taille, à corriger l'éventuel cycle dans la structure.
]


#item("Implémentation")[Une file de priorité][
  peut être implémenté à l'aide d'un tableau dynamique, soit en conservant le tableau trié à l'insertion, soit en sélectionnant l'élément de plus grande priorité au défilement.
]

=== Implémentation à l'aide de listes chainées

#item("Implémentation")[Une pile][
  peut être implémenté à l'aide d'une liste chainée. Le sommet de la pile correspond à la tête de la liste.
]

#item("Remarque")[][
  Pour une implémentation immutable, cette pile correspond au type list d'Ocaml.
]

#item("Implémentation")[Une file][
  peut être implémentée à l'aide d'une liste chainée cyclique, et d'un pointeur vers le dernier élément de la liste. Les éléments sont défilés depuis la tête de la liste, et enfilé à la fin de celle-ci.
]

#item("Complexité")[][
  Voici l'ensemble des complexités des implémentations des piles, files et files de priorité.
]

#{
set table.cell(align: center + horizon)
set par(leading: 0.2em)
table(
  columns : 7,
  stroke: (i, j) => {
    if i != 0 and j != 0 and j != 1 { black }
  },
  table.cell(rowspan: 2)[],
  table.vline(),
  table.cell(colspan: 2)[Pile],
  table.vline(),
  table.cell(colspan: 2)[File],
  table.vline(),
  table.cell(colspan: 2)[File de priorité],
  table.vline(),
  [empiler],
  table.vline(),
  [défiler],
  [enfiler],
  table.vline(),
  [défiler],
  [enfiler],
  table.vline(),
  [défiler max],
  table.hline(),
  [Tableau],
  table.hline(),
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(log(n))$],
  [$cal(O)(log(n))$],
  
  [Tableau Dynamique],
  table.hline(),
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(log(n))^*$],
  [$cal(O)(log(n))^*$],
  
  [Liste Chainée],
  table.hline(),
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(n)$],
  [$cal(O)(1)$]
)
}

=== Implémentations croisées

#item("Implémentation")[Deux files][
  permettent d'implémenter une pile. Cependant l'opération défiler est de complexité _amortie_ constante.
]

#item("Implémentation", show-title:false)[Une pile avec deux files][
  Il est possible, mais inintéressant, d'implémenter une pile avec deux files. La complexité de l'opération défiler est alors linéaire.
]

== Application @COR3 @TOR
// TODO PUT THIS BACK ON HEADING
// 

=== Algorithmique


#item("Application")[Un parcours de graphe][
  s'implémentent en utilisant une pile, une file ou une file de priorité.
]

#item("Exemple")[Le parcours en largeur][
  d'un graphe utilise une file.
]

#item("Exemple")[Le parcours en profondeur][
   d'un graphe utilise une pile.
]
#item("Application")[Les algorithmes gloutons][
  , c'est à dire les algorithmes qui à chaque étape choisissent la solution localement optimale, s'appuient souvent sur une file de priorité pour choisir l'option la plus avantageuse.
]
#item("Exemple")[Problème du sac à dos][
  Pour remplir un sac à dos avec des objets de valeur, il est possible de choisir successivement les objets les plus valeureux pouvant être rajoutés. C'est un algorithme glouton qui ne donne pas toujours la solution optimale.
]

#item("Application")[Les algorithmes de plus court chemin][
  comme Dijsktra et A\* utilisent des piles.
]

#item("Application")[Les algorithmes de prim et Kruskal][
  pour le calcul d'un arbre couvrant minimal utilisent une pile.
]

#item("Exemple")[L'algorithme de Graham][
  calcule l'enveloppe convexe d'un ensemble de points non tous alignés. #todo rapport avec pile file ?
]

#item("Application")[][
  
]

#dev[
#item("Application")[Le tri par file de priorité][
  est une méthode de tri en assimilant les priorités et les valeurs des éléments. Selon l'implémentation de la file de priorité, la complexité de ce tri peut être optimale.
]

// #item("Remarque")[L'optimalité d'une file de priorité][
//   est atteinte quand elle permet d'implémenter un tri optimale. On ne peut pas faire une file de priorité en mieux que $cal(O)(#todo)$ pour enfiler et/ou défiler_max.
// ]
]

#item("Définition")[La notation polonaire inverse][
  permet d'écrire des expressions arithmétiques sans paranthèses et sans ambiguïté sur l'ordre des opérations.
]

#item("Application")[L'évaluation d'une formule en notation polonaise inversée][
  se faire à l'aide d'une pile où les nombres et opérations sont dépilés et le résultat empilé.
]

#item("Application")[L'algorithme de la gare de triage][
  permet, à l'aide d'une pile, de transformer des expressions artihmétiques infixes paranthésées en expressions en notation polonaise inverse.
]

=== Application au fonctionnement de l'ordinateur


#item("Application")[La pile d'appel][
  est une partie de l'addressage virtuel d'un processus. Elle est utilisée pour stocké les variables locales et le cadre de pile à chaque appel de fonction.
]

#item("Remarque", show-title: false)[Parcours Graphe Appel récursif][
  *Un parcours de graphe par appel récursif*
  utilise implicitement la pile d'appel comme pile comme que le parcours en largeur.
]

#item("Application")[L'historique des modifications][
  dans un editeur de texte est aussi un exemple de l'utilisation d'une file.
  
]

#item("Application")[Des politiques d'ordonnancement][
  sont utilisés faisant intervenir des piles et files :
  - PEPS consiste en le maintient d'une file de processus.
  - Shortest Job First consiste en le maintient d'une file de priorité de processus en prenant la durée d'éxecution comme priorité.
  - Round Robin est un algorithme d'ordonnancement préemptif qui, comme PEPS, maintient une file de processus, mais qui suspend un processus s'il prend trop de temps et le met au bout de la file.
  - MultiLevel Feedback Queue fonctionne de manière similaire à Round Robin mais avec plusieurs files qui ont toutes des "priorités" différentes. Lorsqu'un processus est interrompu, il est enfilé dans une file de "priorité" infèrieur. Le prochain processus à charger est défilé d'abord dans les files les plus prioritaires. Régulièrement, on remet tous les processus dans la file la plus prioritaire.
]

#dev[
#item("Application")[Différentes politiques de remplacement de cache][
  existent :
  - PEPS consiste en le maintient d'unf file de processus.
  - Shortest Job First consiste en le maintient d'une file de priorité de processus, en prenant la durée d'éxécution comme priorité.
  - LRU (Least Recently Used), on retire l'élément accédé il y a le plus longtemps. Pour ça, on maintiens une file de priorité min, avec comme priorité le temps d'accès.
  - L'implémentation du LRU étant trop couteuse pour des applications bas niveau, on peut l'approximer en ajoutant à une file un "bit d'accès", qu'on met à 1 lorsqu'on accède à l'élément dans le cache. Quand on défile l'élément à retirer, si le bit d'accès est à 1, on le remet dans la file avec un bit d'accès à 0, et on reessaye en défilant l'élément d'après.
]
]





#recap()

===== Remarque

Potentiellement moins séparer application et implémentation.
1. Ce n'est pas pédagogique,
2. Celà crée une énumération ennuyant à l'oral

Potentiellement s'inspirer plus du plan de Pablo et Alexandre.



#bibliography(read("../bib.yaml", encoding: none))

#authors([Axel Stengel & Benjamin Voisin])