// import fletcher for doing graph / automata
#import "@preview/fletcher:0.5.8" as fletcher: edge, node, diagram

// import the agreg template
#import "@preview/agregyst:0.1.0" : tableau, dev, recap, item
#show : tableau

= Example cheatsheet

== First Paragraph

// Definition of a graph
#item("Définition")[A Graph][
    is
]

#colbreak()

== Second paragraph

Here is an automata :

#align(center, diagram(
  node((0, 0), $x$, name: <x>),
  node((0, 1), $y$, name: <y>),
  node((1, 0), $z$, name: <z>),
  node((3, 2), $t$),
  node((3, 2), $t$),
  edge(<x>, <y>, "->"),
  edge(<z>, <z>, "->", bend: 20deg),
  edge(<y>, "->")
))

== Second Paragraph

Here is a theorem :

#item("Définition")[$cal(C)$][
  Here some definition of $cal(D) = (A, B in NN, C in RR)$.
]

Here is a theorem with a figure on the right.


Here is a theorem with a figure inside of it