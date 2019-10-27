;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d.shell/init.el"))

;; swiper, do what I mean
(defun choug/swiper-dwim ()
  (interactive)
  (swiper (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (thing-at-point 'symbol)
            ))
  )

(provide 'init-funcs)
