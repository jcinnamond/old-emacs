(jc-ensure-package 'helm)
(require 'helm-config)
(require 'helm-files)
(jc-ensure-package 'helm-ls-git)
(require 'helm-ls-git)

(helm-mode t)

(setq helm-ff-toggle-basename t)

(defun helm-all-the-things ()
  "Use helm to find anything"
  (interactive)
  (helm :sources '(helm-source-findutils
                 ;; helm-source-recentf
                 helm-source-buffers-list
                 helm-source-ctags
		 helm-source-etags-select
                 helm-source-ls-git)
	:buffer "*helm all the things*"))

(global-set-key (kbd "C-x f") 'helm-all-the-things)

(jc-ensure-package 'helm-swoop)
(require 'helm-swoop)

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)

(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
