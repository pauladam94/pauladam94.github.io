#let relative-path(html-path, current-file-path) = {
  
  let current-depth = current-file-path.split("/").len() - 1

  return "../" *  current-depth + "docs/" + html-path
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
  = *Paul* J. R. *ADAM*

  #table(
    columns: 4 * (1fr, ),
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

    html.elem("div", attrs: (style: "text-align: " + alignment), body)
  }

  show grid: it => {
    // list(..(it.children.map(cl => cl.body)))
    it.children.map(cl => cl.body).join("\n") // map(html.elem("div", c))
  }
  show stack: it => {
    // list(..it.children)
    it.children.join("\n") // map(c => html.elem("div", c))
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

  header

  cont
}
