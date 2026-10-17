#lang scheme


(define (product term a next b)
  (define (iter x acc)
    (if (> x b)
        acc
        (iter (next x) (* acc (term x)))))
  (iter a 1))

(define (inc x) (+ x 1))

(define (n! n)
  (product identity 1 inc n))

(define (pi-wilson steps)
  (define (term x)
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (* 4.0 (product term 1 inc steps)))


(provide product)