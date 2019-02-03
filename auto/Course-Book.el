(TeX-add-style-hook
 "Course-Book"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("appendix" "toc" "page") ("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "macros"
    "Ch00-CourseOverview/Ch00-CourseOverview"
    "beamer"
    "beamer10"
    "appendix"
    "listings"
    "hyperref"
    "pgf"
    "pgfpages"
    "graphicx"
    "units"
    "inputenc"
    "pstricks"
    "multicol"
    "xspace"
    "utopia")
   (TeX-add-symbols
    '("myhy" 2)
    "ShowGraphics")
   (LaTeX-add-xcolor-definecolors
    "uiborange")
   (LaTeX-add-listings-lstdefinestyles
    "myScalastyle"))
 :latex)

