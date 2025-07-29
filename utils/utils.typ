#let basic-page(c) = {
  set align(center)
  c

  show link : it => {
    if it.slice(it.len() - ".typ".len(), it.len()) {
    } else {
    }
  }
}

#let outside-link(src, body) = {
  let dst = src.slice("src/".len(), src.len() - ".typ".len()) + ".html"

  [ #metadata(src) <todo> ]
  link(dst)
}
