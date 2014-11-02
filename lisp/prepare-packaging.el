;;PREPARE packages loading
(require 'package)


(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (dolist (elt packages)
    (when (not (package-installed-p elt))
      (package-install elt)))
  (delete-other-windows))

