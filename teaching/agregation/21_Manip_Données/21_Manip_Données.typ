#import "../../deps.typ": *
#show : tableau

= Stockage et manipulation de données, des fichiers aux bases de données

== Le stockage de masse

=== Généralités sur le stockage

#item("Définition")[La persistance @OSTEP[35]][ (ou non-volatilité) d'une mémoire signifie que les informations stocké dans la mémoire ne disparaissent pas lors d'une mise hors-tension.]

#item("Définition")[Le stockage de masse][@NSIP (ou stockage persistant) est une mémoire non-volatile (NVM) qui permet de stocker de grandes quantités d'informations.]

#item("Remarque")[@OSC[11]][Il existe plusieurs technologies de stockage de masse qui font des compromis différents entre prix, débit, latence et capacité.]

#grid(columns: (40%, 1fr), column-gutter: 1em,
[
#item("Définition")[Un disque dur @OSC[11.1.1]][(ou HDD pour Hard Disk Drive) est composé de plateaux magnétiques qui tournent et d'une tête de lecture et écriture.]

#item("Définition")[@OSC[11.1.1]][Les données d'un disque dur sont stockés sur les plateaux le long de *pistes* et chaque piste est découpé en *secteurs*.]],

[#align(center + horizon, image("schema_hdd.png", width: 230pt))]

)

//#dev[
#item("Remarque")[Ordonnancement des requêtes @OSC[11.2]][
  Il existe plusieurs stratégies pour ordonnancer les requêtes sur un disque dur.
]
//]

#item("Définition")[Un SSD@OSC[11.1.2]][(pour Solid State Drive) utilise de la mémoire flash non volatile fabriquée à partir de transistor.]

#item("Remarque")[@OSC[11.1.2]][Comparé à un HDD, un SSD dispose de plusieurs avantages :
- une résistance aux chocs et vibrations (aucune pièces mobiles)
- une vitesse de lecture et écriture bien supérieure (2 à 100 fois)
- un temps d'accès plus court (10 à 100 fois)
Cependant, la mémoire flash possède aussi des désavantages :
- un coût de fabrication élevé (2 à 3 fois)
- une durée de vie limité en le nombre de réécriture par cellule de la puce mémoire]

=== Interagir avec un périphérique de stockage


#item("Definition")[@OSTEP[36.1]][
  #wrap-content(
    figure(image("device_architecture.png", width: 180pt)),
    [Les périphériques d'entrée-sortie d'un ordinateur sont connecté sur des bus mémoires :
- Les HDD et SSD lent sont connectés au bus E/S périphérique à l'aide de connecteurs SATA (Serial AT Attachment) ou USB (Universal Serial Bus)
- Les SSD rapides utilise le bus E/S général à l'aide d'une interface PCIe (Peripheral Component Interconnect Express).],
    align: top + right
  )
]

#item("Définition")[Interface.@OSTEP[36.2]][Un périphérique de stockage interagit avec le système d'exploitation à l'aide d'une interface composé de 3 registres :
- `Etat` : décrit l'état du périphérique (notamment s'il est occupé),
- `Commande` : indique au périphérique l'action à faire,
- `Données` : permet le transfert de données entre le périphérique et l'OS]

#item("Définition")[Un pilote @OSTEP[36.7]][permet d'encapsuler et abstraire le périphérique. Cela évite au système d'exploitation de connaître les détails d'implémentation du périphérique.]

== Gestion des fichiers

=== L'abstraction des fichiers et répertoires

#item("Définition")[Un fichier @OSTEP[39.1]][est une séquence d'octets que l'on peut lire ou modifier. Chaque fichier possède un nom bas niveau, souvent un nombre, appelé *nombre inode*.]

#item("Définition")[Un répertoire @OSTEP[39.1]][est un fichier qui contient une liste de couple `(nom utilisateur, nombre inode)`. Cela permet donc de ranger d'autres fichiers et répertoires dedans.]

#item("Exemple")[@OSTEP[39.1]][Par exemple si un répertoire contient le fichier `foo` de nombre inode 10, alors la liste du répertoire contient le couple `(foo,10)`.]

#grid(
  columns: (18em, auto), column-gutter: 1em,
  row-gutter: 0.5em,
[#item("Remarque")[@OSTEP[39.1]][En plaçant des répertoires dans d'autres répertoires, on obtient une hiérarchie de répertoires. Cette hiérarchie commence par un *répertoire racine* (pour un système Unix il s'agit de `/`) et descend dans des sous-répertoires.]

#item("Définition")[Un chemin d'accès @OSTEP[39.1]][d'un fichier permet de décrire la position du fichier dans la hiérarchie de répertoire. Il peut être absolu en partant de la racine `/bar/foo/foo.txt` ou relatif `./foo/foo.txt` (en partant de `bar` par exemple).]],
[#set text(size:11pt)
#canvas({
        import draw: *
    
        tree.tree((
          `/`,
          (
            `bar`, 
            `bar.jpg`,
            (
              `foo`,
              `foo.txt`,
            ),
          ),
          `test.x`
        ),
        draw-node: (node, ..) => {
          circle((), radius: 0.6, stroke: black)
          content((), node.content)
        },
        grow: 1,
        spread: 1
        )
    })
]
)

=== Le système de fichier

#item("Définition")[Un système de fichier@OSTEP[Intro 2.4]][ est le logiciel chargé de stocker et gérer de manière efficace et robuste les différents fichiers sur le stockage de masse.]

#dev[
//#item("Exemple")[][_NTFS_, _Ext4_ et _FAT32_ sont différents systèmes de fichier.]
#item("Exemple")[@OSTEP[40]][Le système de fichier _vsfs_ (very simple file system) est un système de fichier simple permettant de présenter les concepts utiles à la conception d’un système de fichier.]
]

#item("Définition")[@OSTEP[40.2]][Le système de fichier divise en général un disque en *blocs*. Ces blocs sont de taille fixe dans la majorité des systèmes de fichier, par exemple 4ko pour _Ext4_.]

#item("Remarque")[@TOR[2.3.1]][
  Les systèmes de fichiers gèrent aussi les *permissions* de lecture, d’écriture et d’exécution des fichiers et répertoires.
]

#item("Définition")[Lien physique@TOR[2.3.1]][
  Comme les noms des fichiers ne sont pas stockés dans les _inodes_, mais dans le répertoire qui le contient, on peut associer plusieurs noms au même fichier. On peut créer ces liens physiques avec la commande `ln`.
]

#item("Définition")[Un lien symbolique@TOR[2.3.1]][
  est un fichier spécial dont le contenu est simplement _un chemin_ vers un autre fichier. On peut créer un lien symbolique en passant l’option `-s` à la commande `ln`.
]


=== Le système d'exploitation

#item("Remarque")[][On se concentre ici sur les systèmes d'exploitation Unix. Des appels systèmes équivalents existent pour d'autres OS.]

#item("Définition")[@OSTEP[39.3]][Pour ouvrir et créer des fichiers, on peut utiliser l'appel système `open` et les fermer avec l'appel `close`.]

#item("Définition")[@OSTEP[39.3]][L'appel système `open` renvoie un *descripteur de fichier*, un entier privé au processus en cours. Cela permet d'abstraire le fichier pour le processus qui passe par des appels `read` et `write` pour lire et modifier le fichier.]

#item("Remarque")[@OSTEP[39.4]][En plus des fichiers du disque, le système d’exploitation met à disposition des fichiers spéciaux comme l’entrée standard `stdin`, la sortie standard `stdout`, la sortie d’erreur `stderr` ou des tubes (pipe).]

#item("Remarque")[@OSTEP[39.11]][Il existe des appels similaire pour les répertoires : `mkdir`, `opendir`, `closedir`, `readdir`.]

#item("Remarque")[][Dans de nombreux langages, ces appels systèmes possèdent des surcouches facilitant leur utilisation. Par exemple en C, la bibliothèque standard propose `fopen`, `fread` et `fwrite`.]

#pagebreak()
== La base de données

#item("Définition")[Une Base de Données@GARD[I.1]][
  est un ensemble de données modélisant les objets d’une partie du monde réel et servant de support à une application informatique.
  
  On doit pouvoir retrouver le sous-ensemble de ces données qui correspond à un certain critère, peu importe le critère.
]

#item("Remarque")[][
  Ces bases de données peuvent être amenées à traiter des *données personnelles*, et font donc l’objet de règlementations telle que le RGPD.
]

=== Les SGBD

#item("Définition")[Un SGBD @GARD[I.1]][(Système de Gestion de Base de Données)
 est un ensemble de logiciels systèmes permettant aux utilisateurs d’insérer, de modifier et de rechercher efficacement des données spécifiques dans une grande masse d’informations partagée par de multiples utilisateurs. 
]


#item("Remarque")[@GARD[I.1]][
  #grid(columns: 2, column-gutter: 1em,
    [
    Un SGBD peut se découper en 3 couches~:
    - L’écriture des données sur disques, gérés par un *système de fichier*.
    - La gestion des données stockées dans les fichiers, c’est le *SGBD interne*.
    ],
    figure(image("couches_sgbd.png", width: 190pt))
  )
  - la mise en forme et l’interface d’accès pour les utilisateurs, c’est le *SGBD externe*.
]

#item("Remarque")[@GARD[II.1]][
  L’accès et la manipulation des données stockés dans un SGBD se fait à l’aide d’un langague unifié de description et de manipulation de données, comme le SQL.
]

/*
=== Modélisation des données

#item("Définition")[Un type d’objet@GARD[Notion II.1]][
  est un ensemble d’objets possédants des caractéristiques similaires et manipulables par des opérations identique.
]

#item("Exemple")[][
  - Le type *Entier*, muni des opérations standards de l’arithmétique, est un type d’objet élémentaire supporté par tous les systèmes.
  - Le type *Film*, possédant les propriétés Titre, Année de sortie, et Durée est un type d’objet composé.
]

#item("Définition")[Une instance d’objet @GARD[Notion II.2]][
  est un élément particulier d’un type d’objet.
]
#item("Exemple")[][
  - 10 est une instance du type Entier
  - Le film ("Léon", 1994, 110) est une instance du type Film.
]
*/



#item("Définition")[Niveaux d’abstraction@GARD[II.2.2]][
  Un SGBD à pour objectif d’abstraire les données stockés sur disque. On distingue 3 niveaux de description de données~:
  - Le niveau *conceptuel*, qui correspond à la structure canonique comprise par les utilisateur. Par exemple, en comprennant les types composé Film et Spéctateur, et l’association Regarde qui relie les deux types à une certaine date.
  - Le niveau *interne*, qui correspond à la représentation sur disque des données
  - Le niveau *externe*, qui correspond à la manière dont les données sont vues dans les programmes d’application. C’est par exemple ici que se trouve les tables SQL.
]

=== Le Modèle Relationnel

#item("Définition")[Le modèle relationnel][
  est un modèle de représentation des bases de données, basés sur des objets complexes (ici, un film), appelés *entités* ou *enregistrements*.
]

#item("Définition")[Une Relation@TOR[11.2.1]][
  est un ensemble de n-uplets, tous de même taille.
]

#item("Exemple")[][
  Représentation tabulaire pour les relations:
  // Il est courant d’utiliser une représentation tabulaire pour les relation~:
  #align(image("table_films.png", width: 60%), center)
]

#item("Définition")[@GARD[II.4]][
  Un SGBD fourni des fonctions des opérations de description, de recherche, de mise à jour et de transformation des données.
]

#item("Définition")[@GARD[VI.4]][
  Le modèle relationnel défini plusieurs opérations ensemblistes sur les relations~: l’union, la différence, le produit cartésien, la projection, la restriction et la jointure.
]

#v(20pt)

#dev[
  #item("Algorithme")[][
    L’opération de jointure permet de composer deux relation à l’aide d’un critère de jointure. Son calcul est une opération pouvant être couteuse, mais aussi très optimisée.
  ]
]

#recap()

= Remarque

- La partie III base de données se concentre vraiment sur la montée en abstraction par rapport aux fichiers, et comment les données sont stoquées et manipuler. On ne détail pas le SQL par exemple, on se content de mentionner son existence.
- La tortue n’est utilisée que pour la définition du modèle relationnel. La partie dédié dans @GARD est très longue et pas très précise, alors que la tortue donne une définition simple avec un exemple tout de suite.

#bibliography(read("../bib.yaml", encoding: none))
#authors[Axel Stengel & Benjamin Voisin]