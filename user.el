;; Rebind keys
;;(when (eq system-type 'darwin)
;;  (setq mac-command-modifier 'meta)
;;  (setq mac-option-modifier 'super))

;; Stu's init.el
;; https://gist.github.com/stuarth/98e5d6ad473d294e4037
(require 'linum)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)

(auto-compression-mode 1)
(add-hook 'prog-mode-hook #'paredit-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults
                      cljsbuild-mode
                      clojure-mode
                      company
                      dash
                      elisp-slime-nav
                      find-file-in-project
                      idle-highlight-mode
                      ido-ubiquitous
                      magit
                      paredit
                      projectile
                      projectile-rails
                      ruby-end
                      slim-mode
                      smart-tab
                      starter-kit-lisp
                      flymake-ruby
                      flx-ido))

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'better-defaults)
(require 'smart-tab)
(require 'company)

;; Ruby
(require 'flymake-ruby)
(require 'ruby-end)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(custom-set-variables
 '(company-idle-delay nil)
 '(smart-tab-completion-functions-alist
   '((emacs-lisp-mode . company-complete)
     (text-mode . dabbrev-completion)
     (clojure-mode . company-complete)
     (cider-repl-mode . company-complete))))

(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-use-clojure-font-lock nil)
(setq inferior-lisp-command "lein repl"
      cider-repl-popup-stacktraces t)
(setq nrepl-hide-special-buffers t)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

;; railscasts theme
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(color-theme-railscasts)

(remove-hook 'text-mode-hook 'turn-on-flyspell)
(split-window-right)
