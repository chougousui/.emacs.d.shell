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

(provide 'init-funcs)
