#import "../../deps.typ": *
#show : tableau

#let rd = true
#let arrow_tilde = rd
#let arrowgrammar = if arrow_tilde {$~>$} else {$->$}

= Grammaires hors-contexte. Applications à l’analyse syntaxique.
// TODO: On manque de place, mais Martin disait que les p'tits paragraphes introductifs c'était cool

// #align(center, image("hierarchie.svg", width: 50%))


== Grammaires hors-contexte @CAR



/*
item("Definition")[Une grammaire hors-contexte][
  $G$ est un triplet $(T, V, P)$ où :
  - $T$ (terminaux) et $V$ (variables) sont des alphabets, finis et disjoints.
  - $S_0 in V$ est l'axiome, le non-terminal duquel on commence à dériver
  - $P$ est un sous-ensemble fini de $V times (T union V)^*$ appelé règles de production. On les note $X -> w_1 ... w_n$.
]
*/

#grid(columns: (65%, 140pt), column-gutter: 1em,

// Les expressions régulières ne permettent pas de reconnaître certains langages pourtant importants en pratique. Un exemple commun est celui des mots bien parenthésés.

// Pour se permettre plus de liberté, notamment dans le cadre des langages de programmation, on a donc recours aux *grammaires hors-contexte*.
item("Définition")[][
  $G = (S_0, T, V, P)$ est une grammaire hors-contexte où :
  - $T$ (terminaux) et $V$ (variables ou non-terminaux) sont des alphabets, finis et disjoints.
  - $S_0 in V$ est l'axiome, le non-terminal duquel on commence à dériver
  - $P$ est un sous-ensemble fini de $V times (T union V)^*$ appelées règles de production. On les note $X arrowgrammar w_1 ... w_n$.
],

image("hierarchie.svg", width: 130pt)
)

#item("Notation")[][
  Par convention, les mots dont les symboles appartient à :
  - $T$ sont denotés par des minuscules ($a$, $b$, ...)
  - $V$ sont denotés par des majuscules ($A$, $B$, ...)
  - $T union V$ sont denotés par des lettres grecques ($alpha$, $beta$, ...)
]

#item("Définition")[Relation de dérivation][
  // TODO à changer
  On peut dériver $s=alpha X beta$  en $s'=alpha omega beta$ si $X arrowgrammar omega$. On note cette dérivation $s -> s'$.
]

#item("Notation")[Clôture][
  De plus, on note $attach(->, tr: *)$ la clôture réflexive et transitive de $->$. Si $s_1 -> ... -> s_2$, alors $s_1 attach(->, tr: *) s_2$.
]

#item("Définition")[Mot engendré][
  Un mot $w in T^*$ est engendré par la grammaire $G$ si $S attach(->, tr: *) w$.
]

#item("Définition")[Le langage engendré][
  par une grammaire $G$ à partir du non-terminal $X$ est noté 
  $L_G (X) = {w in T^* | X attach(->, tr: *) w }$.
  Par convention, $L_G = L_G (S_0)$ dénote le langage engendré par $G$ à partir de son axiome.
]

//#item("Remarque")[][
  //Il est important de distinguer la grammaire de son langage engendré.
//]


#item("Exemple")[Langage des mots bien parenthésés][
  La grammaire
  $
  S &arrowgrammar S T quad quad S &arrowgrammar epsilon quad quad 
  T &arrowgrammar ( S )
  $
  // On avait deux notations pour l'axiome, des fois c'est S des fois c'est S0, je fix ça
  reconnaît le langage des mots bien parenthésés, aussi appelé langage de Dyck.
]


#item("Définition")[Dérivations][
  Soit un mot $s = w X alpha$ (resp $alpha X w$) avec $w in T^*$.  Appliquer une règle $X arrowgrammar x$ tels que $s -> w x alpha$ (resp $s -> alpha x w $) est une dérivation à *gauche* (resp *droite*).
]

#item("Lemme")[Fondamental][
  Pour $alpha = alpha_1 alpha_2$ et $beta$ quelconque, 
  $
  alpha ->^(k_1+k_2) beta <=> exists beta_1, beta_2, k_1, k_2 "tq" beta = beta_1 beta_2 "et" alpha_1 ->^(k_1) beta_1, alpha_2 ->^(k_2) beta_2
  $

  Cela signifie que l'on peut dériver un mot à gauche ou à droite de manière indépendante et équivalente.
]

#item("Remarque")[][
  Les grammaires hors-contexte sont aussi appelées "algébriques", car on peut montrer que les langages engendrés par les grammaires hors-contextes sont des solutions de systèmes d’équations polynomiales.
]

// Je pense on l'enlève en vrai nan ?
//#item("Théorème")[Théorème de Parikh (admis)][
//  Tout langage hors-contexte est commutativement équivalent à un langage rationnel.
//]

// Note : On admet ce théorème parce que sa preuve nécessite l’introduction des systèmes d’équations et totu pleins de trucs donc c’est lourd et ça rentre pas dans la leçon.

=== Transformations
/*
#item("Définition")[Grammaire réduite][
  Une grammaire est dite réduite si tous les non-terminaux sont accessible depuis $S_0$, et qu’il n’existe pas de non-terminal qui n’engendre rien.
]

#item("Définition")[Grammaire propre][
  Une grammaire est dite *propre* si elle ne contient aucune règle de la forme :
  $
  A &-> epsilon\
  A &-> A'
  $

  Autrement dit, aucune règle ne dérive seulement une variable ou le mot vide.
]

#item("Remarque")[][La grammaire reconnaissant les mots bien parenthésés n’est pas propre.]

#item("Propriété")[][Toute grammaire peut être rendue propre en perdant éventuellement le mot vide.]
*/

#item("Définition")[Forme normale de Chomsky][Une grammaire $G = (S_0, T, V, P)$ est en *forme normale de Chomsky* si toutes ses règles dont d’une des formes suivantes~:
  $
  A &arrowgrammar B C #h(10pt)&&"où" B, C in V\
  A &arrowgrammar a &&"où" a in T
  $
]

#item("Remarque")[][La forme normale de Chomsky est également appelé *forme normale quadratique*]

/* Caché parce qu’on parle plus des grammaires propres ?
#item("Propriété")[][
  Une grammaire en forme normale de Chomsky est nécessairement propre. En particulier, elle ne peut pas engendrer le mot vide.
]

#item("Propriété")[][
  Toute grammaire peut être mise en forme normale de Chomsky, en perdant éventuellement le mot vide.
]

*/

=== Arbre de dérivation @TIGER

#item("Définition")[Arbre de dérivation][
  L'application d'une règle de dérivation $X -> alpha_1 alpha_2 ... alpha_n$ peut-être vu comme un *arbre* ayant pour racine $X$ et pour sous-arbres des arbres de dérivation des $alpha_i$ produits.

  On peut ainsi représenter les applications successives de règles de dérivation par un *arbre de dérivation* ayant pour racine $S$.
]

/*
#item("Exemple")[][
  METTRE UN EXEMPLE D’UN ARBRE DE DÉRIVATION
]
*/

#item("Définition")[Ambiguïté d'une grammaire @TIGER][
  Une grammaire $G$ est ambiguë lorsqu'il existe au moins un mot appartenant au langage engendré $L_G$ pour lequel il existe deux arbres de dérivation distincts.

]
#item("Exemple")[Sinon en suspens][
  Avec la grammaire
  $
  &S arrowgrammar "if" E "then" S "else" S quad quad 
  && S arrowgrammar "if" E "then" S \
  &S arrowgrammar s_1 | s_2 quad quad
  && E arrowgrammar a | b
  $
  le mot "if a then if b then $s_1$ else $s_2$" possède deux arbres de dérivation~:
  //peut être interprété de deux manières~:\
  //- if a then { if b then $s_1$ else $s_2$}
  //- if a then { if b then $s_1$} else $s_2$
  #set text(size: 9pt)
  #grid(
    columns: (50%, 50%),
    align(center, canvas({
    import draw: *
    tree.tree(
      (
        [if],
        (
          [$a$],
        ),
        (
          [then],
          (
            [if],
            [$b$],
            ([then],[$s_1$])
          )
        ),
        (
          [else],
          [$s_2$]
        )
      ),
      draw-node: (node, ..) => {
        circle((), radius: .36, stroke: black)
        content((), node.content)
      },
      spread: 0.9,
      grow: 0.3
    )
    })),
    align(center, canvas({
    import draw: *
    tree.tree(
      (
        [if],
        (
          [$a$],
        ),
        (
          [then],
          (
            [if],
            [$b$],
            ([then],[$s_1$]),
            ([else], [$s_2$])
          )
        )
      ),
      draw-node: (node, ..) => {
        circle((), radius: .36, stroke: black)
        content((), node.content)
      },
      spread: 0.9,
      grow: 0.3
    )
    })),
  )
]

#item("Définition")[Langage inhéremment ambigu][
  On parle bien de *grammaire* ambiguë et non de langage. Il est possible de construire deux grammaire distinctes ayant le même langage engendré, avec l'une ambiguë et l'autre non.

  Cependant, il existe de langages *inhéremment ambiguës*, pour lesquels toute grammaire engendrant ce langage est ambiguë.
]

#item("Exemple")[][
  La grammaire
  $
  &S arrowgrammar M   &&S arrowgrammar U\
  &M arrowgrammar "if" E "then" M "else" M #h(30pt) &&M arrowgrammar s_1 | s_2\
  &U arrowgrammar "if" E "then" S #h(30pt) &&E arrowgrammar a | b\
  $
  reconnaît le même langage que précédemment, mais n’est pas ambiguë.
]

// Cet exemple ce prouve avec le lemme d’Ogden (la version plus générale du théorème précédent)
#item("Exemple")[][
  Le langage $L = {a^m b^m c^n | m,n >= 0} union {a^m b^n c^n | m,n >= 0}$ est inhéremment ambigu.
]

#item("Théorème")[Bar-Hillel, Perles et Shamir][
  Pour tout langage algébrique $L$, il existe $N > 0$ tel que pour tout mot $f in L$, si $|f| >= N$ alors on peut trouver une factorisation $f=alpha u beta v gamma$ telle que $|u v   > 0, |u beta v | < N$ et $alpha u^n beta v^n gamma in L$ pour tout $n>=0$.
]

#item("Remarque")[][
  Ce théorème est analogue au lemme de l’étoile dans le contexte des grammaires hors-contexte.
]

=== Automates à pile


#item("Ouverture")[Automate à pile][
  On peut étendre la définition d’un automate pour y ajouter une pile~: les transitions dépendent alors de l’état, de la lettre lue, et du sommet de la pile. On peut également choisir d’empiler ou de dépiler des éléments.
]

// Dessiner un exemple d’automate à pile ?

#item("Propriété")[][
  Un langage $L subset.eq A^*$ est algébrique si et seulement s'il existe un automate à pile qui accepte $L$.
]

== Analyse syntaxique @TIGER

#dev[
  #item("Algorithme")[Cocke-Younger-Kasami (CYK)][
    L'algorithme CYK est un algorithme d'analyse syntaxique sur les grammaires sous forme normale de Chomsky utilisant la programmation dynamique. Sa complexité en $O(|w|^3 + |P|)$ et sa flexibilité le rendent utile pour certaines tâches.
  ]
]

#item("Remarque")[][
  En pratique, l'algorithme CYK est trop lent pour être utilisable dans un compilateur. On préférera des algorithmes moins généraux, mais traitant un sous-ensemble choisi de languages en un temps de traitement linéaire.
]

/*
#item("Définition")[Forme Normale de Greibach][
  Une grammaire est en forme normale de Greibach si toutes ses règles sont de la forme :
  $
  S_0 &-> epsilon
  A &-> a A_1 A_2 ... A_n\
  $
]

#item("Prposition")[][
  La forme normale de Greibach élimine la récursion à gauche.
]
*/

=== Analyse syntaxique LL(1)
//#item("Définition")[Analyse descendante][]

#item("Définition")[Ensembles premiers, suivants et annulable][
  Soit une grammaire $G = (S_0,T,V,P)$, on définit~:
  - $"Annulable"(X)$, pour $X in V$ est vrai si $X attach(->, tr: *) epsilon$
  - $"Premiers"(gamma)$, pour $gamma in (T times V)^*$ est l’ensemble des terminaux pouvant commencer les mots dérivants de $gamma$
  - $"Suivants"(X)$, pour $X in V$ est l’ensemble des terminaux pouvant immédiatement suivre $X$, c’est à dire $t in "Suivants"(X)$ s’il existe une dérivation de la forme $Y ->^* omega X t$, avec $Y in V$ et $omega in (T times V)^*$.
  
]

#dev[
#item("Algorithme")[Calcul des ensembles premiers, suivants et annulables.][
  On peut calculer ces ensembles à l’aide d’un algorithme de recherche de point fixe. On initialise premiers et suivants aux ensembles vides, et annulables à tout faux.
  // Ptet pas giga pertinent, ça vire si on a pas la place, mais c’est bien de l’avoir là comme ça on à pas trop besoin de s’y attarder sur le dev LL1 et c’est pratik
  ```
  pour tout terminal Z
    premiers[Z] ← {Z}
  répéter
    pour chaque règle X → Y1Y2 · · · Y k
      si Y1 . . . Y k are tous annulable (ou si k = 0)
        alors annulable[X] ← vrai
      pour i de 1 à k, ji de i + 1 à k
        si Y1 · · · Y i−1 sont tous annulable (ou si i = 1)
          alors premiers[X] ← premiers[X] ∪ premiers[Y i ]
        si Y i+1 · · · Y k sont tous annulable (ou si i = k)
          alors suivants[Y i ] ← suivants[Y i ] ∪ suivants[X]
        si Y i+1 · · · Y j −1 sont tous annulable (ou si i + 1 = j )
          alors suivants[Y i ] ← suivants[Y i ] ∪ premiers[Y j ]
  tant que premiers, suivants, et annulables n’ont pas changé
  ```
]
]

#item("Définition")[Méthode LL(1)][
  La méthode d’analyse syntaxique LL(1) (pour *Left* to right, *Leftmost* derivation, 1, de gauche à droite, dérivation gauche, en regardant 1 token) consiste à déterminer quelle règle de la grammaire appliquer en lisant 1 token, de gauche à droite.\
  On dit alors qu’un langage est LL(1) si il est reconnu par un analyseur LL(1).
]

#item("Propriété")[Grammaire LL(1) @COMPI][
  Une grammaire $G$ est dite LL(1) si et seulement si, pour tout non-terminal $N$, avec les règles de productions $N arrowgrammar alpha_1, ..., N arrowgrammar alpha_n$
  - Les ensembles $"Premiers"(alpha_1)$, ..., $"Premiers"(alpha_n)$ sont disjoints deux à deux
  - Si de plus on a $"Annulable"(N)$, alors $"Suivants"(N)$ est disjoint de chaque $"Premiers"(alpha_i)$
]

#item("Exemple")[][
  La grammaire
  $
  &S arrowgrammar +S S quad quad
  S arrowgrammar T quad quad
  &T arrowgrammar "id"  quad quad
  T arrowgrammar "num"
  $
  est LL1. On peut construire la table suivante~:
  #set align(center)
  #table(
    columns: (auto, 20%, 20%, 20%),
    align: center,
    [], [*+*], [*id*], [*num*],
    [*S*], [$S arrowgrammar +S S$], [$S arrowgrammar T$],[$S arrowgrammar T$],
    [*T*], [], [$T arrowgrammar "id"$], [$T arrowgrammar "num"$]
  )
  #set align(left)
  qui nous donne, pour chaque état, pour chaque token lu, quelle règle doit être appliquée.
  /*
  Pour la grammaire
  $
  &Z -> d #h(50pt) &&Z -> X Y Z\
  &Y -> &&Y -> c\
  &X -> Y &&X -> a
  $
  on peut construire la table

*/

]

/*
#item("Définition")[Regard en avant (lookahead)][
  Le paramètre $k$ détermine le nombre de symboles que l'algorithme peut stocker.
  
  Par exemple, un analyseur syntaxique LL(1) peut regarder 1 symbole après celui qu'il traite actuellement.

  Les analyseur syntaxiques LL(0) traitent les symboles individuellement.

  En général, un analyseur LL($k + 1$) permet de traiter plus de grammaires qu'un analyseur LL($k$).
]
*/

#item("Définition")[Récursivité à gauche][
  Une grammaire est récursive à gauche si elle contient une règle de production de la forme :
  $A arrowgrammar A omega$.
]

#item("Proposition")[][
  Certains langages ne sont pas analysables par un algorithme LL($1$). C'est notamment le cas des grammaires récursives à gauche.

  /*
  @TIGER
  $
  E &-> E + T\
  E &-> T\
  T &-> id\
  T &-> id(E)\
  T &-> "num"
  $
  */
]

#dev[
  #item("Transformation")[Élimination de la récursion à gauche @TIGER[3.2]][
    Certains langages sont LL($k$), mais leur grammaire peut-être donnée récursive à gauche.
    On peut transformer ces grammaires de sorte à pourvoir les donner en entrée d'un analyseur LL($k$).
  ]
]

#item("Proposition")[Complexité de l'analyse LL(1)][
  L'algorithme est de complexité linéaire en la taille du mot d'entrée.
]

//=== Autres algorithmes

#item("Exemple")[LR($k$)][
  Il existe d’autres méthodes d’analyse syntaxique, par exemple en faisant des dérivations droite au lieu de dérivations gauche, donnant les algorithmes LR($k$).
]

#item("Pratique")[Générateur d'analyseur syntaxique][
  En pratique, on utilise des programmes comme `Yacc`, `Bison`, `Menhir` ou `antlr` pour générer automatiques un analyseur syntaxique à partir d'une grammaire.
]

#item("Pratique")[Résolution d’ambiguïté][
  Certaines ambiguïtés inhérentes peuvent se résoudre avec des règles ad-hoc.
]

#item("Exemple")[Problème du sinon en suspens][
  Les grammaires acceptant à la fois les formes `if () then ()` et `if () then () else ()` sont souvent ambigus, mais on peut résoudre ce problème en choisissant de toujours lier un `else` au `if` le plus proche.
]


/*
#item("Proposition")[@COMPI][
  Il existe des grammaires LR($1$) qui ne sont pas LL($1$).

  // #align(center, image("parsers.png", height: 30%))
]
*/

#recap()

#colbreak()
===== Remarque
  
#if (not arrow_tilde) [
 #emoji.warning Attention #emoji.warning La notation "$->$" est, par abus de notation, utilisée de multiples fois lorsque l'on décrit les grammaires.


Voici un exemple qui détaille cette notation abusive :

#let fv = text(green, $->$)
#let fr = text(red, $->$)
#let fb = text(blue, $->$)
#quote[
Depuis une grammaire avec $S$ comme axiome et les règles suivantes:
$
S &fv a C a B \
B &fv b + b b\
C &fv c
$

On peut obtenir par dérivation $a a C a B fr a a c a B$ et,
$c B B fr c B b b $ \
et par clôture réflexive transitive :
$S fb a c a b $ et
$S fb a c a b b $
]

On pourra désambiguer en écrivant : 
- $~> "pour" fv$ (règle d'une grammaire non contextuelle)
- $-> "pour" fr$ (dérivation avec contexte)
- $attach(->, tr: *) "pour" fb$ (ici c'est bien la cloture reflexive transitive)

Typiquement la litérrature @CAR @TIGER conserve l'ambiguité et fait plutôt le choix d'écrire :
- $-> "pour" fv$
- $-> "pour" fr$
- $attach(->, tr: *) "pour" fb$

Pédagogiquement la notion sans ambiguité exprime les différences entre dérivation avec et hors contexte. Cependant il peut être plus simple pour un débutant de ne pas faire de différence.
]

#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Benjamin Voisin & Aloïs Rautureau
]