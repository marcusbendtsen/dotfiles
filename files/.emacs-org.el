
;;
;; Org mode configuration
;;


(with-eval-after-load 'org (add-to-list 'org-modules 'org-habit t))

(require 'org-inlinetask)

(setq org-highest-priority ?A)
(setq org-lowest-priority ?E)
(setq org-default-priority ?E)


(setq org-agenda-overriding-columns-format "%25ITEM %DEADLINE %SCHEDULED")

(setq org-agenda-skip-unavailable-files t)
(setq org-agenda-files '("~/workspace/organiser/"))

(setq org-capture-templates '())
(global-set-key (kbd "C-c c") #'org-capture)
(add-to-list 'org-capture-templates
	     '("m" "Meeting" entry
	       (file+headline "~/workspace/organiser/meetings.org" "Meetings")
	       "* TODO %?" :prepend t :empty-lines-after 2 :empty-lines-before 2))

'(org-todo-keyword-faces (quote (("TODO" . "pink") ("TODO" . "#FAF0E6"))))

(setq org-agenda-log-mode-items '(closed clock state))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))

;;
;; Org agenda random quote
;;
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "R")))  ;don't ask for R

(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)

(defun read-lines (filePath)
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "###" t)))

(setq number-quotes (length (read-lines "~/workspace/organiser/quotes.txt")))

(defun random-quote (&rest _ignore)
  (insert (nth (random number-quotes) (read-lines "~/workspace/organiser/quotes.txt"))))
    

(setq org-agenda-custom-commands
      '(("n" "Quote and agenda"
         ((random-quote "" nil)
	  (tags "PRIORITY=\"A\"" ((org-agenda-overriding-header "Milestones")))
	  (tags "PRIORITY=\"B\"" ((org-agenda-overriding-header "Key papers")))
	  (tags "PRIORITY=\"C\"" ((org-agenda-overriding-header "Lab")))
	  (tags "PRIORITY=\"D\"" ((org-agenda-overriding-header "Teach")))
          (agenda ""
                  ((org-agenda-start-day (org-read-date nil nil "++1" nil (org-read-date nil t "-sun")))
                   (org-agenda-span 21)
		   (org-agenda-start-with-log-mode '(closed clock state))
                   (org-agenda-start-on-weekday 1)))
	  (todo ""
		((org-agenda-overriding-header "\nUnscheduled TODO")
		 (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))))
	  nil))))


