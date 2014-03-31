;; -*- Emacs-Lisp -*-
;; Time-stamp: <2014-03-22 10:49:17 by jiangtao>

(fset 'yes-or-no-p 'y-or-n-p)
;; 防止页面滚动时跳动,scroll-margin 3可以在靠近屏幕边沿3行时就开始滚动,
;; 可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 语法高亮
(global-font-lock-mode t)

;;turn on highlighting current line
(global-hl-line-mode 1)

;; 显示匹配的括号
(show-paren-mode t)

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq major-mode 'text-mode)

;; 显示列号
(setq column-number-mode t)

;; use UTF-8
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq mouse-yank-at-point t);支持中键粘贴
(transient-mark-mode t);允许临时设置标记
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
;在标题栏显示buffer名称
(setq frame-title-format '("" buffer-file-name "@emacs" ))
(auto-fill-mode t)
(setq fill-column 80);默认显示 80列就换行
;; 在状态栏显示日期时间
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
;; (display-time)
;; disable tool bar
(tool-bar-mode -1)
;; 尽快显示按键序列
(setq echo-keystrokes 0.1)
(setq tab-width 2);

;鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;;
(global-set-key [f4] 'eshell)
(global-set-key [f3] 'log-edit-comment-to-change-log)
(global-set-key [f7] 'compile)

;; 不显示Emacs的开始画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; ;; 不要闪烁光标, 烦不烦啊
(blink-cursor-mode -1)
;; ;; 没有提示音,也不闪屏
 (setq ring-bell-function 'ignore)

;; ;;在行首C-k时,同时删除该行
;; (setq-default kill-whole-line t)

;; ;; 使终端支持鼠标
;; (define-key global-map (kbd "C-x T") 'xterm-mouse-mode)

(require 'linum);
(setq linum-format "%3d")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))



(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :family "Consolas")
  (set-face-attribute 'default nil :height 140)
  ;;(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  )
(when  (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier 'ctrl)
  (setq default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(0.001))
  


;; 中文
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue2);
(color-theme-classic);

(require 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S by %u")

(require 'dired+)

;(require 'w3m-load)
;(setq browse-url-browser-function 'w3m-browse-url)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
;(global-set-key "\C-xo" 'browse-url-at-point)
;(require 'w3m)


(provide 'basic-settings)

