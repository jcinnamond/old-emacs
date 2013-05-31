(jc-ensure-package 'multiple-cursors)
(require 'multiple-cursors)
;;(multiple-cursors-mode)

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-all-like-this)

(jc-ensure-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-,") 'er/expand-region)