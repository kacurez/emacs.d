(require-package 'js2-refactor)
(require-package 'web-mode)
(require-package 'tern)
;(require-package 'jsx-mode)

;(require-package 'tern-auto-complete)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
; (add-hook 'js2-mode-hook #'jade-interaction-mode)

(add-hook 'web-mode-hook (lambda ()
                           (define-key web-mode-map (kbd "C-c C-e") 'web-mode-element-close)
                           (setq web-mode-enable-auto-closing nil)
                           (setq web-mode-enable-auto-pairing t)
                           (setq web-mode-content-types-alist
                                 '(("jsx" . "\\.js[x]?\\'")))
                           (setq web-mode-enable-auto-quoting nil)
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-attr-indent-offset 2)
                           (tern-mode t))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
          )

(add-hook 'coffee-mode-hook (lambda () (tern-mode t)))


;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;;(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)
;; (add-hook 'jsx-mode-hook 'highlight-symbol-mode )
;; (add-hook 'jsx-mode-hook 'highlight-symbol-nav-mode )


;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(setq js-indent-level 2)



;Highlight current HTML element (see web-mode-current-element-highlight-face)
(setq web-mode-enable-current-element-highlight nil)

;You can also highlight the current column with
(setq web-mode-enable-current-column-highlight t)


(setenv "PATH" (concat "/usr/local/bin/node:" (getenv "PATH")))


(provide 'init-js-stack)
