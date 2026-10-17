#lang scheme

(define (accumulate combiner null-value term a next b)
  (define (iter curr acc)
    (if (> curr b)
        acc
        (iter (next curr) (combiner acc (term curr)))))
  (iter a null-value))


(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))