# 北京邮电大学课程作业报告 BUPT-Report-Template-by-Typst

这是北京邮电大学课程作业报告的 [Typst 模板](https://typst.app/universe/package/bupt-report-template)，基于 [modern-sjtu-thesis](https://github.com/tzhtaylor/modern-sjtu-thesis) 修改而来。它能够简洁、快速、持续生成 PDF 格式的课程报告，支持报告类型（`doctype: "report"`）的撰写。

## 使用

### VS Code 本地编辑（推荐）

1. 在 VS Code 中安装 [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 插件，负责语法高亮、错误检查和 PDF 预览。

2. 克隆本仓库到本地：
   ```bash
   git clone https://github.com/yokumi/BUPT-Report-Template-by-Typst.git
   ```

3. 用 VS Code 打开目录，打开 `template/thesis.typ` 文件，按下 `Ctrl + K V`(Windows) / `Command + K V`(MacOS) 或者是点击右上角的按钮进行实时编辑和预览。

### Web APP

Typst 提供了官方的 Web App，支持像 Overleaf 一样在线编辑。

1. 访问 [Typst Web App](https://typst.app/)
2. 创建新项目，上传本模板的所有文件
3. 打开 `template/thesis.typ` 开始编辑

> **注意**：如果使用 Web App，你需要手动上传 `fonts` 文件夹到项目中，否则会**导致字体显示错误**！

## Typst 快速入门

推荐这篇「[面向 Word 用户的快速入门向导](https://typst-doc-cn.github.io/guide/word.html)」，虽然标题写的是面向 Word 用户，但适合所有对于排版或者样式定制有一定的需求的人快速上手 Typst，并且开始使用 Typst 的排版功能。

## 功能列表

- **报告类型配置**
  - 支持 `doctype: "report"` 报告类型
  - 自动生成 BUPT 风格的封面（包含课程名称、实验名称、学生信息等）
  - 自动生成目录页
  - 支持参考文献

- **报告结构**
  - 中文封面（包含校名、课程名、实验名、学生信息）
  - 目录页
  - 正文内容
  - 参考文献
  - 附录（可选）

- **环境支持**
  - 插图环境 `imagex`
    - 子图 `subimagex`
    - 双语图题
  - 表格环境 `tablex`
    - 续表
    - 脚注
  - 算法环境 `algox`：跨页自动续
  - 定理环境：使用 `theorion` 包

- **其他功能**
  - 正文字数统计
  - 自定义参考文献格式
  - 多行公式编号

## 配置说明

在 `template/thesis.typ` 文件中，你可以配置以下信息：

```typst
) = documentclass(
  doctype: "report", // 文档类型，报告模式使用 "report"
  date: datetime.today(),
  twoside: false,
  print: false,
  anonymous: false,
  info: (
    course_name: "课程名称",
    experiment_name: "实验名称",
    student_id: "520XXXXXXXX",
    name: "张三",
    name_en: "Zhang San",
    class: "某某班级",
    degree: "课程报告",
    supervisor: "李四教授",
    supervisor_en: "Prof. Li Si",
    title: "课程名称",
    title_en: "DISSERTATION TEMPLATE FOR MASTER DEGREE OF ENGINEERING IN SHANGHAI JIAO TONG UNIVERSITY",
    school: "某某学院",
    school_en: "School of XXXXXXX",
    major: "某某专业",
  ),
)
```

## Q&A

### 我不会 LaTeX，可以用这个模板写报告吗？

可以。

如果你不关注模板的具体实现原理，你可以用 Markdown Like 的语法进行编写，只需要按照模板的结构编写即可。

### 我不会编程，可以用这个模板写报告吗？

同样可以。

如果仅仅是当成是入门一款类似于 Markdown 的语言，相信使用该模板的体验会比使用 Word 编写更好。

### 为什么只有一个 thesis.typ 文件，没有按章节分多个文件？

因为 Typst **语法足够简洁**、**编译速度足够快**、并且 **拥有光标点击处双向跳转功能**。

语法简洁的好处是，即使把所有内容都写在同一个文件，你也可以很简单地分辨出各个部分的内容。

编译速度足够快的好处是，你不再需要像 LaTeX 一样，将内容分散在几个文件，并通过注释的方式提高编译速度。

光标点击处双向跳转功能，使得你可以直接拖动预览窗口到你想要的位置，然后用鼠标点击即可到达对应源码所在位置。

还有一个好处是，单个源文件便于同步和分享。

### 为什么 Typst 有很多关于字体的警告？

你会发现 Typst 有许多关于字体的警告，这是因为模板为了保证在各个系统的可用性，加入了各个系统的字体集，你可以无视警告，或者克隆本仓库后在 `utils/style.typ` 中删除系统中不存在的字体。

### 学习 Typst 需要多久？

一般而言，仅仅进行简单的编写，不关注布局的话，你可以打开模板就开始写了。

如果你想进一步学习 Typst 的语法，例如如何排篇布局，如何设置页脚页眉等，一般只需要几个小时就能学会。

如果你还想学习 Typst 的「[参考](https://typst-doc-cn.github.io/docs/reference/foundations/)」部分，进而能够编写自己的模板，一般而言需要几天的时间阅读文档，以及他人编写的模板代码。

如果你有 Python 或 JavaScript 等脚本语言的编写经验，了解过函数式编程、宏、样式、组件化开发等概念，入门速度会快很多。

### 目前 Typst 有哪些第三方包和模板？

可以查看 [Typst Universe](https://typst.app/universe)。

个人推荐的包：

- 基础绘图：[cetz](https://typst.app/universe/package/cetz)
- 绘制带有节点和箭头的图表，如流程图等：[fletcher](https://typst.app/universe/package/fletcher)
- 绘制数据图：[lilaq](https://typst.app/universe/package/lilaq)
- 定理环境：[theorion](https://typst.app/universe/package/theorion)
- 伪代码：[lovelace](https://typst.app/universe/package/lovelace)
- 带行号的代码显示包：[codly](https://typst.app/universe/package/codly)
- 简洁的 Numbering 包：[numbly](https://typst.app/universe/package/numbly)
- 幻灯片和演示文档：[touying](https://typst.app/universe/package/touying)
- 相对定位布局包：[pinit](https://typst.app/universe/package/pinit)
- 数学单位包：[unify](https://typst.app/universe/package/unify)
- 数字格式化包：[zero](https://typst.app/universe/package/zero)

在模板文件中我也展示了一些第三方包的用法。

## 致谢

- 感谢 [@tzhtaylor](https://github.com/tzhtaylor) 开发的 [modern-sjtu-thesis](https://github.com/tzhtaylor/modern-sjtu-thesis) 模板，本模板基于其修改而来。
- 感谢 [Typst 中文社区导航 FAQ](https://typst-doc-cn.github.io/guide/FAQ.html)，帮忙解决了各种疑难杂症。

## License

This project is licensed under the MIT License.

It also includes third-party components licensed under other open source licenses,
including the Apache License 2.0 and MIT License.

See the `third_party/` directory for details on third-party components and their licenses.
