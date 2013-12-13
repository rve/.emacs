;;from lertsau

(require 'cc-mode)

(setq c-basic-offset 4)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and close auto-newline
  (c-set-style "GNU")
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline nil)
  ;(define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f9)] 'smart-compile)
  (define-key c-mode-base-map [(f8)] 'smart-run)
  (define-key c-mode-base-map [(f7)] 'gdb)
  (define-key c-mode-base-map [(f6)] 'speedbar)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;;(define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  ;;pre-process
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;code folding
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;;my cpp style
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup"))

(provide 'hyperion-cc-mode)
