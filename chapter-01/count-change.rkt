#lang scheme

; initially the values of coins are 1, 5, 10, 25, and 50 

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= 0 amount) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+
                (cc amount (- kinds-of-coins 1))
                (cc (- amount (coin-value kinds-of-coins)) kinds-of-coins)))))

(define (coin-value coin)
  (cond ((= coin 1) 1)
        ((= coin 2) 5)
        ((= coin 3) 10)
        ((= coin 4) 25)
        ((= coin 5) 50)))

(provide count-change)

;; this is a tree-recursive process, which does a lot of unnecessary work.
;; though, it is not obvious how to construct the solution from the bottom
;; using no additional data structures (they are not available at this point yet.)