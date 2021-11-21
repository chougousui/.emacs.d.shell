;; 第一次使用该配置文件会找不到use-package的位置
;; 为了使用package-list-package时能够看到use-package
;; 事先添加melpa源
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  )

(setq user-emacs-directory "~/.emacs.d.shell")
(add-to-list 'load-path "~/.emacs.d.shell/lisp")
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

(require 'init-funcs)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;; (load-file custom-file)
