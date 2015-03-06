(require-package 'ace-jump-mode)
(require-package 'ace-window)

(setq aw-leading-char-style 'path)

(key-chord-define-global "jj"  'avi-goto-char)
(key-chord-define-global "jh"  'avi-goto-char-2)
(key-chord-define-global "jl"  'avi-goto-line)
(key-chord-define-global "jk"  'avi-goto-word-1)
(key-chord-define-global "jw"  'avi-goto-word-0)


(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-ace-jump)
