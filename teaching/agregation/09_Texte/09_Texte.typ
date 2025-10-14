#import "../../deps.typ" : *
#show : tableau

= Algorithmique du texte. Exemples et Applications.

== Recherche de motif @CRO[1.3]
#item("Motivation")[][La recherche de motif est le moteur d'actions quotidiennes, comme le fameux CTRL+F pour rechercher dans una page web, ou le post-traitement de sortie en ligne de commande avec `grep`.]

#item("Définition")[Un alphabet $Sigma$][est un ensemble fini non-vide de *lettres*.]

#item("Exemple")[][Par exemple, ${0, 1}$ pour l'alphabet binaire, ${A, C, G, T}$ pour le séquençage ADN, ou l'ensemble de symboles Unicode sont des alphabets.]

#item("Définition")[Un mot, texte ou motif][
  (selon le contexte) est une suite finie $u_(0) dots u_(n-1) in Sigma^n$.
]

//#item("Définition")[Facteur][
//  $v$ est un facteur de $w$ si $w = alpha v beta$.
//]

#item("Exemple")[][Dans le texte "a#text(fill: red, [bra])cada#text(fill: red, [bra])nt", le motif "#text(fill: red, [bra])" apparaît aux positions 1 et 8.]

=== Recherche naïve
#item("Intuition")[][Tester pour chaque facteur du texte $w$ s'il est égal à $p$, c'est-à-dire pour chaque $i in [|0, |w| - |p| |]$, $w_i ... w_(i+|p|-1) = p$.]

#item("Algorithme")[Approche naïve][
  ```python
tw, tp = len(w), len(p)
for i in range(0, tw - tp):
    for j in range(i, i + tp - 1):
      if w[j] != p[j - i]:
        break
    else:
      print(p, "apparaît en position", i)
  ```
]

#item("Complexité")[][Cet algorithme effectue au pire cas $|p| (|w| - |p| - 1)$ comparaisons de symboles, d'où sa complexité en $cal(O)(|w|times|p|)$.]

=== Améliorations de la recherche naïve
#item("Intuition")[][La complexité élevée provient principalement de la comparaison répétée des même symboles du texte. Nous aimerions une méthode permettant de glisser la fenêtre de comparaison à la position suivante en temps constant : cela
est possible en utilisant une fonction de hashage bien choisie !]

#item("Algorithme")[L'algorithme de Rabin-Karp][utilise une fonction de hachage _incrémentale_. Il est alors possible de calculer $"hash"(w_(i+1) ... w_(i+|p|))$ à partir de $"hash"(w_i ... w_(i+|p|-1))$.
```ml
let hash_fact ancien_hash fact fact' =
  ancien_hash - hash fact.[0] + hash fact'.[String.length fact' - 1]
```

Si les hash sont égaux, on doit tout de même comparer le facteur de $w$ à $p$ afin de détecter les collisions de notre fonction de hachage.
]

#item("Complexité")[][Dans le meilleur cas, notre fonction de hachage n'a pas de collisions. On ne compare alors jamais les facteurs à notre motif inutilement, cela prendra un temps linéaire en $cal(O)(|w|)$. 

Dans le pire cas, il est nécessaire d'effectuer les mêmes comparaisons que l'algorithme naïf. On retombe ainsi sur la complexité $cal(O)(|w| times |p|)$ en pire cas.]

#item("Pratique")[][En pratique, il est rare que des collisions se produisent, ce qui justifie l'utilisation de cet algorithme.]

#item("Algorithme")[L'algorithme de Boyer-Moore][
utilise un pré-traitement sur le motif afin de faire un tableau de saut, évitant les comparaisons répétées des mêmes symboles du texte. Cet algorithme a une complexité $cal(O)(|w| + |p|)$.
]

=== Méthodes basées sur les automates
#item("Motivation")[][Il est souhaitable d'étendre la recherche de motifs aux *motifs rationnels*, c'est-à-dire rechercher les facteurs d'un texte $w$ qui sont dans $cal(L)(e)$, avec $e$ une expression régulière.]

#item("Application")[`grep`][
  est un utilitaire en ligne de commande qui permet de faire de la recherche de motif rationnels.]

#item("Définition")[Les expressions régulières][sont définies inductivement comme :
$
e eq.delta epsilon | a in Sigma | (e + e) | (e e) | e^*
$]

#item("Théorème")[Kleene][On peut construire un automate fini qui reconnaît $cal(L)(e)$ pour toute expression régulière $e$.]

#dev[
#item("Algorithme")[L'algorithme regexp2dfa (ou Glushkov déterministe)][construit l'automate fini déterministe reconnaissant $cal(L)(e)$ pour toute expression régulière $e$ en complexité $cal(O)(2^(|e|))$, puis peut l'utiliser pour chercher des motifs en complexité linéaire en la taille du texte.]
]

== Mesure de similarité
=== Notion de distance @CRO[7.1]
#item("Définition")[La distance de Hamming][ est une mesure du nombre de symboles deux-à-deux différents entre deux mots de même longueur.]
#item("Exemple")[][La distance de Hamming entre "ag#text(fill: red, [re])gation" et "ag#text(red, [er])gation" est de 2.]
#item("Application")[Les codes correcteurs][est la principale utilisation de la distance de Hamming.]

#item("Définition")[La distance de Levenshtein][est une _distance d'édition_ mesurant le coût minimal (en terme d'opérations élémentaires *substitution*, *insertion* et *suppression*) entre deux chaînes.

Chacune de ces opérations ont un coût associé, notés respectivement $"Sub"(a, b)$, $"Ins"(a)$ et $"Del"(a)$.
]
#item("Remarque")[][La distance de Levenshtein permet de comparer des chaînes de longueurs différentes.]
#item("Exemple")[][Les mots "Dijkstra" et "Djikstre" ont une distance de Levenshtein de 3 pour un coût unitaire sur chacune des opérations.
$
"Dijkstra" ->^("Del"(j)) "Dikstra" ->^("Ins"(j)) "Djikstra" ->^("Sub"(a, e)) "Dijkstre"
$
Il reste à montrer qu'une distance de deux est impossible.
]

#item("Remarque")[D'autres distances d'édition][existent, comme la distance de Damerau-Levenshtein qui supporte également la _permutation_ comme opération élémentaires. "Dijkstra" et "Dijkstre" auraient alors une distance de 2.]


=== Problème de l'alignement @CRO[7.2]
#item("Définition")[Le problème de l'alignement optimal][d'une distance est le suivant : Étant donné deux mots $u$ et $v$, quelles opérations élémentaires doivent être réalisées pour "transformer" $u$ en $v$ et vice-versa avec un coût minimal pour cette distance ?]
#item("Exemple")[][Un alignement optimal pour la distance de Levenschtein entre les mots "ACGA" et "ATGCTA" est:
$
A C G * * A\
A T G C T A
$
On observe deux insertions et une substitution, ce qui corresponds à une distance de Levenshtein de 3.
]

#dev[
  #item("Algorithme")[L'algorithme de Needleman–Wunsch][
  utilise la programmation dynamique pour calculer un alignement optimal.
  ]
  
  #item("Algorithme")[L'algorithme d'Hirschberg @GUS[12.1.2]][permet de calculer un alignement optimal entre deux mots en combinant programmation dynamique et diviser-pour-régner.]
]

#item("Application")[][L'alignement est un problème important en bioinformatique pour le séquençage ADN, ou pour la correction orthographique automatique.]

#dev[
  
  #item("Application")[@CRO[8.2] La recherche de motif approximative][ consiste à trouver des facteurs $v$ d'un mot $w$ ayant une distance d'édition d'au plus $k$ à un motif $p$.]
  #item("Algorithme")[L'algorithme de Sellers][, basé sur la programmation dynamique, peut résoudre ce problème en $cal(O)(|w|.|p|)$.]
]
#item("Programme")[`fzf`][est un utilitaire ligne de commande qui permet de faire de la recherche de motif approximative.]

#item("Pratique")[][En pratique, on peut parfois se contenter d'une *approximation* de cet alignement optimal. Des outils comme BLAST permettent d'aligner des séquences d'ADN efficacement au moyen d'heuristiques, en sacrifiant la garantie d'optimalité.]

== Compression
#item("Motivation")[][Pour minimiser la taille d'un fichier, on va chercher à tirer parti de motifs répétés pour _encoder_ l'information contenue de manière efficace.]

#item("Définition")[Un codage binaire][ est un morphisme $phi: Sigma^* without {epsilon} -> {0, 1}^+$. Un codage de *taille fixe* associe des mots de même taille $k$ à chaque symbole. Si ce n'est pas le cas, c'est un codage à *taille variable*.]

#item("Définition")[Le code][d'un élément $w in Sigma^* without {epsilon}$ est $phi(w)$. On dit alors que $phi(Sigma)$ est l'ensemble des codes de $phi$.]

#item("Exemple")[Le coadge ASCII][est un codage de taille fixe de 8 bits.]

#item("Définition")[Le taux de compression][ de $w$ pour un codage binaire $phi: {0, 1}^+ -> {0, 1}^+$ est le rapport de taille $(|phi(w)|) / (|w|)$. On parle souvent de *taux de compression en moyenne*.]
#item("Définition")[Un codage $phi$ est dit *sans perte*][ si $phi$ est inversible. Dans ce cas, on note $phi^(-1)$ la *fonction de décodage*. C'est à dire que la donnée décompressée est la même que la donnée de départ.]

=== Algorithme de Huffman @TOR[9.5.2.1]

#item("Idée")[][Pour encoder le mot "banane", on vourdrait représenter les lettres "a" et "n" par des codes plus _courts_ car elles apparaissent plus souvent.]

#item("Définition")[$phi$ est un codage préfixe][si aucun code de $phi$ n'est préfixe d'un autre code de $phi$. Cela permet un décodage sans ambiguïté i.e. $phi$ est inversible.]

#item("Définition")[Un arbre binaire préfixe][associe à chaque symbole le chemin qui l'atteint depuis la racine.] // TODO po clair

#item("Algorithme")[L'algorithme de Huffman][
permet de construire, étant donné une fréquence $f_omega$ d'apparition pour chaque symbole $omega in Sigma$, un arbre préfixe binaire ayant la propriété d'associer aux symboles les plus probables un chemin plus court.

On peut alors retrouver le code $"Huffman"(omega)$ en suivant le chemin de la racine à $omega$ : si on suit le sous-arbre gauche, on ajoute un $0$, sinon on ajoute un $1$.
]

#item("Théorème")[Optimalité de l'arbre de Huffman][
  L'arbre construit par l'algorithme de Huffman minimise la quantité $S = Sigma f_omega d_omega$ où $d_omega$ est la profondeur du symbole $omega$ dans l'arbre, qui détermine directement la longueur de son code, et $f_omega$ est la fréquence d'apparition de ce symbole.
]

#item("Complexité")[][
Soit $|Sigma|$ le nombre de symboles distincts de notre alphabet, la construction de l'arbre de Huffman est en $cal(O)(|Sigma| log(|Sigma|))$.
]

=== Algorithme de Lempel-Ziv-Welch (LZW) @TOR[9.5.2.2]

#item("Idée")[][
Compresser les facteurs identiques vers une forme compacte.
]

#dev[

#item("Algorithme")[Compression][
L’algorithme LZW utilise un dictionnaire, qui associe des
sous-chaines à des codes. Ce dictionnaire est encodé par un arbre préfixe.
]
#item("Shéma")[Exemple @TOR[p554]][
#align(center, image("image.png", height: 13%))
]

#item("Remarque")[Décompression][
Le dictionnaire ne nécessite pas d'être transmis, il peut être reconstruit à la volée.
]
]

#item("Remarque")[L'algorithme LZW procède en une seule passe][, ce qui en fait un algorithme adapté pour les fichiers volumineux ou les flux.]

#item("Application")[Le format d'archive ZIP][est souvent implémenté via l'algorithme DEFLATE, qui combine une variante de LZW et l'algorithme de Huffman.]



#recap()

#set text(11pt)

= Motivation 

@TOR[9.5] L'algorithmique du texte importante car utilisée dans les éditeurs de texte, les outils de recherche de motif, la bioinformatique. Permet aussi d'introduire des méthodes algorithmiques avancées et des notions de combinatoire.
 
= Ouverture

#item("Ouverture")[La compression avec perte][
pour un meilleur taux de compression, l'image, son ou vidéo avec 
les formats MP3 ou de JPEG par exemple.
]

===== Remarque
- Plan (stable depuis 2022)
- "Plus longue sous-séquence commune" possible surtout avec un dev Smith-Waterman
- "Analyse Lexical et Syntaxique" possible (orienté compil)

===== Devs
- Huffman bien,pas sûr que ça se réutilise
- Automate des occurences très bien (beaucoup de recasage)
- Boyer-Moore
- Rabin-Karpe à citer mais pas forcément en dev
- Lempel-Ziv pas mal
- Needleman-Wunsch ou Smith-Waterman
- Hirtschberg si vraiment motivés
- Recherche approximative de motif bon dev, très flexible (possibilité de faire purement algo, preuve de correction, etc)

===== Idées
- Exemples de programmes UNIX pour résoudre ces problèmes
- Plus de compilation (analyse lexicale etc.)
- Algorithme de Hirschberg's
- Applications classique : compilation, réseau, automate des occurences / Regexp2DFA, git
- Hash, checksum pas au programme, mais pertinent
- Parler de codage préfixe dans la partie compression, expliciter la partie décompression

#bibliography(read("../bib.yaml", encoding: none))

#authors[
  Alois Rautureau - Alexis Hamon
]
