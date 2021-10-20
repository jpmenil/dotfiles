;;; jpm-package.el --- Package management with package.el and use-package  -*- lexical-binding: t; -*-

;;; Code:

(require 'package)

;; Archive to search for.
;;(setq package-archives '(("melpa"    . "https://melpa.org/packages/")
;;                         ("m-stable" . "https://stable.melpa.org/packages/")))
;;                         ("gnu"      . "https://elpa.gnu.org/packages/")))

;; Priorities. Default priority is 0.
;;(setq package-archive-priorities
;;      '(("m-stable" . 20)
;;        ("melpa"    . 10)))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize package manager.
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Install use-package and enable it.
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; All packages should be installed.
(setq use-package-always-ensure t)

;;(eval-when-compile
;;  (require 'use-package))

(provide 'jpm-package)
;;; jpm-package.el ends here
