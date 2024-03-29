;;;; core-init.el --- Core behaviour -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; ~  Emacs settings (from C source)
(use-package emacs
  :ensure nil
  :custom
  ;; UX
  (use-short-answers t)
  ;; UI
  (display-line-numbers-grow-only t)
  (display-line-numbers-type 'relative)
  (display-line-numbers-width 3)
  ;; Editing
  (tab-width 4)
  ;; REVISIT: Paragraph (naming?)
  (bidi-paragraph-direction 'left-to-right)
  (bidi-inhibit-bpa t)
  (truncate-partial-width-windows nil)
  (sentence-end-double-space nil)
  ;; Scroll
  (auto-window-vscroll nil)
  (scroll-margin 4)
  (scroll-conservatively 101)
  (fast-but-imprecise-scrolling t)
  (scroll-preserve-screen-position t)
  ;; Resize
  (frame-inhibit-implied-resize t)
  (window-resize-pixelwise t)
  (frame-resize-pixelwise t)
  ;; Miscellaneous
  (visible-bell nil))

;; ~  Keybindings

(global-set-key (kbd "C-v")
                (lambda ()
                  (interactive
                   (forward-line (/ (window-height (selected-window)) 3)))))

(global-set-key (kbd "M-v")
                (lambda ()
                  (interactive
                   (forward-line (- (/ (window-height (selected-window)) 3))))))

;; -------------------------------------------------------------------------------- ;;

;; ~  Edit

;; ~  Line numbers
(use-package display-line-numbers
  :ensure nil
  :custom (global-display-line-numbers-mode 1))

(use-package paren
  :ensure nil
  :init (show-paren-mode 1))

(use-package electric
  :ensure nil
  :custom (electric-indent-inhibit t))

(use-package elec-pair
  :ensure nil
  :init (electric-pair-mode 1))

(use-package delsel
  :ensure nil
  :init (delete-selection-mode 1))

(use-package files
  :ensure nil
  :custom (require-final-newline t))

(use-package simple
  :ensure nil
  :custom
  (kill-do-not-save-duplicates t)
  (kill-ring-max 1000)
  :config (indent-tabs-mode -1)
  :hook ((fundamental-mode
		  prog-mode) . visual-line-mode))

(use-package text-mode
  :ensure nil
  :hook (text-mode . visual-line-mode))

;; -------------------------------------------------------------------------------- ;;

(use-package ispell
  :ensure nil
  :hook
  ((text-mode fundamental-mode) . flyspell-mode)
  (prog-mode . flyspell-prog-mode))

(use-package repeat
  :ensure nil
  :hook (elpaca-after-init . repeat-mode))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode))

(use-package man
  :ensure nil
  :custom
  (Man-notify-method 'thrifty))

;; -------------------------------------------------------------------------------- ;;

;; ~  Window

(use-package window
  :ensure nil
  :custom
  (switch-to-buffer-in-dedicated-window 'pop)
  (switch-to-buffer-obey-display-actions t)
  :config
  (add-to-list 'display-buffer-alist
               '("\\*Help\\*"
                 (display-buffer-reuse-window display-buffer-pop-up-window)
                 (inhibit-same-window . t)))
  (add-to-list 'display-buffer-alist
               '("\\*Completions\\*"
                 (display-buffer-reuse-window display-buffer-pop-up-window)
                 (inhibit-same-window . t)
                 (window-height . 10))))

(use-package winner
  :ensure nil
  :demand t
  :custom (winner-mode 1))
;; (define-prefix-command 'keymap-window)
;; (keymap-set 'keymap-window "u" 'winner-undo)
;; (keymap-set 'keymap-window "r" 'winner-redo)
;; (keymap-set 'keymap-window "n" 'windmove-down)
;; (keymap-set 'keymap-window "p" 'windmove-up)
;; (keymap-set 'keymap-window "b" 'windmove-left)
;; (keymap-set 'keymap-window "f" 'windmove-right)
;; (keymap-global-set prefix-key-window 'keymap-window)

;; ~  -------------------------------------------------------------------------------- ~ ;;

;; ~  Navigation & Movement

(use-package dired
  :ensure nil
  :custom
  (dired-auto-revert-buffer t)
  (dired-dwim-target t)
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (setf dired-kill-when-opening-new-dired-buffer t))

(use-package pixel-scroll
  :ensure nil
  :when (fboundp 'pixel-scroll-precision-mode)
  :config (pixel-scroll-precision-mode))

;; ~  -------------------------------------------------------------------------------- ~ ;;

;; ~  Modules

(use-package core-backups :ensure nil)
(use-package core-ui :ensure nil)

(defun util/recursive-add-to-load-path (dir)
  "Add DIR and all its sub-directories to `load-path'."
  (add-to-list 'load-path dir)
  (dolist (f (directory-files dir))
    (let ((name (expand-file-name f dir)))
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (util/recursive-add-to-load-path name)))))

(util/recursive-add-to-load-path modules-dir)

;; ~  UI
(use-package mod-theme :ensure nil)
(use-package mod-icons :ensure nil)
(use-package mod-nano-modeline :ensure nil)
;; ~  Completion
(use-package mod-completion :ensure nil)
;; ~  Editing
;; ~  Formatting
;; ~  Linting
(use-package mod-flycheck :ensure nil)
;; ~  TreeSitter
(use-package mod-treesitter :ensure nil)
;; ~  Eglot
(use-package mod-eglot :ensure nil)
;; ~  Languages
(use-package mod-lang :ensure nil)
;; ~  Navigation
;; ~  Version Control
;; ~  Project Management
;; ~  Workspace Management
;; ~  ORG mode

(provide 'core-init)
;;; core-init.el ends here
