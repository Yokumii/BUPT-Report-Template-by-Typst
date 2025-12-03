#import "../utils/style.typ": zihao, ziti
#import "../utils/distr.typ": distr
#import "../utils/datetime-display.typ": datetime-display

#import "../utils/style.typ": zihao, ziti
#import "../utils/distr.typ": distr
#import "../utils/datetime-display.typ": datetime-display

#let cover-page(
  date: datetime.today(),
  doctype: "master",
  twoside: false,
  anonymous: false,
  info: (:),
) = {
  // ======================
  // 报告模式：BUPT 课程作业报告封面
  // ======================
  if doctype == "report" {
    let course_name = info.at("course_name", default: info.title)
    let experiment_name = info.at("experiment_name", default: info.title)

    // 顶部校名图片
    align(
      center,
      image(
        "../assets/bupt-name.png",
        width: 10cm,
      ),
    )

    // 《课程名称》
    align(
      center,
      text(font: ziti.songti, size: zihao.yihao, weight: "bold")[《#course_name》],
    )


    // “课程作业报告”
    align(
      center,
      text(font: ziti.heiti, size: zihao.yihao, weight: "bold")[课程作业报告],
    )

    v(0.5cm)

    // 中间校徽（圆形）——用现有 bupt-logo
    align(
      center,
      image(
        "../assets/bupt-logo.png",
        width: 4cm,
      ),
    )

    v(0.5cm)

    // 实验名称行（优先使用 experiment_name）
    align(
      center,
      text(font: ziti.heiti, size: zihao.sanhao, weight: "bold")[#experiment_name],
    )

    v(0.5cm)

    // 下方信息表：姓名 / 学院 / 专业 / 班级 / 学号 / 指导教师
    let info-key(zh) = distr(width: 5em, zh)
    let info-value(zh) = (
      text(
        zh,
        font: ziti.songti,
        size: zihao.sihao,
      )
    )

    set text(font: ziti.heiti, size: zihao.sihao)
    table(
      stroke: none,
      align: (x, y) => (if x >= 1 { left } else { right }),
      columns: (46%, 1%, 53%),
      inset: (right: 0em),
      column-gutter: (-0.3em, 1em),
      row-gutter: 0.7em,

      [#info-key("姓名")],
      [#text(weight: "bold")[：]],
      [#if anonymous {} else { info-value(info.name) }],

      [#info-key("学院")],
      [#text(weight: "bold")[：]],
      [#info-value(info.school)],

      [#info-key("专业")],
      [#text(weight: "bold")[：]],
      [#info-value(info.major)],

      [#info-key("班级")],
      [#text(weight: "bold")[：]],
      [#info-value(info.class)],

      [#info-key("学号")],
      [#text(weight: "bold")[：]],
      [#if anonymous {} else { info-value(info.student_id) }],

      [#info-key("指导教师")],
      [#text(weight: "bold")[：]],
      [#if anonymous {} else { info-value(info.supervisor) }],
    )

    v(0.5cm)

    align(
      center,
      text(font: ziti.songti, size: zihao.sihao, weight: "bold")[#datetime-display(date)],
    )

  } else {
    // ======================
    // 非 report：保留原 SJTU 封面
    // ======================
    align(
      center,
      image(
        "../assets/sjtu-logo.png",
        width: 3cm,
      ),
    )

    let cover-title = if doctype == "doctor" {
      "上海交通大学博士学位论文"
    } else {
      "上海交通大学硕士学位论文"
    }

    align(
      center,
      text(font: ziti.songti, size: zihao.xiaoer)[#cover-title],
    )

    v(3.6cm)

    align(
      center,
      text(font: ziti.songti, size: zihao.erhao, weight: "bold")[#info.title],
    )

    v(1fr)

    let info-key(zh) = distr(width: 5em, zh)
    let info-value(zh) = (
      text(
        zh,
        font: ziti.songti,
        size: zihao.sihao,
      )
    )

    set text(font: ziti.heiti, size: zihao.sihao)
    table(
      stroke: none,
      align: (x, y) => (if x >= 1 { left } else { right }),
      columns: (46%, 1%, 53%),
      inset: (right: 0em),
      column-gutter: (-0.3em, 1em),
      row-gutter: 0.7em,
      [#info-key("姓名")], [#text(weight: "bold")[：]], [#if anonymous {} else { info-value(info.name) }],
      [#info-key("学号")], [#text(weight: "bold")[：]], [#if anonymous {} else { info-value(info.student_id) }],
      [#info-key("导师")], [#text(weight: "bold")[：]], [#if anonymous {} else { info-value(info.supervisor) }],
      [#info-key("院系")], [#text(weight: "bold")[：]], [#info-value(info.school)],
      [#info-key([学科/#h(0.1em)专业])], [#text(weight: "bold")[：]], [#info-value(info.major)],
      [#info-key("申请学位")], [#text(weight: "bold")[：]], [#info-value(info.degree)],
    )

    linebreak()

    align(
      center,
      text(font: ziti.songti, size: zihao.sihao, weight: "bold")[#datetime-display(date)],
    )
  }

  v(0.2cm)
  pagebreak(weak: true, to: if twoside { "odd" })
}
