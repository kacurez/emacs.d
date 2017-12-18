;; key guide
(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-x" "C-c p" "C-c h" "C-h" "C-c ," "C-x p", "C-c C-o", "C-c C-e", "C-o" "C-c RET c" "C-x x"))
(guide-key-mode 1)  ; Enable guide-key-mode
(after-load 'guide-key
  (diminish 'guide-key-mode))

(provide 'init-guide-key)
