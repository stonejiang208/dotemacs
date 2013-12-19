;; -*- Emacs-Lisp -*-
;; 个人信息
(setq user-mail-address "jiangtao@tao-studio.net")
(setq user-full-name    "Stone Jiang")

(defconst my-emacs-path "/Users/jiangtao/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "lisp/my-lisps/") "我自己写的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisp/site-lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "lisp/site-lisps/templates/") "Path for templates")

(setq x-select-enable-clipboard t)
(when (eq system-type 'darwin)
	(setq mac-command-modifier 'ctrl)
	(setq mac-option-modifier 'meta)
	(global-set-key [kp-delete] 'delete-char)
)


(let ((default-directory "~/.emacs.d/"))
 (setq load-path
       (append
        (let ((load-path (copy-sequence load-path))) ;; Shadow
          (normal-top-level-add-subdirs-to-load-path))
        load-path)))



(require 'basic-settings)
(require 'dev-settings)
(require 'org-settings)
;(require 'tex-settings)
;(require 'my-org-setting)
;(require 'w3m-settings)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(org-agenda-files (quote ("~/workspace/gtd/someday.org" "/Users/jiangtao/workspace/gtd/gtd.org" "/Users/jiangtao/workspace/gtd/inbox.org" "/Users/jiangtao/workspace/gtd/platform.org")))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
