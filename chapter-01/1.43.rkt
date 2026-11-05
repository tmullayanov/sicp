#lang scheme

(define (repeated fn times)
  (lambda (x)
    (cond ((= 0 times) x)
          ((= 1 times) (fn x))
          (else (fn ((repeated fn (- times 1)) x))))))


(define (repeated-inner fn times)
  (define (inner n acc)
    (if (= n 0)
        acc
        (inner (- n 1) (fn acc))))
  (lambda (x) (inner times x)))

(define (repeated-compose fn times)
  (compose fn (repeated fn (- times 1))))


(define (inc x) (+ x 1))

(define (test)
  (= 2 ((repeated-inner inc 2) 0)))

(provide repeated)