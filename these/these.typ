#import "../utils/utils.typ": *
#show: basic-page.with(include-pdf: true)

#import "@preview/numbly:0.1.0": numbly
#set heading(numbering: numbly(
  "{1:I}.", // use {level:format} to specify the format
  "{2:A}.", // if format is not specified, arabic numbers will be used
  "{3:1}.", // here, we only want the 3rd level
))
#show title: set align(center)
#show link: underline.with(stroke: blue)

#set text(
  size: 12pt,
  font: "New Computer Modern",
  lang: "fr",
)
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
#show heading.where(level: 1): it => {
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

#title[Thèse SmolPhone - Paul ADAM]

= Stage M2 : rendering web sur le smolphone

== LibWebsocket
- Base de travail : #link("https://github.com/warmcat/libwebsockets")[lib_web_socket] et particulièrement sa partie #link("https://github.com/warmcat/libwebsockets/blob/main/READMEs/README.html-parser.md")[rendering web].

== Potentiel Stack Rust
- #link("https://github.com/smoltcp-rs/smoltcp")[smoltcp] client tcp en rust.
- #link("https://crates.io/crates/no-std-net")[
    no-std-net crate
  ]
- #link("https://crates.io/crates/embedded-nal")[
    embedded nal
  ]

= Idée De projet de Thèse

== SmoLang : light weight graphical programming language

Contraintes :
- should be able to write graphical applications for the smolphone
- should be "easy" to use
- the whole toolchain should be able to live on the smolphone except maybe the compiler/interpreter that cannot be compiled on the smolphone
- the language will not be able to bootstrap it self (feature to avoid bloat), the point is not to invent the next "C" for everyone to write compilers/interpreters of anything.
- the design is not meant to be "modular" but simple in its core

= Bibliographie

- #link("https://notes.inria.fr/s/82bNkf2cgf")[
    Sujet Smolphone Stage de Master 2
  ]
- #link("https://md.picasoft.net/is03-projets-2025a-attention")[
    Projet L1 - Génie Log - Lien avec le smol phone
  ]

== Ancien Personne sur le Projet

- Aurèle (Promo -1 ENS Rennes)
- Alois Rautureau

== Articles

- #link("https://inria.hal.science/hal-04156447")[
    Smolphone : a smartphone with energy limits,
    IGSC conference, 2023.
  ]

== Livres

- "la cathédrale et le bazar" de E. Raymond
- #link(
    "https://discord.com/channels/@me/1019330096244469812/1397665517770248371",
  )[Le capital que je ne suis pas ! Anne Alombert et Gaël Giraud]
- #link(
    "https://www.editionsdivergences.com/livre/heritage-et-fermeture",
  )[Heritage et Fermture]
- #link("https://twobits.net/")[
    Two Bits : The cultural significance of free Software
  ]
- #link("https://www.numilog.com/1743367/penser-avec-bernard-stiegler.ebook")[
    Penser avec Bernard Stieglerhttps://github.com/rust-embedded/awesome-embedded-rust
  ]

== Videos

- #link("https://www.youtube.com/watch?v=_Ex-yP5Eg7Q&t=4722s")[
    Se Préparer aux crises de demain - Arthur Keller
  ]
- #link("https://www.youtube.com/watch?v=NO5QreYlXtE ")[
    Faire avec moins
  ]
- #link("https://institut.design/conference-noesya-numerique-post-croissance/")[
    Conférence Post Croissance avec Noesya
  ]
- #link("https://www.youtube.com/watch?v=NclcQcNcLI4")[
    Are we embedded yet - Implementing tiny HTTP server on a microcontroller using Rust with Maor Malka
  ]
- #link("https://www.youtube.com/watch?v=kh24SgUIid4")[
    Rust embedded - Leon Vak
  ]

== Repo Code
- #link("https://github.com/rust-embedded/awesome-embedded-rust")[
    awesome embedded rust
  ]

== Language de Programmation
- #link("https://beyondloom.com/decker/lil.html")[
    lil
  ]
- #link("https://fr.wikipedia.org/wiki/Lustre_(langage)")[Lustre Lang]
- #link("https://en.wikipedia.org/wiki/Microsoft_Access")[Microsoft Access]

== Interessants

- #link("https://www.datagubbe.se/futui/")[
    Past and Present Futures of User Interface Design
  ]
- #link("https://en.wikipedia.org/wiki/Oulipo")[
    OuLiPp - mouvement surréaliste
  ]
- #link("https://wiki.xxiivv.com/site/discourse.html")[
    Humans are only fully self-conscious when arguins with one another
  ]
- #link("https://en.wikipedia.org/wiki/Post-growth")[
    Post Growth
  ]

- Action Research (Wikipedia)

- #link("https://en.wikipedia.org/wiki/Ivan_Illich#Tools_for_Conviviality")[
    Tools for Conviviality
  ]

- #link(
    "https://people.irisa.fr/Martin.Quinson/blog/250528/Smolphone-Magellan/",
  )[
    Blog Smolphone Quinson
  ]

- #link("https://jrcpl.us/contrib/2025/Scrappy")[
    Scrappy
  ]

Slide : EInk display consomme plus que LCD ?

- #link("https://people.irisa.fr/Martin.Quinson/blog/241011/Smolphone-EcoICT/")[
    Smolphone at Beg Meil
  ]
- #link(
    "https://people.irisa.fr/Martin.Quinson/blog/240215/Smolphone-Grenoble/",
  )[
    Smolphone at Grenoble
  ]

- FORTH language


== Alternative "Similaire"

- #link("https://wiki.xxiivv.com/site/playdate.html")[
    Play Date
  ]
- #link("https://www.thelightphone.com/")[Light Phone]
- #link("https://lilygo.cc/products/t-deck-plus-1")[T Deck]
- #link("https://lilygo.cc/products/t5-e-paper-s3-pro")[T5 E-paper]




== Financements

1. Demande de CDSN ENS Rennes
2. ...autre si pas CDSN

== Questions

=== SmolPhone

- En quoi c'est de la recherche ?
  - action research
  - écriture de logiciel qui n'existe tout simplement pas
- Combien d'ingénieurs travaillent sur le projet ? Que font ils ? Que font ils de différents que moi quand je vais programmer ?
- Tous les projets sont en Rust ? C'est le choix qui a été fait pour de l'embarqué ?
- Ca veut dire quoi "legacy apps" pour Quinson ?
- C'est quoi l'état actuel du smolphone ? On peut écrire du Rust et ça run dessus ? C'est quoi la platforme cible ?

=== Administratif

- Quand on doit écrire le sujet de Thèse ? On demande que les CDSN ou bien on parallélise pour être sur ?
- Anne Cécile Orgerie sera mon autre encadrante ou pas ?


