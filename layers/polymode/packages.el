;;; packages.el --- polymode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: Manuel Eggimann <meggiman@meggiman-MS-7916>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `polymode-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `polymode/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `polymode/pre-init-PACKAGE' and/or
;;   `polymode/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst polymode-packages
  '(polymode
    (verilog-mode :location (recipe
                             :fetcher github
                             :repo "veripool/verilog-mode"
                             :min-version 2
                             :commit "master"))
    ))

(defun polymode/init-polymode ()
  (use-package polymode)
  )

(defun polymode/post-init-verilog-mode ()
  ;; Define new polymode for Verilog + Mako
  (define-hostmode poly-verilog-hostmode
    :mode 'verilog-mode
    )
  (define-hostmode poly-yaml-hostmode
    :mode 'yaml-mode
    )
  (define-hostmode poly-json-hostmode
    :mode 'json-mode)
  (define-innermode poly-mako-python-expr-innermode
    :mode 'python-mode
    :head-matcher "${"
    :tail-matcher "}"
    :head-mode 'fundamental-mode
    :tail-mode 'fundamental-mode
    )
  (define-innermode poly-mako-python-block-innermode
    :mode 'python-mode
    :head-matcher "<%"
    :tail-matcher "%>"
    )
  (define-innermode poly-mako-start-constructs-innermode
    :mode 'python-mode
    :head-matcher "% if\\|% for\\|% elif\\|% while"
    :tail-matcher ":\n")
  (define-innermode poly-mako-end-construct-innermode
    :mode 'prog-mode
    :head-matcher "% endif\\|% endfor\\|% else:\\|% endwhile"
    :tail-matcher " ")

  (define-polymode poly-verilog-mako-mode
    :hostmode 'poly-verilog-hostmode
    :innermodes '(poly-mako-start-constructs-innermode
                  poly-mako-end-construct-innermode
                  poly-mako-python-expr-innermode
                  poly-mako-python-block-innermode))
  (add-to-list 'auto-mode-alist '("\\.sv.mako\\'" . poly-verilog-mako-mode))

  (define-polymode poly-json-mako-mode
    :hostmode 'poly-json-hostmode
    :innermodes '(poly-mako-start-constructs-innermode
                  poly-mako-end-construct-innermode
                  poly-mako-python-expr-innermode
                  poly-mako-python-block-innermode))
  (add-to-list 'auto-mode-alist '("\\.hjson.mako\\'" . poly-json-mako-mode))

  (define-polymode poly-yaml-mako-mode
    :hostmode 'poly-yaml-hostmode
    :innermodes '(poly-mako-start-constructs-innermode
                  poly-mako-end-construct-innermode
                  poly-mako-python-expr-innermode
                  poly-mako-python-block-innermode))
  (add-to-list 'auto-mode-alist '("\\.yaml.mako\\'" . poly-yaml-mako-mode))
  )


;;; packages.el ends here
