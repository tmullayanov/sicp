#lang sicp

(define (square x) (* x x))

; technically it'd be better to take out lists, but at 1.03 we don't know of them yet.
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (2-biggest-squares x y z)
  (cond ((and (<= x y) (<= x z))
         (sum-of-squares y z))
        ((and (<= y x) (<= y z))
         (sum-of-squares x z))
        ((and (<= z x) (<= z y))
         (sum-of-squares x y))))

(= (2-biggest-squares 1 2 3)
   (2-biggest-squares 1 3 2)
   (2-biggest-squares 2 1 3)
   (2-biggest-squares 2 3 1)
   (2-biggest-squares 3 1 2)
   (2-biggest-squares 3 2 1)) ; #t