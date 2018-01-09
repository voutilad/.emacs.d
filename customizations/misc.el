;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(display-battery-mode)

;; Try using helm
(require 'helm-config)

;; Markdown config from http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Make Meta + MouseWheel change text scaling for easy zoomin'
(global-set-key (kbd "<s-triple-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<s-triple-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<s-double-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<s-double-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<s-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<s-wheel-up>") 'text-scale-increase)

;; fix issues with gpg2 pinentry on OpenBSD, allowing prompts in the
;; emacs minibuffer
(setq epa-pinentry-mode 'loopback)
