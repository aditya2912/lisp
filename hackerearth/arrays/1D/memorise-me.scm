#lang racket
; memorise problem
(define (read-ls l)
  (cond
    ((eq? l 0) '())
    (else (cons (read) (read-ls (- l 1))))))

(define (read-in l)
  (cond
    ((eq? l 0) '())
    (else (cons (read) (read-in (- l 1))))))

(define (N) (read-in (read)))
(define (Q) (read-ls (read)))
(define (empty-ls? xs) (eq? xs '()))

(define (existence xs x)
  (cond
    ((and (not (empty-ls? xs)) (eq? (car xs) x)) (+ 1 (existence (cdr xs) x)))
    ((and (not (empty-ls? xs))) (existence (cdr xs) x))
    (else 0)))

(define (existence? xs x)
  (define a (existence xs x))
  (if (not (= a 0)) a "NOT PRESENT"))

(let
    ((q (Q))
     (n (N)))
  (map (lambda (x) (let () (display (existence? q x)) (newline)) ) n))
