; https://github.com/nature-of-code/noc-book-2/blob/main/content/examples/00_randomness/example_i_1_random_walk_traditional/sketch.js

(define base-width 160)
(define base-height 120)
(define scale-factor 6)
(define screen-width (* base-width scale-factor))
(define screen-height (* base-height scale-factor))
(define walker-x (/ base-width 2))
(define walker-y (/ base-height 2))
(define randomDirections #(-1 0 1))

(define (setup p)
  (p.createCanvas screen-width screen-height)
  (p.background "#1a1c2c")
  (p.fill "#f4f4f4")
  (p.textFont "monospace")
  (p.textSize (* 4 scale-factor))
  (p.text 
    "Random Walker (LIPS Scheme + p5.js) " 
    (* 2 scale-factor) 
    (* 6 scale-factor)))

(define (step-walker p)
  (set! walker-x (+ walker-x (p.random randomDirections)))
  (set! walker-y (+ walker-y (p.random randomDirections))))

(define (draw p)
  (step-walker p)
  (p.push)
  (p.scale scale-factor)
  (p.stroke "#ff0044")
  (p.point walker-x walker-y)
  (p.pop))

(new p5
  (lambda (p)
    (set! p.setup (lambda () (setup p)))
    (set! p.draw (lambda () (draw p)))))
