;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook '(whitespace-cleanup))
 '(company-coq-completion-predicate 'company-coq-in-code-p)
 '(company-coq-disabled-features '(smart-subscripts spinner))
 '(company-coq-live-on-the-edge nil)
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
 '(display-buffer-alist
   '(("\\\\*Async Shell Command\\\\*"
      (display-buffer-reuse-window display-buffer-at-bottom))))
 '(flash-autojump nil)
 '(flash-isearch-mode t)
 '(flash-rainbow t)
 '(global-whitespace-mode t)
 '(lsp-auto-guess-root t)
 '(package-selected-packages nil)
 '(phi-search-case-sensitive t)
 '(terminal-here-linux-terminal-command nil)
 '(terminal-here-terminal-command 'alacritty)
 '(terminal-here-verbose nil)
 '(what-cursor-show-names t)
 '(whitespace-style '(face trailing tabs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flash-match ((t (:foreground "cyan" :underline t))))
 '(whitespace-tab ((t (:background "#ff6c6b")))))
