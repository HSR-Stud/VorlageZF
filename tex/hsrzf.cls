%%
%% This is file `hsrzf.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hsrstud-classes.dtx  (with options: `hsrzf')
%% This document is part of the HSRStud LaTeX Package
%% 
%% THE FOLLOWING WORK IS UNDER THE CC BY-SA 4.0 LICENSE
%% 
%% You are free to
%% ---------------
%%   * Share -- Copy and redistribute the material in any medium or format
%%   * Adapt -- Remix, transform, and build upon the material for any
%%              purpose, even commercially
%% 
%% The licensor cannot revoke these freedoms as long as you follow the
%% license terms.
%% 
%% Under the following terms
%% -------------------------
%%   * Attribution
%%     You must give appropriate credit, provide a link to the license, and
%%     indicate if changes were made. You may do so in any reasonable
%%     manner, but not in any way that suggests the licensor endorses you
%%     or your use.
%% 
%%   * ShareAlike
%%     If you remix, transform, or build upon the material you must
%%     distribute your contributions under the same license as the
%%     original.
%% 
%%   * No additional restrictions
%%     You may not apply legal terms or technological measures that
%%     legally restrict others from doing anything the license permits.
%% 
%% Notice
%% ------
%% You do not have to comply with the license for elements of the material
%% in the public domain or where your use is permitted by an applicable
%% exception or limitation.
%% 
%% No warranties are given. The license may not give you all of the
%% permissions necessary for your intended use. For example, other rights
%% such as publicity, privacy, or moral rights may limit how you use the
%% material.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrzf}[2020/04/05 v0.1 HSRStud Summary class]



%% Coding Packages (Dependencies)
\RequirePackage{iftex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

%% Default font
\RequirePackage{lmodern}

%% Class options
\SetupKeyvalOptions{
  family=hsr,
  prefix=hsr@
}

%% Use header and footer
\DeclareBoolOption[false]{header}
\DeclareComplementaryOption{noheader}{header}

%% Use a sans-serif slab-serif or concrete font
\DeclareBoolOption[false]{sans}
\DeclareBoolOption[false]{slab}
\DeclareBoolOption[false]{concrete}

%% Configures the geometry package
%%
%% Possible values:
%%  - huge    (45mm, 40mm)
%%  - large   (35mm, 35mm)
%%  - big     (30mm, 30mm)
%%  - normal  (25mm, 30mm)
%%  - small   (20mm, 20mm)
%%  - tiny    (10mm, 20mm)
%%  - minimal ( 5mm, 20mm)
\DeclareStringOption{margin}[huge]

%% Configures the polyglossia package

%% Pass other options to the class
\DeclareDefaultOption{%
  \ifx\CurrentOptionValue\relax
    \PackageWarningNoLine{\@currname}{%
      Unknown option ``\CurrentOption''\MessageBreak
      is passed to class ``article''%
    }%
    % Pass the option to package color.
    % Again it is better to expand \CurrentOption.
    \expandafter\PassOptionsToClass
      \expandafter{\CurrentOption}{article}
  \else
    % Package color does not take options with values.
    % We provide the standard LaTeX error.
    \@unknownoptionerror
  \fi
}

\ProcessKeyvalOptions{hsr}

%% Create new metadata fields

%% Required fields
\newcommand\course[1]{\gdef\hsr@course{#1}}
\newcommand\hsr@course{\ClassError{hsrzf}{no \noexpand\course given}{}}
\newcommand\thecourse{\hsr@course}

\newcommand\module[1]{\gdef\hsr@module{#1}}
\newcommand\hsr@module{\ClassError{hsrzf}{no \noexpand\module given}{}}
\newcommand\themodule{\hsr@module}

\newcommand\semester[1]{\gdef\hsr@semester{#1}}
\newcommand\hsr@semester{\ClassError{hsrzf}{no \noexpand\semester given}{}}
\newcommand\thesemester{\hsr@semester}

%% Optional fields
\newcommand\institute[1]{\gdef\hsr@institute{#1}}
\newcommand\hsr@institute{\ClassWarning{hsrzf}{no \noexpand\institute given}{}}
\newcommand\theinstitute{\hsr@institute}

\newcommand\authoremail[1]{\gdef\hsr@authoremail{#1}}
\newcommand\hsr@authoremail{\ClassWarning{hsrzf}{no \noexpand\authoremail given}{}}
\newcommand\theauthoremail{\hsr@authoremail}

\newcommand\maintainer[1]{\gdef\hsr@maintainer{#1}}
\newcommand\hsr@maintainer{\ClassWarning{hsrzf}{no \noexpand\maintainer given}{}}
\newcommand\themaintainer{\hsr@maintainer}

\newcommand\contributors[1]{\gdef\hsr@contributors{#1}}
\newcommand\hsr@contributors{\ClassWarning{hsrzf}{no \noexpand\contributors given}{}}
\newcommand\thecontributors{\hsr@contributors}

\LoadClass[a4paper]{article}

%% Style deps
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{totpages}
\RequirePackage{array}

%% Insert metadata in the pdf
\PassOptionsToPackage{plainpages=false, pdfpagelabels, pdfusetitle}{hyperref}
\RequirePackage{hyperref}


%% Configure Sans-Serif font
\ifhsr@sans
  \ifhsr@slab
    \PackageError{hsrzf}{%
      sans ans slab options cannot be used at the same time
    }
  \fi
  \ifhsr@concrete{hsrzf}{%
    sans and concrete options cannot be used at the same time
  }
  \fi

  \PassOptionsToPackage{T1}{fontenc}
  \RequirePackage{fontenc}
  \RequirePackage{cmbright}
  \RequirePackage{sfmath}
\fi

%% Configure Slab-Serif font
\ifhsr@slab
  \ifhsr@sans
    \PackageError{hsrzf}{%
      slab and sans options cannot be used at the same time
    }
  \fi
  \ifhsr@concrete{hsrzf}{%
    slab and concrete options cannot be used at the same time
  }
  \fi

  \PassOptionsToPackage{T1}{fontenc}
  \RequirePackage{fontenc}
  \PassOptionsToPackage{rm,light}{roboto}
  \RequirePackage{roboto}
\fi

%% Configure (secret) concrete font
\ifhsr@concrete
  \ifhsr@sans{hsrzf}{%
    concrete and sans options cannot be used at the same time
  }
  \fi
  \ifhsr@slab
    \PackageError{hsrzf}{%
      concrete ans slab options cannot be used at the same time
    }
  \fi

  \PassOptionsToPackage{boldsans,amssymb}{concmath}
  \RequirePackage{concmath}
  \PassOptionsToPackage{T1}{fontenc}
  \RequirePackage{fontenc}
\fi

%% configure geometry
%% defaults to big
\newlength{\hsr@hmarginwidth}
\newlength{\hsr@vmarginheight}

\ifx\hsr@margin\@empty
  \setlength\hsr@hmarginwidth{30mm}
  \setlength\hsr@vmarginheight{30mm}
\else
  \expandafter\ifstrequal\expandafter{\hsr@margin}{huge}{
    \setlength\hsr@hmarginwidth{45mm}
    \setlength\hsr@vmarginheight{40mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{large}{
    \setlength\hsr@hmarginwidth{35mm}
    \setlength\hsr@vmarginheight{35mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{big}{
    \setlength\hsr@hmarginwidth{30mm}
    \setlength\hsr@vmarginheight{30mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{normal}{
    \setlength\hsr@hmarginwidth{25mm}
    \setlength\hsr@vmarginheight{30mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{small}{
    \setlength\hsr@hmarginwidth{20mm}
    \setlength\hsr@vmarginheight{20mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{tiny}{
    \setlength\hsr@hmarginwidth{10mm}
    \setlength\hsr@vmarginheight{20mm}}{}
%%
  \expandafter\ifstrequal\expandafter{\hsr@margin}{minimal}{
    \setlength\hsr@hmarginwidth{ 5mm}
    \setlength\hsr@vmarginheight{20mm}}{}
%%
  % TODO: fix this
  % \ClassError{hsrzf}{Invalid margin size}
  % \setlength\hsr@hmarginwidth{30mm}
  % \setlength\hsr@vmarginheight{30mm}
\fi


%% TODO: change vmarginheight if header is on
\newgeometry{
    hmargin=\hsr@hmarginwidth,
    vmargin=\hsr@vmarginheight,
    marginparsep=0pt,
    marginpar=0pt,
}

\fancypagestyle{hsrzf}{%
    \fancyhf{} % clear
    \fancyhead[L]{\leftmark}
    \fancyhead[C]{\themodule}
    \fancyhead[R]{\@date}

    \fancyfoot[L]{\href{https://github.com/HSR-Stud/}{\texttt{HSR-Stud}}}
    \fancyfoot[C]{\texttt{CC BY-NC-SA}}
    \fancyfoot[R]{\thepage ~/ \pageref{TotPages}}

    \renewcommand{\headrulewidth}{.5pt}
    \renewcommand{\footrulewidth}{.5pt}
}

\fancypagestyle{hsrzf-norulers}{%
    \fancyhf{} % clear
    \fancyhead[L]{\leftmark}
    \fancyhead[C]{\themodule}
    \fancyhead[R]{\@date}

    \fancyfoot[L]{\href{https://github.com/HSR-Stud/}{\texttt{HSR-Stud}}}
    \fancyfoot[C]{\texttt{CC BY-NC-SA}}
    \fancyfoot[R]{\thepage ~/ \pageref{TotPages}}

    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\ifhsr@header
\pagestyle{hsrzf}
\fi

\endinput
%%
%% End of file `hsrzf.cls'.
