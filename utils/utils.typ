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
  = *Paul ADAM*

  #align(center)[Etudiant au MPRI, master parisien de recherche informatique.]

  #table(
    columns: 4 * (1fr,),
    column-gutter: 1em,
    link("src/index.typ")[*Home*],
    link("src/cv/cv_2025/main.typ")[*CV*],
    link("src/blog.typ")[*Blog*],
    link("src/teaching.typ")[*Teaching*],
  )
]

#let basic-page(cont) = {
  show heading.where(depth: 1): set align(center)

  show align: it => {
    let alignment = if it.alignment.x == none {
      ""
    } else {
      str(repr(it.alignment.x))
    }
    let body = it.body

    // if alignment == "center" {
    //   return html.div(
    //     style: ```css
    //       display:flex;
    //       justify-content:center;
    //       /* align-items:center; */
    //       /* margin: auto;
    //       width: 60%;
    //       border: 3px solid #73AD21;
    //       padding: 10px; */
    //     ```.text,
    //     body,
    //   )
    // }
    // html.div(style: "text-align: " + alignment, body)
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
          margin: 0% 25% 0% 25%
        }
        table {
          /* border: 1px solid black; */
          /* width: 100%; */
        }
        table, th, td {
          /* border-collapse: collapse; */
          /* border-spacing: 2%; */
        }
        th, td {
          /* border: 1px solid black; */
          /* width: 100%, */
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
