(setq jc-init-dir "~/.emacs.d/init.d")
(if (file-exists-p jc-init-dir)
    (dolist (file (directory-files jc-init-dir t "\.elc$"))
      (load file)))
