;;; init-ycmd.el --- 

;; Copyright 2017 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: init-ycmd.el,v 0.0 2017-03-20 08:23:45 root Exp $
;; Keywords: 
;; X-URL: not distributed yet

;;; Code:
;; company mode

(add-hook 'c++-mode-hook 'global-company-mode)

;; ycmd
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

(set-variable 'ycmd-server-command '("python" "/Users/jiangtao/live-src/ycmd/ycmd"))
(set-variable 'ycmd-extra-conf-whitelist '("/Users/jiangtao/cppwizard/console/*"));
(set-variable 'ycmd-global-config "/Users/jiangtao/.emacs.d/.ycm_extra_conf.py")  
(require 'company-ycmd)
(company-ycmd-setup)

(provide 'init-ycmd)
