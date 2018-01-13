(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.mail"))

(setq user-mail-address "voutilad@gmail.com"
      user-full-name "Dave Voutila"
      mu4e-compose-signature (concat "Dave\n"))

(setq mu4e-get-mail-command "mbsync gmail sisu")
(setq mu4e-update-interval 300)

;;;; fancybois
;; use 'fancy' non-ascii characters in various places in mu4e
;;(setq mu4e-use-fancy-chars t)

;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads")

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; support adding a prompt to view email in browser
(add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)

;; email autofetch
(setq mu4e-update-interval 300)

;; context switching!!
(setq mu4e-contexts
      `(, (make-mu4e-context
          :name "Gmail"
          :enter-func (lambda () (mu4e-message "Entering Gmail context"))
          :leave-func (lambda () (mu4e-message "Leaving Gmail context"))
          :match-func (lambda (msg)
                        (when msg
                          (mu4e-message-contact-field-matches msg
                            :to "voutilad@gmail.com")))
          :vars '( ( user-mail-address      . "voutilad@gmail.com"  )
                   ( user-full-name         . "Dave Voutila" )
                   ( mu4e-compose-signature .
                     (concat "Dave\n"))))
        , (make-mu4e-context
           :name "Sisu"
           :enter-func (lambda () (mu4e-message "Entering Sisu context"))
           :leave-func (lambda () (mu4e-message "Leaving Sisu context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                             :to "dave@sisu.io")))
           :vars '( ( user-mail-address      . "dave@sisu.io")
                    ( user-full-name         . "Dave Voutila")
                    ( mu4e-compose-signature .
                      (concat "Dave Voutila\n"
                              "+1 617-538-2151\n"
                              "Sisu Integrated Services, LLC\n"))))))
