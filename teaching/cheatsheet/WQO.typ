#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/agregyst:0.1.0": dev, item, recap, tableau
#show: tableau

= Example cheatsheet

== First Paragraph

// Definition of a graph
#item("Définition")[Un graphe][
  is always the best set you can find in a WQO.
]

#item("Propriété")[Un graphe orienté acyclique][
    est toujours cyclique.
]

#align(center, diagram(
  $
    a & b                                                & c \
      & c edge("tl", =>) edge("t", "-->") edge("tr", <-)
  $,
))

#item("Property")[][
  The MPRI is the best master.
]

Quand je fais des trucs.

Je suis en train de save.


$
  a = && Delta + RR + cal(D) + integral_0^n b space delta x + c \
    = &&                                              Gamma + c \
    = &&                                      sum_(i = 0)^n x_i
$



