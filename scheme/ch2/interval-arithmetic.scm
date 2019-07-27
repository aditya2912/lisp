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
(define (lower-bound xs) (car xs))
(define (upper-bound xs) (cdr xs))

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


