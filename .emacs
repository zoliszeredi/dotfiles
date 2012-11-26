(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval when (string-match "\\.h\\'" (buffer-file-name)) (unless (string-match "/gnulib/" (buffer-file-name)) (c++-mode) (c-set-style "gnu")))))))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(add-to-list 'load-path "~/.emacs.d/lisp/")
(put 'dired-find-alternate-file 'disabled nil)
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

 ;; disable the damn splash-screen
(setq inhibit-splash-screen t)

 ;; disable the unnecesarry decorating stuff
(tool-bar-mode -1)
(menu-bar-mode -1)
;;(scroll-bar-mode -1)

(setq scheme-program-name "guile")
