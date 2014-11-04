;; delete form contents
(fset 'delete-form-contents
   "\225\C-k")

(global-set-key (kbd "C-t") 'delete-form-contents)

;(add-hook 'clojure-mode-hook
;          '(lambda ()
;             (define-key clojure-mode-map (kbd "C-t") 'delete-form-contents)))
