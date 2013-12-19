;;; my-autocomplete-settings.el --- 

;; Copyright 2013 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: my-autocomplete-settings.el,v 0.0 2013/11/23 10:45:34 jiangtao Exp $
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
;;   (require 'my-autocomplete-settings)

;;; Code:

(defcustom mycustom-system-include-paths
  '(
    "./include/"
    "/opt/local/include"
    "/Users/jiangtao/ios/dre-x.2.1/host/ACE_wrappers"
    "/usr/include" )
  "This is a list of include paths that are used by the clang auto completion."
  :group 'mycustom
  :type '(repeat directory)
  )

(require  'pos-tip)
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/site-lisps/auto-complete-1.3.1/dict/")
(ac-config-default)

(global-auto-complete-mode t)
(define-key ac-mode-map [(control enter)] 'auto-complete)
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "/usr/local/bin/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (append
               mycustom-system-include-paths
               )
              )
      )
(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;;; my-autocomplete-settings.el ends here
(provide 'my-autocomplete-settings)
