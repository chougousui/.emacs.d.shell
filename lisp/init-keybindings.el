;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "C-c f e d") 'open-init-file)

;; evil相关
;; 仅仅在evil-mode下有用
;; (evil-leader/set-leader "M-m")
;; (evil-leader/set-key
;;   "p f" 'counsel-projectile-find-file
;;  "p p" 'counsel-projectile-switch-project)

;; 使用与spacemacs相同的注释掉一行的功能,
;; 不会与M-;冲突
(global-set-key (kbd "C-c c l") 'comment-line)

;; 切换到刚才打开过的buffer
(global-set-key (kbd "C-c TAB") 'choug/goto-last-buffer)

(provide 'init-keybindings)
