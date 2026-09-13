#lang scheme

(require "root.rkt")
#|
Implications of the new-if via `cond` operator.
|#

(define (new-if pred then-clause else-clause)
  (cond (pred then-clause)
        (else else-clause)))


#|
The problem with this new-if is that it will use applicative-order eval.
Which will force to evalute everything even when there was no need to.

And sometimes, like in the example from the workbook, it will lead to stuck in a loop situation.
|#

;; this will hang!!!
(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                         x)))
