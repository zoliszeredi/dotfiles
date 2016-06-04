(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 ;; '(custom-enabled-themes (quote (wombat)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inferior-js-program-command "nodejs --interactive")
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 ;; '(flycheck-python-pylint-executable "/home/stz/.envs/pylint/bin/pylint")
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
 '(default ((t (:family "Fira Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal)))))

(require 'package)
(package-initialize)
(package-refresh-contents)

(require 'uniquify)
(require 'ido)

(package-install 'flycheck)
(package-install 'magit)
(package-install 'cider)
(package-install 'slime)
(package-install 'geiser)
(package-install 'jsx-mode)
(package-install 'lua-mode)

(put 'dired-find-alternate-file 'disabled nil)
(ido-mode t)
(global-flycheck-mode)

(defun my-dired-mode-setup ()
  "Hide the silly extra columns in dired view"
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
(global-set-key (kbd "C-?") 'delete-backward-char)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)


(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(display-time)
