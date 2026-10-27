#lang scheme

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x)
    (f (f x))))


#|

(((double (double double)) inc) 5)


i. (double double)
(lambda (x) (double (double x)))

ii. (double (lambda (x) (double (double x))))
(lambda (y) ((lambda (x) (double (double x))) ((lambda (z) (double (double z))) y)))

iii.
y = inc
((lambda (x) (double (double x))) ((lambda (z) (double (double z))) inc))
((lambda (x) (double (double x))) (double (double inc)))
((lambda (x) (double (double x))) (double +2))
((lambda (x) (double (double x))) +4)
(double (double +4))
(double +8)
+16

; +N - lambda that repeats `inc` N times, effectively adding N to it's argument.

Thus, the answer to the 1.41 is 5+16 = 21
|#


(provide double)