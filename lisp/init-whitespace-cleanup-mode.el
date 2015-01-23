(require-package 'whitespace-cleanup-mode)
;(require 'whitespace-cleanup-mode)
;;(setq whitespace-mode t)
;;(setq global-whitespace t)
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(setq whitespace-action '(auto-cleanup))

;;(global-whitespace-cleanup-mode t)

;; automatically clean up bad whitespace

;; only show bad whitespace


;;white space cleanup action
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'init-whitespace-cleanup-mode)
