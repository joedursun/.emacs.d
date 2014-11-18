(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar custom-files '("~/.emacs.d/window-size.el"
                       "~/.emacs.d/pair-options.el"
                       "~/.emacs.d/user.el"
                       "~/.emacs.d/macros.el"
                       "~/.emacs.d/key-bindings.el"))

(dolist (file custom-files)
  (when (file-exists-p  file)
  (load file)))

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/local/bin") exec-path))
