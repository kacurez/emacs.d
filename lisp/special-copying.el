;;COPY LINE WITH RETURN, copies up to the beggining of the next line
(defun copy-line-with-return (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
 ;; optional key binding
   (global-set-key "\C-c\C-l" 'copy-line-with-return)

;;http://www.emacswiki.org/emacs/CopyWithoutSelection
;;BASE copy functions
 (defun get-point (symbol &optional arg)
      "get the point"
      (funcall symbol arg)
      (point)
     )
     
     (defun copy-thing (begin-of-thing end-of-thing &optional arg)
       "copy thing between beg & end into kill ring"
        (save-excursion
          (let ((beg (get-point begin-of-thing 1))
         	 (end (get-point end-of-thing arg)))
            (copy-region-as-kill beg end)))
     )
     
     (defun paste-to-mark(&optional arg)
       "Paste things to mark, or to the prompt in shell-mode"
       (let ((pasteMe 
     	 (lambda()
     	   (if (string= "shell-mode" major-mode)
     	     (progn (comint-next-prompt 25535) (yank))
     	   (progn (goto-char (mark)) (yank) )))))
     	(if arg
     	    (if (= arg 1)
     		nil
     	      (funcall pasteMe))
     	  (funcall pasteMe))
     	))


;;COPY WORD
(defun copy-word (&optional arg)
      "Copy words at point into kill-ring"
       (interactive "P")
       (copy-thing 'backward-word 'forward-word arg)
       ;;(paste-to-mark arg)
     )
;;Key binding
(global-set-key (kbd "C-c w") (quote copy-word))


;;COPY LINE
(defun copy-line (&optional arg)
      "Save current line into Kill-Ring without mark the line "
       (interactive "P")
       (copy-thing 'beginning-of-line 'end-of-line arg)
     ;;  (paste-to-mark arg)
     )
;;Key binding
(global-set-key (kbd "C-c l")         (quote copy-line))
