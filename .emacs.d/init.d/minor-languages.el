(jc-ensure-package 'coffee-mode)
(require 'coffee-mode)
(setq coffee-tab-width 4)

(jc-ensure-package 'mustache-mode)
(require 'mustache-mode)

(jc-ensure-package 'scss-mode)
(require 'scss-mode)
(setq scss-compile-at-save nil)
(add-hook 'scss-mode-hook (lambda() (setq indent-tabs-mode nil) (standard-display-ascii ?\t "^I")))

(jc-ensure-package 'haml-mode)
(require 'haml-mode)

(jc-ensure-package 'slim-mode)
(require 'slim-mode)

(jc-ensure-package 'feature-mode)
(require 'feature-mode)

;; Javascript
(defun fuck-you-tabs ()
  "Don't indent with tabs. Make tabs super-obvious"
  (setq indent-tabs-mode nil)
  (or buffer-display-table
      (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\t (vconcat "»")))

(jc-ensure-package 'js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'fuck-you-tabs)

(jc-ensure-package 'jsx-mode)
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(add-hook 'jsx-mode-hook 'fuck-you-tabs)

