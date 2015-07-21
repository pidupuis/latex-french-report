
latex-french-report
======================

Document class for french reports. Includes a
Created by <a href="https://github.com/pidupuis">Pierre DUPUIS</a> - 2012-2015 <br />

======================




# Installation

```bash
pdflatex modele.tex
bibtex modele
pdflatex modele.tex
```


# Documentation


### First page
> \maketitle<br \>
> \newpage<br \>

/!\ You have to change the config file according to your specific informations <br \>
> \author{Pierre} % Author name <br \>
> \title{Pidupuis model} % Report title <br \>
> \subtitle{A french {\LaTeX} report model} % Report subtitle <br \>
> \llogo{img/autruche.jpg}{0.2} % Top left logo <br \>
> \clogo{img/autruche.jpg}{0.2} % Top center logo <br \>
> \rlogo{img/autruche.jpg}{0.2} % Top right logo <br \>
> \banner{img/autruche.jpg}{0.5} % Big center picture <br \>

### Table of contents
> \tableofcontents[Contents] % Without argument, the title will be 'Sommaire' <br \>

### List of figures
> \listoffigures[Figures] % Without argument, the title will be 'Liste des figures' <br \>

### Bibliography
> \nocite{*} % Bibliographie <br \>
> \bibliographystyle{plain} <br \>
> \renewcommand{\bibname}{References} <br \>
> \bibliography{modele} <br \>

/!\ You need to create a .bib file (modele.bib in the example) which contains the bibliography informations <br \>

### File including
> \include{include/export} <br \>

/!\ To include a .tex file, you do not have to precise the file extension. <br \>

### Title
> \chapter{Exemple de chapitre} <br \>
> \section{Exemple de section} <br \>
> \subsection{Exemple de section} <br \>
> \subsubsection{Exemple de section} <br \>

### Figure
> \fig{img/autruche.jpg}{0.4}{Autruche (label)}{Autruche (caption)} <br \>

### Source code
> \usepackage{sourcecode}<br \>
> \begin{document}<br \>
> \shorthandoff{!}<br \>
> \lstset{language=R}<br \>
> \shorthandon{!}<br \>
> \vspace*{5mm} \begin{lstlisting} <br \>
> qt(c(0.975), df=9, lower.tail=TRUE) <br \>
> [1] 2.262157 <br \>
> \end{lstlisting} \par <br \>
