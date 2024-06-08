(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")  'helm-select-action)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-c h g") 'helm-google-suggest)
  (global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)
  (require 'shell)
  (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq helm-split-window-inside-p           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (helm-mode 1))

;; (use-package helm-c-yasnippet
;;   :ensure t
;;   :config
;;   (setq helm-yas-space-match-any-greedy t)
;;   (global-set-key (kbd "C-c y") 'helm-yas-complete))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
(use-package yasnippet-snippets
  :ensure t)

(org-babel-load-file (concat user-emacs-directory "programminginit.org"))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("magit" (mode . magit-mode))
               ("IRC" (or (mode . circe-channel-mode) (mode . circe-server-mode)))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("mu4e" (or

                        (mode . mu4e-compose-mode)
                        (name . "\*mu4e\*")
                        ))
               ("programming" (or
                               (mode . clojure-mode)
                               (mode . clojurescript-mode)
                               (mode . python-mode)
                               (mode . c++-mode)
                               (mode . c-mode)
                               (mode . web-mode)
                               (mode . java-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-expert t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode) t)
  (setq web-mode-engines-alist
        '(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(use-package magit
  :ensure t)

(setq inhibit-startup-message t)
       (defalias 'yes-or-no-p 'y-or-n-p)
       (tool-bar-mode -1)
       (global-set-key (kbd "<f5>") 'revert-buffer)
       (setq visible-bell 1)
       (toggle-scroll-bar -1)
       (show-paren-mode 1)
       (setq electric-pair-preserve-balance nil)
       (global-hl-line-mode 1)
       (save-place-mode t)
       (setq-default indent-tabs-mode nil)
       (put 'erase-buffer 'disabled nil)
       (put 'narrow-to-region 'disabled nil)
       (setq backup-directory-alist '(("." . "~/.config/emacs/backups")))

     (prefer-coding-system       'utf-8)
     (set-default-coding-systems 'utf-8)
     (set-terminal-coding-system 'utf-8)
     (set-keyboard-coding-system 'utf-8)    
     (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
     (set-language-environment "UTF-8")

    (set-frame-parameter (selected-frame) 'alpha '(85 50))

  (global-auto-revert-mode t)
(setq dired-dwim-target t)

(setq initial-major-mode 'text-mode)
(setq initial-scratch-message nil)

(setq-default cursor-type 'box)
(set-cursor-color "#AEFF40")
(set-face-attribute 'region nil 
:background "#cc02bb" 
:foreground "#d3e603")
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-visual-line-mode t)
(menu-bar-mode -1)

(global-set-key (kbd "C-x RET RET") (lambda () (interactive) (start-process "term" "foo" "alacritty" "--working-directory" ".")))

;; (use-package fira-code-mode
;;   :custom (fira-code-mode-disabled-ligatures '("[]" "x"))  ; ligatures you don't want
;;   :hook prog-mode)                                         ; mode to enable fira-code-mode in

(use-package nyan-mode
  :ensure t
  :config 
  (nyan-mode 1))

(use-package golden-ratio
  :ensure t
  :config 
  (golden-ratio-mode 1))

(use-package duplicate-thing
  :ensure t
  :config
  (global-set-key (kbd "M-c") 'duplicate-thing))

(require 'misc)
(autoload 'zap-up-to-char "misc" 'interactive)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))
(global-set-key (kbd "C-=") 'er/expand-region)

(use-package sudo-edit
  :ensure t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#00aa33"))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-c C-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "<C-M-mouse-1>") 'mc/add-cursor-on-click))

(use-package which-key
  :config (which-key-mode))

(use-package ansi-color
  :ensure t
  :config
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on))

(require 'uniquify)
(setq uniquify-separator "/"               ;; The separator in buffer names.
      uniquify-buffer-name-style 'forward) ;; names/in/this/style

(use-package try
  :ensure t)

(require 'epa-file)
(setq epa-file-select-keys nil)
(setq epa-file-encrypt-to '("nikhilc1527@gmail.com"))
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq password-cache-expiry 15)

;; (use-package avy
;;   :ensure t
;;   (global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1))

(use-package visual-regexp
:ensure t)

(use-package visual-regexp-steroids
:ensure t
:config
(global-set-key "\C-r" 'vr/select-query-replace))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t))

;; (use-package ligature
;;   :load-path "~/.config/emacs/elpa/ligature/"
;;   :config
;;   ;; Enable the "www" ligature in every possible major mode
;;   (ligature-set-ligatures 't '("www"))
;;   ;; Enable traditional ligature support in eww-mode, if the
;;   ;; `variable-pitch' face supports it
;;   (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;;   ;; Enable all Cascadia Code ligatures in programming modes
;;   (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
;;                                        ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
;;                                        "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
;;                                        "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
;;                                        "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
;;                                        "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
;;                                        "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
;;                                        "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
;;                                        ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
;;                                        "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
;;                                        "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
;;                                        "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
;;                                        "\\\\" "://"))
;;   ;; Enables ligature checks globally in all buffers. You can also do it
;;   ;; per mode with `ligature-mode'.
;;   (global-ligature-mode t))

;; https://emacs.stackexchange.com/questions/22266/backspace-without-adding-to-kill-ring
  (defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun my-delete-line-backward ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))

; bind them to emacs's default shortcut keys:
(global-set-key (kbd "C-k") 'my-delete-line)
(global-set-key (kbd "M-d") 'my-delete-word)
(global-set-key (kbd "<M-backspace>") 'my-backward-delete-word)

(use-package fixmee
  :config
(require 'button-lock)
  (global-fixmee-mode 1))

(use-package ace-jump-mode
  :bind
  ("C-c SPC" . 'ace-jump-mode))

;; (defun save-compile-dwm ()
 ;;   (when (eq (symbol-value buffer-file-name) "/home/nikhil/.local/src/dwm/config.h")
 ;;     (start-process "make && plz make install && kill -HUP $(pgrep -u $USER \"\bdwm$\"")
 ;;     )
 ;;   )
 ;; (add-hook 'after-save-hook 'save-compile-dwm)



;;  (defun transparency (value)
;;    "Sets the transparency of the frame window. 0=transparent/100=opaque"
;;    (interactive "nTransparency Value 0 - 100 opaque:")
;;    (set-frame-parameter (selected-frame) 'alpha value))
;; (set-frame-parameter (selected-frame)'alpha '(90 . 90))
;; (add-to-list 'default-frame-alist'(alpha . (90 . 90)))

;;  (defun my-increase-opacity()
;;    (interactive)
;;    (let ((increase (+ 10 (car (frame-parameter nil 'alpha)))))
;;      (if (> increase 99)(setq increase 99))
;;      (set-frame-parameter (selected-frame) 'alpha (values increase 75)))
;;    )

;;  (defun my-decrease-opacity()
;;    (interactive)
;;    (let ((decrease (- (car (frame-parameter nil 'alpha)) 10)))
;;      (if (< decrease 20)(setq decrease 20))
;;      (set-frame-parameter (selected-frame) 'alpha (values decrease 75)))
;;    )

 ;; (global-set-key (kbd "M-") 'my-increase-opacity)
 ;; (global-set-key (kbd "M-") 'my-decrease-opacity)
 ;; (add-to-list 'default-frame-alist '(alpha 85 58))

(setf custom-safe-themes t)
(use-package gruvbox-theme :ensure t)
(use-package doom-themes :ensure t)
(load-theme 'doom-one)

;; (add-to-list 'load-path "~/.config/emacs/mu4e")
;; (require 'mu4e)
;; (require 'org-mu4e)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  (setq org-roam-completion-everywhere t)
  :custom
  (org-roam-directory "~/MyFiles/Nikhil/org-roam-files")
  :bind (
       ("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))

(use-package org-journal)
