;;; init.el --- Emacs init file                      -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Bump GC threshold and other stuff to speed up LSP
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 8 1024 1024)) ;; 8 megabytes

(setq load-prefer-newer t)
;(setq user-emacs-directory "~/.config/emacs")
(setq user-emacs-directory (file-name-directory
                        (or (buffer-file-name) (file-chase-links load-file-name))))

(setq custom-file (concat user-emacs-directory "custom.el"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))

(require 'jpm-package)
(require 'jpm-looks)
(require 'jpm-ergonomics)
(require 'jpm-programming)

;;; init.el ends here
(put 'downcase-region 'disabled nil)
