;; delete form contents
(fset 'delete-form-contents
   "\225\C-k")

(global-set-key (kbd "C-t") 'delete-form-contents)
