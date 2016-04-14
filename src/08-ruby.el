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

;; Bundler support
(paradox-require 'bundler)

;; rspec support
(paradox-require 'rspec-mode)

;; load rspec mode with ruby-mode
(add-hook 'ruby-mode-hook (lambda ()
			    (if (rspec-buffer-is-spec-p)
				(rspec-mode)
			      (rspec-verifiable-mode))))

(add-hook 'ruby-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
(add-hook 'ruby-mode-hook 'electric-pair-mode)

(paradox-require 'seeing-is-believing)
(add-hook 'ruby-mode-hook 'seeing-is-believing)
(define-key ruby-mode-map (kbd "C-c C-c") 'seeing-is-believing-run-as-xmpfilter)

(load "ruty")

;; Calm aggressive-indent-mode down a little
(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'ruby-mode)
       (string-match "\\b\\(def\\|class\\)\\b"
		     (thing-at-point 'line))))

;; Binding for running compile
(define-key ruby-mode-map (kbd "C-c ;") 'compile)

(add-hook 'ruby-mode-hook (lambda ()
			    (set (make-local-variable 'compile-command)
				 "bundle ")))
