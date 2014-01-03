(jc-ensure-package 'coffee-mode)
(require 'coffee-mode)
(setq coffee-tab-width 4)

(jc-ensure-package 'mustache-mode)
(require 'mustache-mode)

(jc-ensure-package 'scss-mode)
(require 'scss-mode)
(setq scss-compile-at-save nil)

(jc-ensure-package 'haml-mode)
(require 'haml-mode)

(jc-ensure-package 'slim-mode)
(require 'slim-mode)

(jc-ensure-package 'feature-mode)
(require 'feature-mode)

;; Javascript
(jc-ensure-package 'js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

