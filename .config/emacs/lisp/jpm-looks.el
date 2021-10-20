;;; jpm-looks.el --- Fashion and aesthetics     -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(require 'jpm-common)

;; Disable various graphical widgets
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode horizontal-scroll-bar-mode blink-cursor-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Various minor modes
(show-paren-mode 1)         ; Display matching parenthesis (C-M-n and C-M-p).
(line-number-mode 1)            ; Show line number.
(column-number-mode 1)          ; Show column number.
(global-hl-line-mode 0)         ; Highlight current line.
(delete-selection-mode 1)
(which-function-mode 1)

(global-set-key (kbd "M-g") 'goto-line)

(custom-set-faces
 '(which-func ((t (:foreground "yellow")))))

(setq require-final-newline t)
(setq inhibit-splash-screen t)      ; No splash screen.
(setq make-pointer-invisible t)     ; Hide the mouse while typing.
(setq x-stretch-cursor t)               ; Stretch cursor to match character width.
(set-default 'indicate-buffer-boundaries '((up . nil) (down . nil) (t . left)))

;; Main theme.
(load-theme 'wilmersdorf t)

;; ibuffer
;;(use-package ibuffer
;;  :bind (("C-x C-b" . ibuffer)))

;; Auto revert buffers
(global-auto-revert-mode 1)
(setq
 ;; Don't create lock files
 create-lockfiles nil
 ;; Don't create backup files
 make-backup-files nil)

;; Auto saves in a specific directory
(let ((tmp (jpm:runtime-file "saves" "saves-")))
  (setq auto-save-list-file-prefix tmp
        auto-save-file-name-transforms `((".*" ,tmp t))))

(provide 'jpm-looks)
;;; jpm-looks.el ends here
