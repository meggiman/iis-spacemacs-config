;;; packages.el --- minimap layer packages file for Spacemacs.
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
;; added to `minimap-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `minimap/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `minimap/pre-init-PACKAGE' and/or
;;   `minimap/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst minimap-packages
  '((minimap :location (recipe
                       :fetcher github
                       :repo "dengste/minimap"))
    flycheck))

(defun minimap/post-init-flycheck ()
  (message "Post-init flycheck")
  ;;Sync overlays in minimap so we markers of syntax errors get updated in minimap
  (defun minimap/add-remove-hook-minimap-syncoverlay-hook ()
    (if minimap-mode
        (add-hook 'flycheck-after-syntax-check-hook 'minimap-sync-overlays)
      (remove-hook 'flycheck-after-syntax-check-hook 'minimap-sync-overlays)))
  (add-hook 'minimap-mode-hook 'minimap/add-remove-hook-minimap-syncoverlay-hook))

(defun minimap/init-minimap ()
  (use-package minimap
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys
        "Ti" 'minimap-mode))
    :config
    (progn
      (setq minimap-window-location 'right)
      (face-spec-set 'minimap-active-region-background '((t :background "DarkOrchid4")))
      (face-spec-set 'minimap-current-line-face '((t :background "SlateBlue1" :foreground "SlateBlue2")))
      )))

;;; packages.el ends here
