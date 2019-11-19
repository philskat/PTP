% !TEX root=main.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ptp}[2019-07-17]

\LoadClass[fontsize=12pt, parskip]{scrartcl}

\usepackage[top=3cm, bottom=3cm, left=3.5cm, right=3.5cm]{geometry}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{tabu}
\usepackage[onehalfspacing]{setspace}
\usepackage{scrlayer-scrpage}
\usepackage[ngerman]{babel}
\usepackage[utf8]{inputenc}
\usepackage[ddmmyyyy]{datetime}

\renewcommand{\dateseparator}{.}

\makeatletter

\newcommand{\@ptp}{1}
\newcommand{\ptp}[1]{\gdef\@ptp{#1}}

\newcommand{\@studiengang}{}
\newcommand{\studiengang}[1]{\gdef\@studiengang{#1}}

\newcommand{\@thema}{}
\newcommand{\thema}[1]{\gdef\@thema{#1}}

\newcommand{\@geb}{}
\newcommand{\@gebort}{}
\newcommand{\@address}{}
\newcommand{\@matrikelnr}{}
\renewcommand{\author}[5]{
	\gdef\@author{#1}
	\gdef\@geb{#2}
	\gdef\@gebort{#3}
	\gdef\@address{#4}
	\gdef\@matrikelnr{#5}
}

\newcommand{\@studiengruppe}{}
\newcommand{\studiengruppe}[1]{\gdef\@studiengruppe{#1}}

\newcommand{\@betreuer}{}
\newcommand{\betreuer}[1]{\gdef\@betreuer{#1}}

\newcommand{\@zbetreuer}{1}
\newcommand{\zbetreuer}[1]{\gdef\@zbetreuer{#1}}

\newcommand{\@modul}{}
\newcommand{\modul}[1]{\gdef\@modul{#1}}

\newcommand{\@abgabe}{}
\newcommand{\abgabe}[1]{\gdef\@abgabe{#1}}

\newcommand{\@ort}{}
\newcommand{\ort}[1]{\gdef\@ort{#1}}

\renewcommand{\@maketitle}{
	\begin{center}
	\includegraphics[width=14cm]{Bilder/HS-Logo.png} \\
	\vspace{-0.25cm}
	\textsc{\textcolor{black!50}{Institut Für Duale Studiengänge}} \\
	\vspace{1cm}
	\if\@ptp1
	Praxistransferprojekt
	\else
	Hausarbeit
	\fi
	im Studiengang \@studiengang \\
	\vspace{1cm}
	{\huge \bfseries \@thema}
	\vspace{1cm}
	\begin{tabbing}
		Das ist nur Text zur Ausrichtung \= des Tabstops \kill
		Eingereicht von: \> \@author \\
		\> geb.: \@geb{} in \@gebort \\
		\\
		\> \@address \\
		\\
		Matrikelnummer: \> \@matrikelnr \\
		Studiengruppe: \> \@studiengruppe \\
		\\
		Betreuer: \> \@betreuer \\
		\if\@zbetreuer1
		\\
		\else
		Zweiter Betreuer: \> \@zbetreuer \\ \\
		\fi
		Modul: \> \@modul \\
		\\
		Abgabedatum: \> \@abgabe \\
	\end{tabbing}
	\end{center}
	\pagenumbering{Roman}
	\newpage
}

\newcommand{\addtitleNoNumberNoTOC}[1]{\ihead*{#1} \section*{#1}}
\newcommand{\addtitleNoNumber}[1]{\addtitleNoNumberNoTOC{#1} \addcontentsline{toc}{section}{#1}}
\newcommand{\addtitle}[1]{\ihead*{#1} \section{#1}}

\newcommand{\eid}{
	\addtitleNoNumber{Eidesstattliche Erklärung}
	Ich erkläre an Eides statt, dass ich\if\@ptp1 mein Praxistransferprojekt \else{} meine Hausarbeit\fi
	
	\@thema
	
	selbstständig und ohne fremde Hilfe angefertigt habe und dass ich alle von anderen Autoren wörtlich
	übernommenen Stellen wie auch die sich an die Gedankengänge anderer Autoren eng anlehnenden
	Ausführungen meiner Arbeit besonders gekennzeichnet und die Quellen zitiert habe.
	
	\vspace{1cm}
	\begin{center}
	\tabulinesep=0,25cm
	\begin{tabu} to \textwidth { X[3,c] X[1,c] X[3,c] }
	\@ort{}, den \today & & \includegraphics[width=3cm]{Bilder/Unterschrift.png} \\
	\cline{1-1} \cline{3-3}
	Ort, Datum & & Unterschrift \\
	\end{tabu}
	\end{center}
}

\makeatother