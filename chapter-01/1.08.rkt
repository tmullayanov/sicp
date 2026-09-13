#lang scheme

(define (good-enough? prev-guess next-guess)
  (< (/ (abs (- prev-guess next-guess))
        next-guess)
     0.001))

(define (sqrt3-iter last-guess next-guess x)
  (if (good-enough? last-guess next-guess)
      next-guess
      (sqrt3-iter next-guess
                 (improve next-guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt3 x)
  (sqrt3-iter 0.0 1.0 x))

(define (cube x)
  (* x x x))

(provide sqrt improve good-enough? cube)