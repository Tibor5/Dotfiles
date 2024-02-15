;;;; lisp-packages.el --- Lisp development packages  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

;; Indentation
(add-to-list 'package-selected-packages 'aggressive-indent)

;; Emacs Lisp
(add-to-list 'package-selected-packages 'package-lint)
(add-to-list 'package-selected-packages 'package-lint-flymake)

;; Common Lisp
(add-to-list 'package-selected-packages 'sly)
(add-to-list 'package-selected-packages 'sly-asdf)
(add-to-list 'package-selected-packages 'sly-quicklisp)
(add-to-list 'package-selected-packages 'sly-repl-ansi-color)

;; Clojure
;; (add-to-list 'package-selected-packages 'cider)
;; (add-to-list 'package-selected-packages 'clj-refactor)
;; (add-to-list 'package-selected-packages 'clojure-mode)
;; (add-to-list 'package-selected-packages 'flycheck-clojure)

;; Scheme and Racket
(add-to-list 'package-selected-packages 'geiser)
(add-to-list 'package-selected-packages 'geiser-guile)
(add-to-list 'package-selected-packages 'geiser-racket)

(provide 'lisp-packages)
;;; lisp-packages.el ends here
