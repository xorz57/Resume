\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2022/05/20 Resume Class]
\LoadClass[12pt]{article}

%------------------------------------------------------------------------------
% Packages
%------------------------------------------------------------------------------
\usepackage{fontawesome5}
\usepackage{polyglossia}
\usepackage{blindtext}
\usepackage{fontspec}
\usepackage{geometry}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{fancyhdr}
\usepackage{parskip}
\usepackage{xcolor}
\usepackage{ifthen}
\usepackage{xparse}

%------------------------------------------------------------------------------
% Languages
%------------------------------------------------------------------------------
\setdefaultlanguage{english}
\setotherlanguages{greek}

%------------------------------------------------------------------------------
% Fonts
%------------------------------------------------------------------------------
\setmainfont{Roboto}
\setmonofont{Roboto Mono}

%------------------------------------------------------------------------------
% Colors
%------------------------------------------------------------------------------
\definecolor{Primary}{HTML}{212121}
\definecolor{Secondary}{HTML}{00A388}

\color{Primary}

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
\fancyfoot[C]{\textcolor{Primary!50}{Resume}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%------------------------------------------------------------------------------
% Commands
%------------------------------------------------------------------------------
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand{\makecvsocials}{
    \begin{center}
        {\Huge\bfseries Georgios Fotopoulos}\vspace{0.25em}\\
        {\small\textcolor{Secondary}{Software Engineer}}\vspace{0.25em}\\
        {\small\itshape\textcolor{Primary!50}{Gkoura 98, Piraeus 18546, Greece}}\\
        \ifthenelse
            {\isundefined{\@mobile}}
            {}
            {\href{tel:\@mobile}{\faPhone\space\@mobile} \cvseparator }
        \ifthenelse
            {\isundefined{\@email}}
            {}
            {\href{mailto:\@email}{\faEnvelope\space\@email} \cvseparator }
        \ifthenelse
            {\isundefined{\@github}}
            {}
            {\href{https://github.com/\@github}{\faGithub\space\@github} \cvseparator }
        \ifthenelse
            {\isundefined{\@linkedin}}
            {}
            {\href{https://linkedin.com/in/\@linkedin}{\faLinkedin\space\@linkedin}}
    \end{center}
}
\newcommand{\cvseparator}{\textcolor{Primary!50}{ | }}
\newcommand{\cvsection}[1]{\vspace{1em}{\large\bfseries #1}}
\newcommand{\cventryi}[1]{\item[] \textcolor{Primary!50}{#1}}
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
\newenvironment{cvparagraph}
    {}
    {\par}
