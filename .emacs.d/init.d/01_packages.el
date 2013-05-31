(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun jc-ensure-package (packageName)
  "Install a package if it is not already installed"
  (when (not (package-installed-p packageName))
      (package-refresh-contents)
      (package-install packageName)))
