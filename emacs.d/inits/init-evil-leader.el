(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "h" 'helm-mini)
(evil-leader/set-key "e" 'eval-buffer)
(eval-after-load 'inf-ruby
  '(evil-leader/set-key "C-i" 'inf-ruby))
(eval-after-load 'robe
  '(evil-leader/set-key "C-r" 'robe-start))
