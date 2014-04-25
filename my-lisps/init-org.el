;;; init-org.el --- 

;; Copyright 2014 Stone Jiang
;;
;; Author: jiangtao@tao-studio.net
;; Version: $Id: init-org.el,v 0.0 2014-03-22 05:46:49 jiangtao Exp $
;; Keywords: 
;; X-URL: not distributed yet

(require 'org-install)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; jiangtao add code here
(global-set-key [f2] 'org-agenda)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cg" 'ra/gtd)
(global-set-key "\C-cp" 'ra/proj)
(global-set-key "\C-cn" 'ra/note)
(global-set-key "\C-cw" 'ra/review)

;;(setq org-startup-indented t)
;; functions for special org-files
(defun ra/gtd ()
   (interactive)
   (find-file 
    (cond
     ((eq system-type 'windows-nt)
      "d:/jiangtao/gtd/tasks.org")
     ((eq system-type 'darwin)
      "~/gtd/tasks.org")
     ((eq system-type 'gnu/linux)
      "~/gtd/tasks.org")))
   (delete-other-windows))
(defun ra/proj ()
   (interactive)
   (find-file 
    (cond
     ((eq system-type 'windows-nt)
      "d:/jiangtao/gtd/projects.org")
     ((eq system-type 'darwin)
      "~/gtd/projects.org")
     ((eq system-type 'gnu/linux)
      "~/gtd/projects.org")))
   (delete-other-windows))

(defun ra/note ()
  (interactive)
   (find-file
    (cond
     ((eq system-type 'windows-nt)
      "d:/jiangtao/gtd/notes.org")
     ((eq system-type 'darwin)
      "~/gtd/notes.org")
     ((eq system-type 'gnu/linux)
      "~/gtd/notes.org")))
   (delete-other-windows))
(defun ra/review ()
   (interactive)
   (find-file
    (cond
     ((eq system-type 'windows-nt)
      "d:/jiangtao/gtd/review.org")
     ((eq system-type 'darwin)
      "~/gtd/review.org")
     ((eq system-type 'gnu/linux)
      "~/gtd/review.org")))
   (delete-other-windows))
(defun ra/order ()
  (interactive)
  (find-file "~/Documents/admin/orders.org")
  (delete-other-windows))
(defun ra/gtd-inbox ()
  (interactive)
  (find-file
   (cond
     ((eq system-type 'windows-nt)
      "d:/jiangtao/gtd/inbox.org")
     ((eq system-type 'darwin)
      "~/gtd/inbox.org")
     ((eq system-type 'gnu/linux)
      "~/gtd/inbox.org")))
  (delete-other-windows))

;; main org directory
(setq org-directory
      (cond
       ((eq system-type 'windows-nt)
        "d:/jiangtao/gtd")
       ((eq system-type 'darwin)
        "~/gtd")
       ((eq system-type 'gnu/linux)
        "~/gtd")))

;; misc setup
(setq org-modules
      '(org-bbdb org-bibtex org-crypt)
      ;; how to archive
      org-archive-location "archive/%s.old::* Archive"
      ;; logging
      org-log-done nil ; using the logbook instead
      org-log-into-drawer "LOGBOOK"
      org-clock-into-drawer t
      ;; refiling
      org-refile-targets
      '(("someday.org" :level . 1)
        ("inbox.org" :level . 1)
        ("tasks.org" :level . 1)
        ("projects.org" :maxlevel . 2))
      ;; setup todo keywords and efforts
      org-todo-keywords 
      '("TODO" "NEXT(n!)" "WAITING(w@/!)" "|" "CANCELLED(c@)" "DEFERRED(m@)" "DONE(d!)")
      org-effort-property "effort"
      org-global-properties 
      '(("effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))
      ;; global tags
      org-tag-alist
      '(("@home" . ?h)
        ("@office" . ?o)
        ("@phone" . ?p)
        ("@cms" . ?w)
        ("@computer" . ?c)
        ("@errands" . ?e)
        ("@bvc" . ?b)
        ("@ltlunch" . ?l)
        ("@2020" . ?2)
        ("someday" . ?s)
        ("@gul" . ?g)
        ("flov" . ?f))
      ;; blank lines
      org-cycle-separator-lines 2
      org-blank-before-new-entry
      '((heading)
        (plain-list-item))
      ;; links
      org-link-mailto-program '(vm-mail "%a" "%s")
      org-email-link-description-format "Email %c: %.50s"
      org-link-frame-setup
      '((vm . vm-visit-folder)
        (gnus . gnus)
        (file . find-file-other-window)))

;; agenda setup
(setq org-agenda-files
      ;; add notes.org?
      (cond
       ((eq system-type 'windows-nt)
        (list
         "d:/jiangtao/gtd/inbox.org"
         "d:/jiangtao/gtd/tasks.org"
         "d:/jiangtao/gtd/review.org"
         "d:/jiangtao/gtd/gtd.org"
				 "d:/jiangtao/gtd/someday.org"
         "d:/jiangtao/gtd/projects.org"))
       ((eq system-type 'darwin)
        (list
         "~/gtd/inbox.org"
         "~/gtd/tasks.org"
				 "~/gtd/gtd.org"
				 "~/gtd/review.org"
				 "~/gtd/someday.org"
         "~/gtd/projects.org"))
       ((eq system-type 'gnu/linux)
        (list
         "~/gtd/inbox.org"
         "~/gtd/tasks.org"
				 "~/gtd/gtd.org"
				 "~/gtd/review.org"
				 "~/gtd/someday.org"
         "~/gtd/projects.org"))))

(setq org-agenda-include-diary t
      org-agenda-include-all-todo t
      org-columns-default-format "%60ITEM %TODO %TAGS %6effort(EFFORT){:} class="string">"
      org-tags-column -90)

;; custom agenda commands
(setq org-agenda-custom-commands
      '(("i" "Inbox entries" tags "CATEGORY=\"Stuff\"")))

;; higiligt the cursor row in agenda view
(add-hook 'org-agenda-mode-hook 
          (lambda ()
            (hl-line-mode t)
            (local-set-key (kbd "r") 'org-agenda-refile)
            (local-set-key (kbd "R") 'org-agenda-redo)))

;; adding shortcuts
(add-hook 'org-mode-hook 
          (lambda () 
            (auto-fill-mode 1)
            (local-set-key (kbd "C-c t") 'org-todo)
            (local-set-key (kbd "C-c e") 'org-set-effort)
            (local-set-key (kbd "C-c i") 'ra/gtd-inbox)
            (local-set-key (kbd "C-c C-r") 'org-decrypt-entry)))

;; remember-mode is since org-mode version 7 replaced by org-capture
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-capture-templates
      '(("y" "Task" entry
         (file+headline "inbox.org" "Inbox")
         "* TODO %^{description} %^g%^{effort}p\n  :LOGBOOK:\n  - State \"TODO\"       from \"\"           %U\n  :END:\n\n  %?%i \n  :%a: class="string">")
        ("t" "Task woL" entry
         (file+headline "inbox.org" "Inbox")
         "* TODO %^{description} %^g%^{effort}p\n  :LOGBOOK:\n  - State \"TODO\"       from \"\"           %U\n  :END:\n\n  %?%i \n")
        ("s" "Someday" entry
         (file+headline "inbox.org" "Inbox")
         "* %^{description} :someday:%^g%^{effort}p\n  :PROPERTIES:\n  :added:    %U\n  :END:\n\n  %?%i \n")))


;; jiangtao add code end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'init-org)
;;; init-org.el ends here
