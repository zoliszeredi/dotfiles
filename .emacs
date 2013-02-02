(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil nil (menu-bar))
 '(safe-local-variable-values 
   (quote ((eval when (string-match "\\.h\\'" (buffer-file-name)) 
		 (unless (string-match "/gnulib/" (buffer-file-name)) 
		   (c++-mode) (c-set-style "gnu"))))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme/")
(put 'dired-find-alternate-file 'disabled nil)
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

 ;; disable the damn splash-screen
(setq inhibit-splash-screen t)

 ;; (setq scheme-program-name "guile")
(setq scheme-program-name "kawa")
(setq fill-column 79)

