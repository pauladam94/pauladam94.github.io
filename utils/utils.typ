#let relative-path(path, current-file-path) = {
  let current-depth = calc.max(0, current-file-path.split("/").len() - 1)

  return "../" * current-depth + path
}

#let typ-link(typ-path, body) = {
  let html-path = (
    typ-path.slice(0, typ-path.len() - ".typ".len()) + ".html"
  )

  [ #metadata(typ-path) <todo-html> ]

  let current-file-path = sys.inputs.path
  link(relative-path(html-path, current-file-path), body)
}

#let pdf-show-link(typ-path, cont, page: 1) = {
  if sys.inputs.in_query == "true" {
    [ #metadata(typ-path) <todo-pdf> ]
    cont
  } else {
    let current-file-path = sys.inputs.path
    let pdf-path = (
      typ-path.slice(0, typ-path.len() - ".typ".len()) + ".pdf"
    )
    link(relative-path(pdf-path, current-file-path), [
      #cont :

      #image(
        "../docs/" + typ-path.slice(0, typ-path.len() - ".typ".len()) + ".pdf",
        height: 400pt,
        page: page,
      )
    ])
  }
}

#let pdf-version = {
  let current-file-path = sys.inputs.path
  let pdf-path = (
    current-file-path.slice(0, current-file-path.len() - ".typ".len()) + ".pdf"
  )
  [ #metadata(current-file-path) <todo-pdf> ]
  link(relative-path(pdf-path, current-file-path), html.span(
    title: "PDF version of this HTML page.",
    image(
      "../utils/pdf_download.png",
      height: 3em,
    ),
  ))
}

#let header(include-header, include-pdf) = {
  if not include-header {
    if include-pdf {
      return align(top + left, pdf-version)
    }
    return
  }
  align(center)[
    #if "lang" in sys.inputs {
      str(sys.inputs.lang)
    }

    #if include-pdf {
      table(
        columns: 2 * (20fr, 1fr),
        title[Paul ADAM], pdf-version,
      )
    } else [
      #title[Paul ADAM]
    ]

    #align(
      center,
    )[Etudiant au MPRI (master parisien de recherche informatique).]

    #table(
      columns: 5 * (1fr,),
      column-gutter: 1em,
      link("index.typ")[*Home*],
      link("cv/cv_2025/main.typ")[*CV*],
      link("blog/blog.typ")[*Blog*],
      link("teaching/teaching.typ")[*Teaching*],
      link("these/these.typ")[*Thèse*],
    )
  ]
}

#let basic-page(include-header: true, include-pdf: false, cont) = context {
  if target() == "paged" { return cont }

  show math.equation: html.frame
  show align: it => {
    let alignment = if it.alignment.x == none {
      ""
    } else {
      str(repr(it.alignment.x))
    }
    let body = it.body

    body
  }

  show footnote: it => {
    html.span(title: str(repr(it.body)), super[\*])
  }
  show grid: it => {
    let contents = it.children.map(cl => cl.body)
    table(columns: it.columns, ..contents)
  }
  show stack: it => {
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
        header(include-header, include-pdf) + cont,
      ),
  )
}

