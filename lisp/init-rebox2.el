(require-package 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)
(add-hook 'prog-mode-hook (lambda ()
			    (set (make-local-variable 'rebox-style-loop) '(25 17 21))
			    (set (make-local-variable 'rebox-min-fill-column) 40)
			    (rebox-mode 1)))

(provide 'init-rebox2)
