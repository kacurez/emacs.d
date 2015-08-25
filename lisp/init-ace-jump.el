(require-package 'ace-jump-mode)
(require-package 'ace-window)

(setq aw-leading-char-style 'path)

(key-chord-define-global "jj"  'avy-goto-char)
(key-chord-define-global "ji"  'avy-goto-char-2)
(key-chord-define-global "jl"  'avy-goto-line)
(key-chord-define-global "jk"  'avy-goto-word-1)
(key-chord-define-global "jw"  'avy-goto-word-0)


(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-ace-jump)
