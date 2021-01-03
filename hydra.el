;;; bindings.el --- most binding should add here     -*- lexical-binding: t; -*-

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

;;

;;; Code:
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
      )

(define-key cperl-mode-map (kbd "M-3") 'hydra-pde/body)

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(defhydra hydra-buffer-menu (:color pink
                                    :hint nil Buffer-menu-mode-map ".")

  ("m" Buffer-menu-mark "mark")
  ("u" Buffer-menu-unmark "unmark")
  ("U" Buffer-menu-backup-unmark "backup-umark")
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(defhydra hydra-emacs-lisp-eval (:color "pink" :hint nil)

  ("e" eval-defun "eval this sexp")
  ("D" eval-last-sexp "eval the lst sexp")
  ("i" eval-expression  " interactive  eval")
  ("c" nil "cancel") ("q" quit-window "quit"))
(define-key emacs-lisp-mode-map (kbd "C-1") 'hydra-emacs-lisp-eval)

(define-key global-map (kbd "M-1")
  (defhydra hydra-nav (:color pink)
    "Fucking     "
    ("M-e" eshell "eshell" :exit t :column "shell")
    ("w" other-window "other win" :exit t :column "window")
    ("z" counsel-bookmark "cou bm " :exit t :column "bookmark")
    ("Z" counsel-bookmarked-directory "cou bm dir" :exit t :column "bookmark")
    ("A" helm-bookmarks "helm bm" :exit t :column "bookmark")
    ("a" helm-find-files "helm find" :exit t :column "window")
    ("|" (message (buffer-file-name)) "full file path")
    ("F" make-frame "make frame" :exit t :column "frame")
    ("h" evil-window-left "move to window left" :column "window" )
    ;; ("<left>" evil-window-left "move to window left")
    ("j" evil-window-down "move to window down" :column "window" )
    ;; ("<down>" evil-window-down "move to window down")
    ("k" evil-window-up "move to window up" :column "window"  )
    ;; ("<up>" evil-window-up "move to window up")
    ("l" evil-window-right "move to window right" :column "window" )
    ;; ("<right>" evil-window-right "move to window right")
    ("n" next-buffer "move to next buffer" :column "buffer")
    ("p" previous-buffer "move to prev buffer" :column "buffer")
    ("v v" multi-vterm "new vterm" :column "vterm" :exit t)
    ("v n" multi-vterm-next "next vterm" :column "vterm")
    ("v p" multi-vterm-prev "prev vterm" :column "vterm")
    ("v t" multi-vterm-dedicated-toggle "temp vterm in split-window" :column "vterm")
    ("v c" multi-vterm-dedicated-close "close that temp vterm" :column "vterm")
    ("v r" multi-vterm-dedicated-select "quick select" :column "vterm" :exit t)
    (" d" evil-delete-buffer "stop/delete window " :column "window")
    ("Q" evil-quit "quit/hide buffer")
    ("q" nil "stop")
    ("=" evil-window-vsplit "split window vertical" :column "window")
    ("-" evil-window-split "split window horizonal" :column "window")
    ("1" helm-buffers-list "buffer list/History" :exit t)
    ("b" helm-buffers-list "buffer list/History" :exit t)
    ("r" helm-recentf "recenf file" :exit t)
    ("o" evil-jump-backward "jump backward position")
    ("O" evil-jump-forward "jump to new position")
    ("m " (switch-to-buffer-other-window "*Messages*") "warning buffer" :exit t :column "file")
    ("i" edit-init "init file" :exit t :column "file")
    ("s"  (switch-to-buffer-other-window "*scratch*") "a plain shitking scratch" :exit t :column "file")
    ("e" (find-file-other-window (concat (getenv "HOME") "/.emacs.d/elfeed.org") "elfeed" :exit t :column "file"))
    ("E" elfeed-other-frame "open elfeed " :exit t :column "frame")
    ("2" ace-window "switch window" :exit t)
    ("M-1" nil "cancel")))


(global-set-key (kbd "C-h M") 'which-key-show-major-mode)

(global-set-key (kbd "C-h R") 'which-key-show-minor-mode-keymap)

(define-key global-map (kbd "C-S-e")
  (defhydra hydra-which-key ()
    ("M" which-key-show-major-mode "show key binding for major mode")
    ("m" which-key-show-minor-mode-keymap "show key binding for minor mode")
    ("c" nil "cancel") ("q" quick-window "quit")))

(ignore-errors
  (dolist (emap (list elfeed-show-mode-map elfeed-search-mode-map))
                 (define-key emap (kbd "t")
                   (defhydra hydra-elfeed ()
                     ("o" w3m-goto-url "use w3m at point" :exit t :column "browser")
                     ("p" percollate-url-at-point "percollate at point" :exit t :column "browser")
                     ) )))

(define-key org-mode-map (kbd "M-6")
  (defhydra hydra-org (:color pink)
    "Org hydra"
    ("q" nil "exit")
    ("c" (lambda ()
           (interactive)
           (setq current-prefix-arg '(4))
           (call-interactively 'org-toggle-checkbox)) "create or remove checkbox"  :column "todo")
    ("z" (lambda ()
           (interactive)
           (setq current-prefix-arg '(16))
           (call-interactively 'org-toggle-checkbox)) "- in check box"  :column "todo")
    ("x" org-toggle-checkbox "x  this checkbox" :column "todo")
    ("m" magit-status "magit" :exit t :column "project")
    ("e" (info-display-manual "elisp") "elisp")
    ("s" counsel-info-lookup-symbol "symbol")
    ("p" perldoc-word-at-point "perldoc")
    ("h" org-metaleft "org heading left")
    ("l" org-metaright "org heading right")
    ("H" org-shiftmetaleft "org subtree left")
    ("L" org-shiftmetaright "org subtree right")
    ("v" org-redisplay-inline-images "display inline image")
    ("i" org-graph-view "convert org to image")
    ))

(dolist (map (list c-mode-map
               c++-mode-map
               emacs-lisp-mode-map))
  (define-key map (kbd "M-5")
    (defhydra hydra-ggtags ()
      ("s" ggtags-find-other-symbol "find symbol" :exit t :column "nav")
      ("t" ggtags-view-tag-history "tag history" :exit t :column "nav")
      ("r" ggtags-find-reference "reference" :exit t :column "nav")
      ("f" ggtags-find-file "find file" :exit t :column "file")
      ("c" ggtags-create-tags "create tags" :exit t :column "tag")
      ("u" ggtags-update-tags "update tags" :exit t :column "tag")
      ("a" helm-gtags-tags-in-this-function "helm tags" :exit t :column "tag")
      (">" ggtags-next-mark "next mark" :column "nav")
      ("<" ggtags-prev-mark "prev mark" :column "nav"))))

(define-key global-map (kbd "C-s")
  (defhydra hydra-swiper ()
  ("s" swiper "search" :exit t :column "swiper")
  ("S" swiper-backward "search backward" :exit t :column "swiper")
  ("a" swiper-all "all buffer" :exit t :column "swiper")
  ("C-s" nil "close")
  ("p" swiper-thing-at-point "at point" :exit t :column "swiper")
  ("P" swiper-all-thing-at-point "all at point" :exit t :column "swiper")
  ("h o" helm-org-rifle-current-buffer "helm header org buffer" :exit t :column "helm")
  ("h O" helm-org-rifle-directories "helm header org dir" :exit t  :column "helm")
  ("o" counsel-org-goto "counsel org outline" :exit t :column "counsel")
  ))

(define-key global-map (kbd "M-2")
  (defhydra hydra-notes ()
  (concat (shell-command-to-string "date") )
  ("b" org-brain-visualize "Fucking your brain" :exit t :column "brain")
  ("j" org-journal-new-entry "note in journal" :exit t :column "brain")
  ("a" org-agenda "to-do-list" :exit t :column "agenda")
  ("]" annotate-goto-next-annotation "next an" :exit nil :column "anno")
  ("[" annotate-goto-previous-annotation "prev an" :exit nil :column "anno")
  ("ee" annotate-annotate "annotation" :exit t :column "anno")
  ("r" annotate-clear-annotations "clear anno" :exit t :column "anno" )
  ("1" artist-mode "artist mode" :column "anno")
  ("q" rebox-cycle "rebox it" :column "comment")
  ("C" cfw:open-org-calendar "check your calenda")
  ))

(defhydra hydra-capture ()
  ("c" org-download-screenshot "screenshot")
  ("p" org-download-clipboard "paste img to clipboard"))

(define-key global-map (kbd "M-4")
  (defhydra hydra-lsp (:exit t :hint nil)
  "
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
 [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature
 [_g_] magit			[_y_] org download clipboard      [_F_] lsp-gui-flycheck      "
  ("F" lsp-ui-flycheck-list)
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)
  ("g" magit   )
  ("y" org-download-clipboard  )

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace)))
