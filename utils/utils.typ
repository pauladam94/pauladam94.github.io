#let relative-path(html-path, current-file-path) = {
  let current-depth = calc.max(0, current-file-path.split("/").len() - 2)

  return "../" * current-depth + html-path
}

#let typ-link(typ-path, body) = {
  let html-path = (
    typ-path.slice("src/".len(), typ-path.len() - ".typ".len()) + ".html"
  )

  [ #metadata(typ-path) <todo> ]

  let current-file-path = sys.inputs.path
  link(relative-path(html-path, current-file-path), body)
}

#let header = align(center)[
  #title[Paul ADAM]

  #align(center)[Etudiant au MPRI (master parisien de recherche informatique).]

  #table(
    columns: 4 * (1fr,),
    column-gutter: 1em,
    link("src/index.typ")[*Home*],
    link("src/cv/cv_2025/main.typ")[*CV*],
    link("src/blog.typ")[*Blog*],
    link("src/teaching.typ")[*Teaching*],
    // link("src/hobbies.typ")[*Hobbies*]
  )
]

#let basic-page(cont) = {
  show align: it => {
    let alignment = if it.alignment.x == none {
      ""
    } else {
      str(repr(it.alignment.x))
    }
    let body = it.body

    body
  }

  show grid: it => {
    // it.children.map(cl => cl.body).join("\n")

    let contents = it.children.map(cl => cl.body)
    table(columns: it.columns, ..contents)
  }
  show stack: it => {
    // it.children.join("\n")

    let contents = it.children
    let columns = if it.dir == ltr or it.dir == rtl {
      contents.len()
    } else { 1 }
    table(columns: columns, ..contents)
  }
  show h: it => {}
  show v: it => {}

  show link: it => {
    let dest = it.dest
    let body = it.body
    if dest.slice(dest.len() - ".typ".len(), dest.len()) == ".typ" {
      typ-link(dest, body)
    } else { it }
  }

  html.html(
    html.head(
      html.style(
        ```css
        body {
          margin: 0% max(2vw, calc(30vw - 200px)) 0% max(2vw, calc(30vw - 200px));
        }
        table {
        }
        table, th, td {
        }
        th, td {
          padding: 10px;
        }
        ```.text,
      ),
    )
      + html.body(
        header + cont,
      ),
  )
}
