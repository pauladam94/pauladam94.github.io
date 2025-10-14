#import "../../deps.typ": *
#show : tableau

= Décidabilité et Indécidabilité. Exemples.

#item("Motivation")[][
  Introduction aux limites des algorithmes et du calculable
]

== Premières notions de calculabilité (Lycée) 

#item("Définition")[Spécification d'un problème algorithmique @NSIT[16.2]][
La spécification d'un problème comporte deux parties :
- la description des entrées admissibles, et
- la description du résultat ou des effets attendus.
]

=== Les programmes sont des données @NSIT[16 Calculabilité]

#item("Remarque")[Programme en tant que donnée][
Un programme n'est aussi qu'une donnée manipulée en mémoire.
]

#item("Exemple")[][
- Du code sous chaîne de caractère peut être exécuté avec les programmes `eval` et `exec`.

- Un programme peut être téléchargé `curl`, copié `cp`, déplacé `mv` comme n'importe quel fichier.
]

/* 
#item("Exemples")[Sérialisation / Désérialisation @TORTUE_PREPA[p828]][
La conversion d'une valeur arbitraire en une chaîne de caractère est appelé sérialisation. L'opération inverse, désérialisation. 
] */

#item("Définition")[Algorithme / Programme][
Dans la suite de la leçon, un programme/algorithme $#`p` in cal(P)$ sera un code Python/OCaml pouvant être sérialisé en chaîne de caractère et ainsi être passé en entrée d'un autre.
]

=== Problèmes de décisions



#item("Définition")[Problème de décision][
Un problème de décision est un problème algorithmique dont le résultat attendu est un booléen : soit vrai, soit faux.
]

#item("Exemple")[Problème du tableau triée][
  Savoir si un tableau est triée ou non est un problème de décision.
]


#item("Définition")[Notions de terminaisons @TOR[p830 trois voies]][
  Un programme peut avoir plusieurs comportements:
  - production d'un résultat
  - non-terminaison
  - interruption prématurée
]

#item("Définition")[Problème de l'arrêt @NSIT[16.3]][
- Entrée : un programme `p` et une entrée `e`
- Sortie : `True` si l'exécution de `p` sur `e` termine et `False` sinon
]
#item("Exemple")[Indécidabilité du problème de l'arrêt][
On démontre par l'absurde qu'il n'existe pas de fonction calculant l'`arret`.
#grid(columns: (40%, 60%),
```python
def paradoxe(n: int):
  if arret(paradoxe, n):
    while True:
      pass
  else:
    return n
```,
```
- Si arret(paradoxe, 0) = True
    alors paradoxe termine sur 0
    mais paradoxe boucle infiniement
- Sinon arret(paradoxe, 0) = False
    alors paradoxe ne termine pas sur 0
    mais paradoxe termine
```
)
]

#item("Remarque")[On peut prouver la terminaison de fonctions][
L'indécidabilité du problème de l'arrêt n'empêche pas de prouver la terminaison de certain problème par l'utilisation de variants par exemple. 
]


#item("Théorème")[Complétude des langages][
Aucun paradigme de programmation n'est plus expressif qu'un autre.
]


=== Méthodes

#item("Méthode")[Preuve de décidabilité][
Pour prouver la décidabilité d'un problème, on peut exhiber une fonction qui le décide.
]

#item("Méthode")[Preuve d'indécidabilité][
Pour prouver l'indécidabilité d'un problème, on peut procéder par l'absurde.
]

== Réduction et Décidabilité (CPGE) @TOR

#item("Définition")[Problème de décision][
Un problème de décision sur un domaine d'entrées $E$ est défini par une fonction totale $f$ de $E$ vers l'ensemble $BB$ des booléens.
]

=== Problème Décidables / Semi-décidables
#item("Définition")[Fonction calculable][
Une fonction totale $f : E -> S$ est calculable s'il existe un programme $#`p` in cal(P)$ tels que pour toute instance $e in E$. $A$ appliqué à $e$ termine en un temps fini et produit le résultat $f(e)$. On dit alors que `p` résout $f$.
]

#item("Théorème")[][
Il existe une infinité de fonctions non-calculables.
]

#item("Définition")[Problème décidable][
Un problème est décidable si la fonction $f$ est calculable. C'est-à-dire s'il existe un programme $#`p` in cal(P)$ qui résout $f$.
]

#item("Définition")[Problème semi-décidable][
Un problème de décision défini par $f$ est semi-décidable s'il existe un programme `p` tels que, pour toute instance $e in E$, le programme `p` appliqué à $E$ :
- termine en un temps toujours et renvoie $V$ si $f(e) = V$,
- renvoie $F$, ou ne termine pas
]

#item("Exemple")[Le problème de l'arrêt est semi-décidable][]

#item("Remarque")[Existence de problèmes non semi-décidables][
Le problème
 - Entrée : un programme $#`p` in cal(P)$
- Sortie : V si le programme `p` appliqué à son code source ne renvoie pas V, F sinon
n'est pas semi-décidable par argument diagonal.
]

#item("Théorème")[Existence d'un programme universel][
Il existe un programme universel `eval` qui résout le problème
- Entrée : un programme $#`p` in cal(P)$ et un argument $e$ pour `p`
- Sortie : termine et renvoie la valeur produite par `p e` si `p e` termine, ne termine pas sinon.
]

=== Réductions calculatoires

#item("Définition")[Réduction calculatoire][
Soient deux problèmes de décision définis par des fonctions $f_1 : E_1 -> BB$ et $f_2 : E_2 -> BB$. On dit que $f_1$ se réduit calculatoirement à $f_2$ et on note $f_1 <= f_2$, s'il existe une fonction calculable $g : E_1 -> E_2$ telle que pour tout $e in E_1$, on a $f_1(e) = f_2(g(e))$.
]

#align(center)[
#canvas({
  import draw: *
  rect((0, 0), (rel: (5.5, 2)), radius: .1, stroke: blue, name: "f1")
  
  rect((3.5, 0.5), (rel: (1.5, 1)), radius: .05, stroke: black, name: "f2")
  rect((0.5, 0.5), (rel: (1, 1)), radius: .05, stroke: green, name: "g")
  content((1, 1), text(green)[$g$])
  content((4.25, 1), text(black)[$f_2$])
  content((0.25, 1.5), text(blue)[$f_1$])
  line((-1, 1), "g", name: "linestart", mark: (end: ">"))
  line("g", "f2", name:"linemiddle", mark: (end: "stealth"))
  line("f2", (6.5, 1), name: "lineend", mark: (end: "stealth"))
  content(
    ("linestart.start", 0%, "linestart.end"),
    angle: "linestart.end",
    padding: .1,
    anchor: "north",
    [$e_1 in E_1$]
  )
  content(
    ("linemiddle.start", 50%, "linemiddle.end"),
    angle: "linemiddle.end",
    padding: .1,
    anchor: "north",
    [$e_2 in E_2$]
  )
  content(
    ("lineend.start", 100%, "lineend.end"),
    angle: "lineend.end",
    padding: .1,
    anchor: "north",
    [$b in BB$]
  )
})
]

#item("Théorème")[Réduction à un problème décidable][
Considérons un problème décidable défini par une fonction $f_1 : E_1 -> BB$, et un problème de décision défini par une fonction $f_2 : E_2 -> BB$ et tel que $f_2 <= f_1$ alors $f_2$ est décidable.
]

#item("Théorème")[Réduction d'un problème indécidable][
Considérons un problème indécidable défini par une fonction $f_1 : E_1 -> BB$, et un problème de décision défini par une fonction $f_2 : E_2 -> BB$ et tel que $f_1 <= f_2$ alors $f_2$ est indécidable.
]


#item("Exemple")[Indécidabilité de la trivialité d'un programme][
Le problème 
- Entrée : un programme $#`p` in cal(P)$ 
- Sortie : V si `p` renvoie V sur toute entrée, F sinon
est indécidable.
]

#item("Exemple")[Indécidabilité de l'équivalence sémantique][
Le problème
- Entrée : deux programmes  $#`p_1` in cal(P)$ et $#`p_2` in cal(P)$ avec même domaine d'entrée $E$ et de sortie $S$
- Sortie : vrai si pour toute entrée $e in E$ les comportements de `p_1` et `p_2` appliqué à l'entrée $e$ sont identiques
est indécidable.
]

#dev[
#item("Application")[Théorème de Rice][
Soit une fonction totale $f : cal(P) -> BB$ prenant en entrée un programme. On suppose que $f$ est :
- non triviale, c'est-à-dire surjective
- sémantique, c'est-à-dire que, pour tout $#`p_1`, #`p_2` in cal(P)^2$ sémantiquement équivalents, on a $f(#`p_1`) = f(#`p_2`)$.
Alors, le problème de décision défini par $f$ est indécidable.
]
]

#item("Exemple")[PCP (Problème de Correspondance de Post)][
- Une instance est une suite $(u_1, v_1), ..., (u_m, v_m)$ de paires de mots sur $Sigma$
- Une solution est une suite $(i_1, ..., i_n)$ de $\{1, m\}$ tels que $u_(i_1)...u_(i_n) = v_(i_1)..v_(i_n)$
- Une instance est positive si elle a au moins une solution.

]

#item("Remarque")[][
Le Problème de Correspondance de Post est indécidable (admis).
]

== Décidabilité en Licence @CAR

=== Notions de codages injectifs

#item("Définition")[Langage d'un problème][
Pour associer un langage à un problème, on utilise un codage qui est une fonction naturelle injective de l'ensemble des instances $E$ dans $Sigma\*$. Le langage associé à un problème est l'ensemble des codages de ses instances positives.
]

#item("Exemple")[Codage d'un entier][
Représentation en base 1, 2, 10, 16.
]

#item("Exemple")[Codage d'un graphe][
Pour $Sigma = \{0, 1, (, ), ;\}$ On associe à chaque sommet $u$ un codage binaire $<u>$ puis chaque arête $(u, v) in A$ est codée $(<u>; <v>)$ donc $<G> = ((0; 1; 10); (0; 1); (1; 0))$.
]

=== Des problèmes aux machines

#item("Définition")[Machine de Turing (MT)][(déterministe, à un ruban)
Une machine de Turing est un septuplet $(Sigma, Gamma, Q, q_0, q_f, delta, \#)$
- $Sigma$ l'alphabet d'entrée, $\# in.not Sigma$
- $Gamma$ l'alphabet du ruban, $\# in Gamma$
- $Q$ un ensemble fini d'états dont $q_0$ l'initial et $q_f$ l'acceptant
- $delta : Gamma times Q arrow Gamma times Q times \{<-, ->\}$ la fonction partielle de transition
- $\#$ est le symbole blanc qui remplit initialement le ruban
]

#warning[
#item("Définition")[Comportement d'une machine de Turing][
Une MT $M$ travaille sur un état courant $q in Q$, un ruban infini contenant un mot de $Gamma*$ et sur lequel se déplace un curseur. Lancée sur un mot $w in Sigma*$ on commence à l'état $q_0$ avec $w$ sur le ruban et le curseur au début de $w$
- on note $u q v$ une configuration de $M$ ($epsilon q_0 w$ initiale)
- $delta$ permet de déterminer l'éventuelle configuration suivante
- si la suite des configurations est infinie, on dit que $M$ diverge.
- sinon on dit que $M$ s'arrête sur un état acceptant si $q = q_f$ ou refusant sinon.
]
]

#item("Définition")[Langage accepté d'une MT][
Le language accepté par une MT $M$ est $cal(L_in)(M) = \{w | M "accepte" w\}$
]


#item("Définition")[Langage décidable][
Un langage est décidable si il existe une machine de Turing qui le décide.
]

#item("Définition")[Re et R][
On définit 

- $R E = \{cal(L) subset.eq Sigma* | exists "M, " cal(L_in)(M) = cal(L)\}$
- $R = \{cal(L) subset.eq Sigma* | exists "M qui ne diverge pas, " cal(L_in)(M) = cal(L)\}$ 
]

#item("Proposition")[Clôture de R.][
  R est clos par union intersection et complémentaire.
]

#item("Proposition")[Clôture de RE.][
  RE est clos par union intersection. // mais pas par complémentaire
]

=== Exemples 
#dev[
#item("Théorème")[Indécidabilité du PCP][@SIP]
]

#item("Définition")[Arithmétique de Presburger][
L'arithmétique de Presburger est la théorie du premier ordre des entiers munis de l'addition.
C'est le langage des formules pour lesquelles on dispose
- des constances 0 et 1
- $+$ comme symbole de fonction binaire
- $=$ comme prédicat binaire d'égalité
]

#dev[
#item("Théorème")[PRES est décidable][
Le problème
- Entrée : une formule de l'arithmétique de Presburger
- Sortie : vrai si la formule est vraie sur les entiers
est décidable.
]
]

#item("Définition")[Arithmétique de Peano][
En ajoutant à l'arithmétique de Presburger le symbole de fonction $times$ de la multiplication, on obtient l'arithmétique de Peano. 
]

#item("Théorème")[L'arithmétique de Peano est indécidable (admis)][ 
Le problème
- Entrée : une formule de l'arithmétique de Peano
- Sortie : vrai si la formule est vraie sur les entiers
est indécidable.
]

Liens P = NP (étude restreinte à la complexité)

#recap()

===== Commentaires
Les machines de Turing étant explicitement hors-programme MPI, elles n'apparaissent qu'en ouverture, en troisième partie de la leçon.


- Pour la partie I, il suffit de suivre la tortue lycée même si il faut faire des grands sauts parfois.

- Pour la partie II, il est aisé de suivre la Tortue Prépa et de mettre un item pour chaque encadré de celle-ci. 
#warning[ ATTENTION on remplacera la notion d'algorithme et de fonction OCaml par la notion de programme $#`p` in cal(P)$
]

- Pour la partie III A) et B), il faut suivre le carton de la même manière. La partie III B) se trouve au chapitre "décidabilité des théories logiques" du carton.

Il faut faire attention entre la confusion des "fonctions" mathématiques calculables ou pas, et les "fonctions" informatique, qui sont des programmes.

#bibliography(read("../bib.yaml", encoding: none))


