#lang scheme


(require "./prime.rkt")

;; implement a function that checks whether a number $n$
;; passes fermat-test for all $a < n$.

(define (passes-exhausitve-fermat-test n)
  (define (iter x)
    (cond ((> x n) #t)
          ((= (expmod x n n) x) (iter (+ x 1)))
          (else (iter (+ x 1)))))
  (iter 2))


(define carmichaels (list 561 1105 1729 2465 2821 6601))

(define (run)
  (map passes-exhausitve-fermat-test carmichaels))

#|
"chapter-01\\1.27.rkt"> (run)                                                                                                                                            
'(#t #t #t #t #t #t)
|#