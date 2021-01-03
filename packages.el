;;; packages.el --- david layer packages file for spacemacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2021

;; Author:  <larva@phoenix>
;; Keywords: lisp, spacemacs

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

;;

;;; Code:


(defconst david-packages
  '(
    (install-elisp :location (recipe
                             :fetcher github
                             :repo "nhannht/install-elisp"))
    ;debug
    focus
    cl-lib
   ; evil
    ;hydra
    evil-leader
   ; evil-collection
    dracula-theme
    paredit
   ;airline-themes
    smart-window

    autopair
    ;rainbow-delimiters
    yasnippet-snippets
    yasnippet
    ivy-yasnippet
    helm-c-yasnippet
    dashboard
    all-the-icons
    js2-mode
    ;helm
    ivy
    ;which-key
    cperl-mode
    ;; (perl-completion
    ;;  :location (recipe
    ;;             :fetcher github
    ;;             :repo "nhannht/perl-completion"))
    ;company-plsense
    lsp-mode 
    lsp-mode                      
    json-mode
    lsp-ui
    helm-lsp
    evil-search-highlight-persist
    ;evil-args
    ;evil-matchit
    evil-textobj-syntax
    ;evil-textobj-line
    eshell-autojump
    ;bookmark
    pdf-tools
    tab-line
    anzu
    w3m
    elfeed
    cpp
  ;  projectile
   ; org
   ; org-superstar
    swiper
    counsel-etags
    ;company
    company-c-headers
    cc-mode
    ede
;    volatile-highlights
    ;clean-aindent-mode
    dtrt-indent
    ;ws-butler
    comment-dwim-2
    anzu
    iedit
    zygospore
    ggtags
  ;  helm-gtags
    anki-editor
    evil-textobj-entire
   ; evil-indent-plus
    evil-textobj-anyblock
    gdscript-mode
    emojify
    drag-stuff
    auto-yasnippet
   ; evil-surround
    virtualenvwrapper
    yaml-mode
    apache-mode
    gitignore-mode
    org-journal
    ;highlight-indentation
    ;org-graph-view

    (graph :location (recipe
                      :fetcher github
                      :repo "nhannht/graph.el"))
    ;undo-tree
    org-brain
    xmlgen
    a
   ; avy
    evil-text-object-python
    evil-python-movement
    pydoc
    docker
    docker-tramp
    ;ace-window
    dap-mode
    ini-mode
    ob-ipython
    ob-go
    yatemplate
    printing
    org-download
    ;diminish
    disaster
    htmlize
    annotate
  ;  ido
    ;; (org-pandoc-import
    ;;  :location
    ;;  (recipe :fetcher github
    ;;          :repo "nhannht/org-pandoc-import"))
    openwith
    flycheck
    rebox2
    markdown-mode
    all-the-icons-dired
    ssh-agency
    dired-rsync
    dired-git-info
    dired-rainbow
    gomacro-mode
    (snort-mode
     :location (recipe
                :fetcher github
                :repo "nhannht/snort-mode"))
    gist
    paredit-everywhere
    dockerfile-mode
    org-dashboard
    forge
    calfw
    calfw-org
    plantuml-mode
    ox-reveal
    poporg
    org
    ))
(defmacro bug|init (name &rest body)
  (declare (indent defun))
  (let ((id (if (listp name) (car name) name)))
    `(progn
       (defun ,(intern (format "david/init-%s" id)) ()
         (use-package ,id ,@body))
       (push ',name david-packages))))
;; (defun david/init-company ()
;;   (use-package company))
;; (bug|init install-elisp
;;           :config
;;           (setq install-elisp-repository-directory "~/.emacs.d/private/local/package-name"))
;; (bug|init debug
;;           :hook
;;           debugger-mode . (lambda ()
;;                             (turn-on-visual-line-mode)))
(bug|init focus
          :config
          (add-to-list 'focus-mode-to-thing '(python-mode . defun))
          :hook
          (python-mode . (lambda () (focus-mode 1)))
          (emacs-lisp-mode . (lambda ()
                               (focus-mode 1)))
          )




(defun david/init-install-elisp ()
  (use-package install-elisp
    :config
  (setq install-elisp-repository-directory "~/.emacs.d/local") ))

(defun david/init-debug ()
  (use-package debug
    :hook
  debugger-mode . (lambda () (turn-on-visual-line-mode))))

;; (defun david/init-focus ()
;;   (use-package focus
;;     (add-to-list 'focus-mode-to-thing '(python-mode . defun))
;;   :hook
;;   (python-mode . (lambda () (focus-mode 1)))
;;   (emacs-lisp-mode . (lambda () (focus-mode 1)))
;;     ))

(defun david/init-cl-lib ()
  (use-package cl-lib
    ))

(defun spacemacs-evil/init-evil ()
  (ignore-errors (use-package evil
                   :init
                   (setq evil-want-keybinding nil)
                   :config
                   (evil-mode 1)
                   (setq evil-default-state 'insert)
                   (define-key evil-normal-state-map "s" nil)
                   (define-key evil-normal-state-map (kbd "C-p") nil)
                   (define-key evil-insert-state-map (kbd "C-p") nil)

                   (evil-set-initial-state 'Custom-mode 'emacs)
                   (add-to-list 'evil-emacs-state-modes 'Custom-mode)
                   (evil-set-initial-state 'journal-search-mode 'emacs)
                   (evil-set-initial-state 'diff-mode 'emacs)
                   (add-to-list 'evil-emacs-state-modes 'calendar-mode)
                   (dolist (lst (list 'ibuffer-mode 'dired-mode 'perldoc-mode 'imenu-tree-mode))
                     (evil-set-initial-state lst 'emacs)) )))

(defun david/init-hydra ()
  (use-package hydra))

(defun david/init-evil-leader ()
  (use-package evil-leader
    :config
  (global-evil-leader-mode) ))
(defun david/init-evil-collection ()
  (use-package evil-collection

    :config
    (evil-collection-init)
    ))

(defun david/init-dracula-theme ()
  (use-package dracula-theme))
(defun laraemacs/post-init-dracula-theme ()
  (load-theme dracula))
(defun david/init-paredit ()
  (use-package paredit
    :config
  (add-hook 'emacs-lisp-mode-hook  'paredit-mode)
  (define-key paredit-mode-map (kbd "<C-left>") 'left-word)
  (define-key paredit-mode-map (kbd "<C-right>") 'right-word)))

(defun david/init-airline-themes ()
  (use-package airline-themes
    :config
  ;; (load-theme 'airline-base16_greenscreen t)
  (load-theme 'airline-base16_ocean)))

(defun david/init-smart-window ()
  (use-package smart-window))

(defun david/init-autopair ()
  (use-package autopair
    :config
  (autopair-global-mode)
))

(defun david/init-rainbow-delimiters ()
  (use-package rainbow-delimiters
    :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)))

(defun david/init-yasnippet-snippets ()
  (use-package yasnippet-snippets
    ))
(defun david/init-yasnippet ()
(use-package yasnippet
  :after (ivy-yasnippet helm-c-yasnippet)
  :config
  (defhydra hydra-yasnipet ()
    ("i" ivy-yasnippet "ivy-yasnippet" :exit t :column "yas")
    ("h" helm-yas-complete "helm" :exit t :column "yas")
    ("n" yas-new-snippet "new snippet" :exit t :column "yas")
    ("v" yas-visit-snippet-file "visit" :exit t :column "yas")
    ("ac" aya-create "aya create-step 1" :exit t :column "sucker")
    ("ax" aya-expand "aya repeat step 1" :exit t :column "sucker")
    ("as" aya-persist-snippet "aya save snippet" :exit t :column "sucker"))
  (global-set-key (kbd "C-c y") 'hydra-yasnipet/body)
  (yas-global-mode 1)
  ))

(defun david/init-ivy-yasnippet ()
  (use-package ivy-yasnippet))

(defun david/init-helm-c-yasnippet ()
  (use-package helm-c-yasnippet))

(defun david/init-dashboard ()
  (use-package dashboard
    :after (all-the-icons)
    :disabled t
    :config
    (dashboard-setup-startup-hook)
    (setq dashboard-banner-logo-title "Welcome to oasis of larva hacker")
    (setq dashboard-startup-banner (concat (getenv "HOME") "/pictures/larva.png"))
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)))

(defun david/init-all-the-icons ()
  (use-package all-the-icons))

(defun david/init-js2-mode ()
  (use-package js2-mode
    :bind
  (:map js2-mode-map ("C-x C-e" . js-send-line))
  (:map js2-mode-map ("C-c b" . js-send-buffer))))

(defun david/init-helm ()
  (use-package helm
    :requires evil
    :config
    ;; (helm-mode 1)
    (evil-leader/set-key
      "sb" 'helm-occur-from-isearch
      "sa" 'helm-occur-visible-buffers
      "bt" 'helm-buffers-list
      "hi" 'helm-recentf
      "TB" 'list-tags
      "TR" 'helm-etags-select
      "/" 'helm-occur-from-isearch
      )))

(defun david/init-ivy ()
  (use-package ivy
    :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map [tab] 'ivy-partial)
  :bind
  (:map ivy-minibuffer-map ("M-s" . ivy-partial))))

(defun david/init-which-key ()
(use-package which-key
  :config
  (setq which-key-show-early-on-C-h t)
  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  (setq which-key-idle-delay 1)
  (setq which-key-idle-secondary-delay 0.05)
  (which-key-enable-god-mode-support)
  (which-key-mode)))

(defun david/init-cperl-mode ()
(use-package cperl-mode
  :demand
  (load "pde-load")
  :config
  (defun iperl ()
    (interactive)
    (let ((directory  default-directory))

      (kill-matching-buffers "*iperl.*" nil t)
        (if (= 1 (length (window-list)))
            (split-window-right))
        (sit-for 0.5)
        (other-window 1)
        (setq default-directory directory)
        (ansi-term "re.pl" "iperl")
        (previous-window-any-frame)))
  ;; (advice-add 'iperl :override #'(setq term-ansi-buffer-name "iperl"))
  (advice-remove 'iperl #'(setq term-ansi-buffer-name "iperl"))
  ;; (define-key cperl-mode-map (kbd "C-c x") 'perl-exec)
  (define-key cperl-mode-map (kbd "M-3")
    (defhydra hydra-pde ()
      "Hydra for pde"
      ("f" pde-project-find-file "find file" :exit t :column "nav" )
      ("i" lsp-imenu "imenu" :exit t :column "nav")
      ("d" pde-perldoc-tree "perldoc-tree" :exit t :column "help")
      ("h" cperl-perldoc-at-point "perdoc at point" :exit t :column "help")
      ("t" cperl-etags "etags" :exit t :column "nav")
      ("m" cperl-indent-for-comment "comment end of line" :exit t :column "comment")
      ("I" iperl "perl with cat" :exit t :column "hack")
      ("E" (lambda ()
             (interactive)
             "like compile in other ide"
             (eshell-command (concat "perl " (buffer-file-name))))
       "execute this perl file" :exit t :column "hack")
      ))))

;; (defun david/init-perl-completion ()
;;   (use-package perl-completion
;;     ))

;; (defun david/init-company-plsense ()
;;   (use-package company-plsense
;;     :after (company plsense)
;;     :config
;;     (add-to-list 'company-backends 'company-plsense)))

(defun david/init-lsp-mode  ()
  (use-package lsp-mode
    ))


(defun david/init-json-mode ()
  (use-package json-mode))

(defun david/init-lsp-ui ()
  (use-package lsp-ui
    :commands lsp-ui-mode))

(defun david/init-helm-lsp ()
  (use-package helm-lsp
    :commands helm-lsp-workspace-symbol))

(defun david/init-evil-search-highlight-persist ()
  (use-package evil-search-highlight-persist
    :config
    (global-evil-search-highlight-persist t)))

(defun david/init-evil-args ()
  (use-package evil-args))

(defun david/init-evil-matchit ()
  (use-package evil-matchit))

(defun david/init-evil-textobj-syntax ()
  (use-package evil-textobj-syntax))

(defun david/init-evil-textobj-line ()
  (use-package evil-textobj-line))

(defun david/init-eshell-autojump ()
  (use-package eshell-autojump))

(defun david/init-bookmark ()
  (use-package bookmark))

(defun david/init-pdf-tools ()
  (use-package pdf-tools))

(defun david/init-tab-line ()
  (use-package tab-line))

(defun david/init-anzu ()
  (use-package anzu))

(defun david/init-w3m ()
  (use-package w3m))

(defun david/init-elfeed ()
  (use-package elfeed))

(defun david/init-cpp ()
  (use-package cpp))

(defun david/init-projectile ()
  (use-package projectile))

(defun david/init-org ()
  (use-package org))

(defun david/init-org-superstar ()
  (use-package org-superstar))

(defun david/init-swiper ()
  (use-package swiper))

(defun david/init-counsel-etags ()
  (use-package counsel-etags))



(defun david/init-company-c-headers ()
  (use-package company-c-headers))

(defun david/init-cc-mode ()
  (use-package cc-mode))

(defun david/init-ede ()
  (use-package ede))

(defun david/init-volatile-highlights ()
  (use-package volatile-highlights))

(defun david/init-clean-aindent-mode ()
  (use-package clean-aindent-mode))

(defun david/init-dtrt-indent ()
  (use-package dtrt-indent))

(defun david/init-ws-butler ()
  (use-package ws-butler))

(defun david/init-comment-dwim-2 ()
  (use-package comment-dwim-2))

(defun david/init-anzu ()
  (use-package anzu))

(defun david/init-iedit ()
  (use-package iedit))

(defun david/init-zygospore ()
  (use-package zygospore))

(defun david/init-ggtags ()
  (use-package ggtags))

;; (defun david/init-helm-gtags ()
;;   (use-package helm-gtags))

(defun david/init-anki-editor ()
  (use-package anki-editor))

(defun david/init-evil-textobj-entire ()
  (use-package evil-textobj-entire))

(defun david/init-evil-indent-plus ()
  (use-package evil-indent-plus))

(defun david/init-evil-textobj-anyblock ()
  (use-package evil-textobj-anyblock))

(defun david/init-gdscript-mode ()
  (use-package gdscript-mode))

(defun david/init-emojify ()
  (use-package emojify))

(defun david/init-drag-stuff ()
  (use-package drag-stuff))

(defun david/init-auto-yasnippet ()
  (use-package auto-yasnippet))

(defun david/init-evil-surround ()
  (use-package evil-surround))

(defun david/init-virtualenvwrapper ()
  (use-package virtualenvwrapper))

(defun david/init-yaml-mode ()
  (use-package yaml-mode))

(defun david/init-apache-mode ()
  (use-package apache-mode))

(defun david/init-gitignore-mode ()
  (use-package gitignore-mode))

(defun david/init-org-journal ()
  (use-package org-journal))

(defun david/init-highlight-indentation ()
  (use-package highlight-indentation))

(defun david/init-org-graph-view ()
  (use-package org-graph-view))

(defun david/init-graph ()
  (use-package graph))

(defun david/init-undo-tree ()
  (use-package undo-tree))

(defun david/init-org-brain ()
  (use-package org-brain))

(defun david/init-xmlgen ()
  (use-package xmlgen))

(defun david/init-a ()
  (use-package a))

(defun david/init-avy ()
  (use-package avy))

(defun david/init-evil-text-object-python ()
  (use-package evil-text-object-python))

(defun david/init-evil-python-movement ()
  (use-package evil-python-movement))

(defun david/init-pydoc ()
  (use-package pydoc))

(defun david/init-docker ()
  (use-package docker))

(defun david/init-docker-tramp ()
  (use-package docker-tramp))

(defun david/init-ace-window ()
  (use-package ace-window))

(defun david/init-dap-mode ()
  (use-package dap-mode))

(defun david/init-ini-mode ()
  (use-package ini-mode))

(defun david/init-ob-ipython ()
  (use-package ob-ipython))

(defun david/init-ob-go ()
  (use-package ob-go))

(defun david/init-yatemplate ()
  (use-package yatemplate))

(defun david/init-printing ()
  (use-package printing))

(defun david/init-org-download ()
  (use-package org-download))

(defun david/init-diminish ()
  (use-package diminish))

(defun david/init-disaster ()
  (use-package disaster))

(defun david/init-htmlize ()
  (use-package htmlize))

(defun david/init-annotate ()
  (use-package annotate))

(defun david/init-ido ()
  (use-package ido))

;; (defun david/init-org-pandoc-import ()
;;   (use-package org-pandoc-import))

(defun david/init-openwith ()
  (use-package openwith))

(defun david/init-flycheck ()
  (use-package flycheck))

(defun david/init-rebox2 ()
  (use-package rebox2))

(defun david/init-markdown-mode ()
  (use-package markdown-mode))

(defun david/init-all-the-icons-dired ()
  (use-package all-the-icons-dired))

(defun david/init-ssh-agency ()
  (use-package ssh-agency))

(defun david/init-dired-rsync ()
  (use-package dired-rsync))

(defun david/init-dired-git-info ()
  (use-package dired-git-info))

(defun david/init-dired-rainbow ()
  (use-package dired-rainbow))

(defun david/init-gomacro-mode ()
  (use-package gomacro-mode))

(defun david/init-snort-mode ()
  (use-package snort-mode))

(defun david/init-gist ()
  (use-package gist))

(defun david/init-paredit-everywhere ()
  (use-package paredit-everywhere))

(defun david/init-dockerfile-mode ()
  (use-package dockerfile-mode))

(defun david/init-org-dashboard ()
  (use-package org-dashboard))

(defun david/init-forge ()
  (use-package forge))

(defun david/init-calfw ()
  (use-package calfw))

(defun david/init-calfw-org ()
  (use-package calfw-org))

(defun david/init-plantuml-mode ()
  (use-package plantuml-mode))

(defun david/init-ox-reveal ()
  (use-package ox-reveal))

(defun david/init-poporg ()
  (use-package poporg))

(defun david/init-org ()
  (use-package org))
