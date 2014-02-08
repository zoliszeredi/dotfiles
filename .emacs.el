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
 '(package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("melpa" . "http://melpa.milkbox.net/packages/")))
 '(my-packages (dash
		python-pep8
		python-pylint
		flymake-python-pyflakes
		auto-complete
		projectile
		magit
		geiser
		eldoc
		paredit
		pretty-lambdada
		clojure-mode
		clojure-test-mode
		cider
		evil))
 '(scheme-program-name "guile")
 '(python-shell-interpreter "python")
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(package-initialize)
(package-refresh-contents)

(defun lazy-install-packages ()
  (interactive)
  (let ((packages (car (get 'my-packages 'saved-value))))
    (dolist (package packages)
      (unless (package-installed-p package)
	(package-install package)))))
    
(put 'dired-find-alternate-file 'disabled nil)

(defun google-region (beg end)
  "Google the selected region"
  (interactive "r")
  (let ((url-format "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
	(string (buffer-substring beg end)))
      (browse-url (format url-format string))))

(defun google-string (string)
  "Google for something"
  (interactive "sWords: ")
  (let ((url-format "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"))
      (browse-url (format url-format string))))

(global-set-key (kbd "C-?") 'delete-backward-char)
