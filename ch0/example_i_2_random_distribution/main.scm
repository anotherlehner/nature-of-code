; reference: 

(define base-width 160)
(define base-height 120)
(define scale-factor 6)
(define screen-width (* base-width scale-factor))
(define screen-height (* base-height scale-factor))

(define (setup p)
  (p.createCanvas screen-width screen-height)
  (p.background "#1a1c2c")
  (p.fill "#f4f4f4")
  (p.textFont "monospace")
  (p.textSize (* 8 scale-factor))
  (p.text
    "Todo (LIPS Scheme + p5.js)"
    (* 5 scale-factor)
    (* 12 scale-factor)))

(define (draw p)
  (p.push)
  (p.scale scale-factor)
  (p.stroke "#ff0044")
  (p.pop))

(new p5
  (lambda (p)
    (set! p.setup (lambda () (setup p)))
    (set! p.draw (lambda () (draw p)))))
