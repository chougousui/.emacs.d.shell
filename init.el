(setq user-emacs-directory "~/.emacs.d.shell")
(add-to-list 'load-path "~/.emacs.d.shell/lisp")
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d.shell/elpa/use-package-20190716.1829")
  (require 'use-package))

(require 'init-funcs)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;; (load-file custom-file)
