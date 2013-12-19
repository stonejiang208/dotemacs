
;; wubi input method
(require 'wubi)
(wubi-load-local-phrases) ; add user's Wubi phrases

(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

;(if (< emacs-major-version 21)
 ;   (setup-chinese-gb-environment)
 ; (set-language-environment 'Chinese-GB))

(setq default-input-method "chinese-wubi")
(provide 'wubi-settings)
