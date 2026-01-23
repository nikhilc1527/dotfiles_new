(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Basic UI and behavior
(tool-bar-mode -1)
(menu-bar-mode -1)
(menu-bar-no-scroll-bar)
(show-paren-mode 1)
(global-hl-line-mode 0)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(setq dired-dwim-target t)
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message nil)
(global-visual-line-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(put 'narrow-to-region 'disabled nil)
(setq completion-ignored-extensions nil)

;; Keybindings
(global-set-key (kbd "<f5>") #'revert-buffer)
(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-x RET RET")
                (lambda ()
                  (interactive)
                  (start-process "term" nil "setsid" "alacritty" "--working-directory" ".")))

;; ;; Auto-create parent directories for new files
;; (defun my-create-missing-directories ()
;;   "Create parent directories if they don't exist."
;;   (let ((dir (file-name-directory buffer-file-name)))
;;     (when (and dir (not (file-exists-p dir)))
;;       (make-directory dir t)))
;;   nil)

;; (add-hook 'find-file-not-found-functions #'my-create-missing-directories)

;; Package setup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package bootstrap
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Completion UI: Vertico
(use-package vertico
  :init
  (vertico-mode 1))

;; Configure directory extension.
(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; Matching style: Orderless
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))
        orderless-style-dispatchers '(orderless-dispatch)))

;; Annotations in minibuffer
(use-package marginalia
  :init
  (marginalia-mode 1))

;; Icons in completion
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode 1))

;; Orderless dispatchers:
;;  - !pattern  => without-literal
;;  - =pattern  => literal
;;  - ~pattern  => flex
;;  - ,pattern  => initialism
(defun orderless-dispatch (pattern _index _total)
  (cond
   ((string-prefix-p "!" pattern)
    `(orderless-without-literal . ,(substring pattern 1)))
   ((string-prefix-p "=" pattern)
    `(orderless-literal . ,(substring pattern 1)))
   ((string-prefix-p "~" pattern)
    `(orderless-flex . ,(substring pattern 1)))
   ((string-prefix-p "," pattern)
    `(orderless-initialism . ,(substring pattern 1)))
   (t nil)))

;; Commands: Consult
(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("C-c f" . consult-fd)
         ("C-c g" . consult-ripgrep))
  :init
  (setq consult-async-min-input 0
        consult-project-function nil))

(use-package magit
  :bind (("C-x g" . magit-status)))

;; Tree-sitter auto setup
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Completion: Company
(use-package company
  :init
  ;; (setq company-idle-delay 0.1
  ;;       company-minimum-prefix-length 1
  ;;       company-tooltip-align-annotations t)
  (global-company-mode 1))

;; Snippets
(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package company-yasnippet
  :ensure nil
  :after (company yasnippet)
  :config
  (add-to-list 'company-backends '(company-capf :with company-yasnippet)))

;; LSP client
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-completion-provider :company
        lsp-completion-enable-snippet t
        lsp-prefer-flymake nil
        lsp-enable-on-type-formatting nil)
  :hook
  ;; using default clangd
  ((c-mode . lsp-deferred)
   (c-ts-mode . lsp-deferred)
   ((c++-mode . lsp-deferred))
   (c++-ts-mode . lsp-deferred))
  )

(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-enable t
        lsp-ui-flycheck-enable t
        lsp-ui-peek-enable t))

;; On-the-fly diagnostics
(use-package flycheck
  :init
  (global-flycheck-mode 1))

(use-package python
  :ensure t
  :config
  (add-hook 'python-ts-mode-hook (lambda () (run-hooks 'python-mode-hook))))

;; Python LSP (Pyright)
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))  ; or lsp-deferred

;; Rust LSP (rust-analyzer)
(use-package rust-mode
  :hook ((rust-mode . lsp-deferred)
         (rust-ts-mode . lsp-deferred)))

;; Go LSP (gopls)
(use-package go-mode
  :hook ((go-mode . lsp-deferred)
         (go-ts-mode . lsp-deferred)))

(use-package xonsh-mode)

;; Copilot
(use-package copilot
  :hook ((prog-mode text-mode) . copilot-mode)
  :config
  (define-key copilot-completion-map (kbd "C-<tab>") #'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "C-M-<tab>") #'copilot-accept-completion-by-word))

;; TeX input method setup, only use backslash commands
(use-package quail
  :ensure nil
  :config
  (set-input-method "TeX")
  (quail-activate "Tex")

  ;; Remove _ and ^ prefix trees from the map directly
  (let ((map (quail-map)))
    (setcdr map (assq-delete-all ?_ (assq-delete-all ?^ (assq-delete-all ?$ (assq-delete-all ?- (assq-delete-all ?? (assq-delete-all ?! (cdr map)))))))))
  (set-input-method nil)
  )

;; Proof General (Coq)
(use-package proof-general
  :hook (coq-mode . (lambda ()
                      (local-set-key (kbd "C-c C-k")
                                     #'proof-assert-until-point-interactive)
                      ;; tex backslash input method
                      (set-input-method "TeX")
                      ))
  :config
  (setq proof-splash-enable nil)
  (setq proof-three-window-mode-policy 'hybrid)
  ;; Keep TeX input method but disable ^/_ shortcuts in Coq buffers
  ;; (add-hook 'coq-mode-hook
  ;;           (lambda ()
  ;;             (with-eval-after-load 'quail
  ;;               (quail-defrule "^" "^" "Tex")
  ;;               (quail-defrule "_" "_" "Tex"))))
  (setq coq-smie-user-tokens
        '(("," . ":=")
          ("∗" . "->")
          ("-∗" . "->")
          ("∗-∗" . "->")
          ("==∗" . "->")
          ("=∗" . "->")
          ("|==>" . ":=")
          ("⊢" . "->")
          ("⊣⊢" . "->")
          ("↔" . "->")
          ("←" . "<-")
          ("→" . "->")
          ("=" . "->")
          ("==" . "->")
          ("/\\" . "->")
          ("⋅" . "->")
          (":>" . ":=")
          ("by" . "now")
          ("forall" . "now"))))


;; Small quality-of-life packages
(use-package sudo-edit)

(use-package which-key
  :init
  (which-key-mode 1))

(use-package duplicate-thing
  :bind (("M-c" . duplicate-thing)))

(use-package multiple-cursors
  :bind (("C-c C-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this-dwim)
         ("<C-M-mouse-1>" . mc/toggle-cursor-on-click)))

(use-package undo-tree
  :init
  (setq undo-tree-visualizer-diff t
        undo-tree-auto-save-history nil)
  (global-undo-tree-mode 1))

(use-package move-text
  :config
  (bind-keys*
   ("M-p" . move-text-up)
   ("M-n" . move-text-down)))

(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package nyan-mode
  :init
  (nyan-mode 1))

(use-package expreg
  :config
  (setq expreg-restore-point-on-quit t)
  :bind (("C-=" . expreg-expand))
  :bind (("C-+" . expreg-contract)))

;; Theme
(setf custom-safe-themes t)
(use-package gruvbox-theme)
(use-package doom-themes
  :config
  (setq doom-one-brighter-comments t))
(load-theme 'doom-one t)

;; Electric behavior
(electric-pair-mode 1)
(setq electric-pair-preserve-balance t)
(setq electric-layout-mode nil)

;; Disable electric pairing in minibuffer
(add-hook 'minibuffer-setup-hook (lambda () (electric-pair-local-mode -1)))

;; Dired behavior
(setq dired-recursive-copies 'always
      dired-auto-revert-buffer t
      dired-do-revert-buffer t
      dired-mouse-drag-files t)

(use-package all-the-icons-dired
  :after dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; loccur (local occur)
(use-package loccur
  :bind (("C-o" . loccur-current)
         ("C-S-o" . loccur)))

;; phi-search (multi-cursor-friendly search)
(use-package phi-search
  :custom
  (push '((kbd "RET") . 'phi-search-complete-at-beginning)
        phi-search-additional-keybinds)
  (push '((kbd "C-<return>") . 'phi-search-complete)
        phi-search-additional-keybinds)
  :bind (("C-c /" . phi-search)
         ("C-c ?" . phi-search-backward)))

(use-package phi-search-mc
  :after (phi-search multiple-cursors))

;; Delete word/line without adding to kill-ring
(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With ARG, do this that many times without adding to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With ARG, do this that many times without adding to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-line ()
  "Delete text from current position to end of line without `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(global-set-key (kbd "C-k") #'my-delete-line)
(global-set-key (kbd "M-d") #'my-delete-word)
(global-set-key (kbd "<M-backspace>") #'my-backward-delete-word)

(setq custom-file (concat user-emacs-directory "custom-set.el"))
(load custom-file 'noerror)
