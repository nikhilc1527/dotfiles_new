;; (with-eval-after-load 'lsp-mode
;;   (require 'lsp-intellij)
;;   (add-hook 'java-mode-hook #'lsp-intellij-enable))


  ;; (use-package lsp-java
  ;;   :after lsp
  ;;   :config
  ;;   (define-key java-mode-map (kbd "C-c i") #'lsp-java-add-import))

  ;; (use-package exec-path-from-shell :ensure t)                                                                                                                                                                                      
  ;; (exec-path-from-shell-initialize)

  ;; (load "~/.emacs.d/linux.el")

  ;; (use-package flycheck
  ;;   :init
  ;;   (add-to-list 'display-buffer-alist
  ;;                `(,(rx bos "*Flycheck errors*" eos)
  ;;                  (display-buffer-reuse-window
  ;;                   display-buffer-in-side-window)
  ;;                  (side            . bottom)
  ;;                  (reusable-frames . visible)
  ;;                  (window-height   . 0.15))))

  ;; ;; (use-package idle-highlight)

  ;; (defun my-java-mode-hook ()
  ;;   (auto-fill-mode)
  ;;   (flycheck-mode)
  ;;   ;; (git-gutter+-mode)
  ;;   (gtags-mode)
  ;;   ;; (idle-highlight)
  ;;   (subword-mode)
  ;;   (yas-minor-mode)
  ;;   (set-fringe-style '(8 . 0))
  ;;   (define-key c-mode-base-map (kbd "C-M-j") 'tkj-insert-serial-version-uuid)
  ;;   (define-key c-mode-base-map (kbd "C-m") 'c-context-line-break)
  ;;   (define-key c-mode-base-map (kbd "S-<f7>") 'gtags-find-tag-from-here)

  ;;   ;; Fix indentation for anonymous classes
  ;;   (c-set-offset 'substatement-open 0)
  ;;   (if (assoc 'inexpr-class c-offsets-alist)
  ;;       (c-set-offset 'inexpr-class 0))

  ;;   ;; Indent arguments on the next line as indented body.
  ;;   (c-set-offset 'arglist-intro '++))
  ;; (add-hook 'java-mode-hook 'my-java-mode-hook)

  ;; (use-package projectile :ensure t)
  ;; (use-package yasnippet :ensure t)
  ;; ;; (use-package lsp-mode :ensure t
  ;; ;;   :bind (("\C-\M-b" . lsp-find-implementation)
  ;; ;;          ("M-RET" . lsp-execute-code-action))
  ;; ;;   :config
  ;; ;;   (setq lsp-inhibit-message t
  ;; ;;         lsp-eldoc-render-all nil
  ;; ;;         lsp-enable-file-watchers nil
  ;; ;;         lsp-highlight-symbol-at-point nil)

  ;; ;;   ;; Performance tweaks, see
  ;; ;;   ;; https://github.com/emacs-lsp/lsp-mode#performance
  ;; ;;   (setq gc-cons-threshold 100000000)
  ;; ;;   (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;; ;;   ;; (setq lsp-idle-delay 0.500)
  ;; ;;   )

  ;; (use-package lsp-mode                                                                                                                                                                                                              
  ;; :ensure t                                                                                                                                                                                                                          
  ;; :hook (                                                                                                                                                                                                                            
  ;;    (lsp-mode . lsp-enable-which-key-integration)                                                                                                                                                                                   
  ;;    (java-mode . #'lsp-deferred)                                                                                                                                                                                                    
  ;; )                                                                                                                                                                                                                                  
  ;; :init (setq                                                                                                                                                                                                                        
  ;;     lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map                                                                                                             
  ;;     lsp-enable-file-watchers nil                                                                                                                                                                                                   
  ;;     read-process-output-max (* 1024 1024)  ; 1 mb                                                                                                                                                                                  
  ;;     lsp-completion-provider :capf                                                                                                                                                                                                  
  ;;     lsp-idle-delay 0.500                                                                                                                                                                                                           
  ;; )                                                                                                                                                                                                                                  
  ;; :config                                                                                                                                                                                                                            
  ;;     (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects                                                                                                                                                       
  ;;     (with-eval-after-load 'lsp-intelephense                                                                                                                                                                                        
  ;;     (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))                                                                                                                                                                
  ;;     (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)                                                                                                                                                                        
  ;; )  

  ;; (use-package hydra :ensure t)
  ;; (use-package company-lsp :ensure t)
  ;; (use-package lsp-ui
  ;;   :ensure t
  ;;   :config
  ;;   (setq lsp-prefer-flymake nil
  ;;         lsp-ui-doc-delay 5.0
  ;;         lsp-ui-sideline-enable nil
  ;;         lsp-ui-sideline-show-symbol nil))

  ;; (use-package lsp-java
  ;;   :ensure t
  ;;   :init
  ;;   (setq lsp-java-server-install-dir "~/.emacs.d/eclipse.jdt.ls/")
  ;;   (setq lsp-java-vmargs
  ;;         (list
  ;;          ;; "-noverify"
  ;;          "-Xmx2G"
  ;;          "-XX:+UseG1GC"
  ;;          "-XX:+UseStringDeduplication"
  ;;          ;; "-javaagent:/home/torstein/.m2/repository/org/projectlombok/lombok/1.18.4/lombok-1.18.4.jar"
  ;;          )

  ;;         ;; Don't organise imports on save
  ;;         lsp-java-save-action-organize-imports nil

  ;;         ;; Currently (2019-04-24), dap-mode works best with Oracle
  ;;         ;; JDK, see https://github.com/emacs-lsp/dap-mode/issues/31
  ;;         ;;
  ;;         ;; lsp-java-java-path "~/.emacs.d/oracle-jdk-12.0.1/bin/java"
  ;;         ;; lsp-java-java-path "/usr/lib/jvm/java-14-openjdk-amd64/bin/"
  ;;         lsp-java-java-path "/usr/bin/java"
  ;;         )
  ;;   (setq lsp-java-imports-gradle-wrapper-checksums [(
  ;;                                                     :sha256 "2cae31aaabe2b362438e10dce5538f9a554e183056485df883f45aee08a008e0"
  ;;                                                     :allowed t)])

  ;;   :config
  ;;   (add-hook 'java-mode-hook #'lsp-mode))

  (use-package lsp-java                                                                                                                                                                                                              
  :ensure t                                                                                                                                                                                                                          
  :config (add-hook 'java-mode-hook 'lsp))

  ;; (use-package dap-mode
  ;;   :ensure t
  ;;   :after lsp-mode
  ;;   :config
  ;;   (dap-mode t)
  ;;   (dap-ui-mode t)
  ;;   (dap-tooltip-mode 1)
  ;;   (tooltip-mode 1)
  ;;   (dap-register-debug-template
  ;;    "localhost:5005"
  ;;    (list :type "java"
  ;;          :request "attach"
  ;;          :hostName "localhost"
  ;;          :port 5005))
  ;;   (dap-register-debug-template
  ;;    "10.186.38.171:5005"
  ;;    (list :type "java"
  ;;          :request "attach"
  ;;          :hostName "10.186.38.171"
  ;;          :port 5005))
  ;;   )

  ;; (use-package dap-mode                                                                                                                                                                                                              
  ;;   :ensure t                                                                                                                                                                                                                        
  ;;   :after (lsp-mode)                                                                                                                                                                                                                
  ;;   :functions dap-hydra/nil                                                                                                                                                                                                         
  ;;   :config                                                                                                                                                                                                                          
  ;;   (require 'dap-java)                                                                                                                                                                                                              
  ;;   :bind (:map lsp-mode-map                                                                                                                                                                                                         
  ;;          ("<f5>" . dap-debug)                                                                                                                                                                                                      
  ;;          ("M-<f5>" . dap-hydra))                                                                                                                                                                                                   
  ;;   :hook ((dap-mode . dap-ui-mode)                                                                                                                                                                                                  
  ;;     (dap-session-created . (lambda (&_rest) (dap-hydra)))                                                                                                                                                                          
  ;;     (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))))                   


  ;; (use-package dap-java :ensure nil) 

  ;; (use-package dap-java
  ;;   :ensure nil
  ;;   :after (lsp-java)

  ;;   ;; The :bind here makes use-package fail to lead the dap-java block!
  ;;   ;; :bind
  ;;   ;; (("C-c R" . dap-java-run-test-class)
  ;;   ;;  ("C-c d" . dap-java-debug-test-method)
  ;;   ;;  ("C-c r" . dap-java-run-test-method)
  ;;   ;;  )

  ;;   :config
  ;;   (global-set-key (kbd "<f7>") 'dap-step-in)
  ;;   (global-set-key (kbd "<f8>") 'dap-next)
  ;;   (global-set-key (kbd "<f9>") 'dap-continue)
  ;;   )

  ;; (use-package treemacs
  ;;   :init
  ;;   (add-hook 'treemacs-mode-hook
  ;;             (lambda () (treemacs-resize-icons 15))))
  ;;
