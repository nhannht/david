;;; funcs.el --- load-after config.el, before package.el  -*- lexical-binding: t; -*-

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

;; (when (configuration-layer/package-usedp 'my-package)
;;   (defun spacemacs/my-package-enable () ...)
;;   (defun spacemacs/my-package-disable () ...))

(defun async-shell-command-no-window
    (command)
  "This will invoke async with no window popup"
  (interactive)
  (let
      ((display-buffer-alist
        (list
         (cons
          "\\*Async Shell Command\\*.*"
          (cons #'display-buffer-no-window nil)))))
    (async-shell-command
     command)))

(when (configuration-layer/package-usedp 'cperl-mode)
  (defun spacemacs/cperl-mode-enable ()
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
        (previous-window-any-frame)))))

(when (configuration-layer/package-usedp 'js2-mode)
  (defun spacemacs/js2-mode-enable ()

    (defun js-send-line ()
      (interactive)
      (progn
        (end-of-line)
        (js-send-last-sexp)))

    (defun js-send-line ()
      (interactive)
      (progn
        (end-of-line)
        (js-send-last-sexp)))
    ))

(defun my-inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
            (lambda () (display-line-numbers-mode -1))
            :append :local))

(defun find-file-right (filename)
  (interactive)
  (split-window-right)
  (other-window 1)
  (find-file filename))

(defun find-file-below (filename)
  (interactive)
  (split-window-below)
  (other-window 1)
  (find-file filename))

(defun edit-init ()
  (interactive)
  (find-file-other-window "~/.emacs.d/init.el")
  )

(defun sudired ()
  (interactive)
  (require 'tramp)
  (let ((dir (expand-file-name default-directory)))
    (if (string-match "^/sudo:" dir)
        (user-error "Already in sudo")
      (dired (concat "/sudo::" dir)))))

(defun harvard-cite (key page)
  (interactive (list (completing-read "Cite: " (orhc-bibtex-candidates))
             (read-string "Page: ")))


  (insert
   (org-make-link-string (format "cite:%s"
                 (cdr (assoc
                       "=key="
                       (cdr (assoc key (orhc-bibtex-candidates))))))
                         page)))

(defun create-scratch-buffer nil
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lisp-interaction-mode))
