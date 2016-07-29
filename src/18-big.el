(defvar big-state nil "indicates whether big settings are on")

(defun big ()
  "Toggle big settings"
  (interactive)
  (if big-state
      (big/off)
    (big/on)))

(defun big/off ()
  (set-face-attribute 'default nil :height 150)
  (setq big-state nil)

  ;; Replace helpful highlighting
  (add-hook 'ruby-mode-hook 'flycheck-mode)
  (add-hook 'ruby-mode-hook 'flycheck-prog-mode)

  ;; Re-enable distractions in the mode line
  (display-battery-mode 1)
  (display-time-mode 1)
  (column-number-mode 1)
  (line-number-mode 1)
  (setq-default mode-line-format big-previous-mode-line-format)
  (setq mode-line-format big-previous-mode-line-format))

(defun big/on ()
  (set-face-attribute 'default nil :height 240)
  (setq big-state t)

  ;; Remove helpful highlighting
  (whitespace-mode 0)
  (remove-hook 'ruby-mode-hook 'flycheck-mode)
  (remove-hook 'ruby-mode-hook 'flycheck-prog-mode)

  ;; Remember mode line configuration so we can restore it later
  (setq big-previous-mode-line-format mode-line-format)

  ;; Hide distractions in the mode line
  (display-battery-mode 0)
  (display-time-mode 0)
  (column-number-mode 0)
  (line-number-mode 0)
  (setq-default mode-line-format "Emacs: %m")
  (setq mode-line-format "Emacs: %m"))


;;----------------------------------------------------------------------

(defvar pair-state nil "indicates whether pair settings are on")

(defun pair ()
  "Toggle pair programming settings"
  (interactive)
  (if pair-state
      (pair/off)
    (pair/on)))

(defun pair/off ()
  (set-face-attribute 'default nil :height 150)
  (setq pair-state nil)

  (global-linum-mode nil)
  (linum-mode -1)
  (load-theme 'zenburn)

  (display-battery-mode 1)
  (display-time-mode 1)
  (column-number-mode 1)
  (line-number-mode 1)

  (setq-default mode-line-format pair-previous-mode-line-format)
  (setq mode-line-format pair-previous-mode-line-format))

(defun pair/on ()
  (load-theme 'manoj-dark)

  (set-face-attribute 'default nil :height 180)
  (setq pair-state t)

  (global-linum-mode t)

  ;; Remember mode line configuration so we can restore it later
  (setq pair-previous-mode-line-format mode-line-format)

  ;; Hide distractions in the mode line
  (display-battery-mode 0)
  (display-time-mode 0)
  (column-number-mode 0)
  (line-number-mode 0)
  (setq-default mode-line-format "%f")
  (setq mode-line-format "%f"))
