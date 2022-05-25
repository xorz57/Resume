\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2022/05/20 Resume Class]
\LoadClass[12pt]{article}

%------------------------------------------------------------------------------
% Packages
%------------------------------------------------------------------------------
\usepackage[stamp=true]{draftwatermark}
\usepackage{fontawesome5}
\usepackage{polyglossia}
\usepackage{blindtext}
\usepackage{fontspec}
\usepackage{geometry}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{fancyhdr}
\usepackage{parskip}
\usepackage[svgnames]{xcolor}
\usepackage{ifthen}
\usepackage{xparse}

%------------------------------------------------------------------------------
% Configure polyglossia
%------------------------------------------------------------------------------
\setdefaultlanguage{english}
\setotherlanguages{greek}

%------------------------------------------------------------------------------
% Configure fontspec
%------------------------------------------------------------------------------
\setmainfont{Roboto}
\setmonofont{Roboto Mono}

%------------------------------------------------------------------------------
% Configure xcolor
%------------------------------------------------------------------------------
\definecolor{Primary}{HTML}{212121}
\definecolor{Secondary}{HTML}{00A388}

\color{Primary}

%------------------------------------------------------------------------------
% Configure draftwatermark
%------------------------------------------------------------------------------
\SetWatermarkText{draft}
\SetWatermarkScale{2}

%------------------------------------------------------------------------------
% Configure hyperref
%------------------------------------------------------------------------------
\hypersetup{
    colorlinks=true,
    linkcolor=Primary,
    filecolor=Primary,
    urlcolor=Primary
}

%------------------------------------------------------------------------------
% Configure geometry
%------------------------------------------------------------------------------
\geometry{a4paper, top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm}

%------------------------------------------------------------------------------
% Configure fancyhdr
%------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%------------------------------------------------------------------------------
% Commands
%------------------------------------------------------------------------------
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand{\makecvheader}{
    \begin{flushleft}
        {\Huge\bfseries\@name}\vspace{0.25em}\\
        {\small\textcolor{Secondary}{\@position}}\vspace{0.25em}\\
        {\small\itshape\textcolor{Primary!50}{\@address}}\vspace{0.25em}\\
        \ifthenelse
            {\isundefined{\@mobile}}
            {}
            {\href{tel:\@mobile}{\faMobile\space\@mobile}}
        \ifthenelse
            {\isundefined{\@email}}
            {}
            {\href{mailto:\@email}{\faEnvelope\space\@email}}
        \ifthenelse
            {\isundefined{\@github}}
            {}
            {\href{https://github.com/\@github}{\faGithub\space\@github}}
        \ifthenelse
            {\isundefined{\@linkedin}}
            {}
            {\href{https://linkedin.com/in/\@linkedin}{\faLinkedin\space\@linkedin}}
    \end{flushleft}
}
\newcommand{\makecvfooter}[3]{
    \fancyfoot[L]{\textcolor{Primary!50}{#1}}
    \fancyfoot[C]{\textcolor{Primary!50}{#2}}
    \fancyfoot[R]{\textcolor{Primary!50}{#3}}
}
\newcommand{\cvseparator}{\textcolor{Primary!50}{ | }}
\newcommand{\cvsection}[1]{\vspace{1em}{\large\bfseries #1}}
\newcommand{\cventryi}[1]{\item[] {#1}}
\newcommand{\cventryii}[2]{\item[] {#1}\hfill\textcolor{Primary!50}{#2}}
\newcommand{\cventryiv}[4]{\item[]
    {#1}\hfill\textcolor{Primary!50}{#2}\\
    {#3}\hfill\textcolor{Primary!50}{#4}
}

%------------------------------------------------------------------------------
% Environments
%------------------------------------------------------------------------------
\newenvironment{cventries}
    {\begin{itemize}[leftmargin=0cm, rightmargin=0cm]}
    {\end{itemize}}
