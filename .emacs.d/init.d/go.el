(jc-ensure-package 'go-mode)
(jc-ensure-package 'go-autocomplete)

(add-hook 'go-mode-hook (lambda()
			  (setq tab-width 4)))
