;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook '(whitespace-cleanup))
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error 'first-known)
 '(compilation-scroll-output t)
 '(consult-line-start-from-top t)
 '(copilot-indent-offset-warning-disable t)
 '(coq-smie-user-tokens
   '(("," . ":=") ("∗" . "->") ("-∗" . "->") ("∗-∗" . "->")
     ("==∗" . "->") ("=∗" . "->") ("|==>" . ":=") ("⊢" . "->")
     ("⊣⊢" . "->") ("↔" . "->") ("←" . "<-") ("→" . "->") ("=" . "->")
     ("==" . "->") ("/\\" . "->") ("⋅" . "->") (":>" . ":=")
     ("by" . "now") ("forall" . "now")) t)
 '(default-transient-input-method "TeX")
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-alh")
 '(global-whitespace-mode t)
 '(lsp-auto-guess-root t)
 '(package-selected-packages
   '(ace-jump-mode all-the-icons-dired beacon c-mode cargo ccls
                   company-irony consult copilot copilot-chat csv-mode
                   doom-themes duplicate-thing eat ein ellama
                   exec-path-from-shell expand-region expreg
                   find-temp-file fira-code-mode fixmee
                   flycheck-haskell flycheck-rust go go-mode
                   golden-ratio gptel gruvbox-theme helm-tramp
                   jump-char loccur lsp-haskell lsp-java lsp-pyright
                   lsp-ui magit marginalia math-symbol-lists
                   math-symbols move-text nerd-icons-completion
                   nyan-mode orderless org-journal org-roam
                   phi-search-mc projectile proof-general rocq-mode
                   rust-mode sudo-edit toml-mode treesit-auto try
                   typescript-mode undo-tree vertico virtualenvwrapper
                   visual-regexp-steroids web-mode which-key
                   xonsh-mode yasnippet-snippets))
 '(phi-search-case-sensitive t)
 '(what-cursor-show-names t)
 '(whitespace-style '(face trailing tabs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "#ff6c6b")))))
