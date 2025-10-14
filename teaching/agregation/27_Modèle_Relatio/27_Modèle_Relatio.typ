#import "../../deps.typ": *
#show : tableau

= Modèle relationnel et conception de bases de données


== Modèle relationnel @GARD

=== Organisation des données en tables

#item("Contexte historique")[Le modèle relationnel][
  a été introduit par E. F. Codd en 1969, quand il travaillait au centre de recherche d'IBM San-José.
]

#item("Objectifs")[Le modèle relationnel][
  vise à fournir un système de manipulation de données qui
  - Permette un indépendance entre applications manipulant les données et représentation interne des données
  - Aide à gérer les défis de cohérence et de redondance des données
]

#item("Intuition et terminologie")[Le modèle relationnel][
  organise les données en tables, appelées *relations*.
  Les lignes de ces tables sont des $n$-uplets appelées *enregistrements*.
  Les colonnes de ces tables sont appelées *attributs* et associées à des ensembles de valeurs possibles appelés *domaines*.
]

#item("Définition")[Un domaine][
  est un ensemble de valeurs/*, caractérisé par un nom (indépendant du contexte) (je sais pas si je trouve ça très clair, à mon avis ça peut mener à de la confusion sur la suite du plan notammant les attributs)*/. On peut les rapprocher de la notion de *type* en programmation.
]

#item("Exemple", show-title:false)[Domaines][
  `INTEGER` l'ensemble des entiers et
  `VARCHAR` l'ensemble des chaînes de caractères sont des domaines.
]

#item("Définition")[Un attribut][
  est un domaine, auquel on associe un nom et une sémantique dans un contexte particulier.
]

#item("Exemple", show-title:false)[Attributs][
  `VARCHAR` avec le nom "Pays" représentant le nom d'un pays est un attribut,
  tout comme `INTEGER` avec le nom "Population" représentant le nombre d'habitants.
]

#item("Définition")[Schéma relationnel][
  Un schéma relationnel est une liste d'attributs, caractérisée  par un nom.
]

#item("Exemple", show-title:false)[Schéma relationnel][
  Un exemple de schéma relationnel est "Démographie" mettant en relation
  l'attribut "Pays" de domaine `VARCHAR` et l'attribut "Population" de domaine `INTEGER`.
]

#item("Définition")[Relation.][
  Étant donné un schéma relationnel avec des domaines $D_1, ..., D_n$,
  une *relation* qui suit ce schéma est un sous-ensemble du produit cartésien
  $D_1 times ... times D_n$.
]

#set table.cell(align: center + horizon)

#item("Exemple")[La relation suivante][
  suit le schéma 
  ```python "Démographie"("Pays": VARCHAR, "Population": INTEGER)```:
  #align(center, 
  table(columns: 3,
        stroke: (i, j) => 
          if (j == 0 and i > 0)  {(bottom: black)}
          else if (i == 1) {(right:black)}
        ,
    [*Démographie :*], [*Pays*], table.vline(), [*Population*],
    [], [France],   [68 000 000],
    [], [Belgique], [12 000 000]
  )
)
]

#item("Définition", show-title:false)[Enregistrement ou n-uplet][
  Chacun des éléments d'une relation est appelé un *enregistrement*.
  On parle parfois aussi de *n-uplet*.
]

#item("Remarque")[Absence de doublons.][
  Puisque nous avons utilisé des ensembles pour définir les relations, cela implique qu'il n'y a pas de doublons: chaque enregistrement apparaît au plus une fois. Cependant ceci n'est pas toujours le cas en pratique.
]

#item("Définition")[La valeur spéciale NULL][
  sert à indiquer quand une valeur dans un enregistrement est manquante ou non-renseignée.
]

#item("Définition")[Contraintes][
  On peut poser des contraintes d'intégrité et de cohérence sur les données.
  Par exemple en exigeant qu'un attribut en particulier ne puisse pas être NULL.
]

#item("Définition")[Une clef][
  d'une relation est un sous-ensemble d'attributs permettant d'identifier de façon unique chaque enregistrement.
  Quand on crée une relation on choisi une clef en particulier qu'on appelle *clef primaire*.
]

#item("Exemple", show-title:false)[Clef primaire][
  Dans la relation ```sql "Démographie"```,
  l'attribut ```sql "Pays"``` est une clef: chaque pays a au plus une ligne dans cette relation. La paire d'attributs ```sql ("Pays", "Population")```
  est aussi une clef. On peut choisir ```sql "Pays"``` en tant que clef primaire.
]

#item("Remarque")[La notion de _clef_ est contextuelle.][
  Dans une relation suivant le schéma
  ```sql "Hydrographie"("Fleuve": VARCHAR, "Pays": VARCHAR)```
  qui à un fleuve associe le pays où il se trouve, l'attribut 
  ```sql "Pays"``` n'est pas une clef, car un pays peut avoir plusieurs fleuves.
]

#item("Définition")[Une contrainte référentielle][
  consiste  à imposer qu'un des attributs d'une table ne contienne que des valeurs présentes dans un autre attribut d'une autre table.
  On parle également de *clef étrangère*.
]

/*
#item("Exemple", show-title:false)[Contrainte référentielle et clef étrangère][
  Si on a une relation $R_1$ suivant le schéma ```sql "Démographie"```
  des exemples 9 et 11, et une relation $R_2$ suivant le schéma
  ```sql "Hydrographie"``` de la remarque 16, alors on peut poser une contrainte référentielle imposant que l'attribut ```sql "Pays"``` de $R_2$ ne contienne que des valeurs apparaissant dans le l'attribut ```sql "Pays"``` de $R_1$. On dit alors que l'attribut ```sql "Pays"``` de $R_2$
  est une _clef étrangère_.
]
*/

== Algèbre relationnelle

#item("Définition")[Une algèbre relationnelle][est un ensemble d'opérations prenant en entrée une ou deux relations pour construire une nouvelle relation.]

#item("Remarque")[Plusieurs algèbres relationnelles][équivalentes existent (SPC, SPJR, etc) @ABI]

#item("Exemple")[][Il est possible de construire une relation "Pays ayant plus de $n$ habitants" à partir de la relation "Démographie" au moyen d'opérations de l'algèbre relationnelle.]

#item("Application")[Les systèmes de gestion de base de données (SGDB)][interprètent des requêtes en langage SQL vers une représentation proche de l'algèbre relationnelle. Il est alors plus simple d'optimiser les requêtes sous cette forme.]

#item("Théorème")[Codd (admis)][L'algèbre relationnelle est équivalente au calcul relationnel. Toute requête du calcul relationnel peut donc se traduire en algèbre relationnelle et vice-versa.]

=== Opérations ensemblistes
#item("Définition")[L'union][est une fonction prenant deux relations de même schéma et renvoyant une relation de même schéma contenant l'union des $n$-uplets des deux relations.]
#item("Notation")[L'union][entre deux relations $A$ et $B$ se note $A union B = {t bar t in A or t in B}$.]

#item("Définition")[L'intersection][est une fonction prenant deux relations de même schéma et renvoyant une relation contenant les $n$-uplets communs à ces deux relations.]
#item("Notation")[L'intersection][entre deux relations $A$ et $B$ se note $A inter B = {t bar t in A and t in B}$.]

#item("Définition")[Le produit cartésien][est une fonction prenant deux relations et renvoyant une relation ayant pour schéma la concaténation de ceux des deux relations, et pour $n$-uplets le produit cartésien des $n$-uplets de ces relations.]
#item("Notation")[Le produit cartésien][entre deux relations $A$ et $B$ se note $A times B = {(r, s) bar r in A and s in B}$.]

#item("Définition")[La différence][est une fonction prenant deux relations *de même schéma* et renvoyant une relation ayant ledit schéma en gardant uniquement les $n$-uplets apparaissant dans la première relation mais pas la seconde.]
#item("Notation")[La différence][entre deux relations $A$ et $B$ se note $A minus B = {t bar t in A and t in.not B}$.]

=== Opérations spécifiques
#item("Définition")[La projection,][notée $pi_(a_1, ..., a_n)$, est une opération unaire sur les relations. Elle permet d'extraire un sous-ensemble d'attributs, renvoyant donc une relation de schéma $(a_1, ..., a_n)$.]

#item("Définition")[Le renommage][renomme un attribut d'une table. Il peut être utile par exemple pour appliquer une opération d'union.]

#item("Définition")[La sélection,][notée $sigma_P A = {r in A bar P(r)}$ est une fonction unaire sur les relations renvoyant une relation ne contenant que les $n$-uplets satisfaisant un prédicat $P$.]

#item("Déifiniton")[La jointure,][notée $join_P$ regroupe deux relations en ne gardant que les $n$-uplets satisfaisant le prédicat binaire $P$.]

#item("Remarque")[La jointure naturelle][est une jointure fréquente dont le prédicat est l'égalité sur les attributs ayant le même nom.]

#item("Définition")[La division,][notée $A div B$, prends en entrée deux relations de schémas $A(x_1, ..., x_n, y_1, ..., y_n)$ et $B(y_1, ..., y_n)$, puis retourne la relation $A div B = {t bar forall s in B, (t, s) in A}$, où $(t, s)$ est la décomposition d'un $n$-uplet de $A$ avec $t$ de schéma $(x_1, ..., x_n)$ et $s$ de schéma $(y_1, ..., y_n)$.]
#pagebreak()
#item("Pratique")[Opérateurs SQL][
  #set text(size: 9pt)
  #align(center, table(
    columns: 2,
    table.header([*Algèbre relationnelle*], [*SQL*]),
    [Projection], [`SELECT`],
    [Renommage], [`AS`],
    [Sélection], [`WHERE`],
    [Jointure], [`JOIN` / `NATURAL JOIN`],
  ))
]

#dev[
  #item("Extension")[Opérateurs d'agrégats][@SIL Les opération SQL comme `GROUP BY` ou `AVG` ne s'expriment pas naturellement en algèbre relationnel. On peu cependant ajouter une opération d'agrégat $cal(G)_f$ qui applique une fonction d'agrégat $f$ à une relation.]
]

== Conception d'une base de données
#item("Motivation")[][La conception d'une base de donné demande de représenter des interactions parfois nombreuses et complexes. Afin de simplifier cette tâche, plusieurs méthodes existent pour représenter et formaliser ces interactions.]
=== Méthodes graphiques @GARD
#item("Intuition")[Le modèle entité-association][est un modèle graphique permettant d'organiser visuellement les données et leur liens.]
#item("Définition")[Une entité][est une modélisation d'un objet à l'aide d'un *type* défini par un nom ainsi qu'une liste *d'attributs*.]
#item("Définition")[Une association][est un lien logique entre les entités modélisé par un *verbe* et une éventuelle liste *d'attributs*.]
#item("Définition")[La cardinalité][d'une association indique le nombre d'associations possibles d'une entité vers une autre pour une association donnée. Par convention, on note $*$ pour une cardinalité de zéro ou plus, et $n$ pour une cardinalité d'exactement $n$. La cardinalité doit être précisée dans les deux sens.]

#item("Exemple")[][#align(center, image("./methode_graphique.png", height: 11%))]

#item("Méthode")[Pour transformer un modèle graphique en schéma relationnel][on représente les entités et associations par des tables :
- chaque entité est représentée par une table de même nom ayant pour attributs la liste des attributs de l'entité.
- chaque association est représentée par une table de même nom ayant pour attributs la liste des clés primaires des entités associées et les attributs propres à l'association.]

#item("Remarque")[][Une association ayant pour cardinalité $1-1$ peut être regroupée en une seule table, où l'association est attachée par jointure à la clé primaire de chaque entité.]

// #item("Application")[La méthode Merise][utilise un modèle entité-relation pour la gestion d'un projet informatique.]

#item("Application")[La méthode ECS (Entités-Composants-Systèmes)][adapte une méthode entité-relation dans le contexte d'applications interactives comme les jeux vidéos ou les simulations physiques.]

=== Formes normales
#item("Motivation")[][
  Certains choix de schémas relationnels peuvent introduire de la _redondance_ entre les données. La redondance introduit un coût en mémoire et en performances, et peut affecter la _cohérence_ des données, par des _anomalies de mise à jour_.
]

#item("Définition")[Il y a une dépendance fonctionnelle][
   entre un
  ensemble d'attributs $X$ et un ensemble d'attributs $Y$, notée $X -> Y$ si à chaque valeur de $X$ il n'existe qu'une valeur de $Y$.
]

#dev[
  #item("Remarque", show-title:false)[Formes normales][
    Boyce et Codd ont proposé des transformations vers des *formes normales*, assurant de bonnes propriétés comme par exemple la réduction de la redondance d'informations.
    Nous présenterons les 3 premières formes normales, ainsi que la forme normale de Boyce-Codd.
  ]
]

#recap()

#item("Programme")[][
  - TERM 3 : Modèle relationnels, contraintes, structure vs contenu, services SGBD, SQL
  - PREP 21 : clefs primaires et étrangères, aggrégation
  - COMP 2  : algèbre relationnelle et optimisation de requêtes
  - COMP 12 C : calcul relationnel et théorème de Codd (/!\\ programme complémentaire 3B)
]


#bibliography(read("../bib.yaml", encoding: none))

#authors[Aloïs Rautureau & Santiago Sara Bautista]