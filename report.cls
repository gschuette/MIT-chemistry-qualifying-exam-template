\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}[2023/03/24 MIT Chemistry 2nd-year Exam: Written Report Template v1.0]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize the document
%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettersize paper, 12pt font, standard document type 
\LoadClass[12pt]{article}

% Set the margins to 1 inch everywhere. 
\RequirePackage[letterpaper,left=1in, right=1in, top=1in, bottom=1in]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Import Helpful Packages
%%%%%%%%%%%%%%%%%%%%%%%%%

% Lets LaTeX peform certain arithmetic operations
\RequirePackage{calc}

% Creates commands to create hypertext links, etc, in the PDF. 
\RequirePackage[pdftex,linkcolor=black,pdfborder={0 0 0}]{hyperref}

% Allows LaTeX to make a bookmarks in the PDF (in conjunction with hyperref)
\RequirePackage{bookmark}

% Make the text Times Roman
\RequirePackage{mathptmx}

% Supplies standard math symbols, etc. 
\RequirePackage{amsmath}

% Useful for typesetting chemical formulae/equations
\RequirePackage[version=4]{mhchem}

% Allows LaTeX to automatically handle many special characters
\RequirePackage[utf8]{inputenc}

% Provides many useful optional arguments for the \includegraphics command
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting
%%%%%%%%%%%%%%%%%%%%%%%%%

% Use Single Spacing
\RequirePackage{setspace}
\singlespacing

% Format the title 
% Step 1: Define function to save the department name
\newcommand{\department}[1]{
    \def\thedepartment{#1}
}
% Step 2: Define function to save the lab name
\newcommand{\lab}[1]{
    \def\thelab{#1}
}
% Step 3: Define function to print the formatted title
\def\@maketitle{
  \newpage
  \begin{center}
  \let \footnote \thanks
    {\bfseries \@title \par}
    \vskip .5em
    {
    \@author \par
    }
    \ifdefined\thelab
        \vskip .5em
        {
        \thelab \par
        }
        \ifdefined\thedepartment
            {
            \normalfont\normalsize\textit \thedepartment \par
            }
        \fi
    \else
        \ifdefined\thedepartment
            \vskip .5em
            {
            \normalfont\normalsize\textit \thedepartment \par
            }
        \fi
    \fi
    \vskip .5em
    {
    \normalfont\normalsize \@date \par
    }
  \end{center}
  \vskip .5em}
\makeatother

% Ensure the section/subsection titles are standard font but bold.
% [runin] allows text to immediately follow section titles to save space. 
\RequirePackage{titlesec}
\titleformat{\section}[runin]
  {\normalfont\normalsize\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}[runin]
  {\normalfont\normalsize\bfseries}{\thesubsection}{1em}{}

% This allows control over where figures are placed
\RequirePackage{float} 

% Helps with the spacing of figures 
\renewcommand\floatpagefraction{.9}

% Modify the headers/footers. As-is, this will only place a page
% number in right side of the footer, leaving all else plain.
\RequirePackage{fancyhdr}
% Turn on the style
\pagestyle{fancy}
% Clear the header and footer
\fancyhf{}
% Set the right side of the footer to be the page number
\rfoot{\thepage}
% This removes a line at the top of the page that otherwise appears with fancy style
\renewcommand{\headrulewidth}{0pt}

% Use the J. Am. Chem. Soc. (with title) formatting style. Also include the doi for good measure 
\RequirePackage[style = chem-acs, articletitle=true,doi=true, backend=biber]{biblatex}

% This makes the in-text citations superscripted numbers
\renewcommand{\cite}{\autocite}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous 
%%%%%%%%%%%%%%%%%%%%%%%%%

% Gives the ability to write text of a specific color. Used to ensure the gantt chart appears where desired, using hidden white text
\RequirePackage{xcolor}

% Used to wrap text around figures
\RequirePackage{wrapfig}