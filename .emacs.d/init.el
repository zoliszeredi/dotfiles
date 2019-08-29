;;; package --- Summary
;;;
;;; Commentary:
;;; Hello to my init.el file
;;;

(require 'package)
(package-initialize)


(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(column-number-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil nil (menu-bar))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(uniquify-separator ":")
 '(package-selected-packages (quote (blacken green-is-the-new-black-theme)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal)))))



(require 'uniquify)
(require 'ido)

(put 'dired-find-alternate-file 'disabled nil)
(ido-mode t)
(global-flycheck-mode)
(display-time)

(require 'green-is-the-new-black-theme)
(add-hook 'python-mode-hook 'blacken-mode)


(defun my-dired-mode-setup ()
  "Hide the silly extra columns in dired view."
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
(global-set-key (kbd "C-?") 'delete-backward-char)


(defun find-python-project-level-directory (&optional directory)
  "Recursively try to find from DIRECTORY to the first parent that's not a python package."
  (interactive "P")
  (let ((search-directory (or directory
			      (file-name-directory buffer-file-name))))
    (if (directory-files search-directory nil "^__init__\.py$" t)
	(let* ((directory-with-no-trailing-slash
		(directory-file-name search-directory))
	       (parent-directory (file-name-directory directory-with-no-trailing-slash)))
	  (find-python-project-level-directory parent-directory))
      search-directory)))


(defun pygrep ()
  "Does a grep in python files from the project dir for the symbol at cursor."
  (interactive)
  (grep-compute-defaults)		; without this call grep crashes horribly
  (rgrep (thing-at-point 'symbol t)
	 "*.py"
	 (find-python-project-level-directory)
	 nil))


(global-set-key (kbd "C-x g") 'pygrep)
