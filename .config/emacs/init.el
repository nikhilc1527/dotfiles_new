(setq inhibit-startup-screen t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq custom-file (concat user-emacs-directory "custom-set.el"))
(load custom-file 'noerror)

(org-babel-load-file (concat user-emacs-directory "myinit.org"))
(put 'dired-find-alternate-file 'disabled nil)
