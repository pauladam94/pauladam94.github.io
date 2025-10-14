#import "../../deps.typ": *
#show : tableau

= Langages rationnels et automates finis. Exemples et applications. @CAR

/ Motivations: Premier contact avec les langages formels, prépare à l'introduction d'un cadre formel pour l'étude des langages algébriques et plus généralement des concepts liés aux MT. Enjeu sur l'outil de modélisation que sont les automates. L'occasion de consolider les acquis du formalisme des structures inductives.

== Langages réguliers et langages reconnaissables

=== Mot et Langage

#item("Définition")[Lettre et alphabet.][
  Un alphabet est un ensemble fini non vide de symboles appelés lettres. Par la suite on notera les alphabets sur $Sigma$.
]

#item("Définition")[Un mot][
  $w$ sur un $Sigma$ est une suite finie de lettre $w_1, ..., w_n$ avec $n in NN$. Si $w$ est composé de $n$ lettres on dit qu'il est de taille n et on note $|w| = n$. Le mot de taille 0 sera noté $epsilon$. On définit la concaténation de $u = u_1 ... u_n$ et $v = v_1 ... v_m$ comme le mot $u . v = u_1 ... u_n v_1 ... v_m$ de taille $|u| + |v|$.
]

#item("Définition")[Un langage][
  sur $Sigma$ est un ensemble fini ou infini de mots sur $Sigma$.
]

#item("Exemple", show-title:false)[Exemple de language][
  $L_1 = { epsilon, a a, a a b}$ est le langage fini sur $Sigma { a, b }$ composé du mot vide, du mot $a a$ de taille 2 et du mot $a a b$ de taille 3.
  
  $L_2 = { w "avec autant de " a "que de" b }$ est un langage infini.
]

#item("Transition")[][
  Briques de base pour la suite de la leçon.
  On va miantenant pouvoir manipuler des languages et notamment définir des opérations sur ces derniers.
]

=== Langage réguliers
#item("Définition")[Opérations régulières][

  - Union (+) : $L + L' = L union L' = { w | w in L "ou" w in L'}$
  - Concaténation (.) : $L . L' = { u.v | u in L, v in L'} $
  - Etoile de Kleene (\*): $L^0 = {epsilon}$, $forall i in NN, L^(i+1) = L . L^i $, \ $L^* = union_(i in NN) L^i$
]

#item("Définition")[Langage régulier][
  L'ensemble $"Rat"(Sigma)$ des langages réguliers (ou rationnels) sur $Sigma$ est le plus petit ensemble stable par opérations régulières contenant $emptyset$ et ${a}$ pour $a in Sigma$.
]

#item("Exemple", show-title:false)[L'ensemble des mots est régulier][
  - ${ a | a  in Sigma^*}^* = { w | w "est un mot de" Sigma}$, par abus de notation on note ce langage $Sigma^*$.
  - ${a}^*.{b}^* = {a^n b^m | n, m in NN}$
]

#item("Définition")[Expressions régulières][
  L'ensemble des expressions régulières $cal(E)(Sigma)$ sur $Sigma$ est un langage sur l'alphabet ${0, 1, |, .,*, (, ) } union Sigma $ défini inductivement par :
  - $0, 1 in cal(E)(Sigma)$
  - $forall a in Sigma, a in cal(E)(Sigma)$
  - Si $e_0, e_1, e_2 in cal(E)(Sigma)$ alors $(e_0^*), (e_1 | e_2), (e_1.e_2) in cal(E)(Sigma)$
]

#item("Remarque", show-title:false)[Priorité des ops sur les regexps][
  On peut voir les symboles $+, | "et" *$ comme des opérateurs sur les expressions régulières et poser des règles de priorités pour d'affranchir des parenthèses : $*$ plus prioritaire que $.$ plus prioritaire que $|$ : $((a.(b^*) | (a^*))$ se réecrit $a.b^* | a^*$. De même, on peut omettre d'écrire $.$ pour alléger les notation : on obtient $a b^* | a^*$.
]

#item("Définition")[Langage dénoté][
  On appelle $cal(L)(E)$ le language dénoté par l'expression régulière $e$, défini inductivement comme :
  #grid(columns: (22%, 36%, 1fr), [
  - $cal(L)(emptyset) = emptyset$
  - $cal(L)(epsilon) = {epsilon}$
  ],
  [
  - $cal(L)(e^*) = cal(L)(e)$
  - $forall a in Sigma$, $cal(L)(a) = {a}$
  ],[
  - $cal(L)(e_1 . e_2) = cal(L)(e_1) . cal(L)(e_2)$
  - $cal(L)(e_1|e_2) = cal(L)(e_1)|cal(L)(e_2)$
  ])
]

#item("Propriété", show-title:false)[RAT = REG][
  $cal(L)(cal(E)(Sigma)) = "Rat"(Sigma)$
]

#item("Exemple", show-title:false)[Language dénoté par une regexp][
  $a^* . b^*$ dénote ${a}^* . {b}^*$ et  $a b^* | a^*$ dénote $({a}.{b}^*) + {a}^*$
]


#item("Application", show-title:false)[Standard POSIX][
  Les expressions régulières sont un moyen très succint de représenter des motifs simples(réguliers). Le standard *POSIX* est une extension des expressions régulières servant à la recherche de motif.
]

#item("Transition")[][
  Modèle expressif mais peut algorithmique. Comment faire de la reconnaissance de motif avec des expressions régulières, par exemple?
]

=== Langages reconnaissables

#item("Définition")[Un automate fini][
  $A = (Q, Sigma, delta, I, F)$ est la donnée :
  - d'un ensemble d'états Q
  - d'un alphabet Sigma
  - d'une fonction de transition $delta : Q times Sigma --> cal(P)(Q)$
  - d'ensembles $I, F subset.eq Q$ d'états initiaux et finaux. 
]

#item("Définition")[Mot et langage reconnu.][
  Soit un automate $A = (Q, Sigma, delta, I, F)$. Un chemin dans $A$ est une suite de transitions entre les états de $A : q_0 -->^(a_1) q_1 -->^(a_2) ... -->^(a_n) q_n$ telle que $forall i in [| 1, n |], q_i in delta(q_(i-1) a_i)$. Un tel chemin est dit étiqueté par le mot $a_1 ... a_n$.
  On dit que $w$ est reconnu par $A$, s'il existe un chemin de $q_0$ à $q_n$ étiqueté par $w$ tel que $q_0 in I$ et $q_n in F$.

  Le language reconnu par $A$, noté $cal(L)(A)$, est l'ensemble des mots reconnus par $A$.
]

#item("Définition")[Langage reconnaissable][
  Un langage est reconnaissable s'il existe un automate qui le reconnait. L'ensemble des langages sur $Sigma$ qui sont reconnaissables est noté $"Rec"(Sigma)$.
]

#item("Activité")[Modélisation par automate fini][Machine à café, ascenceur, etc...]

#item("Applications", show-title:false)[Machines à états et model-checking][
  - Machines à états (architecture, robotique, ...)
  - Model-Checking [hors-programme] (automates de Büchi, automates temporisés, ...)
]


#grid(columns: 2,
item("Exemple", show-title:false)[Deux exemples d'automates][
  - $A_1$ reconnait le langage dénoté par $a. (b|c)$.
  - $A_2$ reconnait le langage dénoté par $a^* . a . b^*$
],
box(width: 150pt, height: 100pt, stroke: 1pt, align(center + horizon)[Schémas de deux automates])
)

#item("Définition")[Une $epsilon$-transition][
  (ou transition spontanée) est une transition étiquetée par $epsilon$. Formellement, un automate qui autorise les $epsilon$-transition est tel que $delta in Q times (Sigma union {epsilon}) -> cal(P)(Q)$.
]

#item("Propriété", show-title:false)[$epsilon$-transitions ne changent pas l'expressivité][
  Les languages reconnu par automates avec $epsilon$-transition sur $Sigma$ sont exactement $"Rec"(Sigma)$.
]

#dev[
  #item("Théorème")[Théorème de Kleene][
    $"Rat"(Sigma) = "Rec"(Sigma)$
  ]

  #item("Démonstration")[][
    $subset.eq$ : Méthode de Thompson $cal(O)(|e|)$.

    $supset.eq$ : Algorithme de McNaughton-Yamada $cal(O)(|Q^4|)$.
  ]
]

#item("Méthode")[][
  Construction de Glushkov: comme alternative à Thompson.
  
  Algorithme de Brzozowski et McCluskey : comme alternative  McNaughton-Yamada.
]


#dev[
#item("Remarque")[Calcul _Premier Nullable Dernier_.][
  La construction de Glushkov utilise les fonction _Premier_, _Nullable_, _Dernier_ pour calculer un automate qui reconnait tous les mots représentés par une expression régulière.
]
]

#item("Propriété", show-title:false)[
  Stabilité par opérations régulières][Les languages reconnaissables sont  stables par opérations régulières.
]

#item("Lemme")[Lemme de l'étoile][
  Pour tout langages $L$ reconnu par un automate avec au plus $N$ états et tout $w in L$, alors il existe $u_1, v, u_2$ tel que :
  #grid(columns: (40%, 1fr), [
  - $w = u_1 v u_2$
  - $forall i in NN, u_1 v^n u_2 in L$
  ],[
  - $|v| > 0$
  - $|u_1 v| <= N$
  ])
]

#item("Application")[Des languages non-reconnaissables:][
  existent ${a^n b^n | n in NN}$.
]

#item("Transition")[][
  On dispose de l'outil pour réfléchir algorithmiquement sur les languages réguliers/reconnaissables. Quelles opérations peut-on réalilser sur les automates finis?
]

== Opérations sur les automates finis

#item("Rappel")[Compositions régulières.][
  Les automates finis peuvent être composés par opérations régulières.
]

=== Opérations de base

#item("Définition")[Un automate est complet][
  si $forall (q, a), delta(q, a) >= 1$.
]

#item("Définition")[Automate émondé][
  Un automate est acccessible s'il existe un chemin d'un état initial vers n'importe quel autre état.
  - un automate est co-accessible s'il existe un chemin de tout état vers un état final.
  - un automate est émondé lorsqu'il est accessible et co-accessible.
]

#item("Définition")[Automate déterministe][
  Un automate fini $A = (Q, Sigma, delta, I, F)$ est déterministe lorsque : $forall (q, a), |delta(q, a)| < 1$ et |I| = 1.
]

#item("Propriété", show-title:false)[Déterminisation][
  Soit $A$ un automate fini, il existe un automate déterministe qui reconnait $cal(L)(A)$.
]

#item("Algorithme")[Automate des parties][
  L'automate des parties est calculé en considérant toutes les parties de l'ensemble des états d'un automate non-déterministe. $cal(O)(2^(|Q|))$.
]

#item("Propriété")[Complémentaire et intersection][
  On peut calculer le complémentaire d'un automate déterministe complet.

  On peut calculer l'intersection de deux automates.
]

=== Minimisation
#item("Définition")[Automate minimal][
  Un automate deterministe est minimal s'il n'existe pas d'automate déterministe avec moins d'état reconnaissant le même langage.
]

#item("Définition")[Résidu][
  Pour tout mot $u$ et tout langage $L$, on définit le résidu de $L$ par $u$ comme $u^-1 = {w in Sigma^*| u  w in L}$.
]

#item("Théorème")[de Myhill-Nerode.][
  Un langage est régulier si et seulement s'il admet un nombre fini de résidus.
]

#item("Définition")[Automate des résidus][
  L'automate des résidus d'un langage régulier sur $Sigma$ est $cal(A)_R = (Q_R, Sigma, delta_R, I_R, F_R)$ avec : 
  #grid(columns: (50%, 1fr),
  [
   - $Q_R = {u^(-1)L | u in Sigma^*}$
   - $I_R = {epsilon^(-1) L} = {L}$
  ],
  [
   - $F_R = {u^(-1)L | u in L}$
   - $delta_R(u^-1 L, a) = {u a^(-1) L}$
  ])
]

#item("Propriété")[L'automate des résidus est minimal][]

#item("Définition")[Congruence de Nérode][
  Etant donné un automate déterministe $A$, on définit la congruence de Nerode sur les états de $A$ par $p tilde q$ si et seulement si pour tout mot $w$, les existences d'un chemin étiqueté par $w$ depuis p et q vers un état de F sont équivalentes.
]

#item("Définition")[Automate de Nérode][
  L'automate de Nerode de $A$ est défini à l'aide de la congruence de Nerode : $A_tilde = (Q_tilde, Sigma, delta_tilde, {overline(i) | I = {i}}, {overline(f) | f in F})$ où $Q_tilde$ est le quotient de $Q$ par $tilde$ et
  $delta_tilde (dash(q), a) = overline( delta(q, a))$ où $overline(q)$ est la classe d'équivalence de $q$ selon $tilde$.
]

#item("Propriété", show-title: false)[Automate Nérode minimal.][
  L'automate de Nérode est minimal.
]

#item("Algorithme")[L'algorithme de Moore][
  calcule l'automate de Nerode d'un automate déterministe complet (en temps $cal(O)(|Q|^2)$) en procédant par raffinements successifs d'une approximation de $tilde$ :
  - $p tilde_0 q <==> p, q in F$
  - $p tilde_(k + 1) q <==> [p tilde_k q "et" forall a in Sigma, delta(p, a) tilde_k delta(q, a)]$
]

== Applications

=== Recherche de motif

#item("Problème")[Recherche de motif.][
  Entrée: un texte $T$ et un motif $m$. Sortie: l'indice de la première occurence de $m$ dans $T$ si elle existe, -1 sinon.
]

#item("Algorithme")[Test exhaustif Naïf][
  : complexité en $cal(O)(|m|.|T|)$
]

#item("Algorithme")[Knuth-Morris-Pratt][
  Le calcul des bords permet d'avoir l'automate des préfixes et accélérer la recherche de motif: complexité en $cal(O)(|m| + |T|)$.
]

=== Compilation

#item("Définition")[Analyse Lexicale][
  
]

#dev[
  #item("Idée")[][
  On utilise des expressions régulières pour représenter les motifs auxquels doivent correspondre les mots associés à un lexeme donné.]

  #item("Algorithme")[REGEXP2DFA@DRAG][]
  ]



#pagebreak(weak: true)
#recap()


===== Remarques
Les livres possibles pour écrire cette leçon son multiple :
- @TOR[Chap. ...]
- @VERT[Chap. ...]
- @CAR particulièrement détaillé pour cette leçon.

/ Fil directeur: Différents modèles sont équivalents $->$ opération possibles $->$ applications.
/ Notes: Lien avec les machines à états en archi / Thomson au lieu de Glushkov / pas de morphismes / pas de logique du premier ordre en application

#bibliography(read("../bib.yaml", encoding: none))