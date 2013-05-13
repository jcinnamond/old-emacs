;; Enhanced ruby mode pretty much replaces the need for flymake
(jc-ensure-package 'enh-ruby-mode)
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Rbenv support
(jc-ensure-package 'rbenv)
(require 'rbenv)
(rbenv-use-global)
(global-rbenv-mode)

;; Add support for IRB in a buffer
(jc-ensure-package 'inf-ruby)
(require 'inf-ruby)

;; Rspec support
(jc-ensure-package 'rspec-mode)
(require 'rspec-mode)
(setq rspec-use-rake-flag nil)

;; Load rspec mode with enhanced-ruby-mode
(add-hook 'enh-ruby-mode-hook (lambda ()
				(if (rspec-buffer-is-spec-p)
				    (rspec-mode)
				  (rspec-verifiable-mode))
				))

;; Helpers for converting string -> symbol
(jc-ensure-package 'ruby-tools)
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)

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
