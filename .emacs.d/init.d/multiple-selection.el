(setq cua-enable-cua-keys nil)
(cua-mode)

(jc-ensure-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-,") 'er/expand-region)

(jc-ensure-package 'iedit)
(require 'iedit)

;; Narrow to region works well with iedit
(put 'narrow-to-region 'disabled nil)
