\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2022/05/20 Resume Class]
\LoadClass[11pt]{article}

%------------------------------------------------------------------------------
% Packages
%------------------------------------------------------------------------------
\usepackage{fontawesome5}
\usepackage{polyglossia}
\usepackage{blindtext}
\usepackage{fontspec}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{parskip}
\usepackage{xcolor}
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

\definecolor{RaisinBlack}{HTML}{252323}
\definecolor{CornflowerBlue}{HTML}{648DE5}
\definecolor{AppleGreen}{HTML}{7FB800}
\definecolor{RustyRed}{HTML}{DE3C4B}

\colorlet{TextColor}{RaisinBlack!10}
\colorlet{NoteColor}{RaisinBlack!60}
\colorlet{PageColor}{RaisinBlack!100}
\colorlet{AccentColor}{RustyRed}

% \colorlet{TextColor}{RaisinBlack!100}
% \colorlet{NoteColor}{RaisinBlack!60}
% \colorlet{PageColor}{RaisinBlack!10}
% \colorlet{AccentColor}{CornflowerBlue}

\color{TextColor}
\pagecolor{PageColor}

%------------------------------------------------------------------------------
% Configure hyperref
%------------------------------------------------------------------------------
\hypersetup{
    colorlinks=true,
    linkcolor=TextColor,
    filecolor=TextColor,
    urlcolor=TextColor
}

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
\newcommand{\cvsocials}{
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
}
\newcommand{\makecvtitle}{
    \begin{center}
        {\Huge\bfseries\@name}\vspace{0.25em}\\
        {\large\textcolor{AccentColor}{\@position}}\vspace{0.25em}\\
        {\small\textcolor{NoteColor}{\@address}}\vspace{0.25em}\\
        {\small\cvsocials}
    \end{center}
}
\newcommand{\cvseparator}{\textcolor{NoteColor}{ | }}
\newcommand{\cvrule}{
    \vspace{0.25em}
    \textcolor{NoteColor}{\rule{\textwidth}{0.25em}}
    \vspace{-0.50em}
}
\newcommand{\cvsection}[1]{
    \vspace{1em}
    {\large\bfseries\textcolor{AccentColor}{#1}}
}
\newcommand{\cventryi}[1]{
    \item[]
        {#1}
}
\newcommand{\cventryii}[2]{
    \item[]
        {#1}\hfill\textcolor{NoteColor}{#2}
}
\newcommand{\cventryiv}[4]{
    \item[]
        {\large\bfseries #1}\hfill{\large\bfseries\textcolor{NoteColor}{#2}}\\
        {#3}\hfill\textcolor{NoteColor}{#4}
}

%------------------------------------------------------------------------------
% Environments
%------------------------------------------------------------------------------
\newenvironment{cventries}
    {\begin{itemize}[leftmargin=0cm, rightmargin=0cm]}
    {\end{itemize}}
