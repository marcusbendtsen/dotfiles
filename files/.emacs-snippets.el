

;;
;; yasnippet & auto-insert
;;
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
(yas-global-mode 1)


(defun r_minimum ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "r_minimum" 'R)))

(defun qmd_minimum ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "qmd_minimum" 'qmd)))

(defun hpp_minimum ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "hpp_minimum" 'cpp)))

(defun cpp_minimum ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "cpp_minimum" 'cpp)))


(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this line to restore defaults
  (add-to-list 'auto-insert-alist  '(".r$" . [r_minimum]))
  (add-to-list 'auto-insert-alist  '(".R$" . [r_minimum]))
  (add-to-list 'auto-insert-alist  '(".qmd$" . [qmd_minimum]))
  (add-to-list 'auto-insert-alist  '(".hpp$" . [hpp_minimum]))
  (add-to-list 'auto-insert-alist  '(".cpp$" . [cpp_minimum]))
  )


