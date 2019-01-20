;***********************************************************
; G++ Language Lexer
;***********************************************************

(defparameter operator '("+" "-" "*" "/" "(" ")")) ;;operator in lexer
(defparameter keywords '("and" "or" "not" "equal" "deffun" "then" "else" "set" "append" "concat" "for" "while" "if" "true" "false")) ;;keywords in lexer
(defparameter integers '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")) ;;integer value in lexer
(defparameter alpha '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; alphabets for Idendifiers and keywords


(defun isoperator (param) ; check if the token is an operator
  (member param operator :test #'string=))

;; check for keywords
(defun iskeyword (param) ; check if the token is a keyword
  (member param keywords :test #'string=))

;; check for integers
(defun isint (param) ; ; check if the token is an integer
  (not (member nil (map 'list #'(lambda (c)
       (member c integers :test #'string=)) param))))

;;check for Idendifier

(defun isidendifier (param) ; check if the token is an identifier
  (not (member nil (map 'list #'(lambda (c)
       (member c alpha :test #'string=)) param))))

(defun split-by-one-space (string) ; split a string to a list of strings on spaces
    (loop for i = 0 then (1+ j)
          as j = (position #\Space string :start i)
          collect (subseq string i j)
          while j))

(defun prepare (text) ; prepare a file-string for tokenization
(remove-if #'(lambda (c) (string= "" c)) ; remove empty tokens
 (mapcar #'(lambda (c) (string-trim " " c)) ; trim spaces from tokens
  (split-by-one-space ; split on space
	(replace-all ; replace ),( with spaced versions of them
		(replace-all
			(substitute #\Space #\Tab 
			(substitute #\Space #\Return 
			(substitute #\Space #\Newline text))) ; Replace tabs, new lines and carriage returns by a space
			 ")" " ) ")
			 "(" " ( ")
			 ))))

(defun replace-all (string part replacement) ; implementation of replace-all
    (with-output-to-string (out) ; replace all occurrences part with replacement in string
      (loop with part-length = (length part)
            for old-pos = 0 then (+ pos part-length)
            for pos = (search part string
                              :start2 old-pos
                              :test #'char=)
            do (write-string string out
                             :start old-pos
                             :end (or pos (length string)))
            when pos do (write-string replacement out)
            while pos)))

(defun slurp (filename) ; read a file into a string
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun check (token) ; Check a token and return a list of (type token)
  (list
	  (cond ((isoperator token) "operator")
		    ((iskeyword token) "keyword")
		    ((isint token) "integer")
		    ((isidendifier token) "identifier")) 
      token))

(defun lexer (filename) ; everything together
     (mapcar #'check (prepare (slurp filename))))
