;;; packages.el --- xtof-org Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq xtof-org-packages
      '(
        ;; package names go here
        org
        org-ac
        neotree
        ))

;; List of packages to exclude.
(setq xtof-org-excluded-packages '())

;; For each package, define a function xtof-org/init-<package-name>
;;
(defun xtof-org/init-org-ac ()
  "Initialize my package"
  (use-package org-ac
    :ensure t
    :defer t
    :init (progn
            (print "loade org ac")
            (org-ac/config-default))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  AGENDA

;;These too are Sacha's
;; Make it easy to mark a task as done
(defun xtof/org-agenda-done (&optional arg)
  "Mark current TODO as done.
         This changes the line at point, all other lines in the agenda referring to
         the same tree node, and the headline of the tree node in the Org-mode file."
  (interactive "P")
  (org-agenda-todo "DONE"))


;; Make it easy to mark a task as done and create a follow-up task
(defun xtof/org-agenda-mark-done-and-add-followup ()
  "Mark the current TODO as done and add another task after it.
         Creates it at the same level as the previous task, so it's better to use
         this with to-do items than with projects or headings."
  (interactive)
  (org-agenda-todo "DONE")
  (org-agenda-switch-to)
  (org-capture 0 "t"))

;; Capture something based on the agenda
(defun xtof/org-agenda-new ()
  "Create a new note or task at under current agenda item. Best with projects."
  (interactive)
  (org-agenda-switch-to)
  (org-capture 0)
  ;;(org-backward-heading-same-level 1)
  (org-move-subtree-down 1)
  (org-metaright)
  (switch-to-prev-buffer)
  (agenda-redo))

;;inspired by http://doc.norang.ca/org-mode.html#GTD

;; (defun xtof/is-project-p ()
;;   "headlines with tag 'PROJ'"
;;   (save-restriction
;;     (widen)
;;     (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;       (save-excursion (not (equal nil (search-forward ":PROJ:" subtree-end t nil)))))))

(defun xtof/is-empty-project-p ()
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (save-excursion (equal nil (search-forward "**" subtree-end t nil))))))

(defun xtof/skip-non-empty-projects ()
  "Skip trees that are empty"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (xtof/is-empty-project-p)
          nil
        next-headline))))

(defun xtof/skip-non-stuck-projects ()
  "Skip trees that are empty or have next axtion(s)"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (xtof/is-empty-project-p)
          next-headline
        (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
               (has-next ))
          (save-excursion
            (forward-line 1)
            (while (and (not has-next) (< (point) subtree-end) 
                        (or (re-search-forward "^\\*+ WAITING" subtree-end t)
                            (re-search-forward "^\\*+ STARTED" subtree-end t)
                            (re-search-forward "^\\*+ NEXT" subtree-end t)))
              (setq has-next t)))
          (if has-next
              next-headline
            nil))) ; a stuck project, has subtasks but no next task
      )))

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun xtof/org-complete-cmp (a b)
  (let* ((state-a (or (get-text-property 1 'todo-state a) ""))
         (state-b (or (get-text-property 1 'todo-state b) "")))
    (or
     (if (member state-a org-done-keywords-for-agenda) 1)
     (if (member state-b org-done-keywords-for-agenda) -1))))

(defun xtof/org-get-context (txt)
  "Find the context."
  (car (member-if
        (lambda (item) (string-match "@" item))
        (get-text-property 1 'tags txt))))

(defun xtof/org-context-cmp (a b)
  "Compare CONTEXT-A and CONTEXT-B."
  (let ((context-a (xtof/org-get-context a))
        (context-b (xtof/org-get-context b)))
    (cond
     ((null context-a) +1)
     ((null context-b) -1)
     ((string< context-a context-b) -1)
     ((string< context-b context-a) +1)
     (t nil))))

(defun xtof/org-compare-dates (a b)
  "Return 1 if A should go after B, -1 if B should go after A, or 0 if a = b."
  (cond
   ((and (= a 0) (= b 0)) nil)
   ((= a 0) 1)
   ((= b 0) -1)
   ((> a b) 1)
   ((< a b) -1)
   (t nil)))

(defun xtof/org-min-date (a b)
  "Return the smaller of A or B, except for 0."
  (funcall (if (and (> a 0) (> b 0)) 'min 'max) a b))

(defun xtof/org-date-cmp (a b)
  (let* ((sched-a (or (get-text-property 1 'org-scheduled a) 0))
         (sched-b (or (get-text-property 1 'org-scheduled b) 0))
         (deadline-a (or (get-text-property 1 'org-deadline a) 0))
         (deadline-b (or (get-text-property 1 'org-deadline b) 0)))
    (or
     (xtof/org-compare-dates
      (xtof/org-min-date sched-a deadline-a)
      (xtof/org-min-date sched-b deadline-b)))))

(defun xtof/org-sort-agenda-items-todo (a b)
  (or
   (org-cmp-time a b)
   (xtof/org-complete-cmp a b)
   (xtof/org-context-cmp a b)
   (xtof/org-date-cmp a b)
   (org-cmp-todo-state a b)
   (org-cmp-priority a b)
   (org-cmp-effort a b)))

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar xtof/org-agenda-limit-items nil "Number of items to show in agenda to-do views; nil if unlimited.")
;; (eval-after-load 'org
;;   '(defadvice org-agenda-finalize-entries (around xtof activate)
;;      (if xtof/org-agenda-limit-items
;;          (progn
;;            (setq list (mapcar 'org-agenda-highlight-todo list))
;;            (setq ad-return-value
;;                  (subseq list 0 xtof/org-agenda-limit-items))
;;            (when org-agenda-before-sorting-filter-function
;;              (setq list (delq nil (mapcar org-agenda-before-sorting-filter-function list))))
;;            (setq ad-return-value
;;                  (mapconcat 'identity
;;                             (delq nil 
;;                                   (subseq
;;                                    (sort list 'org-entries-lessp)
;;                                    0
;;                                    xtof/org-agenda-limit-items))
;;                             "\n")))
;;        ad-do-it)))

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun xtof/org-agenda-skip-scheduled ()
  (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "\n]+>"))

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun xtof/org-agenda-project-agenda ()
  "Return the project headline and up to `xtof/org-agenda-limit-items' tasks."
  (save-excursion
    (let* ((marker (org-agenda-new-marker))
           (heading
            (org-agenda-format-item "" (org-get-heading) (org-get-category) nil))
           (org-agenda-restrict t)
           (org-agenda-restrict-begin (point))
           (org-agenda-restrict-end (org-end-of-subtree 'invisible))
           ;; Find the TODO items in this subtree
           (list (org-agenda-get-day-entries (buffer-file-name) (calendar-current-date) :todo)))
      (org-add-props heading
          (list 'face 'defaults
                'done-face 'org-agenda-done
                'undone-face 'default
                'mouse-face 'highlight
                'org-not-done-regexp org-not-done-regexp
                'org-todo-regexp org-todo-regexp
                'org-complex-heading-regexp org-complex-heading-regexp
                'help-echo
                (format "mouse-2 or RET jump to org file %s"
                        (abbreviate-file-name
                         (or (buffer-file-name (buffer-base-buffer))
                             (buffer-name (buffer-base-buffer))))))
        'org-marker marker
        'org-hd-marker marker
        'org-category (org-get-category)
        'type "tagsmatch")
      (concat heading "\n"
              (org-agenda-finalize-entries list)))))

(defun xtof/org-agenda-projects-and-tasks (match)
  "Show TODOs for all `org-agenda-files' headlines matching MATCH."
  (interactive "MString: ")
  (let ((todo-only nil))
    (if org-agenda-overriding-arguments
        (setq todo-only (car org-agenda-overriding-arguments)
              match (nth 1 org-agenda-overriding-arguments)))
    (let* ((org-tags-match-list-sublevels
            org-tags-match-list-sublevels)
           (completion-ignore-case t)
           rtn rtnall files file pos matcher
           buffer)
      (when (and (stringp match) (not (string-match "\\S-" match)))
        (setq match nil))
      (setq matcher (org-make-tags-matcher match)
            match (car matcher) matcher (cdr matcher))
      (catch 'exit
        (if org-agenda-sticky
            (setq org-agenda-buffer-name
                  (if (stringp match)
                      (format "*Org Agenda(%s:%s)*"
                              (or org-keys (or (and todo-only "M") "m")) match)
                    (format "*Org Agenda(%s)*" (or (and todo-only "M") "m")))))
        (org-agenda-prepare (concat "TAGS " match))
        (org-compile-prefix-format 'tags)
        (org-set-sorting-strategy 'tags)
        (setq org-agenda-query-string match)
        (setq org-agenda-redo-command
              (list 'org-tags-view `(quote ,todo-only)
                    (list 'if 'current-prefix-arg nil `(quote ,org-agenda-query-string))))
        (setq files (org-agenda-files nil 'ifmode)
              rtnall nil)
        (while (setq file (pop files))
          (catch 'nextfile
            (org-check-agenda-file file)
            (setq buffer (if (file-exists-p file)
                             (org-get-agenda-file-buffer file)
                           (error "No such file %s" file)))
            (if (not buffer)
                ;; If file does not exist, error message to agenda
                (setq rtn (list
                           (format "ORG-AGENDA-ERROR: No such org-file %s" file))
                      rtnall (append rtnall rtn))
              (with-current-buffer buffer
                (unless (derived-mode-p 'org-mode)
                  (error "Agenda file %s is not in `org-mode'" file))
                (save-excursion
                  (save-restriction
                    (if org-agenda-restrict
                        (narrow-to-region org-agenda-restrict-begin
                                          org-agenda-restrict-end)
                      (widen))
                    (setq rtn (org-scan-tags 'xtof/org-agenda-project-agenda matcher todo-only))
                    (setq rtnall (append rtnall rtn))))))))
        (if org-agenda-overriding-header
            (insert (org-add-props (copy-sequence org-agenda-overriding-header)
                        nil 'face 'org-agenda-structure) "\n")
          (insert "Headlines with TAGS match: ")
          (add-text-properties (point-min) (1- (point))
                               (list 'face 'org-agenda-structure
                                     'short-heading
                                     (concat "Match: " match)))
          (setq pos (point))
          (insert match "\n")
          (add-text-properties pos (1- (point)) (list 'face 'org-warning))
          (setq pos (point))
          (unless org-agenda-multi
            (insert "Press `C-u r' to search again with new search string\n"))
          (add-text-properties pos (1- (point)) (list 'face 'org-agenda-structure)))
        (org-agenda-mark-header-line (point-min))
        (when rtnall
          (insert (mapconcat 'identity rtnall "\n") ""))
        (goto-char (point-min))
        (or org-agenda-multi (org-agenda-fit-window-to-buffer))
        (add-text-properties (point-min) (point-max)
                             `(org-agenda-type tags
                                               org-last-args (,todo-only ,match)
                                               org-redo-cmd ,org-agenda-redo-command
                                               org-series-cmd ,org-cmd))
        (org-agenda-finalize)
        (setq buffer-read-only t)))))

(defun xtof/org-agenda-setup-custom-commands ()
  (setq org-agenda-custom-commands
        `(("n" "Agend and all TODOSs"
           ((agenda "")
            (alltodo "")))
          ("T" tags-todo "TODO=\"TODO\"-goal-routine-SCHEDULED={.+}")
          ("b" todo "" ((org-agenda-files '("~/Dropbox/org/projects.org"))))
          ("n" todo ""
           (
            ;;(org-agenda-prefix-format "")
            (org-agenda-cmp-user-defined 'xtof/org-sort-agenda-items-todo)
            (org-agenda-view-columns-initially t)))

          ;; Weekly review
          ("w" "Weekly review" agenda ""
           ((org-agenda-span 7)
            (org-agenda-log-mode 1)))
          ("W" "Weekly review sans routines" agenda "" 
           ((org-agenda-span 7) 
            (org-agenda-log-mode 1)
            (org-agenda-tag-filter-preset '("-routine"))))
          ("2" "Bi-weekly review" agenda "" ((org-agenda-span 14) (org-agenda-log-mode 1)))

          ;; by contexts...todo: sort these by STARTED NEXT TODO WAITING
          ("cp" "Phone" tags-todo "@phone" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("cw" "Work" tags-todo "@work" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("cd" "Drawing" tags-todo "@drawing" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("co" "Coding" tags-todo "@coding" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("cw" "Writing" tags-todo "@writing" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("cc" "Computer" tags-todo "@computer" 
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          ("ce" "Errands" tags-todo "@errands"
           ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
            (org-agenda-view-columns-initially t)))
          
          ;; TODO: All NEXT by context
          ("0" "Top 3 by context"
           ,xtof/org-agenda-contexts
           ((org-agenda-sorting-strategy '(priority-up effort-down))
            (org-agenda-show-inherited-tags nil)
            ;; (org-tags-exclude-from-inheritance '("PROJ"))
            ;;also skip habits
            (xtof/org-agenda-limit-items 3)))
          (")" "All by context"
           ,xtof/org-agenda-contexts
           ((org-agenda-sorting-strategy '(priority-down effort-down))
            (org-agenda-show-inherited-tags nil)
            ;;(org-tags-exclude-from-inheritance '("PROJ"))
            ;; skip habits
            (xtof/org-agenda-limit-items nil)))

          ("9" "Unscheduled top 3 by context"
           ,xtof/org-agenda-contexts
           ((org-agenda-skip-function 'xtof/org-agenda-skip-scheduled)
            (org-agenda-sorting-strategy '(priority-down effort-down))
            (xtof/org-agenda-limit-items 3)))
          ("(" "All unscheduled by context"
           ,xtof/org-agenda-contexts
           ((org-agenda-skip-function 'xtof/org-agenda-skip-scheduled)
            (org-agenda-sorting-strategy '(priority-down effort-down))))

          ("d" "Timeline for today" ((agenda "" ))
           ((org-agenda-ndays 1)
            (org-agenda-show-log t)
            (org-agenda-log-mode-items '(clock closed))
            (org-agenda-clockreport-mode t)
            (org-agenda-entry-types '())))

          ("." "Waiting for" todo "WAITING")

          ("u" "Unscheduled tasks" tags-todo "-someday-TODO=\"SOMEDAY\"-TODO=\"DELEGATED\"-TODO=\"WAITING"
           ((org-agenda-skip-function 'xtof/org-agenda-skip-scheduled)
            (org-agenda-view-columns-initially t)
            ;;(org-tags-exclude-from-inheritance '("PROJ"))
            (org-agenda-overriding-header "Unscheduled TODO entries: ")
            (org-columns-default-format "%50ITEM %TODO %3PRIORITY %Effort{:} %TAGS")
            (org-agenda-sorting-strategy '(todo-state-up priority-down effort-up tag-up category-keep))))

          ;; THIS ONE USEFUL FOR INBOX PROCESSING
          ("U" "Unscheduled tasks outside projects" tags-todo
           ((org-agenda-skip-function 'xtof/org-agenda-skip-scheduled)
            ;;(org-tags-exclude-from-inheritance '("PROJ"))
            (org-agenda-view-columns-initially t)
            (org-agenda-overriding-header "Unscheduled TODO entries outside projects: ")
            (org-agenda-sorting-strategy '(todo-state-up priority-down tag-up category-keep effort-down))))

          ;; todo: -PROJ
          ("P" "By priority"
           ((tags-todo "+PRIORITY=\"A\"")
            (tags-todo "+PRIORITY=\"B\"")
            (tags-todo "+PRIORITY=\"\"")
            (tags-todo "+PRIORITY=\"C\""))
           ((org-agenda-prefix-format "%-10c %-10T %e ")
            (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))

          ;; active projects
          ("pp" tags "-someday-TODO=\"DONE\"-TODO=\"SOMEDAY\""
           (
            ;;(org-tags-exclude-from-inheritance '("PROJ"))
            (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))
          ;; all uncompleted projects
          ("p." tags "-TODO=\"DONE\""
           (
            ;;(org-tags-exclude-from-inheritance '("PROJ"))
            (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))

          ;; started tasks
          ;; prolly want to display clocktime
          ("S" tags-todo "TODO=\"STARTED\"")

          ;; projects with tasks // BROKEN //
          ;; ("3" "List projects with tasks [BROKEN]" xtof/org-agenda-projects-and-tasks
          ;;  ;;"+PROJ"
          ;;  ((xtof/org-agenda-limit-items 3)))
          
              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          
          ("o" "Agenda and Office-related tasks"
           ((agenda ""
                    ((org-agenda-use-tag-inheritance nil)))
            (tags-todo "work")
            (tags "@work")))

          (" " "Agenda"
           ((agenda "" nil ((org-agenda-use-tag-inheritance nil)))
            (todo "STARTED"
                  ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")
                   (org-agenda-overriding-header "Started")))
            (todo "NEXT"
                  ((org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS %10CLOCKSUM")))
            (todo "PROJ"
                  ((org-agenda-overriding-header "Stuck Projects")
                   (org-agenda-skip-function 'xtof/skip-non-stuck-projects)))
            (todo "PROJ";;"-TODO=\"SOMEDAY\""
                  ((org-agenda-overriding-header "Empty Projects")
                   (org-agenda-skip-function 'xtof/skip-non-empty-projects)))
            (todo "WAITING-SOMEDAY"
                  ((org-agenda-overriding-header "Waiting")))
            (todo "SOMEDAY"
                  ((org-agenda-overriding-header "Someday")))))
          )
        ))

(defvar xtof/org-agenda-contexts
  '((tags-todo "+@phone")
    (tags-todo "+@work")
    (tags-todo "+@drawing")
    (tags-todo "+@coding")
    (tags-todo "+@writing")
    (tags-todo "+@computer")
    (tags-todo "+@home")
    (tags-todo "+@errands"))
  "Usual list of contexts.")

(defun xtof/org-agenda-config ()
  "init org agenda"
  (progn
    (setq org-agenda-tags-column -136)
    (setq org-agenda-use-tag-inheritance nil)
    (setq org-agenda-time-grid
          '((daily today require-timed)
            "----------------"
            (600 900 1200 1300 1800 2400)))
    
    (setq org-agenda-span 2)
    (setq org-agenda-sticky nil)
    (setq org-agenda-show-log t)
    (setq org-agenda-window-setup (quote current-window))
    (add-hook 'org-agenda-mode-hook (lambda () (hl-line-mode 1)))
    (setq
     ;;org-agenda-include-diary t
     ;;org-agenda-start-on-weekday nil
     org-agenda-log-mode-items (quote (closed clock state)))

    (xtof/org-agenda-setup-custom-commands)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  SETUP TODOS

(defun xtof/org-setup-todos ()
  (setq org-use-fast-todo-selection t) ;; actually seems to be true by default
  (setq org-treat-S-cursor-todo-selection-as-state-change nil)

  (setq org-todo-keywords
        '((sequence 
           "PROJ")
          (sequence
           "TODO(t)"
           "NEXT(n!/!)"
           "STARTED(s)"
           "WAITING(w@/!)"
           "SOMEDAY(.)"
           "|"
           "DONE(x!)"
           "CANCELLED(c@)")
          (sequence
           "TODELEGATE(-)"
           "DELEGATED(d)"
           "COMPLETE(x)")))

  (setq org-todo-keyword-faces
        '(("PROJ" :foreground "firebrick" :weight bold)
          ("TODO" :foreground "firebrick" :weight bold)
          ("NEXT" :foreground "red" :weight bold)
          ("STARTED" :foreground "gold" :weight bold)
          ("WAITING" :foreground "chocolate" :weight bold)
          ("SOMEDAY" :foreground "light steel blue" :weight bold)
          ("DONE" :foreground "olive drab" :weight bold)
          ("CANCELLED" :foreground "dim gray" :weight bold)
          ("TODELEGATE" :foreground "firebrick" :weight bold)
          ("DELEGATED" :foreground "chocolate" :weight bold)
          ("COMPLETE" :foreground "olive drab" :weight bold)))

  ;; Parent can't be marked as done unless all children are done
  (setq org-enforce-todo-dependencies t)
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

                                        ;   (setq org-todo-state-tags-triggers
                                        ;         (quote (("CANCELLED" ("CANCELLED" . t))
                                        ;                 ("WAITING" ("WAITING" . t))
                                        ;                 ("HOLD" ("WAITING") ("HOLD" . t))
                                        ;                 (done ("WAITING") ("HOLD"))
                                        ;                 ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                                        ;                 ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                                        ;                 ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  TRACK TIME

(defun xtof/org-setup-time-tracking () 
  (setq org-clock-idle-time nil)
  (setq org-log-done 'time)
  (setq org-clock-persist t)
  (org-clock-persistence-insinuate)
  (setq org-clock-report-include-clocking-task t)
  (defadvice org-clock-in (after xtof activate)
    "Mark STARTED when clocked in."
    (save-excursion
      (catch 'exit
        (cond
         ((derived-mode-p 'org-agenda-mode)
          (let* ((marker (or (org-get-at-bol 'org-marker)
                             (org-agenda-error)))
                 (hdmarker (or (org-get-at-bol 'org-hd-marker) marker))
                 (pos (marker-position marker))
                 (col (current-column))
                 newhead)
            (org-with-remote-undo (marker-buffer marker)
              (with-current-buffer (marker-buffer marker)
                (widen)
                (goto-char pos)
                (org-back-to-heading t)
                (if (org-get-todo-state)
                    (org-todo "STARTED"))))))
         (t (if (org-get-todo-state)
                (org-todo "STARTED"))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  HABIT

(defun xtof/org-habit-setup ()
  (setq org-habit-graph-column 80)
  (setq org-habit-show-habits-only-for-today t)
  (setq org-habit-show-all-today t)
  (setq org-habit-completed-glyph 8226)
  (setq org-habit-today-glyph 124)
  (setq org-habit-following-days 14))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  CAPTURE

;;(defun xtof/org-capture-setup ()
(defvar
  xtof/org-capture-project-template
  "* PROJ %^{Project} %^G:PROJ:
  %?")
(defvar
  xtof/org-capture-task-template
  "* TODO %^{Task} %^G
      :PROPERTIES:
      :CREATED: %U
      :Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|3:00|4:00}
      :END:
      %?")

(defun xtof/create-recurring-timestamp ()
  "foo"
  (interactive)
  (let ((fs "%Y-%m-%d %a %H:%M")
        (date (org-read-date nil t nil "input base date"))
        (recurrence-type (completing-read "input recurrence type:" (list "+" "++" ".+") nil t nil nil ".+"))
        (recurrence-rate-min (read-from-minibuffer "input recurrence rate min:" nil nil nil nil nil nil))
        (recurrence-rate-max (read-from-minibuffer "input recurrence rate nax:" "1" nil nil nil "1" nil))
        (recurrence-interval (completing-read "input recurrence interval:" (list "y" "w" "m" "d" "h") nil t nil nil "d")))
    (format "<%s %s%s>"
            (format-time-string fs date)
            recurrence-type
            (cond ((string= "" recurrence-rate-min) (concat recurrence-rate-max recurrence-interval))
                  (t (concat recurrence-rate-min recurrence-interval "/" recurrence-rate-max recurrence-interval))))))

(defvar
  xtof/org-capture-habit-template
  "* TODO %^{Habit} %^G 
  SCHEDULED: %(xtof/create-recurring-timestamp)
  :PROPERTIES:
  :STYLE: habit
  :Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|3:00|4:00}
  :END:
  OPENED: %U
  %?
  %i")
(defvar
  xtof/org-capture-memo-template
  "* %^{Subject} %^G
  :PROPERTIES:
  :TO: %^{to|Self}
  :DATE: %U
  :END:
  %?")
(defvar
  xtof/org-capture-note-template
  "* %^{Description} %^G
  :PROPERTIES: 
  :DATE: %U
  :END:
  %?")
(defvar
  xtof/org-capture-activity-log-template
  "* %^{Title} %^G
  :PROPERTIES:
  :DATE: %U
  :END:
  %?")
(defvar
  xtof/org-capture-dream-log-template
  "* %^{Title} %^G
  %?")
(defvar
  xtof/org-capture-meditation-log-template
  "* %^{Title}
  :PROPERTIES:
  :STARTTIME: %^{start time}U
  :DURATION: %^{duration|0:30}
  :END:
  %?")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun xtof-org/pre-init-neotree ()
  (spacemacs|use-package-add-hook neotree 
    :pre-init
    ;; Code
    :post-init
    ;; Code
    :pre-config
    ;; Code
    :post-config
    ;; Code
    (progn
      (print "INIT NEOTREE")
      (setq neo-create-file-auto-open t)
      (setq neo-modern-sidebar t)
      (setq neo-show-hidden-files t)
      (setq neo-smart-open t)
      (setq neo-theme (quote nerd))
      (setq neo-vc-integration (quote (face char)))
      (set-face-attribute 'neo-root-dir-face
                          nil
                          :background "#0c2938"
                          :foreground "#ffd746")
      (set-face-attribute 'neo-dir-link-face
                          nil
                          :foreground "DeepSkyBlue"
                          :weight 'bold)
      (set-face-attribute 'neo-vc-default-face
                          nil
                          :background "gray20"
                          :foreground "White"
                          :weight 'bold)
      (setq neo-persist-show t)
      (setq neo-show-updir-line t)
      ;; (setq neo-window-width 25)
      ;; (add-hook 'neotree-mode-hook
      ;;           (lambda ()
      ;;             (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      ;;             (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
      ;;             (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      ;;             (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
      (neotree-show)
      )
    )
  )

(defun xtof-org/pre-init-org ()
  (spacemacs|use-package-add-hook org
    ;;   ;;:pre-init
    ;;   ;; Code
    :post-init (progn
                 (print "org post init")

                 ;; init modules
                 (setq org-modules
                       '(org-habit
                         ;;org-mouse
                         org-panel))
                 ;;;;;;;;;;;;;;;;;;
                 ;; -- REFILE -- ;;
                 ;;;;;;;;;;;;;;;;;;
                 (setq org-reverse-note-order t)
                 (setq org-refile-use-outline-path nil)
                 (setq org-refile-allow-creating-parent-nodes 'confirm)
                 (setq org-refile-use-cache nil)
                 (setq org-refile-targets '(("~/Dropbox/org/projects.org" . (:maxlevel . 1))))
                 ;;(setq org-blank-before-new-entry nil)
                 
                 ;; MAYBE ITEMS
                 ;; (setq org-startup-indented nil)
                 ;; org-hide-leading-stars t
                 ;; org-use-fast-todo-selection t
                 ;; org-cycle-separator-lines 0

                 ;; tags
                 (setq org-tag-alist
                       '((:startgroup . nil)
                         ("@work" . ?b) 
                         ("@home" . ?h) 
                         ("@writing" . ?w)
                         ("@errands" . ?e) 
                         ("@drawing" . ?d)
                         ("@coding" . ?c)
                         ("@phone" . ?p)
                         ("@reading" . ?r)
                         ("@computer" . ?l)
                         (:endgroup . nil)
                         (:startgroup . nil)
                         ("lowenergy" . ?0)
                         ("highenergy" . ?9)
                         (:endgroup . nil)
                         ("#HEALTH_BEAUTY" . ?B)
                         ("#HOME_FAMILY" . ?F)
                         ("#ART_PHILOSOPHY" . ?P)
                         ("#RESEARCH_EDUCATION" . ?E)
                         ("#WORK_MONEY" . ?M)
                         ("#ORGANIZATION_REGIMENT" . ?R)
                         )
                       )

                 ;; look & feel
                 ;;(setq org-level-color-stars-only t)
                 (setq org-src-fontify-natively t)
                 ;;(setq org-tags-column -136)
                 (setq org-tags-column 80)
                 (setq org-agenda-dim-blocked-tasks nil)
                 (setq org-use-speed-commands t)
                 )
    ;; ;;:pre-config
    ;; ;; Code
    :post-config (progn
                   (print "org post config")

                   ;; load modules
                   (org-load-modules-maybe t)
                   ;; Org Panel
                   (define-key org-mode-map [(control ?c) ?p] 'orgpan-panel)

                   (xtof/org-setup-todos)
                   ;;(xtof/org-setup-projects)

                   ;;per https://www.gnu.org/software/emacs/manual/html_node/org/Filtering_002flimiting-agenda-items.html
                   (add-to-list 'org-global-properties
                                '("Effort_ALL". "0:05 0:15 0:30 1:00 2:00 3:00 4:00"))

                   (xtof/org-setup-time-tracking)
                   (setq org-log-into-drawer "LOGBOOK")
                   (setq org-clock-into-drawer 1)

                   (xtof/org-habit-setup)
                   ;; (xtof/org-capture-setup)

                   (eval-after-load "spacemacs"
                     (progn
                       ;; ORG DIRECTORY
                       (setq xtof/org-directory "~/Dropbox/org")
                       ;; init directories
                       (setq org-directory xtof/org-directory)
                       (setq org-default-notes-file  (format "%s/%s" xtof/org-directory "inbox.org"))
                       (xtof/org-agenda-config)
                       ;;Override the key definition for org-exit
                       (define-key org-agenda-mode-map "x" 'xtof/org-agenda-done)
                       ;;Override the key definition
                       (define-key org-agenda-mode-map "X" 'xtof/org-agenda-mark-done-and-add-followup)
                       ;; ;;New key assignment
                       (define-key org-agenda-mode-map "N" 'xtof/org-agenda-new)
                       (setq org-agenda-files (list xtof/org-directory))
                       ;; Refile on top of file max
                       (setq org-refile-use-outline-path 'file)
                       ;; use a depth level of 6 max
                       (setq org-refile-targets
                             '((org-agenda-files . (:maxlevel . 4))))
                       (setq org-outline-path-complete-in-steps nil)
                       ;; (setq org-agenda-files
                       ;;       '("~/Dropbox/org/inbox.org"
                       ;;         "~/Dropbox/org/activity_log.org"
                       ;;         "~/Dropbox/org/meditation_log.org"
                       ;;         "~/Dropbox/org/dream_log.org"
                       ;;         "~/Dropbox/org/memos.org"
                       ;;         "~/Dropbox/org/flagged.org"
                       ;;         "~/Dropbox/org/projects.org"
                       ;;         "~/Dropbox/org/notes.org"
                       ;;         "~/Dropbox/org/tga.org"
                       ;;         ))
                       )
                     )
                   (setq
                    org-capture-templates
                    `(("p" 
                       "Project" 
                       entry (file "~/Dropbox/org/projects.org") 
                       ,xtof/org-capture-project-template)
                      ("t"
                       "Task"
                       entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
                       ,xtof/org-capture-task-template)
                      ("h"
                       "Habit"
                       entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
                       ,xtof/org-capture-habit-template)
                      ("m"
                       "Memo" 
                       entry (file+datetree "~/Dropbox/org/memos.org") 
                       ,xtof/org-capture-memo-template)
                      ("n"
                       "Note"
                       entry (file+headline "~/Dropbox/org/notes.org" "Notes")
                       ,xtof/org-capture-note-template)
                      ;;
                      ("l" "logs")
                      ("la" 
                       "Activity Log Entry" 
                       entry (file+datetree "~/Dropbox/org/activity_log.org") 
                       ,xtof/org-capture-activity-log-template)
                      ("ld" 
                       "Dream Log Entry" 
                       entry (file+datetree "~/Dropbox/org/dream_log.org") 
                       ,xtof/org-capture-dream-log-template)
                      ("lm" 
                       "Meditation Log Entry" 
                       entry (file+datetree "~/Dropbox/org/meditation_log.org") 
                       ,xtof/org-capture-meditation-log-template)
                      )
                    )
                   )
    )
  )
