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

(use-package magit
  :config
  (evil-define-key 'normal 'global (kbd "SPC M") #'magit)
  )

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
  :custom
  (org-modern-todo-faces
   '(("IFTIME"   :background "turquoise"  :foreground "black")
     ("WAITING"  :background "pale green" :foreground "black")
     ("ONHOLD"   :background "light blue" :foreground "black")
     ))
  )

(defconst *org-directory* (file-truename "~/docs/Org"))

(use-package org
  :config
  (add-hook 'org-mode-hook #'company-mode)
  (evil-define-key 'normal 'global
    (kbd "SPC o a") #'org-agenda
    (kbd "SPC C")   #'org-capture)
  :custom
  (org-agenda-files (list *org-directory*))
  (org-agenda-span 14)
  (org-agenda-prefix-format
   '((agenda . " %i %-12:c%?-12t% s")
    (todo . " %i %-12:c")
    (tags . " %i %-12:c")
    (search . " %i %-12:c")))
  (org-directory *org-directory*)
  (org-hide-emphasis-markers t)
  (org-hide-leading-stars t)
  (org-pretty-entities t)
  (org-startup-with-inline-images t)
  (org-todo-keywords
   '( "TODO(t)" "IFTIME(i)" "WAITING(w)" "|" "ONHOLD(h)" "CANCELLED(c)" "DONE(d)"))
  (org-todo-keyword-faces
   '(("IFTIME"  . (:background "medium turquoise" :foreground "black"))
     ("WAITING" . (:background "pale green"       :foreground "black"))
     ("ONHOLD"  . (:background "light blue"       :foreground "black"))
     ))

  (org-capture-templates
   `(("e" "Events" entry
      (file ,(concat *org-directory* "/events.org"))
      "* %?\nSCHEDULED: ")
     ("a" "Agenda" entry
      (file ,(concat *org-directory* "/agenda.org"))
      "* %?\nSCHEDULED: ")
     ("t" "Todo" entry
      (file ,(concat *org-directory* "/agenda.org"))
      "* TODO %?")
     ("i" "Inbox" entry
      (file ,(concat *org-directory* "/inbox.org"))
      "* %?")
     )))

(use-package org-ql
  :config
  (evil-define-key 'normal 'global
    (kbd "SPC o o") 'org-ql-find-in-org-directory
    (kbd "SPC o r") 'org-ql-view-recent-items
    (kbd "SPC o s") 'org-ql-view-sidebar
    (kbd "SPC o v") 'org-ql-view
    ))

(use-package deft
  :custom
  (deft-default-extension "org")
  (deft-extensions '("org"))
  (deft-directory *org-directory*)
  (deft-recursive t)
  (deft-text-mode 'org-mode)
  (deft-use-filename-as-title t)
  :config
  (evil-define-key 'normal 'global
    (kbd "SPC o d") #'deft)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(deft yasnippet undo-tree treemacs-projectile treemacs-evil sbt-mode org-roam org-modern nix-mode neotree magit lsp-ui lsp-metals flycheck company color-theme-sanityinc-tomorrow base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
