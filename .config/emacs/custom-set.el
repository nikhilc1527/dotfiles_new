
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "dark red" "#ab9df2"
    "#a1efe4" "#fcfcfa"])
 '(async-bytecomp-package-mode t)
 '(async-shell-command-buffer 'rename-buffer)
 '(auth-source-gpg-encrypt-to '("EA297DFC1EDBBA32252CDD12EF97796A7E0BB77D"))
 '(auth-source-save-behavior nil)
 '(auth-sources '("~/.config/authinfo.gpg"))
 '(auto-revert-check-vc-info t)
 '(beacon-blink-duration 2)
 '(blink-cursor-mode t)
 '(ccls-args nil)
 '(clang-format+-always-enable t)
 '(clang-format+-context 'buffer)
 '(clang-format-executable "clang-format")
 '(clang-format-style "Google")
 '(company-backends
   '(company-irony company-capf company-capf company-bbdb company-cmake
                   company-capf company-clang company-files
                   (company-dabbrev-code company-gtags company-etags
                                         company-keywords)
                   company-oddmuse company-dabbrev))
 '(company-frontends
   '(company-pseudo-tooltip-unless-just-one-frontend
     company-echo-metadata-frontend company-preview-frontend))
 '(company-meghanada-insert-args t)
 '(company-meghanada-prefix-length 2)
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(company-transformers '(company-sort-by-backend-importance))
 '(compilation-auto-jump-to-first-error t)
 '(compile-command "make -B")
 '(completion-preview-minimum-symbol-length nil)
 '(copilot-idle-delay 0.1)
 '(copilot-indent-offset-warning-disable t)
 '(coq-indent-align-with-first-arg t)
 '(coq-indent-box-style nil)
 '(coq-max-background-compilation-jobs 20)
 '(coq-show-proof-stepwise nil)
 '(coq-unicode-tokens-enable nil)
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63"
     "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9"
     "a325ba05dc3b5c2fa89af0ff354bbbe90251fb1a6e6d5682977cebe61ce72ab7"
     default))
 '(dap-auto-configure-features
   '(sessions locals breakpoints expressions repl controls tooltip))
 '(dap-debug-compilation-keep t)
 '(dap-default-terminal-kind "external")
 '(dap-external-terminal '("alacritty" "-e" "{command}"))
 '(dap-inhibit-io t)
 '(dap-java-build 'always)
 '(dap-java-java-command "alacritty -e java")
 '(dap-java-terminal 'externalTerminal)
 '(dap-java-vm-args "-XDebug")
 '(dap-print-io t)
 '(default-input-method "TeX")
 '(dired-async-mode t)
 '(dired-async-skip-fast t)
 '(dired-auto-revert-buffer t)
 '(dired-do-revert-buffer t)
 '(dired-dwim-target t)
 '(dired-keep-marker-copy t)
 '(dired-keep-marker-hardlink t)
 '(dired-keep-marker-symlink t)
 '(dired-listing-switches "-ahl")
 '(dired-mouse-drag-files t)
 '(dired-recursive-copies 'always)
 '(dired-use-ls-dired 'unspecified)
 '(display-line-numbers 'relative)
 '(display-line-numbers-type 'relative)
 '(doom-one-brighter-comments t)
 '(dynamic-completion-mode t)
 '(eldoc-documentation-functions nil t nil "Customized with use-package lsp-mode")
 '(electric-layout-mode nil)
 '(electric-pair-mode t)
 '(electric-pair-preserve-balance t)
 '(elpy-rpc-python-command "python3")
 '(enable-recursive-minibuffers t)
 '(expand-region-smart-cursor t)
 '(fa-delay 1)
 '(fa-do-comments 'non-nil)
 '(fa-hint-position-below t)
 '(face-font-family-alternatives
   '(("Monospace" "Comic Mono" "courier" "fixed")
     ("Monospace Serif" "Courier 10 Pitch" "Consolas" "Courier Std"
      "FreeMono" "Nimbus Mono L" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed") ("Fira")))
 '(fira-code-mode-disabled-ligatures '("[]" "::") nil nil "Customized with use-package fira-code-mode")
 '(fira-code-mode-enable-hex-literal nil)
 '(flycheck-checkers
   '(ada-gnat asciidoctor asciidoc awk-gawk bazel-buildifier c/c++-gcc
              c/c++-cppcheck cfengine chef-foodcritic coffee
              coffee-coffeelint coq css-csslint css-stylelint
              cuda-nvcc cwl d-dmd dockerfile-hadolint elixir-credo
              emacs-lisp emacs-lisp-checkdoc ember-template
              erlang-rebar3 erlang eruby-erubis eruby-ruumba
              fortran-gfortran go-gofmt go-golint go-vet go-build
              go-test go-errcheck go-unconvert go-staticcheck groovy
              haml handlebars haskell-stack-ghc haskell-ghc
              haskell-hlint html-tidy javascript-eslint
              javascript-jshint javascript-standard json-jsonlint
              json-python-json json-jq jsonnet less less-stylelint
              llvm-llc lua-luacheck lua markdown-markdownlint-cli
              markdown-mdl nix nix-linter opam perl perl-perlcritic
              php php-phpmd php-phpcs processing proselint
              protobuf-protoc protobuf-prototool pug puppet-parser
              puppet-lint python-flake8 python-pylint python-pycompile
              python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst
              ruby-rubocop ruby-standard ruby-reek ruby-rubylint ruby
              ruby-jruby rust-cargo rust rust-clippy scala
              scala-scalastyle scheme-chicken scss-lint scss-stylelint
              sass/scss-sass-lint sass scss sh-bash sh-posix-dash
              sh-posix-bash sh-zsh sh-shellcheck slim slim-lint
              sql-sqlint systemd-analyze tcl-nagelfar terraform
              terraform-tflint tex-chktex tex-lacheck texinfo textlint
              typescript-tslint verilog-verilator vhdl-ghdl
              xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby
              yaml-yamllint))
 '(flycheck-clang-args '("-std=c++2a"))
 '(flycheck-clang-blocks t)
 '(flycheck-clang-include-path '("/usr/include/c++/10" "/usr/include/clang/10/include/"))
 '(flycheck-clang-language-standard "2a")
 '(flycheck-gcc-args '("-std=c++2a"))
 '(flycheck-gcc-include-path '("/usr/local/include" "/usr/include/c++"))
 '(flycheck-gcc-language-standard "\"c++2a\"")
 '(flycheck-gcc-pedantic t)
 '(flycheck-gcc-pedantic-errors t)
 '(flycheck-global-modes t)
 '(flycheck-highlighting-mode 'sexps)
 '(fringe-mode 0 nil (fringe))
 '(gdb-enable-debug t)
 '(gdb-many-windows nil)
 '(gdb-stopped-functions nil)
 '(global-auto-complete-mode nil)
 '(global-completion-preview-mode t)
 '(global-display-line-numbers-mode t)
 '(global-fira-code-mode nil)
 '(global-linum-mode nil)
 '(global-undo-tree-mode t)
 '(golden-ratio-mode t)
 '(haskell-check-command "ghc -fno-code")
 '(haskell-font-lock-symbols t)
 '(haskell-hasktags-arguments '("-e" "-x"))
 '(haskell-hasktags-path "hasktags")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-svg-render-images t)
 '(helm-completion-style 'emacs)
 '(helm-file-preview-mode nil)
 '(helm-file-preview-only-when-line-numbers nil)
 '(helm-mode t)
 '(helm-scroll-amount 8)
 '(helm-tramp-control-master-path "~/.ssh/")
 '(helm-tramp-verbose 6)
 '(ibuffer-always-show-predicates nil)
 '(image-dired-external-viewer "sxiv")
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(java-mode-hook '(lsp-deferred) t)
 '(line-number-mode nil)
 '(lsp-clangd-binary-path "/usr/bin/clangd")
 '(lsp-clangd-download-url
   "https://github.com/clangd/clangd/releases/download/12.0.0/clangd-linux-12.0.0.zip")
 '(lsp-clients-clangd-args '("-std=c++2a"))
 '(lsp-clients-clangd-executable "/usr/bin/clangd")
 '(lsp-disabled-clients '(pyls))
 '(lsp-haskell-server-path "/home/nikhilc/.ghcup/bin/haskell-language-server-wrapper")
 '(lsp-java-code-generation-generate-comments t)
 '(lsp-java-code-generation-hash-code-equals-use-instanceof t)
 '(lsp-java-code-generation-hash-code-equals-use-java7objects t)
 '(lsp-java-implementations-code-lens-enabled t)
 '(lsp-java-jdt-download-url
   "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.39.0/jdt-language-server-1.39.0-202408291433.tar.gz")
 '(lsp-java-references-code-lens-enabled t)
 '(lsp-java-save-actions-organize-imports t)
 '(lsp-java-server-install-dir "~/.config/emacs/eclipse.jdt.ls/" t)
 '(lsp-java-show-build-status-on-start-enabled t)
 '(lsp-java-sources-organize-imports-star-threshold 3)
 '(lsp-java-sources-organize-imports-static-star-threshold 3)
 '(lsp-restart 'auto-restart)
 '(lsp-rust-all-features t)
 '(lsp-rust-analyzer-cargo-watch-enable t)
 '(lsp-rust-analyzer-check-all-targets t)
 '(lsp-rust-analyzer-display-chaining-hints t)
 '(lsp-rust-analyzer-display-parameter-hints t)
 '(lsp-rust-features [])
 '(lsp-rust-wait-to-build 1)
 '(lsp-semgrep-server-command nil)
 '(lsp-ui-doc-delay 5.0)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-position 'top)
 '(lsp-ui-flycheck-list-position 'right)
 '(lsp-ui-peek-fontify 'always)
 '(lsp-ui-peek-list-width 60)
 '(lsp-ui-peek-peek-height 25)
 '(lsp-ui-sideline-enable t)
 '(lsp-ui-sideline-show-symbol nil)
 '(mc/always-repeat-command t)
 '(mc/insert-numbers-default 1)
 '(moo-select-method 'helm)
 '(org-export-backends '(ascii html icalendar latex md odt org))
 '(org-fontify-whole-heading-line t)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground
                 "Black" :html-background "Transparent" :html-scale
                 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-leading-stars t)
 '(org-highlight-latex-and-related '(latex script entities))
 '(org-journal-dir "~/MyFiles/Nikhil/journal")
 '(org-journal-enable-encryption t)
 '(org-journal-encrypt-journal t)
 '(org-journal-encrypt-on 'before-save-hook)
 '(org-journal-encrypt-on-hook-fn 'before-save-hook)
 '(org-pretty-entities t)
 '(org-return-follows-link t)
 '(org-src-fontify-natively t)
 '(org-todo-keywords '((sequence "TODO" "DONE")))
 '(package-selected-packages
   '(ace-jump-helm-line ace-jump-zap all-the-icons auto-package-update
                        beacon bind-key cargo ccls clang-format
                        company-irony copilot doom-themes drag-stuff
                        duplicate-thing ellama exec-path-from-shell
                        expand-region find-temp-file fixmee
                        flycheck-haskell flycheck-rust go-mode
                        golden-ratio gruvbox-theme irony ivy jump-char
                        loccur lsp-haskell lsp-java lsp-ui magit
                        move-text multiple-cursors nyan-mode
                        org-journal org-roam proof-general pylint
                        rocq-mode rust-mode smartparens sudo-edit
                        toml-mode try undo-tree virtualenvwrapper
                        visual-regexp-steroids web-mode which-key
                        yaml-mode yasnippet-snippets))
 '(package-vc-selected-packages
   '((rocq-mode :url "https://codeberg.org/jpoiret/rocq-mode.el.git")
     (rocq-mode.el :vc-backend Git :url
                   "https://codeberg.org/jpoiret/rocq-mode.el.git")))
 '(proof-indent-hang t)
 '(proof-splash-time 0)
 '(proof-toolbar-enable nil)
 '(rust-format-on-save t)
 '(rustic-analyzer-command '("/usr/lib/rustup/bin/rust-analyzer"))
 '(rustic-lsp-format t)
 '(rustic-rustfmt-args "--edition 2021")
 '(scroll-bar-mode nil)
 '(semantic-default-c-path '("/usr/include/"))
 '(semantic-mode t)
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t)
 '(tooltip-frame-parameters
   '((name . "tooltip") (internal-border-width . 2) (border-width . 1)
     (no-special-glyphs . t) (alpha . 10)))
 '(tooltip-mode nil)
 '(tramp-terminal-type "tramp")
 '(tramp-verbose 6)
 '(undo-tree-auto-save-history nil)
 '(undo-tree-visualizer-diff t)
 '(vr/default-replace-preview t)
 '(warning-suppress-log-types '((lsp-mode)))
 '(web-mode-auto-close-style 2)
 '(web-mode-enable-auto-expanding t)
 '(web-mode-enable-block-face nil)
 '(web-mode-enable-comment-interpolation t)
 '(web-mode-enable-current-column-highlight nil)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-enable-element-content-fontification nil)
 '(web-mode-enable-element-tag-fontification nil)
 '(web-mode-enable-engine-detection t)
 '(web-mode-enable-html-entities-fontification nil)
 '(web-mode-enable-inlays t)
 '(web-mode-enable-optional-tags nil)
 '(web-mode-enable-sql-detection t)
 '(web-mode-enable-whitespace-fontification nil)
 '(whitespace-action '(auto-cleanup))
 '(yas-snippet-dirs
   '("/home/nikhilc/.config/emacs/snippets" yasnippet-snippets-dir
     "/home/nikhilc/.config/emacs/elpa/yasnippet-snippets-20240911.801/snippets"))
 '(zeno-theme-enable-italics t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282c34" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 98 :width normal :foundry "NONE" :family "monospace"))))
 '(custom-comment ((t nil)))
 '(flycheck-warning ((t (:underline (:color "yellow" :style wave)))))
 '(haskell-literate-comment-face ((t nil)))
 '(hl-line ((t (:extend t :background "#343850" :underline nil))))
 '(lsp-flycheck-warning-unnecessary-face ((t (:foreground "dim gray" :underline (:color "yellow" :style wave :position nil)))) t)
 '(lsp-ui-doc-background ((t (:background nil))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
 '(region ((t (:extend t :background "#cc02bb" :foreground "#d3e603"))))
 '(rocq-goal-face ((t (:underline nil))))
 '(rocq-mode-last-goal-request ((t (:background "green"))))
 '(rocq-mode-processing-face ((t (:background "medium blue")))))
