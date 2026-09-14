#lang scheme

; one
(define (+ a b)
    (if (zero? a)
        b
        (inc (+ (dec a) b))))

; two
(define (+ a b)
    (if (zero? a)
        b
        (+ (dec a) (inc b))))


;; using substitue model for eval. (+ 4 5)

;;; one

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

; obviously, this is a recursive process since we have a chain of deferred operations
; that the interpreter has to remember.

;;; two

(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9

