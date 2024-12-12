(setq package-enable-at-startup nil)

;; remove gui bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; show line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

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
;(evil-mode 1)

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

;; install org-superstar
(straight-use-package 'org-superstar)
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; install vterm
(straight-use-package 'vterm)

;; install counsel
(straight-use-package 'ivy)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; install exwm
(straight-use-package 'exwm)

(require 'exwm)
;; Set the initial workspace number.
(setq exwm-workspace-number 4)
;; Make class name the buffer name.
(add-hook 'exwm-update-class-hook
  (lambda () (exwm-workspace-rename-buffer exwm-class-name)))
;; Global keybindings.
(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
        ([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
        ([?\s-&] . (lambda (cmd) ;; s-&: Launch application.
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command cmd nil cmd)))
        ;; s-N: Switch to certain workspace.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))
;; Enable EXWM
(exwm-enable)
