let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let walkerColor = "#ff0044"

type walker = {
  position: P5.vector,
  flux: P5.vector,
}

let walkerInstance = ref(None)

let showWalker = w => {
  P5.scale(scaleFactor)
  P5.stroke(#Str(walkerColor))
  P5.point(w.position.x, w.position.y)
}

let updateWalker = w => {
  let stepX = P5.map(P5.noise(#OneD(w.flux.x)), 0.0, 1.0, -1.0, 1.0)
  let stepY = P5.map(P5.noise(#OneD(w.flux.y)), 0.0, 1.0, -1.0, 1.0)
  w.position.x = w.position.x + stepX
  w.position.y = w.position.y + stepY
  w.flux.x = w.flux.x + 0.01
  w.flux.y = w.flux.y + 0.01
  w.position.x = P5.constrain(w.position.x, 1.0, baseWidth - 1.0)
  w.position.y = P5.constrain(w.position.y, 1.0, baseHeight - 1.0)
}

let setup = () => {
  walkerInstance :=
    Some({
      position: P5.createVector(baseWidth / 2.0, baseHeight / 2.0),
      flux: P5.createVector(0.0, 10000.0),
    })
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))
  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Exercise 0.7 Perlin Noise (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let draw = () => {
  switch walkerInstance.contents {
  | Some(w) =>
      showWalker(w)
      updateWalker(w)
  | None => JsError.throwWithMessage("invalid walker")
  }
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
