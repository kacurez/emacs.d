;;CLOJURE STUFF
(require-package 'clojure-mode)
(require-package 'cider)
;(require-package 'ac-cider)
(setq nrepl-hide-special-buffers t)
(require-package 'clj-refactor)
(require-package 'flycheck-clj-kondo)

(defun clojure-mode-refactor-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

;; REMOVED ac cider to speed up emacs init
;(require 'ac-cider)
;(add-hook 'cider-mode-hook 'ac-cider-setup)
;(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-mode))


;COMPANY mode setup
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'clojure-mode-refactor-hook)

;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;(add-hook 'cider-mode-hook 'ac-flyspell-workaround)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

(setenv "LEIN_JVM_OPTS" "-Xmx256m -Xms64m")

(defun cljfmt ()
  (when (or (eq major-mode 'clojure-mode)
            (eq major-mode 'clojurescript-mode))
    (shell-command-to-string (format "/Users/tomaskacur/devel/clojure/cljfmt/cljfmt/target/cljfmt fix %s" buffer-file-name))
    (revert-buffer :ignore-auto :noconfirm)))

(add-hook 'after-save-hook #'cljfmt)
;;; (remove-hook 'after-save-hook #'cljfmt)

(require 'flycheck-clj-kondo)
(dolist (checker '(clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn))
  (setq flycheck-checkers (cons checker (delq checker flycheck-checkers))))

(provide 'init-clojure)
