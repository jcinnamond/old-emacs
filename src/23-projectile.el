(paradox-require 'projectile)
(projectile-global-mode)

(paradox-require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)
