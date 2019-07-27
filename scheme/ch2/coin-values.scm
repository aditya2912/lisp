#lang racket
;HIERARCHICAL DATA AND THE CLOSURE PROPERTY

;An operation for combining data object satisfies the clousre property if the
;results of combining things with that operator can themselves be combined
;using the operation.


;returing nth value inside list
(define (list-ref items n)
  (if (eq? n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define odds (list 3 5 7 9))

(define (append xs ab)
  (if (null? xs)
      ab
      (cons (car xs) (append (cdr xs) ab))))

(define (last-pair xs)
    (if (or (null? xs) (null? (cdr xs)))
        (car xs)
        (last-pair (cdr xs))))

(define (count-change-v1 amount) (cc-v1 amount 5))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))
(define (first-denomination kind-of-coins)
  (list-ref (us-coins) kind-of-coins))
(define (cc-v1 amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc-v1 amount
                     (- kinds-of-coins 1))
                 (cc-v1 (- amount
                        (first-denomination-v1
                         kinds-of-coins))
                     kinds-of-coins)))))
(define (except-first-denomination x) (- x 1))
(define (first-denomination-v1 kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
(define (no-more? xs) (null? xs))

