; ~/.emacs

(load "~/.emacs.d/my-loadpackages.el")
(add-hook 'after-init-hook '(lambda ()
      (load "~/.emacs.d/my-noexternals.el")
      (windmove-default-keybindings)
))

(load-theme 'wombat t)

(when (fboundp 'winner-mode)
  (winner-mode 1))





