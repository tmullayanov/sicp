#lang scheme

; let's say that our guess is good enough if it changes less than 0.1% between iters
(define (good-enough? prev-guess next-guess)
  (< (/ (abs (- prev-guess next-guess))
        next-guess)
     0.001))

(define (sqrt-iter last-guess next-guess x)
  (if (good-enough? last-guess next-guess)
      next-guess
      (sqrt-iter next-guess
                 (improve next-guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(define (square x)
  (* x x))

(provide sqrt improve good-enough? square)

#|
On a small numbers, it works definitely better - now we can compute roots of numbers smaller than 0.001.

As for big numbers, I feel it's double-edged.
For really big numbers in `double` format we may at least be sure that the computation process would finish correctly.
Because at some point we'll lose such precision between two "nearest numbers".
But in the meantime the result might seem a bit less precise.
All in all, this new approach is definitely better.
|#