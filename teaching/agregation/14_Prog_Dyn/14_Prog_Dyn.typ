#import "../../deps.typ": *
#show: tableau

#let a = v(60pt)

= Programmation dynamique. Exemples et Applications.

/*
/ Objectif : Présenter comment mettre en place des techniques de programmation dynamique sur des exemples concrets.
*/
== Principe

#item("Remarque")[@COR3[Notes 15]  Point Historique][
  R. Bellman commença  l'étude systématique de la programmation dynamique en le formalisant en 1955. Le mot "programmation" dans ce contexte comme dans celui de la programmation linéaire fait référence à l'utilisation d'une méthode de résolution tabulaire.
]

=== Optimalité de Bellman

// @COR3[15.1]

#item("Définition")[@BAR[6.3] Le principe d'optimalité de Bellman][
  affirme que la solution optimale d'un problème est obtenue en combinant les solutions optimales de ses sous problèmes.
]

#item("Algorithme")[@TOR[8.3.3.1] L'algorithme de Floyd Warshall][
  utilise cette formule pour appliquer la programmation dynamique.
]

#item("Remarque")[@COR3[15.3.c] Contre-exemple.][
  Dans le graphe définit précédemment le chemin le plus long entre $a$ et $c$ passe par $b$. Cependant le chemin le plus long entre $b$ et $c$ passe par $a$ et $d$. Le principe de Bellman ne s'applique pas.
]

=== Chevauchement sous problèmes

#item("Idée")[@NSIT[14 p.246]][
  Une approche récursive avec appel sur les sous problèmes nous mène tout d'abord à une méthode *"diviser pour régner"*. Lorsqu'il y a chevauchement, on va vouloir se rappeler des appels.
]


#item("Définition")[@COR3[15.3.b] Chevauchement.][
  Quand un algorithme récursif repasse sur le même problème constamment, on dit que le problème d'optimisation contient des *sous problèmes qui se chevauchent*.
]
#item("Définition")[@COR3[15.1.c] Le graphe des sous-problèmes][
  est un graphe orienté représentant les dépendances entre les appels récursifs des sous problèmes.
]
#item("Definition")[La suite de Fibonacci][
  est définie comme suit : $f_0 = f_1 = 1, forall n >= 2, f_n = f_(n-1) + f(n-2)$. Cette formule naturellement récursivement nous montre un bon exemple de chevauchement.
]
#item("Exemple")[Graphe des sous problèmes de Fibonnaci][pour $n = 5$.
  #align(center, canvas({
    import draw: *
    for i in range(6) {
      circle((i, 0), name: str(i), radius: 10pt)
      content(str(i))[#i]
    }
    for i in range(2, 6) {
      let dir = if calc.rem(i, 2) == 0 { ".north" } else { ".south" }
      let s = if calc.rem(i, 2) == 0 { 1 } else { -1 }
      bezier(str(i) + dir, str(i - 2) + dir, (i - 0.3, 1 * s), mark: (end: ">"))
      bezier(str(i) + dir, str(i - 1) + dir, (i - 0.4, 0.8 * s), mark: (
        end: ">",
      ))
    }


    circle((9, 0.5), radius: 0.2, name: "1")
    circle((10, 0), radius: 0.2, name: "2")
    circle((8, 0), radius: 0.2, name: "3")
    circle((10.5, -0.5), radius: 0.2, name: "4")
    circle((9.5, -0.5), radius: 0.2, name: "5")
    circle((7.5, -0.5), radius: 0.2, name: "6")
    circle((8.5, -0.5), radius: 0.2, name: "7")

    content("1")[4]
    content("2")[3]
    content("3")[2]
    content("4")[2]
    content("5")[1]
    content("6")[0]
    content("7")[1]
    content((11, -0.4))[$...$]

    line("1", "2", mark: (end: ">"))
    line("1", "3", mark: (end: ">"))
    line("2", "4", mark: (end: ">"))
    line("2", "5", mark: (end: ">"))
    line("3", "6", mark: (end: ">"))
    line("3", "7", mark: (end: ">"))
  }))
]


=== Programmation Dynamique

#item("Définition")[@COR3[15 Intro]][
  Le développement d'un algorithme de programmation dynamique se divise en quatre étapes :
  + caractériser la structure d'une solution optimale
  + définir récursivement la valeur d'une solution optimale
  + calculer la valeur d'une solution optimale, généralement de manière ascendante
  + construire une solution optimale à partir des informations calculées.
]

#item("Remarque")[@COR3[15.3.b]][
  Tandis que la programmation dynamique fait un choix éclairé à chaque étape, les *algorithmes gloutons* préfèrent prendre une décision hâtive mais localement intéressante pour augmenter les performances.
]

#let image_gray(l) = {
  let size = 14pt
  table(
    stroke: (x, y) => if x == 3 { 0.4pt + red } else if x == 0 {
      0.4pt + green
    } else { 0.4pt },
    columns: (size,) * 7,
    rows: size,
    fill: (x, y) => if x == 4 { red },
    ..l.map(i => table.cell(fill: luma(i))[])
  )
}


#grid(
  columns: (70%, 1fr),
  column-gutter: 1em,
  item("Application")[@TOR[9.4.2.1]][
    Soit une image de taille $w times h$ dont on a calculé le gradient d'incident lumineux. L'algorithme de *Seam Carving* pour compresser une image consiste à enlever les colonnes de sommes de luminosité~minimale.
  ],
  image_gray((
    255,
    253,
    255,
    250,
    250,
    240,
    200,
    255,
    0,
    255,
    255,
    170,
    170,
    170,
    0,
    0,
    0,
    170,
    170,
    170,
    170,
    255,
    0,
    250,
    255,
    170,
    170,
    170,
    0,
    250,
    0,
    255,
    255,
    255,
    255,
  )),
)
#item("Remarque")[][
  Une approche gloutonne n'est pas correcte (ligne verte) mais en $cal(O)(h)$. Une approche diviser pour régner pas efficace en $cal(O)(2^h * w)$. On utilise de la programmation dynamique (ligne rouge) sur le tableau définit par les pixels de l'image pour déterminer le chemin le plus cours en complexité $cal(O)()$. <  TODO
]

#dev[
  #item("Algorithme")[ABR Optimaux @COR3[15.5]][
    Si on a un ensemble de mots $m_1,...,m_n$ avec des probabilités associés $p_1,...,p_n$ on peut construire un arbre binaire de recherche optimal grâce à la programmation dynamique. Ici l'optimalité signifie qu'on minimise l'espérance du temps d'une requête sur l'ABR.
  ]
]



== Mise en Application

=== Approche Descendante

#item("Définition")[@NSIT[14 p.245] @TOR[9.4 p.527] La Mémoïsation][
  est une technique de programmation venant de la programmation fonctionnelle consistant à sauvegarder les valeurs des appels d'une fonction pure pour ne calculer qu'une seule fois son résultat pour une même entrée.
]

#item("Définition")[Approche descendante @COR3[15.1.b]][
  Une première approche pour le calcul d'un résultat de programmation dynamique est descendante avec mémoïsation. On écrit la procédure de manière récursive de façon naïve et on la modifie afin de sauvegarder le résultat de chaque sous-problème.
]

#item("Exemple")[@BAR[6.3.2.5] Distance d'édition][
  On souhaite comparer deux mots $u$ et $v$. On déﬁnit une distance, dite d’édition (ou de Levenshtein), égale au nombre d’opérations de suppression, ajout et remplacement minimum qui permettent de passer de $u$ à $v$.

  $P_(i j)$ est le calcul de la distance optimale $d(i, j)$ entre $u_1...u_i$ et $v_1...v_j$. On a alors pour $i in [|1, |u| |], j in [|1, |v| |],$

  $
    d(i,j) = "min"(d(i − 1, j) + 1, d(i, j − 1) + 1, d(i − 1, j − 1) + δ_(i j))
  $
  $"avec" δ_(i j) = cases(0 "si" u[i] = v[j], 1 "sinon")$ et $d(i, 0) = i, d(0, j) = j$.
]


=== Approche Ascendante

#item("Définition")[@COR3[15.1.b] Approche ascendante][
  Cette approche se base sur une notion de taille des sous-problèmes, dans le sens où résoudre un problème dépend uniquement de sous-problèmes plus petits. On peut donc calculer les sous-problèmes par taille croissante afin que lorsqu'on résout un sous-problème, tout ses sous-problèmes sont déjà résolus.
]

#item("Définition")[@BAR[6.3] Approche Itérative (ascendante)][
  L'approche ascendante est souvent implémenté de manière itérative en stockant les résultats des sous-problèmes dans un tableau.
]


#item("Exemple")[Somme d'un sous-ensemble @BAR[6.3.2.4]][
  Soit ${pi_1, ... , pi_n}$ un ensemble d'entiers. On note $cal(P)$ le problème de recherche du sous-ensemble $Q$ tel que : $sum_(pi_i in Q) pi_i <= M in NN$ soit maximal.
]
#item("Application")[][
  On s'intéresse au sous-problème $cal(P)_(i,p)$ de sélection d'un sous-ensemble de ${pi_1,...,pi_i}$ de somme inférieure à $p in [|0,M|]$. Si on note $v(i,p)$ la valeur de la somme de la solution du sous-problème $cal(P)_(i,p)$, on a la relation de récurrence suivante :

  #set math.mat(delim: ("{", none))
  $
    v(i,p) = mat(
      max (v(i-1,p) , pi_i + v(i-1,p-pi_i)) "si" pi_i <= p;
      v(i-1,p) "sinon"
    )
  $

  On résout ainsi $cal(P)$ en résolvant les $cal(P)_(i,p)$ par ordre lexicographique.
]

#grid(
  columns: (40%, 1fr), column-gutter: 1em,
  item("Exemple")[][
    Avec ${0, 1, 2, 3, 4, 5}$ et M = 7 on obtient de programmation dynamique suivant :
  ],

  /*
   */
  [
    #let tbl = (
      [i\\p],
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      2,
      0,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      3,
      0,
      1,
      2,
      3,
      3,
      3,
      3,
      3,
      4,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      6,
      5,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      6,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
    )

    #align(center, table(
      columns: (30pt,) + (20pt,) * 8,
      rows: (25pt,) + (18pt,) * 6,
      align: center,
      stroke: (x, y) => if x == 0 and y == 0 {
        (bottom: 1pt, right: 1pt)
      } else if x != 0 and y != 0 { 1pt } else { none },
      ..tbl.map(i => [#i])
    ))
    /*
    #let M = 7
    #let n = 5
    #canvas(length: 0.9em, {
      import draw:*
      let n = 7
      for i in range(n) {
        for p in range(n) {
          let col = red
          rect((p, i), (rel: (1, 1)))
        }
      }
      for i in range(n + 1) {
        for p in range(n + 1)  {
          content((i - 0.5, p + 0.5), [#tbl.at(i * n + p)])
        }
      }
    })
    */
  ]
)



#item("Exemple")[Rendu de Monnaie @NSIT][
  Une variante du problème de somme d'un sous-ensemble est le problème de rendu de monnaie. On cherche à rendre une somme de monnaie $S$ avec les pièces d'un système monétaire $M_n = {v_1,...,v_n}$ en minimisant le nombre de pièces rendues.
]

#item(
  "Remarque",
)[@COR3[15.1.b] Compromis Temps Mémoire ][ Le principe de programmation dynamique sauvegarde et réutilise les résultats de sous-problèmes déjà calculé au lieux de les recalculer à chaque fois. On réduit donc le temps de calcul au dépend du coût mémoire.]

#item(
  "Remarque",
)[Optimisation en Espace @TOR[9.4 p.529]][Certains problèmes de programmation dynamique ne nécessitent pas de connaître les solutions de tout les sous-problèmes. On peut donc économiser de l'espace en ne conservant que les solutions nécessaires au calcul des sous-problèmes de la taille supérieure.]

#item(
  "Exemple",
)[Fibonacci.][Par exemple pour calculer les nombres de Fibonacci, il suffit de garder en mémoire les deux derniers nombres calculé et pas l'entièreté du tableau.]

// #item("Exemple")[Catalan @COR3][ #a ]

#item(
  "Remarque",
)[@COR3[Notes] Galil et Park][ classent les algorithmes de programmation dynamique d'après la taille du tableau et le nombre d'autres éléments de tableau dont dépend chaque élément. Le problème des sommes des sous ensembles est donc en 1d/0d et Floyd Warshall en 3d/1d.
]


=== Reconstruction de la Solution

#item("Méthode")[@TOR[9.4 p.529] Construction Solution Optimale][
  Jusqu'à présent, on a calculé la valeur optimale associée au problème (longueur de la plus longue sous-séquence commune, somme du sous-ensemble maximal, ...). Pour obtenir la solution (sous-séquence, sous-ensemble, ...) correspondante à cette valeur optimale, il suffit de chercher un chemin optimal dans le graphe des sous-problèmes.
]

#dev[
  #item("Algorithme")[@TIGER CYK.][
    Soit une grammaire donnée en forme normale de Chomsky. L'algorithme de programmation dynamique de Cook Younger Kasami peut être utilisé pour vérifier si un mot appartient au langage reconnu en $cal(O)(|G|^3)$.
  ]
]

#item("Exemple")[@BAR[6.3.2.3] Sac à Dos][
  Le problème du sac à dos est une généralisation du problème de somme maximale d'un sous-ensemble. À chaque élément $i$ on associe un poids $w_i$ et un profit $p_i$. On cherche à maximiser le profit total que l'on peut faire rentrer dans un sac à dos de poids maximal $W$.
]
#item(
  "Application",
)[][On peut alors utiliser le même sous-problème que précédemment :
  $
    v(i,w) = mat(
      max (v(i-1,w) , p_i + v(i-1,w-w_i)) "si" w_i <= w;
      v(i-1,w) "sinon"
    )
  $
  On obtient la valeur optimale en calculant $v(n,W)$.
]


== Application non algorithmique : Partage Maximal (Hash-Concing)

#item("Définition")[@OCA[11.4] Le Hash Concing][
  consiste à applique le principe de mémoïsation à l’allocation mémoire. Si on a déjà alloué une donnée identique, alors on la réutilise plutôt que de l’allouer de nouveau. Si les données sont immuables, alors un tel partage est possible sans risque.
]

#item("Exemple")[@TOR[9.4 p.533] Listes Chaînées][
  Sur des listes chaînées en Ocaml, on peut écrire une fonction `cons` qui se comporte comme l'opérateur `::` mais qui implémente du hash-consing :
  #align(center)[```ocaml
  let l1 = cons 1 (cons 2 (cons 3 []))
  let l2 = cons 4 (cons 2 (cons 3 []))
  ```]
  donnera la situation suivante, où deux cellules sont partagées entre les deux listes :
  #align(center)[
    #image("hash-consing.png", width: 60%)
  ]
]

#recap()

===== Extension possible
- @COR3[15.4] Plus Longue Sous Séquence Commune
- @NSIT[14.2] Alignement de Séquence
- Anecdote orale sur l'origine du Hash-Consing (Lisp / Hashage)
- Ordonnancement de tâches @BAR[6.3.2.2]
- Découpe de Barre @COR3
- @BAR est une source intéressante bien que non nécessaire.
- Heuristique sur la reconstruction de la solution
- @BAR[6.3.2.1] @COR3[15.2] Multiplication matrices

===== Développements possible
- tout algorithme de programmation dynamique


#bibliography(read("../bib.yaml", encoding: none))
