; https://github.com/nature-of-code/noc-book-2/tree/main/content/examples/00_randomness/example_i_2_random_distribution
(load "./lib.scm")

(define base-width 160)
(define base-height 120)
(define scale-factor 6)
(define screen-width (* base-width scale-factor))
(define screen-height (* base-height scale-factor))

(define total 20)
(define randomCounts (make-vector total 0))

(define (show-title p)
  (p.fill "#f4f4f4")
  (p.strokeWeight 0)
  (p.textFont "monospace")
  (p.textSize (* 4 scale-factor))
  (p.text
    "Uniform Distribution (LIPS Scheme + p5.js) "
    (* 2 scale-factor)
    (* 6 scale-factor)))

; update the count in one of the 20 random buckets
(define (update-counts p)
  (let* ((counts-length (vector-length randomCounts))
      (index (p.floor (p.random counts-length)))
      (value (+ 1 (vector-ref randomCounts index))))
    (vector-set! randomCounts index value)))

; show a rectrangle for each bucket
(define (show-rectangles p)
  (let* ((counts-length (vector-length randomCounts))
      (w (/ screen-width counts-length)))
    (for-each
      (lambda (x) (p.rect
          (* x w)
          (- screen-height (vector-ref randomCounts x))
          (- w 1)
          (vector-ref randomCounts x)))
      (range 0 total))))

(define (setup p)
  (p.createCanvas screen-width screen-height)
  (p.background 0)
  (show-title p)
  (vector-set! randomCounts 5 10))

(define (draw p)
  (p.background 0)
  (p.stroke 255)
  (p.strokeWeight 2)
  (p.fill 127)
  (update-counts p)
  (show-rectangles p)
  (show-title p))

(new p5
  (lambda (p)
    (set! p.setup (lambda () (setup p)))
    (set! p.draw (lambda () (draw p)))))
