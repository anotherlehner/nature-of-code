let baseWidth = 160
let baseHeight = 120
let scaleFactor = 6
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(Int.toFloat(screenWidth), Int.toFloat(screenHeight))
    P5.background(#Str(bgColor))
    P5.fill(textColor)
    P5.textFont("monospace")
    P5.textSize(scaleFactor * 4)
    P5.text("Todo (ReScript + p5.js)", 2 * scaleFactor, 6 * scaleFactor)
  })

  // Browser.window->P5.setDraw(() => {
  // })

  P5.initP5Global()
}

main()