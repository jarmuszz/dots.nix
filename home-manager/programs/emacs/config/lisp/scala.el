(provide 'scala)

(setq use-package-always-ensure t)

(use-package scala-mode
  :interpreter ("scala" . scala-mode)
  )

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config (substitute-key-definition
            'minibuffer-complete-word
            'self-insert-command
            minibuffer-local-completion-map) 

          ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
          (setq sbt:program-options '("-Dsbt.supershell=false"))
  )

(use-package flycheck
  :init (global-flycheck-mode)
  )

(use-package lsp-mode
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)

  :custom
  (lsp-keep-workspace-alive nil)
  )

(use-package lsp-metals)
(use-package lsp-ui)
(use-package yasnippet)

(use-package company
  :custom
  (lsp-completion-provider :capf)
  )

(use-package posframe)

(use-package dap-mode
  :after (posframe)
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )
