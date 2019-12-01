(TeX-add-style-hook
 "yankpad"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("geometry" "top=2.54cm" "bottom=2.54cm" "left=2.54cm" "right=2.54cm") ("xcolor" "x11names") ("placeins" "section") ("svg" "inkscapelatex=false")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "geometry"
    "xcolor"
    "bytefield"
    "fancyhdr"
    "pdfpages"
    "placeins"
    "svg")
   (LaTeX-add-labels
    "sec:orgbf67e1d"
    "sec:org910d8c6"
    "sec:org77005e0"
    "sec:org2f6e1e9"
    "sec:org7d9d2f6"
    "sec:orgb0894f4"
    "sec:org994deb0"
    "sec:org7d2c729"))
 :latex)

