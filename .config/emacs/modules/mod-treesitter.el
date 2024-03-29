;;; mod-treesitter.el --- TreeSitter configuration. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq major-mode-remap-alist
      '((ocaml-mode . ocaml-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (rust-mode . rust-ts-mode)
        (bash-mode . bash-ts-mode)
        (elisp-mode . elisp-ts-mode)
        (lisp-mode . lisp-ts-mode)
        (clojure-mode . clojure-ts-mode)
        (scheme-mode . scheme-ts-mode)
        (go-mode . go-ts-mode)
        (python-mode . python-ts-mode)
        (json-mode . json-ts-mode)
        (js2-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (html-mode . html-ts-mode)
        (css-mode . css-ts-mode)
        (markdown-mode . markdown-ts-mode)
        (toml-mode . toml-ts-mode)
        (yaml-mode . yaml-ts-mode)
        (makefile-mode . make-ts-mode)))

(setq treesit-language-source-alist
      '((ocaml "https://github.com/tree-sitter/tree-sitter-ocaml" "master" "ocaml/src")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        ;; (go "https://github.com/tree-sitter/tree-sitter-go")
        ;; (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (lua "https://github.com/Azganoth/tree-sitter-lua")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        ;; (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        ;; (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        ;; (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        ;; (html "https://github.com/tree-sitter/tree-sitter-html")
        ;; (css "https://github.com/tree-sitter/tree-sitter-css")
        ;; (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")))

;; Then install any grammar libraries not already installed:
(dolist (lang treesit-language-source-alist)
  (unless (treesit-language-available-p (car lang))
    (treesit-install-language-grammar (car lang))))

(use-package treesit
  :ensure nil
  :config ())

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :init
  (setq treesit-auto-langs '(c cpp ocaml python rust elisp commonlisp lua bash fish yaml toml typescript javascript))
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'mod-treesitter)
;;; mod-treesitter.el ends here
