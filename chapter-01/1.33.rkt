#lang scheme

(define (filtered-accumulate combiner null-value term a next b take-if)
  (define (iter curr acc)
    (cond ((> curr b) acc)
          ((not (take-if curr)) (iter (next curr) acc))
          (else (iter (next curr) 
                      (combiner acc (term curr))))))
  (iter a null-value))


(require "./prime.rkt")

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (inc x) (+ x 1))

(define (test-a a b)
  (filtered-accumulate + 0
                       (lambda (x) (* x x))
                       a
                       inc
                       b
                       prime?))

(define (test-b n)
  (filtered-accumulate * 1 identity 1 inc (- n 1) (lambda (x) (= 1 (gcd x n)))))