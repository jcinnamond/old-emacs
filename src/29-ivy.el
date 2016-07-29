(paradox-require 'ivy)
(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-height 20)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-c k") 'counsel-ag)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
