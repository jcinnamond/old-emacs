;; Alignment for hashes
(defun jc-align-hash-old-style-p (string)
  (if (string-match "=>" string)
      't
    nil))

(defun jc-align-hash-old-style ()
  (message "aligning old")
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=>")
  (message "aligned old"))

(defun jc-align-hash-new-style ()
  (align-regexp (region-beginning) (region-end) ":\\(\\s-*\\)" 1 1 nil)
  (message "aligned new"))

(defun jc-align-hash ()
  (interactive)
  (if (region-active-p)
      (let ((selection (buffer-substring-no-properties (region-beginning) (region-end))))
	(if (jc-align-hash-old-style-p selection)
	    (jc-align-hash-old-style)
	(jc-align-hash-new-style)))
  (message "jc-align-hash requires an active mark")))

;; Create instance variables from method params
(defun jc-ruby-instance-variables ()
  "Creates an assignment to an instance variables for each method param"
  (interactive)
  (dolist (p (jc-ruby-extract-params))
    (insert (concat "@" p " = " p))
    (newline-and-indent))
  (delete-blank-lines))

(defun jc-ruby-extract-params ()
  (jc-ruby-param-seq (jc-ruby-param-string (jc-ruby-method-header))))

(defun jc-ruby-param-seq (str)
  (let (params)
    (dolist (s (split-string str ","))
      (push (s-trim s) params))
    (reverse params)))

(defun jc-ruby-param-string (str)
  (string-match "(\\([^)]*\\)" str)
  (if (match-beginning 1)
      (substring str (match-beginning 1) (match-end 1))
    ""))

(defun jc-ruby-method-header ()
  (save-excursion
    (ruby-beginning-of-defun)
    (let ((p (point)))
	  (end-of-line)
	  (buffer-substring-no-properties p (point)))))

(defun jc-ruby--setup-keys ()
  (dolist (map (list ruby-mode-map enh-ruby-mode-map))
    (define-key map (kbd "C-c @") 'jc-ruby-instance-variables)
    (define-key map (kbd "C-<tab>") 'jc-align-hash)))

(eval-after-load 'ruby-mode '(jc-ruby--setup-keys))
