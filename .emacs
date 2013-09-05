(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil nil (menu-bar))
 '(safe-local-variable-values (quote ((eval when (string-match "\\.h\\'" (buffer-file-name)) (unless (string-match "/gnulib/" (buffer-file-name)) (c++-mode) (c-set-style "gnu"))))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
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
(put 'dired-find-alternate-file 'disabled nil)
 ;; disable the damn splash-screen
(setq inhibit-splash-screen t)

(setq scheme-program-name "guile")
 ;; (setq scheme-program-name "kawa")
(setq fill-column 79)
(setq-default indent-tabs-mode nil)

(defun google-region (beg end)
  "Google the selected region"
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" 
                      (buffer-substring beg end))))

;; Python land refactorings

(defun pyrf-search-backward-for-def ()
  (save-excursion
    (re-search-backward "def \\(\\([[:alnum:]]\\|_\\)+\\)")
    (match-string 1)))

(defun pyrf-search-backward-for-class ()
  (save-excursion
    (re-search-backward "class \\(\\([[:alnum:]]\\|_\\)+\\)")
    (match-string 1)))

(defun pyrf-search-forward-for-return ()
  (save-excursion
    (re-search-forward "return")))

(defun pyrf-log-entry-points (position)
  (interactive "d")
  (save-excursion
    (let ((function-name (pyrf-search-backward-for-def))
          (class-name (pyrf-search-backward-for-class))
  (return-pos (pyrf-search-forward-for-return))
  (log-entry-format "print 'O\\t%s::%s'")
  (log-exit-format "print 'X\\t%s::%s'"))
      (goto-char return-pos)
      (beginning-of-line-text)
      (insert (format log-exit-format class-name function-name))
      (newline-and-indent)
      (beginning-of-defun)
      (end-of-line)
      (newline-and-indent)
      (insert (format log-entry-format class-name function-name)))))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(load-theme 'wombat)

(defun load-env-tags()
  (interactive)
  (let ((tagsfile (concat
                   (file-name-as-directory (shell-snarf-envar "VIRTUAL_ENV"))
                   (file-name-as-directory "var")
                   "TAGS")))
    (visit-tags-table tagsfile)))

;; HipChat not yet working...
 
(setq ssl-program-name "gnutls-cli"
      ssl-program-arguments '("--port" service
                              "--insecure"
                              "--starttls"
                              host))
      ;; ssl-certificate-verification-policy 1)

;; Connect using jabber.el
;; M-x jabber-connect <RET>

;; (setq starttls-use-gnutls t
;;       starttls-gnutls-program "gnutls-cli"
;;       starttls-extra-arguments '("--starttls" "--insecure"))

;; Config
(setq jabber-account-list '(("24330_202310@chat.hipchat.com")))
(defvar hipchat-number "24330")
(defvar hipchat-nickname "Zoltán Szeredi")

;; Join a room
(defun hipchat-join (room)
  (interactive "sRoom name: ")
  (jabber-groupchat-join
   (jabber-read-account)
   (concat hipchat-number "_" room "@conf.hipchat.com")
   hipchat-nickname
   t))

;; Mention nicknames in a way that HipChat clients will pickup
(defun hipchat-mention (nickname)
  (interactive
   (list (jabber-muc-read-nickname jabber-group "Nickname: ")))
  (insert (concat "@\"" nickname "\" ")))
