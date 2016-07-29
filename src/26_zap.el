(defun zap-rest-of-buffer ()
  (interactive)
  (delete-char (- (point-max) (point))))

(global-set-key (kbd "C-M-z") 'zap-rest-of-buffer)
