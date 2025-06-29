;;; -*- lexical-binding: t; -*-

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d.shell/init.el"))

;; 切换到刚才打开过的buffer
(defun choug/goto-last-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; 对于带有ansi色彩标记的文本(比如rails等web框架的log),使用此函数显示颜色
(defun choug/display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(provide 'init-funcs)
