;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(toggle-frame-maximized)

;; Show line numbers
(global-linum-mode)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'material t)
;; Fix evil mode colors and cursors
(require 'evil)
(setq evil-insert-state-cursor '("#ff8700" box))
(setq evil-normal-state-cursor '("#dddd00" box))

;; (require 'nord-theme)
;; (setq nord-uniform-mode-lines t)
;; (setq nord-comment-brightness 20)
;; (load-theme 'nord t)

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-center-color-theme)

;(set-face-attribute 'default nil :font "Source Code Pro for Powerline" :height 120)
;(set-frame-font "Source Code Pro for Powerline" nil t)
(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline" :height 120)
(set-frame-font "DejaVu Sans Mono for Powerline" nil t)

;; make sure line nums don't scale with the text size
;; see: https://unix.stackexchange.com/a/146781
(set-face-attribute 'linum nil :height 120)

;; These settings relate to how emacs interacts with your operating system
;(setq ;; makes killing/yanking interact with the clipboard
;      select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
;      select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
 ;     save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
 ;     apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
 ;     mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)
(setq-default x-stretch-cursor t )
;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; date and time
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;; (display-time)

;; column numbers are good, man
(column-number-mode)
