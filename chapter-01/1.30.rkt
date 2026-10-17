#lang scheme

; iterative version of `sum`

(define (sum term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (+ result (term x)))))
  (iter a 0))

(provide sum)