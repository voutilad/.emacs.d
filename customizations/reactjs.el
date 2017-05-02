;; Customizations for ReactJS/JSX stuff

;; See https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

