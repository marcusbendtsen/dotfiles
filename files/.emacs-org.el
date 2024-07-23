
;;
;; Org mode configuration
;;

;;
;; Settings
;;
(with-eval-after-load 'org (add-to-list 'org-modules 'org-habit t))

(require 'org-inlinetask)

(setq org-adapt-indentation t)
(setq org-highest-priority ?A)
(setq org-lowest-priority ?Z)
(setq org-default-priority ?Z)
(setq org-agenda-overriding-columns-format "%25ITEM %DEADLINE %SCHEDULED")
(setq org-agenda-log-mode-items '(closed clock state))

'(org-todo-keyword-faces (quote (("TODO" . "pink") ("TODO" . "#FAF0E6"))))


;;
;; Agenda files
;;
(setq org-agenda-skip-unavailable-files t)
(setq org-agenda-files '(
			 "~/workspace/organiser/"
			 "~/workspace/organiser/company/"
			 "~/workspace/organiser/confnetsem/"
			 "~/workspace/organiser/grants/"
			 "~/workspace/organiser/meetings/"
			 "~/workspace/organiser/mhed/"
			 "~/workspace/organiser/notes/"
			 "~/workspace/organiser/plan/"
			 "~/workspace/organiser/private/"
			 "~/workspace/organiser/research/"
			 "~/workspace/organiser/supervision/"
			 "~/workspace/organiser/teaching/"
			 ))


;;
;; Capture
;;
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-capture-templates '())

(add-to-list 'org-capture-templates
	     '("m" "Meeting" entry
	       (file+headline "~/workspace/organiser/meetings/meetings.org" "Meetings")
	       "* TODO %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))

(add-to-list 'org-capture-templates
	     '("n" "Note" entry
	       (file+headline "~/workspace/organiser/notes/notes.org" "Notes")
	       "* %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))

(add-to-list 'org-capture-templates
	     '("s" "SIM" entry
	       (file+headline "~/workspace/organiser/confnetsem/sim.org" "SIM network")
	       "* %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))

(add-to-list 'org-capture-templates
	     '("h" "MHED-lab meeting" entry
	       (file+headline "~/workspace/organiser/meetings/mhedlabmeeting.org" "MHED-lab meeting")
	       "* %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))

(add-to-list 'org-capture-templates
	     '("r" "Rewards" entry
	       (file+headline "~/workspace/organiser/notes/rewards.org" "Rewards")
	       "* %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))



;;
;; Org agenda random quote
;;

(defun read-lines (filePath)
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "###" t)))

(setq number-quotes (length (read-lines "~/workspace/organiser/quotes.txt")))

(defun random-quote (&rest _ignore)
  (insert (nth (random number-quotes) (read-lines "~/workspace/organiser/quotes.txt"))))


;;
;; Count level 2 items in note files
;;
(defun count-note-entries (filePath)
  (setq count (number-to-string (length (org-map-entries t "LEVEL=2" filePath))))
  (add-text-properties 0 (length count) '(face bold) count)
  count
)

(defun summarise-entries (&rest _ignore)

  (setq sep (make-string (window-width) org-agenda-block-separator))
  (add-text-properties 0 (length sep) '(face bold) sep)
  
  (setq delim " | ")
  (add-text-properties 0 (length delim) '(face bold) delim)

  (setq notes (concat "Notes: " (count-note-entries '("~/workspace/organiser/notes/notes.org"))))
  (add-text-properties 0 5 '(face bold) notes)
  (add-face-text-property 0 5 '(:foreground "#268bd2") nil notes)

  (setq sim (concat "SIM program: " (count-note-entries '("~/workspace/organiser/confnetsem/sim.org"))))
  (add-text-properties 0 11 '(face bold) sim)
  (add-face-text-property 0 11 '(:foreground "#268bd2") nil sim)

  (setq mhed (concat "MHED-lab meeting: " (count-note-entries '("~/workspace/organiser/meetings/mhedlabmeeting.org"))))
  (add-text-properties 0 16 '(face bold) mhed)
  (add-face-text-property 0 16 '(:foreground "#268bd2") nil mhed)

  (setq rewards (concat "Rewards: " (count-note-entries '("~/workspace/organiser/notes/rewards.org"))))
  (add-text-properties 0 7 '(face bold) rewards)
  (add-face-text-property 0 7 '(:foreground "#268bd2") nil rewards)

  (insert (concat "" sep "\n\n" notes delim sim delim mhed delim rewards "\n"))

  )


;;
;; Custom agendas
;;   

(setq org-agenda-custom-commands '())

(add-to-list 'org-agenda-custom-commands
	     '("u" "Unscheduled TODO"
               ((todo ""
		      ((org-agenda-overriding-header "\nUnscheduled TODO")
		       (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))))
		nil)))


(add-to-list 'org-agenda-custom-commands
      '("s" "Schedule"
         ((random-quote "" nil)
          (agenda ""
                  ((org-agenda-start-day (org-read-date nil nil "++1" nil (org-read-date nil t "-sun")))
                   (org-agenda-span 42)
		   (org-agenda-start-with-log-mode '(closed clock state))
                   (org-agenda-start-on-weekday 1)))
	  nil)))


(add-to-list 'org-agenda-custom-commands
	     '("a" "Agenda"
		((summarise-entries "" nil)
		 (tags "PRIORITY=\"M\"" ((org-agenda-overriding-header "Milestones")))
		 (tags "PRIORITY=\"G\"" ((org-agenda-overriding-header "Grants")))
		 (tags "PRIORITY=\"B\"" ((org-agenda-overriding-header "Key papers")))
		 (tags "PRIORITY=\"L\"" ((org-agenda-overriding-header "Lab")))
		 (tags "PRIORITY=\"T\"" ((org-agenda-overriding-header "Supervision and Teaching")))
		 nil)))








;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((R . t)))

;; (defun my-org-confirm-babel-evaluate (lang body)
;;   (not (string= lang "R")))  ;don't ask for R

;; (setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)
