;; Settings for OrgMode
(custom-set-variables
 '(org-directory "~/org")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-agenda-files (list org-directory))
 '(org-clock-persist 'history))

;; more org stuff
(setq org-src-fontify-natively t)

;; org Babel stuff
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; keybindings
(define-key global-map "\C-ca" 'org-agenda)

;; clockage
(org-clock-persistence-insinuate)

;; capture mode
(define-key global-map "\C-cc" 'org-capture)
