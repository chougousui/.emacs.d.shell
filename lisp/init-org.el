;; 开启org-mode中代码块的彩色显示
(require 'org)
(setq org-src-fontify-natively t)

;; 默认打开org缩进
(setq org-startup-indented t)

;;设置org-mode默认展开情况
(setq org-startup-folded 'content)

;;默认展开到最高的两级大纲
(add-hook 'find-file-hook
          (lambda ()
            (if (and (string-equal major-mode "org-mode") (not (string-equal buffer-file-name "/Users/choug/Dropbox/E560_ubuntu/notes/愿望清单.org")))
                (org-shifttab 2))))

;;TODO的状态增加
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "LATER")))
(setq org-todo-keyword-faces
      '(("LATER" . "brown")))

;; TODO org-mode的粘贴函数(目前标题部分有问题)
(defun choug/paste-html2org-clipboard()
  "Convert clipboard contents from HTML to Org and then past."
  (interactive)
  (kill-new (shell-command-to-string "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | pandoc -f html -t org | gsed 's/\\\\\\\\$//g;s/。/./g;s/，/,/g;s/、/,/g;s/？/?/g;s/！/!/;s/（/(/g;s/）/)/g;s/：/:/g;s/；/;/g;s/\xC2\xA0/ /g'"))
  (yank)
  (org-table-map-tables 'org-table-align))

(provide 'init-org)
