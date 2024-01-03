;;; init.el --- init script  -*- lexical-binding: t; -*-

;; Copyright (c) 2023 Paul Stadig

;;; Commentary:

;; None

;;; Code:
(require 'use-package)
(use-package org)
(use-package tfl-gtd
  :after tfl-org
  :bind ("C-c g c" . tfl-gtd-capture)
  :demand t
  :hook (org-mode . tfl-gtd-set-regexp))
(use-package tfl-gtd-agenda
  :after tfl-gtd
  :bind ("C-c g d" . (lambda ()
                       (interactive)
                       (exwm-workspace-switch 6)
                       (tfl-gtd-agenda-daily)
                       (delete-other-windows))))
(use-package tfl-gtd-process
  :bind ("C-c g p" . tfl-gtd-process))
(use-package tfl-javascript)
(use-package tfl-ol-obsidian)
(use-package tfl-org
  :after (tfl org))
(use-package tfl-org-bullets
  :after tfl-org)
(use-package tfl-org-capture
  :after tfl-org)
(use-package tfl-org-faces
  :after tfl-org)

(provide 'init)
;;; init.el ends here
