(iswitchb-mode 1)
(ido-mode 1)

;; Enhance ido
(jc-ensure-package 'ido-better-flex)
(ido-better-flex/enable)
(setq ido-enable-flex-matching t)

(jc-ensure-package 'ido-yes-or-no)
(require 'ido-yes-or-no)

(jc-ensure-package 'ido-ubiquitous)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Stop ido jumping directories when trying to create a new file
(setq ido-auto-merge-work-directories-length -1)

;; Find files even if you don't know what directory they are in
(jc-ensure-package 'find-things-fast)
(require 'find-things-fast)
(global-set-key (kbd "C-x f") 'ftf-find-file)
