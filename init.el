;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(php
     ansible
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; Languages and file-type major modes  ;;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     systemd
     javascript
     json
     html
     helm
     (python :variables python-backend 'lsp)
     emacs-lisp
     markdown
     (latex :variables
            latex-build-command "LaTeX"
            spell-checking-enable-auto-dictionary t)
     (org :variables
          org-enable-bootstrap-support t)
     bibtex
     verilog
     yaml
     csv
     epub
     major-modes
     (c-c++ :variables
            c-c++-enable-clang-support t)
     graphviz
     plantuml
     shell-scripts




     ;;;;;;;;;
     ;; IDE ;;
     ;;;;;;;;;
     (auto-completion :variables
                      spacemacs-default-company-backends '((company-semantic company-dabbrev-code company-gtags company-etags company-keywords company-yankpad)
                                                           company-files company-dabbrev))
     dap
     lsp
     syntax-checking
     (spell-checking :variables spell-checking-enable-by-default nil)
     gtags
     semantic
     centaur-tabs
     (treemacs :variables
               treemacs-use-filewatch-mode t
               treemacs-use-git-mode 'deferred)

     ;;;;;;;;;;;;;;;;;;;;;;;;
     ;; Tools & Utilities  ;;
     ;;;;;;;;;;;;;;;;;;;;;;;;
     search-engine
     better-defaults
     pdf
     git
     treemacs
     chrome
     pandoc
     minimap
     (multiple-cursors :variables multiple-cursors-backend 'mc)
                                        ;(multiple-cursors :location local)
     ;;(rebox :variables rebox-enable-in-text-mode nil)
     ;; neotree
     ;; version-control
     ascii-titles
     imenu-list
     helm-search-tools

     ;;;;;;;;;;;;
     ;; Others ;;
     ;;;;;;;;;;;;
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/zsh")
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(synosaurus
                                      (verilog-mode :location (recipe
                                                               :fetcher github
                                                               :repo "meggiman/verilog-mode")
                                                    :min-version "2")
                                      (minimap :location (recipe
                                                          :fetcher github
                                                          :repo "dengste/minimap"))
                                      elf-mode
                                      figlet
                                      (mscgen-mode :location (recipe
                                                              :fetcher github
                                                              :repo "thomsten/mscgen-mode"
                                                              ))
                                      (boxes :location local)
                                      avy-zap
                                      virtualenvwrapper
                                      poporg
                                      pocket-reader
                                      riscv-mode
                                      ;; (flycheck-grammarly :location (recipe
                                      ;;                                :fetcher github
                                      ;;                                :repo
                                      ;;                                "jcs-elpa/flycheck-grammarly"))
                                      cdlatex
                                      ;; ox-latex-subfigure
                                      (ospl-mode :location (recipe
                                                            :fetcher github
                                                            :repo "stettberger/ospl-mode"))
                                      adaptive-wrap
                                      )


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."

  (add-to-list 'load-path "~/.spacemacs.d/local")
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper t

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((todos . 10)
                                (recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'org-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((base . "#ffffff"))))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;;Remap C-z to undo-tree command so it is easier to quickly undo something without opening undo-tree
  (define-key evil-emacs-state-map (kbd "C-z") nil)
  (global-set-key (kbd "C-z") 'undo-tree-undo)

  (define-key evil-emacs-state-map (kbd "C-y") nil)
  (global-set-key (kbd "C-y") 'yank)

  ;;Remap M-z to avy-zap-up-to-char
  (global-set-key (kbd "M-z") 'avy-zap-up-to-char)

  ;; Remap M-m s e to iedit-mode instead of evil-iedit-mode
  (spacemacs/set-leader-keys "se" 'iedit-mode)

  ;; Override default behavior of C-Backspace which always deletes a whole word
  ;; and in my opinion behaves counter intuitive since a lot of the time I just
  ;; want to delete some whitespace instead of the word on the previous line
  ;; the following implmenetation deletes the previous word or all the
  ;; whitespace depeneding on what is in front of the cursor
  (defun custom/backward-kill-word ()
    "Customize/Smart backward-kill-word."
    (interactive)
    (let* ((cp (point))
           (backword)
           (end)
           (space-pos)
           (backword-char (if (bobp)
                              ""           ;; cursor in begin of buffer
                            (buffer-substring cp (- cp 1)))))
      (if (equal (length backword-char) (string-width backword-char))
          (progn
            (save-excursion
              (setq backword (buffer-substring (point) (progn (forward-word -1) (point)))))
            (setq ab/debug backword)
            (save-excursion
              (when (and backword          ;; when backword contains space
                         (s-contains? " " backword))
                (setq space-pos (ignore-errors (search-backward " ")))))
            (save-excursion
              (let* ((pos (ignore-errors (search-backward-regexp "\n")))
                     (substr (when pos (buffer-substring pos cp))))
                (when (or (and substr (s-blank? (s-trim substr)))
                          (s-contains? "\n" backword))
                  (setq end pos))))
            (if end
                (kill-region cp end)
              (if space-pos
                  (kill-region cp space-pos)
                (backward-kill-word 1))))
        (kill-region cp (- cp 1)))         ;; word is non-english word
      ))

  (global-set-key  [C-backspace]
            'custom/backward-kill-word)

  ;;Add auto-revert-mode to docview hook so the pdf preview updates upon rebuild
  ;;of the latex source.
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Configure org export command for latex pdf
  (setq org-latex-pdf-process
        '("latexmk -pdflatex='pdflatex -shell-escape --synctex=1 -interaction nonstopmode' -pdf -bibtex -f %f"))

  ;; Add hook to autostart "one sentence per line mode" when in Latex buffers
  (use-package ospl-mode
    :hook (TeX-mode . ospl-mode))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; flymd fix to use Firefox instead of chrome for Markdown live preview ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun my-flymd-browser-function (url)
    (let ((browse-url-browser-function 'browse-url-firefox))
      (browse-url url)))
  (setq flymd-browser-open-function 'my-flymd-browser-function)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Enable usefull minor modes by default
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;(add-hook 'prog-mode-hook 'minimap-mode)
  (add-hook 'prog-mode-hook 'spacemacs/toggle-line-numbers-on)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Configuring Compilationto auto close *compilation* buffer after success  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Helper for compilation. Close the compilation window if
  ;; there was no error at all.
  (defun compilation-exit-autoclose (status code msg)
    ;; If M-x compile exists with a 0
    (when (and (eq status 'exit) (zerop code))
      ;; then bury the *compilation* buffer, so that C-x b doesn't go there
      (bury-buffer)
      ;; and delete the *compilation* window
      (delete-window (get-buffer-window (get-buffer "*compilation*"))))
    ;; Always return the anticipated result of compilation-exit-message-function
    (cons msg code))
  ;; Specify my function (maybe I should have done a lambda function)
  (setq compilation-exit-message-function 'compilation-exit-autoclose)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Configuring org mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (with-eval-after-load 'org
    (setq org-capture-templates
          '(("t" "New task in tasks.org" entry (file+headline "~/org_notes/tasks.org" "Inbox")
             "* TODO %^{Task title?} %U\n\t%?")
            ("n" "New quick note with tags" entry (file "~/org_notes/quicknotes.org")
             "* %^{Title?} %^G\n %?")
            ("w" "Web site" entry
             (file+headline "~/org_notes/quicknotes.org" "Bookmarks")
             "* %a :website:%^G\n\n%U %?\n\n%:initial")
            ("s" "Weekly Schedule" entry
             (file+olp+datetree "~/org_notes/schedules.org")
             "* Week %<%W>\n** Monday\n      |   | Task  | Duration |\n      |---+-------+----------|\n      |   |%?       |          |\n      |---+-------+----------|\n      | # | Total |    00:00 |\n      #+TBLFM: @>$3=vsum(@2..@-1);U\n** Thuesday\n      |   | Task  | Duration |\n      |---+-------+----------|\n      |   |       |          |\n      |---+-------+----------|\n      | # | Total |    00:00 |\n      #+TBLFM: @>$3=vsum(@2..@-1);U\n** Wednesday\n      |   | Task  | Duration |\n      |---+-------+----------|\n      |   |       |          |\n      |---+-------+----------|\n      | # | Total |    00:00 |\n      #+TBLFM: @>$3=vsum(@2..@-1);U\n** Thursday\n      |   | Task  | Duration |\n      |---+-------+----------|\n      |   |       |          |\n      |---+-------+----------|\n      | # | Total |    00:00 |\n      #+TBLFM: @>$3=vsum(@2..@-1);U\n** Friday\n      |   | Task  | Duration |\n      |---+-------+----------|\n      |   |       |          |\n      |---+-------+----------|\n      | # | Total |    00:00 |\n      #+TBLFM: @>$3=vsum(@2..@-1);U")
            ("m" "New meeting notes int meetings.org" entry (file+datetree "~/org_notes/meetings.org")
             "* %U - %^{Topic of the meeting?}%^G\n  %?" )
            ("j" "Journal" entry (file+olp+datetree "~/org_notes/journal.org")
             "* %?\n\tEntered on %U\n  %i" :clock-in t :clock-keep t)))
    ;; Ein "!" bedeutet Zeitstempel
    ;; Ein "@" bedeutet Notiz
    (setq org-todo-keywords
          '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "APPT(a)"  "|" "DONE(d!)" "CANCELED(c@)")))
                                        ; Farben anpassen
    (setq org-todo-keyword-faces
          '(("TODO"  . (:foreground "#b70101" :weight bold))
            ("STARTED"  . (:foreground "#b70101" :weight bold))
            ("WAITING"  . (:foreground "orange" :weight bold))
            ("DONE"  . (:foreground "forestgreen" :weight bold))
            ("CANCELED"  . shadow)))

    ;; Fast TODO Selection
    (setq org-use-fast-todo-selection t)
    (setq org-log-done 'time)
    (setq org-log-into-drawer t)

    ;; Configure org agenda
    (setq org-agenda-files (list "~/org_notes/"))
    (setq org-agenda-todo-list-sublevels nil)

    ;; Use the builtin file attachement system for org-download
    (setq org-download-method 'attach)

    ;; Allow alphabetical plain lists
    (setq org-list-allow-alphabetical t)

    ;; Make M-RET 
    ;; (define-key org-mode-map (kbd "M-RET") nil)

    ;; Enables latex src blocks to be evaluated by babel. Results in wrapping
    ;; the tex code in a latex environment for latex export.
    (require 'ox-latex)
    ;; Enable subfigure support in org mode (see https://github.com/linktohack/ox-latex-subfigure)
    ;; (require 'ox-latex-subfigure)
    (require 'mscgen-mode)
    ;; Enable additional babel languages
    (org-babel-do-load-languages 'org-babel-load-languages '(
                                                             (makefile t)
                                                             (latex t)
                                                             (shell t)
                                                             (python t)
                                                             (js t)
                                                             (mscgen t)))

    (push "~/org_notes/lib" load-path)

  ;;; Org Capture
  ;;;; Thank you random guy from StackOverflow
  ;;;; http://stackoverflow.com/questions/23517372/hook-or-advice-when-aborting-org-capture-before-template-selection

    (defadvice org-capture
        (after make-full-window-frame activate)
      "Advise capture to be the only window when used as a popup"
      (if (equal "emacs-capture" (frame-parameter nil 'name))
          (delete-other-windows)))

    (defadvice org-capture-finalize
        (after delete-capture-frame activate)
      "Advise capture-finalize to close the frame"
      (if (equal "emacs-capture" (frame-parameter nil 'name))
          (delete-frame)))
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-image-actual-width (/ (display-pixel-width) 3)) ;; Set image size in org-mode to 1/3 of the display width
    (setq org-duration-format (quote h:mm))
    ;; Configure bibtex layer
    (defun org-ref-get-zotero-pdf-filename (key)
      "Return the pdf filename indicated by zotero file field.
Argument KEY is the bibtex key."
      (let* ((results (org-ref-get-bibtex-key-and-file key))
             (bibfile (cdr results))
             entry)
        (with-temp-buffer
          (insert-file-contents bibfile)
          (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
          (bibtex-search-entry key nil 0)
          (setq entry (bibtex-parse-entry))
          (let ((e (org-ref-reftex-get-bib-field "file" entry)))
            (if (> (length e) 4)
                (let ((clean-field (replace-regexp-in-string "/+" "/" e)))
                  (let ((first-file (car (split-string clean-field ";" t))))
                    first-file))
              (message "PDF filename not found.")
              )))))
    (setq org-ref-get-pdf-filename-function 'org-ref-get-zotero-pdf-filename)

    (setq org-ref-default-bibliography '("~/org-ref/zotero.bib")
          org-ref-pdf-directory "~/org-ref/pdfs"
          org-ref-bibliography-notes "~/org_notes/literature-notes.org"
          bibtex-completion-pdf-field "file")
    ;; Org protocol config
    (require 'edit-server)
    (edit-server-start)
    (require 'org-protocol)
    (require 'org-protocol-capture-html)

    ;; Enable autofill  mode by default in org buffers
    (add-hook 'org-mode-hook 'auto-fill-mode)

    ;; Load Poporg to use org mode for comment strings in other major modes.
    (autoload 'poporg-dwim "poporg" nil t)
    (global-set-key (kbd "C-c \"") 'poporg-dwim)

    ;; Configure org-mode to invoke thunderlinks with thunderbird
    (when (string-equal system-type "gnu/linux")
      ;; modify this for your system
      (setq thunderbird-program "thunderbird")

      (defun org-message-thunderlink-open (slash-message-id)
        "Handler for org-link-set-parameters that converts a standard message:// link into
   a thunderlink and then invokes thunderbird."
        ;; remove any / at the start of slash-message-id to create real message-id
        (let ((message-id
               (replace-regexp-in-string (rx bos (* "/"))
                                         ""
                                         slash-message-id)))
          (start-process
           (concat "thunderlink: " message-id)
           nil
           thunderbird-program
           "-thunderlink"
           (concat "thunderlink://messageid=" message-id)
           )))
      ;; on message://aoeu link, this will call handler with //aoeu
      (org-link-set-parameters "message" :follow #'org-message-thunderlink-open))
    (require 'org-inlinetask)
    ;; enable cdlatex extensions for org mode (see https://orgmode.org/manual/CDLaTeX-mode.html#CDLaTeX-mode)
    (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

    )

  



  ;; Configure PDFview to zoom with mousewheel
  (with-eval-after-load 'pdf-view
    (define-key pdf-view-mode-map (kbd "<C-mouse-5>") (lambda () (interactive) (pdf-view-shrink 1.05)))
    (define-key pdf-view-mode-map (kbd "<C-mouse-4>") (lambda () (interactive) (pdf-view-enlarge 1.05))))

  ;; Use PDFview as Auctex PDF viewer
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
  (setq pdf-sync-backward-display-action t)
  (setq pdf-sync-forward-display-action t)

  ;; to have the buffer refresh after compilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)

  ;; Load flycheck-grammarly
  ;; (require 'flycheck-grammarly)

  )




  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -shell-escape")
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (yapfify yaml-mode xterm-color wolfram-mode wgrep-helm wgrep web-mode web-beautify vterm virtualenvwrapper vala-snippets vala-mode thrift terminal-here tagedit systemd synosaurus stickyfunc-enhance stan-mode srefactor slim-mode shell-pop scss-mode scad-mode sass-mode riscv-mode qml-mode pytest pyenv-mode py-isort pug-mode prettier-js poporg pocket-reader org-web-tools rainbow-identifiers ov pocket-lib kv plantuml-mode pkgbuild-mode pippel pipenv pyvenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pandoc-mode ox-twbs ox-pandoc ospl-mode org-ref pdf-tools key-chord ivy tablist nov esxml nodejs-repl multi-term mscgen-mode mmm-mode minimap matlab-mode markdown-toc lsp-python-ms lsp-pyright logcat livid-mode skewer-mode live-py-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode insert-shebang importmagic epc ctable concurrent impatient-mode simple-httpd hoon-mode helm-rtags helm-pydoc helm-fzf helm-css-scss helm-bibtex bibtex-completion biblio parsebib biblio-core haml-mode graphviz-dot-mode google-c-style gmail-message-mode ham-mode html-to-markdown gh-md geben flyspell-correct-helm flyspell-correct flymd flycheck-ycmd flycheck-rtags flycheck-bashate fish-mode figlet eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elf-mode edit-server ebuild-mode drupal-mode disaster dap-mode posframe bui cython-mode csv-mode cpp-auto-include company-ycmd ycmd request-deferred deferred company-web web-completion-data company-shell company-rtags rtags company-reftex company-phpactor phpactor composer php-runtime company-php ac-php-core xcscope php-mode company-c-headers company-auctex company-ansible company-anaconda centaur-tabs cdlatex ccls blacken avy-zap auto-dictionary auctex arduino-mode ansible-doc ansible anaconda-mode pythonic adaptive-wrap tabbar helm-gtags ggtags switch-buffer-functions yasnippet-snippets unfill treemacs-magit smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain mwim magit-svn magit-section magit-gitflow magit-popup lsp-ui lsp-treemacs lsp-origami origami htmlize helm-org-rifle helm-lsp lsp-mode markdown-mode dash-functional helm-gitignore helm-git-grep helm-company helm-c-yasnippet gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flycheck-pos-tip pos-tip flycheck-hdl-questasim evil-org evil-magit magit git-commit with-editor transient company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-icons-dired toc-org symon symbol-overlay string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line)))
 '(spacemacs-theme-custom-colors (quote ((base . "#ffffff"))))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
