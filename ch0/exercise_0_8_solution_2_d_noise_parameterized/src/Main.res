let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let walkerColor = "#ff0044"

let setup = () => {
  P5.createCanvas(screenWidth, screenHeight)
  P5.background(#Str(bgColor))

  P5.loadPixels()

  P5.noiseDetail(6.0, 0.5)

  let ioff = ref(0.0)
  let joff = ref(0.0)

  for i in 0 to Float.toInt(screenWidth) {
    joff := 0.0

    for j in 0 to Float.toInt(screenHeight) {
      let n = P5.noise2d(ioff.contents, joff.contents)
      let v = P5.floor(P5.map(n, 0.0, 1.0, 0.0, 255.0))
      P5.set(Int.toFloat(i), Int.toFloat(j), v)
      joff := joff.contents + 0.005
    }
    ioff := ioff.contents + 0.005
  }

  P5.updatePixels()

  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text(
    "Exercise 0.8 Perlin Noise Exploration (ReScript + p5.js)",
    2.0 * scaleFactor,
    6.0 * scaleFactor,
  )
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  P5.initP5Global()
}

main()
