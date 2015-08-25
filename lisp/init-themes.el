;;set fullscreen
;;(w32-send-sys-command 61488)

(require-package 'ample-zen-theme)


;; color-theme-sanityinc-tomorrow
;(require-package 'color-theme-sanityinc-tomorrow)
;(load-theme 'ample-zen t)

(add-to-list 'custom-theme-load-path (file-name-as-directory (expand-file-name "themes" user-emacs-directory)))
(load-theme 'leuven t t)
(enable-theme 'leuven)
;(load-theme 'high-contrast t t)
;(load-theme 'radiance t t)
;(enable-theme 'radiance)


(provide 'init-themes)
