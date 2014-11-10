(require-package 'whitespace-cleanup-mode)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace

(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;;white space cleanup action
;;(setq global-whitespace t)
;;(setq global-whitespace-mode-cleanup-mode 1)
;;(setq whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup-mode)

(provide 'init-whitespace-cleanup)
