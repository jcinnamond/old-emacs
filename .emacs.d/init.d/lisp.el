(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)

(jc-ensure-package 'slime)
(setq inferior-lisp-program "/usr/local/bin/gsi") ; your Lisp system
(add-to-list 'load-path "~/slime/")  ; your SLIME directory
(require 'slime-autoloads)
(slime-setup)
