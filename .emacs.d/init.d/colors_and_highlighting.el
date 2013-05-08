(load-theme 'wombat)

;; Use a red modeline for the active buffer to make it easier to spot
(set-face-background 'mode-line "#a22")

;; Make region marking contrast with hi-line
(transient-mark-mode 1)
(set-face-background 'region "#707")

;; Use highline to highlight the current line. This doesn't trample on other
;; highlighting.
(jc-ensure-package 'highline)
(require 'highline)
(set-face-background 'highline-face "#333")
(global-highline-mode 1)

;; Whitespace
(global-whitespace-mode 1)
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
