;;; init-ycmd.el --- 

;; Copyright 2017 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: init-ycmd.el,v 0.0 2017-03-20 08:23:45 root Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-ycmd)

;;; Code:
;; company mode

(add-hook 'c++-mode-hook 'global-company-mode)

;; ycmd
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

(set-variable 'ycmd-server-command '("python" "/root/live-src/ycmd/ycmd"))
(set-variable 'ycmd-extra-conf-whitelist '("/root/cppwizard/console/*"));

(require 'company-ycmd)
(company-ycmd-setup)

(provide 'init-ycmd)
