(defvar big-state nil "indicates whether big settings are on")

(defun big ()
  "Toggle big settings"
  (interactive)
  (if big-state
      (big/off)
    (big/on)))

(defun big/off ()
  (set-face-attribute 'default nil :height 150)
  (setq big-state nil))

(defun big/on ()
  (set-face-attribute 'default nil :height 240)
  (setq big-state 't))
