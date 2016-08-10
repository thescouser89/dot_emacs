;;; init.el --- Dustin's emacs config
;;; Commentary:
;;; Dustin's lame Emacs config

;;; Code:

;; load the package manager
(require 'package)

;; Add Emacs package repositories to the list of available repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
    (package-refresh-contents))

;;; install use-package, this will install the other plugins as required
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
	 ("M-;" . helm-buffers-list)))

(use-package magit
  :ensure t)
 
(use-package evil-magit
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package noctilux-theme
  :ensure t)

(use-package projectile
  :ensure t
  :init (projectile-global-mode))

(use-package neotree
  :ensure t
  :bind (([f2] . neotree-toggle)))

(use-package company
  :ensure t
  :init (global-company-mode))

;; disable menubar
(menu-bar-mode -1)

;; disable scrollbar
(toggle-scroll-bar -1)

;; disable toolbar
(tool-bar-mode -1)

;; show line numbers
;; but don't show it for ansi-shell and eshell
(add-hook 'find-file-hook 'linum-mode)

;; show matching parentheses
(show-paren-mode 1)

;; close opening (, " etc
(electric-pair-mode 1)

(use-package whitespace
  :init
  (setq whitespace-style '(face empty tabs lines-tail trailing))
  (global-whitespace-mode 1))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (company-mode noctilux-theme use-package helm flycheck evil-magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
