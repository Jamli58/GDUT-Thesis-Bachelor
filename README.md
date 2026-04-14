# 广东工业大学本科毕业设计（论文）LaTeX 模板

面向 GDUT 本科生的毕业设计（论文）LaTeX 模板，版式按
《广东工业大学毕业设计（论文）手册》（2025 年版）整理。

## 从这里开始

第一次使用时，按这个顺序改文件即可：

| 先改 | 文件 | 用途 |
| :-- | :-- | :-- |
| 1 | `student-info.tex` | 学号、姓名、题目、学院、专业、指导教师 |
| 2 | `frontmatter/abstract.tex` | 中文摘要、英文摘要、关键词 |
| 3 | `chapters/01-introduction.tex` | 第 1 章 绪论 |
| 4 | `chapters/02-main-content.tex` | 正文主体、方法、设计、实验等 |
| 5 | `chapters/03-conclusion.tex` | 结论与展望 |
| 6 | `backmatter/acknowledgements.tex` | 致谢 |
| 7 | `references/references.bib` | 参考文献数据库 |

一般不要改这些文件：

| 文件 | 用途 |
| :-- | :-- |
| `gdutthesis.cls` | 学校版式、标题、页边距、目录、页码等 |
| `mygdut.sty` | 代码、算法、表格等辅助设置 |
| `template/cover.tex` | 封面版式 |

`thesis.tex` 是总入口，用来决定论文装订顺序。需要新增章节时才需要改它。

## 编译

### 本地编译

安装 TeX Live 2020 及以上，然后在本目录运行：

```bash
make
```

常用命令：

```bash
make          # 生成 thesis.pdf
make view     # 编译并打开 PDF（macOS）
make clean    # 清理临时文件
```

不使用 Make 时也可以手动运行：

```bash
xelatex thesis
bibtex thesis
xelatex thesis
xelatex thesis
```

### Overleaf 编译

将整个文件夹上传到 Overleaf，并将编译器设为 **XeLaTeX**。

如果 Overleaf 没有 macOS 字体，请把 `thesis.tex` 第一行附近的

```tex
\documentclass[mac,twoside,cn]{gdutthesis}
```

改成：

```tex
\documentclass[otf,twoside,cn]{gdutthesis}
```

Windows 本地编译通常可用：

```tex
\documentclass[ttf,twoside,cn]{gdutthesis}
```

## 新增章节

例如要增加第 4 章：

1. 在 `chapters/` 里新建 `04-experiment.tex`。
2. 在文件开头写 `\chapter{实验与结果分析}`。
3. 在 `thesis.tex` 的正文部分加入：

```tex
\input{chapters/04-experiment}
```

建议文件名使用 `01-...`、`02-...` 这种编号，目录里会更容易排序。

## 插入图片和参考文献

图片放到 `figures/` 目录，在正文中这样引用：

```tex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.5\linewidth]{xiaohui.jpg}
\caption{示例图}
\label{fig:logo}
\end{figure}
```

参考文献写到 `references/references.bib`，正文中用：

```tex
\cite{example1}
```

## 外文译文装订册

外文参考文献译文与原文放在：

| 文件 | 用途 |
| :-- | :-- |
| `translation/translated-article.tex` | 外文参考文献译文 |
| `translation/original-article.tex` | 外文参考文献原文 |

编译外文译文装订册时，把 `thesis.tex` 中的 `cn` 改为 `en`：

```tex
\documentclass[mac,twoside,en]{gdutthesis}
```

编译完成后如需继续写中文主论文，再改回 `cn`。

## 目录结构

```text
.
├── thesis.tex                     总入口：控制装订顺序
├── student-info.tex               学生信息：题目、姓名、学院等
├── frontmatter/
│   └── abstract.tex               中英文摘要
├── chapters/
│   ├── 01-introduction.tex        绪论
│   ├── 02-main-content.tex        正文主体
│   └── 03-conclusion.tex          结论
├── backmatter/
│   ├── acknowledgements.tex       致谢
│   └── appendix-a.tex             附录
├── translation/
│   ├── translated-article.tex     外文译文
│   └── original-article.tex       外文原文
├── references/
│   └── references.bib             参考文献
├── figures/                       图片
├── template/                      模板内部文件
├── gdutthesis.cls                 学校论文版式
├── mygdut.sty                     常用宏包设置
└── Makefile                       编译脚本
```

## 版式核对

模板已按 2025 版手册调整：

- 页边距：上 30 mm、下 25 mm、内侧 30 mm、外侧 20 mm
- 正文：小四号宋体，1.5 倍行距
- 章标题：三号黑体加粗居中
- 节标题：小四号黑体加粗
- 中文摘要：“摘要”三号黑体加粗居中
- 英文摘要：“Abstract”三号 Times New Roman 加粗
- 关键词：3 到 5 个
- 图题：图下方；表题：表上方
- 页码：从绪论起连续编排，奇数页在页脚右侧，偶数页在页脚左侧
- 参考文献：GB/T 7714-2015 numerical 样式

定稿前请对照 `广东工业大学毕业设计（论文）手册.pdf` 的样张复核。

## 致谢

本模板在早期版本的基础上整理而成，原始版本参考了华南师范大学
潘伟洲同学的 SCNU 论文模板；参考文献使用 TeX Live 官方
`gbt7714` 宏包（GB/T 7714-2015 numerical 样式）。
