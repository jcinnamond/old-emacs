(paradox-require 'bm)

(setq bm-highlight-style 'bm-highlight-only-fringe)

(global-set-key (kbd "C-c b b") 'bm-toggle)
(global-set-key (kbd "C-c b p") 'bm-previous)
(global-set-key (kbd "C-c b n") 'bm-next)
(global-set-key (kbd "C-c b l") 'bm-show-all)
