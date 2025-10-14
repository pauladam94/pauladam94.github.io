#import "../../deps.typ" : *
#show : tableau

#let todo = text(red, 14pt, [*TODO*])

= Implémentations et Applications des ensembles et dictionnaire

// Les ensembles et dictionnaires sont structures de données très utilisés dont il est important de comprendre leur implémentation. 

== Interface et Implémentations Naïves @SED @TOR

#item("Définition")[Un ensemble][
  est une structure de données abstraite permettant de stocker un rassemblement d'objets distincts.
]

#item("Définition")[Un dictionnaire][
  , ou table d’association est une structure de données abstraite permettant de représenter des associations clé-valeur.
]

#item("Remarque")[Équivalence Ensemble Dictionnaire][
  Un ensemble est un dictionnaire dont les valeurs sont des booléens et un dictionnaire est un ensemble de couple clés valeurs. Dans la suite de la leçon, on se limitera à implémenter des ensembles.
]

#item("Remarque")[][
  On donnera les complexités des implémentations d'ensemble en fonction de "n" le cardinal des ensembles pris en entrée.
]

#item("Définition")[Deux Interfaces d'ensemble @SED[p.489]][

#grid(columns: (50%, 50%), column-gutter: 1em,
```ml
val vide   : ens
val ajoute : ens -> 'a -> ens
val retire : ens -> 'a -> ens
val contient : ens -> 'a -> bool
```,
```ml
val vide   : unit -> ens
val ajoute : ens -> 'a -> unit
val retire : ens -> 'a -> unit
val contient : ens -> 'a -> bool
```
)
]

#item("Remarque")[Une implémentation Mutable ou Immutable @TOR[7.4 p.422]][
  peuvent être proposé pour les ensembles. Le compromis entre mémoire utilisée, performance, facilité d'utilisation sera à prendre en compte.
]



#item("Définition")[Un multi ensemble @TOR][
  est un ensemble qui peut posséder plusieurs fois le même élément. 
]









=== Liste Chainée
#item("Définition")[Une liste Chainée][
  peut décrire un ensemble d'éléments de façon très primitive dont la valeur de chaque chainon est un élément de l'ensemble.
]

#item("Complexité")[][
  Pour savoir si un élément est dedans on va devoir potentiellement parcourir toute la liste donc `ajoute` se fait en $cal(O)(1)$ et `contient` en $cal(O)(n)$. 
]

#item("Exemple")[@SED[p.]][
  ${1, 2, 3, 4, 5}$ peut être réprésenté comme ceci :
  #align(center, canvas(length: 1em, {
    import draw : *
    let i = 1
    for pos in (
      (13, 0),
      (9, 0),
      (5, 0),
      (17, 0),
      (1, 0)
    ) {
      rect(pos, (rel: (1, 1)), name: str(i))
      i += 1
    }
    for i in range(1, 6) {
      content(str(i), [#i])
    }
    set-style(mark: (end: ">"))
    line("5", "3")
    line("3", "2")
    line("2", "1")
    line("1", "4")
  }))
]


=== Tableau Trié
#item("Définition")[Un tableau trié][
  sans doublons est une manière simple d'implémenter un ensemble qui permet une recherche logarithmique par dichotomie.
]

#item("Complexité")[][
  `ajoute` en $cal(O)(n)$, `contient` en $cal(O)(log(n))$
]


== Implémentations classiques @SED

=== Arbre binaire de recherche

#let ens_etiquettes = item("Définition")[Un Ensemble d'étiquettes][
  $"Ens"$ d'un arbre binaire peut être défini par induction comme :
- $"Ens"(#text(`Vide`)) = emptyset$
- $"Ens"(#text[`N(g, e, d)`]) = {#text[`e`]} union "Ens"(#text(`g`)) union "Ens"(#text(`d`))$
]

#let abr_def = item("Définition")[Un Arbre binaire de recherche][
  (ABR) est un arbre binaire où, l'étiquette `e` de chaque noeud `N(g, e, d)` est plus grande que n'importe quel élément de $"Ens"(#text(`g`))$ et plus petite que n'importe quel élément de $"Ens"(#text(`d`))$.
]

#let abr_cor = align(center, image("abr_cormen.png", width: 70pt))
#let abr_cor2 = align(center, image("abr_cormen2.png", width: 70pt))

#grid(columns: (80%, 20%), column-gutter: 0.5em, row-gutter: 1em,
  ens_etiquettes,
  grid.cell(rowspan: 2, item("Exemple")[@COR3[12.1]][
      #abr_cor
      #abr_cor2
  ]),
  abr_def,
)

#item("Implémentation")[][
  On peut implémenter un ABR de manière mutable et non-mutable. Dans le premier cas, les opérations d’insertion et de suppression effectuent des modifications en place. Dans le second cas, elles renvoient donc un nouvel ensemble. #todo "Remarque sur -ensemble-" ?
]

/*
#item("Exemple")[@SED[p.397]][
  #graph((
    radius: 0.6em,
    nodes: (
      ("1", (10, 10)),
      ("2", (9, 9))
    ),
    links: (
      ("1", "2"),
    )
  ))
]
*/


#item("Complexité")[][
  Pour un ABR de hauteur h, la recherche, l’insertion et la suppression se font en $cal(O)(h)$. Si l’arbre est équilibré, on a donc des complexités en $cal(O)(log n)$ ; cependant, dans le pire cas, on reste en $cal(O)(n)$.
]

#item("Application")[Les `Set` en OCaml][sont implémentés par des arbres binaires équilibrés. En particulier ils utilisent des AVL relachés.
]

#item("Propriété")[][
Avec cette implémentation, on dispose des opérations `min` et `max` en $cal(O)(h)$ et on peut itérer sur l'ensemble en $cal(O)(n)$ au total.
]

#item("Définition")[Un Arbre bicolore][
  (ou arbre rouge-noir) est un ABR dont
  les nœuds sont colorés rouge ou noir, satisfaisant :
  - chaque nœud est soit rouge, soit noir
  - la racine et les feuilles (`Vide`) sont noires
  - les enfants d’un nœud rouge sont noirs
  - le chemin de la racine à n’importe quelle feuille contient toujours le même nombre de nœuds noirs. On appelle ce nombre la hauteur noire.
]

#item("Propriété")[][
  Pour un arbre rouge-noir à n noeuds, de hauteur h, on a : $h ≤ 2 log_2(n + 1) $. 
  Les opérations de recherche sont donc en $cal(O)(log n)$.
]

#item("Propriété")[][
  On peut implémenter les opérations d’insertion et de suppression dans un arbre rouge-noir en $cal(O)(log n)$.
]

#item("Application")[L'Algorithme d'ordonnancement de Linux][
  utilise un arbre rouge-noir dans l'algorithme CFS d'ordonnancement des processus.
]

=== Table de Hachage
#item("Définition")[Une table de Hachage][
  par chaînage est un tableau de listes chaînées contenant des couples clé/valeur, muni d’une fonction de hachage associant à chaque clé une alvéole (cellule) du tableau.
]

#grid(columns: (70%, 30%), column-gutter: 0.5em,
  item("Exemple")[@SED][
    On considère des chaînes de caractères comme clés, et on prend h(w) = |w| % 7 comme fonction de hash. La table de hachage ci-contre ne contient que des clés, elle représente donc l’ensemble `{"", "we like", "the codes", "in", "ocaml"}`.
  ],
  [
    #image("table_hachage_ex.png", width: 125pt)
  ]
)

#item("Implémentation")[Mutabilité][
  La structure de tableau est mutable, rendant ces ensemble mutables. Les opérations d’insertion et de suppression agissent en place.
]




#item("Définition")[Les collisions][
  interviennent dans une table de hachage si deux éléments différents ont la même valeur de hache. Dans ce cas la recherche dans la table prendra d'autant plus de temps qu'il y a de collisions.
]

#item("Remarque")[Les fonctions de hachages][
   ne se font pas en $cal(O)(1)$ pour des entrées de taille quelconques. En pratique nos entrées sont bornées et nos fonctions de hachage sont très rapides donc considérés comme fait en temps constant.
]

#item("Application")[][
  Une table de hachage est une structure très utile et flexible utilisée pour implémenter le type `Hashtbl` OCaml ou encore le type `dict` Python.
]

#item("Application")[Les matrices éparses][
contenant majoritairement des $0$. Elles peuvent être représenter par l'ensemble des valeurs non nulles permet de s'éviter la majeure partie des calculs lors qu'une multiplication par exemple.
]

#item("Définition")[Un hachage parfait][
  est une fonction de hachage qui ne provoque pas de collisions (accès en $cal(O)(1)$ dans le pire cas). Elle nécessite cependant, au préalable, l'ensemble des éléments susceptibles d'être hashés. 
]

#item("Complexité")[][
  Si la fonction de hachage `h` a un coût constant, alors la recherche, l’insertion et la suppression sont en $cal(O)(k)$ avec k le nombre maximal de collisions dans la table. Si h permet de borner k par une constante, on a donc un coût en $cal(O)(1)$.
]

== Implémentations particulière

=== Probabilité sur les éléments
#item("Idée")[][
  Même avec un ABR équilibré, si certains noeuds sont plus utilisés que d'autres alors un arbre adapté à l'utilisation de chaque élément pourrait être plus rapide.
]

#dev[
#item("Définition")[ABR Optimaux @COR3][
  En connaissant la probabilité de requête de chaque élément, on peut construire un ABR optimal, qui aura un coût en $cal(O)(log n)$
pour la recherche.
]
]

#item("Application")[Un serveur DNS][
  répond à de nombreuses requêtes sont faites avec assez peu de modification sur l'espace des addresses. On pourrait construire un ABR optimal en approximant les probabilités de chaque demande à sa fréquence. 
]

=== Sous structure commune @OCA[11.4]

#dev[
#item("Idée")[][
  Certains éléments d'un ensemble peuvent contenir des sous structures égales. On va pouvoir réutiliser ses sous structures communes pour limiter notre empreinte mémoire et potentiellement mémoïser des calculs.
]

#item("Définition")[Le partage maximal][
  (Hash Concing) est une technique consistant à mémoïser les fonctions de créations d'ensembles. Cette méthode souvent utilisés dans des languages fonctionnels permet de limiter la mémoire utilisés.
]
]

=== Partition d'ensembles @COR3

#item("Idée")[][
  Si on travaille sur un ensemble global que l'on souhaite partionner, on peut simplement relier un élément à son parent. En remonttant la chaine de parent on trouve le représentant d'une des partitions de l'ensemble. 
]
#dev[
#item("Définition")[La structure Unir et Trouver][
   (Union-Find) permet de travailler sur les partitions d’un ensemble. Elle dispose des opérations Unir, qui fait l’union de deux sous-ensembles et Trouver qui trouve le représentant d’un élément.
]
]

#item("Implémentation")[][
  On implémente classiquement cette structure avec une forêt dont les arbres correspondent aux ensembles disjoints. Une telle forêt peut être représentée par un tableau de parenté.
]

#item("Remarque")[Union par rang :][
   Lors de l’union, on choisit la racine parmi deux candidats de façon à limiter la hauteur maximale. Unir et Trouver sont alors de complexité $cal(O)(log(n))$ dans le pire cas.
]

#item("Implémentation")[La compression de chemin][
    est un mécanisme effectué lorsqu’on trouve un « raccourci vers la racine », on peut remplacer le parent. La complexité amortie devient alors quasi-constante. On atteint alors une complexité amortie en $cal(O)(log*(n))$ (Admis).
]

#item("Application")[][
  L’algorithme de Kruskal utilise la structure Unir et Trouver pour construire itérativement un arbre couvrant minimal. Cette algorithme manipule une partition des noeuds d'un graphe d'où l'interêt de la structure.
]

=== Ensembles de mots @TOR[7.3.5]

#item("Idée")[][
  On range de façon naturelle les mots par rapport à leur première lettre dans un dictionnaire. On peut implémenter un ensemble de mots avec un arbre qui parcoure les lettres au fur et à mesure.
]

#let item_1 = item("Définition")[Un Arbre Préfixe][est un arbre dont chaque branche est étiquetée par une lettre et chaque nœud contient une valeur si la séquence de lettres menant de la racine à ce nœud est une entrée.
]

#let item_0 = item("Exemple")[@TOR[p412]][
  #align(center, image(width: 100pt, "image.png"))
]


#let item_2 = item("Implémentation")[Recherche/Ajout d'une clef s][
La recherche consiste à
descendre dans l’arbre en suivant les lettres de l'entrée `s`.
]
#let item_3 = item("Complexité")[][Les opérations de recherche et d'ajout ont une complexité en $cal(O)(|s|)$ la longueur de la clef `s`] 

#grid(columns: (80%, 18%), column-gutter: 1em, row-gutter: 1em,
  item_1,
  grid.cell(rowspan: 3, item_0),
  item_2,
  item_3
)

#item("Application")[][
  Les arbres préfixes sont utilisés dans l'autocomplétion, mais aussi en bio-informatique notamment pour implémenter des anti-dictionnaires.
]

#recap()

/*
/ PREM : 2 Intro, 2C, 3C,
/ PREPA : 4B, 7D, 11C
*/

===== Dans le programmes
- Arbre Bicolore
- Arbre binaire de recherche

===== Remarque
Idée à faire passer aux élèves
- Distinction Interface implémentation
- Mutable Immutable
- Les AVL ont été enlevé pour développer les arbres rouge-noir car ils sont au programme. #emoji.warning Attention à bien connaitre les optimisations possibles des arbres rouges noir (insertion et suppression en $log(n)$).

===== Questions
- Algorithme où on peut utiliser un multi-ensemble : tri comptage.
- Decrire les opérations d'optimisations d'un arbre bicolore.

#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Paul Adam - Alexis Hamon
]