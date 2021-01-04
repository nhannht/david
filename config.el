;;; config.el --- the first file to init when spacemacs load this layer  -*- lexical-binding: t; -*-

;; Copyright (C) 2021

;; Author:  <larva@phoenix>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:


;;; Code:
(defvar private-path (concat (getenv "HOME") "/.emacs.d/private"))
(defvar david-path (concat private-path "/david"))
(setq byte-compile-warnings '(cl-functions))
()


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

(when (configuration-layer/package-usedp 'org)
  (defun spacemacs/org-enable ()
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
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp "^\\*\\* DONE "))))))))
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
 (setq org-agenda-files nil)
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
(setq safe-local-variable-values '((org-download-image-dir . "../assets/img/")))
(setq show-paren-mode t)
(setq size-indication-mode t)
(setq tab-always-indent nil)
(setq tab-stop-list '(4))
(setq tramp-copy-size-limit nil)
(setq yas-snippet-dirs '("~/snippets"))
