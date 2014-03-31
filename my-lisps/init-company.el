;;; init-company.el --- 

;; Copyright 2014 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: init-company.el,v 0.0 2014-03-22 02:53:55 jiangtao Exp $
;; Keywords: 


;;; Code:
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-begin-commands '(self-insert-command))
(define-key company-mode-map (kbd "M-RET") 'company-expand-top)

(am-add-hooks
 `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
                      java-mode-hook lisp-interaction-mode-hook sh-mode-hook
                      ruby-mode-hook)
 'company-mode)



(provide 'init-company)

;;; init-company.el ends here
