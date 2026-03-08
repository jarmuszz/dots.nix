;; -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq backup-directory-alist '(("." . "~/.cache/emacs-backups")))
(load-theme 'modus-operandi-tinted)
(pixel-scroll-precision-mode)
(setq org-agenda-start-on-weekday 1)
(setq calendar-week-start-day 1)

;(set-face-attribute 'default nil :family "M+1Code Nerd Font" :height 120)
;(set-face-attribute 'variable-pitch nil :family "M+1 Nerd Font" :height 120)
(set-face-attribute 'default nil :family "Go Mono" :height 110)
(set-face-attribute 'variable-pitch nil :family "Go Mono" :height 110)

(defconst *roam-dir* "~/docs/roam")

(use-package org
  :ensure t
  :after evil
  :custom
  (org-agenda-files '("~/docs/roam/"))
  (org-agenda-span 14)
  (org-agenda-start-on-weekday 1)
  (org-auto-align-tags nil)
  (org-tags-column 0)
  (org-catch-invisible-edits 'show-and-error)
  (org-special-ctrl-a/e t)
  (org-insert-heading-respect-content t)

  (org-agenda-prefix-format
   '(
     (agenda . "    %t ")
     (todo .   "    %t ")
     (tags .   "    %t ")
     (search . "    %t")
   ))

  (org-hide-emphasis-markers nil)
  (org-pretty-entities t)
  (org-agenda-tags-column 0)
  (org-ellipsis "…")
  (org-cite-global-bibliography '("~/docs/roam/bibtex/main.bib"))
  (org-tags-exclude-from-inheritance '("crytp"))
  (org-crypt-key nil)
  (org-agenda-custom-commands
   '(("e" "Exams"
      ((tags "+egz")))
     ("s" "Studia"
      ((tags-todo "+studia")))
     ))
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-skip-scheduled-if-deadline-is-shown t)
  (org-agenda-skip-deadline-if-schedule-is-shown t)
  :init
  (require 'org-crypt)
  (setenv "GPG_AGENT_INFO" nil)

  :hook
  (org-mode . org-indent-mode)
  )

(use-package org-modern
  :ensure t
  :after org
  :init
  (global-org-modern-mode)
  :custom
  (org-fold-catch-invisible-edits 'show-and-error)
  (org-modern-hide-stars "  ")
  (org-modern-list '((43 . "▹") (45 . "–") (42 . "•")))
  (org-modern-progress 8)
  (org-modern-replace-stars "✱↪↪↪↪↪↪")
  (org-modern-star 'replace)
  (org-modern-tag-faces
   '(("praca" :background "green")
     ("egz"   :background "red")
     ("urodziny" :background "purple")
     ("święta" :background "purple")
   ))
  )

(use-package org-roam
  :ensure t
  :after (evil org)
  :init
  (setq org-roam-v2-ack t) ; get rid ofthe migration warnings
  :custom
  (org-roam-directory "~/docs/roam")
  (org-roam-dailies-directory "dailies/")
  (org-roam-completion-everywhere t)
  :config
  (evil-define-key 'normal 'global (kbd "SPC o c") 'org-roam-capture)
  (evil-define-key 'normal 'global (kbd "SPC o f") 'org-roam-node-find)
  (evil-define-key 'normal 'global (kbd "SPC o b") 'org-roam-buffer)
  ;(evil-define-key 'normal 'global (kbd "SPC o d") 'org-roam-dailies-capture-date)
  ;(evil-define-key 'normal 'global (kbd "SPC o D") 'org-roam-dailies-goto-date)
  (evil-define-key 'normal 'global (kbd "SPC o j")
    #'(lambda ()
	(interactive)
	(find-file (concat org-roam-directory "/journal.org.gpg"))
	(goto-char (point-max))))
  (evil-define-key 'normal 'global (kbd "SPC o a") 'org-agenda)
  (evil-define-key 'normal 'global (kbd "SPC o A") #'(lambda ()
						       (interactive)
						       (find-file (concat org-roam-directory "/agenda.org"))
						       (goto-char (point-max))
						       ))
  (evil-define-key 'normal 'org-mode-map (kbd "SPC i d") 'org-id-get-create)
  (evil-define-key 'insert 'org-mode-map (kbd "S-C-I") 'org-roam-node-insert)
  (evil-define-key 'insert 'org-mode-map (kbd "C-n") 'completion-at-point)

  (setq org-roam-capture-templates
	'(("c" "concept" entry "* ${title}\n%?"
	   :target (node "concepts"))
	  ("d" "default" plain "%?"
	   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
			      "#+title: ${title}\n")
	   :unnarrowed t))
	)

  
  (org-roam-setup)
  )

(use-package undo-tree
  :ensure t
  :custom
  (undo-tree-history-directory-alist '(("." . "~/.cache/emacs-backups")))
  :init
  (global-undo-tree-mode 1)
  )

(use-package evil
  :ensure t
  :after undo-tree
  :config
  (evil-define-key 'normal 'global (kbd "SPC e c")
    '(lambda ()
       (interactive)
       (find-file "~/.config/emacs/init.el")))
  :custom
  ((evil-undo-system 'undo-tree))
  :init
  (evil-mode 1)
  )

(use-package evil-org
  :ensure t
  :after (org evil)
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  )


(use-package calfw
  :ensure t
  )

(use-package calfw-org
  :ensure t
  :after (calfw evil)
  :config
  (evil-define-key 'normal 'global (kbd "SPC o o") 'calfw-org-open-calendar)
  (add-to-list 'evil-emacs-state-modes 'calfw-calendar-mode)
  )

(use-package citar
  :ensure t
  :after (vertico orderless embark marginalia)
  :custom
  (citar-bibliography org-cite-global-bibliography)
  (citar-notes-paths (list (concat *roam-dir* "/citar-notes")))
  )

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :after (evil marginalia)
  :init
  (evil-define-key 'insert 'global (kbd "C-M-i") 'embark-act)
  (evil-define-key 'insert 'global (kbd "C-M-o") 'embark-dwim)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f1c8202c772d1de83eda4765fe21429a528a4fb350a28394d3705fe9678ed1f9"
     default))
 '(package-selected-packages nil)
 '(safe-local-variable-values
   '((eval set-fill-column 80) (eval auto-save-mode nil)
     (backup-inhibited) (auto-save-default) (auto-fill-mode . 1))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
