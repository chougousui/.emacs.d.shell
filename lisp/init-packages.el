;; 为使用common lisp的语法中的loop函数
(require 'cl)

;; 配置使用melpa源
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)
  )

;; 定义需要的包
(defvar choug/packages '(
			 company
			 spacemacs-theme
			 hungry-delete
			 swiper
			 counsel
			 counsel-projectile
			 smex             ;; counsel-M-x 用这个统计使用频率,安装上即可
			 smartparens
			 js2-mode
			 exec-path-from-shell
			 popwin
			 expand-region
			 iedit
			 which-key
			 ;; evil-leader
			 ;; cnfonts
			 spaceline
			 winum
			 ) "Default Packages")

;; 定义不需要卸载的包列表为自定义的变量
;; 在使用package-autoremove时不会自动删除
(setq package-selected-packages choug/packages)

;; 检测是否所有包均被安装
(defun choug/packages-installed-p ()
  (loop for pkg in choug/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

;; 如果有包没有安装,则安装之
(unless (choug/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg choug/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 开启全局 Company 补全
(global-company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

;; 加载主题,不喜欢monokai
(load-theme 'spacemacs-dark t)

;; 一次删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper的依赖项目
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; 配置smex,以后可能会被ivy等代替
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; 自动括号配对
(require 'smartparens-config)
(smartparens-global-mode t)

;; 定义打开特定文件的模式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; emacs继承环境变量
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; 当打开帮助窗口时,光标自动聚焦到帮助窗口中,按下C-g后又恢复到原来位置
(require 'popwin)
(popwin-mode 1)

;; 开启projectile-mode使得切换项目的函数生效
(counsel-projectile-mode t)

;; 开启expand-region
(require 'expand-region)

;; 开启iedit
(require 'iedit)

;; 开启which mode
(require 'which-key)
(which-key-mode)

;; 仅仅在evil-mode下才有用
;; (global-evil-leader-mode)

;; 状态栏主题配置
(require 'spaceline-config)

;; 状态栏上显示窗口号
(require 'winum)

(provide 'init-packages)
