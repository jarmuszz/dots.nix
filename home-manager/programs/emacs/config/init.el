;;; -*- lexical-binding: t -*-
(require 'cl-lib)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package undo-tree
  :custom
  (undo-tree-history-directory-alist '((".*" . "~/.cache/undo-tree")))
  :config
  (global-undo-tree-mode 1)
  (defadvice undo-tree-make-history-save-file-name
    (after undo-tree activate)
    (setq ad-return-value (concat ad-return-value ".gz")))
  )

(use-package evil
  :requires (undo-tree)
  :custom
  (evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  )

(use-package magit)

(use-package projectile)

(use-package treemacs
  :config
  (treemacs-follow-mode 1)
  (treemacs-indent-guide-mode 1)
  (evil-define-key 'normal 'global [f12] #'treemacs)
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  )
(use-package treemacs-evil
  :requires (treemacs evil)
  )
(use-package treemacs-projectile
  :requires (treemacs projectile)
  )

(use-package org-modern
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
  )

(defconst *org-directory* (file-truename "~/Sync/Org"))

(use-package org
  :config
  (add-hook 'org-mode-hook #'company-mode)
  (evil-define-key 'normal 'global
    (kbd "SPC o f") #'org-agenda-visit-file
    (kbd "SPC o a") #'org-agenda-list)
  :custom
  (org-hide-leading-stars t)
  (org-startup-with-inline-images t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-directory "~/Sync/Org")
  (org-agenda-files '("~/Sync/Org/"))
  (org-todo-keywords
   '( "TODO" "EVENT" "IFTIME" "DONE"))
  (org-todo-keyword-faces
   '(("EVENT"  . (:background "green" :foreground "white"))
     ("IFTIME" . (:background "blue"  :foreground "white"))
     ))
  )

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Sync/Org"))
  (org-roam-dailies-directory *org-directory*)
  :config
  (evil-define-key 'normal 'global
    (kbd "SPC O")   'org-roam-node-find
    (kbd "SPC r c") 'org-roam-capture
    (kbd "SPC r i") 'org-roam-node-insert
    (kbd "SPC r 1") 'org-roam-dailies-goto-today
    (kbd "SPC r d") 'org-roam-dailies-goto-date)
  (setq org-roam-node-display-template
	(concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  )

;; Backup files
(setq backup-directory-alist `(("." . "~/.cache/emacs")))

;; Looks
(setq inhibit-startup-screen nil)
(setq default-frame-alist '((font . " M+CodeLat50 Nerd Font Mono 12" )))
(when (display-graphic-p)
  (pixel-scroll-precision-mode))

;; Programming
(add-to-list 'load-path "~/.config/emacs/lisp")

;;; Scala
(require 'scala)

;;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")
