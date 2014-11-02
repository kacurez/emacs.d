(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)

(require 'icomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ac-nrepl) (add-hook 'cider-repl-mode-hook          ;;
;; 'ac-nrepl-setup) (add-hook 'cider-mode-hook 'ac-nrepl-setup) ;;
;; (eval-after-load "auto-complete" '(add-to-list 'ac-modes     ;;
;; 'cider-repl-mode))                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
