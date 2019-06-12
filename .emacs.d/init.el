(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil nil (menu-bar))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (pomidor python python-pytest org magit flycheck docker-compose-mode docker)))
 '(safe-local-variable-values
   (quote
    ((eval when
	   (string-match "\\.h\\'"
			 (buffer-file-name))
	   (unless
	       (string-match "/gnulib/"
			     (buffer-file-name))
	     (c++-mode)
	     (c-set-style "gnu"))))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(uniquify-separator ":"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal)))))

(require 'package)
(package-initialize)

(require 'uniquify)
(require 'ido)

(put 'dired-find-alternate-file 'disabled nil)
(ido-mode t)
(global-flycheck-mode)

(defun my-dired-mode-setup ()
  "Hide the silly extra columns in dired view."
  (dired-hide-details-mode 1))

(defun run-tox ()
  "Run tox async shell."
  (async-shell-command "tox"))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
(global-set-key (kbd "C-?") 'delete-backward-char)
(global-set-key (kbd "C-M-t") 'run-tox)

(display-time)


(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
	(backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))
