(paradox-require 'helm "helm" nil 'helm 't)
(require 'helm-config)
(require 'helm-files)
(paradox-require 'helm-ls-git)
(require 'helm-ls-git)
(setq helm-ls-git-show-abs-or-relative 'relative)
(setq helm-split-window-default-side 'right)
(setq helm-split-window-in-side-p nil)

(helm-mode t)

(defun helm-all-the-things ()
  "Use helm to find anything"
  (interactive)
  (helm :sources '(helm-source-findutils
		   helm-source-files-in-current-dir
		   ;; helm-source-recentf
		   helm-source-buffers-list
		   ;; helm-source-ctags
		   ;; helm-source-etags-select
		   helm-source-ls-git
		   helm-source-ls-git-status)
	:buffer "*helm all the things*"))

(global-set-key (kbd "C-x f") 'helm-all-the-things)
(global-set-key (kbd "C-x p") 'helm-browse-project)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-c s") 'helm-google-suggest)

(define-key emacs-lisp-mode-map (kbd "M-/") 'helm-lisp-completion-at-point)

(paradox-require 'helm-swoop)
(require 'helm-swoop)

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)

(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; Helm all the things
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Visual kill rings ftw
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
