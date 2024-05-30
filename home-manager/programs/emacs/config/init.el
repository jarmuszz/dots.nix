(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package undo-tree
  :config (global-undo-tree-mode 1)
  )

(use-package evil
  :requires (undo-tree)
  :config
  (setq evil-undo-system "undo-tree")
  (evil-mode 1)
  )

(use-package projectile)

(use-package treemacs
  :config
  (treemacs-follow-mode 1)
  (treemacs-indent-guide-mode 1)
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
    (kbd "SPC O") 'org-roam-node-find
    (kbd "SPC r c") 'org-roam-capture
    (kbd "SPC r i") 'org-roam-node-insert)
  (setq org-roam-node-display-template
	(concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  )

;; Backup files
(setq backup-directory-alist `(("." . "~/.cache/emacs")))

;; Looks
(setq inhibit-startup-screen nil)
(when (or (display-graphic-p) (server-running-p))
    (set-frame-font " M+CodeLat50 Nerd Font Mono 12" nil t)
    (pixel-scroll-precision-mode))

;; Programming
(add-to-list 'load-path "~/.config/emacs/lisp")

;;; Scala
(require 'scala)

;;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")
