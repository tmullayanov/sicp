#lang scheme

#|
f(n) = n, if n < 3
f(n) = f(n-1) + f(n-2)+f(n-3) for all other n's.
|#

;; recursive
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (f-rec (- n 2))
                 (f-rec (- n 3))))))

#|
for iterative solution, let's use the following rule:
a, b, c = 1, 2, 3
counter = 1
on each step until we get n-th, we update the numbers as following
a, b, c = b, c, b+c+a
counter = counter + 1

`a` will be our answer once the counter reaches `n`

|#

(define (f-iter n)
  (define (f-inner a b c counter)
    (if (= counter n)
        a
        (f-inner b c (+ a b c) (+ 1 counter))))
  (f-inner 1 2 3 1))


(define (test-eq-upto n)
  (cond ((= n 0) #t)
        (else (if (= (f-rec n) (f-iter n))
                  (test-eq-upto (- n 1))
                  (list #f n)))))