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

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 2) ;; keyboard scroll one line at a time

(setq auto-window-vscroll nil)

(provide 'init-scrolling)
