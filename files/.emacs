
;;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


;;
;; Backups
;;
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


;;
;; Theme
;;
(load-theme 'solarized-dark t)


;;
;; Settings
;;
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq column-number-mode t)
(setq split-width-threshold 80 split-height-threshold 120)
(setq-default fill-column 160)


;;
;; Elpy
;;
(elpy-enable)

(add-hook 'python-mode-hook
	  (lambda ()
            (setq tab-width 4)
	    (setq indent-tabs-mode t)
            (setq python-indent-offset 4)))

(setq python-indent-guess-indent-offset nil)
(setq elpy-shell-use-project-root nil)
(setq elpy-shell-starting-directory 'current-directory)


;;
;; Quarto
;;
(add-to-list 'auto-mode-alist '("\\.qmd\\'" . poly-quarto-mode))
(use-package quarto-mode
  :mode (("\\.qmd" . poly-quarto-mode))
  )


;;
;; CSV
;;
'(csv-separators '("," ";"))


;;
;; Org
;;
(if (file-directory-p "~/workspace/organiser/") (load "~/.emacs-org.el"))


;;
;; Snippets
;;
(load "~/.emacs-snippets.el")
(add-hook 'emacs-startup-hook (lambda () (yas-load-directory "~/.emacs.d/snippets")))


;;
;; Custom set variables
;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

'(custom-safe-themes
  '("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" default))

'(package-selected-packages
  '(auctex-latexmk auctex csv-mode standoff-mode quarto-mode solarized-theme elfeed bibtex-completion org-ref helm-bibtex stan-mode elpy markdown-mode ess))

(custom-set-faces

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-done ((t (:foreground "#009c00"))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "orange"))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "magenta"))))
 '(org-scheduled ((t (:foreground "#419cff"))))
 '(org-scheduled-today ((t (:foreground "pale green"))))

 )
