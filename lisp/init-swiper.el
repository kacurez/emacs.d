(require-package 'avy)
(require-package 'swiper)

(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key [f6] 'ivy-resume)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(add-to-list
 'ivy-sort-functions-alist
 '(projectile-switch-project . nil)

 )

(add-to-list
 'ivy-sort-functions-alist
 '(projectile-find-file . nil)
 )



(provide 'init-swiper)
