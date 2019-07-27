;This representation is known as church numerals, after its
;inventor, Alonzo Church, the logician who invented lambda calculus
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;#TODO
;Define one or two directly (not in terms of zero and add-1)
;HINT: Use substitution to evaluate (add-1 zero).
;Give a direct definition to the addition procedure + (not in terms
; of repeated application of add-1)
