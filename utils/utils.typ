#let typ-link(src, body) = {
  let dst = src.slice("src/".len(), src.len() - ".typ".len()) + ".html"

  [ #metadata(src) <todo> ]
  link(dst, body)
}

#let header = align(center)[
  #table(
    columns: 4,
    column-gutter: 1em,
    link("src/index.typ")[*Home*],
    link("src/cv/cv_2025/main.typ")[*CV*],
    link("src/blog.typ")[*Blog*],
    link("src/teaching.typ")[*Teaching*],
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
