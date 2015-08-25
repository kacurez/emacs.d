(require-package 'projectile)


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

(provide 'init-projectile)
