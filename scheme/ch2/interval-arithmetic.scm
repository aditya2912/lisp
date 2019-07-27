#lang racket

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))
(define (make-interval a b) (cons a b))

;excercise 2.7
;define upper-bound and lower-bound
(define (lower-bound xs)
  (car xs))
(define (upper-bound xs) (car (cdr xs)))

;excercise 2.8
;using reasoning analogous to alyssa's
;determine how the difference of two intervals may be computer?
;define a corresponding subsctraction procedure, sub-interval
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;excercise 2.9
;the width of interval is half of the difference bw its upper and lower bounds
;the width is uncertainty of the number specified by the interval
;for some arithmetic operations the width of the result of combining
;two intervals is a function only of the widths of the argument intervals,
;whereas for others the width of combination is not a function of the widths
;of argument intervals
;1: Show that the width of the sum(or difference) of two intervals is a function
;only of the intervals being added or substracted.
;2: Give examples to show that this is not true for multiplication or division.

;excersive 2.10
;Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoudler and
;comments that it is not clear what it means to divide by an interval that
;spans zero. Modify Alyssa's code to check for this condition and to signal an
;error if it occurs.
(define (div-interval-210 x y)
  (if (or (eqv? (car (cdr x)) 0) (eqv? (car (cdr y)) 0))
    "error cannot divide by zero"
    (mul-interval
      x
      (make-interval (/ 1.0 (car (cdr y)))
                     (/ 1.0 (car y))))))

(define - sub-interval)
(define + add-interval)

(define (make-center-width c w) (make-interval (- c w) (+ c w)))
(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

;excercise 2.12 define a constructor make-center-precent that takes a center
;and a percentage tolerance and produces the desired interval. You must also
;define a selector percent that produces the percentage tolerance for a given
;interval. The center selector is the same as the one shown above.


;excercise 2.13 What is wrong with follow code?
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

;exercise 2.15
;She says that a formula to compute with intervals using
;Alyssa's system will produce tighter error bounds if it can
;be written in such a form that no variable that represents an uncertain
;number is repeated. par2 is better for parallel resistences than par1.
;Why?


;excercise 2.16
;explain Why equivalent algebraic expressions may lead to different answers.
;Prove it wrong or proove if impossible?
