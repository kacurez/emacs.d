;;IDO  SETUP
(require-package 'flx-ido)
(require-package 'ido-at-point)
(require-package 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)

;;vertical ido setup
(require-package 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'init-ido)
