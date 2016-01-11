%%
%% This is file `debug.cls'.
%% 
%% Copyright (C) 2009- by Guanshi Li <gareth.cn@gmail.com>, TongjiLUG <lugtongji@googlegroups.com>
%% and 
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.0 or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{debug}
[2009/05/13 1.0 Tongji University Thesis Template]
\newif\iftongji@UTF
\newif\iftongji@GBK
\DeclareOption{utf}{\tongji@UTFtrue\tongji@GBKfalse}
\DeclareOption{gbk}{\tongji@GBKtrue\tongji@UTFfalse}
\hyphenation{Thu-Thesis}
\def\thuthesis{\textsc{ThuThesis}}
\hyphenation{Tongji-Thesis}
\def\debug{\textsc{debug}}
\def\version{1.0}
\newif\iftongji@master\tongji@masterfalse
\newif\iftongji@doctor\tongji@doctorfalse
\newif\iftongji@secret\tongji@secretfalse
\DeclareOption{master}{\tongji@mastertrue}
\DeclareOption{doctor}{\tongji@doctortrue}
\DeclareOption{secret}{\tongji@secrettrue}
\newif\iftongji@dvips
\newif\iftongji@dvipdfm
\newif\iftongji@xetex
\newif\iftongji@pdftex
\DeclareOption{dvips}{\tongji@dvipstrue}
\DeclareOption{dvipdfm}{\tongji@dvipdfmtrue}
\DeclareOption{pdftex}{\tongji@pdftextrue}
\DeclareOption{xetex}{\tongji@xetextrue}
\newif\iftongji@arial
\DeclareOption{arial}{\tongji@arialtrue}
\newif\iftongji@arialtoc
\DeclareOption{arialtoc}{\tongji@arialtoctrue}
\newif\iftongji@arialtitle
\DeclareOption{arialtitle}{\tongji@arialtitletrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{gbk,arialtitle}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany]{book}
\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{indentfirst}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{xunicode,xltxtra}
\RequirePackage[CJKspace,CJKmath]{xeCJK}
\RequirePackage{CJKnumb}
\punctstyle{kaiming}
% todo: minor fix of CJKnumb
\def\CJK@null{\kern\CJKnullspace\Unicode{48}{7}\kern\CJKnullspace}
\defaultfontfeatures{Mapping=tex-text} % after fontspec
\setCJKmainfont[BoldFont={Adobe Heiti Std}, ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
\setCJKsansfont{Adobe Heiti Std}
\setCJKmonofont{Adobe Kaiti Std}
\setCJKfamilyfont{song}{Adobe Song Std}
\setCJKfamilyfont{hei}{Adobe Heiti Std}
\setCJKfamilyfont{fs}{Adobe Fangsong Std}
\setCJKfamilyfont{kai}{Adobe Kaiti Std}
\setCJKfamilyfont{li}{Adobe Kaiti Std} % todo: 用隶书字体代替
\setCJKfamilyfont{you}{Adobe Kaiti Std} % todo: 用幼圆字体代替

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[numbers,super,sort&compress]{natbib}
\RequirePackage{hyperref}
\hypersetup{CJKbookmarks=true}
\hypersetup{%
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  %pdfpagelabels=true,
  pdfborder=0 0 0}
\urlstyle{same}
\RequirePackage{hypernat}
\RequirePackage{caption}
\RequirePackage{topsection}
%\RequirePackage{titletoc}
%\RequirePackage{titlesec}
%\RequirePackage{parskip}
%\RequirePackage{tocvsec2}

\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{tongji@empty}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{tongji@headings}}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}

%------------font-------------------
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}
\newcommand{\li}{\CJKfamily{li}}        % 隶书
\def\lishu{\li}
\newcommand{\you}{\CJKfamily{you}}      % 幼圆
\def\youyuan{\you}
\newlength\tongji@linespace
%\newcommand{\tongji@choosefont}[2]{%
%   \setlength{\tongji@linespace}{#2*\real{#1}}%
%   \fontsize{#2}{\tongji@linespace}\selectfont}
\def\tongji@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \tongji@choosefont{##1}{#2}}}
%------------
\tongji@define@fontsize{chuhao}{42bp}
\tongji@define@fontsize{xiaochu}{36bp}
\tongji@define@fontsize{yihao}{26bp}
\tongji@define@fontsize{xiaoyi}{24bp}
\tongji@define@fontsize{erhao}{22bp}
\tongji@define@fontsize{erhaoban}{20bp}
\tongji@define@fontsize{xiaoer}{18bp}
\tongji@define@fontsize{sanhao}{16bp}
\tongji@define@fontsize{xiaosan}{15bp}
\tongji@define@fontsize{sihao}{14bp}
\tongji@define@fontsize{banxiaosi}{13bp}
\tongji@define@fontsize{xiaosi}{12bp}
\tongji@define@fontsize{dawu}{11bp}
\tongji@define@fontsize{wuhao}{10.5bp}
\tongji@define@fontsize{xiaowu}{9bp}
\tongji@define@fontsize{liuhao}{7.5bp}
\tongji@define@fontsize{xiaoliu}{6.5bp}
\tongji@define@fontsize{qihao}{5.5bp}
\tongji@define@fontsize{bahao}{5bp}
%-----------------------normalisze------------------------
% \renewcommand\normalsize{%
  % \@setfontsize\normalsize{12bp}{20bp}
  % \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  % \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  % \belowdisplayskip=\abovedisplayskip
  % \belowdisplayshortskip=\abovedisplayshortskip}
%
%\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
%\AtBeginDvi{\special{!%
%      \@percentchar\@percentchar BeginPaperSize: a4
%      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
%setlength
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-6.4cm}
\setlength{\oddsidemargin}{3.2cm-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\headheight}{20pt}
\setlength{\topskip}{0pt}
\setlength{\skip\footins}{15pt}
\setlength{\topmargin}{2.8cm-1in}
\setlength{\footskip}{1.5cm}
\setlength{\headsep}{0.5cm}
\addtolength{\textheight}{-8.6cm}
%
\let\tongji@cleardoublepage\cleardoublepage
%newcommand
\newcommand{\tongji@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\tongji@cleardoublepage}}
%
\let\cleardoublepage\tongji@clearemptydoublepage
%empty
\def\ps@tongji@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
%plain
\def\ps@tongji@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}
% tongji@headings
%\def\ps@tongji@headings{%
%  \def\@oddhead{\vbox to\headheight{%
%      \hb@xt@\textwidth{\hfill\wuhao\song\leftmark\hfill}%
%      \vskip 2pt\hbox{\vrule width\textwidth height 0.4pt depth 0pt}}}
%  \def\@evenhead{\vbox to\headheight{%
%      \hb@xt@\textwidth{\wuhao\song%
%      \hfill\leftmark\hfill}%
%      \vskip 2pt\hbox{\vrule width\textwidth height 0.4pt depth 0pt}}}
%  \def\@oddfoot{\hfil\wuhao\thepage\hfil}
%  \let\@evenfoot=\@oddfoot}
% chaptermark
%\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
%CJK setting
\newlength\CJK@twochars
\def\CJK@spaceChar{\Unicode{48}{7}}

%parindent
\def\CJKindent{%
  \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
  \parindent\CJK@twochars}
%parskip
\setlength{\parskip}{2pt}%0pt \@plus2pt \@minus0pt}

% item space
%\def\tongji@item@space{%
%  \let\itemize\compactitem
%  \let\enditemize\endcompactitem
%  \let\enumerate\compactenum
%  \let\endenumerate\endcompactenum
%  \let\description\compactdesc
%  \let\enddescription\endcompactdesc}
%makeperpage
%\newcommand*\MakePerPage[2][\@ne]{%
%  \expandafter\def\csname c@pchk@#2\endcsname{\c@pchk@{#2}{#1}}%
%  \newcounter{pcabs@#2}%
%  \@addtoreset{pchk@#2}{#2}}
%pagecontroll
%\def\new@pagectr#1{\@newl@bel{pchk@#1}}
%c@pchk@
%\def\c@pchk@#1#2{\z@=\z@
%  \begingroup
%  \expandafter\let\expandafter\next\csname pchk@#1@\arabic{pcabs@#1}\endcsname
%  \addtocounter{pcabs@#1}\@ne
%  \expandafter\ifx\csname pchk@#1@\arabic{pcabs@#1}\endcsname\next
%  \else \setcounter{#1}{#2}\fi
%  \protected@edef\next{%
%    \string\new@pagectr{#1}{\arabic{pcabs@#1}}{\noexpand\thepage}}%
%  \protected@write\@auxout{}{\next}%
%  \endgroup\global\z@}
%
%\MakePerPage{footnote}
%textcircled
%\def\tongji@textcircled#1{%
%  \ifnum \value{#1} <10 \textcircled{\xiaoliu\arabic{#1}}
%  \else\ifnum \value{#1} <100 \textcircled{\qihao\arabic{#1}}\fi
%  \fi}
%
%\renewcommand{\thefootnote}{\tongji@textcircled{footnote}}
%\renewcommand{\thempfootnote}{\tongji@textcircled{mpfootnote}}
%
%\def\footnoterule{\vskip-3\p@ \hrule \@width0.3\textwidth \@height0.4\p@ \vskip2.6\p@}
%\let\tongji@footnotesize\footnotesize
%
%\renewcommand\footnotesize{\tongji@footnotesize\xiaowu[1.5]}
%makefnmark
\def\@makefnmark{\textsuperscript{\hbox{\normalfont\@thefnmark}}}
%makefntext
\long\def\@makefntext#1{
    \bgroup
      \setbox\@tempboxa\hbox{%
        \hb@xt@ 2em{\@thefnmark\hss}}
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      #1
    \par\egroup}
%
\allowdisplaybreaks[4]
\gdef\@endtrivlist#1{%  % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
    \ifdim\lastskip >\z@ #1\unskip \par  %<<<<<<<<<<<<<<<<<<<<<<
      \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
    \ifdim\lastskip >\z@
       \@tempskipa\lastskip \vskip -\lastskip
      \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
      \vskip\@tempskipa
    \fi
    \@endparenv
  \fi #1}
%\theorembodyfont{\song\rmfamily}
%\theoremheaderfont{\hei\rmfamily}
%\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
%\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
%\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
%\setlength{\@fptop}{0bp \@plus1.0fil}
%\setlength{\@fpsep}{12bp \@plus2.0fil}
%\setlength{\@fpbot}{0bp \@plus1.0fil}
%\renewcommand{\textfraction}{0.15}
%\renewcommand{\topfraction}{0.85}
%\renewcommand{\bottomfraction}{0.65}
%\renewcommand{\floatpagefraction}{0.60}
%\def\hlinewd#1{%
%  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
%    \reserved@a\@xhline}
%\iftongji@arialtitle
%  \def\tongji@title@font{\sffamily}
%\fi
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
                    \thispagestyle{tongji@headings}%
                    \global\@topnum\z@%
                    \@afterindenttrue%
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
     \refstepcounter{chapter}%
     \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}%TODO: shit
   \else
     \addcontentsline{toc}{chapter}{#1}%
   \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}}
%makechapterhead
\def\@makechapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
    \hei\bfseries\csname tongji@title@font\endcsname\sanhao[1]
    \ifnum \c@secnumdepth >\m@ne
      \@chapapp\hskip 1em
    \fi
    #1\par\nobreak
    \vskip 24bp}}
%@schapter
\def\@schapter#1{%
  \@makeschapterhead{#1}
  \@afterheading}
%@makeschapterhead
\def\@makeschapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
   \hei\csname tongji@title@font\endcsname\sanhao[1]
     \def\@tempa{#1}
     \def\@tempb{\eabstractname}
     \ifx\@tempa\@tempb\bfseries\fi
   \interlinepenalty\@M
   #1\par\nobreak
   \vskip 24bp}}
%
\newcounter{tongji@bookmark}
%tongji@chapter
\def\tongji@chapter*{%
  \@ifnextchar [ % ]
    {\tongji@@chapter}
    {\tongji@@chapter@}}
\def\tongji@@chapter@#1{\tongji@@chapter[#1]{#1}}
\def\tongji@@chapter[#1]#2{%
  \@ifnextchar [ % ]
    {\tongji@@@chapter[#1]{#2}}
    {\tongji@@@chapter[#1]{#2}[]}}
\def\tongji@@@chapter[#1]#2[#3]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \def\@tmpa{#1}
  \def\@tmpb{#3}
  \ifx\@tmpa\@empty
    \addtocounter{tongji@bookmark}\@ne
    \pdfbookmark[0]{#2}{tongjichapter.\thetongji@bookmark}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \chapter*{#2}
  \ifx\@tmpb\@empty
    \@mkboth{#2}{#2}
  \else
    \@mkboth{#3}{#3}
  \fi}