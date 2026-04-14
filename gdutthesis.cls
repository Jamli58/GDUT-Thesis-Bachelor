
%------------------------------------------------------------------------
%声明
%------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gdutthesis}

\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}
\DeclareOption{oneside}{\istwosidefalse}

% 字体方案：ttf=Windows（SimSun/SimHei），otf=Overleaf（Fandol），mac=macOS（Songti/Heiti SC）
\def\gdut@fontscheme{ttf}
\DeclareOption{ttf}{\def\gdut@fontscheme{ttf}}
\DeclareOption{otf}{\def\gdut@fontscheme{otf}}
\DeclareOption{mac}{\def\gdut@fontscheme{mac}}

\newif\ifistranslation\istranslationtrue
\DeclareOption{en}{\istranslationtrue}
\DeclareOption{cn}{\istranslationfalse}

\DeclareOption*{\PackageWarning{gdutthesis}{Unknown Option '\CurrentOption'}}
\ProcessOptions\relax

\RequirePackage{ifthen,calc}

\ifistwoside
	\LoadClass[a4paper,12pt,openany,twoside]{book}
\else
	\LoadClass[a4paper,12pt,openany,oneside]{book}
\fi

%------------------------------------------------------------------------
%宏包
%------------------------------------------------------------------------  
\RequirePackage[includefoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[center]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage[varg]{txfonts}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem} %宏包兼容
\RequirePackage[CJKnumber,no-math,BoldFont,SlantFont]{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage[numbers,sort&compress,square]{natbib}
\RequirePackage[CJKbookmarks=true,pdfborder=0 0 1]{hyperref}

%------------------------------------------------------------------------
%其他
%------------------------------------------------------------------------

\renewcommand{\tabularxcolumn}[1]{m{#1}} %表格左右居中对齐

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} 

%------------------------------------------------------------------------
%字体与字号
%------------------------------------------------------------------------
\defaultfontfeatures{Mapping=tex-text} 
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1} %Address of Unicode

\newcommand\installTTF{%
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Courier New}
	\setCJKmainfont{SimSun}
	\setCJKsansfont{SimHei}
	\setCJKfamilyfont{song}{SimSun}
	\setCJKfamilyfont{hei}{SimHei}
}

% \newcommand\installOTF{%
% 	\setmainfont{Times New Roman} % could be changed to "Times New Roman PS Std"
% 	\setsansfont{Arial}
% 	\setmonofont{Courier New} 
% 	\setCJKmainfont{Adobe Song Std}
% 	\setCJKsansfont{Adobe Heiti Std}
% 	\setCJKfamilyfont{song}{Adobe Song Std}
% 	\setCJKfamilyfont{hei}{Adobe Heiti Std}
% }

\newcommand\installOTF{%
    \setmainfont{Times New Roman} % 使用 Overleaf 支持的 Times New Roman
    \setsansfont{Arial} % 使用 Overleaf 支持的 Arial
    \setmonofont{Courier New} % 使用 Overleaf 支持的 Courier New
    \setCJKmainfont{FandolSong} % 设置主要的中文字体为 FandolSong
    \setCJKsansfont{FandolHei} % 设置无衬线的中文字体为 FandolHei
    \setCJKmonofont{FandolFang} % 设置等宽的中文字体为 FandolFang
}

\newcommand\installMAC{%
    \setmainfont{Times New Roman}
    \setsansfont{Helvetica}
    \setmonofont{Courier New}
    \setCJKmainfont[BoldFont={Heiti SC}]{Songti SC}
    \setCJKsansfont{Heiti SC}
    \setCJKmonofont{Songti SC}
    \setCJKfamilyfont{song}{Songti SC}
    \setCJKfamilyfont{hei}{Heiti SC}
}

\ifthenelse{\equal{\gdut@fontscheme}{mac}}{\installMAC}{%
	\ifthenelse{\equal{\gdut@fontscheme}{otf}}{\installOTF}{\installTTF}%
}

\newcommand{\song}{\CJKfamily{song}}    % 宋体
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\songti{\song}
\def\heiti{\hei}

\newcommand{\chuhao}{\fontsize{42bp}{50.4bp}\selectfont}
\newcommand{\xiaochu}{\fontsize{36bp}{43.2bp}\selectfont}
\newcommand{\yihao}{\fontsize{26bp}{31.2bp}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24bp}{28.8bp}\selectfont}
\newcommand{\erhao}{\fontsize{22bp}{26.4bp}\selectfont}
\newcommand{\xiaoer}{\fontsize{18bp}{21.6bp}\selectfont}
\newcommand{\sanhao}{\fontsize{16bp}{19.2bp}\selectfont}
\newcommand{\xiaosan}{\fontsize{15bp}{18bp}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{16.8bp}\selectfont}
\newcommand{\xiaosi}{\fontsize{12bp}{23.4bp}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{12.6bp}\selectfont}
\newcommand{\xiaowu}{\fontsize{9bp}{10.8bp}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5bp}{9bp}\selectfont}
\newcommand{\xiaoliu}{\fontsize{6.5bp}{7.8bp}\selectfont}
\newcommand{\qihao}{\fontsize{5.5bp}{6.6bp}\selectfont}
\newcommand{\bahao}{\fontsize{5.0bp}{6bp}\selectfont}

\renewcommand{\baselinestretch}{1}

%------------------------------------------------------------------------
%中文元素
%------------------------------------------------------------------------
\renewcommand\contentsname{目\hspace{2em}录}
\newcommand\ackname{致谢}
\newcommand\equationname{公式}
\renewcommand\bibname{参考文献}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\def\CJK@today{\heiti{\the\year 年 \the\month 月}}
\newcommand\zhtoday{\CJK@today}
\newcommand\entoday{\today{}}

%------------------------------------------------------------------------
%页边距与页面样式
%------------------------------------------------------------------------
% 真实 Word 模板使用双面镜像页边距：内侧30mm，外侧20mm。
\geometry{top=30mm,bottom=25mm,inner=30mm,outer=20mm,nohead}
\geometry{footskip=10mm}
 
\newcommand\dlmu[2][6.5cm]{\hskip1pt\underline{\hb@xt@#1{\hss#2\hss}}\hskip3pt} %设置下划线

\ifistwoside
	\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}}
	\fancypagestyle{mainpage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
	\fancypagestyle{backpage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
	\fancypagestyle{emptypage}{\fancyhf{}\fancyfoot[EL,OR]{\xiaowu \thepage}}
\else
	\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}}
	\fancypagestyle{mainpage}{\fancyhf{}\fancyfoot[R]{\xiaowu \thepage}}
	\fancypagestyle{backpage}{\fancyhf{}\fancyfoot[R]{\xiaowu \thepage}}
	\fancypagestyle{emptypage}{\fancyhf{}\fancyfoot[R]{\xiaowu \thepage}}
\fi

\renewcommand\frontmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\fancyhf{}
	\pagestyle{plain}
}

\renewcommand\mainmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\normalsize 
	% 表内文字为五号，使用正常表格行距，不继承正文 1.5 倍行距。
	\def\@tabular{\fontsize{10.5bp}{12.6bp}\selectfont\old@tabular}
	\pagestyle{mainpage}
}

\renewcommand\backmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\pagestyle{backpage}
}
	
\newenvironment{ack}{%
	\thispagestyle{emptypage}
	\chapter*{\ackname}%
	\addcontentsline{toc}{chapter}{致谢}%
	\xiaosi%
	\@afterheading
}

%------------------------------------------------------------------------
%附录
%------------------------------------------------------------------------
\newcounter{appx}[chapter]
\renewcommand{\theappx}{\Alph{appx}}
\newcommand{\appx}[1]{\refstepcounter{appx}%
\begin{center}
\heiti \bfseries \sanhao{\par{附录}\textbf{\theappx}\quad#1}
\end{center}
\vspace{0.8em}}

\newcounter{appxtab}[appx]
\renewcommand{\theappxtab}{\theappx\arabic{appxtab}}
\newcommand{\appxtab}{\refstepcounter{appxtab}\centering \heiti \bfseries {\par{表\hspace{0.2em}}\theappxtab}\quad}

\newcounter{appxfig}[appx]
\renewcommand{\theappxfig}{\theappx\arabic{appxfig}}
\newcommand{\appxfig}{\refstepcounter{appxfig}\centering \song{\par{图\hspace{0.2em}}\theappxfig\quad}}

\newcommand{\appxtle}[1]{\appx{#1}\par\addcontentsline{toc}{chapter}{附录\theappx}}

\newenvironment{appxchp}{\clearpage\@afterheading}{}

%------------------------------------------------------------------------
%单面打印设置
%------------------------------------------------------------------------
\renewcommand\cleardoublepage{\clearpage\if@openright\ifodd\c@page
	\else
	\newpage{}
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\end{center}
	\vspace*{\fill}
	\clearpage\fi\fi%
}

%------------------------------------------------------------------------
%摘要
%------------------------------------------------------------------------
\newcommand\cabstractname{摘\hspace{2em}要}
\newcommand\ckeywordsname{{\heiti \sihao \textbf{关键词}}}
\newcommand\ckeywords[1]{\xiaosi \songti \ckeywordsname：#1}

\newcommand\eabstractname{Abstract}
\newcommand\ekeywordsname{\sihao \textbf{KEY WORDS}}
\newcommand\ekeywords[1]{{\xiaosi \ekeywordsname: #1}}

\newenvironment{cabstract}{%
	\titleformat*{\chapter}{\sanhao \heiti \filcenter \bfseries}
	\chapter*{\cabstractname}
	\xiaosi
	\vspace*{-7bp}
	\@afterheading}
{\par\vspace{1em}\par}

\newenvironment{eabstract}{%
	\titleformat*{\chapter}{\sanhao \rmfamily \filcenter \bfseries}
	\chapter*{\eabstractname}
	\xiaosi
	\vspace*{-9bp}
	\@afterheading}
{\par\vspace{1em}\par}

\renewcommand\tableofcontents{%
	\chapter*{\contentsname}%
	\vspace*{-14bp}%
	\@starttoc{toc}%
}

\titlecontents{chapter}[0pt]{\vspace{6bp} \heiti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}
\titlecontents{section}[2em]{\songti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}
\titlecontents{subsection}[4em]{\songti \xiaosi}
	{\thecontentslabel\quad}{}
	{\titlerule*{.}\contentspage}

%------------------------------------------------------------------------
%标题与目录设置
%------------------------------------------------------------------------
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
						\global\@topnum\z@
						\@afterindentfalse
						\secdef\gdut@chapter\@schapter}

\def\gdut@chapter[#1]#2{
	\ifnum \c@secnumdepth >\m@ne
		\if@openright\cleardoublepage\else\clearpage\fi
		\phantomsection %指引到标签\label所在的位置
		\if@mainmatter
			\refstepcounter{chapter}%
			\addcontentsline{toc}{chapter}%
				{\protect\numberline{\thechapter}#1}%
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\@makechapterhead{#2}%
}

\newcommand{\sectionbreak}{\addpenalty{-300}\vspace*{0pt}}

\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3} % 数字到subsection
\titleformat{\chapter}{\filcenter \sanhao \heiti \bfseries }{\thechapter}{1.2em}{}
\titleformat{\section}{\heiti \bfseries\xiaosi}{\thesection}{0.2em}{}
\titleformat{\subsection}{\heiti \xiaosi}{\thesubsection}{1em}{}

\titlespacing{\chapter}{0pt}{0pt}{1em}
\titlespacing{\section}{0pt}{.5\baselineskip}{.4\baselineskip}
\titlespacing{\subsection}{0pt}{.5\baselineskip}{.4\baselineskip}

\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{24.5bp}%
\setlength\abovedisplayskip{10bp \@plus 2bp \@minus 2bp}%
\setlength\abovedisplayshortskip{10bp \@plus 2bp \@minus 2bp}%
\setlength\belowdisplayskip{\abovedisplayskip}%
\setlength\belowdisplayshortskip{\abovedisplayshortskip}%
}

\setlength{\parindent}{2em}
\setlength{\parskip}{0bp \@plus .5bp \@minus .5bp}
\renewcommand{\@listi}{%
	\leftmargin\leftmargini
	\parsep 0bp%
	\topsep 0bp%
	\itemsep 0bp%
	\partopsep 0bp%
}
\let\@listI\@listi
\@listi

\renewenvironment{thebibliography}[1]{%
	\thispagestyle{emptypage}
	\chapter*{\bibname}%
	\addcontentsline{toc}{chapter}{参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\renewcommand{\makelabel}[1]{##1\hfill}
		\setlength{\labelsep}{1ex}
		\setlength{\itemindent}{0pt}
		\setlength{\leftmargin}{\labelwidth+\labelsep}
		\addtolength{\itemsep}{-0.2em}
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy\frenchspacing
	\clubpenalty4000%
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\interlinepenalty4000%
	\sfcode`\.\@m
}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist\frenchspacing}

%------------------------------------------------------------------------
%表格
%------------------------------------------------------------------------
\aboverulesep=0pt
\belowrulesep=0pt
\heavyrulewidth=0.10em

\newcommand{\tabref}[1]{{表~\ref{tab:#1}}}
\newcommand{\figref}[1]{{图~\ref{fig:#1}}}

\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
	
\setlength{\floatsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\intextsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\textfloatsep}{8bp \@plus 2bp \@minus 1bp}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{10bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.80}

\let\old@tabular\@tabular %

\DeclareCaptionLabelFormat{tabularlabel}{{{\wuhao} \heiti #1~\rmfamily #2}}
\DeclareCaptionLabelFormat{figurelabel}{{{\wuhao} \song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{floatsong}{\hspace{1em}}
\DeclareCaptionFont{tabularcap}{{\wuhao}\bfseries \heiti}
\DeclareCaptionFont{figurecap}{{\wuhao}\song}
\captionsetup[table]{position=top,belowskip=-0.2em,aboveskip=0.1em,labelformat=tabularlabel,labelsep=floatsong,font=tabularcap}
\captionsetup[figure]{position=bottom,belowskip=0.1em,aboveskip=-0.2em,labelformat=figurelabel,labelsep=floatsong,font=figurecap}
\captionsetup[subfloat]{justification=centering}
\renewcommand{\thesubfigure}{\alph{subfigure}}
\renewcommand{\thesubtable}{\alph{subtable}}

\newcommand{\Ucaption}[2]{\caption{#1}\raisebox{10.5pt}[0pt]{\hspace*{0.6\linewidth} \heiti \bfseries #2}} %10.5pt当前五号字体大小

%------------------------------------------------------------------------
%全局脚注
%------------------------------------------------------------------------

%\ifthenelse{\value{footnote}>1}{\renewcommand{\thefootnote}{注：\arabic{footnote}.}}{\renewcommand{\thefootnote}{\hspace{2em}\arabic{footnote}.}}

%\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}


\renewtheoremstyle{nonumberplain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ \theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ (##3)\theorem@separator]}
\theoremstyle{nonumberplain}
\theorembodyfont{\rmfamily}
\theoremheaderfont{\sffamily}
\theoremsymbol{\ensuremath{\blacksquare}}
\theoremseparator{:\,}
\newtheorem{proof}{证明}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]

\renewtheoremstyle{plain}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hspace*{2em} \theorem@headerfont ##1\ ##2\ (##3)\theorem@separator]}
\theoremstyle{plain}
\theorembodyfont{\song}
\theoremheaderfont{\hei}
\theoremsymbol{}
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{exercise}{练习}[section]
\newtheorem{example}{例}[section]
\newtheorem{problem}{问题}[section]
\newtheorem{remark}{注释}[section]

%------------------------------------------------------------------------
%封面
%------------------------------------------------------------------------
% 封面数据接口。使用专属命令名以避免与 hyperref 等包重定义 \title/\author 冲突。
\def\thesistitle#1{\gdef\@title{#1}}       % 中文题目
\def\thesisauthor#1{\gdef\@author{#1}}     % 学生姓名
\def\serialno#1{\gdef\@serialno{#1}}       % 学号
\def\supervisor#1{\gdef\@supervisor{#1}}   % 指导教师
\def\college#1{\gdef\@college{#1}}         % 学院
\def\major#1{\gdef\@major{#1}}             % 专业
\def\majorfield#1{\gdef\@majorfield{#1}}   % 专业方向
\def\grade#1{\gdef\@grade{#1}}             % 年级
\def\class#1{\gdef\@class{#1}}             % 班别

\ifistranslation
	\newcommand{\gduttranslation}{1}
\else
	\newcommand{\gduttranslation}{0}
\fi

\newcommand{\iftrans}[2]{\ifthenelse{\gduttranslation=0}{#1}{#2}}

\endinput
%%
%% End of file `gdutthesis.cls'.
