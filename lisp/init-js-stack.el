(require-package 'js2-refactor)
(require-package 'tern)
(require-package 'tern-auto-complete)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(add-hook 'coffee-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(setenv "PATH" (concat "/usr/local/bin/node:" (getenv "PATH")))
(provide 'init-js-stack)
