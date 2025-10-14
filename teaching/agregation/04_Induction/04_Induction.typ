#import "../../deps.typ" : *
#show : tableau

#let todo = text(red, 10pt)[todo]

= Principe d'induction @MPLI

== Récurrence
=== Raisonnements par récurrences sur $NN$

#item("Théorème")[@MPLI[Th 3.1] Premier principe d’induction][
  Soit $P(n)$ un prédicat dépendant de l’entier $n$. Si les deux conditions suivantes sont vérifiées~:
  $
  cases(
    P(0) "est vrai",
    forall n in NN (P(n) => P(n+1))) ==> 
   forall n in NN, P(n) "est vrai."
  $
  
]

#item("Remarque")[][
  On appelle la vérification de $P(0)$ l’_Initialisation_, et la vérification que $P(n) => P(n+1)$ l’_Hérédité_.
]

#item("Remarque")[][
  On peut généraliser le théorème précédent avec un entier de départ $n_0$ quelconque, à la place de $0$~:
  $ cases(
      P(n_0) "est vrai",
      forall n >= n_0 (P(n) => P(n+1))
    ) ==> 
    forall n >= n_0, P(n) "est vraie"
  $
]

#item("Exemple")[@MPLI[Ex 3.3]][
  On peut montrer par récurrence $Sigma_(i = 1)^n i = n(n+1)/2$
]

#item("Théorème")[@MPLI[Th 3.4] Deuxième principe d’induction (Récurrence forte)][
  Soit $P(n)$ un prédicat dépendant de $n$, Si la proposition suivante est vérifiée~:
  $ cases(
      P(0) "est vrai", 
      forall n in NN ((forall k < n, P(k)) => P(n))
    )
    ==> forall n in NN, P(n) "est vraie".
  $
]

#item("Remarque")[@MPLI[Rem 3.5.1]][
  Le premier point est redondant avec le second. En effet, pour $n=0$, on a $forall k < 0 P(k) => P(0)$, or comme il n’existe pas d’entiers strictement plus petit que 0, il faut prouver $P(0)$.
]

#item("Remarque")[@MPLI[Rem 3.5.2]][
  De même que pour le premier principe d’induction, on peut commencer à partir d’un entier $n_0$ quelconque.
]

#item("Remarque")[@MPLI[Rem 3.5.3]][
  Sur $NN$, les deux principes d’induction sont équivalent.
]

#item("Remarque")[Invariants de boucle][
  Étant donnés un algorithme et une boucle de cet algorithme, un *invariant de boucle* est une propriété qui, quelles que soient les entrées valides fournies à l’algorithme~:
  - est valide avant le premier tour de boucle
  - est préservée par chaque tour de boucle
  Alors, l’invariant est vérifié à la fin de l’exécution de la boucle.
]
#dev[
  #item("Exemple")[@TOR][Il est possible de prouver la correction de l’algorithme de Dijktsra en utilisant une preuve par récurrence d’un invariant de boucle.]
]

=== Relation d’ordre @MPLI[2]

#item("Définition")[@MPLI[Def 2.1] Relation d'ordre][
  Une relation d'ordre $cal(R)$ sur un ensemble $E$ est une relation binaire :
  - réflexive : $forall x in E, x cal(R) x$
  - antisimétrique : $forall x,y in E, x cal(R) y and y cal(R) x => x = y$
  - transitive : $forall x,y,z in E, x cal(R) y and y cal(R) z => x cal(R) z$
  On dit que la relation est totale si : $forall x != y , x cal(R) y or y cal(R) x$
]

#item("Définition")[@MPLI[Def 2.11] Ensemble ordonné][
  Un ensemble ordonné $(E,<=)$ est un ensemble muni d'une relation d'ordre $<=$.
]

#item("Exemple")[@MPLI[Ex 2.12]][
  Les entiers naturels $NN$ peuvent être muni de l'ordre naturel $<=$ mais aussi de l'ordre $|$ de divisibilité.
]

// Less Than
#let lt(number) = {
  $attach(br:number,<=)$
}

#item("Définition")[@MPLI[2.2.3]Produit d'ensemble ordonnés][
  Soient $(E_1, lt(1))$ et $(E_2,lt(2))$ deux ensembles ordonnés. 
  Le produit direct de ces deux ensembles est $(E_1 times E_2, lt("dir"))$ avec la relation $<=$ définie par $(x_1,x_2) lt("dir") (y_1,y_2) <=> x_1 lt(1) y_1 "et" x_2 lt(2) y_2 $.

  Il est aussi possible de munir $E times F$ de l'ordre lexicographique $lt("lex")$ définie par $(x_1,x_2) lt("lex") (y_1,y_2) <=> x_1 lt(1) y_1 "ou" (x_1 = x_2 "et" x_2 lt(2) y_2) $.
]

#item("Définition")[@MPLI[2.2.3]Ordre léxicographique général][
  On peut généraliser l'ordre léxicographique à des séquences de taille arbitraires. Si $(Sigma,<=)$ est un alphabet ordonné, on définit l'ordre $lt("lex")$ par $u lt("lex") v$ si et seulement si :
  - soit u est un préfixe de v
  - soit $exists " " k, u_1...u_k = v_1...v_k$ et $u_(k+1) <= v_(k+1)$
]

#let insec = [~]
#item("Définition")[@MPLI[Prop 2.21]][
  Un élément $x$ est dit *minimal* si
  $ forall y in  E, y <= x => y = x $
]
@TOR
#item("Définition")[Ensemble bien fondé][
  Une relation d'ordre $<=$ sur un ensemble $E$ est bien fondée s'il n'y a pas de suite infinie strictement décroissante d'élément de $E$.
]

#item("Exemple")[][
  $NN$ munit de l'ordre naturel est un ensemble bien fondé. $ZZ$ ne l'est pas.
]

#item("Exemple")[][
  Avec un alphabet $Sigma$ contenant au moins deux lettres $a < b$, l'ordre lexicographique sur $Sigma^*$ n'est pas bien fondé. La suite $(a^n b)_NN$ est infinie décroissante.
]

#item("Proposition")[][
  Un ensemble ordonné $(E,<=)$ est bien fondé si et seulement si toute partie non vide de $E$ admet au moins un élément minimal.
]

#item("Proposition")[][
  Si $(E,lt(E))$ et $(F,lt(F))$ sont des ensembles bien fondé alors l'ordre lexicographique $lt("lex")$ est bien fondé sur $E times F$.
]

=== Induction bien fondée

#item("Théorème")[][
  Soit $(E,<=)$ un ensemble bien fondé et $P$ une proposition dépendant d'un élément $x$ de $E$. Si on a :
  $ forall x in E, ((forall y < x, P(y)) => P(x)) $
]

#item("Remarque")[][
  Ce théorème appliqué à $(NN,<=)$ donne le principe de récurrence forte. 
]

#item("Proposition")[][
  Si $E$ et $F$ sont des ensembles bien fondés, on déduit de la proposition 19 et du théorème 22 un principe d'induction sur $E times F$.
]

== Définition Inductive

#item("Idée")[Constructeurs @TOR[6.4.3]][
Pour définir formellement un ensemble d’objets inductifs, on décrit chaque objets de base et chaque manière de construire un nouvel objet à partir d’objets plus petits. Ce sont des _constructeurs_. Tout objet est alors construit par une combinaison d’applications explicites de ces _constructeurs_.
]

=== Définition Inductive@MPLI[3.2]

#item("Définiton")[Ensemble définis inductivement][
  Soit $E$ un ensemble. une définition inductive d’une partie $X$ de $E$ consiste en la donnée d’un ensemble $K$ d’opérations $Phi: E^(a(Phi)) -> E$, où $a(Phi) in NN$ est l’arité de $Phi$.\
  $X$ est alors défini comme étant le plus petit ensemble vérifiant~:
  $ forall Phi in K, forall x_1, ..., x_(a(Phi)) in X, Phi(x_1, ..., x_(a(Phi))) in X $
]

#item("Remarque")[@TOR][
  Cette définition ne sépare pas explicitement les cas de base des cas de combinaison, qui sont tous de la même façon associés à des constructeurs. Ces deux cas se distinguent par l’arité des constructeurs associés.
]


#item("Exemple")[Arbres Binaires][
  On peut définir inductivement l’ensemble $"AB"$ des arbres binaires étiquetés, comme sous ensemble de l’ensemble des graphes enracinés~:
  - $E in "AB"$
  - $forall g,d in "AB", r in RR, N(g,r,d) in "AB"$
]

#item("Implémentation")[@TOR[Code 7.22]][
#grid(columns: (60%, 40%), column-gutter: 1em,
[On peut facilement implémenter une définition inductive en langage OCaml, en construisant un type~:],
[```ocaml
  type 'a tree =
    | E
    | N of 'a tree * 'a 
         * 'a tree
  ```]
)
]

#grid(columns: (79%, 1fr), column-gutter: 1em,
item("Exemple")[Définition inductive de $NN$][
  On peut définir inductivement l’ensemble des entiers positifs~:
  - Un cas de base, l’entier zero, noté $Z$
  - Une règle de construction : si $n in NN$, alors son successeur, noté $S(n)$, est encore dans $NN$.
],

item("Implémentation")[][

En OCaml:
```ocaml
  type int =
    | Z
    | S of int
  ```
]
)

#item("Théorème")[@MPLI[Thm 3.10]][
  Si $X$ admet une définition inductive, alors tout élément de $X$ peut s’obtenir en appliquant un nombre fini d’étapes inductives.
]

=== Preuve par induction structurelle

#item("Proposition")[@MPLI[Prop 3.11] Preuve par induction][
  Soit $X$ un ensemble défini inductivement, et soit $P(x)$ un prédicat exprimant une propriété de l’élément $x$ de $X$. Si la condition
  $ (P(x_1),...,P(i_(a(Phi)))) => P(Phi(x_1,...,x_(a(Phi)))) $ pour chaque $Phi in K$, alors $P(x)$ est vraie pour tout $x in X$
]

#item("Remarque")[@MPLI[Rem 3.12]][
  Si l’on considère la définition inductive de $NN$, le premier principe d’induction sur les entiers correspond à la définition ci dessus. Toutes les preuves par récurrences sont donc des exemples de preuves par induction.
]

#item("Exemple")[@MPLI[Ex 3.16]][
  Soit $h,n$ les fonctions donnant respectivement la hauteur et le nombre de nœud d’un arbre, on peut montrer par induction que $forall x in "AB", n(x) <= 2^(h(x) - 1)$
]

#item("Exemple")[Transformation de Tseitsin][
  La transformation de Tseitsin utilise une preuve par induction structurelle sur une formule de la logique propositionnelle.
]


== Fonctions définies par induction

=== Définition inductive non-ambiguë

#item("Définition")[@MPLI[Def 3.18]][
  Une définition inductive d’un ensemble $X$ est dite non ambiguë si pour tout $x in X$, il existe des unique $Phi in K$ et $x_1, ..., x_(a(Phi)) in X$ tels que $x = Phi(x_1, ..., x_(a(Phi)))$.
]

#item("Remarque")[][
  Plus intuitivement, cela signifie qu’il n’existe qu’une seule façon de construire un élément $x$ de $X$.
]

#item("Exemple")[@MPLI[Ex 3.19]][
#grid(columns: (50%, 50%), column-gutter: 1em,
[ 
#set text(13pt)
Définition ambiguë de $NN^2$
  - $(0,0) in NN^2$
  - $(n,m) in NN^2 => (n+1,m) in NN^2$
  - $(n,m) in NN^2 => (n,m+1) in NN^2$],
  [
#set text(13pt)
    Définition non ambiguë de $NN^2$~:
    - $(0,n), (n,0)$ pour $n in NN$
    - $(n,m) in NN^2 => (n+1,m+1) in NN^2$
  ],
)
]

=== Fonctions définies par induction 

#item("Définition")[@MPLI[Def 3.20]][
  Soit $X subset.eq E$ un ensemble défini inductivement de façon non ambiguë, et soit $F$ un ensemble quelconque. La définition inductive d’une application $psi$ de $X$ dans $F$ consiste en
  - L’expression de $phi(Phi(x_1,...,x_(a(Phi))))$ à partir des $x_1,...,x_a(Phi)$ et des $Phi(x_1),...,Phi(x_a(Phi))$ pour chaque $Phi in K$. On écrira
  $ psi(Phi(x_1,...,x_a(Phi))) = psi_Phi (psi(x_1),...,psi(x_a(Phi))) $
  où $psi_Phi$ est une application de $E^a(Phi) times F^a(Phi)$ dans $F$.
]

#item("Remarque")[][
  La non ambiguïté de $E$ assure la bonne définition de $psi$.
]

//#let Fact = "Fact"
//#item("Exemple")[@MPLI Exemple 3.21][
  //La fonction factorielle de $NN$ dans $NN$ se définit inductivement par~:
  //- $Fact(0) = 1$
  //- $Fact(n+1) = (n+1) times Fact(n)$
//]

#item("Exemple")[@MPLI[Ex 3.24]][
  La fonction taille d’un arbre binaire sur $"AB"$ se définit inductivement par~:
  $ cases(
      t(E) = 0,
      forall g\,d in "AB"\, r in RR\, t(g,r,d) = 1 + t(g) + t(d)
    )
  $
]

#item("Implémentation")[@TOR[Programme 7.22]][
  Cette définition inductive se traduit très bien en langage OCaml, à l’aide d’un `match with` sur le type défini inductivement~:
  ```ocaml
  let rec size (t: 'a tree) : int = match t with
    | E -> 0
    | N(g,_,d) -> 1 + size g + size d
  ```
]

#dev[
#item("Exemple")[fonctions Premiers, Suivants et Annulables sur les expressions régulières.@CAR @DRAG @TIGER][
  On peut définir inductivement l’ensemble des expression régulière sur un alphabet.\
  À partir de cette définition, on peut alors construire par induction les fonctions Premiers, Suivants et Annulables.
]
]

#item("Remarque")[@MPLI][
  La non ambiguïté de la définition de AB justifie le filtrage par motif sur ses éléments.
]

//Définition inductive~: Définir un ensemble inductivement. Définition par induction~: On défini une fonction sur les sous cas et ça défini une grosse fonction, avec exemples.\
//Formules logiques définis inductivement, satisfiabilité défini par induction.\
//On peut définir inductivement l’ensemble des formules régulière, et par induction le langage reconnu par une expression régulière.\
//Entiers de Church / fonction factorielle. (ça permet d’avoir gratuitement que la récurrence c’est un sous cas de l’induction)

//Attention types OCaml permettent des objets récursifs, genre une liste qui se suis elle même, ce qui n’est pas possible dans le formalisme. Le type OCaml comprend plus de gens que les objets définit inductivement.

//Exemples qu


//Truc sur les clôtures~:

//Soit $<$ un ordre bien fondé, on défini $"Acc"_<$ comme le plus petit ensemble $A$ tel que, $forall x$, si $forall y < x, y in A$, alors $x in A$.

//Induction structurelle sur $a in "Acc"_<$, ça dit $forall P (forall x. forall y < x. P(y)) => P(x)$, alors $forall a in "Acc"_<, P(a)$

//On veux vrai $forall a in A$, et ça viens de l’ordre bien fondé~: $(forall a, a in "Acc"_<) <=> < "bien fondé"$

//Idée dev~:
//Gros exemple sur les langages formels, avec définition inductive, définition par induction, et preuve d’un truc dessus ? Avec l’exemple des first et des follows. C’est pas une définition inductive c’est une définition par induction.

//On peux delete le truc sur l’arbre de dérivation ?


#recap()


//===== Remarque


- Cette leçon s’appuie surtout sur @MPLI pour la structure du plan et le formalisme mathématiques, avec des exemples de code OCaml venant de @TOR.\
- @MPLI Défini les ensembles inductivement en dissociant les cas de base des autres constructeurs, là où @TOR dis que les cas de base sont les constructeurs d’arités 0. Ici, on a fais le choix d’adapter les définitions et propriétés de @MPLI pour utiliser la même définition que @TOR. On a préféré ce formalisme car plus simple pour écrire les propriétés, et plus proche du code OCaml sur les type inductifs et les match case.
// Un ensemble est défini inductivement. Sur un ensemble inductif on défini par induction une fonction inductive. Par exemple un arbre est une structure inductive et la taille d'un arbre est une fonction inductive défini par induction sur l'ensemble inductif des arbres.






#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Benjamin Voisin - Axel Stengel
]