(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-S-<up>") 'move-line-up)
(global-set-key (kbd "M-S-<down>") 'move-line-down)

(paradox-require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)