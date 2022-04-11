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

;; https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Restore last-known position when opening a file.
;;(use-package saveplace
;;  :custom
;;  (save-place-file (jpm:runtime-file "places"))
;;  :config
;;  (save-place-mode 1))

(provide 'jpm-ergonomics)
;;; jpm-ergonomics.el ends here
