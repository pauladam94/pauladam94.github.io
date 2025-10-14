#import "../../deps.typ": *
#show : content => tableau(content, title: "Requête en Langage SQL", nb-columns : 2)

/// Codly Stuff
#show: codly-init.with()
#codly(
  languages: (sql: (name: "SQL", color: orange, icon: none)),
  inset: 0.2em,
  display-icon: false,
  display-name: false,
)
/// Codly Stuff

#let sql_query = read("main.sql").split("\n").fold((), (acc, line) => {
  if acc.len() == 0 {
    acc.push("")
    return acc
  }
  if line == "" or line == "\n" or line.at(0) == "." or (line.len() >= 2 and line.slice(0, 2) == "--") {
    acc.push("")
    return acc
  }
  acc.at(acc.len() - 1) = acc.at(acc.len() - 1) + "\n" + line
  return acc
}).map(l => l.trim()).filter(l => l != "").map(c => raw(c, block: true, lang: "sql"))

#let table_sql(n, ..l) = {
  let m = int(l.pos().len() / n)
  let w = 1pt
  block(breakable: false, table(
    align: center,
    columns: n,
    inset: 0.2em,
    stroke: (x, y) =>
    if y == 0 { w }
    else if x == n - 1 and n != 1 { (left: w) } 
    else if x == 0 and n != 1 { (right: w) }
    else if x == 0 or x == n - 1 { none }
    else { (right: w, left: w) },
    fill: (x, y) => if y == 0 {
      color.transparentize(blue, 70%)
    },
    row-gutter: (0.3em, ) + (0pt, ) * 10,
    ..l.pos().enumerate().map(((i, c)) =>
    if i < n { text(0.8em, c) } else { c })
  ))
}

#let sql_answer = json("res.json").map(c => {
  if type(c) == str {
    c
  } else {
    let n = c.at(0).len()
    let title = c.at(0).keys()
    let c = c.map(x => {
      x.pairs().map(((key, value)) => {
        (key, if value == none { "NULL" } else { value })
      }).map(((key, value)) => {
        if key == "JOUR" {
          (key, value.slice(value.len() - 2, value.len()))
        } else if key == "NOTE" {
          let s = str(value)
          (key, s.slice(0, calc.min(4, s.len())))
        } else {
          (key, value)
        }
      }).to-dict()
    })
    let cont = c.map(l => l.values()).flatten().map(x => [#x])
    table_sql(n, ..title, ..cont)
  }
})

= Requêtes en langage SQL


/ Motivation : @CERV[3] Au XIXe au US la population augmente de 30% tous les 10 ans. Recenser la population prend 10 ans.

 // En 1960 1/4 de la puissance de calcul dans le monde est utilisé pour faire du tri.

== Creation d'un table en SQL @VACHE[3.1.1]

#item("Définition")[Une Table][
  (ou Relation) est un multi-ensemble de n-uplets ou enregistrements représenté ligne par ligne.
]

#item("Definition")[Le SQL][
  (Structured query langage)
  est un langage déclaratif de requête permettant d'interagir avec une base de données. 
]

#item("Définition")[Les types SQL][
  de bases sont nombreux. On utilisera notamment `varchar` pour une chaine de charactère, `int` pour un entier ou `real` pour un nombre réel.
]

#let under(c) = box(
  outset:(bottom:2pt),
  stroke:(bottom:0.6pt),
  c
)
#item("Exemple")[@VACHE[5.11.1 p.162] Sailors, Boats et Reserves][
  sont les 3 tables que l'on va étudier et se définissent comme suit :
  - Marin(#under[_sid_ : *int*], snom : *varchar*, note : *int*, age: *real*)
  - Bateau(#under[_bid_: *int*], bnom : *varchar*, couleur: *varchar*)
  - Reservation(_sid_: *int*, #under[_bid_ : *int*], #under[jour : *date*])
]

#item("Définition")[ @VACHE[5.11.1 p.162] La création de ces tables][
  se fait comme ceci : 
#set align(center)
#grid(columns: (40%, 1fr), column-gutter: 1em,
stack(spacing: 1em,
sql_query.at(1),
sql_query.at(2),
),
sql_query.at(3)
)
]

#item("Remarque")[Clé primaire et étrangère.][
  Les identifiants sont utilisés comme clé primaire dans `MARIN` et `BATEAU`. La clé `MID` est une clé étrangère dans la table `RESERVATION`. 
]

#item("Définition")[Les insertions][
  nous permettent d'ajouter des éléments dans une table :
#set align(center)
```sql
insert into BATEAU values(101, 'Interlake', 'blue');
insert into BATEAU values(102, 'Interlake', 'red');
...
insert into MARIN values(22, 'Dustin', 7, 45.0);
....
insert into RESERVATION values(22, 101, '2023-01-06');
...
```
]

#item("Exemple")[][
#set align(center)
#grid(columns: (60%, 1fr), column-gutter: 1em,
stack(spacing: 0.9em,
sql_answer.at(2),
sql_answer.at(1)  
),
place(dy: -24pt, box(width: 140pt, sql_answer.at(0))),
)
]

#item("Définition")[Update et Delete][
  peuvent aussi être utilisées pour mettre à jour une table ou supprimer des enregistrements.
]

== Un problème concret @VACHE[5]

#item("Problème")[][
  Supposons que les bateaux rouges posent problèmes. On cherche alors pour chacun d'entre eux le nom d'un marin expérimenté (plus de 40 ans, a une note de plus de 7, a reservé plus de 2 bateaux et n'a jamais reservé un bateau en premier) et la moyenne de notes de tous les marins qu'ils l'ont reservé.
]

#item("Remarque")[][
  ```sql select``` et ```sql from``` nous permettent de faire une requête sur une table donnée. ```sql distinct``` permet de ne pas avoir de doublon dans la table finale.
]

#let complem(pourc) = {
  (pourc, 100% - pourc + 5%)
}

#grid(columns: complem(85%),
{
  item("Exemple")[][Noms de tous les marins sans doublons.
    #sql_query.at(10)
  ]
  item("Remarque")[where][
  permet de faire une selection sur les éléments d'une table selon une condition. Cette clause n'est pas obligatoire.
  ]
},
align(center + horizon, sql_answer.at(4)),
)

#grid(columns: complem(80%),
  item("Exemple")[][Tous noms et id des bateaux rouges.
    #sql_query.at(12)
  ],
  align(center + horizon, sql_answer.at(6)),
)


#grid(columns: (80%, 100% - 80% + 5%),
{
  item("Remarque")[][
    Dans une clause ```sql where``` la condition booléenne peut être complexifiée avec ```sql and``` ou ```sql or```.
  ]
  
  item("Exemple")[][Tous les marins qui ont plus de 40 ans et une note d'au moins 5.
    #sql_query.at(13)
  ]
},
align(center + horizon, sql_answer.at(8)),
)

#item("Remarque")[Valeur ```sql NULL```.][
  Certaines valeurs dans une table peuvent être ```sql NULL``` si non indiqué autrement à la création. Comme vu dans l'exemple précédent, les marins dont on ne connait pas l'âge ne sont pas affichés.
]



#grid(columns: complem(80%),
{
item("Définition")[Les opérateurs d'agrégats][
  disponibles en SQL sont `max`, `min`, `count`, `sum`, `avg` etc. Utilisés avec `group by`,  ils permettent de faire une opération sur le groupe spécifié.
]
item("Exemple")[][
    Marins avec plus de 2 reservations.
    #sql_query.at(14)  
]
  

},
  align(center + horizon, sql_answer.at(10)),
)

#item("Remarque")[Jointure.][
  Le mot clé ```sql join``` permet de récupèrer les enregistrements qui ont les mêmes valeurs pour les champs de même nom dans le produit cartésien entre deux tables.  
]




#dev[
    #item("Remarque")[@DSC[6]][
      Les jointures sont une briques de base de l'évaluation des requêtes les plus importantes et couteuses.
      Différents algorithmes existent pour faire des jointures en fonction de la situation.
    ]
]
  
#item("Exemple")[][ Les reservations avec les notes des marins. ]

#grid(columns: complem(70%),
  {
    sql_query.at(15)
    
    item("Remarque")[Requête imbriquée.][
      La clotûre de SQL nous permet très facilement de faire des requêtes imbriquées. Ces requêtes peuvent utiliser des champs de la table qui appelle la requête imbriquée.
    ]
    item("Remarque")[Le langage SQL est clos][
      car toute requête sur une ou plusieurs tables s'évalue en une nouvelle table.
    ]
    item("Remarque")[Table comme un ensemble.][
      Chaque table étant un multi ensemble d'enregistrements, des opérations ensemblistes comme ```sql union```, ```sql intersect```, ```sql exists```, ```sql in```, ```sql  all``` ou ```sql any``` peuvent être utilisés en SQL.
    ]
  },
  align(center + horizon, sql_answer.at(12))
)

#item("Exemple")[][Premier marin qui a réservé chaque bateau.
  #grid(columns: complem(60%),
    sql_query.at(16),
    align(center + horizon, sql_answer.at(14))
  )
]


#item("Exemple")[][
    Tous les identifiants des marins expérimentés.
  #grid(columns: complem(71%),
    sql_query.at(18),
    align(center + horizon, sql_answer.at(16))
  )
]

#grid(columns: complem(82%),
  item("Exemple")[][Pour chaque réservation la note du navigateur qui a fait la réservation.
    #sql_query.at(19)
  ],
  align(center + horizon, sql_answer.at(18))
)

#item("Exemple")[][
  Requête complète finale.
  #sql_query.at(23)
]

#align(center + horizon, sql_answer.at(22))

#colbreak(weak: true)
== Calcul (Traduction) et Optimisation de Requête SQL @SCHWARZ[14.3] @DSC[6]

=== Traduction en algèbre relationnelle

#item("Définition")[Algèbre relationelle][
  L'algèbre relationnelle consiste en un ensemble d'opérations prenant une ou deux relations en entrée et produisant une nouvelle relation en sortie.
]

#item("Exemple")[Sélection][
  $sigma_("NOTE>=5")("MARIN")$ renvoie une nouvelle relation correspondant aux marins ayant eu la moyenne.
]

#item("Définition")[][
  Il y a différentes opérations algébriques:
  - $sigma_("cond")("R")$: sélection des lignes de R vérifiant _cond_
  - $pi_("att1", "att2", ...)("R")$: projection sur les colonnes _att1_, _att2_, etc..
  - $"R"_1join_("att1"="att2")"R"_2$: jointure entre $"R"_1$ et $"R"_2$ selon _att1_ et _att2_
]

#item("Définition")[Calcul relationnel][
  Le calcul relationnel est le fragment syntaxique de la logique du premier ordre où il n'y a que des symboles de relation, des conjonctions, et le quantificateur $exists$.
]

#item("Theorème")[Codd(Admis)][
  Il y a équivalence d'expressivité entre l'algèbre relationnelle et le calcul relationnel.
]

=== Optimisation de requêtes

#item("Définition")[Plan d'évaluation][
  Un plan d’évaluation consiste en arbre d’algèbre relationnelle.
]

#item("Définission")[Équivalence][
  Deux plans sont dits équivalents si pour une base de données vérifiant les mêmes contraintes, ces deux plans donnent le même résultats.
]

#item("Exemple")[Ces deux plans sont équivalents:][
#align(center, canvas({
  import draw:*
  
  content((0, 2.4), name: "pi1")[$pi_("SNOM")$]
  content((0, 1.6), name: "sel1")[$sigma_("BID = 103")$]
  content((0, 0.7), name: "join1")[$join$]
  content((-1.5, 0), name: "mar1")[MARIN]
  content((1.5, 0), name: "bat1")[BATEAU]
  line("pi1", "sel1")
  line("sel1", "join1")
  line("join1", "mar1")
  line("join1", "bat1")

  content((6, 2.4), name: "sel2")[$sigma_("BID = 103")$]
  content((6, 1.6), name: "pi2")[$pi_("SNOM")$]
  content((6, 0.7), name: "join2")[$join$]
  content((4.5, 0), name: "mar2")[MARIN]
  content((7.5, 0), name: "bat2")[BATEAU]
  line("sel2", "pi2")
  line("pi2", "join2")
  line("join2", "mar2")
  line("join2", "bat2")
}))
]

#dev[
  #item("Remarque")[@DSC][
    On peut optimiser les requêtes en trouvant des formules logiques équivalentes en minimisant une fonction de coût.
  ]
]

#colbreak()

#recap()

#set text(11pt)

===== Programmes
/ Première : Gestion de BDD par un tableau doublement indexé. Lecture csv dans un langage comme python : Indexation, Recherche, Tri, Fusion de tables. 
/ Terminale : SQL : SELECT, FROM, WHERE, JOIN, UPDATE, INSERT, DELETE, DISTINCT, ORDER BY. Base de données relationnelles. SQBD.
/ Prepa : Modèle entité–association. SQL99 maximum. Requête imbriquée.
/ Complémentaire: Création, suppression, modification en SQL. Opérateurs Algèbre Relationnelle : application à l’optimisation de requêtes. Bases de données : calcul relationnel et théorème de Codd.

===== Remarque

- Cette leçon peut suivre un quelconque livre de base de données. Le choix ici (motivé car c'est un choix naturel pour un prof) est de faire un exemple filé qui permet de faire comprendre dans la pratique le langage SQL. En effet tous les programmes accentuent sur le fait que l'apprentissage du SQL doit se faire pas l'axe pratique plutôt que l'analyse théorique du langage. 
- Les développements eux un peu plus haut niveau permettent de montrer sa technicité et sa compréhension fine du SQL.
- Le théorème de Codd demande au calcul relationnel d'être indépendant du domaine, mais cette subtilité est flouté par le caractère admis du théorème et son but pédagogique de montrer le lien entre l'algèbre relationelle et le langage SQL

===== Sources
- @DSC : Complet avec beaucoup de schémas. Bien pour les devs jointure et optimisation de requêtes.
- @TOR : bien SQL résumé, des exemples de code bien. 
- @VACHE : Interessant et complet. Sources possible pour les devs.
- @SCHWARZ : bien et concis pour algèbre relationnelle et première ordre.

#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Paul Adam - Adrien Decosse
]
