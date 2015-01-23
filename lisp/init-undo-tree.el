;;undo tree
(require-package 'undo-tree)
(global-undo-tree-mode 1)

(after-load 'undo-tree
  (diminish 'undo-tree-mode))

(provide 'init-undo-tree)
