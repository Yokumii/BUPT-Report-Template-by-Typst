#import "../utils/style.typ": zihao

#let outline-page(
  doctype: "report",
  twoside: false,
  info: (:),
) = {
  set text(stretch: 100%)

  show outline.entry.where(level: 1): set text(
    weight: "bold",
    size: zihao.xiaosi,
  )
  show outline.entry.where(level: 2): set text(size: zihao.xiaosi)
  show outline.entry.where(level: 3): set text(size: zihao.xiaosi)
  show outline.entry.where(level: 1): set block(above: 1.75em, below: 1.5em)
  show outline.entry.where(level: 2): set block(above: 1.25em)
  show outline.entry.where(level: 3): set block(above: 1.25em)

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    if it.element.supplement == [附录] {
      it.indented(it.prefix(), it.inner())
    } else {
      it.indented(it.prefix(), it.inner())
    },
  )

  context outline(
    title: [目#h(1em)录],
    target: selector(heading).after(here()),
    indent: 2em,
    depth: 3,
  )

  pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )
}
