#import "../../deps.typ": *
#show : tableau

= Architecture d'Internet

== Histoire et enjeux

=== Histoire d'internet @KURO[1.7]

#item("Définition")[][
  Un *réseau* est un ensemble d'appareils interconnectés, pouvant communiquer entre eux.
]

#item("Définition")[ARPAnet][
  est l'un des premiers réseaux, ancêtre d'Internet. Conçu dans les années 1960 aux États-Unis, il permettait initialement la communication entre quatre universités (_UCLA_, le _Standford Research Institute_, _UC Santa Barbara_ et l'université de l'Utah). Il a ensuite été étendu, et a fini par couvrir tous les États-Unis.
]

#item("Définition")[Cyclades][
  est un réseau français concurrent d'ARPAnet, né en 1971.
]

#item("Définition")[Internet][
  (pour _Inter-Network_) est un réseau mondial accessible au public. Il est composé d'un regroupement de millions de sous-réseaux différents.
]

#item("Remarque")[][
  Internet est par nature *décentralisé* : chaque composante (sous-réseau) d'Internet est capable de fonctionner indépendamment. Internet consiste en la liaison de ces composantes.
]

#item("Remarque")[][
  Le premier programme permettant d’utiliser des *emails* est écrit en 1972.
]

#item("Définition")[][
  La *World Wide Web* ou le *Web*, inventé dans les années 1990, permet de partager des ressources sur Internet (texte, image, fichiers, etc.) liées entre elles par des hyper-liens.
]

#item("Remarque")[Démocratisation d'Internet.][
  Dans les années 1990, internet, qui était jusqu'à lors cantonné aux mondes académique et militaire, se démocratise, avec de plus en plus d'utilisations commerciales. Cela inclut par exemple des applications de messagerie instantanée et de partage pair à pair, puis, dans les années 2000, les réseaux sociaux.
]

=== Enjeux actuels d'internet

#item("Enjeu")[économique: @NAN][
  l'économie mondiale actuelle repose largement sur Internet, pour les transactions boursières, informations bancaires ou même achats en ligne.
]

#item("Enjeu")[de sécurité: @RESO[1.8]][
  le caractère personnel ou sensible des données transitant par internet imposent de s'intéresser à leur *confidentialité* (vol de données; détournement des données de leur but premier), leur *disponibilité* (attaques par _déni de service distribué_) et leur *intégrité* (_attaque par intermédiaire_).
]

#item("Définition")[le Règlement Général sur la Protection des Données (RGPD)][
   responsabilise les acteurs amenés à collecter des données, en leur imposant de respecter les droits des internautes, comme le droit à l'oubli.
]

#item("Définition")[Le principe de neutralité du net @RESO[1.8]][
  préconise que les fournisseurs d'accès internet offrent la même qualité de service à types de trafic internet.
]

#item("Enjeu")[de désinformation: @RESO[1.8]][
  Les informations sur internet peuvent se propager très rapidement et provenir d'une très grande diversité de sources, de qualité variable. Il faut faire attention à leur véracité.
]

#item("Enjeu")[écologique @NAN][
  Certains appareils d’Internet sont construits à partir de terres rares, présents en quantité limitée. Ces appareils et les données qu’ils envoient consomment de l’électricité, souvent produite de manière polluante.
]

== Infrastructure d'internet @KURO[1.1.1]

=== Matériel
#item("Définition")[Les liens de communication][
  sont les différents moyens utilisés pour relier des machines entre elles.  
]

#item("Exemple", show-title:false)[Exemples de liens][
  La fibre optique, les câbles éthernet, le WiFi ou la 4G sont des liens de communication.
]

  
#item("Définition")[@KURO[6.4.3, p.525-527] Un nœud de transmission][
  est une machine qui _relaie_ les paquets, pour les acheminer vers leur destination finale.
  On en distingue différents types:
  - Les *commutateurs*, basés sur l’adresse MAC (couche lien)
  - Les *routeurs*, basés sur l'adresse IP (couche réseau)
]

#item("Définition")[Un terminal][
  est une machine connectée au réseau qui n'est pas un nœud de transmission. On distingue:
  - Les terminaux *utilisateur*, tels que les ordinateurs, les téléphones portables, les objets connectés
  - Les *serveurs*, qui proposent des services (par exemple serveur *HTTP* pour le web ou serveurs *IMAP* et *SMTP* pour les mails)
]


=== Organisation 

#item("Définition")[Sous-réseaux et passerelles.][
  Internet est composé de plusieurs *sous-réseaux*, qui sont reliés entre eux par des routeurs qu'on appelle des *passerelles*.
]

#item("Exemple")[Un réseau domestique][
  avec les différents appareils d'un même foyer (ordinateurs, téléphones portables, routeur) connectés à internet est un exemple de *sous-réseau*.  
]

#item("Remarque")[@NAN FAI][
  En général, les routeurs et liens de communication utilisés par les particuliers appartiennent à un *Fournisseur d'Accès Internet*, tel que Orange, Free ou SFR. Le fournisseur d'accès internet de l'Éducation Nationale s'appelle *Renater*.
]

#dev[
  #item("Exemple")[][
    Présenter aux élèves le réseau de leur lycée.
  ]
]

#item("Définition")[@KURO[5.3] Un système autonome][
  est une partie d'internet contrôlée par une seule entité (par exemple un FAI) et ayant reçu un _numéro de système autonome_ auprès de l'ICANN (_Internet Corporation for Assigned Names and Numbers_).
]

== Protocoles d'internet @RESO[1.5]

#item("Définition")[Protocole: @RESO[1.5.2]][
  Un protocole est une convention entre plusieurs parties communicantes définissant le format et la gestion d'un message échangé.
]

#item("Définition")[Modèle en couches: @RESO[1.6.2]][
  Aujourd'hui, la plupart des réseaux sont organisés selon plusieurs couches:
  - couche application: définit les données à échanger
  - couche transport: assure la correspondance des données de l'émetteur au destinataire
  - couche réseau: définit le le chemin et oriente les données
  - couche liaison: s'assure de l'envoi des données à travers une liaison du réseau
]

#item("Remarque")[@RESO[1.6.2]][
  Ce modèle en quatre couches est connu sous le nom de "modèle de référence TCP/IP".
]

#item("Remarque")[@RESO[1.6.1]][
  D'autres modèles existent, comme le modèle OSI, organisé en 7 couches. Cependant, il n'est plus utilisé et le modèle TCP/IP est aujourd'hui le standard.
]

#item("Remarque", show-title:false)[Encapsulation][
  On *encapsule* les données d'un protocole dans celles des protocoles des couches inférieures.
]

#grid(columns: (48%, auto), column-gutter: 1em, [
  #item("Exemple")[][
    En-tête des différents protocoles pour les données HTTP transportés par TCP dans un réseau IP par une liaison Ethernet
  ]
], [
  #align(center)[
  #canvas(
    length: 1em, // remove for previous schemas 
  {
    import draw: *
    
    let space = (3.5, 3, 2.3, 1.5, 3.5).rev()
    let protocole_name = (
      [Données],
      [HTTP],
      [TCP],
      [IP],
      [Ethernet],
    )
    let header_info = (
      [Charge utile],
      [Données TCP],
      [Données IP],
      [Données Ethernet]
    )
    let n = space.len()
    let w_total = space.sum()
    let s = 1.2

    let accu = 0
    for i in range(space.len()).rev() {
      accu += space.at(i)
      rect((0, 0), (accu, 1))
      content((accu - space.at(i) / 2, 0.5), text(12pt, protocole_name.at(n - i - 1)))
      if i != 0 {
        decorations.flat-brace(
          (accu, - n + i + 0.8),(0, - n + i + 0.8),
          outer-curves: 0
        )
      }
      if i != 0 {
        content(
          (accu / 2, - n + i + 0.2),
          text(10pt, header_info.at(n - i - 1))
        )
      }
    }
  })
]
])


// Exemple d'une table un peu compliqué.
// #align(center, table(
//   rows: 4,
//   columns: 10,
//   align: center,
//   fill: (x, y) => if x == 0 { orange },
//   [Première Couche],
//   table.cell(colspan: 2)[Ethernet],
//   table.cell(colspan: 2)[IP],
//   table.cell(colspan: 2)[TCP],
//   table.cell(colspan: 2)[HTTP],
//   [Données],

//   [Deuxième Couche]
// ))



=== Couche réseau @RESO[6]
#item("Définition")[][
    Les machines sont identifiées sur le réseau par une *adresse IP* (pour _Internet Protocol_). Pour la norme *IPv4*, ces adresses font 32 bits.
]

#item("Remarque")[][
    On note en général une adresse IPv4 sous la forme `w.x.y.z`, avec `w`, `x`, `y` et `z` les 4 octets de l'IPv4 en écriture décimale, avec `w` l'octet de poids fort et `z` l'octet de poids faible. 
]

#item("Exemple")[][
  185.26.126.225 est une adresse IPv4.
]

#item("Remarque")[][
    Il existe une version plus récente du protocole IP, IPv6, avec des adresses sur 128-bits.
]

#item("Définition")[][
    Un routeur contient une *table de routage* lui indiquant où il doit envoyer chaque paquet reçu.
]

#item("Remarque")[][
    Il existe deux types de routage interne : le *routage statique*, pour lequel la table de routage est établie manuellement, et le *routage dynamique*, où la table de routage est mise à jour automatiquement, régulièrement, par des protocoles spécifiques.
]

#item("Définition")[][
    Dans les protocoles *à vecteur de distance*,
    chaque routeur ne connaît que sa distance aux autres routeurs.
    C'est le cas du protocole *RIP* (pour _Routing Information Protocol_ en anglais), qui se base sur l'algorithme de Bellman-Ford. 
]

#item("Définition")[][
    Dans les protocoles *à état de liens* chaque routeur
    connaît toute une partie du réseau.
    C'est le cas du protocole *OSPF* (_Open Shortest Path First_)
    qui se base sur l'algorithme de Dijkstra.
]

=== Couche transport @RESO[5]
#item("Définition")[Un port][
    est un numéro permettant d'identifier différents services d'une même machine.
]

#item("Exemple", show-title:false)[ports][
  Le port 25 est utilisé par le protocole SMTP d'envoi de mails, et le port 147 par le protocole IMAP de récupération des mails reçus. Ces deux services s'exécutent sur une même machine.
]

#item("Définition")[La couche transport][
  permet de préciser un numéro de port, et de se prémunir de certaines erreurs de la transmission sur le réseau (perte ou modification des paquets).
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

#let protocole_udp = item("Définition")[Le protocole UDP][
    (_User Datagram Protocol_) permet de préciser des ports source et destination, et repère quand 1 bit du message est erroné.
]
#let protocole_tcp = item("Définition")[@RESO Le protocole TCP][
    offre des garanties en plus par rapport au protocole UDP: il permet de vérifier que tous les paquets ont été reçus, dans le bon ordre.
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
  columns: 2, column-gutter: 1em,
  stack(dir:ttb, spacing: 0.5em,
    protocole_udp,
    dev(protocole_tcp)
  ),
  stack(dir:ttb, spacing: 0.5em,
    tableau_udp,
    tableau_tcp  
  )
)


=== Couche application @RESO[7]
#item("Définition")[Une URL][(pour _Uniform Ressource Locator_ en anglais) permet d'identifier des sur internet. Elle a la forme
#align(center, [`protocole://nom de domaine:port/chemin?options`])
]

#item("Exemple")[L'URL][
  `https://agreg-info.org/faq/` désigne l'utilisation du protocole `HTTPS` pour accéder à la page web `faq/` pour le nom de domaine `agreg-info.org`.
]

#item("Définition")[HTTP][(pour _HyperText Transfer Protocol_) est le protocole permettant de solliciter une page web auprès d'un serveur web, et de recevoir la réponse.]

#item("Définition")[HTTPS][(pour _HTTP Secure_) rajoute une couche de chiffrement *TLS* (_Transport Layer Security_) au protocole HTTP.]

#item("Rappel")[L'architecture client-serveur][
  est celle où un serveur, disponible en permanence, propose
  des ressources, et des clients indépendants peuvent formuler des requêtes au serveur pour accéder aux ressources.
]

#item("Définition")[Le protocole DNS][ (pour _Domain Name Server_) permet de trouver l'adresse IP associée à chaque nom de domaine.
]

#item("Exemple", show-title:false)[Exemple de NS -> IP][
  Le nom de domaine `agreg-info.org` correspond à l'adresse IP `185.26.126.225`.
]

#item("Définition")[Le protocole DHCP][
  Permet d'assigner une adresse IP à une machine nouvellement connectée au réseau.
]




#dev[  
  #item("Exemple")[Récapitulatif de tous les protocoles intervenant dans un accès classique à une page web][]
]



#item("Remarque")[Les architectures pair-à-pair][
  fonctionnent sans serveur centralisé. Un terminal souhaitant récupérer une ressource la récupérera depuis les différents terminaux connectés, et mettra lui-même des ressources à disposition.
]

#item("Exemple")[Bit-torrent][est un exemple
de service internet fonctionnant avec une architecture pair-à-pair.]



#recap()

#set text(12pt)

===== Remarque

- Tortues lycée parlent de OSPF, RIP et HTTPS
- Serait-ce possible de faire ce plan en top-down plutôt que bottom-up ? Qu'est-ce que ça impliquerait ?

===== Éléments de programme
/ Seconde :
+ Repères historiques:
  Dès les années cinquante, les ordinateurs ont été mis en réseau pour échanger des informations, mais de façon très liée aux constructeurs d’ordinateurs ou aux opérateurs téléphoniques. Les réseaux généraux indépendants des constructeurs sont nés aux États-Unis avec ArpaNet (1970) et en France avec Cyclades (1971). Cet effort a culminé avec internet, né en 1983.
+ Client-Serveur
+ TCP/IP
+ IP, DNS, HTTP, NTP

/ Première :
+ Histoire de l'informatique (PREM 1A et Term 1A)
+ PREM5 : IHM, sur le web
  - Page web, éléments graphiques, Formulaires, méthodes
+ PREM6B : Paquets, encapsulation, protocoles, bit alterné,
           archi réseau, topologie locale
  
/ Terminale : 
+ Réseau internet comme exemple de graphes.
+ Histoire de l'informatique (PREM 1A et Term 1A)
+ TERM 4C : protocoles de routages (RIP et OSPF)

/ Prepa : rien.
/ Complémentaire : 
+ Informatique et société.
+ Perfs
+ Routage (Dijsktra, Bellman-Ford)


#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Santiago Sara Bautista - Adrien Decosse
]