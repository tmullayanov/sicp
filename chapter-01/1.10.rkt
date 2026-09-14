#lang scheme

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


; evaluations

(A 1 2)
(A 0 (A 1 1))
(A 0 2)
(* 2 2)
4

(A 1 3)
(A 0 (A 1 2))
(A 0 4)
(* 2 4)
8

(A 1 10) ;1024
; (A 0 (A 1 9)) -> (A 0 (A 0 (A 1 8))) -> ... -> (A 0 (... (A 0 (A 1 1)))) -> (A 0 (... (A 0 2)))
; -> (A 0 (... (* 2 2))) -> (* 2 (* 2 (...))) 10 times in total.

;
(A 2 4) ; 65536 == 2^16
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2))) ; we might use the fact that (A 1 y) is 2^y but let's substitue it one time to see it.
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 (* 2 2)))
(A 1 (A 1 4))
(A 1 16)
65536

;
(A 3 3) ; interpreter says it's also 2^16 = 65536. Let's unwind this...
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2)) ; (A 2 2) evaluated to 4
(A 2 4) ; 65536 following above example.

;

(A 2 2)
(A 1 (A 2 1))
(A 1 2)
(A 0 (A 1 1))
(A 0 2)
4

;

(A 2 3)
(A 1 (A 2 2))
(A 1 (A 1 (A 2 1)))
(A 1 (A 1 2))
(A 1 (A 0 (A 1 1)))
(A 1 (A 0 2))
(A 1 4)
16

;; it seems that (A 2 n) tells us that (A 1 X) will be applied (n -1) times to 2.
;; and we know that (A 1 n) is (expt 2 n).
;; so it will be chain of (expt 2 (expt 2... (expt 2 2))).

;;;;;

(define (f n) (A 0 n)) ; double: 2*n
(define (g n) (A 1 n)) ; expt with base of 2: 2^n
(define (h n) (A 2 n)) ; nested expt: (expt 2 (expt 2 ... (expt 2 2))) - `expt` gets applied (n-1) times.
