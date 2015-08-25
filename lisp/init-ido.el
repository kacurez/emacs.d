;;IDO  SETUP
(require-package 'flx-ido)
(require-package 'ido-at-point)
(require-package 'ido-ubiquitous)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)



(require-package 'smex) ; Not needed if you use package.el
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;vertical ido setup
(require-package 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'init-ido)
