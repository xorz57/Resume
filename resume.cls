\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2022/05/20 Resume Class]
\LoadClass[12pt]{article}

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

\setdefaultlanguage{english}
\setotherlanguages{greek}

\setmainfont{Roboto}
\setmonofont{Roboto Mono}

\definecolor{primary}{HTML}{212121}
\definecolor{secondary}{HTML}{00A388}

\color{primary}

\hypersetup{
    colorlinks=true,
    linkcolor=primary,
    filecolor=primary,
    urlcolor=primary
}

\geometry{a4paper, top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm}

\pagestyle{fancy}
\fancyhead{}
\fancyfoot[C]{\textcolor{primary!50}{Resume}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}

\newcommand{\makecvsocials}{
\begin{center}
    {\Huge\bfseries Georgios Fotopoulos}\vspace{0.25em}\\
    {\small\textcolor{secondary}{Software Engineer}}\vspace{0.25em}\\
    {\small\itshape\textcolor{primary!50}{Gkoura 98, Piraeus 18546, Greece}}\\
    \ifthenelse
        {\isundefined{\@mobile}}
        {}
        {\href{tel:\@mobile}{\faPhone\space\@mobile} \sep }
    \ifthenelse
        {\isundefined{\@email}}
        {}
        {\href{mailto:\@email}{\faEnvelope\space\@email} \sep }
    \ifthenelse
        {\isundefined{\@github}}
        {}
        {\href{https://github.com/\@github}{\faGithub\space\@github} \sep }
    \ifthenelse
        {\isundefined{\@linkedin}}
        {}
        {\href{https://linkedin.com/in/\@linkedin}{\faLinkedin\space\@linkedin}}
\end{center}
}

\newcommand{\sep}{\textcolor{primary!50}{ | }}
\newcommand{\cvsection}[1]{\vspace{1em}{\large\bfseries #1}}
\newcommand{\cventryii}[2]{\item[] {#1}\hfill\textcolor{primary!50}{#2}}
\newcommand{\cventryiv}[4]{\item[]
    {#1}\hfill\textcolor{primary!50}{#2}\\
    {#3}\hfill\textcolor{primary!50}{#4}
}

\newenvironment{cventries}{\begin{itemize}[leftmargin=0cm, rightmargin=0cm]}{\end{itemize}}
\newenvironment{cvparagraph}{}{\par}
