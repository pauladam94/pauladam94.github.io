#import "../../deps.typ" : *
#show : tableau

= Algorithmes pour l'étude des jeux. Exemples et applications


== Jeux à un joueur @BAR[11.5.1]

=== Formalisation d'un jeu

#item("Formalisation")[Jeu][
On formalise un jeu sous forme d'un graphe $G = (S, A)$, les états représentant les conﬁgurations possibles
du problème, et les arêtes, les actions possibles permettant de passer d’un état à l’autre.
]

#item("Formalisation")[Résolution][
La résolution d'un tel jeu consiste alors à trouver un chemin dans ce graphe partant d'un état initial à l'un des états finaux.
]

#item("Exemple")[Jeu de Taquin][
#grid(
  columns:(80%, 20%),
  [
    Un des exemples les plus simples et caractéristiques est le jeu du taquin. Il s’agit d’un jeu à un
joueur en forme de damier, composé de 15 carreaux numérotés de 1 à 15 (ou représentant des
morceaux d’une image), glissant dans un carré de $4 times 4$ cases. L’objectif est de remettre les nombres dans
le bon ordre. 
  ],
    align(center, [
#image("taquin_melange.png", width: 65%)
#image("taquin_resolu.png", width: 65%)    
  ]),
)

]


#item("Définition")[@NAN Puzzle][
Un tel jeu à un joueur est appelé puzzle.
]

#item("Remarque")[Explosion][
Si il est possible d'énumérer toutes les parties possibles, cela résulte en une explosion combinatoire et n'est pas utilisé en pratique.
]

=== L'algorithme A\* @BAR[11.5.2]

/*
Cette partie ne rentre pas tout à fait dans notre définition de jeu à 1 joueur.
TODO ? : Élargir la définition ?
*/

#item("Définition")[L'algorithme A\*][
est une variation de l'algorithme de Dijkstra où la recherche est guidée par une fonction heuristique.
]

#item("Exemple")[Cercles concentriques Dijkstra vs A\*][
#grid(
  columns:(50%, 50%),
   align(center, image("cons_0.png", width: 60%)),
   align(center, image("cons_1.png", width: 80%))
)
]

#item("Définition", show-title:false)[Heuristique pour A\*][
  On appelle *heuristique pour l'algorithme A\**
  toute  fonction $h : S -> RR$ qui pour chaque sommet $s in S$ estime la taille du meilleur chemin entre $s$ et $s_f$.
]

#item("Définition")[Une heuristique est admissible][
si pour tout sommet $s$ du graphe d’état, $h(s)$ est une borne inférieure de la plus courte distance séparant $s$ de $s_f$.
]

#item("Définition")[Une heuristique est consistante][
si pour tout arc $s -> p$ du graphe d’état, $h(s) <= h(p) + C (s -> p)$
]

#item("Définition")[Une heuristique est monotone][
si l’estimation du coût total d’un chemin ne décroît pas lors du passage d’un sommet à ses successeurs : étant donné un chemin $s_0 -> dots -> s_n$ on a pour tout $0 <= i < j <= n, f(s_j) ≥ f (s_i)$.
]

#item("Exemple", show-title:false)[Heuristique pour le Taquin][
Pour le jeu du taquin, on peut par exemple penser aux heuristiques suivantes :
- nombre de chiffres mal placés,
- somme des distances L1 (ou Manhattan) des cases à leur position souhaitée.
]

 === Réduction à SAT

#item("Remarque")[@NAN][
Une méthode alternative pour résoudre un puzzle dans NP est de le réduire à SAT et d'utiliser un logiciel de résolution de formule SAT comme `bitwuzla` ou encore `z3`.
]

#dev[
@TOR[p1031]
#item("Exemple")[Le puzzle du Sudoku][]

#item("Réduction")[Sudoku à SAT][]

#item("Algorithme")[DPLL][]
]

== Jeux à deux joueurs @TOR[9.7.2]

=== Définitions 

==== Motivation @BAR[11.4]

#item("Définition")[Un jeu à information complète][
est un jeu lors duquel les deux joueurs connaissent toutes les informations du jeu.
]

#item("Définition")[Un jeu à coups asynchrone][
est un jeu ou chaque joueur joue alternativement.  
]

#item("Motivation")[][
Derrière ces notions se cachent de nombreux jeux de
 plateau, comme les échecs, le go, le morpion, puissance 4,...
]

==== Formalisation @TOR[9.7.2]

#item("Définition")[Un jeu à deux joueurs][
   est un graphe orienté biparti $G = (S_0 union.plus S_1, A)$.
   Les sommets de $S_0$ représentent les états contrôlés par le joueur 0,
   et ceux de $S_1$ les états contrôlés par le joueur 1.
   Un arc $(x -> y) in A$ représente un coup possible.
   Un état, $s_("init") in (S_0 union.plus S_1) $, est désigné comme l'état initial.
]

#item("Exemple")[Le graphe modélisant le morpion][
contient 5478 états et 16167 arcs. Il s’agit
d’un graphe orienté acyclique. 
//#image("image.png", width: 20%)
]
#item("Définition")[Un état terminal][
 est un sommet sans arc sortant.

]

#item("Cas particuliers", show-title:false)[Jeux d'accessibilité et jeux à somme nulle][
  On considérera deux types de jeux:
  - dans les *jeux d'accessibilité* l'ensemble des états finaux est partitionné en $W_0$ l'ensemble des 
    états faisant gagner le joueur $0$, $W_1$ l'ensemble des états faisant gagner le joueur $1$ et $W_N$ l'ensemble des 
    états pour lesquels il y a un match nul.
  - dans les *jeux à somme nulle*, une fonction de score $w: E -> RR$ donne le score du joueur 0.
    Le score du joueur 1 est l'opposé du score du joueur 0.
]

#grid( columns: (70%, 30%),
  [
    #item("Remarque", show-title:false)[Accessibilité est somme nulle][
    Un jeu d'accessibilité est un cas particulier de jeux à somme nulle, en posant
  ]
  ],
  [
    #h(5%)
    $ w(e) = cases(1 "si" e in W_0, 0 "si" e in W_N, -1 "si" e in W_1)$
  ]
)



#item("Exemple")[Le morpion est un jeu d'accessibilité][
#align(center)[
  #image("finaux_morpions.png", width: 70%)
]
]

#item("Définition")[Une partie][
 est un chemin dans $G$, depuis $s_("init")$ vers un état terminal.
]


#item("Exemple", show-title:false)[Exemple de partie][
  Le chemin rouge représente un exemple de partie de morpion.

  #align(center)[
    #image("exemple_partie_morpion.png", width: 70%)
  ]
]


=== Traitement exhaustif 

==== Cas des jeux d'accessibilité

#item("Définition")[Une stratégie sans mémoire][
pour le joueur $X in \{0, 1\}$ est une fonction partielle de 
$S_X -> A$ qui à tout $s in S_X$ non terminal, 
associe un coup $f(s)$.
]

#item("Remarque", show-title:false)[Stratégie sans mémoire][
  On défini ici les stratégies sans mémoire, qui ne dépendent que de
  l'état courant.
  Dans une définition plus générale, le domaine d'une stratégie pourrait être
  un historique de coups.
]

#item("Définition", show-title:false)[Chemin suivant une stratégie][
  On dit qu'un chemin $s_1 -> ... -> s_n$ de $G$ *suit une stratégie $f$* pour le joueur $X$ si pour tout $s_i in S_X$ non-terminal, on a $f(s_i) = s_i -> s_(i+1) $.
]

#item("Définition", show-title:false)[Stratégie gagnante][
  Une stratégie $f$ pour le joueur $X$ est *gagnante* depuis un
  état $s$ si
  tout chemin suivant $f$ entre $s$ et un état final
  abouti à un état gagnant pour $X$.
]

#item("Définition", show-title:false)[Position gagnante & Attracteur][
Un état est appelé une *position gagnante* pour
le jouer $X$ s’il existe une stratégie gagnante pour $X$
depuis cet état. L'ensemble des positions gagnantes est appelé l'*atracteur* de X.
]

#item("Remarque", show-title:false)[Attracteur par point fixe][
Les attracteurs peuvent être caractérisés comme les limites des suites suivantes:
$
&- A^X_0 &= &W_X \
&- A^X_(i+1) &= &A^X_i \
&& &union \{s in S_X | exists s' in A^X_i "tel que" s -> s'\} \
&& &union \{s in S_(1-X) | forall s' "tel que" s -> s' "alors" s' in A^X_i\}
$
]

#item("Complexité")[][
  Ces points fixes peuvent être calculés en $O(|S|^2)$.
]

#dev[
  
#item("Remarque", show-title:false)[Complexité du calcul de l'attracteur][
  @GRA
  Les attracteurs peuvent être calculés avec une complexité linéaire en la taille du graphe de jeu.
]

]

/*
#item("Remarque", show-title:false)[Jeux d’accessibilité][
On appelle aussi ces jeux, jeux d’accessibilité. En effet, un des joueurs souhaite atteindre un ensemble de sommets $F subset.eq S$ dits sommets ﬁnaux. L’objectif de son
adversaire est d’éviter les sommets de $F$.
]
*/

==== Cas des jeux à somme nulle: algorithme min-max @TOR[9.7.2.1]

#item("Hypothèse", show-title:false)[Graphe sans cycle][
  On se limitera pour la suite aux jeux dont le graphe
  *ne contient pas de cycles*.
]

#show raw.where(lang: "pseudo"): it => [
    #show regex("\b(Entrée|Contexte|Sortie|Si|renvoyer)\b") : keyword => text(weight: "black", keyword)
    #it
]

#item("Algorithme")[Min-max][
  ```pseudo
  Entrée: un état s du graphe de jeu
  Sortie: meilleur score que peut réaliser le joueur 0 depuis s,
  si le joueur 1 joue de façon optimale

  MinMax(s):
    Si s est un état terminal:
      renvoyer w(s)
    Si s est contrôlé par le joueur 0:
      renvoyer le maximum, pour s' successeur de s, de MinMax(s')
    Si s est contrôlé par le joueur 1:
      renvoyer le minimum, pour s' successeur de s, de MinMax(s')
  ```
]

#item("Remarque", show-title:false)[Arbre de parcours, nœuds min et max][
  L'ordre dans lequel l'algorithme MinMax parcours le graphe de jeu forme un arbre.
  On parle d'*arbre de parcours*.
  Dans cet arbre, on appelle *nœud min* un nœud contrôlé par le joueur 1
  (sur lequel l'algorithme calcule un minimum) et *nœud max* un nœud contrôlé par le joueur 0
  (sur lequel l'algorithme calcule un maximum).
]

#item("Complexité", show-title:false)[Min-Max linéaire][
  Comme le calcul des attracteurs pour les jeux d'accessibilité,
  l'algorithme MinMax a une complexité linéaire en la taille du graphe
  de jeu.
]

#item("Limite", show-title:false)[Traitement exhaustif impraticable][
  La taille des graphes modélisant la plupart des jeux à deux joueurs
  sont suffisamment grandes pour qu'une complexité linéaire en la taille
  du graphe se révèle irréalisable en pratique.
]

=== Traitement non-exhaustif

==== Élagage alpha-beta

#item("Remarque", show-title:false)[alpha-beta améliore min-max][
  Dans l'algorithme MinMax, on peut s'épargner des calculs en faisant les deux constats suivants:
  - Pour un nœud min $s$, si $f$ un des fils de $s$ renvoie un résultat
    plus faible que celui déjà renvoyé par $g$ l'un des grand-frères de $s$, alors il n'y a pas
    besoin d'explorer les autres fils de $s$.
    En effet, on aura $"MinMax"(s) <= "MinMax"(f) <= "MinMax(g)"$ et $max("MinMax"(s), "MinMax"(g)) = "MinMax"(g)$.
  - Pour un nœud max $s$, si $f$ un des fils de $s$ renvoie un résultat
    plus grand que celui déjà renvoyé par $g$ l'un des grand-frères de $s$, alors il n'y a pas
    besoin d'explorer les autres fils de $s$.
    En effet, on aura $"MinMax"(s) >= "MinMax"(f) >= "MinMax(g)"$ et $min("MinMax"(s), "MinMax"(g)) = "MinMax"(g)$.
]

#item("Algorithme")[L'élagage alpha-beta][
  est une variante de l'algorithme MinMax qui exploite ces deux constats.
]

==== Estimation

#item("Définition")[Une heuristique pour un jeu à somme nulle][
  est une fonction $h: S -> RR$ qui _estime_ le score que le joueur
  1 peut espérer depuis chaque état.
]

#item("Variante", show-title:false)[Min-max à profondeur bornée][
  Il existe une *variante de l'algorithme MinMax* dans laquelle,
  au delà d'un certain nombre d'appels récursifs, on remplace
  les appels récursif par l'appel à une heuristique.
]

#item("Remarque")[Cette variante de l'algorithme MinMax renvoie une estimation et non pas un résultat exact.][
  On remarquera le contraste avec l'algorithme A\*, qui bien qu'utilisant une heuristique renvoie un résultat exact, lorsque l'heuristique est admissible.
]


#recap()


#bibliography(read("../bib.yaml", encoding: none))

#authors[Alexis Hamon & Santiago Sara Bautista]