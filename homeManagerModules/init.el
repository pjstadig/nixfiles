;;; init.el --- init script  -*- lexical-binding: t; -*-

;; Copyright (c) 2023 Paul Stadig

;;; Commentary:

;; None

;;; Code:
(require 'use-package)
(use-package org
  :after my-gtd)
(use-package my-gtd
  :after my
  :bind ("C-c g c" . my-gtd-capture)
  :demand t
  :hook (org-mode . my-gtd-set-regexp))
(use-package my-gtd-agenda
  :bind ("C-c g d" . my-gtd-agenda-daily))
(use-package my-gtd-process
  :bind ("C-c g p" . my-gtd-process))
(use-package my-javascript)
(use-package my-ol-obsidian)
(use-package my-org)
(use-package my-org-bullets
  :after (org my-org))
(use-package my-org-capture
  :after (org my-org))
(use-package my-org-faces
  :after (org my-org))

(provide 'init)
;;; init.el ends here
