;;; -*- lexical-binding: t -*-
(require 'cl-lib)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(load-theme 'modus-operandi)

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

  
;; Backup files
(setq backup-directory-alist `(("." . "~/.cache/emacs")))

;; Looks
(setq inhibit-startup-screen nil)
(setq default-frame-alist '((font . " M+CodeLat50 Nerd Font Mono 12" )))
(when (display-graphic-p)
  (pixel-scroll-precision-mode))


;; Programming
(add-to-list 'load-path "~/.config/emacs/lisp")

;;; Org
(require 'org-config)


;;; Scala
(require 'scala)

;;; Haskell
(require 'haskell)

;;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(deft yasnippet undo-tree treemacs-projectile treemacs-evil sbt-mode org-roam org-modern nix-mode neotree magit lsp-ui lsp-metals flycheck company color-theme-sanityinc-tomorrow base16-theme))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
