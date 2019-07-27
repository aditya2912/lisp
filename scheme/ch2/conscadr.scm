#lang racket

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))

(define (cons-v1 x y)
  (lambda (m) (m x y)))
(define (car-v1 z)
  (z (lambda (p q) p)))
(define (cdr-v1 z)
  (z (lambda (p q) q)))
