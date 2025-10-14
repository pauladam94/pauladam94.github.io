#import "../../deps.typ" : *
#show : tableau

= Exemples d’algorithmes utilisant la méthode «diviser pour régner». Exemples et Applications.

/ Motivation : Premières notions d'algorithmiques, présenter le "diviser pour regner" permet d'introduire de façon très fluide la prorgammation dynamique, on peut profiter de cette leçon pour sensibiliser aux enjeux de complexités lorsque l'on compare des algos, et même sur la complexité en espace.

== Introduction

#item("Définition")["Diviser pour régner"][
  est une méthode algorithmique permettant de résoudre un problème en le séparant en sous-problèmes de taille moindre. Ces sous-problèmes sont résolus, puis leurs solutions sont combinées afin de résoudre le problème initial.
]

#item("Méthode")[Schémas de la résolution DPR.][
  - Diviser : décomposer le problème en un ou plusieurs sous-problèmes.
  - Régner : résoudre les sous-problèmes individuellement
  - Fusionner : combiner les solutions des sous-problèmes pour obtenir celle du problème initial
]

#item("Remarque")[][
  Pour résoudre un sous-problème on considère deux cas:
  - Cas de base : instances triviales du problème, pour les tailles les plus petites, pour lesquelles on peut exprimer directement les solutions.
  - Cas récursif : autres cas, où le problème sera divisé et les sous-problèmes résolus récursivement, jusqu'à atteindre un cas de base.
]

#item("Problème")[Recherche dans un tableau trié][
  - Entrée: Un tableau trié l, une valeur x.
  - Sortie: Oui si x appartient au tableau, Non sinon.
]

#item("Algorithme")[Recherche dichotomique][
```py
```
]

#item("Remarque")[][
  - Il est souvent question de résoudre les sous-problèmes récursivement dans un algorithme suivant l'approche DPR.
  - Lors de l'implémentation d'un programme DPR récursif, il convient de se méfier d'un potentiel dépassement de pile lors de l'éxécution.
  - Il est toujours possible d'écrire un algo DPR dans un style impératif, il en résulte un code moins naturel mais qui n'est pas soumis à la contrainte du dépassement de pile.
]

#item("Méthode")[Complexité.][
  Si l'on découpe le problème initial en k problèmes de tailles $(n_i)_(1 <= i <= k)$ et la division et fusion des problèmes demande un coût $f(n)$, on obtient la relation de récurrence suivante pour déterminer la complexité $C(n)$ d'un algorithme DPR: $C(n) = f(n) + sum_(i=1)^k C(n_i)$.
]

#item("Remarque")[][
  Souvent la relation de récurrence est très simple. Par exemple dans le cas où l'on traite les deux moitiés d'un problème : $C(n) = f(n) + 2 * C(n/2)$.
]

#item("Application")[Recherche dichotomique][
  $C(n) = C(n/2) + alpha$.
  Donc $C(2^p) = C(2^(p-1)) + alpha = ... = C(2^0) + p . alpha$ et $C(n) = Theta(log n)$.
]

#item("Théorème")[Théorème Maitre(Admis) @COR3[4.5 4.6].][
  De manière générale, pour calculer le coût d'un algorithme qui découpe un problème de taille $N$ en $a$ sous-problèmes de taille $N / b$ et tel que $f(N) = Theta(N^c)$, posons $c_"crit" = log_b(a)$ :
  - si $c < c_"crit", C(N) = Theta(N^(c_"crit"))$
  - si $c = c_"crit", C(N) = Theta(N^c log N)$
  - si $c > c_"crit", C(N) = Theta(N^c)$
]

#item("Remarque")[][Ce théorème est hors programme mais peut être utile pur avoir rapidement la complexité d'un algorithme.]

#item("Remarque")[][
  Les algorithmes diviser pour régner ont plusieurs interêts :
  - Complexité généralement faible par rapoort aux algorithmes naïfs
  - Parallélisme facile à mettre en place grâce à la division en sous-problèmes
]

#item("Implémentation")[Code Multithreadé @VERT[TODO]][
  Voici un exemple d'un code C multithreadé.
  #text(red)[TODO]
]

== Etudes d'algos DPR

#item("Problème")[][
  - Entrée: Un tableau $a$ de valeurs.
  - Sortie: Un tableau $a'$ de avec les élments de a dans l'ordre. 
]

#item("Idée")[][
  Trier le début et la fin du tableau séparément puis combiner les deux tableaux ainsi triés.
]

#item("Algorithme")[Tri Fusion][
```python
FUSION(a1, a2, l, m, r):
  # tableaus a1 et a2, indices l, m et r
  # l <= m <= r et a1[l, m[ et a2[m, r[ sont triés
  i <- j, j <- m
  for k = l .. r -1 do
    if i < ù et (j = r)
  ...
  ...
# trouver un bouquin avec le code dedans
  ...
```
]

#item("Remarque")[][
  Le coût de séparation est en $cal(0)(1)$, celcui de la combinaison en $cal(O)(n)$ : $C(n) = 2 * C(n/2) + cal(O)(n)$
]

#item("Propriété")[Complexité.][
  $C(n) = cal(O)(n log n)$.
]

#item("Idée")[][
  Trier les plus grands éléments et les plus petits éléments séparément puis combiner les deux parties ainsi triés.
]

#dev[
#item("Algorithme")[Tri rapide][
```py
TriRapide():
 # todo trouver bouquin avec le code dessus
```
]
]

#item("Remarque")[][
  Le coût de la division est en $cal(O)(n)$, celui de la fusion est en $cal(O)(1)$. Il n'y aura cependant pas toujours le même nombre d'éléments chez les grands et les petits, on parle de complexité en moyenne.
]

#item("Propriété")[Complexité.][
  La complexité au pire cas du tri rapide est en $cal(O)(n^2)$, comme les tris naïfs (insertion, selection). Cependant sa complexité en moyenne est en $cal(O)(n log n)$.
]

#item("Remarque")[][
  Dans le pire cas, le pivot est toujours le plus grand élément. Cela n'arrive sur la liste triée dans l'ordre inverse. On fait alors pareil que le tri par insertion dans son pire cas.
]

#item("Remarque")[][
  Cependant, si l'implémentation est récursive, ce pire cas peut facilement mener à un débordement de pile. Pour éviter cela, on peut traiter le sous-tableau le plus petit en premier si on bénéficie de l'optimisation pour les appels terminaux.
]

#item("Problème")[][
  Multiplication de deux nombres à n chiffres.
]

#item("Algorithme")[Karatsuba.][
  On remaque que $(a times 10^k)(c times 10^k + d) = a c times 10^k + (a c + b d - (a - b)(c - d)) times 10^k + b d$ ce qui ne demande que trois multiplications. L'algorithme est alors:
  - Diviser: si $x$ et $y$ sont à $2n$ chiffres, les écrire $x = a times 10^k + b$
  - Regner: Lancer l'algorithme récursivement sur les entrées $(a, c), (b, d) "et" (a-b, c-d)$
  - Fusionner: Calculer $a c times 10^(2n) + [a c + b d - (a - b)(c - d)] times 10^k + b d $.
]

#item("Propriété")[Complexité.][
  On a donc besoin de $cal(O)(n^(log_3 n))$ multiplications (les autres opérations sont en temps négligeable).
]

#dev[
#item("Problème")[Deux points les plus proches.][
  - Entrée: une liste L de points du plan $p_i = (x, y)$.
  - Sortie: $(x, y), (x', y')$ minimisant la distance.
]

#item("Propriété")[Complexité.][
  Même équation que pour le tri fusion : $cal(O)(n log n)$.
]
]

== Limites de la méthode DPR

=== Gain asymptomatique

#item("Remarque")[][
  Les algos DPR présentés ont une meilleure complexité asymptotique que leur homologue naïf, cependant il arrive que sur de petites instances la version naïve s'éxécute plus rapidement : cela peut par exemple être dû aux constantes cachées dans la notation de $cal(O)$.
]

#item("Exemple")[Algorithmes Galactiques.][
  Ce sont des algorithmes optimaux mais que pour des entrées beaucoup trop grandes (par exemple, plus grandes que le nombre d'atomes de l'univers).
]

#item("Idée")[][
  La division en sous-problèmes peut s'arrêter lorsque la taille des problèmes est suffisamment petites pour être avantageuse pour l'algo naïf.
]

=== Recoupement des sous-problèmes

#dev[
  #item("Application")[La Pyramide d'entiers (Seam Carving) @TOR][
    - Entrée: Une pyramide d'entiers de hauteur n.
    - Sortie: Un chemin descendant de somme maximale.
  ]

  #item("Propriété")[(Complexité)][
    On a un algo naïf en $cal(O)(n * 2^n)$ et un algo en DPR en $cal(O)(2^n)$.
  ]
]

#item("Définition")[(Mémoïsation)][
  On appelle mémoïsation le fait de stocker les résultats déjà calculés pour pouvoir y accéder rapidement à l'avenir.
]

#item("Propriété")[Complexité.][
  En mémoïsant l'algo DPR on obtient une complexité en $cal(O)(n²)$
]

#item("Remarque")[][
  Mémoïser un algo DPR est une des façons de faire ce que l'on appelle de la programmation dynamique.
]

#item("Remarque")[][
  La programmation dynamique est une stratégie algorithmique plus adaptée dans le cas où les sous-problèmes se chevauchent.
]

#recap()

===== Remarque
Différents livres parlent de la méthode "diviser pour regner" @COR3[4], @TOR[9.4.1].

#bibliography(read("../bib.yaml", encoding: none))


