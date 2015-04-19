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

  ;; Re-enable distractions in the mode line
  (display-battery-mode 1)
  (display-time-mode 1)
  (column-number-mode 1)
  (line-number-mode 1)
  (setq mode-line-format big-previous-mode-line-format))

(defun big/on ()
  (set-face-attribute 'default nil :height 240)
  (setq big-state t)

  ;; Remember mode line configuration so we can restore it later
  (setq big-previous-mode-line-format mode-line-format)

  ;; Hide distractions in the mode line
  (display-battery-mode 0)
  (display-time-mode 0)
  (column-number-mode 0)
  (line-number-mode 0)
  (setq mode-line-format "%m"))
