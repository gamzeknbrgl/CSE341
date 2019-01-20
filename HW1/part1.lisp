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
(defun list-leveller (list)
   ;check if input a list or not
 (if(not (listp list))  (format t "it's not a list" )
   ;if input is a list
   (cond
      ((null list) 
             list)
      ((not (listp (car list))) 
      ;recursion part:
      ;When we control the elements of the list if the elements of the list is
      ;another list then input list and the other list will be merge.
      (cons (car list) (list-leveller (cdr list))))
      ( (append (list-leveller (car list)) (list-leveller (cdr list)))))))

;; MAIN FUNCTION
(defun main ()
  (with-open-file (stream #p"input_part1.csv")
    (loop :for line := (read-csv-line stream) :while line :collect
      (format t "~a~%" (list-leveller (read-from-string (nth 0 line)))
      ;; CALL YOUR (MAIN) FUNCTION HERE



      )
    )
  )
)

;; CALL MAIN FUNCTION
(main)
