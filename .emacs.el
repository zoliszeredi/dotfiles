(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (whiteboard)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inferior-js-program-command "nodejs --interactive")
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil nil (menu-bar))
 '(safe-local-variable-values
   (quote ((eval when (string-match "\\.h\\'" (buffer-file-name))
		 (unless (string-match "/gnulib/" (buffer-file-name))
		   (c++-mode) (c-set-style "gnu"))))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(show-trailing-whitespace t)
 '(package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("melpa-stable" . "http://stable.melpa.org/packages/")))
 '(scheme-program-name "guile")
 '(python-shell-interpreter "python")
 '(uniquify-buffer-name-style 'post-forward)
 '(uniquify-separator ":")
 '(display-time-day-and-date t)
 '(display-time-24hr-format t)
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(package-initialize)

(require 'uniquify)
(require 'ido)

(package-install 'flycheck)
(package-install 'magit)
(package-install 'cider)

(put 'dired-find-alternate-file 'disabled nil)
(ido-mode t)
(global-flycheck-mode)

(global-set-key (kbd "C-?") 'delete-backward-char)
(display-time)
