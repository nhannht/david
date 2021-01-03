;;; layers.el --- attemp to make layer not conflict with each other  -*- lexical-binding: t; -*-

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
(configuration-layer/declare-layer 'emacs-lisp)
(configuration-layer/declare-layer 'spacemacs-bootstrap)
(configuration-layer/declare-layer 'spacemacs-editing-visual)
(configuration-layer/declare-layer 'helm)
(configuration-layer/declare-layer 'spacemacs-evil)
(configuration-layer/declare-layer 'spacemacs-defaults)
(configuration-layer/declare-layer 'spacemacs-project)
(configuration-layer/declare-layer 'spacemacs-org)
(configuration-layer/declare-layer 'spacemacs-completion)

;(configuration-layer/declare-layer 'spacemacs-matchit)
