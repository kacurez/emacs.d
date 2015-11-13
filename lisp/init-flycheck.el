(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.8)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(require 'flycheck)
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
     '(javascript-jshint))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
     '(json-jsonlist))


(provide 'init-flycheck)
