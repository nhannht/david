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
(setq evil-default-state 'insert)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq inferior-lisp-program "sbcl")
;(setq dashboard-banner-logo-title "Welcome to oasis of larva hacker")
;;; (setq dashboard-startup-banner (concat (getenv "HOME") "/pictures/larva.png"))
;; (setq dashboard-set-heading-icons t)
;; (setq dashboard-set-file-icons t)))
;; (setq bookmark-alist (delq latest bookmark-alist)
;(setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))
(setq org-startup-with-inline-images t)
;(setq org-directory "~/org/capture/")
(setq org-hide-emphasis-markers t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;(setq global-company-mode '(not 'snippet-mode))
(setq dtrt-indent-verbosity 0)
(setq iedit-toggle-key-default nil)
;; (setq helm-gtags-ignore-case t
;; (setq venv-location '((concat (getenv "HOME") "/pythonistas/realpython/env/")))
;; (setq org-journal-dir (concat (getenv "HOME") "/org/journal/"))
;; (setq org-journal-file-format "%Y_%m_%d.org")
;; (setq org-journal-date-prefix "* Daily Notes 🐱")
;; (setq org-journal-carryover-items ""))
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
