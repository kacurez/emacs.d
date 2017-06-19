(require 'dired)
(require-package 'dired-details+)
(require-package 'dired+)
(require 'dired+)

;; This is different than dired-up-directory in that it stays in the current buffer, instead of loading the parent directory in a new buffer. (I used to care about unused buffers.)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "e")
              (lambda () (interactive) (find-alternate-file "..")))))
(define-key dired-mode-map (kbd "RET")  'dired-find-alternate-file)

(setq dired-listing-switches "--group-directories-first -alh")
(put 'dired-find-alternate-file 'disabled nil)

(setq dired-dwim-target t)

(defun dired-get-size ()
  (interactive)
  (let ((files (dired-get-marked-files)))
    (with-temp-buffer
      (apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
      (message
       "Size of all marked files: %s"
       (progn
         (re-search-backward "\\(^[ 0-9.,]+[A-Za-z]+\\).*total$")
         (match-string 1))))))

;;(define-key ctl-x-map   "d" 'diredp-dired-this-subdir)
;;(define-key ctl-x-4-map "d" 'dired-other-window)
(define-key dired-mode-map (kbd "z") 'dired-get-size)

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

;; http://stackoverflow.com/questions/4076360/error-in-dired-sorting-on-os-x
(setq insert-directory-program "/usr/local/bin/gls")
(provide 'init-dired)
