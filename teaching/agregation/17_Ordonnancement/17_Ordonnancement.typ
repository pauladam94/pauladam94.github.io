#import "../../deps.typ" : *
#show : tableau

= Algorithmes d'ordonnancement de tâches et de gestion de ressources

#item("Motivation")[][
  Le système d'exploitation offre une abstraction du matériel.
  Il doit donc gérer les ressources qui y sont associées (temps de calcul, mémoire vive, mémoire persistante...).
]

== Gestion du temps processeur @MOS[2.5] @OSC[5]
#item("Définition")[Un processus][
  est une instance d'exécution d'un programme, incluant son espace mémoire et l'état des registres.
]

#item("Définition", show-title:false)[Processus endormi][
  On dit d'un processus qu'il est *endormi* s'il est en attente d'une entrée-sortie (lecture/écriture sur mémoire persistante, affichage, touche clavier ou clic souris, ...) ou s'il a demandé à être endormi. Un processus qui ne dort pas est *prêt*.
]

#item("Définition")[Un cœur de calcul][
  est la partie du processeur capable d'exécuter un processus (registres, unité de traitement, ...).
]

#item("Problème")[Ordonnancement][
  S'il y a plus de processus prêts que de cœurs de calcul, il faut choisir *quel processus exécuter*. C'est le rôle de l'*ordonnanceur*, qui fait partie du système d'exploitation.
]

=== Objectifs et hypothèses sur l'ordonnanceur @MOS[2.5]
#item("Définitions")[Objectif commun : équité][
  Tous les ordonnanceurs visent à garantir une répartition équitable du temps processeur. // entre les processus.
]

#item("Définition")[La préemption][
  est le fait d'interrompre un processus en cours d'exécution. Elle est un outil pour garantir l'équité.
]

#item("Définition")[Lors d'un changement de contexte][
  on sauvegarde l'état du processus en cours d'exécution, et on charge l'état d'un autre processus à exécuter. // (nouveau ou précédemment sauvegardé). 
]

#item("Cas particulier")[Dans le calcul par lots,][
  s'ajoutent les objectifs
  - de maximiser le nombre de travaux complétés par heure,
  - de minimiser le temps entre soumission et complétion,
  - et d'utiliser au maximum les unités de calcul disponibles.
  Dans ce contexte, on connaît également à l'avance le temps maximal que chaque processus prendra à s'exécuter.
]

#item("Cas particulier")[Dans les contextes interactifs][
  s'ajoute l'objectif de minimiser le temps entre la création d'un processus et sa première exécution (on parle de *réactivité*). De plus, l'utilisateur⋅ice peut assigner différentes priorités aux processus.
]

=== Ordonnancement naïf

#item("Définition")[Premier Entré, premier Sorti (PEPS)][
  est la politique d'ordonnancement la plus simple: les processus sont exécutés dans leur ordre de création, sans préemption.
]

#item("Éxemple")[][
  Supposons avoir un seul cœur de calcul, et deux processus: A met 81 minutes à s'exécuter et est arrivé en premier, B  met 19 minutes à s'exécuter et est arrivé 1 minute après A.
  - La politique PEPS n'est pas satisfaisante pour le calcul par lot, puisque le temps de complétion moyen sera de 50 minutes, là où interrompre A pour exécuter B donne un temps de complétion moyen de 35 minutes.
  - La politique PEPS n'est pas satisfaisante pour un contexte interactif non-plus, puisque B devra attendre 80 minutes avant sa première exécution.
]

=== Ordonnancement pour le calcul par lot

#item("Défintion")["Plus court d'abord"][
  est une politique d'ordonnancement non-préemptive exécutant d'abord les processus les plus courts.
]

#item("Définition")["Plus courte complétion d'abord"][
  est la version préemptive de la politique précédente : quand une nouvelle tâche arrive, si elle est plus courte que le temps restant à la tâche courante, cette dernière est interrompue.


]

=== Ordonnancement dans les contextes intéractifs 

#item("Définition")[La politique "Chacun son tour"][
  aussi appelée "tourniquet" divise le temps processeur en segments de même taille, et les attribue aux différents processus de façon cyclique.
]

#dev[
  #item("Définition")[@OSTEP[8] "Files de rétroaction multi-niveau"][
    est une politique qui s'adapte au comportement des processus.
  ]
]


#pagebreak()
== Gestion des pages mémoire @MOS[4.3 à 4.8] @OSC[9.3 et 10]

#item("Définition", show-title:false)[Mémoire virtuelle][
  Pour protéger les processus l'un de l'autre, et pour simplifier leur utilisation de la mémoire, le système d'exploitation *virtualise la mémoire*.
  Chaque processus a l'impression d'avoir accès à une grande mémoire monolithique.
]

=== Principes de la pagination

#item("Définition", show-title:false)[Pages][
  Les mémoires (virtuelle ou physique) sont découpées en blocs de taille fixe appelés des *pages*.
]

#item("Définition", show-title:false)[Table des pages][
  Pour chaque processus, le système d'exploitation dispose d'une *table des pages* donnant la correspondance entre pages virtuelles et pages physiques.
]

#item("Définition")[L'unité de gestion de la mémoire][
  (MMU en anglais) est le composant physique qui, à chaque accès mémoire, traduit les adresses virtuelles en adresses physiques, en utilisant les informations de la table des pages.
  Il dispose d'un cache, appelé *Table Lookaside Buffer* (TLB).
]

#item("Définition", show-title:false)[Pagination à la demande][
  Pour accélérer le chargement initial d'un programme et pour économiser de la place en mémoire RAM, on peut faire de *la pagination à la demande*: ne charger une page que lorsqu'elle est utilisée.
]

#item("Problème", show-title:false)[Remplacement de page][
  Quand il n'y a plus de place libre en RAM pour charger une page, il faut décider quelle page évincer. Ce problème s'appelle le *remplacement de pages*.
]

=== Remplacement de pages

#item("Définition")[Le taux d'erreur][
  d'une politique de remplacement de page est la proportion de fois où une page utilisée n'était pas déjà en RAM, pour une séquence donnée d'accès mémoire. 
]

#item("Définition", show-title:false)[La politique "Optimale"][
  Pour une séquence d'accès mémoire donnée, *la politique "optimale"* évince la page qui sera ré-utilisée le plus tard possible dans la séquence d'accès (ou qui ne sera pas ré-utilisée).
]

#item("Remarque", show-title:false)["Optimale" est outil théorique][
  La politique "Optimale" n'est pas réalisable en pratique, car le système d'exploitation ne connaît pas le futur, et donc ne sait pas quelle page sera réutilisée le plus tard possible dans par le processus.
  Par contre, "Optimale" sert d'outil théorique de comparaison, pour évaluer l'efficacité des politiques de remplacement de page.
]

#dev[
  #item("Définition")[La politique "Première Entrée, Première Sortie"][ 
    consiste à maintenir une file des pages. Lorsqu'on doit évincer une page, on choisit celle qui a été chargée en mémoire il y a le plus longtemps.
  ]
  
  #item("Remarque", show-title:false)[Anomalie de Belady][
    Avec la politique "Première Entrée, première sortie", le fait de rajouter des ressources (taille de la mémoire RAM) peut dégrader les performances (taux d'erreurs de page). Ce phénomène est appelé *anomalie de Belady*.
  ]

  #item("Définition")[La politique "Moins Récemment Utilisée"][
    évince la page la moins récemment utilisée. Elle repose sur l'heuristique qu'une page récemment utilisée a plus de chances d'être à nouveau utilisée.
  ]

  #item("Remarque")[Les politiques de remplacement de page doivent s'exécuter très rapidement][
    car le temps que ces politiques s'exécutent, les programmes de l'ordinateur ne s'exécutent pas.
  ]

  #item("Définition")[L'algorithme de l'Horloge,][
    ou "algorithme de la deuxième chance"
    est une politique de remplacement de page qui permet d'approcher la politique "Moins Récemment Utilisée" mais qui s'exécute plus rapidement. Le principe est de mettre les pages dans une liste circulaire et de les marquées comme récemment utilisées ou pas. La page évincée sera la plus anciennement chargée, sauf si elle a été utilisée depuis la dernière fois où on a essayé de l'évincer.
  ]
]

// === Pagination et équité entre processus

#pagebreak()
== Ordonnancement des accès à un disque dur @OSTEP[37.5]
#item("Problème")[][Le temps de réponse d'un disque dur est essentiellement dû à des contraintes physiques (déplacement de la tête de lecture, rotation du disque). Il est donc important d'organiser les requêtes pour minimiser ce temps de réponse. Les requêtes sont alors stockées dans une mémoire tampon en attendant d'être traitées.]

#item("Algorithme")[Shortest Seek Time First (SSTF)][Les requêtes sont organisées de sorte à minimiser les déplacements de la tête de lecture en favorisant les accès sur la même piste.]

#item("Remarque")[Famine][SSTF peut faire apparaître une situation de *famine* : certaines requêtes ne seront jamais satisfaites.]

#dev[
  #item("Algorithme")[SCAN][Balayage du disque dans un sens, puis dans l'autre, en traitant les requêtes lorsque la tête de lecture passe sur la zone concernée.]
  #item("Remarque")[][Cet algorithme est moins efficace, mais résouds le problème de famine. Cependant, il a tendance à favoriser les blocs mémoires présents sur les pistes au centre.]
  #item("Algorithme")[C-SCAN][Variante de SCAN qui parcourt le disque toujours dans le même sens. Cela permet un traitement plus uniforme des requêtes]
]

#item("Remarque")[][Aujourd'hui, les disques à mémoire flash permettent de se contenter de variantes simples de l'algorithme PAPS, en évitant les contraintes mécaniques des disques durs.]

== Gestion de la mémoire par les programmes
#item("Problème")[][Les programmes se voient accordés un espace d'adressage qu'ils peuvent utiliser librement. Dans un soucis d'efficacité, il est important de réduire l'empreinte mémoire d'un programme sur le système en libérant ou réutilisant les allocations qui ne sont plus utiles.]

=== Gestion manuelle @OSTEP[14]
#item("Méthode")[Gestion manuelle][Gestion de la mémoire au moyen d'une API système (`malloc`, `free`, ...).]
#item("Problème")[Bin packing][L'allocateur mémoire peut utiliser différentes stratégies pour choisir où allouer la mémoire, comme _First-Fit_ (premier emplacement), ou _Best-Fit_ (meilleur emplacement).]
#item("Remarque")[][Bien qu'efficace, la gestion manuelle de la mémoire peut être source d'erreurs pouvant rendre le programme *vulnérable à des failles de sécurité*.]

=== Gestion automatique @GC
#item("Méthode")[Gestion automatique][On alloue la mémoire nécessaire au stockage d'une donnée à sa création, puis on choisi quand la libérer *algorithmiquement*. Cet algorithme est appelé *ramasse-miette*.]
#item("Algorithme")[Comptage de références][On peut ajouter à chaque allocation mémoire un compteur permettant de savoir combien d'autres données y font référence. Quand ce compteur atteint 0, on libère la mémoire.]
#item("Remarque")[][Bien que simple à implémenter, le comptage de références à de nombreux désavantages, comme la non-détection des cycles, la quantité potentielle de mises à jour du compteur, ou son interaction avec des applications concurrentes.]
#dev[ @GC[2]
  #item("Méthode")[Traçage][Garder en mémoire un _graphe_ de références que l'on peut traverser depuis sa source pour savoir quelles données sont _accessibles_.]
  #item("Algorithme")[Mark-And-Sweep][pars des données _racines_ (variables locales, statiques, globales) puis traverse le graphe de références pour marquer les données accessibles. Les données non-marquées sont ensuite libérées.]
]
#item("Exemple")[Le module `Gc`][en OCaml permet d'accéder aux statistiques de son ramasse-miette.]



#recap()


#bibliography(read("../bib.yaml", encoding: none))

//*Notes de réu*:
// - Ordo Linux peut-être trop loin
// - Peut-être parler de swap
//- À quel point parler de trapping, rendre la main au scheduler ? Peut faire du lien
//- Ça pourrait se faire hiérarchiquement, mais en vrai ça peut être mieux en coopératif quand c'est possible
//- Pagination *obligatoire à faire* (unless?)
//- Leçon un peu catalogue, peut-être pas trop le choix
//  - Garder une trame, top-down ou bottom-up
//- Garbage Collection ?
 // - déjà trop de trucs, peut être un peu hors-sujet
//  - si y'a de la place why not
//  - plus dans paradigmes
//- Partir du principe qu'on a déjà vu hiérarchie mémoire etc

//- Ordonnancement apparaît niveau terminale
//- Soit première approche à tout, ou alors on recoupe tout

*Notes GC*:
- Le livre en référence est une mine d'or de devs (peut-être pas _tous_ au programme).
- Se replace en leçon graphe
- Pour la deuxième partie (tri-marquage) du dev, peut-être remplacée par :
  - Mark-And-Sweep concurrent (parties 15/16) pour placer en synchro
  - Stop-And-Copy (partie 4)

#authors[Santiago Sara Bautista & Aloïs Rautureau]