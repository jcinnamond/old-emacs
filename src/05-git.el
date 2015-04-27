(paradox-require 'magit)
(paradox-require 'git-commit-mode)
(paradox-require 'git-rebase-mode)
(paradox-require 'gitconfig-mode)
(paradox-require 'gitignore-mode)
(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-last-seen-setup-instructions "1.4.0")

(paradox-require 'github-browse-file)
(global-set-key (kbd "C-c g") 'github-browse-file)

(paradox-require 'gist)
