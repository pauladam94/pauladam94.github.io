#import "../../deps.typ": *
#import "pcanva.typ" : *
#show : tableau.with(nb-columns : 2)

= Principes de fonctionnement des ordinateurs: \ Architecture, notions d'assembleur

== Principes de fonctionnement @NSIT @NSIP

#item("Définition")[Un Programme][
  est une suite d'instructions.
]

#item("Définition")[Von Neumann @TOR[23]][
  décrit en 1945 la structure d'un ordinateur qui possède :
- une *mémoire centrale* contenant instructions _et_ données
- une *unité de
contrôle* qui coordonne l'exécution de l'instruction.
- une *unité de traitement* fait les calculs nécessaires à l'instruction.
]

#item("Schémas")[@MOS][

// TODO
/*
#align(center, canvas(length: 1em, {
  import draw : *
  let base = 8.5

  prect((2em, 3em), (4em, 4em))[
    #align(center, [Mémoire \ Centrale])
  ]
  
  pline((4em, 7em), (4em, base)) // MEM - BUS
  
  pcontent((8.5em, 2.5em), [CPU])
  prect((11em, 5em), (2em, 2em))[UC]
  pline((12em, 4em), (12em, 5em))
  prect((11em, 2em), (2em, 2em))[UT]
  pline((12em, 7em), (12em, 8em))
  
  // prect((6em, 8.5em), (4em, 1.5em))[Cache]
  
  prect((10em, 1.5em), (4em, 6em),
    stroke: (paint: black, thickness: 1pt, dash: "dashed"))
  pline((12em, 8em), (12em, base)) // CPU - BUS
  
  pcontent((20.5em, 2em))[Périphériques]
  prect((21em, 3em), (4em, 4em))[Clavier \ Souris]
  pline((23em, 7em), (23em, base)) // Clavier - BUS
  
  prect((16em, 3em), (4em, 4em))[Ecran]
  pline((18em, 7em), (18em, base)) // ECRAN - BUS
  
  pline((4em, base), (26em, base)) // BUS
  pcontent((15em, base + 0.8em), [Bus de Communication])
  pcanva_end()
}))
*/


#align(center, {
pcanva_start()

let base = 8.5em

prect((2em, 3em), (4em, 4em))[
  #align(center, [Mémoire \ Centrale])
]

pline((4em, 7em), (4em, base)) // MEM - BUS

pcontent((8.5em, 2.5em), [CPU])
prect((11em, 5em), (2em, 2em))[UC]
pline((12em, 4em), (12em, 5em))
prect((11em, 2em), (2em, 2em))[UT]
pline((12em, 7em), (12em, 8em))

// prect((6em, 8.5em), (4em, 1.5em))[Cache]

prect((10em, 1.5em), (4em, 6em),
  stroke: (paint: black, thickness: 1pt, dash: "dashed"))
pline((12em, 8em), (12em, base)) // CPU - BUS

pcontent((20.5em, 2em))[Périphériques]
prect((21em, 3em), (4em, 4em))[Clavier \ Souris]
pline((23em, 7em), (23em, base)) // Clavier - BUS

prect((16em, 3em), (4em, 4em))[Ecran]
pline((18em, 7em), (18em, base)) // ECRAN - BUS

pline((4em, base), (26em, base)) // BUS
pcontent((15em, base + 0.8em), [Bus de Communication])
pcanva_end()

})

]

#item("Définition")[CPU][
(pour _Central Processing Unit_ en anglais) est l'ensemble formé par l’unité de contrôle et l'unité de traitement.
]

#item("Définition")[Le compteur ordinal][
(PC pour _Program Counter_ en anglais) est l'adresse de l'instruction courante que le CPU exécute.
]

#item("Exemples")[][
De nombreux CPU ont été produits au cours de l'histoire, par exemple les CPU *pentium Intel*.
]

#item("Schéma")[][]
// TODO CHANGE
#place(dx: 10em, align(center, {
pcanva_start()

pcontent((9.5em, -1.5em), math.attach([], tr: "I"))
prect((2em, -2em), (7em, 4em))
pcontent((5em, -1em), $"Logiciel"^"II"$)
pcontent((5em, 1em), $"Matériel"^("III")$)

pcontent((8em, 0em), [ISA])

pline((2.5em, 0em), (7em, 0em),
  stroke: (paint: black, thickness: 1pt, dash: "dashed"))
pcanva_end() }))

#colbreak()

== Notions d'assembleur: architecture externe @PAT

#item("Définition")[Le jeu d’instructions][
 (ISA pour _Instruction Set Architecture_ en anglais) est l’interface entre le logiciel et le matériel. Il défini, entre autre, un ensemble d’opérations élémentaires, les instructions machine.
]

#item("Exemple")[][
Les jeux d’instructions RISC-V et ARM sont de la
famille *RISC* (_Reduced Instruction Set Computer_).
Le jeu d'instructions x86 est de la famille *CISC* (_Complex Instruction Set Computer_).
]

#item("Remarque")[x86 et ARM][
sont respectivement dominants pour les processeurs d’ordinateurs de bureau et ceux de _smartphones_.
]

#item("Définition")[Un langage d’assemblage][
 d’un jeu d’instructions est une représentation lisible pour un humain des instructions machine. L’assembleur est le programme qui traduit le langage d’assemblage en langage machine. L’opération inverse est le désassemblage.
]

#item("Définition")[La compilation][
est la transformation d’un programme écrit dans un langage de haut niveau comme C en langage d’assemblage.
]

#item("Définition")[Le langage d'assemblage][
 manipule trois types de données qui sont les :
- valeurs des *registres*: petites cellules mémoire d'accès rapide
- valeurs stockés dans la *mémoire* centrale
- *immédiats*, des constantes connues à la compilation
]

#item("Définition")[Le format d’instruction][
 spécifie la manière
de décoder une instruction machine en binaire en identifiant différents champs comme le type d’opération ou les opérandes.
]

#item("Exemple")[Le RISC-V][
est un langage d’assemblage où les instructions sont codées sur 32 bits et les 7 derniers bits précisent le type d'opération.
Différentes opérations utilisent différents formats:
]

#let c(n, align: auto, cont) = {
  grid.cell(
    align: align,
    stroke: 1pt,
    colspan: n,
    inset: 3pt,
    par(cont, leading: 4pt)
  )
}

#item("Schema")[Formats d'instructions @PAT[Cover]][
#align(center, block(breakable: false,
grid(
  columns:  (0.82em, ) * 34, align: center + horizon,
  c(2)[R], c(7)[func7], c(5)[rs2], c(5)[rs1], c(3)[f3], c(5)[rd], c(7)[opcode],
  
  c(2)[I], c(12, align: left)[ imm[11:0]], c(5)[rs1], c(3)[f3], c(5)[rd], c(7)[opcode],
  
  c(2)[S], c(7, align:left)[imm[11:5]], c(5)[rs2], c(5)[rs1], c(3)[f3], c(5)[imm[4:0]], c(7)[opcode],
  
  c(2)[SB], c(7)[imm \ [12|10:5]], c(5)[rs2], c(5)[rs1], c(3)[f3], c(5)[imm \ [4:1|11]], c(7)[opcode],
  
  c(2)[U], c(20)[imm[31:12]], c(5)[rd], c(7)[opcode],
  c(2)[UJ], c(20)[imm[20|10:1|11|19:12]], c(5)[rd], c(7)[opcode],
)))]

=== Opérations arithmétiques (R, I)

#item("Exemple")[L'instruction *add*][
`x9, x20, x21` signifie en RISC-V que lorsque cette instruction sera exécutée, le registre 9 recevra la somme des valeurs des registres 20 et 21.

Le RISC-V encode cette instruction avec le format de type R :
#align(center, table(
  columns: (auto, ) * 7,
  align: center + horizon,
  rows: 1em,
   
  [Champ], [funct7], [rs1], [rs2], [funct3], [rd], [opcode],
  [Taille], [7 bits], [5 bits], [5 bits], [3 bits], [5 bits], [7 bits],
  [Contenu], [0], [21], [20], [0], [9], [51]
))
]
#place(
  dx: 24.3em,
  dy: -3em,
  rotate(90deg)[@PAT[Chap.2.5 2.8]])

=== Transfert de données (S, U, I)

#item("Exemple")[L'instruction lw][
 `x9, 32(x22)` permet de charger dans le registre x9 le contenu de l'adresse mémoire (x22 + 32).
]

#item("Exemple")[Stocker une constante][
de 32 bits dans un registre se fait à l'aide de deux instructions:
- *lui* (_load upper immediate_) stocke les 20 bits de poids fort
- *addi* (_add immediate_) ajoute les 12 bits de poids faible
]


=== Branchements (SB)

#item("Exemple")[L'instruction beq][
 `x7, x9, loop` fait avancer le pointeur d'instructions jusqu'au label `loop` si les valeurs de `x7` et `x9` sont égales.
]

=== Fonctions (UJ)

#dev[
#item("Remarque")[Les appels de fonctions][
 respectent les conventions d'appel et RISC-V en définit sa propre convention d'appel. 
 @PAT[Chap.1 p.108 et 113]
]
]

#item("Remarque")[][
En RISC-V les instructions machine sont codées
sur un mot 32 bits mais ce n’est pas le cas en x86 par exemple.
]

== Micro-Architectures: architecture interne @PAT[p.297]

#item("Schéma")[@PAT[Fig4.48 p.312]][
#image("PAT_Pipeline.png")
]

=== Circuits Combinatoires et Séquentiels

#item("Définition")[L'*ALU*][
(_Arithmethic and Logic Unit_) est le composant qui implémente l'UT. Il effectue des opérations comme l'addition d'entiers ou la conjonction logique. Il est construit à partir de composants combinatoires de base comme les portes logiques ou plus complexes comme les multiplexeurs.
]

#dev[
#item("Remarque")[Un additionneur N bits @PAT[p.A-36 à p.A-47]][
 qui enchaîne N addittioneurs 1 bits possède un chemin critique linéaire en n. On peut optimiser ce chemin critique. 
]
]

#item("Remarque")[L'UC][
peut être implémentée par un système séquentiel et donc une machine à états telle qu'une Machine de Moore ou de Mealy.
On parle alors de micro-architecture multi-cycle.
]

#item("Performance")[Les performances][
d'une architecture peuvent être mesurées. On utilise alors différents indicateurs comme le *CPI* (Cycles Par instruction) ou *MIPS* (Million d'Instructions Par Seconde). 
]

=== Micro-architecture chaînée

#item("Définition")[La chaîne de traitement][
 (_pipeline_ en anglais) est une technique d’implémentation de micro-architecture qui sépare les instructions en de multiples étapes qui peuvent s'exécuter en parallèle.
]


#item("Exemple")[Le Pipeline sur 5 étages @PAT[4.6, p.284]][ 
est un exemple classique  avec 5 étapes: *Fetch* (récupère l'instruction) *Decode* (lis les opérandes, entre autres) *Execute , Memory et Write-Back*. 
]


#let case(color, c) = grid.cell(
  fill: color,
  align: center + horizon,
  stroke: 1pt, c)
#let FE = case(blue, [FE])
#let DE = case(red, [DE])
#let EX = case(green, [EX])
#let ME = case(orange, [ME])
#let WB = case(purple, [WB])
#let exec = (FE, DE, EX, ME, WB)
#let line_exec(c0, c1, c2, c3, c4) = {
  return (case(c0, [FE]), case(c1, [DE]), case(c2, [EX]), case(c3, [ME]), case(c4, [WB]))
}

#item("Exemple")[][ 
- Le pipeline en fonctionnement optimal
#grid(
  columns: (35pt, ) * 11,
  rows: 18pt,
  [], ..exec, [], [], [], [], [], 
  [], [], ..exec, [], [], [], [],
  [], [], [], ..exec, [], [], [],
  [], [], [], [], ..exec, [], [],
)

- Dépendance de données entre deux intructions.

#grid(
  columns: (35pt, ) * 11,
  rows: 18pt,
  FE, DE, EX, ME, WB, [], [], [], [], [], [], 
  [], FE, DE, DE, DE, DE, EX, ME, WB, [], [],
  [], [], FE, FE, FE, FE, DE, EX, ME, WB, []
)



- Branchement conditionnel pris

#grid(
  columns: (35pt, ) * 10,
  rows: 20pt,
  ..exec, [], [], [], [], [],  
  [], ..line_exec(blue, red, gray, gray, gray), [], [], [], [],
  [], [], ..line_exec(blue, gray, gray, gray, gray), [], [], [],
  [], [], [], ..line_exec(blue, red, green, orange, purple), [], [],
  [], [], [], [], ..line_exec(blue, red, green, orange, purple), [],
  [], [], [], [], [],
)
]



#item("Remarque")[Des aléas][
 structurels, de données ou de contrôle rendent plus complexe le pipeline, ce qui explique la volonté d'utiliser des ISA plus simples (RISC) qui facilitent l'implémentation de ce type d'optimisation.
]

//==== Définition
//Pour mesurer la performance d'un CPU on peut s'intéresser au *nombre d'instructions* qu'il exécute *par seconde*.


=== Micro-architectures Parallèles @PAT[6]

#item("Définition")[
  La Classification de Flynn @PAT[6.3 Fig 6.2]
][
 est une typologie des systèmes en fonction du nombre de donnnées et d'instructions simultanées.
]


#{
set table.cell(align: center + horizon)
align(center, block(breakable: false, 
table(columns: 4,
  table.cell(rowspan: 2, colspan: 2, []),
  table.cell(
    colspan: 2,
    [Données]
  ),
  [Une donnée], [Multiples données],
  table.cell(
    rowspan: 2,
    rotate(-90deg, reflow: true)[
      Instructions
    ],
  ),
  table.cell(
    rowspan: 1,
    rotate(-90deg, reflow:true)[Une]
  ), 
  [
    SISD
    
    Ex:
    Intel Pentium 4
  ], 
  [
    SIMD

    Ex:
    Instructions SSE du x86
  ],
  table.cell(
    rowspan: 1,
    rotate(-90deg, reflow:true)[Multiples]
  ), 
  [
    MISD  
  
    Pas d'exemple connu
  ], 
  [
    MIMD
    Ex: Intel Core i7
  ],
)))
}



#item("Définition")[Le parallélisme][
signifie que plusieurs données sont traitées en parallèle.
Les architectures SIMD et MIMD sont donc des architectures parallèles.
]



#item("Exemple")[SSE][
(Streaming SIMD Instruction) est l'extension de x86 avec des opérations *vectorisées*. Elles sont l'application d'une instruction simple sur une collection de données.
]



#item("Définition")[La Classification de Raina @VIA[p.10] @PAT[6.5]][
décrit une typologie plus précise des systèmes MIMD.
]


#{
set par(leading: 3pt) 
align(right,
table(
  columns: (6em, 13em, 9em),
  align: center + horizon,
  rows: (1.2em, 2.4em, 2.4em, 2.4em),
[Accronyme], [Catégorie], [Exemple],
[SASM], 
[
Single Adress space,

Shared Memory
],
[Architectures multicœur],

[DADM],
[
Distributed Address Space,

Distributed Memory
],
[Architectures distribuées],

[SADM],
[
Single Address Space,

Distributed Memory
],
[Supercalculateurs]
))
}


#recap()



===== Commentaires :
- Figure en III. de plan de Yaelle. @PAT

- Reprise du plan de Maxime Bridoux pour la partie III.

- Partie I volontairement courte avec schémas explicatif pour gagner de la place pour le grand schémas partie III.

- Partie II plutôt longue pour bien présenter le RISC-V et les différents types d'instruction. L'assembleur est important dans la leçon car "Architecture" en anglais signifie principalement l'ISA (et pas la micro architecture).

===== Autres développements :
- Pipeline à 5 étages
- Décode et exec d'une instruction avec le schémas partie III.
- Construction shémas partie III. : "Un processeur simple" sur le site interne. @VAH[p.426]


#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Paul Adam - Santiago Sara Bautista
]