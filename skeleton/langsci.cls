\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{langsci}[2014/03/03 Language Science Press]

% Default values:
\usepackage{xspace}
\newcommand{\lsp}{Language Science Press\xspace}
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsISBN}{????????}
\newcommand{\lsURL}{http://langsci-press.org/catalog}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{long}
\newcommand{\lsFontsize}{11pt}
\newcommand{\lsCopyright}{CC-BY}
\newif\iflsDraft \lsDraftfalse
\newif\iflsIndex \lsIndextrue

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Option handling              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langsci,
	prefix=langsci@ }
\DeclareStringOption{number}[??]
	\define@key{langsci}{number}{%
		\renewcommand{\lsSeriesNumber}{#1}}
\DeclareStringOption{isbn}[????????]
	\define@key{langsci}{isbn}{%
		\renewcommand{\lsISBN}{#1}}
\DeclareStringOption{url}[http://langsci-press.org/catalog]
	\define@key{langsci}{url}{%
		\renewcommand{\lsURL}{#1}}
\DeclareStringOption{series}[eotms]
	\define@key{langsci}{series}{%
		\renewcommand{\lsSeries}{#1}}
\DeclareStringOption{output}[long]
	\define@key{langsci}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareStringOption{copyright}[CC-BY]
	\define@key{langsci}{copyright}{%
		\renewcommand{\lsCopyright}{#1}}
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{long}{
	\renewcommand{\lsOutput}{long}}
\DeclareVoidOption{smallfont}{  			
	\renewcommand{\lsFontsize}{10pt}}
\DeclareVoidOption{draftmode}{	% 'draftmode' instead of 'draft' due to undesirable side efects	
	 \lsDrafttrue
 	 \overfullrule=5pt	}	% to indicate overfull hboxes
\DeclareVoidOption{noindex}{  			
	\lsIndexfalse }
\ProcessKeyvalOptions{langsci}

\LoadClass[
	fontsize=\lsFontsize, % default is 11pt
        footnotes=multiple,
        numbers=noenddot,		% no point after last number of chapters/sections
        toc=bibliographynumbered,
        index=totoc,
	%draft=yes,
	]{scrbook}


\usepackage{etex}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                  Page size and text area:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[ papersize={170mm,240mm}
			,top=27.4mm % TODO nachgemessen, nach Vermassung eigentlich 30mm-16pt = 25.8mm
			,inner=20mm, 
			,outer=25mm
			%,showframe,pass
                        ,marginparwidth=50pt
			]{geometry}
			

\usepackage[absolute 		% for absolute positioning in titlepage
			%,showboxes
			]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

\usepackage{pbox}   % boxes with maximum width
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%		 Fonts, language and graphics:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage{ifxetex}
\ifxetex
 	
  \usepackage{amssymb} % has to be loaded before other stuff			
  \usepackage{fontspec}
  \newcommand{\fontpath}{./lsp-fonts/}
			
  \setsansfont[
  			%Ligatures={TeX,Common},		% not supported by ttf
  			Scale=MatchLowercase,
  			Path=\fontpath,
			BoldFont = Arimo-Bold_B.ttf ,
			ItalicFont = Arimo-Italic_B.ttf ,				
			BoldItalicFont = Arimo-BoldItalic_B.ttf 		
			]
			{Arimo_B.ttf}
			
  \setmonofont[
  			Ligatures={TeX},Scale=MatchLowercase,Path=\fontpath,
			BoldFont = FreeMonoBold_B.otf ,
			SlantedFont = FreeMonoOblique_B.otf ,				
			BoldSlantedFont = FreeMonoBoldOblique_B.otf 		
			]
			{FreeMono_B.otf}


  \setmainfont[
  			Ligatures={TeX,Common},
  			Path=\fontpath,
  			PunctuationSpace=0,							
%  			Numbers={OldStyle,Proportional},				% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
  			Numbers={Proportional},	% normal numbers			% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
			BoldFont = LinLibertine_RZ_B.otf ,				% semi-bold
			ItalicFont = LinLibertine_RI_B.otf ,			
			BoldItalicFont = LinLibertine_RZI_B.otf ]		% semi-bold
			{LinLibertine_R_B.otf}			
  
%   \usepackage[libertine]{newtxmath}
%   
  \let\oldtabular\tabular	% number in tabulars
  \let\endoldtabular\endtabular
  \renewenvironment{tabular}{\normalfont\addfontfeatures{Numbers=Lining}\selectfont\oldtabular}{\endoldtabular}
 
  %\usepackage{polyglossia}		% TODO remove this?
  %\setdefaultlanguage{british}
\else
  \usepackage[T1]{fontenc}
  \usepackage{ucs}  				% extended UTF8 support TODO remove this?
  \usepackage[utf8x]{inputenc}
  \usepackage{libertine}			% TODO 
  
  %\usepackage[british]{babel}   	% TODO remove this?
\fi

%\frenchspacing			
\usepackage[final]{microtype}
\usepackage{graphicx}



\ifxetex
  \newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverSubTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsCoverAuthorFont}{\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\sffamily\fontsize{17pt}{7.5mm}\selectfont}			% fontsize?
  \newcommand{\lsCoverSeriesHistoryFont}{\sffamily\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{}	% obsolete, see \setmainfont
  \newcommand{\lsDedicationFont}{\fontsize{15pt}{10mm}\selectfont}
  \newcommand{\lsBackTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{12pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{16pt}{14pt}\selectfont}
\else 	% PDFLaTeX:
  \newcommand{\lsCoverTitleFont}[1]{\sffamily\fontfamily{fxlj}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverSubTitleFont}{\sffamily\fontfamily{fxlj}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsCoverAuthorFont}{\fontencoding{T1}\fontfamily{fxlj}\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{sc}\fontsize{14pt}{7.5mm}\selectfont}
  \newcommand{\lsCoverSeriesHistoryFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{\fontencoding{T1}\fontfamily{fxlj}\selectfont}
  \newcommand{\lsDedicationFont}{\fontsize{15pt}{10mm}\selectfont}
  \newcommand{\lsBackTitleFont}{\lsCoverAuthorFont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{12pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{16pt}{14pt}\selectfont}
  
%   \renewcommand{\bfseries}{\textsb}  	% bold -> semibold
\fi

\setkomafont{sectioning}{\normalcolor\bfseries}

% qtm = tgtermes
% ptm = times
% phv = helvet
% fxlj = libertine
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 			Colors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage{xcolor}
\definecolor{lsLightBlue}{cmyk}{0.6,0.05,0.05,0}
\definecolor{lsMidBlue}{cmyk}{0.75,0.15,0,0}
\definecolor{lsMidDarkBlue}{cmyk}{0.9,0.4,0.05,0}
\definecolor{lsDarkBlue}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{lsNightBlue}{cmyk}{1,0.47,0.22,0.68}
\definecolor{lsYellow}{cmyk}{0,0.25,1,0}
\definecolor{lsLightOrange}{cmyk}{0,0.50,1,0}
\definecolor{lsMidOrange}{cmyk}{0,0.64,1,0}
\definecolor{lsDarkOrange}{cmyk}{0,0.78,1,0}
\definecolor{lsRed}{cmyk}{0.05,1,0.8,0}
\definecolor{lsLightWine}{cmyk}{0.3,1,0.6,0}
\definecolor{lsMidWine}{cmyk}{0.54,1,0.65,0.1}
\definecolor{lsDarkWine}{cmyk}{0.58,1,0.70,0.35}
\definecolor{lsSoftGreen}{cmyk}{0.32,0.02,0.72,0}
\definecolor{lsLightGreen}{cmyk}{0.4,0,1,0}
\definecolor{lsMidGreen}{cmyk}{0.55,0,0.9,0.1}
\definecolor{lsRichGreen}{cmyk}{0.6,0,0.9,0.35}
\definecolor{lsDarkGreen1}{cmyk}{0.85,0.02,0.95,0.38}
\definecolor{lsDarkGreen2}{cmyk}{0.85,0.05,1,0.5}
\definecolor{lsNightGreen}{cmyk}{0.88,0.15,1,0.66}
\definecolor{lsLightGray}{cmyk}{0,0,0,0.17}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 		Special commands for authors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% defaults:
\newcommand{\lsBackBody}{Europan lingues es membres del sam familie. Lor separat existentie es un
myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li
lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe
al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.}
\newcommand{\lsBackTitle}{Back Title}

\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}
\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 

\newcommand{\newlineCover}{\\}	% \newline only on cover
\newcommand{\newlineSpine}{\\}	% \newline only on spine

\def\translator#1{\gdef\@translator{#1}}
\translator{}
\def\typesetter#1{\gdef\@typesetter{#1}}
\typesetter{}
\def\proofreader#1{\gdef\@proofreader{#1}}
\proofreader{}
%\def\@author{\@latex@warning@no@line{No \noexpand\author given}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%			 Series information:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\eotms}{eotms}
\newcommand{\eotmsig}{eotmsig}
\newcommand{\sidl}{sidl}
\newcommand{\algad}{algad}
\newcommand{\tmnlp}{tmnlp}
\newcommand{\nc}{nc}			%Niger Congo
\newcommand{\lnls}{lnls}		%Lecture Notes in Language Sciences
\newcommand{\labphon}{labphon}		%Studies in Laboratory Phonology
\newcommand{\tdgi}{tdgi}		%Topics at the Discourse Grammar Interface
\newcommand{\dummyseries}{dummyseries}
\newcommand{\lsSeriesFontColor}{white}

\ifx\lsSeries\eotms
 	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \\ Morphology and Syntax, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\eotmsig
 	\newcommand{\lsSeriesTitle}{Implemented Grammars, No \lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\sidl
 	\newcommand{\lsSeriesTitle}{Studies in Diversity Linguistics, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsRichGreen}
\fi
\ifx\lsSeries\algad
 	\newcommand{\lsSeriesTitle}{African Language Grammars\\ and Dictionaries, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsLightOrange}
\fi
\ifx\lsSeries\tmnlp
 	\newcommand{\lsSeriesTitle}{Translation and Multilingual Natural\\ Language Processing, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsDarkBlue}
\fi
\ifx\lsSeries\lnls
 	\newcommand{\lsSeriesTitle}{Lecture Notes in Language Sciences, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsYellow}
\fi	
\ifx\lsSeries\nc
 	\newcommand{\lsSeriesTitle}{Monographs on Comparative Niger-Congo, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsRed}
\fi	
\ifx\lsSeries\labphon
 	\newcommand{\lsSeriesTitle}{Studies in Laboratory Phonology, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsLightWine}
\fi	
\ifx\lsSeries\tdgi
 	\newcommand{\lsSeriesTitle}{Topics at the Discourse Grammar Interface, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsMidDarkBlue}
\fi	
\ifx\lsSeries\dummyseries
 	\newcommand{\lsSeriesTitle}{~}
 	\newcommand{\lsSeriesColor}{lsNightGreen}
\fi	

\@ifundefined{blackandwhite}
 	{}
 	{\renewcommand{\lsSeriesColor}{black}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Header and footer:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage{datetime}
\usepackage{scrpage2}
\ohead{\headmark}
\ihead{}
\cfoot{}
\ofoot[]{\pagemark}
\iflsDraft
  \ifoot{Draft of \today, \currenttime}
\fi
%% \ihead{\upshape{\headmark}}
%% \ohead{\pagemark}
%% \cfoot{}
%% \ifoot[]{}
%% \ofoot{\upshape{Draft of \today, \currenttime}}


\renewcommand*{\partpagestyle}{empty}

\pagestyle{scrheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Citation:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage{natbib}
\setlength{\bibsep}{0mm}
% unified style sheet for linguistics journals
% put directory in BST_INPUTS
% http://celxj.org/downloads/unified.bst
\bibliographystyle{unified} 
% This does not work ...
%% \setcitestyle{
%% notesep={: }, % 2002: 125
%% aysep={~}     % Gazdar 2002
%% }

% check what the unified people have to say on this.
\bibpunct[: ]{(}{)}{;}{a}{}{,}
% They do not say anything about citations in the running text.
% As was sown in \citew{Meier2002} -> As was shown in Meier (2002), ...
% This is what De Gruyter does:
\let\citew=\citet
% This is what Stefan did:
%\let\citew=\citealt



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 		Indexes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\iflsIndex
\usepackage{index}
% Wie im Stylefile, aber ohne \MakeUppercase
   \renewenvironment{theindex}{%
        \edef\indexname{\the\@nameuse{idxtitle@\@indextype}}%
        \if@twocolumn
            \@restonecolfalse
        \else
            \@restonecoltrue
        \fi
        \columnseprule \z@
        \columnsep 35\p@
        \twocolumn[%
            \@makeschapterhead{\indexname}%
            \ifx\index@prologue\@empty\else
                \index@prologue
                \bigskip
            \fi
        ]%
%        \@mkboth{\MakeUppercase\indexname}%
%                {\MakeUppercase\indexname}%
        \@mkboth{\indexname}%
                {\indexname}%
        \thispagestyle{plain}%
        \parindent\z@
        \parskip\z@ \@plus .3\p@\relax
        \let\item\@idxitem
    }{%
        \if@restonecol
            \onecolumn
        \else
            \clearpage
        \fi
    }

\makeindex
\newindex{lan}{ldx}{lnd}{Language index}
\newindex{aut}{adx}{and}{Name index}
\renewindex{default}{idx}{ind}{Subject index}
\newindex{wrd}{wdx}{wnd}{Expression index}
\newindex{rwrd}{rdx}{rnd}{Reverse expression index}

\indexproofstyle{\setlength{\overfullrule}{0pt}\raggedright\footnotesize}

\def\fn#1#2{%
\hyperpage{#2}$^{#1}$%
}%
\fi

\newcommand{\ia}[1]{\if@noftnote%
\index{autind}{#1}%
\else%
\index{autind}{#1|fn{\thefootnote}}%
\fi%
}

\newcommand{\is}[1]{\if@noftnote%
\index{#1}%
\else%
% irgendwie muss man ihn dazu bringen den Wert f�r footnote auch einzusetzen
\index{#1|fn{*}}%
%\indexftn{#1}{\value{footnotemark}}%
\fi%
}

\newcommand{\isfeat}[1]{\if@noftnote%
\index{feature!{\sc #1}}%
\else%
%\index{feature!{\sc #1}|fn{\thefootnote}}%
\index{feature!{\sc #1}|fn{*}}%
\fi%
}

\newcommand{\istype}[1]{\if@noftnote%
\index{type!#1@\type{#1}}%
\else%
%\index{type!{\it #1}|fn{\thefootnote}}
\index{type!#1@\type{#1}|fn{*}}%
\fi%
}

\newcommand{\isrel}[1]{\if@noftnote%
\index{relation!\emph{#1}}%
\else%
\index{relation!\emph{#1}|fn{*}}%
\fi%
}


% \index[lan] f�r Eintr�ge in separaten Index

\newcommand{\il}[1]{%
\if@noftnote%
\index[lan]{#1}%
\else%
\index[lan]{#1|fn{*}}%
\fi%
}

% index entries for words
\newcommand{\iw}[1]{%
\if@noftnote%
\index[wrd]{#1}%
\else%
\index[wrd]{#1|fn{*}}%
\fi%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 				Hyperref:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Xelatex likes this:
\usepackage[hyphens]{url}
\urlstyle{same}


\usepackage[bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,%
  bookmarksdepth=5,
  hyperindex=true,%
  breaklinks=true,
  draft=false,
  plainpages=false,
  pdfusetitle=true,  % puts author and title in automatically, maybe only in final mode?
  pdfkeywords={}
%  ,ps2pdf=true
]{hyperref}

%\KOMAoptions{footnotes=multiple}

% xelatex hates this.
%\usepackage{breakurl} 	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 				Cover:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\logopath}{./lsp-logos}
\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor}

\newcommand{\lsCoverBlock}{
	\begin{textblock}{155}(7.6,7.5)
	\color{\lsCoverBlockColor}
	\raggedright\rule{155mm}{225mm}
	\end{textblock}
    \iflsDraft
       \begin{textblock}{155}(30,80)
         \color{lsLightGray}
         \rotatebox{40}{
       		\begin{tabular}{c}
       		\scalebox{10}{DRAFT}\\
       		of \today, \currenttime
       		\end{tabular}}
       \end{textblock}
    \fi}

\newcommand{\lsCoverTitleAuthor}{
	\renewcommand{\newlineSpine}{}
	\lsCoverBlock

	\begin{textblock}{140}(15,17.5)
	\color{\lsCoverFontColor}
	\raggedright
	{\lsCoverTitleFont{\@title\\}}

 	\ifx\@subtitle\empty
 	\else \vspace{8mm} {\lsCoverSubTitleFont \@subtitle\\}
 	\fi

	\vspace{11.2mm} % 20mm - 25pt
 
	\raggedright
	{\lsCoverAuthorFont 
		\@author\\}
	\end{textblock}}

\newcommand{\lsCoverSeries}{
	\begin{textblock}{95}(7.4,209)
	\color{\lsCoverFontColor}
	\raggedright\rule{3.6mm}{3.5mm}
	\hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
		\lsSeriesTitle\\}
	\end{textblock}}

\newcommand{\lsCoverLogo}{		
	\begin{textblock}{33}(124.6,205)
		\raggedright\IfFileExists{\logopath/langsci_logo_nocolor.pdf}{\includegraphics{\logopath/langsci_logo_nocolor.pdf}}{langsci logo}  
	\end{textblock}}

\newcommand{\lsFrontPage}{		% Front page
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverSeries
	\lsCoverLogo}

\newcommand{\lsSchmutztitel}{	% Schmutztitel
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverLogo}

\newcommand{\lsBackPage}{		% Back page
	\lsCoverBlock

	\begin{textblock}{115}(15,24)  % 30mm-6mm
	\color{white}
	{\raggedright
	 \lsBackTitleFont 
	 \lsBackTitle \\ \null} 

	\lsBackBodyFont

	\noindent 
	\lsBackBody
	\end{textblock}

	\begin{textblock}{40}(115,212.5)
	\lsBackBodyFont
	\sffamily
	ISBN \lsISBN			
	\end{textblock}}

\newcommand{\lsSpine}{			% Book spine
	\renewcommand{\newlineSpine}{\\}
	\renewcommand{\newlineCover}{}
	\begin{textblock}{40}(65,0)
	\rotatebox{90}{\color{black}\fbox{\begin{minipage}[c][\lsSpineBreadth][c]{\paperheight}
		\color{\lsSeriesColor}
		\hspace{7.5mm}
		\IfFileExists{\logopath/langsci_spinelogo_nocolor.pdf}{$\vcenter{\hbox{\includegraphics[angle=-90,origin=c]{\logopath/langsci_spinelogo_nocolor.pdf}}}$}{logo}
		\hspace{15mm} 
 		{\lsSpineTitleFont
			\rotatebox[origin=c]{180}{\pbox[c]{150mm}{\@title}}}
		\hspace{13mm}
		{\lsSpineAuthorFont 
			\rotatebox[origin=c]{180}{\pbox[c]{100mm}{\@author}}}
	\end{minipage}}} 
	\end{textblock}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\lsOutputLong}{long}
\newcommand{\lsOutputShort}{short}
\newcommand{\lsOutputInprep}{inprep}

\AtBeginDocument{
\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}

%\@ifundefined{long}{}{		
\ifx\lsOutput\lsOutputLong				% only if output=long
	\setcounter{page}{-5}
	% First titlepage:
	{\lsFrontPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Back page:
	{\lsBackPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Book spine:
	{\lsSpine}
	%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Series information:
	{\lsSeriesHistory}
	%%%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	% Schmutztitel:
	{\renewcommand{\lsCoverBlockColor}{white}
	 \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
	\lsSchmutztitel}
	%%%%%%%%%%%%%%%%%%%%
\fi		

\ifx\lsOutput\lsOutputShort				% only if output=short
  	{\renewcommand{\lsCoverBlockColor}{white}
  	 \renewcommand{\lsCoverFontColor}{black}
  	 \lsFrontPage}
\fi

\ifx\lsOutput\lsOutputInprep				% only if output=inprep
	{\renewcommand{\lsCoverBlockColor}{white}
  	 \renewcommand{\lsCoverFontColor}{black}
  	 \lsCoverBlock
	 \lsCoverTitleAuthor}
\fi								

\end{titlepage}


\frontmatter
\renewcommand{\frontmatter}{}

\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} 	% for hyperref
\color{black}
\lsInsideFont

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 				Impressum:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\lsOutput\lsOutputInprep{}
\else{\lsImpressum}
\fi
%%%%%%%%%%%%%

\null\newpage\thispagestyle{plain}
%\pagenumbering{roman}		% or \frontmatter


% Dedication:
\ifx\@dedication\empty{}
\else{\lsDedication}
\fi
%%%%%%%%%%%%%%%%

%\g@addto@macro{\tableofcontents}{\mainmatter}  % TODO: remove?
		
}

% for those who like the example in numbered example sentences to be typeset in italics
% this is possible for a complete series only.
\ifx\lsSeries\sidl
%\ifx\lsSeries\lnls
\AtBeginDocument{
\def\exfont{\normalsize\it}
}
\fi


}	% \AtBeginDocument



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 				Series history:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont

\IfFileExists{./lsp-seriesinfo/\lsSeries-info.tex}{\input{./lsp-seriesinfo/\lsSeries-info}}{
  Series information: ./lsp-seriesinfo/\lsSeries-info.tex not found!} 

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 			Impressum (bis?)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\lsImpressum}{
\renewcommand{\newlineCover}{}
\raggedright
\null\vfill
Language Science Press\\
Berlin\\

\bigskip

Language Science Press\\
Habelschwerdter Allee 45\\
14195 Berlin, Germany

\bigskip

\href{http://langsci-press.org}{langsci-press.org}

\bigskip

This title can be downloaded at:\\
\url{\lsURL}

� \@author, \the\year 

\newcommand{\ccby}{CC-BY} 
\ifx\lsCopyright\ccby 
Published under the Creative Commons Attribution 4.0 Licence (CC BY 4.0):
http://creativecommons.org/licenses/by/4.0/ 
\else
Published under the Creative Commons Attribution-NoDerivatives 4.0 Licence (CC BY-ND 4.0):
http://creativecommons.org/licenses/by-nd/4.0/ 
\fi
 
ISBN: \lsISBN 

\bigskip
 
Cover and concept of design:
Ulrike Harbort \\
\if\@translator\empty\else
Translator:
\@translator \\
\fi
\if\@typesetter\empty\else
Typesetting:
\@typesetter \\
\fi
\if\@proofreader\empty\else
Proofreading:
\@proofreader \\
\fi

\vspace{3ex}

Storage and cataloguing done by FU Berlin \\[3ex]  	

\IfFileExists{\logopath/FULogo_sw_CMYK.pdf}{\includegraphics[width=5cm]{\logopath/FULogo_sw_CMYK.pdf}}{FU-Logo} \\

\vfill

\noindent
\lsp has no responsibility for the persistence or accuracy of URLs for
external or third-party Internet websites referred to in this
publication, and does not guarantee that any content on such websites
is, or will remain, accurate or appropriate. Information regarding
prices, travel timetables and other factual information given in this
work are correct at the time of first publication but \lsp does not
guarantee the accuracy of such information thereafter. 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%		 Dedication:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\lsDedication}{
	\vspace*{.2\textheight}	
	\begin{center}
		{\lsDedicationFont
		 \@dedication }
	\end{center}
	\vfill
	\clearpage}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 			footnotes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ifxetex
\addtokomafont{footnote}{\addfontfeatures{Numbers=Lining}} 			% numbers in footnotes
%\addtokomafont{footnotelabel}{\addfontfeatures{Numbers=Lining}} 	% numbers in footnote labels
%\addtokomafont{footnotereference}{\addfontfeatures{Numbers=Lining}} 	% numbers in footnote references
\fi

\raggedbottom
\deffootnote[1.5em]{1.5em}{0mm}{\textsuperscript{\thefootnotemark}\ }

\KOMAoptions{footnotes=multiple}

% http://tex.stackexchange.com/questions/28465/multiple-footnotes-at-one-point/71015#71015
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

%\deffootnote{1.5em}{1em}{% 
%    \makebox[1.5em][l]{\thefootnotemark}}

%% % this should be removed here, temporary
%% \newif\if@noftnote\@noftnotetrue
%% \newif\if@xrec\@xrecfalse
%% \@definecounter{fnx}

%% %%%% adapted from latex.tex to get examples in footnotes right
%% \long\def\@footnotetext#1{%
%%     \@noftnotefalse\setcounter{fnx}{0}%
%%     \insert\footins{\reset@font\footnotesize
%%     \interlinepenalty\interfootnotelinepenalty
%%     \splittopskip\footnotesep
%%     \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
%%     \hsize\columnwidth \@parboxrestore
%%    \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
%%     {\rule{\z@}{\footnotesep}\ignorespaces
%%       #1\strut}}\@noftnotetrue}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 			subsubsubsection:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setcounter{secnumdepth}{4} % und (f"urs Inhaltsverzeichnis)
% \setcounter{tocdepth}{4} (oder so) angegeben werden.

\def\subsubsubsection{\@startsection{paragraph}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsectionmark\@gobble
%

\def\subsubsubsubsection{\@startsection{subparagraph}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsubsectionmark\@gobble
% needed for hyperref
\def\toclevel@subsubsubsection{4}
%    

% bidi has to be loaded in the individual documents
%\ifxetex
%\usepackage{bidi} 		% wants to be placed below hyperref, natbib, graphicx, ...
%\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 		miscellaneous:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\usepackage[figuresright]{rotating}

% gets rid of the warnings:
% Failed to convert input string to UTF16
% http://tex.stackexchange.com/questions/66722/tex-live-2012-xelatex-moderncv-error-failed-to-convert-input-string-to-utf1
\hypersetup{unicode,pdfencoding=auto}


% this is required by authorindex
\newif\ifshowindex \showindexfalse

\usepackage{authorindex}


% \usepackage{./LSP/lsp-styles/lsp-eng-hyp} % this is very idiosyncratic and should be removed. Not many people will want to refer to Prze-pi�r-kow-ski


% % The following allows for a quick reference to following or preceeding examples (\mex{1}) or
% % (\mex{0}) but also (\mex{-1})
% % taken from covington.sty (check)
% \newcounter{lsptempcnt}
% 
% \newcommand{\mex}[1]{\setcounter{lsptempcnt}{\value{equation}}%
% \addtocounter{lsptempcnt}{#1}%
% \arabic{lsptempcnt}}% 			This has nothing to do in the cls file, but should be moved to an individual package

% quotes are indented at one side only.
\renewenvironment{quote}
               {\list{}{\rightmargin0pt\leftmargin8mm}%{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

% quotations are indented at one side only
% there is no indentation at the beginning of the quote
\renewenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        %\itemindent    \listparindent
                        %\rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

% \usepackage[english]{varioref} %This has nothing to do in the cls file, but should be moved to an individual package



% % usefull commands for glossings:
% \newlength{\LSPTmp}
% % a) hspace over width of something without showing it
% \newcommand*{\hspaceThis}[1]{\settowidth{\LSPTmp}{#1}\hspace*{\LSPTmp}}
% % This has nothing to do in the cls file, but should be moved to an individual package


\endinput

