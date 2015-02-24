(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(require 'maxframe)
(setq mf-max-width 1680)  ;; Pixel width of main monitor.
(add-hook 'window-setup-hook 'maximize-frame t)

(defvar custom-files '("~/.emacs.d/user.el"
                       "~/.emacs.d/macros.el"
                       "~/.emacs.d/key-bindings.el"
                       "~/.emacs.d/code-navigation.el"
                       "~/.emacs.d/pair-options.el"
                       "~/.emacs.d/oracle.el"
                       "~/.emacs.d/python.el"))

(dolist (file custom-files)
  (when (file-exists-p  file)
  (load file)))


(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(setenv "PATH" (concat "/usr/local/bin:/Users/jdursun/go/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/local/bin") exec-path))
(setenv "GOPATH" "/Users/jdursun/go")
(global-auto-revert-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay nil)
 '(elpy-rpc-backend "rope")
 '(elpy-rpc-python-command "/Users/jdursun/.pyenv/shims/python")
 '(python-check-command "/Users/jdursun/.pyenv/shims/pyflakes")
 '(smart-tab-completion-functions-alist
   (quote
    ((emacs-lisp-mode . company-complete)
     (text-mode . dabbrev-completion)
     (clojure-mode . company-complete)
     (cider-repl-mode . company-complete)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
