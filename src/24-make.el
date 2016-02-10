(add-to-list 'auto-mode-alist '("\\.make\\'" . makefile-gmake-mode))
(add-hook 'makefile-gmake-mode-hook (lambda()
				      (define-key makefile-gmake-mode-map (kbd "C-c C-c") 'compile)))
