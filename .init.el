;; .emacs.d/init.el

;; ==============================
;; MELPA Package Support
;; ==============================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults
    material-theme
    elpy
    jedi
    markdown-mode
    powershell
    org)
  )

;; Scans the list in myPackages
;; If the package listed in not already installed, install it
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; =========================
;; Basic Customization
;; =========================

(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)

(elpy-enable)
(setq elpy-rpc-backend "jedi")

(setq markdown-command "pandoc")


;;(when (eq window-system 'w32)
;;  (setq tramp-default-method "plink")
;;  (when (and (not (string-match putty-directory (getenv "PATH")))
;;    (file-directory-p putty-directory))
;;  (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
;;  (add-to-list 'exec-path putty-directory)))

;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pdf-tools jedi material-theme better-defaults disk-usage))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode 1)
(tool-bar-mode -1)
