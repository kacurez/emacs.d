(require-package 'magit)
(require-package 'git-commit)
(require-package 'gitconfig-mode )
(require-package 'gitignore-mode)
(require-package 'git-timemachine)

(global-set-key (kbd "C-c m") 'magit-status)
(provide 'init-git)
