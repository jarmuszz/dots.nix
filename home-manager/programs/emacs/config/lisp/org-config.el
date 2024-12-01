(provide 'org-config)

(defconst *org-directory* (file-truename "~/docs/Org"))

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

(use-package org
  :requires evil
  :config
  (add-hook 'org-mode-hook #'company-mode)
  (add-hook 'org-agenda-mode-hook #'org-agenda-follow-mode)
  (evil-define-key 'normal 'global
    (kbd "SPC o a") #'org-agenda
    (kbd "SPC C")   #'org-capture)

  (evil-set-initial-state 'org-agenda-mode 'motion)
  (evil-define-key 'motion org-agenda-mode-map
    "j" #'org-agenda-next-line
    "k" #'org-agenda-previous-line
    "l" #'org-agenda-later
    "h" #'org-agenda-earlier
    "gg" #'evil-window-top
    "G" #'evil-window-bottom
    (kbd "<return>") #'org-agenda-goto
    (kbd "SPC g") #'org-agenda-goto-date
    )
  :custom
  (org-agenda-files (list *org-directory*))
  (org-agenda-span 14)
  (org-agenda-prefix-format
   '((agenda . " %i %-12:c%?-12t% s")
    (todo    . " %i %-12:c")
    (tags    . " %i %-12:c")
    (search  . " %i %-12:c")))
  (org-directory *org-directory*)
  (org-elipsis "…")
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
  (deft-text-mode 'org-mode)
  (deft-use-filename-as-title t)
  :config
  (evil-define-key 'normal 'global
    (kbd "SPC o d") #'deft)
  )
