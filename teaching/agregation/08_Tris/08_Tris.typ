#import "../../deps.typ" : *
#show : tableau

= Algorithmes de Tri. Exemples, Compléxités et Applications

/ Motivations : Les tris offrent une bonne introduction à l'algorithme et l'analyse de complexité. Certains algorithmes exploitent plus efficacement des données triés.

/ Point Historique : @CERV 

== Introduction au tri @COR2
=== Définitions
#item("Def")[Problème de Tri][
  #underline[Entrée] : suite de nombres $<a_1, ..., a_n>$. #underline[Sortie] : Permutation (réorganisation) $<a_sigma(1),  ... , a_sigma(n)>$ de la suite donnée en entrée telle que $a_sigma(1) <= ... <= a_sigma(n)$.
]

#item("Exemple", show-title:false)[Un tri d'une liste][
  $ <42_1, 41_2, 1_3, 2_4, 1_5>  -> <1_5, 1_3, 2_4, 41_2, 42_1>$ 
]

#item("Définition")[Un tri est en place][
   s'il n'utilise qu'une quantité constante de mémoire (mis à part pour l'entrée).
]

#item("Définition")[Un tri est stable][
   si $forall i < j, a_i <= a_j => sigma(i) <= sigma(j)$
]

#item("Exemple")[][
  L'algorithme utilisé pour l'exemple 2 n'est _pas_ stable.
]

#item("Définition", show-title:false)[Tri externe][
  Parfois, la taille de l'entrée à trier peut excéder la taille de la mémoire directement accessible. On parle alors de tri *externe*. Sinon on parle de tri *interne*.
]

#item("Définition")[Un tri est dit _par comparaisons_][
   s'il détermine la sortie en comparant les éléments en entrée.
]

=== Outils pour l'analyse de complexité.

#item("Idée")[][
  Nous allons utiliser la complexité asymptotique dans le pire cas afin de comparer les algorithmes de tri entre eux.
]

#item("Notation")[Notations de Landau][
  Soient f, g deux fonctions. On note:
- $f = O(g) "si" exists N, c in RR_+, forall x > N, |f(x)| <= c |g(x)|$
- $f = Omega(g) "si" exists N, c in RR_+^*, forall x > N, |f(x)| >= c |g(x)|$
- $f = Theta(g) "si" f = O(g) "et" g = O(f)$
]

#item("Théorème")[Theorème Maitre.][
  Pour la relation, $T(1) = O(1)$ et $forall n in NN, T(n) = a T(n/b) + O(n^c)$ avec $c = log_b (a)$, on a $T(n) = O(n^c log(n))$.
]

== Algorithmes de tris @COR2

=== Tris par comparaisons
#item("Idée")[][
  S'inspirer d'un tri d'un main de cartes.  
]

#grid(
  columns: (53%, 1fr),
  column-gutter: 1em,
  row-gutter: 1em,
  grid.cell(rowspan: 2,
    item("Algo")[Tri par Insertion][
```py
TRI_INSERTION(T):
(*)POUR j = 1 à |T| - 1:
     clé = T[j]
     i = j - 1
     TANT QUE i >= 0 et T[i] > clé:
         T[i + 1] = T[i]
         i = i - 1
     T[i + 1] = clé
```
    ]
  ),
  item("Complexité")[][
    $O(n^2)$ dans le pire cas ($n = |T|$ la taille du tableau à trier).
  ],
  item("Propriété")[][
  Ce tri est stable et en place.
  ]
)

#item("Invariant")[][
  Après le tour de boucle `(*)POUR`, `T[0 ... k]` est trié. 
]

#item("Remarque")[][
  Il est également possible dde définir un algorithme qui choisit itérativement  le plus petit des élèments non selectionnés et construit ainsi un tableau de sortie. c'est le *tri par selection*.
]

#item("Complexité")[][
  La complexité du tri par selection est de $O(n^2)$
]

#item("Idée")[][
  Utiliser l'approche "diviser pour régner".
]

#item("Algorithme")[Tri Fusion][
  #grid(columns: (50%, 50%),
```py
TRI_FUSION(T, p, r):
  SI p < r:
    q = floor(p + r / 2)
    TRI_FUSION(T, p, q)
    TRI_FUSION(T, q + 1, r)
    FUSION(T, p, q, r)
```,
```py
FUSION(T, p, q, r):
  L, R = copie(T[p:q], T[q+1:r])
  Ajouter +inf à L et R
  i = j = 1
  POUR k = p à r:
    SI L[i] <= R[j]:
      T[k] = L[i]; i += 1
    SINON: T[k] = R[j]; j += 1
```
  )
]

#let item_20 = item("Complexité")[][ $O(n log(n))$ ]

#let item_21 = item("Propriété")[][
  Le tri fusion est stable mais _pas_ en place !
]

#let item_22 = item("Exemple")[][
#canvas(length: 0.8em, {
  import draw: *
  rect((0, 0), (rel: (1, 4)))
  content((0.5, 0.5), [1])
  content((0.5, 1.5), [3])
  content((0.5, 2.5), [2])
  content((0.5, 3.5), [4])

  line((1, 2.5), (3, 3.5))
  line((1, 1.5), (3, 0.5))
  rect((3, -0.5), (rel: (1, 2)))
  content((3.5, 0), [1])
  content((3.5, 1), [3])
  
  rect((3, 2.5), (rel: (1, 2)))
  content((3.5, 3), [2])
  content((3.5, 4), [4])

  line((4, 4), (5, 4))
  line((4, 3), (5, 3))

  line((4, 1), (5, 1))
  line((4, 0), (5, 0))

  rect((5, 0.75), (rel: (1, 1)))
  content((5.5, 1.25), [3])  
  rect((5, -0.5), (rel: (1, 1)))
  content((5.5, 2.75), [2])
  rect((5, 3.75), (rel: (1, 1)))
  content((5.5, 4.25), [4])
  rect((5, 2.25), (rel: (1, 1)))
  content((5.5, 0.), [1])

  decorations.brace((6.5, 4.75), (6.5, 2.25))
  decorations.brace((6.5, 1.75), (6.5, -0.5))

  rect((7.5, -0.5), (rel: (1, 2)))
  content((8, 0), [3])
  content((8, 1), [1])
  
  rect((7.5, 2.5), (rel: (1, 2)))
  content((8, 3), [4])
  content((8, 4), [2])

  decorations.brace((9, 4.5), (9, -0.5))
  rect((10, 0), (rel: (1, 4)))
  content((10.5, 0.5), [4])
  content((10.5, 1.5), [3])
  content((10.5, 2.5), [2])
  content((10.5, 3.5), [1])

})
]

#grid(
  columns : (50%, 50%),
  row-gutter: 2em,
  column-gutter: 2em,
  item_20,
  grid.cell(rowspan: 2, item_22),
  item_21,
  
)

#colbreak()

#dev[
#item("Algorithme")[Le Tri Rapide][
  choisit un pivot, qu'il place entre les élèment plus petits que le pivot triés récursivement et les élèments plus grands que le pivot triés récursivement.
]

#item("Complexité")[][
  $O(n^2)$ au pire cas mais $O(n log(n))$ en moyenne.
]

]



#item("Propriété")[][
  Ce tri est en place, mais non stable.
]

=== Tris utilisant une structure de données

#item("Définition")[Un tas max][
  est un arbre binaire quasi-complet tel que la valeur de tout noeud est plus petite que celle de sont père.
]

#item("Algorithme")[Le tri par Tas][
  construit un tas max, puis extrait itérativement l'élèment le plus grand du tas.
]

#item("Complexité")[][ $O(n log(n))$ ]

#item("Propriété")[][
  Ce tri est en place mais non stable.
]

#item("Remarque")[][
  Il est également possible de faire un *tri par ABR* dans lequel on insère un à un les éléments dans l'ABR, on fait ensuite un parcours infixe en profondeur.
]

#item("Remarque")[][
  Tout tri par comparaisons exige $Omega(n log(n))$ comparaisons dans le pire cas.
]

#item("Remarque")[][
  Même si contrairement au tri fusion et au tri par tas, le tri rapide n'est pas *optimal*, il reste très efficace en pratique d'où son nom.
]

#item("Remarque")[][
  Il est possible de rendre un tri stable en indexant chaque élèment par son indice dans le tableau $a_i -> (a_i, i)$ et en utilisant un ordre lexicographique.
]

#item("Remarque")[][
  Le tri par insertion est en générale très efficace sur de petites entrées,
  ou quand l'entrée est déjà triée.
]

#colbreak()
=== Tri Linéaires

#item("Idée")[][
  Si on sait que tous les éléments du tableau sont des entiers plus petits que $k in NN$, alors on peut utiliser cette hypothèse pour faire un tri qui n'est pas par comparaisons.
]

#let item_36 = item("Algo")[Tri Comptage][
```python
TRI_COMPTAGE(A, B, k):
  C[0 ... k] = [0 ... 0]
  POUR j = 0 à |A| - 1:
    C[A[j]] += 1
  POUR i = 1 à k:
    C[i] += C[i - 1]
  POUR j = |A| - 1 à 0:
    B[C[A[j]]] = A[j]
    C[A[j]] -= 1
```
]

#let item_37 = item("Complexité")[][ $O(n + k)$ ]

#let item_38 = item("Propriété")[][
  Le tri n'est pas en place mais est stable.
  
]
#grid(columns: (40%, 40%), column-gutter: 2em,  row-gutter: 1em,
  grid.cell(rowspan: 2, item_36),
  item_37,
  item_38,
)

#let item_0 = item("Application", show-title:false)[Tri par base][
  On peut utiliser ce tri pour définir le *tri par base* :
```py
TRI_BASE(A, d):
  POUR i = 1 à d:
    TRI_COMPTAGE(A) 
    selon le i° chiffre
```
]

#let item_1 = item("Exemple")[][
#canvas(length: 1em, {
  import draw: *
  let mat(l, x, y) = {
    for i in range(l.len()) {
      content(
        (x + calc.rem(i, 3), y - calc.div-euclid(i, 3)),
        [#l.at(i)]
      )
    }
  }

  rect((1.5, -2.75), (rel: (1, 3.5)), stroke: (dash: "dashed", thickness: 1pt))
  mat((3, 5, 6, 1, 2, 7, 2, 5, 6), 0, 0)
  content((3, -1), $->$)

  rect((4.5, -2.75), (rel: (1, 3.5)), stroke: (dash: "dashed", thickness: 1pt))
  mat((3, 5, 6, 2, 5, 6, 1, 2, 7), 4, 0)
  content((7, -1), $->$)

  rect((7.5, -2.75), (rel: (1, 3.5)), stroke: (dash: "dashed", thickness: 1pt))
  mat((1, 2, 7, 3, 5, 6, 2, 5, 6), 8, 0)
  content((11, -1), $->$)

  mat((1, 2, 7, 2, 5, 6, 3, 5, 6), 12, 0)
  
})
]

#grid(columns: (40%, 50%), column-gutter: 2em,
  item_0, item_1
)

#item("Complexité")[][ $O(d * (n + k))$ ] 

== Applications des tris @COR2

#item("Application", show-title:false)[Recherche Dichotomique][
  Un tableau trié permet la *recherche Dichotomique* d'un élément en  $O(log(n))$.
]

#item("Exemple")[][
  #box(baseline: 0.5em, canvas(length: 1em, {
  import draw: *
  content((-2, 0.5), [42 ?])
  rect((0, 0), (rel: (7, 1)))
  content((0.5, 0.5), [1])
  line((1, 0), (1, 1))
  content((1.5, 0.5), [2])
  line((2, 0), (2, 1))
  content((2.5, 0.5), [3])
  line((3, 0), (3, 1))
  content((3.5, 0.5), [4])
  line((4, 0), (4, 1))
  content((4.65, 0.5), [42])
  line((5.25, 0), (5.25, 1))
  content((6.25, 0.5), [100])

  content((8, 0.5), $->$)

  rect((9, 0), (rel: (4, 1)))
  content((9.5, 0.5), [4])
  line((10, 0), (10, 1))
  content((10.6, 0.5), [42])
  line((11.25, 0), (11.25, 1))
  content((12.15, 0.5), [100])

  content((14, 0.5), $->$)
  rect((15, 0), (rel: (1, 1)))
  content((15.5, 0.5), [42])
  content((17, 0.5), text(green, [#emoji.checkmark]))

  line((0, -0.25), (3, -0.25), stroke: red)
  line((3.25, -0.25), (6.75, -0.25), stroke: green)
  line((10, -0.25), (11.25, -0.25), stroke: green)

  
}))
]

#item("Application", show-title:false)[Tri par insertion dichotomique][
  Sur le même principe, une *insertion dichotomique*
  dans une structure adaptée
  permet de définir un *tri par insertion dichotomique* en $O(n log(n))$.
]

#colbreak()

#item("Application")[La recherche ou élimination de doublons][
   On trie d'abord puis on parcourt en comparant les éléments adjacents. Ceci se fait en $O(n log(n))$ contre $O(n^2)$ pour l'approche naïve.
]


=== Algorithme Gloutons

#item("Application")[L'Algorithme de Kruskal][
  trouve un arbre couvrant de poids minimum en parcourant les arêtes triées par poids croissants.
]

#let item_0 = item("Application", show-title:false)[Sac à dos, emploi du temps][
  D'autres algos gloutons requiert de trier les entrées selon une métrique : Problème du sac à dos, Problème d'emploi du temps.
]

#let item_1 = item("Exemple")[Une exécution de l'algorithme de Kruskal][]

#grid(columns: (50%, 40%), column-gutter: 2em, 
  item_0, item_1)

=== Parcours Intelligents

#let item_0 = item("Application")[Parcours de Graham @COR3[p.1031]][
  En triant d'abord les points par rapport à leur angle avec le point le plus bas $O(n log(n))$, le parcours de Graham peut ensuite calculer l'enveloppe convexe de l'ensemble de ces points avec une pile en $O(n log(n))$.
]

#let item_1 = item("Exemple")[Une étape de l'algorithme de Graham][
#canvas({
  import draw: *
  let r = 0.05em
  circle((0, 0), radius: r)
})
]
#grid(columns: (50%, 40%), column-gutter: 2em, item_0, item_1)

#let item_0 = item("Application")[Tri topologique][
  Pour faire le tri topologique d'un graphe G (c'est à dire ordonner les sommets selon un ordre total compatible avec l'ordre partiel induit par les arcs de G) on peut parcourir G en profondeur et ordonner les sommets par dates décroissantes de fermeture.
]

#let item_1 = item("Exemple")[Un tri topologique par parcours en profondeur][
  
]

#grid(columns : (50%, 40%), column-gutter: 2em, item_0, item_1)

#colbreak()
== Réseaux de tris @COR2[p.681]

#item("Idée")[Paralléliser des comparaisons !][ ]

#item("Définition")[Un comparateur][
  est une brique de base d'un réseau de tri, comparant et ordonnant deux valeurs (fils).
  // Comme fil éléctrique, pas comme enfant.
]

#item("Exemple")[Deux comparateurs][]

#item("Def")[Un réseau de comparaison][
  est un ensemble de n fils sur lesquels on a placé des comparateurs.
]

#item("Définition", show-title:false)[Un réseau de tri][
  On dit que c'est un *réseau de tri* lorsque peu importe les entrées, les valeurs sur les fils de sortie sont triées.
]

#item("Exemple")[Même réseau de tri pour un tri par selection ou insertion][

#canvas(length: 1em, {
  import draw: *
  line((0, 0), (rel: (8, 0)))
  line((0, 1), (rel: (8, 0)))
  line((0, 2), (rel: (8, 0)))
  line((0, 3), (rel: (8, 0)))

  content((4, -1), [Tri par insertion])

  line((10, 0), (rel: (8, 0)))
  line((10, 1), (rel: (8, 0)))
  line((10, 2), (rel: (8, 0)))
  line((10, 3), (rel: (8, 0)))
  content((14, -1), [Même réseau de tri])

  line((20, 0), (rel: (8, 0)))
  line((20, 1), (rel: (8, 0)))
  line((20, 2), (rel: (8, 0)))
  line((20, 3), (rel: (8, 0)))
  content((24, -1), [Tri par selection])
})  
]

#item("Théorème")[Le principe de zéro-un][
  stipule que si un réseau de tri fonctionne pour toure entrée à valeurs dans ${0, 1}$, alors il fonctionne pour tour entrée.
]

#item("Corollaire")[][
  Pour savoir si on a un réseau de tri,
  on a donc seulement $2^n << O(n!)$ entrées à tester !
]

#item("Application")[][
  (Admis) Grâce à une trieuse bitonique et un réseau de fusion, on peut trier n nombres avec un réseau de tri de profondeur $O(log^2(n))$
]

#item("Application")["La machine humaine à trier"][
  est une activité d'*informatique débranché* basée sur les réseaux de tri.
]

#recap()

===== Remarque
- toutes présentations d'un algorithme de tris est un développements


#bibliography(read("../bib.yaml", encoding: none))
#align(bottom + center)[Pablo Espana Gutierrez]