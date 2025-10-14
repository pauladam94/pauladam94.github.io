#import "../../deps.typ" : *
#show : tableau

= Exemples d'algorithmes d'apprentissage supervisé et non supervisé. Exemples et applications.

/*
/ Motivation : Les méthodes algorithmes d'apprentissages permettent des approches approximatives sur des problèmes trop complexes pour l'algorithmique classique.
*/


== Algorithmes d'apprentissage
=== Problèmes d'apprentissage @AZE[1.2]

#item("Définition")[L'apprentissage][
  consiste à l'écriture d'algorithme qui renvoie des méthodes de résolutions (grouper des images ensembles) contrairement à l'algorithmique classique qui répond à une requêtes données (trier une liste). On les utilise quand les _données_ sont abondantes mais les _connaissances_ sont limités.
]
#grid(column-gutter: 0.1em, columns: 2,
item("Définition")[Supervisé.][
  Un problème d'apprentissage est dit supervisé s'il étant donnée $n$ *observations* $x^1, ..., x^n in cal(X)$ et leurs *étiquettes* $y^1, ..., y^n in cal(Y)$, on cherche à trouver une fonction $f : cal(X) -> cal(Y)$ tel que $f(x^i) approx y^i$.
],
// align(center + horizon, image("apprentissage_supervisé.png", width: 150pt))
)

#item("Définition")[Classification binaire.][
  Un problème d’apprentissage supervisé dans lequel l’espace des étiquettes est
binaire, autrement dit $cal(Y) = {0, 1}$ est appelé un problème de *classification binaire*.
]

#item("Exemple")[][
  Savoir si un mail est un spam ou non, savoir si un tableau a été peint par Picasso sont des problèmes de classification binaire.
]

#item("Définition")[Classification Multi-classe.][
  Un problème d’apprentissage supervisé dans lequel l’espace des étiquettes est discret et ﬁni, autrement dit $cal(Y) = {1, 2, . . . , C}$ est appelé un problème de classification multi-classe. C est le nombre de classes.
]

#item("Exemple")[La reconnaissance de chiffres manuscrits][
  dans une image est un exemple de problème de classification multi-classe d'un ensemble d'images vers $cal(Y) = [0, 9]$.
]

#item("Exemple")[La base MNIST][est une banque de données d'images de chiffres manuscrits annotées par les classes attendues.]

#item("Définition")[Régression][
  Un problème d’apprentissage supervisé dans lequel l’espace des étiquettes est $cal(Y) = RR$ est appelé un problème de régression.
]

#item("Définition")[L'apprentissage non supervisé][
  est la branche du machine learning qui s’intéresse aux problèmes pouvant être formalisés de la façon suivante : étant données $n$ observations ${x^i}_(i=1,...,n)$ décrites dans un espace $cal(X)$, il s’agit d’apprendre une fonction sur $cal(X)$ qui vériﬁe certaines propriétés.
]

#item("Définition")[Le partitionnement][
  (ou clustering) est un problème d’apprentissage non supervisé pouvant être formalisé comme la recherche d’une partition $union.big^K_(k=1) C_k$ des $n$ observations ${x^i }_(i=1,...,n)$. Cette partition doit être pertinente au vu d’un ou plusieurs critères à préciser.
]

#item("Exemple")[][
  // Une image $x^i in cal(X)$ est représentée sous la forme d'un vecteur dans $R^n times R^m$.
  Une image $x^i in cal(X)$ est classiquement représentée comme un vecteur de $R^m$.
]



=== Fonctions de coûts @AZE[2.4] et Notions de distances @AZE[8.3]

#item("Définition")[Une fonction de coût][
   $L : cal(Y) times cal(Y) -> RR$, aussi appelée fonction de perte ou fonction d’erreur est une fonction utilisée pour quantifier la qualité d’une prédiction. $L(y, f (x))$ est d’autant plus grande que $f(x)$ est éloignée de la vraie valeur $y$.
]

#item("Exemple")[][
  En considérant les étiquettes comme des vecteurs on utilisera classiquement la distance euclidienne.
]

#item("Définition")[Minimisation fonction de coût.][
  Un algorithme d'apprentissage a pour objectif de minimiser $L(f(x^i), y^i), forall i$.
]

#item("Définition")[Sur-apprentissage et généralisation.][
  Simplement minimiser la fonction de coût sur les données connues mènent au phénomène de sur-apprentissage et limite la qualité de la fonction $f$ sur des données non présentes dans les données d'entraînement. On dit que la fonction $f$ n'a pas généraliser.
]

#item("Définition")[Une distance][
  est une fonction $d : cal(X) times cal(X) -> RR^+$, réflexive, nulle entre 2 points égaux et véirfiant l'inégalité triangulaire. Elle permet de comparer les observations sans connaitre leurs étiquettes. 
]


#dev[
  #item("Exemple")[][
    Une distance point à point entre deux signaux temporels ne reflètent pas bien l'espace des signaux.
  ]
  #item("Définition")[][
    Une méthode de programmation dynamique, dit "Time Warping", permet de définir une fonction de coût plus proche de la topologie réelle des signaux.
  ]
]



== Algorithme Supervisé @TOR[9.7.1]

=== Algorithmes des k plus proches voisins @AZE[8.2]

#item("Exemple")[L'algorithme des plus $k$ plus proches voisins][
  classifie les nouvelles observations par un mélange des classes de ses $k$ plus proches voisins.
]

#item("Définition")[Choix de classe][
  en fonctions des k plus proches voisins. On peut choisir la classe majoritaire dans le cas d'un problème de classification, ou la moyenne des classes pour un problème de régression.
]



/*
#item("Définition")[L'apprentissage Paresseux @AZE[8.2.2]][
  désigne un algorithme d'apprentissage consistant uniquement à stocker les données du jeu d'entraînement, sans effectuer aucun calcul préalable à la procédure de prédiction. Cela induit un coût en mémoire et en temps lors de la prédiction.
]
*/

#item("Complexité")[Algorithme naïf][
  $cal(O)(n)$ pour calculer les $n$ distances et $cal(O)(n . log(k))$ pour trouver les $k$ plus petites.
]

#item("Définition")[Un arbre $k$-dimensionnel][
  est un arbre binaire de recherche partitionnant successivement une dimension de l'espace par profondeur.
]

#item("Complexité")[L'utilisation d'un arbre $k$-dimensionnel][
  permet de réduire la complexité d'une prédiction des $k$ plus proches voisins à $O(k n^(1 - 1/k))$ en moyenne (admis).
]

#item("Définition")[Une matrice de confusion][
  est une matrice où $M_(i, j)$ est le nombre de données classées comme $j$ par l'algorithme et dont la classe réelle est $i$. On peut mesurer le taux d'erreur comme la proportion de données hors de la diagonale.
]

#item("Définition")[Hyperparamètre k @AZE[8.2.3]][
 - si $k = 1$, l'algorithme très sensible au bruit, risque de sur-apprentissage.
 - si $k = n$, on prédit toujours la classe majoritaire de notre jeu de données.
 On utilise en général une valeur intermédiaire. L'heuristique $k eq sqrt(n)$ est parfois utilisée.
]

#grid(columns: 2, column-gutter: 1em,
item("Exemple")[Classification 5 plus proches voisins @AZE[8.3].][
  #align(center, image("../15_Apprentissage/exemple_knn.png", height: 90pt))
],
item("Exemple")[Exemple de sur-apprentissage avec $k = 1$.][
  #align(center, image("exemple_surapprentissage.png", height: 90pt))
]
)


=== Apprentissage hiérarchique @AZE

#item("Définition")[Un modèle hiérarchique][se comporte comme une suite de tests conditionnels.]

#item("Définition")[Un arbre de décision][
  est un modèle hiérarchique pouvant être représenté sous forme d'un arbre. Chaque nœud corresponds à une décision (oui/non). Les feuilles correspondent à une étiquette.
]

#item("Exemple")[Le jeu du "Qui-est-ce?"][peut-être représenté par un arbre de décision. Chaque question posée permet de raffiner un sous-ensemble de données satisfaisant une suite de critères.]

#item("Définition")[L'entropie de Shannon][
  est une mesure de la quantité d'incertitude mesurée en bits sur un ensemble de données $S$. Elle est donnée par la formule $H(S) = sum_(x in S) -p(x) log_2 p(x)$. Plus l'entropie de $S$ est grande, plus les données présentes sont variées.
]

#dev[
#item("Algorithme")[ID3 @TOR[9.7.1]][
  est un algorithme permettant la construction d'un arbre de décision en choisissant successivement le critère le plus discriminant au sens de l'entropie (i.e. ayant la plus faible entropie) sur un ensemble de données.
]
]


== Algorithme Non Supervisé @TOR[9.7.2]

=== Clustering Ascendant Hiérarchique @AZE[12.3]
#item("Définition")[La distance entre cluster][
  peut être défini comme le minimum de distance entre tous les éléments de deux clusters.
]

#grid(column-gutter: 0.5em, columns: 2,
[
#item("Algorithme")[La méthode ascendante][
  consiste à chaque étape à fusionner les deux clusters à distance minimal. On démarre avec un cluster par observation.
]
#item("Définition", show-title: false)[Dendogramme.][
  Le résultat d’un clustering hiérarchique peut se visualiser sous la forme d’un *dendrogramme*. Il s’agit d’un arbre binaire dont les $n$ feuilles correspondent chacune à une observation. Chaque nœud correspond à un cluster.
]
]
,
align(center + horizon, 
  scale(y: 200%, 
    image("dendogramme.png", width: 110pt)))
)

#item("Remarque")[][
  Avantage de ne pas avoir à choisir le nombre de cluster du clustering car la dendogramme les stockent tous.
]

#item("Complexité")[][
 $cal(O)(n^3)$, $n$ étapes de calcul des $n^2$ pairs de distance. 
]


#[

#let nb-leaf(tree) = {
  if type(tree) == str {
    1
  } else if tree.len() == 1 {
    nb-leaf(tree.at(0))
  } else {
    nb-leaf(tree.at(0)) + nb-leaf(tree.at(1))
  }
}
#let depth(tree) = {
  if type(tree) == str {
    0
  } else if tree.len() == 1 {
    1 + depth(tree.at(0))
  } else {
    1 + calc.max(depth(tree.at(0)), depth(tree.at(1)))
  }
}
#let dendo-aux(x, y, tree, off, r) = {
import draw: *
if type(tree) == str {
  circle((x, y), radius: r, fill: black)
} else if tree.len() == 1 {
  let y1 = y - 1
  line((x, y), (x, y1))
  circle((x, y), radius: r / 2, fill: black)
  dendo-aux(x, y1, tree.at(0), off, r)
} else {
  circle((x, y), radius: r / 2, fill: black)

  let nl = nb-leaf(tree.at(0))
  
  let x1 = x - off * nl / 2
  let y1 = y - 1
  line((x, y), (x1, y))
  line((x1, y), (x1, y1))
  dendo-aux(x1, y1, tree.at(0), off, r)

  let nr = nb-leaf(tree.at(1))

  let x1 = x + off * nr / 2
  line((x, y), (x1, y))
  line((x1, y), (x1, y1))
  dendo-aux(x1, y1, tree.at(1), off, r)
}
}
#let dendogram(tree) = {
  canvas({
    import draw: *
    let off = 0.4
    let r = 0.07
    dendo-aux(0, 0, tree, off, r)
    line(
      (- off * nb-leaf(tree) / 2 + 0.4, - depth(tree)),
      (off * nb-leaf(tree) / 2, - depth(tree))
    )
    content((0, 0))[hey]
  })
}
#let t1 = ("", "")
#let t2 = (t1, ("", ))
#let t3 = (t2, (t1, ))
#let t4 = ((t2, ), t3)
// #dendogram(t4)


]

=== Algorithme des k moyennes @AZE[12.4]

#item("Définition")[][
  On appelle centroïde du cluster C le point déﬁni par : $mu_C = 1/(|C|) . sum_(x in C) x$.
  
]

#dev[
  #item("Algorithme")[de Loyd.][
1. Choisir des centroïdes initiaux parmi les observations.
2. Affecter chaque observation au centroïde dont elle est le plus proche.
3. Recalculer les centroïdes de chaque cluster.
4. Répéter les opérations 2-3 jusqu'à convergence, i.e. jusqu'à que les affections ne changent plus.
  ]
]

#item("Remarque")[Convergence (Admis).][]

#item("Remarque")[][
  Les clusters formés par l’algorithme des K-moyennes forment un diagramme de Voronoï et sont toutes convexes.
]

#item("Remarque")[Les points aberrants][
  vont généralement "attirer" le cluster vers eux seuls et doivent généralement être pris en compte séparément.
]



#item("Remarque")[][
  Une variante nommé k-moyenne++ de cette algorithme consiste à choisir de façon déterministe les centroïdes initiaux pour les séparer un maximum.
]

#item("Exemple")[][
  #align(center, canvas(length: 1.2em, {
    import draw: *
    import calc: *
    let n = 200
    let w = 100
    let a = 0.1
    let off = 12
    let data = ()
    for i in range(n) {
      data.push((
          cos(i) + cos(i * w) * a,
          sin(i) + sin(i * w) * a,
          false
        ))
      data.push((
        cos(i) * 2 + cos(i * w) * a,
        sin(i) * 2 + sin(i * w) * a,
        true
      ))
    }
    for i in range(n) {
      let color = if data.at(i).at(0) <= 0 { red } else { green }
      content(data.at(i).slice(0,2), text(color, $dot.c$))

      let color = if data.at(i).at(2) {red} else {green}
      content((
        data.at(i).at(0) + off,
        data.at(i).at(1))
        , text(color, $dot.c$))
    }
    content((-5, 0))[k-moyenne \ $k = 2$]
    content((7, 0))[clustering \ ascendant \ hiérarchique]

  }))
]



== Enjeux éthiques et sociétaux

=== Biais des algorithmes d'apprentissages

#item("Enjeux")[
  Des biais dans les données][formeront également des biais similaire dans la classification renvoyée par un algorithme d'apprentissage. Il est nécessaires de s'assurer d'une représentation équilibrée des différentes classes attendues dans les données d'entraînement pour éviter ce phénomène.
]

#item("Définition")[Un modèle est explicable][
  s'il est capable de fournir des justifications claires sur la classification renvoyée.
]

#item("Définition")[Un modèle est interprétable][
  si l'on est capable d'en comprendre le fonctionnement et les raisons pour lesquelles il classe les données d'une certaine manière.
]

=== Utilisation des données personnelles

#item("Définition")[Le RGPD][
  (protection des données) est une loi européenne écrite en 2016 qui encadre la gestion des données personnelles. Les entreprises doivent justifier de l'utilisation de la récolte des informations personnelles et les garder un temps limité.
]

#recap()

===== Remarque

- ne pas parler de réseaux de neurones / deep learning car hors programme
- 4 algorithmes au programme il faut bien les avoirs en tête (chacun peut être un dev) : ID3, k d tree, k moyenne et arbre ascendant hierarchique

- penser à dire que minimiser une fonction de coût peut signifier différentes choses. On peut minimiser la somme des coûts, le minimum des coûts ...
- *Transition III.A $->$ III.B* : Faire comprendre que l'on souhaite obtenir un algorithme plus rapide mais pour lesquels on va fixer le nombre de cluster (pas toujours facile de choisir cet hyperparamètre).
- Bien clarifier le fait que l'utilisation du "k" est ambigu mais c'est l'usage pour ces algorithmes
- Bien différencier "distance" (pour les observations, non supervisé) et "fonction de coût" (pour les étiquettes, supervisé).
- *Supposition* : le calcul de distance est en $cal(O)(1)$. Si ce n'est pas le cas on multiplie simplement toutes les complexités par ce facteurs.
- Exemple clustering ascendant hierarchique : distance entre cluster à définir précisément à l'oral (minimum des distances entre tous les points).

#bibliography(read("../bib.yaml", encoding: none))

#align(center + bottom)[
  Paul ADAM & Aloïs Rautureau
]