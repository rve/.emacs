;;Hide menu items
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Popular replce for M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; Unset disturbing shortcut for sending mail
(global-unset-key (kbd "C-x m"))
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
 (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))
(global-set-key (kbd "C-c g") 'google)

;; set sml env
(setenv "PATH" (concat "~/local/sml/bin:" (getenv "PATH")))
(setq exec-path (cons "~/local/sml/bin"  exec-path))

;; for terminal paste and copy  of osx 10.8
(defun pt-pbpaste ()
  "Paste data from pasteboard."
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   "pbpaste" nil t))

(defun pt-pbcopy ()
  "Copy region to pasteboard."
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region
     (point) (mark) "pbcopy")
    (kill-buffer "*Shell Command Output*")))

(global-set-key [?\C-x ?\C-y] 'pt-pbpaste)
(global-set-key [?\C-x ?\M-w] 'pt-pbcopy)


;; disable backup file
(setq make-backup-files nil)
(provide 'hyperion-misc)
