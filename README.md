# 广东工业大学本科毕业设计（论文）LaTeX 模板

面向 GDUT 本科生的毕业设计（论文）LaTeX 模板，版式按
《广东工业大学毕业设计（论文）手册》（2025 年版）整理。

## 学生需要改动的文件

按下面的顺序改，一次就能把整篇论文写完：

| 顺序 | 文件 | 用途 |
| :-- | :-- | :-- |
| 1 | `学生信息.tex` | 学号、姓名、题目、学院、专业、指导教师 |
| 2 | `正文/摘要.tex` | 中文摘要、英文摘要、关键词 |
| 3 | `正文/第一章.tex` | 第 1 章 绪论 |
| 4 | `正文/第二章.tex` | 第 2 章 相关理论与基础知识 |
| 5 | `正文/第三章.tex` | 第 3 章 需求分析与方案设计 |
| 6 | `正文/第四章.tex` | 第 4 章 系统实现 |
| 7 | `正文/第五章.tex` | 第 5 章 实验与结果分析 |
| 8 | `正文/第六章.tex` | 第 6 章 总结与展望 |
| 9 | `正文/致谢.tex` | 致谢 |
| 10 | `正文/附录A.tex` | 附录（没有可在 `thesis.tex` 注释掉） |
| 11 | `参考文献.bib` | 参考文献数据库 |
| 12 | `图片/` | 自己的插图放这里 |

## 学生不需要改动的文件

以下文件是排版模板，不要动。有问题联系老师：

| 文件 | 用途 |
| :-- | :-- |
| `封面.tex` | 封面版式 |
| `书脊.tex` | 书脊版式（题目、姓名、学院逐字竖排） |
| `样式/` | 学校版式、字号、页边距、目录、页码、代码块等 |
| `Makefile` | 编译脚本 |
| `图片/xiaohui.jpg`、`图片/mingchen.jpg` | 学校校徽与校名（封面用） |

`thesis.tex` 是总入口，决定论文装订顺序。只有在增减章节时才改它。

## 编译

### 本地编译

安装 TeX Live 2020 及以上，在本目录运行：

```bash
make           # 生成 thesis.pdf
make view      # 编译并打开 PDF（macOS）
make clean     # 清理临时文件
```

不使用 Make 时，手动：

```bash
xelatex thesis
bibtex  thesis
xelatex thesis
xelatex thesis
```

### Overleaf 编译

将整个文件夹上传到 Overleaf，将编译器设为 **XeLaTeX**。

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

## 新增或删除章节

模板默认六章。若要减少或增加章节，改两处：

1. `正文/` 目录下新增或删除 `第N章.tex`。
2. `thesis.tex` 正文部分对应增删一行 `\input{正文/第N章}`。

例如增加第七章：

```tex
\input{正文/第七章}
```

## 插入图片和引用文献

图片放到 `图片/` 目录，正文里这样引用：

```tex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.5\linewidth]{your-figure.jpg}
\caption{示例图}
\label{fig:example}
\end{figure}
```

参考文献条目写到 `参考文献.bib`，正文中用：

```tex
\cite{example1}      % 普通引用
\upcite{example1}    % 上标式引用
```

## 外文译文装订册

外文参考文献译文与原文放在：

| 文件 | 用途 |
| :-- | :-- |
| `外文译文/译文.tex` | 外文参考文献译文 |
| `外文译文/原文.tex` | 外文参考文献原文 |

编译外文装订册时，把 `thesis.tex` 中的 `cn` 改为 `en`：

```tex
\documentclass[mac,twoside,en]{gdutthesis}
```

编译完成后要继续写中文主论文，再改回 `cn`。

## 目录结构

```text
.
├── thesis.tex                      总入口【不需改动，除非增删章节】
├── 学生信息.tex                    【需要改动】题目、姓名、学院等
├── 参考文献.bib                    【需要改动】BibTeX 数据库
├── 封面.tex                        【不需改动】封面版式
├── 书脊.tex                        【不需改动】书脊版式
├── 正文/                           【需要改动】
│   ├── 摘要.tex                    中英文摘要
│   ├── 第一章.tex                  绪论
│   ├── 第二章.tex                  相关理论与基础知识
│   ├── 第三章.tex                  需求分析与方案设计
│   ├── 第四章.tex                  系统实现
│   ├── 第五章.tex                  实验与结果分析
│   ├── 第六章.tex                  总结与展望
│   ├── 致谢.tex                    致谢
│   └── 附录A.tex                   附录 A（可选）
├── 图片/                           【需要改动】放自己的插图
├── 外文译文/                       【需要改动：en 模式才用】
│   ├── 译文.tex                    外文译文
│   └── 原文.tex                    外文原文
├── 样式/                           【不需改动】学校论文版式与宏包
│   ├── gdutthesis.cls              学校论文版式
│   └── mygdut.sty                  常用宏包设置
└── Makefile                        【不需改动】编译脚本
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

## 维护者

本模板由 **黎坚** 基于 2025 版《广东工业大学毕业设计（论文）手册》整理维护。

项目地址：<https://github.com/Jamli58/GDUT-Thesis-Bachelor>

使用中发现 bug 或有改进建议，欢迎到 GitHub 提 Issue 或 Pull Request。
