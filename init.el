; list the packages you want
(setq package-list '(evil helm magit evil-magit))

;; disable menubar
(menu-bar-mode -1)

;; disable scrollbar
(toggle-scroll-bar -1)

;; disable toolbar
(tool-bar-mode -1)

;; show line numbers
(global-linum-mode t)

;; show matching parentheses
(show-paren-mode 1)

;; load the package manager
(require 'package)

;; Add Emacs package repositories to the list of available repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
    (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
    (unless (package-installed-p package)
        (package-install package)))

;; evil plugin
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'helm)
(helm-mode 1)

;; Use helm-M-x instead of regular M-x, because eunderhill says it's better
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x g") 'magit-status)


;; evil-magit plugin
(require 'evil-magit)

;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/color-themes")
(load-theme 'noctilux t)

