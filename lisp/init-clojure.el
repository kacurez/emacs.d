;;CLOJURE STUFF
(require-package 'clojure-mode)
(require-package 'cider)
;(require-package 'ac-cider)
(setq nrepl-hide-special-buffers t)


;; REMOVED ac cider to speed up emacs init
;(require 'ac-cider)
;(add-hook 'cider-mode-hook 'ac-cider-setup)
;(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-mode))


;COMPANY mode setup
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;(add-hook 'cider-mode-hook 'ac-flyspell-workaround)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

(setenv "LEIN_JVM_OPTS" "-Xmx256m -Xms64m")

(provide 'init-clojure)
