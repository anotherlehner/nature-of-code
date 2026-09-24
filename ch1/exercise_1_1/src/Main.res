let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#f4f4f4"
let textColor = "#1a1c2c"
let fgColor = "#ff0044"

type ball = {
  position: P5.vector,
  velocity: P5.vector,
}

let ballInstance = ref(None)

let setup = () => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))
  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Exercise 0.7 Perlin Noise (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)

  ballInstance := Some({
    position: P5.createVector(100, 100),
    velocity: P5.createVector(2.5, 2.0)
  })
}

let draw = () => {
  switch ballInstance.contents {
  | Some(b) =>
      if (b.position.x > screenWidth || b.position.x < 0) {
        b.velocity.x = b.velocity.x * -1.0
      }
      if (b.position.y > screenHeight || b.position.y < 0) {
        b.velocity.y = velocity.y * -1.0
      }
      P5.stroke(#Num(0.0))
      P5.fill(#Gray(127))
      P5.strokeWeight(2.0)
      P5.circle(position.x, position.y, 48)
  | None => JsError.throwWithMessage("invalid walker")
  }
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
