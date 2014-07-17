;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)


;; Set up load path should be emacs.d
(add-to-list 'load-path user-emacs-directory)

;;prepare helper functions to install packages
(load "prepare-packaging")

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)



;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     ;; emacs utils
     guide-key ;;list avalable shortcuts
     flx-ido ido-vertical-mode ido-at-point ido-ubiquitous
     smex ;;command completition
     dired+
     dash
     
     ;;network utils
     restclient
     tramp
     
     ;; editing utils
     visual-regexp
     highlight-escape-sequences
     whitespace-cleanup-mode
 
     ;; programming utils
     rebox2;; make commentary boxes
     flycheck;; check syntax errors
     yasnippet;; code snippets and templates
     company ;;autocomplete
     paredit;; parrenthezis
     smartparens

     ;;project mgmt utils
     helm
     projectile
     workgroups2

     ;;GIT utils
     ;;gist
     magit
     git-commit-mode gitconfig-mode gitignore-mode

     ;;prodigy services maintanence
     ;;CLOJURE STUFF
     clojure-mode    
     cider
     cider-tracing)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(load "setup-emacs-utils")


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
(load custom-file))
