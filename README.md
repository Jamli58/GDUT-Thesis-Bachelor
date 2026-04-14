# 广东工业大学本科毕业设计（论文）LaTeX 模板

面向 GDUT 本科生的毕业设计（论文）LaTeX 模板，版式按
《广东工业大学毕业设计（论文）手册》（2025 年版）调整。

## 快速开始

### 1. 准备环境

选择任意一种：

- **本地编译**：安装 [TeX Live](https://tug.org/texlive/) 2020 及以上，
  使用 `xelatex` 引擎。
- **在线编译**：直接将本目录上传至 [Overleaf](https://www.overleaf.com/)，
  将编译器设为 **XeLaTeX**。

### 2. 填写论文信息

按顺序修改以下文件：

| 文件 | 作用 |
| :-- | :-- |
| `data/cover.tex` | 封面信息（学号、姓名、学院、专业等） |
| `data/abstract.tex` | 中英文摘要与关键词 |
| `data/chap01.tex` | 第 1 章 绪论 |
| `data/chap02.tex` | 第 2 章 正文主体 |
| `data/chap03.tex` | 第 3 章 结论 |
| `data/ack.tex` | 致谢 |
| `data/appendix01.tex` | 附录 |
| `ref/refs.bib` | 参考文献（BibTeX，遵循 GB/T 7714-2015） |

如需更多章节，新建 `data/chapNN.tex` 并在 `thesis.tex` 中 `\input{...}`。

### 3. 编译

```bash
make          # 生成 thesis.pdf
make view     # 编译并打开 PDF（macOS）
make clean    # 清理临时文件
```

不使用 Make 时也可以手动：

```bash
xelatex thesis
bibtex  thesis
xelatex thesis
xelatex thesis
```

### 4. 外文译文装订册

另行编译外文参考文献译文/原文装订册：将 `thesis.tex` 首行的
`cn` 改为 `en`，然后重新编译即可。译文与原文内容分别放在
`data/translation.tex`、`data/original.tex`。

## 目录结构

```text
.
├── thesis.tex                 主文件（装订顺序）
├── gdutthesis.cls             文档类（版式、字号、标题、目录…）
├── mygdut.sty                 附加宏包（代码块、算法环境）
├── Makefile                   编译脚本
├── data/                      各章节源文件
├── ref/                       BibTeX 数据库
├── figures/                   插图（含校徽 xiaohui.jpg、校名 mingchen.jpg）
└── 广东工业大学毕业设计（论文）手册.pdf  官方手册（查阅用）
```

## 版式核对

模板已按 2025 版手册调整：

- 页边距 上 30 mm、下 25 mm、左 30 mm、右 20 mm
- 正文 小四号宋体，1.5 倍行距
- 章标题 三号黑体加粗居中；节标题 小四号黑体加粗；条标题 小四号黑体
- 中文摘要“摘要”三号黑体加粗居中；英文“Abstract”三号 Times New Roman 加粗
- 关键词 四号黑体加粗，3~5 个
- 图题 五号宋体（图下）；表题 五号黑体加粗（表上）
- 页码 阿拉伯数字，从绪论起连续编排，页脚右侧，小五号 Times New Roman
- 参考文献 按 GB/T 7714-2015

定稿前请对照 `广东工业大学毕业设计（论文）手册.pdf` 的样张复核。

## 致谢

本模板在早期版本的基础上整理而成，原始版本参考了华南师范大学
潘伟洲同学的 SCNU 论文模板；参考文献使用 TeX Live 官方
`gbt7714` 宏包（GB/T 7714-2015 numerical 样式）。
