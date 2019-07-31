#lang racket

(define (even? number)
  (cond
    ((eqv? (remainder number 2) 0) #t)
    (else #f)))
(define (odd? number) (not (even? number)))
(define (num->binary number)
  (cond
    ((= number 0) '())
    ((eq? (even? number) #t)
     (cons 0 (num->binary (floor (/ number 2)))))
    ((eq? (odd? number) #t)
     (cons 1 (num->binary (floor (/ number 2)))))))
(define (binary->num binary)
  (cond
    ((eq? binary '()) 0)
    (else (+ (* (car binary)
                (expt 2 (- (length binary) 1)))
             (binary->num (cdr binary))))))

(define (sparse? xs)
  (cond
    ((eq? xs '()) #f)
    ((and
      (> (length xs) 1)
      (= (car xs) 1)
      (= (car (cdr xs)) 1))
     #t)
    (else (sparse? (cdr xs)))))

(define (continue-till-sparse x)
  (cond
    ((not (sparse? (num->binary x))) x)
    (else (continue-till-sparse (+ x 1)))))

(define (compute xs)
  (cond
    ((eq? xs '()) '())
    (else (cons (continue-till-sparse (car xs)) (compute (cdr xs))))))

(define (limit) (string->number (read-line)))
(define (read-ls l)
  (cond
    ((= l 0) '())
    (else (cons (string->number (read-line)) (read-ls (- l 1))))))

(define (do)
  (compute (read-ls (limit))))

(define (read x) (println x))

(define (do->print)
  (map (lambda (x) (read x)) (do)))

(do->print)
