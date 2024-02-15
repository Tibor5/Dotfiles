;;;; init-config.el --- Emacs initial configuration  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defgroup crafted-init '()
  "Initialization configuration for Crafted Emacs."
  :tag "Crafted Init"
  :group 'crafted)

(defcustom crafted-init-auto-save-customized t
  "Save customized variables automatically every session."
  :type 'boolean
  :group 'crafted-init)

(defcustom crafted-init-auto-save-selected-packages t
  "Save the list of selected packages automatically every session."
  :type 'boolean
  :group 'crafted-init)

(require 'project)

(customize-set-variable 'load-prefer-newer t)

(if (boundp 'crafted-emacs-home)
    (message "crafted-emacs-home value set by user: %s" crafted-emacs-home)
  (defvar crafted-emacs-home nil))

(unless crafted-emacs-home
  (error "%s\n%s"
         "The value for crafted-emacs-home is not set"
         "Please set this value to the location where crafted-emacs is installed"))

(let ((modules (expand-file-name "modules/" crafted-emacs-home)))
  (when (file-directory-p modules)
    (message "Adding modules to load-path: %s" modules)
    (add-to-list 'load-path modules)))

(let ((custom-modules (expand-file-name "custom-modules" user-emacs-directory)))
  (when (file-directory-p custom-modules)
    (message "adding custom-modules to load-path: %s" custom-modules)
    (add-to-list 'load-path custom-modules)))

(auto-insert-mode)

(defun crafted-save-customized ()
  "Save customized variables."
  (customize-save-customized)
    (when custom-file
    (load custom-file :noerror)))

(when crafted-init-auto-save-customized
  (add-hook 'after-init-hook #'crafted-save-customized))
(when crafted-init-auto-save-selected-packages
  (add-hook 'after-init-hook #'package--save-selected-packages))

(provide 'init-config)
;;; init-config.el ends here
