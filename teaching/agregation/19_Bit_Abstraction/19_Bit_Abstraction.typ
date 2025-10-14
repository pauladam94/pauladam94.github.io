#import "../../deps.typ" : *
#show : tableau

// #set item(show-title: false)

= Mémoire : du bit à l'abstraction vue par les processus

#item("Motivation")[][
  Comprendre comment le matériel stocke l'information et la manipule.
]

== @CSAPP Stockage de l'information dans le matériel

=== Du matériel au bit

#item("Définition")[Bit][
  Un ordinateur utilise des données binaires, puisque les circuits logiques utilisés ne possèdent que deux états : alimenté ou non-alimenté. On appelle *bit* un chiffre binaire (de valeur 0 ou 1) représentant l’absence ou la présence de courant.
]

#item("Définition")[Octet][
  En général, dans un ordinateur les informations sont stockés par séquences de 8-bits, appelées *octets* (byte en anglais).
]

#item("Définition")[Hiérarchie mémoire][
  Un ordinateur actuel utilise plusieurs types de mémoire :
  - La *mémoire secondaire* (disque dur, SSD, ...) contient la majorité des données stockées dans l'ordinateur, elle est lente mais peu chère et efficace en place.
  - La *mémoire vive* (RAM en anglais pour Random Access Memory) contient les données actuellement en utilisation ainsi que les programmes en cours exécution. Elle s'efface une fois l'ordinateur éteint.
  - Le *cache* (L1, L2 ou L3 selon la vitesse) contient les informations les plus utilisées de la mémoire vive. Il est bien plus rapide que la mémoire et se trouve sur la puce du processeur.
  - Les *registres* stockent de l'information directement dans le processeur entre chaque opérations, ils sont très rapides et directement adressables par le processeur mais ne contiennent que très peu d'information (en général 4 à 8 octets chacun).
]

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 7
  let h = -0.8

  //triangle
  line((-w/2, 0), (0, 6*h))
  line((w/2, 0), (0, 6*h))
  line((-w/2, 0), (w/2, 0))

  //each roof
  line((-w/2*5/6, 1*h), (w/2*5/6, 1*h))
  line((-w/2*4/6, 2*h), (w/2*4/6, 2*h))
  line((-w/2*3/6, 3*h), (w/2*3/6, 3*h))
  line((-w/2*2/6, 4*h), (w/2*2/6, 4*h))
  line((-w/2*1/6, 5*h), (w/2*1/6, 5*h))

  //each name
  content((0, h*(1-1/2)), text(black, size: 15pt)[Mémoire secondaire])
  content((0, h*(2-1/2)), text(black, size: 15pt)[Mémoire vive])
  content((0, h*(3-1/2)), text(black, size: 15pt)[L3])
  content((0, h*(4-1/2)), text(black, size: 15pt)[L2])
  content((0, h*(5-1/2)), text(black, size: 15pt)[L1])

  //particular case of "registres"
  content((-3, h*(7-1/2)), text(black, size: 15pt)[Registres])
  line((-1.8, h*(7-1/2)), (0, h*(6-1/2)), mark: (end: ">"))
    
  let e = 0.4
  let offset = 0.5 // °o° >_<
  let vx = -abs(h)*6/sqrt(36*h*h+w*w/4)
  let vy = w/2/sqrt(36*h*h+w*w/4)*h/abs(h)

  //left categories
  line((-w/2*6/6 + vx*offset, 0*h + vy*offset), (-w/2*6/6 + vx*(e+offset), 0*h + vy*(e+offset)))
  line((-w/2*5/6 + vx*offset, 1*h + vy*offset), (-w/2*5/6 + vx*(e+offset), 1*h + vy*(e+offset)))
  line((-w/2*4/6 + vx*offset, 2*h + vy*offset), (-w/2*4/6 + vx*(e+offset), 2*h + vy*(e+offset)))
  // line((-w/2*3/6 + vx*offset, 3*h + vy*offset), (-w/2*3/6 + vx*(e+offset), 3*h + vy*(e+offset)))
  // line((-w/2*2/6 + vx*offset, 4*h + vy*offset), (-w/2*2/6 + vx*(e+offset), 4*h + vy*(e+offset)))
  line((-w/2*1/6 + vx*offset, 5*h + vy*offset), (-w/2*1/6 + vx*(e+offset), 5*h + vy*(e+offset)))
  // line((-w/2*0/6 + vx*offset, 6*h + vy*offset), (-w/2*0/6 + vx*(e+offset), 6*h + vy*(e+offset)))
  line((-w/2*6/6 + vx*(e+offset), 0*h + vy*(e+offset)), (-w/2*1/6 + vx*(e+offset), 5*h + vy*(e+offset)))

  content((-w/2*6/6 + vx*(e+offset) - 1.2, (1-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[HDD, SDD])
  content((-w/2*5/6 + vx*(e+offset) - 0.7, (2-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[DRAM])
  content((-w/2*3/6 + vx*(e+offset) - 0.6, (4-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[SRAM])

  //right categories
  line((w/2*6/6 - vx*offset, 0*h + vy*offset), (w/2*6/6 - vx*(e+offset), 0*h + vy*(e+offset)))
  line((w/2*5/6 - vx*offset, 1*h + vy*offset), (w/2*5/6 - vx*(e+offset), 1*h + vy*(e+offset)))
  line((w/2*4/6 - vx*offset, 2*h + vy*offset), (w/2*4/6 - vx*(e+offset), 2*h + vy*(e+offset)))
  // line((w/2*3/6 - vx*offset, 3*h + vy*offset), (w/2*3/6 - vx*(e+offset), 3*h + vy*(e+offset)))
  // line((w/2*2/6 - vx*offset, 4*h + vy*offset), (w/2*2/6 - vx*(e+offset), 4*h + vy*(e+offset)))
  line((w/2*1/6 - vx*offset, 5*h + vy*offset), (w/2*1/6 - vx*(e+offset), 5*h + vy*(e+offset)))
  line((w/2*0/6 - vx*offset, 6*h + vy*offset), (w/2*0/6 - vx*(e+offset), 6*h + vy*(e+offset)))
  line((w/2*6/6 - vx*(e+offset), 0*h + vy*(e+offset)), (w/2*0/6 - vx*(e+offset), 6*h + vy*(e+offset)))

  content((w/2*6/6 - vx*(e+offset) + 0.8, (1-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[5-100ms])
  content((w/2*5/6 - vx*(e+offset) + 0.5, (2-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[100ns])
  content((w/2*3/6 - vx*(e+offset) + 0.6, (4-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[10ns])
  content((w/2*1/6 - vx*(e+offset) + 0.6, (6-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[1ns])

  //titles
  content((-w/2-1.5, -h*0.8+4.1*h*(1+h/abs(h))), text(black, size: 20pt)[Technologie])
  content((w/2+1.5, -h*0.8+4.1*h*(1+h/abs(h))), text(black, size: 20pt)[Temps d'accès])
})
]

#item("Définition")[Mémoire vive dynamique][
  Dans nos ordinateurs actuels, la mémoire vive utilisée est appelée DRAM, pour *mémoire vive dynamique* (Dynamic Random Access Memory). Physiquement, pour chaque bit, la DRAM comporte un condensateur et un transistor. Cette mémoire est donc dynamique car la charge des condensateurs doit être rafraîchie.
]

#item("Définition")[Adresse physique][
  On accède à la mémoire vive en utilisant une *adresse physique*, indice de la case mémoire (de 8 bits) à laquelle lire/écrire.
]

#item("Définition")[Boutisme][
  Lorsque l'on accède à une séquence d'octet contiguë en mémoire, il existe deux conventions pour l'ordre d'adressage :
  - le *petit-boutisme*, les octets de poids faible en premier
  - le *grand-boutisme*, les octets de poids fort en premier
]

#item("Remarque", show-title:false)[atoi][
  La plupart des processeurs modernes sont petit-boutistes, mais la convention pour les échanges en réseau est le gros-boutisme.
]

=== Du bit à la donnée

#item("Définition")[Entiers non signés][
  Les entiers positifs (ou non signé) sont codés par leur représentation en base 2 : $b_0b_1...b_k$ représente l'entier $n = sum_(i=0)^k b_(k-i) 2^i$.
]

#item("Définition")[Entiers signés][
  Les entiers signés sont codés par leur représentation en base 2 avec complément à $2^k$: $b_0b_1...b_k$ représente l'entier $n = -b_0 2^k + sum_(i=1)^k b_(k-i) 2^i$.
]

#item("Exemple")[1110][
  interprété comme un entier signé sur 4 bits vaut $-2^3+2^2+2^1=-2$.
]

#item("Remarque", show-title:false)[sizeof][
  En pratique, le nombre de bit disponibles pour coder une donnée est fini et dépend du type de la donnée.
]

#item("Exemple")[Pour les entiers en C:][
#align(center, table(
  columns: 3,
  [Signés], [Non signés], [Nombre d'octets],
  [short], [unsigned short], [2],
  [int], [unsigned int], [4],
  [long int], [unsigned long int], [4 ou 8]
))
]

#dev[
#item("Définition", show-title:false)[flottants][
  En pratique, les réels sont approximés par des flottants, dont le format utilisé est généralement celui décrit par la convention IEEE-754, où un flottant $f$ est de la forme $f=(-1)^s*m*2^e$ avec : $s in {0, 1}$, $m in [1, 2[$, $e in ZZ$.
  Un flottant est alors la donnée $(s, e, m)$.
]
]

#item("Remarque")[Représentation des caractères][
  Il n'y a aucun consensus pour la représentation des caractères, et plusieurs conventions sont possibles : ASCII, Unicode, ISO-8859-1 etc...
]

#item("Exemple", show-title:false)[ASCII en C][
  En C, le type char utilise la convention ASCII dont la représentation tient sur 1 octet.
]

#item("Définition", show-title:false)[Instructions machine][
  Les programmes sont représenté par des *instructions machine* qui sont définie par un *jeu d'instruction*.
]

#item("Exemple", show-title:false)[Exemples d'ISAs][
  RISC-V, MIPS et x86 sont des jeux d'instructions.
]

#item("Définition")[L'assembleur][
   est le programme qui traduit le *langage d'assemblage* (texte lisible par les humains) en instructions machines.
]

== Point de vue d'un processus@OSC

=== Organisation mémoire d'un processus

#item("Définition", show-title:false)[Pile, tas, code][
  L'espace d'adressage d'un processus est découpé en plusieurs parties :
  - La *pile* contient les variables locales et les données nécessaires aux appel de fonction. Elle grandit par adresses décroissantes.
  - Le *tas* contient les variables globales et les données alloué par le programme (comme avec `malloc` en C). Il grandit par adresses croissantes.
  - Le *code* contient le code machine du programme exécuté.
]

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 12
  let h = -0.5

  
  //body
  line((-w/2, 1*h), (w/2, 1*h))
  line((-w/2, -1*h), (w/2, -1*h))
  line((-w*0.45,h),(-w*0.45,-h))
  line((-w*0.30,h),(-w*0.30,-h))
  line((-w*0.1,h),(-w*0.1,-h))
  line((w*0.45,h),(w*0.45,-h))
  line((w*0.25,h),(w*0.25,-h))

  // legend
  content((0,1.5*h), text(black, size: 15pt)[adresses croissantes])
  line((-w/2, 1.5*h), (-w*0.2, 1.5*h))
  line((w*0.2, 1.5*h), (w/2, 1.5*h), mark: (end: ">"))

  //each name
  content((-w*0.375,0), text(black, size: 15pt)[Code])
  content((-w*0.2,0), text(black, size: 15pt)[Tas])
  line((-w*0.1, 0), (0, 0), mark: (end: ">"))
  content((w*0.35,0), text(black, size: 15pt)[Pile])
  line((w*0.25, 0), (w*0.15, 0), mark: (end: ">"))

})
]

=== Utilisation de la mémoire en C

#item("Définition")[Un pointeur][
  est une variable qui contient l'adresse d'une donnée plutôt qu'une donnée elle-même. La taille des pointeur ne dépend que de l'architecture. Par exemple, les données de type *short\** et *long int\** ont la même taille.
]

#item("Remarque", show-title:false)[.data vs pile][
  - Les variables globales sont attribuées dans le .data
  - Les variables locales sont attribuées dans la pile
]

#item("Remarque", show-title:false)[Arithmétique des pointeurs][
  Il est possible d'opérer sur des pointeurs pour obtenir des adresses différentes:
  ```c
  int *ptr1;
  int *ptr2 = ptr1 + 1; // adresse suivante
  int *ptr3 = &(ptr1[1]) // équivalent à ptr + 1
  ```
]

#item("Remarque", show-title:false)[Erreur de ségmentation][
  En pratique, les adresses sont protégées : si un processus essaye d'accéder à une adresse sans autorisation, une exception est alors levée (erreur de segmentation). Ces autorisations sont indiquées dans une table associée au processus.
]

#item("Remarque", show-title:false)[tableaux][
  En C, il existe des outils comme les tableaux (pointeur) permettant à l'utilisateur d'organiser la mémoire de son programme.
]

#item("Définition", show-title:false)[malloc, free][
  Certains appels systèmes permettent de manipuler de la mémoire:
  - *malloc* permet d'allouer de la mémoire dans le tas
  - *free* permet de libérer cette mémoire
]

#item("Exemple", show-title:false)[malloc, free][
  Par exemple, ce programme alloue, manipule et libère de la mémoire dans le tas:
  ```c
  int *tab = malloc(size * sizeof(int)); // alloue un tableau d'entier de taille 'size'
  tab[0] = 1; // manipulation de tab
  free(tab); // libère la mémoire
  ```
]

#dev[
#item("Remarque")[Politique d'allocation dans le tas @MOS[3.2.3]][
 Allouer de la mémoire dans le tas peut faire l'objet de plusieurs politiques pour minimiser la place perdue.
]
]

#item("Exemple")[FIRST-FIT][
  Exemple l'allocation pour cette stratégie:
  ```c
  char *tab1 = malloc(3); // A       Tas : [A|A|A| | | | | | ]
  char *tab2 = malloc(4); // B       Tas : [A|A|A|B|B|B|B| | ]
  free(tab1);             // C       Tas : [ | | |B|B|B|B| | ]
  char *tab3 = malloc(2); // D       Tas : [D|D| |B|B|B|B| | ]
  ```
]


=== Adressage virtuel

#item("Définition")[Adressage virtuel][
  Un processus n'a pas un accès direct à l'espace d'adééressage de la mémoire physique, il interagit avec la mémoire de manière indirecte avec l'illusion d'une mémoire monolithique de grande taille. Cette abstraction est possible grâce à l’*adressage virtuel*, qui offre aux processus un espace d’adressage (dit virtuel ou logique) qui est associé à un autre espace mémoire (dit réel ou physique) stocké dans les mémoires principale et secondaire.
]

#item("Remarque", show-title:false)[Taille mémoire virtuelle][
  La taille de l'espace d'adressage virtuel varie en fonction de l'architecture : $2^32$ ou $2^64$ selon si l'architecture est en 32 bits ou en 64 bits.
]

#item("Définition")[Page][
  Les espaces d'adressage sont découpés en *pages* d'adresse consécutives et de taille fixe. Sur Linux, les pages mémoires font 4ko.
]

#item("Remarque", show-title:false)[Intérêts mémoire virtuelle][
  L’adressage virtuel permet d’isoler les espaces mémoire des processus, d’offrir l’illusion d’une mémoire simple et très grande, et d’accéder malgré tout rapidement aux pages dans la plupart des cas.
]

#item("Définition")[MMU et TPV][
  Les adresses virtuelles sont converties en adresses physiques par l'*Unité de Gestion de Mémoire* (MMU ou Memory Managment Unit en anglais) à l'aide de la *Table des Pages Virtuelles* (TPV). Chaque processus possède une TPV qui lui est associé.
]

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 12
  let h = 0.5

  //RAM
  line((-w/8, 10*h), (w/8, 10*h))
  line((-w/8, 9*h), (w/8, 9*h))
  line((-w/8, 8*h), (w/8, 8*h))
  line((-w/8, 7*h), (w/8, 7*h))
  line((-w/8, 6*h), (w/8, 6*h))
  line((-w/8, 5*h), (w/8, 5*h))
  line((-w/8, 4*h), (w/8, 4*h))
  line((-w/8, 10*h), (-w/8, 4*h))
  line((w/8, 10*h), (w/8, 4*h))
  content((0,10.5*h), text(black, size: 11pt)[Mémoire vive])

  //HDD
  let hh = -2
  bezier((-w/8,(hh + 4)*h),(w/8,(hh + 4)*h),(-w/8,(hh + 5)*h),(w/8,(hh + 5)*h))
  bezier((-w/8,(hh + 4)*h),(w/8,(hh + 4)*h),(-w/8,(hh + 3)*h),(w/8,(hh + 3)*h))
  bezier((-w/8,(hh + 3)*h),(w/8,(hh + 3)*h),(-w/8,(hh + 2)*h),(w/8,(hh + 2)*h))
  bezier((-w/8,(hh + 2)*h),(w/8,(hh + 2)*h),(-w/8,(hh + 1)*h),(w/8,(hh + 1)*h))
  bezier((-w/8,(hh + 1)*h),(w/8,(hh + 1)*h),(-w/8,(hh + 0)*h),(w/8,(hh + 0)*h))
  line((-w/8,(hh + 4)*h),(-w/8,(hh + 1)*h))
  line((w/8,(hh + 4)*h),(w/8,(hh + 1)*h))
  content((0,(hh+5.2)*h), text(black, size: 11pt)[Mémoire secondaire])

  //TPV1
  let xt1 = -5
  let yt1 = -1.5
  line((-w/8+xt1, 10*h+yt1), (w/8+xt1, 10*h+yt1))
  line((-w/8+xt1, 9*h+yt1), (w/8+xt1, 9*h+yt1))
  line((-w/8+xt1, 8*h+yt1), (w/8+xt1, 8*h+yt1))
  line((-w/8+xt1, 7*h+yt1), (w/8+xt1, 7*h+yt1))
  line((-w/8+xt1, 6*h+yt1), (w/8+xt1, 6*h+yt1))
  line((-w/8+xt1, 5*h+yt1), (w/8+xt1, 5*h+yt1))
  line((-w/8+xt1, 4*h+yt1), (w/8+xt1, 4*h+yt1))
  line((-w/8+xt1, 10*h+yt1), (-w/8+xt1, 4*h+yt1))
  line((-w/12+xt1, 10*h+yt1), (-w/12+xt1, 4*h+yt1))
  line((w/8+xt1, 10*h+yt1), (w/8+xt1, 4*h+yt1))
  content((xt1,10.5*h+yt1), text(black, size: 11pt)[TPV 1])

  //TPV2
  let xt2 = 5
  let yt2 = -1.5
  line((-w/8+xt2, 10*h+yt2), (w/8+xt2, 10*h+yt2))
  line((-w/8+xt2, 9*h+yt2), (w/8+xt2, 9*h+yt2))
  line((-w/8+xt2, 8*h+yt2), (w/8+xt2, 8*h+yt2))
  line((-w/8+xt2, 7*h+yt2), (w/8+xt2, 7*h+yt2))
  line((-w/8+xt2, 6*h+yt2), (w/8+xt2, 6*h+yt2))
  line((-w/8+xt2, 5*h+yt2), (w/8+xt2, 5*h+yt2))
  line((-w/8+xt2, 4*h+yt2), (w/8+xt2, 4*h+yt2))
  line((-w/8+xt2, 10*h+yt2), (-w/8+xt2, 4*h+yt2))
  line((-w/12+xt2, 10*h+yt2), (-w/12+xt2, 4*h+yt2))
  line((w/8+xt2, 10*h+yt2), (w/8+xt2, 4*h+yt2))
  content((xt2,10.5*h+yt2), text(black, size: 11pt)[TPV 2])

  //arrows
  line((xt1, 8.5*h + yt1), (-w*0.1, 4.75), mark: (start: "o", end: ">"))
  line((xt1, 6.5*h + yt1), (-w*0.1, 0), mark: (start: "o", end: ">"))
  line((xt1, 5.5*h + yt1), (-w*0.1, 2.75), mark: (start: "o", end: ">"))
  line((xt2, 9.5*h + yt2), (w*0.1, 4.75), mark: (start: "o", end: ">"))
  line((xt2, 8.5*h + yt2), (w*0.1, 0.5), mark: (start: "o", end: ">"))
  line((xt2, 6.5*h + yt2), (w*0.1, 4.25), mark: (start: "o", end: ">"))
  line((xt2, 4.5*h + yt2), (w*0.1, -0.5), mark: (start: "o", end: ">"))
  
})
]

#item("Remarque", show-title:false)[Page miss][
  Pour associer les adresses virtuelles à leur adresse physique correspondante, la MMU vérifie dans la TPV du processus que la page concerné est dans la mémoire vive. Si ce n'est pas le cas, une exception est levé qui demande au système d'exploitation de charger la page en mémoire vive depuis la mémoire secondaire.
]

#dev[
#item("Remarque")[Plusieurs politique de remplacement de page @MOS[3.4]][
  existent lors d'un chargement de page. En effet si aucun emplacement n'est disponible, l'OS doit choisir une page à décharger.
]
]

#recap()
= Commentaires


#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Adrien Decosse & Axel Stengel
]

