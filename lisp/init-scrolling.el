(defun scroll-down-five ()
"Five lines using `scroll-down'."
(interactive)
  (scroll-down 5))

(defun scroll-up-five ()
"Five lines using `scroll-up'."
(interactive)
  (scroll-up 5))

(defun my-scroll-up ()
"Custom function that results in a one-half screen scroll"
(interactive "^")
  (scroll-up)
  (recenter)
  (when (not (= (current-column) 0))
    (vertical-motion 0)))

(defun my-scroll-down ()
"Custom function that results in a one-half screen scroll."
(interactive "^")
  (scroll-down)
  (when (<= (string-to-number (format-mode-line "%l")) (window-height))
    (goto-char (point-min)))
  (recenter)
  (when (not (= (current-column) 0))
    (vertical-motion 0)) )

(defun my-s-scroll-up ()
"Custom function that results in a full screen scroll."
(interactive "^")
  (my-scroll-up)
  (my-scroll-up))

(defun my-s-scroll-down ()
"Custom function that results in a full screen scroll."
(interactive "^")
  (my-scroll-down)
(my-scroll-down))

(global-set-key (kbd "C-v") (quote my-scroll-up))
(global-set-key (kbd "M-v") (quote my-scroll-down))



(provide 'init-scrolling)
