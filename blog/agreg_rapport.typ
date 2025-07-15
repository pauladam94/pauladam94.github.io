= Compte-rendu oraux agreg 2025

Auteur: Paul ADAM

== Leçon (prediction note >= 16, note : 19)

=== Couplage (et choix)

4. Principe d'induction ;

je connaissais le plan mais mes 2 devs :

- dijkstra (très solide)

- LL1 Nullable First Follow définit par induction (très peu solide)

22. Fonctions et circuits booléens en architecture des ordinateurs (Leçon choisi)

Je ne connaissais pas le plan, mais je savais que la source, c'était le Vahid / Patterson

- Additionneur optimisé (très solide, je l'ai fait plusieurs fois au tableaux)

- Mini FSM (je ne l'avais jamais fait, mais je savais où le trouver)(Dev choisi)



Plan lecon 22 :

I. Notions d'architectures (Tortue)

II. Circuits Combinatoire (II. Vahid)

   - A. Porte Logique
   - B. Algèbre Booléenne

III. Circuits Séquentiels (III. Vahid)

   - A. Stocker 1 bits
   - B. Machine à Etats


=== Présentation

Défense de plan : tout s'est bien passé et j'ai fini dans les temps (un peu court sur la fin).



Le développement s'est bien passé (j'ai commencé par croire que j'avais que 10min et faire tout hyper vite au tableau). Au bout de 10min je me suis dit que j'avais encore 10min du coup j'ai reparlé de tout, j'ai fait un exemple plus détaillé etc... Finalement ça s'est vu, mais je pense que ça ne m'a pas pénalisé.

=== Questions

- comment présenter ça aux élèves ?

- la leçon e a t'elle des prérequis, si oui lesquels ?

- commen utiliser le logiciel "logisim" avec des élèves ?

- comment on fait un appel de fonction ?

- ajouter quel instruction pour être turing complet ?

- ça veut dire quoi avoir une architecture 16 bits ?

- c'est quoi la taille de vos instructions ?

- comment ajouter une nouvelle instruction ?

- questions de détails sur comment selectionner un registres

- questions sur comment modifier un registres

- questions sur les logiciels de compilation de FSM vers du matèriel

- comment on compile une FSM vers du matèriel ?

- qu'est ce qui est stocké dans le tas, la pile, le segment de données ?



=== Retours ?

ça s'est super bien passé, j'ai répondu à toute les questions. A la fin ils n'avaient plus de questions.

J'ai fait des blagues en milieu d'oral et ils ont rigolé, c'était nickel, j'aurais difficilement pu faire mieux.



== Modélisation (prédiction : 14 >= note >= 10, note : 7,25)

=== Sujet

Réseaux embarqués et échange de données entre des systèmes proches (on néglige le temps de propagation car les distances sont trop courtes)



=== Présentation

Titre : Réseaux embarqués

I. Performance dans un réseau

   - A. Différents type de délai
   - B. Hyppothèses de l'embarqué
II. Exemple avec 2 Routeurs

- ici j'ai montré mon code qui simulait un petit réseau avec 2 éléments.

III. Problème de congestion

- j'ai montré avec ma simulation que l'on pouvait facilement crée de la congestion sur la file d'attente d'un switch

IV. Problème de l'effet rebond (Point Sociétale)

j'ai parlé du fait que augmenter les performances du réseau ne diminuait pas néccéssairement la quantité de machine utilisé dans le réseau ni même la consommation de celle-ci.

=== Questions

- qu'est ce qui peut crée l'effet rebond ?

 - beaucoup de questions de cours de réseaux.

 - quelles sont les différentes couches d'encapsulation en réseau ? (TCP / IP)

 - quel est la différence entre une trame et un paquet ? (je savais plus)

 - quels sont les autres enjeux de l'embarqué que ce vous avez présenté

=== Retours?

Ca s'est pas super bien passé, j'ai pas hyper bien répondu au question de réseaux.

Je pense avoir été un peu à côté du sujet (ce qui était mon objectif parce que je voulais pas parler de routage).



== TP (prédiction note <= 11, note : 18 (je ne comprends pas))

=== Sujet

L'audit de code portait sur le calcul de (J'ai passé 1h20 du l'audit).



Le sujet portait sur l'implémentation de 2 algorithmes :

    - DPLL (en C)

    - arbre BDD (avec partage maximal) (En Ocaml)

    

Une question (sur la partie C) portait sur le parsing de fichier .cnf, j'ai un peu panqiué sur ça je pense. J'arrivais pas à faire fonctionner mon code du coup ça m'a pris beaucoup de temps.



=== Présentation

Ma présenation était vraiment pas très bien. Le sujet était super dense et je l'ai assez mal traité. J'ai du aller vite sur des points et je n'ai pas brillé sur celà. Comme j'ai particulièrment était faible sur le sujet et pas sur l'audit de code, j'ai décidé de faire 11 min sur l'audit de code pour montrer un peu que mon audit était bien.



=== Questions

Il n'y a QUE des questions sur les algorithmes mis en place. Très peu de questions sur les multiples questions intermédiaires des deux sujets. Comme mes questions finales des sujets ne fonctionnaient pas, ils m'ont un peu détruit sur les implémentations de mon DPLL que j'ai fait au dernier moment (et qui ne marchait pas)..

Aucune question sur le parsing, quasiment aucune questions sur les fonctions intermédiaires.



A la toute fin, ils m'ont posé la question sur l'audit de comment expliquer à un élève de faire moins de tests pour potentiellement faire plus d'autres choses ? C'était assez désagréable parce que ça sous-entendait que j'aurais du faire moins de tests pour me concentrer sur le sujet du TP (ce qui est vrai, mais ce ne sont pas les 3-4 tests de mes audits qui m'ont empêché de faire le reste du sujet).



=== Retours?



L'audit de code était solide, j'ai bien corrigé le code avec beaucoup de tests.



J'ai vraiment fait un oral terrible. J'ai eu l'impression de tout faire à l'envers. J'ai eu des réponses satisfaisantes à quasiment aucun des questions. J'en déduis une très mauvaise note pour et oral malheursement.

