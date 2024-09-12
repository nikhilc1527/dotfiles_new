(setq inhibit-startup-screen t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(require 'package)
(setq use-package-always-ensure t)

(setq custom-file (concat user-emacs-directory "custom-set.el"))
(load custom-file 'noerror)

(org-babel-load-file (concat user-emacs-directory "myinit.org"))
