;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "C-c f e d") 'open-init-file)

;; swiper相关快捷键
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-S-s") 'choug/swiper-dwim)
(global-set-key (kbd "C-M-s") 'counsel-projectile-rg)

;; counsel相关
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; projectile相关
(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)

;; counsel版的recentf可以在小窗口中展示列表,比recentf好
(global-set-key (kbd "C-c f r") 'counsel-recentf)

;; expand-region相关
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit相关
(global-set-key (kbd "C-;") 'iedit-mode)

;; evil相关
;; 仅仅在evil-mode下有用
;; (evil-leader/set-leader "M-m")
;; (evil-leader/set-key
;;   "p f" 'counsel-projectile-find-file
;;  "p p" 'counsel-projectile-switch-project)

;; 使用与spacemacs相同的注释掉一行的功能,
;; 不会与M-;冲突
(global-set-key (kbd "C-c c l") 'comment-line)

;; company候选词选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-keybindings)
