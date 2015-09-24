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

;; Quote swapping

(defun jc-toggle-quotes ()
  (interactive)
  (case (jc--guess-string-type)
    ('single-quote (jc-use-double-quotes))
    ('double-quote (jc-use-single-quotes))))

(defun jc-use-double-quotes ()
  (interactive)
  (jc--replace-wrapping-char "'" "\""))

(defun jc-use-single-quotes ()
  (interactive)
  (jc--replace-wrapping-char "\"" "'"))

(defun jc--replace-wrapping-char (quote replacement)
  (let ((opening (jc--find-backward-in-line (jc--avoid-escape quote)))
	(closing (jc--find-forward-in-line (jc--avoid-escape quote))))
    (if (and opening closing)
	(progn
	  (jc--replace-at-point opening replacement)
	  (jc--replace-at-point closing replacement)
	  (jc--escape (+ 1 opening) closing replacement)
	  (jc--unescape (+ 1 opening) closing (jc--alternative-to replacement)))
      (message (concat "point is not between " quote)))))

(defun jc--replace-at-point (pos replacement)
  (save-excursion
    (goto-char pos)
    (delete-char 1)
    (insert replacement)))

(defun jc--find-backward-in-line (pattern)
  (save-excursion
    (if (re-search-backward pattern (line-beginning-position) t)
	(match-beginning 1))))

(defun jc--find-forward-in-line (pattern)
  (save-excursion
    (if (re-search-forward pattern (line-end-position) t)
	(match-beginning 1))))

(defun jc--guess-string-type ()
  (let ((possible (jc--find-nearest-quote)))
    (if possible
	(if (jc--find-forward-in-line (jc--avoid-escape possible))
	    (jc--quote-to-identifier possible))
      (let ((alternative (jc--alternative-to possible)))
	(if (jc--find-forward-in-line alternative)
	    (jc--quote-to-identifier alternative))))))

(defun jc--find-nearest-quote ()
  (jc--find-backward-in-line (jc--avoid-escape "['\"]"))
  (match-string-no-properties 1))

(defun jc--quote-to-identifier (sym)
  (if (string-equal sym "'")
      'single-quote
    (if (string-equal sym "\"")
	'double-quote)))

(defun jc--alternative-to (sym)
  (if (string-equal sym "'")
      "\""
    (if (string-equal sym "\"")
	"'")))

(defun jc--escape (start end chr)
  (save-excursion
    (goto-char start)
    (while (search-forward chr end t)
      (replace-match (concat "\\" chr) nil t))))

(defun jc--unescape (start end chr)
  (save-excursion
    (goto-char start)
    (while (search-forward (concat "\\" chr) end t)
      (replace-match chr nil t))))

(defun jc--avoid-escape (pat)
  (concat "\\(?:^\\|[^\\]\\)\\(" pat "\\)"))

;; Keybindings

(defun jc-ruby--setup-keys ()
  (dolist (map (list ruby-mode-map))
    (define-key map (kbd "C-c @") 'jc-ruby-instance-variables)
    (define-key map (kbd "C-<tab>") 'jc-align-hash)
    (define-key map (kbd "C-c '>") 'jc-toggle-quotes)))

(eval-after-load 'ruby-mode '(jc-ruby--setup-keys))
