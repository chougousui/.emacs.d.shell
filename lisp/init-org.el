(use-package org
  :defer t
  :config
  ;; 代码块中的彩色显示
  (setq org-src-fontify-natively t)
  ;; 默认打开缩进
  (setq org-startup-indented t)
  ;; 默认折叠所有到标题
  (setq org-startup-folded 'content)
  ;; todo增加选项
  (setq org-todo-keywords
	'((sequence "TODO" "|" "DONE" "LATER")))
  (setq org-todo-keyword-faces
	'(("LATER" . "brown")))
  ;; 自定义粘贴函数,目前有点不好用
  (defun choug/paste-html2org-clipboard()
    "Convert clipboard contents from HTML to Org and then past."
    (interactive)
    (kill-new (shell-command-to-string "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | pandoc -f html -t org | gsed 's/\\\\\\\\$//g;s/。/./g;s/，/,/g;s/、/,/g;s/？/?/g;s/！/!/;s/（/(/g;s/）/)/g;s/：/:/g;s/；/;/g;s/\xC2\xA0/ /g'"))
    (yank)
    (org-table-map-tables 'org-table-align))
  ;; 自定义2级大纲函数
  (defun choug/indent-top-2()
    (if (not (string-equal buffer-file-name "/Users/choug/Dropbox/E560_ubuntu/notes/愿望清单.org"))
        (org-shifttab 2)))
  (add-hook 'org-mode-hook
  	    (lambda ()
  	      (add-hook 'find-file-hook 'choug/indent-top-2 nil 'make-it-local)))
  )

(provide 'init-org)
