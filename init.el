;; (let ((benchmark-init.el (expand-file-name "elpa/benchmark-init-20141004.609/benchmark-init.el"  user-emacs-directory) ))
;;   (load benchmark-init.el))

(set-language-environment "UTF-8")

;; No splash screen
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "tomaskacur")

(defun display-startup-echo-area-message ()
  (message (concat "Loaded in " (emacs-init-time))))


;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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
(require-package 'smooth-scrolling)

(require 'init-key-chord)
(require 'init-ido)
(require 'init-ace-jump) ;and ace-window
(require 'init-guide-key)
(require 'init-hippie-expand)
(require 'init-dired)
(require 'init-dash)

(require 'init-hightlight)

(require 'init-volatile-highlights)
(require 'init-undo-tree)
(require 'init-multiple-cursors)

(require 'init-rainbow-mode)

;;devel
(require 'init-rebox2)
(require 'init-autocomplete)
(require 'init-paredit)
(require 'init-rainbow-delimiters)
(require 'init-flycheck)     ;; check syntax errors

(require 'init-html)
(require 'init-coffee-mode)
(require 'init-js-stack)
(require 'init-whitespace-cleanup-mode)

(require 'init-projectile)
(require 'init-helm);;helm and projectile-helm and helm-git-grep

(require 'init-git)

(require 'init-clojure)

(require 'init-editing)

(require 'init-others)
(require 'init-bookmarks-plus)
(require 'init-themes)
					;,---------------------------------------------------------
					;| install packages that dont require special configuration
					;`---------------------------------------------------------

(require-package 'tramp-term)
(require-package 'restclient)

(require-package 'visual-regexp)
(require-package 'highlight-escape-sequences)



(require-package 'yasnippet)    ;; code snippets and templates
(require-package 'smartparens)
(require-package 'ggtags)
(require-package 'company)
(require-package 'php-mode)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;; set the scratch buffer to be in text-mode and empty
(setq initial-major-mode (quote text-mode))
(setq initial-scratch-message nil)


;;CUSTOM.EL
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(if (file-exists-p custom-file)
    (load custom-file))

;;OSX stuff
(toggle-frame-maximized)
;;(put 'dired-find-alternate-file 'disabled nil)
