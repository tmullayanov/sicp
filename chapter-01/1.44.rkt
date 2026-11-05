#lang scheme

(require "./1.43.rkt")

(define dx 0.000001)

(define (smooth fn)
  (lambda (x)
    (/ (+ (fn (+ x dx))
          (fn x)
          (fn (- x dx)))
       3.0)))

(define (n-smooth n fn)
  ((repeated smooth n) fn))