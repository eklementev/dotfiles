;; *TODO*
;; c/c++ indentation
;; clang completion
;; astra + qt
;; flycheck

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages

(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(unless package-archive-contents (package-refresh-contents))

(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common

;; menu
(menu-bar-mode 0)
;; line number
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
;; column number
(column-number-mode 1)
;; parens
(show-paren-mode 1)
;; smooth scroll
(setq scroll-step 1)
(setq scroll-conservatively  10000)
;; no word wrap
(setq-default truncate-lines 1)
;; autopair
(autopair-global-mode 1)
;; color theme
;;(load-theme 'darkmine t)
(load-theme 'whiteboard t)
;; remove spaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)
;; indent buffer on save
(add-hook 'before-save-hook
	  (lambda ()
	    (interactive)
	    (save-excursion (indent-region (point-min) (point-max) nil))))
;; disable auto save
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy

(ivy-mode 1)
(setq ivy-display-style nil)

(global-set-key (kbd "C-s") 'swiper)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company

(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
