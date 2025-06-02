;;; -*- lexical-binding: t; -*-

;; 静音elpa第三方文件夹中关于lexical-binding的警告
(setq warning-suppress-types '((files)))

;; 第一次使用该配置文件会找不到use-package的位置
;; 为了使用package-list-package时能够看到use-package
;; 事先添加melpa源
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  )

;; 提前加载一些位于custom.el中的自定义变量
(setq user-emacs-directory "~/.emacs.d.shell")
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;; 考虑到自定义变量中定义了安装依赖包的位置
;; 故接下来加载位于lisp下的一些自定义文件
(add-to-list 'load-path "~/.emacs.d.shell/lisp")
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; 减少变量未定义的警告
(setq native-comp-jit-suck-context t)

(require 'init-funcs)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
