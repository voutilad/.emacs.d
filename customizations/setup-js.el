;; javascript / html
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(setq js-indent-level 2)


;; (eval-after-load "sgml-mode"
  ;; '(progn
     ;; (require 'tagedit)
     ;; (tagedit-add-paredit-like-keybindings)
     ;; (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

;;;;;
;; all great stuff from: http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html#install_emacs_packages

(require 'flycheck)
;; turn on flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disbale jshint so we use eslint instead
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))

;; use eslint with web-mode for jsx
;;(flycheck-add-mode 'javascript-eslint 'web-mode)

;; custom flycheck tmp file prefix
;;(setq-default flycheck-temp-prefix ".flycheck")

;; macos issue
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; holy christ is js2 noisey! get rid of those underlines (via https://stackoverflow.com/a/42191610/1098337)
;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;;;;;;

;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))
(custom-set-variables
 '(coffee-tab-width 2))
