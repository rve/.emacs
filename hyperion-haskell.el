(require-package 'haskell-mode)

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
))

(provide 'hyperion-haskell)
