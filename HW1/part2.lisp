(load "csv-parser.lisp")
(in-package :csv-parser)

;; (read-from-string STRING)
;; This function converts the input STRING to a lisp object.
;; In this code, I use this function to convert lists (in string format) from csv file to real lists.

;; (nth INDEX LIST)
;; This function allows us to access value at INDEX of LIST.
;; Example: (nth 0 '(a b c)) => a

;; !!! VERY VERY VERY IMPORTANT NOTE !!!
;; FOR EACH ARGUMENT IN CSV FILE
;; USE THE CODE (read-from-string (nth ARGUMENT-INDEX line))
;; Example: (mypart1-funct (read-from-string (nth 0 line)) (read-from-string (nth 1 line)))

;; DEFINE YOUR FUNCTION(S) HERE
(defun merge-list (list1 list2)
	;if list1 and list2 are lists
	(if(and(listp list1) (listp list2))
	;merge the lists
   	(cond
      ((null list1) list2)
      ;recursion part:
      ;All the elements of list1 will be taken one by one until the end of list
      ;When the list1 is null then the elements of list2 will be added.
      ( (cons (car list1) (merge-list (cdr list1) list2))))
      ;if they are not lists
      (format t "List1 or list2 is not list" )))
     

;; MAIN FUNCTION
(defun main ()
  (with-open-file (stream #p"input_part2.csv")
    (loop :for line := (read-csv-line stream) :while line :collect
      (format t "~a~%"
      ;; CALL YOUR (MAIN) FUNCTION HERE
      (merge-list (read-from-string (nth 0 line)) (read-from-string (nth 1 line)))

      )
    )
  )
)

;; CALL MAIN FUNCTION
(main)
