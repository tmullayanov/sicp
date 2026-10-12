#lang scheme

;; Miller-Rabin test via modifying expmod function
(define (square x) (* x x))

(define (checked-square x n)
  ;; trying to detect non-trivial roots of 1. If so, return 0
  ;; and make it bubble up.
  (if (and (not (= 1 (remainder x n)))
           (not (= (- n 1) (remainder x n)))
           (= 1 (remainder (square x) n)))
      0
      (remainder (square x) n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (checked-square (expmod base (/ exp 2) m) m)
                    m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (rabin-miller-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define nums (list 2 5 7 9 11 13 15))

(define (test)
  (map (lambda (n) (list n (rabin-miller-test n))) nums))

(provide rabin-miller-test expmod test)