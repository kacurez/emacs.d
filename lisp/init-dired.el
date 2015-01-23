(require 'dired)
(require-package 'dired+)
(require-package 'dired-details+)

;; This is different than dired-up-directory in that it stays in the current buffer, instead of loading the parent directory in a new buffer. (I used to care about unused buffers.)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (define-key dired-mode-map (kbd "e")
	      (lambda () (interactive) (find-alternate-file "..")))))
(define-key dired-mode-map (kbd "RET")  'dired-find-alternate-file)

(setq dired-listing-switches "--group-directories-first -alh")
(put 'dired-find-alternate-file 'disabled nil)


;;(setq dired-listing-switches "-lXGh --group-directories-first")
;;(setq dired-listing-switches "-aBhl  --group-directories-first")
;; (defun mydired-sort ()
;;   "Sort dired listings with directories first."
;;   (save-excursion
;;     (let (buffer-read-only)
;;       (forward-line 2) ;; beyond dir. header
;;       (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
;;     (set-buffer-modified-p nil)))

;; (defadvice dired-readin
;;   (after dired-after-updating-hook first () activate)
;;   "Sort dired listings with directories first before adding marks."
;;   (mydired-sort))

(provide 'init-dired)
