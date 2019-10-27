;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
;; (global-linum-mode 1)
(global-display-line-numbers-mode 1)

;; 更改光标的样式,不喜欢,不用
;; (setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 配置字体
;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(set-face-attribute
 'default nil
 :font (font-spec :name "-*-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 15.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (if (display-graphic-p)
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :name "-*-STKaiti-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		  :weight 'normal
		  :slant 'normal
		  :size 18.0))))

;; 开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮当前行
(global-hl-line-mode t)

;; 状态栏使用spacemacs自带的spaceline,图更新多
(spaceline-spacemacs-theme)
(setq powerline-default-separator 'wave)

;; 显示窗口号
;; 配置spaceline前方(归winum管理)不显示窗口号
;; 因为spaceline自己会显示窗口号
(setq winum-auto-setup-mode-line nil)
(winum-mode)

(provide 'init-ui)
