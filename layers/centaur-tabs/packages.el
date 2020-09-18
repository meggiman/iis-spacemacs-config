;;; packages.el --- centaur-tabs layer packages file for Spacemacs.
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
;; added to `centaur-tabs-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `centaur-tabs/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `centaur-tabs/pre-init-PACKAGE' and/or
;;   `centaur-tabs/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst centaur-tabs-packages
  '(
    centaur-tabs)
  "The list of Lisp packages required by the centaur-tabs layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun centaur-tabs/init-centaur-tabs ()
  (use-package centaur-tabs
    :bind
    ("C-<prior>" . centaur-tabs-backward)
    ("C-<next>" . centaur-tabs-forward)
    ("C-<tab>" . centaur-tabs-forward)
    ))

;; (defun centaur-tabs/pre-init-centaur-tabs ()
;;   (setq centaur-tabs-style "wave")
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   (setq centaur-tabs-set-bar 'under)
;;   )

(defun centaur-tabs/post-init-centaur-tabs ()
  (setq centaur-tabs-style "bar"
	      centaur-tabs-height 32
	      centaur-tabs-set-icons t
	      centaur-tabs-set-modified-marker t
	      centaur-tabs-show-navigation-buttons t
	      centaur-tabs-set-bar 'under
	      x-underline-at-descent-line t)
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  ;; (setq centaur-tabs-gray-out-icons 'buffer)
  ;; (centaur-tabs-enable-buffer-reordering)
  ;; (setq centaur-tabs-adjust-buffer-order t)
  (setq uniquify-separator "/")
  (message "loaded centaur tabs")
  )


;;; packages.el ends here











