#lang scheme

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> test-divisor n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (prime? n)
  (= n (smallest-divisor n)))

;;

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp
                (remainder (square (expmod base (/ exp 2) m))
                           m)))
        (else (remainder (* base (expmod base (- exp 1) m))))))

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
;; probabilistic algorithm. Also, can be tricked with Carmichael numbers.



(provide prime? fast-prime?)

#|
"chapter-01\\prime.rkt"> (smallest-divisor 199)                                                                      
199
"chapter-01\\prime.rkt"> (smallest-divisor 1999)                                                                     
1999
"chapter-01\\prime.rkt"> (smallest-divisor 19999)                                                                    
7                           
|#