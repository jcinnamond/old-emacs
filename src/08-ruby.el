;; Rbenv support
(paradox-require 'rbenv)
(rbenv-use-global)
(setq rbenv-show-active-ruby-in-modeline 'nil)
(global-rbenv-mode)

;; Add support for IRB in a buffer
(paradox-require 'inf-ruby)

;; YAML support
(paradox-require 'yaml-mode)

;; rubocop support
(paradox-require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; rspec support
(paradox-require 'rspec-mode)

;; load rspec mode with ruby-mode
(add-hook 'ruby-mode-hook (lambda ()
			    (if (rspec-buffer-is-spec-p)
				(rspec-mode)
			      (rspec-verifiable-mode))))

(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

(add-hook 'ruby-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
