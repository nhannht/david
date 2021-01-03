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
(progn
  (server-start)
  (unless (server-running-p)
    (server-start)))


(setq byte-compile-warnings '(cl-functions))
(menu-bar-mode -1 )
(toggle-scroll-bar -1)
(tool-bar-mode -1)



