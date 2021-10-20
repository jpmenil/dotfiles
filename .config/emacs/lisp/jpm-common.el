;;; jpm-common.el --- Utility functions                 -*- lexical-binding: t; -*-

;;; Code:

(require 'jpm-package)

;; Ensure the New Standard Library is installed and always available.
;; f.el    - files and paths  https://github.com/rejeep/f.el
;; s.el    - strings          https://github.com/magnars/s.el
;; dash.el - lists            https://github.com/magnars/dash.el
(use-package f)
;;(use-package s)
;;(use-package dash)

(defun jpm:runtime-directory (&rest names)
  "Return (and create) a directory for runtime files using NAMES."
  (apply 'f-mkdir user-emacs-directory "run" names)
  (apply 'f-join user-emacs-directory "run" names))
(defun jpm:runtime-file (&rest names)
  "Return the path for a runtime file.
The filename is the last NAMES provided while the remaining ones
are used for directory. The directory is created if needed."
  (f-join (apply 'jpm:runtime-directory (-drop-last 1 names))
          (-last-item names)))

;;(defun jpm:executable-path (name)
;;  "Return the path for executable NAME.
;;This only looks in ~/.emacs.d/bin!"
;;  (f-join user-emacs-directory "bin" name))

(provide 'jpm-common)
;;; jpm-common.el ends here
