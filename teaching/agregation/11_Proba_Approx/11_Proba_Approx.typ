#import "../../deps.typ" : *
#show : tableau

= Exemples d'algorithmes d'approximations et d'algorithmes probabilistes

#item("Définition")[@COR3[34.1]][
  Un *problème abstrait* $Q$ est une relation binaire sur un ensemble $I$ d’instances de problème, et un ensemble $S$ de solutions.
]

#item("Définition")[][
  Un *problème de décision* est un problème abstrait où $S = {0,1}$.
]
 
#item("Définition")[][
  Un *problème d’optimisation* est un problème abstrait dans lequel une certaine valeur doit "être minimisée ou maximisée".
]

#item("Exemple")[][
  Dans un graphe, le problème du plus court chemin est un problème d’optimisation.
]

#item("Remarque")[][
  On peut associer un problème de décision à un problème d’optimisation. Par exemple, le problème de décision associé à PLUS-COURT-CHEMIN est le problème dont les instances sont des graphes et des chemins, de solution $1$ s’il s’agit d’un plus court chemin dans le graphe, et $0$ sinon.
]

//#item("Définition")[Problème d’optimisation @PAPA[7]][
  //Un problème d’optimisation est un problème pour lequel on cherche une solution qui~:
  //- Satisfait certaines contraintes
  //- Est la meilleur possible, selon des critères bien définis
//]

== Algorithmes d'approximation

#item("Définition")[Un algorithme d’approximation @NAN][
  est un algorithme qui fournit une solution approchée à un problème d'optimisation.
]


=== Facteur d'approximation

#item("Définition")[Facteur d'approximation@PAPA[9.2]][
  Soit un problème d’optimisation, et un algorithme $cal(A)$ qui, étant donnée une instance $I$ renvoie une solution de valeur $cal(A)(I)$. En notant $"OPT"(I)$ la valeur de la solution optimale. Le facteur d’approximation de l’algorithme $cal(A)$ est défini comme
  $ alpha_cal(A) = max_(I) (cal(A)(I)) / ("OPT"(I)) $
]

#item("Remarque")[][
  Un algorithme est une $alpha$-approximation d'un problème, si pour ce problème donné, son facteur d'approximation vaut $alpha$.
]

#item("Exemple")[Couverture de sommets@PAPA[9.2.1]][
  - *Entrée~:* Un graphe non-orienté $G = (S,A)$
  - *Sortie~:* Un sous-ensemble $S' subset.eq S$ qui touche toutes les arêtes
  - *Minimise* $|S'|$
]

#item("Définition")[@PAPA[9.2.1]][
  Un *couplage* dans un graphe est un ensemble $A' subset.eq A$ d’arêtes telles qu’elles n’aient aucun sommet en commun. Un couplage est *maximal* si on ne peut rajouter aucune arête.
]

#item("Propriété")[@PAPA[9.2.1]][
  Soit un couplage maximal $A'$ d’un graphe, une couverture de sommet minimale contient au moins $|A'|$ sommets.
]


#item("Algorithme")[@COR3[35.1]][
  ```
  Couverture-Sommet-Approchée(A,S):
    C = {}
    A' = A
    tant que (A' non vide):
      sout (u,v) une arête de A
      C = C union {u,v}
      supprimer de A' toute arête incidente à u ou v
    renvoyer C
  ```
]

#item("Propriété")[@PAPA[9.2.1]][
  Cet algorithme est une 2-approximation du problème de couverture de sommets.
]

=== Algorithmes Gloutons

#item("Définition")[@PAPA[5]][
  Un *algorithme glouton* construit une solution, morceau par morceau, en choisissant systématiquement le prochain morceau qui donne le plus grand bénéfice immédiat.
]

#item("Exemple")[Couverture d’ensemble@PAPA[5.4]][Soit un ensemble $B$, le problème de couverture d’ensemble est un problème d’optimisation défini comme~:
  - *Entrée:* Une liste d’ensemble $S_1, ..., S_m$, avec $forall i S_i subset.eq B$\
  - *Sortie:* Une liste de $S_i$ telle que leur union soit $B$.
  - *Coût:*  Le nombre d’ensembles choisis
]

#item("Propriété")[@PAPA[5.4]][
  S $B$ contiens $n$ éléments, et que la solution optimale utilise $k$ ensembles, alors l’algorithme glouton consistant à prendre à chaque étape l’ensemble qui couvre le plus d’éléments restant utilise au plus $k ln(n)$ ensembles.
]


#item("Exemple")[Voyageur de commerce métrique][
  En se basant sur un arbre couvrant minimal, il est possible de calculer une $2$-approximation pour le voyageur de commerce dans le cas métrique.
]

#item("Remarque")[][
  Sans l’hypothèse métrique, si P != NP,  il n’existe aucune $alpha$-approximation du problème du voyageur de commerce.
]

#item("Exemple")[Coloration de graphe@TOR[9.3]][
 Étant donné un graphe non orienté et non pondéré $G = (V,E)$ , on appelle $k$-coloration de $G$, pour $k in NN^*$, une application $c$ qui associe à chacun des sommets de $G$ un e«ntier de $[0, k − 1]$ de sorte que si deux sommets $u$ et $v$ sont voisins alors leur couleur sont différentes. 
]

#item("Algorithme")[@TOR[Programme 9.6]][
  On peut colorier un graphe avec un algorithme glouton en $O(|S| + |A|)$, en prenant pour chaque sommet, la plus petite couleur disponible parmi celles des voisins~:
  ```ocaml
  fonction coloration(S,A):
    c = [0,...,0]
    Pour v dans S:
      c[v] <- min(c, voisins(v))
    renvoyer c
  ```
]

#dev[
#item("Remarque")[][
  Il existe des graphes pour lequels l’algorithme glouton renvoie une coloration arbitrairement mauvaise. En revanche, pour certains graphe, cette coloration est optimale (graphe d’intervales), ou une 3-approximation (graphe de disques unitaires).
]

#item("Algorithme")[][
  Si un graphe est 3-coloriable, alors on peut construire une $sqrt(|S|)$-approximation.
]
#v(0.25em)
]


=== Schéma d'approximation

// Attention: L'exécution dépend de epsilon
#item("Définition")[Schéma d'approximation @VAZ[8]][
  Un schéma d'approximation est un algorithme $cal(A)$ qui, étant donné une entrée $I$ et un seuil $epsilon > 0$ vérifie:
  $ cal(A)(I, epsilon) <= (1 + epsilon) "OPT"(I) $
]

#item("Définition")[Schéma d'approximation polynomial @VAZ[8]][
  Si en plus, pour tout $epsilon > 0$ fixé, l'exécution de *cal(A)* est polynomiale en la taille de *I*, nous dirons qu'il s'agit d'un *schéma d'approximation polynomial*.
]

#item("Définition")[Schéma d'approximation totalement polynomial@VAZ[8]][
  Un algorithme est un *schéma d'approximation totalement polynomial* si en plus, l'exécution de $cal(A)$ est également polynomial en $1/epsilon$.
]

#item("Exemple")[][Le problème du sac à dos admet un schéma d’approximation totalement polynomial]

//#item("Contre-exemple")[TSP non métrique][]

== Algorithmes probabilistes

=== Définitions et exemples

#item("Définition")[Algorithme probabiliste @TOR[9.6]][
  est un algorithme qui effectue des choix aléatoires pendant son exécution.
]

#item("Remarque")[Méthode probabiliste @TOR[13.4.1.2]][
  Certains algorithmes déterministes peuvent répondre de manière probabiliste. C'est le cas, par exemple, si le choix repose sur une espérance ou si la formule utilisée est vraie dans la majorité des cas.
]

#item("Définition")[@PAPA[8.1]][
  Une *coupe* d’un graphe est un ensemble d’arête tel que leur retrait sépare le graphe. Le problème MIN-CUT est le problème d’optimisation qui cherche une coupe minimale, c’est à dire avec le moins d’arêtes.
]

#grid(
  columns: (60%, 40%), column-gutter: 1em,
  row-gutter: 0em,
  [
#item("Exemple")[@PAPA[5.1]][
  L’algorithme de *Karger* cherche une coupe d’un graphe en compressant tour à tour une arête au hasard, jusqu’à ce qu’il ne reste que 2 sommets, et renvoi l’ensemble des arêtes reliant ces deux sommets.
]
],[
#image("karger.svg", width: 80%)
])

#item("Propriété")[@PAPA[5.1]][
  L’algorithme de Karger renvoie une coupe minimale avec une probabilité supérieure à $1/(|S|^2)$.
]


#item("Définition")[Monte-Carlo/Las Vegas @TOR[9.6]][
  Il y a deux principaux types d'algorithmes probabilistes:
  
  #table(
    columns: 3, rows: 3,
    [], [*Réponse*], [*Temps de calcul*],
    [*Las Vegas*], [Toujours correct], [Statistiquement faible],
    [*Monte Carlo*], [Correct avec probabilité], [Déterministe],
  )
]

#item("Exemple")[@TOR[9.6]][
  Le *tri rapide* est un exemple d’algorithme de Las Vegas.
]

//@TOR[9.6.3]
@PAPA[1.3]
#item("Exemple")[Test de primalité][
  Pour tester la primalité d'un nombre, il est possible de se baser sur le petit théorème de Fermat:
  $ p "premier" => forall 1 <= a < p, a^(p-1) equiv 1 [p] $
  Si la formule n'est pas vérifiée, le nombre $p$ n'est pas premier. S'il l'est, alors $p$ est premier avec une certaine probabilité.
]

#item("Algorithme")[Test de primalité de Fermat][
  ```
  est_premier(N):
    répéter k fois:
      choisir a aléatoirement entre 1 et N-1
      si a**(N-1) % N != 1:
        renvoyer FAUX
    renvoyer VRAI
  ```
  On a alors:
  $ P("est-premier"(N) = "VRAI" | N "non premier") <= 1/2^k $
]

#item("Remarque")[][
  En réalité, cette majoration n'est pas toujours valide. En effet, le petit théorème de Fermat n'est pas une équivalence: il existe des nombres non premiers $N$ tels que l'exécution de $"est_premier"(N)$ renverrai toujours $"VRAI"$. De tels nombres sont appelés des nombres de *Carmichael*.
  
  Il s’agit donc d’un algorithme de Monte Carlo.
]

=== Classes de compléxité probabiliste @VAZ[A.4]


#let ZP = "ZP"
#let RP = "RP"
#let NP = "NP"
#let P = "P"
#item("Définition")[][
  On définit la classe de complexité *RP* (_Randomized polynomial _) comme les problèmes qui possèdent un algorithme de Monte Carlo qui rejette toujours une instance négative, et qui accepte au moins 1 fois sur 2 une instance positive.
]

#item("Propriété")[][
  $#P subset.eq RP subset.eq NP$
]

#item("Définition")[][
  On définit la classe de complexité *ZPP* (_Zero-error probabilistic polynomial_) comme comme les problèmes qui possèdent un algorithme de Las Vegas, dont le temps de calcul est polynomial en espérance.
]

#item("Propriété")[][
  $"ZPP" = RP inter "co"-RP$.
]

=== Dérandomisation@TOR[13.4.1.2]

#item("Problème")[][
  Le problème MAXSAT est un problème d’optimisation associé à SAT. Étant donné une formule propositionnelle en forme normale conjonctive, on cherche une valuation satisfiant un nombre maximal de clauses.
]

#item("Motivation")[][
  Le problème MAXSAT est NP-difficile, mais raisonner en termes de probabilités permet de construire un algorithme simple donnant une solution approché au problème.
]

#item("Théorème")[@TOR[Théorème 13.21]][
  Soit une formule $phi$ en FNC avec $c$ clauses de au moins $k$ littéraux indépendants, alors l’esperance $EE(phi)$ du nombre de clauses satisfaites par une valuation aléatoire vérifie~:
  $
  EE(phi) >= c(1-(a)/(2^k))
  $
]
#dev[
#item("Méthode")[Dérandomisation par l'espérance conditionnelle][
On peut construire un algorithme glouton dont les choix reposent sur des calculs d'espérances ce qui supprime le caractère aléatoire de l'algorithme.
]

#item("Propriété")[][
  Soit $phi$ une formule et $"opt"_phi$ le nombre maximal de clauses de $phi$ simultanément satisfiiable, alors la valuation renvoyé par la méthode 44 satisfait au moins $("opt"_phi) / 2$ clauses de $phi$.
]
#v(0.5em)
]

#recap()

===== Remarque

- Dans la tortue, il y a deux sections utilies pour cette leçon~: la section 9.6 sur les algorithmes probabilistes, et la section 13.4 sur les algorithmes d’approximation (en particulier pour la section)

#bibliography(read("../bib.yaml", encoding: none))
