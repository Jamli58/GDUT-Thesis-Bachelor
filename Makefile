# 广东工业大学本科毕业设计（论文）LaTeX 模板构建脚本
#
# 常用目标：
#   make            编译主论文（thesis.pdf）
#   make view       编译并打开 PDF
#   make clean      清理临时文件
#   make distclean  清理临时文件和输出 PDF

MAIN    := thesis
LATEX   := xelatex -interaction=nonstopmode -halt-on-error
BIBTEX  := bibtex
OPENER  := open

.PHONY: all view clean distclean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex student-info.tex \
             $(wildcard frontmatter/*.tex) \
             $(wildcard chapters/*.tex) \
             $(wildcard backmatter/*.tex) \
             $(wildcard translation/*.tex) \
             $(wildcard references/*.bib) \
             $(wildcard template/*.tex) \
             gdutthesis.cls mygdut.sty
	$(LATEX) $(MAIN)
	-$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

view: $(MAIN).pdf
	$(OPENER) $(MAIN).pdf

clean:
	-rm -f *.aux *.log *.toc *.out *.bbl *.blg *.thm \
	       *.lof *.lot *.idx *.ilg *.ind *.gls *.glo \
	       *.fls *.fdb_latexmk *.synctex.gz *~

distclean: clean
	-rm -f $(MAIN).pdf
