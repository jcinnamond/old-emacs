(defvar pluralsight-state nil "indicates whether pluralsight settings are on")

(defun pluralsight ()
  "Toggle pluralsight settings"
  (interactive)
  (if pluralsight-state
      (pluralsight/off)
    (pluralsight/on)))

(defun pluralsight/off ()
  (set-face-attribute 'default nil :height 150)
  (setq pluralsight-state nil))

(defun pluralsight/on ()
  (set-face-attribute 'default nil :height 240)
  (setq pluralsight-state 't))
