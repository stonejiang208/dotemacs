;;;;;;;;


(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))


(setq org-directory "~/workspace/gtd")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(global-set-key [f2] 'gtd)


(setq org-tag-alist '((:startgroup . nil)
		      ("@office" . ?o)
		      ("@home" . ?h)
		      ("@coffee" . ?c)
		      (:endgroup . nil)
		      (:startgroup . nil)
		      ("@platform" . ?P)
		      ("@other" . ?O)
		      (:endgroup . nil)
		      ("mbp" . ?m) ("pc" . ?p) ("linux" .?l ) ("handset" .?i)))

(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|"
			"CANCELLED(c@/!)" ))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
(defun gtd ()
 (interactive)
 (find-file  (concat org-directory "/gtd.org"))
)

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))


;; (setq org-capture-templates
;;       (quote (
;; 	      ("t" "todo" entry (file  "~/workspace/gtd/inbox.org") "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;; 	      ("r" "respond" entry (file  "~/workspace/gtd/gtd.org") "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;; 	      ("n" "note" entry (file "~/org/refile.org")
;; 	       "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;; 	      ("j" "Journal" entry (file+datetree "~/org/diary.org")
;; 	       "* %?\n%U\n" :clock-in t :clock-resume t)
;; 	      ("w" "org-protocol" entry (file "~/org/refile.org")
;; 	       "* TODO Review %c\n%U\n" :immediate-finish t)
;; 	      ("m" "Meeting" entry (file "~/org/refile.org")
;; 	       "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;; 	      ("p" "Phone call" entry (file "~/org/refile.org")
;; 	       "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;; 	      ("h" "Habit" entry (file "~/org/refile.org")
;; 	       "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/workspace/gtd/inbox.org" "Tasks")
	 "* TODO %?\n  %i [%T]\n ")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Note" entry (file "~/org/note.org")
	 "* %? \n%U\n%a\n")
	))

(setq org-agenda-custom-commands
'(
  ("p" "Projects"   
   ((tags "PROJECT")))

  ("h" "Office and Home Lists"
   ((agenda)
    (tags-todo "office")
    (tags-todo "home")
    (tags-todo "coffee")
    (tags-todo "DVD")
    (tags-todo "READING")))

  ("d" "Daily Action List"
   (
    (agenda "" ((org-agenda-ndays 1)
		(org-agenda-sorting-strategy
		 (quote ((agenda time-up priority-down tag-up) )))
		(org-deadline-warning-days 0)
		))))
  )
)


; Targets complete directly with IDO
;(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
;(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
;(setq org-completion-use-ido t)
;(setq ido-everywhere t)
;(setq ido-max-directory-size 100000)
;(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
;(setq ido-default-file-method 'selected-window)
;(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
;(setq org-indirect-buffer-display 'current-window)


(provide 'org-settings)
