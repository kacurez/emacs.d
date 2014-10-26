(set-language-environment "UTF-8")
;; No splash screen
(setq inhibit-startup-message t)
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Set up load path should be emacs.d
(add-to-list 'load-path user-emacs-directory)

;;prepare helper functions to install packages
(load "prepare-packaging")

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)



;; Install extensions if they're missing adasd
(defun init--install-packages ()
  (packages-install
   '(
     ;; emacs utils: hippie expand etc
     guide-key ;;list avalable shortcuts
     key-chord
     flx-ido ido-vertical-mode ido-at-point ido-ubiquitous
     smex ;;command completition
     ace-jump-mode
     dired+
     dash

     ;;appearance-utils
     ample-zen-theme

     ;;network utils
     restclient
     tramp

     ;; editing utils
     visual-regexp
     highlight-escape-sequences
     whitespace-cleanup-mode
     volatile-highlights ;;vizualize paste opreation
     undo-tree
     rainbow-mode

     ;; developement utils
     rebox2;; make commentary boxes
     flycheck;; check syntax errors
     yasnippet;; code snippets and templates
     auto-complete
     paredit;; parrenthezis
     smartparens
     ggtags
     rainbow-delimiters
     company

     php-mode
     ;;web devel utils
     coffee-mode

     ;;project mgmt utils
     helm
     helm-projectile
     projectile
     workgroups2
     ecb

     ;;GIT utils
     ;;gist
     magit
     git-commit-mode gitconfig-mode gitignore-mode

     ;;prodigy services maintanence
     ;;CLOJURE STUFF
     clojure-mode
     cider
     ;;cider-tracing
     ac-cider-compliment
)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(load "setup-appearance-utils")
;;network utils
(require `restclient)
(load "setup-emacs-utils")
(load "setup-editing-utils")
(load "setup-devel-utils")
(load "setup-project-mgmt-utils")
(load "setup-web-devel-utils")
(load "special-copying")
(load "setup-clojure")
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
(load custom-file))
