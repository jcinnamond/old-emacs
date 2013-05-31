;; Enhanced ruby mode pretty much replaces the need for flymake
(jc-ensure-package 'enh-ruby-mode)
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Rbenv support
(jc-ensure-package 'rbenv)
(require 'rbenv)
(rbenv-use-global)
(global-rbenv-mode)

;; Add support for IRB in a buffer
(jc-ensure-package 'inf-ruby)
(require 'inf-ruby)

(setq enh-ruby-deep-indent-paren nil)

;; YAML support
(jc-ensure-package 'yaml-mode)
(require 'yaml-mode)

;; Test unit support - bleugh
(jc-ensure-package 'ruby-test-mode)
(require 'ruby-test-mode)
(add-to-list 'auto-mode-alist '("_test\\.rb" . ruby-test-mode))
(setq ruby-test-ruby-executables '("ruby" "ruby1.9"))

;; Rspec support - DISABLED while I use test unit :-(
(jc-ensure-package 'rspec-mode)
;; (require 'rspec-mode)
;; (setq rspec-use-rake-flag nil)

;; Load rspec mode with enhanced-ruby-mode - DISABLED while I use test unit :-(
;; (add-hook 'enh-ruby-mode-hook (lambda ()
;; 				(if (rspec-buffer-is-spec-p)
;; 				    (rspec-mode)
;; 				  (rspec-verifiable-mode))
;; 				))

;; Helpers for converting string -> symbol
(jc-ensure-package 'ruby-tools)
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)

;; Highlight matching parentheses
(add-hook 'enh-ruby-mode-hook 'highlight-parentheses-mode)

;; Taken from http://blog.senny.ch/blog/2012/10/06/emacs-tidbits-for-ruby-developers/
;; DISABLED while I use test unit :-(
;; (defun senny-ruby-open-spec-other-buffer ()
;;   (interactive)
;;   (when (featurep 'rspec-mode)
;;     (let ((source-buffer (current-buffer))
;;           (other-buffer (progn
;;                           (rspec-toggle-spec-and-target)
;;                           (current-buffer))))
;;       (switch-to-buffer source-buffer)
;;       (pop-to-buffer other-buffer))))

;; ;; Load rspec mode with enhanced-ruby-mode
;; (add-hook 'enh-ruby-mode-hook (lambda ()
;; 				(define-key enh-ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)
;; 				))

;; Use outline mode for basic code folding
(add-hook 'enh-ruby-mode-hook (lambda()
				(outline-minor-mode)
				(setq outline-regexp " *\\(def \\|class\\|module\\)")
				(define-key enh-ruby-mode-map (kbd "C-c C-f") 'hide-leaves)
				(define-key enh-ruby-mode-map (kbd "C-c f") 'show-subtree)
				(define-key enh-ruby-mode-map (kbd "C-c h") 'hide-body)
				(define-key enh-ruby-mode-map (kbd "C-c s") 'show-all)))

;; Basic code folding for rspec
(add-hook 'rspec-mode-hook (lambda()
				(setq outline-regexp " *\\(def \\|it \\|describe \\|context \\)")))
