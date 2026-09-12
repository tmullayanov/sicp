#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|
Substitution model isn't limited to values, it actually works with every kind of symbol
(at this point SICP doesn't really introduce symbols as a concept, though).

So the rules of evaluation stay the same: if we meet s-expr, we must first evaluate it
until it resolves to a 'value'.

(a-plus-abs-b 5 10)
=>
((if (> 10 0) + -) 5 10)
(+ 5 10)
15
|#