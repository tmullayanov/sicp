#lang scheme

(require "./prime.rkt")

(define (runtime)
  (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
  (when (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (cond ((>= start end) #f)
        ((even? start)
         (search-for-primes (+ start 1) end))
        (else
          (timed-prime-test start)
          (search-for-primes (+ start 2) end))))



(define (apply-with-time fn arg)
  (let* ((start (runtime))
        (result (fn arg))
        (end (runtime)))
    (if result
        (- end start)
        #f)))

(define (find-three-primes-with-times start end)
  (define (f a b times)
    (define (analyze n)
      (define (mark-and-go-forward x time)
        (display n)
        (display ": ")
        (display time)
        (newline)
        (f (+ n 2) end (- times 1)))
      (let ((est-time (apply-with-time prime? n)))
        (if est-time
            (mark-and-go-forward n est-time)
            (f (+ n 1) end times))))
    (cond ((>= a b) #f)
          ((= 0 times) #f)
          ((and (even? a) (not (= a 2))) (f (+ a 1) b times))
          (else (analyze a))))
  (f start end 3))