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

    ido-completing-read+
    smex
    projectile
    virtualenvwrapper

    ;; edit html tags like sexps
    tagedit

    material-theme
    hydandata-light-theme

    magit
    markdown-mode
    web-mode
    flycheck

    helm

    websocket
    js2-mode

    powerline
    powerline-evil))

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

;; emailz
(load "mu4e-config.el")

;; fix some line number issues
(load "linum-off.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "17d076793bfb4afce8b926d0575c9714e3f8825b")
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "4d80487632a0a5a72737a7fc690f1f30266668211b17ba836602a8da890c2118" "7c49651e62ee04b5f6d8fca78bca6f31730d982901fc1e1c651e464fa0ecfea4" "858a353233c58b69dbe3a06087fc08905df2d8755a0921ad4c407865f17ab52f" "b67cb8784f6a2d1a3f605e39d2c376937f3bf8460cb8a0d6fc625c0331c00c83" "fd24b2c570dbd976e17a63ba515967600acb7d2f9390793859cb82f6a2d5dacd" "94fca10c5916f99df0445f69116623bc3425ea2a1f9e002f3e29b8343ec8552c" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "dadfdd5259c8df97a2cc437e895d9708d3ffff907b8aea0309179837c784babb" "5b2072fb4eab2ee1db0d012d4f60c610291cd7a6d6cdb7ba08c49c5f8a52c1a6" "56c2f4b5b80f7901dbe77cecc1b1eb76bab0f35e9c62f57fb03fd872926c4485" "cefb7660321f261720c653b3213365bbafac2e2b6e54dc8f402b83659454378b" "79e9e502387c1365636f88b5333285d5bbcb2cefb077332855b697b7e3af8d8d" "3192502fc3b2e5aa813212a472071aa1b1ddff60cde3e453b37e8f603a3df661" "2dc0d827b1bd44dd9a5783913d9a96d1e18e60413ba121d350a41d2754b65592" "1e758b148224134c506b5c6d94b2337424df659750d1bf232af22fa6de800b88" "c47b4f615e53bf65af15c6bda8976223ee5707c02ac24fd29ff0b8a22e96b521" "b761d9e588d461a7669756abeab3321dbe514fd46ad5abc41c075e9ba3db8c87" "41c15f4a9a541cda95dbe3adda2d4dc05139ed7e58414c211e0e9fc626edc9d6" "ebfb9104964a72b07568d68f6c10953755e97431aa53c9c08638633ecb420af4" "395eca2387c618648db30bf50c14b6323db12bdcbadf6a1879f1287eba2bf749" "2427e02c4c007dd6500eb73be7ccfee7d18058f5ebe270a3570428343db559f8" "5bc0648d7cd7d14614dbe5397b5189f1c96344dc042706d77a6824708e7da15e" "522861c5cc38cf08ffd0a56ffc1e3ff74e07d1127e51c15ff0172b68761566e8" "bae46f3f66d36be5909ffb176af192006e32e1930a60e03e5ab50ca7902de9c3" "78ea29930b494dc44c29622d94fe532fb71417523ef67bb4e55a7993c4006084" "55fbc0030e0862f97e1cad95dfe630a30ea87d99ac4d30d02ef8732f6e3f5212" "f1db93bf51298de5192ea4b52bd0c90692dc63f8ec1e1c68a6e0bd334da3b1f1" "5bbaa30862e6ff8fda1c11e2a8aade42db27eb5a445929ba73a443857782a628" "40de4a07e8a3f36b85972bafa3d146a40fb37e1e81eae25f112786b4b9873d93" "3fc980c523d2e9c9521bfaf4dfa220c04224ed6aa3d148a0e3c8b06cd55d74c7" "f5c059b561f682b2f76bae2488e2c35cc6ae519f757c7f7d5f824acc6c02fdf1" "e9ec11b42f1e6c034123d8183dc58fda09114ad2fb1cb5d68ef51ea5b5614a1d" "6af499d33b4a039cac026a4ff1f8de752c393425b340835a81c035f28c04c0a9" "7cf728a75f565e3baacaedab50542810d5ca0d10ef9b21aa94e03c2157c1ee10" "46f931bc61d56151069ad344062ac001bfe643584f5c6e4cf5259294f7d29696" "b6912480d96978256ee27fb4ae5437d0570621388147aeb9e8544c58d4a5d0e9" "955b2499915435bb54f044bb1da23172452fa2a64e19007d18fb828b4639f367" "bbf4eb9a36419e55c8cd0f649e6bb225d997496e22f3a3a73e03dd2829dbe0df" "c5a886cc9044d8e6690a60f33db45506221aa0777a82ad1f7fe11a96d203fa44" default)))
 '(doc-view-resolution (* 176 2))
 '(org-agenda-files (list org-directory))
 '(org-clock-persist (quote history))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/org")
 '(package-selected-packages
   (quote
    (org-bullets powerline-evil powerline company-jedi js-comint elpy ## greymatters-theme gruvbox-theme company anti-zenburn-theme solarized-theme hydandata-light-theme flycheck smex js2-mode websocket indium yaml-mode helm dumb-jump htmlize cider-decompile tagedit rainbow-delimiters projectile paredit magit ido-completing-read+ clojure-mode-extra-font-locking cider)))
 '(send-mail-function (quote sendmail-send-it)))

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


