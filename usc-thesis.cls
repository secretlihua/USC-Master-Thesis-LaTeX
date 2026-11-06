%% Unofficial University of South China academic master's thesis class.
%% Copyright (c) 2026 USC Thesis Template contributors.
%% Original implementation, 2026. LPPL 1.3c or later; see LICENSE.txt.
%% The supplied university Word specification is the layout authority.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{usc-thesis}[2026/11/06 Academic master's thesis]
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{usc-thesis}{XeLaTeX is required}{Compile the root TeX file with XeLaTeX.}
  \expandafter\endinput
\fi
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=usc,prefix=usc@}
\DeclareStringOption[system]{fonts}
\DeclareStringOption[all]{frontnumbering}
\DeclareBoolOption[false]{blind}
\ProcessKeyvalOptions*
\LoadClass[UTF8,a4paper,twoside,openright,zihao=-4,fontset=none,linespread=1.5]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{geometry}
% Every side satisfies left >= 25 mm and right >= 20 mm.
% Text block is exactly 155 x 230 mm; these particular margins are a design choice.
\geometry{a4paper,inner=30mm,outer=25mm,top=35mm,bottom=32mm,
  headheight=12bp,headsep=8mm,footskip=12mm}
\RequirePackage{fontspec}
\newcommand\usc@needfont[1]{%
  \IfFontExistsTF{#1}{}{\ClassError{usc-thesis}{Required font '#1' not found}
    {Install the legally licensed font, or use fonts=fandol for a non-identical preview.}}}
\ifdefstring{\usc@fonts}{system}{%
  \usc@needfont{SimSun}\usc@needfont{SimHei}\usc@needfont{KaiTi}
  \usc@needfont{Times New Roman}
  \setCJKmainfont{SimSun}[BoldFont=SimHei,ItalicFont=KaiTi]
  \setCJKsansfont{SimHei}\setCJKmonofont{SimSun}
  \setCJKfamilyfont{zhsong}{SimSun}[BoldFont=SimHei]
  \setCJKfamilyfont{zhhei}{SimHei}
  \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=2.5]
  \setmainfont{Times New Roman}
  \newfontfamily\uscsonglatin{SimSun}
  \newfontfamily\uscheilatin{SimHei}
  \newfontfamily\usckailatin{KaiTi}
}{\ifdefstring{\usc@fonts}{fandol}{%
  \setCJKmainfont{FandolSong-Regular}[Extension=.otf,BoldFont=FandolSong-Bold,ItalicFont=FandolKai-Regular]
  \setCJKsansfont{FandolHei-Regular}[Extension=.otf,BoldFont=FandolHei-Bold]
  \setCJKmonofont{FandolFang-Regular}[Extension=.otf]
  \setCJKfamilyfont{zhsong}{FandolSong-Regular}[Extension=.otf,BoldFont=FandolSong-Bold]
  \setCJKfamilyfont{zhhei}{FandolHei-Regular}[Extension=.otf]
  \setCJKfamilyfont{zhkai}{FandolKai-Regular}[Extension=.otf,AutoFakeBold=2.5]
  \setmainfont{TeX Gyre Termes}
  \newfontfamily\uscsonglatin{TeX Gyre Termes}
  \newfontfamily\uscheilatin{TeX Gyre Heros}
  \newfontfamily\usckailatin{TeX Gyre Termes}
  \ClassInfo{usc-thesis}{Fandol preview fonts selected; not the prescribed Windows font faces}
}{\ClassError{usc-thesis}{Unknown fonts option}{Use fonts=system or fonts=fandol.}}}
\setsansfont{TeX Gyre Heros}
\setmonofont{Latin Modern Mono}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\heiti{\CJKfamily{zhhei}}
\providecommand\kaishu{\CJKfamily{zhkai}}
\newcommand\usc@headingfont{\heiti\uscheilatin}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\setmathfont{TeX Gyre Termes Math}
\RequirePackage{graphicx}
\RequirePackage{array,booktabs,longtable,tabularx}
\RequirePackage{caption}
\DeclareCaptionFont{usc}{\normalfont\usc@headingfont\zihao{5}}
\DeclareCaptionLabelSeparator{uscspace}{\hspace{1em}}
\captionsetup{font=usc,labelsep=uscspace,justification=centering,
  singlelinecheck=false,skip=6bp}
\captionsetup[table]{position=top}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{gbt7714}
% Pin the unmodified upstream 2005 variant; source and license are included.
\bibliographystyle{references/gbt7714/gbt7714-2005-numeric}
\setcitestyle{super,square,comma,sort&compress}
\RequirePackage{hyperref}
\hypersetup{unicode,hidelinks,linktoc=all,bookmarksnumbered=true,bookmarksopen=true,
  bookmarksopenlevel=1,pdfdisplaydoctitle=true}
\RequirePackage{bookmark}
\RequirePackage{tikz}
\usetikzlibrary{positioning,arrows.meta}

% Metadata is content, not layout. No absolute paths or fixed root-file names.
\ExplSyntaxOn
\prop_new:N \g_usc_info_prop
\keys_define:nn {usc/info}
  {
    title .code:n = \prop_gput:Nnn \g_usc_info_prop {title}{#1},
    title-en .code:n = \prop_gput:Nnn \g_usc_info_prop {title-en}{#1},
    author .code:n = \prop_gput:Nnn \g_usc_info_prop {author}{#1},
    author-en .code:n = \prop_gput:Nnn \g_usc_info_prop {author-en}{#1},
    supervisor .code:n = \prop_gput:Nnn \g_usc_info_prop {supervisor}{#1},
    supervisor-en .code:n = \prop_gput:Nnn \g_usc_info_prop {supervisor-en}{#1},
    major .code:n = \prop_gput:Nnn \g_usc_info_prop {major}{#1},
    major-en .code:n = \prop_gput:Nnn \g_usc_info_prop {major-en}{#1},
    direction .code:n = \prop_gput:Nnn \g_usc_info_prop {direction}{#1},
    college .code:n = \prop_gput:Nnn \g_usc_info_prop {college}{#1},
    clc .code:n = \prop_gput:Nnn \g_usc_info_prop {clc}{#1},
    udc .code:n = \prop_gput:Nnn \g_usc_info_prop {udc}{#1},
    secrecy .code:n = \prop_gput:Nnn \g_usc_info_prop {secrecy}{#1},
    date .code:n = \prop_gput:Nnn \g_usc_info_prop {date}{#1},
    defense-date .code:n = \prop_gput:Nnn \g_usc_info_prop {defense-date}{#1},
    reviewer-one .code:n = \prop_gput:Nnn \g_usc_info_prop {reviewer-one}{#1},
    reviewer-two .code:n = \prop_gput:Nnn \g_usc_info_prop {reviewer-two}{#1},
    reviewer-three .code:n = \prop_gput:Nnn \g_usc_info_prop {reviewer-three}{#1},
    chair .code:n = \prop_gput:Nnn \g_usc_info_prop {chair}{#1},
    member-one .code:n = \prop_gput:Nnn \g_usc_info_prop {member-one}{#1},
    member-two .code:n = \prop_gput:Nnn \g_usc_info_prop {member-two}{#1},
    member-three .code:n = \prop_gput:Nnn \g_usc_info_prop {member-three}{#1},
    member-four .code:n = \prop_gput:Nnn \g_usc_info_prop {member-four}{#1}
  }
\NewDocumentCommand \uscsetup {m} {\keys_set:nn {usc/info}{#1}}
\NewExpandableDocumentCommand \uscinfo {m}
  {\prop_if_in:NnTF \g_usc_info_prop {#1}{\prop_item:Nn \g_usc_info_prop {#1}}{}}
\NewDocumentCommand \uscspreadlabel {m}
  {\makebox[44mm][s]{\tl_map_inline:nn {#1}{##1\hfill}\unskip}}
\NewDocumentCommand \uscoptionalreviewer {} {
  \tl_set:Ne \l_tmpa_tl {\uscinfo{reviewer-three}}
  \tl_if_blank:VF \l_tmpa_tl {\usc@personrow{论文评阅人3}{\uscinfo{reviewer-three}}}
}
\ExplSyntaxOff
\newcommand\uscprivate[1]{\ifusc@blind 匿名\else\uscinfo{#1}\fi}
\newcommand\uscprivateen[1]{\ifusc@blind Anonymous\else\uscinfo{#1}\fi}
\newcommand\uscifblind[2]{\ifusc@blind #1\else #2\fi}
\AtBeginDocument{%
  \special{pdf:minorversion 7}% Embedded logo wrapper uses PDF 1.7.
  \hypersetup{pdftitle={\uscinfo{title}},pdfsubject={学术学位硕士学位论文}}
  \ifusc@blind\hypersetup{pdfauthor={}}\else
    \hypersetup{pdfauthor={\uscinfo{author}}}\fi
  \setlength{\parindent}{2em}\setlength{\parskip}{0pt}
  \setlength{\emergencystretch}{1em}
  \raggedbottom
  % A BibTeX control record has no bibliography item, so do not use natbib's nocite.
  \if@filesw\immediate\write\@auxout{\string\citation{usc-bib-style}}\fi
}
\ctexset{
  chapter={name={第,章},number=\arabic{chapter},format=\centering\normalfont\usc@headingfont\zihao{3},
    aftername=\hspace{1em},beforeskip=0pt,afterskip=18bp,fixskip=true},
  section={format=\normalfont\usc@headingfont\zihao{-3},indent=0pt,aftername=\hspace{1em},
    beforeskip=16bp,afterskip=8bp},
  subsection={format=\normalfont\usc@headingfont\zihao{4},indent=0pt,aftername=\hspace{1em},
    beforeskip=12bp,afterskip=6bp},
  subsubsection={format=\normalfont\usc@headingfont\zihao{-4},indent=0pt,aftername=\hspace{1em},
    beforeskip=10bp,afterskip=4bp}}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
% ctex's default chapter TOC adds 0.3 em; the school specifies one character total.
\ExplSyntaxOn
\cs_set:Npn \CTEX@chapter@tocline #1#2
  {\ifnum \c@secnumdepth >\m@ne \if@mainmatter
     \protect\numberline{\CTEXthechapter}\fi\fi #2}
\ExplSyntaxOff
\renewcommand\contentsname{目\hspace{2em}录}
\renewcommand\bibname{参考文献}
\renewcommand\thefigure{\thechapter.\arabic{figure}}
\renewcommand\thetable{\thechapter.\arabic{table}}
\renewcommand\theequation{\thechapter.\arabic{equation}}
\newif\ifusc@bodyheaders
\usc@bodyheadersfalse
\newcommand\usc@pagestyle{%
  \fancyhf{}%
  \fancyfoot[LE,RO]{\normalfont\zihao{-5}\thepage}%
  \ifusc@bodyheaders
    \fancyhead[CO]{\normalfont\kaishu\usckailatin\zihao{-5}\nouppercase{\leftmark}}%
    \fancyhead[CE]{\normalfont\kaishu\usckailatin\zihao{-5}南华大学硕士学位论文}%
    \renewcommand\headrulewidth{0.4pt}%
  \else\renewcommand\headrulewidth{0pt}\fi
  \renewcommand\footrulewidth{0pt}}
\fancypagestyle{usc}{\usc@pagestyle}
\fancypagestyle{plain}{\usc@pagestyle}
\renewcommand\chaptermark[1]{\markboth{\CTEXthechapter\hspace{1em}#1}{}}
% Deliberate blank versos carry no running material; page counting remains physical.
\renewcommand\cleardoublepage{\clearpage\if@twoside\ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\fi\fi}
\renewcommand\frontmatter{%
  \cleardoublepage\@mainmatterfalse\usc@bodyheadersfalse
  \pagenumbering{Roman}\pagestyle{usc}
  \ifdefstring{\usc@frontnumbering}{abstract}{\hypersetup{pageanchor=false}}{}}
\renewcommand\mainmatter{%
  \cleardoublepage\@mainmattertrue\usc@bodyheaderstrue
  \pagenumbering{arabic}\pagestyle{usc}\normalsize}
\newcommand\uscstartabstracts{%
  \cleardoublepage
  \ifdefstring{\usc@frontnumbering}{abstract}{\pagenumbering{Roman}}{}
  \hypersetup{pageanchor=true}\pagestyle{usc}}
\AtBeginDocument{%
  \ifdefstring{\usc@frontnumbering}{all}{}{%
    \ifdefstring{\usc@frontnumbering}{abstract}{}{%
      \ClassError{usc-thesis}{Unknown frontnumbering option}{Use all or abstract.}}}}

% Official Appendix 1 image is losslessly wrapped in PDF; original JPEG stream retained.
\newcommand\usc@logo{\includegraphics[width=108mm]{assets/usc-logo.pdf}}
\newsavebox\usc@metabox
\newcommand\usc@fit[3]{%
  \sbox\usc@metabox{#3}%
  \ifdim\wd\usc@metabox>#1\relax
    \ClassError{usc-thesis}{Metadata field '#2' is too wide}
      {Use a verified concise value, or deliberately revise the field layout in the class.}%
  \fi\makebox[#1][l]{\usebox\usc@metabox}}
\newcommand\usc@field[2]{\uscspreadlabel{#1}：\usc@fit{68mm}{#1}{#2}}
\newcommand\makecover{%
  \hypersetup{pageanchor=false}\pagenumbering{Alph}\thispagestyle{empty}%
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north,inner sep=0pt] at ([yshift=-28mm]current page.north){%
      \begin{minipage}{128mm}\songti\zihao{4}\renewcommand\arraystretch{1.6}
        \begin{tabular*}{\linewidth}{@{}l@{\hspace{3mm}}l@{\extracolsep{\fill}}l@{\hspace{3mm}}l@{}}
        分类号&\underline{\makebox[25mm]{\uscinfo{clc}}}&密\quad 级&\underline{\makebox[25mm]{\uscinfo{secrecy}}}\\
        U\,D\,C&\underline{\makebox[25mm]{\uscinfo{udc}}}&学校代码&\underline{\makebox[25mm]{10555}}
        \end{tabular*}\end{minipage}};
    \node[anchor=north,inner sep=0pt] at ([yshift=-60mm]current page.north){\usc@logo};
    \node[anchor=north,inner sep=0pt] at ([yshift=-95mm]current page.north){\songti\zihao{1}硕士学位论文};
    \node[anchor=north,inner sep=0pt] at ([yshift=-111mm]current page.north){\songti\zihao{2}（学术学位）};
    \node[anchor=north,inner sep=0pt,text width=155mm,align=center] at ([yshift=-139mm]current page.north)
      {\kaishu\bfseries\zihao{1}\uscinfo{title}};
    \node[anchor=north west,inner sep=0pt] at ([xshift=68mm,yshift=-187mm]current page.north west){%
      \begin{minipage}{117mm}\songti\zihao{4}\setlength\parindent{0pt}
      \usc@field{研究生姓名}{\uscprivate{author}}\par\vspace{3.5mm}
      \usc@field{指导教师、职称}{\uscprivate{supervisor}}\par\vspace{3.5mm}
      \usc@field{学科专业}{\uscinfo{major}}\par\vspace{3.5mm}
      \usc@field{研究方向}{\uscinfo{direction}}\par\vspace{3.5mm}
      \usc@field{所在学院}{\uscprivate{college}}
      \end{minipage}};
    \node[anchor=north,inner sep=0pt] at ([yshift=-259mm]current page.north){\kaishu\bfseries\zihao{3}\uscinfo{date}};
  \end{tikzpicture}\null\clearpage
  \null\thispagestyle{empty}\clearpage
  \hypersetup{pageanchor=true}}
\newcommand\usc@prefacestyle{%
  \ifdefstring{\usc@frontnumbering}{abstract}{\thispagestyle{empty}}{\thispagestyle{usc}}}
\newcommand\usc@personrow[2]{\noindent\makebox[36mm][l]{#1}\underline{\usc@fit{113mm}{#1}{#2}}\par\vspace{2mm}}
\newcommand\maketitlepage{%
  \ifusc@blind\else
  \cleardoublepage\usc@prefacestyle\pdfbookmark[0]{题名页}{usc-titlepage}
  \begin{center}\usc@logo\par\vspace{14mm}
    {\kaishu\zihao{-2}\uscinfo{title}\par}\end{center}
  \vspace{10mm}\begingroup\songti\zihao{4}
  \usc@personrow{论文作者签名}{\hfill}
  \usc@personrow{指导教师签名}{\hfill}
  \vspace{6mm}
  \usc@personrow{论文评阅人1}{\uscinfo{reviewer-one}}
  \usc@personrow{论文评阅人2}{\uscinfo{reviewer-two}}
  \uscoptionalreviewer
  \vspace{6mm}
  \usc@personrow{答辩委员会主席}{\uscinfo{chair}}
  \usc@personrow{委员1}{\uscinfo{member-one}}
  \usc@personrow{委员2}{\uscinfo{member-two}}
  \usc@personrow{委员3}{\uscinfo{member-three}}
  \usc@personrow{委员4}{\uscinfo{member-four}}
  \vfill\noindent 答辩日期：\uscinfo{defense-date}\par\endgroup
  \cleardoublepage\fi}
\newcommand\makedeclaration{%
  \ifusc@blind\else
  \cleardoublepage\usc@prefacestyle\pdfbookmark[0]{原创性声明与版权使用授权书}{usc-declaration}
  \begingroup\songti\zihao{-4}
  \begin{center}{\heiti\zihao{3}南华大学学位论文原创性声明}\end{center}\vspace{3mm}
  本人声明，所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了论文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得南华大学或其他单位的学位或证书而使用过的材料。与我共同工作的同志对本研究所作的贡献均已在论文中作了明确的说明。本人完全意识到本声明的法律结果由本人承担。\par
  \vspace{4mm}\noindent\hfill 作者签名：\underline{\hspace{25mm}}\quad 年\quad 月\quad 日\par
  \vfill
  \begin{center}{\heiti\zihao{3}南华大学学位论文版权使用授权书}\end{center}\vspace{3mm}
  本学位论文是本人在南华大学攻读硕士学位期间在导师指导下完成的学位论文。本论文的研究成果归南华大学所有，本论文的研究内容不得以其它单位的名义发表。本人同意南华大学有关保留、使用学位论文的规定，即：学校有权保留学位论文，允许学位论文被查阅和借阅；学校可以公布学位论文的全部或部分内容，可以采用复印、缩印或其它手段保留学位论文；学校可根据国家或湖南省有关部门规定送交学位论文。同意学校将论文加入《中国优秀博硕士学位论文全文数据库》，并按《中国优秀博硕士学位论文全文数据库出版章程》规定享受相关权益。同意授权中国科学信息技术研究所将本学位论文收录到《中国学位论文全文数据库》，并通过网络向社会公众提供信息服务。对于涉密的学位论文，解密后适用该授权。\par
  \vspace{4mm}\noindent\hfill 作者签名：\underline{\hspace{25mm}}\quad 年\quad 月\quad 日\par
  \noindent\hfill 导师签名：\underline{\hspace{25mm}}\quad 年\quad 月\quad 日\par
  \endgroup\cleardoublepage\fi}

\newenvironment{cnabstract}{%
  \clearpage\phantomsection\addcontentsline{toc}{chapter}{摘要}\markboth{摘要}{}
  \begingroup\songti\zihao{4}\setlength{\parindent}{2em}
  \begin{center}{\heiti\zihao{3}\uscinfo{title}\par}\end{center}
  \noindent{\heiti\zihao{-3}摘要：}\ignorespaces
}{\par\endgroup\clearpage}
\newenvironment{enabstract}{%
  \clearpage\phantomsection\addcontentsline{toc}{chapter}{Abstract}\markboth{Abstract}{}
  \begingroup\rmfamily\zihao{4}\settowidth{\parindent}{0000}
  \begin{center}{\bfseries\zihao{3}\MakeUppercase{\uscinfo{title-en}}\par}
    \vspace{5mm}\uscprivateen{author-en} (\uscinfo{major-en})\par
    Directed by \uscprivateen{supervisor-en}\par\end{center}
  \noindent{\bfseries\zihao{-3}Abstract: }\ignorespaces
}{\par\endgroup\clearpage}
\newcommand\cnkeywords[1]{\par\vspace{\baselineskip}\noindent{\heiti\zihao{-3}关键词：}#1\par}
\newcommand\enkeywords[1]{\par\vspace{\baselineskip}\noindent{\bfseries\zihao{-3}Keywords: }#1\par}
% Widths are specified in Chinese-character units at the 14 bp TOC font size.
\contentsmargin{3em}
% Chapter labels precede the title in the flow rather than overlap it.
\titlecontents{chapter}[0pt]{\normalfont\songti\zihao{4}}
  {\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5em]{.}\contentspage}
\titlecontents{section}[14bp]{\normalfont\songti\zihao{4}}
  {\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5em]{.}\contentspage}
\titlecontents{subsection}[28bp]{\normalfont\songti\zihao{4}}
  {\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5em]{.}\contentspage}
\titlecontents{subsubsection}[42bp]{\normalfont\songti\zihao{4}}
  {\thecontentslabel\hspace{1em}}{}{\titlerule*[0.5em]{.}\contentspage}
\renewcommand\tableofcontents{%
  \cleardoublepage\chapter*{\contentsname}\bookmark[level=0,dest=\@currentHref]{目录}
  \begingroup\songti\zihao{4}\@starttoc{toc}\endgroup\clearpage}
\newcommand\uscunnumberedchapter[1]{%
  \chapter*{#1}\addcontentsline{toc}{chapter}{#1}\markboth{#1}{}}
\renewcommand\bibsection{\uscunnumberedchapter{参考文献}}
\renewcommand\bibfont{\normalfont\songti\zihao{-4}}
\setlength\bibsep{0pt}
\setlength\bibhang{1.5em}
\renewcommand\NAT@bibsetnum[1]{%
  \settowidth\labelwidth{\@biblabel{#1}}%
  \setlength\leftmargin{1.5em}%
  \setlength\labelsep{\dimexpr\leftmargin-\labelwidth\relax}%
  \ifdim\labelsep<0.25em
    \setlength\labelsep{0.25em}%
    \setlength\leftmargin{\dimexpr\labelwidth+\labelsep\relax}%
  \fi
  \setlength\itemindent{0pt}\setlength\listparindent{0pt}%
  \setlength\itemsep{\bibsep}\setlength\parsep{0pt}}
% Ensure the whole superscript (including brackets) has the specified 9 bp size.
\renewcommand\NAT@citesuper[3]{%
  \ifNAT@swa\if*#2*\else #2\NAT@spacechar\fi
    \unskip\textsuperscript{\normalfont\songti\uscsonglatin\fontsize{9bp}{10.8bp}\selectfont
      \NAT@@open#1\NAT@@close\if*#3*\else #3\fi}%
  \else #1\fi\endgroup}
\newcommand\uscprintbibliography{\bibliography{references/references}}
\let\usc@originalappendix\appendix
\renewcommand\appendix{%
  \cleardoublepage\usc@bodyheadersfalse\pagestyle{usc}
  \usc@originalappendix\ctexset{chapter={name={附录,},number=\Alph{chapter}}}}
\newcommand\uscbackmatter{\cleardoublepage\@mainmatterfalse\usc@bodyheadersfalse\pagestyle{usc}}

% A numbered centered display with the explicit dotted leader required by 4.10.
% Use aligned inside for multiple lines; label/ref/eqref share the equation counter.
\newsavebox\usc@eqbox
\newsavebox\usc@tagbox
\newlength\usc@eqleft
\NewDocumentEnvironment{uscequation}{+b}{%
  \par\addvspace{\abovedisplayskip}\refstepcounter{equation}
  \sbox\usc@eqbox{$\displaystyle #1$}%
  \sbox\usc@tagbox{\normalfont(\theequation)}%
  \setlength\usc@eqleft{\dimexpr(\linewidth-\wd\usc@eqbox)/2\relax}%
  \ifdim\usc@eqleft<\dimexpr\wd\usc@tagbox+2em\relax
    \ClassError{usc-thesis}{Equation too wide for its dotted leader}
      {Break the expression with aligned inside uscequation.}%
  \fi
  \noindent\hbox to\linewidth{\hspace{\usc@eqleft}\usebox\usc@eqbox\hspace{0.6em}%
    \leaders\hbox{\normalfont\kern0.12em.\kern0.12em}\hfill
    \hspace{0.6em}\usebox\usc@tagbox}\par\addvspace{\belowdisplayskip}
}{\ignorespacesafterend}
\endinput
