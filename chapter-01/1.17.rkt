#lang scheme

(define (*-0 a b)
  (if (= b 0)
      a
      (+ a (*-0 a (- b 1)))))

;; additional functions
(define (double a) (+ a a))
(define (halve a) (/ a 2))


; now, for an "optimized" version of multiplication
(define (* a b)
  (define (inner-* x y rem)
    (cond ((= y 1) (+ x rem))
          ((even? y) (inner-* (double x) (halve y) rem))
          (else (inner-* x (- y 1) (+ rem x)))))
  (inner-* a b 0))

(define (test-mul-by-2)
  (map (lambda (y z) (= z (* 2 y)))
       (list 2 3 4 5 6 7 8)
       (list 4 6 8 10 12 14 16)))