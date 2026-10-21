#lang scheme

(define (cont-frac n d k)
  (define (inner i)
    (if (>= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (inner (+ i 1))))))
  (inner 1))

(define (cont-frac-iter n d k)
  (define (inner i acc)
    (cond ((<= i 0) acc)
          ((= i k) (inner (- i 1) (/ (n k) (d k))))
          (else (inner (- i 1)
                       (/ (n i)
                          (+ (d i) acc))))))
  (inner k 0))

(define (reverse-golden-ratio k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))


(define (reverse-golden-ratio-2 k)
  (cont-frac-iter (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k))