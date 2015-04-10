(paradox-require 'expand-region)
(global-set-key (kbd "C-,") 'er/expand-region)

(paradox-require 'iedit)

;; Narrow to region works well with iedit
(put 'narrow-to-region 'disabled nil)

(paradox-require 'loccur)
(global-set-key (kbd "C-c l") 'loccur)
