#lang scheme

#|
Pascal's triangle
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
|#

;; the best way to do this is to "rotate" the triangle and have two indices

#|


4|1 4 10 20
3|1 3 6 10
2|1 2 3 4
1|1 1 1 1
x 1 2 3 4

|#

(define (pascal x y)
  (cond ((or (= x 1) (= y 1)) 1)
        (else (+ (pascal (- x 1) y)
                 (pascal x (- y 1))))))