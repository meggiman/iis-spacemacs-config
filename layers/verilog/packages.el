;;; packages.el --- verilog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Manuel Eggimann <meggimann@iis.ee.ethz.ch>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst verilog-packages
  '((verilog-mode :location (recipe
                             :fetcher github
                             :repo "meggiman/verilog-mode"
                             :min-version 2
                             :commit "master"))
    company
    indent-guide
    helm-gtags
    ggtags
    flycheck
    (flycheck-hdl-questasim :location (recipe
                                       :fetcher github
                                       :repo "meggiman/flycheck-hdl-questasim"))))


(defun verilog/init-verilog-mode ()
  (use-package verilog-mode
    :defer t
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'verilog-mode "ma" "auto")
      (spacemacs/declare-prefix-for-mode 'verilog-mode "mg" "gtags")
      (spacemacs/set-leader-keys-for-major-mode 'verilog-mode
        "=" 'verilog-pretty-expr
        "TAB" 'verilog-pretty-declarations
        "d" 'verilog-goto-defun
        "e" 'verilog-expand-vector
        "aa" 'verilog-auto
        "ad" 'verilog-delete-auto
        "ai" 'verilog-inject-auto
        "ac" 'verilog-auto-save-compile
        ))
    :config
    (progn
      (setq verilog-auto-lineup (quote all))
      (setq verilog-auto-newline nil)
      (setq verilog-indent-level 2)
      (setq verilog-tab-always-indent t)
      )))

;Forces spacemacs to install the package. But loading is deferred until flycheck is being loaded.
(defun verilog/init-flycheck-hdl-questasim ())

(defun verilog/pre-init-verilog-mode ()
  (add-hook 'verilog-mode-hook 'eldoc-mode))

;;Enable indent-guide for verilog-mode.
(defun verilog/post-init-indent-guide ()
  (add-hook 'verilog-mode-hook 'indent-guide-mode))

;;Enable gtags form verilog-mode
(defun verilog/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'verilog-mode)
  (spacemacs|define-jump-handlers 'verilog-mode))

;;Enable verilog-verilator in flycheck if available
(defun verilog/pre-init-flycheck()
  (setq flycheck-verilog-verilator-executable "/usr/local/bin/verilator_bin"))
(defun verilog/post-init-flycheck ()
  (use-package flycheck-hdl-questasim
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'verilog-mode "ms" "syntax-checking")
      (spacemacs/set-leader-keys-for-major-mode 'verilog-mode
        "sc" 'flycheck-hdl-questasim-clear-workdir
        "st" 'flycheck-hdl-questasim-toggle-workdir
        "sa" 'flycheck-hdl-questasim-analyze-workdir)))
  (add-hook 'verilog-mode-hook 'flycheck-mode))

(defun verilog/post-init-ggtags ()
  (add-hook 'verilog-mode-hook #'spacemacs/ggtags-mode-enable))

(defun verilog/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-files company-keywords company-capf (company-dabbrev-code company-yasnippet)
        :modes verilog-mode))



;; (when (configuration-layer/package-usedp 'company)
;;   (push 'company-capf company-backends-verilog-mode)
;;   (push 'company-keywords company-backends-verilog-mode)
;;   (push 'company-files company-backends-verilog-mode)
;;   (push 'company-yasnippet company-backends-verilog-mode))


;; (when (configuration-layer/package-usedp 'company)
;;   (defun verilog/post-init-verilog-mode ()
;;     (spacemacs|add-company-hook verilog-mode)))

;;; packages.el ends here
