(require-package 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'git)
(setq projectile-completion-system 'ido)
(setq projectile-remember-window-configs t)
(global-set-key (kbd "C-c h") 'projectile-find-file)
(setq projectile-enable-caching t)

(provide 'init-projectile)
