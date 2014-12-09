(require 'linum)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(setq skeleton-pair t)

(auto-compression-mode 1)

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
                      ag
                      go-mode
                      go-projectile
                      multiple-cursors
                      perspective
                      persp-projectile
                      yasnippet
                      ace-jump-mode))

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'textmate)
(require 'projectile)
(require 'better-defaults)
(require 'smart-tab)
(require 'company)
(require 'multiple-cursors)

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
(require 'ag)
(setq ag-reuse-buffers 't)
(setq ag-arguments (append '("-C 2") ag-arguments))

;; Projectile
(setq projectile-switch-project-action 'projectile-dired)
(projectile-global-mode)
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-t] 'projectile-find-file)
(define-key projectile-mode-map [?\s-f] 'ag-project-regexp)

;; dired
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "<mouse-2>") 'dired-find-alternate-file)
(put 'dired-find-alternate-file 'disabled nil)

;; ace-jump-mode
(setq ace-jump-mode-gray-background t)

(setq make-backup-files nil) ; no more backup~ files
(setq auto-save-default nil) ; no more #auto-save# files

(persp-mode)
(require 'persp-projectile)

;; Yasnippet
(yas-global-mode 1)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))

;; reference material
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html
;; http://ergoemacs.org/emacs/elisp.html
;; https://github.com/emacs-tw/awesome-emacs <- list of useful packages
