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

$(MAIN).pdf: $(MAIN).tex 学生信息.tex \
             $(wildcard 摘要/*.tex) \
             $(wildcard 章节/*.tex) \
             $(wildcard 致谢与附录/*.tex) \
             $(wildcard 外文译文/*.tex) \
             $(wildcard 参考文献/*.bib) \
             $(wildcard 封面模板/*.tex) \
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
