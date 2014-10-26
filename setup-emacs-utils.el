;;turn off creation of backup files ending with ~
(setq make-backup-files nil)

;;KEY CHORD
(require 'key-chord)
(key-chord-mode 1)

;;IDO  SETUP
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)

(require 'smex) ; Not needed if you use package.el
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;vertical ido setup
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-auto-merge-work-directories-length -1)

;; key guide
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-x" "C-c p" "C-c h" "C-h" "C-c ," ))
(guide-key-mode 1)  ; Enable guide-key-mode



(require 'ace-jump-mode)
(key-chord-define-global "jj"  'ace-jump-char-mode)
(key-chord-define-global "jl"  'ace-jump-line-mode)
(key-chord-define-global "jk"  'ace-jump-word-mode)

;; (add-hook 'dired-mode-hook
;;    '(lambda ()
;;       (set (make-local-variable 'ido-enable-replace-completing-read) nil)))

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))
