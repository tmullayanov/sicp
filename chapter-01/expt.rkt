#lang scheme

; linear recursive process, \Theta(n) for time and space complexity
(define (expt-naive b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; linear iterative process: \Theta(n) for time, \Theta(1) for memory
(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        b
        (expt-iter (- counter 1) (* product b))))
  (expt-iter n 1))


; use square optimisation. For power of 2, it gives us log_2 n steps.
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))
; (define (even? x) (= (remainder n 2) 0)) <-- is in stdlib.
