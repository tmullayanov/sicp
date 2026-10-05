#lang scheme

(require "./prime.rkt")
(require "./expt.rkt")

(define (fast-expmod base exp m)
  (remainder (fast-expt base exp) m))


(define (single-calc-test base exp m)
  (= (fast-expmod base exp m)
     (expmod base exp m)))

(define (cover-all-bases-under-exp exp m)
  (define (iter n)
    (when (<= n exp)
      (when (not (single-calc-test n exp m))
          (printf "BASE: ~a EXP: ~a M: ~a -- NOT OK\n" n exp m))
      (iter (+ n 1))))
  (iter 2))


(define (iterate-m-with-fixed-exp exp m-start m-end)
  (define (iter m)
    (when (<= m m-end)
      (cover-all-bases-under-exp exp m)
      (iter (+ m 1))))
  (iter m-start))

(define (iterate-expmod-tests exp-start exp-end)
  (define (iter e)
    (when (<= e exp-end)
      (iterate-m-with-fixed-exp e 2 e)
      (iter (+ e 1))))
  (iter exp-start))
