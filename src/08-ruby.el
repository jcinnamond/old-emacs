;; Enhanced ruby mode pretty much replaces the need for flymake
(paradox-require 'enh-ruby-mode)
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Rbenv support
(paradox-require 'rbenv)
(rbenv-use-global)
(setq rbenv-show-active-ruby-in-modeline 'nil)
(global-rbenv-mode)

;; Add support for IRB in a buffer
(paradox-require 'inf-ruby)
(setq enh-ruby-deep-indent-paren nil)

;; YAML support
(paradox-require 'yaml-mode)

(add-hook 'enh-ruby-mode-hook (lambda()
				(if big-state
				    (whitespace-mode 0)
				  (whitespace-mode 1))
				(wrap-region-mode t)
				(flyspell-prog-mode)))

;; rubocop support
(paradox-require 'rubocop)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

;; rspec support
(paradox-require 'rspec-mode)

;; load rspec mode with enhanced-ruby-mode
(add-hook 'enh-ruby-mode-hook (lambda ()
				(if (rspec-buffer-is-spec-p)
				    (rspec-mode)
				  (rspec-verifiable-mode))))

;; Taken from http://blog.senny.ch/blog/2012/10/06/emacs-tidbits-for-ruby-developers/
(defun senny-ruby-open-spec-other-buffer ()
  (interactive)
  (when (featurep 'rspec-mode)
    (let ((source-buffer (current-buffer))
          (other-buffer (progn
                          (rspec-toggle-spec-and-target)
                          (current-buffer))))
      (switch-to-buffer source-buffer)
      (pop-to-buffer other-buffer))))

;; Load rspec mode with enhanced-ruby-mode
(add-hook 'enh-ruby-mode-hook (lambda ()
				(define-key enh-ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)
				))

(require 'rcodetools)
(define-key enh-ruby-mode-map (kbd "C-c C-c") 'xmp)
