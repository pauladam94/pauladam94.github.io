#import "../../deps.typ": *
#show : tableau

= Échanges de données et routage. Exemples.

== Contexte et modèle par couches

#item("Objectifs généraux")[@RESO[1.5.1] Pour un réseau d'envoi de données][ on peut vouloir:
  - De la *fiabilité*: que les données reçues soient les mêmes que les données envoyées, et dans le même *ordre*. Cela peut nécessiter la *détection* et la *correction* d'erreurs.
  - Une bonne *allocation de ressources*: éviter le
    *gaspillage* de ressources ainsi que la *congestion*
    du réseau.
  - Des *capacités d'évolution* du réseau: faciliter l'ajout de nouveaux *usagers* et de nouveaux *usages*. 
  - Des *garantie de sécurité* telles que la *confidentialité* des données,
    ou la *disponibilité* des services, y compris *tolérance aux pannes*.
]

#item("Définition")[@RESO[2.5.4] La commutation de circuits][
  est une technique d'échange de données qui réserve, en exclusivité, un cheminement des données entre la source et la destination.
]

#item("Exemple", show-title:false)[Réseaux téléphoniques][
  La commutation de circuits a historiquement été très utilisée dans les réseaux
  de téléphonie fixe.
]

#item("Définition")[@RESO[2.5.4] L'envoi de paquets][
  est une alternative à la commutation de circuits,
  où les données à envoyer sont découpées en *paquets*
  de taille prévisible, et le chemin emprunté est déterminé dynamiquement.
  // qui traitent (et envoient) chaque paquet dès qu'ils ont fini de le recevoir.
]

#item("Exemple")[Internet][
  utilise de l'envoi par paquets.
]

#item("Compromis", show-title:false)[Commutation circuits vs envoi paquets][
  La commutation de circuits est plus facilement fiable, mais
  peut présenter un gaspillage de bande passante.
  L'envoi de paquets présente une meilleure tolérance aux pannes,
  ainsi qu'une gestion plus fine de la congestion du réseau.
]

#item("Remarque", show-title:false)[Ici, paquets internet][
  Dans la suite de la leçon, nous ne traiterons que l'envoi de paquets
  dans le cadre d'internet.
]

#item("Définition", show-title:false)[Modèle par couches][ @RESO[1.6.2]
  Pour faciliter la conception et l'implémentation
  d'un réseau d'échange de données,
  ainsi que son adaptabilité à de nouveaux usages,
  on le décrit souvent avec un
  *modèle par couches* qui voit le réseau comme l'interaction entre différents *protocoles* appartenant à différentes *couches*.
  Chaque couche procure des *services* et un niveau
  *d'abstraction* à la couche au dessus. 
]

#item("Définition")[TCP/IP][
  est le modèle par couches le plus répandu.

  #align(center)[
    #table(
      columns: (20.5%, 32%, 24%, 23.5%),
      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt), 
      [*Application*]),
      table.cell(colspan: 3,
      [Services rendus directement aux utilisateurs]),
      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt), 
      [_Exemples_]), [HTTP], [SMTP], [NTP],

      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt) , 
      [*Transport*]),
      table.cell(colspan: 3,
      [Offrir des compromis fiabilité/rapidité]),
      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt), 
      [_Exemples_]), 
      table.cell(colspan: 2, [TCP]), 
      [UDP],

      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt) , 
      [*Internet*]),
      table.cell(colspan: 3,
      [Acheminer les paquets entre source et destination]),
      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt), 
      [_Exemples_]), 
      table.cell(colspan: 3, [IP]), 

      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt) , 
      [*Liaison*]),
      table.cell(colspan: 3,
      [Lien entre deux équipements voisins dans le réseau]),
      table.cell(stroke: (left: 0pt, top: 0pt, bottom: 0pt), 
      [_Exemples_]), 
      [Fibre], [WiFi], [Ethernet]
    )
  ]
  
]

/*
#item("Remarque", show-title:false)["Réseau" vs "Internet"][
  Dans la suite on appellera couche *réseau* la couche *internet*
  du modèle TCP/IP.
]
*/

== Échanger des données: la couche transport

#item("Définition")[Les numéro de port][
  sont des identifiants permettant de distinguer différents services et différentes connexions au sein d'une même machine (e.g. SMTP et IMAP pour serveur mail).
]

#item("Définition")[Les protocoles de la couche transport][
  fournissent l'abstraction des numéros de port.
  Il existe deux protocole possibles pour cette couche, qui offrent différents compromis entre services rendus, rapidité et simplicité d'utilisation:
  - le protocole *TCP* pour  _Transmission Control Protocol_
  - et le protocole *UDP* pour _User Datagram Protocol_.
  /*  
  peuvent participer aux garanties de fiabilité et tolérance aux pannes du réseau, ainsi que participer de l'allocation de ressources du réseau.
  Cependant, les différents protocoles de cette couche n'offrent pas les mêmes garanties: il y a un compromis entre garanties, simplicité et rapidité, laissé
  à l'appréciation des développeurs.
  Les principaux protocoles de cette couche sont  et 
  TCP offre plus de garanties que UDP; tandis que UDP est plus simple et plus rapide.
  */
]

#let tableau_udp = align(center, table(
  rows: (16pt, ) * 4,
  columns: 2,
  align: center + horizon,
  table.cell(stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
  table.cell(stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
  [port source],
  [port destination],
  [taille],
  [checksum],
  table.cell(colspan: 2)[données]
))

#let protocole_udp = item("Définition")[@RESO[6.4.1]Le protocole UDP][
    repère quand 1 bit du message est erroné ou quand le message est tronqué, mais ne corrige pas l'erreur. Il est rapide et simple à utiliser.
]
#let protocole_tcp = item("Définition")[@RESO[6.5.4]Le protocole TCP][
    offre des garanties en plus par rapport au protocole UDP: il permet de vérifier que tous les paquets ont été reçus, dans le bon ordre.
    De plus, il adapte de le débit dynamiquement, pour éviter la congestion à la fois à la destination et dans le réseau.
]
#let tableau_tcp = table(
  rows: (15pt, ) * 8,
  columns: 2,
  align: center + horizon,
  table.cell(stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
  table.vline(),
  table.cell(stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
  [port source],
  [port destination],
  table.cell(colspan: 2)[numéro de séquence],
  table.cell(colspan: 2)[numéro d'acquittement],
  [taille],
  [fenêtre],
  [checksum],
  [pointeur urgent],
  table.cell(colspan: 2)[options],
  table.cell(colspan: 2)[données]
)


#grid(
  columns: 2,
  column-gutter: 1em,
  protocole_udp, tableau_udp
)


#item("Exemple", show-title:false)[Streaming en UDP][
  Historiquement, les services de *vidéo en streaming*
  privilégiaient la rapidité de transmission par dessus la fiabilité
  de la transmission;
  // quitte à réimplémenter côté applicatif la détection d'erreurs et leur mitigation (extrapolation des données perdues, baisse de résolution, ...).
  Ces services utilisaient donc le protocole UDP.
]


#dev[
  #grid(
  columns: 2,
  column-gutter: 1em,
  protocole_tcp, tableau_tcp
)
]

#item("Exemple")[Pour l'affichage d'une page web][
  il est important que les différents parties du document HTML soient dans le bon ordre: on a besoin de garanties de fiabilité de la transmission.
  Le protocole HTTP utilise donc le plus souvent TCP.
]


/*
#grid(
  columns: 2, column-gutter: 1em,
  stack(dir:ttb, spacing: 0.5em,
    protocole_udp,
    protocole_tcp
  ),
  stack(dir:ttb, spacing: 0.5em,
    tableau_udp,
    tableau_tcp  
  )
)
*/

== Routage des paquets: la couche internet

#item("Définition")[Un routeur][ @RESO[5.1.1]
  est un équipement réseau avec plusieurs interfaces réseau (connecté donc à plusieurs autres routeurs ou machines), qui reçoit et transmet des paquets.
  // Il opère en *mode différé* (_store and forward_ en anglais): il attend d'avoir entièrement reçu un paquet avant de commencer à le transmettre au routeur suivant.
]

#item("Problème")[Routage.][Pour chaque paquet, un routeur doit décider vers laquelle de ces interfaces réseau l'envoyer.]

#item("Définition")[La couche internet][
  est celle qui s'assure pour un paquet donné, qu'il soit acheminé
  de sa source vers sa destination.
]

#item("Définition")[Le protocole IP,][
  pour _Internet Protocol_, est utilisé par la
  couche internet. Il utilise des addresses IP qui identifient l'émetteur et le destinataire d'un paquet; ainsi qu'une _durée de vie_ qui contribue à limiter la congestion du réseau.
  //en cas de pannes ou d'erreurs de configuration.
]

#item("Remarque", show-title:false)[IPv4 vs IPv6][
  Il existe deux types d'adresses IP couramment utilisées:
  - Les adresses IPv4  en 4 octets (32 bits), 
    sous la forme aaa.bbb.ccc.ddd où aaa ... ddd sont les octets, notés en décimal. Leur nombre s'est avéré insufisant
    //pour le nombre d'appareils actuellement connectés à internet 
    (dernières adresses IPv4 distribuées en 2019).
  - Les adresses IPv6 en 16 octets (128 bits)
    notés sous la forme aaaa:bbbb:cccc:dddd:eeee:ffff:gggg:hhhh, où chacun des aaaa ... hhhh correspond à 2 octets, notés en hexadécimal.
]

/*
#item("Problème")[@RESO[5.7.3]Pénurie d'adresse][
  Les adresses IP étant initialement pensées pour les universitaires, leur nombre n'est pas adapté à leur utilisation actuelle. Ainsi, les dernières adresses IP ont été distribuées en 2019. C'est pourquoi la version actuellement utilisée est maintenant la version 6.
]

#item("Définition")[@RESO[5.7.3]En-tête IPv6][
  TODO: les adresses ne peuvent pas tenir sur 32 bits en IPv6
  #align(center)[
    #table(
      rows: (15pt, ) * 5,
      columns: 8,
      align: center + horizon,
      table.cell(colspan: 4, stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
      table.cell(colspan: 4, stroke: (left: 1pt, right: 0pt, top: 0pt))[16 bits],
      table.cell(colspan: 1)[version],
      table.cell(colspan: 1)[services diff],
      table.cell(colspan: 1, stroke: (left: 1pt, right: 0pt, top: 1pt))[\_\_\_],
      table.cell(colspan: 5)[étiquette de flux],
      table.cell(colspan: 4)[longueur des données],
      table.cell(colspan: 2)[prochain entête],
      table.cell(colspan: 2)[limite de sauts],
      table.cell(colspan: 8)[adresse source],
      table.cell(colspan: 8)[adresse de destination]
    )
  ]
]
*/

#item("Définition")[@RESO[5.7.1]En-tête IPv4][
  
  
  #align(center)[
    #table(
      rows: (15pt, ) * 7,
      columns: 4,
      align: center + horizon,
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, top: 0pt))[16 bits],
      table.cell(colspan: 2)[Version, LET, ...],
      table.cell(colspan: 2)[Longueur totale],
      table.cell(colspan: 2)[identification],
      table.cell(colspan: 2)[position fragment],
      [durée de vie],
      [protocole],
      table.cell(colspan: 2)[checksum de l'entête],
      table.cell(colspan: 4)[adresse source],
      table.cell(colspan: 4)[adresse de destination],
      table.cell(colspan: 4)[options],
    )
  ]
]

#item("Remarque")[@RESO[5.7.2] Les adresses IP sont hiérarchiques:][
  un réseau correspond à une plage d'adresses avec un préfixe commun.
  Un administrateur réseau peut décomposer une telle plage en plusieurs plages plus petites. Cet aspect hiérarchique participe à l'adaptabilité du réseau, car il permet de déléguer et décentraliser la gestion des adresses IP.
]
/*
#item("Définition")[@RESO[5.7.2]][
  Contrairement aux adresses Ethernet, les adresses IP correspondent à une hiérarchie. Ainsi, une adresse IP est composée d'une partie réseau et d'une partie hôte. De fait, deux appareil sur un même réseau possèdent le même préffixe.
]
*/

#item("Remarque")[Les adresses IP suivent un principe topologique:][
  deux machines proches dans le réseau doivent avoir des adresses proches
  (au sens lexicographique).
]


=== Le plan des données

#item("Remarque", show-title:false)[Routage par préfixe][
  Les aspects hiérarchique et topologique des adresses IP, permettent aux routeurs de procéder à un *routage par préfixes* où les routeurs disposent de *tables de routage* leur indiquant vers où diriger les paquets en fonction de différents préfixes possibles de l'adresse de destination.
]

#item("Définition")[@RESO[5.6.1] Le plan des données][
  est la partie du routeur qui exécute le protocole IP,
  en suivant une logique (telle que des tables de routage)
  _déjà établie au préalable_.
]


#item("Exemple")[Une table de routage][
  peut ressembler à
  #align(center,
  table(
    columns: 2,
    table.cell(stroke: (left: 0pt, top: 0pt),  [Préfixe]),
    table.cell(stroke: (right: 0pt, top: 0pt), [Interface]),
    table.cell(stroke: (left: 0pt), [185.26.126.0/23]),
    table.cell(stroke: (right: 0pt), [1]),
    table.cell(stroke: (left: 0pt), [151.80.16.0/20]),
    table.cell(stroke: (right: 0pt), [2]),
    table.cell(stroke: (left: 0pt, bottom: 0pt), [Autres]),
    table.cell(stroke: (right: 0pt, bottom: 0pt), [3])
  )
  )
  Où 185.26.126.0/23 correspond aux adresses dont les 23 premiers bits coïncident avec ceux de 185.26.126.0.
]

#item("Exemple", show-title: false)[Routage d'un paquet][
  Avec la table précédente, un paquet destiné à 185.26.126.225 serait envoyé sur l'interface 1.
]


/*
==== Redirection de port

#item("Définition")[@KURO[4.1.1] La redirection de port,][
  ou _forwarding_ en anglais, consiste en la transmission d'un paquet par une interface routeur vers une autre interface de destination. L'élément clef de ce processus est l'utilisation d'une table de routage qui, selon l'adresse IP de destination, permet de d'assigner la bonne interface.
  TODO: parler d'avantage de la partie port du forwarding
]
*/

=== Le plan de contrôle

#item("Définition")[@RESO[5.6.1]Plan de contrôle][
  Le plan de contrôle est la partie de l'architecture d'un routeur qui définit la topologie d'un réseau, sa logique et décide comment retransmettre les données, par exemple en définissant
  et en emplissant les table de routage.
  Il peut utiliser des protocoles tels que RIP ou OSPF. 
]

==== Algortihme de routage

#dev[
  #item("Définition")[@RESO[5.7.6]OSPF (Open Shortest Path  First)][
    Il s'agit d'un protocole inter-domaine répondant à diverses exigences comme par exemple:
    - Supporter une variété de distance métrique
    - Être dynamique
    - Équilibrer les charges
    - etc...
  ]
]

==== Commandes système @NSIT[23.3]

#item("Remarque")[][
  Sous les systèmes Unix, diverses commandes permettent d'afficher et de modifier la configuration réseau de la machine. Tous les réseaux n'étant pas forcément gérés par RIP ou OSPF, il est en effet possible de procéder à des configurations manuelles. On parle alors de *routage statique*.
]

#item("Commande")[@MAN La commande `ip`,][
  qui fait partie de Linux, permet d'afficher des informations sur différents périphériques. Par exemple:
  - *ip addr* affiche les adresses assignées aux interfaces réseau
  - *ip route* affiche la table de routage
]

// les paquets tests sont des ICMP
#item("Commande")[@NSIT[23.3] La commande `ping`][
  permet de mesurer le temps d'aller-retour vers une machine cible.
  Elle procède par l'envoi d'un paquet test.
]

#item("Commande")[@NSIT[23.3] La commande `traceroute`][
  permet de déterminer la route empruntée par un paquet IP pour atteindre la machine cible.
]

==== Performance réseau @RESO[6.7]

// Normalement la notion de congestion aura été abordée tout au long de la leçon
/*
#item("Problème")[@RESO[6.7.1]Congestion][
  Si brusquement, un routeur reçoit plus de trafic qu'il ne peut en écouler, une congestion se produit. S'entraînent alors des retards voire des pertes de données. Il existe cependant plusieurs méthode pour mesurer et traiter ces cas.
]
*/

#item("Définition")[Le débit][
  est la quantité de données qui peuvent être envoyées
  ou reçues dans un intervalle de temps donné.
  Il est principalement influencé par la capacité des
  fils (et autres liaisons) dans le réseau.
  Il se mesure en mégabits par seconde.
]

#item("Définition")[La latence][
  est le temps d'attente nécessaire pour la réception de données.
  Elle est influencée par la distance que doit parcourir le signal.
  Elle se mesure en millisecondes.
]

#item("Définition")[La qualité d'expérience utilisateur][
  est une mesure de satisfaction de l'utilisateur vis-à-vis de
  la connexion internet.
]

#item("Remarque", show-title:false)[Exigences utilisateur variables][
  Les besoin en terme de débit et de latence (et de leur dérivées) peuvent beaucoup varier d'un usage à l'autre.
  D'où l'utilité de mesurer une qualité d'expérience en plus de mesurer
  le débit et la latence.
]

#item("Exemple")[Lors de streaming vidéo][
  les utilisateurs souhaitent un débit élevé, mais
  tolèrent une certaine latence, pourvu qu'elle soit constante.
  // Ceci a permis par exemple le développement d'offres de télévision satellitaire.
  /*  
  Par exemple, les connexions internet reposant sur des liaisons satellitaires offrent en général un débit élevé mais également une latence de quelques secondes. Ce qui n'a pas été un obstacle au développement d'offres de télévision satellitaire.
  */
]

#item("Exemple")[Lors d'appels vocaux][
  (par exemple en "voix sur IP"),
  les utilisateurs souhaitent une latence très faible,
  mais ne requièrent pas nécessairement d'un débit très élevé.
]

/*
#item("Définition")[@RESO[6.7.3]Mesure du débit][
  Habituellement, dans le but de mesurer le débit d'un réseau est de le surcharger de donnée et de mesurer le temps moyen de réponse.
]

#item("Définition")[@RESO[6.7.4]Mesure de la qualité][
  Un autre critère très important est la qualité. Par exemple, pour un flux vidéo, le débit n'est souvent plus le problème, mais plutôt la fréquence de rechargement, la résolution etc... Il s'agira donc de mesurer la qualité sous le spectre de l'expérience utilisateur.
]
*/

#recap()

===== Remarques générales
- Nous avons choisi d'utiliser essentiellement le @RESO
  car il est en français et épargne donc l'étape de traduction.
  Une autre très bonne référence pour cette leçon est bien sûr
  le @KURO.
- Le @RESO parle de "commutation de paquets". Nous préférons parler de "envoi de paquets".
- Le @RESO parle de "couche réseau" plutôt que de "couche internet".
  C'est un choix qu'on approuve, mais qui ne correspond pas
  _strictu sensu_ au modèle TCP/IP, qui est au programme complémentaire
  (et au programme de seconde ?).
- À la question "Citer un exemple de protocole pour la fibre optique" on peut répondre "SONET" @RESO[1.6.2]. De même, WiFi -> 802.11 .

#bibliography(read("../bib.yaml", encoding: none))
