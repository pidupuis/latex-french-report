%% 
%% Created by Pierre DUPUIS - 2012-2013
%% Document class which modify the classical report to be closer the french student habits
%%
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frenchreport}

% Class & options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\LoadClassWithOptions{report}%

% Packages
\RequirePackage{fancyhdr}%
\RequirePackage{graphicx}%

% Header and footer
\rhead{}%
\chead{}%
\lhead{}%
\rfoot{}%
\cfoot{\hspace{20mm}--- $\thepage$ ---}% On affiche le numero de page au centre du pied de page.
\lfoot{}%
\renewcommand*{\headrulewidth}{0px}% Retire le trait horizontal en dessous du header.
\renewcommand*{\footrulewidth}{0px}% Retire le trait horizontal au dessus du footer.
\setlength{\headheight}{23pt}% Correction erreur package fancyhdr.
\pagestyle{fancy}% Positionne header et footer sur toutes les pages.

% Sommaire
\let\tableofcontentsOld\tableofcontents% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\tableofcontents[1][Sommaire] {%
	\let\thepageOld\thepage
	\renewcommand*\thepage {%
	}%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\renewcommand*\contentsname{\textsc{{#1}}}% On renomme le titre de la table des matiere avec l'argument (Sommaire par defaut)
	\tableofcontentsOld% On affiche la table des matieres.
	\cfoot{}% On retire le numero de page dans le pied de page.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\pagenumbering{arabic}% On met les numeros en chiffres arabes.
	\setcounter{page}{1}% On remet le compteur de page a 1.
	\cfoot{\hspace{20mm}--- $\thepage$ ---}% On remet le numero de page dans le pied de page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\pagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
	\let\thepage\thepageOld%
}%

% List of figures
\let\listoffiguresOld\listoffigures% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\listoffigures[1][Liste des figures] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\renewcommand*\listfigurename{\textsc{{#1}}}% On renomme le titre de la table des matiere avec l'argument (Liste des figures par defaut)
	\listoffiguresOld% On affiche la table des matieres.
	\cfoot{}% On retire le numero de page dans le pied de page.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\pagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
}%

% Bibliography
\let\bibliographyOld\bibliography% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\bibliography[1] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\bibliographyOld{#1}% On affiche la table des matieres.
	\cfoot{}% On retire le numero de page dans le pied de page.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\pagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
}%

% Counters
\newcounter{chapterCounter}			  % Compteur pour numerotation automatique des chapitres.
\setcounter{chapterCounter}{0}			  % On démarre a 0 car on incremente au debut de chaque chapitre.
\newcounter{sectionCounter}[chapterCounter]	  % Compteur pour numerotation automatique des sections.
\newcounter{subsectionCounter}[sectionCounter]	  % Compteur pour numerotation automatique des subsections.
\newcounter{subsubsectionCounter}[sectionCounter] % Compteur pour numerotation automatique des subsubsections.

% Chapter
\let\chapterOld\chapter% On conserve la premiere version de la commande chapter pour eviter la recursivite
\renewcommand*\chapter[1]{%
	\refstepcounter{chapterCounter}%
	\chapterOld*{\uppercase\expandafter{\romannumeral \thechapterCounter} \hspace*{5mm} {#1}} % Chiffres romains majuscules
	\addcontentsline{toc}{chapter}{\uppercase\expandafter{\romannumeral \thechapterCounter} \hspace*{5mm} {#1}}%
	\thispagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\vspace*{-10mm}
}%
\let\chapterNew\chapter % On cree une commande contenant la version modifiee de chapter pour la remettre dans sommaire

% Chapter sans numerotation (intro, conclu, ...)
\newcommand*\chapterExtra[1]{%
	\let\chapter\chapterOld%
	\chapter*{{#1}}
	\addcontentsline{toc}{chapter}{{#1}}
	\thispagestyle{fancy}%
	\vspace*{-10mm}
	\let\chapter\chapterNew%
}%

% Section
\let\sectionOld\section%
\renewcommand*\section[1]{%
	\refstepcounter{sectionCounter}%
	\vspace*{-5mm}%
    	\sectionOld*{\hspace*{8mm} \thechapterCounter.\thesectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{section}{\thechapterCounter.\thesectionCounter \hspace*{5mm} {#1}}%
}%

% Subection
\let\subsectionOld\subsection%
\renewcommand*\subsection[1]{%
	\refstepcounter{subsectionCounter}%
	\vspace*{0mm}%
    	\subsectionOld*{\hspace*{16mm} \thechapterCounter.\thesectionCounter.\thesubsectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{section}{\hspace*{5mm} \thechapterCounter.\thesectionCounter.\thesubsectionCounter \hspace*{5mm} {#1}}%
}%

% Subsection
\let\subsubsectionOld\subsubsection%
\renewcommand*\subsubsection[1]{%
	\refstepcounter{subsubsectionCounter}%
	\vspace*{0mm}%
    	\subsubsectionOld*{\hspace*{24mm} \thechapterCounter.\thesectionCounter.\thesubsectionCounter.\thesubsubsectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{section}{\hspace*{10mm} \thechapterCounter.\thesectionCounter.\thesubsectionCounter.\thesubsubsectionCounter \hspace*{5mm} {#1}}%
}%

% FIGURE
\newcommand*\fig[3]{% Fonction qui affiche une image de maniere centree et accompagnee de sa legende
      \begin{figure}[h!]%
      \begin{center}%
      	\includegraphics[scale={#2}]{{#1}}%
	\caption{{#3}}%
	\label{{#3}}%
      \end{center}%
      \end{figure}%
}%

\newcommand*\figRotate[4]{% Fonction qui affiche une figure selon un certain angle de rotation (utile pour les figures au format paysage)
      \begin{figure}[h!]%
      \begin{center}%
      	\includegraphics[scale={#2}, angle={#4}]{{#1}}%
	\caption{{#3}}%
	\label{{#3}}%
      \end{center}%
      \end{figure}%
}%

\setlength{\parindent}{1cm}% Alinea pre-paragraphe
\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% Espace post-paragraphe
\renewcommand{\baselinestretch}{1.5}% Interligne

% PAGE DE GARDE
\newcommand*\subtitle[1]{%
	\newcommand*\@subtitle{{#1}}% Si subtitle est invoque, on cree une variable du meme nom
}%
\newcommand*\llogo[2]{%
	\newcommand*\@llogo{% Logo a gauche (l)
		\includegraphics[scale={#2}]{{#1}}% Si llogo est invoque, on cree un variable du meme nom qui affiche la figure
	}%
}%
\newcommand*\clogo[2]{%
	\newcommand*\@clogo{% Logo au centre (c)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\rlogo[2]{%
	\newcommand*\@rlogo{% Logo a droite (r)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\banner[2]{%
	\newcommand*\@banner{% Image pour illustrer la page de garde
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\renewcommand*\maketitle{% On redefinit maketitle
	\thispagestyle{empty}% On enleve pied de page et en-tete
	\ifx\@clogo\@undefined% S'il n'y a pas de logo central (car generalement on en met que deux)
		\noindent \@llogo \hspace*{\stretch{1}} \@rlogo% on affiche que les logos de gauche et droite
	\else% sinon
		\noindent \@llogo \hspace*{\stretch{1}} \@clogo \hspace*{\stretch{1}} \@rlogo% on affiche les trois logos
	\fi%
	\vfill% longueur elastique de coefficient 1 permettant de separer la page verticalement grace aux vfill suivant
	\begin{center}%	
		\begin{LARGE}%
			\@title \\% Affiche le titre
			\vspace*{-5mm} \hrulefill \\% cree une ligne horizontale entre le titre et le sous-titre
			\@subtitle% Affiche le sous-titre
		\end{LARGE}%
		\vfill%
		\ifx\@banner\@undefined% si la figure de page de garde n'existe pas
		\else% on ne fait rien, sinon
			\@banner% on l'affiche
		\fi%
		\vfill%
		\begin{large}%
			\@date \\% affiche la date de compilation
			\textsc{\@author} \\% affiche l'auteur en lettre capitale
		\end{large}%
	\end{center}%
	\newpage% insere un saut de page
}%

