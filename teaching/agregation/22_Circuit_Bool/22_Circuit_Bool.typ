#import "../../deps.typ": *
#show : tableau

= Fonctions et circuits booléens en architectures des ordinateurs

== Contexte @NSIP[23]

#item("Définition")[L'Architecture de Von Neumann][
modélise un ordinateur comme une mémoire et une unité centrale de traitement, le programme et les données étant stockées dans la mémoire. ]

#item("Définition")[L'unité centrale de traitement][
consiste en une unité de contrôle, chargée d’exécuter les instructions machines, et une unité de traitement, qui applique les effets des instructions.
]

#item("Définition")[Un jeu d'instructions][
ou architecture, est l’ensemble des opérations qu’un processeur peut exécuter.
]

#item("Définition")[Un langage d'assemblage][
ou assembleur est un ensemble d'instruction ou pseudo-instruction .
]

#item("Exemple")[][
  Un jeu d'instructions simple utilisant une mémoire pourrait être composé des 3 instructions écrites en langages d'assemblage : `add`, `store` et `load`.
]

#item("Définition")[Une microarchitecture][
l'implémentation matérielle d'une unité centrale de traitement d'un jeu d'instructions.
]

== Circuits Combinatoires @VAH[2]

=== Circuits matériels

//#item("Définition")[Circuit combinatoire][]
  

#item("Définition")[L'interrupteur][
laisse passer le courant si et seulement si l’entrée de contrôle est à "on".
]


#grid(columns: (60%, 40%), column-gutter: 1em,[
#item("Histoire")[Miniaturisation interrupteurs][
- 1930s Relays
- 1940s Tubes à vide
- 1950s Transistors indépendants
- 1960s Circuits intégrés (CMOS)
// Peut s'améliorer avec la p25 BOULIER (worth ?)
]

],[
  #item("Schémas")[ @VAH[Fig 2.3] ][
    #align(center)[
      #image("Schema_interrupteur.png", width: 60%)
    ]
  ]
])

#item("Idée")[][
  Pour "calculer", on va pouvoir implémenter des fonctions, avec des fils d’entrée et des fils de sortie avec des interrupteurs connectés entre eux.
]

//Version anglaise des portes booléennes
#grid(columns: (50%, 40%), column-gutter: 1em,
item("Shéma")[Portes NOT, OR, AND @VAH[fig 2.8]][
  On peut par exemple implémenter les fonctions `NOT`, `OR` et `AND`~:
],
align(center, image("Schéma_portes_transistors.png"))
)

#grid(columns: (60%, 40%), column-gutter: 1em,
[
  #item("Remarque")[Autres portes][
    On peut de la même façon implémenter d’autres portes logiques~: NAND, OR, XOR, XNOR.
  ]
],
align(center)[
  #image("nand_nor.png.png")
  @VAH[fig 2.45]
]
)


#grid(columns: (70%, 30%), column-gutter: 1em,
item("Définition")[Décodeur][
Un décodeur prend un nombre binaire $b$ à $n$ bit en entrée et met uniquement sa $b$-ième sortie sur $2^n$ à 1, décodant ainsi le nombre $b$.
],
align(center, image("décodeur.png", width:60%))
)

#item("Définition")[Multiplexeur][
  Un multiplexeur prend $M$ entrées, et 1 sortie, et ne laisse passe qu’une seule des entrées vers la sortie. Un ensemble d’entrées additionnels, les *s«lecteurs*, déterminent quelle entrée faire passer.
]

#item("Remarque")[][
  Un multiplexeur avec $n$ sélecteur peut traiter jusqu’à $2^n$ entrées.
]

#item("Définition")[Démultiplexeurs et encodeurs][
  On peut également construire les circuits inverse des multiplexeurs et des décodeurs.
]

#dev[
#item("Implémentation")[Construction d’un additionneur à $n$ bits@PAT[A.6]][
 À l’aide de portes logiques, on peut construire un circuit qui calcule l’addition de deux nombres écrits en binaire sur $n$ bits en $cal(O)(log n)$ traversées de portes. 
]
]

=== Simplification de fonctions booléennes @NSIP[Chap 22.2]

#item("Définition")[Fonction booléenne][
  Une fonction booléenne est une fonction qui prend en entrée un ou plusieurs _bits_ et qui produit en résultat un unique _bit_.
]

#item("Définition")[La table de vérité][ d’une fonction à $n$ _bits_ en entrée est une table de $2^n$ lignes correspondant aux résultat de la fonction sur les $2^n$ combinaisons possibles des entrées.
]

#item("Exemple")[][
  Le schéma 9 et la remarque 10 montrent les tables de vérités des fonctions booléennes `NOT`, `AND`, ...
]

@VAH[Chap 6.2]

#grid(columns: (50%, 50%), column-gutter: 1em, [
  #item("Méthode")[Tableaux de Karnaugh][
    Un tableau de Karnaugh est une méthode visuelle pour minimiser les fonctions booléennes à 2 jusqu'à 4 variables en regroupant les "1" et les "0" d'un tableau à deux dimensions.
]], [
  #item("Exemple")[][
    #align(center, image("./karnaugh.png", width:70%))
  ]
]
)


#item("Remarque")[L'algorithme de Quine-McCluskey,][
lorsque l'on a plus que 4 variables, généralise le principe de regroupements des cas, ce qui est impossible avec un tableau de Karnaugh à deux dimensions.
]
//#v(1em)


#item("Définition")[Un circuit combinatoire][
  n’exécute qu’un seul calcul, celui d'une fonction booléenne.
]

== Circuits Séquentiels @VAH[3]
=== Comment stoquer 1 bit

#item("Définition")[Un circuit Séquentiel][
est un circuit dont les sorties ne dépendant pas seulement des entrées, mais aussi d’un *état courant*, qui correspond à toutes les informations enregistrées en mémoire.\
L’état dépend lui de la séquence des valeurs qu’ont prises les entrées du circuit.
]

//=== Mémoire

#grid(columns: (60%, 40%), column-gutter: 1em,
[#item("Définition")[Bascule SR][
  Une bascule RS est un circuit asynchrone à une sortie et deux entrées, Reset et Set, définissant la sortie à 0 et 1 respectivement.
]],[
#item("Schéma")[@VAH[fig 3.4]][
  #align(center, image("SR_latch.png", width:40%))
]
])

#item("Définition")[Horloge][
  Une horloge est un circuit produisant un signal alternant entre les valeurs 0 et 1.
]

#item("Définition")[Circuits Synchrones/Asynchrones][
Un circuit séquentiel dont la mémoire ne peut changer que lorsque le signal d’horloge est à 1 est dit *synchrone*. Un circuit séquentiel qui n’utilise pas d’horloge est en revanche appelé *asynchrone*.
]

#item("Définition")[Une Bascule D][
est un circuit à une entrée et une sortie connectée à une horloge, tel que la valeur de sortie devient la valeur d’entrée à chaque période de l’horloge.
]

#grid(columns: (40%, 55%), column-gutter: 1em, [
  #item("Définition")[Un chronogramme][
d’un circuit est une courbe représentant l’évolution de la valeur booléenne sur certains fils du circuit en fonction du temps.
  ]
], [
  #item("Exemple")[Chronogramme d’une bascule D][
    #align(center, image("D_latch.png", width: 40%))
  ]
]
)

#item("Remarque")[][
  On a donc réussi à construire un circuit séquentiel, la sortie d’une bascule D dépend de son état précédent.\
  On peut se servir de ces bascules pour stocker de l’information, et donc construire des mémoires.
]

=== Mémoire et Registres

#item("Définition")[Un registre][
est un composant séquentiel pouvant stocker plusieurs bits. On peut construire un registre basique en utilisant plusieurs bascules D.
]

#item("Définition")[RAM @NSIP[23.1]][
  La mémoire vive, ou *RAM* (_Random Access Memory_) est un circuit stockant des données tant qu’il est alimenté. Il prend en entrée une adresse et un signal (lecture/écriture), et en sortie la valeur à cette adresse.
]

#item("Définition")[@PAT[A-9] La SRAM][
stocke les données statiquement dans des bascules D. Les données sont conservés tant qu’un courant est appliqué.
]

#item("Définition")[La DRAM][
stocke les données dynamiquement à l’aide de condensateur et d’un transistor par bit. Elle est donc plus dense et moins chère que la SRAM, mais doit être régulièrement _rafraichie_ à cause de la décharge des condensateurs.
]

== Processeur @NAN

=== Machines de Moore et Mealy @VAH[6.3 index Mealy]

#item("Définition")[Une machine de Moore (resp. de Mealy)][
est un transducteur fini (automate fini avec sortie) déterministe tel que, durant la lecture d’un mot d’entrée, chaque état (resp. transition) visité produit une lettre en
sortie. Pour tout mot d’entrée, on obtient un mot de sortie de la même taille.
]

#item("Implémentation")[][
On peut implémenter une machine de Moore ou de
Mealy à l’aide d’un circuit séquentiel, en utilisant un registre pour stocker
l’état courant de l’automate, et des portes logiques pour réaliser la fonction
de transition et la sortie de la machine.
]

=== Unités de contrôle et de traitement @VAH[8]

#item("Définition")[L'unité de traitement][
sert à réaliser un calcul, celui des différentes instructions. Ce dernier se fait en trois étapes :
- Charger des données
- Transformer ces données
- Enregistrer ces données
c'est souvent une unité arithmétique et logique (ALU).
]

#item("Définition")[L'unité de contrôle][
sert à diriger les calculs faits par l'unité de traitement, c'est une machine de Mealy ou de Moore. Cela se fait généralement en trois étapes :
- Récupérer
- Décoder l'instruction
- Exécuter l'instruction dans l'unité de traitement
]

#dev[
#item("Implémentation")[@VAH[8.3] Unité de traitement pour un processeur à trois instructions][]

#item("Implémentation")[Unité de contrôle pour un processeur à trois instructions][]
]

=== Performances @PAT[1.6]

#item("Définition")[Le chemin critique][
dans un circuit est un chemin entre une entrée et une sortie passant par le plus de portes. Il détermine la période minimale de l'horloge.
]

#item("Définition")[Cycles Par Instruction (CPI)][
est le nombre moyen de tours d'horloge nécessaire à la réalisation d'une instruction.
]

#item("Proposition")[La performance d'un processeur][
est mesurée en nombre d'instructions par secondes et donc calculée par $f_(max) times "CPI"$ avec $f_(max)$ la fréquence maximale de son horloge.
]

#item("Définition")[Un pipeline @PAT[1.8]][
est une technique permettant d'augmenter le CPI d'un processeur sans en diminuer la fréquence en superposant les étapes de contrôle et de traitement des instructions.
]

#item("Exemple")[@PAT[fig 4.42]][
  #align(center, image("Pipeline.png", width: 100%))
]

#item("Remarque")[Aléas @PAT[Chap 4.8]][
Les dépendances de données entre les calculs successifs sont des obstacles de l’exécution pipelinée.
]

#recap( show-heading-big-numeral: false )

===== Remarque



La dernière sous-partie sur les performances peut être étendue en ajoutant des notions sur @PAT[1.7 (the power wall)] ou @PAT[1.8 (L'évolution des performances depuis les années 80)] pour combler facilement la dernière page / meubler à l'oral.


#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Alexis Hamon - Benjamin Voisin
]