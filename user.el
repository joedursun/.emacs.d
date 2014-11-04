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
                      flymake-ruby
                      flx-ido
                      textmate
                      ag))

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'projectile)
(require 'better-defaults)
(require 'smart-tab)
(require 'company)
(require 'textmate)

;; Ruby
(require 'flymake-ruby)
(require 'ruby-end)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

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
(set-default-font "Inconsolata 16")

(remove-hook 'text-mode-hook 'turn-on-flyspell)
;(split-window-right)
(textmate-mode)

;; Silver searcher
(setq ag-reuse-buffers 't)

;; Projectile
(setq projectile-switch-project-action 'projectile-dired)
(projectile-global-mode)
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-t] 'projectile-find-file)

;; key bindings
(global-set-key (kbd "C-b") 'backward-kill-word)
(global-set-key (kbd "C-f") 'ag)
(global-set-key (kbd "s-f") 'replace-string)
