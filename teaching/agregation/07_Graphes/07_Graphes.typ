#import "../../deps.typ" : *
#show : tableau

= Accessiblité et chemins dans un graphe. Applications.

== Définitions, généralités
=== Structure de Graphe @BAR[5.4.1 5.4.2] @TOR[8.1]
#item("Définition")[Graphe][
Un graphe $G$ est un couple $G=(S, A)$ avec $S$ un ensemble de sommets et $A$ un ensemble d'arc/arêtes défini par une relation binaire entre les éléments de $S$.
]

#item("Remarque")[Orienté vs Non-Orienté][
Si $G$ est orienté, les éléments de $A$ sont des arcs. Si $G$ est non orienté, les éléments de $A$ sont des arêtes et $A$ est défini par une relation symétrique.
]

#item("Exemple")[Représentation Graphique][
#align(center, raw-render(
   
  ```dot
  digraph {
    graph [
      layout = circo
    ]
    node [
      label=""
      height=0.15
      width=0.15
    ]
    5
    1 -> 2
    2 -> 0
    0 -> 1
    1 -> 3
    3 -> 4
    4 -> 3
  }
  ```
))
/* 
#align(center, canvas(length: 1em, {
  import draw: *
  let r = 0.2em
  set-style(mark: (end: ">"))
  // circle((1, 1), radius: r, )
  
  circle((4, 4), radius: r, name: "a")
  circle((3, 2), radius: r, name: "b")
  circle((2, 4), radius: r, name: "c")
  content("a", [Hey])
  
  line("a", "b", name: "ab")
  
  line("b", "c", name: "bc")
  line("c", "a", name: "ca")

  content("ca.start", text(0.5em, [Hey]))
  
})) */
]

#item("Définition")[Voisins d'un sommet][
Les voisins d'un sommet $u in S$ sont les sommets $v$ tels que $(u, v) in A$
]

#item("Définition")[Chemin][
Un chemin de $u in S$ à $v in S$ dans un graphe $(S, A)$ est une séquence $((f_0, f_1),  (f_1, f_2), ..., (f_(n-1), f_n))$ où $f_0 = u$ et $f_n = v$. 
]


#item("Remarque")[Cycle][
Un chemin de $u$ à lui-même est appelé un cycle. 
]

#item("Exemple")[Chemin et cycle][
#align(center, raw-render(
  ```dot
  digraph {
    graph [
      layout = circo
    ]
    node [
      label=""
      height=0.2
      width=0.2
    ]
    5

    1 -> 2 [color=green]
    1 -> 2
    2 -> 0 [color=green]
    2 -> 0
    0 -> 1 [color=green]
    0 -> 1
    1 -> 3 [color=blue]
    1 -> 3
    3 -> 4 [color=blue]
    3 -> 4
    4 -> 3
  }
  ```
))

  
]

#item("Définition")[Sommet accessible][
Un sommet $u in S$ est accessible depuis $v in S$ si $u = v$ ou s'il existe un chemin de $u$ à $v$.
]

#item("Définition")[Composantes connexes][
La composante fortement connexe de $u in S$ est l'ensemble des $v in S$ tels que $u$ est accessible depuis $v$ et $v$ est accessible depuis $u$. Pour les graphes non orientés, on parle de composante connexe.
]

#item("Exemples")[Composantes connexes][
#align(center, raw-render(
  ```dot
  digraph {
    graph [
      layout = circo
    ]
    node [
      label=""
      height=0.2
      width=0.2
    ]
    0 [color=red]
    1 [color=red]
    2 [color=red]
    3 [color=blue]
    4 [color=blue]
    5 [color=green]

    1 -> 2 [color=red]
    2 -> 0 [color=red]
    0 -> 1 [color=red]
    1 -> 3
    3 -> 4 [color=blue]
    4 -> 3 [color=blue]

  }
  ```
))
]

#item("Application")[Applications des graphes][
Les graphes sont une structure de donnée relationnelle qui permet de modéliser des problèmes dans des domaines variés : géographie, réseau, imagerie, ... . Ils sont aussi la base d'outils formels tels que : les systèmes de transitions, automates finis et machine de Turing. 
]

=== Représentation d'un graphe @BAR[5.4.4] @COR2[22.1] @TOR[8.2] 

#item("Définition")[Liste - Ensemble d'adjacence][
On stocke pour chaque sommet l'ensemble de ses voisins.
]

#item("Définition")[Matrice d'adjacence][
On stocke une matrice de booléens $|S| times |S|$
On a `true` en colonne $i$, ligne $j$ ssi $(i, j) in A$. Cette matrice est symétrique pour les graphes non orientés.
]


#let graph(g) = canvas(length: 1em, {
    import draw: *

    let r = if "radius" in g {g.radius} else {0.4}
    let links = g.links
    let nodes = g.nodes
    for node in nodes {
      circle(node.at(1), radius: r, name: node.at(0))
      content(node.at(0), [#node.at(0)])
    }
    for link in links {
      if (link.at(0) == "bezier") {
        set-style(mark: (end: ">"))
        bezier(
          (link.at(1), r, link.at(2)),
          (link.at(2), r, link.at(1)),
          link.at(3)
        )
      } else {
        set-style(mark: (end: ">"))
        line(..link)
      }
    }
})


#item("Exemple")[Représentation d'un graphe][

#align(center + horizon, graph((
  radius: 0.7,
  nodes: (
    ("0", (1, 3)),
    ("1", (4, 2.5)),
    ("2", (1, 1)),
    ("3", (7, 3)),
    ("4", (11, 3)),
    ("5", (13, 3))
  ),
  links: (
    ("0", "1"),
    ("1", "2"),
    ("2", "0"),
    ("3", "4"),
    ("bezier", "4", "3", (8, 0)),
  )
)))
]


#item("Remarque")[Représentation implicite][
Certains graphes sont représentés de façon implicite par une fonction qui calcule les voisins d'un sommet (ex: graphes des configurations aux échecs.)
]

== Parcours de Graphe

=== Parcours itératif @COR2[22.2] @BAR[9.1.1] @TOR[8.3.2]

#item("Algorithme")[Parcours en largeur][
L'algorithme suivant parcours un graphe $G$ depuis un sommet $u$ donné en entrée, en commençant par les sommets les plus proches :
```haskell
Parcours_it(G, U)
  L = file qui contient juste u
  traité = [blanc \forall s in S]
  tant que L non vide :
    defiler s de L
    traite[s] = noir
    pour voisin v de s:
      si traité[v] = blanc:
        enfiler v dans L
        traité[v] = gris    
```
À la fin de l'algorithme, tous les sommets traités sont en noir. 
]

#item("Proposition")[][
Complexité en $O(|S| + |A|)$.
]

#item("Application")[][
Permet de calculer tous les sommets accessibles depuis u.
]

=== Parcours profondeurs récursifs @COR2[22.3 22.4 20.5]@BAR[9.1.2, 9.2]@TOR[9.3.1]

#item("Algorithme")[][
#grid(
columns: (1fr, 1fr),  
```
PARCOURS_REC(G)
  parent = [nil for s in S]
  pre = [-1 for s in S]
  post = [-1 for s in S]
  clock = 1
  tant qu'il existe u non traité
    EXPLORER(u)
```,
```
EXPLORER(u)
  pre[u] = clock; ++clock
  pour v voisin de u tq pre[v] = -1:
    parent[v] = u
    EXPLORER(v)
  post(u) = clock; clock++
```,
)
]

#item("Proposition")[][
Complexité en $O(|S| + |A|)$.
]

#item("Définition")[Forêt de parcours][
La table `parent` définit des arborescences, qu'on nomme forêt de parcours.
]

#item("Théorème")[Chemin Blanc][
$u in S$ est un descendant de $v in S$ dans la forêt de parcours ssi quand on apelle `EXPLORER(v)` il existe un chemin de $v$ à $u$ qui ne passe que par des sommets non traités.
]


#item("Définition")[Classification des arcs][
Il existe une classification des arcs du graphe selon la forêt de parcours. Par exemple, un arc (`parent[u]`, `u`) pour $u in S$ est appelé arc de liaison. Un arc de $u$ vers un de ses ancêtres est appelé arc arrière.
]


#item("Application")[Détection de cycles][
Un graphe contient un cycle si et seulement s'il a un arc arrière.
]


#item("Application")[Tri topologique][
Ordonner les sommets par `f` décroissant fournit un ordre topologique $<=_t$ pour un graphe sans cycle.
]


#item("Application")[L'algorithme de Kosaraju][
 calcule les composantes fortement connexes d'un graphe.
]


== Graphes pondérés

=== Définitions @BAR[5.4.1] @TOR[8.1.3]

#item("Définition")[Graphe pondéré][
Un graphe pondéré est un triplet $G_w = (S, A, w)$ où $(S, A)$ est un graphe et $w : A -> RR$ une pondération.
]

#item("Exemple")[Graphes pondérés][
#align(center, raw-render(
  ```dot
  digraph {
    graph [
      layout = circo
    ]
    node [
      label=""
      height=0.2
      width=0.2
      fixedsize=1
    ]
    0 [label="0"]
    1 [label="1"]
    2 [label="2"]
    3 [label="3"]
    4 [label="4"]
    5 [label="5"]

    1 -> 2 [label="-3"]
    2 -> 0 [label="1"]
    0 -> 1 [label="1"]
    1 -> 3 [label="2"]
    3 -> 4 [label="1"]
    4 -> 3 [label="2"]
  }
  ```
))
]

#item("Définition")[Poids d'un chemin][
Le poids d'un chemin dans un graphe pondéré est la somme des poids des arêtes/arcs qui le composent.
]

#item("Définition")[Distance entre deux sommets][
La distance entre deux sommets $u$ et $v$ d'un graphe pondéré, est, si elle existe, le poids minimal des chemins qui relient $u$ à $v$. On pose souvent $+inf$ comme distance de $u$ à $v$ si elle n'est pas accessible depuis $u$.
]

#item("Exemple")[Calculs de distance][
  
]

=== Algorithmes de calcul de distances @BAR[9.3] @COR2[24.3 25.2] @TOR[8.3.3]

#item("Algorithme")[Dijkstra][
Mono-source (d'un sommet vers tous les autres) dans un graphe sans poids négatifs. Paradigme glouton.

```
Dijkstra((S, A, w), s_0)
  d = [inf pour s in S]
  d[s_0] = 0
  parent = [nil pour s in S]
  F = S
  tant que F non vide:
    extraire p = argmin d[s] de F
    pour chaque voisin u de p:
      si d[u] > d[p] + w(p, u):
        d[u] = d[p] + w(p, u)
        parent[u] = p
```

Complexité avec la bonne file de priorité $O((|S| + |A|)log |S|)$.
]

#item("Remarque")[][
En plus du calcul des distances, on peut retrouver le plus court chemin à l'aide du tableau `parent`.
]

#item("Algorithme")[A\*][
On peut biaiser l'ordre de traitement des sommets à l'aide d'une heuristique. Si l'heuristique est une estimation de la distance restante, cet algorithme s'appelle alors A\*.
Si l'heuristique minore la distance réelle, alors A\* est correct. 
]

#item("Algorithme")[Floyd-Warshall][
Omni-source (de chaque sommet vers tous les autres). Le graphe ne peut pas posséder de cycle de poids négatifs. Paradigme de programmation dynamique. Calcul de matrices successives $O(|S|³)$.
$M_(i, j)^(n+1) = min (M_(i, j)^n, M_(i, n+1)^n + M_(n+1, j))$
]

#item("Application")[Routage réseau automatique][
Le protocole OSFP établit des tables de routages pour un réseau en deux étapes :
- les routeurs se mettent d'accord sur la matrice d'adjacence du réseau de façon distribuée
- chacun éxécute un algorithme de plus court chemin
]



=== Problème du voyageur de commerce @COR2[35.2]
#item("Définition")[Cycle Hamiltonien][
Un cycle dans un graphe est dit hamiltonien s'il passe exactement une fois par chaque sommet.
]

#item("Définition")[TSP][
Problème du Voyageur de Commerce
- Entrée : Un graphe $(S, A, w)$ complet, pondéré par $w : A -> NN$, un entier $k in NN$ 
- Sortie : oui ssi il existe un cycle hamiltonien de poids inférieur ou égal à $k$ dans $(S, A, w)$.
]

#dev[
#item("Propriété")[][
Le problème du voyageur de commerce est NP-Complet.
]

#item("Propriété")[][
Il n'existe pas d'approximation à facteur constant en temps polynomial du problème du voyageur de commerce.
Si l'on se limite aux graphes pour lesquels la pondération vérifie l'inégalité triangulaire, alors il existe une 2-approximation.
]
]

=== Arbre couvrant minimal @COR2[2.3] @BAR[9.4] @TOR[8.3.5]

#item("Définition")[Arbre couvrant][
Soit $G=(S, A)$ connexe, non orienté. Un arbre couvrant de $G$ est un ensemble d'arête $T subset.eq A$ tq $(S, T)$ connexe acyclique. 
]

#dev[
#item("Algorithme")[Kruskal][
```
Kruskal(S, A, w):
  T = emptyset
  trier A par poids w croissants
  pour (u, v) in A:
    si u et v ne sont pas dans la même composante connexe dans (S, T):
      T = T union {(u, v)}
  renvoyer T
```
]
]

#item("Application")[][
Égaliser des tensions en conception de circuits (par exemple relier toutes les portes logiques à la terre).
]


#recap()

#set text(12pt)

= Commentaires

- La notion de cycle est mal définie, en effet, avec cette définition, tout graphe possédant un cycle en posséderait une infinité.

- La notion de couplage dans un graphe, au programme de MP et de MPI n'apparaît pas dans ce plan. Il est alors indispensable de justifier ce choix lors de la défense du plan. 

=== Application : Couplage maximum dans un graphe biparti @TOR[8.3.6] @BAR[9.5]

#item("Définition")[couplage, couplage maximum][
Soit $G = (S, A)$ non orienté. Un couplage $M subset.eq A$ sur $G$ est un ensemble d'arêtes non adjacentes. 
$(a, b) != (c, d) in M , (a != c) and (a != d) and (b != c) and (b != d)$
Un couplage sur $G$ est maximum s'il a le plus grand nombre d'arêtes parmi les couplages sur $G$.
]

#item("Exemple")[Exemples de couplages dont un maximum][
  
]

#item("Définition")[Chemin améliorant][
Soit $M$ un couplage sur $G=(S, A)$. Un chemin améliorant est un chemin qui utilise de façon alternée une arête de $A \\ M$ et une arête de $M$ et qui commence et termine sur des sommets de $A \\ M$.
]

#item("Théorème")[][
$M$ est un couplage maximum ssi il n'admet pas de chemin améliorant.
]

#item("Définition")[Graphe Biparti][
Un graphe $G = (S, A)$ est biparti s'il existe $S'$ et $S''$ tels que $S = S' union S''$, $S' intersection S''  emptyset$ et $forall u, v in A, (u in S' and v in S'') or (u in S'' and v in S')$.
]

#item("Algorithme")[Chemin améliorant dans un graphe biparti][
```
COUPLAGE_MAX(G biparti)
  M = emptyset
  tant qu'il existe C chemin améliorant M
    M = M Delta C
  renvoyer M
```
]

#bibliography(read("../bib.yaml", encoding: none))

/*
#align(bottom + center)[
   Alexandre - .. 
]
*/

