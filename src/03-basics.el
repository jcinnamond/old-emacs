;; No need for backup files as everything important is in git.
(setq make-backup-files nil)

;; Store auto save files out of the way
(make-directory "~/.emacs.d/auto-save" "~/.emacs.d")
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save/" t)))

;; Don't create lockfiles in the current directory
(setq create-lockfiles nil)

;; Don't go 'beep' on the train!
(setq ring-bell-function 'ignore)

;; Show line and column in the modeline
(line-number-mode 1)
(column-number-mode 1)

;; Indent
(setq standard-indent 2)

;; Don't open a new frame for ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Always open ediff with a vertical split
(set-variable 'ediff-split-window-function 'split-window-horizontally)

;; Start server
(load "server")
(unless (server-running-p) (server-start))

;; Disambiguate buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Jump between CamelCased words
(global-subword-mode t)

;; Human readable file sizes in dired
(setq dired-listing-switches "-alh")

;; Pick up commands from my search path
(paradox-require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Sentences do not need double spaces to end.  Period.
(set-default 'sentence-end-double-space nil)

;; Better undo
(paradox-require 'undo-tree)
(global-undo-tree-mode 1)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Jump back to previous window configurations
(winner-mode 1)

(setq ispell-dictionary "en_GB")

