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
  mutable tx: float,
  mutable ty: float,
}

let w: walker = {
  x: baseWidth / 2.0,
  y: baseHeight / 2.0,
  tx: 0.0,
  ty: 10000.0,
}

let showWalker = () => {
  P5.scale(scaleFactor)
  P5.stroke(walkerColor)
  P5.point(w.x, w.y)
}

let updateWalker = () => {
  let stepX = P5.map(P5.noise(w.tx), 0.0, 1.0, -1.0, 1.0)
  let stepY = P5.map(P5.noise(w.ty), 0.0, 1.0, -1.0, 1.0)
  w.x = w.x + stepX
  w.y = w.y + stepY
  w.tx = w.tx + 0.01
  w.ty = w.ty + 0.01
  w.x = P5.constrain(w.x, 1.0, baseWidth - 1.0)
  w.y = P5.constrain(w.y, 1.0, baseHeight - 1.0)
}

let setup = () => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))
  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Exercise 0.7 Perlin Noise (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
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
