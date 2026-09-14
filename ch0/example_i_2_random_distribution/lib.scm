; Library functions

(define (range start end)
    (unfold
        (lambda (x)
            (if (>= x end)
                false
                (cons x (+ x 1))))
        start))
                
