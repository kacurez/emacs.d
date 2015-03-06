;;CLOJURE STUFF
(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'ac-cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)


(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(setenv "LEIN_JVM_OPTS" "-Xmx256m -Xms64m")

(provide 'init-clojure)
