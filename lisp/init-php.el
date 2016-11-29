(require-package 'php-mode)
(require-package 'company-php)
(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend )))

(provide 'init-php)
