#import "../../deps.typ": *
// #import "../../utils/tableau.typ" : tableau, dev, recap, item
// #import "@preview/cetz:0.3.1" : *
#show: tableau

#let bowtie = symbol(
  "⋈",
  ("large", "⨝"),
  ("l", "⧑"),
  ("r", "⧒"),
  ("l.r", "⧓"),
)

= Formule du calcul propositionnel : représentation, formes normales, satisfiabilité. Applications.

/ Motivation: Définir les briques de bases de l'algèbre de Boole, la création de circuits. Offrir un formaliste standard pour résoudre de nombreux problèmes.

== Syntaxe @SCHWARZ
=== Le langage LP

#item("Définition")[][
  L'ensemble des variables propositionnelles est un ensemble de symboles $"Prop" = {p_1, p_2, ..., p_n}$.
]

#item("Définition")[][
  L'ensemble des formules de la logique propositionnelle est le langage LP défini inductivement sur l'alphabet $"Prop" union {not, or, and, ->, <->, (, )}$ par:
  - $"Prop" subset.eq "LP"$
  - si $phi in "LP"$ alors $not phi in "LP"$
  - Si $phi$ et $psi in "LP"$ alors $(phi and psi), (phi or psi), (phi <-> psi) in "LP".$
]

#item("Définition")[][
  ${not, or, and, ->, <->}$ défini un ensemble de connecteur logiques.
]

=== Représentations

#item("Théorème")[Lecture unique d'une formule][
  Si $phi in "LP"$ alors un unique des cas suivant se présente :
  - $phi in "Prop"$
  - il existe une unique paire de formules $psi, phi.alt$ tq $phi = (psi or phi.alt)$
  - idem pour $phi = (psi or phi.alt), phi = (psi -> phi.alt) "et" phi = (psi <-> phi.alt)$
]

#item("Notation")[][
  En associant une priorité à chaque connecteur on s'épargne des parenthèses. $not$ précède $and$ précède $or$ précède $->$ précède $<->$.
]

#item("Exemple")[][
  On écrit donc $(p or q) and r -> t$ au lieu de $(((p or q) and r) -> t)$.
]

#item("Notation")[Différentes représentation d'une formule][
  sont possibles :
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    [
      Mot
      $$
    ],
    [
      Arbre
    ],
    [Circuit Logique],
  )
]

#item("Définition")[La taille d'une formule][
  $phi$ est noté $|phi|$ et on l'a définit par induction.
  - si $phi in "Prop"$, $|phi| = 1$
  - si $phi = not psi$, $|phi| = 1 + |psi|$
  - si $phi = psi bowtie phi.alt, "pour" bowtie in {and, or, ->, <->}, |phi| = 1 + |psi| + |phi.alt|$
]

#item("Exemple")[][
  Soit $phi_1 = (not p and q) -> r$, alors $|phi_1| = 6$
]

#item("Remarque")[][
  La taille d'une formule est le nombre de noeuds de son arbre.
]

#item("Définition")[][
  On définit la hauteur d'une formule $phi$, notée $h(phi)$, par induction sur $phi$ :
  - si $phi in "Prop", h(phi) = 0$
  - $"si" phi = psi bowtie phi.alt, "pour" bowtie in {or, and , ->, <->},$ \ $h(phi) = max(h(psi), h(phi.alt)) + 1$
]

#item("Exemple")[][ $h(phi_1) = 3$
]

#item("Remarque")[][
  La hauteur d'une formule est la hauteur de son arbre.
]

== Sémantique
=== Valuation
#item("Définition")[Une valuation][
  est une fonction $nu : "Prop" -> {0, 1}$
]

#item("Définition")[][
  Dire qu'une formule $phi$ est vraie pour une valuation $nu$, notée $nu tack.double phi$ se définit par induction sur $phi$ :
  - pour tout $p in "Prop", nu tack.double p "ssi" nu(p) = 1$
  - pour toute $phi in "LP", nu tack.double not phi "ssi" nu tack.double.not phi$
  #list.item[
    $"pour toute" phi, psi in "LP", nu tack.double phi or psi "ssi"$
    \ $nu tack.double phi and psi "ssi" nu tack.double phi "et" nu tack.double psi$
    \ $nu tack.double phi or psi "ssi" nu tack.double phi "ou" nu tack.double psi$
    \ $nu tack.double phi -> psi "ssi" nu tack.double phi "alors" nu tack.double psi$
    \ $nu tack.double phi <-> psi "ssi" nu tack.double phi -> psi "et" nu tack.double phi <- psi$
  ]
]

#grid(
  columns: (80%, 1fr),
  column-gutter: 0.5em,
  row-gutter: 0.5em,

  item("Notation")[][
    On peut étendre aux formules :
    $nu(phi) = cases(
      1 "si" nu tack.double phi,
      0 "sinon"
    )$
  ],
  grid.cell(rowspan: 3, block(breakable: false, table(
    columns: 3,
    align: center,
    $p$, $q$, $p->q$,
    [0], [0], [1],
    [0], [1], [1],
    [1], [0], [0],
    [1], [1], [1],
  ))),
  item("Définition")[][
    Une table de vérité d'une formule donne sa valeur de vérité pour toute valuation sur $"Prop"$.
  ],
  item("Exemple")[][
    Pour une implication on a ce tableau :

  ],
)

=== Satisfabilité et validité

#item("Définition")[][
  Une formule $phi$ est satisfiable si et seulement s'il existe une valuation $nu$ tel que $v tack.double phi$.
]

#item("Définition")[Modèle d'une formule.][
  Si $nu tack.double phi ,"alors" nu$est un modèle de $phi$. On note $"Mod"(phi)$ l'ensemble des modèles de $phi$.
]

#item(
  "Définition",
)[Une formule est valide][, aussi nommée une tautologie, noté $tack.double phi$ si toute valueation est un modèle de $phi$.
]

#item("Propriété")[Le tiers exclu][
  est une tautologie: $tack.double phi or not phi (forall phi in "LP").$
]

#item("Propriété")[][
  Une formule est valide ssi $not phi$ est insatisfiable.
]

#item("Définition")[Equisatisfabilité.][
  Deux formules $phi$ et $psi$ sont dîtes équisatisfiables si elles sont toutes les deux satisfiables.
]

=== Equivalence de formules

#item("Définition")[][
  Deux formules $phi$ et $psi$ sont équivalentes, noté $phi eq.triple psi$ si $"Mod"(phi) = "Mod"(psi)$?
]

#item("Remaque")[][
  Deux formules équivalentes sont équisatisfiables. La réciproque n'est pas vraie en général.
]

#item("Propriété")[Les lois de De Morgan][
  Pour toutes $phi, psi in "LP"$ :
  - $not (phi and psi) eq.triple phi or psi$
  - $not (phi or psi) eq.triple phi and psi$
]

#item("Propriété")[Distributivité][
  Pour toutes $phi, psi, phi.alt in "LP"$ :
  - $(phi or psi) and phi.alt = (phi and phi.alt) or (phi and phi.alt)$
  - $(phi and psi) or phi.alt = (phi or phi.alt) and (phi or phi.alt)$
]

#item("Propriété")[Associativité et Commutativité][
  Pour toutes $phi, psi, phi.alt in "LP"$,
  - $phi or psi eq.triple psi or phi$
  - $phi and psi eq.triple psi and phi$
  - $(phi or psi) or phi.alt eq.triple phi or (psi or phi.alt)$
  - $(phi and psi) and phi.alt eq.triple phi and (psi and phi.alt)$
]

#item("Propriété")[][
  Pour toute
  - $phi in "LP"$, $not not phi eq.triple phi$
  - $phi, psi in "LP", phi eq.triple "ssi" tack.double phi <-> psi$

]

#item("Propriété")[][
  Pour toutes $phi, psi in "LP", phi eq.triple psi "ssi" tack.double phi <-> psi$
]

== Formes normales, problème SAT
=== Systèmes complets de connecteurs

#item("Définition")[Système complete de connecteurs.][
  Un systèmes (ou ensemble) de connecteurs logiques est dit complet si pour toute formule $phi in "LP"$, il existe $psi$ une formule qui lui est équivalente, et qui n'utilise que les connecteurs de ce système.
]
#item("Propriété")[][
  - ${not, and}, {not, and, or, ->}, {arrow.t}, "où" phi arrow.t psi = not(phi and psi)$ sont complets.
  - ${not}$ n'est pas complet.
]

=== Formes Normales

#item("Définition")[][
  Un littéral est une variable propositionnelle de $"Prop"$ ou la négation d'une variable propositionnelle.
]

#item("Définition")[][
  Un littéral est dit positif s'il est une variable propositionnelle, négatif s'il en est la négation.
]


#item("Définition")[Une clause disjonctive][
  (resp. conjonctive) est une disjonction (resp. conjonction) de littéraux. $C = display(or.big_(i = 1)^n) l_i$.
]

#item("Définition")[Une k-clause][
  est une clause contenant exactemetn k littéraux.
]

#item("Définition")[FNC FND.][
  Une formule est sous Forme Normale Conjonctive (FNC) si elle est une conjonction de clauses disjonctives.
  Une formule est sous Forme Normale Disjonctive (FND) si elle est une disjonction de clause conjonctives.
]

#item("Propriété")[][
  Pour toute formule $phi$, il existe $phi'$ sous FNC et $phi''$ sous FND tel que $p eq.triple phi' eq.triple phi''$.
]

#item("Algorithme")[(Naïf)][
  - "Descendre" les négations avec De Morgan
  - Eliminer les doubles négations (FNN)
  - Appliquer les règles de distributivité.
]

#item("Propriété")[Borne Exponentielle][
  Soient $p_1, ..., p_n, q_1, ..., q_n in "Prop"$. La famille de  formules $(phi_n)_(n in NN)$ définies par $phi_n = or.big_(i = 1)^n p_i and q_i$ ne possèdent que des formules sous FNC équivalentes qui sont de taille exponentielle en $|phi_n|$.
]

#dev[
  #item("Théorème")[Transformation de tseitin][
    Pour toute formule $phi$, il existe $T(phi)$ sous FNC, avec des 3-clauses, de taille $cal(O)(|phi|)$ et tel que $phi$ et $T(phi)$ sont équisatisfiables.
  ]
]
=== Problème SAT

#item("Définition")[Le problème SAT][
  est un problème de décision. En entrée une formule $phi in "LP"$. En sortie oui ssi $phi$ est satisfiable et non sinon.
]

#item("Exemple")[Une configuration de Sudoku][
  se traduit par une formule $phi$ sous FNC qui englobe également les règles du jeu. Remplir les cases manquantes de la grille revient à trouver un modèle de phi.
]

#item("Exemple")[La k-coloration d'un graphe][
  peut être traduite en une formule imposant une couleur unique par noeud et interdisant l'adjacence de deux noeuds de même couleur. Une k-coloration se traduit en un modèle de la formule.
]

#item("Propriété")[SAT est indécidable.][]

#item("Algorithme")[(SAT Naïf][
  Remplir la table de vérité jusqu'à trouver un modèle (sinon la formule est insatisfiable)
]

#dev[
  #item("Algorithme")[Davis Putnam Logemann Loveland][
    Pour tout $phi in "LP"("sous FNC")$, l'algorithme DPLL optimise sa recherche de modèle pour $phi$ en utilisant du retour sur trace en cas de conflit.
  ]
]

#item("Propriété")[][
  Si $phi$ est sous FND, la satisfiabilité se vérifie en $cal(O)(phi)$. Donc FND SAT est dans P.
]

#dev[
  #item("Propriété")[Cook Levin. SAT est NP-complet.][]
]

#item("Propriété")[FNC SAT est NP-complet][]

#item("Propriété")[3-SAT][
  La restriction de SAT aux formules sous FNC avec uniquement des 3-clauses est aussi NP-complet.
]


#dev[
  #item("Propriété")[2-SAT][
    La restriction de SAT aux formules sous FNC avec uniquement des 2-clauses est en $cal(O)(phi)$. (Algorithme de Tarjan ou Kosaraju).
  ]
]

#item("Définition")[Une clause de Horn][
  est une clause avec au plus un littéral positif.
]

#item("Propriété")[HornSAT][
  La restriction de SAT aux formules sous FNC avec uniquement des clauses de Horn est en $cal(O)(|phi|)$.
]if font != ""

#recap()

#bibliography(read("../bib.yaml", encoding: none))
