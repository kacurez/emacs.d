(require-package 'company)
(require-package 'company-quickhelp)


(company-quickhelp-mode 1)

;;(add-to-list 'company-backends 'company-tern)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
