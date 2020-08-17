;; (let ((benchmark-init.el (expand-file-name "elpa/benchmark-init-20141004.609/benchmark-init.el"  user-emacs-directory) ))
;;   (load benchmark-init.el))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               ;(43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               ;(45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               ;(46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               ;(63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; No splash screen
;;(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "tomaskacur")
(setq fancy-about-text nil)
(defun fancy-startup-tail (&optional concise)
 (fancy-splash-insert )
 )
(setq fancy-startup-text nil)
(setq fancy-splash-image (expand-file-name "geko.jpg" user-emacs-directory))

(defun display-startup-echo-area-message ()
  (message (concat "Loaded in " (emacs-init-time))))


;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path "~/.emacs.d/lisp/cc-mode-5.33/")

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
;;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
;;(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-package 'wgrep)
(require-package 'diminish)

(tooltip-mode nil)
(setq tooltip-use-echo-area t)

(require 'init-scrolling)

(require 'init-key-chord)
(require 'init-ido)
(require 'init-swiper)
(require 'init-ace-jump) ;and ace-window
(require 'init-guide-key)
(require 'init-hippie-expand)
(require 'init-dired)
(require 'init-dash)

(require 'init-hightlight)
(require 'init-undo-tree)
(require 'init-multiple-cursors)

;;devel

(require 'init-company-mode)
(require 'init-paredit)

(require 'init-js-stack)
(require 'init-flycheck)     ;; check syntax errors
(require 'init-html)
(require 'init-coffee-mode)
(require 'init-whitespace-cleanup-mode)

(require 'init-projectile)

(require 'init-helm);;helm and projectile-helm and helm-git-grep
(require 'init-git)
(require 'init-clojure)
(require 'init-editing)
(require 'init-others)
(require 'init-bookmarks)
; (require 'init-spotlight) ;only for OSX

(require 'init-markdown-mode)
(require 'init-json)
(require 'init-elm)

(require 'init-themes)

;;(require 'jade)
(require 'init-php)
(require 'init-docker)
(require 'init-yaml)

;,---------------------------------------------------------
;| install packages that dont require special configuration
;`---------------------------------------------------------

(require-package 'tramp-term)
;;(require-package 'restclient) melpa problem installing?

(require-package 'visual-regexp)
(require-package 'highlight-escape-sequences)

(require-package 'yasnippet)    ;; code snippets and templates
(require-package 'smartparens)
(require-package 'ggtags)
(require-package 'general-close)
(require-package 'list-processes+)
(require-package 'kubernetes)
(require-package 'draft-mode)

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

;; allow risky variable older eslint for kbc-ui project
(add-to-list 'safe-local-variable-values '(flycheck-javascript-eslint-executable . "/Users/tomaskacur/keboola/devel/kbc-ui/node_modules/eslint/bin/eslint.js"))


;;OSX stuff
(toggle-frame-maximized)
;;(put 'dired-find-alternate-file 'disabled nil)
;(load-theme 'ample-zen t)
(setq exec-path (append exec-path '("/usr/local/bin")))
