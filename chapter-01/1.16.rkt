#lang scheme

;; fast-expt but with linear iterative process

(define (expt b n)
  (define (f a c k)
    (cond ((zero? k) a)
          ((even? k) (f a (square c) (/ k 2)))
          (else (f (* a c) c (- k 1)))))
  (f 1 b n))

(define (square x) (* x x))


(define (test-pows-of-2)
  (map (lambda (x) (list x (expt 2 x)))
       (list 0 1 2 3 4 5 6 7 8 9 10)))

(test-pows-of-2)