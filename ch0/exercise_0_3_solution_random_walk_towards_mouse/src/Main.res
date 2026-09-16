let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let walkerColor = "#ff0044"

type walker = {
  mutable x: float,
  mutable y: float,
}

let w: walker = {
  x: baseWidth / 2.0,
  y: baseHeight / 2.0,
}

let showWalker = () => {
  P5.scale(scaleFactor)
  P5.stroke(walkerColor)
  P5.point(w.x, w.y)
}

let updateWalker = () => {
  let r = P5.random(#Num(1))
  if (r < 0.5) {
    // We need to adjust by the scale factor because we scaled everything
    // up to get our pixelated view but mouseX/Y is in raw "screen" pixel size
    if (P5.mouseX / scaleFactor > w.x) {
      w.x = w.x + 1.0
    } else {
      w.x = w.x - 1.0
    }

    if (P5.mouseY / scaleFactor > w.y) {
      w.y = w.y + 1.0
    } else {
      w.y = w.y - 1.0
    }
  } else {
    w.x = w.x + P5.random(#Range(-1, 1))
    w.y = w.y + P5.random(#Range(-1, 1))
  }
  w.x = P5.constrain(w.x, 0.0, baseWidth - 1.0)
  w.y = P5.constrain(w.y, 0.0, baseHeight- 1.0)
}

let setup = () => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))
  P5.fill(textColor)
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Traditional Random Walker (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let draw = () => {
  showWalker()
  updateWalker()
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
