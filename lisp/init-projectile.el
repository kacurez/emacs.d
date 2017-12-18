(require-package 'projectile)
(require-package 'perspective)
(require-package 'persp-projectile)

(persp-mode)


(projectile-global-mode)
(setq projectile-indexing-method 'git)
(setq projectile-completion-system 'ido)
(setq projectile-remember-window-configs t)
(global-set-key (kbd "C-c h") 'projectile-find-file)
(setq projectile-enable-caching t)
(setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name))))

;; (after-load 'projectile
;;   (diminish 'projectile-mode "Proj"))
                                        ;projectile-project-root


(defun noccur-project (regexp &optional nlines)
  "Perform `multi-occur' in the current project files."
  (interactive (occur-read-primary-args))
  (let* ((directory ;(read-directory-name "Search in directory: ")
                    (projectile-project-root)
                    )

         (files (if (and directory (not (string= directory (projectile-project-root))))
                    (projectile-files-in-project-directory directory)
                  (projectile-current-project-files)))
         (buffers (mapcar #'find-file
                          (mapcar #'(lambda (file)
                                      (expand-file-name file (projectile-project-root)))
                                  files))))
    (multi-occur buffers regexp nlines)))
(setq projectile-completion-system 'ivy)

(require-package 'project-explorer)
(global-set-key (kbd "C-c o") 'project-explorer-open)

(require-package 'ibuffer-projectile)
(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))
(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-persp-switch-project)
(provide 'init-projectile)
