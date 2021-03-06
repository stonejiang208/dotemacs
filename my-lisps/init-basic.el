;; -*- Emacs-Lisp -*-
;; Time-stamp: <2017-05-22 11:24:37 by jiangtao>
;;
(setq user-mail-address "jiangtao@tao-studio.net")
(setq user-full-name    "Stone Jiang")

(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(defconst *is-gui* (if window-system t nil))
(when *win32*
	(require 'init-win32))

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier 'ctrl)
  (setq default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(0.001))
	(require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil)
  (when *is-cocoa-emacs*
    ;; Woohoo!!
		;;(set-frame-parameter nil 'fullscreen 'fullboth)
    (global-set-key (kbd "M-`") 'ns-next-frame)
    (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
    (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports
    (global-set-key (kbd "M-c") 'ns-copy-including-secondary)
		))

(fset 'yes-or-no-p 'y-or-n-p)
(setq scroll-margin 3 scroll-conservatively 10000)
(setq ring-bell-function 'ignore)
(when *is-gui*
	(tool-bar-mode -1)
	(scroll-bar-mode -1)
	)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq dired-dwim-target t)
(if (eq system-type 'darwin)
    (setq exec-path
          (append 
           '("/Applications/Firefox3.app/Contents/MacOS"
             "/usr/local/bin"
             "/opt/local/bin")
           exec-path)))

;; Setting PATH... why... my Emacs does not seem to inherit PATH from
;; .MacOSX/environment.plist, ~/.bash_profile, nor /etc/bashrc on my Mac :(
(if (eq system-type 'darwin)
    (setenv "PATH" 
	    "/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"))

(when  *is-gui*
  (require 'init-font)
  (if *win32* (set-font "Consolas" "Microsoft YaHei" 14 16)  (set-font "Consolas" "STHeiti" 12 14) 
	)
	)

;; Character encoding
(if (eq system-type 'darwin)
    (progn
      (prefer-coding-system 'utf-8-unix)
      (set-default-coding-systems 'utf-8-unix)
      (if (< emacs-major-version 23)
          (set-keyboard-coding-system 'utf-8))
      (set-clipboard-coding-system 'utf-8)
      (set-terminal-coding-system 'utf-8)))
(if (or (eq system-type 'gnu/linux)
        (eq system-type 'windows-nt))
    (progn
      (prefer-coding-system 'utf-8-unix)
      (load-library "iso-transl")))

(define-coding-system-alias 'utf-8-emacs 'utf-8) ; needed by bbdb...

(setq tab-width 2)
(setq default-tab-width 2)
(setq c-basic-offset 2)
(global-font-lock-mode t)
(when *is-gui*
	(global-hl-line-mode 1))
(show-paren-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq echo-keystrokes 0.1)
(setq x-select-enable-clipboard t)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;(tool-bar-mode -1)
(require 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S by %u")
;;
(require 'template)
(template-initialize)
(setq template-default-directories 
      '("~/.emacs.d/templates/"))

(require 'linum);
(setq linum-format "%3d")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))
(setq column-number-mode t)
(require 'ahei-misc)
(require 'eval-after-load)
(require 'view-mode-settings)

;; (require 'weblogger)
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))

(provide 'init-basic)

