;; C-z is used by workgroups, so make sure it never suspends
(global-unset-key (kbd "C-z"))

(jc-ensure-package 'workgroups)
(require 'workgroups)
(setq wg-prefix-key (kbd "C-z"))
(workgroups-mode 1)
(setq wg-morph-on nil)
(wg-load "~/.emacs.d/sessions/workgroups")

