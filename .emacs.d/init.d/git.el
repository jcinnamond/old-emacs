(jc-ensure-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(jc-ensure-package 'git-gutter)
;; Can't install git-gutter-fringe as it depends on fringe-helper and there is
;; no package for that :-(
