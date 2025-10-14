#import "../../deps.typ" : *
#show : tableau

= Exemple de méthodes et outils pour la correction des programmes @TOR


#let todo = text(red)[TODO]

== Correction d'un programme @TOR[6]
=== Spécification d'un problème
#item("Définition")[Un programme][
  transforme automatiquement une donnée en entrée en un résultat en sortie.
]

#item("Définition")[@TOR[def 6.1]La spécification d'un problème][
  comporte deux parties : la description des entrées valides (respectant des *préconditions*) et la description du résultat (respectant des *postconditions*).
]

#item("Example")[Trié un tableau d'entiers][
  a la spécification suivante :
  - *Entrée*: un tableau d'entiers $T = [t_0, ..., t_n]$
  - *Sortie*: permutation du tableau en entrée qui le trie.
]

#item("Remarque")[][
  On distinguera la nature générale des données (souvent le type en OCaml par exemple) qui sont des *conditions de bonne formation* et les propriétés supplémentaires qu'elles doivent vérifier, i.e. les préconditions.
]

#item("Exemple")[][
  Un tableau d'entiers *bien formé* sera par exemple un tableau contiguës d'entiers 32 bits en mémoire.
]

#item("Remarque")[][
  La spécification d'un algorithme peut être *raffinée* en y ajoutant des contraintes plus fortes. Par exemple, on peut spécifier le traitement de deux données égales dans un algorithme de tri ou forcer une certaine complexité.
]

=== Correction partielle @TOR[6.1]

#item("Définition")[Un programme est correct][
  (dit correction _partielle_) si toute sortie renvoyé depuis une entrée valide respecte les postconditions.
]

#item("Définition")[@TOR[def 6.2]Un invariant de boucle,][
  étant donnés un algorithme, une boucle de cet algorithme et des entrées valides de l'algorithme, est une propriété _vérifiée_ avant le premier tour de boucle et _préservée_ par chaque tour de boucle.
]

#v(10pt)
#grid(columns: (40%, 1fr), column-gutter: 1em,

item("Propriété")[@TOR[prop 6.1]][
  \ Étant donnés un algorithme, une boucle de celui-ci et un invariant sur cette boucle, alors pour toute entrée valide de l'algorithme l'invariant est vérifié à la fin de l'exécution de la boucle.
],
item("Exemple")[@TOR[prog 6.6]][\ Algorithme du tri insertion.
#align(center,```c
void insertion_sort(int a[], int n) {
    for (int i = 1; i < n; i++) {
        // invariant: 
        //     a[0..i[ est trié
        int v = a[i];
        int j = i;
        while (j > 0 && a[j-1] > v) {
            a[j] = a[j-1];
            j--;
        }
        a[j] = v;
    }
}
```)
]
)
#dev[
  #item("Exemple")[L'algorithme de Dijkstra][
    permet de calculer les plus courts chemins entre un sommet et tous les autres dans un graphe pondéré dont les arêtes sont de poids positif. Cet algorithme est correct et termine.
  ]
]

#item("Remarque")[][
  Si le graphe étudié par l'algorithme de Dijkstra admet des poids négatifs, l'algorithme n'est pas *correct*.
]

=== Terminaison @TOR[6.2]
#item("Définition", show-title: false)[Terminaison][L'exécution d'un programme *termine* si elle produit un résultat en un temps fini pour toute entrée valide.]

#item("Définition")[@TOR[def 6.3]Un variant, ][
  étant donné une boucle d'un algorithme, est une fonction des variables de l'algorithme vers $NN$ qui décroît *strictement* à chaque tour de boucle.
]

#item("Remarque")[][
  Pour un algorithme récursif, un variant est une même fonction qui décroît à chaque appel récursif.
]

#item("Remarque")[][
  De façon plus générale, un variant peut être une fonction strictement décroissante des variables du programme vers n'importe quel ensemble $E$ muni d'un *relation bien fondée*.
]
#item("Définition")[@TOR[def 6.18] Une relation $<=$ est bien fondée][
  sur $E$ s'il n'existe pas de suite infinie strictement décroissante pour $<=$.
]

#item("Implémentation")[@TOR[prog 6.1] Recherche Dichotomique][
  #align(center,```c
  int binary_search(int v, int a[], int n) {
    int lo, hi = n;
    while (lo < hi) { // lo <= hi serait incorrect
      int mid = lo + (hi - lo) / 2;
      if (a[mid] == v) return mid;
      if (v < a[mid]) { mid = mid; } else { lo = mid + 1; }
    }
    return -1;
  }
  ```)
]

#item("Exemple")[La recherche dichotomique][
  possède le variant de valeur : `hi - lo` $in NN$, la taille de l'intervalle de recherche. Cette quantité positive décroît bien strictement, car l'intervalle de recherche décroît en taille à chaque itération.
]

#item("Définition")[Un programme est totalement correct][
  s'il est correct et qu'il termine.
]

== Méthodes manuelles pour la correction@TOR[5]

=== Bonnes pratiques de programmation
#item("Motivation")[][
  Plusieurs programmes écrits différemment peuvent avoir le même comportement. Cependant, le code doit être lu par des humains et se doit donc d'être un maximum "lisible".
]

#item("Remarque")[Le code idiomatique][
  suit une convention. Elle peut être définie par la communauté utilisant un même langage ou un groupe de développeurs collaborant sur un même projet.
]
#item("Remarque", show-title: false)[Code idiomatique $!=$ dogmatique][
  Il n'existe pas de "meilleure manière" absolue d'écrire un programme. Il faut éviter une forme de dogmatisme envers les idiomes.
]


#item("Remarque")[L'immuabilité][
  est un idiome commun pour les langages fonctionnels qui facilite le raisonnement autour d'un programme et notamment la preuve de sa correction.
]

   
#item("Conseils")[Du code "propre"][
  est un critère subjectif. On dira le plus souvent que du code documenté, factorisé, aéré, réutilisable et indenté sera propice à être lu plus simplement.
]

#item("Méthode")[On peut documenter une fonction][
  à l'aide d'un commentaire placé avant sa définition. On y précise la spécification de la fonction (notamment préconditions, postconditions, cas d'erreur).
]

#item("Méthode")[Séparer le code en fichiers][
  permet de regrouper les fonctionnalités thématiquement. Cela rend la navigation du code source plus simple.
]

#item("Définition")[@TOR[5.3] La programmation défensive][
  vise à vérifier les préconditions d'une fonction avant d'en exécuter le code. Ceci permet d'assurer la validité des préconditions supposées par un programme.
]

#item("Exemple")[][
  L'algorithme de Dijkstra pourrait faire un pré-calcul pour vérifier qu'un graphe n'a pas d'arêtes de poids négatifs.
]

#item("Méthode")[Des assertions][
  peuvent être placées (`assert` en C ou OCaml) dans le code pour arrêter l'exécution en cas de précondition ou d'invariant non vérifié.
]

#item("Remarque", show-title: false)[Propagation d'erreur][
  On peut également renvoyer des valeurs d'erreurs ou lever des exceptions en cas de précondition ou d'invariant non-vérifié. Il est alors de la responsabilité de la fonction appelante de gérer les cas d'erreur.
]

#item("Méthode")[Un débogueur][
  permet d'exécuter un code instruction par instruction en observant l'état du programme pour rechercher la cause d'un bogue.
]

#item("Exemple")[GDB et LLDB][
  sont des débogueurs utilisés en C.
]
#item("Remarque")[][
  En cas de comportement inattendu du code, déboguer son programme permet d'enquêter sur l'origine du problème.
]
#item("Méthode")[][
  Les compilateurs renvoient des messages d'erreurs et avertissements à destination du développeur. On les activera en C avec les options `-Wall -Wextra -pedantic`.
]

/*
#item("Exemple")[][
  On préférera le code de gauche à celui de droite.  
  #align(center, grid(columns: 2, column-gutter: 0.5em,
    ```c
    int binary_search(int v, int[] a, int n) {
      int lo = 0, hi = n;
      while (lo < hi) {
        int mid = lo + (hi - lo) / 2;
        if (a[mid] == v) {
          return mid;
        } else if (v < a[mid]) {
          hi = mid;
        } else {
          lo = mid + 1;
        }
      }
      return -1;
    }
    ```,
    ```c
    int binary_search(int v, int[] a, int n) {
      int b = 0, c = n;
      while (c - b > 0) {
        int m = b + (c - b) / 2;
        a[m] == v ? return m 
                  : v < a[m] ? c = m 
                  : b = m + 1;
      }
      return -1;
    }
    ```
  ))
  
]
*/

=== Détection d'erreurs par les tests
#item("Définition")[Un test unitaire][
  vérifie le comportement d'une unité "atomique" de code pour une entrée donnée (par exemple une unique fonction).
]
#item("Définition")[Un test d'intégration][
  vérifie le bon comportement d'une combinaisons d'opérations (par exemple ouvrir un fichier, puis lire son contenu et le transformer en graphe).
]

/*
#item("Remarque")[][
  Aucune méthode de test ne prouve la correction d'un programme, il faut varier les approches pour minimiser les chances que le programme soit incorrect en pratique.
]
*/

== Outils automatiques pour la correction


#item("Théorème")[(Rice)][
  Toute propriété non trivial sur un programme est indécidable.
]
#item("Conséquence")[][
  Automatiser la vérification de correction des programmes en général est indécidable.
]
  

#grid(columns: (50%, 1fr), column-gutter: 1em,
item("Schéma")[][
  L'ensemble des programmes qui passent les tests sont une sur-approximation des problèmes correctes tandis que le typage sous-approxime.
],
align(center + horizon, canvas({
    import draw: *
    let box(title, pos, size, size-title, color) = {
      rect(pos, (rel: size), stroke: color, name: "box")
      rect("box.north-east", (rel : size-title), stroke: none, name: "box-title")
      content("box-title", padding: 10pt, title)     
    }
    box([Tests #emoji.checkmark.box], (0.2, 0.2), (6, 2.6), (-2, -0.7), green)

    box([Correct], (0.4, 0.4), (5.6, 1.7), (-2, -0.7), blue)

    box([Typage #emoji.checkmark.box], (0.6, 0.6), (3.3, 1.3), (-2.5, -0.7), red)

    // Je sais pas pourquoi mais `rotate` me sort une erreur pour le texte, si t'arrive à fix je suis preneur, sinon on peut just agrandir les boites.
    box([], (0, 0), (7, 3), (-2, -0.7), black)
    content((6.65, 1.4), angle: -90deg, [Incorrect])
  })
))

=== Logique de Hoare @SEM[9.2]

#item("Définition")[Un triplet de Hoare,][
  noté ${ P } space S space { Q }$, est une affirmation avec $P$, $Q$ des prédicats et $S$ un programme. Cette formule signifie que dans l'état initial $P$ est valide, si on exécute le programme $S$ et qu'il termine alors, on arrive à un état final où $Q$ est valide.
]

#item("Exemple")[Triplet de Hoare de factoriel.][
  $  { x=n } \ y := 1; "while" ¬(x=1) "do" (y := x times y; x := x−1) \ { y=n! ∧ n>0 } $
]

#item("Définition")[La logique de Hoare][
  utilisent 
  // est composé de la description sémantique d'un programme avec les triplets de Hoare et 
  des règles d'inférence permettant de prouver les triplets de Hoare.
]

#item("Exemple")[L'outils WHY3][
  est un assistant de preuve de programme utilisant la logique de Hoare.
  // Il utilise les règles d'inférence de la logique de Hoare pour prouver des triplets comme celui montré ici.
]

=== Typage @TOR[10.5.3] @TOR[3.1.3]

#item("Citation")[]["A well typed program cannot go wrong", R. Miller.]

#item("Définition")[Le typage][
  en OCaml consiste à associer à chaque expression un type à la compilation. Ceci limite les programmes que l'on peut écrire et vise à *encoder dans le système de type* des conditions sur les valeurs des expressions.
]

#item("Exemple")[][
  Ce code OCaml suivant ne compile pas :
  #align(center,```ml
  let f (x : int) : int = 2 + x
  let () = f "test"
  ```)
]

#item("Remarque")[][
  Les systèmes de type "communs" ne permettent pas de définir certaines préconditions. Par exemple, on ne peut pas en OCaml indiquer qu'une fonction n'accepte en entrée que des entiers de l'intervalle 0 à 10 de façon simple.
]

#dev[
  #item("Méthode")[L'inférence de type @TPL[22]][
    évite au programmeur de typer chaque valeur. Le compilateur infère un type "le plus général" pour chaque valeur, et renvoie une erreur de compilation en cas de conflit.
  ]

  #item("Exemple")[][
    Le programme suivant typera `a`, `c` et `b` à `int`, et `f : int -> int -> int`. 
    #align(center,
    ```ml
    let f a b = let c = a + b in a * c
    ```)
  ]
]

=== Automatisation des tests @NAN

#item("Définition")[La couverture d'un test][
  est l'ensemble des chemins dans le code parcourus lors de l'exécution d'un test.
]

#item("Remarque", show-title: false)[Granularité couverture][
  La couverture des tests peut être plus ou moins précise, allant jusqu'à vérifier que chaque instruction est bien exécutée au moins une fois.
  // allant de vérifier que tous les valeurs possibles d'une condition booléenne sont parcourues ou bien en vérifiant que chaque ligne est bien exécutée.
]

#item("Remarque")[Des outils de test de couverture][
  permettent de tester quelle partie du code est *couverte* par un jeu de test. La couverture d'un jeu de test est un critère de qualité simple.
]

#item("Exemple")[GCOV][
  est un outils classique de test de couverture de code utilisé en C.
]

#item("Définition")[Le Fuzzing][
  consiste à générer aléatoirement des entrées du programme et génére donc des test. On cherche ici à augmenter la couverture des tests existants.
]

#recap()

===== Remarque
En fonction des affinités (et développements choisis) on pourra développer plus en détails :
- la partie sur les tests
- la partie sur la logique de Hoare
- ajouter une partie sur le flot de contrôle et les tests liés à ça
- ajouter des choses que vérifie les compilos dans un programme

Attention relation $eq.not$ ordre, une relation bien fondée peut suffire pour un invariant. On a ici parlé d'ordre comme le fait @TOR.

===== A savoir
- comment passer d'un ordre $<=$ à un ordre stricte $<$.
- bien savoir expliquer le triple de Hoare sur factoriel (connaitre l'arbre de dérivation)
- bien être au clair sur le théorème de Rice et les limitations de la partie 3.

- lien sur les #link("https://en.wikipedia.org/wiki/Lambda_cube")[systèmes de type] interessant pour les questions.

====== Développements
- un développement sur la logique de Hoare peut être interessant.
- la preuve de la correction d'un algorithme fait un très bon développement (dikstra étant l'exemple canonique).
- développement sur une notion du typage est interessante.
- un développement sur les tests


#bibliography(read("../bib.yaml", encoding: none))
#align(bottom + center)[Paul Adam & Aloïs Rautureau]




