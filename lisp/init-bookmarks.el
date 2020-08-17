(require-package 'bm)

;; M$ Visual Studio key setup.

(global-set-key (kbd "<M-return>") 'bm-toggle)
(global-set-key (kbd "M-[")   'bm-next)
(global-set-key (kbd "M-]") 'bm-previous)

;;Click on fringe to toggle bookmarks, and use mouse wheel to move between them.

(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;;If you would like the markers on the right fringe instead of the left, add the following line:

;(setq bm-marker 'bm-marker-right)

;;If you would like to cycle bookmark in LIFO order, add the following line:

(setq bm-in-lifo-order t)

;;If you would like to cycle through bookmarks in all open buffers, add the following line:

(setq bm-cycle-all-buffers t)

;;If you would like to remove bookmark after jump to it by bm-next or bm-previous:

;(setq temporary-bookmark-p t)

;;or if you want use this feature in your library:

;(bm-bookmark-add nil nil t)


(provide 'init-bookmarks)
