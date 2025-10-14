#import "../../deps.typ" : *
#show: tableau

// Rajouter val aux mots-clefs du language OCaml
#show raw.where(lang: "ocaml"): it => [
    #show regex("\b(val)\b") : keyword => text(red, keyword)
    #it
]

= Paradigmes de Programmation : impératif, fonctionnel, objet. Exemples et applications

== Concept de paradigme

#item("Définition")[@NAN Un paradigme de programmation][
   correspond à un ensemble de concepts, pratiques et outils pour représenter et résoudre un problème sous forme de programme informatique.
]

#item("Remarque")[@NAN Les langages de programmation][
  peuvent *favoriser* par leur syntaxe, sémantique ou librairies
  un ou plusieurs paradigmes de programmation.
  Tout paradigme peut cependant être utilisé dans tout langage
  généraliste.
]

#set table.cell(align: center + horizon)
#align(center, table(
  columns: 4,
  [],             [C],      [OCaml], [Python],
  [Impératif],   [✅],   
  [✅], [✅],
  [Fonctionnel], [🚧], [✅], 
  [⚠️],
  [Objet], [🚧], [✅], [✅]
))
- ✅ : Supporté par le langage
- ⚠️ : Supporté par le langage, attention à la portée des variables
- 🚧 : Encodable, mais pas directement supporté par le langage

#item("Remarque", show-title:false)[@NAN SQL au programme, mais pas dans cette leçon][
  Cette liste de paradigmes n'est pas exhaustive, il s'agît simplement des plus prédominants. On peut notamment citer le paradigme logique, qui consiste à indiquer ce que l'on souhaite calculer plutôt que la manière dont ce calcul s'opère. Ce paradigme est utilisé en SQL pour exprimer des requêtes.
]

/* /* Est-ce qu'on s'en sert dans la suite de la leçon ? */
#item("Remarque", show-title:false)[Structures de données][
  Un paradigme influe sur le choix des structures de données utilisées, et sur la façon dont un algorithme donné va être implémenté.
]
*/

/*
#item("Remarque", show-title:false)[Typage][
  Bien qu'orthogonales au paradigme, les notions de typage (typage statique ou typage dynamique, polymorphisme) influent également sur la façon de programmer.
]

#item("Définition", show-title:false)[Typage statique vs dynamique][
  On parle de *typage statique* quand les vérifications de type
  sont effectuées à la compilation, et de *typage dynamique* sinon.
]


#item("Définition")[Le polymorphisme][
  est le fait, pour une fonction de pouvoir s'appliquer
  sur des données de types différents ou pour un type d'être paramétré par
  une variable de type sur l'un de ses sous-types.
]

#item("Exemple", show-title:false)[Type polymorphe][
  Les types `list` en OCaml ou Python sont *polymorphes*. On peut construire à partir d'un type polymorphe un type concret, par exemple `int list` pour une liste d'entiers en OCaml.
]

#item("Exemple", show-title:false)[Fonction polymorphe][
  On peut écrire une fonction `head` qui retourne le premier élément d'une
  liste, quel que soit le type concret de celle-ci. Une telle fonction est *polymorphe*.
]
*/

== Programmation impérative

#item("Définition")[@MITCH[4.4, p. 77] Le paradigme impératif][
  voit un programme comme des _instructions_
  modifiant un _état_.
  Dans le paradigme impératif, il y a donc une distinction forte 
  entre _expressions_ s'évaluant vers des valeurs
  (qui peuvent être affectées à des variables),
  et _instructions_.
  L'instruction de base est _l'affectation_,
  qui modifie la valeur d'une variable.
]

#item("Exemple", show-title:false)[@NAN L'assembleur est impératif][
  Les processeurs exécutent des programmes composés d’une
suite d’instructions binaires, faisant changer registres et mémoire.
Le langage d’assemblage, permettant de représenter les instructions machine,
peut être qualifié de _langage impératif_.
]

#item("Remarque", show-title:false)[@NAN Généalogie conceptuelle de l'impératif][
  Conceptuellement, on peut rapprocher la programmation impérative du modèle de calcul des *machines de Turing*, ou du modèle de *machine de Von-Neumann*.
]

#item("Définition", show-title:false)[Structures de contrôle][ 
  @MITCH[8.1.2, p. 206]
  Les instructions peuvent être combinées en les séquençant
  (en les exécutant les unes après les autres) ou avec des
  *structures de contrôle* telles que les conditions
  (`if then else`) et les boucles (`for`, `while`).
]

#item("Remarque", show-title:false)[@NAN Le OCaml n'est pas impératif][
  En OCaml, la notion d'_instruction_ n'existe pas vraiment:
  tout est expression ou déclaration. Le OCaml n'est donc pas un language fondamentalement impératif.
  Cependant, il existe en OCaml des structures mutables
  (e.g. références, tableaux) et leur valeur peut être changée
  par des expressions de type ```ocaml unit```,
  qui se comportent donc comme des instructions.
  Il est tout à fait possible de faire de la programmation impérative en OCaml.
]



#item("Exemple")[Séquence de deux affectations en C, OCaml et Python][
  #align(center, table(
    columns: 3,
    [
      ```c
      int x;
      x = 2;
      x = 2 * x;
      ```
    ], 
    [
      ```ocaml
      let x: int ref = ref 0 in
      x := 2;
      x := 2 * !x
      ```
    ], 
    [
      ```python

      x = 2
      x = 2 * x
      ```
    ],
    [En C], [En OCaml], [En Python]
  ))
]

/*

/*
  Ancienne version.
  Je vais essayer de reformuler en parlant moins de flot de contrôle et plus de la subtilité de impératif en OCaml.
*/

=== Flot de contrôle et structure 

#item("Définition", show-title:false)[Flot de contrôle][
  On parle de *flot de contrôle* pour décrire les différents ordres
  dans lesquels peuvent être exécutées les instructions d'un programme.
]

#item("Exemple", show-title:false)[Langages non-structurés][
  En langage assembleur, des instructions de _saut_ peuvent permettre
  de changer de façon arbitraire quelle sera la prochaine instruction exécutée. Le flot de contrôle ne suit pas de structure particulière. 
]

#item("Définition", show-title:false)[Langages structurés, structures de contrôle][
  Dans des langages comme le C, le OCaml et le Python,
  des *structures de contrôle* telles que les conditions
  (`if then else`) et les boucles (`for`, `while`)
  permettent de structurer le flot de contrôle.
  On parle alors de *langage structuré*, et on peut en général représenter
  le flot de contrôle sous forme de graphe, où les nœuds correspondent à des _séquences_ d'instructions, et les arêtes à des branchements ou des boucles.
]

#item("Exemples")[][
  Le C, le OCaml et le Python supportent tous les trois le paradigme impératif.
  En OCaml, par exemple, il est possible de définir au niveau le plus haut de l'environnement des données mutables (références ou tableaux) qui pourront ensuite être mutées par un enchaînement en séquence d'expressions
  de type ```ocaml unit```.
]

#item("Définition")[Une procédure][
  est un sous-ensemble des instructions et structures de contrôle du programme,
  sciemment isolés par le programmeur car aillant un sens en soi;
  pouvant être réutilisé dans différents contextes.

  Une procédure peut avoir des *paramètres* et donc être *appelée* avec des *arguments* précisant la valeur de ces paramètres.
]

#item("Définition", show-title:false)[Effets de bord][
  On dit qu'une instruction (et _a fortiori_ une procédure) a des *effets de bord* si elle modifie l'état global du programme ou de la machine.
]
*/

== Programmation fonctionnelle

=== Définition et contexte historique @MITCH[4.4.2]

#item("Définition")[Le paradigme fonctionnel][
  voit un programme comme une _expression_,
  faisant intervenir une composition de _fonctions_.
]

#item("Remarque", show-title:false)[@NAN Généalogie conceptuelle du fonctionnel][
  Conceptuellement, on peut rapprocher le paradigme fonctionnel du modèle de calcul introduit par Alonzo Church dans les années 1930, appelé *lambda-calcul*.
]

#item("Contexte historique")[@MITCH[3] Lisp,][
  un des premiers langages fonctionnels,
  a été inventé au MIT dans les années 1950,
  pour des recherches sur l'intelligence artificielle
  et l'exécution symbolique.
]

=== Fonctionnel pur

#item("Définition", show-title:false)[Effets de bord][
  On dit qu'une expression a des *effets de bord*
  si elle modifie l'état global du programme
  (e.g. changer la valeur d'une variable) 
  ou de la machine
  (e.g. écriture dans un fichier).
]

#item("Définition")[@MITCH[4.4.2] Une fonction pure][
  est une fonction n'ayant pas d'effets de bord.
  Un langage fonctionnel est dit *pur* s'il ne permet de définir
  que des fonctions pures.
]

#item("Remarque")[@NAN OCaml n'est pas un language fonctionnel pur.][]

#item("Définition")[@MITCH[4.4.2, p. 78] La transparence référentielle][
  est le fait, pour une expression, de pouvoir être remplacée par la valeur vers laquelle elle s'évalue, sans changer le comportement du programme. Une fonction référentiellement transparente doit s'évaluer à la même valeur sur une même entrée, comme une fonction mathématique.

  En particulier, si une fonction n'a
  pas d'effet de bord, alors elle sera référentiellement transparente.
]



#item("Remarque")[][
  Cette propriété est utile lorsque l'on *raisonne*
  sur un programme, en particulier pour en *prouver la correction*.
  Si un programme est une composition fonctions pures,
  on pourra raisonner sur chaque fonction indépendamment. On parle de *compositionnalité*.
]

/*
Peut-être important comme remarque, à voir si on a la place
#item("Remarque", show-title: false)[Effet de bord $=>.not$ $not$ transparence réferentielle][Une fonction causant un effet de bord peut malgré tout être référentiellement transparente. Dans le cas d'une structure unir-trouver avec compression de chemin par exemple, on modifie la structure interne en interagissant avec celle-ci, sans pour autant perdre la propriété de transparence référentielle.]
*/

#dev[
  #item("Remarque", show-title: false)[Représentation des effets de bord en fonctionnel][Pour interagir avec l'utilisateur, un programme doit nécessairement causer des effets de bord.]
  #item("Définition")[La programmation monadique][
    peut permettre, dans les langages fonctionnels purs,
    d'encapsuler les effets de bords et garder la transparence référentielle.
  ]
]

=== Fonctions comme valeurs de première classe

#item("Définition", show-title:false)[Fonctions de première classe][
  @MITCH[7.4.1]
  Dans un langage, on dit que les *fonctions* sont des *valeurs de première classe* quand les fonctions:
  - peuvent être définies dans n'importe quel contexte
  - peuvent être passées en argument à d'autres fonctions
  - peuvent être le résultat d'un appel de fonction

  On parle de *fonction d'ordre supérieur* pour les fonctions prenant des fonctions en argument, et/ou renvoyant une fonction.
]


#item("Exemple", show-title: true)[La fonction `map`][ 
  prend une fonction et une liste en arguments, et renvoie une liste.
  Les éléments de la liste en sortie correspondent à l'application de la fonction donnée aux éléments de la liste. Sa signature est
  
  #align(center)[
    ```ocaml
    val map : ('a -> 'b) -> ('a list) -> 'b list
    ```
  ]
]

#item("Remarque")[@MITCH[4.2.3, p. 63]Curryfication.][
  Chaque fonction a $n$ arguments peut être vue comme ne prenant qu'un seul argument en entrée et renvoyant ou bien :
- une valeur si $n = 1$
- une fonction prenant $n - 1$ arguments en entrée sinon]

#item("Exemple", show-title: false)[Curryfication][
  Appliquer la fonction `string_of_int` à la fonction `map` renvoie une nouvelle fonction. Appliquer cette nouvelle fonction à un argument
  donne le même résultat que appliquer `map` à `string_of_int` et à l'argument en question :
  ```ml
  let map_to_string = map string_of_int
  assert (map_to_string [0, 1, 2] = map string_of_int [0, 1, 2])
  ```
]

=== Récursivité terminale et optimisation @MITCH[7.3.4]

/*
#item("Remarque")[][
  Bien que la récursivité puisse être présente dans tous les paradigmes, elle est essentielle en programmation fonctionnnelle: sans elle, les languages fonctionnels purs ne pourraient pas être Turing-Complets.
]
*/

#item("Définition", show-title:false)[Appel en position terminal][
  Si une fonction `f` appelle une fonction `g`, l'appel à `g` dans `f`
  est dit en *position terminale* si `f` renvoie la valeur de retour
  de `g` sans calculs supplémentaires.
]

#item("Définition")[Une fonction est récursive terminale][
  si chaque appel récursif qu'elle 
  fait est en position terminale.
]

#item("Exemple")[Factorielle récursive terminale][
  ```ml
  let fact (n: int) =
    let rec fact (n: int) (resultat: int) =
      if n <= 1 then resultat else fact (n - 1) (resultat * n)
    in fact n 1
  ```
]

#item("Remarque")[][Une fonction récursive terminale peut être contenue dans un seul cadre de pile. La pile n'a alors pas besoin de grandir à chaque appel récursif, permettant d'éviter un débordement. Une telle fonction encode en réalité une *boucle*.
#align(center, image("./rec_term.png", width: 50%))
]

#dev[
  #item("Remarque", show-title:false)[Continuations][
    @MITCH[8.3]
    La *programmation par passage de continuation* peut être utilisée par les compilateurs de langages fonctionnels pour transformer toute fonction récursive en récursive terminale.
  ]
]





== Programmation objet @MITCH[10]

#item("Motivation", show-title:false)[Motivation objet: dev collab][
  Faciliter la _collaboration_ entre développeur⋅euses travaillant 
  en parallèle, et rendre le code plus _réutilisable_.
]

#item("Définition")[Le paradigme objet][
  voit un programme comme un ensemble de composants, entités ou concepts, 
  appelés *objets*, interagissant entre eux.
  // Un objet dispose de données qu'on appelle *attributs* et peut intéragir avec les autres objets à l'aide de *méthodes*.
]

#item("Définition")[Les attributs][
  sont les données associées à un objet.
]

#item("Définition")[Les méthodes][
  décrivent les façons dont on peut interagir avec un objet.
]

#item("Définition")[L'encapsulation][
  est le principe selon lequel les définitions des attributs et méthodes d'un même objet devraient être au même endroit.
]

#item("Remarque", show-title:false)[Classe][
  Vu que beaucoup d'objets sont caractérisés par les mêmes attributs et 
  méthodes, on ne définit pas directement des objets, mais on définit des
  *classes* (qui définissent des attributs et des méthodes).
  En _instantiant_ les classes, on obtient des objets qui ont leur propre copie des attributs en question.
]

#item("Définition")[@MITCH[p.278] Les quatre principes de la programmation orientée objet][
  sont
  - La *résolution dynamique* : le code exécuté par un appel de méthode dépend de l'objet sur lequel la méthode est appelée.
  - L'*abstraction* : chaque objet (ou classe) expose une certaine *interface* spécifiant comment interagir avec lui. Les détails d'implémentation et certains attributs sont privés.
  - Le *sous-typage* : si un objet `a` implémente toute l'interface d'un objet `b`, on doit pouvoir utiliser `a` là où `b` est attendu.
  - L'*héritage* : une classe peut réutiliser la définition d'une autre classe, en l'étendant ou la modifiant si besoin.
]



/*
#item("Exemple")[][
  ```py
  class Point:
    def __init__(self):
      # Attributs
      self.x = 0
      self.y = 0

    def norme(self):
      # Méthode
      return sqrt(self.x * self.x + self.y * self.y)

  # Un objet, instance de la classe Point
  p = Point()
  ```
]
*/

/*
#item("Définition")[La visibilité][d'une méthode ou d'un attribut indique qui peut directement accéder à celui-ci en dehors de la classe elle-même. Une méthode/attribut :
- privée n'est accessible qu'à la classe elle-même
- publique est accessible à tout autre objet]


#item("Définition")[L'héritage][permet à une classe d'hériter des attributs et méthodes d'une autre puis de les étendre ou modifier. Cela permet de définir une interface commune à plusieurs classes.]
*/

#item("Exemple", show-title: false)[@NAN Orienté objet][
  Code modélisant un restaurant:
  ```py
  class Plat: # Une classe modélisant les plats au menu
    def __init__(self):
      self.nb_commandes = 0 
      # Un attribut : combien de foix le plat  a été commandé

    def prix(self) -> int : return 10 # Le prix par défaut d'un plat
      
    def commander(self) -> int : # Une méthode
      self.nb_commandes += 1
      return self.prix()

  class Spaghetti(Plat): # Spaghetti hérite de Plat
    def prix(self): return 9 # Les spaghettis sont moins chers

    # Pas besoin de redéfinir la méthode commander

  salade_cesar = Plat() # salade_cesar est une instance de Plat
  spaghettis_bolognaise = Spaghetti()

  class Client:
    def payer(p: Plat) -> None :
      self.porte_monaie -= p.commander() # Le prix dépend du plat
  ```
]

#dev[
  #item("Remarque", show-title: false)[Héritage multiple][
    Un langage de programmation avec héritage multiple doit choisir comment résoudre les appels de méthode,
    en particulier en cas d'"héritage en diamant".
  ]
]
/*
Je met en commentaire juste pour voir comment on peut réduire.
#set table.cell(align: center + horizon)
#table(
  columns: 4,
  [],             [C],      [OCaml], [Python],
  [Impératif],   [Natif],   
  [Natif 
  
  (environnement global, références, ...)], [Natif],
  [Fonctionnel], [Clôtures encodables dans une structure], [Natif], 
  [Natif 
  
  (mais portée des variables inusuelle)],
  [Objet], [Encodable avec des tables virtuelles], [Natif (hors programme)], [Natif (mais typage dynamique n'est pas usuel parmis langages orientés objet)]
)
*/

#recap()

====== Notes sur les Devs
- Programmation par continuation $->$ Bien mais attention à erreurs des devs précédents. Regarder cours de Benoît en ligne: https://people.rennes.inria.fr/Benoit.Montagu/courses/agreg_prog_lang/cours5_handout.pdf).
  Historiquement, c'est une repr intermédiaire pour les compilos, c'est important pour bien justifier et pas juste "faire du code rigolo".
- Autre dev possible (2024) Un même algo dans les 3 paradigmes 
- Dev desing pattern (e.g. visiteur) $->$ très bien si à l'aise dessus

- Inférence de types/unification $->$ hors sujet


======= Notes générales
- Les notions de récursivité ne sont pas spécifiques au fonctionnel. Attention à la déf: notion plus sémantique que syntaxique
- La terminologie en prog objet est variable. Par exemple, un attribut de classe en Python dénote un attribut statique de la classe. Ça peut être à relever dans la présentation du plan.
- En objet, on donne les exemples en Python, mais on parle de l'objet en général. L'objet Python est particulier, le jury sait que ce n'est pas le paroxysme de l'orienté objet... mais au programme
- En général, *prendre les defs dans un livre* et éviter d'inventer les siennes sur le tas.
- Note sur le polymorphisme : il y en a souvent dans les plans des années précédentes. Pas vraiment relié à un paradigme en particulier, et sens différent par paradigme (polymorphisme objet $!=$ polymorphisme fonctionnel par exemple, Python peut être vu comme "naturellement polymorphe" puisque typage dynamique, bref c'est un peu bourbier)

#bibliography(read("../bib.yaml", encoding: none))

#align(center + bottom)[Aloïs Rautureau & Santiago Sara Bautista]
