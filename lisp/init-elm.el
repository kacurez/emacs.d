(require-package 'elm-mode)
(add-to-list 'company-backends 'company-elm)
(setq elm-sort-imports-on-save t)
(setq elm-format-on-save t)
(setq elm-interactive-command '("elm" "repl"))
(provide 'init-elm)
