(custom-set-variables
  ;; エラーをポップアップで表示
  '(flycheck-display-errors-function
    (lambda (errors)
      (let ((messages (mapcar #'flycheck-error-message errors)))
        (popup-tip (mapconcat 'identity messages "\n")))))
  '(flycheck-display-errors-delay 0.5))
(define-key global-map (kbd "C-M-n") 'flycheck-next-error)
(define-key global-map (kbd "C-M-p") 'flycheck-previous-error)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'd-mode-hook 'flycheck-mode)
