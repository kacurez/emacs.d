(require-package  'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(add-hook 'prog-mode-hook 'highlight-symbol-mode )
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

(provide 'init-hightlight)
