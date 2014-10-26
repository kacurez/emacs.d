;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace

(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;;white space cleanup action
;;(setq global-whitespace t)
;;(setq global-whitespace-mode-cleanup-mode 1)
;;(setq whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)



;;coffe mode setup
;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))


;;auto align html stuff
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))


;;cleanup buffer and indent
(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(global-set-key (kbd "C-c n") 'cleanup-buffer)
