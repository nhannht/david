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
   '(html
     ;gtags
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     javascript
     java
      auto-completion
     ;; better-defaults
    ; haskell
    ; rust
     emacs-lisp
     common-lisp
    ; clojure 
    ; go
     ;; git
     helm
     lsp
     dap
     ;; markdown
     multiple-cursors
     (org :variables org-enable-org-journal-support t)
      (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     ;; spell-checking
      syntax-checking
     ;; version-control
     treemacs
     david)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    autopair
                                    )

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
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(dracula)

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

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
   dotspacemacs-auto-resume-layouts nil

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
   dotspacemacs-enable-paste-transient-state nil

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
   dotspacemacs-maximized-at-startup nil

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

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

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

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; (setq spacemacs-default-company-backends '(( company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev))
  (setq company-backends '(company-capf ( company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev))
  ;; (progn
  ;;   (server-start)
  ;;   (unless (server-running-p)
  ;;     (server-start)))
;; init for scratch buffer
  (define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)
  (setq initial-major-mode 'org-mode)
  ;; spacemacs use smart parrent, not autopair
  (smartparens-global-mode 1) 
  (global-tab-line-mode -1)
  ;; (menu-bar-mode -1 )
  ;; (toggle-scroll-bar -1)
  ;; (tool-bar-mode -1)
  ;; (defun dotspacemacs/user-config ()
  ;;   (setq inferior-lisp-program ""))
  (dolist (conf (list "/hydra.el"
                      ))
    (load-file (concat david-path conf)))
  (add-hook 'org-mode-hook
            (lambda () (electric-indent-local-mode -1)))

  (evil-set-initial-state 'calendar-mode 'emacs)

  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (lisp . t)
     (C . t )
     (go . t)
     (plantuml . t)
     (octave . t)
     (python . t)
     (ipython . t)
     (shell . t)
     (perl . t )
     (ditaa . t)
     (haskell . t)
     ;; Include other languages here...
     ))
  


  (setq org-hide-emphasis-markers t)
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  ;; Fix an incompatibility between the ob-async and ob-ipython packages
  ;; (setq ob-async-no-async-languages-alist '("ipython"))


  (setq debug-on-error t)
  (setq package-check-signature nil)

  (setq byte-compile-warnings '(cl-functions))
                                        ;(setq evil-default-state 'insert)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq inferior-lisp-program "sbcl")
  (setq org-startup-with-inline-images t)
  (setq org-hide-emphasis-markers t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq dtrt-indent-verbosity 0)
  (setq iedit-toggle-key-default nil)
  (setq aw-background nil)
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
  (if (not (file-exists-p "~/org"))
      (async-shell-command-no-window "mkdir -p ~/org && cd ~/org && mkdir -p journal capture agenda"))

  (progn
                                        ;(org-agenda . (lambda () (turn-on-visual-line-mode) ))
    (setq org-refile-targets
          (quote ((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))))
    (ignore-errors
      (setq org-agenda-files (list "~/org/" "~/org/journal/" "~/org/capture/")))
    (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
    (ignore-errors (add-to-list 'org-agenda-files org-journal-dir))
    ;; custom command
    (setq org-agenda-custom-commands
          '(
            ("d" "Deadline-over" agenda "display deadlines and exclude scheduled" (
                                                                                   (org-agenda-span 'month)
                                                                                   (org-agenda-time-grid nil)
                                                                                   (org-agenda-show-all-dates nil)
                                                                                   (org-agenda-entry-types '(:deadline)) ;; this entry excludes :scheduled
                                                                                   (org-deadline-warning-days 0) ))
            ))
    (add-to-list
     'org-agenda-custom-commands
     '("D" "Done shit"
       agenda ""
       ((org-agenda-start-day "-14d")
        (org-agenda-span 14)
        (org-agenda-start-on-weekday 1)
        (org-agenda-start-with-log-mode '(closed))
        (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp "^\\*\\* DONE "))))))
  (setq global-visual-line-mode t)

  (setq bookmark-default-file "~/org/bookmarks")
  (setq bookmark-version-control 'nospecial)
  (setq dired-listing-switches "-alh")
  (setq display-line-numbers t)
  (setq gdb-many-windows t)
  (setq global-visual-line-mode t)
  (setq helm-bookmark-show-location t)
  ;; (setq helm-completion-style 'emacs)
  ;; (setq helm-minibuffer-history-key "M-p")
  ;;                                         ;(setq help-at-pt-display-when-idle t nil (help-at-pt))
  ;; (setq initial-major-mode 'org-mode)

  (setq ivy-case-fold-search-default t)
  (setq lsp-go-gopls-server-path (concat (getenv "HOME") "/go/bin/gopls"))
  (setq lsp-pyls-server-command '("pyls"))
  (setq openwith-associations
        '(("\\.pdf\\'" "okular"
           (file))
          ("\\.mp3\\'" "vlc"
           (file))
          ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
           ("-idx" file))
          ("\\.odt\\'" "libreoffice"
           (file))
          ("\\.\\(xlsx\\|xls\\)\\'" "libreoffice"
           (file))))
  (setq openwith-confirm-invocation t)
  (setq org-ditaa-jar-path "/use/share/java/ditaa/")
  (setq org-download-abbreviate-filename-function 'file-relative-name)
  (setq org-download-heading-lvl nil)
  (setq org-download-image-dir "_assets")
  (setq org-download-screenshot-method "import %s")
  (setq org-file-apps
        '((auto-mode . emacs)
          (directory . emacs)
          ("\\.mm\\'" . "freeplane &")
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . "okular &")
          ("\\.odt\\'" . "mimeopen")
          ("\\.jpeg\\'" . "fim")))
  (setq org-journal-date-format "%Y-%m-%d")
  (setq org-journal-time-prefix "** 🐱 ")
  (setq org-plantuml-executable-path "/usr/bin/plantuml")
  (setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq org-structure-template-alist
        '(("n" . "notes")
          ("a" . "export ascii")
          ("c" . "center")
          ("C" . "comment")
          ("e" . "example")
          ("E" . "export")
          ("h" . "html")
          ("l" . "export latex")
          ("q" . "quote")
          ("s" . "src shell")
          ("v" . "verse")
          ("p" . "properties")
          ("S" . "src shell :results output :exports both ")
          ("u" . "src plantuml :file out.png :dir _assets/img/")))
  (setq plantuml-default-exec-mode 'jar)
  (setq projectile-known-projects-file "~/org/projectile-bookmarks.eld")
  (setq rcirc-prompt ":cat: >")

  (setq recentf-max-menu-items 100)
  (setq recentf-max-saved-items 100)
  (setq  org-download-image-dir  "./__assets/img/")
  (setq show-paren-mode t)
  (setq size-indication-mode t)
  (setq tab-always-indent nil)
  (setq tab-stop-list '(4))
  (setq tramp-copy-size-limit nil)
  (setq yas-snippet-dirs '("~/snippets"))
;; use for org-download



  (spaceline-toggle-org-pomodoro-on)
  (setq save-interprogram-paste-before-kill nil)

  ;; (use-package dante
  ;;   :ensure t
  ;;   :after haskell-mode
  ;;   :commands 'dante-mode
  ;;   :init
  ;;   (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;;   ;; OR for flymake support:
  ;;   (add-hook 'haskell-mode-hook 'flymake-mode)
  ;;   (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

  ;;   (add-hook 'haskell-mode-hook 'dante-mode)
  ;;   )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(package-selected-packages
   '(zygospore yatemplate yasnippet-snippets yaml-mode xmlgen ws-butler which-key w3m volatile-highlights virtualenvwrapper vi-tilde-fringe uuidgen use-package undo-tree toc-org ssh-agency spaceline powerline snort-mode smart-window restart-emacs rebox2 rainbow-delimiters pydoc popwin poporg plantuml-mode persp-mode pdf-tools pcre2el paredit-everywhere paredit paradox ox-reveal org-journal org-download org-dashboard org-bullets org-brain openwith open-junk-file ob-ipython ob-go neotree move-text macrostep lsp-ui lorem-ipsum linum-relative link-hint js2-mode ivy-yasnippet install-elisp ini-mode indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile helm-mode-manager helm-make helm-lsp helm-flx helm-descbinds helm-c-yasnippet helm-ag graph google-translate gomacro-mode go-mode golden-ratio gitignore-mode gist gh marshal logito pcache ggtags gdscript-mode forge magit ghub closql emacsql-sqlite emacsql treepy git-commit with-editor focus flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-syntax names evil-textobj-entire evil-textobj-anyblock evil-text-object-python evil-surround evil-search-highlight-persist highlight evil-python-movement evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-leader evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu evil goto-chg eval-sexp-fu eshell-autojump emojify elisp-slime-nav elfeed dumb-jump dtrt-indent drag-stuff dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat disaster dired-rsync dired-rainbow dired-hacks-utils dired-git-info diminish define-word dashboard page-break-lines dap-mode lsp-treemacs bui lsp-mode treemacs cfrs hydra pfuture posframe lv markdown-mode spinner ht f dash-functional s counsel-etags counsel swiper ivy company-c-headers company comment-dwim-2 column-enforce-mode clean-aindent-mode calfw-org calfw bind-map bind-key autopair auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed apache-mode anzu annotate anki-editor dash request all-the-icons-dired all-the-icons memoize aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async a dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(haskell-compile-cabal-build-alt-command "cabal clean -s && cabal build --ghc-option=-ferror-spans ")
 '(haskell-compile-cabal-build-command "cabal build --ghc-option=-ferror-spans ")
 '(haskell-compile-command "ghc -Wall -ferror-spans -fforce-recomp  -c %s ")
 '(org-agenda-files
   '("~/repo/nhannht/public/hypata-8/readme.org" "/home/larva/org/journal/2020_10_11.org" "/home/larva/org/journal/2020_10_12.org" "/home/larva/org/journal/2020_10_13.org" "/home/larva/org/journal/2020_10_14.org" "/home/larva/org/journal/2020_10_15.org" "/home/larva/org/journal/2020_10_16.org" "/home/larva/org/journal/2020_10_17.org" "/home/larva/org/journal/2020_10_18.org" "/home/larva/org/journal/2020_10_19.org" "/home/larva/org/journal/2020_10_20.org" "/home/larva/org/journal/2020_10_21.org" "/home/larva/org/journal/2020_10_22.org" "/home/larva/org/journal/2020_10_23.org" "/home/larva/org/journal/2020_10_24.org" "/home/larva/org/journal/2020_10_25.org" "/home/larva/org/journal/2020_10_26.org" "/home/larva/org/journal/2020_10_27.org" "/home/larva/org/journal/2020_10_28.org" "/home/larva/org/journal/2020_10_29.org" "/home/larva/org/journal/2020_10_30.org" "/home/larva/org/journal/2020_11_02.org" "/home/larva/org/journal/2020_11_03.org" "/home/larva/org/journal/2020_11_04.org" "/home/larva/org/journal/2020_11_05.org" "/home/larva/org/journal/2020_11_06.org" "/home/larva/org/journal/2020_11_07.org" "/home/larva/org/journal/2020_11_08.org" "/home/larva/org/journal/2020_11_09.org" "/home/larva/org/journal/2020_11_10.org" "/home/larva/org/journal/2020_11_11.org" "/home/larva/org/journal/2020_11_12.org" "/home/larva/org/journal/2020_11_13.org" "/home/larva/org/journal/2020_11_14.org" "/home/larva/org/journal/2020_11_16.org" "/home/larva/org/journal/2020_11_17.org" "/home/larva/org/journal/2020_11_18.org" "/home/larva/org/journal/2020_11_19.org" "/home/larva/org/journal/2020_11_20.org" "/home/larva/org/journal/2020_11_21.org" "/home/larva/org/journal/2020_11_22.org" "/home/larva/org/journal/2020_11_23.org" "/home/larva/org/journal/2020_11_25.org" "/home/larva/org/journal/2020_11_26.org" "/home/larva/org/journal/2020_11_30.org" "/home/larva/org/journal/2020_12_01.org" "/home/larva/org/journal/2020_12_02.org" "/home/larva/org/journal/2020_12_04.org" "/home/larva/org/journal/2020_12_05.org" "/home/larva/org/journal/2020_12_06.org" "/home/larva/org/journal/2020_12_08.org" "/home/larva/org/journal/2020_12_10.org" "/home/larva/org/journal/2020_12_11.org" "/home/larva/org/journal/2020_12_12.org" "/home/larva/org/journal/2020_12_14.org" "/home/larva/org/journal/2020_12_15.org" "/home/larva/org/journal/2020_12_16.org" "/home/larva/org/journal/2020_12_17.org" "/home/larva/org/journal/2020_12_18.org" "/home/larva/org/journal/2020_12_24.org" "/home/larva/org/journal/2020_12_25.org" "/home/larva/org/journal/2020_12_26.org" "/home/larva/org/journal/2020_12_29.org" "/home/larva/org/journal/2020_12_30.org" "/home/larva/org/journal/2020_12_31.org" "/home/larva/org/journal/2021_01_01.org" "/home/larva/org/journal/2021_01_02.org" "/home/larva/org/journal/2021_01_03.org" "/home/larva/org/journal/2021_01_04.org" "/home/larva/org/journal/2021_01_05.org" "/home/larva/org/journal/plant-uml-exam.org" "/home/larva/org/64-bit-plain-text.org" "/home/larva/org/ccna.org" "/home/larva/org/contest.org" "/home/larva/org/crypto.org" "/home/larva/org/des-16-round.org" "/home/larva/org/des-64-bit-cipher-text.org" "/home/larva/org/des-algo.org" "/home/larva/org/des-final-permu.org" "/home/larva/org/des-ip.org" "/home/larva/org/des-key.org" "/home/larva/org/des-left-plain.org" "/home/larva/org/des-right-plain.org" "/home/larva/org/kaka.org" "/home/larva/org/princible.org" "/home/larva/org/srwe.org" "/home/larva/org/journal/2020_10_11.org" "/home/larva/org/journal/2020_10_12.org" "/home/larva/org/journal/2020_10_13.org" "/home/larva/org/journal/2020_10_14.org" "/home/larva/org/journal/2020_10_15.org" "/home/larva/org/journal/2020_10_16.org" "/home/larva/org/journal/2020_10_17.org" "/home/larva/org/journal/2020_10_18.org" "/home/larva/org/journal/2020_10_19.org" "/home/larva/org/journal/2020_10_20.org" "/home/larva/org/journal/2020_10_21.org" "/home/larva/org/journal/2020_10_22.org" "/home/larva/org/journal/2020_10_23.org" "/home/larva/org/journal/2020_10_24.org" "/home/larva/org/journal/2020_10_25.org" "/home/larva/org/journal/2020_10_26.org" "/home/larva/org/journal/2020_10_27.org" "/home/larva/org/journal/2020_10_28.org" "/home/larva/org/journal/2020_10_29.org" "/home/larva/org/journal/2020_10_30.org" "/home/larva/org/journal/2020_11_02.org" "/home/larva/org/journal/2020_11_03.org" "/home/larva/org/journal/2020_11_04.org" "/home/larva/org/journal/2020_11_05.org" "/home/larva/org/journal/2020_11_06.org" "/home/larva/org/journal/2020_11_07.org" "/home/larva/org/journal/2020_11_08.org" "/home/larva/org/journal/2020_11_09.org" "/home/larva/org/journal/2020_11_10.org" "/home/larva/org/journal/2020_11_11.org" "/home/larva/org/journal/2020_11_12.org" "/home/larva/org/journal/2020_11_13.org" "/home/larva/org/journal/2020_11_14.org" "/home/larva/org/journal/2020_11_16.org" "/home/larva/org/journal/2020_11_17.org" "/home/larva/org/journal/2020_11_18.org" "/home/larva/org/journal/2020_11_19.org" "/home/larva/org/journal/2020_11_20.org" "/home/larva/org/journal/2020_11_21.org" "/home/larva/org/journal/2020_11_22.org" "/home/larva/org/journal/2020_11_23.org" "/home/larva/org/journal/2020_11_25.org" "/home/larva/org/journal/2020_11_26.org" "/home/larva/org/journal/2020_11_30.org" "/home/larva/org/journal/2020_12_01.org" "/home/larva/org/journal/2020_12_02.org" "/home/larva/org/journal/2020_12_04.org" "/home/larva/org/journal/2020_12_05.org" "/home/larva/org/journal/2020_12_06.org" "/home/larva/org/journal/2020_12_08.org" "/home/larva/org/journal/2020_12_10.org" "/home/larva/org/journal/2020_12_11.org" "/home/larva/org/journal/2020_12_12.org" "/home/larva/org/journal/2020_12_14.org" "/home/larva/org/journal/2020_12_15.org" "/home/larva/org/journal/2020_12_16.org" "/home/larva/org/journal/2020_12_17.org" "/home/larva/org/journal/2020_12_18.org" "/home/larva/org/journal/2020_12_24.org" "/home/larva/org/journal/2020_12_25.org" "/home/larva/org/journal/2020_12_26.org" "/home/larva/org/journal/2020_12_29.org" "/home/larva/org/journal/2020_12_30.org" "/home/larva/org/journal/2020_12_31.org" "/home/larva/org/journal/2021_01_01.org" "/home/larva/org/journal/2021_01_02.org" "/home/larva/org/journal/2021_01_03.org" "/home/larva/org/journal/2021_01_04.org" "/home/larva/org/journal/2021_01_05.org" "/home/larva/org/journal/plant-uml-exam.org" "/home/larva/org/capture/notes_2020-10-11.org" "/home/larva/org/capture/notes_2020-10-12.org" "/home/larva/org/capture/notes_2020-10-18.org" "/home/larva/org/capture/notes_2020-10-22.org"))
 '(org-download-image-dir "__assets/img")
 '(package-selected-packages
   '(dante web-mode web-beautify tagedit slim-mode scss-mode pug-mode prettier-js simple-httpd helm-css-scss haml-mode emmet-mode counsel-css web-completion-data add-node-modules-path zygospore yatemplate yasnippet-snippets yaml-mode xmlgen ws-butler which-key w3m volatile-highlights virtualenvwrapper vi-tilde-fringe uuidgen use-package undo-tree toc-org ssh-agency spaceline powerline snort-mode smart-window restart-emacs rebox2 rainbow-delimiters pydoc popwin poporg plantuml-mode persp-mode pdf-tools pcre2el paredit-everywhere paredit paradox ox-reveal org-journal org-download org-dashboard org-bullets org-brain openwith open-junk-file ob-ipython ob-go neotree move-text macrostep lsp-ui lorem-ipsum linum-relative link-hint js2-mode ivy-yasnippet install-elisp ini-mode indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile helm-mode-manager helm-make helm-lsp helm-flx helm-descbinds helm-c-yasnippet helm-ag graph google-translate gomacro-mode go-mode golden-ratio gitignore-mode gist gh marshal logito pcache ggtags gdscript-mode forge magit ghub closql emacsql-sqlite emacsql treepy git-commit with-editor focus flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-syntax names evil-textobj-entire evil-textobj-anyblock evil-text-object-python evil-surround evil-search-highlight-persist highlight evil-python-movement evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-leader evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu evil goto-chg eval-sexp-fu eshell-autojump emojify elisp-slime-nav elfeed dumb-jump dtrt-indent drag-stuff dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat disaster dired-rsync dired-rainbow dired-hacks-utils dired-git-info diminish define-word dashboard page-break-lines dap-mode lsp-treemacs bui lsp-mode treemacs cfrs hydra pfuture posframe lv markdown-mode spinner ht f dash-functional s counsel-etags counsel swiper ivy company-c-headers company comment-dwim-2 column-enforce-mode clean-aindent-mode calfw-org calfw bind-map bind-key autopair auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed apache-mode anzu annotate anki-editor dash request all-the-icons-dired all-the-icons memoize aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async a dracula-theme))
 '(save-interprogram-paste-before-kill nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
