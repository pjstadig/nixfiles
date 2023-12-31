;;; init.el --- init script  -*- lexical-binding: t; -*-

;; Copyright (c) 2023 Paul Stadig

;;; Commentary:

;; None

;;; Code:
(require 'use-package)
(use-package org)
(use-package pjs-gtd
  :after pjs-org
  :bind ("C-c g c" . pjs-gtd-capture)
  :demand t
  :hook (org-mode . pjs-gtd-set-regexp))
(use-package pjs-gtd-agenda
  :after pjs-gtd
  :bind ("C-c g d" . (lambda ()
                       (interactive)
                       (exwm-workspace-switch 6)
                       (pjs-gtd-agenda-daily)
                       (delete-other-windows))))
(use-package pjs-gtd-process
  :bind ("C-c g p" . pjs-gtd-process))
(use-package pjs-javascript)
(use-package pjs-ol-obsidian)
(use-package pjs-org
  :after (pjs org))
(use-package pjs-org-bullets
  :after pjs-org)
(use-package pjs-org-capture
  :after pjs-org)
(use-package pjs-org-faces
  :after pjs-org)

(provide 'init)
;;; init.el ends here
