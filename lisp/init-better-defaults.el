;; 自动加载磁盘上已经修改的文件
(global-auto-revert-mode t)

;; 关闭备份文件的功能
(setq make-backup-files nil)

;; 关闭自动保存的功能
(setq auto-save-default nil)

;; 取消警告声音
(setq ring-bell-function 'ignore)

;; 全选后输入字符则删除被选择
(delete-selection-mode 1)

;; 显示成对括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 最近文件数量
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 使用y或n简化回答方式
(fset 'yes-or-no-p 'y-or-n-p)

;; 默认使用光标下的字符串作为helm-projectile-rg的搜索对象
(setq counsel-projectile-rg-initial-input '(ivy-thing-at-point))

(provide 'init-better-defaults)
