(set-language-environment "UTF-8")
;; No splash screen
(setq inhibit-startup-message t)
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
;;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-package 'wgrep)
(require-package 'diminish)

(require 'init-key-chord)
(require 'init-ido)
(require 'init-ace-jump)
(require 'init-guide-key)
(require 'init-hippie-expand)
(require 'init-dired)
(require 'init-dash)
(require 'init-themes)

(require 'init-volatile-highlights)
(require 'init-undo-tree)
(require 'init-rainbow-mode)

;;devel
(require 'init-rebox2)
(require 'init-autocomplete)
(require 'init-paredit)
(require 'init-rainbow-delimiters)


(require 'init-coffee-mode)
(require 'init-whitespace-cleanup)

(require 'init-projectile)
(require 'init-helm);;helm and projectile-helm

(require 'init-git)

(require 'init-clojure)

(require 'init-editing)

(require 'init-others)


;,---------------------------------------------------------
;| install packages that dont require special configuration
;`---------------------------------------------------------

(require-package 'tramp-term)
(require-package 'restclient)

(require-package 'visual-regexp)
(require-package 'highlight-escape-sequences)


(require-package 'flycheck)     ;; check syntax errors
(require-package 'yasnippet)	;; code snippets and templates
(require-package 'smartparens)
(require-package 'ggtags)
(require-package 'company)
(require-package 'php-mode)


;;CUSTOM.EL 
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
(load custom-file))

;;OSX stuff
(toggle-frame-maximized)
