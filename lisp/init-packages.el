;; 定义需要的包
(defvar choug/packages '(
       bind-key
       use-package
       company
       spacemacs-theme
       swiper
       counsel
       counsel-projectile
       smex             ;; counsel-M-x 用这个统计使用频率,安装上即可
       smartparens
       exec-path-from-shell
       popwin
       expand-region
       iedit
       which-key
       ;; evil-leader
       ;; cnfonts
       spaceline
       winum
       yaml-mode
       csv-mode
       toml-mode
       ) "Default Packages")

;; 定义不需要卸载的包列表为自定义的变量
;; 在使用package-autoremove时不会自动删除
(setq package-selected-packages choug/packages)

;; 检测是否所有包均被安装
(defun choug/packages-installed-p ()
  (cl-loop for pkg in choug/packages
  when (not (package-installed-p pkg)) do (cl-return nil)
  finally (cl-return t)))

;; 如果有包没有安装,则安装之
(unless (choug/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg choug/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 开启全局 Company 补全
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.08)
  (setq company-backends
  '(company-files
    (company-semantic company-dabbrev-code company-gtags company-etags company-keywords)
    company-dabbrev))
  :bind (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :diminish company-mode)

;; swiper的依赖项目
(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (defun choug/swiper-dwim ()
    (interactive)
    (swiper (ivy-thing-at-point)))
  (bind-key "C-S-s" 'choug/swiper-dwim)
  )

;; counsel相关
(use-package counsel
  :ensure t
  :bind (("M-x" . 'counsel-M-x)
   ("C-M-s" . 'counsel-projectile-rg)
   ("C-x C-f" . 'counsel-find-file)
   ("C-h f" . 'counsel-describe-function)
   ("C-h v" . 'counsel-describe-variable)
   ("C-c f r" . 'counsel-recentf))
  )

(use-package counsel-projectile
  :ensure t
  :bind (("C-c p f" . 'counsel-projectile-find-file)
   ("C-c p p" . 'counsel-projectile-switch-project))
  :config
  (counsel-projectile-mode t)
  (setq counsel-projectile-rg-initial-input '(ivy-thing-at-point))
  )

;; 配置smex,以后可能会被ivy等代替
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; 主题配置
(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

;; 自动括号配对
(use-package smartparens
  :ensure t
  :defer t
  :init
  (require 'smartparens-config)
  :config
  (setq sp-show-pair-from-inside t)
  (smartparens-global-mode t)
  :diminish smartparens-mode)

;; 定义打开特定文件的模式,但不打算在shell中查看js文件
;; (use-package js2-mode
;;   :defer t
;;   :mode "\\.js\\'")

;; emacs继承环境变量
(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (when (string-match-p "/zsh$" (getenv "SHELL"))
    ;; Use a non-interactive login shell.  A login shell, because my
    ;; environment variables are mostly set in `.zprofile'.
    (setq exec-path-from-shell-arguments '("-l")))

  (exec-path-from-shell-initialize)
  )


;; 当打开帮助窗口时,光标自动聚焦到帮助窗口中,按下C-g后又恢复到原来位置
(use-package popwin
  :ensure t
  :config
  (popwin-mode 1))

;; 开启expand-region
(use-package expand-region
  :ensure t
  :bind ("C-=" . 'er/expand-region))

;; 开启iedit
(use-package iedit
  :ensure t
  :bind ("C-;" . iedit-mode)
  :commands (iedit-mode))

;; 开启which key mode
(use-package which-key
  :ensure t
  :config (which-key-mode)
  :diminish which-key-mode)

;; 状态栏主题配置
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq powerline-default-separator 'wave))

;; 状态栏上显示窗口号
(use-package winum
  :ensure t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode)
  :diminish winum-mode)
(use-package ansi-color)

(provide 'init-packages)
