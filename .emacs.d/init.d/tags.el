;; Just reload the tags file already
(setq tags-revert-without-query 1)

;; Try to search through parent directories for a tags file when opening a ruby file
(defun find-file-upwards (file-to-find)
  "Recursively searches each parent directory starting from the default-directory.
looking for a file with name file-to-find.  Returns the path to it
or nil if not found."
  (cl-labels
      ((find-file-r (path)
                    (let* ((parent (file-name-directory path))
                           (possible-file (concat parent file-to-find)))
                      (cond
                       ((file-exists-p possible-file) possible-file) ; Found
                       ;; The parent of ~ is nil and the parent of / is itself.
                       ;; Thus the terminating condition for not finding the file
                       ;; accounts for both.
                       ((or (null parent) (equal parent (directory-file-name parent))) nil) ; Not found
                       (t (find-file-r (directory-file-name parent))))))) ; Continue
    (find-file-r default-directory)))

(add-hook 'enh-ruby-mode-hook (lambda ()
				(let ((my-tags-file (find-file-upwards "TAGS")))
				  (when my-tags-file
				    (message "Loading tags file: %s" my-tags-file)
				    (visit-tags-table my-tags-file)))
				))
