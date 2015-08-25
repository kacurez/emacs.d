(require-package 'js2-refactor)
(require-package 'tern)
(require-package 'jsx-mode)
;(require-package 'tern-auto-complete)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))


(add-hook 'coffee-mode-hook (lambda () (tern-mode t)))


(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(add-hook 'jsx-mode-hook 'highlight-symbol-mode )
(add-hook 'jsx-mode-hook 'highlight-symbol-nav-mode )

(setenv "PATH" (concat "/usr/local/bin/node:" (getenv "PATH")))
(provide 'init-js-stack)
