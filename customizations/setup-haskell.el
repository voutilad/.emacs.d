;;; package --- Haskell-Mode config
;;; Commentary:
;;;   my haskell config

;;; Code:
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))

;;; haskell.el ends here
