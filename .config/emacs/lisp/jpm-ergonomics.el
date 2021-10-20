;;; jpm-ergonomics.el --- General ergonomics and behaviours  -*- lexical-binding: t; -*-

;;; Commentary:

(require 'jpm-package)

;; Various settings
(setq mouse-yank-at-point t         ; Yank where the point currently is
      mouse-1-click-follows-link nil  ; Don't follow links with left click
      x-select-enable-primary t     ; Yank use the primary selection if available
      x-select-enable-clipboard t   ; Yank use the clipboard if available
      save-interprogram-paste-before-kill t ; Put clipboard/selection into kill ring
      echo-keystrokes 0.1           ; Show keystrokes early
      use-dialog-box nil              ; Do not display dialog boxes.
      sentence-end-double-space nil   ; No need to end sentences with two spaces.
      next-screen-context-lines 5)  ; Keep more lines when scrolling.
(setq-default indent-tabs-mode nil)       ; Don't use tabs by default
(fset 'yes-or-no-p 'y-or-n-p)           ; Always use y/n prompt

;; Restore last-known position when opening a file.
;;(use-package saveplace
;;  :custom
;;  (save-place-file (jpm:runtime-file "places"))
;;  :config
;;  (save-place-mode 1))

(provide 'jpm-ergonomics)
;;; jpm-ergonomics.el ends here
