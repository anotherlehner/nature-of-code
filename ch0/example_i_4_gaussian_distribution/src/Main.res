let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#fff"
let textColor = "#000"

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(screenWidth, screenHeight)
    P5.background(#Str(bgColor))
    P5.fill(#CSSColor(textColor))
    P5.textFont("monospace")
    P5.textSize(scaleFactor * 4.0)
    P5.text("Example 0.4 (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
  })

  Browser.window->P5.setDraw(() => {
    let x = P5.randomGaussian(320.0, 60.0)
    P5.noStroke()
    P5.fill(#Range(0.0, 10.0))
    P5.circle(x, 120.0, 16.0 * scaleFactor)
  })

  P5.initP5Global()
}

main()