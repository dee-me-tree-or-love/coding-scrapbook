(defpackage coin-toss
    (:use :cl))
(in-package :coin-toss)

(defun toss-coin ()
    "Generate a random heads or tails"
    ; /\ this is a docstring

    ; declare number variable taking a random value
    ; make-random-state generates a new random state based on the parameters
    ;   t   parameter initialized a _fresh_ random state
    ;   nil parameter uses a _saved_ random state
    (let ((number (random 2 (make-random-state t))))
        ; return the string for it
         (if (= number 0) "heads" "tails")))

(defun prompt ()
    "Get user input and recurse if it is not 'heads' or 'tails'"

    ; t <- flushes the content into the STDOUT (T)erminal
    (format t "Please enter heads or tails: ")
    (force-output)

    (let ((guess (string-downcase (read-line))))
        (if (or (string= guess "heads") (string= guess "tails"))
            ; return the right guess
            guess
            ; recurse otherwise waiting for the right input
            (prompt))))

(defun game ()
    "Run the actual game"

    (if (string= (prompt) (toss-coin))
        (format t "You win!~%")
        (format t "You loose!~%")))

(game)