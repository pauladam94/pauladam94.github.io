#import "../../deps.typ": *
#show : tableau


= Classe P et NP. Problèmes NP-complets. Exemples. @TOR[13]

/ Motivation : Les problèmes décidables sont-ils "simples" à résoudre ? On apprend ici une manière de classer les problèmes en fonction de leur "dureté".

#item("Remarque")[][
  Dans la suite, on appellera "algorithme" un programme Ocaml ou C qui termine.
]

== Théorie de la complexité
=== Problèmes de décision @TOR[13.1 13.2]


#item("Définition")[Un problème de décision][
  sur un domaine d'entrée E est défini par une fonction totale $f : E -> BB = { V, F }$.
]

#item("Exemple")[SAT][
 est un problème de décision avec comme domaine d'entrée l'ensemble des formules propositionnelles $cal(F)_P$ et comme fonction $"sat"$ tel que $"sat"(phi in cal(F)_P) = V <=> phi$ est satisfiable.
]

#item("Définition")[Un problème de recherche][
  est défini par une relation binaire $R subset.eq E times S$. Un algorithme $A$ résoud ce problème de recherche R si pour toute entrée $e in E, A$ appliqué à $e$ produit une sortie $s in S$ tel que $R(e, s)$ lorsqu'une telle solution existe. 
]

#item("Exemple")[Trouver un chemin dans un graphe][
  est un problème de recherche avec comme domaine des solutions les séquences de sommets.
]

#item("Exemple")[La coloration d'un graphe][
  $g$ est un problème de recherche avec comme domaine des solutions les fonctions partielles des sommets vers les couleurs.
]

#item("Définition")[Un problème de vérification][
  associé à un problème de recherche $R subset.eq E times S$ est le problème de décision ayant pour domaine d'entrées $E times S$ et comme fonction : $f_V : E times S -> BB$  et $f_V (e, s) = V <=> R(e, s)$.
]


#item("Définition")[Un problème d'optimisation][, définit par $R subset.eq E times S$ et $c : S -> RR^+$, détermine, étant donnée un $e in E$, un $s in S$ tel que $c(s)$ minimal.  
]

#item("Exemple")[][
  Le problème de trouver un plus court chemin dans un graphe ou trouver un nombre minimum de couleur pour colorer un graphe sont des problèmes d'optimisation.
]

#item("Définition")[Un problème de seuil][
  associé à un problème d'optimisation est un problème de décision définit par $R subset.eq E times S$, $c : S -> RR^+$ et $c_0$ avec $f_(c_0)(e in E) = V <=> exists s in S, R(e, s), c(s) <= c_0.$ 
]

#item("Définition")[Un chemin hamiltonien][
  dans un graphe non-orienté est un chemin passant par chaque chemin du graphe exactement une fois.
]

#dev[
#item("Exemple")[Le problème du voyageur de commerce][
  (ou TSP pour Traveling Salesman Problem) est un problème d'optimisation recherchant un chemin hamiltonien dans graphe complet pondéré (poids positifs) non orienté de poids minimum.
]
]


=== Complexité @TOR[6.3]

#item("Définition")[la complexité temporelle][
  d'une éxécution d'un programme sur une entrée donnée mesure le nombre d'opérations atomiques réalisées.
]

#item("Remarque")[][
  On étudiera uniquement des domaine d'entrée infinis.
]

/*
#item("Définition")[][
  On étudie généralement trois types de complexités : la complexité au pire cas, meilleur cas et cas moyen.
]


#item("Exemple")[La recherche dichotomique][
  a une complexité dans le meilleur cas de $O(1)$ et dans pire cas en $O(log(n))$
]
*/

#item("Remarque")[][
  On étudiera l'ordre de grandeur asympotique de la complexité en fonction de la taille de l'entrée souvent noté $n$. 
]
/*
#item("Définition")[Notation de Landau.][
  Soit $f : NN -> NN$, on a :
  - $O(f(n))$ les fonctions majorées par f à un facteur constant près.
  - $Omega(f(n))$ les fonctions minorées par f à un facteur constant près.
  - $Theta(f(n))$ les fonctions du même ordre de grandeur que f.
  
]
*/

#item("Remarque")[La taille d'un entier][
  de valeur maximal $n$ est en $O(log(n))$, quel que soit la base utilisée.
]

#item("Exemple")[Le test de primalité][
  de $n$ se fait au mieux en $O(sqrt(n))$ étapes (admis) ce qui est exponentiel en la taille de l'entrée $|e| = O(log(n))$.
]

/*
#item("Définition")[La complexité moyenne][
  d'un algorithme pour une taille d'entrée N est la moyenne des complexités pour toutes les entrées possibles de cette taille.
]

#item("Exemple")[Le tri rapide][
  a une complexité moyenne en $O(n log(n))$.
]
*/


== P et NP 
=== Classe P @TOR[13.2.3]


#item("Définition")[La classe P][
  est l'ensemble des problèmes de décision qui admettent une solution dont la complexité temporelle est majorée asymptotiquement par un polynôme en la taille de l'entrée.
]



#item("Remarque")[][
  Le test de primalité est un problème de décision dans P. Ce fut montré à l'aide de algorithme de AKS découvert en 2002. 
]

#item("Remarque")[Un algorithme galactique][
  est un algorithme de complexité meilleur que d'autres algorithmes pour des entrées de taille immense. Un tel algorithme existe pour la multiplication d'entiers.
]

#item("Exemple")[La déterminisation d'un automate][
  est un problème algorithmique sans algorithme solution en complexité polynomiale. En effet l'automate déterminisé peut être de taille exponentielle en la taille de l'entrée.
]

=== Reduction Polynomiale @TOR[13.2.4]

#item("Définition")[][
  Soient deux problèmes de décision définies par $f_1 : E_1 -> BB$ et $f_2 : E_2 -> BB$. $f_1$ se *réduit polynomialement* à $f_2$ s'il existe une fonction $g : E_1 -> E_2$ de complexité temporelle polynomiale tel que $forall e in E_1, f_1(e) = f_2(g(e))$ et on note $f_1 <=_P f_2$.
]

#item("Définition")[][
  Soient deux problèmes de décisions décrit par $f_1$ et $f_2$. Si $f_2$ appartient à $P$ et si $f_1 <=_P f_2$ alors $f_1$ appartient à P.
]

#item("Exemple")[L'algorithme de Kosaraju][
  est dans P et permet de calculer les composantes fortement connexes dans un graphe.
]

#item("Exemple")[2SAT][
 est le problème de décision restreint de SAT avec des formules en 2-FNC.
]

#item("Remarque")[][
  On peut réduire de façon polynomiale 2SAT au problème de calcul  de composantes fortement connexe dans un graphe, d'où 2SAT est dans P.
]

#item("Schémas")[Reduction de 2SAT à Kosaraju.][
#align(center, canvas({
  import draw : *
  set-style(mark: (end : ">"))

  rect((0, 2.2), (rel : (10.5, 1.8)))
  rect((0, 3.4), (rel: (1.6, 0.6)), name : "2SAT")
  content("2SAT")[2SAT]

  rect((2.2, 2.4), (rel: (2.8, 1.3)), name : "reduction")
  content("reduction", align(center)[reduction \ polynomiale])
  
  line((-1, 3), "reduction", name : "begin->reduction")

  content("begin->reduction", anchor: "north")[
    #box(inset: (top: 3pt, right: 10pt), $ phi "en" 2-"CNF" $)
  ]

  rect((7, 2.5), (rel: (3, 1)), name : "kosaraju")
  content("kosaraju")[Kosaraju]

  line("reduction", "kosaraju", name: "reduction->kosaraju")
  content("reduction->kosaraju", anchor: "south")[graphe]

  line("kosaraju", (11.5, 3), name: "kosaraju->end")
  content("kosaraju->end", anchor :"north", box(inset: 2pt, $BB$))
  
}))
]

=== Classe NP @TOR[13.2.5 13.3]

#item("Remarque")[][
  La classe NP décrit des problèmes de décision liées à des problèmes de recherche dont le problème de vérification associé est dans P. 
]

#item("Définition")[La classe NP][
  est l'ensemble des $f : E -> BB$ tel que : 
  - $exists C, g : E times C -> BB | (f(e) = V <=> exists c in C, g(e, c) = V)$ avec $c$ de taille polynomiale en la taille de $e$.
  - le problème de décision défini par g, appelé problème de vérification d'un certificat est dans la classe P.
  
]

#item("Exemple")[Le problème SAT][
  est dans NP.
]


#item("Définition")[Un problème NP-difficile][
  est un problème algorithmique auquel peut être réduit polynomialement tout problème de NP.
]

#item("Définition")[Un problème NP-complet][
   est un problème NP-difficile et appartenant à NP.
]

#item("Théorème")[de Cook Levin.][
  Le problème SAT est NP-Complet.
]

#item("Exemple")[Le problème 3SAT][
  est NP-complet.
]

#item("Remarque")[Relation entre P et NP.][
  P est inclu dans NP cependant l'inclusion dans l'autre sens ($"NP" subset P$) est un problème encore ouvert en recherche informatique.
]


#item("Remarque")[Hierarchie des classes de complexités. @TOR[13.2]][
#align(center, image(width: 160pt, "Hierarchie_Classe_Complexite.png"))
]

== Que faire en cas de NP-dureté ?

=== Backtracking

#item("Remarque")[][
  Certains problèmes NP complet peuvent être résolus en temps exponentiel en itérant sur toutes les possibilités.
]

#item("Idée")[Le backtracking][
  consiste à énumérer toutes ces solutions pour les tester. De nombreuses méthodes permettent d'accélérer cette recherche en pratique.
]

#dev[
  #item("Remarque")[Le Sudoku généralisée][
    sur un tableau de taille quelconque $n$ peut être résolue de façon efficace par des méthodes de "branch and bound" bien que le problème soit NP-complet (admis). Une méthode pour le résoudre consiste à réduire ce problème à SAT.
  ]
]

=== Contraintes sur un problème
#item("Idée")[][
  En limitant un problème NP-difficile, on arrive parfois à un problème plus simple à résoudre dans P.
]
#item("Exemple")[2SAT][
  est une simplification de SAT dans P.]

#item("Exemple")[Bicolorer un graphe][
  est une simplification de la k-coloration d'un graphe. Trouver si un graphe peut être 2-coloré est un problème dans P.
]

=== Problème d'Approximation

#item("Idée")[][
  Pour certains problèmes NP-difficile on peut trouver des approximations de la solution. Le problème d'approximation associé peut se trouver dans P.
]

#item("Définition")[Une $rho$-approximation][
  d'un problème d'optimisation est un algorithme qui renvoie des solutions au plus $rho$ fois plus coûteuse que la solution optimale.
]

#item("Exemple")[Une log(n)-Approximation][
  du problème de couverture de sommet de taille minimale est atteinte par un algorithme glouton polynomial.
]

#item("Exemple")[TSP métrique][
  est une variation du problème du voyageur du commerce où la fonction de pondération $w$ du graphe $G$ respecte l'inégalité triangulaire :
  $ forall s,t,u in G, w(s,u) <= w(s,t)+w(t,u) $
]

#item("Exemple")[][
 TSP métrique est NP-complet et 2-approximable en temps polynomial.
]

== Modèle de Calcul - Machine de Turing @TOR[13.5.2]

#item("Idée")[][
  On souhaite définir formellement la notion d'algorithme pour nous assurer que les classes P et NP ne dépendent pas du langage utilisé.
]

#item("Définition")[Une machine de Turing][
  est un modèle de calcul décrit par un ensemble fini de règles de transitions qui, en fonction d'un état courant de la machine et de l'information lue à la position courante d'un ruban de taille infinie donne :
  - une intruction d'écriture sur la case courante du ruban
  - une instruction de déplacement sur le ruban
  - le nouvel état de la machine après cette étape
]

#item("Remarque")[][
  Ce modèle de calcul a beaucoup inspiré le paradigme impératif et la conception des processeurs.
]

#item("Définition")[Une machine universelle][
  existe et peut lancer l'éxécution d'une machine de Turing sur une entrée donnée. Turing introduit ici donc la notion "d'interpréteur".
]

#item("Remarque")[][
  Une machine de Turing est proche de la notion d'automate aux détails près qu'elle modifie à la volée le mot pris en entrée. // Elle peut donc se "rappeller" d'informations durant un calcul.
]

#item("Remarque")[][
  On peut fixer des états finaux soit acceptant soit non acceptant dans une machine de Turing pour lui permettre de répondre à des problèmes de décision.
]

#item("Définition")[Les machines de Turing non déterministes][
  peuvent être définit, à l'image des automates, avec des transitions non déterministes.
]
#item("Propriété")[][
  L'ensemble des problèmes de décisions décidé par une machine de Turing non déterministes en temps polynomiale est égale à la classe NP précédemment définit.
]

#item("Remarque")[][
  Sans pertes de généralités on peut assimiler une machine de Turing à un algorithme écrit en C ou Ocaml.
]





#colbreak()




#recap()

#set text(12pt)

===== Remarque

/ Programme MPI : La notion de machine de Turing est hors programme. On s’en tient à une présentation intuitive du modèle de calcul (code exécuté avec une machine à mémoire infinie). On insiste sur le fait que la classe P concerne des problèmes de décision.

- connaître la vraie classe de complexité de accessibilité dans un graphe.
- bien connaitre tous les réductions présentées dans le plan.

- présenter un algo d'approx
- présentér un problème NP qui devient P avec des solutions
// - P / NP c'est pas forcément algorithme galactique. 
// - Algo gallactique ?
- Donner des problèmes dans différentes branches de l'informatique pour diversifier :
  - logique : SAT, 2SAT ...
  - graphe : Accessibilité dans un graphe
  - entier : subset sum, entier est premier
  - théorie des languages par séparation par automates. 2 languages finis, existent ils un automate déterministe (au plus k états) qui acceptent tous les mots du premier et refusent tous les mots du second.
  - programmation linéaire. Algo du simplexe != Algo de l'ellypsoïde.

===== Partie Machine de Turing à compléter 
Si on a plus de place des choses peuvent être ajouter :
- équivalence avec biruban et un seul ruban.
- définition machine de Turing Universel.

====== Bonus TSP
En fonction de si TSP est un dev ou non :
#item("Exemple")[][
 En supposant P $!=$ NP, le problème du voyageur de commerce dans le cas générak n'est pas $rho$-approximable en temps polynomial pour tous $rho$ constant.
]

====== Developpements Possibles
- 3 coloration à partir de 3 SAT, Kosaraju - 2SAT, Sudoku, TSP

#bibliography(read("../bib.yaml", encoding: none))

#align(bottom + center)[Paul Adam & Axel Stengel]