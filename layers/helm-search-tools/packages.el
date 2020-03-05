;;; packages.el --- helm-search-tools layer packages file for Spacemacs.
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
;; added to `helm-search-tools-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `helm-search-tools/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `helm-search-tools/pre-init-PACKAGE' and/or
;;   `helm-search-tools/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst helm-search-tools-packages
  '((helm-fzf :location (recipe
                         :fetcher github
                         :repo "ibmandura/helm-fzf"))
    wgrep-helm
    helm))

(defun helm-search-tools/init-wgrep-helm ()
  (use-package wgrep-helm
    :defer t))

(defun helm-search-tools/init-helm-fzf ()
  (use-package helm-fzf
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys "fz" 'helm-fzf))))

;;; packages.el ends here
