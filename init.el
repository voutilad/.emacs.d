;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(evil

    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
	rainbow-delimiters

    ido-ubiquitous
    smex
    projectile

    ;; edit html tags like sexps
    tagedit

    material-theme

    magit
    markdown-mode
    web-mode
    flycheck

    helm

    websocket
    js2-mode))

;;(if (eq system-type 'darwin)
;;    (add-to-list 'my-packages 'exec-path-from-shell))

(require 'cl-lib)

(defun my/install-packages ()
  "Ensure the packages I use are installed. See `my/packages'."
  (interactive)
  (let ((missing-packages (cl-remove-if #'package-installed-p my-packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      (mapc #'package-install missing-packages))))

(my/install-packages)

(add-to-list 'load-path "~/.emacs.d/vendor")

;;;;
;; Customization
;;;;

(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
;; (load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Load orgmode settings and customzitions
(load "orgmode.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Language-specific
(load "setup-clojure.el")
(load "setup-js.el")
;;(load "setup-haskell.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("653574dd35a64b45030075c99bb9e73f26d8abc7f21e145321e64fa2659fb6f5" default)))
 '(doc-view-resolution (* 176 2))
 '(org-agenda-files (list org-directory))
 '(org-clock-persist (quote history))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/org")
 '(package-selected-packages
   (quote
    (silkworm-theme flycheck smex js2-mode websocket indium yaml-mode helm dumb-jump htmlize cider-decompile tagedit rainbow-delimiters projectile paredit magit ido-ubiquitous clojure-mode-extra-font-locking cider))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
