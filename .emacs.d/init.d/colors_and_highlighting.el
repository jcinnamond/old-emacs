(load-theme 'wombat)

;; Use a red modeline for the active buffer to make it easier to spot
(set-face-background 'mode-line "#a22")

;; Make region marking contrast with hi-line
(transient-mark-mode 1)
(set-face-background 'region "#707")

(global-hl-line-mode 1)

;; Whitespace
(global-whitespace-mode 1)
(setq whitespace-style (quote
			    ( face trailing tabs lines-tail tab-mark )))
(set-face-background 'whitespace-tab "red")
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Highlight long lines
(jc-ensure-package 'highlight-80+)
(require 'highlight-80+)
(highlight-80+-mode)

;; Highlight matching parentheses
(jc-ensure-package 'highlight-parentheses)
(require 'highlight-parentheses)
(highlight-parentheses-mode 1)
