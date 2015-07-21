
# latex-french-report

Document class for french reports

## Installation

```bash
pdflatex modele.tex
bibtex modele
pdflatex modele.tex
```


## Documentation


### First page
```latex
\maketitle
\newpage
```

You'll have to change the config file according to your specific informations

### Table of contents
```latex
\tableofcontents[Contents] % Without argument, the title will be 'Sommaire'
```

### List of figures
```latex
\listoffigures[Figures] % Without argument, the title will be 'Liste des figures'
```

### Bibliography
```latex
\nocite{*} % Bibliographie
\bibliographystyle{plain}
\renewcommand{\bibname}{References}
\bibliography{modele}
```

### Sections
```latex
\chapter{Exemple de chapitre}
\section{Exemple de section}
\subsection{Exemple de section}
\subsubsection{Exemple de section}
```

### Figure
```latex
\fig{img/autruche.jpg}{0.4}{Label}{Caption}
\figRotate{img/autruche.jpg}{0.4}{Label and caption}{90}
```

### Source code
```latex
\usepackage{sourcecode}

\shorthandoff{!}
\lstset{language=R}
\shorthandon{!}

\begin{document}

\vspace*{5mm} \begin{lstlisting}
qt(c(0.975), df=9, lower.tail=TRUE)
[1] 2.262157 <br \>
\end{lstlisting} \par
```
