(paradox-require 'sql-indent)
(put 'scroll-left 'disabled nil)

(paradox-require 'scss-mode)
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

(paradox-require 'haml-mode)

;; Eugh! Javascript.
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'flyspell-prog-mode)
(add-hook 'js-mode-hook (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq js-indent-level 2)))

;; Yay! Elm.
(paradox-require 'elm-mode)

(paradox-require 'idris-mode)
