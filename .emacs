(setq package-enable-at-startup nil)

;; disable backup files
(setq make-backup-files nil)

;; remove gui bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;; show line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; set font size
(set-face-attribute 'default nil :font "SpaceMono Nerd Font-18" )

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; cattpuccin theme
(straight-use-package 'catppuccin-theme)
(load-theme 'catppuccin :no-confirm)

;; install evil mode
(straight-use-package 'evil)
(evil-mode 1)

;; install a dashboard
(straight-use-package 'dashboard)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
;; set dashboard title
(setq dashboard-banner-logo-title "Welcome to DILLMACS")
(setq dashboard-footer-messages '("The Church Of Emacs"))
;; set dashboard banner
(setq dashboard-startup-banner "~/.config/emacslogo")

;; install smartparens
(straight-use-package 'smartparens)

(add-hook 'prog-mode-hook #'smartparens-mode)
;; install vterm
(straight-use-package 'vterm)

;; install counsel
(straight-use-package 'ivy)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; org-superstar(you need to instal with melpa)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; install magit
(straight-use-package 'magit)
