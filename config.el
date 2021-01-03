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
