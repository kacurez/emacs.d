;; @jr0cket - community developer > http://blog.jr0cket.co.uk/

;; Lightweight clojure setup for Emacs
;; requires emacs24 and leiningen


;; Add Marmalade package archive for Emacs starter kit and other Emacs packages

(require 'package)
(add-to-list 'package-archives
             ;;'("marmalade" . "http://marmalade-repo.org/packages/")
             '("melpa" . "http://melpa-stable.milkbox.net/packages/") 
             )
(package-initialize)


;; Add Clojure and other supporting packages to the Emacs environment
;; Packages are installed if they are not already present
;; The list includes packages for the starter kit, Clojure and markdown files (used by github)

(when (not package-archive-contents)
 	(package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell starter-kit-bindings
	clojure-mode clojure-test-mode
        rainbow-delimiters
        auto-complete
        ac-slime
        ac-nrepl
        coffee-mode
	markdown-mode
        popup
        undo-tree ))

;;; auto-complete only seems to work as a manual install, however that
;;; manual install relies on popup being available
 

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Useful global settings as Emacs is used predominantely for Clojure development

;; Launch the Clojure repl via Leiningen - M-x clojure-jack-in 
;; Global shortcut definition to fire up clojure repl and connect to it
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;; Colour match parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;;; Enable undo-tree for everything, so you can M - _ to redo
(global-undo-tree-mode)


;;; Add configuration for the auto-completion package

; not sure if this loadpath is required
;; (add-to-list 'load-path "~/.emacs.d")

; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;;; not sure if require 'autocomplete is needed
;;; (require 'autocomplete)

;(require 'auto-complete-config)
;(ac-config-default)


(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(ac-config-default)

(load "~/.emacs.d/user.el")
(w32-send-sys-command 61488)

(if (eq system-type 'windows-nt)
    (progn
      (setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin"))
      (setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;" (getenv "PATH")))))

(require 'tramp)
(setq tramp-auto-save-directory "c:\\tmp")
(setq tramp-default-method "plink")
