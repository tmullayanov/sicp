#lang scheme

(require "./sum.rkt")

(define (inc x) (+ x 1))

(define (simpson-integral f a b n)
  (let ((h (/ (- b a) (* n 1.0))))
    (define (term k)
      (* (cond ((= k 0) 1)
               ((= k n) 1)
               ((even? k) 2)
               (else 4))
         (f (+ a (* k h)))))
    (* (/ h 3) (sum term 0 inc n))
    ))


#|

"chapter-01\\1.29.rkt"> (integral cube 0 1 0.01)                                                                                                       
0.24998750000000042
"chapter-01\\1.29.rkt"> (simpson-integral cube 0 1 100)                                                                                                
0.24999999999999992


"chapter-01\\1.29.rkt"> (integral cube 0 1 0.001)                                                                                                      
0.249999875000001
"chapter-01\\1.29.rkt"> (simpson-integral cube 0 1 1000)                                                                                               
0.2500000000000003

Simpson integral covnerges to the "true" value much faster.


|#