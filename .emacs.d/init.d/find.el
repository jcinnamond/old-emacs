(iswitchb-mode 1)
(ido-mode 1)

(jc-ensure-package 'ido-yes-or-no)
(require 'ido-yes-or-no)

(jc-ensure-package 'ido-ubiquitous)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Stop ido jumping directories when trying to create a new file
(setq ido-auto-merge-work-directories-length -1)
