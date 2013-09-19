(jc-ensure-package 'go-mode)
(jc-ensure-package 'go-autocomplete)

(require 'go-mode)
(add-hook 'go-mode-hook (lambda()
			  (setq tab-width 4)
			  (local-set-key (kbd "M-.") 'godef-jump)))

(defun go-test ()
  "Run Go test for the current project"
  (interactive)
  (compile "go test"))

(defun go-run-file ()
  "Run the current file with 'go run'"
  (interactive)
  (save-buffer)
  (compile (concat "echo; go run " buffer-file-name)))

(defun go-run-godoc-server ()
  "Run godoc as a server on port 6060"
  (interactive)
  (start-process "godoc" "*godoc*" "godoc" "-http=:6060")
  (message "godoc started"))

(define-key go-mode-map (kbd "C-c C-g t") 'go-test)
(define-key go-mode-map (kbd "C-c C-g r") 'go-run-file)
(define-key go-mode-map (kbd "C-c C-g f") 'gofmt)
(define-key go-mode-map (kbd "C-c C-g d") 'go-run-godoc-server)

(defvar go-playground-dir (concat (getenv "GOPATH") "/src/playground")
  "The directory to use when creating Go playground files")

(defun go-ensure-playground-dir ()
  "Creates the playground directory (if necessary) and returns the path"
  (if (file-exists-p go-playground-dir) () (make-directory go-playground-dir)))

(defun go-create-playground ()
  "Creates a new temporary file with a skeletal Go application"
  (interactive)
  (let ((filename (concat go-playground-dir "/" (make-temp-name "go-play-") ".go")))
    (go-ensure-playground-dir)
    (find-file filename)
    (rename-buffer (generate-new-buffer-name "Go Playground"))
    (insert (concat "package main\n\nimport (\n\t\"fmt\"\n)\n\nfunc main() {\n\tfmt.Println(\"This file is located in " filename "\")\n}"))
    (save-buffer)
    (forward-line -1)
    (end-of-line)
    (insert "\n\t")
    (go-mode)))

(defun go-switch-to-playground ()
  "Switch to Go Playground buffer, creating if necessary"
  (interactive)
  (let ((playground (get-buffer "Go Playground")))
    (if playground
	(switch-to-buffer playground)
      (go-create-playground))))

(global-set-key (kbd "C-c C-g p") 'go-switch-to-playground)
(global-set-key (kbd "C-c C-g n") 'go-create-playground)

(setenv "GOPATH" "/Users/jcinnamond/go")

(require 'compile)
(add-to-list 'compilation-error-regexp-alist 'go-test)
(add-to-list 'compilation-error-regexp-alist-alist
	     '(go-test . ("^\t+\\([^()\t\n]+\\):\\([0-9]+\\):? .*$" 1 2)) t)

(add-hook 'before-save-hook 'gofmt-before-save)
