#lang scheme

(require "./fixed-point.rkt")

(define (average lhs rhs)
  (/ (+ lhs rhs) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))


(define (sqrt-0 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))


(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y))))
               1.0))

;; derivatives

(define dx 0.0000001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x)
                      ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


;; we may calculate `sqrt x` through the "Zero" of a function f(y) = y^2 - x.

(define (sqrt x)
  (newtons-method (lambda (y) (- (* y y) x))
                  1.0))

(provide newton-transform newtons-method average-damp fixed-point)

