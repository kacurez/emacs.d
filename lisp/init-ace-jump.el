(require-package 'ace-jump-mode)
(require-package 'ace-window)

(setq aw-leading-char-style 'path)

(key-chord-define-global "jj"  'avy-goto-char)
(key-chord-define-global "ji"  'avy-goto-char-2)
(key-chord-define-global "jl"  'avy-goto-line)
(key-chord-define-global "jk"  'avy-goto-word-1)
(key-chord-define-global "jw"  'avy-goto-word-0)

;;(require 'cl)
(defvar avoid-window-regexp "cider-repl")
(defun my-other-window ()
  "Similar to 'other-window, only try to avoid windows whose buffers match avoid-window-regexp"
  (interactive)
  (let* ((window-list (delq (selected-window) (window-list)))
         (filtered-window-list (remove-if
                                (lambda (w)
                                  (string-match-p avoid-window-regexp (buffer-name (window-buffer w))))
                                window-list)))
    (if filtered-window-list
        (select-window (car filtered-window-list))
      (and window-list
           (select-window (car window-list))))))

(global-set-key (kbd "M-o") 'my-other-window)



(provide 'init-ace-jump)
