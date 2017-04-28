;; Settings for OrgMode

;; more org stuff
(setq org-src-fontify-natively t)

;; org Babel stuff
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; org files
;; This no worky? (setq org-agenda-files '("~/org"))
(setq org-agenda-files (file-expand-wildcards "~/org/*.org"))

;; keybindings
(define-key global-map "\C-ca" 'org-agenda)

;; clockage
(setq org-clock-persist 'history)
     (org-clock-persistence-insinuate)
