
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(global-set-key (kbd "C-c 0") 'server-edit)
(global-set-key (kbd "C-c w") 'delete-frame)

(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

(pallet-mode 1)

(require 'use-package)

(use-package paradox
  :config
  (setq paradox-github-token t)
  (setq paradox-automatically-star t))

(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(load-theme 'zenburn t)

(show-paren-mode 1)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#d44")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(use-package smart-mode-line
  :functions sml/apply-theme
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  (sml/apply-theme 'powerline))

(use-package flycheck
  :diminish flycheck-mode)
(use-package flyspell
  :diminish flyspell-mode
  :config
  (bind-key (kbd "C-;") nil flyspell-mode-map))

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

(use-package fill-column-indicator
  :init
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  :config
  (setq fci-rule-column 80)
  (setq fci-rule-width 3)
  (setq fci-rule-use-dashes 't))

(use-package dired-x)

(setq make-backup-files nil)

(make-directory "~/.emacs.d/auto-save" "~/.emacs.d")
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save/" t)))

(setq create-lockfiles nil)

(put 'narrow-to-region 'disabled nil)

(use-package expand-region
  :bind (("C-=" . er/expand-region)))
(use-package embrace)

(use-package iedit)
(use-package multiple-cursors
  :bind (("C-c ;" . mc/edit-lines)))

(use-package duplicate-thing
  :bind (("M-c" . duplicate-thing)))

(use-package move-text
  :bind (("M-S-<up>" . move-text-up)
         ("M-S-<down>" . move-text-down)))

(setq standard-indent 2)

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :functions aggressive-indent-global-mode
  :init
  (aggressive-indent-global-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'idris-mode))

(use-package org
  :config
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (setq org-src-fontify-natively t)
  (bind-key (kbd "S-<left>") nil org-mode-map)
  (bind-key (kbd "S-<right>") nil org-mode-map)
  (bind-key (kbd "S-<up>") nil org-mode-map)
  (bind-key (kbd "S-<down>") nil org-mode-map)
  (bind-key (kbd "C-c >") nil org-mode-map))

(use-package ivy
  :bind (("C-c C-r" . ivy-resume))
  :diminish ivy-mode
  :init
  (ivy-mode 1)
  (setq ivy-height 20)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package swiper
  :bind (("C-s" . swiper)))

(use-package counsel
  :bind (("M-y" . counsel-yank-pop)
         ("C-x C-f" . counsel-find-file)
         ("C-c k" . counsel-ag)))

(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package github-browse-file
  :bind (("C-c g" . github-browse-file)))

(use-package projectile
  :init (projectile-global-mode)
  :config
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :bind (("C-c C-p" . counsel-projectile)))

(use-package find-file-in-project
  :bind ("C-x f" . find-file-in-project))t

(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(global-set-key (kbd "s-3") '(lambda () (interactive) (insert "#")))

(windmove-default-keybindings)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

(global-set-key (kbd "C-c |") 'align-regexp)

(use-package guide-key
  :diminish guide-key-mode
  :init
  (guide-key-mode t)
  :config
  (setq guide-key/guide-key-sequence '("C-c r" "C-c p" "C-x r"))
  (setq guide-key/recursive-key-sequence-flag t))

(use-package ag
  :bind (("s-s" . ag-project))
  :config
  (setq ag-highlight-search t))

(use-package rbenv
  :defines rbenv-show-active-ruby-in-modeline
  :init
  (setq rbenv-show-active-ruby-in-modeline nil)
  (global-rbenv-mode)
  :config
  (rbenv-use-global))

(use-package yaml-mode)
(use-package bundler)

(use-package rubocop
  :diminish rubocop-mode)

(use-package rspec-mode)

(use-package seeing-is-believing
  :bind (:map ruby-mode-map
              ("C-c C-c" . seeing-is-believing-run-as-xmpfilter)))

(use-package ruby-mode
  :config
  (add-hook 'ruby-mode-hook (lambda ()
                              (if (rspec-buffer-is-spec-p)
                                  (rspec-mode)
                                (rspec-verifiable-mode))))
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  (add-hook 'ruby-mode-hook 'flycheck-mode)
  (add-hook 'ruby-mode-hook 'flyspell-prog-mode)
  (add-hook 'ruby-mode-hook 'electric-pair-mode)

  ;; Calm aggressive indent
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'ruby-mode)
         (string-match "\\b\\(def\\|class\\)\\b"
                       (thing-at-point 'line)))))

(use-package jc-ruby-extra
  :bind (:map ruby-mode-map
              ("C-c @" . jc-ruby-instance-variables)
              ("C-<tab>" . jc-align-hash)))

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/git/snippets"))
  (yas-global-mode 't)
  :config
  (setq yas-verbosity 0))

(use-package auto-compile
  :init
  (auto-compile-on-save-mode 1)
  (auto-compile-on-load-mode 1))

(setq ring-bell-function 'ignore)

(use-package toggle-quotes
  :bind (("C-'" . toggle-quotes)))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (set-variable 'ediff-split-window-function 'split-window-horizontally))

;; Disambiguate buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Jump between CamelCased words
(use-package subword
   :init (global-subword-mode t)
   :diminish subword-mode)

;; Human readable file sizes in dired
(setq dired-listing-switches "-alh")

;; Sentences do not need double spaces to end.  Period.
(set-default 'sentence-end-double-space nil)

;; Auto refresh buffers
(global-auto-revert-mode 1)

(setq ispell-dictionary "en_GB")
