;;; init-dev.el --- 

;; Copyright 2014 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: init-dev.el,v 0.0 2014-03-22 02:27:35 jiangtao Exp $
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
;;   (require 'init-dev)

;;; Code:

(provide 'init-dev)
(eval-when-compile
  (require 'cl))

(setq c-default-style "ellemtel")
(require 'generic-x)
(require 'mpc-mode)
(require 'xcscope)
(require 'yasnippet-settings)

 (which-function-mode 1)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

 (autoload 'expand-member-functions "member-functions" "Expand C++ member function declarations" t)
 (add-hook 'c++-mode-hook (lambda () (local-set-key "\C-cm" #'expand-member-functions)))

(require 'git-emacs)
(require 'cmake-mode)
;;; init-dev.el ends here

(require 'android-mode)

(autoload 'smali-mode "smali-mode" "Major mode for editing and viewing smali issues" t)
(add-to-list 'auto-mode-alist '(".smali$" . smali-mode))
