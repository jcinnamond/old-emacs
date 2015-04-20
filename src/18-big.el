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
  (setq enh-ruby-check-syntax 'errors-and-warnings)

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
  (setq enh-ruby-check-syntax nil)

  ;; Remember mode line configuration so we can restore it later
  (setq big-previous-mode-line-format mode-line-format)

  ;; Hide distractions in the mode line
  (display-battery-mode 0)
  (display-time-mode 0)
  (column-number-mode 0)
  (line-number-mode 0)
  (setq-default mode-line-format "Emacs: %m")
  (setq mode-line-format "Emacs: %m"))
