(paradox-require 'magit)
(paradox-require 'gitconfig-mode)
(paradox-require 'gitignore-mode)
(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-last-seen-setup-instructions "1.4.0")

(paradox-require 'github-browse-file)
(global-set-key (kbd "C-c g") 'github-browse-file)

(paradox-require 'gist)

(defcustom git-clone-executable magit-git-executable
  "Command used to run git clone")

(defcustom git-clone-default-dir (expand-file-name "~/git")
  "Default directory for cloning new repos into")

(defun git-clone (repo dir)
  "Clone out a git project"
  (interactive (list (read-string "Repository url: " "git@github.com:")
		     (read-directory-name "Target directory: " git-clone-default-dir)))
  (message (concat "Cloning " repo " into " dir))
  (let ((clone-dir (git-clone-and-return-path repo dir)))
    (magit-status (file-name-as-directory clone-dir))))

(defun git-clone-and-return-path (repo dir)
  (let* ((default-directory (file-name-as-directory dir))
	 (clone-command (concat git-clone-executable " clone " repo))
	 (output (shell-command-to-string clone-command)))
    (string-match "'\\([^']+\\)'" output)
    (concat (file-name-as-directory dir) (match-string 1 output))))

(global-set-key (kbd "C-M-g") 'git-clone)
