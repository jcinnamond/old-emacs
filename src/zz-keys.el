(windmove-default-keybindings)

;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(global-set-key (kbd "s-3") '(lambda () (interactive) (insert "#")))

;; Remap cmd and alt
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Automatically indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; ibuffer is better than list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;;
;; Taken from https://github.com/technomancy/better-defaults/blob/master/better-defaults.el
;;

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Stupid mac os-x uk keyboard # problems with emacsclient
(global-set-key (kbd "C-c 0") 'server-edit)
(global-set-key (kbd "C-c w") 'delete-frame)

;; Align things
(global-set-key (kbd "C-c |") 'align-regexp)
