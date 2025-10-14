#import "../../deps.typ" : *
#show : tableau

= Algorithmes glouton et de retour sur trace. Exemples et Applications.


== Problème d’optimisation

// À l’oral bien marquer l’importance de la distinction problème d’optimisation et problème de décision, c’est là tout l’intérêt de placer cette définition ici
#item("Définition")[Problème d’optimisation @PAPA[7]][
  Un problème d’optimisation est un problème pour lequel on cherche une solution qui~:
  - Satisfait certaines contraintes
  - Est la meilleur possible, selon des critères bien definis
]

#item("Exemple")[@PAPA[7]][
  La recherche d’un plus court chemin entre deux sommets $s_1$ et $s_2$ dans un graphe $G$ est un problème d’optimisation, une solution doit~:
  - Être un chemin valide dans $G$, entre $s_1$ et $s_2$
  - Minimiser le poids du chemin
]


//On peux essayer de voir cette leçon comme "comment faire face à un problème trop compliqué ?", avec une première parti où on fait des approx avec des algos gloutons (et où parfois ça sera la bonne solution on va être content), et une deuxième partie où on trouve des solutions exactes de manière intelligente (retour sur trace)

#item("Motivation")[][
  Cette leçon présente deux approches algorithmiques pour résoudre des problèmes d’optimisations~:
  - L’approche gloutone, qui est efficace, mais qui n’est pas assurée de résoudre exactement le problème
  - Le retour sur trace, qui effectue un parcours optimisé de l’ensemble des solutions, mais qui peut avoir une complexité exponentielle dans le pire cas
]

== Algorithmes gloutons

=== Principe des algorithmes gloutons



#item("Définition")[@PAPA[5]][
  Un *algorithme glouton* construit une solution, morceau par morceau, en choisissant systématiquement le prochain morceau qui donne le plus grand bénéfice immédiat.
]

#item("Exemple")[][
  L’algorithme de Dijkstra, qui résout le problème du plus court chemin en $O(|A| times log|S|)$, est un algorithme glouton basé sur une file de priorité, pour les graphes sans arcs de poids négatif.
]

// Exemple avec le rendu de monnai bien prace que y a rien à introduire, et il est tout de suite non optimal
#item("Exemple")[Problème du rendu de monnaie@TOR[9.3]][
  - *Entrée*: Un ensemble de n pièces de valeur respective $0 < v_1 < ... < v_n$ et une somme $S$ à atteindre.
  - *Sortie*: La distribution de pièce $lambda_i$ et $p$, avec: $S = sum lambda_i v_i$ et $p = sum lambda_i$.
  - *Coût*: Le nombre de pièce choisies
]

#item("Algorithme")[@TOR[Programme 9.7]][
  On peut écrire un algorithme glouton pour résoudre ce problème en $O(S)$~: il suffit de sélectionner à chaque fois la pièce de plus grande valeur sans que la somme choisie ne dépasse la somme voulue.
]
```rust
fonction rendue_de_monnaie(reste) :
    solution = []
    tant que (reste > 0):
        pièce = plus grand v_i <= reste
        reste -= pièce
        ajouter pièce à S
    renvoyer solution
```

#item("Propriété")[@TOR[Théorème 9.2]][
  Pour le système monétaire de la zone euro, alors l’algorithme glouton calcule un rendu de monnaie utilisant un nombre minimal d’éléments.\
  Les systèmes monétaires qui vérifient cette propriété sont dits *canoniques*.
]


//#item("Remarque")[][
  //Il est relativement rare qu'un algorithme glouton propose la solution optimale. Dans la majorité des cas, elle est sous-optimale.
//]

#item("Contre-exemple")[@NAN][
  Avec ces paramètres~:
  - $v_1 = 1, v_2 = n, v_3 = n+1$
  - S = 2n
  Pour $n > 0$ quelconque, l'algorithme glouton fournie comme solution $S = (n+1) + 1 + ... + 1$, et donc un rendu de $n$ pièces, alors que la solution optimale est $S = n + n$, rendant ainsi $2$ pièces.
]

#dev[
#item("Exemple")[Arbre couvrant minimal@PAPA[5.1.3]][
  On peut calculer l’arbre couvrant minimal avec une complexité $O(|A| times log |S|)$ à l’aide d’un algorithme glouton (Kruskal).
]
]

#item("Exemple")[Codage de Huffman@PAPA[5.2]][
  Pour la compression de texte, on peut construire un arbre d’encodage de Huffman à l’aide d’un algorithme glouton.
]

#item("Propriété")[][
  L’arbre de Huffman généré par l’algorithme glouton minimise, avec $f_i$ la fréquence du caractère $i$ et $p_i$ sa profondeur $ sum ""^n_(i=1) (f_i * p_i) $
  et se calcul en $O(n log(n))$. 
]

=== Algorithme d’approximation

#item("Définition")[Algorithme d’approximation @PAPA[9.2]][
  Soit un problème d’optimisation, et un algorithme $cal(A)$ qui, étant donnée une instance $I$ renvoie une solution de valeur $cal(A)(I)$, et en notant $"OPT"(I)$ la valeur de la solution optimale. Le facteur d’approximation de l’algorithme $cal(A)$ est défini comme
  $ alpha_cal(A) = max_(I) (cal(A)(I)) / ("OPT"(I)) $
]
// Exemple d’algo d’approximation un peu plus tard, comme algo glouton directement. Pas besoin de se forcer à rajouter un exemple ici.

//#item("Remarque")[Approximation][
  //Même si un algorithme glouton n'offre pas toujours la solution optimale, elle peut cependant être utilisée en tant qu'algorithme d'approximation.
//]

#item("Exemple")[@PAPA[9.2.3]][
  On peut utiliser les algorithmes gloutons de calcul d’arbre couvrant minimal pour établir une 2-approximation du problème de voyageur de commerce métrique.
]

#item("Exemple")[Coloration de graphe@TOR[9.3]][
 Étant donné un graphe non orienté et non pondéré $G = (V,E)$ , on appelle $k$-coloration de $G$, pour $k in NN^*$, une application $c$ qui associe à chacun des sommets de $G$ un entier de $[0, k − 1]$ de sorte que si deux sommets $u$ et $v$ sont voisins alors leur couleur sont différentes. 
]

#item("Algorithme")[@TOR[Programme 9.6]][
  On peut colorier un graphe avec un algorithme glouton en $O(|S|^2)$, en prenant pour chaque sommet, la plus petite couleur disponible parmi celles des voisins~:
  ```ocaml
  fonction coloration(S,A):
    c = [0,...,0]
    Pour v dans S:
      c[v] <- min(c, voisins(v))
    renvoyer c
  ```
]

#item("Exemple")[Couverture d’ensemble@PAPA[5.4]][Soit un ensemble $B$, le problème de couverture d’ensemble est un problème d’optimisation défini comme~:
  - *Entrée:* Une liste d’ensemble $S_1, ..., S_m$, avec $forall i S_i subset.eq B$\
  - *Sortie:* Une liste de $S_i$ telle que leur union soit $B$.
  - *Coût:*  Le nombre d’ensembles choisis
]

#item("Propriété")[@PAPA[5.4]][
  S $B$ contiens $n$ éléments, et que la solution optimale utilise $k$ ensembles, alors l’algorithme glouton consistant à prendre à chaque étape l’ensemble qui couvre le plus d’éléments restant utilise au plus $k ln(n)$ ensembles.
]

#item("Définition")[Minimum Local@PAPA[9.3]][
  Une solution est un minimum local si toute solution proche de cette dernière à un coût plus élevé. En résolvant le problème localement, un algorithme glouton peut trouver un minimum local, sans trouver nécessairement de minimum global.
]

#item("Remarque")[@PAPA[9.3.3]][
  Face au problème du minimum local, plusieurs approches existent:
  - *Ajout d'aléatoire*: exécuter à plusieurs reprises l'algorithme en rajoutant une notion d'aléatoire
  - *Retour stimulé*: choisir occasionnellement un choix augmentant le coût total
]


== Retour sur trace

#item("Movitation")[][
  Même en relâchant l’optimalité, certains problèmes d’optimisation restent NP-complets. On cherche alors des algorithmes les plus optimisés possibles pour résoudre ces problèmes.
]
=== Principe du retour sur trace


#item("Remarque")[Retour sur trace@PAPA[9.1]][
  Il est souvent possible de rejeter une solution en en observant seulement une petite parte. Par exemple, si une instance de `SAT` contient la clause $(x_1 or x_2)$, alors toute proposition contenant $x_1 = x_2 = bot$ peut être immédiatement rejetée.\
  On peut alors se servir de cette observation pour éliminer rapidement des ensembles de solutions.
]

#item("Algorithme")[@PAPA[9.1.1]][
  ```ocaml
  commencer avec le problème P0
  soit S = {P0} l'ensemble des sous-problèmes
  tant que S non vide:
    choisir P dans S
    l'étendre en sous-problème P1, ..., Pk
    pour chaque Pi:
      si test(Pi) réussi, s'arrêter et renvoyer la solution
      si test(Pi) échoue, retirer Pi
      sinon test(Pi) incertain, rajouter Pi dans S
  annoncer qu'il n'existe aucune solution
  ```
]

// #item("Exemple")[Sudoku@TOR[9.2]][
//   Pour le cas du sudoku, la subdivision en sous-problème correspond directement à remplir les cases vides du sudoku sachant les choix précédents:
//   ```ocaml
//   resoudre(grille):
//     pour c de 0 à 80: // parcours des cases
//       si grille[c] = 0 // case vide
//         pour v de 1 à 9: // choix de la valeur
//           grille[c] <- v
//           si valide(grille, c) et resoudre(grille):
//             renvoyer vrai // solution trouvée
//         grille[c] = 0
//         renvoyer faux // aucune solution trouvée
//   ```
// ]

#item("Remarque")[][
  Parcourir successivement toutes les possibilités à l'aide d'un retour sur trace revient à parcourir en profondeur un arbre représentant des solutions partielles, dont les nœuds sont des décisions, et les feuilles un succès ou un échec.
]

#grid(
  columns: (19em, auto), column-gutter: 1em,
  row-gutter: 0em,
  item("Exemple")[SAT @PAPA[9.1]][
  Pour vérifier si la formule $(y or z) and (not y) and (y or not z)$ est satisfiable ou non, nous pouvons parcourir les possibilités selon l'arbre ci-contre. En testant toutes les possibilités, nous pouvons montrer que cette formule est insatisfiable.
],
grid.cell(
  rowspan: 2,
  align(center + horizon, canvas({
  import draw: *
  tree.tree((
    $(y or z), (not y), (y or not z)$,
    (
      $(z), (not z)$, 
      $bot$,
      $bot$
    ),
    $bot$
  ),
  draw-node: (node, ..) => {
    circle((), radius: .0, stroke: black)
    content((), node.content)
  },
    grow: 1.3,
)
  content((2.1, -0.6), text(black, size: 11pt)[y=1])
  content((0.4, -0.6), text(black, size: 11pt)[y=0])
  content((1.3, -2.0), text(black, size: 11pt)[z=1])
  content((-0.3, -2.0), text(black, size: 11pt)[z=0])
})))
)

//#item("Définition")[DPLL][
  //une autre heuristique de retour sur trace
//]

#item("Exemple")[Problème des N-reines @TOR[9.6.2]][
  Le problème des N-reines consiste à placer N reines sur un échiquier $N times N$ sans qu’elles soient en prise deux a deux.
  Le retour sur trace permet de résoudre ce problème, mais devient très lent très vite ($N >= 30$).
]

#item("Définition")[Mutabilité][
  Il est possible de séparer les structures construites par un retour sur trace en deux catégories:
  - *Les structures mutables*: lors d'un retour, la structure est partiellement mise à jour en place
  - *Les structures immuables*: la structure n'est dans ce cas jamais mise à jour
]

//#item("Exemple")[][
  //Nous pouvons citer quelques algorithmes en exemple:
  //- le problème SAT présenté en exemple utilise une structure mutable, car les valeurs de vérité des littéraux sont changées à chaque retour
  //- l'algorithme de Dijkstra construit un arbre immuable dont la racine est le noeud de départ pour trouver un plus court chemin
//]

#item("Remarque")[Complexité][
  Sur des problèmes NP-complets, l’algorithme 23 est exponentiel dans le pire cas. Il donne cependant un cadre générique pour résoudre des problèmes NP-complets, en réduisant l’ensemble des solutions à évaluer.
]
//#item("Remarque")[Complexité][
  //- d'un point de vue spatial, une structure immuable peut occuper beaucoup d'espace, car une instance doit être stockée à chaque appel imbriqué.
  //- d'un point de vue temporel, algorithme retour sur trace ne peut pas s'exécuter en temps polynomial sur un problème NP-complet sous l'hypothèse $P != N P$.
//]

=== Séparation et évaluation

#item("Intuition")[][
  //Si on peut borner le coût minimal d’une solution à sous-problème d’un problème d’optimisation, alors on peut se servir de cette borne pour arrêter l’exploration de l’arbre.
  Si on peut borner le coût minimal d’une solution à un sous-problème, et qu’on a déjà rencontré une meilleure solution que ce minimum, alors il est inutile d’explorer ce sous-problème, comme on ne trouvera que des moins bonnes solutions. On peut donc éliminer cette branche de l’arbre d’exploration.
]

#item("Algorithme")[Séparation et évaluation@PAPA[9.1.2]][
```ocaml
commencer avec le problème P0
soit S = {P0} l’ensemble des sous-problèmes
meilleur_solution = ∞
tant que S non vide:
  choisir P dans S
  l’étendre en sous-problème P1, ..., Pk
  pour chaque Pi:
    si Pi est une solution: améliorer meiller_solution
    sinon:
      si coût_min(Pi) < meilleur_solution : ajouter Pi à S
renvoyer meilleur_solution
  ```
]

#dev[
#item("Exemple")[Problème du voyageur de commerce@PAPA[9.1.2]][
  On peut utiliser la méthode de séparation et évaluation pour calculer une solution exacte au problème du voyageur de commerce, en se servant d’arbre couvrant minimaux pour borner les calculs intermédiaires.
]
]

#item("Remarque")[][
  L’algorithme `min-max` parcours l’arbre des solutions de manière similaire à un retour sur trace. On peut donc appliquer les méthodes de séparation et évaluation, en bornant les minimums et les maximums.
]

#item("Définition")[Élagage $alpha-beta$@TOR[9.7.2.2]][
  Lorsque l’on calcule un minimum, on peut s’arrêter tout de suite dès qu’on est certain que la valeur de ce minimum sera inférieure ou égale à un maxi- mum qui sera calculé au niveau supérieur. De même, un calcul de maximum peut être interrompu dès lors que la valeur de ce maximum sera supérieure ou égale à un minimum calculé au niveau supérieur.
]

//#item("Exemple")[@TOR[9.7.2.2]][Avec, en bleu, les branches qu’il n’est pas nécessaire de calculer~:
//#align(center)[
//#image("alpha_beta.png", width: 46%)
//]
//]

#recap()
#bibliography(read("../bib.yaml", encoding: none))

#authors[Benjamin Voisin & Adrien Decosse]