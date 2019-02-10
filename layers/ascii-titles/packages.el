;;; packages.el --- ascii-titles layer packages file for Spacemacs.
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
;; added to `ascii-titles-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ascii-titles/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ascii-titles/pre-init-PACKAGE' and/or
;;   `ascii-titles/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ascii-titles-packages
  '(figlet))

(defun ascii-titles/init-figlet ()
  (use-package figlet
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys
        "xTT" 'ascii-title-default-create-on-region)
      (spacemacs/set-leader-keys
        "xTt" 'ascii-title-create-on-region)))) 


;;; packages.el ends here
