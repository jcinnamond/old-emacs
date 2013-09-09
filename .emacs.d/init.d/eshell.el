(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end nil)

(add-hook 'eshell-mode-hook (lambda()
			      (eshell-smart-initialize)))

(defun clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (comint-send-input)))

(jc-ensure-package 'esh-buf-stack)
(require 'esh-buf-stack)
(setup-eshell-buf-stack)
(add-hook 'eshell-mode-hook (lambda()
			      (local-set-key (kbd "M-q") 'eshell-push-command)))

(jc-ensure-package 'shell-switcher)
(require 'shell-switcher)
(setq shell-switcher-mode t)
