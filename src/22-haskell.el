(paradox-require 'haskell-mode)
(paradox-require 'haskell-process)
(add-hook 'haskell-mode-hook (lambda ()
			       (interactive-haskell-mode)
			       (turn-on-haskell-indent)))

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
