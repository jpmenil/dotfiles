;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Packages can be updated by using M-x doom/bump-package-at-point.

;; Org-related packages
(package! org-download)

;; Major modes
(package! dockerfile-mode)
(package! lua-mode)
(package! protobuf-mode)
(package! puppet-mode)
;; (package! pyhon-mode)

;; Misc packages
(package! apheleia)
(package! bm)
;; (package! corfu)
(package! company-lsp)
(package! git-auto-commit-mode)
(package! lsp-mode)
(package! lsp-pyright)
(package! openbsd-knf-style
  :recipe (:host github
           :repo "vincentbernat/openbsd-knf-emacs"))
;;(package! pass :pin)

;; Disable some packages I don't want
(package! tide :disable t)              ; I am using LSP
(package! anaconda-mode :disable t)     ; I am using LSP
(package! nose :disable t)
(package! emmet-mode :disable t)        ; In web-mode, prevent completion in <script>
(package! lsp-python-ms :disable t)
