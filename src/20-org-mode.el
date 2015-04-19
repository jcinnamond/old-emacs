(require 'org)
(add-hook 'org-mode-hook (lambda()
			   (auto-fill-mode)
			   (flyspell-mode)))
(setq org-log-done t)

(define-key org-mode-map (kbd "C-c C-c") 'org-md-export-to-markdown)
