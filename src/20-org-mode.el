(require 'org)
(add-hook 'org-mode-hook (lambda()
			   (auto-fill-mode)
			   (flyspell-mode)))
(setq org-log-done t)
(setq org-src-fontify-natively t)

(define-key org-mode-map (kbd "C-c C-c") 'org-md-export-to-markdown)
