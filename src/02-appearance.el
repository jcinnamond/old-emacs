(paradox-require 'zenburn-theme)
(load-theme 'zenburn t)

(paradox-require 'smart-mode-line)
(sml/setup)

;; Strip back the UI
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Don't jump around when scrolling
(setq scroll-step 1)

;; Highlight whitespace
(global-whitespace-mode 0)
(setq whitespace-style (quote
			( face trailing tabs lines-tail tab-mark empty )))
(setq whitespace-line-column 100)
(set-face-background 'whitespace-tab "#733")
(set-face-background 'whitespace-trailing "#544")
(set-face-background 'whitespace-empty "#544")
(set-face-background 'whitespace-line "#544")
(set-face-foreground 'whitespace-line "#ddd")
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Mark 80 column width
(paradox-require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 3)
(setq fci-rule-use-dashes 't)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; Highlight matching parens
(show-paren-mode 1)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#d44")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
