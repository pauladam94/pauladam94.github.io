#import "../../../utils/utils.typ": basic-page
#show: basic-page

#let cv(lang) = [

  #assert(
    lang == "en" or lang == "fr",
    message: "lang should be french(fr) or english(en)",
  )

  #set text(
    font: "New Computer Modern",
    size: 12pt,
  )

  #show: it => context {
    set page(
      margin: (left: 3em, right: 3em, top: 2em, bottom: 2em),
      header: {
        if lang == "en" {
          align(bottom + right)[English 🇬🇧]
        } else if lang == "fr" {
          align(bottom + right)[Français 🇫🇷]
        }
      },
    ) if target() == "paged"
    it
  }

  #set par(
    first-line-indent: 1em,
    justify: false,
    leading: 0.7em,
    spacing: 0.7em,
    // hanging-indent: -0.5em,
    linebreaks: auto,
    // spacing: 0.7em
  )

  #let get-txt(val) = {
    if str(lang) in val {
      return val.at(lang)
    } else {
      return val
    }
  }

  #let data = toml("main.toml")

  #let gen = data.General
  #block(
    width: 100%,
    grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      block(radius: 5%, box(
        stroke: 1pt + rgb(0, 0, 0),
        radius: 3pt,
        clip: true,
      )[#image(gen.picture, width: 130pt)]),
      align(center + horizon)[
        #text(1.5em)[*#upper(gen.name) #upper(gen.surname)*] \ \
        #gen.email \ \
        #gen.telephone
      ],
    ),
  )

  #let interests(values) = {
    set text(0.8em)
    for (title, value) in values [
      #if title == "title" { continue }
      - *#get-txt(value.title)* : #get-txt(value.content).map(x => [#x]).join(", ").
    ]
  }

  #let line_width = 1pt
  #let col_setup = (90pt, 1fr, 130pt)
  #let debug = 0pt

  #let stage(values) = {
    // set par(spacing: 0.9em, leading: 0.7em)
    for (title, value) in values [
      #if title == "title" { continue }

      #block(stroke: (left: 1pt), outset: (left: 1em))[
        #set par(justify: false)
        #grid(
          columns: col_setup, stroke: debug,
          align(left, stack(spacing: 0.6em, text(0.8em, value.place), text(
            0.8em,
            value.affiliation,
          ))),
          align(center + horizon, stack(
            spacing: 0.5em,
            underline[*#get-txt(value.title)*],
            [#get-txt(value.subtitle)],
          )),
          align(right, grid(
            columns: (1fr, 1fr),
            text(0.8em, get-txt(value.duree)), text(0.8em, get-txt(value.time)),
          ))
        )

        #set par(justify: true)
        #box(inset: (left: 1em, right: 1em), stroke: 0pt + green)[#h(
            1em,
          ) #get-txt(value.text)]
        // #text(0.9em, value.text)
      ]
      #v(0.5em)
    ]
  }

  #let etude(values) = {
    for (title, value) in values [
      #if title == "title" { continue }
      #block(stroke: (left: 1pt), outset: (left: 1em))[
        #set par(justify: false)

        #grid(
          columns: col_setup, stroke: debug,
          align(left, text(0.8em, value.place)),
          align(center + horizon, underline[*#get-txt(value.title)*]),
          align(right, stack(
            dir: ltr,
            spacing: 2em,
            text(0.8em, value.note),
            text(0.8em, value.time),
          ))
        )

        #set par(justify: true)
        #if value.cours == () { continue }
        #box(inset: (left: 0em, right: 0em), stroke: 0pt + green, text(0.9em)[
          #h(1em) *Cours* : #get-txt(value.cours).join(", ").
          #if "extra" in value { value.extra }
        ])
      ]
      #v(0.3em)
    ]
  }

  #for (part, values) in data {
    if part == "General" { continue }
    if part == "Etude" or part == "Interests" { v(1fr) }
    align(center, box(
      stroke: 0pt,
      width: 110%,
      grid(
        columns: 2,
        column-gutter: 0.3em,
        [*#get-txt(values.title)*],
        align(center + horizon, box(
          height: 1pt,
          radius: 3pt,
          width: 100%,
          fill: black,
        )),
      ),
    ))

    if part == "Interests" {
      interests(values)
    } else if part == "Stage" {
      stage(values)
    } else if part == "Etude" {
      etude(values)
    }
  }
]


#cv("fr")
#cv("en")
