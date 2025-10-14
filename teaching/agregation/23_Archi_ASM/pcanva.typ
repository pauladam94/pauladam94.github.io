#let pcanva = state("pcanva", ())
#let args = state("args", ())

#let ppt(..l) = {
  l.pos().map(elem => elem * 1pt)
}

#let pcanva_start() = {
  pcanva.update(())
  args.update(())
}

#let ppush(pos0, pos1) = {
  pcanva.update(a => {
    a.push((pos0, pos1))
    a
  })
}

#let ppush_args(d) = {
  args.update(a => {
    a.push(d)
    a
  })
}

///// LINE /////

#let pline(..args) = {
  ppush_args((
    type: "line",
    pos: args.pos(),
    args: args.named()
  ))
}

#let pline_size(start, end, stroke: 1pt) = context {
  let x0 = start.at(0).to-absolute() / 1pt
  let y0 = start.at(1).to-absolute() / 1pt
  let x1 = end.at(0).to-absolute() / 1pt
  let y1 = end.at(1).to-absolute() / 1pt
  ppush(
    (calc.min(x0, x1), calc.min(y0, y1)),
    (calc.max(x0, x1), calc.max(y0, y1))
  )
}

#let __pline(start, end, stroke: 1pt) = {
  place(line(start: start, end: end, stroke: stroke))
}

///// POLYGON /////

#let ppolygon(..args) = {
  ppush_args((
    type: "polygon",
    pos: args.pos(),
    args: args.named()
  ))
}

#let ppolygon_size(..points, fill: none, stroke: 1pt) = context {
  let points = points.pos().map(
    point => point.map(len => len.to-absolute() / 1pt)
  )
  for i in range(points.len() - 1) {
    ppush(points.at(i), points.at(i + 1))
  }
}

#let __ppolygon(..points, fill: none, stroke: 1pt) = {
  place(polygon(..points, fill: fill, stroke: stroke))
}

///// CIRCLE /////
#let pcircle(..args) = {
  ppush_args((
    type: "circle",
    pos: args.pos(),
    args: args.named()
  ))
}

#let pcircle_size(center, radius: 1em, stroke: 1pt) = context {
  let x0 = center.at(0).to-absolute() / 1pt
  let y0 = center.at(1).to-absolute() / 1pt
  let r = radius.to-absolute() / 1pt
  ppush((x0 - r, y0 - r), (x0 + r, y0 + r))
}

#let __pcircle(center, radius: 1em, stroke: 1pt) = {
  place(dx: center.at(0) - radius, dy: center.at(1) - radius, circle(radius: radius, stroke: stroke))
}

///// CONTENT /////

#let pcontent(..args) = {
  ppush_args((
    type: "content",
    pos: args.pos(),
    args: args.named()
  ))
}

#let pcontent_size(pos, content) = context {
  let size = measure(content)
  let posx = pos.at(0).to-absolute() / 1pt
  let posy = pos.at(1).to-absolute() / 1pt
  ppush(
    (posx - size.width / 2pt, posy - size.height / 2pt),
    (posx + size.width / 2pt, posy + size.height / 2pt),
  )
}

#let __pcontent(pos, content) = context {
  let size = measure(content)
  place(dx: pos.at(0) - size.width / 2, dy: pos.at(1) - size.height / 2, content)
}

///// RECT /////
//// TODO use the rect of Typst

#let prect(..args) = {
  ppush_args((
    type: "rect",
    pos: args.pos(),
    args: args.named()
  ))
}

#let prect_size(pos, size, ..args) = context {
  let posx = pos.at(0).to-absolute() / 1pt
  let posy = pos.at(1).to-absolute() / 1pt
  let sizex = size.at(0).to-absolute() / 1pt
  let sizey = size.at(1).to-absolute() / 1pt
  ppush(
    (posx, posy),
    (posx + sizex,posy + sizey)
  )
}

#let __prect(pos, size, ..args) = {
  let x = pos.at(0)
  let y = pos.at(1)
  let dx = size.at(0)
  let dy = size.at(1)
  place(dx: x, dy: y,
    box(
      width: dx,
      height: dy,
      fill: if "fill" in args.named() { args.named().fill } else { none },
      stroke: if "stroke" in args.named() { args.named().stroke
      } else { 1pt },
      if args.pos().len() >= 1 {
        align(center + horizon, [#args.pos().at(0)]) 
      } else { none }
    )
  )
  // pline((x, y)          , (x + dx, y), stroke: stroke)
  // pline((x + dx, y)     , (x + dx, y + dy), stroke: stroke)
  // pline((x + dx, y + dy), (x, y + dy), stroke: stroke)
  // pline((x, y + dy)     , (x, y), stroke: stroke)
    // pcontent((x + dx / 2, y + dy / 2), args.pos().at(0))
  // }
}


#let pcanva_end() = {

  context {
    for arg in args.get() {
      if arg.type == "line" {
        pline_size(..arg.pos, ..arg.args)
      } else if arg.type == "polygon" {
        ppolygon_size(..arg.pos, ..arg.args)
      } else if arg.type == "circle" {
        pcircle_size(..arg.pos, ..arg.args)
      } else if arg.type == "content" {
        pcontent_size(..arg.pos, ..arg.args)
      } else if arg.type == "rect" {
        // [ #arg.pos ]
        prect_size(..arg.pos, ..arg.args)
      }
    }
  }
  
  context {
    let pcanva = pcanva.get()
    if pcanva.len() == 0 { return }
    let xmin = pcanva.at(0).at(0).at(0)
    let ymin = pcanva.at(0).at(0).at(1)
    let xmax = pcanva.at(0).at(1).at(0)
    let ymax = pcanva.at(0).at(1).at(1)
  
    for ((x0, y0), (x1, y1)) in pcanva {
      xmin = calc.min(xmin, x0, x1)
      xmax = calc.max(xmax, x0, x1)
      ymin = calc.min(ymin, y0, y1)
      ymax = calc.max(ymax, y0, y1)
    }
    
    box(width: (xmax - xmin) * 1pt, height: (ymax - ymin) * 1pt, // stroke: 1pt + red, 
      place(dx: - xmin * 1pt, dy: -ymin * 1pt,
        for arg in args.get() {
          if arg.type == "line" {
            __pline(..arg.pos, ..arg.args)
          } else if arg.type == "polygon" {
            __ppolygon(..arg.pos, ..arg.args)
          } else if arg.type == "circle" {
            __pcircle(..arg.pos, ..arg.args)
          } else if arg.type == "content" {
            __pcontent(..arg.pos, ..arg.args)
          } else if arg.type == "rect" {
            __prect(..arg.pos, ..arg.args)
          }
        }
      )
    )
  }

}



///// CUSTOM /////


//// ARROW /////

#let parrow(start, end, from: 0, to: 1, stroke: 1pt, fill: none) = context {
  assert(start != end, message: "Empty Arrow")
  let startx = start.at(0).to-absolute() / 1pt
  let starty = start.at(1).to-absolute() / 1pt
  let endx = end.at(0).to-absolute() / 1pt
  let endy = end.at(1).to-absolute() / 1pt
  let thick = if type(stroke) == dictionary {
    if "thickness" in stroke { stroke.thickness } else { 1pt } 
  } else { 1pt }.to-absolute() / 1pt

  let a = (40pt + 3em).to-absolute()
  
  let dx = endx - startx
  let dy = endy - starty

  startx = startx + dx * from
  starty = starty + dy * from
  endx = endx - dx * (1 - to)
  endy = endy - dy * (1 - to)
  
  let len_arrow = if sqrt(dx * dx + dy * dy) < 40 { 0.1 } else { 0.04 }
  let width_arrow = len_arrow * 0.38

  let len = dx * dx + dy * dy
  let ndx = dx / len
  let ndy = dy / len

  pline(
    ppt(startx, starty),
    ppt(endx - dx * len_arrow, endy - dy * len_arrow),
    stroke: stroke
  )
  ppolygon(
    ppt(endx, endy),
    ppt(endx - dx * len_arrow - dy * width_arrow, endy - dy * len_arrow + dx * width_arrow),
    ppt(endx - dx * len_arrow + dy * width_arrow, endy - dy * len_arrow - dx * width_arrow),
    fill: fill, stroke: stroke
  )
}

#let tree_height(tree) = {
  let val = -1
  if type(tree) == array {
    if tree.len() >= 2 {
      val = calc.max(val, 1 + tree_height(tree.at(1))) // enfant gauche
    }
    if tree.len() >= 3 {
      val = calc.max(val, 1 + tree_height(tree.at(2))) // enfant droit
    }
  } else if type(tree) == content {
    return 0
  }
  return val
}

//// TREE /////

#let ptree(tree, radius: 1em, hratio: 2.5, wratio: 1.5, pos: (0pt, 0pt), stroke: 1pt) = {
  let h = tree_height(tree)
  if type(tree) == array {
    if tree.len() >= 1 {
      ptree(tree.at(0), pos: pos, radius: radius, stroke: stroke)
    }
    let from = 1 / calc.sqrt(wratio * wratio * h * h + hratio * hratio)
    let to = 1 - from
    if tree.len() >= 2 {
      // enfant gauche
      let posg = (
          pos.at(0) - radius * wratio * h,
          pos.at(1) + radius * hratio
        )
      parrow(pos, posg, from: from, to: to, stroke: stroke)
      ptree(tree.at(1), pos: posg,
        hratio: hratio, wratio: wratio,  radius: radius, stroke: stroke)
    }
    if tree.len() >= 3 {
      // enfant droit
      let posd = (
        pos.at(0) + radius * wratio * h,
        pos.at(1) + radius * hratio
      )
      parrow(pos, posd, from: from, to: to, stroke: stroke)
      ptree(tree.at(2), pos: posd,
        hratio: hratio, wratio: wratio, radius: radius,  stroke: stroke) 
    }
  } else if type(tree) == content {
    pcircle(pos, radius: radius, stroke: stroke)
    pcontent(pos, tree)
  } else {
    assert(false, message: "Leaf of the tree should be content")
  }
}


/*
#let prect(pos, size, stroke: 0.08em, ..args) = {
  let x = pos.at(0)
  let y = pos.at(1)
  let dx = size.at(0)
  let dy = size.at(1)
  pline((x, y)          , (x + dx, y), stroke: stroke)
  pline((x + dx, y)     , (x + dx, y + dy), stroke: stroke)
  pline((x + dx, y + dy), (x, y + dy), stroke: stroke)
  pline((x, y + dy)     , (x, y), stroke: stroke)
  if args.pos().len() >= 1 {
    pcontent((x + dx / 2, y + dy / 2), args.pos().at(0))
  }
}
*/






























/// TEST ///

Hey some test
#let canva = { pcanva_start()

pline((3em, 1em), (12em, 4em), stroke: 1pt)
pcircle((1pt, 2em))
pcontent((1pt, 2em), [hey])
parrow((3em, 1em), (8em, 2em), stroke: 0.8pt + black, fill: white)
parrow((1em, 1em), (9em, 2em), stroke: 0.8pt + black, fill: black)
parrow((0em, 6em), (4em, 4em), stroke: 1pt + black, fill : none)

for i in range(1, 12) {
  parrow((1em * i, 0em), (1em * i, 1em * i), stroke: green)
}
pcanva_end() }


Hey but why ?#canva


#{ pcanva_start()
for i in range(1, 20) {
  parrow((0.5em * i, 0em), (0.6em * i, 0.5em * i), stroke: green)
}

pcanva_end() }

#grid(columns:(1fr, 1fr), stroke: 1pt,
[wait what the fuck bro ?],
align(center + horizon)[ Hey #lorem(100) #{ pcanva_start()
pline((1pt, 2pt), (4em, 12pt))
parrow((2em, 3em), (2em, 1em))
pcanva_end() } ])

#set text(3em)
#align(center, { pcanva_start()
let tree = ([A],  ([B], [C], [D]), ([E], [F], [Test]))

ptree(tree, stroke: 0.08em)

pcanva_end() })

Test Stack

#pcanva_start()

#set text(36pt)
#parrow((1em, 1em), (2em, 2em), stroke: 1pt)

#set text(20pt)
#parrow((3em, 1em), (12em, 7em), stroke: 2pt)

#pcanva_end()

Hey Wow everything works
#{ pcanva_start()
pcontent((0em, 1em), [Hey])

pcanva_end() }




#{ pcanva_start()
let tbl = (1, 2, 3)
for i in range(tbl.len()) {
  prect((1em, 1em), (1em * i, 1em))
}

pcanva_end() }



#{ pcanva_start()

prect((7em, 2em), (2em, 2em), fill: red)[Hey]

prect((0em, 2em), (5em, 2em))[Hey]

pcanva_end() }