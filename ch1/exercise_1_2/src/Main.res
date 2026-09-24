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
  radius: float,
}

let ballInstance = ref(None)

let showTitle = () => {
  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.strokeWeight(0)
  P5.text("Exercise 1.2 (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let setup = () => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))
  showTitle()
  ballInstance := Some({
    position: P5.createVector(100.0, 100.0),
    velocity: P5.createVector(3.5, 3.0),
    radius: 24.0
  })
}

let draw = () => {
  P5.background(#Str(bgColor))
  switch ballInstance.contents {
  | Some(b) =>
      b.position->P5.add(b.velocity)

      if (b.position.x > screenWidth - b.radius || b.position.x < b.radius) {
        b.velocity.x = b.velocity.x * -1.0
      }
      if (b.position.y > screenHeight - b.radius || b.position.y < b.radius) {
        b.velocity.y = b.velocity.y * -1.0
      }
      P5.stroke(#Num(0.0))
      P5.fill(#Gray(127.0))
      P5.strokeWeight(2)
      P5.circle(b.position.x, b.position.y, b.radius * 2.0)
      showTitle()
  | None => JsError.throwWithMessage("invalid ball")
  }
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
