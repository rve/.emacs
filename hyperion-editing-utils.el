(global-set-key (kbd "RET") 'newline-and-indent)
;;Set paren match
(setq show-paren-mode t)
;;Set Mark
(global-set-key (kbd "C-.") 'set-mark-command)
;;Copy line
(global-set-key (kbd "C-c p") 'duplicate-line)
;;line num
(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d ")  ;set format
;;Handy replace string
;use M-%  y,n,q,!,  ! for all
;;Handy goto line
; use M-g g 
;;Show column number
(setq column-number-mode t) 
;;Big kill ring
(setq kill-ring-max 200)
;;Fill column 60
(setq default-fill-column 60)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

;; Org-mode auto switch line
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;End
(provide 'hyperion-editing-utils)
