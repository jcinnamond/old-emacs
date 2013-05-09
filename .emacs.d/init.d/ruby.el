(jc-ensure-package 'ruby-mode)
(require 'ruby-mode)

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

;; Better electric completion for ruby
(jc-ensure-package 'ruby-electric)

;; Helpers for converting string -> symbol
(jc-ensure-package 'ruby-tools)

(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-wc" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '(".+\\.rake$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode t))
	     (ruby-electric-mode t)
	     ))


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

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)))
