(load-theme 'zenburn t)

;; Use a red modeline for the active buffer to make it easier to spot
(set-face-background 'mode-line "#a22")

;; Make region marking higher contrast
(transient-mark-mode 1)
(set-face-background 'region "#707")

;; Whitespace
(global-whitespace-mode 0)
(setq whitespace-style (quote
			    ( face trailing tabs lines-tail tab-mark )))
(set-face-background 'whitespace-tab "red")
(set-face-foreground 'whitespace-line "#77f")
(set-face-background 'whitespace-line "#522")
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Highlight matching parentheses
(jc-ensure-package 'highlight-parentheses)
(require 'highlight-parentheses)
(highlight-parentheses-mode 1)

;; Highlight non-ascii characters
(global-hi-lock-mode 1)
(highlight-regexp "[^[:ascii:]]" 'hi-yellow)
