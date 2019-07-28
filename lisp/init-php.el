(require-package 'php-mode)
(require-package 'company-php)
(add-hook 'php-mode-hook
          '(lambda ()
             (company-mode t)))

(provide 'init-php)
