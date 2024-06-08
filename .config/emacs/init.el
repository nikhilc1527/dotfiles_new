
(require 'package)

(setq inhibit-startup-screen t)

;; (print user-emacs-directory)
;; (setq user-emacs-directory (concat (getenv "XDG_CONFIG_HOME") "/emacs/emacs.d/"))
;; (print process-environment)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq custom-file (concat user-emacs-directory "custom-set.el"))
(load custom-file 'noerror)

(org-babel-load-file (concat user-emacs-directory "myinit.org"))

;; (load-file (concat user-emacs-directory "torstein_config.el"))

(provide '.emacs)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
