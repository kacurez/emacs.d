;;setup PROJECTILE
(projectile-global-mode)
(setq projectile-indexing-method 'git)
(setq projectile-completion-system 'ido)
(setq projectile-remember-window-configs t)
(setq projectile-enable-caching t)
(require 'ggtags)

;;HELM
;;(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-c h") 'projectile-find-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET AND ECB                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load "cedet.el")
;; (require 'cedet)
;; (require 'semantic)
;; (require 'semantic/sb)

;; (global-ede-mode 1)                  ; do NOT use project manager

;; (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
;; (semantic-mode 1)

;; (require 'ecb)
;; (defun cedet-hook ()

;;     (add-to-list 'ac-sources 'ac-source-semantic)
;; ) ; defun alexott/cedet-hook ()


;; if you want to enable support for gnu global
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when (cedet-gnu-global-version-check t)                  ;;
;;   (semanticdb-enable-gnu-global-databases 'php-mode)      ;;
;;   (semanticdb-enable-gnu-global-databases 'clojure-mode)) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
