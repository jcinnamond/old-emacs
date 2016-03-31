(require 'org)
(add-hook 'org-mode-hook (lambda()
			   (auto-fill-mode)
			   (flyspell-mode)

			   ;; Unbind shift+arrows - I use these for moving between windows
			   (define-key org-mode-map (kbd "S-<left>") nil)
			   (define-key org-mode-map (kbd "S-<right>") nil)
			   (define-key org-mode-map (kbd "S-<up>") nil)
			   (define-key org-mode-map (kbd "S-<down>") nil)))

(setq org-log-done t)
(setq org-src-fontify-natively t)

(paradox-require 'htmlize)
