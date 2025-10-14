#import "../../deps.typ": *
#show : tableau

= Client-serveur : des sockets TCP aux requêtes HTTP

== Introduction aux réseaux @NSIP

=== Terminologie et généralités @NSIP[Chap 26.1]
#item("Définition")[Un réseau][ est  un ensemble de nœuds ou composants reliés entre eux par des liens.]

#item("Définition")[Un nœud][ ou composant est un équipement informatique (ordinateur, routeur, concentrateur, etc.)]

#item("Définition")[Un lien][est le vecteur de transmission entre nœuds par exemple (câbles de cuivre, fibre optique, liaison satellites, ondes radios, etc.)]

#item("Définition")[Une interface][ est le point de raccordement entre un lien et un nœud. Elle peut être matérielle (carte réseau) ou logicielle (pilote noyau).]

#item("Définition")[Un protocole][ est un ensemble de règles permettant d'établir, mener et terminer une communication entre deux entités.]

=== Modèle en couche @NSIP[Chap 26.2 26.3]

#item("Remarque")[Les réseaux informatiques][sont organisés en niveaux d'abstraction nommés couches, supposés indépendants les uns des autres. Ces organisations sont appelées modèle.]

#grid(columns: (60%, 1fr),
item("Définition")[le modèle OSI][
  #align(center)[
    #set text(size:11pt)
    #table(
      rows: (15pt, ) * 8,
      columns: 4,
      align: center + horizon,
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, top: 0pt))[Nom],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, top: 0pt))[PDU],
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, top: 0pt))[Exemple],
      table.cell(colspan: 1)[Application],
      table.cell(colspan: 1)[Données],
      table.cell(colspan: 2)[HTTP, IMAP, ...],
      table.cell(colspan: 1)[Présentation],
      table.cell(colspan: 1)[Données],
      table.cell(colspan: 2)[TLS, PGP, ...],
      table.cell(colspan: 1)[Session],
      table.cell(colspan: 1)[Données],
      table.cell(colspan: 2)[RTP, NetBIOS],
      table.cell(colspan: 1)[Transport],
      table.cell(colspan: 1)[Segments],
      table.cell(colspan: 2)[TCP, UPD, ...],
      table.cell(colspan: 1)[Réseau],
      table.cell(colspan: 1)[Paquets],
      table.cell(colspan: 2)[IPv4, IPv6, ...],
      table.cell(colspan: 1)[Liaison],
      table.cell(colspan: 1)[Trames],
      table.cell(colspan: 2)[Ethernet, Wifi],
      table.cell(colspan: 1)[Physique],
      table.cell(colspan: 1)[Bits],
      table.cell(colspan: 2)[Ethernet, Wifi],
    )
  ]
],
item("Définition")[le modèle TCP/IP][
  #align(center)[
    #set text(size:11pt)
    #table(
      rows: (15pt, ) * 5,
      columns: 3,
      align: center + horizon,
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, top: 0pt))[Nom],
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, top: 0pt))[Exemple],
      table.cell(colspan: 1)[Application],
      table.cell(colspan: 2)[HTTP, IMAP, ...],
      table.cell(colspan: 1)[Transport],
      table.cell(colspan: 2)[TCP, UPD, ...],
      table.cell(colspan: 1)[Réseau],
      table.cell(colspan: 2)[IPv4, IPv6, ...],
      table.cell(colspan: 1)[Liaison],
      table.cell(colspan: 2)[Ethernet, Wifi],
    )
  ]
]
)

#item("Remarque")[][Chaque couche offre des fonctionnalités que le niveau supérieur peut utiliser. Elle est censée ignorer le contenu des messages qu'elle transmet, on dit qu'elle encapsule ce contenu.]



== Couches liaison et réseau : comment transmettre des paquets.

=== La couche liaison / physique @NSIP[Chap 26.3 p347]

#item("Définition")[La couche liaison][regroupe tous les aspects physiques du réseau. On ne considère alors que les machines directement reliées par la même technologie. On appelle ces réseaux LAN (Local Area Network)]

#item("Exemple")[][Par exemple, un réseau de la couche physique peut être un réseau Wi-Fi ou d'un réseau câblé utilisant le protocole Ethernet.]

#item("Définition")[][Dans un réseau LAN de type Ethernet, chaque interface matérielle possède une adresse propre de 48 bits appelée adresse MAC. On utilise ces adresses pour communiquer entre machines.]

#item("Définition")[Trame Ethernet][
#align(center)[
  #set text(size:11pt)
    #table(
      rows: (15pt, ) * 2,
      columns: 7,
      align: center + horizon,
      table.cell(colspan: 1)[préfixe],
      table.cell(colspan: 2)[adresse destination],
      table.cell(colspan: 1)[adresse source],
      table.cell(colspan: 1)[longueur],
      table.cell(colspan: 1)[données],
      table.cell(colspan: 1)[suffixe],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[8 octets],
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[6 octets],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[6 octets],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[2 octets],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[16 octets],
      
    )
  ]
]


=== La couche réseau dans internet @NSIP[Chap 26.3 p348]

#item("Définition")[La couche réseau][ a pour objectif de relier différents réseaux LAN pour permettre d'envoyer des paquets entre n'importe quelle machine, peu importe le réseau physique.]

#item("Rôles de l'IP")[][
- distribuer des adresses uniques à chaque machine du réseau (IPv4: 32bits, IPv6: 128bits)
- le routage des paquets de proche en proche de la source à la destination
]

#item("Exemple")[][
Il existe divers algorithmes de routages comme RIP ou encore OSPF.
]

#item("Définition")[Paquet IPv4][
  #align(center)[
  #set text(size:11pt)
    #table(
      rows: (15pt, ) * 2,
      columns: 5,
      align: center + horizon,
      table.cell(colspan: 1)[préfixe],
      table.cell(colspan: 2)[adresse IP source],
      table.cell(colspan: 1)[adresse IP destination],
      table.cell(colspan: 1)[données],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[12 octets],
      table.cell(colspan: 2, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[4 octets],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[4 octets],
      table.cell(colspan: 1, stroke: (left: 0pt, right: 0pt, bottom: 0pt))[],
      
    )
  ]
]

//==== Le protocole DNS @NSIP[Chap 26.4 p355] @RESO[Chap 7.1]

#item("Remarque")[][Afin d'éviter de retenir et d'utiliser au quotidien des adresses IP, on 
utilise plutôt des noms de domaines.]

#item("Définition")[Le système de résolution de noms][DNS (Domain Name System), est un protocole de la couche application qui permet d'obtenir une adresse IP à partie d'un nom de domaine comme "agreg-info.org". 
]



== Couche transport : la communication entre ordinateurs.

#item("Remarque")[][
Dans la couche transport, les paquets sont principalement caractérisé par les numéros de ports qui permettent à la machine distance de distribuer le contenu au service associé. 
]

=== Les protocoles UDP et TCP

==== Le protocole UDP @RESO[6.4]

#item("Définition")[Le protocole UDP][pour User Datagram Protocol, est un protocole sans connexion qui permet exclusivement l'émission de paquets entre applications.]

#item("Définition")[En-tête UDP][
#align(center)[
    #set text(size:11pt)
    #table(
      rows: (15pt, ) * 3,
      columns: 6,
      align: center + horizon,
      table.cell(colspan: 3, stroke: (left: 0pt, right: 0pt, top: 0pt))[2 octets],
      table.cell(colspan: 3, stroke: (left: 0pt, right: 0pt, top: 0pt))[2 octets],
      table.cell(colspan: 3)[Port source],
      table.cell(colspan: 3)[Port de destination],
      table.cell(colspan: 3)[Longueur UDP],
      table.cell(colspan: 3)[Total de contrôle UDP],
    )
  ] 
]

#item("Remarque")[][Le protocole UDP ne permet pas de garandir que les données arrivent dans le bon ordre et de manière fiable.]

==== Le protocole TCP @RESO[6.5]

#dev[
#item("Définition")[Le protocole TCP][pour Transmission Control Protocol permet d'envoyer à un programme destination des données de taille arbitraires, dans l'ordre, de détecter les erreurs de transmissions et de retransmettre les données si besoin.]
]

#item("Définition")[Un socket][
est une interface logicielle c'est-à-dire un objet qui représente la connexion entre notre programme et le programe de la machine distante sur le réseau.
]

#item("Appels systèmes")[][
On utilise les appels systèmes suivants :

#grid(columns: (50%, 1fr), [
  - (SERVEUR) socket() 
- (SERVEUR) bind() 
- (SERVEUR) listen()
- (SERVEUR) accept()
- (SERVEUR) close()
], [
- (CLIENT) socket() 
- (CLIENT) connect() 
- (SERVEUR) close()
]
)
]


==== Le protocole QUIC @RESO[6.6.1]

#item("Remarque")[][La simplicité du protocole UDP permet aux applications d'y ajouter leurs propres protocoles.]

#item("Définition")[Le protocole QUIC][pour Quick UDP Internet Connections fonctionne sur UDP, il permet de fusionner les connexions avec un même flux. Cela évite l'établissement de plusieurs connexions en parallèle.] 

=== L'interaction client-serveur

#item("Définition")[Un serveur @NSIT[23]][ est un programme qui fourni un service réseau à *des clients*. On les assimiles parfois à la machine qui exécute le programme.]

#item("Définition")[Le paradigme client-serveur @KURO[2.1.1]][ est un modèle de communication où un serveur central attend et répond à des requêtes de clients. Les différents clients d'un serveur ne communiquent pas directement entre eux.]

#item("Exemple")[@KURO[2.1.1]][Un exemple classique d'architecture client-serveur est le Web : un site web est hébergé par un serveur web qui répond aux requêtes de navigateurs.]

#item("Remarque")[@KURO[2.1.1]][Il existe d'autres types d'interactions de communications comme par exemple le modèle pair-à-pair. Ici il n'y a pas de serveur central, les communications se font directement entre les utilisateurs (appelées pairs).]

#item("Exemple")[@KURO[2.1.1]][Le modèle pair-à-pair est utilisé par exemple dans des applications qui transfert de grande quantités de données comme le partage de fichier (BitTorent) ou les appels vidéo (Skype avant 2012).]

#item("Remarque")[CDN @RESO[1.2.3]][
  Pour palier à la centralisation des ressources dans le modèle client-serveur, les fournisseur de services peuvent faire appel à des CDN (content delivery network).
]

== Couche application : l'exemple du Web

=== Le protocole HTTP @RESO[Chap 7.3.4]

#item("Définition")[URL][pour Uniform Resource Locator est une chaîne de caractère permettant d'accéder un contenu sur internet. La syntaxe simplifiée est "protocole:\/\/nom-ou-adresse/document"]

#item("Remarque")[][Le protocole utilisé dans le Web sera souvent http ou https, la partie nom-ou-adresse le nom de domaine ou l'adresse IP, et le document est le chemin permettant de localiser une ressource.]

#item("Définition")[Le protocole HTTP][pour HyperText Transfer Protocol, est un standard qui défini le format d'encapsulation des messages envoyés entre un navigateur web et le serveur Web. Les messages du client sont appelés requêtes et ceux du serveur réponses.]


#item("Définition")[Le format HTML][pour HyperText Markup Language est un langage de balisage (qui décrit le formatage d'un document) principalement utilisé pour écrire des pages Web statiques (qui ne sont pas modifiées à chaque requêtes).] 


#item("Définition")[Les Méthodes][du protocoles HTTP permettent d'autres opérations que la requête de lecture d'une page, méthode GET. Les plus utilisées sont aussi POST pour l'ajout de contenu à la requête mais aussi PUT pour les requêtes de stockage de page.]

#item("Définition")[][Chaque requête est suivie d'une réponse représentée par un code, par exemple le code 200 pour un Succès et 404 pour une page inexistante.]



#dev[
#item("Exemple")[Accès à une page Web,][
  les différents protocoles et requêtes effectuées.
]
]



=== La sécurité avec HTTPS @NSIT[Chap 24]

#item("Définition")[le protocole HTTPS][pour HyperText Transfer Protocol Secure, est le protocole HTTP auquel on a ajouté une couche de de cryptographie, c'est la combinaison de HTTP sur TLS, en anglais HTTP over TLS.]

#item("Remarque")[][Pour des questions de vie privée, on peut appliquer la même méthode au protocole DNS, avec le DNS over TLS parfois remplacée de manière dissensuelle par DNS over HTTPS.]

//==== Le protocole TLS 

#item("Définition")[Les algorithmes de chiffrements symétrique][utilisent la même clef pour chiffrer et déchiffrer.]

#item("Exemple")[][Les algorithmes AES et ChaCha20 sont considérés comme sûrs et sont efficaces. Mais ils supposent de pouvoir échanger la clef symétrique de façon sûre.]

#item("Remarque")[][On peut utiliser le protocole d'échange de clef Diffie-Hellman pour échanger les clefs, mais cet algorithme est victime le l'attaque par intermédiaire (MITM en anglais).]

#item("Définition")[Les algorithmes de chiffrements asymétriques][sont caractérisés par la présence de deux clefs, l'une pour chiffrer et l'autre pour déchiffrer.]

#item("Exemple")[][RSA est un protocole de chiffrement asymétrique.]

#item("Définition")[][
Un certificat est une preuve d'identité, fournie par un tiers de confiance appelé autorité de certification. 
]

#item("Définition")[Le protocole TLS][ajoute une phase permettant l'authentification du serveur par certificat puis la mise en place de manière sécurisée d'une clef de chiffrement symétrique appelée clé de session.]


#recap()

====== Remarque
- Web server / client @NSIP[29 30]
#bibliography(read("../bib.yaml", encoding: none))