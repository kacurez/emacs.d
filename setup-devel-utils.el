 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: rebox2             ;;
;;                             ;;
;; GROUP: Convenience -> Rebox ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)
(add-hook 'prog-mode-hook (lambda ()
			    (set (make-local-variable 'rebox-style-loop) '(25 17 21))
			    (set (make-local-variable 'rebox-min-fill-column) 40)
			    (rebox-mode 1)))

(require 'auto-complete-config)
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paredit config                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)



;; rainbow delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
