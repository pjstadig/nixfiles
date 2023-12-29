;;; init.el --- init script  -*- lexical-binding: t; -*-

;; Copyright (c) 2023 Paul Stadig

;;; Commentary:

;; None

;;; Code:
(require 'use-package)
(use-package org
  :after pjs-gtd)
(use-package pjs-gtd
  :after pjs
  :bind ("C-c g c" . pjs-gtd-capture)
  :demand t
  :hook (org-mode . pjs-gtd-set-regexp))
(use-package pjs-gtd-agenda
  :bind ("C-c g d" . pjs-gtd-agenda-daily))
(use-package pjs-gtd-process
  :bind ("C-c g p" . pjs-gtd-process))
(use-package pjs-javascript)
(use-package pjs-ol-obsidian)
(use-package pjs-org)
(use-package pjs-org-bullets
  :after (org pjs-org))
(use-package pjs-org-capture
  :after (org pjs-org))
(use-package pjs-org-faces
  :after (org pjs-org))

(provide 'init)
;;; init.el ends here
