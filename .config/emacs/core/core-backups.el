;;;; core-backups.el --- Safe fallback behaviours -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; eln
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache (expand-file-name "eln/" cache-dir))
  (add-to-list 'native-comp-eln-load-path (expand-file-name "eln/" cache-dir))
  (setq native-comp-async-report-warnings-errors init-file-debug
        native-comp-warning-on-missing-source init-file-debug)
  ;; REVIEW: To be obsolete
  (unless (boundp 'native-comp-deferred-compilation-deny-list)
    (defvaralias 'native-comp-deferred-compilation-deny-list 'native-comp-jit-compilation-deny-list))
  (define-advice comp-effective-async-max-jobs (:before (&rest _) set-default-cpus)
    "Default to 1/4 of cores in interactive sessions and all of them otherwise."
    (and (null comp-num-cpus)
         (zerop native-comp-async-jobs-number)
         (setq comp-num-cpus
               (max 1 (/ (num-processors) (if noninteractive 1 4)))))))

;; History
(setq-default savehist-file (expand-file-name "savehist" cache-dir)
              savehist-additional-variables '(kill-ring search-ring regexp-search-ring)
              savehist-save-minibuffer-history t
              savehist-autosave-interval nil)
(savehist-mode 1)
(setq history-length t
      history-delete-duplicates t)

;; Save place
(setq-default save-place-file (expand-file-name "saveplace" cache-dir))
(save-place-mode 1)

;; Backup
(setq create-lockfiles nil
      make-backup-files t
      version-control t
      backup-by-copying t
      delete-old-versions t
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist (list (cons "." backup-dir))
      tramp-backup-directory-alist backup-directory-alist)

;; Auto save
(setq auto-save-default t
      auto-save-timeout 10
      auto-save-interval 200
      auto-save-include-big-deletions t
      auto-save-list-file-prefix (expand-file-name "autosave/" cache-dir)
      tramp-auto-save-directory (expand-file-name "tramp-autosave/" cache-dir)
      auto-save-file-name-transforms
      (list (list "\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
                  ;; Prefix tramp autosaves to prevent conflicts with local ones
                  (concat auto-save-list-file-prefix "tramp-\\2") t)
            (list ".*" auto-save-list-file-prefix t)))

;; Auto revert
(setq-default global-auto-revert-mode t
              global-auto-revert-non-file-buffers t
              auto-revert-verbose t
              auto-revert-use-notify nil
              auto-revert-stop-on-user-input nil
              revert-without-query (list "."))

;; Recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" cache-dir)
      recentf-max-saved-items 100
      recentf-max-menu-items 10
      recentf-auto-cleanup nil
      recentf-exclude '("\\.git.*" "\\.hg.*" "\\.svn.*"))
(defun recentf-exclude-p (file)
  "A predicate to decide whether to exclude FILE from recentf."
  (let ((file-dir (file-truename (file-name-directory file))))
    (-any-p (lambda (dir)
              (string-prefix-p dir file-dir))
            (mapcar 'file-truename (list cache-dir package-user-dir)))))
(add-to-list 'recentf-exclude 'recentf-exclude-p)
(setq recentf-auto-cleanup (if (daemonp) 300))
(add-hook 'kill-emacs-hook #'recentf-cleanup)
(add-hook 'dired-mode-hook
          (defun recentf-add-dired-directory-h ()
            "Add dired directories to recentf file list."
            (recentf-add-file default-directory)))
(recentf-mode +1)

;; Bookmarks
(setq-default bookmark-default-file (expand-file-name "bookmarks" cache-dir)
              bookmark-save-flag 1
              bookmark-set-no-overwrite t)

(provide 'core-backups)
;;; core-backups.el ends here
