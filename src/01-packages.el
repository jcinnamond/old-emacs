;; Install Paradox for all of this to work
(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Bootstrap the load path
(eval-and-compile
  (let ((default-directory "~/.emacs.d/elpa"))
    (normal-top-level-add-subdirs-to-load-path))
  (add-to-list 'load-path "~/.emacs.d/compiled"))

(require 'paradox)
(add-to-list 'load-path "~/.emacs.d/compiled/")
