#lang scheme

(define (orig-sum-of-ints a b)
  (if (> a b)
      0
      (+ a (orig-sum-of-ints (+ a 1) b))))

(define (cube x) (* x x x))

(define (orig-sum-of-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (orig-sum-of-cubes (+ a 1) b))))

(define (orig-pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 
            (* a (+ a 2)))
         (orig-pi-sum (+ a 4) b))))


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (inc x) (+ x 1))
(define (identity x) x)

(define (sum-of-cubes a b)
  (sum cube a inc b))

(define (sum-of-ints a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ 2 x))))
  (sum pi-term 
       a 
       (lambda (x) (+ x 4))
       b))


(define (integral f a b dx)
  (define (term x) (f x))
  (define (next x) (+ x dx))
  (* (sum term (+ a (/ dx 2)) next b) dx))


(provide sum cube inc identity integral)