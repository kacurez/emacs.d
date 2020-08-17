(require-package 'js2-refactor)
(require-package 'web-mode)
(require-package 'prettier-js)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook (lambda ()
                           (define-key web-mode-map (kbd "C-c C-e") 'web-mode-element-close)
                           (setq web-mode-enable-auto-closing nil)
                           (setq web-mode-enable-auto-pairing t)
                           (setq web-mode-content-types-alist
                                 '(("jsx" . "\\.js[x]?\\'")))
                           (setq web-mode-enable-auto-quoting nil)
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-attr-indent-offset 2)
                           ;; (enable-minor-mode '("\\.jsx?\\'" . prettier-js-mode))

                           ;; (tern-mode t)
                           (smartparens-mode))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
          ;; (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
          )

(setq prettier-js-args '(
                         "--single-quote" "true"
                         ))

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
