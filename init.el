;; -*- Emacs-Lisp -*-
;; Time-stamp: <2014-03-22 14:02:19 by jiangtao>

(setq user-mail-address "jiangtao@tao-studio.net")
(setq user-full-name    "Stone Jiang")


(defconst my-emacs-path "/Users/jiangtao/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;;Path for templates
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue2);
;;(color-theme-classic);

(require 'init-basic)
(require 'init-company)
(require 'all-auto-complete-settings)
(require 'init-dev)
(require 'init-org)

