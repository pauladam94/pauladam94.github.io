#import "../../utils/tableau.typ" : tableau, dev, recap, item
#import "../../utils/utils.typ": graph
#import "@preview/cetz:0.3.2" : *
#import "@preview/diagraph:0.3.0": raw-render

#show : tableau

#set text(lang: "eng")

#let todo = text(red, 14pt, [*TODO*])

= Implementation and Applications of sets and dictionnaries

// Les ensembles et dictionnaires sont structures de données très utilisés dont il est important de comprendre leur implémentation. 

== Interface and naiv implementations

#item("Definition")[A Set][
  is an abstract data structure that can store distincts values.
]

#item("Definition")[A Dictionary][
  , or assiocative array, is an abstract data strucutre that stores a collection of key - value pairs.
]

#item("Remark")[Equivalence of Set and Dictionaries][
  A set is a dictionary whose values are booleans, and a dictionary is a set of key - value pairs. In the next items, we will focus to the implementation of sets.
]

#item("Remark")[][
  //On donnera les complexités des implémentations d'ensemble en fonction de "n" le cardinal des ensembles pris en entrée.
  We give complexity of set implementations with regards to $n$, the number of elements of the sets given in entry.
]

#item("Definition")[Two possible set of operations][

#grid(columns: (50%, 50%), column-gutter: 1em,
```ml
val empty   : set
val add : set -> 'a -> set
val remove : set -> 'a -> set
val contains : set -> 'a -> bool
```,
```ml
val empty   : unit -> set
val add: set -> 'a -> unit
val remove : set -> 'a -> unit
val contains : set -> 'a -> bool
```
)
]

#item("Remark")[A mutable and immutable implementation @TOR[7.4 p.422]][
  can be used for sets. The compromise between memory, performance, ease of use should be taken into consideration.
]



#item("Definition")[A Multi-set @TOR][
  is a set that can hold multiple times the same value.
]









=== Linked Lists
#item("Definition")[A linked list][
  can describe a set of element in a very primitive way, where the value of each node is an element of the set.
]

#item("Complexity")[][
  To know if an element is in the set, we might go through the whole list, so `add,` is in $cal(O)(1)$, and `contains` is in $cal(O)(n)$.
]

#item("Example")[@SED[p.]][
  ${1, 2, 3, 4, 5}$ can be represented as:
  #align(center, canvas(length: 1em, {
    import draw : *
    let i = 1
    for pos in (
      (13, 0),
      (9, 0),
      (5, 0),
      (17, 0),
      (1, 0)
    ) {
      rect(pos, (rel: (1, 1)), name: str(i))
      i += 1
    }
    for i in range(1, 6) {
      content(str(i), [#i])
    }
    set-style(mark: (end: ">"))
    line("5", "3")
    line("3", "2")
    line("2", "1")
    line("1", "4")
  }))
]


=== Sorted array
#item("Definition")[A sorted array][
  without duplicates is a simple way of implementing a set that allows logarithmic lookup using binomial search.
]

#item("Complexity")[][
  `add` in $cal(O)(n)$, `contains` in $cal(0)(log(n))$
]


== Classical implementations @SED

=== Binary Search Tree

#let ens_etiquettes = item("Definition")[A set of label][
  $"Set"$ of a binary tree can be defined by induction as:
- $"Set"(#text(`Empty`)) = emptyset$
- $"Ens"(#text[`N(g, e, d)`]) = {#text[`e`]} union "Set"(#text(`l`)) union "Set"(#text(`r`))$
]

#let abr_def = item("Definition")[A Binary Search Tree (BST)][
  (BST) is a binary tree where, the label `e` of each node `N(l, e, r)` is greater than each label of $"Set"(#text(`l`))$ and less than each label of $"Set"(#text(`r`))$.
]

#let abr_cor = align(center, image("abr_cormen.png", width: 70pt))
#let abr_cor2 = align(center, image("abr_cormen2.png", width: 70pt))

#grid(columns: (80%, 20%), column-gutter: 0.5em, row-gutter: 1em,
  ens_etiquettes,
  grid.cell(rowspan: 2, item("Example")[@COR3[12.1]][
      #abr_cor
      #abr_cor2
  ]),
  abr_def,
)

#item("Implementation")[][
  A BST can be implemented in a mutable or immutable way. In the first, the `add` and `remove` operations make in place modifications. In the latter, they return a new set.
]

/*
#item("Example")[@SED[p.397]][
  #graph((
    radius: 0.6em,
    nodes: (
      ("1", (10, 10)),
      ("2", (9, 9))
    ),
    links: (
      ("1", "2"),
    )
  ))
]
*/


#item("Complexity")[][
  For a BST of height $h$, the search, insertion and deletion are made in $cal(O)(h)$. If the tree is balanced, we then have $cal(O)(log n)$ complexity ; however, in the worst case, it still is $cal(O)(n)$.
]

#item("Application")[`Set` in OCaml][
  are implemented with balanced binary search tree. Specifically, they use AVL trees.
]

#item("Property")[][
  With this implementation, we have the `min` and `max` operations in $cal(O)(h)$, and we can iterate over the set in $cal(O)(n)$.
]

#item("Definition")[Red-black tree][
  is a BST where each node are colored, following:
  - each node is either red or black
  - the root and the leaves (`Empty`) are black
  - the childrens of a red tree are black
  - the path from the root to any leaf always contains the same number of black node. We call this number the black height.
]

#item("Property")[][
  For a red-black tree with $n$ nodes, of height $h$, we have $h <= 2 log_2(n+1)$.
  The search operation are then in $cal(O)(log n)$.
]

#item("Property")[][
  We can implement insertion and deletion opération in a red-black tree in $cal(O)(log n)$.
]

#item("Application")[The Linux scheduling algorithm][
  uses a red-black tree in the CFS scheduling algorithm for processes.
]

=== Hash Table

#item("Definition")[A Hash Table][
  by linking is an array of linked lists, containing key-value pairs, with a hash function linking each key to a cell of the array.
]

#grid(columns: (70%, 30%), column-gutter: 0.5em,
  item("Example")[@SED][
    By using the strings as keys, and taking $h(w) = |w| % 7$ for our hash function. The hash table opposite only contain keys, it so it represents the set `{"", "we like", "the codes", "in", "ocaml"}`.
  ],
  [
    #image("table_hachage_ex.png", width: 125pt)
  ]
)

#item("Implementation")[Mutability][
  The data structur of the array is mutable, making theese sets mutable. The insertions and deletions operations operate in place.
]




#item("Definition")[Collisions][
  happens in a hash table when two distincts elements share the same hash. In that case the research in the table would take more time as there is mor collisions.
]

#item("Remark")[The hash functions][
  are not computed in $cal(O)(1)$ for an arbitrary entry. In practice, our entries are bounded and our hash functions are very fast, so we can assume them to be constant time.
]

#item("Application")[][
  A hash table is a vary usefull and flexible data structure, used to implement the `hashtbl` type in OCaml, of the `dict` type in Python.
]

#item("Application")[The sparse matrices][
  contains mainly $0$s. They can be used to represent the set of non null values and saves the cost of most computatiosn, for a multiplication for example.
]

#item("Definition")[A perfect hash][
  is a hash fuction that does not causes collisions (access in $cal(O)(1)$) in the worst case). They need, however, to know before hand the set of elements that may be hashed.
]

#item("Complexity")[][
  If the hash function `h` has a constant time cost, then search, insertion and deletion are in $cal(O)(k)$, with $k$ the maximal number of collisions in the table. If `h` can bound $k$ with a constant, then we have a cost in $cal(O)(1)$.
]

== Specific implementations

=== Probability over the elements

#item("Idea")[][
  Even with a balanced BST, if some nodes are more used than others then a tree more suited to the usage of each elements might be faster.
]

#dev[
#item("Definition")[Optimal BST @COR3][
  By knowing the probability of request of each element, we can build an optimal BST, with a $cal(O)(log n)$ cost for the search.
]
]

#item("Application")[A DNS server][
  answer to many request made with few modification to the address space. We could build an optimal BST by approximating the probabilities of each request with its frequency.
]

=== Hash consing @OCA[11.4]

#dev[
#item("Idea")[][
  Some elements of a set could contains many equal substructure. We could re-use the common substructures to reduce the memory footprint and potentially memoize computations.
]

#item("Definition")[Hash consing][
  is a method consisting of memoizing the function of set creation. This method is often used in formal languages to limit the memory footprint.
]
]

=== Set partition @COR3

#item("Idea")[][
  If we work on a global set that we want to partition, we can simply remove an element from its parent. By going up the chain of parents, we find the representative of one partition of the set.
]
#dev[
#item("Definition")[The Union-Find][
  data structure allow to work with set partition. It has the operations Union, that unites two sub set, and Find, that finds the representative of one element.
]
]

#item("Implementation")[][
  A classical implementation of this data structure is made with a forest, where each tree correspnd to distincts set. Such a forest could be implemented with a kinship table.
]

#item("Remark")[Union by rank:][
  In a union, we choose the roots between the two candidates, so that the maximal hight is limited. Union and find then are with complexity $cal(O)(log(n))$ in the worst case.
]

#item("Implementation")[Path compression][
  is a method used when we find a "shortcut to the root", we can repalce the parent. The amortized complexity become almost constant. The amortized complexity then is in $cal(O)(log*(n))$ (Admitted).
]

#item("Application")[][
  The Kruskal algorithm uses the Union-Find structur to build iterativly a minimal spanning tree. This algorithm work with a partition of node of a graph.
]

=== Set of words @TOR[7.3.5]

#item("Idea")[][
  We store naturally words by their first lettenrs in a dictionnary. We can implement a set of words with a tree that scrolls through the letters as they appear.
]

#let item_1 = item("Definition")[A Prefix tree][
  is a tree where each branch is labeled by a letter, and each node contains a value if the sequence of letters from the root to this node in one entry.
  
]

#let item_0 = item("Example")[@TOR[p412]][
  #align(center, image(width: 100pt, "image.png"))
]


#let item_2 = item("Implementation")[Search / addition of a key][
  The search is just a traversal of the tree, following the letters of the entry `s`.
]
#let item_3 = item("Complexity")[][
  The search and add operations have a complexity yn $cal(O)(|s|)$, the lenght of the key `s`.
]

#grid(columns: (80%, 18%), column-gutter: 1em, row-gutter: 1em,
  item_1,
  grid.cell(rowspan: 3, item_0),
  item_2,
  item_3
)

#item("Application")[][
  Prefix trees can be used in autocompletion, as well as in bio-informatics, notably to implement anti-dictonnaries.
]

#pagebreak()
//#recap()

/*
/ PREM : 2 Intro, 2C, 3C,
/ PREPA : 4B, 7D, 11C
*/


#bibliography(read("../bib.yaml", encoding: none))

