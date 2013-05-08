(jc-ensure-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(jc-ensure-package 'git-gutter)
(require 'git-gutter)
;; Setting git gutter mode globally conflicts with magit.
(global-set-key (kbd "C-c g") 'git-gutter-mode)

(jc-ensure-package 'git-gutter-fringe)
(require 'git-gutter-fringe)
