;;; packages.el --- yankpad layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Manuel Eggimann <meggiman@blitzstein.ee.ethz.ch>
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
;; added to `yankpad-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `yankpad/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `yankpad/pre-init-PACKAGE' and/or
;;   `yankpad/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst yankpad-packages
  '(yankpad
    company
    hippie-expand))

(defun yankpad/init-yankpad ()
  (use-package yankpad
    :ensure t
    :defer 10
    :init
    (setq yankpad-file "~/.spacemacs.d/snippets/yankpad.org")
    :config
    (spacemacs/declare-prefix "iy" "yankpad")
    (spacemacs/set-leader-keys
      "iyy" 'yankpad-insert)
    (spacemacs/set-leader-keys
      "iyc" 'yankpad-set-category)
    (spacemacs/set-leader-keys
      "iya" 'yankpad-append-category)
    (spacemacs/declare-prefix "iyf" "yankpad-file")
    (spacemacs/set-leader-keys
      "iyfe" 'yankpad-edit)
    (spacemacs/set-leader-keys
      "iyfr" 'yankpad-reload))
  )

(defun yankpad/post-init-hippie-expand ()
    (add-to-list 'hippie-expand-try-functions-list #'yankpad-expand))
;;; packages.el ends here
