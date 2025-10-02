#import "../../utils/utils.typ": *
#import "@preview/cetz:0.4.2": *
#import "@preview/numbly:0.1.0": numbly

#show: basic-page.with(include-header: false, include-pdf: true)

#set text(
  size: 12pt,
  font: "New Computer Modern",
  lang: "fr",
)
#set figure(placement: auto)
#show grid: set align(center)
#show table: set align(center + horizon)
#show heading.where(level: 1): set text(18pt)
#show heading.where(level: 2): set text(16pt)
#show heading.where(level: 3): set text(14pt)

#show title: set text(weight: "regular")
#show title: set par(justify: false)
#show title: set align(center + horizon)
#show: it => context {
  set page(
    margin: (
      left: 3cm,
      right: 3cm,
      top: 3cm,
      bottom: 3cm,
    ),
    numbering: "1",
  ) if target() == "paged"
  it
}
#set par(
  justify: true,
  first-line-indent: 2em,
  leading: 1em,
  spacing: 2em,
)
#set heading(numbering: numbly(
  "{1:I}.", // use {level:format} to specify the format
  "{2:A}.", // if format is not specified, arabic numbers will be used
  "{3:1}.", // here, we only want the 3rd level
))
#show heading.where(level: 1): it => {
  pagebreak()
  it
  context v(par.leading)
}
#show heading.where(level: 2): it => {
  it
  context v(par.leading / 2)
}
#show heading.where(level: 3): it => {
  it
  context v(par.leading / 2)
}

#let dialogue(c) = context {
  set align(center)
  set par(spacing: par.spacing / 2)
  c
}

#[

  #show: it => context {
    set page(numbering: none) if target() == "paged"
    it
  }
  #set align(center)

  #stack(
    spacing: 1fr,
    dir: ltr,
    [Sous la direction d'Emmanuel Dreux],
    [Mémoire 2],
  )

  #v(1fr)

  #text(16pt)[Circé Carbonari]

  #v(1fr)

  #title[
    *Humoristes et cinéma français* : \ les enjeux de la cristallisation du personnage scénique au cinéma
  ]

  #v(2fr)

  Université Paris 8 Vincennes Saint-Denis Département Cinéma

  Parcours : master théorique, esthétique et histoire du cinéma

  #v(1fr)

  Année 2023-2024

]

#outline(
  title: [Sommaire],
)

#heading(numbering: none)[Introduction]


"Je fais de la télé. Je suis humoriste, donc c'est logique que je fasse un film. Tout le monde le fait, c'est comme ça c'est la règle. On va pas changer les règles." Cette réplique est prononcée par l'humoriste Michel Muller dans le film qu'il réalise en 2005 intitulé _La Vie de Michel Muller est meilleure que la vôtre_ et dans lequel il interprète son propre rôle. Ce film qui prend la forme d'un faux documentaire (ou mockumantaire), raconte l’histoire d'un humoriste rencontrant du succès sur scène. Sa vie bascule lorsque le producteur Luc Besson lui propose d'écrire et de réaliser un film. Dans la séquence dont est extraite cette réplique Michel Muller se rend au bas de l'immeuble du réalisateur Claude Miller sans y avoir été convié pour solliciter des conseils sur la manière de réaliser un film. Afin de plaider sa cause, il explique que c'est dans l'ordre des choses pour lui en temps qu'humoriste de migrer vers le cinéma. C'est en ce point que Michel Muller verbalise une intuition évidente quand il est question de cinéma français et plus particulièrement de comédie. En effet, qu'il s'agisse de Francis Blanche, Fernand Reynaud, Jean Poiret, Michel Serrault, Coluche, Jamel Debbouze, Valérie Lemercier, Dany Boon, Éric et Ramzy ou encore Blanche Gardin les humoristes sont partout au cinéma. Ce mémoire se propose d'analyser le travail de ceux qui nous font rire sur scène quand ils passent au cinéma. Le premier enjeu tient dans la définition des termes du sujet, car plutôt que de « comiques » on préféra parler « d'humoristes ». Selon l'historien de la littérature Alain Vaillant : « le mot d'humoriste tend à désigner tout professionnel du rire qui s'adresse en son nom au public pour provoquer son hilarité. Il s'oppose à ce titre à la fois au comique de comédie, qui joue un personnage, et au clown ou au spécialiste comique de mimique ou de geste, où l'effet risible s'exprime principalement par le corps et non par la parole. L'humoriste, toutes catégories confondues , est celui dont le métier consiste à tenir au public des propos spirituels, quelle que soit la nature de ses mots d'esprits#footnote[VAILLANT, Alain, La Civilisation du rire, Paris, CNRS EDITIONS, 2016, p. 283-284] ».

A la définition que nous propose Alain Vaillant nous ajouterons quelques précisions car cette dernière ne mentionne à aucun moment l'importance de la scène dans le travail de l'humoriste. Ici, nous qualifierons plus précisément d'humoristes les personnalités s'illustrant par leur capacité à monter seules sur scène pour faire rire un public. Ce travail de la scène doit pouvoir être effectué de manière individuelle afin de ne pas tomber dans des formes comiques plus proches du théâtre ce qui représente un tout autre exercice. Ainsi, nous n’inclurons pas dans notre catégorisation des acteurs comme ceux de la troupe du Splendid ayant fait leurs armes au café théâtre. Nous ferons aussi la distinction entre un Louis de Funès que nous désignerons comme un comédien comique, et un Coluche, qui est un humoriste puisqu'en sa qualité d'auteur drôle, il réitère l'exercice de la prestation scénique individuelle. Si le mot comique désigne de manière englobante celui qui fait rire, l'humoriste est inséparable de la scène, cette redéfinition plus restreinte du terme soulève des enjeux plus adéquats pour nos recherches. De même, l'humoriste entretient un rapport essentiel avec son public dans la mesure où sa légitimité en tant qu'artiste tient dans la simultanéité entre sa prestation sur scène et la manifestation des rires. Par ce biais, il développe avec son public une connexion émotionnelle, et il l'invite à rire d'une part à propos de référentiel connue (de publicité, d'hommes politiques, de l’actualité), et d'autre part de référentiel qu'il va créer au sein de ses sketches. Ce lien privilégié avec le public représente un des enjeux à prendre en compte puisque que c'est sur celui-ci que repose la construction de la carrière au cinéma des humoristes que nous tacherons d'étudier. C'est parce qu'à un moment leur public a ri quand ils étaient sur scène que la question de l'adaptation au cinéma de leur humour se pose.

Notre intitulé convoque également la notion de « personnage scénique ». Cette, dernière que nous réutiliserons à plusieurs reprises peut être définie comme l'identité reconnaissable par le public, développée par l'humoriste au sein de ses prestations sur scène. Le personnage scénique s’appuie pour cela sur la création d'un langage et d'une gestuelle qui lui est propre. Il peut également témoigner d'un rattachement à certains idéaux politiques et sociaux. Le personnage scénique est à proprement parlé conçu pour la scène, mais il tendra dans la carrière de l'humoriste à être bien souvent réutilisé au cours de ses différentes interventions médiatiques (que ce soit en tant que chroniqueur ou pour faire de la promotion). A ce titre, la notion de « persona » emprunté au « star studies », qui définit l'identité d'une star à travers l'ensemble de ses apparitions médiatiques et artistiques, aura pour notre sujet une résonance puisque elle tendra bien souvent à ne faire qu'un avec le personnage scénique. On pourra citer à titre d'exemple le cas des interventions promotionnelles du duo, Éric et Ramzy qui dans les années 2000 s'illustraient sur les plateaux de télévision par leur capacité non seulement à faire des blagues mais surtout à détourner le cours des émissions pour les mettre aux service de leur humour.

Enfin, ce qui retiendra notre attention c'est surtout l'importance du personnage scénique lors du passage au cinéma des humoristes. Que cela soit dans des transpositions maladroites ou dans des adaptations embrassant pleinement ce nouveau médium, nous verrons que l'humoriste peine à échapper à l'identité qu'il s'est créée. C'est ainsi que se pose la question de la cristallisation que l'on définit dans le domaine scientifique comme le phénomène par lequel un corps passe à l'état de cristal. La réutilisation du personnage scénique pour le cinéma s'apparente par bien des aspects à une fixation, opérée dans le but de satisfaire les attentes du public. Dès lors, le fait d'échapper à son personnage scénique sous-tend que l'humoriste brise cette cristallisation en prenant le risque de brusquer son public. Ainsi, on trouvera dans le parcours de ces artistes des films et autres productions audiovisuelles, témoignant d'une part de la volonté de se soustraire à cette image cristallisée, et d'autre part d'accéder à une reconnaissance critique. En effet, malgré leurs succès au box-office le travail des humoristes au cinéma est bien souvent boudé par la critique.

Dès lors, nous formulerons la problématique suivante : dans quelle mesure le passage de l'humoriste au cinéma est-il à la fois constitutif d'une cristallisation de son personnage scénique et d'une tentative de décristallisation de celui-ci ?

Afin d'étudier plus amplement la trajectoire de l'humoriste au cinéma, nous appuierons nos recherches sur un texte ici programmatique du philosophe Alain Badiou intitulé « considérations sur l'état actuel du cinéma, et sur les moyens de penser cet état sans avoir à conclure que le cinéma est mort ou mourant #footnote[BADIOU, Alain, Cinéma, « considérations sur l'état actuel du cinéma et sur les moyens de penser cet état sans avoir à conclure que le cinéma est mort ou mourant », Paris, Novas, 2010, p. 221-238] ». Cet article article est paru en mars 1999 dans la revue numéro 24 de L'Art du cinéma, une revue fondée par Alain Badiou. Dans cet article, l'auteur prend pour point de départ la question de l'impureté cinématographique et avance l'idée que le septième art est certes un espace propice à la convocation des autres arts#footnote[Théorie initiée par André Bazin au sujet de la porosité entre la littérature et le cinéma dans son article « Pour un art impur ». BAZIN, André, Qu'est-ce que le cinéma ?, « Pour un art impur », Paris, Cerf, 2011], mais surtout « un lieu d'indiscernabilité intrinsèque entre l'art et le non-art ». De ce fait « un film est contemporain » dans la mesure ou « il assure l'épuration » des matériaux « identifiables comme appartenant au non-art de son temps ». En revanche, si le cinéma en temps qu'art de masse tend vers l'absence « d'épuration » de son matériel « non artistique » alors, il entretiendra la reproduction de régimes d'images préférentielles dominants. C'est ainsi que Badiou considère « que le défi actuel est qu'il convient d'étendre [le processus d'épuration] à tout ce qui rattache les matériaux à la pure consommation formelle d'images et de sons, dont les agencements privilégiés sont aujourd'hui : la nudité pornographique, l'effet spécial cataclysmique, l'intimisme du couple, le mélodrame social et la cruauté pathologique ». Le concept du philosophe étant ainsi établi, tâchons de le rattacher au cœur de notre sujet à savoir l'humoriste. Nous verrons que celui-ci développe précisément une identité publique et médiatique assimilable à un objet de consommation inscrit dans une culture de masse. Nous considérons sa persona comme un objet non artistique, sur lequel le cinéma peut entreprend un processus d'épuration. Ainsi notre étude sur l'intégration de la figure de l'humoriste au cinéma embrassera dans sa forme une chronologie similaire au déploiement du phénomène décrit par Badiou. Dans un premier temps, l'humoriste s’illustrant sur scène développe conjointement à son personnage scénique, une persona et donc le matériau « non artistique ». Celui-ci par un effet de cristallisation, dans un processus naturel finit par s'intégrer au cinéma dans des productions audiovisuelles relevant de la culture de masse développant ainsi « un nouvel agencement privilégié du cinéma ». Dès lors, la décristallisation du personnage scénique de l'humoriste au cinéma se conçoit à travers « l'épuration » de son matériel « non artistique ». Cette courbe de progression est illustrée dans le schéma ci-dessous.




#place(center + top, float: true, clearance: 1cm, canvas({
  import draw: *

  let b(..args) = {
    let args = args.pos()
    content(
      args.at(0),
      args.at(1),
      box(
        align(center + horizon, par(justify: false, leading: 0.5em, args.at(
          args.len() - 1,
        ))),
        stroke: 2pt + if args.len() == 5 { args.at(3) } else { black },
        width: 100%,
        height: 100%,
        radius: 10%,
        inset: 1em,
      ),
      name: args.at(2),
    )
  }

  b((1, 0), (4, -2), "1")[Humoriste]
  b((1, -3), (4, -5), "2")[Persona]
  b(
    (0, -6),
    (5, -8.5),
    "3",
  )[Cristallisation de la persona (personnage scénique)]
  b((6, -6), (12, -8.5), "4", red)[Développements d'oeuvres contemporaines]

  line("1.south", "2.north", mark: (end: ">"))
  line("2.south", "3.north", mark: (end: ">"))
  line("3.east", "4.west", mark: (end: ">"), stroke: red)
}))






Afin d’illustrer nos recherches nous nous appuierons sur deux études de cas apparemment distinctes, mais dont ce mémoire se propose d'en réunir les enjeux autour de notre problématique. Premièrement, il s’agira d'analyser la cinématographie de l'humoriste Coluche. En effet, cette personnalité qui en son temps divise l’opinion publique semble aujourd'hui faire consensus. L'étude de son travail pour un sujet comme le nôtre semble inévitable. Cette personnalité tant politique, qu'artistique, fait la jonction entre les années Giscard et Mitterrand. Son travail accompagne l'entrée de la France dans l'époque moderne en incarnant un comique novateur. Coluche si il n'est en aucun cas le premier humoriste français à s'illustrer au cinéma, met sur scène une langue spontanée ancrée dans le quotidien, s'opposant à ce qui était fait jusqu’ici à la télévision, où tout était écrit. Il fait le pari de créer de l'universel en « Parlant de la société avec les mots d'un inculte #footnote[Propos de Jean-Michel Vaguelsy tiré de l'émission de France culture « Toute une vie : Coluche, le bouffon de la république », le 08/02/2020] ». Celui que Jamel Debbouze qualifie comme « notre mère a tous » change profondément la manière de faire rire en France et ouvre la voie à toute une génération d'humoristes. Dès lors, il s'agira d'analyser comment cette personnalité s'incarne au cinéma. Pour ce faire, nous nous pencherons principalement sur quatre films, à savoir L'Aile ou la cuisse, Inspecteur la Bavure, Le Maître d'école et Tchao pantin. Les trois premiers qui sont réalisés par Claude Zidi et Claude Berri (pour le troisième) sont des comédies à gros budget, qui auront à leur sortie beaucoup de succès. Elles poseront les bases du comique de Coluche au cinéma, et nous serviront à en analyser les mécaniques. Enfin, avec Tchao pantin nous aurons l'occasion d'observer une toute autre facette de l'humoriste qui s'illustre cette fois dans un film à contre emploi. Les premiers films recouvrent un succès populaire et une réception critique incendiaire, le second en plus d’être un succès, offre à Coluche l'adoubement de la profession pour sa prestation en lui décernant le César du meilleur acteur. Il s'agira donc de savoir ce qu'il reste du personnage scénique de Coluche dans ses différents films. Par ailleurs, si nos analyses se focalisent sur ces quatre films, pour nos recherches nous nous baserons sur l'ensemble de la filmographie de Coluche, ainsi que sur ses différents spectacles et sketches télévisuels et radiophoniques.


La seconde partie du corpus s'attachera à analyser le travail d'artistes plus contemporains que sont Éric et Ramzy. Si le choix d'un duo peut sembler en opposition avec la définition de l'humoriste que nous avons donnée précédemment, il n'en est rien. En effet, bien que la dynamique entraînée par le duo lie l'ensemble de leurs spectacles, néanmoins, ces derniers jouent également de l'alternance entre des passages seuls et des passages à deux. Nous considérons donc qu'Éric et Ramzy sont des humoristes au sens ou nous l'avons définit dans la mesure où ils sont capables d'animer seuls sur scène une prestation à visée humoristique, et également puisque leur dynamique au sein du duo joue sur une identité unique que l'on compose à deux. Pour commencer nous nous pencherons sur les débuts télévisuels du duo que ce soit dans une sitcom, une pastille humoristique ou en temps que doubleur de dessin animé, ce sont autant d’éléments qui vont participer de la constitution de la persona des deux humoristes et de ce fait de leur rayonnement sur un public. Puis, nous analyserons le premier film du duo qui n'est autre que La Tour Montparnasse infernale réalisée par Charles Nemes, un réalisateur connu pour avoir tourné les premiers courts métrages de la troupe du Splendid, mais aussi la série H sur laquelle notre duo est auteur au côté notamment de l'humoriste Jamel Debbouze. Le choix de La Tour Montparnasse infernale permettra d'une part d'analyser une comédie à gros budget contemporaine, mais surtout d'observer la transposition du personnage scénique au cinéma par les humoristes eux-mêmes. On assistera de plus dans ce film, à la révélation en France de la figure du « Dumb » popularisé aux États-Unis par le film des frères Farrelly, Dumb and Dumber en 1994. Cet exemple nous permettra aussi d'aborder les enjeux de production de ce type de film, qui s'apparentent à des « star vehicles » spécialement développées pour les humoristes français. Nous verrons qu'à la suite de ce premier succès, le risque concernant l'inscription des personnages scéniques au cinéma se trouve dans leur enfermement au sein d'un registre de comédie manufacturée. Enfin, pour conclure notre réflexion, nous nous pencherons sur les autoproductions dans lesquelles Éric et Ramzy vont finalement s'illustrer dans une dynamique d’affiliation à une forme de comédie d'auteur avec notamment Steak de Quentin Dupieux ou encore la série Platane réalisée et scénarisée par Éric Judor.


Si le travail de Coluche et celui Éric et Ramzy sont apparemment diamétralement opposés que ce soit sur scène ou au cinéma et tant dans le fond que dans la forme nous faisons consciemment le choix de les réunir dans nos recherches. Ce choix tient dans la présence de chacun de ces humoristes au sein d'un même système esthétique et économique. Un système que nous présenterons comme inauguré par Coluche et dont la résolution se trouve dans le travail d’Éric et Ramzy. Ainsi, ce mémoire sera constitué de trois parties qui proposeront de naviguer entre le travail de Coluche et celui du duo afin de révéler des enjeux différents dans des situations similaires. Notre première partie traitera du travail sur scène des humoristes. Ce sera pour nous l’occasion d'analyser les mécaniques de leur comique notamment par l'étude littéraire des textes de leurs spectacles. Dès lors, nous serons en mesure d'entamer notre seconde partie, qui elle se focalisera sur les films comiques de nos humoristes afin d'analyser dans quelle mesure la résurgence de la scène s'y initie. Enfin, il s'agira d'explorer les productions filmiques qui cherchent à remettre en cause la cristallisation du personnage scénique de l'humoriste.


Concernant la méthodologie de recherche que nous emprunterons, cette dernière est à concevoir comme une enquête dont le fil directeur reste l'article d’Alain Badiou. Un article qui puisqu'il paraît en 1999 établit une jonction légitime entre la carrière au cinéma de Coluche prenant fin en 1985 avec Le Fou de guerre (Dino Risi) et celle du duo débutant en 2001 avec La Tour Montparnasse infernale. Afin de mieux appréhender notre corpus nous nous servirons de plusieurs domaines du cinéma et plus largement de sciences humaines que sont l'économie, l'histoire, l'esthétique, mais aussi la théorie de la réception ou encore la linguistique. De par le recours à tous ces domaines mis bout à bout, l'ambition reste la révélation d'une certaine tendance du cinéma français. Ici, « je ne présente pas l'histoire d'un genre, mais j'en présente la logique #footnote[CAVELL, Stanley, A la recherche du bonheur:Hollywood et la comédie du remariage,
  Paris, Vrin, 2017, p.56.] ».


= Faire rire sur scène : étude de sketches

== Les postures comiques de l'humoriste sur scène

Avant de procéder à l'analyse des sketches sur scène de Coluche et d'Éric et Ramzy, nous allons nous atteler à définir les différentes postures comiques auxquelles l'humoriste peut faire appel lors d'une prestation scénique. Pour ce faire, nous nous appuierons sur les sketches présents au sein de notre corpus théâtral. Dès lors, nous nous devons de signaler que les différentes catégories observées découlent du travail restreint de trois humoristes, de ce fait, des catégories supplémentaires peuvent être observées chez d'autres artistes. Pour asseoir nos observations, nous nous baserons sur les travaux de Yoan Verilhac dans son article sur « le sketch humoristique ».


La première posture comique consiste dans le fait que l'humoriste se présente sur scène sous les traits d'un personnage qui, à aucun moment ne brise le quatrième mur. Dans cette situation, il peut porter un déguisement ou même se servir d'accessoires. Cette pratique humoristique très proche des formes théâtrales plus classiques comme le vaudeville, a tendance à effacer les traits effectifs de l'humoriste pour laisser une pleine place à un personnage qui s'éloigne de la réalité effective de l'artiste. On pourra prendre pour exemple le personnage interprété par Coluche dans son sketch « l'auto-stoppeur ». Dans ce dernier, il incarne un jeune homme pris en stop par un automobiliste. Dès lors, le public entend la voix du jeune homme qui dialogue avec le conducteur. Et malgré l'absence physique et sonore de celui-ci, Coluche par son monologue nous donne la sensation de sa présence. À aucun moment, le personnage n'est amené à interagir avec le public, puisque ce dernier est conçu comme ne partageant pas le même espace temps que les spectateurs. La convention théâtrale est ici respectée et même si l'on est allé voir Coluche en spectacle, pour ce sketch on trompe notre perception et on se met à croire en l'univers que l'auto-stoppeur nous fait voir par ses mots.

La seconde posture est proche de la première dans la mesure où l'humoriste dans celle-ci interprète toujours un personnage, à la différence cette fois, que le personnage s'adresse directement au public et entretient avec lui une forme de conversation. Ainsi, dans son sketch « le clochard analphabète » Coluche interprète un sans-abri ( il est de ce fait vêtu en conséquence) qui conte ses différentes aventures. Pour ce faire, il multiplie les adresses au public avec notamment la répétition de verbe insistant sur l'assiduité du locuteur comme « vous voyez », « vous savez ». Le tout est donc formulé en discours direct. Par exemple, quand le personnage nous parle de son frère il nous dit :

#dialogue[
  « C'est pas un con faut pas croire ! Quand il était petit, il écrivait des poésies. Vous savez sur l'amour, les oiseaux, les conneries comme çà quoi, mais bien hein ! Un peu genre Bodelaine. ( sous entendu Baudelaire) »
]

Ce que fait Coluche c'est en somme déclamer « le monologue plutôt spontané d'un personnage de fiction ne s'adressant pas (ou très peu, et le plus souvent sans effets de métalepse) au public#footnote[VAILLANT, Alain, LETOURNEUX, Matthieu, L'Empire du rire XIXe-XXIe siècle, « Le sketch humoristique », Verilhac Yoan, CNRS EDITIONS, 2021, p. 732-733] ». Cette manière d'employer la technique du personnage émerge en France avec l'arrivée du café théâtre. Dès lors, si le fait de casser le quatrième mur n'est pas nouveau, la démocratisation de l'utilisation de ce procédé pour les personnages des humoristes leurs sert à asseoir leur légitimité en se distinguant peu à peu des formes de théâtre traditionnelles.


Notre troisième catégorie c'est ce que Yoan Verilhac appelle « le sketch à régime inter personnel#footnote[Ibid, p.731] ». Dans ce denier, l'humoriste se présente sur scène en son nom et est amené à interagir avec le public de manière spontanée et sans avoir recours à aucun artifice. Cette forme qui est plus communément appelée le stand up laisse une grande place à l'identité réelle de l'humoriste. À titre d'exemple nous pourrons citer le sketch « la publicité » de Coluche. Dans ce sketch où l'humoriste se moque de l'absurdité de certaines publicités, il n'a recours à aucun personnage. Le public le sait, car il n'utilise aucun artifice renseignant de son appartenance à un groupe spécifique ( ex : le képi du flic, la canne de papy Mougeot, le blouson noir du voyou, etc.). Ainsi, il va même jusqu'à signaler au public que la personne qui endosse le discours n'est autre que lui même, Coluche :



« Il est bien le nouvel Omo, c'est celui qui lave encor plus blanc. Moi j'avais l’ancien Omo qui lavait plus blanc et il lavait bien déjà. Et maintenant y a le nouvel Omo qui lave encor plus blanc! Moi j'ose plus changer de lessive j'ai peur que ça devienne transparent après. J'ai déjà l'air con avec des rayures ! »


En associant l'utilisation du pronom personnel « moi » et la référence à son emblématique salopette à « rayures » , Coluche signifie au public l'engagement de sa personne dans son sketch.


Enfin, notre dernière catégorie se trouve à la croisée des trois précédentes puisqu'elle consiste à développer un personnage scénique qui porte le même nom que l'artiste. De ce fait, le spectateur est amené à questionner l'identité du personnage qui évolue sur la scène. S’agit-il de l'auteur, ou est-ce un personnage monté de toute pièce ? Si dans ses « sketches à régime interpersonnel » Michel Colucci présente un Coluche qui embrasse une nuance imperceptible entre réalité et fiction, dans le cas d'Éric et Ramzy la fictionnalisation de leurs personnalités sur scène ne fait aucun doute. Eric Judor définira le jeu de leur duo de la manière suivante : « Il y a un registre qui ressort dans les critiques, c'est l'absurde, et c'est vrai qu'on n'aime pas tellement faire le boucher et l’acheteur […] c'est pas des personnages bien ancrés socialement, c'est n'importe quoi. #footnote[Eric Judor dans le reportage « Eric et Ramzy au palais des glaces », diffusé sur RFO dans L'hébdo, le 29/08/1998] » Dès lors, ils ont bel et bien recours à l'utilisation de personnages, mais ces derniers portent leurs noms et à travers l'utilisation de l'humour absurde, ils procèdent à un éclatement du référentiel, qui leur permet de se distinguer d'une utilisation classique du personnage.


Avec l'ensemble des postures comiques auquel l'humoriste a recours, il se crée une personnalité scénique, qu'il sera parfois amené à exploiter hors de scène, notamment aux cours de ses apparitions médiatiques. Ce personnage développe une complicité avec le public, un public qui s’attend à ce que l'artiste lui fournisse sur chacun des médiums dans lequel il intervient, la recette du personnage scénique qu'il connaît et apprécie. Pour l'humoriste « Il s’agit d’installer des traces rapides et nettes d'un univers excédant le sketch même, et dans lequel le sketch prend sens : univers de fiction, univers médiatique, « ton », monde référentiel perçu comme étant celui de l'artiste lui-même#footnote[VAILLANT, Alain, LETOURNEUX, Matthieu, L'Empire du rire XIXe-XXIe siècle, « Le sketch humoristique », Verilhac Yoan, CNRS EDITIONS, 2021, p. 731]. » C'est suivant cette dynamique que l'humoriste obtient ses entrées dans le cinéma. Ramzy Bédia racontera que les producteurs de La Tour Montparnasse infernale ont accepté de fiancer le film sur la base du visionnage de leur premier spectacle, alors même qu'à l'époque les membres du duo leur avaient avoué être novices vis-à-vis du métier de scénariste. Dès lors, avant d'étudier les prestations des artistes au cinéma, nous nous attellerons à décrypter les ressorts de leur personnage scénique.


== L'histoire d'un mec qui fait ses adieux au music-hall : Coluche, la création d'un personnage

=== Coluche Un humour biographique


Michel Colucci, de son nom de scène Coluche, né le 28 octobre 1944 dans le 14e arrondissement de Paris d'une mère fleuriste et d'un père peintre en bâtiment. Ce dernier immigré italien décède en 1947 d'une poliomyélite, laissant ainsi son épouse seule pour élever leurs deux enfants. La famille s'installe alors à Montrouge ou elle vit dans un appartement vétuste. Michel Colucci se désintéresse rapidement de ses études et préfère traîner avec sa bande de copains, une bande qui flirte avec le petit banditisme. Michel aura d’ailleurs plusieurs fois affaire à la police durant cette période. Dès lors, suite aux remontrances de sa mère il tente de trouver un emploi. C'est ainsi qu'il enchaînera plusieurs jobs comme garçon de café, aide-pompiste, télégraphiste ou encore livreurs. Aucun de ses emplois ne lui conviendra vraiment et il n'aura de cesse d’être renvoyé ou de démissionner. En parallèle de ses activités professionnelles changeantes, Michel porte un fort intérêt pour la musique, notamment le rock et décide de se lancer dans une carrière de musicien avec son groupe, « les Craignos Boboys ». Ce passage par la musique le rapprochera du milieu des cabarets parisiens et lui permettra de faire la connaissance de Romain Bouteille avec lequel il participera à la création du Café de la gare , ce qui signera ses débuts comme humoriste. Michel Colucci deviendra alors aux yeux du public Coluche.


L'ensemble de son œuvre sur scène est pleinement marqué par les événements vécus dans sa jeunesse. Ainsi, la galerie des personnages qu'il présente dans ses différents sketches est régulièrement développée grâce au recours à des éléments biographiques. Cela est particulièrement notable à travers des numéros comme « le blouson noir » « je suis un voyou » ou encore « la bagarre ». Dans ces derniers, Coluche incarne des jeunes que l'on qualifiera de « voyous » selon ses propres termes. Dès lors, la thématique est abordée avec une grande précision et permet à l'humoriste de proposer une parodie d'un sujet qu'il connaît intimement. On sait que Coluche, lorsqu'il vivait à Montrouge a côtoyé et fait partie de ces bandes de « voyous », le fait de les incarner sur scène lui permet de donner une visibilité à cette partie de la jeunesse des années 70/80, mais cette fois-ci, loin des discours dominants qui stigmatisent, puisque l'auteur propose une vision interne. On peut être amené à se demander comment, alors que l'humour de Coluche repose sur une exagération des traits des différents personnages qu'il incarne, il propose à son public un rire qui ne se construit pas au détriment de ses sujets ?

Dans « le blouson noir », le procédé comique repose sur trois dynamiques. La première provient de l’énonciation répétée de mots permettant un marquage socioculturel. Ainsi, Coluche utilise l’expression « s'tu veux » à la manière d'une ponctuation. Il ancre son personnage dans une réalité où le mot « putain » ne peut être prononcé que « ptin » . À cela, s'ajoutent les histoires qu'ils nous racontent dans la première partie du sketch, qui tourne globalement autour des bagarres et autres délits que lui et sa bande menée par son amie Boby ont perpétrés la veille. Le public identifie le type de personnage auquel il a affaire et va alors dans un premier temps rire au premier degré de lui, du langage grossier qu'il utilise, en un sens de la caricature qu'il représente. Une fois cette identification effectuée le tout est d’évoluer vers un comique qui ne soit pas stigmatisant. Dès lors, le rire prend un autre chemin puisque ce qui fait désormais le comique provient de l'utilisation incorrecte ou mal habile de mots et de concepts « savants » par le personnage. Ainsi, pour parler de Karl Marx il utilise la métonymie « le barbu » avent de se tromper en l'appelant à plusieurs reprises « Kale Masque ». Dans cette même idée, le personnage dira à propos de son ami Boby:

« c'est un mec, c'est pas un con, il lit des bouquins et tout. J'ai regardé dans
sa bibliothèque il lit des bouquins je comprends même pas le titre. Il a
réfléchi sur sa condition et tout ! Il dit toujours, si la société nous rejette
c'est pour oublier que c'est elle qui nous a créés... LAHH ! » Au-delà de la dimension comique qui est permise grâce à une forme de naïveté et d'ignorance de la part du personnage, c'est en sous texte le discours de l'humoriste qui ressort. La terminologie argotique « bouquin » crée encore une fois un marqueur social, mais permet aussi de pointer les inégalités auxquelles le personnage est confronté. Le monde littéraire et « cultivé » est pour lui très opaque de par sa condition sociale. Dès lors l'admiration qu'il témoigne à l’égard de Boby provient du fait qu'il lie. Le « voyou », qui né d'une carence de l'état, s’il est brutal et évolue dans la violence, conserve un respect pour la culture matérialisée ici par « les bouquins ». Dans ce sketch le personnage n'est pas stigmatisé dans la mesure où il est écouté pour des histoires qui dépassent le stéréotype, le public peut alors entendre le discours d'un marginal sur des sujets où on ne l'attend pas. Le décalage créé sert le comique tout en donnant une contenance au personnage.

Enfin, Coluche développe son comique autour d'un dernier procédé qui consiste à faire en sorte que son personnage fasse lui-même consciemment des blagues : « Il paraît que dieu c'est lui qu'a dit que l'homme est égaux. Il paraît que dieu il a dit, il y aura des hommes blancs, il y aura des hommes noirs, il y aura des hommes petits, il y aura des hommes grands, il y aura des hommes beaux, il y aura des hommes moches et tous seront égaux... Mais ce sera pas facile. Et puis il à même ajouté, il y en aura qui seront noirs, petits et moches et pour eux ce sera très dur. »

À travers cette posture, l'auteur transforme les rires du public, puisque désormais on ne rit plus du personnage, mais avec lui. En devenant l'auteur de la blague le « voyou » devient aussi un peu l'artiste de music-hall ce qui lui permet enfin d'accéder à cette « culture » qui lui était auparavant opaque. Dans la mesure où le geste comique de Coluche partait d'un vécu personnel il ne pouvait être galvaudant ou dénigrant.

À cette représentation des figures marginalisées, l’œuvre de Coluche oppose naturellement le spectacle de ceux qui incarnent le pouvoir. C'est pour lui l'occasion de contester ce qui apparaît comme établi dans nos sociétés, en donnant un visage humain et une contenance aux figures d'autorité pouvant apparaître comme floues. On pourra citer des sketches comme « le flic », ou « l’ancien combattent » qui tourne en dérision ceux qui incarnent les bras armés de l'état. Dans « le flic » le comique ressort essentiellement du grotesque du personnage. Ce dernier est un incompétent participant activement à la violence d'un état systémique, mais ne semblant pas prendre conscience de la gravité de ses actes. Ainsi il suit naïvement les ordres de sa hiérarchie sans jamais la contester et s'attaque aux « mecs louches » ceux qu'on lui a appris à interpeller, à savoir les « basanés », les « manifestants » et les « beatniks ». Ainsi, le personnage qui s'adresse directement au public lui dit la chose suivante : « L'autre jour, j’étais de faction à une intersection affecté à la surveillance des usagers. En clair, je buvais à un carrefour […] Je vois un mec il s’amène avec un petit papier, je sentais qu'il voulait me demander un renseignement, mais on aurait dit qu'il osai pas, qu'il avait peur. Tu sais genre le mec louche un peu... basané. Nous on nous apprend à reconnaître les mecs louches, on fait des stages et tout. »

Cette phrase relève une contradiction entre ce qui appartient au discours officiel et la réalité à laquelle appartient le personnage du « flic ». L'auteur procède à une nette rupture du niveau de langage. Le personnage ne fait que répéter ce que « le manuel » lui a dicté en des termes bien savants et artificiels. Dès lors, il ne peut embrasser que furtivement le discours officiel et opère par le langage, un retour brutal à la réalité. Ce décalage qui permet le geste comique est un moyen pour l'auteur d’élargir sa réflexion sur la question de l'autorité. En effet, ce langage sophistiqué, Coluche en révèle le caractère creux. Dès lors, de la même manière que le jargon administratif permet de couvrir l'incompétence et les « bavures » du « flic » de Coluche, les discours sophistes utilisés par les pouvoirs publics, éclipsent les réalités sociales. L'ensemble des personnages que Coluche incarne sur scène recouvre un geste comique résolument politique.


=== La nation de Coluche

Comme nous avons pu le constater, Coluche dans ses spectacles a tendance à s’appuyer sur différents personnages qu'il incarne en les dotent d'un vécu plus ou moins autobiographique. Mais ce qui fera sa spécificité en matière de personnages c'est sa capacité à représenter un panel d’individus illustrant le paysage socio-culturel français de son époque. Le philosophe Olivier Mongin décrit son utilisation des personnages de la manière suivante:

« Il n'est pas dans le durcissement identitaire : il pratique le renversement carnavalesque. Plutôt qu'un populiste, c'est un démiurge. Un personnage devient un autre personnage : le petit devient le gros, l'Arabe est CRS, etc. Coluche bouscule les identités, entrechoque les personnages. A travers ses sketches, on pourrait raconter l'histoire de France des années 70 à 86. Dans le Schmilblick, il joue toute une série de figures de la société émergante. Et dans ses spectacles, il finit par mettre en avant le marginal : le Noir, le paumé, l'Arabe. Il parvient même à faire rire du pauvre. Bref, Coluche fait parler les victimes sans les enfermer dans leur statut de victimes #footnote[Olivier Mongin, interview de Renaud Dely, dans Libération, le 19/06/2006]. »

Les sketches de Coluche sont des constats sociaux présentant des personnages identifiables par le public puisqu'il s'agit aussi bien du prof de sport que du chômeur, de l'étudiant que de l'ouvrier. C'est sans doute cette manière de faire rire avec un référentiel collectif qui vaudra à Coluche d’être si populaire auprès des français. De plus, comme le souligne Mongin, il accorde dans ses prestations une grande place à toute une frange de la population jusqu'ici globalement marginalisé et sous représenté dans les différents médias. Cette représentation de ceux qu'on ne représente, pas ou de manière stigmatisante est opérée par l'humoriste avec beaucoup de modernité. Ils n'hésite pas à se jouer des clichés en les détournant subtilement. Dés lors, si les personnages de Coluche sont caractérisés par une morale douteuse (puisque c'est de là qu'il tire son comique), l'humoriste place dans ses textes une fenêtre de sortie pour ces derniers, en faisant d'eux des naïfs. C'est parce qu'ils sont inconscients et influençables qu'ils se comportent comme des « cons ». Le public est donc à même de développer de l’empathie pour ces personnages qui sont un miroir à peine déformant de la société française. Suivant cette même mécanique, lorsqu'ils fait des blagues sur les suisses et les belges, les véritables personnes visées ce sont les français. Le belge est pour le spectateur de Coluche cette autre que lui qui pourtant lui ressemble. Il est donc en mesure de s'identifier tout en mettant le propos à distance de part cette barrière nationale fictive. L'acteur Gerard Lanvin, qui habita pendant quelques années chez Coluche déclara avoir été régulièrement mandaté par l'humoriste pour faire le travail de « brèves de comptoirs#footnote[Gérard LANVIN dans l'émission « popopop » sur France Inter, diffusé le 01/03/2021] ». A savoir rapporter ce qui est entendu dans les bars afin d’enrichir les sketches. L'observation des gens permet d'extraire des tics de langage, des gestes significatifs et des histoires singulières, tous ces éléments sont utilisés au service du comique et viennent nourrir les personnages. Le public s'approprie un humour qui lui est forcément familier. De ce fait, le rire que nous propose Coluche « sert à affirmer l'identité et la cohésion à l’intérieur d'une collectivité nationale #footnote[VAILLANT, Alain, La Civilisation du rire, CNRS EDITIONS, 2016 , p. 289] ». Plutôt que la division, c'est l'appartenance de chaque individualité à un tout qui est le maître mot de son comique.

=== Coluche comme seul personnage



Nous l'avons vu, Coluche, a construit une grande partie de ses spectacles en ayant recours à l'utilisation de personnages. Si ces derniers recouvrent leurs spécificités à travers leurs tics de langage, des accents ou l'utilisation d’accessoires, néanmoins il apparaît que celui qui leur donne vie n'est autre que l'homme à la salopette rayée et au t-shirt jaune, Coluche, mais Coluche comme personnage matriciel (à distinguer de Michel Colucci). En effet, qu'il soit flic, fleuriste, ancien combattant ou blouson noir, il revêt son emblématique costume. Il corrobora cette idée au cours d'une interview accordée à FR3 dans laquelle il dit la chose suivante : « C'est ça le principe, en fait c'est le même mec, le mec c'est moi, qui prend la position de tout le monde. Il se met dans la peau du connard en question. Alors il peut être père de famille ancien combattant, flic, auto-stoppeur, c'est toujours le même#footnote[Coluche dans le reportage « Coluche à Bobino » diffusé sur FR3, le 27/11/1973]. »

Dès lors, si cette posture se traduit par l'habit, elle est aussi identifiable grâce à l'utilisation d'un ton emblématique présent aussi bien dans ses sketches de stand up que dans la bouche de ses personnages. Son langage repose sur une impression de spontanéité qui fait la part belle aux grossièretés, mélange les registres et multiplie les accidents dans les tournures de phrase, le tout est au service d'un comique qui se joue des mots. De plus ce qui fait la spécificité de Coluche c'est aussi ça capacité à développer des punchs lines modernes. La terminologie punch line qui est tirée du jargon humoristique consiste en une phrase qui a pour objectif de clôturer avec efficacité un passage. Elle contient à la fois l'idée la plus forte et vise à provoquer les rires les plus importants d'un sketch. Si on peut dire que les punchs lines de Coluche sont « moderne », c'est parce qu'en majorité elle ne s’appuie pas ni sur un jeu de mots ni sur l'utilisation d'un accent, le geste comique provient alors d'un effet d’incongruité primaire. Ces deux procédés sont récurrents chez les humoristes français de la période ( ex : Raymond Devos, Michel Leeb ). Les punchs lines de Coluche reposent sur un comique d'observation mis au service d'une opinion, le tout formulé de manière décalée, ce qui provoque l'effet d’incongruité. Pour exemple dans « l'étudiant » il nous dit : « Quand j' étais petit à la maison le plus difficile c'était la fin du mois, surtout les 30 derniers jours. » Cette manière de faire rire ne sera démocratisée en France qu'en 2006 avec l'arrivée du stand up par le biais du Jamel Comédy Club. À ce titre Coluche apparaît comme un précurseur. Affin d'illustrer ce que l'on considère comme le « ton » spécifique de Coluche on pourra citer le sketch « L'étudiant » dans lequel on peut entendre la chose suivante :

« J'ai fait tout qu'est ce qu'on m'a dit. J'ai fait la guerre avec les Allemands. Ou contre les Allemands d’ailleurs. Non avec ! il la faisait aussi eux. J'ai fait comme on m'a demandé deux enfants virgule six. J'en ai eu trois, j'ai pas trouvé la virgule. Et maintenant j'ai plus de travail, j'aimerais savoir qu'est ce qui faut que je fait ? Et les mecs ils ont répondu. Écrivez-nous de quoi vous avez besoin, on vous expliquera comment vous en passé. »


Dans ce passage on retrouve son sens de la punch line avec une dernière phrase qui clôt le mouvement efficacement. Le tout est amené par un discours multipliant les erreurs de syntaxe et proposant un regard satirique sur les formules toutes faites et les discours officiels. Oliver Mongin embrasse cette idée d'un personnage scénique Coluche qui propose à son spectateur des déclinaisons de lui même :



« Sa force, c'est qu'il s'invente un personnage, un saltimbanque, qui lui permet de décliner toute une série d'autres personnages. Il y a le costume ; la salopette, les chaussures jaunes, le badge «Coluche» qu'il porte le jour de son premier passage à la télévision ; mais au-delà, il est d'une mobilité tout à fait inédite. Il n'est pas dans le clip télé. Il est capable de faire du récit. Le sketch matriciel, l'histoire d'un mec, dure plus de dix minutes ! En fait, c'est l'histoire du mec Coluche racontée par plein d'autres mecs#footnote[Olivier Mongin, interview de Renaud Dely, dans Libération, le 19/06/2006]. »

Dès lors, si le personnage scénique Coluche s’illustre comme le « démiurge » développant un panel d'autres personnages, il va également s'incarner sur scène dans la seconde partie de sa carrière d'une manière plus frontale dans ses « sketches à régime inter personnel ». En effet, ce que fait Coluche dans des sketches comme « la publicité », « votez nul », ou encore « si j'ai bien tout lu Freud », c'est du stand up qui n'en porte pas encore le nom. Les propos qu'il tient peuvent alors lui être directement assignés . Dans son sketch « les journalistes », il se présente sur scène en son nom avec un journal dans les mains avant de dire: « Les journalistes disent toujours qu'on dit que des conneries, et maintenant je vais dire les leurs, ça va les promener ! ». Dans ce sketch, il est à la fois le type qui lit le journal au bistro à qui veut bien l'entendre, et l'intellectuel qui propose un commentaire de texte nourrit par ses observations, comme nous pouvons le voir lorsqu'il dit : « « Les chefs d'État se sont refusés à tout commentaire. » Alors là, le journaliste l'avoue, il ne sait rien ». Le geste comique vient de la révélation de l'absurdité des propos tenus par certains journalistes. Le rire est déclenché à travers la désacralisation d'une figure d'autorité par le biais d'un langage populaire et accessible. C'est sans doute ce personnage-ci qui apportera la plus grande popularité à l'humoriste, puisque c'est avec celui-ci qu'il se lance dans son improbable campagne présidentielle. Il aura su toucher à travers son langage parfois grossier , sa rondeur physique, son discours franc, sans concession et surtout son comique l’intérêt massif des spectateurs français de son époque.


=== « Coluche, le bouffon de la république »


Le 18 juin 1996, Coluche décédait dans un accident de la route, deux jours plus tard, le journaliste Serge July publie dans Libération un article rendant hommage à l'humoriste intitulé « Coluche, le bouffon de la république » à travers cette appellation on touche à l'une des caractéristiques essentielles du personnage de Coluche. En effet, ce dernier prend dans la société française la fonction du « bouffon ». Cette fonction est définie par l'écrivaine Danielle Sallenave :


« Le bouffon désignait autrefois une fonction très importante à la cour, d’un roi ou d’un seigneur : faire rire, distraire, par ses attitudes, par son langage. Et davantage : le bouffon du roi ou du seigneur est le vecteur d’une dérision, qui vise explicitement le pouvoir, et celui qui l’incarne. Il a le droit de se moquer de tout sans risque ; tout autre que lui serait sévèrement châtié#footnote[SALLENAVE, Danièle de l’Académie française « Le bouffon », Le bloc note de l'académie Française [En ligne], mis en ligne le 01/02/2018, consulté le 10/05/2023)]. »


A travers son comique Coluche réactualise cette figure en proposant certes la raillerie du pouvoir politique le plus direct dont les présidents Giscard d'Estaing puis François Mitterrand feront les frais, mais aussi de la norme sociétale tout entière. En effet, le terme de « république » utilisé par July présuppose d'un régime politique hétérogène composé d'élus et de leurs administrés, dans ce contexte tous sont supposés avoir un impact palpable sur la constitution de la société française. Coluche à travers ses différents sketchs fait la satire de tout ceux qui compose cette république que ce soit, le banlieusard, le paysan, le journaliste, l'étudiant, le retraité, le publiciste ou le président de la république. Ainsi, Coluche dans son entreprise va pleinement s'inscrire dans la lignée du fou du roi en ne faisant : « qu’actualiser des fonctions sociales essentielles, à mi-chemin entre l’évacuation et la célébration du chaos à l’intérieur d’un ordre établi. Il est à classer parmi les grands perturbateurs universels. Le bouffon est celui qui imite, qui joue la folie, non seulement pour s’en moquer, mais encore pour l’utiliser, la retourner parfois en sagesse, sans hésiter à la pointer vers l’homme#footnote[DANG, Benjamin, « Le bouffon, un héraut du vide », Les chantiers de la création [En ligne], mis en ligne le 12/07/2021, p. 2, consulté le 10/05/2023]. » Le personnage de Coluche propose irrévocablement un retour vers l'homme qu'il incarne corporellement par sa présence dans l'espace scénique. L'homme sur scène est imparfait, il bégaye, dérape, trébuche face aux incompréhensions qu'il révèle mais pourtant, à sa fragilité, il oppose une résilience audacieuse. C'est un miroir déformant que Coluche tend aux spectateurs mais comme il est le « bouffon » cela est accepté. Le moqueur ne provoque pas la crispation de l’ego du moqué il peut donc continuer sa satire sans qu'on lui oppose de limite. La raison de cette liberté est nommée par July dans son article :

« Impossible de le faire taire tellement tout le monde rigole, même ceux qui devraient en avoir honte. En toute occasion, Coluche affichait, manifestait une liberté phénoménale, que ce soit à la table de Giscard ou de Mitterrand, à la télé, sur scène, avec ses amis, ou dans le plaisir. Cette liberté, chacun sentait bien son caractère immense, quasiment illimité#footnote[JULY, Serge, « Coluche, bouffon de la république », Libération publié le 20/06/1996]. » Si Coluche s’accorde sur scène cette liberté de ton, c'est tout simplement puisqu'il fait rire ses spectateurs. Son personnage remplit sa fonction première. Une fois le contrat tacite du rire accompli, le contenu peut prendre la nature qu'il désire. Coluche fait de l'humour corrosif son terrain de jeu et en abordant des sujets tabous, il propose un réflexion sur sa société. Le paroxysme de cette posture atteindra pour l'humoriste son pic lorsque ce dernier en 1981 proposera sa candidature à l’élection présidentielle. Ainsi, le « bouffon » transforme l’événement démocratique en une pantalonnade. Mais cette fois ci, il commet l'affront capital pour un humoriste en se positionnant au même niveau que ceux dont il se moque. Coluche prend ainsi un double ascendant puisqu'il est légitimé par le rire et surtout par les lois républicaines. Ce geste installe définitivement l'humoriste dans la position du « bouffon » puisqu'ils propose concrètement un contre pouvoir et si les élections n'apporteront finalement aucun débouché, la création des Restos du cœur en 1985 peut être lue comme le symptôme d'une défaillance étatique concrètement solutionnée par « le bouffon de la république ».

== Éric et Ramzy : le rire comme seul maître mot

Éric Judor et Ramzy Bedia se rencontrent dans les années 90 et font leurs premières scènes en 1996 au café théâtre, le Bec fin. La dynamique du duo opère sur le public et ces compères sont amenés à évoluer dans de plus grandes salles parisiennes à l'instar du Trévise et du Café de la Gare. Rapidement, ils sont repérés par Radio Nova qui les embauche pour faire des interventions, puis par Fun Radio pour animer leur propre émission, « Le Éric et Ramzy show », toujours en 1996 (ils seront par la suite renvoyés et remplacés par Michaël Youn et Vincent Desagnat, déjà chroniqueurs sur l'émission, ce qui donnera naissance au Morning Live). En 1998, ils font leurs débuts à la télévision sur M6 dans une pastille humoristique (visant à remplacer Caméra Café) intitulée Les Mots d'Éric et Ramzy. En parallèle, de cette présence médiatique le duo joue son spectacle sur la scène du Splendide puis au Palais des glaces et en tournée dans toute la France. C'est lors d'une des représentations au Palais des glaces, que le producteur Sébastien Fechner les repère et décide de financer leur premier long métrage. Cette collaboration donnera lieu en 2001 à la sortie en salle du film La Tour Montparnasse infernale. Au cours de ces années, Éric Judor et Ramzy Bedia vont doter leurs personnages scéniques d'une identité propre définie par une interdépendance des entités qu'ils ont créées. Ces personnages sont alors déclinés de manière à pouvoir s'adapter à tous les médiums. Le nom de leur deuxième spectacle Éric ké Ramzy, (2005) témoigne d'une part du ciment qui lie leurs personnages, mais surtout de la transformation de leurs prénoms en quelque chose qui relève de la marque ou du label. L'association de leurs noms relève désormais du domaine de la pop culture et c'est l'orthographe qui doit s'adapter à la tendance populaire. Dans cette partie nous gagerons d'analyser les mécaniques comiques qui se cachent derrière le nom d' Éric et Ramzy.


=== Le Duo entre équilibre et déséquilibre


Dans la mesure ou Éric et Ramzy proposent sur scène la formation d'un duo, ils s'inscrivent nécessairement dans une histoire de la comédie au sens large. Que ce soit sur scène dans une forme scénique avec en France les chansonniers Francis Blanche et Pierre Dac, au Québec les humoristes Ding et Dong ou encore aux États-Unis avec le duo phare des années 70 Cheech et Chong,( en notant que les deux derniers ont eu le droit à une suite cinématographique à l'instar d'Éric et Ramzy #footnote[ADLER, Lou, Chieech et Chong :Faut trouver le joint, 1978 CHARTRAND, Alain, Ding et Dong, le film, 1990]), ou bien au cinéma où le duo comique est un motif aussi récurant que divers. On peut alors citer pour le film burlesque Laurel et Hardy dans Big business (1929), pour le Buddy Movie Jackie Chan et Chris Tucker dans Rush Hour (1998), pour la comédie de remariage Kathrine Hepburn et Cary Grant dans L'Impossible monsieur bébé (1938) ou pour la comédie française Bourvil et Louis de Funès dans Le Corniaud (1965).


Ces exemples témoignent de paternes communs au sein de la formation d'un duo comique. Il y a tout d'abord une disparité physique, le grand, le petit ; l'homme, la femme ; l'Asiatique, l'Afro-Américain. Ces disparités créent un déséquilibre, l'un est trop petit pour atteindre un objet l'autre trop grand pour passer les portes. L'une subit le sexisme, l'autre est enfermé dans les diktat de sa masculinité, l'un subit les stéréotypes sur la communauté asiatique l'autre sur la communauté noire. À cette disparité physique s'ajoute bien souvent une disparité caractérielle, l'un est excentrique, l'autre introverti ; l'un est politiquement de gauche, l'autre de droite ; l'un est perfide, l'autre naïf. Chacun des ces éléments, relève d'une distance entre les vécus des membres du duo, et permet ainsi de créer une inégalité qui va servir la composition du jeu comique. La dynamique première du duo provient donc du déséquilibre entre ses membres, mais elle ne peut être réduite à cela. En effet pour devenir comique et ne pas tomber dans la rivalité tragique, le duo doit se retrouver sur des points d'accointance. Ils vont donc s'accoter pour poursuivre un but commun, la lutte contre un même ennemi, la recherche d'un trésor, la divulgation d'un mensonge ou plus simplement le déclenchement du rire du spectateur. Dès lors, pour atteindre leurs objectifs les membres du duo vont devoir créer un équilibre en transformant leur déséquilibre en complémentarité. Dans L'Impossible monsieur bébé d' Howard Hawks, c'est grâce à l'association de l'excentricité de Kathrine Hepburn et la discipline de Cary Grant que le duo retrouve le léopard permettent ainsi le happy ending hollywoodien.


Si le duo de comédie apparaît comme un motif canonique des arts du spectacle, on pourrait faire remonter cette tradition à un âge bien antérieur aux exemples que nous avons donnés précédemment. En effet, autour de 1550 la figure du clown bien avant d’être un protagoniste des arts du cirque va émerger du théâtre classique anglais. Le clown à son apparition désigne de manière très englobante « l’artiste comique #footnote[Goudard, Philippe,« Le clown, poète du deshordre » dans Sens-Dessous, 2013, n°11]». C'est à travers les siècles et l’influence d'autres traditions scéniques comme la pantomime équestre , ou la comédia d'ell arte que la figure du clown va être amenée à ce préciser jusqu'à proposer une typologie des différents clowns. C'est ici précisément que nous retrouvons la question du duo comique avec la figure du clown blanc et celle de l'auguste (ou clown rouge). Le clown blanc se caractérise par son sérieux et son intelligence, il représente la loi et l'ordre, bien souvent ce personnage est issu d'un rang social supérieur à celui de l'auguste, qui quant à lui est un être « mal éduqué et transgressif, difficilement contrôlable et [qui] renoue avec l'héritage du comique populaire : l'effervescence du désordre#footnote[Ibid]. »


Ces deux figures forment un duo comique au sein duquel le clown blanc utilise un raisonnement logique afin de diriger et de composer avec son comparse, mais ce dernier disposant d'une logique qui lui est propre, l'ensemble des actions menées par le duo aboutissent systématiquement à un renversement carnavalesque. En somme, si l'un donne un ordre l'autre n'arrive pas à l'achever et va même jusqu'à une aggravation de la situation. Cette dynamique du clown blanc et de l'auguste on la retrouve de manière plus ou moins appuyée dans les exemples cités précédemment, néanmoins, la modernisation de cette forme tend à se faire sentir et cela, on en à les traces dès les années 20 dans le travail de Laurel et Hardy. En effet, ces derniers ne s'enferment pas dans le rôle du clown blanc et de l'auguste, bien souvent les caractères s'intervertissent pour présenter des personnages qui sont finalement à la fois auguste et clown blanc. Dans tout cela, Éric et Ramzy à l'instar de leurs prédécesseurs proposent la formation d'un duo résolument clownesque, mais cette fois-ci la formation d'un couple auguste, clown blanc n'est plus si évidente.

Dans leur premier spectacle #footnote[Eric et Ramzy : Au Palais des Glaces, 1998] (qui nous servira de corpus dans cette sous partie pour analyser la dynamique de leur duo), Éric et Ramzy donnent au public en gage de première lecture une fausse vérité. Celle selon laquelle il y en aurait un des deux qui serait plus intelligent ou qui aurait l'ascendant sur l'autre, en l’occurrence Ramzy. Cette impression vient du positionnement de Ramzy lors du spectacle. En effet, il est plus grand qu'Éric ce qui déploie une dominance tout d'abord visuelle. À cela, s’ajoute le fait que Ramzy semble prendre en main le récit de l'action en multipliant l'utilisation de phrase impérative ou guidant tout simplement l'action :

#dialogue[

  « Niazron, lève toi et marche ! »

  (Sketch 2, 00:05:12)

  « Ce soir nous allons essayer d'apprendre un mot. »

  (Sketch 3, 00:08:43)

  « Éric viens il y à un rappelle »

  (Sketch 15, 01:14:49)
]



Éric quant à lui est dans une certaine mesure plus passif, il consent jusqu'à un certain point à entrer dans le jeu de son partenaire. Il va alors afficher une tonalité de jeu plus naïf et enfantine qui passe notamment par la modification de sa voix, qui adopte des notes plus aiguës, et propose une inadéquation entre les variations vocales et le contenu de ses phrases (ex : doter d'une ouverture sonore interrogative une phrase grammaticalement impérative). A cela s'ajoute le développement d'un comportement crédule. Ainsi, dans le treizième sketch du spectacle (00:55:00) le duo ramène sur scène un tableau blanc sur lequel est écrit le mot « contrepèterie ». Leur objectif est de donner leur propre définition du mot au public, une définition qui évidemment se révèle incorrecte. Mais avant de faire cela Ramzy se positionne derrière le tableau et commence à parler en étant bien mal caché. C'est alors qu'il dit : « Éric c'est le tableau qui te parle ». Ce dernier tombe dans la supercherie et entame une conversation avec « le tableau ». Dès lors, Ramzy cherche à utiliser ce stratagème pour se moquer de son partenaire, mais la chose finit irrévocablement par se retourner contre lui :

« Ramzy : Ça te ferait plaisir de jouer avec monsieur tableau ? Tu sais que monsieur tableau est déjà très copain avec Ramzy ! Tu connais Ramzy ? Éric : Il est con hein !( en désignant Ramzy au tableau) »

À travers cet exemple, on pourrait considérer que Ramzy occupe la place du clown blanc et Éric celle de l'auguste, mais cela n'est pourtant pas exact puisque nous l'avons vu, si le clown blanc est un personnage qui doit faire preuve d'autorité, il se distingue également par un ascendant intellectuel sur son partenaire. C'est sur ce point précisément que l'on peut émettre une objection. Pour ce faire il nous suffit d'analyser le dernier sketch du spectacle (01:14:49). Dans celui-ci, en gage de rappel, Ramzy demande à Éric de revenir sur scène pour qu'ils donnent la définition d'un dernier mot. Ce à quoi Éric répond avec une voix qui n'est plus cette fois-ci enfantine : « Non ! Je passe pour un bouffon dans ce sketch ! » Il finit par venir sur scène en dégageant très peu d'enthousiasme. Éric récite sa partition sans jouer le jeu et se confronte à un Ramzy qui sans doute pour compenser le peu d’entrain de son partenaire et le ramener sur sa partition, se met à surjouer. Éric ne va alors pas hésiter à lui signifier qu'il en fait trop : « Par contre il faut arrêter de jouer comme Jean Lefebvre là. » On peut donc comprendre que l’ascendant qui est développé par Ramzy sur Éric n'est permis que par la bonne volonté de ce dernier à embrasser la même partition de jeu enfantine. Lorsque Éric refuse de jouer le jeu de Ramzy, il fait dérailler le récit sans pour autant en prendre le total contrôle dans la mesure ou bien que la partition sonne faux elle reste achevée. Ainsi, on peut dire qu'ils forment un duo composé non pas d'un clown blanc et d'un auguste , mais de deux augustes, dont l'un d'entre eux en l'occurrence Ramzy se prend pour un clown blanc. (égalité apuyer par les costumes).

=== Le monde de l'enfance

Le premier spectacle d'Éric et Ramzy s'ouvre sur un sketch qui sert aux humoristes d'introduction à leur univers comique. L'ouverture se fait par le retentissement d'une musique à la tonalité grave et grandiloquente. Puis, on assiste à l'apparition de lumières qui vont venir découper les silhouettes des deux humoristes sur le fond de la scène. Enfin, une voix surplombante et grave s'adresse aux spectateurs en anglais pour introduire le show (« And now ! for the first time in space ! »). À tout cela, s'ajoute une épaisse fumée qui vient envahir l'espace scénique, et ajouter encore un peu plus à la grandiloquence du moment. C'est à ce moment-là que la mise en scène change de tonalité, la fumée devient si présente que les silhouettes jusqu'ici immobiles se mettent à agiter les bras pour pour pouvoir trouver de l'air, les lumières s'allument et on découvre Éric et Ramzy qui toussent et demandent à ce que la musique, la fumée et la lumière cessent :

#dialogue[
  « Ramzy : Stop !Qu'est ce qu'il se passe là ! ho !

  Éric : On avait pas demandé ça nous. On avait demandé deux lumières

  […]

  Ramzy : C'est pas des lumière pour des comiques, nous on est là pour faire des blagues.

  Éric : Avec des lumières et des fumées attaquantes comme ça on est quasiment obligé de ramener des chevaux sur scène. »
]

Dès lors, ils remettent en question le dispositif scénique qu'on leur propose puisqu'il réfute la lumière, la fumée, la musique en les faisant s’arrêter. Puis, c'est au tour de la voix surplombante, puisque cette dernière finit par s'adresser directement aux humoristes (« What are you doing here? ») ce qui lui fait perdre sa supériorité zénithale. La voix entre dans le jeu du duo et elle subit elle qui était jusqu'ici sérieuse, un détournement comique. La voix pensait se trouver au Palais des Sports, mais elle est au Palais des Glaces, les humoristes lui indiquent donc dans un anglais très approximatif la direction de la bonne salle ce qui finit par faire disparaître la voix. Le ton est donc donné, leur spectacle ne peut pas se prendre au sérieux, il a le devoir de désamorcer toutes les situations en faisant échouer toute tentative d'artificialité. Alors, le duo aspire à proposer un comique qui viendrait du dedans et qui ne peut donc avoir recours à une béquille dont l'objectif serait de valoriser esthétiquement la figure de l'humoriste. Tout ce qui compose l'espace créatif doit irrévocablement être au service de la blague. Pour ce faire, Éric et Ramzy développent deux personnages d'auguste, qui pourraient plus simplement être considérés comme deux enfants. Ils ne possèdent, ni ne maîtrisent les codes sociaux, ont des référents approximatifs, se chamaillent et surtout passent leurs temps à jouer. Dans la suite du sketch d'ouverture, ils se mettent à entonner une chanson. Le spectateur reconnaît l'air de la musique du groupe Licence IV , Viens boire un p'tit coup à la maison. Le duo va alors, tronquer les paroles originales ainsi, « y'a du rouge, y'a du blanc, du saucisson, y'a Gilou avec son petit accordéon » devient, « y'a des gâteaux, des gâteaux secs, des gâteaux, y'a du chocolat, du chocolat blanc, du chocolat chaud ». À travers cette modification Éric et Ramzy trahissent la nature profonde de leurs personnages. Ils ne peuvent désirer de l'alcool puisqu'ils sont des enfants, ils se tournent donc vers le sucre qui symbolise un plaisir régressif. Néanmoins, en faisant une reprise d'une chanson dont le sens profond s'adresse à des adultes, ils témoignent de leurs volontés de s'intégrer par le jeu, à des codes sociaux qu'ils ne peuvent pas maîtriser en leurs qualités d' auguste.

Comme des enfants Éric et Ramzy n'ont donc pas besoin d’artifice pour développer leurs imaginaires. Chacun de leurs sketches est comme un ensemble de jeux qu'ils partagent avec leurs public. C'est dans ce contexte que comme des enfants ils vont jouer à faire comme des adultes. Ils font donc un défilé de mode (00:33:55), définissent des mots compliqués comme philatéliste (00:08:43), font une prière (01:07:37), proposent la représentation d'un spectacle au Palais des Glaces. Comme exemple nous pouvons prendre le douzième sketch (00:44:48) de leur premier spectacle. Dans celui-ci, Ramzy semble faire passer un entretien à Éric. Il arrive donc sur scène avec un papier dans les mains et un stylo et dit : « Bonsoir, je voudrais parler à monsieur Du Tilleul ». Éric semble stressé sur scène et ne répond pas au nom d'emprunt qui est pourtant le sien dans le jeu qu'ils viennent de démarrer. Puis après avoir été appelé une dizaine de fois il finit par répondre et Ramzy commence son entretien avec des questions simples et absurdes :

#dialogue[
  « Ramzy : Aider une vielle dame à traverser la rue c'est ?

  Éric: Bien ?

  Ramzy : Oui c'est ça , c'est bien !

  […]

  Ramzy : Respecter ses grands parents c'est ?

  […]

  Éric : C'est respectueux

  […]

  Ramzy : Fumer des cigarettes alors que l'on est jeune c'est ?

  […]

  Éric : Irresponsable»
]

Les questions s’enchaînent, mais pendant tout ce temps Éric ne cesse d’afficher un comportement inadapté et puéril face à la situation. Il va répéter la fin de toutes les phrases que dit Ramzy en abordant une stature stoïque et un regard vide. Ce comportement va finir par agacer Ramzy qui va hausser le ton et dire des phrases comme : « Moi je travaille là ! Je suis pas là pour la farandole » ; « Je suis cool, mais ma patience a des limites » ; « Ho, monsieur Du Tilleul qu'est ce que vous faites là ! Ça veut dire quoi ce petit cinéma ! ». L'entretien s'achève tend bien que mal, puis Ramzy clôt le sketch en disant : « Et bien bravo monsieur Du Tilleul, vous avez réussi l’examen d'entrée à la police. ».

À travers ce sketch on retrouve tout les mécanismes d'appropriation d'un univers social adulte par des enfants qui le performeraient pour en faire un jeu. Cela passe notamment par l'utilisation que fait Ramzy de phrases touts faites, voir bureaucratiques, directement tirées d'un univers lexical que l'ont pourrait attribuer à un parent ou un professeur. Dans tout cela, le non- consentement d'Éric à embrasser une partition de jeu qui serait celle d'un adulte, d'une part, trahi la véritable nature du personnage de Ramzy qui ne peut plus tenir vraisemblablement son rôle, et d'autre part, permet de doter le moment du renversement carnavalesque qui provoque le rire du spectateur. Le comique sur scène d'Éric et Ramzy provient donc d'un détournement de l'univers des adultes, par le monde des enfants, en cela on rejoint une idée développée par Laurent Bazin dans son article « l'enfant et le rire » :

« Rire, pour un enfant, c'est donc tout à la fois se protéger et se révolter : se protéger du monde, en érigeant une barrière avec ce qui dans le réel dérange, déconcerte et même souvent inquiète ; se révolter contre ce monde, en s'excluant quelques instants du principe de réalité qu'on met à distance par voie d'hilarité#footnote[LETOURNEUX Mathieu et VAILLANT Alain L'empire du rire XIXe-XXIe siècle, « L'enfant et le rire », BAZIN, Laurent, CNRS EDITIONS, 2021, p.779]. »

En rejouant le monde des adultes à travers le prisme de leurs personnages d'auguste, Éric et Ramzy mettent à distance l'ensemble des sujets qu'ils peuvent traiter. Le sketch, sur l’examen d'entrée à la police leur permet de proposer une pique directe sur des dysfonctionnements systémiques sans pour autant porter le poids d'une responsabilité politique#footnote[On ne peut pas cependant dire qu'Éric et Ramzy n'ont aucun poids politique. Le fait qu'ils soient deux humoristes racisés et présents médiatiquement sans faire de leurs origines un sujet, est un partit pris que l'on pourrait qualifier de politique. Ainsi tout en étant métis et maghrébin, ils ne se résument artistiquement pas à cela, ils sont avant tout des humoristes.]. De manière générale leur comique qui se caractérise par le recours à de l'absurde (comme dans le sketch « l'homme le plus gros du monde » (00:22:13) qui s’avérera être Éric qui pèse « 86 kilos » ) tend plus vers une désignation des travers et des incohérences du quotidien. Là ou Coluche apparaît comme une figure de « bouffon » vis à vis d'un pouvoir politique, Éric et Ramzy sont « des clowns » dans ce qu'il proposent un comique qui n'a pour but fondamental que le rire. Le choix de personnages d'enfants leur donne le bénéfice du doute, l'objectif comique est atteint, et il n’ y a pas de remise en cause de l'ordre établi. Les enfants bien qu'ils les tronquent reproduisent encore et encore des codes sociaux normatifs. On pourra alors se demander dans la suite du développement comment le statut de « clown » tout comme celui de « bouffon » impactent le contenu des films dans lesquels les humoristes tournent.

=== Une écriture scénique déjà cinématographique pour un comique impur

En faisant, rejouer à leurs personnages d'enfants augustes l’univers propre au monde des adultes, Éric et Ramzy proposent finalement la déclinaison d'un procédé classique dans l’univers du one man show. En effet, que ce soit dans le stand up ou plus classiquement le sketch, le comique mis en place par les humoristes sur scène tire généralement son essence de la reconstitution verbale ou physique d'une situation ancrée dans un quotidien commun au spectateur et à l'humoriste. C'est ainsi que Dany Boon propose par exemple un sketch sur la poste à un public qui connaît amplement les référentiels qu'on lui soumet, puisqu'ils font état d'un vécu s'inscrivant dans son quotidien. Là où Éric et Ramzy se distancient de cette quotidienneté du référentiel, c'est dans le choix des sujets qu'ils rejouent. En effet, dans la mesure ou nous l'avons vu le duo propose une réinterprétation des référentiels par des enfants, leur terrain de prédilection s’il comprend des scènes plus classiques, propose majoritairement un jeu qui s'inscrit du côté du spectaculaire ou de l'événementiel. Lorsque ces derniers donnent la définition d'un mot, ils se positionnent en enfants qui proposent une représentation face à un public. On peut le constater dans la mesure où ils créent une mise en scène qui émane directement de la conscience de leurs personnages scéniques. Ainsi, ils respectent un ensemble de codes que les personnages on établis au préalable. La lumière apparaît , Ramzy est à l'avant de la scène, Éric est positionné au fond sur le côté :

#dialogue[
  « Ramzy : Bonsoir mesdames et messieurs.

  Éric : Bonsoir, comment ça va bien ?

  Ramzy : Éric venez ici. Venez là. (Éric rejoint Ramzy à l'avant de la scène) Bonsoir Éric.

  Éric : Bonsoir Éric.

  Ramzy : Non Éric, bonsoir Ramzy.

  Éric : Non, moi c'est Éric.

  Ramzy : D’accord, Éric , tableau ! (Éric va chercher le tableau )

  […]

  Ramzy : Ce soir mesdames et messieurs, ensemble dans cette salle nous allons essayer d'apprendre un mot. Ce mot nous ne le connaissons pas, ni vous ni nous. »
]

La mécanique proposée par les personnages dans le sketch est pleinement rodée. Ils ont convenu au préalable d'un ensemble de codes qui relève du champ lexical du spectacle. L'utilisation du « mesdames et messieurs » leur sert d'outil pour introduire dans la pure tradition, leurs prestations à venir. À cela, on peut ajouter que l'utilisation du vouvoiement par Ramzy permet au personnage de se doter artificiellement d'une stature qui serait sérieuse et convenue dans un rapport entre un artiste et ses spectateurs. Par la suite, le duo propose une explication du mot, qui se révèle hasardeuse. Le sketch se conclut avec les personnages qui saluent le public à l’unisson, s'inscrivant un peu plus dans le registre de la représentation.

C'est en ce point qu'on touche à l'un des aspects les plus centraux concernant l'écriture humoristique d'Éric et Ramzy. En effet, si dans l'exemple que nous venons de citer la représentation proposée par les personnages est tirée d'un univers théâtral, la singularité du comique scénique d'Éric et Ramzy tient dans la réappropriation par le duo de différents régimes d'images émanant du cinéma ou du moins de productions audiovisuelles. Cette appropriation sur scène de codes du cinéma est tout d'abord formelle. Dans leurs premiers spectacles, le duo propose un sketch dans lequel, leurs personnages entretiennent sur scène une correspondance postale. Pour ce faire, la mise en scène est la suivante, Éric apparaît sur une scène plongée dans l'obscurité, il est assis sur une chaise qui elle seule est éclairée. Il écrit sur une feuille posée sur ses genoux tout en regardant le public et en déclamant ce qu'il note dans sa lettre :

« Mon chèr Ramzy, je suis bien arrivé à Nababtrovska. Cependant déjà cette ville me fait peur. Une terre d'agonie, le froid est dans le cœur des hommes. Il me semble que cette ville est faite de pierres et non d'hommes. Bien affectueusement ton fidèle compagnon Éric ».

Puis, lorsqu'il finit de déclamer sa lettre, la lumière qui l'éclairait jusqu'ici s’éteint avant de se rallumer pour éclairer cette fois-ci Ramzy. Ce dernier est présenté dans le même dispositif qu'Éric et il nous fait part à son tour de la lettre qu'il a rédigée en réponse à son ami. Puis, c'est à nouveau au tour d'Éric et ainsi s'en suit de manière alterné la représentation scénique de leurs correspondances. D'un point de vue purement formel, le découpage de la scène à travers le changement de lumière présente au spectateur une succession d'images qui s'alternent pour former un tout cohérent. Le jeu de la lumière permet en d'autres termes de proposer une forme scénique très proche de ce qui serait au cinéma un montage alterné. De plus le sketch reprend dans un pastiche un motif, récurent du cinéma, à savoir la déclamation d'une lettre par un personnage soit à travers l'utilisation d'une voix off soit d'une voix in c'est notamment le cas dans des films de François Truffaut comme Jules et Jim ou Baisé volé. Éric et Ramzy préfèrent une voix in et par ce choix ils s'inscrivent dans une mise en dérision d'un certain cinéma qu'on pourrait qualifier de « sérieux », en comparaison avec leur humour. Pour autant, on ne retrouve pas dans ce pastiche un propos qui serait à charge, le projet tient simplement dans une réutilisation de ces codes au service du comique.

Autre forme propre au cinéma et cette fois-ci de manière évidente, à la fin de leurs second spectacle, Éric Ké Ramzy, le duo proposait afin de clore leur performance un dernier sketch. Il s'agissait d'un générique projeté sur la scène. On voyait alors apparaître classiquement le nom du spectacle, des remerciements à destination du public et de l'équipe technique, le tout sur la chanson It ain't easy de Ricky Fanté. Dès lors, la fin du spectacle embrasse un procédé proprement cinématographique. Rapidement ce qui est présent au générique passe du didactique à l'humoristique et le duo propose un détournement du concept de générique. On est amené à lire différentes blagues : « Régie son : Régis le hérisson », « coiffeur : oui », « Devinette. Combien y a-t-il de différence dans le monde ? Réponse égale 17 ». À ce premier détournement d'une forme proprement cinématographique, on y ajoute un second puisqu’à l'instar d'un grand nombre de comédies des années 90 et 2000, le générique d'Éric et Ramzy propose lui aussi un « bêtisier ». Ce bêtisier est volontairement extrêmement artificiel dans la mesure ou le duo revient sur scène (alors que le générique défile toujours à leurs côtés) et rejoue des passages de leurs spectacles en boucle et en les ratant activement. Avec ce sketch, Éric et Ramzy, témoignent d'une certaine cinéphilie qui transparaît dans leur écriture scénique. Bien qu'ils soient sur scène, le cinéma est déjà conçu comme un terrain de jeu pour leurs comédies.

Ainsi, la forme du one man show proposée par le duo relève finalement de l'impureté à l'instar de ce que des théoriciens comme André Bazin ont pu dire du cinéma. On peut, pousser cette idée d'impureté chez Éric et Ramzy à son paroxysme en reprenant la thèse de la chercheuse Nelly Quemener dans son article sur la performativité de l'humour dans lequel il nous est dit la chose suivante :

« Du spectacle de deux heures à la réplique de cinéma, l'humour prend diverses formes et se caractérise par un fort degré d'intermédialité.#footnote[QUEMENER, Nelly , « Performativité de l’humour : enjeux méthodologiques et théoriques de l’analyse des sketches dans les talk shows », Questions de communication [En ligne], 1 décembre 2009, p.3, consulté le 10 mai 2023] »

Dans cette phrase qui semble assez générale, on a pourtant une définition précise de ce qui va galvaniser la dynamique du duo composé par Éric et Ramzy. En effet, l'essence de ce qu'ils cherchent à produire artistiquement, ensemble, tend toujours par aboutir à l'épanouissement du rire. Dans ce contexte, le médium n'est finalement aucunement central. Alors qu'il s'agisse d'une interview dans une émission de télévision , d'un dessin animé, d'une pastille humoristique, d'un one man show, d'un roman photo, ou encore de vidéo sur le réseau social TikTok, tous ces médiums sont autant de terrains d'exploration pour leurs comédies. Ainsi, ce n'est pas seulement leur travail sur scène qui est impur, c'est l'ensemble de leurs œuvres qui résolument se jalonne d'impuretés pour que la comédie ne se borne à aucune limite et exploite pleinement dans l'intermédialité, l'ensemble de son potentiel. C'est dans ce contexte que nous serons à même de proposer une analyse plus informée des productions cinématographiques déployant l’humour d'Éric et Ramzy.

== Vers le cinéma


Nous avons pu constater à travers ces études de sketches que l'humoriste se façonne une image auprès de son public à travers ses différentes prestation. C'est ainsi que « Coluche est indissociable de la scène : il existe par la scène. Il associe corps et langage et est dans une relation très forte avec un public très demandeur, dans un jeu de discussion, d'excitation. Ainsi, il sait très bien jusqu'où il peut aller. C'est à la fois un vanneur et un fouteur de bordel#footnote[MONGIN, Olivier , interview de Renaud Dely, dans Libération, le 19/06/2006]. » Dès lors, on peut être amené à se questionner sur la légitimité d'une exportation de telle figure vers un médium comme le cinéma ? La question est de savoir si la greffe va prendre, puisque nous le verrons la migration des humoristes vers le septième art relève toujours plus ou moins d'une première impulsion nourrit par des enjeux financiers. S’agit-il alors de regarder des humoristes jouer dans des films sur les fondations de leurs passés sur scène, ou bien d'acteurs avec un passé d'humoristes qui font du cinéma ? Ainsi, l'imbrication de la figure de l'humoriste s'inscrit d'une certaine manière dans une mécanique émanent du star système.

Dès lors, par sa présence dans le septième art, l'humoriste en même temps qu'il participe d'un processus marketing, confirme irrévocablement l'impureté émanant du cinéma. Si nous l'avons constater, le travail sur scène d'Éric et Ramzy s'inscrit déjà dans un rapport de proximité avec le cinéma, l'écriture scénique de Coluche reste plus conventionnelle en ce point. À cette distinction entre ces humoristes on peut ajouter qu'ils s'écartent aussi de par leurs fonctions sociales en temps qu'artiste. Coluche, que nous avons défini comme un « bouffon » moderne, embrasse dans son travail artistique un rôle de contestataire vis-à-vis de la norme socialement établie. Éric et Ramzy, en revanche emprunte artistiquement un statut qui serait socialement celui du clown. Ils développent un comique qui ne vise pas la contestation frontale des rapports de domination, leur rôle est radicalement tourné vers le divertissement du public, le rire étant leurs seuls maîtres mots. Ainsi, il s'agira d'analyser dans quelle mesure l'écriture scénique respective de ces humoristes s'adjoignant à leurs statuts de bouffon et de clowns représente un enjeu majeur dans la cristallisation de leurs personnages scéniques au cinéma.


= De la scène à l’écran

== Coluche : un personnage pour la cinéma ?

La carrière cinématographique de Coluche peut facilement être subdivisée en trois tendances majoritaires. Il y a tout d’abord ses débuts, ils sont finalement plutôt classiques et témoignent simplement de son apprentissage du métier d'acteur. Au cours de cette période qui s'étend de 1969 à 1976, il enchaîne les castings et les petits rôles. Il va même jusqu'à faire de la figuration en 1970 dans Peau d’âne où il interprète un paysan. La deuxième tendance comporte l'ensemble de ses comédies populaires à gros budget destiné à un public familial. Enfin, il y a les films à contre emploi, ceux qui vont se jouer de l'image de l'humoriste. Dans cette partie, nous évoquerons les débuts de Coluche comme comédien et nous nous attarderons sur l'analyse de ses comédies et leur impact sur la place des humoristes au sein du cinéma français.

=== Une Carrière au cinéma en parallèle d'une carrière sur scène

Coluche va très rapidement s’intéresser au cinéma, c'est en 1969 qu'il intègre le septième art avec un petit rôle dans un court métrage d'Olivier Ricard intitulé L'Innocent. Puis, en 1970 il incarne le personnage de Marquand, un second rôle conséquant dans le quatrième long métrage de Claude Berri, Le Pistonné. À cette époque Coluche n'est pas encore la star du musical qu'il sera par la suite, mais Claude Berri qui va le voir jouer sur scène aux cotés de ses camarades du café de la gare décèle en lui des capacités actorales prometteuses. Le réalisateur déicide après quelques essais fructueux, de confier à Coluche le rôle titre de son film, mais face à la réticence des financiers à monter un projet sur le nom de l'humoriste pas assez connu à l'époque, Berri accorde finalement le rôle principal à Guy Bedos. Quelques années plus tard, en guise de pardon et ayant flairé l’enjeu financier que comporte la présence de Coluche au sein d'un casting, Claude Berri signera avec lui un contrat pour quatre films à tourner sur une période de 30 mois qui seront : Le Maître d'école (1981), Deux heures moins le quart avant Jésus-Christ (1982), Banzaï (1983), et Tchao Pantin (1983). Dans Le Pistonné, Coluche qui apparaît à de nombreuses reprises à l'écran campe le personnage d'un jeune homme mobilisé au coté de Claude (Guy Bedos) pour faire son service militaire dans une période pré-68 de guerre coloniale. Si le film se laisse aller à une certaine forme de légèreté en déclinant quelques gags faisant la part belle aux répliques sanglantes, néanmoins le registre proposé est plutôt celui du drame. Dès lors, Coluche, pour son premier rôle conséquent, propose une palette de jeu plus nuancé que ce qu'on aura l'habitude de voir par la suite. Dans le Pistonné Coluche n'est pas encore tout à fait Coluche, il n'a pas encore endossé la salopette, ne s'est pas encore fait grossir volontairement pour paraître plus sympathique à son public et surtout il n'est pas encore monté seul sur scène. Pour Le Pistoné le spectateur a affaire à un Michel Colucci qui entreprend sa transformation, il est à ce titre crédité au générique sous le nom de « Michel Coluche ». Dès lors, Coluche qui n'est pas encore un humoriste dans le sens où nous l'avons défini, continue en parallèle de sa carrière sur scène à essayer de percer dans le cinéma :


« Le comique multiplie à cette époque les appels du pied au cinéma. Il a même choisi Serge Rousseau , chez Art-media , pour le représenter et à l'aider à décrocher des contrats, alors qu'il passe son temps à mépriser et à insulter les agents. Depuis Le Pistonné de Berri, on a pu l’apercevoir dans Laisse aller... c'est une valse de Lautener, ou Elle court, elle court la banlieue de Gérard Pirès. Et dans quelques semaines il se retrouvera au lit, à moitié à poil, avec Miou-Miou et Depardieu pour passer des essais devant Bertrand Blier, un jeune metteur en scène de 34 ans à la recherche de son casting pour le film qu'il prépare, Les Valseuses, dont personne n'imagine encore la déflagration qu'il causera à sa sortie. Coluche n'a pas encore osé monter seul sur scène, mais ça ne va pas tarder. En attendant, il triomphe avec le Vrai Chic dans les lieux même où tout a commencé#footnote[CHAPEAU Vincent, Claude Zidi en toute discrétion, Paris, édition Hors Collection, 2019, p.254].»

Cet extrait de la biographie du réalisateur Claude Zidi écrite par Vincent Chapeau nous donne un indice sur l’appétence de Coluche pour le cinéma. Néanmoins, on constate dans ses choix de casting la volonté de participer à des projets à la tonalité nuancée, bien loin des comédies populaires au registre affirmé que seront Banzaï ou encore Deux heures moins le quart avant Jésus-Christ. L'humoriste déclarera à plusieurs occasions avoir profondément regretté de ne pas avoir été retenu pour le casting des Valseuses. Mais c'est pourtant par le biais de ce cinéma de comédie populaire que Coluche obtiendra la reconnaissance publique avec en 1976 L'Aile ou la Cuisse, de Claude Zidi.

Si l'on remonte un peu dans le temps, Coluche est véritablement découvert par le public au cours de la soirée électorale du 19 mai 1974 lorsqu’à la télévision on diffuse son sketch « l'histoire d'un mec » en attendant le discours de défaite de François Mitterrand qui tarde à arriver. Quelques mois plus tard, le 15 février 1974 Coluche monte seul sur scène avec sa salopette à rayures dans son premier one man show, Mes adieux au musc-hall. Son personnage scénique est né et il est enfin assez populaire pour décrocher des rôles-titres au cinéma.

Zidi choisit Coluche pour jouer dans L'Aile ou la cuisse puisque l'humoriste a déjà fait ses preuves à ses côtés dans un précédent film, Le Grand bazar en 1973, dans lequel il jouait un père de famille visitant un appartement. Dans L'aile ou la cuisse, Coluche interprète le rôle de Gérard Duchemin, fils de Charles Duchemin (Louis De Funès), le directeur d'un célèbre guide gastronomique. Charles souhaite que son fils prenne sa succession, mais ce dernier, préférant s'adonner à une carrière de Clown, cache son second métier guidé par la passion à son père. Cette comédie produite par Christian Fechner qui comporte un budget de 23 millions de francs rassemblera à sa sortie 5,8 millions de spectateurs en France et 3 millions en Allemagne. Pour sa première apparition dans le film, Zidi joue avec l'image de l'humoriste dans sa mise en scène. En effet, la première chose que le spectateur voit c'est la main d'un homme qui met un disque de musique rappelant l'univers sonore du cirque avant de saisir un œuf, le tout dans un gros plan. Puis la caméra opère un travelling arrière pour laisser apparaître dans un plan italien l'homme portant des bretelles, de dos en train de jongler avec des œufs. On peut alors apercevoir dans la réflexion d'un miroir un nez rouge disposé sur son visage. En hors champ, on entend la voix de Charles qui appelle son fils à deux reprises(« Gérard ! Gérard ! »). Cette interjection le fait sursauter, il fait alors tomber un œuf en entendant le premier « Gérard » ce qui est présenté dans un gros plan de l’œuf s'écrasant sur le sol. Puis le deuxième « Gérard » retentit et on découvre enfin le visage de l'homme qui se tourne face à la caméra au sein d'un plan rapproché taille. Le spectateur peut directement identifier Coluche malgré le personnage de fiction qu'il incarne, et Zidi a dissimulé dans la mise en scène de sa séquence tous les indices attestant de la présence de l'humoriste. Pourtant au lieu de nous le présenter directement, il ne montre son visage au spectateur qu'au bout d'un quart d'heure de visionnage du film. Dans L'Aile ou la cuisse, le rôle de Gérard joue sur la personna de l'humoriste pour conforter le spectateur dans ses attentes, tout en opérant timidement une distanciation grâce à la mise en scène et à l'artefact fictionnel.

Le jeu d'acteur de Coluche dans le film est plutôt naturaliste. Il se base sur l’importation dans sa composition d'éléments physiques ou verbaux tirés d'une observation du vivant. Il pourra par exemple à plusieurs moments dans le film, avoir recours à des onomatopées exprimant l’indécision ou le doute (« euuuhhh »), ce qui ancre son jeu d'acteur dans le réel. Ce travail sur une réutilisation du vivant au service du film n'est pas sans rappeler les méthodes qu'il utilise en parallèle du tournage au sein de ses sketches sur scène. Dès lors, ce procédé de réutilisation du vivant au service du comique, Zidi va le mettre en scène dans une séquence. Dans cette dernière, Gérard qui est assis à la table d'un restaurant guindé se fait servir du vin par un employé ivre titubant. En réponse au serveur, Gérard, lorsqu'il doit goûter le vin, se met à grimacer et reprend les mimiques de son interlocuteur avant de finalement renverser son verre sur sa voisine de table. Cette séquence, qui laisse place à un jeu d'acteur presque muet reposant sur des gags burlesques, permet une mise en abîme du travail de l'humoriste et plus largement celui du comique, qui fait rire grâce à une réappropriation et une déformation du vivant. Ainsi, les seuls moments où le jeu d'acteur de Coluche sort du naturalisme c'est pour opposer au monde une transformation comique. Dans ces moments de jeu là, l'idée n'est pas tant de faire avancer la narration, mais plutôt d'en donner pour son argent au spectateur en lui rappelant qu'il regarde un film avec Coluche. Il en est de même lorsque dans tout le film, De Funès joue des séquences d'énervement ou bien de mimiques burlesques. On laisse à celui qui fait rire un espace au sein du film dans lequel il est à même de faire son numéro d’artisan du rire.

L'une des thématiques centrales dans L'Aile ou la cuisse, est sans doute la question de la filiation et dans la mesure où il met en scène deux générations de comiques, il permet de confronter deux façons de faire rire. Contrairement au jeu de Coluche celui de De Funès est plus artificiel dans ce qu'il est explosif et maniéré. Néanmoins, leurs comiques ne sont pas conçus dans une opposition, mais plutôt dans une dynamique additionnelle. Le film ne met pas en scène le savoir-faire du critique gastronomique contre celui de l'artiste de cirque, il cherche plutôt à valoriser les deux domaines dans la mesure où ils sont véhiculés par la passion. Seules les pratiques industrielles du magnat de l'alimentation rapide sont décriées, car c'est de leur fait que s'immisce dans les rapports humains une artificialité qui détache du réel. La cuisine tout comme l'humour sont des artisanats qui nécessitent d'une part, de la précision et un savoir-faire, et d'autre part, une connexion entre les Hommes. C'est en quelque sorte l'idée développée par Alain Vaillant lorsqu'il nous dit la chose suivante :

« Parce que le rire est, à l’inverse de la formule bergsonienne, non pas « du mécanique plaquée sur le vivant », mais la perpétuelle revanche du vivant sur la mécanique ; si bien que, plus la vie se mécanise plus il faut s’évertuer à en rire pour que les rouages ne se grippent pas#footnote[VAILLANT Alain, La Civilisation du rire, Paris, CNRS édition, 2016, p.311]. »

Le rire mène un combat contre l’artificialité, un combat qui est mené par ses artisans toutes générations confondues. Mais s’il y a des faussaires dans le domaine culinaire, il peut également y en avoir en humour et alors le rire est vidé de sa passion et de sa corporalité. Cette idée est matérialisée dans le film, lorsque Charles, après avoir fui l’hôpital avec son fils, se retrouve dans la caravane du cirque en pyjama. Alors que lui et Gérard s’apprêtent à aller faire front contre « la mal bouffe », il n'a d'autre choix que de revêtir pour sortir, des vêtements disponibles sur place. De ce fait, symboliquement, Louis De Funès endosse un blouson en cuir similaire à celui du sketch du « voyou » de Coluche. Les deux hommes sont ici réunis dans une dynamique d'échange pour révéler tout un nuancier comique. Symboliquement le personnage de Charles est invité à se mettre dans les bottes de son fils, c'est par ce biais qu'il est amené à le comprendre et à l'accepter.

L'aile ou la cuisse est véritablement un film qui questionne l’identité des personnages à travers un jeu sur le travestissement. En effet, Charles pour ne pas être repéré quand il inspecte un restaurant n'a de cesse de se déguiser pour jouer des rôles. Il se présente en veuve, en touriste américain, ou en chauffeur et malgré l'étonnement et le rire que suscitent ses prestations chez le spectateur, dans la diégèse il n'est presque jamais démasqué. Néanmoins, et c'est peut être le cœur du film, celui qui passe son temps à se déguiser pour tromper son monde ne se rend pas compte que son propre fils porte un masque social quand il est en sa présence. L'univers du cirque est pour Gérard un lieu où il revêt un déguisement, mais qui paradoxalement lui permet d'exprimer sa vraie nature, sa passion à lui. Le père et le fils sont finalement extrêmement proches puisque tous deux utilisent le déguisement pour exercer leur passion, mais Charles contrairement à Gérard ne s'en cache pas au sein du cadre familial et c'est ici que se situe le nœud dramatique. Dès lors, quand Charles découvre la vérité sur les activités de Gérard et le vire, dans la séquence qui suit, c'est le tenancier d'un restaurent qui grille sa couverture et l'intoxique en le forcent à manger les assiettes que les autres clients n'ont pas terminées. Ainsi, lorsque les protagonistes affichent une tension au sein de leur relation les retombées qu'ils perçoivent sont négatifs. Ce n'est que lorsqu'ils acceptent la réalité de l'autre qu'ils sont à même d’accéder à une issue positive. C'est le cas comme nous l'avons vu précédemment avec l'endossement du blouson en cuir par Charles, mais également lorsqu’à la fin du film Gérard remplace son père qui a perdu le goût pour participer à une épreuve de dégustation. Pour en revenir plus particulièrement au rôle de Coluche dans ce film, ce dernier affirme son statut d'humoriste. Le personnage qu'il incarne trouve sa vérité en étant un clown et en assurant le spectacle. Cette idée s’intensifie au fur et à mesure de l’avancée du film. Dans la première partie, avant que son secret ne soit découvert Gérard affiche auprès de son père un comportement timide et hésitant. Les seuls moments d'affirmation de sa personnalité se trouvent quand il est sous le chapiteau ou tout simplement quand il est séparé de son père. Dans ces séquences-là, l'affirmation de sa personnalité s'illustre par la revendication et l’interprétation de blagues, remarques cinglantes et gags visuels. Cette attitude comique n'a de cesse d’être avortée par la présence de son père. À titre d'exemple, dans la séquence où on le découvre pour la première fois, alors qu'il jongle avec des œufs, c'est l'intervention de Charles qui le perturbe provocant son déséquilibre et irrévocablement la casse des œufs. Par ailleurs, lorsque son secret est découvert et finalement accepté par son père, la personnalité comique de Gérard fait surface même en présence de Charles. Ainsi dans une séquence Gérard accompagne son père à l’hôpital après que celui-ci ait fait une intoxication. Sur le trajet, Charles à l'agonie échange avec son fils :

#dialogue[
  « Charles : Gérard tu ne vas pas me laisser tomber ?

  Gérard : Mais papa c'est toi qui m'as foutu à la porte.

  Charles : Bah tu peux attendre l'émission ?

  Gérard : Mais oui papa tu sais bien, tu me fous à la porte quand tu veux. »
]



Cette séquence illustre parfaitement l'évolution du personnage de Gérard qui n'hésite pas à s'affirmer en faisant preuve d'humour et de répartie. Ce type de réplique est par ailleurs extrêmement proche de celles que l'ont pourrait retrouver dans le travail scénique de Coluche. Il y a d'une part l'utilisation d'un registre de langage familier et argotique avec l'expression « foutre à la porte », mais également la mise en valeur d'une situation absurde pour déclencher un rire en réaction à l'incongruité de la phrase. Finalement le film de Zidi tout en réaffirmant diégétiquement la véritable personnalité de Gérard, va surtout asseoir du point de vue de la réception la persona de Coluche, l'humoriste. On pourrait faire de L'Aile ou la cuisse a posteriori la lecture suivante : Il s'agit d'un film sur Michel Colucci, qui s’efforce de ne pas être Coluche, face à un de Funès, qui lui est pleinement de Funès. Puis, de Funès, découvre en même temps que le cinéma qui est Coluche, et dès lors pour de Funès tout comme le cinéma, Michel Colucci sera Coluche. L'Aile ou la cuisse qui constitue le premier succès au cinéma de Coluche, dans la mesure où il propose une réflexion sur le métier d'humoriste, multiplie les clins d’œil à sa persona. Or, en 1976 sa persona repose essentiellement sur le personnage scénique qu'il a créé. C'est dans ce contexte que l'humoriste intègre véritablement le monde du cinéma et ses prochains films vont eux aussi se prêter à capitaliser sur cette image. À ce titre L'Aile ou la cuisse opère dans la carrière de l'humoriste une forme de cristallisation à l’égard de son personnage scénique pour le cinéma.

=== Inspecteur la Bavure (1980) : Coluche se décline au cinéma


Inspecteur la Bavure, est le premier film de Coluche pour la décennie 80, et il représente l’archétype de la comédie qui laisse une place prédominante au personnage scénique de l'humoriste. La genèse du projet vient de la volonté de Coluche de faire un film avec Claude Zidi dans lequel il incarnerait un policier. Dès lors, lorsqu'il s'agit pour l'humoriste de décrire plus précisément les caractéristiques du personnage qu'il voudrait incarner, il dit la chose suivante : « j'aimerais qu'il soit en salopette, avec le nez et les pommettes un peu rouges. Mon public me connaît comme ça !#footnote[CHAPEAU Vincent, Claude Zidi en toute discrétion, Paris, édition Hors Collection, 2019, p.311] » Nous avons ici l'un des enjeux principaux de ce mémoire, à savoir dans quelle mesure le personnage scénique d'un humoriste peut-il s'exporter à l’écran. Dans cette partie nous nous attacherons à analyser les procédés comiques ainsi que le jeu d'acteur de Coluche au sein d'Inspecteur la Bavure afin d'en faire ressortir des occurrences propres à son travail sur scène et au cinéma.

_Inspecteur la Bavure_ raconte l'histoire de Michel Clément (Coluche), un inspecteur de police sur la ville de Paris tout juste diplômé, qui s'illustre dans son travail par sa maladresse et son incompétence. Lui et son coéquipier sont suivis par une journaliste ( Dominique Lavanant) qui fait un reportage sur la police nationale. Au cours de ses différents périples, il est amené à poursuivre Roger Morzini (Gérard Depardieu), un malfrat considéré comme l'ennemi public numéro 1.

Cette comédie développe le rire principalement à travers son recours à des prémices absurdes, laissant place à un grand nombre de situations traité avec exagération. L'effet comique intervient grâce aux différentes réactions des personnages face à ces événements, qui vont soit considérer la situation comme normale (et parfois même y participer activement) soit au contraire s'en étonner et la subir. Pour exemple, dans une séquence, Morzini et sa bande tentent de cambrioler une orfèvrerie. Cette dernière étant seulement occupée par le personnel entièrement constitué de personne en fauteuil roulant, les malfrats pensent pouvoir faire le coup du siècle. Mais alors qu'ils pensaient qu'on ne leur opposerait aucune résistance ces derniers se font rosser par le personnel qui n’hésitent pas à leur rouler dessus avec leurs fauteuils. À l'image le tout se manifeste par une démultiplication des fauteuils roulants qui finissent par complètement occuper le cadre. Les malfrats se retrouvent bloqués, privés de ligne de fuite au sein du champ, ils sont ensevelis et seul Morzini réussira tant bien que mal à s’échapper. Dans cette séquence on assiste au développement d'un comique de situation traité à l'image de manière hyperbolique. Ici Morzini et sa bande font les frais de l'absurdité de la situation.

Dès lors, le film développe un monde fictionnel similaire au nôtre, mais qui se conçoit comme en décalage, puisqu'il prend le parti pris de la dérision. Dans le film tous comme c'est le cas dans des œuvre burlesque, « le personnage détermine le gag par sa façon particulière de réagire aux événement#footnote[DREUX Emmanuel, Le Cinéma burlesque:ou la subversion par le geste, Paris, L'Harmattan, 2007, p.65] ». Dans une des séquences, Michel Clement au cours d'une reconstitution de crime doit remplacer la victime, une petite fille, puisque les agents en charge ont oublié d'amener un mannequin (le commissaire : « Clément, vous allez faire la petite fille. Vous allez vous allonger par terre avec le violeur et faire la petite fille. Allez c'est un ordre! » .) Michel est alors poursuivi par le criminel accusé de viol avant d’être mis à terre par ce dernier, qui ne manque pas de l'étrangler, le tout face aux regards insensibles des magistrats. L'un des premiers effets comiques de cette séquence provient d'une mise à distance de l'horreur. En effet, si cette reconstitution a lieu, c'est parce qu'une chose abominable est arrivée à une petite fille. Mais ici le spectateur ne peut pas voir la victime, à la place il


voit Michel et sa corpulence que l'on sait bien éloignée de celle d'une
fillette. Le tout, est accentué par les cris de terreur du jeune policier, des cris
suraigus, à la limite du grotesque. La scène est agrémentée des
commentaires impassibles de magistrats en train de pinailler, dans le plus
grand calme des détails sordides de l'affaire afin de faire gagner en réalisme
la reconstitution:
« - Je proteste Mr le juge la victime vue son poids et son age ne pouvait se
défendre de la sorte.
[…]
- Je m'excuse Mr le juge mais il me semble que le drame s'est passé sous la
pluie.
[...]
- Mais enfin maître, mes plus grands respects pour vous et votre métier mais
tout ceci est inadmissible.
[...]
- Mais enfin consultez les archives psychiatriques les tendances
homosexuelles de mon client y sont nettement mentionnées. »
La séquence qui pourtant relate des événements morbides devient
comique, grâce à une exagération burlesque du jeu d'acteur de Coluche et de
Philippe Khorsand qui incarne le criminel avec outrance. Parallèlement, le
jeu des autres acteurs ici beaucoup plus naturaliste permet le développement
d'un contraste troublant s'appuyant sur la déconstruction d'un motif de
crispation. Le tout, est encadré par un montage parallèle qui fait s’alterner
les plans de Michel et le violeur en train de se battre dans la boue avec ceux
des magistrats en costume qui relatent des faits. Dans cette situation



absurde, le personnage de Michel subit les événements. En étant réfractaire
à la situation il se place dans une position de recul face à l'action. Michel
contrairement aux autres personnages ne considère pas l'action comme
normale. Lorsqu'il lutte face à l’événement (en luttant concrètement contre
le violeur) le personnage bien qu'il le subisse, s'en éloigne dans la mesure où
il n'embrasse pas le positionnement adopté par l'ensemble des autres
personnages. Dès lors, il rejoint une posture qui serait celle du spectateur,
qui lui aussi atteste de l'incongruité de la situation. À travers cette mise en
scène Michel est finalement très proche du Coluche sur scène, qui décrypte
dans ses sketches l’absurdité de certaines habitudes ou fait sociaux tout en
n'étant pas paradoxalement épargné par eux.
Dans tout cela, on peut être amené à se demander en quoi le comique
ancré dans le vivant de Coluche se rapproche-t-il de celui absurde et grand-
guignolesque de Claude Zidi ? En effet, comme nous avons pu le constater à
travers l'étude de ses sketches Coluche développe un humour composé d'un
patchwork d'observations tirées du quotidien. En partant de là, il s'agit pour
lui d'en révéler les incohérences. Zidi, lui, prend pour point de départ des
éléments absurdes, afin d'observer comment ses personnages réagissent en
tentant d'insuffler du réel et du rationnel dans chacune de ces situations.
Mais les situations absurdes développées par Claude Zidi prennent aussi le
vivant comme cadre matriciel, le jeu revient plutôt à fournir une version
déformée et exacerbée du réel, afin de créer des images poétiques à vocation
humoristique. La première partie d'Inspecteur la Bavure permet au
réalisateur de proposer différentes séquences, qui sans véritablement faire
avancer le récit, peuvent surtout se concevoir comme des laboratoires à
gags. Ainsi, l'une des images que l'on retiendra c'est lorsque Michel Clément
en faction dans sa voiture de patrouille, observe un gang de cambrioleurs se


faisant passer pour des déménageurs. Michel tente alors de prévenir ses
collègues par la radio, mais il se trompe et c'est dans le haut-parleur de sa
voiture que sa voix est diffusée. Dès lors, les cambrioleurs le repèrent et
plutôt que de s'en prendre physiquement à l'inspecteur, ils soulèvent sa
voiture à la force des bras, et la positionnent en hauteur sur le socle d'une
statue de Napoléon, le tout sous les cris suraiguës de Michel. Ici, si l’enjeu
de la séquence réside dans le fait de montrer un peu plus l'incompétence du
jeune inspecteur, il tient également dans la création d'un gag visuel, d'une
image absurde avec laquelle le personnage principal essaie de composer.
Dès lors, la notion de laboratoire à gag est indissociable de l'univers du one
man show. Cet art repose sur l’expérimentation, représentation après
représentation de nouvelles blagues et de nouveaux gags. Il y a dans
l'approche scénaristique de Zidi une méthode extrêmement proche de celle
de la construction d'un spectacle d'humour. En effet, ce dernier en partant
d'une situation donnée ( un père souhaitant à son fils un avenir professionnel
dans le monde de la gastronomie alors que celui-ci désire être clown ; un
inspecteur de police incompétent devant arrêter l’ennemi public numéro 1 ;
un employé de planète assistance ayant peur de voyager ) proposera une
suite de gags avec un caractère plus ou moins expérimental dont le but est
d’asseoir la trame narrative principale. Si dans le spectacle de Coluche Mes
Adieux au music-hall il n'y a pas à proprement parler de trame narrative,
l'ensemble des gags et différents sketches qui sont déployés servent à
appuyer la critique de la société de son temps proposé par l'humoriste. On
peut donc dire que Coluche et Zidi se rapprochent d’abord structurellement
dans la construction de leurs œuvres respectives puisque leurs gagas servent
à border leurs propos.
À cela, on ajoutera la capacité à invoquer des images en leur


absence, une chose qui est permise par les monologues comiques. Pour
exemple dans le sketch de Coluche « la publicité » le spectateur est à même
d'imaginer « celui qui a cinq kilos de linge [qui] fait les nœuds le lundi
[qui] fait la lessive le mardi, et puis après [qui] a la semaine pour défaire les
nœuds. ». Dès lors, là où l'humoriste et le réalisateur se réunissent, c'est
quand l'un énonce par l'imaginaire les situations absurdes découlant de notre
réalité, l'autre les réalise au cinéma. Lorsqu'il passe au cinéma et notamment
dans les comédies, le personnage scénique de Coluche est plongé dans le
monde qu'il avait dépeint. Ainsi, il accomplit le monologue fantasmé de
l'humoriste. Cette idée peut aussi être soutenue dans la mesure où on
apprend dans la biographie de Claude Zidi que Coluche est à l'initiative du
projet. Inspecteur la bavure constitue de ce fait un terrain a priori propice
pour l'épanouissement de l'univers comique de Coluche.
Dès lors, le film va laisser une grande place aux manifestations du
personnage scénique de l'humoriste. La manifestation la plus évidente de ce
phénomène vient du jeu d'acteur de Coluche. S’il est plutôt naturaliste dans
l'ensemble, il fait preuve dans les moments où son personnage est en danger,
d'une outrance burlesque très proche de son travail sur scène. Ainsi, il
n’hésite pas à crier, à s'égosiller et à produire des bruits de suffocation, tout
en s'agitant physiquement et en grimaçant. On accordera une attention toute
particulière aux cris suraiguës qu'il émet à plusieurs reprises dans le film et
qu'il a déjà expérimentés sur scène. Ce cri deviendra d'une certaine manière
une signature de son travail désormais inséparable de l'ensemble de ses
œuvres à vocation humoristique. Le spectateur qui vient voir Inspecteur la
Bavure, s'attend à retrouver le Coluche qu'il connaît et c'est ce que Zidi va
lui servir en multipliant les clins d’œil à la persona de son acteur. Dès lors,
les dialogues sont pour ainsi dire calqués sur le « style Coluche ».
Dans une séquence Michel Clément suite à une confusion, invite


Morzini (qui a changé de tête et se fait passer pour un écrivain de polars) à
dîner chez lui. Dans cette situation, sans se douter de la véritable identité de
son interlocuteur Michel dit à son convive la chose suivante : « Morzini c'est
plutôt le genre de faciès quand tu le vois, tu changes de trottoir ! ». Plutôt
que de simplement dire « Morzini est laid », le personnage utilise une
périphrase qui s’apparente à une punch line. Punch line caractéristique du
style de l'humoriste, de part son efficacité à transformer une idée simple en
une blague, grâce à la tournure de phrase (il préfère la répétition du pronom
personnel « tu », plutôt que de dire « en le voyant tu changes de trottoir ») ,
au mélange des registres de langages ( il préfère intégrer le terme « faciès »
appartenant à un jargon scientifique plutôt que de dire « visage ») , et à la
création d'images (un visage si effrayant qu'il nous pousse à changer de
trottoir). On retrouve également chez l'acteur des mots et expressions que lui
a prêté l'humoriste comme : « ma poule », « andouille », « fait pas le con »,
« heeuu l'autre », « il est fou lui » ou encore son onomatopée de scène
« laahhhh ! ».
De manière tout aussi évidente, le sujet du film permet à Coluche de
retravailler des thématiques déjà abordées sur scène notamment dans son
sketch « le flic », sketch que nous avons pu décortiquer dans notre première
partie. En effet tout comme le flic de son sketch qui selon ses propres termes
« a signé sans réfléchir », Michel Clément est devenu inspecteur de police,
non pas par conviction, mais pour honorer la mort de son père, un inspecteur
décédé en service, et pour faire plaisir à sa mère. De cette situation, il se
retrouve propulsé dans un monde dans lequel il n'est acteur des événements
que pour faire des gaffes, et cherche surtout à faire le moins de mal possible
en le faisant du mieux qu'il peut. Le corps de Coluche dans le film comme
dans le sketch semble s’excuser de sa présence, ses gestes sont souvent
hésitants et maladroits, il a juste été déposé là et il fait comme il peut. Mais


puisqu'il est ici et bien il va dire quelque chose, et cela même s’il bafouille
et fait des fautes de grammaire.
Le film, qui propose un portait caricatural du milieu de la police,
rejoint également le sketch en ce point. Les mêmes reproches sont faits dans
les deux œuvres à savoir, le manque de compétence des officiers (Michel est
reçu à son examen suite à une clémence du jury en l’honneur de son père),
un recours à une violence physique décomplexée et banalisée ( lorsque des
collègues confondent Michel avec un détenu, il le passe à tabac ), et une
propension à s’alcooliser durant les heures de service ( le coéquipier de
Michel l'abandonne lors de son premier jour pour allez boire un verre avec
un collègue affin de célébrer son retour de vacance). Les policiers, qu'ils
soient dans le sketch ou dans le film sont amenés à faire des « bavures » à
répétition. L'univers scénique de l'humoriste s’entremêle ainsi avec celui du
film et le spectateur peut voir du Coluche au cinéma.
Enfin, le clin d’œil verbal le plus évident quoiqu'il soit anodin se
trouve dans une séquence où Michel est couvert de boue. La journaliste se
précipite avec un mouchoir afin de l'essuyer et lui dit : « Dans quel état ils
vous ont mis, si votre moman vous voyait. » Ce à quoi il répond : « Si c'est
pour dire une connerie, je peux le faire ». Ici, la référence au statut
d'humoriste de Coluche ne fait aucun doute. À travers cette phrase il assoit
l'idée qu'il est un humoriste (reconnu) qui fait du cinéma. C'est selon cette
dynamique qu’évoluera sa carrière dans le septième art, une dynamique qui
lui collera à la peau et imposera chez ses successeurs un modèle esthétique
et économique.



=== L'échec de la cristallisation ?



Jusqu'ici nous nous sommes exercés à relever ce qui, dans la
constitution du personnage scénique de Coluche parvient à être transposé
dans certaine production cinématographique faisant la part belle à l'acteur.
Dans cette partie, nous chercherons à l’inverse à analyser l'ensemble des
éléments scéniques qui justement n'ont pour ainsi dire pas été retenus au
casting cinématographique.

Nous l'avons observé dans notre première partie, le personnage
scénique de Coluche est par bien des égards dans ce qu'il a de contestataire
associable à la figure du bouffon du roi. À ce titre, l'un des aspects de son
travail est essentiellement le développement d'un comique qui ne se soumet
pas au compromis vis-à-vis d'une norme, et qui, à l’inverse, rentre en
confrontation avec cette dernière. Dès lors, ce qui fait l'attrait principal pour
le public des sketches de l'humoriste, c'est ce jeu avec la limite du cadre
sociétal, le tout formulé dans un langage familier, populaire et souvent
vulgaire. Ainsi, ces spectacles s’ils peuvent dans une moindre mesure être
vus par des enfants, visent un public qui se situe principalement chez les
adultes, puisqu'ils sont à même de comprendre certains double sens, ou
d’identifier les référents parfois plus politiques. Paradoxalement, la majeure
partite des comédies de Coluche à quelques exceptions près que nous
évoquerons ultérieurement sont pour leur part destinées à un public qui se
veut familial. Le choix de ce public est identifiable tout d'abord dès l'étape
de la promotion. En effet, les différentes affiches des films que nous
pouvons voir ci-dessous présentent déjà des caractéristiques notables quant
à la destination à laquelle elles s'adressent.

#place(top + center, float: true, clearance: 1em, grid(
  columns: 3,
  column-gutter: 1em,
  row-gutter: 1em,
  image("affiche_aile_ou_la_cuisse.png"),
  image("affiche_la_bavure.png"),
  image("affiche_maitre_ecole.png"),

  image("affiche_jesus.png"),
  image("affiche_banzai.png"),
  image("affiche_serpent_plume.png"),
))



On constate premièrement, que l'ensemble des affiches proposent l'usage d'une colorimétrie vive, avec la présence notable du rouge et du jaune, qui servent à attirer l’œil, et s'éloignent de la représentation caractéristique du drame. Chacune des affiches représente avec plus ou moins de prédominance la figure de Coluche que ce soit sous forme de dessin caricatural ou bien en reprenant une image de lui tirée du film. Dès lors dans toutes ces représentations, Coluche adopte une posture qui se veut risible. Le comique intervient soit de l'action qu'il est en train d'effectuer soit tout simplement de son visage qui affiche une grimace. On peut aussi observer dans les quatre dernières affiches une démultiplication d'éléments visuels significatifs. Ces derniers qui sont autant de gags visuels projettent directement le spectateur dans l'univers du film. Les affiches en un sens gagent du caractère comique du film qu'elles illustrent. Pour exemple , celles d' Inspecteur la Bavure et de Deux heurs moins le quart avant Jésus Christ , proposent respectivement une parodie du filmes policier (ex: inspecteur Harry ) et du péplums (ex: Ben-Hur).


#place(top + center, float: true, clearance: 1em, grid(
  columns: 2,
  column-gutter: 1em,
  row-gutter: 1em,
  image("affiche_magnum_force.png"), image("affiche_benhur.png"),
))

En pastichant les affiches de films célèbres, le matériel promotionnel des films de Jean Yann et Claude Zidi s'inscrivent dans la tradition de la parodie, un genre éminemment familial dans la mesure où il propose à la fois le détournement d'un référent connu des adultes et également un spectacle dont la lecture indépendamment de ce même référent est possible et accessible aux enfants.



Dans ce contexte, on peut s’interroger sur la véracité d'une cristallisation du personnage scénique de Coluche au cinéma. Pour confronter cette idée, nous nous sommes penché sur la réception critique accordée au film de Claude Berri Le Maître d'école (1981). Ce film raconte l'histoire de Gérard BARBIER (Coluche), un jeune vendeur de vêtements qui se fait renvoyer de son travail pour avoir défendu un enfant chapardeur face à son patron. Se retrouvant sans emploi, mais constatant qu'il possède son baccalauréat et qu'il a fait une année de droit, il décide de devenir instituteur. Dès lors, il est engagé comme enseignant remplaçant sans grande difficulté, un emploi pour lequel il est sous-qualifié, et cela malgré toute sa bonne volonté. De cette situation découleront bon nombre de ressorts comiques, et autres tartes à la crème jouant sur les interactions d'un Coluche avec les réalités du système scolaire. À sa sortie le film obtiendra un véritable succès au box-office en rassemblant 3 millions de spectateurs, et on peut également noter qu'il est régulièrement rediffusé à la télévision française en prime time ( ce qui valide un peu plus le caractère familial de cette comédie). Nous avons pu recenser au sujet de cet objet d'étude plusieurs critiques formulées dans la presse spécialisée à la sortie du film et à l'occasion de ces rediffusions. Les extraits proposés ci-dessus reflètent de manière assez consensuelle l'avis émis par la majeure partie de la critique.

La première critique que nous allons décortiquer est tirée de la revue Cinématographe de novembre 1981. Elle paraît à l'occasion de la sortie du film. Cette dernière qui est rédigée par Gilles Cèbe est assez courte et semble noyée dans la revue au milieu des autres critiques. On peut supposer sans grande difficulté que l'écriture d'une critique sur le film de Claude Berri, naît plus de la nécessité de ne pas ignorer l'éléphant qui se trouve dans a pièce, que par véritable intérêt pour Le Maître d'école. Il est difficile de ne pas parler d'un film qui fait trois millions d'entrées. Au début de sa critique Gilles Cèbe s'attaque de prime à bord aux jeux d'acteur de Coluche qu'il qualifie comme : « dégoulinant de mièvrerie cucu-la-praline#footnote[Cinématographe, n°72, novembre 1981, Gilles CEBE, p.65] ». Ensuite, il prend en grippe la manière dont le film traite sa thématique : « filmer une comédie autour d'un instituteur, pourquoi pas, mais de là à le faire avec une telle dose de naïveté roublarde, d'irresponsabilité feinte et en fin de compte de lourde démagogie#footnote[Ibid.]. ». Enfin, Gilles Cèbe clôt sa critique en faisant le constat amer à ses yeux que le grand public semble apprécier ce genre de film : « Ce ton résolument franchouillard ou tout le monde il est beau, tout le monde il est gentil, plaît à un large public qui assure le succès du film. Ces quelques lignes n'y changeront rien#footnote[Ibid.]. »

Des critiques similaires fleurissent dans d'autres revues. On citera alors un certain F.A. qui écrit dans le numéro de janvier 1982 de Positif : « Claude Berri, avec Coluche en maître d'école candide, réalise un produit visible. Visible au sens de supportable, car c'est le plus mauvais film de toute la carrière de l'auteur du Vielle homme et l'enfant. Les bons sentiments de l'instituteur sécrètent la torpeur. Qui a pu croire à l’impertinence de Coluche ?#footnote[Positif, janvier 1982, A.F. , p.85] », avant de finir son article en écrivant : « Le maître d'école est parfait : il vous enlève la plus infime velléité#footnote[Ibid.]. »

En juin 1995, soit environ quinze ans après sa sortie, Le Maître d'école est rediffusé en première partie de soirée un mardi sur TF1. À cette occasion, le critique Jacques Siclier propose au sein du magazine Télérama un texte de quelque ligne. Cette brève critique a pour but d'orienter le téléspectateur parmi les différents programmes. La critique s'accompagne d'un résumé de l'intrigue du film, ainsi qu'un descriptif des acteurs et de leurs personnages. Comme genre, il est indiqué « comédie de mœurs#footnote[Télérama, n°2369, juin 1995, « Coluche au milieu, le conformisme au feu », Jacques SICLIER, p.143.] ».

Le critique doit faire vite et court à cause du format qui lui est imposé, il prend néanmoins le temps de poser un avis négatif. Il nous dit : « Coluche reste ici un personnage anticonformiste, mais il a arrondi les angles de son burlesque agressif et ne dit presque pas de gros mots, son bon sens et sa fantaisie suffisent à le transformer en pédagogue. Il sait parler aux enfants, et ses élèves deviendront de bons citoyens. Tout cela étant à la limite assez mièvre, une situation rose et réconfortante #footnote[Ibid.]. » Le critique reproche au réalisateur d'avoir livré au spectateur une version plus léchée de Coluche et en somme de ne pas avoir eu le courage de se confronter avec son sujet. Jacques Siclier nomme d’ailleurs assez ironiquement son article : « Coluche au milieu, le conformisme au feu #footnote[Ibid.] ». En cela, on constate le regret du critique de ne pas avoir vu un film plus frontalement politique.

Enfin, notre dernière critique est rédigée par Ginette Gervais dans la revue Jeune cinéma de décembre 1981. Cette dernière occupe une page et demie malgré la vétusté de la revue, on accorde ainsi de l'espace à un film ne nécessitant pas de publicité. La critique qui est assez longue est très descriptive s'attarde sur des éléments du scénario afin d'en dégager la portée idéologique. Le film n'est pas directement attaqué, il est plutôt perçu comme le reflet d'une époque. Une époque plutôt pessimiste. Le personnage de Coluche ne parvient pas à changer les choses, il est surtout là pour faire le moins de mal possible et intégrer un peu de tendresse. Il est conçu comme « le brave type qui ne fait pas de politique et qui s'entend avec tout le monde #footnote[Jeune Cinéma, n°139, décembre 1981, Ginette GERVAIS, p.43 39 Ibid 40 CHABROL, Marguerite, De Broadway à Hollywood, Paris, CNRS édition, 2016, p.36] », il s’accommode et limite les dégâts. Gervais dit alors du protagoniste que : « beaucoup des traits de son comportement traduisent l'idéal du français moyen version 81, une sorte d'anarchiste à la papa qui prend le contre-pied des valeurs jusque là communément admises#footnote[Ibid.]. »

Des trois critiques dont nous avons extrait des passages on retient surtout en dehors de leur rejet du film une forme de déception vis à vis du personnage incarné par Coluche. En effet, on perçoit à travers leurs réactions plutôt à charge, qu'ils s'attendaient à retrouver dans ce film avec Coluche, le personnage scénique de Coluche. Dès lors, si il sont capables d’identifier et de retrouver tout l'apparat qui constitue le personnage scénique de l'humoriste (dans la mesure ou leurs critiques nomment l'acteur et non le personnage) ce qui leur manque c'est ça radicalité. Le cinéma comique propose une version édulcorée de Coluche qui est à même d’être plus acceptable pour un large public.

D'une certaine manière cette distance que nous évoquons entre le travail sur scène de l'humoriste et sa transposition au cinéma est comparable au phénomène décrit par Marguerite Chabrol dans son ouvrage De Broadway à Hollywood au sujet des pièces de théâtre des années 30 adaptées par l'industrie du cinéma hollywoodien :

#dialogue[
  « #footnote[Jeune Cinéma, n°139, décembre 1981, Ginette GERVAIS, p.43 39 Ibid 40 CHABROL, Marguerite, De Broadway à Hollywood, Paris, CNRS édition, 2016, p.36]Au début de la période qui nous intéresse, autour de 1930 les discours sont catégoriques : au théâtre l'ambition artistique et la liberté de ton au cinéma un discours contrôlé pour éviter d'envoyer les masses sur la voix du vice. On en trouve des échos dans la vie publique et dans la presse. Le Hollywood Herald, journal professionnel pour la distribution et l'exploitation des films le rappelle par exemple en 1932 : '' Tout adaptation d'une pièce de théâtre écrite pour des publics adultes ayant une capacité de discernement doit, pour des raisons commerciales et morales, prendre en compte le fait que le cinéma s'adresse au masses, au moins théoriquement, quelque soit leur age, sexe, couleur, culture, éducation, ou condition antérieure d'esclavage''. »

]


Le passage au cinéma d'un objet scénique peut donc être perçu comme l’altération de ce dernier dans le but de plaire aux plus grand nombre. C'est donc tout naturellement, que le choix de proposer un produit à destination d'un public familial est opéré, car il assure dans une certaine mesure la rentabilité économique de la production. Dans ce contexte ce qui constitue le matériel humoristique de Coluche s'en trouve irrévocablement adouci et adapté. Ce qui en pâtit le plus c'est certainement le caractère politique de son œuvre qui au cinéma devient beaucoup plus lisse.

Ainsi, on peut avancer que ce qui est finalement cristallisé dans le personnage scénique de Coluche lors de son passage au cinéma c'est simplement son apparence. On conserve une version de son langage, quelques tics visuels ou sonores, en partant de là on crée un champ lexical de Coluche qu'on peut traiter à toutes les sauces dans les différentes productions cinématographiques. Mais dès lors, celui qui sur scène s’apparentait à la figure d'un bouffon au sens noble ne peut plus au cinéma adopter cette posture contestataire, sa place devient donc plutôt celle d'un clown.



== L'humoriste au cinéma l’avènement d'un modèle
=== Un modèle économique

Inspecteur la Bavure connaîtra à sa sortie un véritable succès populaire avec 3,7 millions de spectateurs devant les écrans français. Ce film n'est par ailleurs, qu'un exemple parmi d'autres des succès au box- office dans la carrière de Coluche. Il est à ce titre symptomatique d'une nouvelle façon de concevoir la production de comédies dans le cinéma Français. A savoir, monter un projet sur le nom d'un humoriste, qui fournira aux spectateurs un contenu calibré sur le travail sur scène de l'artiste. Le passage au cinéma de Coluche permet l’avènement de « la comédian comedy, « contre-tendance » de la comédie hollywoodienne basée sur la tension entre le maintien du comédien comme interprète (performeur) reconnaissable et l'assimilation de celui-ci à un personnage qui fonctionne au sein d'une narration classique#footnote[DREUX Emmanuel, Le Cinéma burlesque:ou la subversion par le geste, Paris, L'Harmattan, 2007, p.58] ». Une « comédian comedy » développée sur mesure pour les humoristes français.

Afin de mesurer concrètement l'étendue du phénomène, nous avons réalisé un recensement de l'ensemble des comédies dans lesquelles Coluche tient un rôle important au casting. Puis nous avons réalisé un tableau mettant en lumière le nombre de spectateurs sur le territoire français pour la première exploitation de chacun de ses films. Dès lors, il apparaît que sur onze comédies, seules trois ne dépassent pas le million d'entrées. On constate par ailleurs que ces dernières appartiennent à un système de production indépendant contrairement aux autres films. Enfin, quand on fait la moyenne du nombre total de spectateurs par film on obtient un résultat de 2 490 119, et cela même en incluant les films dont le box-office est inférieur à un million. Si on fait la moyenne en oubliant ces films, on atteint cette fois-ci 3 268 696. Ces chiffres témoignent de la rentabilité économique de ce type de production qui ont certes, pour point commun d'avoir fourni à Coluche l'un des rôles principaux, mais surtout qui travaillent sur une réutilisation de son personnage scénique à différents degrés.


#table(
  columns: 4,
  [Année de sortie], [Film], [Réalisateur], [Entrée France 1ère exploitation],
  [1976], [Les Vécés était fermer de l'intèrieur], [Patrice LECONTE], [434 449],
  [1976], [L'Aile ou la cuisse], [Claude ZIDI], [5 841 956],
  [1977],
  [Vous n'aurez pas l'Alsace et la Lorraine],
  [Coluche et Marc MONNET],
  [810 839],

  [1980], [Inspecteur la Bavure], [Claude Zidi], [3 697 576],
  [1981], [Le Maître d'école], [Claude BERRI], [3 015 596],
  [1982],
  [Deux heures moins le quart avant Jésus Christ],
  [Jean YANNE],
  [4 601 239],

  [1983], [Banzaï], [Claude Zidi], [3 769 689],
  [1983], [La Femme de], [Bertrand BLIER], [1 485 747],
  [1984], [Le Bon roi Dagobert], [Dino RISI], [1 070 467],
  [1984], [La vengeance du serpent à plumes], [Le Fou de guerre], [2 667 303],
  [1985], [Le Fou de guerre], [Dino RISI], [296 949],
)



Suite à la mise en valeur des chiffres au box-office des comédies de Coluche, nous avons cherché à démontrer l’émergence d'une tendance dans le cinéma français. Pour ce faire, nous avons recensé #footnote[L’ensemble des recensements effectués ont été organisés dans des tableaux disponibles dans les annexes du mémoire.] sur les décennies 90, 2000 et 2010 l’ensemble des productions cinématographiques françaises années par années. Puis, nous y avons opposé l'ensemble des productions françaises intégrant au sein de leur casting un humoriste parmi les trois premiers rôles. Dans ce recensement, ont été considérés comme humoristes, les individus entrant dans la catégorisation que nous avons définie précédemment dans notre introduction. À titre d'exemple, un film comme La Cité de la peur n'a pas été retenu puisque bien que les membres du groupe Les Nuls puissent être considérés publiquement comme des humoristes, ils n'entrent pas dans le cadre que nous avons au préalable établi. Enfin, nous avons réalisé une moyenne du nombre d'entrées au box- office des films prenant pour acteur un humoriste, en première exploitation. Cette moyenne a été réalisée pour chaque année. Avec ce recensement, on constate tout d'abord que la moyenne des chiffres au box-office atteint presque systématiquement le million d'entrées. Si l'on peut voir une baisse notable de ce nombre dans la décennie 2010, cette tendance semble embrasser un phénomène plus général de baisse de fréquentation des salles de cinéma sur le territoire français pour la période donnée. Cette tendance mise de cotée, il apparaît qu'en faisant la moyenne du nombre d'entrées toutes périodes confondues on atteint un nombre de 1 216 099,3. Dès lors, il ressort qu'en matière de production le fait d'intégrer un humoriste dans son casting comporte un enjeu marketing payant puisqu'il offre statistiquement la possibilité d'atteindre le million d'entrées. Ainsi, ces types de productions se sont développées de manière exponentielle sur la période. En effet, si sur la décennie 90 elles ne représentaient que 6,6% de la production cinématographique française, pour les années 2000 elles atteignent 8,8% avant de finir à 12,7 % sur la décennie 2010. Les passages au cinéma de Coluche dans les années 80 ont démocratisé l'idée que les humoristes pouvaient être réemployés pour le septième art. Comme le montrent les chiffres, l'implication des humoristes dans le cinéma français semble s’être systématisée. Le cinéma français a pour ainsi dire intégré l'idée que la scène humoristique représente un bassin d'artistes populaires exploitable principalement pour des motifs financiers.


Afin de faire gagner en clarté les chiffres obtenus, nous avons mis en avant les productions arrivées en première position du box-office pour chaque année au sein de la catégorie définie. On peut alors observer que les films retenus s'inscrivent dans un même schéma. Certains humoristes se retrouvent même au casting de ces productions de manière répétitive. C'est le cas de Valérie Lemercier dans les films Les Visiteurs (1993) ; Palais Royal (2005) ; et Le Petit Nicolas (2009) qui ont su se glisser au top de notre classement pour leurs catégories respectives. On peut aussi citer Jamel Debbouze avec Le Ciel, les oiseaux et ta mère (1999), Le fabuleux destin d'Amélie Poulain (2001), Astérix et Obélix mission Cléopâtre (2002), et _Sur la piste du Marsupilami_ (2012). On retrouve également à plusieurs reprises Dany Boon avec Bienvenue chez les ch'tis (2008), Rien à déclarer (2011) et La ch'tite famille (2018). Enfin nous avons Franck Dubosc avec les films Camping (2006), Camping 2 (2010) et Camping 3 (2016).


Au sein des films cités ci-dessus on peut observer trois catégories. Nous avons tout d'abord la tendance minoritaire à savoir les films dits art et essai. Qui sont réductibles aux films de Jean-Pierre jeunet Le Fabuleux destin d'Amélie Poulain et celui de Djamel Bensalah, Le Ciel, les oiseaux et ta mère. Puis nous avons la tendance majoritaire avec ce que l'on peut considérer comme de la comédie familiale à gros budget. Enfin notre dernière catégorie est celle des films dans lesquels les humoristes sont à la fois acteurs et instigateurs dans le projet en temps que scénaristes, réalisateurs où producteurs. Ces films-ci, peuvent également être intégrés dans la catégorie précédente, ainsi Bienvenue chez les ch'ti réalisé par Dani Boon est également une comédie familiale à gros budget. En partant de cette observation, on peut avancer les hypothèses suivantes. Tout d'abord, le film art et essai en prenant un humoriste dans son casting propose finalement un procédé classique du cinéma, à savoir le contre emploi. Quand Coluche est choisi par Claude Berri pour jouer dans Tchao Pantin le producteur et réalisateur propose un coup de maître à la fois commercial et esthétique. En faisant passer Coluche de la comédie au drame la proposition artistique tient dans un bouleversement du jeu de l'acteur, mais plus important, la proposition économique est de parier sur le fait que les spectateurs viendront dans les salles pour voir si l'humoriste qui les fait rire est capable de les faire pleurer. L'idée est sensiblement similaire avec Jamel Debbouze dans Le Fabuleux destin d'Amélie Poulain, l'humoriste bien qu'il joue dans une comédie, propose une partition beaucoup plus sensible et nuancé que celle de ses spectacles. Le procédé du contre-emploi possède dès lors un avantage économique évident. Le film de Jean-Pierre Jeunet se monte avec un budget de 11,7 millions d'euros et il rapportera à sa sortie 164,4 millions d'euros, c'est un pari gagnant.

On constate également que la comédie familiale est financée sans crainte par les producteurs qui n’hésitent pas à y investir des montants conséquents. Cette dernière à fait ses preuves du point de vue de la rentabilité économique puisqu'elle représente l'une des parts de marché les plus prisées par les spectateurs français. Prenons en exemple la série de films Camping réalisés par Fabien Onteniente avec en rôle-titre l'humoriste Franck Dubosc. Le premier opus se monte avec un budget de 14 millions d'euros , il rassemble 5 491 412 spectateurs français et rapporte 34,1 millions d'euros, sa suite est produite pour 23 millions d'euros, rassemble 3 491 284 spectateurs français et rapporte 32,1 millions d'euros. Enfin Camping 3 est financé à hauteur de 15 millions d'euros, rassemble 3 223 877 spectateurs français et rapporte 22,9 millions d'euros. Ainsi, les trois films de la série sont respectivement rentables à 253%, 147%, et 157%. Si l'on constate une baisse de la rentabilité pour les suites de Camping, cette dernière est néanmoins loin d’être déficitaire. Nous pouvons avancer à l'issue des chiffres obtenus au cours de cette sous partie que la présence d’humoristes au sein du casting des films que nous avons analysés participe du succès économique de ces productions.

Enfin, il nous reste notre dernier cas de figure qui est celui où les humoristes sont instigateurs du projet, à l'instar de Palais royal réalisé et scénarisé par Valérie Lemercier ou encore La Tours Montparnasse infernalee qui compte parmi ses scénaristes et ses producteurs Éric Judor et Ramzy Bedia. L'implication des humoristes dans ce que l'ont pourrait qualifier comme les rouages des films va avoir un impact esthétique sur le contenu des productions. Nous nous attacherons à explorer cet aspect ainsi que le cas des films à contre-emploi dans la suite du développement affin de venir questionner une forme de distanciation de l'humoriste vis-à-vis de sont personnage scénique. Pour l'heur, nous nous sommes dans cette sous partie attachés à mettre en valeur le développement d'un modèle économique, il s'agit à présent d'en observer les effets dans ce qui s'apparente à un modèle esthétique.


=== Un modèle esthétique : nouvel « agencement privilégié » du cinéma

Nous pouvons inscrire la présence d'humoristes au cinéma dans la continuité d'une réflexion qui n'a cessé de jalonner les études cinématographiques et qui n'est autre que la question de l'impureté. En effet, le cinéma a rapidement été considéré comme un art impur dans la mesure où il pratique de par son dispositif une synthèse des autres arts (photographie, théâtre, musique, littérature, etc...). André Bazin dans son article « Pour un art impur », où il défend l’impureté du cinéma comme l'un de ses principaux atouts, avance des arguments qui sont aussi au centre de notre problématique :

#dialogue[
  « Les 1er cinéastes ont [...] sous tiré leurs biens à l'art dont ils allaient conquérir le public, à savoir le cirque, le théâtre forain et le music-hall qui fourniraient en particulier aux films burlesques une technique et des interprètes#footnote[BAZIN, André, Qu'est-ce que le cinéma ?, « Pour un cinéma impur », Paris, Cerf, 2011, p.85] ».
]



Le phénomène décrit par Bazin concernant le cinéma des premiers temps est similaire à celui que nous tentons de décrypter. Ici il s’agit également d'un réemploi par le septième art de performeurs ayant prouvé leurs popularités, qui s’illustrent dans le registre comique, et qui d'une certaine manière font migrer leur savoir-faire humoristique au cinéma. Des lors, la porosité que nous nous attachons à révéler entre le monde des humoristes et le cinéma n'est autre qu'une continuité assumée du développement essentiel du septième art. On peut aussi noter que cette porosité dans sa conception développe un équilibre entre les deux partis qui donnent et reçoivent réciproquement et finalement s'entretiennent. Ainsi, on s'inscrit pour ce qui concerne la question de l’humoriste au cinéma dans une problématique attrayante aux star studies. A ce titre, les œuvres étudiées incorporent dans leurs univers filmiques tout élément constitutif de l'univers médiatique de l'artiste. Ce phénomène est justement décrit par Jacqueline Nacache dans son ouvrage L'acteur de cinéma :

#dialogue[
  « le chemin qui mène du personnage à l'acteur est inversé, bien des films s’écrivent pour les acteurs ou autour d'eux , à partir d'un désir, d'une image, plus prosaïquement, d'une stratégie commercial#footnote[NACACHE, Jacqueline, L'acteur de cinéma, Paris, Nathan, coll.Cinéma, 2003, p.87]. »
]

Ici, l'ensemble des aspects de la persona de l'artiste vont donc appartenir au para-filmique d'une œuvre, et appliquer une marque non négligeable sur le contenu de cette dernière. Ainsi, il ne s'agit plus d'une impureté qui ne concernerait que l'art vis à vis des autres arts. On rejoint donc la thèse développée par le philosophe Alain Badiou concernant l'essence de l'impureté cinématographique :


#dialogue[
  « une thèse aujourd'hui incorporée à la doctrine de l'Art du cinéma, […] est celle de l'impureté essentielle à cette art. Jusqu’à présent cette thèse signifiait surtout que le passage de l'idée dans un film suppose un jeu complexe de convocation et de décalage des autres arts (le théâtre, le roman, la musique, la peinture...) et qu'il n'existe donc pas de cinéma pur, sauf dans la vision en impasse du formalisme avant-gardiste. Nous devons élargir la thèse de l'impureté et poser le principe suivant : Le cinéma est un lieu d'indiscernabilité intrinsèque entre l'art et le non art#footnote[BADIOU, Alain, Cinéma « considérations sur l'état actuelle du cinéma », Paris, Novas, 2010, p.223]. »
]

L'impureté cinématographique consiste donc pour Badiou dans l'intégration
au sein des films d'objets à caractère non artistique, le cinéma est impur
dans la mesure ou il mélange différents régimes d'images. La terminologie
non art, si elle est vaste, permet dans la thèse de Badiou d'inclure à
l’imprutée cinématographique un forme de quotidienneté qui fait de son art
un objet accessible :

#dialogue[
  « Un film est contemporain, et donc destiné à tous, pour autant que le matériau dont il assure l'épuration est identifiable comme appartenant au non art de son temps. C'est ce qui fait du cinéma, intrinsèquement et non empiriquement, un art de masse : son référent interne n'est pas le passé artistique des formes, ce qui supposerait un spectateur éduqué, mais une imagerie courante dont les opérations artistiques éventuelles assurent le filtrage et le traitement distancié#footnote[Ibid p.226.]. »
]



Sur ce point le cinéma est similaire à l'art du one man show et du stand up. Tous deux proposent à leur manière une réinterprétation du non art de son temps. Lorsque Coluche propose un sketch sur la publicité c'est précisément un processus « d’épuration » qu'il entreprend. Il réinterprète les lieux communs d'une forme médiatique largement diffusée pour en extraire un matériel humoristique. Dans la mesure où l'humoriste nourrit son art d'une quotidienneté et utilise des référentiels communs, il s'inscrit donc dans le même procédé que le cinéma, son rapport au non art mais aussi aux autres formes artistiques (dont le rayonnement est indéniable et donc devenu populaire) est transversal. A cela, on peut ajouter que la réappropriation d'un l'objet non artistique consiste en le même procédé que celui de « l'épuration » du non art dans l'art cinématographique décrit par Badiou. Il existe également une « indiscernabilité intrinsèque entre l'art et le non art » puisque comme dans notre exemple du sketch sur la publicité de Coluche le matériel publicitaire qui est épuré (à savoir la publicité pour la lessive omo qui promet de rendre le linge « plus blanc que blanc ») vient se confondre dans la structure du sketch et ainsi, l'artistique et le non artistique ne forment plus qu'un.

Pour revenir plus précisément à la question du cinéma on peut aussi avancer le point suivant : nous nous sommes attachés à présenter l'humoriste comme une personnalité revêtant une persona. Par ce biais, il développe une identité publique et médiatique assimilable à un objet de consommation inscrit dans une culture de masse. Nous pouvons d'une certaine manière considérer cette persona de l'humoriste, comme un objet non artistique, sur lequel le cinéma entreprend un processus d'épuration.

Ainsi, ce qui est pris dans un film ce n'est pas seulement l'univers artistique développé par l'humoriste, mais l'ensemble de ce qui constitue sa persona. Le fait de l'intégrer comme tel dans le cinéma c'est aussi intégrer le non artistique composite de sa figure médiatique. Dès lors, on assiste nécessairement à une domination des représentations qui donnent lieu à des propositions filmiques codées et manufacturées, à l'instar de ce que décrit Badiou dans la suite de son développement :

#dialogue[
  « On gardera bien entendu l'idée que les opérations artistiques de la
  modernité consistent à épurer les matériaux ( visibles et audibles) de tout ce
  qui les rattache à la domination de la représentation, de l'identification et du
  réalisme. Mais on ajoutera que le défi actuel est qu'il convient d'étendre ce
  traitement à tout ce qui rattache les matériaux à la pure consommation
  formelle d'images et de sons, dont les agencements privilégiés sont
  aujourd'hui : la nudité pornographique, l'effet spécial cataclysmique,
  l'intimisme du couple, le mélodrame social et la cruauté pathologique#footnote[Ibid p.227.]. »
]

La présence de l'humoriste au cinéma peut être considérée comme une nouvelle forme d'agencement privilégié de ce dernier. Il s'agirait de la représentation de vedettes (ou stars) au cinéma s'imposant conformément à leurs existences dans l'espace médiatique. Dès lors, la question de l'épuration propose deux options hypothétiques concernant les objets filmiques de notre sujet. Nous avons d'une part les œuvres qui proposent une réflexion esthétique et thématique sur la persona de leurs acteurs et les films qui eux, intègrent cette persona sans la réfléchir en amont. Ainsi, on peut lier le tout à notre problématique initiale qui est celle de la cristallisation du personnage scénique au cinéma. Lorsque cette dernière est effective, on peut avancer que l'épuration du matériel non artistique n'a pas lieu. L'épuration n'a lieu que lorsque le personnage scénique en passant au cinéma procède à une décristallisation.



== Éric et Ramzy : une success story des années 2000
=== De la télévision

Avant de nous plonger pleinement dans les premiers films au cinéma d'Éric et Ramzy, il nous faut en première instance aborder leurs débuts télévisuels. En effet, c'est aussi parce qu'ils s’illustrent au sein du petit écran que l'humoriste devient une figure de la consommation de masse et à ce titre est envisagé par l'industrie du cinéma. Nous n'avons fait que l'évoquer, mais Coluche avant d’être découvert sur scène l'est pour la majeure partie des Français dans la retransmission de ses sketches à la télévision. Pour ce qui est d'Éric et Ramzy, le processus de réemploi de leurs humours au sein du régime télévisuel, présente une manœuvre sensiblement différente de celle de Coluche. En effet, leur première apparition remarquable dans le petit écran, c'est au sein d'une pastille humoristique développé par la chaîne de télévision M6, intitulée Les Mots d'Éric et Ramzy (1998). Il s'agit pour le contenu d'un programme court de seulement une à deux minutes qui reprend le principe des sketches de définition de mots développés par le duo sur scène ( et dont nous avons fait entre autres l'analyse dans notre partie 1 sur l'étude de sketch). Avec Les Mots d'Éric et Ramzy, la télévision ne propose aucune invention, on assiste à une transposition totale d'un sketch jusque dans sa forme. Dans cette pastille, le duo se présente face caméra, dans sa tenue de scène. Une scène sur laquelle ils sont justement en train de tourner. Derrière eux se trouve un tableau sur lequel est inscrit le mot qu'ils s’apprêtent à définirent. L'action se déroule bien entendu dans un franchissement du quatrième mur, se manifestant par les multiples adresses au public. Dès lors, ce qui varie par rapport au cas de Coluche réside dans la nature du produit. D'un côté, nous avons une captation de sketch développé sur scène devant public, dans lequel tout indique que la présence de la caméra n'est qu'un ajout le déroulement des événements scéniques ce fait indépendamment de sa captation. Dans le second cas, la représentation scénique se fait pour la caméra et non pour un public présent dans la salle. Ici la scène est conservée, mais sa présence au sein du programme est finalement très artificielle. En fin de compte, le programme a par bien des aspects la valeur d'un outil de promotion pour le spectacle des deux humoristes. Finalement avec cette première incursion dans le milieu de l'audio visuelle, le duo propose une cristallisation parfaite de leurs personnages scéniques en reproduisant trait pour trait leur travail sur scène cette fois-ci devant la caméra.


Quelques années après cette première incursion dans le petit écran, le duo le réintègre dans H une série qu'ils créent aux cotées de Kader Aoun et Xavier Mathieu. La série prend la forme d'une sitcom ce qui veut dire que les séquences sont tournées devant public et que les rires que l'on entend dans le produit final ne sont pas rajoutés au montage, mais qu'ils proviennent des spectateurs présents sur le plateau. Cette sitcom raconte l'histoire de Aymé (Eric Judor), Sabri (Ramzy Bedia) et Jamel (Jamel Debbouze), toutes les trois respectivement employés d'un hôpital en temps qu’infirmier, brancardier et réceptionniste. Ces derniers qui brillent par leurs incompétences enchaînent les fautes professionnelles ce qui permet le développement d'un ensemble de situations comique largement exploité par les trois humoristes. Ici c'est le dispositif de la sitcom qui va nous intéresser. En effet, ce dernier permet de créer une simultanéité du rire du spectateur et de l'acte de son artisan. On se situe donc sur un travail humoristique semblable à celui de la scène. L'acteur de sitcom avant de proposer un personnage appartenant au monde de l'audio visuelle, en livre un constitutif d'une performant scénique. C'est dans ce contexte qu' Éric et Ramzy ( mais également Jamel Debbouze ) proposent des personnages scéniques pour la télévision. Les ressorts comiques dont ils usent sur les spectateurs du plateau de tournage sont sensiblement similaires à ceux que l'on retrouve dans leurs travaux sur scène (un travaille sur le jeu de mots, sur les fautes grammaticales, le déguisement, le quiproquo, l’innocence d'un personnage face à la moquerie d'un autre, etc.). Dans H, ce qui va primer aux cotées de l'incompétence des personnages c'est leurs immaturités. Ces derniers suivent toutes leurs envies indépendamment du mal qu'il pourrait causer à autrui. Ce comportement hédoniste et égoïste en s'inscrivant dans le cadre du monde hospitalier va fatidiquement conduire à des répercutions plus ou moins grave sur les patients.

Dans l'épisode 3 de la saison 1 intituler « un manuscrit », Aymé doit s'occuper d'un patient dépressif qui vient de faire une tentative de suicide. Ce dernier vient d'écrire un livre et il souhaite qu'Aymé le lise pour lui faire des retours sur son manuscrit. Sauf qu'Aymé n'a pas le courage de lire les 382 pages du livre « mon âme est un noir tunnel dans la nuit noire de ma sombre vie ». Dès lors, il confie à Sabri pour mission de le lire et de lui en faire le résumer. Malheureusement Sabri le perd dans le métro et Aymé ne voulant pas heurter la sensibilité de son patient préfère lui mentir et dit qu'il a beaucoup apprécié sa lecture. Pour en savoir plus, le patient lui demande des détails et comprend qu'Aymé n'a rien lu et il en déduit que c'est parce que son ouvrage est trop mauvais. Le patient dans un dernier geste se suicide en sautant par la fenêtre. Quelque temps plus tard, la mère du défunt arrive à la morgue pour identifier le corps c'est là qu'elle croise Aymé et comprend que ce dernier aurait en sa possession les derniers mots couchés sur papier de sont fils. Aymé ne voulant pas blesser cette mère endeuillée, il décide d'écrire un livre avec ses collègues. Lorsque l'équipe lui restitue le manuscrit tronqué, la mère après sa lecture déclare avoir « enfanté le plus mauvais auteur de l'histoire de la littérature » , et à son tour elle fait une tentative de suicide en se jettent par la même fenêtre que son fils. Et même si leurs actes ont entraîné un décès et une tentative de suicide, à aucun moment les personnages ne font de remise en question, et c'est une happe end riante qui les attend fatidiquement.

Dès lors, si leurs actes ont bel et bien des conséquences sur les victimes de leur immaturité, le retentissement à leurs égards sont quasi inexistant. En effet, c'est les fondements de la sitcom d'avoir des personnages que l'on peut retrouver sur son écran de télévision chaque semaine et qui de ce fait ne peut donc évoluer. Le personnage de sitcom ne doit pas changer pour se conforter aux attentes du spectateur. Dans ce contexte Aymé, Sabri et Jamel, ne peuvent apprendre de leurs erreurs et devenir mature. Ils sont bloqués à un stade enfantin ( à l'instar des personnages scéniques d'Éric et Ramzy), et ainsi les conséquences de leurs actes ne les touchent pas directement puisque leur environnement devient un terrain de jeux. Lorsqu'ils tombent, ils se relèvent et rien de cela ne semble douloureux. Ils sont comme des clowns qui se prennent des tartes à la crème et poursuivent leurs numéros ( là où un bouffon peut subir les conséquences de sa moquerie s’il ne fait pas rire son roi). Le comique développé dans H est donc inconséquent tout comme celui des mots d'Éric et Ramzy ou de leur spectacle au palais des glaces. Les personnages de la série ne font que stagner pendant quartes et ils se cristallise dans leur immaturité. Leur seul échappatoire intervient dans l'épisode final :

Au début de ce dernier, Sabris prépare à manger pour tout le monde, malheureusement, celui-ci ne sachant pas ce qu'il fait incorpore de la mort-aux-rats dans le plat principal tuant dans la foulée ses collègues puis lui même. Suit à une intervention divine l'ensemble de la bande est ressuscitée. Ils peuvent donc vivre de nouveau et cette fois-ci en évitant de manger le plat empoisonné. Mais tout cela était sans compter sur les performances culinaires de Sabri qui a également mis de la mort-aux-rats dans le dessert qui est lui dégusté par tout le monde. Ainsi, tout le monde meurt de nouveau puisqu'ils n'ont pas appris de leurs erreurs. La seule manière d’échapper à ce personnage scéniquotélévisuelle pour espérer évoluer c'est de le tuer.

Enfin, le dernier exemple de l’incursion d'Éric et Ramzy dans l'univers télévisuel, sur lequel nous allons nous pencher c'est la série d'animation Ratz (2003) crée par Richard Zielenkiewicz. Elle met en scène les aventures de deux rats, Razmo ( Eric Judor ) et Rapido ( Ramzy ), qui habitent dans un pack bot transportant du fromage et vivant des aventures tout en tentant d’éviter d’être exterminé par les membres de l'équipage qui cherche à se débarrasser d'eux. Dans les Ratz, Éric et Ramzy réalisent le phantasme de leurs personnages scéniques. Ces deux rats qui se transporte sur des tapettes à souris volante ( « les ratboard ») font du bateau sur lequel ils vivent un immense terrain de jeux qui laisse place à une imagination ne se bordent pas aux limites de la prise de vue réelle. En effet, le format du cartoon leurs permet de doter d'une corporalité leurs excentricités scéniques. Avec Ratz Eric et Ramzy propose le dessin du monde de l'enfance décrit par leurs personnages scéniques.

Dès lors, le travail pour la télévision du duo va encrer un peut plus leurs personnages dans l'imaginaire collectif. Finalement avent leurs passage au cinéma, ces multiples incursion au seins du petit écran auquel s'ajoute leurs spectacles sur scène leurs servent aussi d'outil promotionnelle largement diffusé pour leurs future films. C'est un processus qui n'est pas nouveau et que nous décrit Marguerite Chabrol dans De Broadway à Hollywood :


#dialogue[
  « Plus généralement, la notoriété de la pièce fonctionne comme une
  campagne préalable à la sortie du film y compris a l'étranger […] un des
  intérêt et des adaptations pour Hollywood, qu'il s'agisse de roman, bandes
  dessinées ou de spectacles de Broadway, est qu'une partie de la promotion à
  déjà été assuré par une autres industrie culturelle#footnote[CHABROL, Marguerite, De Broadway à Hollywood, Paris, CNRS édition, 2016, p.57].»
]

Dès lors, une la promotion assuré par l'industrie télévisuelle et scénique, tout les voyants sont au vert pour lancer la production du premier film d'Eric et Ramzy : La Tour Montparnasse infernalee.

=== La tour Montparnasse infernale : écrire pour le cinéma avec la mémoire de la scène

Le projet de La Tour Montparnasse infernale naît de la rencontre d'Éric et Ramzy avec le producteur Christian Fechner après une représentation du spectacle du duo au palais des glaces. Fechner qui n'en est pas à son premier coup avec des humoristes puisqu'il a notamment produit L'Aile ou la cuisse, sent directement le potentiel du duo, et c'est sur la base du visionnage de leur spectacle qu'il leur donne carte blanche pour la rédaction du scénario de leurs premier long métrage. Pour ce faire, notre duo qui n'a pour l'instant aucune expérience du 7 septième art s'entoure d'une équipe qu'il connaît bien en prenant pour coauteur Kader Aoun et Xavier Mathieu déjà crédité sur la série H. Enfin, en ce qui concerne le casting de la comédie qu'ils sont en train de concocter, ils peuvent s’appuyer sur la participation de plusieurs collègues faisant partit de la nouvelle génération de l'humour, à l'instar des membres de la troupe des Robins de Bois ou encore de leurs anciens coanimateurs sur Fun radio Omar Sy et Fred Testot. Pour finir, à la production Fechner s’entoure en plus de l’appui d'UGC, de deux petites sociétés de production qui prennent pour nom 4 mecs à lunettes, et 4 mecs en baskets qui sont respectivement détenus par Ramzy Bédia et Eric Judor. C'est précisément en ce point que la comparaison entre le travail au cinéma de Coluche et celui de notre duo vient à diverger. En prenant le risque d’être producteur de leur projet, Éric et Ramzy s'assurent une plus grande liberté quant au développement de films en accord avec leurs aspirations artistiques, là ou Coluche n’a que le poids de son nom notre duo s’assure une main mise financière (entre autres permise par le succès de H et de leur premier spectacle).


À présent, penchons-nous sur le contenu du film en lui même. La Tour Montparnasse infernale raconte l'histoire de deux laveurs de vitres aux compétences intellectuelles limitées (Éric et Ramzy) qui travaillent ensemble sur la célèbre tour parisienne. Le personnage d'Éric est amoureux de celle qu'il appelle Marie-Joëlle (Marina Foïs), la nièce du PDG d'une importante entreprise dont les locaux se situent dans la tour. Un jour, alors que nos deux protagonistes effectuent leur travail avec plus ou moins de sérieux, ils surprennent une prise d’otage dans laquelle Maris-Joëlle semble être retenue. Guidé par son amour pour la jeune femme et épaulé par son partenaire de toujours, Éric se lance à la rescousse de celle qu'il croit en danger. Il s’avère finalement que depuis le début la prise d'otage était un coup monté par Marie-Joëlle qui ambitionnait d’extorquer les fonds de la société de son oncle, mais c'était sans compter sur l'intervention maladroite, mais pourtant particulièrement efficace des deux laveurs de vitres, qui éliminent chacun de leurs assaillants sans comprendre aucun des tenants et aboutissants de la situation. La Tour Montparnasse infernale c'est en somme Dumb et Dumber faisant leur Die Hard et ce sera une première incursion au cinéma gagnante puisque le film rassemblera à sa sortie 2 millions de spectateurs. Avent de proposer une analyse du film, on peut noter qu'à aucun moment il ne nous est donné le nom des deux laveurs de vitres. Nous pouvons avancer que cette absence de patronyme sert à renforcer les liens étroits entre les acteurs eux-mêmes et leurs personnages, puisque le spectateur pour les nommer n'a d'autre choix que de dire Éric et Ramzy. Nous ferons donc de même dans notre analyse.

Si dans leur travail sur scène, Éric et Ramzy déploient une écriture scénique cinématographique comme nous avons pu le constater dans notre partie sur l'étude de sketches,en passant au cinéma, on va assister au processus inverse. En effet, pour entrer dans le septième art, les deux humoristes vont se servir de ce qu'ils connaissent pour faire rire en proposant une écriture cinématographique profondément scénique. Dès lors, on peut considérer la Tour Montparnasse infernale comme le film qui va engendrer la cristallisation de leurs duos comiques.

Pour justifier notre point sur l’incursion du scénique dans le cinématographique on peut tout d'abord parler de la méthode de préparation du film. En effet, lorsque Éric et Ramzy sont en écriture pour La Tour Montparnasse infernale, ils sont en parallèle toujours présents sur scène, et chaque soir ils ont l'opportunité de tester leur matériel devant des spectateurs. On peut donc avancer qu'une partie du matériel comique avant d'avoir été joué devant la caméra, l'a été pour la scène. Ce dispositif spécifique mis en place par le duo est identifiable dès la première séquence.


Dans celle-ci, Éric et Ramzy sont sur une nacelle et ils lavent les vitres de la tour Montparnasse, du moins c'est ce qu'ils sont supposés faire. Dans les faits ils se chamaillent, ils plaisantent, ils crachent sur les passent tout en bas, et puis finalement ils jouent. Mais cette fois-ci leurs jeux ne sont plus sur scène, mais sur une nacelle suspendue en haute altitude. À l'image la camera déploie une mise en scène rudimentaire puisqu'on à majoritairement l'alternance de trois types de plans : un plan italien de face et deux plans rapprochés permettant un champ contre-champ au sein du duo. Cette mise en scène de par sa simplicité permet le déploiement d'un espace de création humoristique. Au sein des plans Éric et Ramzy disposent d'une liberté du geste comique. La nacelle en elle-même devient un espace comparable à une scène. Le spectateur rentre donc dans le film avec quelque chose qu'il connaît et peut-être même qu'il attend.

Enfin, pour appuyer d'avantage notre argument, on peut noter que Pierre-François Martin-Laval (PEF), qui à réalisé la mise en scène du premier spectacle d'Éric et Ramzy, et qui interprète le rôle du concierge de la tour est choisi en temps que conseiller artistique sur le tournage. Ainsi, il donne suite à leur collaboration scénique cette fois-ci sur le plateau comme il en témoigne dans une interview en 2021 :

#dialogue[
  « "Tous les matins, je partais au studio, une ancienne usine à Viry-Châtillon (Essonne), où j'étais seul avec Éric et Ramzy", confie Pef. "D’abord, on réécrivait un peu la scène, on inventait des gags, puis je les mettais en scène dans les décors. À midi, Charles Nemes venait, je lui montrais la scène et je partais à 14 heures répéter avec Les Robins des Bois à Canal+. En France, je pense que c’est la seule fois où c’est arrivé."#footnote["La Tour Montparnasse infernale" a 20 ans: L'histoire secrète de la comédie culte de Éric et Ramzy ,BFMTV, Lachasse Jérôme, le 28/03/2021] »
]


Le travail de préparation de chacune des journées de tournage décrite par PEF renvoie à une méthode actorale à la fois unique dans le contexte hexagonal et s'inspirant de techniques américaines utilisées dans le cinéma burlesque. En effet, on peut citer les Marx Brothers, qui lorsqu'ils tournaient dans un film la journée, se servaient de leurs représentations sur scène le soir pour tester leurs gags en allant jusqu'à chronométrer le temps de rire des spectateur#footnote[« Je sais que les Marx Brothers jouaient le soir au théâtre les sketches des films qu'ils tournaient le lendemain. Ils chronométraient le temps des rires, pour laisser le temps, le lendemain, pendant le tournage. » Entretien avec Eric Judor dans :GANZO, Fernando, GOLDBERG, Jacky, MEVEL, Quentin, La Nouvelle comédie du cinéma français, Les nouvelles éditions JMP, Paris, 2017,p.53-54]. Que ce soit dans le cas des Marx Brothers ou d'Éric et Ramzy, l'idée est de développer une précision dans le geste comique, et c'est un travail en lien avec l’instantanéité de la réaction du public dans l'espace scénique qui leur permet de développer une plus grande justesse humoristique au cinéma.

Cette précision nous pouvons l'analyser dans la séquence d'ouverture (00:01:55 à 00:05:23) dont la trame narrative est la suivante :

Éric et Ramzy sont cote à côte du haut de leur nacelle, ils s'amusent à cracher sur les passants. Ils comptent les points, celui qui atteint le plus de cibles à gagné. Ramzy Crache, réussi à toucher un passant. Éric l'applaudit :


#dialogue[
  « Éric : 1;0

  Ramzy : Non 2;0

  Éric (étonné) : 2;0 ?

  Ramzy : Bah oui 2;0 ! »
]


« Je sais que les Marx Brothers jouaient le soir au théâtre les sketches des films qu'ils tournaient le lendemain. Ils chronométraient le temps des rires, pour laisser le temps, le lendemain, pendant le tournage. » Entretien avec Eric Judor dans :GANZO, Fernando, GOLDBERG, Jacky, MEVEL, Quentin, La Nouvelle comédie du cinéma français, Les nouvelles éditions JMP, Paris, 2017,p.53-54


#dialogue[

  Éric finit par s’accommoder du compte des points tenu par Ramzy. C'est désormais à son tour de cracher, mais lorsqu'il tente de viser, Ramzy lui fait peur ce qui provoque le sursaut d'Éric et l’hilarité de Ramzy :

  « Éric (sarcastique) : Hahaha très marrant, on ne doit pas avoir le même sens
  de l'humour. »

  Éric, vexé se venge alors de Ramzy en désignant du doigt son t-shirt avant
  de dire :

  « Éric: olala regarde t'as une tache. »

  Ramzy regarde son t-shirt, sur lequel aucune tache n'est présente, puis Éric
  lui met son doigt dans l'oeil en disant :

  « Éric : Piscine »

  Éric rigole tandis que Ramzy se fâche :

  « Ramzy : Oh c'est bon, on perd du temps là. Il faut qu'on renettoie maintenant. J'ai mon deuxième cours de force pure ce soir. Tu crois quoi, je vais pas perdre mon temps ici. Aller ! Au boulot !

  Éric (boudeur) : C'est toi aller hop au boulot.

  Ramzy : Hé ! Ho ! C'est moi qui décide hein !

  Éric : Bon d'accord. Mais moi je suis deuxième à décider. »
]

Les deux protagonistes ronchonnent et finissent par se mettre au travail. Ils mettent de l'eau avec du produit sur la vitre puis passent la raclette pour tout nettoyer. C'est alors que Ramzy décide d’embêter de nouveau son coéquipier. Dès qu'Éric finit de nettoyer sa vitre et se tourne pour ramasser de l'eau et du produit, Ramzy jette de l'eau sale sur la vitre propre de son collègue. Éric ne se rend pas compte que c'est Ramzy qui salit sa vitre, l'obligeant à nettoyer encore et encore :

#dialogue[
  « Ramzy : Bah qu'est ce qu'il se passe ?

  Éric : non, mais par ce que là je viens de la nettoyer, et là elle est resale.

  Ramzy : bah faut nettoyer faut pas laisser sale »
]

Éric nettoie de nouveau et encore une fois Ramzy salit derrière lui. Éric
s'interroge donc sur ce qui est en train d'arriver. Comme pour mener
l’enquête, Éric plonge son doigt dans la saleté et la met à la bouche :

#dialogue[
  « Éric : C'est récent ! C'est très récent. Il y a quelqu'un qui salit ma vitre. » Puis Éric fait signe à Ramzy qu'il s'agit d'une personne cachée derrière lui et lui indique de ne pas faire de bruit, qu'il va essayer de l'attraper :

  « Éric (chuchotant): Shut ! Il est derrière toi. À trois. Un, deux, trois. »
]

La tentative est infructueuse puisqu'il n'y a en réalité personne et que c'est Ramzy qui a fait le coup depuis le début. Mais Éric est toujours crédule et ne se rend compte de rien :

#dialogue[

  « Éric : Rooh, et bah il est parti. Il a réussi. Il a entendu. Il t'a entendu. T'as parlé. Il a disparu par une trappe mystérieuse, ça c'est fort. C'est très très fort.

  Ramzy : C'est fort, mais c'est toi qui vois rien non plus. Attend deux secondes tu déconnes là. On est que deux sur cette nacelle . Je vais te le dire tous les soirs ça. »
]



Pour finir, Ramzy montre à Éric que c'était bel et bien lui qui salissait la
vitre, mais, Éric ne comprend pas et pense qu'il s'agit d'un plan de son
collègue pour attraper le mystérieux salisseur de vitre. C'est ici que se
termine la première séquence sans pour autant que leurs chamailleries sur la
nacelle ne prennent fin.


Dans cette première séquence, on va retrouver toutes les caractéristiques de ce qui fait le comique d'Éric et Ramzy sur scène. On a premièrement la question de l'équilibre au sein du duo qui ne cesse d’être mis en crise avant d’irrévocablement se rétablir. Si Ramzy s'accorde verbalement le statut de leader du groupe, il est perpétuellement remis en cause par Éric qui va soit consentir à cette supériorité factice, soit la contester en provoquant son partenaire. On assiste donc à la représentation de celui qui « décide » (Ramzy) et de celui qui est le « deuxième à décider » (Éric). Le tout s'articule dans une séquence sur une nacelle qui devient la scène d'un sketch mélangeant burlesque, jeu de mots, absurde, malaise et comique de répétition. Le spectateur est ici à même de retrouver les personnages d'Éric et Ramzy et cela d'une part à travers la dynamique de leur duo, mais plus certainement par le biais du rapport des personnages au monde de l'enfance. En effet, que ce soit sur la nacelle (qui donne lieu à leurs chamailleries, leurs jeux, leurs naïvetés et leurs accidents de langage) ou bien tout au long du film, les deux humoristes donnent à leurs personnages scéniques la possibilité d'évoluer dans un monde cette fois-ci hors de la scène. La séquence de la nacelle constitue l’incursion de leurs gags sur scène juste avant qu'ils ne rentrent dans
l'aventure cinématographique. Dès lors , puisque leurs personnages sont des enfants, ils vont transformer les différents événements auxquels ils sont confrontés en un lieu destiné aux jeux. La prise d’otage est traitée par ces derniers avec le même niveau de sérieux que leurs travaux de laveurs de vitres. Dans une des séquences finales (01:16:30) nos deux protagonistes se rendent sur le toit de la tour afin de « libérer » Marie-Joëlle de ses supposés ravisseurs avant qu'ils ne l'emportent avec eux à l'aide d'un hélicoptère . Une fois arrivés en haut de la tour, ils mettent au point un plan : détourner l'attention des deux pilotes de l’hélicoptère affin de les mettre hors d'état de nuire et de prendre leurs places dans le véhicule. Pour ce faire Éric propose de « les attirer dans un piège avec un billet de 500 francs [qu'ils vont] attacher à un fil invisible » avant de sortir un billet du même montant. Ce à quoi Ramzy répond :


#dialogue[
  « Ramzy (ironique) : Ho mon pauvre garçon. Comment tu me déçois. Tu
  crois des mecs qui font un braquage à 50 000 francs, 500 francs ça va les
  intéresser? »

  C'est alors qu'il prend le billet qu'Éric tient dans ses mains et avec un
  marqueur ajoute un « 1 » devant le nombre 500, avant de déclarer :
  « Ramzy : 1500 francs ! Voilà ! C’est pas des rigolos. »
]

Par la suite ils exécutent leurs plans. On voit donc au sol un billet accroché à un fil. L'un des deux pilotes est interloqué par des bruits de chat et de chien produits par les deux laveurs de vitres qui essayent de l'attirer dans leur piège. Le pilote s'approche sans faire attention au billet, mais plutôt parce qu'il voit Éric et Ramzy cacher de manière approximative. En s’avançant, il évite une première peau de banane disposée par le duo puis une seconde. Voyant que leur plan ne fonctionne pas, Ramzy passe derrière le pilote pour tenter de l’assommer. Mais en s’approchant, il glisse sur la première peau de banane pousse le pilote provoquant sa chute puis son évanouissement. Le second pilote interloqué s'approche à son tour, glisse sur la seconde peau de banane, tombe et s’évanouit. Éric et Ramzy sont donc libres de prendre leurs places aux commendes de l'appareil avant que les ravisseurs ne reviennent avec les otages et le butin.

On peut aisément dégager de cette séquence le caractère particulièrement enfantin qui a trait à nos deux protagonistes. Ces derniers se trouvent dans une situation que l'on pourrait qualifier de dangereuse, et leur réaction est a priori inadaptée. En effet, la solution qu'ils apportent témoigne à la fois de leur nativité (le billet de 1500 francs ) et d'un goût certain pour le rire et l'amusement (le coup de la peau de banane comme motif burlesque canonique). Néanmoins, malgré son caractère inadapté le plan fonctionne à merveille puisque nous sommes dans leur film et tout comme sur scène la réponse enfantine est la seule qui est légitime. Ainsi, les personnages ne se pliant pas au jeu sont condamnés à l'échec. Le premier pilote d’hélicoptère ne se penche pas pour ramasser le billet puisqu'il a vu Éric et Ramzy mal cachés. Par son refus de rentrer dans le jeu il est irrévocablement destiné a subir les conséquences de son comportement au premier degré et finit assommé. La Tour Montparnasse infernale propose une punition du monde des adultes qui ne consentirait pas à participer au monde des enfants. De même que le spectateur qui rechignerait à se laisser aller aux spécificités du comique absurde d'Éric et Ramzy, est laissé sur le pas de la porte et ne participe pas à la synergie du rire.

Dès lors, on peut se poser la question de l’identification du spectateur aux personnages. Celui-ci ne s’identifie pas aux protagonistes puisque leurs comportements sont bien trop naïfs, de même, les ravisseurs et les otages sont trop sérieux et au premier degré pour qu'on ne s'y attache. C'est ainsi que le spectateur va plutôt embrasser le point de vue de Marie- Joëlle. En effet, cette dernière pour arriver à ses fins va tenter de comprendre le mode de fonctionnement des deux laveurs de carreaux. Elle consent donc à jouer avec eux tout comme le spectateur consent à entrer dans le film pour pouvoir rire. Elle tient pour rôle celui de frontière entre le monde de l'enfance et celui de l'adulte. À la fois, prête à rire et à réfléchir. À titre d'exemple dans la dernière séquence, après avoir miraculeusement réussi à sortir de la tour suite au crash de l’hélicoptère piloté par nos protagonistes, nous la retrouvons en compagnie de ceux-ci et du butin, cavalant rue de Rennes pour échapper à la police. C'est alors que Marie- Joëlle excédée par la compagnie du duo s'empare du butin avant de leur dire qu'elle a mis des bombes dans leurs chaussures, et que s’ils se déplacent à moins de 30 kilomètres-heure, ils vont exploser. Pris de panique, et ne constatant pas qu'il s’agit d'un mensonge, ils se mettent à courir laissant Marie-Joëlle délivrée de leurs présences et désormais supposément riche. Puisqu'en effet elle se rend rapidement compte que les billets de 500 francs ont tous été manuellement transformés par Éric (se trouvant très astucieux) en billet de 1500 francs.

Dans cette séquence, Marie-Joëlle utilise de manière évidente les armes de nos deux laveurs de carreaux pour tourner la situation à son avantage. C'est ainsi qu'elle fait fi du bon sens, et se met à leur niveau en proposant tout simplement un jeu. À ce stade, elle apparaît premièrement comme victorieuse au sein du film, c'est elle qui a gagné la partie en somme. Mais c’était sans compter sur son comportement final, puisqu'en effet, dans un dernier geste elle prend un taxi pour l’aéroport afin de s'enfuir et adopte une posture au premier degré. Elle sort donc du jeu au bout d'une heure vingt-cinq alors que celui-ci dure une heure trente. On peut, ici voir La Tour Montparnasse infernale comme le terrain de jeu des deux humoristes. En son sein leurs personnages scéniques évoluent dans un espace régi selon leurs propres règles. Cet espace développé sur mesure pour leur personnage engendre deux choses. D'une part, l'adéquation entre le personnage scénique et l'univers cinématographique, et d'autre part l'exclusion irrévocable de toute entité ne se pliant pas aux règles de cet univers qu'il soit des personnages émanent de l'histoire ou tout simplement des spectateurs récalcitrants.


L'univers d'Éric et Ramzi dans ce premier film ne propose pas de compromis au spectateur, là où nous l'avons constaté chez Coluche, le personnage scénique a tendance à s’adoucir au cinéma. L'hypothèse est ici que le statut de « Bouffon » de Coluche le soumet à une pression davantage conséquente dans le contexte de production de films destinés à un large public. Si la scène est un espace qui accepte plus facilement la prise de risque entraînée par le développement d'un discours libre de la part de l'artiste, c'est parce que l’enjeu est moins important. Un spectacle d'humoriste va toucher un public restreint, qui fait le choix du déplacement, et qui est déjà d'une certaine manière acquis à la cause de l'artiste qu'il va voir. De plus, les productions de spectacles d'humoristes engrangent un risque financier bien inférieur à n'importe quelle production cinématographique. Ainsi, les producteurs sont davantage frileux à développer des films avec un discours engagé (et décide de le feutrer) là où sur scène la place du bouffon n'est pas menacée et bénéficie de la liberté d'expression. Parallèlement Éric et Ramzy, en tant que « clown » disposent d'une plus grande liberté au cinéma (au sein de production grand public) puisque leurs personnages scéniques rient sans remettre en cause l'ordre établi.

Par bien des aspects, La Tour Montparnasse infernale propose ce qu'on pourrait qualifier de cristallisation parfaite du personnage scénique. En effet, dans le film les personnages d'Éric et Ramzy sont d'une part pleinement transposés sans être adoucis ou modifiés, mais plus important, ce qui émane d'eux a un impact concret sur la forme filmique. Les personnages créent les règles qui vont régir le déroulé narratif comme nous l'avons vu ci-dessus, et leur jeu comique va venir imprégner l'esthétique de l’œuvre en proposant une mise en scène au service de leurs comiques. En effet, le film prend à bras le corps la question de la mise en scène et ne se contente pas comme ce fut le cas dans Les Mots d'Éric et Ramzy de faire un simple copié collé de la scène ne tenant pas compte des spécificités du médium cinématographique. Cette idée s'illustre notamment dans une séquence au sein du film qui notons le tout de même a été réalisé par Eric Judor. Dans celle-ci, Éric et Ramzy font exploser une bombe en appuyant malencontreusement sur le déclencheur. Ils sont projetés dans une pièce désormais carbonisée par l'incident. Interloqués par le bruit, les ravisseurs envoient l'un des leurs sur les lieux pour se débarrasser des laveurs de carreaux. Notre duo se cache et Ramzy fait signe à Éric d'attraper une barre en fer située à côté de lui afin qu'ils puissent se défendre. Mais rappelons-le, la pièce vient de subir l'explosion ce qui signifie que la barre en fer est brûlante. C'est ici que la mise en scène va appuyer le comique. À l'image, l'action est représentée grâce à un panoramique latéral. Ce dernier part du visage d'Éric puis panneaute vers le bas pour le montrer en train de saisir à main nue la barre encore brûlante. Au son, on entend simplement le bruit de la main crépiter sur le métal chaud comme un steak dans une poêle, mais aucun cri de douleur n'est perceptible. Puis, toujours dans le même plan, la caméra panneaute de nouveau, mais cette fois vers le haut en partant de la main, pour arriver à la tête d'Éric. C'est alors que le spectateur découvre le visage crispé du laveur de vitres ne laissant paraître aucun son et n'exprimant sa douleur que par la présence d'une larme unique coulant sur sa joue gauche. Dans cette séquence le comique se développe autour des réactions du personnages. Plutôt, que de proposer un gag plus classique en trois plans (plan sur le visage, plan sur la main , et de nouveau plan sur le visage crispé), la construction de celui-ci d'un seul tenant renforce la pertinence comique. Le temps utilisé dans le panoramique allonge l'attente du spectateur vis à vis de la résolution du gag. Le panoramique contrairement au montage cut permet à la mise en scène de développer un suspense au sein de la comédie. Le spectateur a le pressentiment que quelque chose (de drôle) va arriver mais ils ne sait pas quand, comment, ni pourquoi (ils va rire)#footnote[Dans dans des entretiens parus en 1966 François Truffaut interroge le réalisateur Alfred Hitchcock à propos de la notion de suspense et de surprise dans ses films. Le britannique développe alors sur l'importance de ces derniers pour provoquer la peur chez le spectateur. Nous pouvons ajouter à cela que ce qui est vrai pour le cinéma d’horreurs l'est également pour la comédie car tout deux travaillent sur l'implication émotionnelle du spectateur. Le rire tout comme la peur font appel aux mêmes mécanismes. Ainsi, la surprise et le suspense sont autant au cœur des mises en scène de comédies que de films d'horreurs.]. C'est ainsi que le gag à la fois burlesque et absurde (consistant à faire attraper une barre en fer brûlante par un personnage ne produisant aucun brut pour signifier ça douleur) est amplifié par un soutien total de la mise en scène.

Dans La Tour Montparnasse infernale, Eric et Ramzy on emporté avec eux tout ce qui appartenait à leur univers scénique que ce soit leur jeu leurs thématiques, ou les collaborateurs qui les accompagnent. Si ce premier long métrage « était une sorte de jet irréfléchi, ou tout se passait sur le plateau ; une sorte d'énergie, d'élan pur#footnote[Entretien avec d'Eric Judor dans :GANZO, Fernando, GOLDBERG, Jacky, MEVEL, Quentin, La Nouvelle comédie du cinéma français, Les nouvelles éditions JMP, Paris, 2017,p.51)] » il en est d'autant plus un lieu d’exploration du comique qui développe une cristallisation des personnages scéniques qui n'est pas conçue au détriment de la mise en scène. Le duo d’humoristes à su s’adapter à son médium dans un film qui n'est pas un simple star véhicule puisqu'il résulte de leur propre impulsion comique.


=== Le personnage scénique dans le blockbuster comique

Suite au succès et à l’expérience positive que fut le tournage de La Tour Montparnasse infernale Éric et Ramzy souhaitent renouveler l’expérience cinématographique et se lancent dans plusieurs projets qui seront finalement avortés. C'est le cas notamment d'un long métrage qu'ils devaient tourner pour Michèle Gondry, mais c'était sans compter sur le succès retentissant du réalisateur qui suite à son premier long métrage Human nature fut débusqué pour tourner en 2004 Eternale sunshine of the spotless minde, avec Jim Carrey et Kate Winslet. Gondry tout de même attaché à réaliser quelque chose avec le duo d'humoristes français, les fit venir aux États-Unis pour tourner un cours métrage aux cotés de Jim Carrey intitulé Pécan Pie. C'est également lui qui leur présentera Quentin Dupieux avec qui ils tourneront en 2007 Steak. Après leur escapade états-uniennes, le duo rentre en France et travaille sur un nouveau projet de long métrage cette fois-ci avec comme réalisateur Michel Hazanavicius (qui réalisera tout de même la mise en scène de leur second spectacle ErickéRamzy en 2005). Le film le pitche du film qui devait s’intituler Moyen Man à été dévoilé par Éric Judor dans le podcast le Floodcast :



« sur une planète où chaque année, il y a une grosse cérémonie pour distribuer à neuf héros des pouvoirs de super-héros. […] Ramzy est choisi, il est en toge, et une sorte de grand magicien balance un pouvoir à chacun. Et moi je suis dans le public, je suis un mec qui adorerait avoir un pouvoir. Je saute et je me mets devant Ramzy au moment où il reçoit le pouvoir, et on le reçoit à deux. Donc on est « moyens ». Pas nuls, mais moyens. Il y en a un des deux qui peut voler très haut mais à 30 km/h, un peu comme une guêpe, et un autre très vite mais à un mètre du sol. Donc on leur octroie d’abord une ville en Bretagne parce qu’on ne peut pas leur filer Paris, et au fur et à mesure, ils vont gravir les échelons pour atterrir à Paris puis aller à New York#footnote[Eric Judor dans un entretien avec Ménielle Adrien et Bernard Florent Le Floodcast : Boa Constructeur, le 11/12/2023, saison 9 épisode 12]. »

Le film ne vut malheureusement jamais le jour suite à un désengagement des producteurs, mais on peut déjà voir à travers son pitch l'ambition du projet. Moyen Man s’annonçait comme une comédie nécessitant des effets spéciaux et un grand nombre de décors s'accompagnant d'un postulat humoristique original parfaitement en adéquation avec le style du duo. Ici c'est sans doute la réticence des producteurs à miser sur un Michel Hazanavicius pas encore assez connu à l'époque (puisqu'il n’accédera à son premier succès commercial qu'en 2006 avec OSS 117 : Le Caire, nid d'espions).

Le projet de Moyen Man étant avorté, le duo se rabat sur une comédie d'espionnage réalisée par Gérard Pirès qui constituera leur second long métrage. C'est en 2004 que sort Double Zéro, un film à gros budget dont le tournage nécessite la construction de plusieurs décors situés dans des studios londoniens, ainsi que de nombreux déplacements entre la Riviera et le Venezuela. Le film est un remake du film de John Landis Drôles d'espions réalisés en 1985. Double Zero raconte l'histoire de Will (Ramzy) et Ben (Éric), deux civils engagés par la DGSE pour servir de couverture à deux vrais espions. L’objectif de la DGSE est de récupérer l'arme nucléaire qui leur a été dérobée par une taupe infiltrée au sein de leurs services. Will et Ben n'étant qu'une diversion dans cette mission vont néanmoins se prendre un peu trop au jeu et s’engageront avec maladresse dans la poursuite des ennemis d'état, moyennant un grand nombre de catastrophes. Le film propose finalement une mécanique similaire à ce que l'ont pouvait retrouver dans La Tour Montparnasse infernale. Deux individus incompétents se retrouvent plongés dans une situation qui les dépasse, mais ce sont paradoxalement leurs maladresses qui vont les conduire à sortir victorieux à l'issue de l'histoire. Dans Double Zéro on retrouve une version de leurs personnages scéniques. Ils sont toujours très enfantins, mais nettement moins stupides. Ils sont bien plus à même de comprendre les tenants et aboutissants des événements auxquels ils sont confrontés. On peut considérer que leurs personnages proposent un jeu hybride entre ce qu'ils étaitent sur scène (et donc dans leur premier film) et quelque chose d'autre à la fois plus mature, mais en même temps plus indéfini. Il n'y a pas dans ce film la radicalité qui permettrait une cristallisation parfaite du personnage scénique, mais paradoxalement les points de convergence avec leur passé scénique sont omniprésents, on ne peut donc pas considérer que ce film propose une décristallisation de leurs personnages. Ici, on se confronte aux mêmes problématiques que celles des comédies grand public de Coluche. La transposition du personnage scénique dans un schéma de production industrialisé et standardisé ne permettant ni la cristallisation ni la décristalisation du personnage scénique, on assiste à une adaptation à la fois inexacte et incertaine. Les personnages d'Eric et Ramzy s'en trouvent « feutrés » à l'instar de celui de Coluche et c'est leurs radicalité comique qui se trouve évincée. En effet, là où La Tour Montparnasse infernale possédait un budget de 9,5 millions d'euros pour Double Zéro on atteint 19,8 millions. Dans ces conditions la liberté créatrice et artisanale que le duo avait connue lors de leur premier tournage n'est plus du tout envisageable. La spontanéité et l'improvisation sur le plateau de tournage ne sont plus permises malgré l'importance de ces dernières dans le développement du comique d'Eric et Ramzy. L'humour absurde et décalé ne trouve pas sa place dans une production dont les enjeux financiers sont si conséquents.


La problématique sera la même dans leur film suivant, Les Dalton, réalisé par Philippe Haïm qui sortira également en 2004. Le film possède un budget conséquent de 24 millions d'euros et sera vécu par le duo comme une expérience douloureuse ne laissant pas de place à leurs voix comiques#footnote[Interview d'Eric Judor Pour Kombini « Maintenant Eric Judor peut le dire : Ramzy et lui ont détesté le tournage du film Les Dalton », 14/12/2023]. Le film est pourtant à priori entre les mains des deux humoristes puisque la rédaction du scénario leur est confiée (avec pour co-auteur Michel Hazanavicius ). Ils sont également coproducteurs comme ce fut le cas pour leurs deux film précédents. Mais voilà, au moment de passer du scénario à la mise en scène beaucoup de changement sont effectués et la rigidité imposée par cette super production ne laisse là encore pas de place à la souplesse. Eric Judor, en témoigne dans une interview pour SoFilm en 2013 :


"Quand on a filé le scénario à Philippe Haïm, on lui a dit: 'On veut un western crade, un western réaliste, il faut que les mecs existent en vrai. Quand t’arrives le premier jour sur le plateau et que tout est bariolé avec des couleurs fluos, tu comprends que c'est niqué. Ton scénario est violé.#footnote[Bonnefoy, Nawal, « Eric et Ramzy au cinéma : un duo infernal pour le meilleur et le pire », bfmtv.com, 10/02/2016]"


Cette discorde concernant les intentions de scénario sont tangibles au sein du produit final. On a un film avec une ligne directrice très familiale (couleurs pétantes, traitement de l'image comme une bande dessinée, manichéisme des personnages) avec en son sein Éric et Ramzy qui proposent un jeu comique plus nuancé. C'est comme si leur duo cherchait à échapper à leurs personnages scéniques en étant irrévocablement rattrapé par la forme du film. Alors même que Les Dalton représentaient à l'étape du scénario la possibilité d’échapper à la scène, ce fut le lieu d'une réaffirmation de l'idée que l'on se fait d'eux. Le film est ainsi « un agencement privilégié du cinéma » dans ce qu'il a de plus poussé. Il récupère des motifs canoniques émanant de la persona d'Éric et Ramzy et les vide de leur encrage pour en livrer une version superficielle calibrée pour s'adresser au grand public. Les Dalton marquera une rupture dans la carrière du duo puisque leur film suivant qui sortira 3 ans plus tard leur permettra justement d'accéder à cette décristallisation de leurs personnages scéniques, le tout dans le film de Quentin Dupieux, Steak.



= Échapper à la scène ? L'épurement de la figure de l'humoriste au cinéma

== De Coluche à Michel Colucci pour un effet Tchao Pantin

=== La stratégie du contre-emploi

« Coluche du rire au larme ou la façon de passer du registre comique à celui du tragédien. C'est la performance réalisée par Coluche dans son dernier film qui sort mercredi et qui s’intitule Tchao pantin. Un Coluche remarquable et surtout un Coluche émouvant comme on ne le connaissait pas. […] c'est le nouveau Coluche qui fait pleurer au lieu de rire dans Tchao pantin#footnote[Reportage issu du journal de 20h, diffusé sur Antenne 2 le 18/12/1983]. » C'est avec ces mots qu'est annoncée aux téléspectateurs français la sortie de Tchao Pantin le mercredi 21 décembre 1983. On constate que dès la campagne promotionnelle toutes les clés de lecture sont données. Le spectateur va pouvoir se déplacer dans les salles pour voir Coluche comme il ne l'a jamais vu, pour assister à son contre-emploi au cinéma. Mais dans ce contexte qu'est-ce qui fait de Tchao Pantin un film si bouleversant et inattendu dans la carrière de Coluche et plus important qu'advient-il du personnage scénique de l'humoriste dans ce film. 56 Reportage issu du journal de 20h, diffusé sur Antenne 2 le 18/12/1983 personnage scénique de Coluche va lui permettre d'entreprendre un premier pas vers le contre-emploi que sera Tchao Pantin.

La date de sortie du film était initialement prévue pour janvier, mais après le premier jour de tournage, Berri très enthousiaste vis-à-vis de la performance sur le plateau de l'humoriste, décida d’avancer la sortie à décembre afin que le film puisse candidater aux césars de 1984. Tchao Pantin remporta dans la foulée 5 Césars, dont celui du meilleur acteur pour Coluche.

« Le producteur et réalisateur du film fait ce pari en raison du rôle à contre- emploi tenu par l’humoriste Coluche, anticipant un effet de surprise autour du clown devenu triste#footnote[GAERTNER, Julien, « Tchao Pantin, Hommes & migrations » dans Revue française de référence sur les dynamiques migratoires, n°1313, 01/01/2016, consulté le 16 mars 2020. URL : http://journals.openedition.org/hommesmigrations/, p.83] ». Plus que le contre-emploi en lui même, c'est la stratégie promotionnelle déployée autour de celui-ci qui va assurer le succès du film. En effet, le spectateur n’aura de cesse d’être bombardé dès décembre de reportages télévisuels faisant écho du coup de maître du réalisateur assurant la transformation du clown le plus célèbre de France en un acteur de tragédie. Plus directement, la bande annonce de Tchao Pantin annonce aux spectateur toute la mesure de son ambition dans une voix-off accompagnant quelque images du film :

#dialogue[
  « Poursuivant la tradition des grands acteurs comiques français, après
  Raimu, Fernandel et Bourvil, le nouveau visage de Coluche : paumé, tendre,
  violent#footnote[Extrait de la voix-off présente dans la bande annonce de Tchao Pantin à sa sortie en 1983.].»
]

La ligne directrice est claire, elle invite le spectateur et toute la profession à venir assister au tour de force que serait la performance de Coluche dans le film. L'humoriste y entreprenant le passage sous-entendu impossible du comique au tragique, l'inscrivant ainsi dans la lignée « des grands acteurs comiques français ». Tout dans cette voix-off sous-tend le caractère immanquable de Tchoa Pantin puisque le film propose un bouleversement de ce qui était jusqu'ici établi. Celui qui nous faisait rigoler se serait élevé au rang du cinéma « sérieux ». La campagne promotionnelle se construit donc autour de la persona de l'humoriste en promettant tout l'inverse de celle-ci. On peut paradoxalement relever que si cette bande-annonce n'a de cesse de développer sur la performance de Coluche, elle ne dévoile finalement pas grand-chose sur le contenu du film. Finalement quand il est sujet de Tchao Pantin on ne parle pas du film, on parle de Coluche. C'est ce qui est décrit par le chercheur Julien Gaertner dans son article « Tchao Pantin, Hommes & migrations » où il traite du caractère raciste de l’œuvre de Claude Berri :

#dialogue[
  « Tchao Pantin bénéficie de l’aura médiatique de Coluche, qui en assure la
  promotion quelques jours avant sa sortie du 21 décembre 1983. Sur le petit
  écran et dans les journaux, il n’est question que du fameux « rôle à contre
  emploi » dans lequel il estime être à son aise. L’entretien avec la journaliste
  spécialiste du cinéma d’Antenne 2, France Roche#footnote[Interviewe par France Roche à la sortie du film sur antenne 2 au journal de 20h du 18/12/1983], ne déroge pas à la règle.
  Il y est uniquement question du « clown devenu triste », jamais du scénario
  du film ni de son possible contenu politique. Ce qui fait l’actualité, c’est en
  effet la performance d’acteur du comique préféré des Français, et non ce
  qu’il interprète.#footnote[GAERTNER, Julien, « Tchao Pantin, Hommes & migrations » dans Revue française de référence sur les dynamiques migratoires, n°1313, 01/01/2016, consulté le 16 mars 2020. URL : http://journals.openedition.org/hommesmigrations/, p.83] »
]

Finalement, le propos du film importera peu puisque malgré l’absence de détail sur le scénario dans la bande-annonce, 3,8 millions de spectateurs se rendront dans les salles pour assister au contre-emploi de Coluche. La stratégie promotionnelle du producteur Claude Berri assure à la fois un beau succès commercial et une reconnaissance de la part de l'institution à Tchao Pantin. Dès lors, le lendemain de la cérémonie des césars de 1984 quand le journaliste d'Antenne 2 annonce aux téléspectateurs français la victoire de Coluche, il confirme l'efficacité de cette stratégie du producteur et réalisateur :

#dialogue[
  « Meilleur acteur, une surprise Coluche pour son rôle dans Tchao pantin. Dans ce film Coluche avait abandonné son style habituel d'amuseur , de comique pour endosser la personnalité émouvante d'un petit pompiste minable.#footnote[Journal midi 2 sur Antenne 2 le 02/03/1984] »
]

A l'inverse de ce que nous dit le journaliste il n'y a finalement aucune surprise dans la victoire de l'humoriste, cette dernière est plus le résultat du calcul du producteur que de la prestation de l'acteur.


=== Tchao Coluche

Nous l'avons vu, Tchao Pantin est recouvert à sa sortie d'un succès public et médiatique indéniable. Le film de Berri restera par la suite tellement imprégné dans l'imaginaire collectif du spectateur français que son titre deviendra une expression populaire utilisée pour designer le passage d'un acteur du registre comique au registre tragique : « faire son Tchao Pantin ». Dès lors, on peut se demander en quoi consiste concrètement le fait de faire son Tchao Pantin. Qu'est-ce qui dans ce film va bouleverser le personnage scénique de Coluche ? Tout cela, nous allons essayer de l'analyser en commençant par le scénario même de Tchao Pantin. Le film raconte l'histoire de Lambert (Coluche), un pompiste ancien flic, alcoolique et dépressif qui travaille dans une station-service des quartiers nord de Paris. Un soir il fait la rencontre de Yousseff Bensoussan (Richard Anconina) un jeune dealer à la dérive avec qui il se lie d'amitié. La situation se dégrade lorsque Bensoussan égare sa marchandise, il tente alors d'aller se réfugier dans la station-service de Lambert, mais est rattrapé par ces patrons qui le tuent. Lambert assiste à la scène impuissant et décide de se venger. Pour ce faire, il contacte Lola (Agnès Soral) une punk d'une vingtaine d'années que fréquentait depuis peu Bensoussan. Ensemble ils vont retrouver la trace des assassins du jeune dealer. Lambert, par soif de vengeance se chargera de les éliminer un par un faisant fi de l'institution policière. Cette vendetta le rattrapera puisqu'il finira par tomber criblé de balles sous les yeux encore une fois impuissants de Lola.

On note tout d’abord qu'il se dégage du sujet du film une noirceur indéniable aux antipodes du registre de prédilection de Coluche. Tchao Pantin se positionne comme un drame dans le prolongement du polar à la française ou adaptation du film noir américain. Les personnages y sont des marginaux peuplant un Paris des bas-fonds, délaissés par les politiques publiques et où les institutions complices laissent régner avec plus ou moins de complaisance la loi de la rue. Le film de Berri nous plonge dans un univers totalement nihiliste où le seul espoir qui nous est donné par la mise en scène intervient dans une justice que l'on ferait par soi même. Mais celle- ci s'en retrouve avortée quand son « social justice warrior » en la personne de Coluche, ici défendant non pas la veuve et l'orphelin, mais le dealer et la punk, décède faisant au passage de lui un martyr, donc un acteur de tragédie. La tonalité du film très éloignée de la comédie d'humoriste qu'incarne Coluche prend comme postulat d'aller jusqu'à être une anti-comédie se construisant autour de la persona de son acteur principal. La rupture y est alors a priori plus franche et au passage plus césarisable. S'ajoute à la tonalité générale du film son esthétique. La couleur à l’inverse de ce qui se fait en comédie est extrêmement terne à l’exception de notes de bleu et de rouge incarnant à la fois l'obscurité de la nuit le sang qui ne cesse de couler. L'humidité et le désordre son omniprésents et les personnages sont condamnés à s'y perdre ne laissant là encore place à aucune forme d’espoir.


#figure(
  caption: [
    Youssef au début du film à l'arrivé dans la station service
  ],
  image("youssef_station_service.png"),
)

#figure(
  caption: [Lambert quelque minutes avant d'aller assassiner l'un des meurtriers de Yousseff],
  image("lambert_meurtrier_lambert.png"),
)

L'écart avec la filmographie de l'humoriste dans Tchao pantin se fait aussi par la place du personnage qu'il incarne. Celui-ci, s'illustre par ça solitude là où dans les films précédants l'idée d’être entouré par une bande ou une famille est omniprésente (et cela qu'il s’agisse des petits voyous d'Inspecteur la bavure, des circassiens de L'Aile ou la cuisse ou bien des élèves dans Le Maître d'école). Être entouré dans les comédies de Coluche c'est une manière de soutenir l’impulsion humoristique. On peut rigoler dans les situations de danger, car en fin de compte tout va bien. Le malheur qui nous touche est vecteur de rire, car ceux qui nous entourent, nous aiment et nous accompagneront malgré tout. Ainsi, lorsque dans Inspecteur la bavure Michel Clément (Coluche) se retrouve accusé à tort de complicité d'enlèvement laissant place à des gags burlesques capitalisant sur le motif des violences policières, le film ne tombe jamais dans le registre tragique en s’attardant sur la gravité des événements. Ici, ce qui donne l'autorisation au spectateur de rire c'est le caractère inconséquent des événements dramatiques. Michel Clément est certes placé en garde à vue, mais finit par s'échapper et retourner la situation à son avantage notamment grâce au soutient de sa mère et de ses amis ( amis qui au passage auront attesté du comique de la situation et ne manquerons pas de rire de Michel, validant au passage le rire du spectateur).


Afin d'expliciter d'avantage notre propos, prenons l'exemple d'une personne descendant un escalier. Trois cas de figue s'offrent à nous dans cette situation à. Dans le premier cas une personne descend un escalier et rien de particulier ne se passe. Si un spectateur est confronté à cette situation dans un film il ne ressentira aucune émotion particulière. Dans le second cas cette fois-ci, disons que la personne descend l'escalier, tombe et se retrouve à terre blessée. Ici, le spectateur est supposé ressentir de l’empathie avec le sujet et l'accompagner émotionnellement dans ce qui s'apparente à un malheur. Enfin, dans notre dernier cas de figure admettons que la personne descend l'escalier, tombe, puis se relève comme si de rien n'était. Dans cette situation à l'inverse, le spectateur va être amené à rire. Le rire ici n'est pas provoqué par la chute comme nous l'avons vu dans le second cas, mais plutôt par l’absence de conséquence liée à cette dernière. Ainsi ce qui fait la première différence entre Tchao Pantin et les comédies de Coluche, c'est que jusqu’ici les personnages qu'il incarnait ne subissaient en aucun cas les conséquences de leurs malheurs. Ici non seulement Lambert va subir les conséquences, mais il n'est pas accompagné d'une bande pouvant le soutenir, c'est sa solitude qui le tuera. Lambert est comme un personnage qui descend l'escalier tombe et ne se relève jamais.


Ce rôle à contre-emploi qu'incarne Coluche permet l'écart avec le personnage scénique de l'humoriste à travers non seulement sa nature comme nous l'avons vu mais aussi la manière dont il est interprété. Coluche pour ce film va gommer tout une partie de ce qui faisait jusqu'ici son jeu d'acteur sur scène et au cinéma. Dans Tchao Pantin, ce dernier va considérablement réduire ces mimiques. Son visage dans le film est ainsi extrêmement peu expressif. Le personnage s'illustre par sa posture avachie et son regard vide. Sa présence dans l'espace est emprunt d'une lourdeur pesante aux antipodes de la légèreté qu’incarnait jusqu'ici sa rondeur dans sont costume de comique. Enfin, toujours dans l'objectif d’amoindrir la présence de l'humoriste dans le film, au profit de la présence de l'acteur, le ton qu’emprunte Coluche s’avère extrêmement monotone, en opposition consciente avec les variations sinusoïdales de sa voix faisant, la part belle au cris suraiguës signature et autres raclements de gorge intempestifs, le tout comme une marque de fabrique sonore de sa partition humoristique. Cette tentative d'effacement de la persona comique de Coluche (tout en la convoquant paradoxalement) se matérialise dès la première séquence. Cette dernière s'ouvre sur le gros plan d'un feu rouge, à l'arrière plan on voit une rue de paris plongée dans la nuit sur laquelle s'abat une pluie torrentielle. Une musique dramatique et les sons de la rue accompagnent les images. Un générique en sur impression dans des lettres rouges rappelant la couleur du feu de signalisation inscrit sur l'écran « Coluche » puis s’efface pour laisser place à un second sur lequel on peut lire « dans Tchao Pantin ».

#figure(
  image("generique_coluche.png"),
)


La suite du générique d’ouverture apparaît puis le feu passe au vert laissant par là même découvrir à l'arrière plan un jeune homme sur une mobylette cassée. Pour accompagner le mouvement du jeune homme la caméra pannote et nous laisse découvrir les néons d'une station service. C'est à ce moment qu'une voiture de police s'approche du jeune homme. Ce dernier pour éviter d'avoir des ennuis se dirige vers la station service.

#figure(
  image("youssef_station_service.png"),
)


À l’intérieur de celle-ci un pompiste de dos observe par la vitrine la scène avant de se diriger vers la porte pour accueillir le jeune homme à la mobylette qui vient d'entrer et lui dit :

#dialogue[
  « Pompiste : Salut.

  Jeune homme : Bonjour monsieur.

  Pompiste : En panne ?

  Jeune homme : (hoche la tête)

  Pompiste : il t'en faut combien ?

  Jeune homme : De quoi monsieur ?

  Pompiste : De l’essence.

  Jeune homme : Heu c'est pas l'essence, c'est la bougie, je crois.

  Pompiste : Quel genre de bougie ?

  Jeune homme :C'est une bougie pour les mobs. »
]


C'est à ce moment-là que le pompiste se retourne laissant pour la première fois apparaître son visage au bout de 2 minutes 33 secondes et dans le sixième plan du film.

#figure(
  image("plan_coluche_film.png"),
)


Le spectateur découvre alors le visage de l'humoriste volontairement transformé, c'est d’ailleurs la promesse qui nous est faite dans le générique d'ouverture, de voir « Coluche » certes, mais « dans Tchao Pantin ». Ce nouveau jeu d'acteur que déploie l'humoriste est amplement encouragé par la situation personnelle de ce dernier au moment du tournage :

#dialogue[
  « Il traverse alors une sévère dépression à la suite du suicide de son ami Patrick Dewaere avec la carabine qu’il lui a lui-même offerte. Mais Michel Colucci est aussi, à ce moment de sa carrière, un adepte des drogues dures, addiction qui marque ses traits et rendent nécessaires les nombreux plans du dos voûté de son personnage, masquant ainsi son visage. Le rôle de l’ombrageux et alcoolique pompiste Lambert, lui, est tristement taillé sur mesure#footnote[GAERTNER, Julien, « Tchao Pantin, Hommes & migrations » dans Revue française de référence sur les dynamiques migratoires, n°1313, 01/01/2016, consulté le 16 mars 2020. URL : http://journals.openedition.org/hommesmigrations/, p.83]. »
]

Le jeu d'acteur de Coluche dans Tchao Pantin va alors par bien des aspects se distinguer pleinement de son personnage scénique, mais là où l'écart est finalement le plus important c'est sans doute en lien avec le propos même du film. En effet, comme le souligne Julien Gaertner dans son article le film de Claude Berri soutien un discours extrêmement problématique et xénophobe. Dans celui-ci tous les personnages arabes sont profondément négatifs, ils sont dealers, proxénètes, assassins et font régner la terreur dans les quartiers nord de Paris où même la police ne peut plus intervenir et préfère s'en remettre à un Lambert assoiffé de vengeance. Dans Tchao Pantin on note d'une part qu'aucun personnage arabe n'est présenté positivement et également que la vendetta particulièrement sanglante de Lambert n'est jamais remise en cause. Le paradoxe est donc le suivant :


#dialogue[
  « Tchao Pantin est incarné par un humoriste ayant toujours défendu des idées de gauche, voire soutenu le Parti socialiste et son candidat à l’élection présidentielle. Fondateur de l’association Restos du cœur, partisan des causes humanistes et très engagé dans la fondation de SOS Racisme, Coluche joue ici le justicier tueur d’« Arabes » sans que cela semble émouvoir journalistes, critiques et observateurs, qui ne relèveront pas cet apparent paradoxe entre engagement politique et rôle tenu à l’écran#footnote[Ibid, p.87]. »
]


En incarnant le rôle de Lambert dans Tchao pantin, Coluche réalise un contre-emploi total, allant jusqu'à trahir ces propres convictions politiques. Nous l'avons constaté dans notre seconde partie sur l'étude des comédies de l'humoriste, ce que le cinéma n'adapte pas du personnage scénique de Coluche c'est précisément sa dimension politique. Dès lors au moment du changement de registre qu'est Tchao pantin il n'y a pas de revalorisation de cette dernière. La capitalisation, notamment promotionnelle qui est faite autour de la persona de l'humoriste, participe dans un film qui paradoxalement déploie une rhétorique xénophobe, à entretenir l'idée d'un objet filmique qui tomberait dans l'artificialité par opposition aux « opérations artistiques de la modernité#footnote[BADIOU, Alain, Cinéma « considérations sur l'état actuelle du cinéma », Paris, Novas, 2010, p.223] ». Le film de Claud Berri est à priori un exemple parfait de ce que pourrait être « l'épuration d'un agencement privilégié » du cinéma dans ce qu'il propose le bouleversement d'un régime d'images préférentielles attenantes à la présence d'humoristes au cinéma. Mais là où cette « épuration » n'as pas lieu en ce qui concerne le film de Berri c'est qu'en évinçant un agencement privilégé en passant du drame à la comédie, le réalisateur en reproduit d'autres que sont « le mélodrame social#footnote[Ibid, p.223] » et « la cruauté pathologique#footnote[Ibid, p.223] ». Plus encore, on peut même avancer que le film va jusqu'à en créer de nouveaux qui seraient la xénophobie banalisée et le contre-emploi artificiel.


=== Réminiscence de la scène

Nous l'avons observé dans la partie précédente, Tchao Pantin constitue pour Coluche une manière d’échapper à son personnage scénique par bien des aspects. En effet, l'humoriste dans ce film change de registre et modifie par la même occasion sa manière de jouer. Michel Collucci incarne ici, selon ses propres mots un personnage différent de celui de « Coluche » :

#dialogue[
  « Un acteur peut jouer n'importe quel rôle. Coluche c'est pas moi non plus,
  je l'ai joué longtemps et personne s'en est aperçu. Alors maintenant que je
  joue autre chose on se dit finalement Coluche c'était un personnage et puis
  Lambert dans Tchao pantin c'en est un autre et puis maintenant je fais le roi
  Dagobert, s'en est encore un autre. C'est pas moi non plus le roi Dagobert.
  [...] Quand les films sont bons ils peuvent être dramatiques ou comiques il
  s'agit de la même chose. Il s'agit de faire du spectacle et de distraire et le
  comique et le dramatique c'est la même chose à faire. Il s'agit de faire
  semblant de faire quelque chose#footnote[Coluche dans une interview par Franche Roche pour le journal de 20h du 18/21/1983 sur Antenne 2]. »
]

Dans cette déclaration Coluche réaffirme son identité en se dissociant de ses rôles et personnages. Il va même plus loin en nommant le caractère artificiel de sa persona. Coluche s’efface donc pour laisser place à Michel Colucci. Si cet effacement est tout à fait concevable dans le contexte d'une interview, en ce qui concerne le film de Claude Berri la situation est plus trouble. En effet, bien que Tchao Pantin ambitionne de gommer les traits de l'humoriste, on assiste dans ce film à une résurgence incontrôlable du personnage scénique de Coluche.

Le premier lien que l'on peut faire entre le personnage de Lambert et le personnage scénique de Coluche c'est leur langage. Lambert s’il n’arbore pas les modulations vocales typiques de Coluche conserve tout de même sa verve. À titre d'exemple, prenons une séquence dans laquelle Lambert et Yousseff débriefent dans la station-service de la rencontre de Yousseff avec Lola :

#dialogue[
  « Lambert : C'est toutes des putes.

  Yousseff : Non c'est des femmes comme les autres.

  Lambert : Bah c'est des femmes c'est des putes ouhé. L’avantage avec les
  putes c'est que tu sais à quoi t'en tenir.

  Yousseff : Mais ma mère c'était pas une pute.

  Lambert: Bah qu'est ce que t'en sais.

  Yousseff : Ho mais arrête je le sais.

  Lambert : Remarque je dis ça j'ai rien contre les putes.

  Yousseff : Bah alors qu'est ce que t'as contre les femmes ? Tu vois moi des
  fois je monte avec une pute et je me dis pourquoi j'en tomberais pas
  amoureux ?

  Lambert : Tu veux être macro ?

  Yousseff : Bah non c'est pas se que je veux dire, mais on sait jamais
  pourquoi elles en sont arrivées là ces filles-là. Et bien pourquoi je tomberais
  pas sur une fille qu'aurait envie que je la sorte de là ?

  Lambert : Et pourquoi tu rencontrerais pas directement une fille qui est pas pute ? T'as pas baisé qu'avec des putes dans ta vie ?

  Yousseff : Non non, mais souvent. Et toi, avec qui tu baises ?

  Lambert : Tout seul. »
]


À la lecture des dialogues de la séquence, on ne dispose ici que de la retranscription. Nous sommes donc privés du contexte dans lequel les mots sont prononcés. En effet, ces derniers sont traités dans le film sur le ton du drame. On observe de longues pauses entre chaque phrase, les voix des acteurs sont monotones et tout dans leurs jeux inspire la mélancolie. Dès lors, privés de ce contexte et en sachant que la moitié de ce qui est prononcé émane de Coluche, nous sommes en connaissance de cause (puisque nous l’avons observé dans l’étude de ses sketches), marqués par la proximité entre les dialogues sur scène de l'humoriste et ceux de l'acteur dans le film. Que ce soit à travers l'utilisation d'un niveau de langue familier, la récurrence de terme péjoratif, mais surtout un rythme propre à sa verve comique. Ainsi, lorsque celui-ci dit à Yousseff « Et pourquoi tu rencontrais pas une fille qui est pas pute ? » , lorsqu'il évoque l'idée de sortir avec une prostituée dans le but de la faire sortir de la prostitution, c'est une manière de lui indiquer avec humour l'absurdité de son raisonnement. De même, quand Yousseff parle du fait de tomber amoureux d'une prostituée et que Lambert lui répond « Tu veux être macro ? » , il ne lui pose pas réellement la question. Il se moque de lui et formule une blague dans laquelle l’effet d’incongruité s’opère par la confrontation entre les aspirations romantiques empreintes d’innocence de Yousseff et l'imaginaire collectif reprenant le motif du proxénète et de sa prostituée. On peut ajouter d'autre part que la récurrence du mot « pute » n'est pas sans rappeler l'un des sketches sobrement intitulé « la pute » dans lequel l'humoriste incarne sur scène une prostituée que l'on pourra notamment entendre dire : « Une fois j'ai rencontrer un mec formidable avec qui je suis restée longtemps. Il m'avait fait faire tilt. D’ailleurs il a eu le droit à plusieurs parties gratuites. Lui il m'avait touchée au cœur, les autres avaient pas visé si haut. » Le personnage sur scène décrit exactement ce que Yousseff envisage dans la séquence. Pour insister davantage sur le rapprochement entre les dialogues de Lambert et les textes scéniques de Coluche on peut noter la proximité de cette conversation avec le motif de la brève de comptoir. Motif omniprésent dans le travail de l'humoriste qui n’hésite pas comme nous l'avons vu à se rendre dans des « bistrot » pour y écouter les gens parler et ainsi composer ses textes avec le plus de justesse.


Le langage mis à part, le rapprochement entre Lambert et Coluche est également visuel. L'humoriste a bel et bien quitté sa salopette à rayures, mais il a troqué celle-ci contre une combinaison bleue de pompiste. Son nouveau costume s'inscrit dans la continuité d'un vêtement fait d'une pièce, symbole de la classe ouvrière. La similitude vient également de mimiques qui resurgissent dans certaines séquences. À titre d'exemple, lorsque Coluche tire des coups de feu dans Tchao Pantin, ce n'est pas la première fois qu'il utilise une arme dans un film. Paradoxalement, la posture qu'il prend reste la même que ce soit chez Berri ou chez Zidi dans Inspecteur la bavure. Il plie les genoux, plisse les yeux l'air concentré, pointe son arme de la main gauche et ne semble savoir que faire de sa main droite. Dès lors, sa posture tire plus vers le burlesque qu'à l'inverse et ne s’intègre en aucun cas dans les canons de représentation du film policier ou film noir. À travers le mouvement de son corps et le langage déployé son personnage dans le film change de registre et c'est la comédie qui resurgit au dépend du drame.

#figure(
  grid(
    columns: 2,
    image("affiche_la_bavure.png", height: 200pt),
    image("coluche_la_bavure_plan_pistolet.png", height: 200pt),
  ),
)


Enfin, le personnage de Lambert est thématiquement proche de ce qu'incarne Coluche sur scène. En effet, nous l'avons vu, l'humoriste dans ses sketches donne une voix aux marginaux. Lambert lui est marginalisé socialement par son alcoolisme. Il vit la nuit, et personne ne fait attention à lui ou à ce qu'il a à dire. Cela ne veut pas dire que ce qu'il a à dire est intéressant, mais en l'incarnant, Coluche lui donne une voix et la possibilité de s'exprimer comme il l'a fait jusqu'ici avec « la prostituée », « le blouson noir », « l'étudiant » ou « papy Mougeot ». Ainsi, dans la réalité qu’incarnerait Tchao Pantin , l’alcoolique du sketch de Coluche « Le CRS arabe », n'est plus qu'un personnage grossier, laissé pour compte, ne pouvant s'intégrer à la société et avec qui on ne peut pas rire. Les blagues disséminées dans les dialogues de Tchao pantin ne peuvent pas fonctionner alors qu'elles utilisent les mêmes ressorts comiques que ceux de l'humoriste sur scène, dans la mesure où la mise en scène coupe court aux élans de l'acteur. Le film nous criait ce n'est pas Coluche, mais finalement c'est résolument lui. La seule chose qui a changé c'est le décor.



La carrière scénique et cinématographique de Coluche pose ici la question de ce qui constitue l'essence du travail de l'acteur. Nous avons vu que chez l'humoriste la résurgence du personnage scénique au cinéma se fait indépendamment du registre. Si la cristallisation de ce dernier n'est pas totale, la scène ressort dans un jeu ambigu de référence, d’association et d'inconscience. La cristallisation du personnage scénique au cinéma n'est pas seulement le fait de biais économiques, elle émane aussi du rôle de l'acteur tirant de son jeu sur scène sa partition la plus aisée et la plus fiable. Rétrospectivement l'unique rôle de Coluche n’étant pas emprunt de son personnage scénique c'est celui du soldat Marquand dans Le Pistonné de Claude Berri en 1970, puisque à cette époque il n'est qu'à ses débuts sur scène et Michel Collucci n'est pas encore Coluche.

Pour finir, nous pouvons citer les mots de Coluche à l'occasion de son discours de remerciement pour le césar du meilleur acteur en 1984 :

#dialogue[
  « Je me croyais franchement à l’abri vu que je faisais du cinéma qu'on ne récompense pas et qui fait des entrées quand même. Parce que nous on à une profession particulière. Le cinéma français vit surtout avec les succès populaires que font les gens dans le genre Belmondo et récompensent surtout ceux qui font pleurer dans le genre que je ne nommerais pas pour n'oublier personnes, parce que quand même yen à un paquet. On m'avait dit pour être comédien ou comédienne c'est pas dur ya qu'a coucher avec le metteur en scène et bien franchement j'ai tout essayé yen à quand même qui veulent, mais c'est pas les meilleurs […] bon et bien c'est très beau, je vais pas vous dire que je ferai mieux la prochaine fois parce que j'ai pas fait exprès, mais j’essayera#footnote[Discours de remerciement prononcé par Coluche lors de la cérémonie des césar de 1984]. »
]

Dans se discours Coluche réaffirme son statut d'humoriste, d'une part en provoquant l'hilarité de la salle, mais surtout en se désignant comme celui qui n'a pas sa place dans cette cérémonie qui paradoxalement ne récompense pas le rire. Ici, Coluche réaffirme son allégeance à la comédie. Deux années plus tard, l'humoriste évoque dans une interview avec Collette Godard son aspiration à voir produit en France « un film entièrement burlesques#footnote[Interview de Coluche par Colette GODARD, « La réussite, l'argent, le talent, le rire... Coluche fait ses comptes », Le Monde, 24/08/1984 « En France personne n'est prêt à admettre le principe d'un film entièrement burlesque. Il n'y aurait personne pour le tourner. Tout le langage est à réviser »] ». Dix-sept ans plus tard sortira sur les écrans français La Tour Montparnasse infernale.

== Le parti d'en rire
=== « La nouvelle comédie d'Éric et Ramzy »

Suite aux tournages consécutifs de Double Zéro puis des Dalton sortis tous les deux en 2004, Éric et Ramzy prennent du recul avec le cinéma ( excepté une brève apparition dans le film de Djamel Bensalah, Il était une fois dans l'Oued ) avent d'y retourner deux ans plus tard dans une proposition sortant de leur zone de confort. C'est en 2007 que sort Steak, réalisé par Quentin Dupieux. Pendant ces deux années loin du grand écran le duo remonte sur scène pour leur spectacle ÉrickéRamzy , l'occasion pour les humoristes d'un retour aux sources et à l'essence de leurs personnages scéniques. Revenir à la scène c'est aussi une manière de préparer le rôle qui les attends dans ce qui sera vendu aux spectateurs comme « la nouvelle comédie d'Éric et Ramzy ». Steak, sans changer de registre puisqu'il s'agit d'une comédie, n’appartient pas aux mêmes types de productions que celle des précédents films du duo. Avec un budget de 5,5 millions d'euros, cette coproduction franco-canadienne est bien loin des 26 millions alloués à la réalisation des Dalton. On peut aussi signifier que c'est le 1er film du duo bénéficiant d'un financement du CNC avec une « aide à la coproduction franco-canadienne » de 80000 euros en 2006. Concernant les sociétés de production en elles mêmes on retrouve coté français, à la fois La Petite Reine, Studio Canal, 4 mecs en basket et 4 mecs à lunettes et du côté canadien RemStar. On constate donc que malgré la nature différente du type de production que représente Steak, les acteurs français engagés dans le développement du film sont sensiblement similaires à ceux impliqués dans les précédents films mettant en scène le duo. Néanmoins, la réception publique du film ne sera cette fois-ci pas aux rendez-vous le film est un échec commercial. À sa sortie, il ne réunira que 290 674 spectateurs pour une recette de 2,2 millions d'euros. Cet échec commercial le film le doit certainement à une contradiction entre la stratégie promotionnelle développée à sa sortie et le contenu même de l’œuvre. En effet, l'affiche du film nourrissait la promesse pour le spectateur de voir « la nouvelle comédie d'Éric et Ramzy ». Cette phrase placardée en gros sur l'ensemble du matériel promotionnel entretient l'idée d'un film s’inscrivant dans la continuité du travail des humoristes au cinéma, et n'étant nouveau que parce qu'il est nouvellement sorti. C'est précisément en ce point que le quiproquo intervient. Le terme nouveau ne désigne pas ici la dimension temporelle, mais bien le bouleversement de ce qui était jusqu'ici établi. « La nouvelle comédie d'Éric et Ramzy » est à comprendre comme la nouvelle manière de faire de la comédie pour Éric et Ramzy. Cette collaboration entre des productions et des acteurs venant du cinéma grand public avec un réalisateur dont le travail est en 2007 plutôt confidentiel fait de Steak un film singulier, représentant un tournant dans la filmographie d'Éric et Ramzy. Une singularité qui se fait voir déjà à l'étape du scénario.



#figure(
  image("affiche_steak.png"),
)


L'histoire commence avec Georges (Ramzy) se rendant en skate à l'école. Sur le chemin, il tombe nez à nez avec un tank accidenté. En s'approchant de celui-ci, il découvre une arme à feu, joue avec, avant de l'emporter avec lui. On retrouve ensuite Georges au lycée où ses camarades ne cessent de le harceler. Dès lors en rentant des cours, avec l'arme qu'il a trouvée plus tôt, vise ces persécuteurs avant de les tuer. Juste après ce massacre Georges, erre dans les rues et croise le chemin de Blaise (Éric). Ce dernier est enthousiaste à la vue de l'arme de Georges qu'il pense être factice. Il lui prend donc des mains et commence à jouer avec, mais la police arrive et dans un quiproquo l'embarque pensant avoir à faire aux meurtriers. Sept ans plus tard, Blaise sort de l’hôpital psychiatrique après avoir purgé sa peine, mais le monde qu'il a connu a changé. Ses parents l'ont abandonné, et tout un chacun est désormais obsédé par la chirurgie esthétique, à l’instar de Georges, qui pris de remords est allé chercher son ancien camarade à sa sortie de l'asile, et vient de se faire refaire le visage, portant désormais sur la tête un bandage ne laissant entrevoir que ses yeux. Blaise découvre que Georges fait partie de la bande des garçons populaires du lycée, les « Chivers ». Ils portent tous le même uniforme, blouson rouge, Jean bleu, santiag et ont le visage refait par la chirurgie. Les membres de la bande se déplacent dans de gros 4x4, boivent du lait en continu et jouent à des sports qui leur sont propres (comme le frisbee télécommandé). Georges, nouvellement membre des Chivers voit d'un mauvais œil le retour de Blaise, il a dans un premier temps peur que celui-ci lui fasse honte, puis rapidement il craint qu'il ne le remplace. C'est alors que la situation bascule, l'un des membres de la bande découvre que Georges fume en cachette ( ce qui est apparemment interdit pour faire partie du groupe), il est donc frappé et renvoyé. Quelques jours plus tard, on découvre que Blaise fait désormais partie des Chivers et a remplacé Georges. Mais ce dernier vexé d'avoir été exclu cherche à se venger. Il prend donc une tronçonneuse se rend au QG du groupe dans les bois et tente de les assassiner (malgré ces difficultés pour démarrer la tronçonneuse). Il est arrêté à temps par Blaise qui le menace avec un fusil, mais suite à une mauvaise manipulation, tire et abat le chef des Chivers. Georges et Blaise, pris de panique, s'enfuient ensemble, mais sont rattrapés par la police, terminant ainsi cette histoire.

Le scénario écrit par Quentin Dupieux pour Éric et Ramzy propose une remise en question du duo. Ces derniers tout au long du film n'ont de cesse d’être opposé puis réunis inlassablement. Ils posent la problématique de l'intégration des personnages dans la société à travers la reproduction de comportements sociaux aussi absurdes qu'ils puissent être. Cela passe par le fait de vouloir ressembler physiquement aux autres et d’emprunter les mêmes habitudes. Dans Steak tout un chacun se demande ce qui est a la mode ou ne l'est pas. Dans ce contexte comment la résistance de l'individualité au sein de ce régime social préférentiel est-elle envisageable ? Ici l'individualité étant paradoxalement représentée par les personnages scéniques formés au sein d'un duo d'humoristes.

Dans ce film Éric et Ramzy proposent une nouvelle manière d'exploiter la comédie, sans pour autant la concevoir au détriment de leurs personnages scéniques. En effet, Steak conserve le caractère enfantin ainsi que le rapport de force contenu entre équilibre et déséquilibre propre au duo. Cette dynamique surgit au bout de quinze minutes du film dans une séquence contenant la première véritable interaction verbale des personnages de Georges et Blaise. Dans celle-ci, George est allé chercher Blaise à l'asile et lors du trajet en voiture on assiste à la discussion suivante :

#dialogue[
  « George: Ouhé. Ha tu sais t'en à raté un paquet de trucs toi en sept ans.
  Blaise: Ho la vache, sept ans !

  G: Ouhé, attention par contre la vache ça se dit plus. C'est ringard ça. C'est ringard aussi d’ailleurs ça se dit plus. Je sais pas pourquoi je te dis ça.

  B: Et ça se dit plus, ça se dit ?

  G: Bien vu, ça se dit pas non plus. Mais là j'ai été obligé de te le dire pour que tu comprennes la phrase.

  B: Bon bah je comprends hyper bien. Ya d'autres choses qu'ont changé, ya des trucs, ya d'autres trucs encor ?

  G: Ho ya plein de trucs encore !

  B: Ha bon ?

  G: Tiens par exemple le bonjour il à changé, on dit plus bonjour, on dit salut.

  B: Ha oui, mais ça je savais déjà.

  G: Mais si tu veux être pointu c'est pas salut qu'on dit. On dit bottine.

  B: Bottine ?

  G: Bottine !

  B: Bottine ? Par exemple je rentre dans un magasin je dit Bottine ?

  G: Si il y a des gens, tu dis ça.

  B: Waho bah je vais m'adapter. Faut que je note tout ça parce que le problème c'est que j'ai souvent la mémoire un petit peu...

  G: (en coupant la parole), Mais attend, arrête, arrête, arrête, mais t'es con ou quoi ? T'as cru tout ce que je t'ai dit ou quoi depuis le début ! (rigole) Et mon gars, l'humour aussi il a évolué, il y a un nouvel humour aujourd'hui.

  B: (rigolant) Bah dis donc va falloir que je m'adapte, moi je suis encore dans l'ancien humour, mais là il faut que je reprenne le dessus.

  G: Ça va venir, tiens, tu veux que je te raconte une blague recente ? Une blague d'aujourd'hui.

  B: Oui.

  G: Tu veux une rigolote ? Tu vois le nuage là-haut ?

  B: Lequel ?

  G: N'importe lequel. Tu vois celui- là (pointe un nuage)

  B: Ha c'est moi qui choisis ?

  G: Non ! Bon tu vois ce nuage là ?

  B: Alors c'est toi qui le ?

  G: Oui bon est-ce que tu vois ce nuage ?!

  B: Celui-là oui.

  G: Dis-moi ? On dirait pas du coton ?

  B: (rigole) HAHAH, il est con.

  G: Non répond. Il faut que tu répondes, on dirait pas du coton ?

  B: Heu alors ci c'est celui-là qu'on a choisi, non.

  G: Si ! Si, mais c'est pas l'important. Bon allez laisse tomber je recommence. On reprend. Dis donc, tu vois le nuage là-bas ?

  B: Là on reprend le même nuage ?

  G: Oui c'est la même blague on reprend le même nuage !

  B: Ha d'accord, pardon , OK.

  G: Tu vois le nuage là-bas le même ?

  B: Non, mais attend parce que comme elle à raté sur celui-là je vais prendre, hum, est-ce-que...

  G: (coupe la parole) On peut prendre le nuage qu'on veut. Alors, tant que c'est un nuage tu vois ce nuage, celui-là ?

  B: Oui

  G: Ok, et bien heu on dirait quelle matière par exemple ? (Blaise rigole) Non attend j'ai pas fait la blague là ! Bon je recommence.

  B: (soufle) Ho putain

  G: Et ho fais gaffe ! Tu vois le nuage là haut ?

  B: Oui.

  G: On dirait quelles matières ?

  B: Heu on dirait un, heu une sorte de tissu, mais un peu...

  G: (coupe la parole) Non, non du coton !

  B: Celui-là ?

  G: (agacé) Oui, mais oui, mais c'est pas grave si c'est du coton et puis c'est tout, rhoooooo. Ça y est tu m'as gâché la blague je peux plus faire la fin de la blague ! Rhoo la la !

  B: Excuse-moi.

  G:, Mais excuse-moi tu me demandes de faire des blagues et après tu changes les matières.

  B: Non, non moi j'ai pas demandé, c'est toi qui m'as dit. Moi l'ancien humour m'allait très bien ! Les gens se marraient à l'époque et j’étais pas le dernier. Je me rappelle justement à propos de coton. C'est un type qui rentre dans un...

  G: (coupe la parole) Ça m'intéresse pas, c'est de l'ancien humour. »
]


La première similitude que l'on peut constater avec les personnages scéniques des humoristes tient dans leurs rapports de force. Georges se positionne en supériorité vis-à-vis de Blaise. Il est celui qui sait ce qu'on peut faire ou non et pense détenir une vérité dont il se charge de révéler les clés non sans une dose d’arrogance à son compère. Blaise quant à lui, à travers son incompréhension des nouveaux codes remet en cause cette supposée supériorité. Suit à cela, le pic de l'incompréhension intervient avec la mise en échec narrative de la blague que fait George à Blaise. Cette confrontation entre leurs deux postures aboutit au décalage développant l’effet d'incongruité nécessaire au rire. On peut ajouter à cela que ce qui permet la remise en cause du propos de George ce n'est pas seulement l'incompréhension de Blaise c'est surtout le caractère illégitime et dérisoire de ce qu'il dit. Dès lors, le spectateur s'identifie au personnage de Blaise et découvre avec lui les nouveaux codes de ce monde fictionnel. Néanmoins, le spectateur lui dispose du recul nécessaire pour attester de l'absurdiste du dialogue, Blaise en revanche doit apprend à composer dans cette nouvelle réalité avec plus ou moins d'habilité. On peut notamment citer une séquence dans laquelle ce dernier désireux d’être accepté des autres utilise une agrafeuse pour se refaire lui même le visage sans passer par la case, chirurgie esthétique. On constate aussi que George s'adapte à cet univers avec peu d’aisance, il passe son temps à essayer de faire comme tout le monde en surface, mais sa véritable nature resurgit sans cesse. Il n'est pas capable de s’empêcher de fumer, ces blagues pourtant signes d'une hypothétique intégration ne fonctionnent pas, et le personnage de Blaise seul témoin de son ancienne vie dans laquelle il se faisait harcelé, refait surface. Dès lors, on assiste ici comme c'est le cas dans leur spectacle aux jeux de celui qui ne sait pas avec celui qui croit savoir.

On peut ajouter à cela que leurs conversations empruntent un tond enfantin symptomatique de l'univers de leurs personnages scéniques, caractérisés par des bégaiements, des erreurs grammaticales et surtout l'oscillation entre plusieurs émotions distinctes (réjouissance, énervement, ennui, rire, bouderie, etc). Dans Steak, les personnages d'Éric et Ramzy sont comme ils le sont sur scène des enfants. Ce qui fait la différence notable avec La Tour Montparnasse infernale, c'est que l'univers filmique dans lequel ils sont plongés n'est pas régi selon leurs gags#footnote[La Tour Montparnasse Infernale s'inscrivant dans la descendance du film burlesque son fonctionnement narratif est similaire à ce que décrit Emmanuel Dreux dans son ouvrage Le Cinéma burlesque:ou la subversion par le geste : « Idéalement le film burlesque se déroule sous la menace constante du gag et de l'écart qu'il introduit par rapport à l'ordre qu'il a mis en place, ou sous celle du possible inattendu qu'il ouvre dans le réel. » DREUX Emmanuel, Le Cinéma burlesque:ou la subversion par le geste, Paris, L'Harmattan, 2007, p.75]. Chez Dupieux, Georges et Blaise restent les personnages scéniques des deux humoristes, mais cette fois-ci plongés dans un univers hostile à leurs personnalités. L’ensemble du film montre leurs tentatives de masquer leurs singularités pour s'intégrer sans jamais réellement y parvenir puisqu'à la fin on assiste au meurtre de la norme (représenté par le décés du chef des Chivers) et à la fuite du duo de nouveau réuni. Une fuite qui n'est pas sans rappeler la course finale des deux laveurs de vitres de La Tour Montparnasse infernale.

Dupieux ne capitalise pas dans le film sur la persona des deux humoristes, il compose avec cette dernière sans adopter la stratégie du contre-emploi. En représentant l'échec de leur intégration dans l'univers fictionnel de son film le réalisateur représente le processus nécessairement avorté du contre-emploi et en désigne le caractère caduc. Éric et Ramzy sont chez Dupieux des humoristes que l'on reconnaît et identifie comme tels. Dès lors, le détournement de leurs persona n'intervient pas dans un adoucissement ou un supposé bouleversement de celle-ci. Dans le film, le comique des humoristes se manifeste dans une lignée commune à la scène et l’intervention du réalisateur au sain de leur humour tient dans l'intensité qui lui est accordée. Dans la séquence de la voiture, tout dans la conversation entre Georges et Blaise est poussée à son paroxysme. Le gag tient dans un étirement exacerbé des mécaniques humoristiques. Ce qui fait rire ce ne sont pas les mots en eux mêmes, c'est l'épuisement de ces derniers, les rendant dans un premier temps indigestes, puis dans un second comiques. Le spectateur se demande dans cette séquence quand la blague sur le nuage va enfin prendre fin et c'est son épuisement qui peut l'inciter à rire.

_Steak_ propose une redéfinition du comique d'Éric et Ramzy. Leurs personnages scéniques sont dans le film extirpés à leur zone de confort ici symbolisée par « l’ancien humour » pour être plongée dans l'univers de Dupieux et du « nouvel humour ». On assiste à une réflexion sur la manière de faire de la comédie avec des gens déjà drôles. Dès lors, la réutilisation des personnages scéniques n'est pas ici encrée dans un agencement privilégié entraînant la recréation de régime d'image privilégié. Au contraire Dupieux récupère pleinement les personnages scéniques du duo et questionne leur résistance et légitimité au sein d'un univers filmique fictionnel. Ainsi _Steak_, de par sont traitement de la figure de l'humoriste propose « l’épuration » au sens ou l'a définie Badiou d'un agencement privilégié du cinéma, et propose la création d'un « objet filmique moderne ».

== Humoristes, Auteurs, acteurs, producteurs

« Il y a un an, on avait laissé Éric et Ramzy au bord d’une route, le visage hagard, à peine revenus de l’astringente aventure que leur avait fait vivre Quentin Dupieux dans Steak. Réussite artistique et échec commercial qui avaient déconcerté leur public habituel, le film laissait difficilement présager de la suite : seraient-ils désireux#footnote[ROPERT, Allexe ? « Éric et Ramzy creusent le sillon d’un comique étrange en univers raréfié, amorcé dans Steak », Les Inrockulltibles, 25 juin 2008] ». Seuls Tow, première réalisation du duo qu'ils cosignent, sort en 2008 marquant ainsi le retour d'Éric et Ramzy sur l'écran de cinéma. Avec ce nouveau film, pas question pour le duo d'humoristes de retomber dans les tourments auxquels ils se sont confrontés pour Double Zéro et Les Dalton. Ils s'assurent une main mise totale sur le projet en étant à la fois scénaristes, producteurs, réalisateurs et acteurs du film. Dans ces conditions le film émane pleinement de la vision artistique conjointement insufflée par le duo. La manœuvre leur sera facilitée par un budget confortable de 15,4 millions d'euros accordé notamment par les partenaires financiers que sont Les productions du Trésor (en la personne d'Alain Attal), M6 films et TF1 films productions. Le financement de leur cinquième long métrage tout en se distinguant du schéma emprunté avec Steak, s'inscrit dans le prolongement de leur précédente production. Là où la rupture s'opère avec ces dernières et rejoint le film de Quentin Dupieux c'est dans son contenu même. Avec Seul Tow, Éric et Ramzy réinterprètent de nouveau leur manière de faire de la comédie en l'appliquant selon leurs propres règles.

Le film raconte l'histoire de Gervais (Éric), un policier incompétent moqué par ses collègues. Il traque depuis des années sans succès un bandit du nom de Curtis (Ramzy). Le jour de son mariage, Gervais tombe nez à nez avec Curtis. Il entame alors une course-poursuite avec ce dernier délaissant au passage ces engagements auprès de sa future épouse. Durant cette course-poursuite, alors que Gervais semble atteindre sont but, il se retrouve sur l'avenue des Champs-Élysées totalement vide alors même que nous sommes aux beau milieu de la journée. Rapidement (mais non sans une once de déni), Gervais se rend compte qu'il n'y a plus personne excepté Curtis. Nos protagonistes désormais seuls à deux n'ont d'autre choix que de collaborer pour espérer un retour à la situation à la normale.


Ce film, Éric et Ramzy le réalisent pour eux et c'est un moyen pour le duo à la fois de donner à leurs personnages scéniques un immense terrain de jeu et de questionner leur nécessité comique de former un duo. Dans Seuls Tow, comme le dit le journaliste Jacques Mandelbaum dans un article paru lors de la sortie du film : « Éric et Ramzy ont profité des moyens offerts par le cinéma pour s'affranchir de la réalité, et prolonger, en grandeur nature, leur humour régressif et leur humeur lunaire d'adolescents attardés. Cela fait comme un doux courant d'air#footnote[MANDELBAUM, Jacques « "Seuls Two" : l'embardée poétique d'Éric et Ramzy », Le Monde, 24 juin 2008]. » Le cinéma ne leur proposant pas de projet à la hauteur de leurs attentes, le duo fait le choix dans ce nouveau film de produire un projet eux-même, respectant leurs visions, leurs ambitions artistiques et surtout la singularité de leur humour. On peut pour illustrer cette spécificité comique citer une séquence du film dans laquelle Curtis attablé à un restaurant se fait amener par un serveur une assiette de spaghettis. Il rétorque alors au serveur qu'il s'est trompé dans la commande et qu'il avait demandé des frites et non des pâtes. Ce à quoi le serveur lui rétorque que son assiette contient en effet des frites. Curtis s'énerve et persiste en disant qu'il ne s'agit non pas de frites, mais de pâtes. Le gag ici vient d'une incohérence entre deux réalités. Celle du serveur et celle de Curtis. Le tout, sous le regard circonspect du spectateur témoin d'une présence effective de pâtes dans l'assiette, mais également témoin de l’assurance et l’impassibilité du serveur vis a vis du fait qu'il s'agit non pas de pâtes dans l'assiette, mais bien de frites. Cette rencontre entre deux réalités coexistant désormais produit l'effet d’incongruité tirantses atouts d'une situation à présent absurde.

Dans ce film, nos humoristes transforment la ville de Paris en une scène géante pour leurs sketches, gags, et blagues. Le tout sous-tend la question de leur relation en temps que duo. Ils sont ici séparés par le scénario qui fait le choix d'en faire des rivaux remettant en permanence en défaut leur équilibre interne. La disparition soudaine et magique de l'entièreté de l'humanité ne fait que révéler un peu plus la question de leur individualité au sein du groupe. Dès lors, on ne peut plus que regarder eux seuls. Ainsi, on note une différence de style qui s'installe. Curtis profite des possibles qui s'offrent à lui et ses gags tournent à la grandiloquence. Il vole une voiture de sport et ne peut décrocher sa ceinture, foule victorieux la pelouse du parc des princes s’endort et se retrouve aux sol, les cheveux coincés dans les rouages d'un arrosage automatique, lance une sarbacane dans les tuyaux du centre Pompidou, celle-ci rebondit et lui revient dans le visage provoquant son évanouissement. Gervais, lui propose des gags minimalistes s'appuyant davantage sur les traits de personnalité de son personnage. Il ne profite pas des opportunités permises par la situation et cherche à tout prix un retour à la normale en reproduisant la norme sociale établie dans son ancien monde. Il va chez le fleuriste et laisse la monnaie sur la table, continue de se présenter à son bureau pour faire des rapports sur l'ensemble des infractions commises par Curtis, tente de contacter par tous les moyens quelqu'un d'autre. L'un accepte la situation tandis que l'autre la refuse marquant un écart au sein du duo.

Paradoxalement si leurs comédies respectives se distinguent, c'est à travers une comédie commune qu'ils sont amenés à se retrouver. On a d'une part plus largement la comédie qui se place à l'échelle du film en lui même puis cette comédie intégrée comme motif narratif. Pour retrouver Curtis au cours de ses enquêtes, Gervais opte pour une méthode bien spécifique. Il prend pour point de départ un élément parfaitement anodin, le décortique en faisant des jeux de mots et autres associations d'idées avant d’aboutir à un résultat qui n'est autre que l'emplacement de Curtis. Miraculeusement cette technique fonctionne à plusieurs reprises dans le film. La magie opère et ce n'est finalement pas si étonnant puisque rappelons-le, nous sommes dans le film d'Éric et Ramzy, les créateurs d'une pastille humoristique entièrement dédiée aux jeux de mots et à la déformation du vocabulaire. Dès lors, l'utilisation de ce gag déformant le langage par Gervais invoque le passé scénique commun des deux humoristes et permet logiquement la réunification de leurs personnages scéniques dans leurs films de réalisateurs. Malgré tout, l’expérience de Steak a tout changé, l'individualité des membres du duo resurgi et si leurs personnages sont réunis dans un montage alterné des séquences présentant leurs errances dans un Paris déserté, c'est leur capacité à faire rire seule qui domine. On assiste ici à l'alternance de sketches distincts propres à chacun des deux humoristes au sein d'un film commun. C'est aussi une manière pour les humoristes d'affirmer dans un dernier geste, leurs compétences à la fois commune et distincte. Avec Seuls tow Éric et Ramzy s’éloignent peu à peu de l'humoriste bicéphale qu'ils composaient dans leurs spectacles « ÉrickéRamzy ». C'est pour eux l'occasion d'affirmer qu'ils sont dissociables, à la fois Éric Judor et Ramzy Bédia. Dans une interview en 2017, Éric Judor relie cette problématique qui a traversé le duo qu'il formaient avec Ramzy Bédia aux enjeux ayant drainé la carrière de Jerry Lewis et Dean Martin avant et après leurs séparations :

« J'ai lu sa biographie lorsqu'il formait un duo avec Dean Matin. C'est génial, ça m'a remis en question. Je l'ai lue en 2008, lorsqu'on préparait _Seuls tow_, avec cette question commune à eux et nous : passer à autre chose et se recréer. C'était des superstars et pourtant il y a eu une fin. Je me disais que ce moment allait arriver pour nous aussi. Il fallait se réinventer#footnote[Entretien avec Éric Judor dans :GANZO, Fernando, GOLDBERG, Jacky, MEVEL, Quentin, La Nouvelle comédie du cinéma français, Les nouvelles éditions JMP, Paris, 2017, p.63]. »


Ainsi, _Seuls tow_ est à concevoir comme le geste d'un duo d'humoristes devenus réalisateurs pour échapper au poids du duo. À travers la représentation de cet éclatement Éric et Ramzy proposent une redéfinition de leur statut d'humoristes à deux. Ils sont ici humoristes (et aussi acteurs, auteurs , producteurs,) seuls, mais ensemble, allant à l'encontre des régimes de représentations qui leurs collaient jusqu'ici à la peau. Suite, au Tournage de Seuls tow et aux tentions qui se développent au sein du duo, Éric et Ramzy se séparent et ne retravailleront de nouveau véritablement qu'en 2011, sur la série d’Éric Judor Platane et le film de Rachid Dhibou Halal police d'état.


== « Mais qui est Éric Judor ?

L'ensemble des objets filmiques que nous avons étudiés jusqu'à présent portent en eux le poids de la persona de l'humoriste qui s'y trouve. Qu'il s'agisse de Coluche ou d'Éric et Ramzy leur présence au sein d'espaces filmiques conditionne le développement d'une réception critique, publique et institutionnelle embrassant la présence médiatique et scénique de ces humoristes. Ici, l’enjeu s'apparente à la problématique décrite par la
chercheuse Jacqueline Nacache :

#dialogue[
  « Avec les années les acteurs semblent s’avancer hors des récits filmiques, s'en détachent comme des figures de proue : c'est Jouvet que je vois en Knock[...]. La valeur de leurre pâlit, la fiction vacille sur ses bases. Le phénomène est connu ; le cinéma de fiction doit sans cesse s'acharner à remettre les acteurs à leurs places#footnote[NACACHE, Jacqueline, L'acteur de cinéma, Paris, Nathan, coll.Cinéma, 2003,p.100]. »
]

Plus encore lorsqu'il s’agit d'humoristes au cinéma la dominance de leurs persona sur l'objet filmique de fiction a tendance à s'accroître, jusqu'à flouer les limites entre la réalité de l'acteur et de celui qu'il incarne. Ainsi, dans Tchao pantin ce qui aurait dû de par le contre-emploi entreprendre de « remettre [l'acteur] à [sa] place » développe finalement le processus inverse. C'est finalement la vision de Coluche l'humoriste qui ne fait plus rire que le spectateur retient. En ce qui concerne Éric et Ramzy, la question ne se pose même pas. Toute la première partie de la carrière au cinéma des deux humoristes se construit sur leur notoriété scénique et médiatique. Même Quentin Dupieux se joue de cette image en désignant Steak comme « la nouvelle comédie d'Éric et Ramzy ». Plutôt que de chercher à masquer leurs présences, les récits dans lesquels ils prennent place vont soit abonder dans leur sens (La Tour Montparnasse infernale), soit ce jouer de cette persona et en tirer un motif de friction narratif et un gag (Steak).


C'est dans ce contexte qu'Éric Judor sort en 2011 sa série Platane qu'il produit pour canal +. Dans cette dernière, il raconte l'histoire d'Éric Judor, ancien humoriste membre du duo sur scène Éric et Ramzy ayant connu le succès au début des années 2000 avec la série H. Dix ans plus tard aux côtés de son coéquipier il tente de faire un retour médiatique avec la sortie de la suite de H, HP (hôpital psychiatrique) produit par canal+. Les plans d'Éric Judor se retrouvent avortés lorsqu’en sortant de la soirée de lancement de la série, ivre, il percute un platane et tombe dans le coma. Un an plus tard, Éric sort du coma et découvre que Ramzy a tourné la série sans lui. Se sentant trahi il décide d'en finir avec la comédie et de désormais faire du cinéma « sérieux ». Il se lance alors dans le tournage du film La Môme deux points zéro next generation, suite non officielle du film sur Édite Piaf La Môme. Éric Judor, malgré un enchaînement de bourdes réussit temps bien que mal à produire son film, le terminer et contre toute attente les retours de la critique suite à l'avant-première sont extrêmement positifs. Le film est même sélectionné pour participer au festival de Cannes. Malheureusement suite à une bourde finale, Éric détruit avec de la colle l'unique bobine de ce qu'il considère comme son chef d’œuvre.

Dans cette série sous forme de backstage comedy décryptant l'industrie du cinéma de l'étape du casting, au montage, en passant par le tournage, Éric Judor met en scène le personnage d'Éric Judor. Ce positionnement permet paradoxalement d’effacer la tension entre l'acteur et son personnage. Le tout dans un projet esthétiquement à la croisée entre The Office de Ricky Gervais et Curb your enthusiasm de Larry David. En incarnant dans la série une version fictionnelle de lui même, l'acteur de l'objet filmique n'est finalement plus en compétition avec son personnage. Il n'est plus ici nécessaire de chercher à effacer la figue l'acteur ou au contraire de la mettre en avant, puisqu'elle est effectivement fictionnellement et parafilmiquement présente. Avec Platane Éric Judor fait l'état de sa persona en composant autour de celle-ci. L'humoriste trouve sa place en développant un espace de création dans lequel il peut s’émanciper de son personnage scénique en composant cette fois un personnage filmique indépendant. Sur les prémisses de ce postulat artistique, Éric Judor s'inscrit dans la modernité décrite par Jacques Rancière :


#dialogue[
  « La nouveauté propre au « moderne » consiste alors à ce que le propre de l'art, son essence déjà active dans ses manifestations antérieures, conquière sa figure autonome en brisant les cadres de la mimesis qui l'enserraient. Le nouveau ainsi pensé est toujours déjà préfiguré dans l'ancien#footnote[RANCIERE Jacques, La Fable cinématographique, SEUIL, Paris, 2001, p.146]. »
]

Dans Platane on assiste à l'épuration de la persona d'Éric Judor en la soustrayant aux « agencements privilégiés » qu'impliquent son image. Le format de la série comme lieu audiovisuel et non cinématographique, mais traitant narrativement du cinéma nourrit ce décalage, et rend accessible et envisageable un traitement de biais de la question de la disparition de son personnage scénique. Le changement de support accompagne le spectateur dans le « mockumentaire », comme un journal de bord relatant de l'intimité à la fois du réalisateur, de l'acteur et de l'humoriste. Dès lors, la représentation de « l’ancien » incarné par la reprise d’éléments narratifs réels (Éric Judor est bien un humoriste ayant créé un duo avec Ramzy Bédia avec lequel il a tourné la série H) permet la construction de la modernité en donnant un point de départ vraisemblablement troublant pour des éléments narratifs cette foi-ci fictionnels s’émancipant des régimes de représentation jusqu'ici établis. Cet effacement de la frontière entre réalité et fiction est expliqué par les personnages eux-mêmes dans une séquence de l'épisode neuf de la saison une. Dans celle-ci, Éric après avoir tourné le dernier plan de son film va voir son équipe sur le plateau de tournage afin de recueillir leurs avis. Le problème c'est que dans la précipitation Éric qui jouait dans cette séquence portait au moment du tournage un t-shirt avec l'affiche du film Seuls tow dessiné ci-dessus :


#dialogue[
  « Éric : Alors ?

  David: Bah, oui, mais non, on ne sait plus, on ne sait plus si c'est un personnage du film, ou si c'est Éric Judor qui tue Clotilde Courau.

  Éric : Mais pourquoi ? Je suis désolé, mais dans ce cas on peut se poser la question est-ce que c'est Clotilde Courau ? Est-ce que c'est Jackie Guivens ?

  David : Mais dans la scène dans le cadre, tu as un t-shirt « Seuls tow », et elle Clotilde elle ne porte pas un t-shirt « je suis une princesse ».

  Blogueur : Et bon tu le sais je te déteste, mais là tu changes le cinéma. Le réalisateur du film qui tue sa propre actrice. Faut se faire à l'idée, mais une fois qu'elle est là c'est pas mal.

  Éric : Voilà ! Voilà ! Merci ! Pardon pour tout à l'heure, voilà ça change le cinéma, il a raison !

  […]

  Éric : Quand tu connais un peu le cinéma ça ressemble un peu à du Lynch à du Lars Von Trier. Oui ! Lars Von Trier. Tu ne sais pas si le film se termine, tu ne sais pas où ? Qui ? Est-ce la vérité ? On est le spectateur actif.

  Arnaud : Mais arrête, Éric Judor qui joue Éric Judor c'est une vanne. Ya plus rien de crédible. Là tu sais quoi on est en train de dire aux gens on a fait un film, on a fait semblant et voilà bonne soirée.

  Éric : Pffff, tu dis n'importe quoi. Au contraire je laisse le spectateur entre deux eaux, est-ce un film ? Est-ce la vraie vie ? Qui est Éric Judor ? »
]


La vérité c'est peut être tout simplement ici qu' Éric Judor c'est le personnage fictionnel de la série Platane, un personnage distinct de celui d'Éric du duo Éric et Ramzy et encore différent d'Éric Judor l’humoriste, acteur, producteur et réalisateur. Il s'agit de trois figures distinctes deux fictionnelles et une réelle même si toutes les trois s'appellent Éric. Si Platane est en apparence très proche de la réalité le spectateur doit garder à l'esprit que c'est une fiction avec des acteurs et que depuis le début « on a fait semblant ». Par ce postulat c'est aussi une manière d'affirmer que le personnage médiatique incarné par un humoriste construit également un récit fictif malgré son ancrage réel. Coluche n'est pas plus réel qu'Éric et Ramzy, tous sont des personnages.


Dès lors, afin de se distinguer d'une persona dépendante de son appartenance à un duo, Éric Judor dans cette série représente la mise en scène concrète de la rupture avec Ramzy Bedia. En effet, au début de Platane Éric et Ramzy composent un duo en crise dont l'unicité est révolue par le comportement d'Éric et son coma d'une année. Dans la série Éric nomme cette rupture par sa décision de couper court à sa carrière comique en se lançant dans le cinéma « sérieux ». Chose qu'il ne parvient pas à faire puisqu'on le retrouve finalement dans une série comique dans laquelle les autres personnages qui le reconnaissent n'ont de cesse de l’appeler « monsieur Ramzy Judor », « Éric Ramzy » ou tout simplement « Ramzy ». Le tout signifiant son incapacité à échapper au duo qu'il formait sur scène et au cinéma avec Ramzy Bedia alors même que celui-ci n'est présent que dans le premier épisode la saison une. Ainsi, Éric Judor représente l'impact d'une persona envahissante qui se répercute dans son cinéma puisqu'il cherche à se défaire de cette image en devenant « sérieux ».



Le paradoxe est que narativement le personnage cherche à sortir de la comédie en jouant dans une série comique. Dans Platane Éric Judor fait rire à ses dépens plus il cherche à être « sérieux » plus cela se retourne contre lui. On a l'occasion de voir dans la série des extraits du film qu'il réalise. Le spectateur peut ainsi constater que ce dernier est plutôt médiocre. Le scénario est hasardeux, Éric enchaîne les faux raccords, les dialogues sont extrêmement « cliché ». On peut notamment citer le fait qu'il ait tourné une des séquences de son film avec un fond vert dans laquelle les personnages sont supposés marcher dans les rues de New York. Pour ce faire les acteurs marchent sur place et c'est le décor dans une incrustation douteuse qui doit défiler et donner la sensation du mouvement. Le problème c'est que l'échelle de plan choisie par Éric est bien trop large et on peut voir les acteurs qui marchent sur place. En partant de là on se dit que La môme 2.0 next generation à tout pour être un superbe nanar. Néanmoins, les réactions suite à l'avant-première sont extrêmement positives. Ici, Éric Judor (le réalisateur de la série) prend le parti de se moquer du contre-emploi et de cette nécessité pour les acteurs comiques de tourner dans des drames. Platane est par cet aspect un anti Tchao pantin. Éric dans la série nomme à plusieurs reprises l'impact qu'aurait dans sa carrière le fait de faire un film « sérieux » avec une sélection officielle dans des festivals le rendant légitime. En faisant cela il n'a de cesse de dénigrer sa filmographie passée en la considérant un peu trop « bébête » et dérisoire. Le fait que dans la série son film ne soit finalement pas vu au-delà de l'avant-première est une manière d'affirmer qu'un « film sérieux » présentant « le nouveau visage d'Éric Judor » n'est en aucun cas une nécessité puisque la comédie elle, est bien réelle et dispose de sa propre valeur. Platane est un objet filmique à la frontière entre l'ultra réalisme et l’absurde laissant place à un malaise ambiant où la comédie et le gag sont les seuls maîtres mots. Par là, il revalorise la comédie en la légitimant.

De même le fait que la suite de _H_, _HP_ ne soit finalement pas réalisé par l'humoriste c'est une manière pour lui d’échapper à une forme de capitalisation sur ses œuvres passées. Il ne s'enterre pas dans un registre ou une manière unique de faire de la comédie. Dix ans après H, ce n'est pas une sitcom que sorte Éric Judor pour jouer sur la nostalgie des spectateurs, mais Platane, une série jouant sur de nouveaux ressors comiques. En faisant Platane Éric Judor ne propose pas une reproduction d'objet audiovisuel canonique attrayant à l'utilisation d'humoriste par le cinéma français. Premièrement, il se distingue de la stratégie du contre-emploi en la refusant catégoriquement et en allant jusqu'à la moquer. Deuxièmement, sa comédie ne propose pas l’épuisement de motifs humoristiques galvaudés et artificiels. Il fait rire sans reproduire à la fois de schéma commun, et aussi sans proposer une réutilisation de ses propres biais de comédie. Dans sa série il n'est à aucun moment question d'une réutilisation de son personnage scénique, il compose quelque chose qui est autre sans pour autans renier sont passé artistique.



Pour ce faire il écrit le personnage d'Éric Judor, un être drôle, gênant, espiègle, maladroit, menteur et malhonnête aux antipodes du personnage scénique d'enfant naïf d'Éric du duo Éric et Ramzy. On assiste ici aux mélanges du personnage fictionnel avec des éléments réels. Ainsi, on peut considérer qu'Éric Judor entreprend dans sa série Platane le processus décrit par le philosophe Alain Badiou pour parler d’œuvre de cinéma moderne :


#dialogue[
  « Le cinéma est un lieu d’indiscernabilité intrinsèque entre l'art et le non- art. Aucun film, à vrai dire, n'est de bout en bout contrôlé par par une pensée artistique. Il charrie toujours des morceaux absolument impurs, relevant de l'imagerie ambiante, de déchet des autres arts, de convention périssables, etc. L'activité artistique n'est repérable dans un film que comme processus d'épuration de son caractère non artistique immanent#footnote[BADIOU, Alain, Cinéma « considérations sur l'état actuelle du cinéma », Paris, Novas, 2010, p.223]. »
]


On peut considérer ici le « non-art » comme incarné par les éléments inhérent à la persona d'Éric Judor et « l'art » comme l'ensemble des motifs fictionnels se mêlant à ce socle réel. Ainsi, Platane est par essence un lieu propice à « l'indiscernabilité intrinsèque entre l'art et le non-art », laissant place à une confusion chez le spectateur. C'est en décalant les régimes d'images attrayants à sa persona, qu’Éric Judor procède à l'épuration de matériaux « non artistiques immanents ». Ce trouble généralisé présent au sein de la série sert à la fois le développement d'un univers fictionnel moderne, mais surtout le comique. Platane dans son fond et sa forme permet de régler la question de la cristallisation du personnage scénique de l’humoriste. La série nomme et ne réfute jamais les passés artistiques de son auteur sans pour autant s'y replonger formellement. Ici Éric Judor parvient à échapper à son personnage scénique en restant sur son propre terrain de jeu, la comédie. Avec Platane l'humoriste devient l'acteur drôle et l'auteur de comédie et il n'est jamais question d'un passage artificiel par le drame.


#heading(numbering: none)[
  Conclure sur le rire
]


Coluche malgré une carrière cinématographique qui n'aura duré pas plus d'une quinzaine d'années marquera durablement l’histoire du cinéma français avec des films qui si l'on omet Tchao Pantin ne font paradoxalement pas date dans l'imaginaire collectif. Pour autant, la filmographie de l'humoriste n'est en aucun cas tombée dans l'oubli, bien au contraire, cette dernière s'est efforcée d'accompagner les spectateurs français et cela encore aujourd'hui. Si nous précisons que ces films ne font pas date c'est pour souligner qu'ils ne sont pas dans un processus naturel entrés au panthéon du septième art. Malgré tout, la filmographie de Coluche au même titre que la comédie plus largement s'inscrit dans une forme de quotidienneté auprès du spectateur. La comédie de par son caractère naturellement populaire nous accompagne et s’immisce à travers le rire dans la vie de tous les jours. Si on ne retient pas à proprement parler de date, on retient le gag, celui qui l'incarne et la sensation du rire qu'il nous a procurée. Ainsi, si nous sommes à même de situer La sortie des usines lumière en 1895 comme le premier film de l'histoire du cinéma, L'arroseur arrosé pourtant sorti la même année s'impose dans notre imaginaire plutôt à travers la force burlesque de son gag que par son caractère muséal. Le gag en temps que fondement de la comédie s'en retrouve le matériel privilégié de sa propre transmission. Le public en se le réappropriant que ce soit oralement ou physiquement, intègre cet univers filmique au sein de son quotidien. À cela, on peut ajouter que la multiplication des rediffusions télévisuelles des comédies, participe de cette imbrication du genre dans la vie courante. Pour exemple sur la période allant de 1957 à 2018 le film, Deux heures moins le quart avant Jésus-Christ, selon un recensement effectué par le journal Le Monde#footnote[FERRER, Maxime, Le Monde, « Quels sont les films les plus diffusés et les acteurs les plus présents à la télé française ? », 25 décembre 2018 https://www.lemonde.fr/les-decodeurs/article/2018/12/25/quels-sont-les-films-les-plus-rediffuses-sur-les-chaines-publiques-en-france_5402043_4355770.html Consulté le 13/06/2024] a été diffusé à la télévision française ( chaînes hertziennes gratuites et canal+ ) 29 fois, faisant de lui (au côté du Pacha de Georges Lautner avec également 29 diffusions) l’œuvre cinématographique la plus diffusée par la télévision française. Dès lors, la comédie que ce soit selon une logique commerciale ou tout simplement à travers sa revalorisation par le public lui- même s'impose comme un genre de prédilection pour le spectateur français. Un genre proposant l’interconnexion entre les référents, les blagues, les gags, les chutes et aussi les personnalités qui le soutiennent qu'ils soient devant ou derrière la caméra, le tout formant une constellation du rire. C'est dans ce contexte que la figure de l'humoriste resurgit en s'offrant une place privilégiée au sein de ce dessin lumineux, avec plus ou moins d'éclats jusqu'à provoquer en certains points une saturation de l'espace. En tant qu’artisan du rire, l'humoriste s'impose tout naturellement dans ce schéma cinématographique, après tout s’il est capable de faire rire sur scène, c'est envisageable qu'il en soit de même face à la caméra. C'est selon cette logique que l’industrie s’accapare cette figure, tout d'abord avec les chansonniers qui joue dans des films, un peu toujours les mêmes. Fernand Raynaud est ainsi une fois Fernand cow-boy (1956) et une autre Fernand clochard (1957), et si cela n'est pas mentionné dans le titre du film son personnage s'appelle toujours Fernand (comme c'est le cas dans 10 de ses films). Les années passent et la mode des chansonniers aussi, ils laissent place dans un premier temps au café théâtre puis aux humoristes, ou plutôt à un humoriste, Coluche, qui propose sur scène à la fois la solitude espiègle du chansonnier et l’irrévérence collective du café théâtre. Avec ce mélange Coluche apporte à la France l'humoriste moderne. Dans un comique mêlant personnages, stand-up, absurde, burlesque et surtout critique sociale, Coluche s'impose en France comme l'humoriste le plus novateur de sa génération. C'est dans un processus naturel que l’industrie cinématographique va se charger d’effectuer la transposition de sa persona et donc de son personnage scénique au cinéma à l'instar de ce qu'elle faisait avec les chansonniers. C'est ainsi que l'humoriste va jouer dans beaucoup de films, des comédies principalement, et puis un drame pour lui servir de contre emploi, ce que personne n'attendait, prouvant qu'il est aussi capable de ne pas faire rire.

Naturellement, après Coluche, d'autres humoristes, beaucoup, vont émerger, dans sa continuité, d'abord sur scène et puis finalement au cinéma. Pléthore d'entre eux se contenteront de la comédie la plus classique, et la plus produite, avec plus ou moins de succès. Dany Boon après s’être illustré sur scène jouera de 1995 à 2024 dans pas moins de 34 films parmi lesquels Bienvenue chez Les Ch'tis qu'il réalise en 2008 et qui dépassera à sa sortie le record jusqu'ici détenu par La Grande vadrouille en faisant 20 millions d'entrées. C'est dans une filmographie conséquente que l'humoriste proposera projet après projet une réinterprétation de son personnage scénique originel allant vers une forme de saturation et d'épuisement de celui-ci#footnote[Son dernier film La Vie pour de vrai dans lequel l'humoriste propose une énième fois l'interprétation de son personnage de timide maladroit au grand cœur, lui accordera l'un des nombres d'entrée le plus bas de sa carrière avec 800 000 spectateurs.]. La où certains ce sont enfermés dans leurs personnages d'autres trouveront avec le cinéma un nouveau terrain de jeux, propice à l'exploration de personnages à la fois dérivés de la scène et totalement nouveau. Ici, on pourrait citer comme exemple à la fois Albert Dupontel et

Alex Lutz qui auront tendance à s'imposer dans notre imaginaire non plus forcément comme des humoristes, mais comme des cinéastes ou des acteurs. Tous deux ont sus à la fois revaloriser leurs passés scéniques en les incorporant pleinement aux spécificités du médium cinématographique que ce soit dans Guy (2018) ou Bernie (1996). Il y a aussi d'autres contre- emplois, Jamel Debbouze incarnant un tirailleur pendant la Seconde Guerre mondiale dans Indigènes en 2006 et Muriel Robin, Jacqueline Sauvage, une femme ayant assassinée son mari violent dans un film du même nom en 2018. Tous ces humoristes vont saturer nos écrans de cinéma avec des parcours plus ou moins galvaudés, plus ou moins originaux. C'est aussi à travers le format de la série que l'humoriste va se décliner audiovisuellement, en proposant des récits comiques questionnant leurs personnages scéniques et leur identité. C'est comme nous l'avons vue le cas de Platane auquel suivrons à la fois La Meilleure version de moi même en 2021 de Blanche Gardin et Désordres en 2022 de Florence Foresti. Deux séries où elles aussi incarnent leur propre personnage fictionnalisé.

Dans tout cela Éric et Ramzy proposent une résolution en ce qui concerne la place de l'humoriste au cinéma. Ils s'inscrivent à la fois dans la filiation du système ouvert par Coluche en jouant d'une part dans des comédies relevant de la grosse production et conçues économiquement comme un produit de masse, tout en proposant paradoxalement un contre modèle. Dans La Tour Montparnasse infernale, il ne s'agit plus de composer autour d'un personnage scénique, mais avec celui-ci. Le modèle proposé par le duo c'est la main mise sur l'objet audiovisuel, pas seulement en temps qu'acteur, mais d'abord comme scénariste et producteur puis à partir de 2007 comme réalisateur avec Seuls Tow. Finalement Éric et Ramzy se sont contentés de s’approprier le médium cinématographique de la même manière qu'ils l'avaient fait avec la scène. Par ce geste ils deviennent auteurs de l’œuvre et non plus simplement acteurs d'un système auquel l'humoriste est assujetti au cinéma. En cela, c'est aussi une manière de se soustraire au régime de représentation en échappant aux agencements privilégiés qui les contraints et en revalorisant le rire en temps que résultât des « opérations artistiques du cinéma » et non pas d'une machine productiviste.

















































































#heading(numbering: none)[
  Corpus
]

Corpus Coluche :

Scénique :

- COLUCHE, Ginette Lacaze, 1976
- COLUCHE, Mes adieux au music-hall, 1974, 1975, 1977, 1979

Filmique :

- Zidi, Claude, L'Aile ou la cuisse,1976
- Zidi, Claude, Inspecteur la Bavure, 1980
- BERRI, Claude, Le maître d'école, 1981
- BLIER, Bertrand, La femme de mon pote, 1983
- BERRI, Claude, Tchao pantin , 1983

Corpus Éric et Ramzy :

Scénique :

- JUDOR, Éric, BEDIA, Ramzy, Éric et Ramzy au Palais des glaces, 1998
- JUDOR, Éric, BEDIA, Ramzy, HAZANAVICIUS, Michel, ÉrickéRamzy, 2005

Filmique :

BEDIA, Ramzy, JUDOR, Éric, Les mots d’Éric et Ramzy, 1998

LARTIGAU, Éric, H, 1998-2002

NEMES, Charles, La Tour Montparnasse infernale, 2001

ZIELENKIEWICZ, Richard, Les Ratz, 2003

PIRES, Gérard, Double Zéro, 2004

HAIM, Philippe, Les Dalton, 2004

DUPIEUX, Quentin, Steak, 2007

BEDIA, Ramzy, JUDOR, Éric, Seuls tow, 2008

JUDOR, Eric, Platane, saison 1 : épisode 1, saison 2 : épisode 3, 2011


#heading(numbering: none)[
  Bibliographie
]


Ouvrages :

APATOW, Judd, Mes héros comiques, traduit de l'anglais par SOULAT

Pauline, Capricci, 2018

BADIOU, Alain, Cinéma « considérations sur l'état actuelle du cinéma »,
Paris, Novas, 2010

BALANDRAS, Laurent, WAKS, Fabienne, Coluche:Un mec libre, Textuel,
2006

BAZIN, André, Qu'est-ce que le cinéma ?, « Pour un cinéma impur », Paris,
Cerf, 2011

BERGSON, Henri, Le Rire, PUF, 2012

BONNOTTE, Stéphan, Louis De Funès jusqu'au bout du rire, Michel
Lafon, 2003

BRUCE, Lenny, Irrécupérable, Éditions Tristram, 2018

BURDEAU, Emmanuel, Judd Apatow – Comédie, mode d'emploi, Capricci,
2010

CAVELL, Stanley, A la recherche du bonheur:Hollywood et la comédie du
remariage, Paris, Vrin, 2017

CHABROL, Marguerite, De Broadway à Hollywood, Paris, CNRS édition,
2016

CHAPEAU, Vincent, Claude Zidi en toute discrétion, Hors Collection, 2019

DUFOUR, Eric, Dans la tête de Woody Allen, Armand Colin, 2017

DREUX, Emmanuel, Le Cinéma burlesque ou la subversion par le geste,
L'Harmattan, 2007

FIEVEE, Alexandre, Coluche agitateur social, Edition Grund, 2020

FRODON, Jean-Michel, Le Cinéma français de la nouvelle vague à nos
jours, Cahier du cinéma, 2010

GANZO, Fernando, GOLDBERG, Jacky, MEVEL, Quentin, La Nouvelle
comédie du cinéma français, Nouvelles Éditions JMP, 2017

GARDEL, Fabrice, Je reviens ! Vous êtes devenus trop cons : Jean Yanne
inédit, Seuil, 2016

JEANCOLAS, Jean-Pierre, Histoire du cinéma français, Armand Colin,
2005

JUDOR, Eric, CHAPUS, Jean-Vic, CERF, Arthur, ouvrage collectif, La
Comédie à la française, Marabout, 2019

KELLER, Florian, Comique extrémiste, Andy Kaufman et le rêve américain,
Capricci, 2012

LOMBARD, Philippe, Sous la casquette de Michel Audiard, DUNOD, 2020

MARTIN, Steve, Ma vie de comique, du stand-up au saturday night live,
Capricci , 2014

MONGIN, Olivier, Éclat de rire: variation sur le corps comique, SEUIL ,
2002

MONGIN, Olivier, De quoi rions nous ? La société et ses comique, Plon,
2006

MONGIN, Olivier, L'artiste et le politique, éloge de la scène dans la société
des écrans, Textuel, 2004

NACACHE, Jacqueline, L'acteur de cinéma, Paris, Nathan, coll.Cinéma,
2003

RANCIERE Jacques, La Fable cinématographique, SEUIL, Paris, 2001

TCHERNIA, Pierre, Cinéma comique français, Casterman, 1988

THOMPSON, Daniel, Gérard Oury, mon père l'as des as, La Martinière ,
2019

VAILLANT, Alain, La Civilisation du rire, CNRS EDITIONS, 2016

VAILLANT, Alain, LETOURNEUX, Matthieu, L'Empire du rire XIXe-XXIe
siècle, CNRS EDITIONS, 2021

Articles universitaires :

CANTINO, Simone, La stand up comedy e il parresiasta, 2016

DANG, Benjamin, « Le bouffon, un héraut du vide », Les chantiers de la
création, mis en ligne le 12/07/2021

GAERTNER, Julien, Tchao Pantin Immigration, bas-fonds et trahison, dans
Revue française de référence sur les dynamiques migratoires, n°1313,
01/01/2016

GOUDARD, Philippe,« Le clown, poète du désordre » dans Sens-Dessous,
2013, n°11

KREF, Steve, Lenny Bruce’s Influence in the Country of Charlie Hebdo,
2017

QUEMENEUR, Nelly, Performativité de l’humour : enjeux
méthodologiques et théoriques de l’analyse des sketches dans les talk
shows, 2009

SALLENAVE, Danièle de l’Académie française « Le bouffon », Le bloc
note de l'académie Française [En ligne], mis en ligne le 01/02/2018,
consulté le 10/05/2023)

STABARIN, Isabelle, La langue de Coluche, 2005

TINKER, Chris, Coluche and posthumous celebrity: competing and
consensual media discourses, 2019

Revues / Articles :

BONNEFOY, Nawal, « Eric et Ramzy au cinéma : un duo infernal pour le
meilleur et le pire », bfmtv.com, 10/02/2016

CEBE, Gilles,Cinématographe, n°72, novembre 1981, p.65

CORNAND, André, Image et son, n°367, décembre 1981, p.36

DELY, Renaud, Libération,entretien avec Olivier MONGIN, 19 juin 2006

GERVAIS, Ginette, , Jeune Cinéma, n°139, décembre 1981, p.43

JULY, Serge, « Coluche, bouffon de la république », Libération publié le
20/06/1996

MANDELBAUM, Jacques « "Seuls Two" : l'embardée poétique d'Éric et
Ramzy », Le Monde, 24 juin 2008

MOMIRON, Dominique, Médiapart, « Le maître d'école trente ans après.
Un film qui en dit encore long », 16 août 2010

ROPERT, Allexe, « Éric et Ramzy creusent le sillon d’un comique étrange
en univers raréfié, amorcé dans Steak », Les Inrockulltibles, 25 juin 2008

SICLIER, Jacques,Positif, janvier 1982, A.F. , p.85 Télérama, n°2369, juin
1995, « Coluche au milieu, le conformisme au feu », p.143

#heading(numbering: none)[
  Annexe
]

Recensement des films français d'humoriste par décennie

#figure(
  table(),
)

#figure(
  table(

  ),
)

#figure(
  table(

  ),
)

Recensement des premiers films d'humoristes au box-offce par décénnie

#figure(
  table(

  ),
)

#figure(
  table(

  ),
)

#figure(
  table(

  ),
)


#heading(numbering: none)[
  Remerciements
]

Je tiens à remercier toutes les personnes qui ont contribué au développement et la rédaction de ce mémoire.

Je voudrais dans un premier temps remercier, mon directeur de recherche M. DREUX Emmanuel, maître de conférences en études cinématographiques à l’université Paris 8, pour sa disponibilité et surtout ses judicieux conseils, qui ont contribué à alimenter ma réflexion.

Je remercie également toute l’équipe pédagogique et administrative de l’université Paris 8 pour avoir proposé des cours de grandes qualités.

Je souhaite aussi remercier M. VALDEYRON Guy pour avoir relu et corrigé mon mémoire. Ses conseils de rédaction ont été très précieux.

Enfin, je souhaite témoigner de ma gratitude envers les humoristes Mathilde ABASSI et Fred CHAM pour avoir consentie à répondre à toutes mes questions.

À tous ces intervenants, je présente mes remerciements, mon respect et ma gratitude.
