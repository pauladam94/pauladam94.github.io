#import "../../deps.typ" : *
#show : tableau

// TODO: dans les repr graphiques d'arbres binaires, ne pas entourer les arbres vides

= Arbres, Représentation et applications @TOR

Ce plan prend parti de ne pas de suivre l'ordre chronologique qu'aurait un cours, mais de mettre en avant le lien entre les arbres, leurs applications et les autres parties du programme.

// À la main, découpage visuel qui regroupe Déf + App

== Arbres binaires
=== Définitions
#item("Définition")[Les arbres binaires][
  sont définis inductivement comme:
  - Soit l'arbre vide, qu'on notera $V$
  - Soit un nœud $N(e, g, d)$ où $e$ est l'étiquette du nœud, $g$ (resp. $d$) est le sous-arbre _gauche_ (resp. _droit_). On dit que $g$ et $d$ sont les *enfants* de $N(e, g, d)$, et que $N(e, g, d)$ est le *parent* de $g$ et $d$.
]

#item("Définition")[][
  Un nœud qui n'a pas de parent est appelé *racine*.
]

#item("Représentation")[Arbres binaires en OCaml, C et Python][

#set text(11pt)
#align(center, grid(
  columns: (8.5em, 9.2em, 17.5em), 
  column-gutter: 0.7em,
  block(stroke:0.0pt, width: 100%)[
```ocaml
type 'a arbre =
| Vide
| Noeud of 'a 
         * 'a arbre  
         * 'a arbre
```
    ],
    block(stroke:0.0pt,width: 100%)[
```c
struct arbre {
  int val;
  struct arbre* droit;
  struct arbre* gauche;
}
```
    ],
    block(stroke:0.0pt, width: 100%)[
```python
class Arbre:
  def __init__(self, val, gauche, droit):
    self.val = val
    self.droit = droit
    self.gauche = gauche
      ```
    ]
  ))
]


#grid(columns: (55%, 1fr), column-gutter: 1em,
item("Exemple")[Les expression arithmétiques][
  peuvent être représentées sous la forme d'un arbre binaire dans lequel les opérandes sont les sous-arbres de l'opération à effectuer.
],
[
#align(center, canvas({
    import draw: *;
    
    tree.tree((
      $times$,
      (
        $+$,
        ($2$, $V$, $V$), 
        ($3$, $V$, $V$),
      ),
      (
        $5$,
        $V$,
        $V$
      )
    ),
    draw-node: (node, ..) => {
      if node.content != $V$ {
        circle((), radius: .35, stroke: black)
      }
      content((), node.content)
    },
    grow: 0,
    spread: 0.7
  )
  }))

  L'étiquette de la racine de cet arbre est $times$.
]
)
#item("Définition")[Une feuille][
  est un arbre dont les deux sous-arbres sont vides.
  Dans l'exemple ci-dessus, les feuilles sont $2$, $3$ et $5$.
]

#item("Définition")[Un nœud interne][
  est un nœud qui n'est pas une feuille.
]

// Faire une définition de la hauteur par induction plutôt ?
#item("Définition", show-title:false)[Profondeur][
  À chaque nœud d'un arbre on associe une *profondeur*.La profondeur de la racine est $0$. Dans un nœud $N(e, g, d)$, la profondeur des racines de g et de d est 1 plus la profondeur de $N(e, g, d)$.
]

#item("Définition")[Hauteur][
  La hauteur d'un arbre est le maximum de la profondeur de ses feuilles.
]

/*
#item("Définition")[La hauteur][d'un arbre est définie comme la longueur du plus long chemin entre la racine et une feuille. Par convention, la hauteur d'un arbre vide est $-1$.
  La hauteur de l'exemple est 2.
]
*/

// le poids est défini ici par induction ?
#item("Définition", show-title:true)[Le poids][
  Si on a une fonction poids $P$ pour les étiquettes d'un arbre, on peut l'étendre à l'arbre par  :
  - $P(N(e, g, d)) = P(e)$ si $N(e, g, d)$ est une feuille
  - $P(N(e, g, d)) = P(e) + P(g) + P(d)$ sinon
]

#dev[
#item("Application")[Algorithme de Huffman.][
  On peut utiliser des propriétés sur le poids des arbres binaires pour compresser un message en utilisant l'algorithme de Huffman.
]
]
/*
  draw-node: (node, ..) => {
    circle((), radius: .35, fill: blue, stroke: none)
    content((), text(white, [#node.content]))
  },
  draw-edge: (from, to, ..) => {
    let (a, b) = (from + ".center", to + ".center")
    line((a, .4, b), (b, .4, a))
  }
*/

=== Parcours et ordres sur les arbres
// Bien penser à parler de pile/file
#item("Définition")[Le parcours en profondeur][
  suit la définition inductive des arbres: pour chaque nœud, on parcours ses sous-arbres un-à-un jusqu'à atteindre une feuille.

  #align(center, grid(
    columns: (33%, 33%, 33%),
    [
      Ordre préfixe

      #canvas({
        import draw: *;
    
        tree.tree((
          $1$,
          (
            $2$, 
            $3$,
            $4$,
          ),
          $5$
        ),
        draw-node: (node, ..) => {
          circle((), radius: .35, stroke: black)
          content((), node.content)
        },
        grow: 0,
        spread: 0.7
        )
      })
    ],
    [
      Ordre infixe

      #canvas({
        import draw: *;
    
        tree.tree((
          $4$,
          (
            $2$, 
            $1$,
            $3$,
          ),
          $5$
        ),
        draw-node: (node, ..) => {
          circle((), radius: .35, stroke: black)
          content((), node.content)
        },
          grow: 0,
          spread: 0.6

      )
      })
    ],
    [
      Ordre postfixe

      #canvas({
        import draw: *;
    
        tree.tree((
          $5$,
          (
            $3$, 
            $1$,
            $2$,
          ),
          $4$
        ),
        draw-node: (node, ..) => {
          circle((), radius: .35, stroke: black)
          content((), node.content)
        },
          grow: 0,
          spread: 0.6

      )
      })
    ],
  ))

  On fera le lien avec la structure de *pile* (premier entré, dernier sorti).
]

// Mettre ici notation polonaise inversée ?

#grid(
  columns: (22em, auto), column-gutter: 1em,
  row-gutter: 1em,
  item("Définition")[Parcours en largeur][
  Ce parcours traite les nœuds de l'arbre par hauteur croissante, de la gauche vers la droite. On fera le lien avec la structure de *file* (premier entré, premier sorti).
],
grid.cell(
  rowspan: 2,
  align(center + horizon, canvas({
  import draw: *;
  tree.tree((
    $1$,
    (
      $2$, 
      $4$,
      (
        $5$,
        $6$
      )
    ),
    $3$
  ),
  draw-node: (node, ..) => {
    circle((), radius: .35, stroke: black)
    content((), node.content)
  },
    grow: 0.5,
)
}))),
item("Définition")[Ordre induit][
  Numéroter les nœuds par leur ordre de visite pour un parcours permet de les munir d'un ordre. Par exemple, l'ordre postfixe permet d'ordonnancer des tâches.
]
)


== Formes spécifiques d'arbres binaires
=== Arbre binaire complet
// C'est la définition canonique vous êtes sûrs ?
// Je croyais que c'était lorsque tout les étages étaients complets
// Un étage n étant l'ensemble des noeud à profondeur n 
#item("Définition", show-title:false)[Arbre binaire parfait][
  Un arbre binaire est *parfait* si  chacun de ses nœuds internes a pour sous-arbres soit deux nœuds internes, soit deux feuilles.
  Dit autrement, tous ses étages sont entièrement remplis.
]

#item("Définition", show-title:false)[Arbre complet à gauche][
  Un arbre est *complet* si un parcours en largeur ne passe pas par un nœud interne après être passé par une feuille.
  Dit autrement, tous les étages sont complets sauf éventuellement le dernier; et dans celui-ci les feuilles sont le plus à gauche possible.
]

#item("Propriété", show-title:false)[Inégalités entre hauteur et nombre de nœuds.][
  Pour tout arbre binaire de hauteur $h$ ayant $n$ nœuds,
  
  #align(center)[$h + 1 <= n <= 2^(h+1) -1$]
]



// Les arbres presque-complets aussi, LIENS TAS (après) ?
// numérotation sosa stradonitz
// Ne fonctionne pas avec la Définition 13
#item("Représentation")[Les arbres binaires complets peuvent être représentés en tableaux][
  , on retrouve alors le sous-arbre gauche (resp. droit) d'une racine $i$ à l'indice $i times 2$ (resp. $i times 2 + 1$).
]


// Typiquement, dans cet exemple, l'arbre est complets au sens de la def 13 mais pas au sens de François Schwarzentruber
// https://people.irisa.fr/Francois.Schwarzentruber/algo1/02tas.pdf
#item("Exemple", show-title:false)[Expression arithmétique comme tableau][
  L'expression arithmétique $(2 + 3) times 5$ est représentée comme arbre binaire par le tableau $[times, plus, 5, 2, 3]$.
]

=== Tas

// Définition d'un arbre croissant (cf sujet ens info 2014)
// Un tas doit aussi être presque complet
#item("Définition")[Un tas min][
  (resp. max) est un arbre binaire  tel que pour tout nœud $N(e, g, d)$ et tout $e' in g union d$, on aie $e' >= e$ (resp. $e <= e'$).

  Autrement dit, l'élément de plus petite (resp. plus grande) étiquette de chaque sous-arbre est à la racine du sous-arbre.
]

// en place avec l'utilisation de la représentation 14
#dev[
#item("Application")[Le tri par tas][
  est un tri utilisant une structure de tas, et
  ayant une complexité en
  $O(n log n)$, ce qui est optimal pour un tri par comparaison. On commence par construire un tas des éléments à trier, puis on retire successivement la racine.
]
]


// Manque les complexités de la file de priorité ? 
#item("Application")[File de priorité][
  Le type abstrait de file de priorité a plusieurs implémentations utilisant des tas. Par exemple les files gauches ou les tas de Fibonacci.
]

=== Arbre binaire de recherche
#item("Définition", show-title:false)[Arbres binaires de recherche (ABR)][
  Un *arbre binaire de recherche* (ou ABR) est un arbre binaire tel que pour chaque nœud $ N(e, g, d)$, si $e' in g$ alors $e' < e$ et si $e' in d$ alors $e < e'$.
]

#item("Proposition")[ABRs et complexité.][
  Les opérations de recherche et d'insertion d'un élément dans un ABR peuvent être faites en $O("hauteur de l'arbre")$.
]

#item("Idée")[ABRs équilibrés][
  Si on équilibre la longueur des différentes branches d'un ABR, cela améliore la complexité. 
  //Différentes variantes d'ABRs, telles que les *arbres bicolores*, arrivent ainsi à garantir une complexité en $O(log ("Nombre d'éléments"))$.
]

#item("Définition")[Les arbres bicolores][
  sont des ABRs où on associe à chaque nœud l'une de deux couleurs (par exemple "rouge" et "noir") et on préserve les invariants de structure suivants:
  - Le parent d'un nœud rouge n'est jamais un nœud rouge
  - Tout chemin de la racine à une feuille a le même nombre de nœuds noirs.
]

#item("Propriété")[La hauteur d'un arbre bicolore][
  ainsi que la complexité d'y rechercher et insérer un élément sont en $O(log("Nombre d'éléments"))$.
]

//#item("Application")[Arbres k-dimensionnels][]



== Arbres n-aires et arbres d'arité arbitraire
=== Généralisation des arbres binaires
#item("Remarque")[Arbres n-aires][On peut généraliser la notion d'arbres binaires à des arbres n-aires, où chaque  nœud a jusqu'à $n$ enfants.]

#item("Remarque", show-title:false)[][Les listes sont des arbres unaires.]

#item("Application", show-title:true)[Bases de données][
  Certains Systèmes de Gestion de Bases de Données utilisent des *B-arbres*, qui peuvent être vus comme une *généralisation des arbres binaires de recherche* à une arité supérieure.
]


#item("Définition", show-title:false)[Arbres d'arité arbitraire][
  On définit les *arbres d'arité arbitraire* inductivement comme étant un nœud $N(e, s)$ où $e$ est l'étiquette de l'arbre et $s$ est une liste de sous-arbres.
  Dans la suite, on écrira juste *arbre* pour *arbre d'arité arbitraire*.
]

#item("Définition", show-title:false)[Forêt][
  Un ensemble de plusieurs arbres est  une *forêt*.
]


#item("Représentation")[Arbres en OCaml, C et Python][
  #set text(size: 11pt)
  #grid(
    columns: (28%, 12em, 14em), 
    column-gutter: 1em,
    [
      ```ocaml
      type 'a arbre =
      | Vide
      | Noeud of 'a 
               * 'a arbre list
      ```
    ],
    [
      ```c
      struct arbre {
        int valeur;
        struct arbre* sous_arbres;
        int    nb_sous_arbres; 
      }
      ```
    ],
    [
      ```python
      class Arbre:
        def __init__(self, valeur):
          self.valeur = valeur
          self.sous_arbres = []
      ```
    ]
  )
]


#item("Remarque")[Les arbres d'arité arbitraire][
  sont une généralisation des arbres binaires.
  Les définitions données pour les arbres binaires
  (feuille, profondeur, hauteur, etc...)
  peuvent être transposées aux arbres aisément.
]


// À l'oral: l'autre sens (arbres binaires en tant qu'arbres d'arité arbitraire) est immédiat.
#item("Représentation")[Un arbre peut être représenté comme un arbre binaire][
  dans lequel le sous-arbre gauche correspond au premier enfant du nœud, pendant que le sous-arbre droit correspond à l'éventuel frère suivant du nœud.

  #align(
    center,
    grid(
      align : center + horizon,
      columns: (40%, 10%, 1fr),
      rows: 70pt,
  
  canvas({
    import draw: *;
    tree.tree((
      [a],
      ([b],
      [e]
      ),
      [c],
      [d]
    ),
    draw-node: (node, ..) => {
      circle((), radius: .35, stroke: black)
      content((), node.content)
    },
    grow: 0.3,
    spread: 0.4
  )})
,
[$-->$], // J'arrive pas à mettre une flèche alignée avec les dessins
canvas({
    import draw: *; 
  
  tree.tree((
    [a],
    ([b],
    ([e],
    $V$,
    $V$
    ),
      ([c],
      $V$,
      ([d],
        $V$,
        $V$
      )
      ) 
      ),
      $V$
    ),
    draw-node: (node, ..) => {
      if node.content != $V$ {
        circle((), radius: 0.35, stroke: black)
      }
      content((), node.content)
    },
    grow: 0.18,
    spread: 0.8
  )
  }))
)
]

=== Arbres et structures hiérarchiques

#grid(
  columns: (20em, auto), column-gutter: 1em,
  row-gutter: 0.5em,
item("Remarque", show-title:false)[Hiérarchie][
  Les arbres sont souvent utilisés pour modéliser des structures hiérarchiques.  
],
grid.cell(rowspan: 3)[
  #align(center, canvas({
    import draw: * 
    tree.tree((
      `<html>`,
      (
        `<p>`, 
        `<b>`,
        `<i>`,
        (
        `<img>`,
          `<href>`
        )
      ),
      `<h2>`,
      `<h3>`
    ),
    draw-node: (node, ..) => {
      circle((), radius: .4, stroke: 0pt+black)
      content((), node.content)
    },
    grow: 0.6,
    spread: 0.2
  )
  }))
],
item("Exemple")[Page HTML][
  Le format HTML représente un document sous forme d'arbre $n$-aire. 
  // Chaque balise représente un nœud, et les éléments se trouvant entre une balise ouvrante et la balise fermante correspondante sont les descendants de la balise en question.

],
item("Application")[Un arbre de syntaxe][
  est une représentation sous forme d'arbre d'un terme (programme, formule booléenne, etc...).
]
)

// Structures de données



#item("Application", show-title:false)[Système de fichier][
  La hiérarchie d'un *système de fichiers* peut être représentée comme un arbre où les répertoires sont des nœuds internes tandis que les fichiers sont des feuilles.
]


#item("Application")[Arbres d'inférence][
  Quand on définit une *relation* de manière *inductive*, cela donne lieu à des *arbres de dérivation*. En particulier, quand la relation est une déduction on parle d'*arbre d'inférence* ou d'*arbre de preuve*.
]

=== Arbres et algorithmique

// Representation de foret as tableau parents 
// => Lien avec représentation
#dev[
  #item("Application")[Unir-trouver][
      La structure "unir-trouver", qui permet de représenter des classes d'équivalence, est implémentée efficacement via des arbres.
    ]
]

#item("Remarque")[][
    Unir-trouver est utilisé dans la recherche d'arbre couvrant minimal par l'algorithme de Kruskal.
  ]

#item("Représentation")[Implicite][
  Un arbre peut être représenté implicitement par des appels de fonctions le parcourant.

  C'est le cas pour les méthodes par Séparation-Évaluation (_Branch and bound_) et retour sur trace (_bactracking_).
  
  C'est également le cas pour l'algorithme _min-max_,
  qui parcoure implicitement l'arbre des configurations d'un jeu.
]

#item("Remarque")[][
  Inversement, les appels de fonctions peuvent être vu comme des abres. En particulier en cas d'activations multiples (méthode _diviser pour régner_, par exemple).
]

// Le mettre plus tôt
#item("Remarque")[_Hash-consing_][Quand on représente un arbre, on peut économiser de l'espace mémoire en ne représentant qu'une seule fois chaque sous-arbre, avec une méthode appelée _hash consing_.]

=== Arbres et graphes

#item("Remarque")[][Les arbres sont des graphes connexes non-orientés acycliques enracinés.]

#item("Remarque")[Arbre couvrant minimal][
  Inversement, on peut vouloir extraire un arbre couvrant minimal d'un graphe. C'est utile, par exemple, pour l'algorithme de 2-approximation du problème du voyageur de commerce dans le cas euclidien.
]
 
#recap()


====== Notes
- La difficulté est de rendre le plan "vivant", on ne veut pas juste un catalogue de définitions ni d'applications.

====== Éventuels autres liens avec le programme n'apparaissant pas dans le plan actuel
- Arbres k-dimensionnels (Prépa 14A)
- En POO la hiérarchie des classes est un arbre (hors héritage multiple)
- Les circuits combinatoires (COMP 1A) peuvent être vus comme des arbres, c'est possiblement un exemple plus concret.

====== Autres devs possibles
- Tri par tas est un bon dev, et il fait gagner de la place dans le plan
- Huffman
- Arbres bicolores 
- ABRs optimaux
- Splay trees
- ID3
- Unir-trouver

#bibliography(read("../bib.yaml", encoding: none))

#authors[Aloïs Rautureau & Santiago Sara Bautista]
