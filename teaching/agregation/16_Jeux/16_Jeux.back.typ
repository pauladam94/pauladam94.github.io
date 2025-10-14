#import "../../utils/tableau.typ" : tableau, dev, recap, item
#import "@preview/cetz:0.3.1" : *
#show : tableau

= Algorithmes pour l'étude des jeux. Exemples et applications

L'étude des jeux fourni une application concrète des graphes et algorithmes associés, ainsi qu'une introduction à des notions d'heuristiques, en plus d'introduire la théorie des jeux, notion centrale dans certaines domaines de l'informatique.

== Définitions
#item("Définition")[][Un *jeu* est représenté par :
- un ensemble fini de _joueurs_ $J subset NN$.
- un ensemble d'_actions_ pour chaque joueur $A_i, i in J$. On note $A = union.big_i A_i$
- un ensemble d'_états_ $E$.
- une fonction de _transition_ $s : E times A -> E$
- ene fonction de _récompense_ $r_i : E -> RR$ pour chaque joueur.
]

#item("Classification")[][On peut classer les jeux selon plusieurs critères, comme le nombre de joueurs, l'information accessible à ceux-ci...
#table(
  columns: 3, rows: 3,
  [], [*1 joueur*], [*2 joueurs*],
  [*Séquentiel*], [Rubik's Cube, Taquin, Sudoku], [Tic-Tac-Toe, Échecs, Go],
  [*Simultané*], [], [Chifoumi, #linebreak()Dilemne du prisonnier],
)
]

== Jeux séquentiels à un joueur
#item("Remarque")[][Les jeux séquentiels à un joueur sont également appelés *puzzles*. Le "but" du jeu est alors d'atteindre un état $F in E$ tel que $r_0(F) = 1$, un état *gagnant*.]

#item("Définition")[][Un *problème de recherche* à partir d'états initiaux $I subset.eq E$ et d'états finaux $F subset.eq E$ est une relation binaire $cal(R) subset.eq I times F$.]

#item("Définition")[][Un *algorithme résolvant le problème de recherche* $cal(R)$ est un algorithme qui pour tout état initial $i in I$ renvoie un état final $f in F$ si $cal(R)(i, f)$.]

#item("Définition")[][Un *jeu séquentiel à un joueur* est un problème de recherche $cal(R)$ dont les états initiaux sont $E$ l'ensemble des états et les états finaux sont $F$ les positions gagnantes.]

#item("Exemple")[][Le *taquin* est un jeu à un joueur. Ses états sont des matrices contenant la position des tuiles numérotés, les actions sont des déplacements de tuile vers un emplacement vide, et il possède un unique état gagnant.
#grid(
  columns: (50%, 50%),
  align: center,
  [
    #align(center, table(
      columns: 3,
      rows: 3,
      [1], [2], [3],
      [4], [5], [],
      [7], [8], [6]
    ))
    État avec 3 coups possibles
  ],
  [
    #align(center, table(
      columns: 3,
      rows: 3,
      [1], [2], [3],
      [4], [5], [6],
      [7], [8], []
    ))
    État gagnant
  ]
)]

#item("Représentation")[][Un jeu peut-être représenté comme un *graphe étiqueté* $G = (S, A)$ où $S = E$ (les sommets sont les états du jeu) et $A = { (e_1, a, e_2) | e_1, e_2 in E, a in A, s(e_1, a) = e_2 }$ sont les arrêtes associant un état $e_1$ à un état $e_2$ s'il existe une action $a$ permettant de passer de $e_1$ à $e_2$.]

#item("Algorithme")[][Un *parcours en profondeur* sur le graphe créé ainsi permet de résourdre le problème de recherche d'un état gagnant.]

#item("Remarque")[][En pratique, le nombre d'états rends l'utilisation d'un parcours de profondeur *intractable*, cet algorithme ne peut s'éxécuter en temps raisonnable sur la majorité des jeux.]

#dev[
  #item("Algorithme")[][L'algorithme *$A^*$* permet d'utiliser une _heuristique_ pour guider le parcours du graphe.]
  #item("Définition")[][Une heuristique est *admissible* si lorsqu'il existe une chemin de $u$ à $v$ de longueur $d$ dans un graphe $G$, alors $h(u) <= d$.]
  #item("Définition")[][Une heuristique est *monotone* si pour toute arrête $(u, v)$ on a l'inégalité $h(u) <= h(v) + d(u, v)$.]
]

#item("Exemple")[][Pour le taquin, la somme des distances de Moore $L_i$ entre la position des tuiles dans un état et la position des tuiles dans l'état gagnant est une heuristique admissible.]

#item("Définition")[La Garbage Collection][
  
  $infinity = 15$
]

== Jeux séquentiels à deux joueurs

== Jeux simultanés


#pagebreak()
#recap()
#bibliography(read("../bib.yaml", encoding: none))