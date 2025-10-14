#import "../../deps.typ" : *
#show : tableau

#show: codly-init.with()
#codly(
  languages: (sql: (name: "SQL", color: orange, icon: none)),
  inset: 0.2em,
  display-icon: false,
  display-name: false,
)

= Tests de programme et inspection de code

== Principes généraux des tests

=== Écrire du bon code

#item("Définition")[@BAR[2.1.1] La spécification ][(ou contrat) d'un programme consiste à définir 4 caractéristiques :
- Les *entrées* qui définissent une instance du problème
- Une *précondition* que les entrées doivent vérifier
- Les *sorties* qui décrivent une solution à l'instance du problème
- Une *postcondition* qui doit être vérifié après l'exécution du programme sur des entrées qui vérifient la précondition. Elle vérifie la validité des sorties.]

// l'exemple est tiré de mon cul mais j'avais la flemme de faire un autre compteur
#item("Exemple")[@NAN][On peut définir une classe `CompteARebour` qui contient deux méthodes : 
- une méthode `substract` qui soustrait une valeur au compteur actuel, on vérifie que la valeur donnée est positive.
- une méthode `lessThanZero` qui renvoie `True` si le compteur actuel est négatif et `False` sinon.

Le code Python suivant vérifie cette spécification et sera testé au cours de la leçon.
#set text(size:13pt)
```python
class CompteARebour :
  def __init__(self,init_val) :
    self.counter = init_val

  def substract(self,val) :
    assert val >= 0
    self.counter -= val

  def lessThanZero(self) :
    return self.counter <= 0
```
]

#item("Définition")[Programmation défensive @TOR[5.3]][Afin de rendre son code plus robuste, on peut s'assurer du bon déroulement de l’exécution en vérifiant notamment :
- le respect des préconditions sur les entrées
- la validité des pointeurs allouée en C
- l'état des fichiers ouverts par le programme]

#item("Exemple")[][La ligne 6 de la définition de la classe `CompteARebour` est un exemple de programmation défensive.]

=== Premières notions de tests

#item("Définition")[@BAR[2.2.2]][Afin de vérifier le bon fonctionnement d'un programme, on dispose de plusieurs méthodes qui se répartissent en deux principales catégories :
- la _vérification dynamique_ qui se propose d’exécuter le code pour s’assurer d’un fonctionnement correct
- la _vérification statique_ qui consiste en une revue du code (automatique ou manuelle), des lectures croisées et une analyse a posteriori d’anomalies.]

#item("Définition")[@BAR[2.2.2] Un test][d’un programme est un processus (manuel ou automatique) qui a pour objectif de détecter des différences entre les résultats fournis par le programme et ceux attendus par sa spécification et/ou d’établir la présence de certaines erreurs particulières.]

#item("Remarque")[@BAR[2.2.2]][Un test ne peut pas garantir l’absence de faute, ni les corriger, ils ne servent qu’à les trouver.]

#item("Remarque")[@KOR[3.1.1]][Un test classique se présente sous la forme Arrange, Act, Assert (AAA) :
- Arrange, on amène l’environnement à l'état voulu (initialisation des variables, ...).
- Act, on exécute le code à tester et on stocke les valeurs sortie s'il y en a.
- Assert, on vérifie que la propriété testé est vérifiée (sur les valeurs de sortie ou la postcondition par exemple)]

#item("Exemple")[@NAN][Le test de l'initialisation de notre classe `CompteARebour` :
#set text(size:13pt)
```python
def test_CAR_init():
  val = random.random() # Arrange
  compteur = CompteARebour(val) # Act
  assert compteur.counter == val # Assert
```
]

#item("Remarque")[@TOR[5.3]][En Python et en OCaml, on peut utiliser le mot clé `assert`, en
C, on peut utiliser la fonction `assert()` en important `assert.h`.]

== Différents types de tests

=== Tests fonctionnel/non fonctionnel

#item("Définition", show-title:false)[Test fonctionnel][Un test est dit *fonctionnel* s’il a pour objectif de vérifier que le code source correspond à la spécification donnée.]

#item("Définition")[@BAR[2.2.2] Un test non fonctionnel][vérifie d'autres propriétés que la correction du code comme :
- les performances (temps d'exécution, utilisation mémoire, ...)
- la sécurité du programme
- l'utilisabilité du programme]

#dev[
//#item("Exemple")[Memcheck @TOR[5.4]][Pour tester la consommation mémoire d'un programme C, ainsi que détecter les fuites de mémoires, on peut utiliser l'outils `memcheck` de `valgrind`.]
#item("Exemple")[Asan][
  Pour détecter les problèmes de mémoires, on modifie les fonctions d’allocation et d’accès aux cases mémoires.
]
]

#item("Exemple")[Mesurer le temps d'exécution @TOR[5.4]][Pour mesurer le temps d'exécution d'un programme on peut utiliser la la commande `time` du shell Linux. Pour effectuer des mesures plus précises sur des portions du code, on peut utiliser la fonction `clock` de la bibliothèque `time` pour du code C et la fonction `time` du module `Sys` en Ocaml.]

=== Tests unitaires/d'intégration

#item("Définition")[Test unitaire @BAR[2.2.2]][Un test unitaire teste des procédures ou des fonctions du code de manière isolé pour contrôler si elles correspondent à la spécification.]

#item("Exemple")[@NAN][On teste ici la méthode `lessThanZero` de notre classe `CompteARebour`:
#set text(size:13pt)
```python
def test_CAR_LTZ_unit(val):
  compteur = CompteARebour(0)
  compteur.counter = val
  assert compteur.lessThanZero() == (val <= 0)
```
]

#item("Définition")[Test d'intégration @BAR[2.2.2]][Au contraire un test d'intégration se concentre sur le bon comportement lors de la composition des procédures. L’objectif est de vérifier la stabilité et la cohérence des interfaces et
interactions de l’application.]

=== Tests boite noire/ boite blanche

#item("Définition")[Test en boite noire @CHA[4]][Un test est en boite noire si on ne teste qu'en connaissance de la spécification du programme et pas de son implémentation.]

#item("Exemple")[@NAN][ Un test en boite noire de la méthode `lessThanZero` :
#set text(size:13pt)
```python
def test_CAR_LTZ_black_box(val):
  compteur = CompteARebour(val)
  assert compteur.lessThanZero() == (val <= 0)
```
]

#item("Définition")[Test en boite blanche @CHA[5]][Un test est en boite blanche si on considère l'implémentation du code testé.]

#item("Exemple")[@NAN][Pour tester la méthode `substract` de notre classe, on peut écrire un test unitaire en boite blanche :
#set text(size:13pt)
```python
def test_CAR_sub(val_ini,val_sub):
  compteur = CompteARebour(val_ini)
  compteur.substract(val_sub)
  assert compteur.counter == val_ini-val_sub
```
]

== Bien définir ses tests : notion de couverture

#item("Définition")[Métrique de couverture@KOR[1.3]][
  Une métrique de couverture indique quelle proportion de code source une suite de test exécute, allant de 0 à 100%.
]

#item("Remarque")[@KOR[1.3]][
  Un faible couverture indique une mauvaise suite de test, mais une bonne couverture n’implique pas nécessairement une bonne suite de test.
]

#item("Remarque")[@NAN][
  Pour mesurer la couverture, on peut utiliser des programmes comme `gcov` ou `pytest-cov`
]

=== Couverture de ligne

#item("Définition")[Couverture de ligne@KOR[1.3.1]][
  La couverture de code indique le ratio entre le nombre de lignes de code exécutés par au moins un test et le nombre de lignes de code total.
  #set text(size:10pt)
  $ 
  "Couverture de ligne" = "Lignes de code executées" / "Lignes de code total"
  $
]

#item("Exemple")[@KOR[Listing 1.1]][// Exemple Pythonisé par rapport au KOR
Pour la fonction est_text_long~:
#set text(size:13pt)
  ```python
  def est_text_long(s: str) -> bool:
    if (len(s) > 5):
      return True
    else:
      return False
  ```
  On a ici 5 lignes de code. Le test `assert(est_text_long("abc"))` passe par 4 lignes de code, soit une couverture de code de $80%$
]

#item("Remarque")[@KOR[1.3.1]][
  On peut changer le taux de couverture de code, simplement en réécrivant la fonction~:
  #set text(size:13pt)
  ```python
  def est_text_long(s: str) -> bool:
    return (True if len(s) > 5  else False)
  ```
  On aura alors une couverture de 100%, avec le même test que précédemment.
]

=== Couverture de branches

#item("Définition")[Graphe de flot de contrôle @BAR[2.2.3]][
  d’un programme est un graphe orienté dont les sommets sont les états du programme et les arêtes sont les transitions possibles d’un état à l’autre, correspondant à des branchements (`if`, `while`, ...).
]

#grid(
  columns: (50%, 50%), column-gutter: 1em,
  row-gutter: 0em,
  [
#item("Exemple")[@KOR[1.3.2]][
  Si on reprend l’exemple de la fonction `est_text_long`, on a un branchement lors du `if`, et donc deux branches p             ossibles~:
]
],
[
  #set align(center)
  #image("couverture_branche.png", width: 80%)
  @KOR[Figure 1.5]
])

#item("Definition")[@KOR[1.3.2]][Plutôt qu’utiliser les lignes de codes comme métrique, on va se servir de la couverture de branche : 
#set text(size:10pt)
$
  "Couverture de branche" = "Branches traversées" / "Nombre total de branches"
$
]

#dev[
#item("Méthode")[Mutation d'entrée][
  (ou _fuzzing_) est une méthode reposant sur une génération dynamique de cas de tests, cherchant par exemple à augmenter les branches du programme couvertes.
]
  
#item("Méthode")[Mutation de code][
  (ou _mutation testing_) est une méthode cherchant à vérifier la qualité d'une suite de test en modifiant légèrement le code du programme pour s'assurer que les tests ne passent plus.
]
]

== Inspection de code @CHA[6]

#item("Remarque")[][
  - Les tests reposent sur des _spécifications_, qui ne sont pas toujours suffisamment précises
  - Même avec une couverture parfaite, les tests ne peuvent pas assurer une absence de bugs.
  - Les tests ne mesurent pas certaines propriétés du code, telle que sa lisibilité et sa réutilisabilité.
]

#item("Définition")[Inspection de code@CHA[6.1]][
  L’inspection de code est un processus d’équipe, dans lequel chacun relis le code, les tests et la documentation, avant de mettre en commun les potentiels défauts lors d’une réunion. Ce processus doit suivre une structure bien défini, pour trouver le plus de problèmes possibles.
]


#item("Exemple")[Check-list pour les tests unitaires][
  - Toutes les erreurs lèvent des exceptions
  - Les tests couvrent bien les cas limites
  - Les tests couvrent bien les spécifications attendues
]

#item("Exemple")[Bonnes pratiques de programmation @TOR[5]][
  Le relecteur peut vérifier que le code suit des bonnes pratiques de programmation~:
  - L’indentation du code est claire et cohérente avec le reste.
  - Les variables ont des noms qui indiquent clairement leurs utilités.
  - Le code est commenté pour en expliquer son fonctionnement.
  - Toutes les exceptions sont gérées.
]

#item("Remarque")[@NAN][
  Des outils automatiques comme `clang-tidy` ou `pylint` permettent de forcer certaines pratiques de programmation, pour garantir une cohérence entre le code de différents développeurs.
]

#recap()
#bibliography(read("../bib.yaml", encoding: none))

#authors[Axel Stengel & Benjamin Voisin]