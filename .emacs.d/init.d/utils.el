(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun touch ()
     "updates mtime on the file for the current buffer"
     (interactive)
     (shell-command (concat "touch " (shell-quote-argument (buffer-file-name))))
     (message (concat "Touched " (buffer-file-name)))
     (clear-visited-file-modtime))
(global-set-key (kbd "C-x t") 'touch)

;; Does xkcd count as a utility?
(jc-ensure-package 'xkcd)
(require 'xkcd)
