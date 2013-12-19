;; -*- Emacs-Lisp -*-

;; Time-stamp: <2013-12-17 22:45:49 by jiangtao>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;; file: dev-settings.el
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(setq c-default-style "ellemtel"
     c-basic-offset 2)

;; todo: next line need to be fixed
(defconst user-head-file-dir (list
			      "."
			      "../header"
			      "../include"
			      "/usr/include/c++/4.2.1"
			      "/usr/local/include"
			      "/usr/include"
			      (getenv "ACE_ROOT")
			      (getenv "TAO_ROOT")
			      (concat (getenv "TAO_ROOT") "/orbsvcs")
			      (getenv "DDS_ROOT")
			      )
  "user header files")


(define-key global-map (kbd "RET") 'newline-and-indent)


(defun generate-tag-table ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (let ((exp "") (dir ""))
    (setq dir (read-from-minibuffer "generate tags in: " default-directory)
          exp (read-from-minibuffer "suffix: "))
    (with-temp-buffer
      (shell-command
       (concat "find " dir " -name \"" exp "\" | xargs etags ")
       (buffer-name)))))



(require 'autopair)
(autopair-global-mode)

(require 'generic-x)
;; 加载psvn
(require 'psvn)
;;(require 'gdb-ui)
;;(setq gdb-many-windows 1)

(require 'member-functions)
;; 使用模板
(require 'template)
(template-initialize)
(setq template-default-directories 
 '("~/.emacs.d/lisp/site-lisps/templates/"))

;(require 'yasnippet)
;(yas-global-mode 1)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/lisp/site-lisps/yasnippet-0.6.1c/snippets/")

(require 'mpc-mode)

(require 'xcscope)

;; lua-mode

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

; sourcepire
(require 'sourcepair);

;(require 'my-cedet-settings)


(require 'my-autocomplete-settings)


(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'dev-settings)
