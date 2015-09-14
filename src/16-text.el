(paradox-require 'markdown-mode)
(add-hook 'markdown-mode-hook (lambda()
			       (flyspell-mode)
			       (auto-fill-mode)))

(add-hook 'text-mode-hook (lambda()
			    (flyspell-mode)
			    (auto-fill-mode)))
